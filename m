Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A10455F76
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 16:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbhKRP34 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 10:29:56 -0500
Received: from mail-vk1-f180.google.com ([209.85.221.180]:39811 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbhKRP3z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 10:29:55 -0500
Received: by mail-vk1-f180.google.com with SMTP id 84so4018596vkc.6;
        Thu, 18 Nov 2021 07:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rpf+jBA73wQ5AnrwKIBDgmvojDtchVLXsS52l+jmeig=;
        b=mMmQG420T1VVKo4YqgGaoi/gS95CRA0HCtU7zLIySuqtPiPQV23vUzt1RVAIJHuxYA
         7Q2HRjYi95afbddlvGECgL8Kra45bTM2dmLTySaYPoOBmuVH1vzLATiHrE3oMSktWADO
         h1ZAQQN4aX37Vqnn+SBHFUHvNlegFZEdHM/CjtHSK37Xo8/+40BZa4yJK+RZGWAKBfPI
         aD4aAFiANuwXYiMWVvT012eqS610vi8yOpISKcz+lhWA7aI09XbL4wcqOjqlh1qJ78Mg
         qygFjnKWjzYMxRtAy+AVtOnIWf+uslapFKsntDl6FFSYGQSZQt4gWcvh0SawtP2IGPu9
         hWiw==
X-Gm-Message-State: AOAM531pVdYlr6UTpeksFQLF59HQnCxtIm6DyiapDz+Z2Y15gwgVKp1M
        gLuBgNpulBs/ZSBAuYYnD60u0PMC/7mDew==
X-Google-Smtp-Source: ABdhPJzNkQ1WBzlzYIpeorg/knKbxJzFOWUXQHsKhP0NXoQtEaPz9CU5+fnTnOyCQ2/c21/czmRFyg==
X-Received: by 2002:a05:6122:1782:: with SMTP id o2mr106452506vkf.3.1637249214892;
        Thu, 18 Nov 2021 07:26:54 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 15sm39440vkj.49.2021.11.18.07.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 07:26:54 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id y5so14444371ual.7;
        Thu, 18 Nov 2021 07:26:54 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr37804107uai.89.1637249214228;
 Thu, 18 Nov 2021 07:26:54 -0800 (PST)
MIME-Version: 1.0
References: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211117115101.28281-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVGiXJiKXM-LhQUMVMYNC4j5jTSe+mHL8vGvhBBL7SsrA@mail.gmail.com>
In-Reply-To: <CAMuHMdVGiXJiKXM-LhQUMVMYNC4j5jTSe+mHL8vGvhBBL7SsrA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 16:26:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWXF3wJ7xZvAgDPm=gZh7SsvfETWDnhdYU0c85BpnwSw@mail.gmail.com>
Message-ID: <CAMuHMdVWXF3wJ7xZvAgDPm=gZh7SsvfETWDnhdYU0c85BpnwSw@mail.gmail.com>
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

On Thu, Nov 18, 2021 at 4:26 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Nov 17, 2021 at 12:51 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > of_genpd_add_provider_simple() might fail, this patch makes sure we check
> > the return value of of_genpd_add_provider_simple() by propagating the
> > return value to the caller of rzg2l_cpg_add_clk_domain().
> >
> > Fixes: ef3c613ccd68a ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

i.e. will queue in renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
