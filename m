Return-Path: <linux-renesas-soc+bounces-12369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C32CFA1A0DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C81F16D7A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 09:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8250820C01B;
	Thu, 23 Jan 2025 09:30:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABE720B20A;
	Thu, 23 Jan 2025 09:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737624644; cv=none; b=bcTeCwuROmBGxZg+s5bLq4DaH+qUg/MaeeHR1jtSz+8sOmDsOdpbZq0MfMQoM6EHwLk+qHHJUPjrD114s/gTT/imqre1bOkzCEk1g+i/R6G4FXlfAGR3FOMrI9ZFjm1Dr0RWLAMPwp1Lg96l4yq+KorYGw6NCF6S4lyPqQgHf9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737624644; c=relaxed/simple;
	bh=BsHxpYJJNdgKfsMDO0pJSDMYMsnvorygu2aT26gXqzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcG978Id3WJ3TrFO0+Up8kzZAkCmlnsOpna3Ztmh7Czr++M1Ep59bwJNIHO6bYqi1nvYbZXYI2xzAEKy75ffXK0odVUqOPfmuwqhHmcbobphRAH4suWioalVXRv0ubdnZNz1qlCgeArANLzYbYIw10CzKrjorccY9nT8QFqZGnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: giwD5+mqTwasTBP0JB5HdQ==
X-CSE-MsgGUID: 5hzCABarQzWypGRf5igLYA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jan 2025 18:30:39 +0900
Received: from [10.24.1.109] (unknown [10.24.1.109])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3D0044005B4D;
	Thu, 23 Jan 2025 18:30:34 +0900 (JST)
Message-ID: <2b3c7d24-96b1-4569-b3d1-0112cd582ada@bp.renesas.com>
Date: Thu, 23 Jan 2025 09:30:33 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: ravb: Fix missing rtnl lock in suspend path
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
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-0-8cb9f6f88fd1@bootlin.com>
 <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-1-8cb9f6f88fd1@bootlin.com>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
In-Reply-To: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-1-8cb9f6f88fd1@bootlin.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------I0aju55XMk8E0pIqXAtwz0fF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------I0aju55XMk8E0pIqXAtwz0fF
Content-Type: multipart/mixed; boundary="------------Tt0opsrKIekoTuEgE7lnME0y";
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
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <2b3c7d24-96b1-4569-b3d1-0112cd582ada@bp.renesas.com>
Subject: Re: [PATCH net 1/2] net: ravb: Fix missing rtnl lock in suspend path
References: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-0-8cb9f6f88fd1@bootlin.com>
 <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-1-8cb9f6f88fd1@bootlin.com>
In-Reply-To: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-1-8cb9f6f88fd1@bootlin.com>

--------------Tt0opsrKIekoTuEgE7lnME0y
Content-Type: multipart/mixed; boundary="------------mzxbfbYmJ1LxAofluLF0Q2Qb"

--------------mzxbfbYmJ1LxAofluLF0Q2Qb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22/01/2025 16:19, Kory Maincent wrote:
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
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

I think we can simplify ravb_suspend() and ravb_resume() with a bit of
refactoring, but that can be done as a follow-up.

Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>

--=20
Paul Barker
--------------mzxbfbYmJ1LxAofluLF0Q2Qb
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------mzxbfbYmJ1LxAofluLF0Q2Qb--

--------------Tt0opsrKIekoTuEgE7lnME0y--

--------------I0aju55XMk8E0pIqXAtwz0fF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZ5IMOQUDAAAAAAAKCRDbaV4Vf/JGvc+l
AP9QeZggjClLk5P+v+HO6osK5TCcuWnfZHgwbs4BKjgi7wEAqLgbDrOh0x8uWKt/tnhAbiAS6zun
GvD08dZyoWC7xgo=
=Qte5
-----END PGP SIGNATURE-----

--------------I0aju55XMk8E0pIqXAtwz0fF--

