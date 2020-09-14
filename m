Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4FE1268B46
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Sep 2020 14:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgINMlf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Sep 2020 08:41:35 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:45291 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgINMlD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 08:41:03 -0400
Received: by mail-yb1-f196.google.com with SMTP id p81so11681225ybc.12;
        Mon, 14 Sep 2020 05:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pADP6qzUrYMCYvH+CFX4SosBM+qgginkcbgh+0+Vh8g=;
        b=c/hGNLMrpQ+A40x0ZjivCwqgLxCXQuqGqUeM0NTV5AtN+U7k6U7ZohYrSE+J+uYLxQ
         s/VhX1mr+dWJkYF7qmTqDNQjHuC7bx216qQ0UomTGDkxA3FeeX+UkninJSJmu1K8pHbU
         yCbbVeMZ5EQ/96gTV5oJIvx1LJUNFyvsBsfmvk1RsJMgddFq+Kv11xLtcJx2DLDt17ZT
         rIUxY3uvvB5seOLx5pX1oJNogz7y90bOxQHvrDBRAUt9i2DEOoGXYemGbLqy+PrqAgW1
         GfGCE5gNuG+sBzX912jrfxk8rsj6Uk289Y6XQgGbgQhnp05tCNXiTHILZv5/Cc7Y6evx
         8+tQ==
X-Gm-Message-State: AOAM530ib5E0aqToGlBWVGEAI7qn618Q/0fSRGM2n0Gmj13M8yx+2hl6
        KBaEoGb3Qg5LKxSJDDlp65tdMwC7/55wv26KdITGUmGvjxQ=
X-Google-Smtp-Source: ABdhPJw0rS0SECxSrJqxyMZRelj1qSCZeHdheuNXeS8R7ywmxQAb0yM5b9d02qUFIk2ygT1exPjrqXF2qIaoEUmDriM=
X-Received: by 2002:a9d:5a92:: with SMTP id w18mr8913041oth.145.1600085338477;
 Mon, 14 Sep 2020 05:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200911101703.20521-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200911101703.20521-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Sep 2020 14:08:47 +0200
Message-ID: <CAMuHMdWk+uenHO=4VFQSYdJRew5EWxGfNtamO_OTcdL0g+QZ4Q@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Kconfig: Update description for
 CLK_RCAR_GEN3_CPG config
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 12:17 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> rcar-gen3-cpg driver is also used on Renesas RZ/G2 SoC's, update the same
> to reflect the description for CLK_RCAR_GEN3_CPG config.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas for v5.10, as:

    clk: renesas: rcar-gen3: Update description for RZ/G2

    The rcar-gen3-cpg driver is also used on Renesas RZ/G2 SoC's, update the
    description for the CLK_RCAR_GEN3_CPG config symbol to reflect this.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
