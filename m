Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C1559E5FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Aug 2022 17:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242442AbiHWP1l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Aug 2022 11:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243476AbiHWP1L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 11:27:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB171D8978
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Aug 2022 04:06:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6E276BB;
        Tue, 23 Aug 2022 13:05:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661252753;
        bh=/1/RPuDMUTI2aRUkYPCd2MT/zImNosmfadKA2p7kGBM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=myf2nve9iuDuo65PdUZJrWH43qq72+Jvjw1ARU0fL2LNNmiqHBVe6sRwF0yvb+J6J
         zNMZT/P/MagyIx99KajFIw7oRjjubOwXx3Gu7MfPC/dukdRP0lIVn6w4MiSKq4I4m/
         TAU6ER5X7xWYMrPv44HGV/9/M2GAqFd4vaGQfruY=
Date:   Tue, 23 Aug 2022 14:05:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 4/5] drm: rcar-du: fix DSI enable & disable sequence
Message-ID: <YwS0jB7JYaieg1bK@pendragon.ideasonboard.com>
References: <20220822143401.135081-1-tomi.valkeinen@ideasonboard.com>
 <20220822143401.135081-5-tomi.valkeinen@ideasonboard.com>
 <784e177f-f8fe-0a80-41fa-b9b3019ce16c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <784e177f-f8fe-0a80-41fa-b9b3019ce16c@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 23, 2022 at 02:04:21PM +0300, Tomi Valkeinen wrote:
> On 22/08/2022 17:34, Tomi Valkeinen wrote:
> 
> > +struct drm_atomic_state;
> > +struct drm_bridge;
> > +
> > +#if IS_ENABLED(CONFIG_DRM_RCAR_MIPI_DSI)
> > +void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
> > +			       struct drm_atomic_state *state);
> > +void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge);
> > +#else
> > +static inline void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
> > +					     struct drm_atomic_state *state)
> > +{
> > +}
> > +
> > +void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
> > +{
> > +}
> 
> This one is missing static inline.
> 
> Laurent, do you want me to re-send the series, or do you already have 
> this applied to your branch?

I'll fix it locally.

-- 
Regards,

Laurent Pinchart
