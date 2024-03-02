Return-Path: <linux-renesas-soc+bounces-3405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ED086F022
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 11:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C073B240E1
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Mar 2024 10:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE3512B80;
	Sat,  2 Mar 2024 10:56:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508B9107B4;
	Sat,  2 Mar 2024 10:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709376971; cv=none; b=QwwoN1XQa/Po8lP/E3M+A6krypVFVPWutu+PtipkVBMOIfgm6XpkKm+jG4gelsYHLVNuwURgRGTQkq2SzNy931i7TH44bJ+C7dIYS9EBl1xybUsUmjm3fRUsgxBFblB0uWqx+1NuGEfRBF9b6Qa+3VqUHUXRtXhJ9E8o6G1XbUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709376971; c=relaxed/simple;
	bh=/e3S6s/7z3xyAdilzje1NTUVpLRtOmeWeL+8LSFHwds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C5LAciaVFbsnwIoTYP3xpAd5MmbGNvpy9Cbu5ZV54m3MGHrVIQnemAoJgB8U7ezF9UB3iVTEJJija3vecaVLOk5/J17BqsB+OSOx74LZPPv2zKLH0YFUhtJ7WG7YEptQWSUfMsV3wnKsUuG55yVG0T2JlUtHrH/N/A2GMR+p9tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,199,1705330800"; 
   d="asc'?scan'208";a="196089413"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Mar 2024 19:56:02 +0900
Received: from [10.226.92.29] (unknown [10.226.92.29])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C32004007551;
	Sat,  2 Mar 2024 19:55:58 +0900 (JST)
Message-ID: <4aaba559-ccee-4f8a-a26b-c3ffea54b7fe@bp.renesas.com>
Date: Sat, 2 Mar 2024 10:55:58 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,v2 5/6] ravb: Move maximum Rx descriptor data usage to
 info struct
Content-Language: en-GB
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20240227223305.910452-1-niklas.soderlund+renesas@ragnatech.se>
 <20240227223305.910452-6-niklas.soderlund+renesas@ragnatech.se>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <20240227223305.910452-6-niklas.soderlund+renesas@ragnatech.se>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------B0uNDn1t0JOmMA7aLeX5ytiu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------B0uNDn1t0JOmMA7aLeX5ytiu
Content-Type: multipart/mixed; boundary="------------9KgnGdrnv00Hke3FiH5xkEfq";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <4aaba559-ccee-4f8a-a26b-c3ffea54b7fe@bp.renesas.com>
Subject: Re: [net-next,v2 5/6] ravb: Move maximum Rx descriptor data usage to
 info struct
References: <20240227223305.910452-1-niklas.soderlund+renesas@ragnatech.se>
 <20240227223305.910452-6-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240227223305.910452-6-niklas.soderlund+renesas@ragnatech.se>

--------------9KgnGdrnv00Hke3FiH5xkEfq
Content-Type: multipart/mixed; boundary="------------nOzPKEA2tbVDzis5X68Mu4VW"

