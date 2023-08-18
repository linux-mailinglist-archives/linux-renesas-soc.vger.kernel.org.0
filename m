Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E077F780C01
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Aug 2023 14:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352505AbjHRMmY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Aug 2023 08:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376959AbjHRMl7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 08:41:59 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36A63AA7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 05:41:57 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso6467105ad.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692362517; x=1692967317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPcGkJMKTWJ/sltVcSM8QBVCAQsS6nfPsbY6Vj4eudI=;
        b=HIZEFAp3L/cMpFf85coFquQgLGdssbX6tAWHihi283X/Tz39KiNuyLRi0Klhw7bnIN
         7lfI7WNJsjr7zbVvYlNFSJ3CHcGCKB4k0FqpYAthLFTScff3qQd6qSSQVSKaRqjOszU5
         prQOaQjYXT6EIsOm1JnfifI/ZyEQYKLU1N1ggKeSX4yPqZzF8TIYoeds8j/NKva/9ri/
         1BUDE6jj5noODXzD09SkVyw7I7lPagXEc5cPqBNRrnUGMSp9eWCgRBdpQ94nfKOuA70G
         +XyY1DJO6S6hN54PT2i/kO7uQ/N5/jAZOsCjhWCRQFWxni0eTLuSJP/jGKeGeyqY8PaH
         +9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692362517; x=1692967317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPcGkJMKTWJ/sltVcSM8QBVCAQsS6nfPsbY6Vj4eudI=;
        b=bCHpM8buHiVWJgI2MGmYgOjJpzP5NbrJAXE0KLP9nUBsE8usX7rsaD39zIIuyEm0/U
         bTdDE/YPDFijHJXCQGw5uFr5XQLxk7Mz2tRwoc36/YUJA1cwUCQAEOq/SYj5ZPQrTM5G
         FRCnEGiSl1BibsiD/fl3fkBCvuTxiUESfw24GB7Dxux0JTJY8ma7dcMvgzDB0qVLGB3M
         nGOWtnkkkwdh7w3yPWopCVZxG+XZeQgYo/qBQM5FJma7OdzgAclsBtxMsSxzWBfT3AVr
         SeDOMzd9M1hWLKfbewTJdK5oH7E05qcfCXBoWN8uOngqplslp/62kRHoUVcjSUfRs8jy
         45DA==
X-Gm-Message-State: AOJu0Yz+GsedAoGxI0AwFmPoE69CaOXmeJoGM2DUEol50x5Wn8YdPLFg
        Q/XYgiM91Dsd8cG+pw2Mjvr7LpLNOjNorqq25a8=
X-Google-Smtp-Source: AGHT+IH85gGKrwdfkAnsb745AH3X0z1EVogXcuN+wAVTrYD6qIZGo9+bx8LzvUSqDNf+4cUOTI63NEePf4+s2rxqhoc=
X-Received: by 2002:a17:90b:f08:b0:268:a26:d9ee with SMTP id
 br8-20020a17090b0f0800b002680a26d9eemr2231486pjb.46.1692362517023; Fri, 18
 Aug 2023 05:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com> <20230813180512.307418-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230813180512.307418-8-biju.das.jz@bp.renesas.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 18 Aug 2023 07:41:45 -0500
Message-ID: <CAHCN7xKo4Gnt+3rBgNyHq5tAAWU+nUpfJjzgb4RSPrgOgRsuyw@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm: adv7511: Add hpd_override_enable feature bit to
 struct adv7511_chip_info
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Bogdan Togorean <bogdan.togorean@analog.com>,
        dri-devel@lists.freedesktop.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 13, 2023 at 1:06=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> As per spec, it is allowed to pulse the HPD signal to indicate that the
> EDID information has changed. Some monitors do this when they wake up
> from standby or are enabled. When the HPD goes low the adv7511 is
> reset and the outputs are disabled which might cause the monitor to
> go to standby again. To avoid this we ignore the HPD pin for the
> first few seconds after enabling the output. On the other hand,
> adv7535 require to enable HPD Override bit for proper HPD.
>
> Add hpd_override_enable feature bit to struct adv7511_chip_info to handle
> this scenario.
>
> While at it, drop the enum adv7511_type as it is unused.

