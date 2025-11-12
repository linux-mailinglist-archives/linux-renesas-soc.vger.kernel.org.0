Return-Path: <linux-renesas-soc+bounces-24520-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2435EC547F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 21:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7307E4E2ACD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 20:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82DFC2D5C95;
	Wed, 12 Nov 2025 20:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NEMyVhrf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294392D5944
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 20:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762980055; cv=none; b=ok/4qNRlvyaYnR9bxaExRl0HtTztAMdBOPTVlTalVYtOU3aoyxCZptI6QpqyKvAsZ12wxpqGpr8a1krYP+DLpKGoZgr1WEaZiQiLsaLSHjbfTAzLl+71vnaTcLD5HWorqDSmQO0DoshntM9Gc8E9PVoTnvHGrh7IZR9NJrgeCXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762980055; c=relaxed/simple;
	bh=MU/t7yDIQVtRLPS83A55ASI5JupXfSZAZodZqTb2m/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bADKNhcgxT2CodIFgg07aIq8fNG4OUqwDt3M6LNTHKSGO+rm1ur+TzjvuIFguN/arvRWtuCNHPBo8BLfyd3ioIiq+q90XDG0OsQIjO/KU6ZXb37KMe9f+1DItAx7M/bVxC807NDZrfhuMLrsE8Lxyt4iGJeFfZmO62igcqJ2fHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NEMyVhrf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=oeU8
	SWMoK2dOcr0D2fwl4bR8PvyNTGqF9TFmyF6ECoY=; b=NEMyVhrfXx+MFs3sDVtI
	2xSP2bS7Bwa75wbMjOAqYaSyWqjhNv22Lqu7RqAHcEJp9BhceEh+YXMYZz/vE3um
	fcdvlzQ5d6u5NKP/fMWT+wxRCj6fFxUu/duaNOSa8438A3NVBuGWoLcwDsL+qynD
	1gaDTKW4CoUamW7BtpdFaTsuaoISZrLTW/BdREO4QEXu+Or/oXSWl/1MS7AEGslg
	o9io56kpL+nQn+no0j2cpvpX2hUdWRwSbI0lmcecbpIRX/BfjoSlNCw3e/A8i4bx
	eYcRjTBIqd2HA+9WZu//iMs6cEzuFXSYxioLoIdpgh5rsR9I1KUT1Z/kohtTyIpx
	YQ==
Received: (qmail 1633650 invoked from network); 12 Nov 2025 21:40:48 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Nov 2025 21:40:48 +0100
X-UD-Smtp-Session: l3s3148p1@0QmAx2tDtK0ujnuk
Date: Wed, 12 Nov 2025 21:40:47 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: pcs: renesas,rzn1-miic:
 Add renesas,miic-phylink-active-low property
Message-ID: <aRTwz5QHq9U5QbQ-@ninjato>
References: <20251112201937.1336854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251112201937.1336854-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1OKIy6xsYpTTCgv4"
Content-Disposition: inline
In-Reply-To: <20251112201937.1336854-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


--1OKIy6xsYpTTCgv4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

> Add the boolean DT property `renesas,miic-phylink-active-low` to the RZN1

Hmm, we already have "renesas,ether-link-active-low" in
renesas,ether.yaml and renesas,etheravb.yaml. Can't we reuse that?

Happy hacking,

   Wolfram

--1OKIy6xsYpTTCgv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkU8MwACgkQFA3kzBSg
KbatnBAApDm5EFhJq8XaJ76HpXCw8qvC4tnoIVIL3aJ093m+TbqQrGVQt4Eor/tY
YMD+yRVl2T/GPfdykrpGXIHb/ecu6OF9Ex5XdTcFBOLu9Xv2KIIscWYOw4FShrA7
545vB6m8YRIQ2v4YREfNh0hBhpFWPkydjW8KM7KGqOTMtQQVj03o6b06R+oKw2T5
YsRwjt54lbHXWsa41yxeIFigCJq689dpOFUdAQa6NsZ+bMehF+um0kHwjls2uV/+
WiU6fvRJdoY+Dp9bhiSW+eoE4QUs1pxkKi83LO+5yK25Pce1M+w4qpHOnFGNrpJY
dDIPJRabCls7r3NEgF5CkjxAy2xQkioCGyyw3W+yryqsARLO2aV719H2wRQcHFlE
Cy17fWvtQiI/4IAcFCJwV83fYfxwYJ10ZFtoU2v+YCaPSyvqX9L1tdj5qBO3gWr8
9QnmfAgWFqJvgH2Wj2HE/2shdwvi9sBOGjEenC+C3hC64kX/3V5Qq0O0OceJbmmB
IRoZgzaYqQF4ylxJrCO+f9xhi+8s8jfcyHGvQSHSHXUU2w3HS5F4WRmMtVdVRXLT
yq3PnhpDJSCSvf8WZnDS69dsvGqdxGGD3AjCn/uyX+jvkom/H5SOE+zwTdpmngJj
5mlolfaguWmeWN1bH7yRzvo7tLUbBVtiFmnYrVqWACkrk9cqK0M=
=jh3m
-----END PGP SIGNATURE-----

--1OKIy6xsYpTTCgv4--

