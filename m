Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A864A4DDA3C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 14:14:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236563AbiCRNPR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 09:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236475AbiCRNPQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 09:15:16 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5351019BFF7;
        Fri, 18 Mar 2022 06:13:54 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id f3so779247qvz.10;
        Fri, 18 Mar 2022 06:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YkHe3duurS7yiHSjO1csgv1MgHFMwCP/72wMhRqz7K4=;
        b=iiG3nrszYm2dIT9zg5SayCSixp3CemKgZNvB/a3/XWtaxlB7A6xLKj+zy44loQYZIe
         7O8e2aaUS80eG4Uj01pzeWB9IwEiIwag7nXyFqfR98+UJvoF56wGT48S+J0AKAZ+Svdg
         svKFMrJ1v9xYJJ4EWGdHg20BhyOZ4Dw5+EshzSAtnv6Biv+ONBy+XFzVyaY+GeFTybXF
         j6g75QOBh17WajZbrk6BVVEwoCWeJOOHwOZwqaW/f/EJxstr79/QH75xastK8/NgfaWk
         q1WDI92BtMc2pOjDaR1yIhwhmvxNnbNGsN/yphgtbgR91NQLWKQ/XXGutF7AAJetJ6LH
         3dAg==
X-Gm-Message-State: AOAM532Dl+UJcP+CWOdoiPI8bO8KCwRvTJlXlkqbv7urEDmf+ZRI3HQF
        zbpebvAxzL5bx2PtkTHPBPTdcYWF7S9Ii8uO
X-Google-Smtp-Source: ABdhPJx0aLbWXR8G+2wo4mPTsK2brNADc/4k+2QxZgnUR8MucS8byLbS87qnzEAv2LeAHahGByu1hg==
X-Received: by 2002:a0c:c404:0:b0:431:31c3:3d15 with SMTP id r4-20020a0cc404000000b0043131c33d15mr7047212qvi.116.1647609232998;
        Fri, 18 Mar 2022 06:13:52 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id o21-20020ac85a55000000b002e16389b501sm5467251qta.96.2022.03.18.06.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 06:13:52 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2d07ae0b1c4so90130237b3.11;
        Fri, 18 Mar 2022 06:13:52 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr10932534ywi.449.1647609232355; Fri, 18
 Mar 2022 06:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220303164155.7706-1-biju.das.jz@bp.renesas.com> <20220303164155.7706-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220303164155.7706-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Mar 2022 14:13:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-YxpRn1iwATL0g2p6b-fn1OQRY_8CU-y2amGcGc+bCg@mail.gmail.com>
Message-ID: <CAMuHMdX-YxpRn1iwATL0g2p6b-fn1OQRY_8CU-y2amGcGc+bCg@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] arm64: dts: renesas: rzg2l-smarc: Move out i2c3
 and Audio codec from common dtsi
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 3, 2022 at 5:42 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> On RZ/G2L SoM module, the Audio codec is connected to i2c3 bus whereas on
> RZ/G2LC, it is connected to i2c2 bus. So move out i2c3 and wm8978 nodes
> from common dtsi to soc specific dtsi.
>
> While at it add wm8978 node to RZ/G2LC SoC specific dtsi to fix the
> build error.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * No change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
