Return-Path: <linux-renesas-soc+bounces-27199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHMwKPbScGkOaAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 14:21:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2210657763
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 14:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 589938E247F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 13:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B289448A2D9;
	Wed, 21 Jan 2026 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="y60xwBm3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA9A2BEC5A;
	Wed, 21 Jan 2026 13:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769000993; cv=none; b=amw/bfP0MhqzXGP+3SGfuVXDwJslPoCtLuNcM4t/d0KbKNKdxznT3GsimVUZq+8igFqxN+BZmHn+OJZm8EEg1Nw0E7HwA4oQTj5GbGQsBQF3xiaXTSX7NUxzalkFm03pg53UiPqpXDwODe8YLYENmEl9fPY1LQzhoenWrrU2Kpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769000993; c=relaxed/simple;
	bh=3enFVxpsJ0ZAQNX9shyEl/w+8bES5Y3UL9aVUuyBjTE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IafDLvSxCb4nfG7qvqWSmtXxtnJHZRrYi7DyZBwBgDnvK0xrWGGTKitHTfBph6+UE8fRtXR5TRuhtwjNFWErBeEWv/5M3oTgXX7mKcDxfGGwmxRsTnmQe1xhuW+uRkcJbHe5DnofQ7v1G81bY5/qHfzZiBMGI5hsKDe+2O7Ig/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=y60xwBm3; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 263A21A2994;
	Wed, 21 Jan 2026 13:09:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E831E6070A;
	Wed, 21 Jan 2026 13:09:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1864119B12B0;
	Wed, 21 Jan 2026 14:09:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769000986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wZQftdk2nD+KUg1koynnm115h0ip7JWIlzvZWrt2KVA=;
	b=y60xwBm3xBqZIT8UiYIEJC1jmdN8HJp50cHs3G3ihI5ZArfnGhhrDedj2MG09NvX+QDlQX
	upp0ldCVvnWrEUjJvZvWNWKylSt1StNKVf4xwz58pIChVXAs1jOd6c9DZKq+W1K34lsE9g
	//T7Ds7Mv74Xu/O+cc4S5vJn1tUFJ/575ztvoEjJm3J2Csz8vdr5SOEk5nawaVwhwzf7m0
	AML5lo5TXHe6QOVd+hlDkDYvp5/oqwOh/TW7bZQcLCwod2zaw5CoFmhRd+I3kB4EJWMDot
	HOA/Lx1NGRnjvTnTln6ZLrP6ZWSsFCJv/uCjkTCWpinzCFD1A7hA1gsnoxcqFQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
Subject: Re: [PATCH v2 0/6] drm/bridge: convert users of
 of_drm_find_bridge(), part 3
Message-Id: <176900097537.2193756.17458623342246187982.b4-ty@bootlin.com>
Date: Wed, 21 Jan 2026 14:09:35 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27199-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[44];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,baylibre.com,googlemail.com,pengutronix.de,collabora.com,samsung.com,glider.be,bootlin.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[bootlin.com,reject];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 2210657763
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 09 Jan 2026 11:02:49 +0100, Luca Ceresoli wrote:
> This series converts many DRM drivers from the now deprecated
> of_drm_find_bridge() to its replacement of_drm_find_and_get_bridge() which
> allows correct bridge refcounting. Where applicable it also converts
> per-driver "next_bridge" pointers to the unified drm_bridge::next_bridge
> which puts the reference automatically on bridge deallocation.
> 
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [0].
> 
> [...]

Applied, thanks!

[1/6] drm/bridge: dw-hdmi: convert to of_drm_find_and_get_bridge()
      commit: 4e7fd5aa3f3939dfcd8b0578de57f1cc00d6c31c
[2/6] drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
      commit: 9afbf7a9cce584e3ce7b709ea5654f2721b00694
[3/6] drm/imx/dw-hdmi: convert to of_drm_find_and_get_bridge()
      commit: 6dfebeee296cbb3296f06c28f3b2d053ec8374e7
[4/6] drm/mediatek: mtk_hdmi*: convert to of_drm_find_and_get_bridge()
      commit: 4ace6fbcd25f5ef275c91b93424e715f96197e50
[5/6] drm/exynos: hdmi: convert to of_drm_find_and_get_bridge()
      commit: 2db0d298f22d685e0c9f7f66ab6470f12a0255b6
[6/6] drm: rcar-du: lvds: convert to of_drm_find_and_get_bridge()
      commit: 95d628c9e4738c070ba780488efbab894e583646

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


