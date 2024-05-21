Return-Path: <linux-renesas-soc+bounces-5418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 375858CA8A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2024 09:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 688331C20D75
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2024 07:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD174CDE0;
	Tue, 21 May 2024 07:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cvOltZen"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9044B5CD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 May 2024 07:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716275674; cv=none; b=Bn5kl0x0aRi5Atrti/yYnXYog0RbV+G7C3z1ZxFQvLDXtJq2PEtD+3dlyIffVJvQgnsPCrMuWnNbnvkfNN0We4qjIiaskhk97KrImw7TuF/AzNNh+7pUEyQpO4gbGCuLY2cORL+Ett359zQBPZc5cAHKTM/LfIeo2j35vqXXCrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716275674; c=relaxed/simple;
	bh=guQqIPJ20CDMgjAVYmKUqUSOXIjuIqmf+wsaOpoK8Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZ4iiLDao0wrFKORbv4Dh772RfuX2eIZqVZh6t1siJflZJOoTHxkF5lJ09zOPFMFRtGgXvMSNbnrBD/xesbtI54R4B7rpg6wB6LVVMHov2jIp8IvZVSSRby8pC85P5b6zE14Y70801QC7I3Zx5pJSeAd76XeYRF8YjxgFvp4gE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cvOltZen; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=guQq
	IPJ20CDMgjAVYmKUqUSOXIjuIqmf+wsaOpoK8Ak=; b=cvOltZen2VnRj1Y0D1Mo
	5sXV96KbUjvXuaG8Og7MlbRj1mrHw7IQfSqcuInicXmx5iSLR+I9T29oJ1E9HgSj
	WstguoAbO7tSUn3Fxf3ll3SWyT1wKNNoEsXIl4vlIGK7v9B4Ed/6onUS/Vgpr0lQ
	qUOhbqIcfnZ0pBdBtVeekoxNoeDwaymCGNnljyi/9m3jwG5xcnWelvjy5GvwJB4g
	JlSZf+8w//fqmHmKGI9P24MeBdBFtzR4dOhkmJcNhKMnwD+ilo5Fq2fB1tsgcWAt
	KVcXrCiX6fomFt22fOHIE/lXyC4pvOSmQjcJcpJgHf6yXpfTXFWKppZw5DHJ6UXz
	sw==
Received: (qmail 274003 invoked from network); 21 May 2024 09:14:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 May 2024 09:14:29 +0200
X-UD-Smtp-Session: l3s3148p1@ObWSkfEY4qIgAwDPXw1+AKJ2KpfrUlGo
Date: Tue, 21 May 2024 09:14:28 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Renesas R-Car Gen4 PCIe
 controller
Message-ID: <lcbvbogpsvia5c2rpsedu4mjvzjht4cfqds7zwmzyghqmdlnbg@xzyogkjl53dv>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20240521065136.7364-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mnjhayrsziuctgvt"
Content-Disposition: inline
In-Reply-To: <20240521065136.7364-2-wsa+renesas@sang-engineering.com>


--mnjhayrsziuctgvt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +CONFIG_PCIE_RCAR_GEN4_HOST=m
> +CONFIG_PCIE_RCAR_GEN4_EP=m

Shimoda-san, do we also need 'CONFIG_DW_EDMA' for endpoint mode? There
is a BSP patch suggesting that: cda3dd982572 ("arm64: defconfig: Updated
for RCAR_GEN4 PCIe driver")


--mnjhayrsziuctgvt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZMSdQACgkQFA3kzBSg
KbbXPw//aBS0EAl/NocG5M3mdVkBO9X4CDyu6k215T3NGoSZWAHcLqU0vhDuL0k/
RQLrEfTsiUTywZsfXaTxDVXGE/5ycd1Jflb8dVi4IqhmHwDDQ9Xtshg40LiWC5+x
jKHzuj1ukNAPOPSJb8vvvJ3F6tomGsk/FGAZt4N/KH6dUja3n91NNpgnb0kYKNXF
Kx2LGUTbRiBjI719dw0moSla7XNLXMl6641KPUdr0/5vr9gJkDAyc3RIGAtZ4mhW
mCxjY5PEkzcqadOgqiOVhVF0W2dopPrMXfa/GpfPHi01coXrSeeOidfjP4wUgCE8
CfKDfLgVBPVsXWgrL+7HSQ9TAvgBY3H6q7eKlCTg42EZf5gk3FCQtNKuownd5QHl
Kou+Y51kLVAiAMYnwDKBAY1JtYGoclbdcKWRz49QoJT76N3zvVUyHJ8StPrgzRWE
5t2MhWTuJ5VpmMXT2EqqjK5dcXQBt8kt35Fovlu02xCq7VK5+/V5IWgIm25js3Pc
jBgZQx3m9enfQiF3sEuu9b7BkEgYjeusvDKdt7mWeJIf7EdCGWxe5n5Y7UR+h1mp
9ww1FA/NYm/LlIBxVI/ffUzkAO/7+t/Mfl3WW6nay5uAXU5gamFLpvqCdiTbW9Yv
FkVHvhCQ9sassLX+KnNKBTJbfKovdt5uPO3v0PS7T+CGxrFHoPg=
=lnjr
-----END PGP SIGNATURE-----

--mnjhayrsziuctgvt--

