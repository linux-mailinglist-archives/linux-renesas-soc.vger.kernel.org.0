Return-Path: <linux-renesas-soc+bounces-3254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A581868D7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 11:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1FE8B27C7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 10:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183B2138480;
	Tue, 27 Feb 2024 10:25:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA206137C24;
	Tue, 27 Feb 2024 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709029517; cv=none; b=TsRB8BA6EpyGWSYPr/7Ez1NLmdXHkuOSRP0lxVYPb40WaY2LptaFQP7ppmdjdEocCrPKA4wRHlzBXDz74aPGVlOockxOJ4zwRT+YrbvEKqVqYpoWtaXU7ijq13rs/dUQPuWEdyvWRqZcwKjtgTlok8O2MI2/YoMgmvA2vclorR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709029517; c=relaxed/simple;
	bh=4P8v65HNBqGkaReK8UM+S/BRgkh3f/r62hkAttx4aAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qt9aIcqEmsstAvrsXEV2N1yvC0YTSvn0xU6a9bBpZXgjD8WDjVWhebhnHeBe9Gxan4O02FVWVAQ8e9l2ny2Gnin9BkVO4PM252xSG3f4zuTgawkOLC6tcehmiYjhgQxKqu9+oKBc74v5ods2CzDJ39zLhg9JGXn8YCRtKATwd0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,187,1705330800"; 
   d="asc'?scan'208";a="199446232"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 27 Feb 2024 19:25:13 +0900
Received: from [10.226.92.206] (unknown [10.226.92.206])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id EA4B041FCC70;
	Tue, 27 Feb 2024 19:25:09 +0900 (JST)
Message-ID: <98691004-d7f4-4223-af8b-aadb4f73d28f@bp.renesas.com>
Date: Tue, 27 Feb 2024 10:25:09 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 2/6] ravb: Make it clear the information relates to
 maximum frame size
Content-Language: en-GB
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Sergey Shtylyov
 <s.shtylyov@omp.ru>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20240227014014.44855-1-niklas.soderlund+renesas@ragnatech.se>
 <20240227014014.44855-3-niklas.soderlund+renesas@ragnatech.se>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <20240227014014.44855-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------G0vI6MWw10ngoClmRkMGsD8D"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------G0vI6MWw10ngoClmRkMGsD8D
Content-Type: multipart/mixed; boundary="------------WEEMXZvtP0GfEF0sO30yAuwS";
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
Message-ID: <98691004-d7f4-4223-af8b-aadb4f73d28f@bp.renesas.com>
Subject: Re: [net-next 2/6] ravb: Make it clear the information relates to
 maximum frame size
References: <20240227014014.44855-1-niklas.soderlund+renesas@ragnatech.se>
 <20240227014014.44855-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240227014014.44855-3-niklas.soderlund+renesas@ragnatech.se>

--------------WEEMXZvtP0GfEF0sO30yAuwS
Content-Type: multipart/mixed; boundary="------------klLzpWB07zUdPxK0u9kxLqFm"

--------------klLzpWB07zUdPxK0u9kxLqFm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 27/02/2024 01:40, Niklas S=C3=B6derlund wrote:
> The struct member rx_max_buf_size was added before split descriptor
> support where added. It is unclear if the value describes the full skb
> frame buffer or the data descriptor buffer which can be combined into a=

