Return-Path: <linux-renesas-soc+bounces-4579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B918A491A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Apr 2024 09:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09ACA280D6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Apr 2024 07:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454D923754;
	Mon, 15 Apr 2024 07:34:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7739F241E1;
	Mon, 15 Apr 2024 07:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713166458; cv=none; b=BvdCmDlnR3H+VS2lky6iXYCi7E6MArCXroaIPPREna/6mot6cbF18Qp5HvfQU9rBFanAg1vKH2Fa69zSsMecLTsD4y5G+NyhLVgLXBVLeqEJjTcxwX8gQCszB7NmXHbELkhXxUAJpCrsy7nyrW16QPuwFQfvJKW15cRxqmUhLEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713166458; c=relaxed/simple;
	bh=oIv5XkEwQUH7RKJjXxoIWpGmICU21scDRL/sgb4tTNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FogeXh6gXVymM/6I+igCZOHTaQm3F4DY6hlR8uc49ByIM8uQiP+SkWA++aOq1vx7ZYegB2jUh80KQ66BE7NfMmLWYI4Nu0Buecy9u/fu0Tu5+eocuVQ5bHcY755/DeAVhB7xmsq5Idajlk8priyOMGt+2sc1ix4iigPQKWrKS7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,202,1708354800"; 
   d="asc'?scan'208";a="201463128"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Apr 2024 16:34:14 +0900
Received: from [10.226.93.74] (unknown [10.226.93.74])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6EDB8416B56F;
	Mon, 15 Apr 2024 16:34:11 +0900 (JST)
Message-ID: <98ae4f14-397b-49b7-a0a9-cb316f2594f6@bp.renesas.com>
Date: Mon, 15 Apr 2024 08:34:09 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Content-Language: en-GB
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EXzZ0U87jzFgcMpqjReXpKra"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EXzZ0U87jzFgcMpqjReXpKra
Content-Type: multipart/mixed; boundary="------------0W3gefA1t5vPtBTa1W6ijMPB";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <98ae4f14-397b-49b7-a0a9-cb316f2594f6@bp.renesas.com>
Subject: Re: [net-next] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
References: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240414135937.1139611-1-niklas.soderlund+renesas@ragnatech.se>

--------------0W3gefA1t5vPtBTa1W6ijMPB
Content-Type: multipart/mixed; boundary="------------fauPFJcSdJBNtE4ei89h0siq"

--------------fauPFJcSdJBNtE4ei89h0siq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14/04/2024 14:59, Niklas S=C3=B6derlund wrote:
> Add initial support for Renesas Ethernet-TSN End-station device of R-Ca=
r
> V4H. The Ethernet End-station can connect to an Ethernet network using =
a
> 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
> Depending on the connected PHY.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> ---
> * Changes since RFC
> - Fix issues in MDIO communication.
> - Use a dedicated OF node for the MDIO bus.
> ---
>  MAINTAINERS                           |    8 +
>  drivers/net/ethernet/renesas/Kconfig  |   11 +
>  drivers/net/ethernet/renesas/Makefile |    2 +
>  drivers/net/ethernet/renesas/rtsn.c   | 1421 +++++++++++++++++++++++++=

>  drivers/net/ethernet/renesas/rtsn.h   |  464 ++++++++
>  5 files changed, 1906 insertions(+)
>  create mode 100644 drivers/net/ethernet/renesas/rtsn.c
>  create mode 100644 drivers/net/ethernet/renesas/rtsn.h

<snip>

> diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet=
/renesas/rtsn.c
> new file mode 100644
> index 000000000000..291ab421d68f
> --- /dev/null
> +++ b/drivers/net/ethernet/renesas/rtsn.c

<snip>

