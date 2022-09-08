Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E94BE5B1576
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Sep 2022 09:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbiIHHOk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Sep 2022 03:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiIHHOi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Sep 2022 03:14:38 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1438167DF;
        Thu,  8 Sep 2022 00:14:35 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id b2so12211738qkh.12;
        Thu, 08 Sep 2022 00:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jg+AOV6SUgg5gcVqEx/sV2z5LMPmoCijPvtKxnVotmY=;
        b=2LGcW2ZXZydqe+3CtUG460kn4JbI7f4a1frnIgFd0P1UQOkxAV6Re9PodUuHfAOka4
         /1aKUfYzhtEqtyiay0/AENfBnlNMp+xBTyhnvtGpp2q9NdFZdDu26bXdVxoErSOBUdBX
         wFBCjPpZlFDAJu3KxXX42nWxn0/0k49E1uhQ1kj3wO7aV1nrOmkc3YdFPyyPxL0BW2qQ
         /NY1em4Rr3lPOIxXbF/mfyDSB9uOsWkzQN7DR4LHuPLnCBQC2oWaxixeoICrqFFa09PG
         If1B9kt4s8LzTLjV6rTqMpQqoH2U8jJz6ks0FXb+d8bqZqaPQqDUa2sLiRmdR1brqEia
         JPwg==
X-Gm-Message-State: ACgBeo1Ujis8URhBQlc0+kpUC9nHhLC4XIuSlSsqpmmF2fvVLG2oojOu
        EWhnf3Z2aWiak1sg1vf6dam7hov09kuyLg==
X-Google-Smtp-Source: AA6agR6u9nhZOjkUpyjGezzriKUFeq0VrSXnT6Mu8UZKgt0GiiEgFSdfsUjkKsezWmAW0w1YSbjL3Q==
X-Received: by 2002:a05:620a:57b:b0:6bb:f708:589f with SMTP id p27-20020a05620a057b00b006bbf708589fmr5664594qkp.112.1662621274785;
        Thu, 08 Sep 2022 00:14:34 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id bq38-20020a05620a46a600b006b8f4ade2c9sm16464668qkb.19.2022.09.08.00.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 00:14:34 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 130so19470460ybz.9;
        Thu, 08 Sep 2022 00:14:34 -0700 (PDT)
X-Received: by 2002:a25:3851:0:b0:6ad:9cba:9708 with SMTP id
 f78-20020a253851000000b006ad9cba9708mr4254645yba.36.1662621274231; Thu, 08
 Sep 2022 00:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220902062752.56841-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220902062752.56841-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 8 Sep 2022 09:14:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqq6hp=VmPs1O83gJObMYd-aF0s3KKPkkGrh7NOy0X1w@mail.gmail.com>
Message-ID: <CAMuHMdVqq6hp=VmPs1O83gJObMYd-aF0s3KKPkkGrh7NOy0X1w@mail.gmail.com>
Subject: Re: [PATCH v5] ARM: dts: r9a06g032-rzn1d400-db: Enable CAN1
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
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

On Fri, Sep 2, 2022 at 8:28 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The CN10/CN11 on RZ/N1-EB board are headers to add jumpers to select which
> CAN interface to route to the real CAN connector J16.
>
> For a normal use case either we need to wire CAN1 or CAN2, but not both.
>
> This patch enables CAN1 and disables CAN2 by default assuming CN10/CN11
> is wired for CAN1.
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
