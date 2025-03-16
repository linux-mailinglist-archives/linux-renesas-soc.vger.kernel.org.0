Return-Path: <linux-renesas-soc+bounces-14426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D05A6344B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 07:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A89791896A79
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 16 Mar 2025 06:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6E4EBE;
	Sun, 16 Mar 2025 06:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="T/vPGh5V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C65818801A
	for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Mar 2025 06:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742106171; cv=none; b=VlP49hIKba/u/KF32t9EBqiRn1aSlAlBkP9qC7Mk1oIq0uVkGMo8MgkNRHaQaqqKV1DlJfGeoujJ9TcPM1vf/Q2FdfM65T6fjeNQ3vnu4m95zvuDkgIp9QG6gMxMTIiapNimsOI/LfJp03fDA1IceoqLIg77AEhLnftSNPQxt6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742106171; c=relaxed/simple;
	bh=F1rIk6VZH/azGNji7OeI7aAHXgadwydp/q5g5bGaK2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAZyetis3/c1F3UmEDZyZhBAFro1vN/PsP0a36behESPvm823xSjbVS0zwRwDXTKd7B5+pzm19vYbDTXDAgtjpnLJUWPmCgrmjgx6GjkhQOVFy41Ofl7IWZNlm6UNO0d71/mKq6hUcMNuK2eKPP43wYxfIaJwk4fK9ORXFHsyqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=T/vPGh5V; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7NYk
	JOiSGPMKy9n2mP2Vw6NtFwCcs99P39DQEPOBq4A=; b=T/vPGh5Vv5rPJPWndC2/
	im9Ln+/soEnEpzNzCouqiAVfs7Zvu8UVUAE4ftjTTk+vW4y7RfvGI15a26R3skDh
	Pts4V9WtyvfepWTdlfksRh/ImAAZRnEZB5sCEbbtmntiCw40Jha4vVCcEalxUNHo
	cHiIYEzZTli7+LFfR4Ygn22ZjtwX1i21MB8++SLkn2ngO0J8b7mMseqjFAPnqJL9
	P/RTx+sHVRjqdd7vxWwgU+VGCG/tTMpRupYyLDo5CbaMVf1/BMLgL59p7uOf2tXr
	OYH+8MLphTFT1yqLqDd/EGF8FGvAd8CjR8PtvSDmf4yQpJrKkmTv52y/Yx8Y93pv
	Mg==
Received: (qmail 2596397 invoked from network); 16 Mar 2025 07:22:44 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Mar 2025 07:22:44 +0100
X-UD-Smtp-Session: l3s3148p1@g4gNs28wrrUujnuL
Date: Sun, 16 Mar 2025 07:22:43 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: make use of debugfs_init
 callback
Message-ID: <Z9ZuMzPS8dmQWe8D@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-renesas-soc@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
References: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
 <m46j43oj4twmpl7ild4ej4wjfuxjddtaqg4ilg5zi7dnnua3bo@oqd7uu5sr6lk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r6Wk6EJr+tNxmAiF"
Content-Disposition: inline
In-Reply-To: <m46j43oj4twmpl7ild4ej4wjfuxjddtaqg4ilg5zi7dnnua3bo@oqd7uu5sr6lk>


--r6Wk6EJr+tNxmAiF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 12:43:48AM +0200, Dmitry Baryshkov wrote:
> On Sat, Mar 15, 2025 at 09:15:11PM +0100, Wolfram Sang wrote:
> > Do not create a custom directory in debugfs-root, but use the
> > debugfs_init callback to create a custom directory at the given place
> > for the bridge. The new directory layout looks like this on a Renesas
> > GrayHawk-Single with a R-Car V4M SoC:
> >=20
> > 	/sys/kernel/debug/dri/feb00000.display/DP-1/1-002c
>=20
> Would you rather create a subdir using the bridge name (ti_sn65dsi86)
> rather than dev_name? I don't know if we have an established practice.

We don't have a practice yet. Keeping dev_name() was Doug's suggestion.
But I like your idea better, so I will change to it. Thank you for it!


--r6Wk6EJr+tNxmAiF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfWbi8ACgkQFA3kzBSg
KbZQMQ/+M1re27AC7gCaDR+T1BZuxiPfVP6l/K9YNXIYEAPZQPtZW+aMrtlFqqoo
UBAuTidU+g/NLgL9kAA1qFR0PI2tER8RCiNWPEQaM7GWjf6s5lfXYU8xJ+D1CFxf
QE3WBddDafkivdFw0fscARWT8LhtgbIaYyJKv/9HAGM0UfKQzYHGCKyCAoEVqP8a
6rImsq7M151pgdmZzNJMXNyjUsR6Z6fTjkxp6mAjLoc5PYiua2N6RIRia1CnQw6y
9hyMt2XShx/FNCGAjkJsdNzOrH9/gvlBfw/n1cTayZQx6Jl5562fYdPx7TkQ0KtU
oTA9XTZbZTYqKiOX+BAJ2pqcqRmAOZv69kTbeAKTBH4WoUiLIE2nKdx1XDLPMLV9
vOUPfiNhVkWI4L/lwme5Y3Y3vBTA2+qv6dRs9k7T4Cnx+rLy6DmCzKdXvGwltyhU
gpu/mzkcMQhop6SX2DISytHHPHB+DGZ/CZakq0XqHl4CmnDfk62EGaeyJr986xok
jiDqlgqCiAiBejBrbxLUbT51mBIEUGwkTpQS52Jz+92COZlSh5YFbjqXVnhPHPBR
QsfnrwB8uja2HDk8kI2bhDQ6g/MzGGjIR+G6U7dnDYX+gSw7lJZn5vVsxfzJ6OMt
v5cA2aD0MkIw74s6XfRKGbPKlVZgWt5nvA7n0Xz4Rb/nWnELe5M=
=9P9m
-----END PGP SIGNATURE-----

--r6Wk6EJr+tNxmAiF--

