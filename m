Return-Path: <linux-renesas-soc+bounces-12429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E52D8A1A8D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 18:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B46BF18812D6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 17:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE806F06B;
	Thu, 23 Jan 2025 17:23:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E975D1D555;
	Thu, 23 Jan 2025 17:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737653001; cv=none; b=gsGrG2tvU6xJb8BNXcUcV5W1jzqH8oaf1drdk+g7kw2e/rhfn6TaWoF/mZrg08ETZZ4fb8bfDPzNpLUaLvSRRQ/8VQR9EHfTwhKJYW/xrd6R52sV0KJfi4uZomaZoww12CG/BsLCC1SClsq7t7TQ6n4pj9zwbXCuz/WUfn8uF6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737653001; c=relaxed/simple;
	bh=G44aApovfa6yjc54VTXuVVOfPPONkZk2f+mqugVP+I4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KIqtJlDSdnxtDg3f2U0qkyob5guWcqu+94YItRIUJnlwy8IiiTm+8d5qUjy8BkKQ+xsQMxMSiDOQqQMujUh4UUh3zS4p1v7qDNgOgZAZqJR/BfshwNLMcuD1vSJVfcxuHFoZX6EuWZetQ0uBX/6+Qo6ZX+0C3ImFpuiexH4u+2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 4KL+8hfmTnCglzlS3mvd+Q==
X-CSE-MsgGUID: b7if/1Z0QOezw4j7tGmylA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jan 2025 02:23:17 +0900
Received: from [10.24.1.109] (unknown [10.24.1.109])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 552184036C77;
	Fri, 24 Jan 2025 02:23:13 +0900 (JST)
Message-ID: <e39ac785-9d4e-43d1-9961-d6d67570ff49@bp.renesas.com>
Date: Thu, 23 Jan 2025 17:23:11 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/2] net: ravb: Fix missing rtnl lock in suspend
 path
Content-Language: en-GB
To: Kory Maincent <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>
References: <20250123-fix_missing_rtnl_lock_phy_disconnect-v2-0-e6206f5508ba@bootlin.com>
 <20250123-fix_missing_rtnl_lock_phy_disconnect-v2-1-e6206f5508ba@bootlin.com>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
In-Reply-To: <20250123-fix_missing_rtnl_lock_phy_disconnect-v2-1-e6206f5508ba@bootlin.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0HLGiOBcKssu3dVnpXf9jouC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0HLGiOBcKssu3dVnpXf9jouC
Content-Type: multipart/mixed; boundary="------------xBBq4OmUubMA4s2XRs5IdPKN";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Kory Maincent <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>
Message-ID: <e39ac785-9d4e-43d1-9961-d6d67570ff49@bp.renesas.com>
Subject: Re: [PATCH net v2 1/2] net: ravb: Fix missing rtnl lock in suspend
 path
References: <20250123-fix_missing_rtnl_lock_phy_disconnect-v2-0-e6206f5508ba@bootlin.com>
 <20250123-fix_missing_rtnl_lock_phy_disconnect-v2-1-e6206f5508ba@bootlin.com>
In-Reply-To: <20250123-fix_missing_rtnl_lock_phy_disconnect-v2-1-e6206f5508ba@bootlin.com>

--------------xBBq4OmUubMA4s2XRs5IdPKN
Content-Type: multipart/mixed; boundary="------------mYpK8sTuMEugykEMaujwKsZa"

