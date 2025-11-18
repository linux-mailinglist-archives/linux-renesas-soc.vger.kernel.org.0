Return-Path: <linux-renesas-soc+bounces-24737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AB3C6A643
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 16:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C61D34E6026
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519FF35CB85;
	Tue, 18 Nov 2025 15:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwXFqbf3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D59D2F6909
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 15:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480652; cv=none; b=AcKzIZ0PsJIdIefoWnlAebYq7BbVz7okL/XEc+VClA0Y6iSHX8qixdIJbwLgeUV/WlUFuAWtx2STbndk3Y7u/UpG/NAL41kdHG8F/FVE24lJPsIb7sLk3SIoDPF3Iqa5tJK0hwFdbWOELff77MqGXRoidiUwj/sNn0JKNeVhhN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480652; c=relaxed/simple;
	bh=fPMobCdaL0FOBplLcMBrhnDqTORQkIgrmqJMrXuIO2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdkYCuREsu0iUDD0ISBDoSGKdyWW8LQFeE2lkaEywAquvqve9Qc+wjXoXex6cut68ogPyvCzCHgUfvlpDhvLoib973lakhVd8GY5ADSl50/8G3QienvvtA2/gG4z9xTUafoxVqVz4lGizwL3Mx1b7kGVggM8dSMAhM8VGqp/0UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwXFqbf3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8B7C116D0;
	Tue, 18 Nov 2025 15:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763480651;
	bh=fPMobCdaL0FOBplLcMBrhnDqTORQkIgrmqJMrXuIO2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WwXFqbf3G8hm+/Hj8BtHUHFguYbM/9cxbGPe39D/4i2azDjf13+V5Z5EwBHqExQIk
	 uCODL8v1HrEfc8QAD921ikF/MqxyBRTQ1w6XbK3ulD7WU0amFzvjpNJ+zW/G7muyJi
	 9u24Kk6dyITjbgaIa/yX6t3GtLkaK4DWoeKvPW6jRj6JPqGw/GxEipSwo19k8Lh8uJ
	 2p6lcuaTSs7ZrYgtu/5acJNbUvjhZiRwEImqQW15Xi1oselp+leq9BheD2qu6s5Ebh
	 7yOEeMLN6pJLk2ffNwo/GBoO/oTem9ZP42HYgqPVw3uSk4Ryu9fWTgCbNO9MibgO1l
	 WZ7TgO3lTnaww==
Date: Tue, 18 Nov 2025 16:44:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
Message-ID: <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="egvq5gtiq3uff7un"
Content-Disposition: inline
In-Reply-To: <20251118150128.GB23711@pendragon.ideasonboard.com>


--egvq5gtiq3uff7un
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 05:01:28PM +0200, Laurent Pinchart wrote:
> Hi Linus,
>=20
> Thank you for the patch.
>=20
> On Tue, Nov 18, 2025 at 03:36:05PM +0100, Linus Walleij wrote:
> > This adds (yet another) variant of the
> > drm_atomic_helper_commit_tail_crtc_early_late() helper function
> > to deal with regressions caused by reordering the bridge
> > prepare/enablement sequence.
> >=20
> > commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> > "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> > caused a series of regressions in all panels that send
> > DSI commands in their .prepare() and .unprepare()
> > callbacks.
> >=20
> > As the CRTC is no longer online at bridge_pre_enable()
> > and gone at brige_post_disable() which maps to the panel
> > bridge .prepare()/.unprepare() callbacks, any CRTC that
> > enable/disable the DSI transmitter in it's enable/disable
> > callbacks will be unable to send any DSI commands in the
> > .prepare() and .unprepare() callbacks.
> >=20
> > However the MCDE driver definitely need the CRTC to be
> > enabled during .prepare()/.unprepare().
> >=20
> > This patch from Marek Vasut:
> > https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenes=
as%40mailbox.org/
> > solves part of the problem for drivers using custom
> > tail functions, since MCDE is using helpers only, we
> > add a new helper function that exploits the new
> > drm_atomic_helper_commit_modeset_enables_crtc_early()
> > and use that in MCDE.
> >=20
> > Link: https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regressio=
n-v2-0-8d799e488cf9@linaro.org/
> > Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2=
Brenesas%40mailbox.org/
> > Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enab=
le and post-disable")
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 35 +++++++++++++++++++++++++++++=
++++++
> >  drivers/gpu/drm/mcde/mcde_drv.c     |  6 ++++--
> >  include/drm/drm_atomic_helper.h     |  1 +
> >  3 files changed, 40 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index eb47883be153..23fa27f21c4e 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -2005,6 +2005,41 @@ void drm_atomic_helper_commit_tail_rpm(struct dr=
m_atomic_state *state)
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
> > =20
> > +/**
> > + * drm_atomic_helper_commit_tail_crtc_early_late - commit atomic update
>=20
> Based on the function name, it feels that the nem commit tail and
> modeset enable/disable helpers reached a point where we may want to
> reconsider the design instead of adding new functions with small
> differences in behaviour that will end up confusing driver developers.

Agreed, and I'd go even further than that: we don't want every odd order
in the core. And if some driver has to break the order we document in
some way it should be very obvious.

If you have a single user for all these new helpers variants, you
shouldn't be using the helpers at all. Go with a driver specific
implementation.

Maxime

--egvq5gtiq3uff7un
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaRyUQgAKCRAnX84Zoj2+
dnY5AX9iZHY/r2tVzkrfThZnjfOczM7NRxE5jEcho5iiWb9htyjQkGm/EovpA9Su
VLbfXqgBgOZOpxB2C1cTz97QuQRbskUCkanBSs8nqjVeuq0QNyB9v7wb8vI4qkxP
Jw8dHysUfQ==
=2YbF
-----END PGP SIGNATURE-----

--egvq5gtiq3uff7un--