--------------nOzPKEA2tbVDzis5X68Mu4VW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 27/02/2024 22:33, Niklas S=C3=B6derlund wrote:
> To make it possible to merge the R-Car and RZ/G2L code paths move the
> maximum usable size of a single Rx descriptor data slice in to the
> hardware information instead of using two different defines in the two
> different code paths.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> ---
> * Changes since v1
> - Use SZ_2K macro instead of 2048 directly to align the style of the
>   rest of the members in struct ravb_hw_info.
> ---
>  drivers/net/ethernet/renesas/ravb.h      |  5 +----
>  drivers/net/ethernet/renesas/ravb_main.c | 12 ++++++++----
>  2 files changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet=
/renesas/ravb.h
> index 7fa60fccb6ea..b12b379baf5a 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -1015,10 +1015,6 @@ enum CSR2_BIT {
>  #define NUM_RX_QUEUE	2
>  #define NUM_TX_QUEUE	2
> =20
> -#define RX_BUF_SZ	(2048 - ETH_FCS_LEN + sizeof(__sum16))
> -
> -#define GBETH_RX_DESC_DATA_SIZE 4080
> -
>  struct ravb_tstamp_skb {
>  	struct list_head list;
>  	struct sk_buff *skb;
> @@ -1058,6 +1054,7 @@ struct ravb_hw_info {
>  	int stats_len;
>  	u32 tccr_mask;
>  	u32 rx_max_frame_size;
> +	u32 rx_max_desc_use;
>  	unsigned aligned_tx: 1;
> =20
>  	/* hardware features */
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/eth=
ernet/renesas/ravb_main.c
> index 45383635e8e2..4ef4be9e152e 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -351,7 +351,7 @@ static void ravb_rx_ring_format_gbeth(struct net_de=
vice *ndev, int q)
>  	for (i =3D 0; i < priv->num_rx_ring[q]; i++) {
>  		/* RX descriptor */
>  		rx_desc =3D &priv->rx_ring[q].desc[i];
> -		rx_desc->ds_cc =3D cpu_to_le16(GBETH_RX_DESC_DATA_SIZE);
> +		rx_desc->ds_cc =3D cpu_to_le16(priv->info->rx_max_desc_use);
>  		dma_addr =3D dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->da=
ta,
>  					  priv->info->rx_max_frame_size,
>  					  DMA_FROM_DEVICE);
> @@ -381,7 +381,7 @@ static void ravb_rx_ring_format_rcar(struct net_dev=
ice *ndev, int q)
>  	for (i =3D 0; i < priv->num_rx_ring[q]; i++) {
>  		/* RX descriptor */
>  		rx_desc =3D &priv->rx_ring[q].ex_desc[i];
> -		rx_desc->ds_cc =3D cpu_to_le16(RX_BUF_SZ);
> +		rx_desc->ds_cc =3D cpu_to_le16(priv->info->rx_max_desc_use);
>  		dma_addr =3D dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->da=
ta,
>  					  priv->info->rx_max_frame_size,
>  					  DMA_FROM_DEVICE);
> @@ -921,7 +921,7 @@ static bool ravb_rx_gbeth(struct net_device *ndev, =
int *quota, int q)
>  	for (; priv->cur_rx[q] - priv->dirty_rx[q] > 0; priv->dirty_rx[q]++) =
{
>  		entry =3D priv->dirty_rx[q] % priv->num_rx_ring[q];
>  		desc =3D &priv->rx_ring[q].desc[entry];
> -		desc->ds_cc =3D cpu_to_le16(GBETH_RX_DESC_DATA_SIZE);
> +		desc->ds_cc =3D cpu_to_le16(priv->info->rx_max_desc_use);
> =20
>  		if (!priv->rx_skb[q][entry]) {
>  			skb =3D ravb_alloc_skb(ndev, info, GFP_ATOMIC);
> @@ -1036,7 +1036,7 @@ static bool ravb_rx_rcar(struct net_device *ndev,=
 int *quota, int q)
>  	for (; priv->cur_rx[q] - priv->dirty_rx[q] > 0; priv->dirty_rx[q]++) =
{
>  		entry =3D priv->dirty_rx[q] % priv->num_rx_ring[q];
>  		desc =3D &priv->rx_ring[q].ex_desc[entry];
> -		desc->ds_cc =3D cpu_to_le16(RX_BUF_SZ);
> +		desc->ds_cc =3D cpu_to_le16(priv->info->rx_max_desc_use);
> =20
>  		if (!priv->rx_skb[q][entry]) {
>  			skb =3D ravb_alloc_skb(ndev, info, GFP_ATOMIC);
> @@ -2694,6 +2694,7 @@ static const struct ravb_hw_info ravb_gen3_hw_inf=
o =3D {
>  	.stats_len =3D ARRAY_SIZE(ravb_gstrings_stats),
>  	.tccr_mask =3D TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
>  	.rx_max_frame_size =3D SZ_2K,
> +	.rx_max_desc_use =3D SZ_2K - ETH_FCS_LEN + sizeof(__sum16),
>  	.internal_delay =3D 1,
>  	.tx_counters =3D 1,
>  	.multi_irqs =3D 1,
> @@ -2719,6 +2720,7 @@ static const struct ravb_hw_info ravb_gen2_hw_inf=
o =3D {
>  	.stats_len =3D ARRAY_SIZE(ravb_gstrings_stats),
>  	.tccr_mask =3D TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
>  	.rx_max_frame_size =3D SZ_2K,
> +	.rx_max_desc_use =3D SZ_2K - ETH_FCS_LEN + sizeof(__sum16),
>  	.aligned_tx =3D 1,
>  	.gptp =3D 1,
>  	.nc_queues =3D 1,
> @@ -2741,6 +2743,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_in=
fo =3D {
>  	.stats_len =3D ARRAY_SIZE(ravb_gstrings_stats),
>  	.tccr_mask =3D TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
>  	.rx_max_frame_size =3D SZ_2K,
> +	.rx_max_desc_use =3D SZ_2K - ETH_FCS_LEN + sizeof(__sum16),
>  	.multi_irqs =3D 1,
>  	.err_mgmt_irqs =3D 1,
>  	.gptp =3D 1,
> @@ -2765,6 +2768,7 @@ static const struct ravb_hw_info gbeth_hw_info =3D=
 {
>  	.stats_len =3D ARRAY_SIZE(ravb_gstrings_stats_gbeth),
>  	.tccr_mask =3D TCCR_TSRQ0,
>  	.rx_max_frame_size =3D SZ_8K,
> +	.rx_max_desc_use =3D 4080,
>  	.aligned_tx =3D 1,
>  	.tx_counters =3D 1,
>  	.carrier_counters =3D 1,

Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>

--=20
Paul Barker
--------------nOzPKEA2tbVDzis5X68Mu4VW
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

--------------nOzPKEA2tbVDzis5X68Mu4VW--

--------------9KgnGdrnv00Hke3FiH5xkEfq--

--------------B0uNDn1t0JOmMA7aLeX5ytiu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZeMFvgUDAAAAAAAKCRDbaV4Vf/JGvTml
AP9nnO4u4JKhGfx70bimoGKum5JQC0He1/YKnmySWGL5/wD/dgmU7+UtSsxDIBXnGraZYQ7BgEHI
tzddI+MsJU1Fugk=
=V8ls
-----END PGP SIGNATURE-----

--------------B0uNDn1t0JOmMA7aLeX5ytiu--

