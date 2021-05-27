# Payments Exercise

Add in the ability to create payments for a given loan using a JSON API call. You should store the payment date and amount. Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`. The outstanding balance should be calculated as the `amount` minus all of the payment amounts.

A payment should not be able to be created that exceeds the outstanding balance of a loan. You should return validation errors if a payment can not be created. Expose endpoints for seeing all payments for a given loan as well as seeing an individual payment.

## Submission Notes

* Mimemagic 0.3.5 has been yanked, so I upgraded it to 0.3.10
* I wouldn't recommend creating a JSON API without versioning it immediately
* There is only one account to manage
* I've found that STI is a perfect match for transactions do skip joins and math across those joins.
  This often comes into play when it comes to reporting.
* Decimals are much harder to work with. I would suggest using either an integer
  and move to `amount_cents`
  
## Smoke Test Examples

NOTE: Make sure that your db is seeded and your server is running

Show loan `curl --location --request GET 'http://localhost:3000/loans/1'`
Index loans `curl --location --request GET 'http://localhost:3000/loans'`

Index payments for loan `curl --location --request GET 'http://localhost:3000/loans/1/payments'`
Create payment for loan `curl --location --request POST 'http://localhost:3000/loans/1/payments?amount=0.01&transacted_on=2012-01-01'`
Show payment `curl --location --request GET 'http://localhost:3000/payments/3'`