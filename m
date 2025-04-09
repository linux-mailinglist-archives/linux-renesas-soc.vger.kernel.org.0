Return-Path: <linux-renesas-soc+bounces-15676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FAFA828CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 16:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8916B189D3DF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 14:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA862676D6;
	Wed,  9 Apr 2025 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GoEoS2jW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A4325DAFC
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210022; cv=none; b=PzCBVC9GEzlBQDUekC/HItfhrIRxgq7MiuoVICmJ6lgN4Jt1o+oOlSgGlWcb/LbgNqlA0YhK0KCdV0emwkWAQH3hw7sgieB//kIyCt6/9+LIssx6qyWvzJ/VFTzQ1HkRPXQbC4X3oEkVaYzCzKYsH4ne9l4aS6RqNHpwlnk+3mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210022; c=relaxed/simple;
	bh=7IE7CzLlGIEDeDzFBbeZ7na5KMhV6xKbJ1Xr3DGJmvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7l+L8TfO9pGlIoravmwvLMNxFCeF2B93uuBS3R26mZq6wDoqoiWL9WoMsLxMsvDygwAPelxgmm2r83abaLLk6yuVwhVkuQ2f06tFrbCgQuqfkdqbhcQvJZiKFvaAD2BK3c9yua9/q4shxWBSfX0mudUuUa/F8yLUQsf5biDGK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GoEoS2jW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=SCOp
	cFk7gHQHs1OFxzg4QWFbV6H3YTRCYuLWl97bTiE=; b=GoEoS2jWAbTXXMf7hE/L
	SViTjzR0do75YYGNNKfrf6BaUhDpi3MAfSJrQgJM/gxBZXbkw93NavIUDBTOa5gH
	QdncMgGkFCPxh52yNqLV2RmqCfDLQs0ZU7EwU0lzuXN/unTYSWycu3hT9lhlwUfZ
	YYCaHiAVLDO4JqdtQO/xNPavKAqMH+cWJBbcQwHFpnEBeBiVm4qttNsTvJKDrx5y
	K2fwzPRpAZ7ccFSv4+aiGG4zavhMJP6ak2zJlXXv1QdP7LsUnJQm7pZvJO00F7CM
	rDyk/9gk/gfKfMUh+s9shbPfcUCouPWWqBNIptIWSEDpk6gXpiNPBVpitG1bb0gw
	iQ==
Received: (qmail 499862 invoked from network); 9 Apr 2025 16:46:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Apr 2025 16:46:55 +0200
X-UD-Smtp-Session: l3s3148p1@rg9ailky2oogAwDPXyfYALbiJ46yNPq3
Date: Wed, 9 Apr 2025 16:46:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] mmc: core: Further avoid re-storing power to the
 eMMC before a shutdown
Message-ID: <Z_aIXqdWh8n-4LKo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250407152759.25160-1-ulf.hansson@linaro.org>
 <20250407152759.25160-3-ulf.hansson@linaro.org>
 <Z_TZxXORT8H99qv4@shikoro>
 <CAPDyKFoOfNWa6b0jF0-a-imKqdDJQrdJe65OaOj3D0upmS7VXw@mail.gmail.com>
 <Z_U7ogPkzZY9IVBB@shikoro>
 <CAPDyKFooWDpmfJoCFwjED_Utw6HppjAN5JjBL9vcZW1LsKeOFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IVp1hCCYVUUOWp80"
Content-Disposition: inline
In-Reply-To: <CAPDyKFooWDpmfJoCFwjED_Utw6HppjAN5JjBL9vcZW1LsKeOFg@mail.gmail.com>


--IVp1hCCYVUUOWp80
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I understand what you are saying and I agree. However, the problem is
> that your concern applies to a lot more code in the mmc core, but this
> condition.

We can easily agree on that :)

> Don't get me wrong, I don't mind useful comments and good
> documentation, but perhaps what we are really missing is a general mmc
> documentation that describes how the core is working and in particular
> the power-management  part of it.

That would be the ideal solution, no doubt.

> Unfortunately, I don't think I will have the bandwidth currently to
> work on this.

Same here. Plus, I don't have a complete understanding of it. Obtaining
this understanding and then write some docs about my findings would be
awesome, of course. But -EBUSY, too...

> That said, I am going to apply the $subject patch as is - but feel

I still think that having the comment is better than not having it, but
I accept your decision and will still be happy that we finally solved
the power-off-notification issue \o/


--IVp1hCCYVUUOWp80
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf2iFoACgkQFA3kzBSg
Kbb9yA/+K5nHnWkfdYzIQRtvVmq8BjP0yiApA6X2179mDo/DKGGd3K926JlTWfo0
92Oe5vl1ldv8qIx1BuAGaBUWM4GIjolvwZw8skqOqKccti+JxodH3n6NIlytKxl6
P4lUJsBNIWiS8l1xshj2/J9/BpE0u0CfmtzcBy5NOCNLWVrOJ3kCLUhc2bmWCru9
HjGe/1BhYmonusL5JB7NtU9xfB4G6q+qdJy163oNqxIuqJpMPEw0pyv4f2t7+HTs
UnEAnUEJJgzrkaw35QDFO10FltBh3zZ4UrJ+g3KeG4OJUTw/Ffz3tfBw2bRPmcBf
NJy/qzIIh0fJv0Oz+5C7VPgP0UZddacMjdVbeZeY7FfGr/jZ4asxvATm7uWnkTik
fiITvolagnx7gpMMGDEyIjzzRpL0oAwHvdju/wkgaC4bYTNg/kXpCoGfauzBPLAb
IXHlzWpLHfjiU8llW9igMnIn3yTQ7tocx/aw28BXD1Ep5pom0flcrzZWY2g+NtEW
PFxigTjPYz8D1vWQ9Q6zudTEGO27rZ8YB6pgSjHWIxYgwaEzjVyW2qG4e/a80Wmr
EyDUFGPQQA713O1sD9cG/yHbUUy2ibqWo7lwx9yJU3wTKVUjRcrryq+Fa/9axKR5
L1Wd+YewW7QMD8NgKny9tZbY23sWYODovEywk4qsoCrEwp19f68=
=pjtg
-----END PGP SIGNATURE-----

--IVp1hCCYVUUOWp80--

