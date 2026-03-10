Return-Path: <linux-renesas-soc+bounces-29165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNhtL2uksGnQlQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 00:08:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B24825927D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 00:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E206F313ADE6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 23:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9650836F439;
	Tue, 10 Mar 2026 23:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cVQdS4hQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4637336F430
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 23:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773184103; cv=none; b=OZ/sm6tV4CE6WQ25DlGCTfHFh0obl67sAYW5nmF3DkIh++qzLxVE8k+sxhTgUYD8I6j/j0yp4ZZTu8Y/Rd04Z3/LyVyZjb8Blo470MeJNixawh9e/ahDVMMu8pSXcbfY54k1IxlKz3TtFMdEIIEZsupKqUWhPvgWe5vjyuVEoWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773184103; c=relaxed/simple;
	bh=wqfaf2eTZuwG23CDujZzRmwZTxfCvmxgD+NxKTNbhb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDIEVoWNokDmsvTlruSSB00EQvedJ6p+wIDPaBbdcBNJWiJcZi+GNJ3PVOa45JzqwzsHlonpanj0YvLMXfhJ79S0aNt0UUnrcV8BhYEizAKU8fGyK5j+u5dVLmqN9jn3AUtmpOzspJzNe8LjrVMqK1jELzdo8qNrXdV1DzkSc4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cVQdS4hQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wqfa
	f2eTZuwG23CDujZzRmwZTxfCvmxgD+NxKTNbhb8=; b=cVQdS4hQD+9l6bXns4fp
	ZFQqyRYo5yOW41faMeqagSKUXduFetD4CYxyRkKu/G9y6tRyT+jXnllG5PtjA4CV
	lKurV8GZVGxQqYOJIYu/zn8+WquK/ZV/15GDkkINj9HJ9iy+B+MFkULUWYuaO/Cb
	kcp3OR0axPQJJZm83mfyEq1Tjrwjs2TLm+w5flLYhPzGk7H4QUuZy/SI6cFVcBdk
	wtpr271lj5HYKSI9Bl9wTP1E0ilTkmrcW3JLO4tSx9ZELE0FOskLf663kxUFD+m8
	lBDKGu+4iatqlxq41PWca53g/6xYSPH92cGclrtc2uqWeN2MLrYU8d5Jd8DXoX6R
	lw==
Received: (qmail 3401458 invoked from network); 11 Mar 2026 00:08:16 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2026 00:08:16 +0100
X-UD-Smtp-Session: l3s3148p1@ycMqmLNMRL0ujntP
Date: Wed, 11 Mar 2026 00:08:15 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: phucduc.bui@gmail.com
Cc: krzk+dt@kernel.org, geert+renesas@glider.be, krzk@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
	hechtb@gmail.com, javier.carrasco@wolfvision.net, jeff@labundy.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH v4 2/2] arm: dts: renesas: r8a7740-armadillo800eva: Add
 wakeup-source to st1232
Message-ID: <abCkX_oyqaa9jM5F@shikoro>
References: <20260309000319.74880-1-phucduc.bui@gmail.com>
 <20260309000319.74880-3-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9CYyCg7OPXyepk84"
Content-Disposition: inline
In-Reply-To: <20260309000319.74880-3-phucduc.bui@gmail.com>
X-Rspamd-Queue-Id: 6B24825927D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29165-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,oss.qualcomm.com,vger.kernel.org,gmail.com,wolfvision.net,labundy.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_TWELVE(0.00)[16];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


--9CYyCg7OPXyepk84
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2026 at 07:03:19AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> Add the wakeup-source property to the ST1232 touchscreen node
> in the device tree so that the touchscreen interrupt can wake
> the system from suspend when the panel is touched.
>=20
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--9CYyCg7OPXyepk84
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmmwpFsACgkQFA3kzBSg
KbZXuQ//aBkV34TZL+EFdJVtJaw0EQqMNPXoK2C9t5Yqec+JWTDz31R/1WkArR+y
z8+52bjsO5yxKzFSvXsaWi4BOq/MlUAgRG2F6rprT16cD97U37Faoe2uIFuqwfFp
vlcNVHO5Z6PWVXL9lle4PikOU073fl/8ycLlrr+WodFd/QxJrqXvPmievjWfBfsp
cpgKCiQK/Fetl+pfODIQJQJQzffn9jdU+69o33t/aUVADFXtQCJjL/77LWmom23e
LmprjE4PduX5+i0yn3iskJpOtqELiZNwJYS02PyQtu8i1AOXlCPJc1Wzgged0CL6
LKejTSddlS79ThaJVgnDYjqMOGhEbqo8yk0atKiH4tUebL01r3t7hiWHQnFeNFwZ
i84rC1kvWV+9nONBNM3cArcwzvVQfKt6m1+1W7WvOGQtvJsMDHSongAv1ypRYO7N
1hBBBg5JlhsGD9JjZL7KS4SofcEDxj/mSIUMHWdDlpD3hzRym6z1Kjpii7FY2bsr
ez0OiMynVJP7yp2tNVdez+UQ2eTz4kHMBHQlAIURmwo5zq331bT4ki8GlWlTSYls
xpe89fjhznC1wSn70dUZFWDnYhGHq2x5P9ZOGwEP3oCqgnNPgnIE8uEhysrGUC3J
glCl1PXQOAFxPbJV+3yRKwBpAbQS78eyohuD9lK9wXHyspa7Vc8=
=FSV2
-----END PGP SIGNATURE-----

--9CYyCg7OPXyepk84--

