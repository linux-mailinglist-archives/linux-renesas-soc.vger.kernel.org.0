Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB00A7CA2F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 10:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbjJPI70 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 04:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbjJPI7Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 04:59:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEF0DE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 01:59:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8007C43391
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 08:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697446763;
        bh=9iAJTkNE+5/gzF4lcoqzfyyY5K5ufuZmCmkEu7r+S/A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=p1d7kpSqsv+jrnQ9CZVxe25Rz8l0qUu0id0ew4qwjxIf1Lqwvb1T/URRRLkkNhgGT
         sEegUQmhJjuO9pIiqLN3a+CceLd6KKxY8aY8z5miRfnBYU24Sqg2Q5muGDnQKdVCJR
         6+yLU7vDAVsPcPterctsNBuTFJX12E0t8TcXFqlo6JcuudkZnpzytdtzIXovmrf0es
         +i2oRnTBwBDANVwWpccIp23NwpNuZCo84OmCegKFHO+dKuVnlLH5QISXFQUT9fHV6u
         iez/CK9elJMjxT3SsqL/pQDPzLLAc2bBq+Epp9a6bk6qdK/t/RvWNIPom1zWF2m6/f
         VdT4bhPE/gKtg==
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6b497c8575aso2493678b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2023 01:59:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YxaauqbWmWHysWN+QiC7236fIkbQzcy/ThUXIp+B3DIF0RBfbB2
        BWWQTg5I3zhGYZQbH98sqYMuqAC71ADqkfZ5lk5OFw==
X-Google-Smtp-Source: AGHT+IF1t7lwiVxhcEiQPsmS7cLYAcfnemeM1+gRawN17OPND/2pZ53/ODEmJKWPPyooN10ltrZu2PwpeLVkebRfMnQ=
X-Received: by 2002:a05:6a21:a5a8:b0:152:6b63:f1e5 with SMTP id
 gd40-20020a056a21a5a800b001526b63f1e5mr45763390pzc.38.1697446763501; Mon, 16
 Oct 2023 01:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230830142358.275459-1-biju.das.jz@bp.renesas.com> <20230830142358.275459-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230830142358.275459-9-biju.das.jz@bp.renesas.com>
From:   Robert Foss <rfoss@kernel.org>
Date:   Mon, 16 Oct 2023 10:59:12 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6SYdKcJbjiVn1bOFv8O6g_AGM-+Qj_r8tgYgzDMsWHiw@mail.gmail.com>
Message-ID: <CAN6tsi6SYdKcJbjiVn1bOFv8O6g_AGM-+Qj_r8tgYgzDMsWHiw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm: adv7511: Add hpd_override_enable variable to
 struct adv7511_chip_info
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

On Wed, Aug 30, 2023 at 4:25=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
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
> Add hpd_override_enable variable to struct adv7511_chip_info to handle
> this scenario.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Restored enum adv7511_type as there are users.
>  * Replaced variable type from unsigned->bool.
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 7 ++++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 0d39e32b0793..39c9ece373b0 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -342,6 +342,7 @@ struct adv7511_chip_info {
>         unsigned int reg_cec_offset;
>         bool has_dsi;
>         bool link_config;
> +       bool hpd_override_enable;
>  };
>
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index e0ec3c098225..83ff4206b3b7 100644
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
> @@ -1379,6 +1379,7 @@ static const struct adv7511_chip_info adv7535_chip_=
info =3D {
>         .num_supplies =3D ARRAY_SIZE(adv7533_supply_names),
>         .reg_cec_offset =3D ADV7533_REG_CEC_OFFSET,
>         .has_dsi =3D true,
> +       .hpd_override_enable =3D true,
>  };
>
>  static const struct i2c_device_id adv7511_i2c_ids[] =3D {
> --
> 2.25.1

Reviewed-by: Robert Foss <rfoss@kernel.org>
