Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2594B6A0D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Feb 2022 12:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236776AbiBOLAw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Feb 2022 06:00:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236856AbiBOLAt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Feb 2022 06:00:49 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074EFF9562
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Feb 2022 03:00:38 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id C8F71240011;
        Tue, 15 Feb 2022 11:00:32 +0000 (UTC)
Date:   Tue, 15 Feb 2022 12:01:41 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [RFC PATCH 7/8] media: v4l2-mediabus: Drop legacy
 V4L2_MBUS_CSI2_CHANNEL_* flags
Message-ID: <20220215110141.se2gyvfb2xvez2vn@uno.localdomain>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220103162414.27723-8-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220103162414.27723-8-laurent.pinchart+renesas@ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent

On Mon, Jan 03, 2022 at 06:24:13PM +0200, Laurent Pinchart wrote:
> The V4L2_MBUS_CSI2_CHANNEL_* flags are a legacy API. Only
> V4L2_MBUS_CSI2_CHANNEL_0 is used, set in a single driver, and never
> read. Drop those flags. Virtual channel information should be conveyed
> through frame descriptors instead.

I see one more user in the latest media master
drivers/media/platform/atmel/microchip-csi2dc.c:        if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_0)

With that fixed
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/adv7180.c   |  1 -
>  include/media/v4l2-mediabus.h | 10 ----------
>  2 files changed, 11 deletions(-)
>
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 286f5017d9c3..3ff37a550810 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -786,7 +786,6 @@ static int adv7180_get_mbus_config(struct v4l2_subdev *sd,
>  		cfg->type = V4L2_MBUS_CSI2_DPHY;
>  		cfg->bus.mipi_csi2.num_data_lanes = 1;
>  		cfg->bus.mipi_csi2.flags =
> -				V4L2_MBUS_CSI2_CHANNEL_0 |
>  				V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
>  	} else {
>  		/*
> diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> index 44195ceeccca..c6626a22b394 100644
> --- a/include/media/v4l2-mediabus.h
> +++ b/include/media/v4l2-mediabus.h
> @@ -67,20 +67,10 @@
>  #define V4L2_MBUS_DATA_ENABLE_LOW		BIT(15)
>
>  /* Serial flags */
> -/* CSI-2 Virtual Channel identifiers. */
> -#define V4L2_MBUS_CSI2_CHANNEL_0		BIT(4)
> -#define V4L2_MBUS_CSI2_CHANNEL_1		BIT(5)
> -#define V4L2_MBUS_CSI2_CHANNEL_2		BIT(6)
> -#define V4L2_MBUS_CSI2_CHANNEL_3		BIT(7)
>  /* Clock non-continuous mode support. */
>  #define V4L2_MBUS_CSI2_CONTINUOUS_CLOCK		BIT(8)
>  #define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(9)
>
> -#define V4L2_MBUS_CSI2_CHANNELS		(V4L2_MBUS_CSI2_CHANNEL_0 | \
> -					 V4L2_MBUS_CSI2_CHANNEL_1 | \
> -					 V4L2_MBUS_CSI2_CHANNEL_2 | \
> -					 V4L2_MBUS_CSI2_CHANNEL_3)
> -
>  #define V4L2_MBUS_CSI2_MAX_DATA_LANES		8
>
>  /**
> --
> Regards,
>
> Laurent Pinchart
>
