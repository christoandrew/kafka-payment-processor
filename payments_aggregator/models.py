from typing import Union
from pydantic import BaseModel

class Payment(BaseModel):
    account_id: float
    amount: float
    currency: str
    event_id: Union[str, None] = None

