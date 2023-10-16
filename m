Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED93C7CA346
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 11:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbjJPJDl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 05:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232828AbjJPJDk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 05:03:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB3FEAB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 02:03:38 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739E3C433CA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 09:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697447018;
        bh=6dXvSHSmxF1Jkk0KO20cksMa9JGZ8q0dCID/LUTR+rw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NRzbP14S2o2Eq8tAIkqg9sgc8i7kARgFPlEaB3eaA+fGPuwtSh5c+Fcdqdn1e+jo3
         vNE14siMYQF3Mf3uRQ5WTjRQ3uTsQLXqiIvE3w3bTDHd2kEnQzTRJ2AVXB61t4nkhP
         03KdZz+GXlEEjHqftj9EYaRdsHYFELjYNH+lyxYhgazmjCXdo71TNydL4NEhPzzFyp
         RRos2TMZ6E6y0NxEcAPKNwIYI13NBjsZ7BBFo/wRAH9eJQk7SpA5zkCqPVzqFpCIbq
         QjahbC9QMgwyVKCGUbMTylpJTianYtYA66wunTiCRhzm9WiJLbPBJMNjfDYBf+3Fx3
         dRgUbHa3b1rkg==
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5859d13f73dso2530099a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 02:03:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YwIGNEL13W5d8JFZs5WY44cv1g8R/bjIRZU4FNjR2YutT1yiLHV
        iYtBPuB9kPw4+scwjPQQAQm1weLtKd4Eg2NeazapYw==
X-Google-Smtp-Source: AGHT+IHdsvqtb1adsbuVWaK++Uxf4+5FfxWtMl/HzsGnaAhogRe31zPOFIVAYdo+D++zVr2NZqR6Bep3VQVg8Yo0fMw=
X-Received: by 2002:a05:6a20:938f:b0:16b:c019:f5d2 with SMTP id
 x15-20020a056a20938f00b0016bc019f5d2mr27269962pzh.45.1697447018012; Mon, 16
 Oct 2023 02:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com> <20230830142358.275459-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830142358.275459-5-biju.das.jz@bp.renesas.com>
From:   Robert Foss <rfoss@kernel.org>
Date:   Mon, 16 Oct 2023 11:03:27 +0200
X-Gmail-Original-Message-ID: <CAN6tsi5Qj9n8ucXD-S+sqMNRYwoW5qNAt4zQj-hbwHDCJ1Tz1A@mail.gmail.com>
Message-ID: <CAN6tsi5Qj9n8ucXD-S+sqMNRYwoW5qNAt4zQj-hbwHDCJ1Tz1A@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] drm: adv7511: Add supply_names and num_supplies
 variables to struct adv7511_chip_info
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
> The ADV7511 has 5 power supplies compared to 7 that of ADV75{33,35}. Add
> supply_names and num_supplies variables to struct adv7511_chip_info to
> handle this difference.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> v1->v2:
>  * Added Rb tag from Laurent.
>  * Added trailing commas for num_supplies in adv753{3,5}_chip_info.
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  3 ++-
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 27 ++++++++++----------
>  2 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index f8d61f2fa30e..edf7be9c21d3 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -337,6 +337,8 @@ struct adv7511_chip_info {
>         enum adv7511_type type;
>         unsigned int max_mode_clock_khz;
>         unsigned int max_lane_freq_khz;
> +       const char * const *supply_names;
> +       unsigned int num_supplies;
>  };
>
>  struct adv7511 {
> @@ -375,7 +377,6 @@ struct adv7511 {
>         struct gpio_desc *gpio_pd;
>
>         struct regulator_bulk_data *supplies;
> -       unsigned int num_supplies;
>
>         /* ADV7533 DSI RX related params */
>         struct device_node *host_node;
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 1c76aa5a5d5b..2bcd17953221 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1004,37 +1004,30 @@ static const char * const adv7533_supply_names[] =
=3D {
>
>  static int adv7511_init_regulators(struct adv7511 *adv)
>  {
> +       const char * const *supply_names =3D adv->info->supply_names;
> +       unsigned int num_supplies =3D adv->info->num_supplies;
>         struct device *dev =3D &adv->i2c_main->dev;
> -       const char * const *supply_names;
>         unsigned int i;
>         int ret;
>
> -       if (adv->info->type =3D=3D ADV7511) {
> -               supply_names =3D adv7511_supply_names;
> -               adv->num_supplies =3D ARRAY_SIZE(adv7511_supply_names);
> -       } else {
> -               supply_names =3D adv7533_supply_names;
> -               adv->num_supplies =3D ARRAY_SIZE(adv7533_supply_names);
> -       }
> -
> -       adv->supplies =3D devm_kcalloc(dev, adv->num_supplies,
> +       adv->supplies =3D devm_kcalloc(dev, num_supplies,
>                                      sizeof(*adv->supplies), GFP_KERNEL);
>         if (!adv->supplies)
>                 return -ENOMEM;
>
> -       for (i =3D 0; i < adv->num_supplies; i++)
> +       for (i =3D 0; i < num_supplies; i++)
>                 adv->supplies[i].supply =3D supply_names[i];
>
> -       ret =3D devm_regulator_bulk_get(dev, adv->num_supplies, adv->supp=
lies);
> +       ret =3D devm_regulator_bulk_get(dev, num_supplies, adv->supplies)=
;
>         if (ret)
>                 return ret;
>
> -       return regulator_bulk_enable(adv->num_supplies, adv->supplies);
> +       return regulator_bulk_enable(num_supplies, adv->supplies);
>  }
>
>  static void adv7511_uninit_regulators(struct adv7511 *adv)
>  {
> -       regulator_bulk_disable(adv->num_supplies, adv->supplies);
> +       regulator_bulk_disable(adv->info->num_supplies, adv->supplies);
>  }
>
>  static bool adv7511_cec_register_volatile(struct device *dev, unsigned i=
nt reg)
> @@ -1365,18 +1358,24 @@ static void adv7511_remove(struct i2c_client *i2c=
)
>
>  static const struct adv7511_chip_info adv7511_chip_info =3D {
>         .type =3D ADV7511,
> +       .supply_names =3D adv7511_supply_names,
> +       .num_supplies =3D ARRAY_SIZE(adv7511_supply_names),
>  };
>
>  static const struct adv7511_chip_info adv7533_chip_info =3D {
>         .type =3D ADV7533,
>         .max_mode_clock_khz =3D 80000,
>         .max_lane_freq_khz =3D 800000,
> +       .supply_names =3D adv7533_supply_names,
> +       .num_supplies =3D ARRAY_SIZE(adv7533_supply_names),
>  };
>
>  static const struct adv7511_chip_info adv7535_chip_info =3D {
>         .type =3D ADV7535,
>         .max_mode_clock_khz =3D 148500,
>         .max_lane_freq_khz =3D 891000,
> +       .supply_names =3D adv7533_supply_names,
> +       .num_supplies =3D ARRAY_SIZE(adv7533_supply_names),
>  };
>
>  static const struct i2c_device_id adv7511_i2c_ids[] =3D {
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
