Return-Path: <linux-renesas-soc+bounces-15228-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B493AA776EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 10:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01D773A925F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 08:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FE31EC00D;
	Tue,  1 Apr 2025 08:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RwZLWwp4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1F31EB5FA
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Apr 2025 08:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497514; cv=none; b=ERU/bmLisfU0lV7+yq4YJ+9x3LKL6rT4AyvC8iELswFpUcopDYHj/Upot5+waqb1ZdUvM0Bo4VN9JGojW601G8w/MSLCbTu25nYfXA1TdOY96US7gkmShOYsjOC4hYqHsQdKniRv7yfGuWZBTQW0K9yBjalySQqB/9M2TZuHAJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497514; c=relaxed/simple;
	bh=sT/syqU8YMLAnTu43NP8SZRj+CiVHsm9BolDYyoETH0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bG6rKAgM/o8VnUNxQomCHty3VDhWms9XyWkhZQgABxcSpmCN1nA1vNfyC36TS1RNSuT3LMxuOTnxr9NFPWzmSPezpMmlWC8xyo/0/l6zbidqjvgRfmQzZYhaoTF6zVZy8EFXCTAuILTUPqbePSJFJn651iF0Mp9PySf2TCtmztc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RwZLWwp4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=sT/s
	yqU8YMLAnTu43NP8SZRj+CiVHsm9BolDYyoETH0=; b=RwZLWwp4fkl8Qh9ZeFKx
	1DPmewsGaNd0TM3IR/d0p/UiJAKysRN/EK0UEFPOnyhe3UWww7VVMzfJmMoOMnYn
	Ju4+NxOlFvp88sbYxQulLKum24fXtkx6tU28RkXwZE0a2GiVdK1Kfl9sr9lDjBQq
	Jnbko/bQLIJghrvF8p85FHBFpPlgsAFxfnMGDav0y60+B8/SVNzRgRgT+uJ/Hk4K
	7WHMs90yqICsCj3h6wpwKwvXs+DTJFD9p+A4EG8RZy1VALl0GC/3MS6+XzzNm6zA
	FVLydtPJ0Hfsfz5FJnwX+mDnBPUZCx0/trOBcNfAeCzLt+Lmp8zHB4irVTkn+cSy
	Ng==
Received: (qmail 1535216 invoked from network); 1 Apr 2025 10:51:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2025 10:51:49 +0200
X-UD-Smtp-Session: l3s3148p1@4o22pbMxdJYgAwDPXwSgADIEZgbhJYA3
Date: Tue, 1 Apr 2025 10:51:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mmc: core: Add support for graceful host removal for
 SD
Message-ID: <Z-upJTp3ykMqvSAl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-6-ulf.hansson@linaro.org>
 <Z-pSq5e9MXTX3qfe@shikoro>
 <Z-uou73DUQoceMj5@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XFNsiknX4j2/k/nI"
Content-Disposition: inline
In-Reply-To: <Z-uou73DUQoceMj5@shikoro>


--XFNsiknX4j2/k/nI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Which also means that I tested the whole series on a Renesas Salvator-X
board with a R-Car M3-W SoC (Gen3).


--XFNsiknX4j2/k/nI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfrqSUACgkQFA3kzBSg
KbZJyw//U676OEICFaV1RZ5E4SCVs1CNM5vAcwGy37jJfaHteR+ivuTgGPvd2uS+
eVPJkwtrzezzcDf4gYTk3Eg5YpnZ8LQyZJ3vzVvGGmOtdxXrm7wdF43dSln/6Q/N
v7ia4MIR26kUukCUwLpEUdcJMk14SvMbO2Wm6BsnRpjYFR63DqRaKZXf2GRHCXRK
TJCaZvXloULd9vTRHDMe215yDqKcmvEV86wcC6lKxtgBwqvhbK46YR/nu5cu4JFB
6mVOFn0njjJv4TX5g4U6bTBI2hU6eZXsltgJ1jpGm3m8xiu9mOZw/g/WKvjQgb2t
a5tY49RQKLyG+aLJRYSmEhKGPyALwlJt+16fSaVqjA3D70qd4C4/cjmGWyHBkJqi
KF8DX5DM0sSOFLsU1KKRPiSZ2VFHPIhBxYq1dlGga6LYFdBrTeNdhIHnFRnfAAsx
vZlReSzZBQP1bBqYeAtP4K5H4qAguV8YWoCRaCRTOrToZQy+HFWRO8Lzm+Z3MIOJ
s/AaqsE1DTrEEX/6BCaOsNORlS5Qyh50qPK3m78RMrn5XxUolqMHBxBY+S8DSSvH
JwqJSVSdxujvAwhhSUJDAZZWUo+33rHqAJeuxBnwDGtJd0b3o2kuCVoVXegN7LlY
5RzOQ21vt91XyyyWS9N6lFxHIydZqgn3oDatzvJycbWONZej3Rg=
=0Tb2
-----END PGP SIGNATURE-----

--XFNsiknX4j2/k/nI--

