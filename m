Return-Path: <linux-renesas-soc+bounces-5775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 593718D8200
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 14:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B9571C21746
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 12:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F647129E70;
	Mon,  3 Jun 2024 12:15:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718288174E;
	Mon,  3 Jun 2024 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717416954; cv=none; b=V8uJcOXKh/+q7nktktFtYeqC/Wdbu9WGUsPJLgkClPvC4nl1u5CLo0zolMRXEoKduPhlfO5rCl/oGpJA8KCa63pZiIWLNdPyp1BN+bL5Mj6zyVsw/PoBhcEciuWezW86fbW/UV7PIsJM831k3beqEzFOjVvdnXnBYoukQ4nU7JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717416954; c=relaxed/simple;
	bh=4Ap5uuggN23qouZYrieMUmLdoHBmg1HNP03hsyg5qN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCpnoZOFQRiMGA8H2yZMlRB7lJBHzI+IX0sVzkdy7NYYnYTkKu7GaqQDbGTy/ev5cQ7c4XJ+XlHwY1DjM/ZoZjWiVhB4V8tj1oxnMqiU25RhX3naeeIqo88cjQ1arXjaQ7MFyUSK9+XwggoqSRCODNmG1GFMzVhUfLNe9AmbIHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,211,1712588400"; 
   d="asc'?scan'208";a="210510995"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Jun 2024 21:15:44 +0900
Received: from [10.226.92.239] (unknown [10.226.92.239])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6D23B428A8B2;
	Mon,  3 Jun 2024 21:15:40 +0900 (JST)
Message-ID: <3eeff8ed-231c-4810-ba99-371524db2f90@bp.renesas.com>
Date: Mon, 3 Jun 2024 13:15:38 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH v4 7/7] net: ravb: Allocate RX buffers via page
 pool
Content-Language: en-GB
To: Simon Horman <horms@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
 <20240528150339.6791-8-paul.barker.ct@bp.renesas.com>
 <20240601101300.GA491852@kernel.org>
 <6165a9a3-15ec-4a40-901a-17c2be64daf1@bp.renesas.com>
 <20240603120757.GX491852@kernel.org>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
Organization: Renesas Electronics Corporation
In-Reply-To: <20240603120757.GX491852@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6ILGAjs0hmr2qv1JYkV6NTmh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6ILGAjs0hmr2qv1JYkV6NTmh
Content-Type: multipart/mixed; boundary="------------c9pItmkX4f0kM0UPzU0eEkL4";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Simon Horman <horms@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <3eeff8ed-231c-4810-ba99-371524db2f90@bp.renesas.com>
Subject: Re: [net-next PATCH v4 7/7] net: ravb: Allocate RX buffers via page
 pool
References: <20240528150339.6791-1-paul.barker.ct@bp.renesas.com>
 <20240528150339.6791-8-paul.barker.ct@bp.renesas.com>
 <20240601101300.GA491852@kernel.org>
 <6165a9a3-15ec-4a40-901a-17c2be64daf1@bp.renesas.com>
 <20240603120757.GX491852@kernel.org>
In-Reply-To: <20240603120757.GX491852@kernel.org>

--------------c9pItmkX4f0kM0UPzU0eEkL4
Content-Type: multipart/mixed; boundary="------------0v24khZlkDGB50R1D24ugksD"

--------------0v24khZlkDGB50R1D24ugksD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/06/2024 13:07, Simon Horman wrote:
> On Mon, Jun 03, 2024 at 09:02:51AM +0100, Paul Barker wrote:
>> On 01/06/2024 11:13, Simon Horman wrote:
>>> On Tue, May 28, 2024 at 04:03:39PM +0100, Paul Barker wrote:
>=20
> ...
>=20
>>>> @@ -298,13 +269,14 @@ static void ravb_ring_free(struct net_device *=
ndev, int q)
>>>>  		priv->tx_ring[q] =3D NULL;
>>>>  	}
>>>> =20
>>>> -	/* Free RX skb ringbuffer */
>>>> -	if (priv->rx_skb[q]) {
>>>> -		for (i =3D 0; i < priv->num_rx_ring[q]; i++)
>>>> -			dev_kfree_skb(priv->rx_skb[q][i]);
>>>> +	/* Free RX buffers */
>>>> +	for (i =3D 0; i < priv->num_rx_ring[q]; i++) {
>>>> +		if (priv->rx_buffers[q][i].page)
>>>> +			page_pool_put_page(priv->rx_pool[q], priv->rx_buffers[q][i].page=
, 0, true);
>>>
>>> nit: Networking still prefers code to be 80 columns wide or less.
>>>      It looks like that can be trivially achieved here.
>>>
>>>      Flagged by checkpatch.pl --max-line-length=3D80
>>
>> Sergey has asked me to wrap to 100 cols [1]. I can only find a referen=
ce
>> to 80 in the docs though [2], so I guess you may be right.
>>
>> [1]: https://lore.kernel.org/all/611a49b8-ecdb-6b91-9d3e-262bf3851f5b@=
omp.ru/
>> [2]: https://www.kernel.org/doc/html/latest/process/coding-style.html
>=20
> Hi Paul,
>=20
> If Sergey prefers 100 then I won't argue :)
>=20
> FWIIW, think what has happened here relates to the Kernel, at some poin=
t,
> going from 80 to 100 columns as the preferred maximum width, while Netw=
orking
> stuck with 80.

I saw that netdevbpf patchwork is configured for 80 cols and it has
warnings for v4 of this patch [1], so I've already re-wrapped the
changes in this series to 80 cols (excluding a couple of lines where
using slightly more than 80 cols significantly improves readability).
I'm planning to send that in the next hour or so, assuming my tests
pass.

[1]: https://patchwork.kernel.org/project/netdevbpf/patch/20240528150339.=
6791-8-paul.barker.ct@bp.renesas.com/

--=20
Paul Barker
--------------0v24khZlkDGB50R1D24ugksD
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------0v24khZlkDGB50R1D24ugksD--

--------------c9pItmkX4f0kM0UPzU0eEkL4--

--------------6ILGAjs0hmr2qv1JYkV6NTmh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZl2z6wUDAAAAAAAKCRDbaV4Vf/JGveXm
AQCFxKE6QtSrN0brvWtxk4FZfc+KhkWZsNGIFDNcd7ghcAD8DTH0EQ7Y77s/ftazOyyHjJI4lB45
42/cORxooNaRFAw=
=f7d0
-----END PGP SIGNATURE-----

--------------6ILGAjs0hmr2qv1JYkV6NTmh--

