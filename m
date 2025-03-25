Return-Path: <linux-renesas-soc+bounces-14792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29932A6EAD9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 08:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6D48188B7D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 07:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0361F3D5D;
	Tue, 25 Mar 2025 07:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kbQPfaqI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7708460
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Mar 2025 07:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742889091; cv=none; b=Nw8wcVzV77rJTec1q/sKZL+dWlDgOr7SK9CHAninWSe82NbbRH2sH4QJ/11n6B7vRf+CphL0PqKBgibGJDPDvdgOP9VW9xLzKGvz42JKzTu1KhiEv/CvWGA4CxzV1SedwJOgwG4Dpk9Feh1zhCabO7pofEdlFarI+cIOXx5wDhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742889091; c=relaxed/simple;
	bh=uDbdLw6yp0gVrTI5Xoe8EYwaKf5va/kxjisVUrf0L7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgiKya3ao298fSl9l+Xw3DZzdp+MOfMEf1szY1YMY7Q17i2a514dz3rfBOXhk/WgxbbAO9mI0yV3x5Ile4OiBFzP9HPqbFSO06bLrJibilm7uG6gE2LU9tDPGe0uuMJDXScRF6HT7y53pNMlHcGA9w2CNe2fYNmWELB9hghN1zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kbQPfaqI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=uDbd
	Lw6yp0gVrTI5Xoe8EYwaKf5va/kxjisVUrf0L7g=; b=kbQPfaqIcvqcma5fsAeH
	XBx05Kuxtj+svstjnqhFmlEm5Dimv6BtvZSECXwinPZr2992CRk8+sZ0+1t/FalD
	LGxZ7rdHQ/K783JglKler2fJi9QvXvf/lFHRCC8AWMmy+KRegyx8hH+5GyeTM+ZN
	ahQAktbRnyHd4q5r2E9Q6lSCxE2VHlsAYhK32fWiRSNrijcdxxBWwzEwyaJWdejB
	nKAH8Y+Oz0FvnZTxIJ2C4QZL/PbeqLkleYhKc/cmGbvdk7jZcPY9Im8W8h7aRTFH
	LdgVzzv57bFchJQ/9t/jOotmVmUET53k8Z6OdD5tenzu3pNcg0LtYro831v84MQr
	Qw==
Received: (qmail 2926641 invoked from network); 25 Mar 2025 08:51:24 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2025 08:51:24 +0100
X-UD-Smtp-Session: l3s3148p1@yKi9/CUxqIYgAwDPXyTHAJp038nK7dx+
Date: Tue, 25 Mar 2025 08:51:18 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	"thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v4 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Message-ID: <Z-Jgdi5_SizHzcO0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	"thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-11-thierry.bultel.yh@bp.renesas.com>
 <Z-EpPL3tn54E8KG5@shikoro>
 <TYCPR01MB114922CBDC2911E2F644BDADC8AA42@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <Z-HVD6w6ivYR6pt5@shikoro>
 <TY3PR01MB1134602E988AD8428422E820086A72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o0zyLURa42vw/DRM"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134602E988AD8428422E820086A72@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--o0zyLURa42vw/DRM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > > > +config SERIAL_RZ_SCI
> > > >
> > > > I think this name is too generic. Most RZ-variants so far do not
> > > > have this SoC. Would 'RZT2H' work or is it too narrow then?
> > >
> > > This is too narrow, because for instance the RZ/N2H , which is very
> > > similar, has the same SCI
> >=20
> > You know the differences better, what could be a suitable name?
>=20
> Please consider RZ/G3E and RZ/V2H SCI as well as it is almost similar IP.

So, I am thinking to not use a name based on SoC but based on feature
like SERIAL_SCI_32BIT or something. But I don't know the HW details
enough to make the best possible name or maybe this is a bogus idea.


--o0zyLURa42vw/DRM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfiYHMACgkQFA3kzBSg
Kba+fw/+PRZ7VzQDcXExbuLfx395bSnEEkQkT5J5qUkAJWBdYzoZz1rk/Eu9+Q1f
wRCUjlpd6axW1URvCe3cbN3kcFc/5lpzsyN6T3ObjGSRfKw9hzIcEMtomzYx/QFu
/O/GYEPzjND0QqYMBJ8+JSrPLEwbA+NvC0xU8RyBLtyUDTv7DtBkrtouZwxWKaVt
WWA0FJIj6p1cv4reitbkGEQqBnPpgD7W5sAdKQeYKoqpvVH8GfCBZi0x2HbWj7XX
u1Ge3ZOHTe98VC0mJTgI/TajTVfRUsFY+FPqn6/RSvoCCST48IVQLtjiq5GVJ517
GGT8iXwbzQP2c7z96xKpaoaKuF2QRaHaPp6fbNMj3YVKhIOLvcl97C1JxRiuH9JY
qh13iZk1LTOU/SBAC1TKND7gLiOOQ+sf34F/1l0Rb8v3Gb7vcSJuYzyv7F22PaPg
sSCDd32MTQ7v4Cmx7+KujVBUF91HZm+22gzJgm1v9F9ub5YwiGJv9lkk4Xj47jAI
VQ/o8522XPp+0xPbR+wK3bTwNC7FGNqTKpn4CKXRJgcjxs9YpXM2rh2ngdXDD5q+
PhunpQxez5OU96ifRsXvwScZM/VW1mG3JJZk34WRc/1d/Rq5dHDO/m0+KYxtE7fQ
tFI53uPXpioa/V7gxv6aTvMqhSwsfu+Y82R5G+pA2CnVJ+Gsx7M=
=V7JO
-----END PGP SIGNATURE-----

--o0zyLURa42vw/DRM--

