Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4557E51344C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 14:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346741AbiD1NCH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 09:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbiD1NCG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 09:02:06 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C92FC67D27;
        Thu, 28 Apr 2022 05:58:51 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id i2so3458965qke.12;
        Thu, 28 Apr 2022 05:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ku1IfEFWnvHYXb8rCuyicxTAlRqM8XdOezxep6lVK3A=;
        b=JdbH4mPhOlvpA6SJjMA8+B5b+Qzmu+Z9lsrfxHxvolmxjFIjfvfx6httl1MEfELlRV
         TM+fcZeKFCEAmclJCqDAxQxma7NmDy4Blo4A0ykpL2xabHI8s0XrPWjtCtOmTmqMhoaF
         jq1MI/0HtfrLfsjzYROVGZ4yCPzXogdqdNKlAOljzCq8CvG2vCJVBLnUrjAAEdfJ+ER8
         E5kFfoMRUU5/SlOdLWY8dq4gJTAg3nUMuO8/EvyP7S3ZHUUf6WBCARzSQHABjNKVDw7F
         aqmTRmzNnU9szQz6SvZhw4OwrT51v9Js6PnHYl6v204uByKRsFWrp2kwpbAqYSlUYy74
         6tuA==
X-Gm-Message-State: AOAM533ZX60rt3tueA7IN8jZiDyTQi7fJfST5Hox3nb9fmwmr4/P9kvI
        rg0kzgqycnATsdTCn20mD+yhpf7NQpo0zQ==
X-Google-Smtp-Source: ABdhPJz96GY+1DFXR/SghpHhcy9dqLEEcPnkxNtvtK+BCytFWsqNRv0x6PbqUy+VxDIYvqxQEcvf+A==
X-Received: by 2002:a05:620a:29d2:b0:69f:6042:1532 with SMTP id s18-20020a05620a29d200b0069f60421532mr11714005qkp.614.1651150730789;
        Thu, 28 Apr 2022 05:58:50 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id t19-20020ac85893000000b002e1afa26591sm13227656qta.52.2022.04.28.05.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 05:58:49 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id i38so8802167ybj.13;
        Thu, 28 Apr 2022 05:58:49 -0700 (PDT)
X-Received: by 2002:a25:d393:0:b0:648:4871:3b91 with SMTP id
 e141-20020a25d393000000b0064848713b91mr21623649ybf.506.1651150728842; Thu, 28
 Apr 2022 05:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com> <20220425170530.200921-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425170530.200921-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 14:58:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnFzv-+U4aRroMmxiNCff8ajZopRfjUuZEafoSETXrvw@mail.gmail.com>
Message-ID: <CAMuHMdXnFzv-+U4aRroMmxiNCff8ajZopRfjUuZEafoSETXrvw@mail.gmail.com>
Subject: Re: [PATCH 01/13] arm64: dts: renesas: r9a07g043: Add I2C2 node and
 fillup the I2C{0,1,3} stub nodes
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
> Add I2C2 node and fillup the I2C{0,1,3} stub nodes in RZ/G2UL
> (R9A07G043) SoC DTSI.
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
