Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20F3E5099E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 09:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381920AbiDUHu0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 03:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386199AbiDUHuS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 03:50:18 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B981CFFC;
        Thu, 21 Apr 2022 00:47:19 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id i14so3093843qvk.13;
        Thu, 21 Apr 2022 00:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OV/7tcnzdy27pvul6KQIYfS/Jl6IACQLBr7xNZ1dFlg=;
        b=hCAcw03Qnf3nQ9Z7gfoxeOs1GlalfHxwfnbjdt4qcLb9cnEADzLFpb9WU+5NlA8xW7
         F0oIURUtT0CrWfvEAqBWgsaRGcTivls0NXhl5yZx+BwwGVXnKnzSknbfaM5OWrVbQP7G
         /vd2wVYxmLxHuF8vGOekqmXeIsYoCd4AR6xJcBD83xnDCrAqYgzIBu/5z3LyYdgo7cXD
         3Rc7wwir6NeCz5jwzOlRemiMgZvvTp1s8+flNuIdps+Tzsd/6RxIMVtReGMA3xqcl3zc
         b4Peu4gVPG5ZM35Cuh8FTNfCaLBxsiaXyZK3XD+QP8GoqDOFj+yxBzmSCEq2UqR+nMku
         YnjQ==
X-Gm-Message-State: AOAM532IMyQ4VlB7btDduPqYRVU6r3k3G/h6y8STaHHCQOc+L5eBlcqf
        T2wSYGHVHsMdFvinYxXJVyFVS3kf3bNTLJaE
X-Google-Smtp-Source: ABdhPJwTWkKWxVU0BLHEbKt/fEpDfdjXaJtiFuGsmFSmw1uEhuGkplgIrIFGfAr8mRwJlo6Ba+WUAw==
X-Received: by 2002:a05:6214:2301:b0:435:38af:2f87 with SMTP id gc1-20020a056214230100b0043538af2f87mr18226367qvb.83.1650527238431;
        Thu, 21 Apr 2022 00:47:18 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id e13-20020ac85dcd000000b002eb9458498esm3181923qtx.95.2022.04.21.00.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 00:47:18 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id w133so4576493ybe.5;
        Thu, 21 Apr 2022 00:47:18 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr3412717yba.546.1650527237818; Thu, 21
 Apr 2022 00:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220318175113.8956-1-biju.das.jz@bp.renesas.com> <20220318175113.8956-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220318175113.8956-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 09:47:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCos4aDTXBQeKNW4BvM=rXTGO-PZe9EHhaafT+sY30VQ@mail.gmail.com>
Message-ID: <CAMuHMdUCos4aDTXBQeKNW4BvM=rXTGO-PZe9EHhaafT+sY30VQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] clk: renesas: rzg2l: Add PLL5_4 clk mux support
To:     Biju Das <biju.das.jz@bp.renesas.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Mar 18, 2022 at 6:51 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add PLL5_4 clk mux support to select clock from clock
> sources FOUTPOSTDIV and FOUT1PH0.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> RFC->V1:
>  * Removed LUT.

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -71,6 +71,7 @@ struct rzg2l_pll5_param {
>         u8 pl5_intin;
>         u8 pl5_postdiv1;
>         u8 pl5_postdiv2;
> +       u8 clksrc;
>  };

I understand you cannot use the plain DEF_MUX() here, as "clksrc"
is set up in pll5_params in the DSI divider (patch 3), and you rely
on parent propagation again to program the mux according to that?

I think it would help to document that somewhere.

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
