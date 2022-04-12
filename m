Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 906B44FE4AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 17:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbiDLP0A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 11:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbiDLPZ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 11:25:59 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DF851B797;
        Tue, 12 Apr 2022 08:23:42 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id e10so12351775qka.6;
        Tue, 12 Apr 2022 08:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vAQqBbqDFRMdtmvtUQ5ccojDEwuH55pNl6H2SkNuZ+I=;
        b=FlJSHiOgb8xvW8pvjJ0+zWiLWlTj1rbX2KI9XhaGcAMaAEvb4RhEPLgqeGN/bmrfM0
         rF4JHLFOT/J1F/EmhHjSzJBxtYum4N/CY81kKxQvOXWbNu+jY+6zpzsBDNQImdmpfntE
         89GnAWCSxmll2XXev2s4xpSxNeSJ1QdsUsV97+FnpPc0XsDB2hOJ4saLkX5L8XPucUHh
         33sXxMDkGv17FWOpEt21bg3YrafoNhsRDUZSDfsSAHiHQVcTwQ07Mz8zditO2jraLsky
         SSvNbhpaORv0e83Hd6UMiFZzSrPegBsIf0g/DOsoVECxRWtaXkL/QZcnID7iQexRG0FC
         0kWg==
X-Gm-Message-State: AOAM531XpXUvazt5ZopzD0XCkltos1fpOCpjVTz2QHPeWV5U5NuvFbY7
        X1FTewY1qHhBN4HuYtWr+bpix3qMs25Lng==
X-Google-Smtp-Source: ABdhPJwJf0BOvjbArpGzMWyy4z4S6HapRKDRS9JRifseV0jJKs7BIgjah2+61/X1NLnCQggwfjNkfA==
X-Received: by 2002:ae9:eb01:0:b0:69c:10ca:ed6 with SMTP id b1-20020ae9eb01000000b0069c10ca0ed6mr3458714qkg.496.1649777021022;
        Tue, 12 Apr 2022 08:23:41 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id o10-20020ac85a4a000000b002ed143903a9sm7275214qta.45.2022.04.12.08.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 08:23:40 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id f17so2789852ybj.10;
        Tue, 12 Apr 2022 08:23:40 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr16423561ybq.393.1649777020266; Tue, 12
 Apr 2022 08:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220401175427.19078-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220401175427.19078-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 17:23:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFRaWEG3xcnuTGOFst9aADwCng6JRROJzoz+4sbzH6BA@mail.gmail.com>
Message-ID: <CAMuHMdUFRaWEG3xcnuTGOFst9aADwCng6JRROJzoz+4sbzH6BA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: Move gpios property of
 vccq_sdhi1 from common dtsi
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

On Fri, Apr 1, 2022 at 7:54 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> On RZ/G2{L,LC} SoM module, gpio for power selection is connected to
> P39_1 whereas on RZ/G2UL it is connected to P6_1. So move gpios property
> of vccq_sdhi1 regulator from common dtsi to soc specific dtsi.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
