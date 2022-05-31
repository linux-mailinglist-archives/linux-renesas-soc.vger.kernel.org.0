Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3678C538C0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 May 2022 09:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243667AbiEaHiA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 May 2022 03:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbiEaHh7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 May 2022 03:37:59 -0400
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE0F32EDF;
        Tue, 31 May 2022 00:37:58 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id w17so12669561qtk.13;
        Tue, 31 May 2022 00:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iwh0/hJsXCZMAwfPj47spj3VTwHIqa3iXmIROin7Bn8=;
        b=XXx0Ey65ngEk4xU/qxhE2pLEi4LUheoqFyTm6UnX3VQm87LkwZPuX8f+LMzKhD/FRR
         q/D/hUbMXPsTfJH7lwo0lrE/DTU6DBVuKj7f95rsr0WjGuTy0oZM3EdH5Uja8k55ZgEN
         lsqdWeGOes1+sNFbcYo06Gx8rTzkLUCjK5sBiRL19kTHtEUKx5ne3Avkdd4xc/zvOq1E
         nlItAlYfunCESECLSNtwyNr4QKU57lFfFAb+bea+/Kme0aqx2VNTLUq5Eun0xwfm+uFw
         veGXERyZmJciLdrdojxLFXVAS2+INJsUYQMWJbFud6VVr5G5EGjpbtIYIUsLCKmKSDRt
         6IqA==
X-Gm-Message-State: AOAM53045rPlDxD6nkR/pYYj2DP2UiBYP3CCOgAJXd9eAOo/3KnMkCjV
        QDC1CFa4jm4g3Zec4tOuu8CB39YCHaYF0g==
X-Google-Smtp-Source: ABdhPJwjp2TUEP2C9ry9/63KDMEgknViHMsxqmzM9xi/WUbziFAxAySNP0i6H90hp4uCw3MOr8f7bw==
X-Received: by 2002:ac8:5e10:0:b0:304:bb1b:1a99 with SMTP id h16-20020ac85e10000000b00304bb1b1a99mr1319651qtx.34.1653982677390;
        Tue, 31 May 2022 00:37:57 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id f20-20020ac84714000000b002f39b99f66fsm8818786qtp.9.2022.05.31.00.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 00:37:57 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2ec42eae76bso130044927b3.10;
        Tue, 31 May 2022 00:37:57 -0700 (PDT)
X-Received: by 2002:a0d:f745:0:b0:2fe:e903:b0f8 with SMTP id
 h66-20020a0df745000000b002fee903b0f8mr64279848ywf.383.1653982676802; Tue, 31
 May 2022 00:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220531071657.104121-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220531071657.104121-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 31 May 2022 09:37:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhJfdoRKZ2cxhAEBU95uLLr0rRTbEzow7sqHy+V7UxrQ@mail.gmail.com>
Message-ID: <CAMuHMdXhJfdoRKZ2cxhAEBU95uLLr0rRTbEzow7sqHy+V7UxrQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Fix reset status function
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
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

Hi Biju,

On Tue, May 31, 2022 at 9:17 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per RZ/G2L HW(Rev.1.10) manual, reset monitor register value 0 means
> reset signal is not applied (deassert state) and 1 means reset signal
> is applied (assert state).
>
> reset_control_status() expects a positive value if the reset line is
> asserted. But rzg2l_cpg_status function returns zero for asserted
> state.
>
> This patch fixes the issue by adding double inverted logic, so that
> reset_control_status returns a positive value if the reset line is
> asserted.
>
> Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

This bug has been present since v5.14, and went unnoticed so far.
Is it OK for you to queue this in renesas-clk-for-v5.20, or do you see
a reason to fast-track this fix to v5.19?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
