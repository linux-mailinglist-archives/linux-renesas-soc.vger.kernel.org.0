Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6477B598237
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Aug 2022 13:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244021AbiHRL1Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Aug 2022 07:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbiHRL1Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2022 07:27:24 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB6A5E643;
        Thu, 18 Aug 2022 04:27:22 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id cr9so824560qtb.13;
        Thu, 18 Aug 2022 04:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6kvD/PK9AAEksB95hW0WMEl3zwUZbuYTOgEL9ku4zZQ=;
        b=swtLwkuwiL4vzMSPbr0Bqtcm5FSKae6t7rG/ZFnZ9iPpK3m9J6I733lDqggH73KUr1
         imKmAwOWuU5pr5lvIhCspEzwyOG8aNuDgN6GaHhWqYS3Pq9OHVeJvvY5f9GsoY4PKIS5
         Xf9IubQrumwT4FFWRYXUMo0dXrmnBzQf+AKteYKMNEgrJ+VpbNnw1K6h7V1r8ZxokKBf
         Nk5MxxXIxhH/ezJiqMK1Xv/40Nqh8QbgWMOeaAEXpILEZcBnV/Tkw0QK4tBgzwIN5Y7W
         UyYVWPMaJZ9IG2l9aws2fJakYb8yQZs0uYEkhsFGVVz7J7W3SEC4PHUAfIhCw2fx5I1u
         vV2Q==
X-Gm-Message-State: ACgBeo1Znop1870cB1+j2oTQFM4QBhJFUTeCU9cnLpkeuInLNsiLrGsi
        Hb0+HXTQbjJatLj45IGhGQffJQytnhz9Rw==
X-Google-Smtp-Source: AA6agR7Ht7LZ1c3YA7AMavevrItv3fnbS/oIR98jxLEFfIo+9yKPDgbWCIZ0bvM/z3hO5ZRnwZ9efA==
X-Received: by 2002:ac8:5f4c:0:b0:342:e863:fdd9 with SMTP id y12-20020ac85f4c000000b00342e863fdd9mr2067994qta.683.1660822041222;
        Thu, 18 Aug 2022 04:27:21 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id c26-20020ac8111a000000b003431446588fsm861034qtj.5.2022.08.18.04.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 04:27:20 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-335624d1e26so32685117b3.4;
        Thu, 18 Aug 2022 04:27:20 -0700 (PDT)
X-Received: by 2002:a81:f47:0:b0:31f:434b:5ee with SMTP id 68-20020a810f47000000b0031f434b05eemr2350006ywp.383.1660822040378;
 Thu, 18 Aug 2022 04:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220728122312.189766-1-biju.das.jz@bp.renesas.com> <20220728122312.189766-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220728122312.189766-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Aug 2022 13:27:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW96tQjQbbXuP+_WvjXucQ_DTxiBnHwOmWNhnOaEpDSAA@mail.gmail.com>
Message-ID: <CAMuHMdW96tQjQbbXuP+_WvjXucQ_DTxiBnHwOmWNhnOaEpDSAA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a07g043: Add DMA support to RSPI
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jul 28, 2022 at 2:23 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add dmac phandles to RSPI nodes to support DMA operation.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
