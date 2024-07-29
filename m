Return-Path: <linux-renesas-soc+bounces-7605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A4E93FE04
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 21:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 710CC28393C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 19:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2B2155CB3;
	Mon, 29 Jul 2024 19:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FZPqNru0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DE61E86F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 19:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722279719; cv=none; b=JXrdtbDlN8XGrTyODceQWJGqZ6QkHJSXro/r7UBdBZW3u08AbktAaB0yGuvCp7PAdCfTabs9sH+hZfRbUGAR2rZhBxBM3EPr/RHerwR5xvzsEjJgHJ+KrOunxGnH3XqOFXmKkjma4+teSzYDc5poQRuSjCdT57L9FP/IoOh8uec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722279719; c=relaxed/simple;
	bh=O4Ao1SQZ5jdMrw418CWUedens5gdkwB+IOY157VEnRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlamY1VBXBwoSQ3+HL2LssHJq7XXc+K8MraXAyGHA3dRHuShLz3gMUiIWx3t/xl7Qn5ThDcXEXCf/2Ax7Ph/AelwixVlCDAKGs3lVbBg+zzsauz+wVR45Gg50WAqtvFRKMJJad7sBvhwGqH1HrUSBLqouMUrmYxuCrNrmxI+81s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FZPqNru0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Pu7r
	5eUvvpDaAwNJS1nD0Rz7pwRicIM3/hbO+NBl8Qs=; b=FZPqNru0oW0iRA7lGgOf
	rMo50GBAoJRgzQTMQRclDMG9jCoGDoMMUYPnLNgjDpQRHoxc5Qxqh866uX5p+HxA
	RJqr7gtsGcMgy8EobQO/L4NuBY3gJ0Pcys/SGTLC0SKa25BltaN2hlQuuNCGCBP0
	GB23zVFoguJ7g25yTvRF84pkmPIkOC/iowyZfZ+TGcLF5zpTFSuyJJCQvmv8iTRt
	ZL+4gkBtrAUCMVvINLB9I2YQk+kALq5GAmOq0or+mfN0gkpQ/xwlwO0p+9Fgxx+F
	0SqkCrCbyTmLnU1H2UguUZECGQwoqZZepOkBrQv43tv6D2trCA+a//bxVJhkIUBK
	Sg==
Received: (qmail 4187158 invoked from network); 29 Jul 2024 21:01:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2024 21:01:54 +0200
X-UD-Smtp-Session: l3s3148p1@Kn6Qfmcek1JtKPNb
Date: Mon, 29 Jul 2024 21:01:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFT 4/6] arm64: dts: renesas: r8a779h0: Add TPU device
 node
Message-ID: <ZqfnIe-2azyQ3thw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
 <20240725194906.14644-12-wsa+renesas@sang-engineering.com>
 <CAMuHMdV7Z0i4HnN5dsPB2rYiZBfCjZaLic8KHXZ_+eqDkTASDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S+dJDlHdAlEWdVPj"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV7Z0i4HnN5dsPB2rYiZBfCjZaLic8KHXZ_+eqDkTASDg@mail.gmail.com>


--S+dJDlHdAlEWdVPj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 08:44:33PM +0200, Geert Uytterhoeven wrote:
> On Thu, Jul 25, 2024 at 9:49=E2=80=AFPM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Add a device node for the 16-Bit Timer Pulse Unit (TPU) on the Renesas
> > R-Car V4H (R8A779G0) SoC.
>=20
> R8A779H0

And V4M. Geez, where has my proof-reading gone :(

> > +               tpu: pwm@e6e80000 {
>=20
> Move before spi@e6e90000...

OK. Do you want me to resend right away or wait for your further
testing?


--S+dJDlHdAlEWdVPj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAman5yEACgkQFA3kzBSg
KbZCzA//VQ6AzN8uSAbtnd7r15EGBuP10AqYtF6E258uFrzPo8WqbU5M1uCAIs0E
sy/sUhzcRYvYylrGQSx1kfte0qz1MBkwNW6HkLdvNpg/Qz1X5+YDNxW8hjkQZ3Do
j/L6cQdiM782KzBv/ZAVfoXXHx8JynBEMWuCgXf77F5cpVPgI5PYngSvJ/6UHa9S
+kMLSjSiCdF6A1SrY4hdbglwtFcBLUSXsRxCrdHJDLW3ILvA9kUETIqYGDXDtdiE
NKt790ZbmVuA6ldN7ZjoFLatPGkz8my09SwGoDK/oIytrep1YbRZ6CGVJl1+noZM
ax5mW2lr0kmbIdK6CuIUgq/ya/r5uwAnHQTn9mMZehlCbAocZh/o1jwq5HFwd2/v
hLfEcLLvzEAwVXonDB7KhjaGsvB70b9as4jFB6+9LweDdh6YQaK8YYegvINdGQgF
dT/8fuHk0/x7ioJ8JHqOMqlb3HML6/XVQb+/5jmwMI2K13KZRyoJ5wwcIfwOwj+Z
iB2Uh2bQjqWHrBMoXyxX55y+K7FqkwAvumbhFqOuSAE/yoJMG9c5UTPaBtlzaW9e
ecEc8RHwty86ugTDDnM2/iX0z8iosvi/j46i5cyXTbcSMzp4RYZ5l0xvuz+JHd5Y
wJ7lbj7F/ZZXA1wqeL0XK4bvzBFWUDqe46x2Fut1ha98S/AN3Es=
=/Hz9
-----END PGP SIGNATURE-----

--S+dJDlHdAlEWdVPj--

