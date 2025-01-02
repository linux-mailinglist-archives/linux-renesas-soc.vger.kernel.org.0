Return-Path: <linux-renesas-soc+bounces-11763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFB79FF727
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 10:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E5361881D53
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 09:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0A33D68;
	Thu,  2 Jan 2025 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="L4tV58IC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E8217996
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jan 2025 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735808520; cv=none; b=YjBrSvzwArOcM/rV1ojydzhSS/fO8u6JlU6LMmgvO+5rCelpdB0c2eR6Yx+lRBmHgh9zLyIwD4hX3RaOpN8S7Fn/HphlLklICZhtz7n69Q/BSI6lHQtXBByf1D0cejiWeZhc1oVXnHpIvg8twMi4VmEAj6vhBVypPvkXNl+M1bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735808520; c=relaxed/simple;
	bh=tQ9iKik+1vdh62SOC1kAGU9RKXy9iom2AweADUGAT1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOHSxvNItIYKOcvFsCdET5H7RlbPJ2tOdPLU6eai9p8y70m+Njj524cd9UdNHH+D5W0wzpoisnDOqXchqetq35aptM0sFuCWjTsBL6ZidVcBAQbWdeoHvscMWIEKOTBlJnTeZGKSyRw5eKB3yceUNDOlk7V/nMNEUzoqb0nQc/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=L4tV58IC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=idVy
	9nflDildKn3Cz7/1Fj/okAWdKkzQab36qGM2gPw=; b=L4tV58ICByLgm2+jK6Mr
	Hvsrfsd1RBqOSlIu74pHM2p33mDNXzuR/6o663EEPCE9zwgHD7zYYhc4uiJSl18S
	0ICP0IqMNRJHzImLvByzwivfUciRO0lP8SGXvIEIOxXTum1OEJKoxOUhOAgGFP7d
	Uifr2IwltB/QWDjoEIPVxjfL2gXkTelxoU4+FPWeCvF0PZ8865zOpq8CBYpDI7nz
	nc18zQ9MDQb/QC/GMV3E2JRktBNIiKXdMEhbNj7wQ0Vj2udMEc+V1SIJkONn4gKN
	NowUsOv4NTVRgplNsd20AjNjedq7Jc6fsVnVI2RzDFaO2u06+cfH5ql1Wf5X8RHA
	Sw==
Received: (qmail 566898 invoked from network); 2 Jan 2025 10:01:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jan 2025 10:01:52 +0100
X-UD-Smtp-Session: l3s3148p1@V87LabUqluwujnsY
Date: Thu, 2 Jan 2025 10:01:48 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
Message-ID: <Z3ZV_D5AIUxFR1Bw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-5-wsa+renesas@sang-engineering.com>
 <20250101121431.05d831c7@dsl-u17-10>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dXJvEpTHZBt+iica"
Content-Disposition: inline
In-Reply-To: <20250101121431.05d831c7@dsl-u17-10>


--dXJvEpTHZBt+iica
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > @@ -123,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_=
hci *hci,
> >  	dat_w0 =3D dat_w0_read(dat_idx);
> >  	dat_w0 &=3D ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
> >  	dat_w0 |=3D FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
> > -		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
> > +		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);
>=20
> NAK - that isn't the same code at all.

But the same algorithm? Please elaborate where you think the new code
will fail compared to the old one. And frankly, are you aware of
different parity calculations? Have you read the link which was in the
kdocs of my new function?


--dXJvEpTHZBt+iica
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd2VfwACgkQFA3kzBSg
KbZ5zhAAob7Y0sqPuY/wfQbTgch2x+PU58hHwjvNs0QZ/hmPo/h4l2g8Klied6or
g0QlBPpSRZ1hZSotK2rwlbNtC9aRyGOi8kn39EjiN+8utI0G4JOkXxOuwn+x+mom
rmy7Nh2d03nNcYCk/EIB3WCEMMSlvJyoGYEJ/EK6N7voYTOjPrIzTpKg2nc2EmXl
jtN4SkjBtE8OnzNAfz8OpcdJlYlKvL2AL+4okn52I+LbwV95AXxd2JsQmIwWR9HW
qkQjKiR/vEaMEvWw5iwFZ8PYdFpaZ2R5QZwJRC7r+Bs7cq4mSQ3Q7ga1YLDtCbwM
64bzm+qj5X8hVTvCL5yVRGF1YYIHNnSymagIyb7/1JHdeteQqSjCu0/8xRSEcrZa
VhuyrtZzE2n15WcbQv7377vXilSnFF0K3OoZ3XLXyABN4XeqWTmrCeCQug1f6UQ+
pQnq89Xy+I1cMSgDVFUa10khxzClWSjepZdOIeDLpQXjFlxDFUcDp6/KaARzhvpC
oa5xPCYOOX1uTmBnJZlHYI0rQieteJ4FZCtar5Z7D0D7GuWiFHQ3DJQUlHP+2eTw
ZM3p/XvgSRqXFVRCdD6ZlPJggn9cBmiWFNxc2VHgi5JJ4sgQXhsZYVfdeilfGYSo
evpYXwUCFlHGheZQLrYebDddJTQIm6UdcExJZCFqpESmx5wOGcs=
=6+IL
-----END PGP SIGNATURE-----

--dXJvEpTHZBt+iica--