> +static bool rtsn_rx(struct net_device *ndev, int *quota)
> +{
> +	struct rtsn_ext_ts_desc *desc;
> +	struct rtsn_private *priv;
> +	struct sk_buff *skb;
> +	dma_addr_t dma_addr;
> +	int boguscnt;

I find the variable name `boguscnt` very unclear, I'm not sure if it
means the count is bogus, or it is counting bogus items?

I don't think you need to match what I've done in ravb_main.c exactly,
but I'd prefer to see a better variable name here.

> +	u16 pkt_len;
> +	u32 get_ts;
> +	int entry;
> +	int limit;
> +
> +	priv =3D netdev_priv(ndev);
> +
> +	entry =3D priv->cur_rx % priv->num_rx_ring;
> +	desc =3D &priv->rx_ring[entry];
> +
> +	boguscnt =3D priv->dirty_rx + priv->num_rx_ring - priv->cur_rx;
> +	boguscnt =3D min(boguscnt, *quota);
> +	limit =3D boguscnt;
> +
> +	while ((desc->die_dt & DT_MASK) !=3D DT_FEMPTY) {
> +		dma_rmb();
> +		pkt_len =3D le16_to_cpu(desc->info_ds) & RX_DS;
> +		if (--boguscnt < 0)
> +			break;
> +
> +		skb =3D priv->rx_skb[entry];
> +		priv->rx_skb[entry] =3D NULL;
> +		dma_addr =3D le32_to_cpu(desc->dptr);
> +		dma_unmap_single(ndev->dev.parent, dma_addr, PKT_BUF_SZ,
> +				 DMA_FROM_DEVICE);
> +
> +		get_ts =3D priv->ptp_priv->tstamp_rx_ctrl &
> +			RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
> +		if (get_ts) {
> +			struct skb_shared_hwtstamps *shhwtstamps;
> +			struct timespec64 ts;
> +
> +			shhwtstamps =3D skb_hwtstamps(skb);
> +			memset(shhwtstamps, 0, sizeof(*shhwtstamps));
> +
> +			ts.tv_sec =3D (u64)le32_to_cpu(desc->ts_sec);
> +			ts.tv_nsec =3D le32_to_cpu(desc->ts_nsec & cpu_to_le32(0x3fffffff))=
;
> +
> +			shhwtstamps->hwtstamp =3D timespec64_to_ktime(ts);
> +		}
> +
> +		skb_put(skb, pkt_len);
> +		skb->protocol =3D eth_type_trans(skb, ndev);
> +		netif_receive_skb(skb);
> +		ndev->stats.rx_packets++;
> +		ndev->stats.rx_bytes +=3D pkt_len;
> +
> +		entry =3D (++priv->cur_rx) % priv->num_rx_ring;
> +		desc =3D &priv->rx_ring[entry];
> +	}
> +
> +	/* Refill the RX ring buffers */
> +	for (; priv->cur_rx - priv->dirty_rx > 0; priv->dirty_rx++) {
> +		entry =3D priv->dirty_rx % priv->num_rx_ring;
> +		desc =3D &priv->rx_ring[entry];
> +		desc->info_ds =3D cpu_to_le16(PKT_BUF_SZ);
> +
> +		if (!priv->rx_skb[entry]) {
> +			skb =3D netdev_alloc_skb(ndev,
> +					       PKT_BUF_SZ + RTSN_ALIGN - 1);

I'll send my work using a page pool today as an RFC so you can see if it
would be beneficial to use that here as well. I was going to hold off
until the bugfix patches have merged so that I don't need to go through
another RFC round, but it will be good to get some more review on the
series anyway.

> +			if (!skb)
> +				break;
> +			skb_reserve(skb, NET_IP_ALIGN);
> +			dma_addr =3D dma_map_single(ndev->dev.parent, skb->data,
> +						  le16_to_cpu(desc->info_ds),
> +						  DMA_FROM_DEVICE);
> +			if (dma_mapping_error(ndev->dev.parent, dma_addr))
> +				desc->info_ds =3D cpu_to_le16(0);
> +			desc->dptr =3D cpu_to_le32(dma_addr);
> +			skb_checksum_none_assert(skb);
> +			priv->rx_skb[entry] =3D skb;
> +		}
> +		dma_wmb();
> +		desc->die_dt =3D DT_FEMPTY | D_DIE;
> +	}
> +
> +	desc =3D &priv->rx_ring[priv->num_rx_ring];
> +	desc->die_dt =3D DT_LINK;
> +
> +	*quota -=3D limit - (++boguscnt);
> +
> +	return boguscnt <=3D 0;
> +}
> +
> +static int rtsn_poll(struct napi_struct *napi, int budget)
> +{
> +	struct rtsn_private *priv;
> +	struct net_device *ndev;
> +	unsigned long flags;
> +	int quota =3D budget;
> +
> +	ndev =3D napi->dev;
> +	priv =3D netdev_priv(ndev);
> +
> +	/* Processing RX Descriptor Ring */
> +	if (rtsn_rx(ndev, &quota))
> +		goto out;
> +
> +	/* Processing TX Descriptor Ring */
> +	spin_lock_irqsave(&priv->lock, flags);
> +	rtsn_tx_free(ndev, true);
> +	netif_wake_subqueue(ndev, 0);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	napi_complete(napi);

We should use napi_complete_done() here as described in
Documentation/networking/napi.rst. That will require rtsn_rx() to return
the number of packets received so that it can be passed as the work_done
argument to napi_complete_done().

> +
> +	/* Re-enable TX/RX interrupts */
> +	spin_lock_irqsave(&priv->lock, flags);
> +	rtsn_ctrl_data_irq(priv, true);
> +	__iowmb();
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +out:
> +	return budget - quota;
> +}

