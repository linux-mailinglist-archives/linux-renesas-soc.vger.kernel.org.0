Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15A6952D467
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 May 2022 15:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiESNoQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 May 2022 09:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbiESNmK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 May 2022 09:42:10 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EA222534;
        Thu, 19 May 2022 06:42:07 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id g3so4792751qtb.7;
        Thu, 19 May 2022 06:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=El+m1CxX/rNHNaXQ8cQdCXt5KnbDuSU+6SgAu6jPXuA=;
        b=kW5Zc8x04gse8G6pcLwqj5/iaQ61SCAz3N+gdlzsY6XSIg/Ihb6Zgsz1YgwweyGhVr
         xw9/yyf5yYwuAHp895GdSY46qWifgcNH10PW6BRIifKY0Be/rzpVobmMenBuwLnVX6RB
         pyS+o7CPs1+l3nCek0tpb6hqeJBhUx/O3y+zr6Q9pvrIVyUaAo7wjohhxWjs9LBjNN9Y
         fIiOF8pQkJL2MahWf3mw7NfaVPzqargYtD2Q3uvTgDHNFJNbqvCWr5UUsx4nYdzeLXtB
         HO13hhjiI1znPWimugsabKhUHbpIlwdJqQm1UHeR5As5QzMrrfBBedwAIWuQmLvEpKiy
         0DMg==
X-Gm-Message-State: AOAM533j1ce2yhwHp5QaHFCFJpzsWtTr5dRQNjZ+uwVG+esuNsdFvX/j
        vqegpWUFyYam5I27GuY0r6W9JBV9F6dy4w==
X-Google-Smtp-Source: ABdhPJznJAE1JnVxsuFuP4E7pNAt1L0NHFn/hxkYqJivXsKQ4rUnccGtuVKC4JqO9T46rCB3tavJTQ==
X-Received: by 2002:ac8:5c91:0:b0:2f3:bd33:f412 with SMTP id r17-20020ac85c91000000b002f3bd33f412mr3811913qta.15.1652967726346;
        Thu, 19 May 2022 06:42:06 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id bz23-20020a05622a1e9700b002f39b99f6bbsm490593qtb.85.2022.05.19.06.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 06:42:04 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-2f863469afbso57794307b3.0;
        Thu, 19 May 2022 06:42:04 -0700 (PDT)
X-Received: by 2002:a81:6588:0:b0:2f8:b75e:1e1a with SMTP id
 z130-20020a816588000000b002f8b75e1e1amr4923917ywb.358.1652967724157; Thu, 19
 May 2022 06:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <8e48edc5e7b65f8dfd8b76c583e0265b9b97e62b.1652099944.git.geert+renesas@glider.be>
 <20220517010408.GA3690472-robh@kernel.org> <CAMuHMdWnvYx93Xo4XHRi3vv8c1OCvX7zqGswHApRnc7VYM+X4g@mail.gmail.com>
 <CAL_JsqJo-p+bh6VOKANq8pmMPbm1vZwmHt73yYaEhe9GfQ50dw@mail.gmail.com>
In-Reply-To: <CAL_JsqJo-p+bh6VOKANq8pmMPbm1vZwmHt73yYaEhe9GfQ50dw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 May 2022 15:41:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdCP3hsSABq5J4bxo-5hTRS4ZggQwQG99srkc6z_EHuw@mail.gmail.com>
Message-ID: <CAMuHMdVdCP3hsSABq5J4bxo-5hTRS4ZggQwQG99srkc6z_EHuw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: phy: renesas,rcar-gen2-usb-phy: Convert to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Rob,

On Tue, May 17, 2022 at 3:57 PM Rob Herring <robh@kernel.org> wrote:
> On Tue, May 17, 2022 at 1:59 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, May 17, 2022 at 3:04 AM Rob Herring <robh@kernel.org> wrote:
> > > I guess board level components don't count and some might be pending.
> >
> > Some have been pending (or blocked) for a long time...
>
> Can you tell me which ones and I can apply them. If they have my tag
> already, then I tend to ignore them.

I think you can safely take the following:
https://lore.kernel.org/r/0c5f06c9d262c1720b40d068b6eefe58ca406601.1638539806.git.geert+renesas@glider.be

I have also sent a v3 of the sil,sii9022 conversion.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
