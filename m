Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD82351438C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 09:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355282AbiD2H7E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 03:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355338AbiD2H65 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 03:58:57 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D103A190;
        Fri, 29 Apr 2022 00:55:38 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id hf18so5202665qtb.0;
        Fri, 29 Apr 2022 00:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lA8dt8K4XESePaOrApGUsDJ4BrwKRBZs1Hg5uv5lGNc=;
        b=umt0hXwzeprIrTWC+pqZy6BI/bzeLoUdKnpkDyJae9uBHq34c7v+ti6Uw/0rzIb+0X
         Hw2q/mNvprZSXqZWa73O6MfeODBC/lVaRjkBiSW+9mCHlZ215c+wyV1ik3zheHJXKPlc
         igiush50Y6XkwHz//+CHQGSGgk09hfEbhKRP5H1NDV4gx4znCwNM3CmapFcQm0ThJ5Vl
         TQ0V2zXaof1t77mZwlodFtaxVW3etmIEH0f5Ftr5f7VHhOeGjSBJlpntaT8VjQisxE8M
         pwNz9ZUTrDjTHblwOIPnF5ajXricE2HLZFlvBA/G54ZFvvy+1XdDLUwd2CdJOSw+deJg
         f55g==
X-Gm-Message-State: AOAM533BXCvhEaWwc+JausWxPaamdaQYin98CuTNaE9wQFvw8ksVTNbo
        q10SBTfUQkvc7kwS7DIEUhAB0/Vne3cYX+Lq
X-Google-Smtp-Source: ABdhPJzPfwKTO0ralOlUxwS9TArqooEJ/p2aXbzkBNGUWv8APkL34C/yYC/8MF0wyNrNyC/vGjZoKg==
X-Received: by 2002:a05:622a:1a81:b0:2f3:647c:6f14 with SMTP id s1-20020a05622a1a8100b002f3647c6f14mr18965985qtc.269.1651218937757;
        Fri, 29 Apr 2022 00:55:37 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 21-20020a370915000000b0069f93242808sm1097743qkj.62.2022.04.29.00.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 00:55:36 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2ec42eae76bso77040847b3.10;
        Fri, 29 Apr 2022 00:55:36 -0700 (PDT)
X-Received: by 2002:a81:1cd5:0:b0:2f4:c3fc:2174 with SMTP id
 c204-20020a811cd5000000b002f4c3fc2174mr37421699ywc.512.1651218936331; Fri, 29
 Apr 2022 00:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220429072400.23729-1-biju.das.jz@bp.renesas.com> <20220429072400.23729-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220429072400.23729-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Apr 2022 09:55:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTCGXe05g+Ea9F6KD0MMO_Yb+OVOWS6ZuoVDm+PcUDNg@mail.gmail.com>
Message-ID: <CAMuHMdUTCGXe05g+Ea9F6KD0MMO_Yb+OVOWS6ZuoVDm+PcUDNg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: renesas: rzg2ul-smarc: Enable Audio
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 29, 2022 at 9:24 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable Audio on RZ/G2UL SMARC EVK by adding ssi1 pincontrol entries
> to the soc-pinctrl dtsi and ssi1 and cpu sound_dai nodes to the board
> dtsi.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:
>  * Fixed typo in commit description RZ/G2LC->RZ/G2UL
>  * Removed the guard for cpu_dai node.
> v1->v2:
>  * started using cpu_dai node instead of snd_rzg2l in board dtsi.
>  * Added rb tag from Geert.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