<snip>

> +static int rtsn_probe(struct platform_device *pdev)
> +{
> +	struct rtsn_private *priv;
> +	struct net_device *ndev;
> +	struct resource *res;
> +	int ret;
> +
> +	ndev =3D alloc_etherdev_mqs(sizeof(struct rtsn_private), TX_NUM_CHAIN=
S,
> +				  RX_NUM_CHAINS);
> +	if (!ndev)
> +		return -ENOMEM;
> +
> +	priv =3D netdev_priv(ndev);
> +	priv->pdev =3D pdev;
> +	priv->ndev =3D ndev;
> +	priv->ptp_priv =3D rcar_gen4_ptp_alloc(pdev);
> +
> +	spin_lock_init(&priv->lock);
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(priv->clk)) {
> +		ret =3D -PTR_ERR(priv->clk);
> +		goto error_alloc;
> +	}
> +
> +	priv->reset =3D devm_reset_control_get(&pdev->dev, NULL);
> +	if (IS_ERR(priv->reset)) {
> +		ret =3D -PTR_ERR(priv->reset);
> +		goto error_alloc;
> +	}
> +
> +	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "tsnes");
> +	if (!res) {
> +		dev_err(&pdev->dev, "Can't find tsnes resource\n");
> +		ret =3D -EINVAL;
> +		goto error_alloc;
> +	}
> +
> +	priv->base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(priv->base)) {
> +		ret =3D PTR_ERR(priv->base);
> +		goto error_alloc;
> +	}
> +
> +	SET_NETDEV_DEV(ndev, &pdev->dev);
> +	ether_setup(ndev);
> +
> +	ndev->features =3D NETIF_F_RXCSUM;
> +	ndev->hw_features =3D NETIF_F_RXCSUM;

A quick skim of the datasheet suggests that TX checksum calculation is
also supported. It's probably worth listing which hardware features this
driver supports/does not support in the commit message.

Thanks,

