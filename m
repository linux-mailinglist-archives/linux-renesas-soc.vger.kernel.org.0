Return-Path: <linux-renesas-soc+bounces-31449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GWKCYM/52no5QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 11:12:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F17438AF7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 11:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CEE2300D15A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 09:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC963A16A2;
	Tue, 21 Apr 2026 09:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YjfI2GPO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BC539A81C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 09:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776762729; cv=none; b=mQp/viDM5c1OKqaRqndYWDtln6VPaTHdVOUMlaWewGwFuiuW5YsO2BH9v0jYn1m4rijdQIAzk1huPRcRF2QNxKVTmsNIafnnHxuNidAo3CHaJN5TSwrdzPk+rgtFpVrFLLesVIRcMKWVPg5upnKoBMt9zhZNPsuEkK4ZWSb194Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776762729; c=relaxed/simple;
	bh=UEc9YNNpucxttkg3RGgjOeXtWvIE32NIEI5Hvi0Fkgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=frt+IKohe0S/tqg3Mm8KkgG2RlRjZX6EX/Oa/6Fk5dRfT7wq//cWhnJ2XNfxZbo6MJQywgoA5D+QJ8iunW146wk+TwzKkG/DnjTDCkjCVT48awKm8nHKN161TJlzeDob2FrLH7D0PZbykpN8gqddL9CYHwGaSEyLmQwbhu/RJHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YjfI2GPO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d43e09de5so2189069f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2026 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776762726; x=1777367526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D4ShzPYZF8P5aa2FyFk22XMxsjQJqHFxT1MYEEzO2jc=;
        b=YjfI2GPOAc0ILkuFCqGQefRxZLeJq5hbRdnqjRwwqpRYvUjYsaXFapDQ7W79bW7Z20
         irmYirOiWD1RY4qonrNWovVh9Ua3AG5GwZePCNzEb1BsB69oG5VPvjeDqXOV7/CN/2Mc
         MzdRf/jxinGyoyGf1+HrUNfBmTazAzSjeDSwAd1vvSmNsgBRik+mlIMCEGAFHkb5sPM8
         JjoOW8Q4G1Bpl+rsYmLu/UeyT9di5UkCxr/twixeA0q/3gjBfoBLcRZBtYU07XrYXXr2
         kaPlWMD1ETcSyAZOW4ZI5hkQT5l8Oso+bPVT0F9jDCNgQl7zL9ioAadYMvzFyHel70vQ
         xe6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776762726; x=1777367526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4ShzPYZF8P5aa2FyFk22XMxsjQJqHFxT1MYEEzO2jc=;
        b=ePXkuKAzjlVF5J208m3qbenuSByHcnERMDIjuXUsxhacBDLixSctTxtH4TDslJ/uOR
         iumQHz0DaIrDbGcybEcm1p9v6NgPF41VecexfdPBgwi0oPpELryuvCON21RWVrqWTAks
         kAwvbnvvZ01vX+tzXw5W9aBl+qksy6HtS0rbXq2T6GdkePsAJo02x21SbVuLfh5xGVz+
         XtZu1PG1tqWAUl0bvWP1fwjA0Vmn9m1dlxNpiksu/+P/s3OIFdfd7bcqCXqrrJ46pS3D
         ytNE8IsVpx1qZ3aVpI08KbrSDizKi1PbwFIz1SWxV2N4B7ImpF1+Y0iTETdkDLuZV301
         gw8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+AN164JZpUlzTTDUndXClhM33TMeTQQZKRyd+BI25p4crOrF/so+vdPiRGW8r1sHFUHjNBAZFWik0/n2SUbsXj/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh7R//ObdiGQFKkEDgKOPMKo/wxNNwzRn5INKdyAelrYX5x1D0
	Cv6GXf0QA/BTPLxCKNvGpmq9HEiDhdHeG3hfGyL6uyWzmqaBUMp5b/ojR4u6xILeoCI=
X-Gm-Gg: AeBDiesIQXKSfNEllrZUqTMvGP6jKx/2TS0gsmE63UWS8HEfbV+q6bYiigm2AI+qBhC
	1QOQHVS+8MnE86AvBT/T7EMEwLpGhZcGWnDY3Ua24lKz+50LI5I5/H3/qLAzScyRTSBP0TP7S2j
	Ui18r1rDxAmeYDCK+MaI6FH52+eNvLHnG8ejcPE+dv7HwCDiNAgNk/G0QcDJ6qDZif0a5M2ZauL
	5daM7kG6Np8y7kntsFpzSdSw1B5ukVwUj74uOWApJDe3XF3qn/QjXa0Ub6c8wFDOkEUTGCdyw5s
	zZrs3NJH9We415BV926KxGQfiyIKvom/3cWd7ncYLrIORfcE2wsUg7ZtpIIqojFUTr86UMNUpDG
	lqydB6FINoVOQZDcOl/izU1+QfJ0c72YmpPvqnsasGkj7ttXNaEyVyiV3a+LX/jIMIDmC5J5Vah
	NyVG8slq68+fXAfZk0kbUMJPmwZXVeY1miSO4mZsTipA==
