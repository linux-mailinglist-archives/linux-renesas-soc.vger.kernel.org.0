Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C46B978B0FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 14:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjH1MuM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 08:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbjH1Mtq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 08:49:46 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873FE123
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 05:49:36 -0700 (PDT)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
        by madras.collabora.co.uk (Postfix) with ESMTP id 275B06606F65;
        Mon, 28 Aug 2023 13:49:32 +0100 (BST)
From:   "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <20230826071901.29420-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date:   Mon, 28 Aug 2023 13:49:31 +0100
Cc:     "Andrzej Hajda" <andrzej.hajda@intel.com>,
        "Neil Armstrong" <neil.armstrong@linaro.org>,
        "Robert Foss" <rfoss@kernel.org>,
        "David Airlie" <airlied@gmail.com>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard" <mripard@kernel.org>,
        "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Zhu Wang" <wangzhu9@huawei.com>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        "Jonas Karlman" <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
        "Douglas Anderson" <dianders@chromium.org>,
        "Jernej Skrabec" <jernej.skrabec@gmail.com>,
        "Prabhakar Mahadev Lad" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
To:     "Biju Das" <biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Message-ID: <31ff-64ec9800-1-66482280@42123241>
Subject: =?utf-8?q?Re=3A?= [PATCH v4 2/2] =?utf-8?q?drm/bridge=3A?= Drop 
 conditionals around =?utf-8?q?of=5Fnode?= pointers
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

Thanks for the patch.

On Saturday, August 26, 2023 04:19 -03, Biju Das <biju.das.jz@bp.renesas.com> wrote:

> Having conditional around the of_node pointers turns out to make driver
> code use ugly #ifdef and #if blocks. So drop the conditionals.

It would be nice to explain why those ifdev/if conditionals are
not required anymore (besides the cosmetic part).

Regards,
Helen

> 
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4:
>  * New patch
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 2 --
>  include/drm/drm_bridge.h                           | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 6169db73d2fe..ad8241758896 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -1231,9 +1231,7 @@ static int anx78xx_i2c_probe(struct i2c_client *client)
>  
>  	mutex_init(&anx78xx->lock);
>  
> -#if IS_ENABLED(CONFIG_OF)
>  	anx78xx->bridge.of_node = client->dev.of_node;
> -#endif
>  
>  	anx78xx->client = client;
>  	i2c_set_clientdata(client, anx78xx);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index c339fc85fd07..d49d5c03df3e 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -716,10 +716,8 @@ struct drm_bridge {
>  	struct drm_encoder *encoder;
>  	/** @chain_node: used to form a bridge chain */
>  	struct list_head chain_node;
> -#ifdef CONFIG_OF
>  	/** @of_node: device node pointer to the bridge */
>  	struct device_node *of_node;
> -#endif
>  	/** @list: to keep track of all added bridges */
>  	struct list_head list;
>  	/**
> -- 
> 2.25.1
>

