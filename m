Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 003CB780E4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Aug 2023 16:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345937AbjHROtt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Aug 2023 10:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352001AbjHROtn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 10:49:43 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96D4A13D
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 07:49:41 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-26b44247123so746788a91.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 07:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692370181; x=1692974981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2LX2HzsOIkDf+npm74iqGCgCKWwRBtTWhdSG/vOeqM=;
        b=creBQWtps1PHmLc4QtEtrCDSBhEsrNrokAM7RTEDfPRdpu47/hRlx/yukgcYFQbHq3
         cI/QAy/SIoDXZMgEbv11wLPftmZQ4b9XgqeY0fnuAZNKn4et39/NMx2I1Jy0r3k5QFJv
         hq0w64FE83xRTBcat9xN+vrP9wzp2x25m1bU1AO/VRCpuRJxwu+cmP7pL4qzUtwJwWUE
         E1hT8looUYaS196m815ItaUszzH3UJ7D5Z/9lNcys5iTGpY0VMMuTau6RcMgyaBYuLFF
         ph3v5bz+n5iVg9wIWh39PIB3++03ho+dv7Rv3fqPhVzY4JAi3WFJiVrWSbxKL7LQWaYU
         w2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692370181; x=1692974981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2LX2HzsOIkDf+npm74iqGCgCKWwRBtTWhdSG/vOeqM=;
        b=Y5ofQ/yTbF5Tl1ckrlqOWm6ZwjWjMdsXt8pVOLbrYv8TxWt/Cs077Y/KugTk69gNxA
         97R+Tsr8Hji+/hdSEkwj1UkxviWCa0gJ7Y6ekc8V4p0uTpHIiihgvkV+v/pRmkxVk5WY
         zud+Nk5toSP3dQMkOfIL41UXyUJw5Y+MQS6yl8748xmSuP3XxxQicjbWZdIAJFjYYwzx
         +gCE7cIwm1ndCvGMdsCvnSz/LTF4kL+OdijmJ9mcLfjPY1v+guV7P6w5ZZHSRYG0r1Zs
         Zff7elRr4aHh2PGUMtm9Lhgf1lf8j7lZgAYZcPbnu4KGCVZREVygtmNfhhsPKjcLyC6U
         dfVw==
X-Gm-Message-State: AOJu0Yyj96EtUYQfu5J16/5j2XIEUkVnS+4bwbK9rotkT3kkFiRbuBlf
        2lkjBRrw/hP3gIZLtVYgtlUQ0iupPRioa5JFxn8=
X-Google-Smtp-Source: AGHT+IFCtF44LVTcwu0Km0D+LXnVkqhZj2YUD3b8ow9zzmfHWSmmVVIf9gF9ktKyNF8NHg98mdeuF4aJCRZhM68FeJ4=
X-Received: by 2002:a17:90b:33c2:b0:269:154b:6290 with SMTP id
 lk2-20020a17090b33c200b00269154b6290mr2592379pjb.24.1692370180787; Fri, 18
 Aug 2023 07:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com> <20230813180512.307418-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230813180512.307418-2-biju.das.jz@bp.renesas.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 18 Aug 2023 09:49:29 -0500
Message-ID: <CAHCN7xK3CmK=0zsJZ5RmvomZ3yHprB34AQzqFBUwPxSvOOZMfw@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm: adv7511: Add struct adv7511_chip_info and use i2c_get_match_data()
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

