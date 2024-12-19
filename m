Return-Path: <linux-renesas-soc+bounces-11578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 586819F7F18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 17:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA1FC7A4066
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 16:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3574227585;
	Thu, 19 Dec 2024 16:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FMWz5hao"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832C2226546
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Dec 2024 16:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734624750; cv=none; b=d2VvFAsVuAKA/qD0sDz9njv1SsUCuSbGq/bimeXY5/A9ycHeUqN0rWdR/lJGZpQrlOaKYBBW3FN9d4nTMnI5PpCumC9dG6VQfXX6+FXACioHEeWugBxeRE3Yc5Za6KA+PpBNy8UGDkhhJZ1TPyNEZisFaOh1R+9mLT7ASReSoRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734624750; c=relaxed/simple;
	bh=2cJabmnAEd6f/zzM/PRzyfzslB+4wnuaXwMHbAtDDAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7gMxaYUsOhnqu/PL//ncuSA8JitBtykEb7ggSDUUB5DIZ59QEC7fYpnRBZc4+AEX6C5303otPIfkz/pu1x6//fkm3L/58mR/IK5CplkzzBIl8134OjPq3qB5JU3MLz3/xZbaUvp42yYYH2poWOQM5EXWMrPzPmo79iwEBM74Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FMWz5hao; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gahU
	DS4PCvlWJKB7RLdVBv+JdsVxH5akWHVSoGgGXSs=; b=FMWz5haoTl7FTkVgwRWS
	BR7CzmQ0wjB0cYMOt5Q4Swm3qxZGKNnGdFqTBQ+UXVhLjzCxivTB03P/x3FBFK+i
	lGF2Q9oruv4u6/5NaP54+syX4VcUIhLXlhEpXCp3ZdwoZt0d62tx67mNzPVj57km
	nDTGFDQb2hqS9AiVUJyAlNibjPukldl+DuRogwowv5cG7pAGEajEtMrI8tEgCiP/
	so5YoWy5+qKt71XrS6Bz4ZkQJer2Y47IvQFfbgbfjTi3JVJQbkCjGmnP5tZt6ION
	/jnTWKA3Mnq47j3KdVW2TGSGq22RskgCaXrRfQCQ0JwSEbpW2+PuJeCGqGqGi6Nh
	Hg==
Received: (qmail 733243 invoked from network); 19 Dec 2024 17:12:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2024 17:12:24 +0100
X-UD-Smtp-Session: l3s3148p1@wga6y6EpXrEgAwDPXwAQAA/MfjDm1Sk8
Date: Thu, 19 Dec 2024 17:12:18 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 0/4] renesas: r8a779g0: Enable VSPX on R-Car V4H
Message-ID: <Z2RF4vGtTd1wDjJS@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20241219-rcar-v4h-vspx-v3-0-8fe8d2afb268@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sBU+tB3qTAKRhvZG"
Content-Disposition: inline
In-Reply-To: <20241219-rcar-v4h-vspx-v3-0-8fe8d2afb268@ideasonboard.com>


--sBU+tB3qTAKRhvZG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jacopo,

> Compile-tested only series.

Can't this go ...

> Changes in v3:
> - Test on an actual board and fix the VSPX and FCPVX power domains to
>   use the ISP power domains

... because of this?

Happy hacking,

   Wolfram


--sBU+tB3qTAKRhvZG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdkRd8ACgkQFA3kzBSg
KbaSlA/6Alnuow4SentGcGAf1+wjpmnh3DKW++1hCHhyJGZMefKuSqcYxwU5X97V
CGl8phNkL5t4JXC6gREVeQ3dhBwAUOID0aqP6L78VBERnaz4H94f3erV0HMPtt9R
PU+L/HHB4fJyVQskL/5f1HYdkskYXXN1eFzZiJEeWEMlcH4ibt5qZhmUk/cRl6Ol
QRl7+YaZHyNAAaZsPdVoFP074akAppfp0vGsUfIjPonJEyY3FU1rFdeHmX9n3Tk0
p+zNHXYViV5OoEfwwUyLgx5K3482ICOaAkJC7SwWTNYXlMoC0CgtfGz22KLg7twz
WzKJri/ppV54S7780oLkt4bJv5KxYCBpw6IfqaUQuLrx/wB+jGNEwQdo2LYNEMaJ
P0J4lPFbuIAMw3RMFCPzummkpU68VgU4oGpGNah78GKYOJuuYfLbjYjPH6ftdyIX
OTFxNY4BdQ+MyyXOoi3lh1ptsB0g0Oq399ODrWO8mzQCTO2qWEl8jruD4Vv5vO8N
glyuWZ2WcZ7wXtWYKQfcGchseax9zQN8np30aFz7HQwIztDKze4llPbTKWLBNi7u
MOZtlgbdUm2ApES8zjUpitK51v2MQ9ksmVbI+lxBJLjscs4lbAh9OG1FbdzvNY3h
sAcMD4noYqWPlOe/scATOgCMT453qsuV/H67opZLL3R7OO2pYCQ=
=9Vsd
-----END PGP SIGNATURE-----

--sBU+tB3qTAKRhvZG--

