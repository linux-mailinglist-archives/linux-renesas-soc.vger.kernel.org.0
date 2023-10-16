Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5D77CA376
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 11:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233328AbjJPJGQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 05:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbjJPJF7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 05:05:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88BFFA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 02:05:56 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC5EC433A9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697447156;
        bh=HIfVWMEfL7CwhiukwKTTslObuCIDKm/Z0vU0+oXjE0E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oJ8/e1N4wrA+qcnWs47TR03xfA4o+bXwXeD/89l6CPWQXdm2OAQjQk20uUV9csg/o
         zczHyFawTtdS/JzkKJqFSW1fwoc8thUJOlSJKe2ILhWmO9ciYOEB7IX7js4hpziwm9
         YEnZ/+2JTkEN4jvE0Pa6C39nIBwYZ37dTNVjFkrPHtXD08i1YTlnVhVw7uGuHJpFhO
         e0oBpSyZ5ZyCRJ2EExU9HqHihpAJF40Vq/GrA8G6313txoMdYY4TX4ObOwZ6oRMXd5
         qm3hg2V+r6JoEou9+RIMH7DujjM/Lua+NN9AsxUFxTq1impDKq43YSnbVFHjewqLJo
         YNflcEW2TnFYw==
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c9d922c039so34566095ad.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 02:05:56 -0700 (PDT)
X-Gm-Message-State: AOJu0YyxfopuFb5s8m6/8io6DF1HOhSIAEtRi+i7AyPyAwPr6qlO8sa5
        pljL4Sg4fqZ8yvgzZh0Ka/lcQRzYpBW8/nhmM0tvzA==
X-Google-Smtp-Source: AGHT+IHAvlp6PyNRZ0ZB1dBY2USfXb9KvbYa46vygCEVTpzfL+uk7PJPNZlvhXfjTyM2oHqDgSONdVXV8A7pL7XVKpo=
X-Received: by 2002:a17:90a:d503:b0:27d:af3:f15d with SMTP id
 t3-20020a17090ad50300b0027d0af3f15dmr13466335pju.4.1697447156004; Mon, 16 Oct
 2023 02:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com> <20230830142358.275459-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830142358.275459-4-biju.das.jz@bp.renesas.com>
From:   Robert Foss <rfoss@kernel.org>
Date:   Mon, 16 Oct 2023 11:05:45 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6sgMeZKHa4usLeW2jS-_Mmba43LMeCa2DWdjCb+w2zJg@mail.gmail.com>
Message-ID: <CAN6tsi6sgMeZKHa4usLeW2jS-_Mmba43LMeCa2DWdjCb+w2zJg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] drm: adv7511: Add max_lane_freq_khz variable to
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
> The ADV7533 supports a maximum lane clock of 800MHz whereas it is 891MHz
> for ADV7535. Add max_lane_freq_khz variable to struct adv7511_chip_info t=
o
> handle this difference.
>
> While at it, drop the unused local variable max_lane_freq.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> v1->v2:
>  * Added Rb tag from Laurent.
>  * Replaced max_lane_freq->max_lane_freq_khz in struct adv7511_chip_info.
>  * Replaced variable type from unsigned long->unsigned int.
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 ++
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     | 5 +----
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index b9c6c1e8a353..f8d61f2fa30e 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -336,6 +336,7 @@ enum adv7511_type {
>  struct adv7511_chip_info {
>         enum adv7511_type type;
>         unsigned int max_mode_clock_khz;
> +       unsigned int max_lane_freq_khz;
>  };
>
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 12ceffd6a9eb..1c76aa5a5d5b 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1370,11 +1370,13 @@ static const struct adv7511_chip_info adv7511_chi=
p_info =3D {
>  static const struct adv7511_chip_info adv7533_chip_info =3D {
>         .type =3D ADV7533,
>         .max_mode_clock_khz =3D 80000,
> +       .max_lane_freq_khz =3D 800000,
>  };
>
>  static const struct adv7511_chip_info adv7535_chip_info =3D {
>         .type =3D ADV7535,
>         .max_mode_clock_khz =3D 148500,
> +       .max_lane_freq_khz =3D 891000,
>  };
>
>  static const struct i2c_device_id adv7511_i2c_ids[] =3D {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/b=
ridge/adv7511/adv7533.c
> index 1d113489754c..4481489aaf5e 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -103,7 +103,6 @@ void adv7533_dsi_power_off(struct adv7511 *adv)
>  enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
>                                         const struct drm_display_mode *mo=
de)
>  {
> -       unsigned long max_lane_freq;
>         struct mipi_dsi_device *dsi =3D adv->dsi;
>         u8 bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
>
> @@ -112,9 +111,7 @@ enum drm_mode_status adv7533_mode_valid(struct adv751=
1 *adv,
>                 return MODE_CLOCK_HIGH;
>
>         /* Check max clock for each lane */
> -       max_lane_freq =3D (adv->info->type =3D=3D ADV7533 ? 800000 : 8910=
00);
> -
> -       if (mode->clock * bpp > max_lane_freq * adv->num_dsi_lanes)
> +       if (mode->clock * bpp > adv->info->max_lane_freq_khz * adv->num_d=
si_lanes)
>                 return MODE_CLOCK_HIGH;
>
>         return MODE_OK;
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