On Sun, Aug 13, 2023 at 1:05=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Add struct adv7511_chip_info to handle hw differences between various
> chips rather checking against the 'type' variable in various places.
> Replace 'adv->type'->'info->type' by moving variable 'type' from
> struct adv7511 to struct adv7511_chip_info.
>
> Replace of_device_get_match_data() and ID lookup for retrieving match dat=
a
> with i2c_get_match_data() by adding adv7511_chip_info as device data for
> both OF and ID tables.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Adam Ford <aford173@gmail.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  6 +-
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 68 +++++++++++---------
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     |  4 +-
>  3 files changed, 46 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 17445800248d..59e8ef10d72e 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -333,6 +333,10 @@ enum adv7511_type {
>
>  #define ADV7511_MAX_ADDRS 3
>
> +struct adv7511_chip_info {
> +       enum adv7511_type type;
> +};
> +
>  struct adv7511 {
>         struct i2c_client *i2c_main;
>         struct i2c_client *i2c_edid;
> @@ -377,7 +381,7 @@ struct adv7511 {
>         u8 num_dsi_lanes;
>         bool use_timing_gen;
>
> -       enum adv7511_type type;
> +       const struct adv7511_chip_info *info;
>         struct platform_device *audio_pdev;
>
>         struct cec_adapter *cec_adap;
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 2611afd2c1c1..013d8d640ef4 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -354,7 +354,7 @@ static void __adv7511_power_on(struct adv7511 *adv751=
1)
>          * first few seconds after enabling the output. On the other hand
>          * adv7535 require to enable HPD Override bit for proper HPD.
>          */
> -       if (adv7511->type =3D=3D ADV7535)
> +       if (adv7511->info->type =3D=3D ADV7535)
>                 regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
>                                    ADV7535_REG_POWER2_HPD_OVERRIDE,
>                                    ADV7535_REG_POWER2_HPD_OVERRIDE);
> @@ -373,7 +373,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
>          */
>         regcache_sync(adv7511->regmap);
>
> -       if (adv7511->type =3D=3D ADV7533 || adv7511->type =3D=3D ADV7535)
> +       if (adv7511->info->type =3D=3D ADV7533 || adv7511->info->type =3D=
=3D ADV7535)
>                 adv7533_dsi_power_on(adv7511);
>         adv7511->powered =3D true;
>  }
> @@ -381,7 +381,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
>  static void __adv7511_power_off(struct adv7511 *adv7511)
>  {
>         /* TODO: setup additional power down modes */
> -       if (adv7511->type =3D=3D ADV7535)
> +       if (adv7511->info->type =3D=3D ADV7535)
>                 regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER2,
>                                    ADV7535_REG_POWER2_HPD_OVERRIDE, 0);
>
> @@ -397,7 +397,7 @@ static void __adv7511_power_off(struct adv7511 *adv75=
11)
>  static void adv7511_power_off(struct adv7511 *adv7511)
>  {
>         __adv7511_power_off(adv7511);
> -       if (adv7511->type =3D=3D ADV7533 || adv7511->type =3D=3D ADV7535)
> +       if (adv7511->info->type =3D=3D ADV7533 || adv7511->info->type =3D=
=3D ADV7535)
>                 adv7533_dsi_power_off(adv7511);
>         adv7511->powered =3D false;
>  }
> @@ -682,7 +682,7 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_co=
nnector *connector)
>                         status =3D connector_status_disconnected;
>         } else {
>                 /* Renable HPD sensing */
> -               if (adv7511->type =3D=3D ADV7535)
> +               if (adv7511->info->type =3D=3D ADV7535)
>                         regmap_update_bits(adv7511->regmap, ADV7511_REG_P=
OWER2,
>                                            ADV7535_REG_POWER2_HPD_OVERRID=
E,
>                                            ADV7535_REG_POWER2_HPD_OVERRID=
E);
> @@ -786,7 +786,7 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
>         else
>                 low_refresh_rate =3D ADV7511_LOW_REFRESH_RATE_NONE;
>
> -       if (adv7511->type =3D=3D ADV7511)
> +       if (adv7511->info->type =3D=3D ADV7511)
>                 regmap_update_bits(adv7511->regmap, 0xfb,
>                                    0x6, low_refresh_rate << 1);
>         else
> @@ -921,7 +921,7 @@ static enum drm_mode_status adv7511_bridge_mode_valid=
(struct drm_bridge *bridge,
>  {
>         struct adv7511 *adv =3D bridge_to_adv7511(bridge);
>
> -       if (adv->type =3D=3D ADV7533 || adv->type =3D=3D ADV7535)
> +       if (adv->info->type =3D=3D ADV7533 || adv->info->type =3D=3D ADV7=
535)
>                 return adv7533_mode_valid(adv, mode);
>         else
>                 return adv7511_mode_valid(adv, mode);
> @@ -1009,7 +1009,7 @@ static int adv7511_init_regulators(struct adv7511 *=
adv)
>         unsigned int i;
>         int ret;
>
> -       if (adv->type =3D=3D ADV7511) {
> +       if (adv->info->type =3D=3D ADV7511) {
>                 supply_names =3D adv7511_supply_names;
>                 adv->num_supplies =3D ARRAY_SIZE(adv7511_supply_names);
>         } else {
> @@ -1093,7 +1093,7 @@ static int adv7511_init_cec_regmap(struct adv7511 *=
adv)
>                 goto err;
>         }
>
> -       if (adv->type =3D=3D ADV7533 || adv->type =3D=3D ADV7535) {
> +       if (adv->info->type =3D=3D ADV7533 || adv->info->type =3D=3D ADV7=
535) {
>                 ret =3D adv7533_patch_cec_registers(adv);
>                 if (ret)
>                         goto err;
> @@ -1192,7 +1192,7 @@ static int adv7511_parse_dt(struct device_node *np,
>
>  static int adv7511_probe(struct i2c_client *i2c)
>  {
> -       const struct i2c_device_id *id =3D i2c_client_get_device_id(i2c);
> +       static const struct adv7511_chip_info *info;
>         struct adv7511_link_config link_config;
>         struct adv7511 *adv7511;
>         struct device *dev =3D &i2c->dev;
> @@ -1206,18 +1206,16 @@ static int adv7511_probe(struct i2c_client *i2c)
>         if (!adv7511)
>                 return -ENOMEM;
>
> +       info =3D i2c_get_match_data(i2c);
> +
>         adv7511->i2c_main =3D i2c;
>         adv7511->powered =3D false;
>         adv7511->status =3D connector_status_disconnected;
> -
> -       if (dev->of_node)
> -               adv7511->type =3D (enum adv7511_type)of_device_get_match_=
data(dev);
> -       else
> -               adv7511->type =3D id->driver_data;
> +       adv7511->info =3D info;
>
>         memset(&link_config, 0, sizeof(link_config));
>
> -       if (adv7511->type =3D=3D ADV7511)
> +       if (adv7511->info->type =3D=3D ADV7511)
>                 ret =3D adv7511_parse_dt(dev->of_node, &link_config);
>         else
>                 ret =3D adv7533_parse_dt(dev->of_node, adv7511);
> @@ -1254,7 +1252,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>                 goto uninit_regulators;
>         dev_dbg(dev, "Rev. %d\n", val);
>
> -       if (adv7511->type =3D=3D ADV7511)
> +       if (info->type =3D=3D ADV7511)
>                 ret =3D regmap_register_patch(adv7511->regmap,
>                                             adv7511_fixed_registers,
>                                             ARRAY_SIZE(adv7511_fixed_regi=
sters));
> @@ -1306,7 +1304,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>
>         i2c_set_clientdata(i2c, adv7511);
>
> -       if (adv7511->type =3D=3D ADV7511)
> +       if (info->type =3D=3D ADV7511)
>                 adv7511_set_link_config(adv7511, &link_config);
>
>         ret =3D adv7511_cec_init(dev, adv7511);
> @@ -1325,7 +1323,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>
>         adv7511_audio_init(dev, adv7511);
>
> -       if (adv7511->type =3D=3D ADV7533 || adv7511->type =3D=3D ADV7535)=
 {
> +       if (info->type =3D=3D ADV7533 || info->type =3D=3D ADV7535) {
>                 ret =3D adv7533_attach_dsi(adv7511);
>                 if (ret)
>                         goto err_unregister_audio;
> @@ -1368,22 +1366,34 @@ static void adv7511_remove(struct i2c_client *i2c=
)
>         i2c_unregister_device(adv7511->i2c_edid);
>  }
>
> +static const struct adv7511_chip_info adv7511_chip_info =3D {
> +       .type =3D ADV7511
> +};
> +
> +static const struct adv7511_chip_info adv7533_chip_info =3D {
> +       .type =3D ADV7533
> +};
> +
> +static const struct adv7511_chip_info adv7535_chip_info =3D {
> +       .type =3D ADV7535
> +};
> +
>  static const struct i2c_device_id adv7511_i2c_ids[] =3D {
> -       { "adv7511", ADV7511 },
> -       { "adv7511w", ADV7511 },
> -       { "adv7513", ADV7511 },
> -       { "adv7533", ADV7533 },
> -       { "adv7535", ADV7535 },
> +       { "adv7511", (kernel_ulong_t)&adv7511_chip_info },
> +       { "adv7511w", (kernel_ulong_t)&adv7511_chip_info },
> +       { "adv7513", (kernel_ulong_t)&adv7511_chip_info },
> +       { "adv7533", (kernel_ulong_t)&adv7533_chip_info },
> +       { "adv7535", (kernel_ulong_t)&adv7535_chip_info },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, adv7511_i2c_ids);
>
>  static const struct of_device_id adv7511_of_ids[] =3D {
> -       { .compatible =3D "adi,adv7511", .data =3D (void *)ADV7511 },
> -       { .compatible =3D "adi,adv7511w", .data =3D (void *)ADV7511 },
> -       { .compatible =3D "adi,adv7513", .data =3D (void *)ADV7511 },
> -       { .compatible =3D "adi,adv7533", .data =3D (void *)ADV7533 },
> -       { .compatible =3D "adi,adv7535", .data =3D (void *)ADV7535 },
> +       { .compatible =3D "adi,adv7511", .data =3D &adv7511_chip_info },
> +       { .compatible =3D "adi,adv7511w", .data =3D &adv7511_chip_info },
> +       { .compatible =3D "adi,adv7513", .data =3D &adv7511_chip_info },
> +       { .compatible =3D "adi,adv7533", .data =3D &adv7533_chip_info },
> +       { .compatible =3D "adi,adv7535", .data =3D &adv7535_chip_info },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, adv7511_of_ids);
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/b=
ridge/adv7511/adv7533.c
> index 7e3e56441aed..c452c4dc1c3f 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -108,11 +108,11 @@ enum drm_mode_status adv7533_mode_valid(struct adv7=
511 *adv,
>         u8 bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
>
>         /* Check max clock for either 7533 or 7535 */
> -       if (mode->clock > (adv->type =3D=3D ADV7533 ? 80000 : 148500))
> +       if (mode->clock > (adv->info->type =3D=3D ADV7533 ? 80000 : 14850=
0))
>                 return MODE_CLOCK_HIGH;
>
>         /* Check max clock for each lane */
> -       max_lane_freq =3D (adv->type =3D=3D ADV7533 ? 800000 : 891000);
> +       max_lane_freq =3D (adv->info->type =3D=3D ADV7533 ? 800000 : 8910=
00);
>
>         if (mode->clock * bpp > max_lane_freq * adv->num_dsi_lanes)
>                 return MODE_CLOCK_HIGH;
> --
> 2.25.1
>
