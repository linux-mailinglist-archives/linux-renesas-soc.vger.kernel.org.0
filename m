Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3CB3F4D64
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Aug 2021 17:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbhHWPXQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Aug 2021 11:23:16 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:43981 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbhHWPXQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Aug 2021 11:23:16 -0400
Received: by mail-vs1-f42.google.com with SMTP id j186so11352033vsc.10;
        Mon, 23 Aug 2021 08:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7uFAXUurHTb46tTpF++y6mutbYzFbHdiUYDLIEz0BKo=;
        b=Gwnu8LixVv2SfJfVNwFi2I8X1RuF3G4g7/k0fWV9Eh8PaUkvX6xCKyRIbSOgjsqhzk
         nBR7nkBPz+xY+60zqCfEdh46d1qgA1H6tkpipza+zhFLmg9otLxDAMyxZ+gc4/ldC5HH
         AZq+bA2eGmRJA622XWef9oHpwS3mlhK7hXAPGY8YZuKqM74XVaG8lpX51soQb+xDE3KS
         xZ7Nryt2rT/GmjVJklhFR/S/6TDgaDSfEyIAdayq6oB6BEV0+a+wJJkQ2iLDKBqVdBa4
         kP2Ir7PttggacUJSsOCl5JIHV1wY0gOPiikIlDOB4EdyoqlOJF29P2FOoLrQ/rF1Hdtl
         pBTQ==
X-Gm-Message-State: AOAM5327J+a+oWPLh4f3qnskMGR68hygVEETx1T/84IVV1QchyOYJu4s
        F2p+jLyxtey8hEu4SwYB7upapIMDHnj3YzmVHrU=
X-Google-Smtp-Source: ABdhPJwXolTmeGadVjsr109FX2r9DBKd2cwwpQ1tdHM9qVRhBs5Q6A11a6QCGdLqxpHgMBXCXediaxMoBb+uzRnlahI=
X-Received: by 2002:a67:ce90:: with SMTP id c16mr2746931vse.7.1629732152915;
 Mon, 23 Aug 2021 08:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210815103014.21208-1-biju.das.jz@bp.renesas.com> <20210815103014.21208-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210815103014.21208-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Aug 2021 17:22:21 +0200
Message-ID: <CAMuHMdV_GNfsh=7tsYG8bLd2fuEtqML5oBn2cD4Wq=0PZ4Xupg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: renesas: r9a07g044: Add ethernet clock sources
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 15, 2021 at 12:30 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Ethernet reference clock can be sourced from PLL5_FOUT3 or PLL6. Add
> support for ethernet source clock selection using SEL_PLL_6_2 mux.
>
> This patch also renames the PLL5_DIV2 core clock to PLL5_2_DIV12 to match
> with the register description as mentioned in RZ/G2L HW manual (Rev.0.50).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
