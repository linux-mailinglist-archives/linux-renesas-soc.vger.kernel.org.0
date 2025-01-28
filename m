Return-Path: <linux-renesas-soc+bounces-12620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBA2A20833
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 882F218849A8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BC718FDD2;
	Tue, 28 Jan 2025 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bBHqDG46"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853E819CC0C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058682; cv=none; b=bLpOhlYd0YOami3TutogDIPFESrKLk6ggJUVxu6JZiHQI7u6LC6PX4suGtC4uk9LZ8PBMbl9zeD/vi+DTV04jSbh1mJOBQB87cCTEK0q/zjuO3BMXzOKtZIR66EXK01F1Q3s70YER0S9DH/Y19NG8Q4uZrqIbJFlkfbNFluZfhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058682; c=relaxed/simple;
	bh=luCUntsnqplxZitGaLpSmXlYr9lWzuSdhgC/NCgwXiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9pTxcPzF6IaowpOEX0F17FV4TMIKUC95McQbyPHmSllf6Fb3+vmJKGR/jKqLXJF+1LMoLq30BQoTRQ5eNeqvPuAdcSqwZp7JwslrZpwvAmbjf+7HvrOjVvdzTtJ58qg//vS3SP/P9d6kOZmiSJ4cluAh+omHcqDVfEkDIPwxd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bBHqDG46; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bxz/
	0pXNGLp79DTrXAGCWmNrASaqXxxqeOlWeKqp+3k=; b=bBHqDG46xELr7OSouF4I
	SNDrnImMyPvtbU8otubAm6l2/yVD5Ows0qODjCQurg2z/5ALTxfILC/4csz3kDw9
	wINfEFPTA2kvXkECkbsal7WAeD+Xwtx0sb2k4TjMMfOCykO/vJS8ZufmP7wX+uSR
	pKX4Q1Ae8188UI9ygpajo96BoiiC9MfoirTejn+7U5e2v0fz1/VyzR4dsogQowQA
	7NrxhAt9ZUfHTQAWGEAdQ6E3ytI4kC8lPbpMoFETwjjS6CxXRm/s6WwdTbJtbjSe
	T8OqLpjemT/yye10YmuMEPq76eF4UCGPwhaqua1YJFyPElTJdpNBLazO0PGyhqfZ
	bw==
Received: (qmail 541909 invoked from network); 28 Jan 2025 11:04:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jan 2025 11:04:29 +0100
X-UD-Smtp-Session: l3s3148p1@k5KaUcEsgM8ujnvm
Date: Tue, 28 Jan 2025 11:04:29 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH RFT 0/2] drm/bridge: Use per-client debugfs entry
Message-ID: <Z5irrd7FWLhENnDX@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Doug Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
 <a3hrta4eiiknuf4sukk27xewhhirzf43u2eeefnpjny27m4x5s@aifvnevj7cb6>
 <Z5c7vk_oa8HGt7sS@ninjato>
 <hywmnv4jf6ix2ziabdftd5zcjqnkfq6pmqxqzw6spc76camrxz@jn5vr4mgj37v>
 <CAD=FV=V_cs1mc-6LJ21OYbTc8=_3RQYEOBACOSE1iX2woa7nXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6EHuVUA1Cx8xfTJd"
Content-Disposition: inline
In-Reply-To: <CAD=FV=V_cs1mc-6LJ21OYbTc8=_3RQYEOBACOSE1iX2woa7nXg@mail.gmail.com>


--6EHuVUA1Cx8xfTJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Doug!

> wanted it in panel-edp, but glad it's useful for other cases. ;-)

:)

> want some type of directory under there. In ti-sn65dsi86's case you
> could presumably keep the existing behavior where it creates a
> directory under there called "1-002c".

The good news is that I learnt now that I can actually test the change
myself on one of the Renesas boards. So, I can play around to find a
good solution. Maybe even with a symlink somewhere. I have to try.

Thanks for the feedback,

   Wolfram


--6EHuVUA1Cx8xfTJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeYq6kACgkQFA3kzBSg
KbaMvRAAhnbQnQVGIRUNbt/NKUlXINlMVqrKnFr59uDA4ZePfDepJCs+GO3AO9iG
zHmc6ozEI1/1ts4ijD8mdNnBe6WeWE+g655TZCdqr2hfY2LvWbSuuiH2mY68G3XT
5CpNMsmAfp4KS4Fegx4jTubMiJJWaljeGNg6lsNy419yEzZGi5R3GZ6RHHbOuA1U
6uSUAtBY5trKtf2POXhErm0QPVHAg6gzNgYkZDFy+ghg+p9sRYvPuRjrY7+Q8zq8
EWomTcJ2NKnEdOsqfaVEWllYTIDd+UTAo6nyae3nVIy4n2LOU5OksdE+wjfm+DKR
1UjnuelcGX2Xpssa+TNFagmn40e2mgaZ2PbEVokdzYMZ4jYM/VMIeEoek+qmivNj
QQkMXoq6phHEDfpdCm+4u20tUi/E52XB8V85mMj4Ol9Fv5PJtTLQCqyWvsP4bXi1
J2qqk9Y2NLwWar32sks9QxQ8pnm9ju9XLYW00/TT5jQ/BDJCEIf7/Rn/D+qXwRSR
ocC84ks+5nHiKF8iuU5zRqkO3KdMZ2g06bE7uKj+Hx/t1GjgvZpqCJe9el677/XI
4n3r9QIyw4S7BRo0LHCm2P0UyZXsGvwzA0xyrss0cR7hsqi+3uKPn2s0c2nN18Ay
OfkaZdlUMCKzvAHKqoIFgSQ9NUkqbkXgiqAyPDp/t6AZ4EYuAAU=
=hM0Y
-----END PGP SIGNATURE-----

--6EHuVUA1Cx8xfTJd--

