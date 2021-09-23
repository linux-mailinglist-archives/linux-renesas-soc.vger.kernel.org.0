Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53432415AA4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 11:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240028AbhIWJOk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 05:14:40 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:47099 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239801AbhIWJOj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 05:14:39 -0400
Received: by mail-ua1-f47.google.com with SMTP id 109so3769364uag.13;
        Thu, 23 Sep 2021 02:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wpjIy0HdF7CHRJIcx9urIAF0b1h12wjunf3TIpTAizY=;
        b=qdN7IaO7cDFwPp3s8Fe9NbLOy+H76FNmbmc5aoXEYWkjBdeqvhNM2ZHvPO6pF2ZSgd
         SNpcVW9S3Nr1BFdwlQAOKOUoxbpXfwybdU5PUPizIHSkPVwBBbFgcEYlvelK6+mtf/vP
         hP4HPBmCfpAbR+usrDT2GyYbO5XYObH5VKZlv6aKtrDwTaVL1zyqit1RVhFEbYzQwWAA
         bnIte7Oghh4bFWgWzLqS4IF7dgVEHhLbdPV1GDH1KkKPSNYYqNuaBs4LuEoRDGXV8GCd
         sW0zFpZmtLRShHd774dNkvPypGGpAf94QenZ7YtOaXXV/N51CVi+ib/qqW+D1+rAwjXX
         vpqw==
X-Gm-Message-State: AOAM532uz6RG4Pf7Puf0XP0BSac3shUlpQNiMsermu//xDmKw1Tbrk8z
        G7Jk2lR3xhh8+nNj5koGLkFXe/swaC5FeEQ9J8A=
X-Google-Smtp-Source: ABdhPJyYrq2Jf8yZoJZiv8ofIuwPQ33TPHYg3C7v2mm9d/dru19huLThHuLgpLPK5NupmpOH5nfbqkNsbFbAcRT1nGM=
X-Received: by 2002:ab0:538a:: with SMTP id k10mr3366674uaa.14.1632388388237;
 Thu, 23 Sep 2021 02:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210922112405.26413-1-biju.das.jz@bp.renesas.com> <20210922112405.26413-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210922112405.26413-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 11:12:57 +0200
Message-ID: <CAMuHMdUb95EO2Fpsw74uQVXRFqcXWwz78TpypPJf1hnUd3Rssg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: rzg2l: Fix clk status function
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Sep 22, 2021 at 1:36 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As per RZ/G2L HW(Rev.0.50) manual, clock monitor register value
> 0 means clock is not supplied and 1 means clock is supplied.
> This patch fixes the issue by removing the inverted logic.
>
> Fixing the above, triggered following 2 issues
>
> 1) GIC interrupts don't work if we disable IA55_CLK and DMAC_ACLK.
>    Fixed this issue by adding these clocks as critical clocks.
>
> 2) DMA is not working, since the DMA driver is not turning on DMAC_PCLK.
>    So will provide a fix in the DMA driver to turn on DMA_PCLK.
>
> Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue as a fix in renesas-clk-for-v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
