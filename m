Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 661B8F39EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 21:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfKGU4b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 15:56:31 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35852 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfKGU4a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 15:56:30 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E6AA71D;
        Thu,  7 Nov 2019 21:56:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573160188;
        bh=XOVqC1Za2WqOkjZOMkB346Qf0kLFRLSch16UrNY1ZsQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hRTD0NYmi8ynBwpnxpxSjN+1xthvaX8AjFVrvKFIwAwMx1AQnoWgItF3Nx40NU3BM
         Mm5cokGjY7nzwEv9jQEtADT86OeuSy0YnuR1TJXgTBFB9hg7Jxpecpcb3grXCKgBMA
         EjPjS7vKsnyPsv/kkziHLLTlFAofNBqY/vDb7IKY=
Date:   Thu, 7 Nov 2019 22:56:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 7/7] ARM: shmobile_defconfig: Enable support for
 panels from EDT
Message-ID: <20191107205618.GS24983@pendragon.ideasonboard.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573157463-14070-8-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573157463-14070-8-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Thu, Nov 07, 2019 at 08:11:03PM +0000, Fabrizio Castro wrote:
> The iwg20d comes with an LCD panel from Emerging Display
> Technologies Corporation (EDT), therefore enable what's
> required to support it.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> ---
> v2->v3:
> * No change
> v1->v2:
> * No change
> ---
>  arch/arm/configs/shmobile_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index c6c7035..ab416a5 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -66,6 +66,7 @@ CONFIG_INPUT_EVDEV=y
>  CONFIG_KEYBOARD_GPIO=y
>  # CONFIG_INPUT_MOUSE is not set
>  CONFIG_INPUT_TOUCHSCREEN=y
> +CONFIG_TOUCHSCREEN_EDT_FT5X06=y

Do these options need to be built-in, or could modules work too ?

>  CONFIG_TOUCHSCREEN_ST1232=y
>  CONFIG_INPUT_MISC=y
>  CONFIG_INPUT_ADXL34X=y
> @@ -125,7 +126,9 @@ CONFIG_VIDEO_ADV7604=y
>  CONFIG_VIDEO_ML86V7667=y
>  CONFIG_DRM=y
>  CONFIG_DRM_RCAR_DU=y
> +CONFIG_DRM_PANEL_SIMPLE=y
>  CONFIG_DRM_DUMB_VGA_DAC=y
> +CONFIG_DRM_LVDS_CODEC=y
>  CONFIG_DRM_SII902X=y
>  CONFIG_DRM_I2C_ADV7511=y
>  CONFIG_DRM_I2C_ADV7511_AUDIO=y

-- 
Regards,

Laurent Pinchart
