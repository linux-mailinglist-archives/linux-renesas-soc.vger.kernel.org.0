Return-Path: <linux-renesas-soc+bounces-19401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 663DFAFD85F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 22:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AF861C23F92
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 20:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF74523D2B6;
	Tue,  8 Jul 2025 20:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aZWeELjo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CEE225A5B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Jul 2025 20:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752006551; cv=none; b=CWK2m79CR0t8fgCf9bIoyuBIja8OZrevw3+gpnRW4RYAOUl/FDP/FhXBEbV5V3oAGcQpX317WZ842NNYLZy+0Ov84yLWvRfNdIacE6sucAkHQn+ciQo3js1Dhw6OeJ7830zcWVG6B2cjSj0ZDQo9CBb6kEILqvsTPZWwm3Po908=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752006551; c=relaxed/simple;
	bh=HXNekzdlAIvujwir1FcqKXHPqkduAfFMIsqZ5qAjRQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDbfxbV69v5vAtbde9hUsujtMb19pIK8lkWKXRLGjev5ggJzVseQNB4EbtMKqtBv47s2iXfGeUzf4dvf0LnBwkEpAbb4VOQYLGFIIjYYSZ74i1shahlPVPQTC3ElBOEV2dfb/EkAQCXC7DWxMrOj9U3qv+S9rh/QhPkGe563y2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aZWeELjo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HXNe
	kzdlAIvujwir1FcqKXHPqkduAfFMIsqZ5qAjRQg=; b=aZWeELjov69K+XzSHTeP
	7PcNZqiMCwB3+WKHDdXUPgoWpH1DvopjS1aJP3cFuzLTtGlh0Zhm3PN6OhCxG45M
	rqACPeVJ+myINMEZuonDowyoxvT9aSHmi1kUxAtjH0Jvi9E7zkF6alysdifbizMc
	q/cmXrqzqOttjK6PQx7sytG7eYw7tqBQ0HUNrp3ctixe39laLG/Q9CibvtfVCwTE
	4APp6BFdfeB5C0tLwk0pavXghhuK5uk/rZzyvMNsKV2/HmJK339EH5005HjJO7zo
	vd7VAauDQHCtmpjpjucKFRQ0aE5UtKP7UiWoEx7Wkq3zzeS6GDA4TQb1IfqO3pjw
	7w==
Received: (qmail 410506 invoked from network); 8 Jul 2025 22:29:05 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jul 2025 22:29:05 +0200
X-UD-Smtp-Session: l3s3148p1@Kt/Bz3A5iJcujnuW
Date: Tue, 8 Jul 2025 22:29:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH RFC/RFT 0/2] Enable 64-bit polling mode for R-Car Gen3 and
Message-ID: <aG1_kEZZwVPIj99q@shikoro>
References: <20250630081315.33288-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7RtQj/Gv9onJ7SZr"
Content-Disposition: inline
In-Reply-To: <20250630081315.33288-1-biju.das.jz@bp.renesas.com>


--7RtQj/Gv9onJ7SZr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 30, 2025 at 09:13:09AM +0100, Biju Das wrote:
> As per the RZ/{G2L,G3E} HW manual SD_BUF0 can be accessed by 16/32/64
> bits. Most of the data transfer in SD/SDIO/eMMC mode is more than 8 bytes.
> During testing it is found that, if the DMA buffer is not aligned to 128
> bit it fallback to PIO mode. In such cases, 64-bit access is much more
> efficient than the current 16-bit.

Cool, I had this somewhere on my todo-list as well. I want to test but
it will probably be only on Friday. But looking forward to it!


--7RtQj/Gv9onJ7SZr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhtf5AACgkQFA3kzBSg
KbbEvQ//fPDa51V7lt4G1yzObkw/lrxI5VAONfqXRquHogFdULj9ICJMRe0H6IBL
Efm4KsX3sc2yWGIzMfNGz8L49jW0mEZeZFDUeBpYg8Pgc64vsGUe5sPaN8lbcgDG
QVjUw7tmdwQwSt1uiXXpngcEHXDaCJXw4e04MPqCqOqLLm+5YtQCrFWj0zFmWlAl
KaRba3T7bezGj2U9kbXycD98EG6o5WU55xssvZ5f3ubdL7K+8QJyc3EFrxQ54JF7
+p1ukVD5awIBT309ZkYPYWv0SpcpmSZJ8xxxZJ2tCJ4EbKJDMzxTrPF4luh9T/p4
HiTX7kDJvq40xNTnzXHUZMI/IE2+FyS2PuNxKpz4N67Dohc4m4pQv6WhEuW/PCJh
MxQYUSz0XapVfwZVygZ1eGgvLC2aBPJskO0TyVkVOiaiysC0dPkaXNZzeHGCCETk
gmOPqgm1oX9wavU+W0cZ7ZQdOPK3IzbTchSH52GZeR4Qe0E5uVWx4Jv4xq/NK3fA
JZ6PH5DiLeEZeoeG4mRePBuC1ik+WGtiRdCYIr6gc+PJ61zbGGHLwi7+9IBesJ+0
O4g7pNpurl/BTNduuMme2VPHffsRioVeZh6A9Wru4zIFlBJnzb3M822oub4pE04L
/jvA8FDxFqLbT3l9+dTaeeJZc61TceoW5ovcW2v53gAE35X1VsQ=
=qe92
-----END PGP SIGNATURE-----

--7RtQj/Gv9onJ7SZr--

