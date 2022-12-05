Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97E4F6424AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 09:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbiLEIej (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 03:34:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232037AbiLEIei (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 03:34:38 -0500
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA9912619
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Dec 2022 00:34:37 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id s14so7732721qvo.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Dec 2022 00:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvH0MCntFVBZWPqkSug67+kAWu2Og+zGum+zWaRS29c=;
        b=XP5U8SapRkzj3/RLzacciMk0XucmB5PhWhI92PRU9wqdQSOLXoyV9bHTaog6U0eoDH
         bS29ugNKaLY+R+V1QoLMmf6iwAR5t3jQla4BmNz1pTSXsmYOhLIgI7MiutQp3Fx1Sxex
         iA/De+4Uyv7B/5jn3J5YumVMaRuwR8WsQ2k/VCPOeUia1FN9/0ZGYW4hm7dGgmTkDQsI
         ugAU3mlgEFrcRd0vzuYz5lRBrVZeq1fAo848He44uPlqmDyTng+qQLBSpJ7tuXZ+tSi5
         onupx3OGzP6IwZp0yTj8d4ifqS8GERUcHQwPtT8nrsyvkciHZLx+PQMFzDNCtdIh9Q6f
         nNNQ==
X-Gm-Message-State: ANoB5pl034YGCUdA2qZy/KFNW2mYHpn9eTK59+FGmnoNgpQaK/Jx0Tnb
        O1VhE8mUcAGRKYTp2s7TZ5btbBpnDXuw8A==
X-Google-Smtp-Source: AA0mqf7qlVhQT1aGPsEY7y+knKdg9cKLm+283ms0cSKGtMRZcQ9YTRq7t6wd77xmsVnqol6nu6Gjvg==
X-Received: by 2002:a0c:ebca:0:b0:4c7:afc:74cf with SMTP id k10-20020a0cebca000000b004c70afc74cfmr25855732qvq.83.1670229276522;
        Mon, 05 Dec 2022 00:34:36 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id l27-20020ac84cdb000000b00399fe4aac3esm9073031qtv.50.2022.12.05.00.34.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 00:34:36 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3cbdd6c00adso110254637b3.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Dec 2022 00:34:36 -0800 (PST)
X-Received: by 2002:a0d:cb4c:0:b0:38e:e541:d8ca with SMTP id
 n73-20020a0dcb4c000000b0038ee541d8camr9021535ywd.283.1670229275878; Mon, 05
 Dec 2022 00:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20221205080339.12801-1-tomi.valkeinen+renesas@ideasonboard.com> <20221205080339.12801-5-tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20221205080339.12801-5-tomi.valkeinen+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Dec 2022 09:34:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUW6x1g3VBoHwmZCLo38oM_oA6modHuJi-YZ1shVzHwEA@mail.gmail.com>
Message-ID: <CAMuHMdUW6x1g3VBoHwmZCLo38oM_oA6modHuJi-YZ1shVzHwEA@mail.gmail.com>
Subject: Re: [PATCH kms++ v2 4/4] kms++util: Add Y21x drawing support
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

On Mon, Dec 5, 2022 at 9:07 AM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> Add support for drawing Y210, Y212, Y216 pixels.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/kms++util/src/drawing.cpp
> +++ b/kms++util/src/drawing.cpp

> @@ -179,6 +180,62 @@ static void draw_yuv422_packed_macropixel(IFramebuffer& buf, unsigned x, unsigne
>         }
>  }
>
> +static void draw_y2xx_packed_macropixel(IFramebuffer& buf, unsigned x, unsigned y,
> +                                         YUV yuv1, YUV yuv2)
> +{
> +       const uint32_t macro_size = 4;
> +       uint16_t* p = (uint16_t*)(buf.map(0) + buf.stride(0) * y + x * macro_size);
> +
> +       switch (buf.format()) {
> +       case PixelFormat::Y210: {
> +               // XXX naive expansion to 10 bits, similar to 10-bit funcs in class RGB
> +               uint16_t y0 = yuv1.y << 2;

"yuv1.y << 2 | yuv1.y >> 6" etc...

> +               uint16_t y1 = yuv2.y << 2;
> +               uint16_t cb = ((yuv1.u  << 2) + (yuv2.u << 2)) / 2;
> +               uint16_t cr = ((yuv1.v  << 2) + (yuv2.v << 2)) / 2;
> +
> +               // The 10 bits occupy the msb, so we shift left by 16-10 = 6
> +               write16le(&p[0], y0 << 6);
> +               write16le(&p[1], cb << 6);
> +               write16le(&p[2], y1 << 6);
> +               write16le(&p[3], cr << 6);
> +               break;
> +       }
> +
> +       case PixelFormat::Y212: {
> +               // XXX naive expansion to 12 bits
> +               uint16_t y0 = yuv1.y << 4;

"yuv1.y << 4 | yuv1.y >> 4" etc.

> +               uint16_t y1 = yuv2.y << 4;
> +               uint16_t cb = ((yuv1.u  << 4) + (yuv2.u << 4)) / 2;
> +               uint16_t cr = ((yuv1.v  << 4) + (yuv2.v << 4)) / 2;
> +
> +               // The 10 bits occupy the msb, so we shift left by 16-12 = 4
> +               write16le(&p[0], y0 << 4);
> +               write16le(&p[1], cb << 4);
> +               write16le(&p[2], y1 << 4);
> +               write16le(&p[3], cr << 4);
> +               break;
> +       }
> +
> +       case PixelFormat::Y216: {
> +               // XXX naive expansion to 16 bits
> +               uint16_t y0 = yuv1.y << 8;

"yuv1.y << 8 | yuv1.y" etc.


> +               uint16_t y1 = yuv2.y << 8;
> +               uint16_t cb = ((yuv1.u  << 8) + (yuv2.u << 8)) / 8;

Why divide by 8 instead of 2?

> +               uint16_t cr = ((yuv1.v  << 8) + (yuv2.v << 8)) / 8;
> +
> +               write16le(&p[0], y0);
> +               write16le(&p[1], cb);
> +               write16le(&p[2], y1);
> +               write16le(&p[3], cr);
> +               break;
> +       }
> +
> +       default:
> +               throw std::invalid_argument("invalid pixelformat");
> +       }
> +}
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
