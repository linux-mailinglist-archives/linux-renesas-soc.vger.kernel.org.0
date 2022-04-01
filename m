Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA5F4EEC5F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 13:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345510AbiDALZy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 07:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345047AbiDALZx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 07:25:53 -0400
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70E91959E2;
        Fri,  1 Apr 2022 04:24:01 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id kd21so1761324qvb.6;
        Fri, 01 Apr 2022 04:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VNvUftVCEKC0bpyKbjKycTe+r8kmy0rLW5024E4vA5g=;
        b=Lmtq4Hd3Y8yeatieUlsIonP2Yx0+u8L9lEPV4BFDtYNkXsVOoSNfOVmwpxo0tOYQlN
         x1fKC5sopWXuFlKWXcDxLOjRZnWB8ge9Cwil08KOmOpe3E7Ml+nNYHuvbcoKklE0ivJy
         kZiL7lBrrmwffE2632GwNX0EThtg6HWonJWRCjtbhhE75M9D9t9DkBC3/iq8mCOtf5Pl
         aec1N1RaMur7BpYwswLIC2lOfnh6ItGX/7ZO3HuNHiwuhRkpjC0YezoPHSfxKnDSOYrp
         hnA8TBdiFHgxqzoNuJIGXvkYnRZPaH8o5Iajw3kcZPEdaMqhHBIX5ZOXqvCcRP4ABx4a
         TNMA==
X-Gm-Message-State: AOAM531rnewdzN1qZrEkon2ScjulmVkBWXlqlMZZu1Or5K9OOrJeHI9P
        nzFlYNa5GoI5sBvRBrA4l8ccFZbEgF/y/g==
X-Google-Smtp-Source: ABdhPJyJJTOBiWvjVvpdqgRR0r8ZqufZNFHC0TIKxFJ5A2MBjT3ruQb/iS4AjyC4WON3AopyCkElBg==
X-Received: by 2002:a05:6214:e48:b0:441:7bd1:29b9 with SMTP id o8-20020a0562140e4800b004417bd129b9mr7582539qvc.98.1648812240387;
        Fri, 01 Apr 2022 04:24:00 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id u129-20020a376087000000b0067e401d7177sm1128855qkb.3.2022.04.01.04.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 04:23:59 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2e592e700acso29019797b3.5;
        Fri, 01 Apr 2022 04:23:59 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr9546650ywb.132.1648812239496; Fri, 01
 Apr 2022 04:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220315155919.23451-1-biju.das.jz@bp.renesas.com> <20220315155919.23451-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315155919.23451-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Apr 2022 13:23:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWj-mgoBm1nGaBjtoO4i4dbLkxOhz5DpywB7mUhgvRFUg@mail.gmail.com>
Message-ID: <CAMuHMdWj-mgoBm1nGaBjtoO4i4dbLkxOhz5DpywB7mUhgvRFUg@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: renesas: r9a07g043: Fillup the pinctrl
 stub node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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

On Tue, Mar 15, 2022 at 4:59 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fillup the pinctrl(GPIO) stub node in RZ/G2UL SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
