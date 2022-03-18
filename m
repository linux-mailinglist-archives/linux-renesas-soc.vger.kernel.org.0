Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A17D4DDA3D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 14:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236564AbiCRNPT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 09:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236565AbiCRNPS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 09:15:18 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5AE31AFEB1;
        Fri, 18 Mar 2022 06:13:59 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id q194so6684604qke.5;
        Fri, 18 Mar 2022 06:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RpCOLPma+0v0cS5BgkENsyylppRza+1VO+YPTl/88Go=;
        b=4UUtCq3Wjsz+exkixa0oqA9PWusnLeEgWzs3zEroT1ZYpQnnNgI+HRHJN439fAkxvH
         pOTqR0qOUEg8kuBgzrqZ1/ldcUprr84EJABimi2UmQ1FvTtT6L2FobYViRi6ewKSsgmN
         2mcVUeKv63eDP0xlSPN5Icr97QbqBIJmH/SRvzilhyD2JGi5sQ+Cawa4zb9RP8QqZIPN
         FAXtvXWlbhD4DTgW6sk1rqf0oofKYQc6UfxrRhCMQun2ZiN+xElvmwF5uhmFGhaNz1OA
         nFehiUmE8ZBtSzk0ubimYImiZRQ+IWRVONaQoDl0yESaCft+XmdwhR9h885Va7/oUZGR
         Ia0w==
X-Gm-Message-State: AOAM531CAI4E4GHJdGrWwyLUwjJFvLDZzguIEFZhSekB9oOdwyEj9OV6
        N7qa4efaOn4q9BkzIOhuQc7rFSpeqS7Z9m3w
X-Google-Smtp-Source: ABdhPJyvI//ptqt78c7bUhJAgMI4L9NGWPVJ/bT+xoBdgZjsqVIt4rDaWNHOjGV2aN/4J1oWCrGMKw==
X-Received: by 2002:a05:620a:1789:b0:67b:4ca1:5b35 with SMTP id ay9-20020a05620a178900b0067b4ca15b35mr5608106qkb.375.1647609238473;
        Fri, 18 Mar 2022 06:13:58 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id d82-20020a376855000000b0067dacb03b6esm3795574qkc.130.2022.03.18.06.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 06:13:58 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id u3so15777918ybh.5;
        Fri, 18 Mar 2022 06:13:58 -0700 (PDT)
X-Received: by 2002:a25:bc8f:0:b0:628:8649:5c4b with SMTP id
 e15-20020a25bc8f000000b0062886495c4bmr9788739ybk.207.1647609238070; Fri, 18
 Mar 2022 06:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220303164155.7706-1-biju.das.jz@bp.renesas.com> <20220303164155.7706-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220303164155.7706-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Mar 2022 14:13:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHp2ymo2iCYeTWxa5gFzfCz_ajewTtd7aBte_NNv1dFw@mail.gmail.com>
Message-ID: <CAMuHMdUHp2ymo2iCYeTWxa5gFzfCz_ajewTtd7aBte_NNv1dFw@mail.gmail.com>
Subject: Re: [PATCH V2 3/4] arm64: dts: renesas: rzg2lc-smarc: Enable i2c{0,1,2}
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

On Thu, Mar 3, 2022 at 5:42 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable i2c{0,1} on RZ/G2LC SMARC EVK by deleting respective
> entries from board dts and adding pincontrol entries to the
> soc-pinctrl dtsi. Also enable i2c2 by adding to soc dtsi.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
>  * No change

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
