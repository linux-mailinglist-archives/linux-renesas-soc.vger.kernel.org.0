Return-Path: <linux-renesas-soc+bounces-18584-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB528AE1C32
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 15:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10EF24C0A52
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 13:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A14329187E;
	Fri, 20 Jun 2025 13:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOvXj3rc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A51028D8E5;
	Fri, 20 Jun 2025 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750426059; cv=none; b=A5JsQz8n5b8qwPdD0c4jSLUaIeIfMMPXJ/4b2htGczw9H5FxfksiD2iC5pb2U8SW2Zd/Q4i8aRqnqtQKn1FymdbD2nZLCu392pZQ86WH13cisJJWIMzHEW7KgpYk+sNOyizkUDI0xX9oouFBlUrZNaoJ3X5/3qNo5BoErKmp2gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750426059; c=relaxed/simple;
	bh=7iO3Spwl78oqvR7sBJ2s9rW+W2FFODb7uMsgMUDC2CQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQcwkLeQtRFXIr6s5oFNbME5MNkJOJ3Glu1RYpMWC4SKbRXYOB488iPLuv/QynA5lU+WtMujTE1uNDRFtMOwwL41ZXWw6Gj6yz1azJngEHgG+33ADf81ibZDJmQdu2VZdDP3RRz77B86PbQZTbPvNdTZT15LOeyR7rcjqRucVuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOvXj3rc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10046C4CEE3;
	Fri, 20 Jun 2025 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750426058;
	bh=7iO3Spwl78oqvR7sBJ2s9rW+W2FFODb7uMsgMUDC2CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fOvXj3rcFOvEn7+6z2VCgBASlxMhFXHKU0pYL1+VPMPsw2hcdVW+WTzTp5F8GHa+R
	 u0LhsP5h1Em5JyH/IPLhFcL4OeNNPJk6899oXGLsDhgfFKRNZLVBbA9p214KlHqfOx
	 C/Uc+tZGtio6132bYstHc81NMVl65Oi/HPNqtYCizlTw7ayFFyQr+HKWDyzmNus1xP
	 +9QEmVgYIdUaFamjX53zwHgJOfe7SYq0yO6FQ8ChzilK5h3ygRfq09C+TQfIsF4XKv
	 0GoONah3IfiinYalyMqwADfFD4eP1rGE3Qt87rnpopKK9/PppSeF9UU10H5hKMkfNo
	 rZHz0DLhR+zMQ==
Date: Fri, 20 Jun 2025 15:27:36 +0200
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
Message-ID: <20250620-groovy-imposing-reindeer-e52ed0@houat>
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
 <20250619-b4-of_drm_find_panel_part1-v2-4-0df94aecc43d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="bdw7jb5mvkrn4ozs"
Content-Disposition: inline
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-4-0df94aecc43d@redhat.com>


--bdw7jb5mvkrn4ozs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 04/16] drm/panel/sun4i: Keep up with refcounting
MIME-Version: 1.0

Hi,

On Thu, Jun 19, 2025 at 02:15:56PM -0500, Anusha Srivatsa wrote:
> Put the panel reference back when driver is no
> longer using it.
>=20
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

When I asked you to provide a rationale for why you think the
drm_panel_put() call belonged where it does, it was pretty obvious it
needed to be done for all patches with the same issue, not just a few
random ones.

Maxime

--bdw7jb5mvkrn4ozs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFVhwQAKCRAnX84Zoj2+
dhZ7AYDOISUO6C76OQb9MnRtqKLlnfKoNLnLbNNJpHKiYfBhR0RN5gz9giVgJRKz
6JU4aXoBgPNzjBXU7e39cZGKgNcl1PHMh/B8GaoCK9FIE1cDbftlr/Xb8NYNNyEU
Z311rJJ3bA==
=G9Cw
-----END PGP SIGNATURE-----

--bdw7jb5mvkrn4ozs--

