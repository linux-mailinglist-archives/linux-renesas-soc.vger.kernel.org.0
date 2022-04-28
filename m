Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA5D51345D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 15:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346679AbiD1NGk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 09:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346629AbiD1NGj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 09:06:39 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D64472E3D;
        Thu, 28 Apr 2022 06:03:25 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id 126so2523565qkm.4;
        Thu, 28 Apr 2022 06:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+zAUypN/li1YMg20r6d1qFw6uS21RG8BlHvQ5Zqj1MY=;
        b=qkEn6S8nJpu0lJ8mXw1YzNojR8PeUBNll6GvbEoMuh89m8jes5UJ/KhyZUagtRWYQQ
         TLfhdaeR5eUp5Bd9MkP4l3/kjTD1FL8O+QtLB1rMhnYwL+ah4YPHSOmggDSYD4iVg+sx
         9WEYLg56EopPlZmHTUubrsYEnpG3fBfauGsnhLIyKonSmgR9EzV7TC7EwJEF5P9klWH3
         wAgq8l7l2pxMy+zrLpON7nJc+SI+LJnpiTO2tPpwMK/n4h5iMAQlZoJhQnlo0jdC3VBW
         I8XRRiu5IpXY8o/RzNP6/m7LRpjYRO0ajZDM2pYTd1ORAR6xemAQrigFWq15lTmFaCfx
         ZJUQ==
X-Gm-Message-State: AOAM533OPrM9fdi2MmLwRHAKXVQTWXv/fHtVvvmvQspEPAnHKzgb1PqD
        nqNe+obxmGjhvWSqcGZ3yyQ1QGEowNJBKw==
X-Google-Smtp-Source: ABdhPJzmRe4gtf/3IuDfMWK6et2HbKxLcX0BXzT+y3Ji8VuGqSiYxStaUnIiArFIkL8l1/IpA+s0iw==
X-Received: by 2002:a05:620a:4588:b0:69f:1c7d:9793 with SMTP id bp8-20020a05620a458800b0069f1c7d9793mr17681955qkb.630.1651151004286;
        Thu, 28 Apr 2022 06:03:24 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 6-20020a05620a078600b0069e998ff51csm9467586qka.71.2022.04.28.06.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 06:03:24 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id j2so8971510ybu.0;
        Thu, 28 Apr 2022 06:03:23 -0700 (PDT)
X-Received: by 2002:a5b:24e:0:b0:63d:cba0:3d55 with SMTP id
 g14-20020a5b024e000000b0063dcba03d55mr29893729ybp.613.1651151002948; Thu, 28
 Apr 2022 06:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com> <20220425170530.200921-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425170530.200921-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 15:03:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQ0bUJL-+agC942Rr_WcVQVbptDP3KNqpYEJcki13tjQ@mail.gmail.com>
Message-ID: <CAMuHMdWQ0bUJL-+agC942Rr_WcVQVbptDP3KNqpYEJcki13tjQ@mail.gmail.com>
Subject: Re: [PATCH 05/13] arm64: dts: renesas: r9a07g043: Fillup the
 OSTM{0,1,2} stub nodes
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 25, 2022 at 7:05 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fillup the OSTM{0,1,2} stub nodes in RZ/G2UL (R9A07G043) SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
