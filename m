Return-Path: <linux-renesas-soc+bounces-25915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EBACCF848
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 12:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7557330167AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 11:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C96303C94;
	Fri, 19 Dec 2025 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nG/VMczH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD27D302146;
	Fri, 19 Dec 2025 11:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766142261; cv=none; b=O//S/jUPAhTNZo9IZZK5CfgLu2IJpqtmaalNW8/7FTHMCC2YilUb6ZZ02bXSUyEzu7Eno3e+OzVjTtJAf7bFT7FbZrrsKKLR8Oi+JbSUn8ATtncwSm/Z1c9dxAq9I1TAGu7KBrrNN1s10MFkG7S5zzxYZpLgmxBNM6DugEGQsnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766142261; c=relaxed/simple;
	bh=kM9rqO+k4n5tn6iUhIYm8PySEHfSSmGX6FihNL7XdfA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m2HIyPQesW9W/5EBdokQucd1hqBg8uWNTIOH/rClxM9JYVs6nQJLFcb5S9bFY5gi1IC1NP4HbwxPRc+lAu9tW0PuwdqDLUZwlX7RDXj2O5AJ+g2wD3a6lBx0ji7JdTYipmGGObyTblECrpZiM9uOjxlHlc9KXPwtGfL4jAMDB+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nG/VMczH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766142258;
	bh=kM9rqO+k4n5tn6iUhIYm8PySEHfSSmGX6FihNL7XdfA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nG/VMczH2Z+8CQfEUrBR/VXVSvt/pOWn9of4OV8hHMC1J/atIKWw0xdJieU4LlueU
	 BgTCCHAPYIuk9vfBkM9AtohSjcEDbAVAZKfVEPcI5y0nwPedigzysUqzxeVZQuSbPD
	 /KmQ4J+yKtKdJy0gvx19JKiLoUWEwpAzmupvp3bS0eOPUEffCyQKlcbEMIPgz0Cp2h
	 8A+o01rxJuJnsEC2RRiW3zfGGDb2hxdpO50376MuRcCkoULKeE3drw5fYEoqmKojU2
	 ihFBMByS3JDtCiOFNJN9yPAA/DyJ8b0/PfniJERUKqNa0+5cyUTjwpf8eMNJDKg78y
	 3QvEP14NtTxNQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8949A17E0184;
	Fri, 19 Dec 2025 12:04:17 +0100 (CET)
Date: Fri, 19 Dec 2025 12:04:14 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 "biju.das.au" <biju.das.au@gmail.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
Message-ID: <20251219120414.58c89125@fedora>
In-Reply-To: <TY3PR01MB1134676D5905B0AC0127955DC86A9A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
	<TYCPR01MB11332FE6BEA86E8FBBD4707DC86A9A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
	<zdeak3e65wt2jw7n6rcskyeokmyt7cxhsrvwaeqodp2yjxw7kg@vbqza5hpnrym>
	<TY3PR01MB1134676D5905B0AC0127955DC86A9A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Dec 2025 10:13:45 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> Hi Adri=C3=A1n Larumbe,
>=20
> > -----Original Message-----
> > From: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > Sent: 19 December 2025 10:02
> > Subject: Re: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
> >=20
> > Hi Biju,
> >=20
> > I'll be merging your patch. It'll be my first time as a Panfrost mainta=
iner, so bear me with me while
> > I become familiar with the process. =20
>=20
> OK. Thanks.
>=20
> FYI, I just use the below 4 commands based on the documentation to merge =
a patch after the initial dim setup.
>=20
> =3D> ./maintainer-tools/dim update-branches
> =3D> ./maintainer-tools/dim checkout drm-misc-next
> =3D> curl xxx | ./maintainer-tools/dim apply-branch drm-misc-next

Or

# dim b4-shazam 20251203125104.67596-1-biju.das.jz@bp.renesas.com

if you find it simpler to pass a get the Message-ID than searching
for a link to pass to curl.

> =3D> ./maintainer-tools/dim push-branch drm-misc-next =20

