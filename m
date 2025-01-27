Return-Path: <linux-renesas-soc+bounces-12535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4213BA1D1D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 08:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 980E41642B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 07:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4011FC7F3;
	Mon, 27 Jan 2025 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Lk366WVX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A84172BD5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737964485; cv=none; b=PiG9/Evp2Q5ExSv6JI2MH+xemrg79SHBIdlza5yCaHgrFFrchBkgJussfr0sMObjFfrXfVdfV/sudkzifABXjoH0CRacQjdrg8iT7miDLqW4R30/rHTY3KyCfk9cke8ggYA+3EBhZcF1sIDpTBMDT0eovW0Mh4zuFoxn6OvItbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737964485; c=relaxed/simple;
	bh=dHk/ImJL6kC+T/xSeqMjVCMN7VcxnAakC7s5BfdwXNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHSP8N3ggVt2ALaiKQ1V8veJ3Y9Vf+Qxo+fkqwl5LlLAeF918TY9QUficdyAeReGj/2ohOaxAI9xAA/++OrKlpVU593/YW2uSrjH3Yu+Rr1hWf8yrBAND1Kq7WSGunxE+MEJvU4+vCRJaAivjlpowhl74Dea0ozRApkV4GChNRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Lk366WVX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qNfD
	uv5rMMYaW5FNZ2ZLTr/gymkBxWpesCRuvwJAYvY=; b=Lk366WVXdnQUi45Pd6aM
	N6CFD2bvjHq1uUHRMbl8AtMnbu4S/bCgoXrcI4vH84Nn6JhSXpijlAALcfslxGRl
	u1ThoUZ09u7AAGACFFW6ijP0diLs5SOvHpal3nzKeJIOUfQPbFman8ivIHLc9G0O
	rFzzbRKaDPyPXCvM1vxvbBYiQZsW3yM374po0EYKbeHDaa5hVTO0s+W0BiM0w4d4
	eZxp8dp55rf7KVBv2Oh9dDwfF033gx8QiX/y3oJVBaOp+aAL4XXlhm/5X7S7zCIo
	Kk5Q8nlX+UunlV8U5G3v4AuG+1TU63L4UxLKiG2DUrlqlhMp/V+npKMBgcx8B+yw
	uw==
Received: (qmail 151753 invoked from network); 27 Jan 2025 08:54:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jan 2025 08:54:39 +0100
X-UD-Smtp-Session: l3s3148p1@xdJlY6ssfuQujnvm
Date: Mon, 27 Jan 2025 08:54:38 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	dri-devel@lists.freedesktop.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH RFT 0/2] drm/bridge: Use per-client debugfs entry
Message-ID: <Z5c7vk_oa8HGt7sS@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	dri-devel@lists.freedesktop.org,
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
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UibA4pFHsH8a8/z6"
Content-Disposition: inline
In-Reply-To: <a3hrta4eiiknuf4sukk27xewhhirzf43u2eeefnpjny27m4x5s@aifvnevj7cb6>


--UibA4pFHsH8a8/z6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dmitry,

thanks for the review!

> > The I2C core now offers a debugfs-directory per client. Use it and
> > remove the custom handling in drm bridge drivers. I don't have the
> > hardware, so I hope I can find people willing to test here. Build bots
> > are happy. And for it6505, it even fixes a problem. See the patch
> > description there.
>
> I'd say, it should be done in a slightly different way: bridges have the
> debugfs_init() callback, which is used by drm_bridge_connector (and can
> be used by other bridge-created connetors) in order to create per-bridge
> debugfs data. Please consider using it to create per-bridge debugfs data.

ACK.

> Note, that callbacks gets connector's dentry as an argument, so bridges
> still should probably create a subdir for their own stuff.

I wonder if this is necessary (I just looked at the code and have no
hardware to test this, sadly). It looks to me as:

- DRM has already debugfs infrastructure, yet those drivers don't use it
- but they should
- the new I2C client debugfs infrastructure is, thus, not needed here
- DRM provides a dentry to the callbacks which drivers can "just use"
- all drivers I looked at just put files there and never clean up
  (because the subsystem does it)

So, from that, I should switch to the debugfs_init() callback and just
use the dentry provided? Or am I missing something?

Happy hacking,

   Wolfram


--UibA4pFHsH8a8/z6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeXO7sACgkQFA3kzBSg
KbYHaA//R1ii3BxbnP28iciDPXyj4gZ/3My7rEjKdOEd/kJp0+y0dcbmBC1fxlUF
8RRwi81WuVsLNZIyXsLz7dA/TZYTnsHAI42UYcgSw1tLsqGVLlxQ2PujDVWG6N26
TNxgxTTHgKs+IHN5ucK7Hhd2O5STzo1fAeNt39EhGhsyDGpfw/ioQWUxIw5Eo9hi
7Ii0lEgFmCxOpWLCOqZP005PYcqgYIy9Vr0Vjz6zVx+OnZyabvIaXOiMzTH7aLY8
S/XgG1xat8hrKMKg6N6CfdhocRo2X8y2/wqj46EmqcSaPhHObMLiyWhoWYJbtS8v
9RhA5ext4pv4IebPwZom09QbJH3c3QwTW/eh+WEQhz/3UUgttHIiyR5lC4a3AHuI
nDyT+QgtJFHeYIRCCF6cHF4D8ieUgq7qETZt8H2hRMAkFLQOtqta9UF+hhxYe6bT
C2hrKcEIT3bnrii6OHdTCxlllimj+cGugsRipVvkk5YI8TvehQ+blZmg+5A4BBnS
GbskysbF6apJzDTjYIJQ0MAMnAoqpNvtH+wL935GtA586DGVKfaKrILhBwLrIgFt
YiTBjv03lYyN8euSFNCLtPvEtHChpcgvSqFZSrq49OZ6iQYhXF7EbRxKApSa+YuN
QFxyUJ9L7D7S4tRJZxwuxP9H6CV0xRx5Eg3vLlyd8rgwP243BLE=
=V81z
-----END PGP SIGNATURE-----

--UibA4pFHsH8a8/z6--