--=20
Paul Barker
--------------fauPFJcSdJBNtE4ei89h0siq
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBGS4BNsBEADEc28TO+aryCgRIuhxWAviuJl+f2TcZ1JeeaMzRLgSXKuXzkiI
g6JIVfNvThjwJaBmb7+/5+D7kDLJuutu9MFfOzTS0QOQWppwIPgbfktvMvwwsq3m
7e9Qb+S1LVeV0/ldZfuzgzAzHFDwmzryfIyt2JEbsBsGTq/QE+7hvLAe8R9xofIn
z6/IndiiTYhNCNf06nFPR4Y5ZDZPGb9aw5Jisqh+OSxtc0BFHDSV8/35yWM/JLQ1
Ja8AOHw1kP9KO+iE9rHMt0+7lH3mN1GBabxH26EdgFfPShsi14qmziLOuUlGLuwO
ApIYqvdtCs+zlMA8PsiJIMuxizZ6qCLur3r2b+/YXoJjuFDcax9M+Pr0D7rZX0Hk
6PW3dtvDQHfspwLY0FIlXbbtCfCqGLe47VaS7lvG0XeMlo3dUEsf707Q2h0+G1tm
wyeuWSPEzZQq/KI7JIFlxr3N/3VCdGa9qVf/40QF0BXPfJdcwTEzmPlYetRgA11W
bglw8DxWBv24a2gWeUkwBWFScR3QV4FAwVjmlCqrkw9dy/JtrFf4pwDoqSFUcofB
95u6qlz/PC+ho9uvUo5uIwJyz3J5BIgfkMAPYcHNZZ5QrpI3mdwf66im1TOKKTuf
3Sz/GKc14qAIQhxuUWrgAKTexBJYJmzDT0Mj4ISjlr9K6VXrQwTuj2zC4QARAQAB
zStQYXVsIEJhcmtlciA8cGF1bC5iYXJrZXIuY3RAYnAucmVuZXNhcy5jb20+wsGU
BBMBCgA+FiEE9KKf333+FIzPGaxOJ/SzRZ8AIlcFAmS4BNsCGwEFCQPCZwAFCwkI
BwIGFQoJCAsCBBYCAwECHgECF4AACgkQJ/SzRZ8AIlfxaQ/8CM36qjfad7eBfwja
cI1LlH1NwbSJ239rE0X7hU/5yra72egr3T5AUuYTt9ECNQ8Ld03BYhbC6hPki5rb
OlFM2hEPUQYeohcJ4Na5iIFpTxoIuC49Hp2ce6ikvt9Hc4O2FAntabg+9hE8WA4f
QWW+Qo5ve5OJ0sGylzu0mRZ2I3mTaDsxuDkXOICF5ggSdjT+rcd/pRVOugImjpZv
/jzSgUfKV2wcZ8vVK0616K21tyPiRjYtDQjJAKff8gBY6ZvP5REPl+fYNvZm1y4l
hsVupGHL3aV+BKooMsKRZIMTiKJCIy6YFKHOcgWFG62cuRrFDf4r54MJuUGzyeoF
1XNFzbe1ySoRfU/HrEuBNqC+1CEBiduumh89BitfDNh6ecWVLw24fjsF1Ke6vYpU
lK9/yGLV26lXYEN4uEJ9i6PjgJ+Q8fubizCVXVDPxmWSZIoJg8EspZ+Max03Lk3e
flWQ0E3l6/VHmsFgkvqhjNlzFRrj/k86IKdOi0FOd0xtKh1p34rQ8S/4uUN9XCVj
KtmyLfQgqPVEC6MKv7yFbextPoDUrFAzEgi4OBdqDJjPbdU9wUjONxuWJRrzRFcr
nTIG7oC4dae0p1rs5uTlaSIKpB2yulaJLKjnNstAj9G9Evf4SE2PKH4l4Jlo/Hu1
wOUqmCLRo3vFbn7xvfr1u0Z+oMTOOARkuAhwEgorBgEEAZdVAQUBAQdAcuNbK3VT
WrRYypisnnzLAguqvKX3Vc1OpNE4f8pOcgMDAQgHwsF2BBgBCgAgFiEE9KKf333+
FIzPGaxOJ/SzRZ8AIlcFAmS4CHACGwwACgkQJ/SzRZ8AIlc90BAAr0hmx8XU9KCj
g4nJqfavlmKUZetoX5RB9g3hkpDlvjdQZX6lenw3yUzPj53eoiDKzsM03Tak/KFU
FXGeq7UtPOfXMyIh5UZVdHQRxC4sIBMLKumBfC7LM6XeSegtaGEX8vSzjQICIbaI
roF2qVUOTMGal2mvcYEvmObC08bUZuMd4nxLnHGiej2t85+9F3Y7GAKsA25EXbbm
ziUg8IVXw3TojPNrNoQ3if2Z9NfKBhv0/s7x/3WhhIzOht+rAyZaaW+31btDrX4+
Y1XLAzg9DAfuqkL6knHDMd9tEuK6m2xCOAeZazXaNeOTjQ/XqCHmZ+691VhmAHCI
7Z7EBPh++TjEqn4ZH+4KPn6XD52+ruWXGbJP29zc+3bwQ+ZADfUaL3ADj69ySxzm
bO24USHBAg+BhZAZMBkbkygbTen/umT6tBxG91krqbKlDdc8mhGonBN6i+nz8qv1
6MdC5P1rDbo834rxNLvoFMSLCcpjoafiprl9qk0wQLq48WGphs9DX7V75ZAU5Lt6
yA+je8i799EZJsVlB933Gpj688H4csaZqEMBjq7vMvI+a5MnLCGcjwRhsUfogpRb
AWTx9ddVau4MJgEHzB7UU/VFyP2vku7XPj6mgSfSHyNVf2hqxwISQ8eZLoyxauOD
Y61QMX6YFL170ylToSFjH627h6TzlUDOMwRkuAiAFgkrBgEEAdpHDwEBB0Bibkmu
Sf7yECzrkBmjD6VGWNVxTdiqb2RuAfGFY9RjRsLB7QQYAQoAIBYhBPSin999/hSM
zxmsTif0s0WfACJXBQJkuAiAAhsCAIEJECf0s0WfACJXdiAEGRYIAB0WIQSiu8gv
1Xr0fIw/aoLbaV4Vf/JGvQUCZLgIgAAKCRDbaV4Vf/JGvZP9AQCwV06n3DZvuce3
/BtzG5zqUuf6Kp2Esgr2FrD4fKVbogD/ZHpXfi9ELdH/JTSVyujaTqhuxQ5B7UzV
CUIb1qbg1APIEA/+IaLJIBySehy8dHDZQXit/XQYeROQLTT9PvyM35rZVMGH6VG8
Zb23BPCJ3N0ISOtVdG402lSP0ilP/zSyQAbJN6F0o2tiPd558lPerFd/KpbCIp8N
kYaLlHWIDiN2AE3c6sfCiCPMtXOR7HCeQapGQBS/IMh1qYHffuzuEy7tbrMvjdra
VN9Rqtp7PSuRTbO3jAhm0Oe4lDCAK4zyZfjwiZGxnj9s1dyEbxYB2GhTOgkiX/96
Nw+m/ShaKqTM7o3pNUEs9J3oHeGZFCCaZBv97ctqrYhnNB4kzCxAaZ6K9HAAmcKe
WT2q4JdYzwB6vEeHnvxl7M0Dj9pUTMujW77Qh5IkUQLYZ2XQYnKAV2WI90B0R1p9
bXP+jqqkaNCrxKHV1tYOB6037CziGcZmiDneiTlM765MTLJLlHNqlXxDCzRwEazU
y9dNzITjVT0qhc6th8/vqN9dqvQaAGa13u86Gbv4XPYdE+5MXPM/fTgkKaPBYcIV
QMvLfoZxyaTk4nzNbBxwwEEHrvTcWDdWxGNtkWRZw0+U5JpXCOi9kBCtFrJ701UG
UFs56zWndQUS/2xDyGk8GObGBSRLCwsXsKsF6hSX5aKXHyrAAxEUEscRaAmzd6O3
ZyZGVsEsOuGCLkekUMF/5dwOhEDXrY42VR/ZxdDTY99dznQkwTt4o7FOmkY=3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------fauPFJcSdJBNtE4ei89h0siq--

--------------0W3gefA1t5vPtBTa1W6ijMPB--

--------------EXzZ0U87jzFgcMpqjReXpKra
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZhzYcgUDAAAAAAAKCRDbaV4Vf/JGvau1
AP4iHjq/XnEGVNvW9DXA2a7bnVr9my7bFKzIGRUvsWjmFwEA6wine8u7F3pLp9PaYZ0L5eQh+2XA
IoB9m81nrYhu+wo=
=QavD
-----END PGP SIGNATURE-----

--------------EXzZ0U87jzFgcMpqjReXpKra--

