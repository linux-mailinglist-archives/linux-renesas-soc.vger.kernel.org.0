Return-Path: <linux-renesas-soc+bounces-26680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE87D1A01D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 16:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D6D43083A92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 15:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AE3303A0A;
	Tue, 13 Jan 2026 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMyBMdgK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1BE2F0C49;
	Tue, 13 Jan 2026 15:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319156; cv=none; b=K1JRs/521E1lEusnChojshmkOsad0GB6XOl9E1OlNxqgn87Y7Zc1EEt03uJjBrshY58WrKtCsQDTmoyQEgFKYtB2+H8zIE4RXJvFwBuzeA7sj+c91K+mzFQU1accmoL0jF7SQoTizZjHQb+U1a4hCE0ZvWRrpT6svH8QzqDeIxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319156; c=relaxed/simple;
	bh=h+Xm2qMGnA5x7FszB8uRvS9zkV/vE1jZSaeLyHnYWl8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=toDVnUXHeKmHL3nDgcFLSNPA9oHfFpslWe36osGkYUxW6gvXLbGaOddB8Xp8QVDK6VHRV/R2hl+UarFpzTvBm3rPtEqkEIkyFkYPESUy2JUIsVI/M1RqC6f7e2MbENpBScA9L+WFvEAN3ua+bmus2eON9M5dg7w4paocDV/GuXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMyBMdgK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C339AC116C6;
	Tue, 13 Jan 2026 15:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768319156;
	bh=h+Xm2qMGnA5x7FszB8uRvS9zkV/vE1jZSaeLyHnYWl8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=HMyBMdgK8BXz+mo5Mwd2Kqeek8eYBxL+YibX03/VBOFChyul9JzNXslmZumjgxUbb
	 8kfX6ODB7lXircFx3eLcfbFCDB+8RJLTsVQHRBiXcLjXyDj4tx95cZdOd7cEJEInTW
	 hDtaYfiGImcMOzG3RthcWeQ/XY0tToCYAVDln6P7gAiZ+HELZNV9e6QHToEtuvWkzj
	 wUj820GdMq2tuDMOCZMzHXMqGaPgkUZzYTNY4O/2g6MGluLFf+K00uetORWg+ruDtH
	 PKL1+uVYOFpBrV484prKk1StFnUAN78ptPSrru3FZgTzmy70QOgj8T9ElZELEvMeW9
	 Zm0Gk9BEpvaKQ==
Message-ID: <891932fbbb8fdb13285ac2055685eaec@kernel.org>
Date: Tue, 13 Jan 2026 15:45:53 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 6/6] drm: rcar-du: lvds: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-6-8d7a3dbacdf4@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-6-8d7a3dbacdf4@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Kevin
 Hilman" <khilman@baylibre.com>, "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus Damm" <magnus.damm@gmail.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Robert Foss" <rfoss@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

On Fri, 9 Jan 2026 11:02:55 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> Since the companion bridge pointer is used by .atomic_enable, putting its
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

