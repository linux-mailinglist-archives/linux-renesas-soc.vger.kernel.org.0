Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31AD3513458
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 15:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235229AbiD1NGC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 09:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbiD1NGB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 09:06:01 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AFE084EC9;
        Thu, 28 Apr 2022 06:02:47 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id iy15so3123298qvb.9;
        Thu, 28 Apr 2022 06:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/J/ztFqw6rxJqnmHVF/ZwtY3h3Lcp0TFNfDDpgAddGc=;
        b=1s21dmksADmnxDV6e9KQSKKzevhZCOMYgEuFy4934GpHhM2sK8iGUQpeBDyVOtAmfq
         TCGg/L5dU9zPKOIuMYrd71Z6ZKPshLutsd9taZSk9NtbM/VvjH/TrJKt2oMJuKP6fELE
         M36LJQT5NiBN0bYlsczR7y7A+SviUm/pozA8e4aCzCHhHyVQNgQaVZvrAyrDqnkH4uE0
         JOgyxgjGEgkcSeObFfKjqZUIuoX8cTYpVkx0YMJMfTgyTQrCdiPpQo1EbPvkj+GznVvn
         RUpsiFQq/OA7DXZ6QLHJYZylvV9bOb6XJQrLPFBMuOHdgUM4najVBoVYLTfVkGEwWLoi
         Y1gg==
X-Gm-Message-State: AOAM5332fEqBK4iSCPhwnRvFEEcH9fA88CaHFiDVm/xkWoGWKYyRInzd
        0GOQzkY4GJqtEf7235FHlFMJOd0SDlkAEQ==
X-Google-Smtp-Source: ABdhPJxG0hr/vsKppakLXgO1dpuTpNSBh2jYT1hudchep1t80HW49lguh3rLFzUAwM487vi6/uU5lQ==
X-Received: by 2002:a05:6214:2587:b0:456:4d6e:a3ba with SMTP id fq7-20020a056214258700b004564d6ea3bamr7754847qvb.21.1651150966104;
        Thu, 28 Apr 2022 06:02:46 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id y13-20020a05622a164d00b002f1ff52c518sm11638623qtj.28.2022.04.28.06.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 06:02:45 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id r189so8890227ybr.6;
        Thu, 28 Apr 2022 06:02:45 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr32004719yba.546.1651150965082; Thu, 28
 Apr 2022 06:02:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com> <20220425170530.200921-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425170530.200921-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 15:02:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWszrAP6=seLUsGyy7NzGK93PGw5717+uuigfNJN_b1QA@mail.gmail.com>
Message-ID: <CAMuHMdWszrAP6=seLUsGyy7NzGK93PGw5717+uuigfNJN_b1QA@mail.gmail.com>
Subject: Re: [PATCH 04/13] arm64: dts: renesas: r9a07g043: Fillup the CANFD
 stub node
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
> Fillup the CANFD stub node in RZ/G2UL (R9A07G043) SoC DTSI.
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
