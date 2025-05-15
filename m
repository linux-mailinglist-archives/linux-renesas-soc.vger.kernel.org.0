Return-Path: <linux-renesas-soc+bounces-17125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D27CAB80B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 10:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B319C9E1A14
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 08:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560AF28F95B;
	Thu, 15 May 2025 08:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JB1P3ilM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FD728851B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 May 2025 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297667; cv=none; b=IPrfATIkuBhr5q42zdf1kjsMJo2pTOU6vZeeElG2cMl323Bwd6i5Lkan/V9v9hoJqFlRlP5tiBN8sF7PUb5VuMs9csbJTVY89rjBco20Bmds3/gxKn538WJamLIG2LXeQCSsQwaKF73hesU5zF+n/zhCjJCNciib1BxyuTSLDvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297667; c=relaxed/simple;
	bh=8R6vbFvAWn+vLWfuCaXcyYEuAwlTuACOH/BaBbGGgOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5X1oRKJ0DVUqncio0sikJVeySSkDYUR4BXtWb2HJb9hGu/k3qs9dYILN8vqi84g5qiDC561I6ldDbWCvRM3sT0VmYKxNpESZTRus1pAfL5HGS8T4avO8DjGNtiVSkdKgATEyeLz2gyGupGqKOznjoFigKARsE35/pxoaQJa6zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JB1P3ilM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Eruc
	HhXJNmx4sOCir+O3Rsk/9zSM3xhzHVd4U6PR5lw=; b=JB1P3ilM2Aqz3CnDbZdj
	q7ixGqiyZUtbdGRUAtGEUBPrb/wK/ELdA/ymH6qg2xNnlBj5qYterqQqtxqsSrpS
	cTyhscCmUJW+5rP4/0dKYuGCsYV8why55VdgH+k2wGLJaZ2HXs3vW4SwduaJ4zlI
	BMfQLKQJoZC7DTsZE+WOvURoxciODSyCW1OoaAHZ1IDzNDAI8mhKqKxMlN/d3XBi
	Hz5TC+ppMhETMOv1cCdy1HN3Y2FTIy9+yjiPProzuS9aarRIc1rdKaRgFmrxt6jy
	7m4aBHbrSdeXttc31k0UOIr8Rra6dxrl6mODRtdv+hpXJx+Dab0j0oTJZjVinejl
	gA==
Received: (qmail 962370 invoked from network); 15 May 2025 10:27:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 May 2025 10:27:39 +0200
X-UD-Smtp-Session: l3s3148p1@86VLcCg1CIJtKLB9
Date: Thu, 15 May 2025 10:27:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe
 Debug LEDs
Message-ID: <aCWlenAtx2uaQhcE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	linux-leds <linux-leds@vger.kernel.org>
References: <20250417093256.40390-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWN-QDrmogJ+7x8sdc6UmDAoF+0z0hZ3SQ7ajN2V2+mSw@mail.gmail.com>
 <aBxjvofZCEi_1Fna@shikoro>
 <20250508134930.GM3865826@google.com>
 <18b78845-3f01-444d-835a-aa39f84a2689@gmail.com>
 <CAMuHMdW1Hn51R-6MstS1Ojuu-CR0eNs504YEruPbe2L-H_zBHA@mail.gmail.com>
 <ebb257c6-33f9-4841-b9af-c2744b59e513@gmail.com>
 <20250514152852.GA2936510@google.com>
 <a26c7cce-df72-47a7-b501-1b66faa3e38f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+i7sqI4eGqmbCv7b"
Content-Disposition: inline
In-Reply-To: <a26c7cce-df72-47a7-b501-1b66faa3e38f@gmail.com>


--+i7sqI4eGqmbCv7b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

thank you for providing all this input. I appreciate this a lot. And
please excuse the slow response. I am currently at the EmbeddedRecipes
conference which needed a bit of preparation on my side.

> So the node would look like this, for the pca1 LED:
>=20
> led-1 {
> 	function =3D "pca1";
> 	color =3D <LED_COLOR_GREEN>;
> 	default-state =3D "keep";
> };

This looks optimal to me, if this is acceptable. I totally understand
the advantages and desire to unify LED naming. The main problem for me
here is that the GPIO-driven LEDs have no 'device' part in the generic
name. And only 'function:color' seems suboptimal for the board here in
question. I kinda arranged with the option of using "LED_FUNCTION_DEBUG"
for the above LEDs and some other function for the LED on the carrier
board. This seems OK enough for a development board, but ideal would be
the above solution. So, if you can live with the above, I'll happily
make use of it. If you want me to live with the different
LED_FUNCTION_* solution, I will survive this as well...

Happy hacking and greetings from Nice,

   Wolfram


--+i7sqI4eGqmbCv7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmglpXYACgkQFA3kzBSg
Kbb8Kw/8Cw6I8UoAweQrYCYIbFSiWod6rfhxZ2D/pntw0nP1Vb9X1U8kqFpZja4v
LddVBFqZMrEivczZ+v8hQG5JXGRUveRiLVmxFHtb7ByiKioNIWHZChwKZiF4nApt
M0HsPTum6VIThoUk8y4czczDdGUVA+wpD8wT829YsB4A3V+zJprhEenRutszr+G5
xi5KqyUkGkh0ZWTAU42IKeCCzWt3FvloD6pk6rmbjVBT8aTnkTOZGz/3KyVq+FUo
jBiDxLp/iigRo7n6gqmJCwvtrk0T9I5W6CGZNFuCiYvZb6EfaYTPro4J794UPXSp
S2i6F9MqytheQNUuYIlOwDETdkmvbqtw6fgd87LZJfDnfYBUoo660hSHm5LXu6ef
HF97XL6D5YanAv90ElTG5eMsdxPl9bTQmMobzFqNtlKQ8MbqKtTGaZaUvk0Gmkit
Iq7EXB82BY07ZeP+JHitx8BGKU3F+jynhPBJ80quMoicvmGdfBUVIZ91gfhEkZPW
n0BuRffUb8Pgarz8pYwkMudHCpdBD9bOYbipUC9Y6RyE11ISx2RXHhKK3TwtbIV0
xFYRl3AluEdD2Q4U4cc2JhVlRGLAhjwOwM7EiQLAEluLfEknx+1jnbU5zQHR/j5u
VfXIwj9oIxMSb2CM+bJMkha5jB0v0Oa/K3VrB1fUJzqiC9U+qjk=
=6jbM
-----END PGP SIGNATURE-----

--+i7sqI4eGqmbCv7b--

