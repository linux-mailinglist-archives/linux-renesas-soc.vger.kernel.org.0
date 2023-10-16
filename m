Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70EE17CA37B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 11:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbjJPJGm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 05:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232719AbjJPJGl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 05:06:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC5CB4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 02:06:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C1DC433B9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 09:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697447199;
        bh=4dYvQCuf9b3tf3uNXhqNvMXf/odod6VTp5BhZbX80vA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ovnb0OLZa50TrHujRVZYsEjAMfq5a5InPpNjVIhcTfq/NJzWS6YQUNoReDERjSL3+
         Kx7aFRWrKkM/BdWPlHkBBTCBd22XlC1zfElXbbSRESMzPJVXYJpjAk3w3USsOJ2VSr
         52G9aqUZEdZx5eDHXtLSFfI0NuVMWiX8y4l6i2UoZfWmVNIJg8ppY7Ax70Fs5j9Zn8
         x5BsRea8wmh7fNgHXSBx7035xRxC/2uRycVr+HJSlKxsMpd/LTuyjYfoqMG4zIjojJ
         xkCj3t2okNIw+I1JT5zxlOIt9KVvCG7a2/WKGgbg7S4WL3ZRPusHT7Ru33LJgWZuD6
         pVWm0NLTYyhMQ==
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6b1ef786b7fso2676455b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 02:06:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw7HXZFtASmaPE2fQCWuXiwBc9VcMwCPAukCJ5FVStHOoS7KdYm
        /7qpDsMI+IfYOHPYJyz6lGLoYjlm3/MvYHVIHZRgxA==
X-Google-Smtp-Source: AGHT+IGuyJExJTh3Hz3QKu7cnVZE8okT82PfRYefqKYWYKmexNxw6mhEovZYJO3sgmjIB8eXV0/CRk3sGOen1Z0QN08=
X-Received: by 2002:a05:6a21:6d87:b0:16c:b95c:6d35 with SMTP id
 wl7-20020a056a216d8700b0016cb95c6d35mr33281513pzb.50.1697447199092; Mon, 16
 Oct 2023 02:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com> <20230830142358.275459-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830142358.275459-3-biju.das.jz@bp.renesas.com>
From:   Robert Foss <rfoss@kernel.org>
Date:   Mon, 16 Oct 2023 11:06:27 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4QH-S8rymoTP_DD2Q3etb26ZiLSqsP2o7+L5sCkgnXaA@mail.gmail.com>
Message-ID: <CAN6tsi4QH-S8rymoTP_DD2Q3etb26ZiLSqsP2o7+L5sCkgnXaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] drm: adv7511: Add max_mode_clock_khz variable to
 struct adv7511_chip_info
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Adam Ford <aford173@gmail.com>,
        Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 30, 2023 at 4:24=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> The ADV7533 supports a maximum pixel clock of 80MHz whereas it is 148.5MH=
z
> for ADV7535. Add max_mode_clock_khz variable to struct adv7511_chip_info =
to
> handle this difference.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Adam Ford <aford173@gmail.com>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mm-beacon
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  * Added Rb tag from Adam and Laurent
>  * Added tested by tag from Adam.
>  * Replaced max_mode_clock->max_mode_clock_khz in struct adv7511_chip_inf=
o
>  * Replaced variable type from unsigned int->unsigned long.
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 ++
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     | 2 +-
>  3 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 59e8ef10d72e..b9c6c1e8a353 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -335,6 +335,7 @@ enum adv7511_type {
>
>  struct adv7511_chip_info {
>         enum adv7511_type type;
> +       unsigned int max_mode_clock_khz;
>  };
>
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index d869dbe41873..12ceffd6a9eb 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1369,10 +1369,12 @@ static const struct adv7511_chip_info adv7511_chi=
p_info =3D {
>
>  static const struct adv7511_chip_info adv7533_chip_info =3D {
>         .type =3D ADV7533,
> +       .max_mode_clock_khz =3D 80000,
>  };
>
>  static const struct adv7511_chip_info adv7535_chip_info =3D {
>         .type =3D ADV7535,
> +       .max_mode_clock_khz =3D 148500,
>  };
>
>  static const struct i2c_device_id adv7511_i2c_ids[] =3D {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/b=
ridge/adv7511/adv7533.c
> index c452c4dc1c3f..1d113489754c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -108,7 +108,7 @@ enum drm_mode_status adv7533_mode_valid(struct adv751=
1 *adv,
>         u8 bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
>
>         /* Check max clock for either 7533 or 7535 */
> -       if (mode->clock > (adv->info->type =3D=3D ADV7533 ? 80000 : 14850=
0))
> +       if (mode->clock > adv->info->max_mode_clock_khz)
>                 return MODE_CLOCK_HIGH;
>
>         /* Check max clock for each lane */
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
