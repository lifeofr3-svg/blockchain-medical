# FREE Deployment Guide - Blockchain Medical App

## Step-by-Step FREE Deployment on Render.com

### Prerequisites (All FREE)
1. GitHub account
2. Render.com account
3. Alchemy account (for blockchain RPC)
4. MetaMask wallet (for Ethereum testnet)

---

## STEP 1: Setup Blockchain (FREE Ethereum Testnet)

### 1.1 Get Free Sepolia ETH
1. Install MetaMask browser extension
2. Create a wallet (save your seed phrase!)
3. Switch network to "Sepolia Test Network"
4. Get free test ETH from faucets:
   - https://sepoliafaucet.com/
   - https://www.alchemy.com/faucets/ethereum-sepolia
   - https://faucet.quicknode.com/ethereum/sepolia

### 1.2 Get Free Alchemy RPC URL
1. Go to https://www.alchemy.com/ (Sign up FREE)
2. Click "Create App"
   - Name: "Blockchain Medical"
   - Network: "Ethereum"
   - Chain: "Sepolia"
3. Click on your app → "API Key" → "View Key"
4. Copy the HTTPS URL (looks like: `https://eth-sepolia.g.alchemy.com/v2/YOUR_API_KEY`)

### 1.3 Get Your Wallet Credentials
1. In MetaMask, click account icon → "Account details" → Copy "Account Address"
2. Click 3 dots → "Account Details" → "Show Private Key" → Enter password → Copy
   - ⚠️ **NEVER share your real private key! Only use testnet wallets**

---

## STEP 2: Prepare Your Code for Deployment

### 2.1 Initialize Git Repository
```bash
cd Blockchain_Medical
git init
git add .
git commit -m "Initial commit"
```

### 2.2 Create GitHub Repository
1. Go to https://github.com/new
2. Create a new repository (name it "blockchain-medical")
3. Push your code:
```bash
git remote add origin https://github.com/YOUR_USERNAME/blockchain-medical.git
git branch -M main
git push -u origin main
```

---

## STEP 3: Deploy to Render (100% FREE)

### 3.1 Create Render Account
1. Go to https://render.com/ → "Get Started for Free"
2. Sign up with your GitHub account

### 3.2 Create Web Service
1. Click "New +" → "Web Service"
2. Connect your GitHub repository "blockchain-medical"
3. Configure the service:
   - **Name**: `blockchain-medical-app`
   - **Environment**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn app:app --bind 0.0.0.0:$PORT --timeout 120 --workers 2`
   - **Plan**: Select **"Free"** (⚠️ Important!)

### 3.3 Add Environment Variables
In the "Environment" section, add these variables:

| Key | Value | Where to Get |
|-----|-------|--------------|
| `BLOCKCHAIN_RPC_URL` | Your Alchemy URL | From Step 1.2 |
| `ACCOUNT_ADDRESS` | Your wallet address | From Step 1.3 |
| `PRIVATE_KEY` | Your private key (NO 0x prefix) | From Step 1.3 |
| `SECRET_KEY` | Click "Generate" | Auto-generated |
| `FLASK_ENV` | `production` | Type manually |

### 3.4 Deploy
1. Click "Create Web Service"
2. Wait 5-10 minutes for deployment (it's installing ML models)
3. Your app will be live at: `https://blockchain-medical-app.onrender.com`

---

## STEP 4: Deploy Smart Contract

### 4.1 One-Time Setup (After First Deploy)
1. Open your deployed app URL
2. Check the logs in Render dashboard
3. The contract will auto-deploy on first run
4. Copy the contract address from logs: `Contract deployed at: 0x...`

### 4.2 Save Contract Address (Optional but Recommended)
1. In Render, go to "Environment" tab
2. Add new variable:
   - **Key**: `CONTRACT_ADDRESS`
   - **Value**: `0xYourContractAddress` (from logs)
3. This prevents redeploying on every restart

---

## STEP 5: Test Your Deployment

1. Visit your app: `https://your-app-name.onrender.com`
2. Sign up for an account
3. Try a prediction (diabetes or heart disease)
4. Check blockchain transaction on Sepolia Etherscan:
   - https://sepolia.etherscan.io/

---

## Important Notes

### Free Tier Limitations
- **Render Free Tier**:
  - Service spins down after 15 min of inactivity
  - First request after sleep takes 30-50 seconds to wake up
  - 750 hours/month (enough for one app)

- **Alchemy Free Tier**:
  - 300M compute units/month
  - More than enough for testing

### Cost to Upgrade (If Needed Later)
- Render Starter: $7/month (no sleep, better performance)
- Alchemy Growth: Free up to limits, then pay-as-you-go

---

## Troubleshooting

### "Module not found" errors
- Check that all dependencies are in `requirements.txt`
- Rebuild the service in Render

### "Connection refused" or blockchain errors
- Verify BLOCKCHAIN_RPC_URL is correct
- Ensure you have Sepolia ETH in your wallet
- Check Alchemy dashboard for API usage

### "Internal Server Error"
- Check Render logs for detailed error messages
- Ensure all environment variables are set correctly
- Verify SECRET_KEY is generated

### Models not loading
- Models are in the repo (140MB)
- First deployment takes 5-10 minutes to download dependencies
- Check build logs for tensorflow/pytorch installation

---

## Alternative FREE Options

If Render doesn't work for you:

### Option 2: Railway.app
- Sign up at https://railway.app/
- $5 free credit monthly
- Similar deployment process
- More generous free tier

### Option 3: Fly.io
- Sign up at https://fly.io/
- Free tier: 3 shared VMs
- More technical setup required

---

## Security Reminders

✅ **DO**:
- Use Sepolia testnet for free testing
- Keep private keys in environment variables only
- Use different wallets for testnet and mainnet

❌ **DON'T**:
- Commit `.env` file to Git
- Share your private keys
- Use mainnet Ethereum (costs real money)
- Deploy with DEBUG=True in production

---

## Questions?

Your app should now be live and FREE! 🎉

**Your deployment URL**: `https://your-app-name.onrender.com`
**Blockchain explorer**: `https://sepolia.etherscan.io/`

Enjoy your free blockchain medical prediction app!
