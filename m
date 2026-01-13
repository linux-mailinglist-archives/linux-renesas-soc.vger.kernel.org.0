Return-Path: <linux-renesas-soc+bounces-26678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A018D19FD5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 16:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02BA530012F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 15:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EDB303A30;
	Tue, 13 Jan 2026 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vj8jfYtw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E942C0298;
	Tue, 13 Jan 2026 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319125; cv=none; b=dTLEggu5qbSpElfSk0J0vXLnPxkY6wEukkRmIQHrztXxV1tWfR1newjh9b2j/aiPFXAKKBqY6yqSOB30iVaJfBBUlCWC33mzSdqFApBtrxW319sYJgbjdMdOtPX0JRy24eOoYmEC+y6QKRW2BjGE1/PrMwDvsFjRXc7JUD+1kis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319125; c=relaxed/simple;
	bh=QHGVjit8VwhbShRK0/bCyoMxk6VdPqYNKqTmhctqjgI=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=JkmCjB9vYnXgHeAc2kI1pytRxdevLNtOJYTNHsyiQAbTyN6/I5J4alR6b2VX/7ku4uKmStzgm/26joAUwnVOI+aCqS4RhOkoBkMiESl3Vu79XtVyV9jzED8+f8ruYzsMosJmPdhJ5eHNsJ1UPwSCWgRYfL1tMvpWV2UAtzhgExI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vj8jfYtw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E26DC116C6;
	Tue, 13 Jan 2026 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768319125;
	bh=QHGVjit8VwhbShRK0/bCyoMxk6VdPqYNKqTmhctqjgI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Vj8jfYtwVpN34UwgShpcL1FzDSlbpS4bQm/7dqRQuoY033E5XM6Ez+rNImqngRxaB
	 nACj9ts4NjsXPOn6EI8eK2xmCitwWCkFZ4Y6xRKBW7pACKehM0GcKToi2UWCQXMxSF
	 ALNGfep40AaS5dnCgcrxri74TGGyx8aj4aKHim2wtG64SFu+zmj3Zk1BPgB5ry6A+g
	 sQUuF5paG+KZiBnPIXtW6y3Vl9cYgfEXAJsC38IoaXWC5Fy8rTH+Oe/wnzRAgr8BR1
	 DhE/OshV7DBef0v+a+FogMakqTnHanKfmyFi84uzDFx5lJekUOyGnmb8xmUvOU484p
	 tIUyS5z5f9x3g==
Message-ID: <f83f12627d2e010007b84931049632f1@kernel.org>
Date: Tue, 13 Jan 2026 15:45:22 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 3/6] drm/imx/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-3-8d7a3dbacdf4@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-3-8d7a3dbacdf4@bootlin.com>
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

On Fri, 9 Jan 2026 11:02:52 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

