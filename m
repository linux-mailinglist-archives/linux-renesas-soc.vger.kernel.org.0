Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35D037CA306
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 11:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbjJPJAN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 05:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233099AbjJPJAK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 05:00:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B68B4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 02:00:06 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D4CC433A9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697446806;
        bh=G9pHPhZGnXWe0N/+8Kyow0xOPj1fYjHp+tDBGOq9iPU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=N+sSSRO35ye9ZsIsgBd/gzez49v1Si2/JhvSgck35hEzB3VjEgWmBxLBg3GbQBTpg
         dvQWUBi7i7ytZPn2UMGYknlitDd/urLcimWSrbUy4qJSFMUOQBvscm0mu4sgqt4TYk
         8wkzz162/tVT32bmrgg3ak/oGGPExqKeRi6mNVDIFjEo/0AUFfq6YCsS5hcZsrHmUA
         uiWcXdfhvdA5Zc/0qTPod9cYLL+9eqE1flJa0zuYxVUG8eSRbXybzCDCJfg87oyusk
         Q/VbMVK5jA2e65S3AdnzrIKRZaqSKey+X6C6/NZUEPhyoZ4e8qSKDXXfUDDCJN+oO6
         /rgHiTRtj1A0Q==
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6b1d1099a84so2706619b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 02:00:06 -0700 (PDT)
X-Gm-Message-State: AOJu0YxdwVZYxbSMGKOfDYiiF0XL8rCXothqyor4RVhl6Lg3NE87mWqq
        VBzYt74OZdJsPhzWYFYzOe0bjpAFF8hfS868HnI2TA==
X-Google-Smtp-Source: AGHT+IEhKWc1Fx1hpQiTGzrTdOHujArMMfZOid/hgR5LXKF4A2vex79AfUrTILS4RufAQ35zaKMvB6u+gd0Ho6/WyV4=
X-Received: by 2002:a05:6300:8089:b0:17a:284:de50 with SMTP id
 ap9-20020a056300808900b0017a0284de50mr5510387pzc.6.1697446805971; Mon, 16 Oct
 2023 02:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com> <20230830142358.275459-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830142358.275459-8-biju.das.jz@bp.renesas.com>
From:   Robert Foss <rfoss@kernel.org>
Date:   Mon, 16 Oct 2023 10:59:55 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6J9=vA8D5M1OOzb97-2H7J30T6s8ruEo07udrLvfhtMQ@mail.gmail.com>
Message-ID: <CAN6tsi6J9=vA8D5M1OOzb97-2H7J30T6s8ruEo07udrLvfhtMQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm: adv7511: Add link_config variable to struct adv7511_chip_info
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
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

On Wed, Aug 30, 2023 at 4:25=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> The ADV7511 needs link configuration whereas ADV75{33,35} does not need
> it. Add a variable link_config to struct adv7511_chip_info to handle
> this difference.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v1->v2:
>  * Add Rb tag from Laurent.
>  * Replaced variable type from unsigned->bool.
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 5 +++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 0dd56e311039..0d39e32b0793 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -341,6 +341,7 @@ struct adv7511_chip_info {
>         unsigned int num_supplies;
>         unsigned int reg_cec_offset;
>         bool has_dsi;
> +       bool link_config;
>  };
>
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 9d88c29b6f59..e0ec3c098225 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1203,7 +1203,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>
>         memset(&link_config, 0, sizeof(link_config));
>
> -       if (adv7511->info->type =3D=3D ADV7511)
> +       if (adv7511->info->link_config)
>                 ret =3D adv7511_parse_dt(dev->of_node, &link_config);
>         else
>                 ret =3D adv7533_parse_dt(dev->of_node, adv7511);
> @@ -1292,7 +1292,7 @@ static int adv7511_probe(struct i2c_client *i2c)
>
>         i2c_set_clientdata(i2c, adv7511);
>
> -       if (adv7511->info->type =3D=3D ADV7511)
> +       if (adv7511->info->link_config)
>                 adv7511_set_link_config(adv7511, &link_config);
>
>         ret =3D adv7511_cec_init(dev, adv7511);
> @@ -1358,6 +1358,7 @@ static const struct adv7511_chip_info adv7511_chip_=
info =3D {
>         .type =3D ADV7511,
>         .supply_names =3D adv7511_supply_names,
>         .num_supplies =3D ARRAY_SIZE(adv7511_supply_names),
> +       .link_config =3D true,
>  };
>
>  static const struct adv7511_chip_info adv7533_chip_info =3D {
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
