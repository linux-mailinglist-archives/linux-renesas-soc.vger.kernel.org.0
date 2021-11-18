Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C62B3455F73
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 16:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhKRP3f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 10:29:35 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:34495 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbhKRP3f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 10:29:35 -0500
Received: by mail-ua1-f47.google.com with SMTP id n6so14532756uak.1;
        Thu, 18 Nov 2021 07:26:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y0++IgpQPzTMrILV7MHoCwq5qVbn09VlXu9JXzRi410=;
        b=4KFPzZ53j78m0wu1vpbD81fMn4u6TOZJubJiW0du2A07Mkw2cLr7oKvjZCOWte8AKy
         sshUFMVk1RlsiDDkEUU4v9BJFwDSJCvqJIHzFg49cmlhYydfht0y0As4cemUxewlsuYM
         19yRXplxya3f8T8Ynrxg2pPq/kQlcX5rVtT17qwF05k78p2g1KcZ1d3SmQoBw+PpiMeg
         dMzPZo7J1XObHRhFFrOfQeqH+O5k+fcCvdthwcyj0NlLCzWHriHZOhNqr4rsr7Xfpz+d
         xdts6kQkTjVpim0jDmLbvpzCVtMD6nt1Z5F/495V8PCU5fSnjFq9YoB5AI6lytNXiITG
         kS6Q==
X-Gm-Message-State: AOAM532DW2SLYle9OWazrQjTDCYjZam2wQRiJ2Xf7O6Dtlh3Crpj7t0L
        MxL/5vLwvLe5GM/CjDV3mEIY54BD8Yi2Qw==
X-Google-Smtp-Source: ABdhPJwyW99ns8+MrHnivWsit1ZtmcuKQIwfRlZ62fxDue/FfLSk/0cLJMsSGeE2cwvO0G4df1KFUA==
X-Received: by 2002:a05:6102:2389:: with SMTP id v9mr51876560vsr.34.1637249194592;
        Thu, 18 Nov 2021 07:26:34 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id p3sm87700vsr.3.2021.11.18.07.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 07:26:34 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id b17so14577330uas.0;
        Thu, 18 Nov 2021 07:26:34 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr82545873vsj.50.1637249193917;
 Thu, 18 Nov 2021 07:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211117115101.28281-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211117115101.28281-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 16:26:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGiXJiKXM-LhQUMVMYNC4j5jTSe+mHL8vGvhBBL7SsrA@mail.gmail.com>
Message-ID: <CAMuHMdVGiXJiKXM-LhQUMVMYNC4j5jTSe+mHL8vGvhBBL7SsrA@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: rzg2l: propagate return value of_genpd_add_provider_simple()
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 17, 2021 at 12:51 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> of_genpd_add_provider_simple() might fail, this patch makes sure we check
> the return value of of_genpd_add_provider_simple() by propagating the
> return value to the caller of rzg2l_cpg_add_clk_domain().
>
> Fixes: ef3c613ccd68a ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
