Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA974DD9EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 13:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236402AbiCRMsY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 08:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiCRMsX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 08:48:23 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DEE2E415F;
        Fri, 18 Mar 2022 05:47:04 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id 85so6617965qkm.9;
        Fri, 18 Mar 2022 05:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5B3KQWrldWxXQq7bWnFH8zmvuqf+yb5fkUCi5k4X7kk=;
        b=EbsYVWg+7fQBzoLYEs1MejsblCNDd7QXdXQMiBRJ6O/UwEZw4KMI8icnl6qoiUGUnv
         FqzGVgVrW/vbuIT3NDxpBJQrw/s/lFFXRMdsiZ+Rp5sVwB3NZSweZGDdNeIcKrit/9vF
         guza29N3s0nFyHGmybhdiG9TZPSvBV9Oqh12xBioHKho1loplYkEjMJx0ht8g0R/Rp82
         qggUujqcePq/jt+q3UE22UK2rrx9jDC3dJguaSvtth/bpZ4nXywcrIjNYjSWtXbSh9pu
         4rw0atoa8x6z78LpGzQYR0YOw9+muAMHVaLyLn/DhMvLbj9lPLJbP+Uj+cCyUoBts+Bm
         pkvA==
X-Gm-Message-State: AOAM532vFZDjdDICplKJpDx27qxhhBA4OZtne7mIiVtnfMR3U5Q/hkge
        eyYnbqOnJ30nLrkamDPq2p1udK4b/o1J77wa
X-Google-Smtp-Source: ABdhPJz95MM2bxG7MIAxcfgMlQHZnHppAO4eWfhI24D1SFEQxbqPF0GR11Mp1bZuGYZiP68yaejyrQ==
X-Received: by 2002:a37:e214:0:b0:637:f295:cde8 with SMTP id g20-20020a37e214000000b00637f295cde8mr5362362qki.753.1647607623648;
        Fri, 18 Mar 2022 05:47:03 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id k10-20020a05622a03ca00b002e0684cf81fsm5466813qtx.73.2022.03.18.05.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 05:47:03 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id m67so15652357ybm.4;
        Fri, 18 Mar 2022 05:47:03 -0700 (PDT)
X-Received: by 2002:a25:dc4:0:b0:629:2337:f9ea with SMTP id
 187-20020a250dc4000000b006292337f9eamr9998539ybn.6.1647607622806; Fri, 18 Mar
 2022 05:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220304143241.8523-1-phil.edworthy@renesas.com>
In-Reply-To: <20220304143241.8523-1-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Mar 2022 13:46:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW6m9vWCGmU-C+Z0ky6-kwG0MZjjP+JYDERk_KBBh5m1g@mail.gmail.com>
Message-ID: <CAMuHMdW6m9vWCGmU-C+Z0ky6-kwG0MZjjP+JYDERk_KBBh5m1g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Remove unused notifiers
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
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

On Fri, Mar 4, 2022 at 3:32 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> notifiers is not used.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
