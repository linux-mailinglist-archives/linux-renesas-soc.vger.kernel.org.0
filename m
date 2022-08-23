Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30F7959E4C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 15:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241657AbiHWN7Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Aug 2022 09:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241802AbiHWN7I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 09:59:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBB02355B1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Aug 2022 04:05:47 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 888C92B3;
        Tue, 23 Aug 2022 13:04:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661252664;
        bh=xJ3Fu17rpjZxCTLIeAz6z/zPrh/wUOZvmL04gRfUyQ0=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=f6Pi7Z7Mexm/UazkHQfjuHZCva0TIQd99F7RvV2NxcBVrmxTDNELznPkajjFDfrTz
         WoGLICYC9XnkVN0UtfXOMfCrcPpQ7Dtk05aIMJV1DMmFiPez4ZHYp5TFsd8ZdB4s2f
         3Riq1NNtOvIzOYQ4uXTmWTHL4Gj8e6mPMvPt9YRA=
Message-ID: <784e177f-f8fe-0a80-41fa-b9b3019ce16c@ideasonboard.com>
Date:   Tue, 23 Aug 2022 14:04:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/5] drm: rcar-du: fix DSI enable & disable sequence
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20220822143401.135081-1-tomi.valkeinen@ideasonboard.com>
 <20220822143401.135081-5-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20220822143401.135081-5-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 22/08/2022 17:34, Tomi Valkeinen wrote:

> +struct drm_atomic_state;
> +struct drm_bridge;
> +
> +#if IS_ENABLED(CONFIG_DRM_RCAR_MIPI_DSI)
> +void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
> +			       struct drm_atomic_state *state);
> +void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge);
> +#else
> +static inline void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
> +					     struct drm_atomic_state *state)
> +{
> +}
> +
> +void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
> +{
> +}

This one is missing static inline.

Laurent, do you want me to re-send the series, or do you already have 
this applied to your branch?

  Tomi