--------------mYpK8sTuMEugykEMaujwKsZa
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23/01/2025 16:58, Kory Maincent wrote:
> Fix the suspend path by ensuring the rtnl lock is held where required.
> Calls to ravb_open, ravb_close and wol operations must be performed und=
er
> the rtnl lock to prevent conflicts with ongoing ndo operations.
>=20
> Without this fix, the following warning is triggered:
> [   39.032969] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   39.032983] WARNING: suspicious RCU usage
> [   39.033019] -----------------------------
> [   39.033033] drivers/net/phy/phy_device.c:2004 suspicious
> rcu_dereference_protected() usage!
> ...
> [   39.033597] stack backtrace:
> [   39.033613] CPU: 0 UID: 0 PID: 174 Comm: python3 Not tainted
> 6.13.0-rc7-next-20250116-arm64-renesas-00002-g35245dfdc62c #7
> [   39.033623] Hardware name: Renesas SMARC EVK version 2 based on
> r9a08g045s33 (DT)
> [   39.033628] Call trace:
> [   39.033633]  show_stack+0x14/0x1c (C)
> [   39.033652]  dump_stack_lvl+0xb4/0xc4
> [   39.033664]  dump_stack+0x14/0x1c
> [   39.033671]  lockdep_rcu_suspicious+0x16c/0x22c
> [   39.033682]  phy_detach+0x160/0x190
> [   39.033694]  phy_disconnect+0x40/0x54
> [   39.033703]  ravb_close+0x6c/0x1cc
> [   39.033714]  ravb_suspend+0x48/0x120
> [   39.033721]  dpm_run_callback+0x4c/0x14c
> [   39.033731]  device_suspend+0x11c/0x4dc
> [   39.033740]  dpm_suspend+0xdc/0x214
> [   39.033748]  dpm_suspend_start+0x48/0x60
> [   39.033758]  suspend_devices_and_enter+0x124/0x574
> [   39.033769]  pm_suspend+0x1ac/0x274
> [   39.033778]  state_store+0x88/0x124
> [   39.033788]  kobj_attr_store+0x14/0x24
> [   39.033798]  sysfs_kf_write+0x48/0x6c
> [   39.033808]  kernfs_fop_write_iter+0x118/0x1a8
> [   39.033817]  vfs_write+0x27c/0x378
> [   39.033825]  ksys_write+0x64/0xf4
> [   39.033833]  __arm64_sys_write+0x18/0x20
> [   39.033841]  invoke_syscall+0x44/0x104
> [   39.033852]  el0_svc_common.constprop.0+0xb4/0xd4
> [   39.033862]  do_el0_svc+0x18/0x20
> [   39.033870]  el0_svc+0x3c/0xf0
> [   39.033880]  el0t_64_sync_handler+0xc0/0xc4
> [   39.033888]  el0t_64_sync+0x154/0x158
> [   39.041274] ravb 11c30000.ethernet eth0: Link is Down
>=20
> Reported-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Closes: https://lore.kernel.org/netdev/4c6419d8-c06b-495c-b987-d66c2e1f=
f848@tuxon.dev/
> Fixes: 0184165b2f42 ("ravb: add sleep PM suspend/resume support")
> Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>=20
> Changes in v2:
> - Move the rtnl_lock before ravb_wol_setup() and and ravb_wol_restore()=

>   instead of before the if condition.
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/eth=
ernet/renesas/ravb_main.c
> index bc395294a32d..cfe4f0f364f3 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -3217,10 +3217,16 @@ static int ravb_suspend(struct device *dev)
> =20
>  	netif_device_detach(ndev);
> =20
> -	if (priv->wol_enabled)
> -		return ravb_wol_setup(ndev);
> +	if (priv->wol_enabled) {
> +		rtnl_lock();
> +		ret =3D ravb_wol_setup(ndev);
> +		rtnl_unlock();
> +		return ret;
> +	}
> =20
> +	rtnl_lock();
>  	ret =3D ravb_close(ndev);
> +	rtnl_unlock();
>  	if (ret)
>  		return ret;
> =20
> @@ -3247,7 +3253,9 @@ static int ravb_resume(struct device *dev)
> =20
>  	/* If WoL is enabled restore the interface. */
>  	if (priv->wol_enabled) {
> +		rtnl_lock();
>  		ret =3D ravb_wol_restore(ndev);
> +		rtnl_unlock();
>  		if (ret)
>  			return ret;
>  	} else {
> @@ -3257,7 +3265,9 @@ static int ravb_resume(struct device *dev)
>  	}
> =20
>  	/* Reopening the interface will restore the device to the working sta=
te. */
> +	rtnl_lock();
>  	ret =3D ravb_open(ndev);
> +	rtnl_unlock();
>  	if (ret < 0)
>  		goto out_rpm_put;
> =20
>=20

Please remove Reviewed-by tags when making changes like this in a
subsequent version of a patch series, this is no longer the patch I
reviewed.

I don't like the multiple lock/unlock calls in each function. I think v1
was better, where we take the lock once in each function and then unlock
when it is no longer needed or when we're about to return.

Thanks,

--=20
Paul Barker
--------------mYpK8sTuMEugykEMaujwKsZa
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------mYpK8sTuMEugykEMaujwKsZa--

--------------xBBq4OmUubMA4s2XRs5IdPKN--

--------------0HLGiOBcKssu3dVnpXf9jouC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZ5J7AAUDAAAAAAAKCRDbaV4Vf/JGvXVE
AQDbCvgTUT/uTtFVwtxyvL78Dgi9SJtrs2yObqg+6MYKiwEAhAzbm6yg4758QIzqgqeGXkK62n+w
ujdH0hsoUHa3Tgk=
=SnJu
-----END PGP SIGNATURE-----

--------------0HLGiOBcKssu3dVnpXf9jouC--

