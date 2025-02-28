import requests


class ProcessAnswers:
    def __init__(self, api_key, end_point, context):
        self.api_key = api_key
        self.end_point = end_point
        self.context = context

    def get_headers(self):
        if self.api_key.startswith("sk-proj"):
            return {
                "Content-Type": "application/json",
                "Authorization": f"Bearer {self.api_key}",
            }
        else:
            return {
                "Content-Type": "application/json",
                "api-key": self.api_key,
            }

    def get_payload(self, context, texto, base64):
        if base64:
            return {
                "model": "gpt-4o",
                "messages": [
                    {
                        "role": "system",
                        "content": f"{context}. Retorne a descrição em PT-BR. Evite adição de informações de logo e afins, se atente aos detalhes da imagem",
                    },
                    {
                        "role": "user",
                        "content": [
                            {"type": "text", "text": f"{texto}"},
                            {
                                "type": "image_url",
                                "image_url": {
                                    "url": f"data:image/jpeg;base64,{base64}",
                                    "detail": "low",
                                },
                            },
                        ],
                    },
                ],
                "max_tokens": 300,
            }
        else:
            return {
                "model": "gpt-4o",
                # "model": "gpt-4o-mini", Testar com o da Maximiza
                "messages": [
                    {
                        "role": "system",
                        "content": f"""
                        {context}
                     """,
                    },
                    {
                        "role": "user",
                        "content": f"""
                        {texto}
                    """,
                    },
                ],
                "temperature": 0.0,  # valores proximos de 0 indicam respostas mais deterministicas
            }

    def get_answers(self, context, texto, base64):
        headers = self.get_headers()

        payload = self.get_payload(context, texto, base64)
        response = requests.post(self.end_point, headers=headers, json=payload)
        resposta = response.json()
        try:
            return resposta["choices"][0]["message"]["content"]
        except Exception as e:
            print(resposta, e)
