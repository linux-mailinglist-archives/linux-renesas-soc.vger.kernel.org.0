Return-Path: <linux-renesas-soc+bounces-33419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIPcMGu5HmrZJgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 13:07:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ABA62D237
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 13:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A00C304A7A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 11:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A133C388885;
	Tue,  2 Jun 2026 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Cgw5+mSH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792F6395D8C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780398192; cv=none; b=nQJgyXoMo6ciY9ZFSm2UZQWBkvfBzKChhSQ09ntypjjnYlqJe/jXgkxpTzhfJQxil6pxdGB8yfSKYhSfoiwz0DtP0rlszGPKYDVB80WvnaHLwdL/+TzThed5Rmk8bIH7BUiEb597FUqaGdTkjT8qWNhU+/GYcKV01lQTxoPAKeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780398192; c=relaxed/simple;
	bh=iJzGnyRLwsxHH4s41J2VuHW84Pbq7X1/Onyw00BlB6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjR2E+a4FgOZBqed9qYMQej/RpGfEVzdBoPnqv677289EzOXnxr3iOidIO146kOh2KFVRyDe79s5lBxwUjljXctxR1p6ZdHkX/cyeAKrwfmKI17T6+XPKJmXLsdaUp0Z2yHpCGC8ymAGiHtOiyrTw2/84tmkbObAUl+5RjIumk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Cgw5+mSH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=O58A
	IA4ZdiUl4I2/DkiC9LBTCIlTtcLsjIsPJCeYj28=; b=Cgw5+mSHosiijmagAa02
	mphk1zWFbZOU1zbr2qeIBSVDZvNFIO45f53S+tl5mPKngjuAr94FIsptTN67EiBo
	LPmbkT+aYxEu664WwBj6Ky2TSDHvhm9WwvlJPLWXXeCuXlzNMOwfIGhbH8Fd8Kcj
	QLyfo7lO4u03pJgUPUMwj+twaVaMt1Y5v8JQ+CoM1s331KDEFYxPnYewPTYyMu/L
	6VdQzjTsbZ3QCJnONQIkPeIM+qAm2tV+6IHRKMpiVcJGZMs/mgm2Tw1A/pi3Pbht
	dkS4JxHg0cGN/jFbRVz4ug3fy8deh1JOu2eMtjjU+b1tBycdIoFp2H4ClJ5utDd9
	pQ==
Received: (qmail 2857182 invoked from network); 2 Jun 2026 13:03:00 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 13:03:00 +0200
X-UD-Smtp-Session: l3s3148p1@N9ISQUNTvLcujnv7
Date: Tue, 2 Jun 2026 13:02:59 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: renesas: r8a779g0: add MFIS node
Message-ID: <ah64Y3fuO2ofgsDG@ninjato>
References: <20260530080340.24715-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdX8gGvjTPat-7=r3q-bXgQJU=A2DsDEPXZy6k20_JKx9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X0II2Dw27eDwVkdW"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX8gGvjTPat-7=r3q-bXgQJU=A2DsDEPXZy6k20_JKx9w@mail.gmail.com>
X-Rspamd-Queue-Id: 45ABA62D237
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-33419-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,gmail.com,kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sang-engineering.com:dkim,e6260000:email]
X-Rspamd-Action: no action


--X0II2Dw27eDwVkdW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

thanks for the review!

> > +               mfis: system-controller@e6260000 {
> > +                       compatible =3D "renesas,r8a779g0-mfis";
> > +                       reg =3D <0 0xe6260000 0 0xf000>;
>=20
> Why 0xf000 and not 0x10000?

The sheet listing the memory map has a "MFI - Region 14" entry for
0xe626e000, but no region 15 for 0xe626f000. I thought I play safe.
Can change if you want...

> > +                       interrupt-names =3D "ch0e",  "ch1e",  "ch2e",  =
"ch3e",  "ch4e",  "ch5e",  "ch6e",  "ch7e",  "ch8e",  "ch9e",
>=20
> This is way too longer for a single line, and the double spacing
> doesn't really help (yeah, it does align ch1e and ch11e...).

You are right, will fix this.

Happy hacking,

   Wolfram


--X0II2Dw27eDwVkdW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoeuF8ACgkQFA3kzBSg
KbYNPg//etTWAorgY0vWDPfjdJ7sK5zFG9jYQaul2hufRkx5KMu+lGZj05yuYVDa
DRUThc7thAFvnYjHQpyRKkarnlmXxD13aWiPZcmR1Ckruwn2/MoI8Nib5qLX39Ik
L68DNMlCstZZuBB/ELm2TchZq77W7EaSKXetej1o9+D+660urFFxNkCRYD4b3Au1
7e7FpGRROzCLG3UoLozYLpg0dSuwS97t/0Ov5EL6YeAHwdyXsHL9cwZvDqqpQPf2
KOOz9sZPUxpPXer9Mtdoqmwk7RLEq0Jsu9Q+XGWmFVf0vGXLe7JypPbPPLxgBXB9
TeyiUa9NdjrD3PB4nwQYhrA+q25GOutFueveRACwes9t7YsJMPm9JoPuoNqOEpOX
NbeWX7i2XkTdkW0WDMByXF1GnY7kPfm50eB1q0i+4NjWShsTgljymhKHK/cjVDpR
HunQjXXydDn59lNJzTu8iOA0CVNIjgrextgkPoum7sey8ma0GxnCPvHZaW4ZNK8X
xZoKly+cVAlHtcIRr+ew08l1Lmru0IKRH6XFbz2GXaxSgbOkWQr6DN6cbTvhdL31
eWlK8CT8SOECRQ2voiPCOWPE4G0A/du/7BfvO/djXPbBX0yoCDUs++WxI/x5wHx2
/J0qb3ydw3M0r7kL7UoujHSURrekr9fPw5qmQ641fwYeGrabCgg=
=IhjB
-----END PGP SIGNATURE-----

--X0II2Dw27eDwVkdW--

