Return-Path: <linux-renesas-soc+bounces-4737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3999D8AAE62
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 14:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66E2A1C20D2C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 12:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F2F85629;
	Fri, 19 Apr 2024 12:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lpPvgOfD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9369C53E02
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Apr 2024 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713529601; cv=none; b=tb97hAvoIMhoiSftWDK1U//f1fv3hSM944RR+jjJqXHUSDw1YzwQA2urFSp8t+r19f5EPfETsNGCBzdmrl87ru/K9uLBaRxfZPhV99PkO/yII1xhMO8yR2sOiD4bSqwEUZSCCU4S9IJTfaY6XEd3OHb3F/IGbHspEBbi9IMmmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713529601; c=relaxed/simple;
	bh=TeW4qw7vbT2LX5GCx7OjnX4WrpDLpChTlCr7yfRUFts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ujx+NFn1Rused1iv6/14j7HoNYxTw/5LBqqCGLjouEuqXtPGlisVaEeDQKcdu8WBiC5HUExIdOB/grt+lKjuSrW3E/i6nQ1V6PtFSDuP7/PcKTIMgQgOJk7wPcW/NkuI326scXGkYmWyX4UF5RoKJuN7Y6a1TNXWu8EPmD/t2dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lpPvgOfD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=o18F
	JoawbbRV81A3waZvBdihVS+B7jnHxNsnRh8o3uA=; b=lpPvgOfDW0UcD3tt91Hl
	iEy+IO9wgFy1GCmXmUaml+Yrps8Yc164fEMEqKsy+PnlqhimAfJmso1L/WpGSnYh
	iJitu50jw50eSTFzCAsHSn9k/cTp4eB8GoanRHmJ8ft31oDLFTi9IcFqgYF2p+vP
	LbajEGsOv0neegLY7iHLtiBszR6/VYO1OTA5KdlJG53qqruZ3S9aXlgWVVPgqXek
	pq32DPpcgO+vL1Zr1X5pxd8P7EDCUHt2k20ekEARMgo9RjvHJ/8eoNh46JiZQTnZ
	LAV4C5GqeLms66LFSOE5takOKGOkB+O+Y1pXGPM6vpRdV/6hvfnCWgWQuSQ/QrVN
	9A==
Received: (qmail 3427272 invoked from network); 19 Apr 2024 14:26:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Apr 2024 14:26:26 +0200
X-UD-Smtp-Session: l3s3148p1@qpJIMnIWZIRehhrd
Date: Fri, 19 Apr 2024 14:26:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: Modeling the register bit as a voltage regulator for SDHI/eMMC
Message-ID: <20240419122624.2n64uuu2oo3pgrpy@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <CA+V-a8tO_nks1gZ7xsQC3Dr+A6CA4qAbSpZDMHYUzK7j04cNyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d2nyjqb6gl5zjquf"
Content-Disposition: inline
In-Reply-To: <CA+V-a8tO_nks1gZ7xsQC3Dr+A6CA4qAbSpZDMHYUzK7j04cNyA@mail.gmail.com>


--d2nyjqb6gl5zjquf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

> So instead of a GPIO pin acting as regulator this SDmIOVS can be used
> to toggle 0/1 which will control the pmic to allow us for switching
> between 1.8V and 3.3V.

Does the PMIC have a Linux driver? If so, then SDmIOVS would be really a
GPIO telling the PMIC what to do? If not...

> There is a similar instance of regulator driver [1] which is
> controlled via register bit write, but in our case the SD_STATUS
> register is part of the SDHI IP block itself.

... I could imagine that the SDHI driver itself exposes a regulator
driver. Just without a <reg>-property. The compatible will induce which
register and bit to use.

Happy hacking,

   Wolfram


--d2nyjqb6gl5zjquf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYiYuwACgkQFA3kzBSg
Kbb+wA/+PCy//6/tVlNSb7tnfGqr+1gwbOP8sJp56uyO/ybdpQSFy/DaDGRGPt6c
PlUwkyTrS/St/eBMP1U/KLXEdpYwTx5gDBHHcWY/d1RXxJsd0rwiTSi/4GA1NDTJ
75+jq9pOapkUsQujjE90c2EI5Dgx6IIatjwpTLwgmnalztK4Xxqf4JcU5CZ6jG/K
KN5BdQ1thg11ACm66vEbvO0LUvYOGIxkVSsqSsyXGoYDkdmEWLRW/Jr/JzHZYBkr
Duwp2lCmrsjXWgDX1+7K5vV7MqR4dGIrb7YQfPctx5AA+K7rK7ucr+rbctlZIRAs
yqxGVCGtBqeWhOPcJZNtd2bxhjUWMmHpmOQ18hQUKaR+zFkCU6Cn8414/RR9VE8J
foPb9sI5CXGJTWWmYC9oiXsZcaX9QTWGs7A0/x8GWSCHeamB4bAh5iCQJo+pXDXn
jRXLe37rapNg0mVzp5GFnxS/ll84exLh6QYom1/ai7FZgijoT9lkuN2rjkXPYIzw
6fzC+ZC7UF/X9C4Z6w6wjqCG0iFYGZq2TutaRuSyTvZepoJZOG2Uxa8m15l6Dtxa
jRFINF4fPTlREYun0Ff3UPepJz7aMlth4r34qvw5HK7Usq/JrYfAOYjfnkrYqVD+
zWsZFdYA6/7jRd8BJo+jPfNmI+BeczGfTY+ZVitKXyRS0yNq/lk=
=Jxxf
-----END PGP SIGNATURE-----

--d2nyjqb6gl5zjquf--

