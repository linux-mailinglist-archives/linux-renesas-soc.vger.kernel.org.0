Return-Path: <linux-renesas-soc+bounces-18288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F38AAD8CDD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 15:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9BB41E37AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 13:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0D115A87C;
	Fri, 13 Jun 2025 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LWN+jg3E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C853156C6F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820259; cv=none; b=ZvcBZeOWc2KP/u0FeKi7IxLaPZQso8mWcTE4PxblqDyX1vGz51vklvI7w0wyOE66Y8dFF3ifpSipJbvuGfZIJIgNqMwWiUh3TD3BRAK3Pd3a8juekKWIVQdP2zcmN4ym++h0XTiTMjJKhQ6Tyv5wPO6aFwVgIf3SWPBSnfF0x3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820259; c=relaxed/simple;
	bh=l0VgyYB/ZSw1IAdEkULqtGq6LH1Skbo3zycVkQRMxtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJQTCCEi+TKXZ5wOvSa4pmzbvaUgYrBtZQJcFjBsIH4mps/zf1zQsrwSYFR9bfvBo02CHZLEm3EpKp9yjLc4uBg+ZYldDnJFUAfbUfKxPl/8b+4vWXbpRJPxMPWUWFzH4TTZ+FIdGiBBxa1n4bK54rljl7oMchd1Fd0q+Hqlimo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LWN+jg3E; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=l0Vg
	yYB/ZSw1IAdEkULqtGq6LH1Skbo3zycVkQRMxtI=; b=LWN+jg3E2eQbAW2r+yhd
	O4Bpm/CZgezWtgvbbg1GNKBXfrJPM/qTnHcQEFtjknfjQgkztR2GXyalOYamHmVg
	JENDJejLMPtmZBLjWw6BCK7dFMFcsrI1vc/TliFCj/3sKT2iXN5X0UGbuTwyLl8e
	Q0tKis3epiKb2rxmJELqM4eRUFhA3Dl46nDEUX36/Mss6vi48usvrGBBaL4SbdUs
	nFpHs0EAxf85QbBTgrQ17711Z6VsW6X03T6YQCLPvD7aXXakX2wkvrfS6/aiEySN
	8+juIEnVcKdUHPJoD5EUzaZu2+AvVYK14rfaeqTc8m8rvBrgiF71iRE180BrSmLD
	bA==
Received: (qmail 245682 invoked from network); 13 Jun 2025 15:10:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jun 2025 15:10:43 +0200
X-UD-Smtp-Session: l3s3148p1@/DwExnM3jrAujnsC
Date: Fri, 13 Jun 2025 15:10:43 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
Message-ID: <aEwjU-uq4XsNzrOO@shikoro>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com>
 <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro>
 <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810>
 <aEvyfM42WTKENbFO@shikoro>
 <CAMuHMdXW_4gHSTo0roNUpBrq2gLVBK=6zY_=rhh8OP85KJdqTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X+Zw/Ma7TThVuQ+w"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXW_4gHSTo0roNUpBrq2gLVBK=6zY_=rhh8OP85KJdqTg@mail.gmail.com>


--X+Zw/Ma7TThVuQ+w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Perhaps your overly-long Mail-Followup-To:-header?
> When replying to your emails, I always have to prune the To-recipients...

Let's try if this comes through. I told mutt to not add it anymore...


--X+Zw/Ma7TThVuQ+w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhMI08ACgkQFA3kzBSg
KbYZIhAAg15c5Y44NP6UIZb08GFS9r8HIOSlt3EgKq3SlKYplf47YWrNic/AGYCo
bri4irl5GndW3ciIjD/wEA1O6l1wBV2NC6ebi1fcoImqAwVB6RpZa/5CtRC1iIim
YUrXnte0RfKpcKLWBoz/40Q32sSM7Muw+w34d/rEsPEC/dehtf2ePOsjrWhSEP95
y/Qd0T19GVW0py+aDtqyXSwW/50PgWzDD2+BeHiMliTV1+XO40DgxCOJ58zWKtdq
QtDvI5JwK8yCEayVea8TDZ6oNiXjfHIPpbkmYJGAU99DepSNI/aaXaLi+G769ju/
hsDmlRHYAOn833tI013Bal1/qeWD3/GxRlOUKucS7+6Znwyq9tc51JJbtWFPYuad
/TuGwXJzqtTs/dpkIiTOlC7saiJCY4qqYhroyHqN1ytCSyMPBorC7LSSSjuk6Kk4
uJlAR+feS381I/URq3DAwS9aDBg7Z7INHFqh3Y/9KOjZ1U2wSsQaOuYY26XKsgb9
zMkmmWlD5F8sOY8pve/JdaKRphMRHDz6I6TQJ603S0dkmJyTPAf4rh5Kji4dzG27
b3f/lSeeQ7vlgmtP8xk2G4CRQoHWtQi6/jSk6n9dUsiBlSDwAOQgYe4HLz/RpKUy
QuNxGppKdSU22gqUcjJqvbT89Q6AnnGJ8OKs2fN+SidwUknFxuQ=
=5whn
-----END PGP SIGNATURE-----

--X+Zw/Ma7TThVuQ+w--