X-Received: by 2002:a05:6000:184d:b0:43d:e31:68d1 with SMTP id ffacd0b85a97d-43fe3dd958amr27187440f8f.21.1776762725378;
        Tue, 21 Apr 2026 02:12:05 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4ffa8sm35588267f8f.35.2026.04.21.02.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 02:12:04 -0700 (PDT)
Message-ID: <6d223449-8a5e-4565-b026-8c7cf6961343@tuxon.dev>
Date: Tue, 21 Apr 2026 12:12:03 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm: renesas: rz-du: Add support for RZ/G3L LVDS
 encoder
To: Biju <biju.das.au@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
References: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
 <20260417175235.224809-4-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260417175235.224809-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31449-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,pengutronix.de,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tuxon.dev:dkim,tuxon.dev:mid]
X-Rspamd-Queue-Id: 92F17438AF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 4/17/26 20:52, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
> mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
> from 25 to 87 MHz. The LVDS module cannot be used at the same time as
> MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
> the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
> MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
> module.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>   drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
>   drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
>   drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 333 ++++++++++++++++++
>   drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.h    |  22 ++
>   .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
>   5 files changed, 395 insertions(+)
>   create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
>   create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.h
>   create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
> index 7f2ef7137ae5..cbfc7b6bccb8 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -26,3 +26,16 @@ config DRM_RZG2L_MIPI_DSI
>   	def_tristate DRM_RZG2L_DU
>   	depends on DRM_RZG2L_USE_MIPI_DSI
>   	select DRM_MIPI_DSI
> +
> +config DRM_RZG3L_USE_LVDS
> +	bool "RZ/G3L DU LVDS Encoder Support"
> +	depends on DRM_BRIDGE && OF
> +	default DRM_RZG2L_DU
> +	help
> +	  Enable support for the RZ/G3L Display Unit embedded LVDS encoders.
> +
> +config DRM_RZG3L_LVDS
> +	def_tristate DRM_RZG2L_DU
> +	depends on DRM_RZG3L_USE_LVDS
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL
> diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile b/drivers/gpu/drm/renesas/rz-du/Makefile
> index 2987900ea6b6..46decb7ac4f1 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Makefile
> +++ b/drivers/gpu/drm/renesas/rz-du/Makefile
> @@ -8,3 +8,4 @@ rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+= rzg2l_du_vsp.o
>   obj-$(CONFIG_DRM_RZG2L_DU)		+= rzg2l-du-drm.o
>   
>   obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
> +obj-$(CONFIG_DRM_RZG3L_LVDS)		+= rzg3l_lvds.o
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> new file mode 100644
> index 000000000000..bedeedbdfada
> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> @@ -0,0 +1,333 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/G3L LVDS Encoder Driver
> + *
> + * Copyright (C) 2026 Renesas Electronics Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "rzg3l_lvds.h"
> +#include "rzg3l_lvds_regs.h"
> +
> +enum rzg3l_lvds_mode {
> +	RZG3L_LVDS_MODE_JEIDA = 0,
> +	RZG3L_LVDS_MODE_JEIDA_MIRROR = 1,
> +	RZG3L_LVDS_MODE_MODE2 = 2,
> +	RZG3L_LVDS_MODE_MODE2_MIRROR = 3,
> +	RZG3L_LVDS_MODE_VESA = 4,
> +	RZG3L_LVDS_MODE_VESA_MIRROR = 5,
> +	RZG3L_LVDS_MODE_MODE6 = 6,
> +	RZG3L_LVDS_MODE_MODE6_MIRROR = 7,
> +};
> +
> +struct rzg3l_lvds {
> +	struct device *dev;
> +	struct reset_control *prstc;
> +	struct reset_control *lvd_rstc;
> +	struct regmap *regmap;
> +
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +};
> +
> +#define bridge_to_rzg3l_lvds(b) \
> +	container_of(b, struct rzg3l_lvds, bridge)
> +
> +/* -----------------------------------------------------------------------------
> + * Bridge
> + */
> +static void rzg3l_lvds_atomic_enable(struct drm_bridge *bridge,
> +				     struct drm_atomic_state *state)
> +{
> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> +	const struct drm_bridge_state *bridge_state;
> +	int ret;
> +	u32 fmt;
> +
> +	/* Get the LVDS format from the bridge state. */
> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +	if (!bridge_state) {
> +		dev_err(lvds->dev, "failed to get bridge state\n");
> +		return;
> +	}
> +
> +	switch (bridge_state->output_bus_cfg.format) {
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +		fmt = RZG3L_LVDS_MODE_JEIDA;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		fmt = RZG3L_LVDS_MODE_VESA;
> +		break;
> +	default:
> +		fmt = RZG3L_LVDS_MODE_VESA;
> +		dev_warn(lvds->dev, "Unsupported bus fmt 0x%04x\n",
> +			 bridge_state->output_bus_cfg.format);
> +		break;
> +	}
> +
> +	ret = pm_runtime_resume_and_get(lvds->dev);
> +	if (ret < 0) {
> +		dev_err(lvds->dev, "pm_runtime_resume_and_get error\n");
> +		return;
> +	}
> +
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_BGR, LVDS_0_PHY_CH_EN_BGR);
> +	usleep_range(20, 25);

