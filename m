Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4E23E9047
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Aug 2021 14:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237587AbhHKMQV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Aug 2021 08:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237585AbhHKMP4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 08:15:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A22BC061765
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Aug 2021 05:15:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A1D7EE;
        Wed, 11 Aug 2021 14:15:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628684126;
        bh=3gtiBOYY81FyK7vbYGbqLcW65Xp6Q23Wda3j4MjndjQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hg9wQLAAbRfvqfx5IndWQTezXWQ/DJnC3V8JFsxe95VdtKV7HYVHVSNyoMcr8ZT3A
         tXQHjEDflYEy8gUDPb2LMDdfE5/15bj+/cIaH0YdYRPz3YtZeXlVO8FC14hdczs/TV
         DG55apFszHQ6YDk0LhwkylhF3LXWzgPAraG7/vkU=
Date:   Wed, 11 Aug 2021 15:15:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        linux-renesas-soc@vger.kernel.org, robdclark@gmail.com
Subject: Re: [PATCH v2 4/6] drm/bridge: ti-sn65dsi86: Wrap panel with
 panel-bridge
Message-ID: <YRO/W8ZAuYEVs2MF@pendragon.ideasonboard.com>
References: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210624000304.16281-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAE-0n52Mw-ZzdqwKeEX2-WP6NyqdXvfzq=KeZJug9A-NiVo8aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAE-0n52Mw-ZzdqwKeEX2-WP6NyqdXvfzq=KeZJug9A-NiVo8aw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

On Tue, Aug 10, 2021 at 10:26:33PM -0700, Stephen Boyd wrote:
> Quoting Laurent Pinchart (2021-06-23 17:03:02)
> > To simplify interfacing with the panel, wrap it in a panel-bridge and
> > let the DRM bridge helpers handle chaining of operations.
> >
> > This also prepares for support of DRM_BRIDGE_ATTACH_NO_CONNECTOR, which
> > requires all components in the display pipeline to be represented by
> > bridges.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> 
> With this patch applied I get two eDP devices on Lazor sc7180 (it is the
> arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor*.dts files if you're
> looking for more info). As far as I can tell, we should only have one
> eDP device on the board, for the bridge.
> 
> localhost ~ # ls -l /sys/class/drm/card1-eDP*
> lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-1 ->
> ../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-1
> lrwxrwxrwx. 1 root root 0 Aug 10 22:24 /sys/class/drm/card1-eDP-2 ->
> ../../devices/platform/soc@0/ae00000.mdss/drm/card1/card1-eDP-2

Indeed.

Does the display driver use the DRM connector bridge helper and
DRM_BRIDGE_ATTACH_NO_CONNECTOR on that platform ?

-- 
Regards,

Laurent Pinchart
