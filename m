Return-Path: <linux-renesas-soc+bounces-9341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A3898ECE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 12:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D5101F22A82
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 10:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B0714A4FB;
	Thu,  3 Oct 2024 10:26:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356121459E4;
	Thu,  3 Oct 2024 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727951184; cv=none; b=beFzfpFFt7icGNI5NTP5N5qqSg4un+XR5qqmUjtuVtLE5G8QGk1J3IlPsOfCg25kE2BUErJPNC8yMfxt3PixbNQFnvDdDLelpIOKKhhVYK97KxAXDE+bYGLIQ8DTSWgpCpucr88TfIbh84gXdkHSyFjA7gwOqFWapN6o44acCmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727951184; c=relaxed/simple;
	bh=bcUIIrCzFJz/4wSGT29+s5Ud0oryurt81Re0i+g7uxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JGpoJVatnsmgJ6fX4KOKJ4UH1PNFNnWPDiOsvaRL3nw+Mpe54TRWDflcrzodBV5/uU1711U5BGqtjM/AuUXsGryeInkihEaqjWgtXG1tCQLKMn9RYZAFNl3fLLnmDhvZPg6pTc5FUJJp46/yEE7Oxffc8Qr68dDZcOgwmQAttIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,174,1725289200"; 
   d="asc'?scan'208";a="220689133"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Oct 2024 19:26:20 +0900
Received: from [10.226.92.134] (unknown [10.226.92.134])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7CBCC400618F;
	Thu,  3 Oct 2024 19:26:09 +0900 (JST)
Message-ID: <b644cecd-7954-4fa6-99e9-af8c98efe3e1@bp.renesas.com>
Date: Thu, 3 Oct 2024 11:26:07 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 11/11] net: ravb: Add VLAN checksum support
Content-Language: en-GB
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Paul Barker <paul@pbarker.dev>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240930160845.8520-1-paul@pbarker.dev>
 <20240930160845.8520-12-paul@pbarker.dev>
 <ab7482f9-6833-416f-8adf-5e1347628dec@omp.ru>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
In-Reply-To: <ab7482f9-6833-416f-8adf-5e1347628dec@omp.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------T5prjWRr5c4cDvdlAB0xO31q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------T5prjWRr5c4cDvdlAB0xO31q
Content-Type: multipart/mixed; boundary="------------OS5xMoXe9PUsXB7qncm0NU40";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Paul Barker <paul@pbarker.dev>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <b644cecd-7954-4fa6-99e9-af8c98efe3e1@bp.renesas.com>
Subject: Re: [net-next PATCH 11/11] net: ravb: Add VLAN checksum support
References: <20240930160845.8520-1-paul@pbarker.dev>
 <20240930160845.8520-12-paul@pbarker.dev>
 <ab7482f9-6833-416f-8adf-5e1347628dec@omp.ru>
In-Reply-To: <ab7482f9-6833-416f-8adf-5e1347628dec@omp.ru>

--------------OS5xMoXe9PUsXB7qncm0NU40
Content-Type: multipart/mixed; boundary="------------rwfbfkRBzON5ofDeJHI0YnQ3"

--------------rwfbfkRBzON5ofDeJHI0YnQ3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 30/09/2024 21:36, Sergey Shtylyov wrote:
> On 9/30/24 19:08, Paul Barker wrote:
>=20
>> From: Paul Barker <paul.barker.ct@bp.renesas.com>
>>
>> The GbEth IP supports offloading checksum calculation for VLAN-tagged
>> packets, provided that the EtherType is 0x8100 and only one VLAN tag i=
s
>> present.
>>
>> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> [...]
>=20
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/et=
hernet/renesas/ravb_main.c
>> index 832132d44fb4..eb7499d42a9b 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -2063,11 +2063,30 @@ static void ravb_tx_timeout_work(struct work_s=
truct *work)
>> =20
>>  static bool ravb_can_tx_csum_gbeth(struct sk_buff *skb)
>>  {
>> -	/* TODO: Need to add support for VLAN tag 802.1Q */
>> -	if (skb_vlan_tag_present(skb))
>> +	u16 net_protocol =3D ntohs(skb->protocol);
>> +
>> +	/* GbEth IP can calculate the checksum if:
>> +	 * - there are zero or one VLAN headers with TPID=3D0x8100
>> +	 * - the network protocol is IPv4 or IPv6
>> +	 * - the transport protocol is TCP, UDP or ICMP
>> +	 * - the packet is not fragmented
>> +	 */
>> +
>> +	if (skb_vlan_tag_present(skb) &&
>> +	    (skb->vlan_proto !=3D ETH_P_8021Q || net_protocol =3D=3D ETH_P_8=
021Q))
>=20
>    Not sure I understand this check... Maybe s/=3D=3D/!=3D/?

So, after a bit more investigation, I think this was based on a faulty
understanding. I can't find any clear documentation of this so I've gone
wandering through the code.

In vlan_dev_init() in net/8021q/vlan_dev.c, there is a check for
vlan_hw_offload_capable() on the underlying network device. If this is
false (as it will be for the GbEth IP), a set of header_ops is selected
which inserts the vlan tag into the skb data. So, we can ignore
skb->vlan_proto as skb->protocol will always be set to the VLAN protocol
for VLAN tagged packets.

The conclusion is that we can drop this if condition completely and just
keep the following if (net_protocol =3D=3D ETH_P_8021Q) condition.

Will fix this in v2...

Thanks,

--=20
Paul Barker
--------------rwfbfkRBzON5ofDeJHI0YnQ3
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------rwfbfkRBzON5ofDeJHI0YnQ3--

--------------OS5xMoXe9PUsXB7qncm0NU40--

--------------T5prjWRr5c4cDvdlAB0xO31q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZv5xPwUDAAAAAAAKCRDbaV4Vf/JGvRGJ
AP95aej7Gsk+USlMJj8c3+hWX9dlgaifBPbVNP5/H8uHkQD+IjxuLM+x5a869SuNjRIKuwf5/AKA
iOUJGlKoeCX59AI=
=kE+i
-----END PGP SIGNATURE-----

--------------T5prjWRr5c4cDvdlAB0xO31q--

