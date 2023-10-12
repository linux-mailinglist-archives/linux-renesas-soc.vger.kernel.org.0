Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9807C6968
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Oct 2023 11:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235399AbjJLJXY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Oct 2023 05:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235513AbjJLJXX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 05:23:23 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA0D3B8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 02:23:21 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a7c7262d5eso9575387b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 02:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697102600; x=1697707400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLqNDcxJiv20ehs9D0nU/cOeQ3thP02EgHIdRx1B5Sw=;
        b=HPgx1ABiQajAS+ug+1+/koXoGwpl0DN7PHD1TduRQqIzMIp9qIk7M1i4q508VYubMM
         Aolo54Jph5AjyOX5i6cKaG7+17VVw32yoFxXQEVNQDJgRjvtJ9gHwf5F+pi+nT5/pK48
         4FAb3o7LG6TZ/t49skb5EPaZCg0M8nZx3Ry6kKU7VhPdxMl/voPTtKYS/10JFbHpl1ZQ
         EWPpgV9NNCftklhqbhA2lhwkJkLeb0TRdxwN0BhvAhkqwO/uaZrtq3mo/BjwW7HP+98I
         aFW27lAnD/O/EyjM3HyGmKcuIU3wdoW/0OA//yJP+PRS4/dsmOYuUVaJPGFYyhyYfm/b
         V81g==
X-Gm-Message-State: AOJu0YyLcqQsg6U4kTnzFFDyTY2GEJPhldd8D4b7uIgf3Z7yqFwWzOZU
        OFluC6ghVV4spHbjD0G0RuIzWScSfleuBA==
X-Google-Smtp-Source: AGHT+IFo8F9tCu1g9xEogCV/KgsxPh/mIhCmCtJh1mTpA0cXBliB7HsKKRRkFwbJkstByLVxTw6gUg==
X-Received: by 2002:a0d:e841:0:b0:5a7:d986:a9bb with SMTP id r62-20020a0de841000000b005a7d986a9bbmr5584611ywe.3.1697102600603;
        Thu, 12 Oct 2023 02:23:20 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id y134-20020a81a18c000000b0059f650f46b2sm5755710ywg.7.2023.10.12.02.23.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 02:23:19 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5a7be88e9ccso9483067b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 02:23:19 -0700 (PDT)
X-Received: by 2002:a0d:ea4a:0:b0:5a7:bff3:6fe4 with SMTP id
 t71-20020a0dea4a000000b005a7bff36fe4mr7804990ywe.9.1697102599538; Thu, 12 Oct
 2023 02:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231002122740.220177-1-biju.das.jz@bp.renesas.com> <20231002122740.220177-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231002122740.220177-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Oct 2023 11:23:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWC5Nd3nezR1K_XD5CJTM76XUbv3=Pf9fHvYK43n4iqmQ@mail.gmail.com>
Message-ID: <CAMuHMdWC5Nd3nezR1K_XD5CJTM76XUbv3=Pf9fHvYK43n4iqmQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] drm: renesas: Add RZ/G2L DU Support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Oct 2, 2023 at 2:28 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The LCD controller is composed of Frame Compression Processor (FCPVD),
> Video Signal Processor (VSPD), and Display Unit (DU).
>
> It has DPI/DSI interfaces and supports a maximum resolution of 1080p
> along with 2 RPFs to support the blending of two picture layers and
> raster operations (ROPs).
>
> The DU module is connected to VSPD. Add RZ/G2L DU support for RZ/G2L
> alike SoCs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> v9->v10:

>  * Added rzg2l_du_write() wrapper function.

> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c

> +static inline void rzg2l_du_write(struct rzg2l_du_device *rcdu, u32 reg, u32 data)
> +{
> +       writel(data, rcdu->mmio + reg);
> +}

What is the added value of this wrapper?
The order of the reg/data parameters is the inverse of the
standard writel() operation...

> +       rzg2l_du_write(rcdu, DU_DITR0, ditr0);

... and using it actually needs one more keystroke than open-coding it:

-       writel(ditr0, rcdu->mmio + DU_DITR0);

Sorry for missing this before.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
