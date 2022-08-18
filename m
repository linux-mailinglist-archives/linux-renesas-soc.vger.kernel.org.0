Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A778598242
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Aug 2022 13:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244323AbiHRL2C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Aug 2022 07:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbiHRL2A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2022 07:28:00 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9A85E541;
        Thu, 18 Aug 2022 04:27:59 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id i7so828224qka.13;
        Thu, 18 Aug 2022 04:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6kvD/PK9AAEksB95hW0WMEl3zwUZbuYTOgEL9ku4zZQ=;
        b=OTsU0oJBgMZ3d2HOu+1nw8R9rBwJ7E5ozcephcyBVlbVRfz7gFp8b4AhQFXZNh3jY/
         FStnOhupsm7CB2sSB/c5Ciy4Qw5hmUoixPgMewCXuHEjj81FTzl6x22PoVKafhO5ZMUt
         gac1Wkh8BmlFLwOJfWeQfKccmjFWDBSNajMFqms1umH6UttrP4Tiu7cc5qmuhwyd3DGX
         p/3/o2kRYDFzMNOPNrG1NVFBrVA5xbugWddu2Y+2WAVf2LTFBRULV9Cn3DqHQuXJc+3b
         clXBgbzg78kWVApczYGbCtx4CkF5NBoXjNjEnwZK6HeZ69ElraYPcL0bCqBfjBNqXryB
         XaCQ==
X-Gm-Message-State: ACgBeo1qS/wC3U3jEWoO6sUqFTLKXPpA9fxvTKxHNx1xKANkNfgYM8No
        pN+uGQI0sQNVU0wH4sQQu5gU8da8SLOsqw==
X-Google-Smtp-Source: AA6agR70QSQ2Bkp5G6blDNH5JDhwiTKklV4pmGEqS32VcuihuMMJQwqeNXZ38wZsNzj2Dn7cbW0z6Q==
X-Received: by 2002:a05:620a:151b:b0:6bb:5508:59bb with SMTP id i27-20020a05620a151b00b006bb550859bbmr1607006qkk.55.1660822078294;
        Thu, 18 Aug 2022 04:27:58 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id r1-20020a05620a298100b006bb53282393sm1312310qkp.81.2022.08.18.04.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 04:27:57 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-3375488624aso3505847b3.3;
        Thu, 18 Aug 2022 04:27:57 -0700 (PDT)
X-Received: by 2002:a81:1204:0:b0:322:7000:4ecb with SMTP id
 4-20020a811204000000b0032270004ecbmr2324385yws.47.1660822077250; Thu, 18 Aug
 2022 04:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220728122312.189766-1-biju.das.jz@bp.renesas.com> <20220728122312.189766-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220728122312.189766-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Aug 2022 13:27:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWj5mZVgyN+aDufmoGBowPFVNAja7dvzqgfq2W+PxO6Ow@mail.gmail.com>
Message-ID: <CAMuHMdWj5mZVgyN+aDufmoGBowPFVNAja7dvzqgfq2W+PxO6Ow@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a07g044: Add DMA support to RSPI
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
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
