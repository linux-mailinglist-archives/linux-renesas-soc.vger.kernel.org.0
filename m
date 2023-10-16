Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B75F7CA328
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 11:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233363AbjJPJB5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 05:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbjJPJBg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 05:01:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA290185
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 02:01:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8C6C4339A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697446885;
        bh=s3qzNPNvQuJHp6YFDW+4nOZxw2vl+IiZvSHmAcyc4+w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=inltUolFHGy+yQpHTntsbxKcqXuGceiEOSsuNwxUXcRZ4t004aDafBTEPwCbu0z++
         29h+J+fvm3I8Lo0WJcoG7y3LfJbQ/+oE1PX3JkxxOwQrD5EpDdWVjCIZgpZ/WMQXFV
         nX3XrEaE/vsWi+0szv8WfAS2Dpo+KFtQ/QmJQWm0u7YVo0Uswx25zw/yl62Ik5i7ja
         OTzaU5+10+xMFLohEpP/Iy1g7hIB0q+0zkskWtKJ19iW+EQT9Jf7YnqQP3O64LEP1D
         KKkp+juE2bLgXvhB4Ij8xx2GB3ER6bg9Q3CLSaoSbIfYqqBcOYCVMZI+myLUwOHkFV
         P69REoPvpsbhQ==
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5b5354da665so306966a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 02:01:25 -0700 (PDT)
X-Gm-Message-State: AOJu0YxKw8D6k05Y3Ve4ZCsleTeIvKBZ+ldMgop/NGiJ7uPbVbJuzyrz
        fJDttJ1VDSh/Lg0C1gVqRMX5BcV9NR2TFL2IlJ4lfw==
X-Google-Smtp-Source: AGHT+IEJhVqcrvvveiwsWqc4tXkqCxOOlkKOTl9jClJtOoTdI475T96J7bZFNq7cGHRYW0Y0WcYeHfT8TND+QjioSFs=
X-Received: by 2002:a17:90a:1954:b0:27d:10ab:2325 with SMTP id
 20-20020a17090a195400b0027d10ab2325mr9826177pjh.27.1697446885097; Mon, 16 Oct
 2023 02:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com> <20230830142358.275459-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830142358.275459-7-biju.das.jz@bp.renesas.com>
From:   Robert Foss <rfoss@kernel.org>
Date:   Mon, 16 Oct 2023 11:01:14 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6g+BLXi4LQ3vsTva-yKnNOqYAMVCOHR+xThFq3kRyANw@mail.gmail.com>
Message-ID: <CAN6tsi6g+BLXi4LQ3vsTva-yKnNOqYAMVCOHR+xThFq3kRyANw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] drm: adv7511: Add has_dsi variable to struct adv7511_chip_info
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
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
> The ADV7533 and ADV7535 have DSI support. Add a variable has_dsi to
> struct adv7511_chip_info for handling configuration related to DSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Replaced variable type from unsigned->bool.
>  * Restored check using type for low_refresh_rate and
>    regmap_register_patch().
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++----
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index a728bfb33d03..0dd56e311039 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -340,6 +340,7 @@ struct adv7511_chip_info {
>         const char * const *supply_names;
>         unsigned int num_supplies;
>         unsigned int reg_cec_offset;
> +       bool has_dsi;
>  };
>
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index d806c870bf76..9d88c29b6f59 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -373,7 +373,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
>          */
>         regcache_sync(adv7511->regmap);
>
> -       if (adv7511->info->type =3D=3D ADV7533 || adv7511->info->type =3D=
=3D ADV7535)
> +       if (adv7511->info->has_dsi)
>                 adv7533_dsi_power_on(adv7511);
>         adv7511->powered =3D true;
>  }
> @@ -397,7 +397,7 @@ static void __adv7511_power_off(struct adv7511 *adv75=
11)
>  static void adv7511_power_off(struct adv7511 *adv7511)
>  {
>         __adv7511_power_off(adv7511);
> -       if (adv7511->info->type =3D=3D ADV7533 || adv7511->info->type =3D=
=3D ADV7535)
> +       if (adv7511->info->has_dsi)
>                 adv7533_dsi_power_off(adv7511);
>         adv7511->powered =3D false;
>  }
> @@ -921,7 +921,7 @@ static enum drm_mode_status adv7511_bridge_mode_valid=
(struct drm_bridge *bridge,
>  {
>         struct adv7511 *adv =3D bridge_to_adv7511(bridge);
>
> -       if (adv->info->type =3D=3D ADV7533 || adv->info->type =3D=3D ADV7=
535)
> +       if (adv->info->has_dsi)
>                 return adv7533_mode_valid(adv, mode);
>         else
>                 return adv7511_mode_valid(adv, mode);
> @@ -1311,7 +1311,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>
>         adv7511_audio_init(dev, adv7511);
>
> -       if (adv7511->info->type =3D=3D ADV7533 || adv7511->info->type =3D=
=3D ADV7535) {
> +       if (adv7511->info->has_dsi) {
>                 ret =3D adv7533_attach_dsi(adv7511);
>                 if (ret)
>                         goto err_unregister_audio;
> @@ -1367,6 +1367,7 @@ static const struct adv7511_chip_info adv7533_chip_=
info =3D {
>         .supply_names =3D adv7533_supply_names,
>         .num_supplies =3D ARRAY_SIZE(adv7533_supply_names),
>         .reg_cec_offset =3D ADV7533_REG_CEC_OFFSET,
> +       .has_dsi =3D true,
>  };
>
>  static const struct adv7511_chip_info adv7535_chip_info =3D {
> @@ -1376,6 +1377,7 @@ static const struct adv7511_chip_info adv7535_chip_=
info =3D {
>         .supply_names =3D adv7533_supply_names,
>         .num_supplies =3D ARRAY_SIZE(adv7533_supply_names),
>         .reg_cec_offset =3D ADV7533_REG_CEC_OFFSET,
> +       .has_dsi =3D true,
>  };
>
>  static const struct i2c_device_id adv7511_i2c_ids[] =3D {
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