It seems like dropping adv7511_type is unrelated to the rest of the
patch, and I think it should be split from this into its own patch

adam
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  8 +-------
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 12 +++++-------
>  2 files changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 627531f48f84..c523ac4c9bc8 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -325,22 +325,16 @@ struct adv7511_video_config {
>         struct hdmi_avi_infoframe avi_infoframe;
>  };
>
> -enum adv7511_type {
> -       ADV7511,
> -       ADV7533,
> -       ADV7535,
> -};
> -
>  #define ADV7511_MAX_ADDRS 3
>
>  struct adv7511_chip_info {
> -       enum adv7511_type type;
>         unsigned long max_mode_clock;
>         unsigned long max_lane_freq;
>         const char * const *supply_names;
>         unsigned int num_supplies;
>         unsigned has_dsi:1;
>         unsigned link_config:1;
> +       unsigned hpd_override_enable:1;
>  };
>
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 6974c267b1d5..7b06a0a21685 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -354,7 +354,7 @@ static void __adv7511_power_on(struct adv7511 *adv751=
1)
>          * first few seconds after enabling the output. On the other hand
>          * adv7535 require to enable HPD Override bit for proper HPD.
>          */
> -       if (adv7511->info->type =3D=3D ADV7535)
> +       if (adv7511->info->hpd_override_enable)
>                 regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
>                                    ADV7535_REG_POWER2_HPD_OVERRIDE,
>                                    ADV7535_REG_POWER2_HPD_OVERRIDE);
> @@ -381,7 +381,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
>  static void __adv7511_power_off(struct adv7511 *adv7511)
>  {
>         /* TODO: setup additional power down modes */
> -       if (adv7511->info->type =3D=3D ADV7535)
> +       if (adv7511->info->hpd_override_enable)
>                 regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
>                                    ADV7535_REG_POWER2_HPD_OVERRIDE, 0);
>
> @@ -682,7 +682,7 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_co=
nnector *connector)
>                         status =3D connector_status_disconnected;
>         } else {
>                 /* Renable HPD sensing */
> -               if (adv7511->info->type =3D=3D ADV7535)
> +               if (adv7511->info->hpd_override_enable)
>                         regmap_update_bits(adv7511->regmap, ADV7511_REG_P=
OWER2,
>                                            ADV7535_REG_POWER2_HPD_OVERRID=
E,
>                                            ADV7535_REG_POWER2_HPD_OVERRID=
E);
> @@ -1360,14 +1360,12 @@ static void adv7511_remove(struct i2c_client *i2c=
)
>  }
>
>  static const struct adv7511_chip_info adv7511_chip_info =3D {
> -       .type =3D ADV7511,
>         .supply_names =3D adv7511_supply_names,
>         .num_supplies =3D ARRAY_SIZE(adv7511_supply_names),
>         .link_config =3D 1
>  };
>
>  static const struct adv7511_chip_info adv7533_chip_info =3D {
> -       .type =3D ADV7533,
>         .max_mode_clock =3D 80000,
>         .max_lane_freq =3D 800000,
>         .supply_names =3D adv7533_supply_names,
> @@ -1376,12 +1374,12 @@ static const struct adv7511_chip_info adv7533_chi=
p_info =3D {
>  };
>
>  static const struct adv7511_chip_info adv7535_chip_info =3D {
> -       .type =3D ADV7535,
>         .max_mode_clock =3D 148500,
>         .max_lane_freq =3D 891000,
>         .supply_names =3D adv7533_supply_names,
>         .num_supplies =3D ARRAY_SIZE(adv7533_supply_names),
> -       .has_dsi =3D 1
> +       .has_dsi =3D 1,
> +       .hpd_override_enable =3D 1
>  };
>
>  static const struct i2c_device_id adv7511_i2c_ids[] =3D {
> --
> 2.25.1
>
