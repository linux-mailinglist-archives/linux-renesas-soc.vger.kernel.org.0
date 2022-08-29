Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA455A5310
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 19:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbiH2RXo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 13:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiH2RXm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 13:23:42 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342377F090
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 10:23:42 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id y187so7149925iof.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 10:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=9ng/QoMPZV7sTTnrg5WAOHlmn6itHCmlnE31tAyev1Q=;
        b=AcquUG/qVIxo6tZwDJuGD4L6OwE/aGAt18UzXWW2WRwfh2SqUWrHtqlcvp96EYbBwG
         lOPU+YDt0TTSt++07j+YqzXCtD9Q1n4Kq46YXnyceTSfimwa3Oab5TBRI5t61Q8AYdfE
         F8+qidBmuq82JXns6k29MkFNWht0UDpQxuXKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=9ng/QoMPZV7sTTnrg5WAOHlmn6itHCmlnE31tAyev1Q=;
        b=V3V5NhWe1XRvMfBf/FxDPBfbdQrJPx5vWN5O30xSWcwBEjiaqGfUaIyBQCTsmdn7eK
         1vnMPyhkfScEenUWQlXXXHRcnGlJlxC1PIJfqWSwx2/WlZnyukhs1YVd03Jg3uneFRaI
         Hfd5HVu1GEJihfbcmlJ6HoBeh6w1tj9oVt2sVUc5jHdBDh/WAkA1MLs+EGo37axVmKjh
         j5lNjNV4ZLkYQpgXlcbcf5vb5oAKiv87qHrl4qTOJHeu5Vf5jCfdPuwCQEB+GAjjSadq
         91o/4dVGtyP4ccJEStkq+r2dEUCjULDVss9pgPSFjG3U8g6ii4NrrsHcoq6t35JAS2Rf
         h4gw==
X-Gm-Message-State: ACgBeo0DKYjkEVUKKcKpUYXbbwG0WxI+AhtOqee0Ef0wBSTftbxuuOdr
        rKyE3agqEX2CmQRE1FoWColFtLYa6QK70pLD
X-Google-Smtp-Source: AA6agR4ncQeIrgBEB5s+ppCvqMQ8iw9onzLSp5cgUBuyexwX7mXGAg+XIYEZZmWmpkAlEtFKBPMTyQ==
X-Received: by 2002:a05:6602:1402:b0:68a:9d38:8248 with SMTP id t2-20020a056602140200b0068a9d388248mr9097624iov.68.1661793821203;
        Mon, 29 Aug 2022 10:23:41 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id u4-20020a02b1c4000000b00343794a3ec0sm4543175jah.149.2022.08.29.10.23.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 10:23:40 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id y187so7149862iof.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 10:23:40 -0700 (PDT)
X-Received: by 2002:a05:6638:388e:b0:33c:b603:516 with SMTP id
 b14-20020a056638388e00b0033cb6030516mr10669371jav.133.1661793819928; Mon, 29
 Aug 2022 10:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com> <20220824130034.196041-3-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220824130034.196041-3-tomi.valkeinen@ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Aug 2022 10:23:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WUirzYMcHe_XxnJoom7N7RkuyQ8xDp03k+NNTR5F50JQ@mail.gmail.com>
Message-ID: <CAD=FV=WUirzYMcHe_XxnJoom7N7RkuyQ8xDp03k+NNTR5F50JQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] drm/bridge: ti-sn65dsi86: Reject modes with too
 large blanking
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Wed, Aug 24, 2022 at 6:00 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> The blanking related registers are 8 bits, so reject any modes
> with larger blanking periods.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index ba84215c1511..f085a037ff5b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -752,6 +752,29 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
>         if (mode->clock > 594000)
>                 return MODE_CLOCK_HIGH;
>
> +       /*
> +        * The blanking related registers are 8 bits, so reject any modes
> +        * with larger blanking periods.
> +        */
> +
> +       if ((mode->hsync_start - mode->hdisplay) > 0xff)
> +               return MODE_HBLANK_WIDE;
> +
> +       if ((mode->vsync_start - mode->vdisplay) > 0xff)
> +               return MODE_VBLANK_WIDE;
> +
> +       if ((mode->hsync_end - mode->hsync_start) > 0xff)
> +               return MODE_HSYNC_WIDE;

Please double-check your patch. Reading through
ti_sn_bridge_set_video_timings(), I see "mode->hsync_end -
mode->hsync_start" is allowed to be up to 0x7fff. The datasheet seems
to confirm. If I got that right it means you're rejecting valid modes.

I didn't validate any of your other checks, but at least that one seems wrong.

SInce this already had a Reviewed-by tag, being explicit:

Naked-by: Douglas Anderson <dianders@chromium.org>
