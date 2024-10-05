Return-Path: <linux-renesas-soc+bounces-9482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1A7991528
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 09:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D73F1F2397E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 07:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD29112F5B1;
	Sat,  5 Oct 2024 07:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PeREvLyh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4DD481B7
	for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Oct 2024 07:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728114911; cv=none; b=J0hwJZjD5vSJgAqcQGkqKn3KJBSm2+kAzSt6HYjG80viggSAniG5aQP1qbZjQ6fYpCzEQ0pJju7QC/KRIh3o8GYdswfpevKQbrt1+JVhPH3jOXgX76Ebx+pthUytDj0SL/casSnQv+H/kh8ZSNkIZtLL23V5hRSPafVly8gCs6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728114911; c=relaxed/simple;
	bh=q2fTjTZMdNeB/Bl/u6R+mkRCrCApXv+vc5BSiPY/Rgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxGNjNIzkU5L9nF9jvd4cXZWDqvI1yveJjb4nFlZgFTGPG3iXGzqvlr5d4sdvLeUnqsklaGF9BEJiFjZihaHNDyKNTlFFUAXqRCjJMucV7NFwZlHStVx89OfxpFTmh7jqznd7V3NT+R7zDz9EGkgCufM1GBgi6HkzQyAbKYMdew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PeREvLyh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=q2fT
	jTZMdNeB/Bl/u6R+mkRCrCApXv+vc5BSiPY/Rgs=; b=PeREvLyh2tx4019yWvvF
	rU8SGV0VaWzECKX66lGccDu3qCkEsSrxfdwJGNopw0h6blGBYoOvlbXHtOH6vz0J
	/WTH9/RazGHmzxg7SaReHTr+6A1ABAnhB8LhsAPBx/+hLzvXd7sorLbO3pcQGKFM
	j0pbjdMbgl2dDyBt4gc5mJ6XNB+B1x3V9qbA/LnjUHwUNXZl2OhhvEcrXiTRlmgU
	76LJKptXWWYhzsDZxSbwsXIXd8JjcgBqGuaw6j1H1fz4mB3kivX+nqKfQciJa91Q
	p4v/4lS/5XJo3D1/+ZCOXqGD2PUIOIknbw83e9l3Bp0Rmqtrdxyjr+6NEM2A449S
	XQ==
Received: (qmail 3700107 invoked from network); 5 Oct 2024 09:55:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Oct 2024 09:55:04 +0200
X-UD-Smtp-Session: l3s3148p1@xCL9GrYjGoVtKDK1
Date: Sat, 5 Oct 2024 09:55:03 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: renesas: r8a7778: rename 'bsc' to 'lbsc'
Message-ID: <ZwDw1xFbrPdjNpAi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20240926103340.16909-4-wsa+renesas@sang-engineering.com>
 <20240926103340.16909-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdWNa-5tE7CCEypD-7rN60euGEphGmmBxQeixannP4+HXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ee4ySyMCdol0Mpmi"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWNa-5tE7CCEypD-7rN60euGEphGmmBxQeixannP4+HXw@mail.gmail.com>


--ee4ySyMCdol0Mpmi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2024 at 03:57:01PM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 26, 2024 at 12:33=E2=80=AFPM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > R-Car Gen1 has an LBSC which has quite a different register set from the
> > former BSC. To match H1 with M1, rename the nodes to LBSC.
>=20
> M1 with H1?

Yes. Argh, M1 numbering (7778) is before H1 (7779), grmbl...


--ee4ySyMCdol0Mpmi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcA8NcACgkQFA3kzBSg
KbYUXQ/8DNfdnrqHKiJjQyLI4KmfdzvGJ2DpxKS8MZoQw/z91aaEm552c6cSxlP7
8+Z7yT/Vb8VbEgB1Oj33tvPtntkwG5oGDqfaS2z/NFzWWnTuEYc2kzX2JUnUdtbc
OwW402CHPjGhfg9DV31duiNBQkXplTE9Ep+dAHw3DA+uCcT27+SOl8RMyU+xBkNk
0+6MoBaxTjSPQno1xq1yO6buMeqxWaQBPCojVx0ExTZJGuIJ0aDHvne0X6aWQxMj
0j4q2zLZ9CE4MAI6I7BpxlmjPwPG1kSA4ATY+EpEWJ2B8GlJEJ8Ijg2auruQEPk1
VKpWj1Js68ukQMfvv76XaDoC91F78iHJSuHypzwO6PlYzpFCuexxpy98s193a5MQ
CWBmGrrCMeKA0sk1FDld7uF8jxGAuEHqc2Zb27KnnnEHu3GYbY0AohJzSlFf9V9b
gc3cIVUdx4owzD/Sz2O+k5+yI25N2dah7AtPMgd64YW5WWciZmL3a6amvm+CSzHY
OT6PWmifpr9nN4PbI/mUpzu8vL/8XbDQFE4VpHN1+gyfHi4pwliqANLlHcCq/TJX
2XvmTz+HutjhO0bDAUE2jhDTOwUn8lnaikphuFq4QVdwr0uzUMMVXj+HbtYOsQqo
JlgahypdKggJG6j95wrpcotsA6q3C7thC7XaDo2yrhmOWDS1lcQ=
=itIQ
-----END PGP SIGNATURE-----

--ee4ySyMCdol0Mpmi--