> single skb.
>=20
> Rename it to make it clear it referees to the maximum frame size and ca=
n
> cover multiple descriptors.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> ---
>  drivers/net/ethernet/renesas/ravb.h      |  2 +-
>  drivers/net/ethernet/renesas/ravb_main.c | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet=
/renesas/ravb.h
> index aecc98282c7e..7f9e8b2c012a 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -1059,7 +1059,7 @@ struct ravb_hw_info {
>  	int stats_len;
>  	size_t max_rx_len;
>  	u32 tccr_mask;
> -	u32 rx_max_buf_size;
> +	u32 rx_max_frame_size;
>  	unsigned aligned_tx: 1;
> =20
>  	/* hardware features */
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/eth=
ernet/renesas/ravb_main.c
> index c25a80f4d3b9..3c59e2c317c7 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2684,7 +2684,7 @@ static const struct ravb_hw_info ravb_gen3_hw_inf=
o =3D {
>  	.stats_len =3D ARRAY_SIZE(ravb_gstrings_stats),
>  	.max_rx_len =3D RX_BUF_SZ + RAVB_ALIGN - 1,
>  	.tccr_mask =3D TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
> -	.rx_max_buf_size =3D SZ_2K,
> +	.rx_max_frame_size =3D SZ_2K,
>  	.internal_delay =3D 1,
>  	.tx_counters =3D 1,
>  	.multi_irqs =3D 1,
> @@ -2710,7 +2710,7 @@ static const struct ravb_hw_info ravb_gen2_hw_inf=
o =3D {
>  	.stats_len =3D ARRAY_SIZE(ravb_gstrings_stats),
>  	.max_rx_len =3D RX_BUF_SZ + RAVB_ALIGN - 1,
>  	.tccr_mask =3D TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
> -	.rx_max_buf_size =3D SZ_2K,
> +	.rx_max_frame_size =3D SZ_2K,
>  	.aligned_tx =3D 1,
>  	.gptp =3D 1,
>  	.nc_queues =3D 1,
> @@ -2733,7 +2733,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_in=
fo =3D {
>  	.stats_len =3D ARRAY_SIZE(ravb_gstrings_stats),
>  	.max_rx_len =3D RX_BUF_SZ + RAVB_ALIGN - 1,
>  	.tccr_mask =3D TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
> -	.rx_max_buf_size =3D SZ_2K,
> +	.rx_max_frame_size =3D SZ_2K,
>  	.multi_irqs =3D 1,
>  	.err_mgmt_irqs =3D 1,
>  	.gptp =3D 1,
> @@ -2758,7 +2758,7 @@ static const struct ravb_hw_info gbeth_hw_info =3D=
 {
>  	.stats_len =3D ARRAY_SIZE(ravb_gstrings_stats_gbeth),
>  	.max_rx_len =3D ALIGN(GBETH_RX_BUFF_MAX, RAVB_ALIGN),
>  	.tccr_mask =3D TCCR_TSRQ0,
> -	.rx_max_buf_size =3D SZ_8K,
> +	.rx_max_frame_size =3D SZ_8K,
>  	.aligned_tx =3D 1,
>  	.tx_counters =3D 1,
>  	.carrier_counters =3D 1,
> @@ -2967,7 +2967,7 @@ static int ravb_probe(struct platform_device *pde=
v)
>  	priv->avb_link_active_low =3D
>  		of_property_read_bool(np, "renesas,ether-link-active-low");
> =20
> -	ndev->max_mtu =3D info->rx_max_buf_size - (ETH_HLEN + VLAN_HLEN + ETH=
_FCS_LEN);
> +	ndev->max_mtu =3D info->rx_max_frame_size - (ETH_HLEN + VLAN_HLEN + E=
TH_FCS_LEN);
>  	ndev->min_mtu =3D ETH_MIN_MTU;
> =20
>  	/* FIXME: R-Car Gen2 has 4byte alignment restriction for tx buffer

Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>

--=20
Paul Barker
--------------klLzpWB07zUdPxK0u9kxLqFm
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------klLzpWB07zUdPxK0u9kxLqFm--

--------------WEEMXZvtP0GfEF0sO30yAuwS--

--------------G0vI6MWw10ngoClmRkMGsD8D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZd24hQUDAAAAAAAKCRDbaV4Vf/JGvaBe
AP0YmksyIIpa8eQHJCYpx2nvwbiCZ1gtNGRCQ3+jJxKV8QD/e13Upv1nSjPyNjwpd/yEf2MPwepX
8wrNgObgWUy/uQw=
=JNLd
-----END PGP SIGNATURE-----

--------------G0vI6MWw10ngoClmRkMGsD8D--

