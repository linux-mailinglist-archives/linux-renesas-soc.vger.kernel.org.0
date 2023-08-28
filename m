Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEEDA78AF62
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 14:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbjH1MAS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 08:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbjH1L7v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:59:51 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61EF511A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:59:49 -0700 (PDT)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
        by madras.collabora.co.uk (Postfix) with ESMTP id 770A16607197;
        Mon, 28 Aug 2023 12:59:46 +0100 (BST)
From:   "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <20230826071901.29420-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date:   Mon, 28 Aug 2023 12:59:46 +0100
Cc:     "Andrzej Hajda" <andrzej.hajda@intel.com>,
        "Neil Armstrong" <neil.armstrong@linaro.org>,
        "Robert Foss" <rfoss@kernel.org>,
        "David Airlie" <airlied@gmail.com>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        "Zhu Wang" <wangzhu9@huawei.com>,
        "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>,
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
Message-ID: <1abd-64ec8c00-3-39cf3d80@13682584>
Subject: =?utf-8?q?Re=3A?= [PATCH v4 1/2] =?utf-8?q?drm/bridge/analogix/anx78xx=3A?= 
 Drop ID table
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Saturday, August 26, 2023 04:19 -03, Biju Das <biju.das.jz@bp.renesas.com> wrote:

> The driver has an ID table, but it uses the wrong API for retrieving match
> data and that will lead to a crash, if it is instantiated by user space or
> using ID. From this, there is no user for the ID table and let's drop it
> from the driver as it saves some memory.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Helen Koike <helen.koike@collabora.com>

> ---
> v3->v4:
>  * Added Rb tag from Laurent and Douglas Anderson.
> v2->v3:
>  * Updated commit header.
> v1->v2:
>  * Dropped ID table support.
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 800555aef97f..6169db73d2fe 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -1367,12 +1367,6 @@ static void anx78xx_i2c_remove(struct i2c_client *client)
>  	kfree(anx78xx->edid);
>  }
>  
> -static const struct i2c_device_id anx78xx_id[] = {
> -	{ "anx7814", 0 },
> -	{ /* sentinel */ }
> -};
> -MODULE_DEVICE_TABLE(i2c, anx78xx_id);
> -
>  static const struct of_device_id anx78xx_match_table[] = {
>  	{ .compatible = "analogix,anx7808", .data = anx7808_i2c_addresses },
>  	{ .compatible = "analogix,anx7812", .data = anx781x_i2c_addresses },
> @@ -1389,7 +1383,6 @@ static struct i2c_driver anx78xx_driver = {
>  		  },
>  	.probe = anx78xx_i2c_probe,
>  	.remove = anx78xx_i2c_remove,
> -	.id_table = anx78xx_id,
>  };
>  module_i2c_driver(anx78xx_driver);
>  
> -- 
> 2.25.1
>

