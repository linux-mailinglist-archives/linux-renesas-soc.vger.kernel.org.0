Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B01578BB0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Aug 2023 00:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbjH1Wgu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 18:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233804AbjH1Wgu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 18:36:50 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983BB184
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 15:36:47 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6bdcbde9676so3043479a34.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 15:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693262207; x=1693867007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IecrG5N4IH7F6ZerOlqmJsF0xD6JKD/qSd81We10bDU=;
        b=laLBKbFI9+y55DOgGQL3x607LZcw6VJZXmLVKmHiWVK1o1UHmXW6Daa8ozJhypbR4x
         pgcHo3sr+o98/N5XLTba8y2JearQy4qo7oYvvhtg3teCpPoln3bIcUj0kvD96vpXtjpd
         wrlfad+s326GDxJ2PQUyTANgiskiDdnKfJC/G21JYACTcc1qwlWSzpFLU1XVPT6j0Own
         5Pho2Xtdc1avGnb6pEjQvp7e1k/Ym3arqdOiPTZx1eAcnexzC/tf/sgv3XFO/cygCf+A
         COLaeYlr2PewRP6VIAvgr3ffxJ8g7MwQJLMy55Sku8k+PzOno7AwBDynXulUsniezKBf
         iG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693262207; x=1693867007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IecrG5N4IH7F6ZerOlqmJsF0xD6JKD/qSd81We10bDU=;
        b=VngQUvr7/dFtMfqMexTw3Z0L8Yy1mLyVD2Blz9YDIao13LtsXKIW6W4Q2MeW9GniRU
         D1RSzBmzeEtmKVv3cKhWOZLyUf2Ym+mtFE2aVSjsStoJc4ds28dxnE5GaD5lOyHOKMfS
         fRSK9tVeOjH3gKOTfAxCWfSX146SeKwnG9puouaZ//EIufhuWucoqphpokhEmTAIRjNR
         DKLRLxdWUh3zodQC6YeMlAo/4jhMea+0xl1uzSOcolkAWXK2jvPyywTqgVLvW4G010Mv
         DMEHBAjrvjqIQTRpSF6S8nXxUVw0XlgbLvTYRlhZjLG9VsLGcMhmExRhGbryh75ncZC7
         8sAw==
X-Gm-Message-State: AOJu0Yw36TfHA1rbH9U5/huaBYuM7gvqVNCWMkeb02dRoZpFzYZzFnjT
        kZh1YIQMivGGRQ6auASaduTm6Uf4In99jjQ2wGA=
X-Google-Smtp-Source: AGHT+IEKPsawjxD9UjcfpuIXDMO/SiaqZJnPfcnQEQCWWQWRxGOKbOGAaBFmNwXYnzuA2RAdCFcR7FT5tLVd92dtdo4=
X-Received: by 2002:a05:6870:c21f:b0:1b0:805:8678 with SMTP id
 z31-20020a056870c21f00b001b008058678mr13652229oae.24.1693262206842; Mon, 28
 Aug 2023 15:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com> <20230813180512.307418-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230813180512.307418-3-biju.das.jz@bp.renesas.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 28 Aug 2023 17:36:35 -0500
Message-ID: <CAHCN7xLw=PVZh=XfrD8cNXxMopimCja26WJYADtG7VyC=e2pVg@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm: adv7511: Add max_mode_clock variable to struct adv7511_chip_info
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
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 13, 2023 at 1:05=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> The ADV7533 supports a maximum pixel clock of 80MHz whereas it is 148.5MH=
z
> for ADV7535.  Add max_mode_clock variable to struct adv7511_chip_info to
> handle this difference.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

For the series:

Reviewed-by: Adam Ford <aford173@gmail.com>
Tested-by: Adam Ford <aford173@gmail.com> #imx8mm-beacon

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 1 +
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++++--
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     | 2 +-
>  3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/b=
ridge/adv7511/adv7511.h
> index 59e8ef10d72e..f8190442ffca 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -335,6 +335,7 @@ enum adv7511_type {
>
>  struct adv7511_chip_info {
>         enum adv7511_type type;
> +       unsigned long max_mode_clock;
>  };
>
>  struct adv7511 {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 013d8d640ef4..193b2d5bc7e6 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1371,11 +1371,13 @@ static const struct adv7511_chip_info adv7511_chi=
p_info =3D {
>  };
>
>  static const struct adv7511_chip_info adv7533_chip_info =3D {
> -       .type =3D ADV7533
> +       .type =3D ADV7533,
> +       .max_mode_clock =3D 80000
>  };
>
>  static const struct adv7511_chip_info adv7535_chip_info =3D {
> -       .type =3D ADV7535
> +       .type =3D ADV7535,
> +       .max_mode_clock =3D 148500
>  };
>
>  static const struct i2c_device_id adv7511_i2c_ids[] =3D {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/b=
ridge/adv7511/adv7533.c
> index c452c4dc1c3f..e92b27e0afd1 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -108,7 +108,7 @@ enum drm_mode_status adv7533_mode_valid(struct adv751=
1 *adv,
>         u8 bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
>
>         /* Check max clock for either 7533 or 7535 */
> -       if (mode->clock > (adv->info->type =3D=3D ADV7533 ? 80000 : 14850=
0))
> +       if (mode->clock > adv->info->max_mode_clock)
>                 return MODE_CLOCK_HIGH;
>
>         /* Check max clock for each lane */
> --
> 2.25.1
>
