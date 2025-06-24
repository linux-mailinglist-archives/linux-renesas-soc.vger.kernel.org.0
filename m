Return-Path: <linux-renesas-soc+bounces-18641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B92EAE5FF7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 10:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA9A23A64FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 08:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899F62798EB;
	Tue, 24 Jun 2025 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1ieF0xq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2DF2797B8;
	Tue, 24 Jun 2025 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755185; cv=none; b=fjY9BzLG4bE4DkzUlrBmnTLh/s/W1OqL/a3Xx2s8HCyioU+EqSMi5e9fGOGLnohhy1v9vxAr47trZM1zeL49jWzK9iHcn9XCXWK3DLQZO9Ym2+i/rchEPiOJXSBFpwmsEeeWgvlGPnO9KxI0wpaLcGejnzVpEErUQTLDnDsaRVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755185; c=relaxed/simple;
	bh=0HGRQPm59Pg/7P9uBVV7QAOblnknaZe8TzNj9SKviec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdzhPi4pDKWxEHF1bq64x+Llvpxd2lEQc05P1GBbCD/2DAjaylxDMolJFac7d613YRhLJNrELuWCBqEseGXjj8sWAMGkTXuhYrv8JPzpKHudfVNwXImELvSUyFtVTiU/j/0obBB6sK+iE2QMX0amyS5FvumGdDWPP04KU29ldb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1ieF0xq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F24CC4CEE3;
	Tue, 24 Jun 2025 08:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750755185;
	bh=0HGRQPm59Pg/7P9uBVV7QAOblnknaZe8TzNj9SKviec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1ieF0xqmJpXU2h/I0y88hR3cOzu7Dge9teAEkYM8fTROq7PQkvkcL7BkYR7hsCMN
	 c8YRzMRCAv276zeoajjd+2xVrc5Rzxnxjd4HrL/4O+IhU6adFA9Q+JxmQ69wvBnUgP
	 vEFu8bCHm2FtzRWqWtNaPQBke4HKSbRKN0qeWFPIBFETCALOEysdhV3CQZV+kKG+ka
	 ZbWq7UDsil1m42vYE6qNaJVviJe3XFI9gA6lfL95ycbMfn5KOjO/XfTTThfs2LA1in
	 uuIMS46FaEreJ4dEfEmJVprXq91Y78wWaJlrq2avK01M6k6M9wFpI/8gm9sAh7H/b/
	 BSNozO4+TIPrg==
Date: Tue, 24 Jun 2025 10:53:02 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 04/16] drm/panel/sun4i: Keep up with refcounting
Message-ID: <20250624-invisible-khaki-hog-14f5a0@houat>
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
 <20250619-b4-of_drm_find_panel_part1-v2-4-0df94aecc43d@redhat.com>
 <20250620-groovy-imposing-reindeer-e52ed0@houat>
 <CAN9Xe3SsdbwXvDav_TUkryN3nXjujkwMTtcUcigavy5FZ29UcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7gzjxsntd33bcrpz"
Content-Disposition: inline
In-Reply-To: <CAN9Xe3SsdbwXvDav_TUkryN3nXjujkwMTtcUcigavy5FZ29UcA@mail.gmail.com>


--7gzjxsntd33bcrpz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 04/16] drm/panel/sun4i: Keep up with refcounting
MIME-Version: 1.0

On Fri, Jun 20, 2025 at 03:54:10PM -0500, Anusha Srivatsa wrote:
> On Fri, Jun 20, 2025 at 8:27=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
>=20
> > Hi,
> >
> > On Thu, Jun 19, 2025 at 02:15:56PM -0500, Anusha Srivatsa wrote:
> > > Put the panel reference back when driver is no
> > > longer using it.
> > >
> > > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> >
> > When I asked you to provide a rationale for why you think the
> > drm_panel_put() call belonged where it does, it was pretty obvious it
> > needed to be done for all patches with the same issue, not just a few
> > random ones.
>
> Well, not totally random. THe intention was to specifically explain
> the cases where the drm_panel_put() is part of a probe(), enable() or
> attach() like function since that caused confusion in the last
> version. There must have been misunderstanding on my end when I
> thought only those cases needed additional explanation. I will make
> the commit message more verbose.

Eventually, it's a memory management thing. You can't judge how a
driver, framework or function uses the memory from 3 lines of context.

This patch is a good example: it might make sense from the 3 lines of
context. But if you consider what this function is doing, and how it
uses the drm_panel pointer, what you did is broken.

Maxime

--7gzjxsntd33bcrpz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFpnbgAKCRAnX84Zoj2+
drFCAX41sEkvCTao7a9yQqRtmSfin2kdKCV2JaZfI5cw2dFqsTvw73LOz/t6iRwi
Q+hmmYQBgIRnOILmbnDBTcsLHPwlfo8Xfh92lsXrdf9u2Wq1obP7UONKXxeWc3yG
BRdzhtk14w==
=LaLM
-----END PGP SIGNATURE-----

--7gzjxsntd33bcrpz--

