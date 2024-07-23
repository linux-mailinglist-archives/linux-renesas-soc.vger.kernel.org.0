Return-Path: <linux-renesas-soc+bounces-7434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BAA939E4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 11:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6761728345B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 09:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0552814C5BD;
	Tue, 23 Jul 2024 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjgDiqm3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C984C22EE8;
	Tue, 23 Jul 2024 09:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721728546; cv=none; b=PFFH0uySDLsbI9Or1Ku5aEx27UdFPTGVVec8Z3IOdGGPDEzZDGASXJEvvTqSd61LSus8fMJC24o9mgjN9QxC1UEwsbrIVeBjaxsbqIh4yn2M9/PqLNVTN936IzJOLF1tdPr8l1k6ohZTp68fQrsnNIeqdyG8Gye3eTqpZArpy/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721728546; c=relaxed/simple;
	bh=7df1qMiD4gwryncxE4h8sRbORSPOCwNE/8hu+Un7qnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcas4+53/CmTwMqx9jkaQfuL2xGDdkthK8TBFXYTL34RKoM8fUk/2wt0gpNhOkADFWOasszyZh0BhoDka+zwNxMg57zOu6trMpSHy8/+vzxDKaaG4pcVw+tOs3sAYFKXUChyzMDf6rycxjpUqmtB5m6pq581h6gWwru5+wmtKYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjgDiqm3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60C7C4AF09;
	Tue, 23 Jul 2024 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721728546;
	bh=7df1qMiD4gwryncxE4h8sRbORSPOCwNE/8hu+Un7qnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MjgDiqm3qCYr88JoRqf2O3hAgTdpf0drTeOtBJefEM7uuu142JTfX39sEqmify6LL
	 h2J+Pnk5FNfcmqQYPBXjUN1PdItpq2UOuRrRcXBeYQGafjv6lOi/5aW0hiRDSqUEzo
	 QuHs9P8mDq2bAEl+EaLaZd9Io5o0JO9J/KdE0VzTAVLr/7aBNsY/PBLVsM8lc5z97l
	 5oSJRYlVy3WGfl0ImRt4FokNHwC0XgR1dK4H9m/XRa279UbXZ1CYZ6jwllGrG4SMXr
	 y8ZaxHM+KWV9dT6u2zLMiKTb7LtQNCl9fyIbrqFsOwYQvZQ2adyMR0CaaIChfw4FMk
	 laTn7xdUozpKA==
Date: Tue, 23 Jul 2024 10:55:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: sound: dlg,da7213: Convert to json-schema
Message-ID: <a55e07c1-985d-4c43-8c69-69363a0ea9de@sirena.org.uk>
References: <7645c9024a1762d281f4067504bc32a7a3d27caa.1721649741.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I3W7CxPvVdY0vKyf"
Content-Disposition: inline
In-Reply-To: <7645c9024a1762d281f4067504bc32a7a3d27caa.1721649741.git.geert+renesas@glider.be>
X-Cookie: Parsley


--I3W7CxPvVdY0vKyf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 22, 2024 at 02:04:00PM +0200, Geert Uytterhoeven wrote:
> Convert the Dialog Semiconductor DA7212/DA7213 Audio Codec Device Tree
> binding documentation to json-schema.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--I3W7CxPvVdY0vKyf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaffhoACgkQJNaLcl1U
h9Agngf+IVtNmcfOBV5AvuwcdW9xvBrs9/eZl9Ew0S0c9g3dPTyrse7BFlk/iHQz
uJNW93EP5jdpBBNIPVCnIMxKRRMYcW1xlK/PDZLPFJAjIHtZiB/G2+fvEpMsq9hg
fqj46UTA8kcktLfRW7rLnR4NEQCkZSu8hV3gSBrR3H9/qA6kZ00N3+EgD1R76EgS
buV7FDwRCvdPhnnBiK+kXBMsro0Sy99qOrbyNIh33h4NFYFl8WoaI8sQ0ZzG+4Fk
CrDKKppKl6V92assKXUIrROjVb/SqGRNQHAzHZALuv9AFToLuvp5ErwTA4rhFp6+
8P5cP3M8wtbe1S6R+dpCglCvgLYKEA==
=QWtq
-----END PGP SIGNATURE-----

--I3W7CxPvVdY0vKyf--

