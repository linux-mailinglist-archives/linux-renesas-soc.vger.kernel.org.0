Return-Path: <linux-renesas-soc+bounces-17495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42527AC3CA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 11:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E14CB189712C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 09:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8686E1E7C05;
	Mon, 26 May 2025 09:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCwpUXV3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3941A2622;
	Mon, 26 May 2025 09:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251591; cv=none; b=IBw4gqfreJIrNdUvFQZQLbMIzRWqgZLv2uCMBHFTocv8mFoSLvsJtlTAgYCFWLKdYgT44uwvmiP34z4CLdiIBIuOQIYBcNUyIwespmAKVFEGaJVEnBuEn3DWcN2f7IWnjTJTMsJyqAS3yUS+nbawRyg2RtqZUdzqzpIxZYRejq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251591; c=relaxed/simple;
	bh=ojrBevA7GejYEBIQfE9GKMWuRZ7nBmq+XTqKOKUHr8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibqbc/M/qicq8+r6us9geJDIhoR5jbccjeB6woj9rLnrjNV2H97cplhsDLm6AD27j2JK+RWbLvnROjNSpH8GDnJZOFhy/kSvpfCqWzpAqn2oUi/HEKCQ8TX4GmZjzeY1EtLzvJ4iho8Z5TmdAuS4EgsGnFzW/Kg8Had+KAJrVec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qCwpUXV3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C27C4CEE7;
	Mon, 26 May 2025 09:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748251590;
	bh=ojrBevA7GejYEBIQfE9GKMWuRZ7nBmq+XTqKOKUHr8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qCwpUXV3vD0bOazwR+gril9gdcxCS0No/u9txn6Va+RmH8/bJtOjj2QlW7ZvdcJeP
	 mPwdwKEiqGainFy1jviInZ1XLqpRRlPJ428FSQ7VqGyT9JEUjtOOgmcaB37kznQ/ei
	 mj5Gdbz0cxkwO4hVZt+j9ugXdhV8MaeMahlED0cT/fuUU1W6iKMZcJWTSCBPw66CZA
	 DEmB8etctkUQGqUFh0Ow4dRen5r3JKVSYNjosYniAxPALzv5cXs7G3n5ydRyH5ZHPH
	 EW4pmqqewsesT884KhOLqaa9y1tagWVNbCC++fQ55qeR+231v0CHLJEIVO/BZn+QPD
	 WaRLduPwIG7Rw==
Date: Mon, 26 May 2025 11:26:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Douglas Anderson <dianders@chromium.org>, Adam Ford <aford173@gmail.com>, 
	Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set()
 with atomic_enable()
Message-ID: <20250526-cryptic-blue-mussel-ac57fe@houat>
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="shmlyimfb2v5wudn"
Content-Disposition: inline
In-Reply-To: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>


--shmlyimfb2v5wudn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set()
 with atomic_enable()
MIME-Version: 1.0

Hi,

On Mon, May 26, 2025 at 10:54:52AM +0200, Tommaso Merciai wrote:
> After adv7511_mode_set() was merged into .atomic_enable(), only the
> native resolution is working when using modetest.
>=20
> This is caused by incorrect timings: adv7511_mode_set() must not be
> merged into .atomic_enable().
>=20
> Move adv7511_mode_set() back to the .mode_set() callback in
> drm_bridge_funcs to restore correct behavior.
>=20
> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI connector h=
elpers")
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Explaining why, both in the commit log and the comments, would be nice.
Because I can't think of any good reason it just can't work for that
bridge.

Maxime

--shmlyimfb2v5wudn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDQzwwAKCRAnX84Zoj2+
dvTMAX93ht/JowUzBPWhgbxbNVC9lVUHcqu6M3gZR+4cG5/oEN+y1lytCT5Z92Ck
ZjSwvKcBgIZew4gQWouo5j6mutuVebRAh86tQMqQxijXhRiHmiLV5io7DTfVVbB6
QdOZnsKSmQ==
=cM3B
-----END PGP SIGNATURE-----

--shmlyimfb2v5wudn--

