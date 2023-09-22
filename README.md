# NFTGame
Design of a mini-game using NFTs. These NFTs each represent a cryptocurrency.
Design of a mini NFT Game. Each of these NFTs will have one variable called “Health”.
The health of each NFT will increase or decrease directly with the “% growth” of the
respective coin’s price compared to INR using Coingecko’s APIs to simulate the prices
of the coins.
Refer: https://www.coingecko.com/en/api/documentation
Health = % Growth x 100. 
Values are preset during token creation
When creating an NFT for the first time, It's health is initialized by calling coin gecko api to get the price of that coin with respect to INR.

