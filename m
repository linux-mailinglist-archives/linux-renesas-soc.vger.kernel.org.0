Return-Path: <linux-renesas-soc+bounces-15725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C725AA83D0F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 10:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C93A7A86D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 08:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9F420ADF9;
	Thu, 10 Apr 2025 08:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ms0fFMGT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCA51E833F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744274014; cv=none; b=JC4dnR0u9QivWmFon+xcC1EtybHjP+qcNqKWOlMauhKL/+J2HTMikQjPq9246KsPOJkX0E5opIKT/tTCQ8lbroyAkrWkck2Y0UZoZMtWp9/3lUwbFwVvnlXIQfJrOTnpYydxtojTBdGi2IwWgw0t42J7U5A/LaJvzans60Mckpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744274014; c=relaxed/simple;
	bh=clbT7Rpxg8FTLrjCtHscX9yBn69l5cFVOPlj7r5XSxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAigIA3PespMMuTqeF5rBb0WtVge/+3BbZ1cbypSbv8MmyJaVn+JI3vNMZR3vfsE1bNVjhLAZkinkQSSw4+fScYQzPFh9If9BAlgPqPUjtxS8CSe+qithbTC/CyjgLsURtb0sLYiJvl5lj4JXjzT5LFzsDnhx+QPYwEfqIsXdxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ms0fFMGT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fbDj
	bV2OkPZpVU8Z0SPcJP1FqdfVUUdC4pTcB+aFstg=; b=Ms0fFMGTUvuYO1zE1Jcg
	N3BTKOAUS/Zmpz2EhDQOW58spLVXktBCwnsgbkUC4hUBQrRbaBmkJxeZFigit+Lq
	NePi4VBoLD+4Q9USjUD3/pm9mWKWDu6ydDJUbtD47snuvHl/1tUUrvovemVDF6wi
	Sw1DQjg1ef+JWyzIrqqVRUwPPCWoLdkV23pC1bkw6DY0oi7y3nXOwrcVqZVRq2Xz
	3o1eCAqBRU31HDyZU960LVSp03y/9FYMb8QZsiF0VFw0Vi78aR1hCNVGWZ/oalzn
	2tDzjUmGTVx3a1xQt7HNlGbTFqTF9gUbf6sHiVVUPoBi+Ah8Oba0rS9cVYyIbl+t
	/w==
Received: (qmail 812204 invoked from network); 10 Apr 2025 10:33:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2025 10:33:27 +0200
X-UD-Smtp-Session: l3s3148p1@iLqecGgyzMkgAwDPXyfYALbiJ46yNPq3
Date: Thu, 10 Apr 2025 10:33:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: Simplify DMA-less
 RZ/N1 rule
Message-ID: <Z_eCV8aTmr4t1_xZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <90c7aa143beb6a28255b24e8ef8c96180d869cbb.1744271974.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lNR29TA6bIen2wLr"
Content-Disposition: inline
In-Reply-To: <90c7aa143beb6a28255b24e8ef8c96180d869cbb.1744271974.git.geert+renesas@glider.be>


--lNR29TA6bIen2wLr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -            - enum:
> -                - renesas,r9a06g032-uart
> -                - renesas,r9a06g033-uart
> +            - {}

What about simply dropping r9a06g033 which cannot run Linux (no RAM
controller, only 6MB internal RAM) and there hasn't been any upstreaming
effort for other OS in the last 7 years? And making the remaining
r9a06g032 just const? Why should we allow everything there? Do we want
to support that?


--lNR29TA6bIen2wLr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf3glQACgkQFA3kzBSg
KbYxfBAAj50ZxD6LDwD1Xp0bj97nFngkA+Z1EdKDU5znTdNa1Pt2Y9UOKbS3W+C/
mbOwdOhXq5/BIr5bLZWOToBRdG5LDUPMJN0KrmmKnFFF7GjCRk0tLncPk8WGX4+C
+2ckuSP2UtGo4DUwdhaXPP7ft73BhJ01/GQtT+MEA04z/Nb3u7n4sw61rGR1vWqF
RTCizIbDo4KJDwmpT0hHeDe4xbWPO4x1hyhL8cDLGk/GJZ1FvZC9cfWxhAeUNTcK
KRQ8pIu2VG9+/bYTzlloK+V274rrbSZ0OFK8cQ4f9tdW1N+VsCgF4iZVDkyMfMc9
4oBKqYwykUVFnWaZc8Yu5chDfkanJuz7CyWKXoCbtV+LGlpvN8zS6RSMx5K5r+jo
TTQJbKofEP1x2bTYkHk8BodS7OGPQDVrGN1R7U0WX+0ix/JalXYcPJGbLWI/uc87
wf1FAt37h79248t0jWW7iJUzvtNS2WWhK1zRRoNYDHrxnRljBlGDVK9K4QK+Ye3q
WZJxQELMIVl5zXgtsoELT0CkzrymB2pTyqTraUKRgXHAX3/PEvXB4VFiPQ3A/0Nj
SdUa4R2l36juuUG5PjAUeBuISA35Vozkf3hmxYbTScTvLjDSxRryAaHa8yu300YZ
RddhuA5h4F7ozg3I9PL6eGLV++d40lOE0QmCRLfkUW2L6iIPuHU=
=IRSJ
-----END PGP SIGNATURE-----

--lNR29TA6bIen2wLr--