maybe fsleep()? Same for the above usleep_range()

> +
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_LDO, LVDS_0_PHY_CH_EN_LDO);
> +	usleep_range(10, 15);
> +
> +	regmap_write(lvds->regmap, LVDS_CMN, LVDS_CMN_RST_PHY0_SEL);
> +	regmap_update_bits(lvds->regmap, LVDS_0_CTL_OFFSET,
> +			   LVDS_0_CTL_FMT_SEL_MSK,
> +			   FIELD_PREP(LVDS_0_CTL_FMT_SEL_MSK, fmt));
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_IO_EN_MSK, LVDS_0_PHY_CH_IO_EN);
> +	regmap_write(lvds->regmap, LVDS_CMN,
> +		     LVDS_CMN_RST_PHY0_SEL | LVDS_CMN_PHY_RESET);
> +	usleep_range(100, 150);
> +}
> +
> +static void rzg3l_lvds_atomic_disable(struct drm_bridge *bridge,
> +				      struct drm_atomic_state *state)
> +{
> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> +
> +	regmap_update_bits(lvds->regmap, LVDS_CMN, LVDS_CMN_PHY_RESET, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_IO_EN_MSK, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_LDO, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_BGR, 0);
> +
> +	pm_runtime_put(lvds->dev);
> +}
> +
> +static int rzg3l_lvds_attach(struct drm_bridge *bridge,
> +			     struct drm_encoder *encoder,
> +			     enum drm_bridge_attach_flags flags)
> +{
> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> +
> +	if (!lvds->next_bridge)
> +		return 0;
> +
> +	return drm_bridge_attach(encoder, lvds->next_bridge, bridge, flags);
> +}
> +
> +static enum drm_mode_status
> +rzg3l_lvds_bridge_mode_valid(struct drm_bridge *bridge,
> +			     const struct drm_display_info *info,
> +			     const struct drm_display_mode *mode)
> +{
> +	if (mode->clock > 87000)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (mode->clock < 25000)
> +		return MODE_CLOCK_LOW;
> +
> +	return MODE_OK;
> +}
> +
> +bool rzg3l_lvds_is_connected(struct drm_bridge *bridge)
> +{
> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> +
> +	return !!lvds->next_bridge;
> +}
> +EXPORT_SYMBOL_GPL(rzg3l_lvds_is_connected);
> +
> +static const struct drm_bridge_funcs rzg3l_lvds_bridge_ops = {
> +	.attach = rzg3l_lvds_attach,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_enable = rzg3l_lvds_atomic_enable,
> +	.atomic_disable = rzg3l_lvds_atomic_disable,
> +	.mode_valid = rzg3l_lvds_bridge_mode_valid,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Power Management
> + */
> +
> +static int rzg3l_lvds_pm_runtime_suspend(struct device *dev)
> +{
> +	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);

You can use:

	struct reset_control_bulk_data resets[] = {
		{ .rstc = lvds->lvd_rstc },
		{ .rstc = lvds->prstc },
	};


	return reset_control_bulk_assert(ARRAY_SIZE(resets), resets);

> +	int ret;
> +
> +	ret = reset_control_assert(lvds->lvd_rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_assert(lvds->prstc);
> +	if (ret)
> +		goto err_deassert_lvd_rstc;
> +
> +	return 0;
> +
> +err_deassert_lvd_rstc:
> +	reset_control_deassert(lvds->lvd_rstc);
> +	return ret;
> +}
> +
> +static int rzg3l_lvds_pm_runtime_resume(struct device *dev)
> +{
> +	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);
> +	int ret;

Same here.

> +
> +	ret = reset_control_deassert(lvds->prstc);
> +	if (ret)
> +		return ret;
> +
> +	return reset_control_deassert(lvds->lvd_rstc);
> +	if (ret)
> +		goto err_assert_prstc;
> +
> +	return 0;
> +
> +err_assert_prstc:
> +	reset_control_assert(lvds->prstc);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops rzg3l_lvds_pm_ops = {
> +	RUNTIME_PM_OPS(rzg3l_lvds_pm_runtime_suspend,
> +		       rzg3l_lvds_pm_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Probe & Remove
> + */
> +
> +static int rzg3l_lvds_parse_dt(struct rzg3l_lvds *lvds)
> +{
> +	struct device *dev = lvds->dev;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0,
> +					  &panel, &lvds->next_bridge);

 From documentation of this function:

  * This function is deprecated and should not be used in new drivers. Use 

  * devm_drm_of_get_bridge() instead. 


devm_of_get_bridged() seems to be doing exactly what rzg3l_lvds_parse_dt() is doing.

Thank you,
Claudiu

