Return-Path: <linux-renesas-soc+bounces-5674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 962688D3EC4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 21:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B94281C234D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 19:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63190187332;
	Wed, 29 May 2024 19:07:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6581F15D5B9;
	Wed, 29 May 2024 19:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717009638; cv=none; b=TH5F2z13e6PvUKt+lwom/8V6n/m+XferaPvbt4C1ivAXOf/NatK6zMptysj/v6HOjmpc7tYQT/R/0wsZkK3/wQ9rvNGgFipvGGwxs6DOF7YbuH6Ys0sxH+KX5vutt6gRaMugFCKOa6dMoK1UyIon7KKbhrGYAQ5KlybJBM1crFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717009638; c=relaxed/simple;
	bh=Qytmr2YvfQ/qY3YWT/0L1Uy9ZuBpQAMzrpnojoMsW/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSzhu90sIGiBtceTT4G0FpJ5b2fT5/Y/Q4uNOBz9VI9+rC2mt8pyGNU+8y65VtgF/HRrSFLIP/bxMXpuA/soDRqmILfudGgT3K5SpqZTil2YFBvitK4xsZ7ggRPMMsU8Dhk32pvfVHKHYfPfp9dNQ1eK/Msceq2GFiqRctyFhAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,199,1712588400"; 
   d="asc'?scan'208";a="206075008"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 May 2024 04:07:08 +0900
Received: from [10.226.93.49] (unknown [10.226.93.49])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D12414053049;
	Thu, 30 May 2024 04:07:04 +0900 (JST)
Message-ID: <908c525b-10e2-464f-ad66-df431d48ca03@bp.renesas.com>
Date: Wed, 29 May 2024 20:07:03 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH v4 4/7] net: ravb: Refactor GbEth RX code path
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
 <20240528150339.6791-5-paul.barker.ct@bp.renesas.com>
 <611a49b8-ecdb-6b91-9d3e-262bf3851f5b@omp.ru>
Content-Language: en-GB
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <611a49b8-ecdb-6b91-9d3e-262bf3851f5b@omp.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------C8mPhhR8DTavd0CC0GFD7zjU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------C8mPhhR8DTavd0CC0GFD7zjU
Content-Type: multipart/mixed; boundary="------------xLeH70qHWrOAPZVfLI6prThM";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <908c525b-10e2-464f-ad66-df431d48ca03@bp.renesas.com>
Subject: Re: [net-next PATCH v4 4/7] net: ravb: Refactor GbEth RX code path
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
 <20240528150339.6791-5-paul.barker.ct@bp.renesas.com>
 <611a49b8-ecdb-6b91-9d3e-262bf3851f5b@omp.ru>
In-Reply-To: <611a49b8-ecdb-6b91-9d3e-262bf3851f5b@omp.ru>

--------------xLeH70qHWrOAPZVfLI6prThM
Content-Type: multipart/mixed; boundary="------------0kxZWuAYyR1S94PSEHUjvWKm"

--------------0kxZWuAYyR1S94PSEHUjvWKm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29/05/2024 19:30, Sergey Shtylyov wrote:
> On 5/28/24 6:03 PM, Paul Barker wrote:
>=20
>> We can reduce code duplication in ravb_rx_gbeth().
>>
>> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> [...]
>=20
>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/et=
hernet/renesas/ravb_main.c
>> index 7df7d2e93a3a..c9c5cc641589 100644
>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> @@ -817,47 +817,54 @@ static int ravb_rx_gbeth(struct net_device *ndev=
, int budget, int q)
>>  				stats->rx_missed_errors++;
>>  		} else {
>>  			die_dt =3D desc->die_dt & 0xF0;
>> +			skb =3D ravb_get_skb_gbeth(ndev, entry, desc);
>>  			switch (die_dt) {
>=20
>    Why not do instead (as I've asked you alraedy):
>=20
> 			case DT_FSTART:
> 				priv->rx_1st_skb =3D skb;
> 				fallthrough;

I've avoided that change to keep patch 7/7 simpler (as we have to move
the assignment of skb later in that patch). I can change this if you
want though.

>=20
>>  			case DT_FSINGLE:
>> -				skb =3D ravb_get_skb_gbeth(ndev, entry, desc);
>=20
>=20
>> +			case DT_FSTART:
>> +				/* Start of packet:
>> +				 * Set initial data length.
>> +				 */
>=20
>    Please consider turning that block comment into one-liner...

Ack.

>=20
>>  				skb_put(skb, desc_len);
>> +
>> +				/* Save this SKB if the packet spans multiple
>> +				 * descriptors.
>> +				 */
>=20
>    This one too...
>    (The current line length limit is 100 columns.)

Ack. I'll re-flow some other lines with a 100 col limit as well - I'm
immediately thinking of the skb_copy_to_linear_data_offset call below.

>=20
>> +				if (die_dt =3D=3D DT_FSTART)
>> +					priv->rx_1st_skb =3D skb;
>=20
>    This needs to be done under *case* DT_FSTART above instead...

See above comment. We can do this under DT_FSTART in this patch if you
want, but this if condition will then come back in a revised patch 7/7.

>=20
>> +				break;
>> +
>> +			case DT_FMID:
>> +			case DT_FEND:
>> +				/* Continuing a packet:
>> +				 * Move data into the saved SKB.
>> +				 */
>> +				skb_copy_to_linear_data_offset(priv->rx_1st_skb,
>> +							       priv->rx_1st_skb->len,
>> +							       skb->data,
>> +							       desc_len);
>> +				skb_put(priv->rx_1st_skb, desc_len);
>> +				dev_kfree_skb(skb);
>> +
>> +				/* Set skb to point at the whole packet so that
>=20
>    Please call it consistently, either SKB or skb (I prefer this one).

Ack.

>=20
>> +				 * we only need one code path for finishing a
>> +				 * packet.
>> +				 */
>> +				skb =3D priv->rx_1st_skb;
>> +			}
>> +
>> +			switch (die_dt) {
>> +			case DT_FSINGLE:
>> +			case DT_FEND:
>> +				/* Finishing a packet:
>> +				 * Determine protocol & checksum, hand off to
>> +				 * NAPI and update our stats.
>> +				 */
>>  				skb->protocol =3D eth_type_trans(skb, ndev);
>>  				if (ndev->features & NETIF_F_RXCSUM)
>>  					ravb_rx_csum_gbeth(skb);
>> +				stats->rx_bytes +=3D skb->len;
>>  				napi_gro_receive(&priv->napi[q], skb);
>>  				rx_packets++;
>=20
>    Otherwise, this is very good patch! Sorry for letting in the duplcat=
e
> code earlier! :-)
>=20
> [...]
>=20
> MBR, Sergey

Thanks for the review!

--=20
Paul Barker
--------------0kxZWuAYyR1S94PSEHUjvWKm
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------0kxZWuAYyR1S94PSEHUjvWKm--

--------------xLeH70qHWrOAPZVfLI6prThM--

--------------C8mPhhR8DTavd0CC0GFD7zjU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZld81wUDAAAAAAAKCRDbaV4Vf/JGvSB2
AQDsl88612pVTH7Q4DmISnf/IKZNF78DGn0tZh/a3swrBQD+K1AW57Vs4xI+FJOtQuWBnROxY80/
weNzOauijYS1dQU=
=7b6L
-----END PGP SIGNATURE-----

--------------C8mPhhR8DTavd0CC0GFD7zjU--

