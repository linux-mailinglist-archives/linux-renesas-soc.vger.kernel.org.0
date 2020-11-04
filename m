Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D44E2A6292
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Nov 2020 11:52:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728607AbgKDKwg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Nov 2020 05:52:36 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38405 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbgKDKwg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 05:52:36 -0500
Received: by mail-oi1-f196.google.com with SMTP id 9so21712712oir.5;
        Wed, 04 Nov 2020 02:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Tgxgz65t1p/f8iIMRXffOT0LvSZivNKheyZ9LDhkIc=;
        b=cbmlMwJ0Vp256O2KwLamG2DUJZOIdeGF5l4Kjk3ITDK+9H5qdqtxPEo0YlbKFaTtIn
         w1ac7agk8zpVIzjLjnYsgdr31pP9ecf+dgq0dk7SwOl8e/A1Vg3bjJc1zSEBLlZOOE7T
         TApX/5T8Ql3uwEwcbiu11yCCg1etISdbaGlszRETpM8wrSNI/2NIwkQo+4EeTHRkUe+7
         brBxApDeb9I8cSZpMpRr8y+0P4ILD2SE5pWx+kFsSuGiauEoE2HLELz6zJOZCFm/BC4e
         KsswlrXc2pk1EBsd7Ns2uJqSinTdcQlKRnqVqX41I+ronvC+YRR+p5/Dw3Vm7jbFPUV0
         yy5A==
X-Gm-Message-State: AOAM532vZHsqYy/A5FAvWQ1vne6OXICcgL4NQlViiKebm9kZJhGHKNm1
        041CfR+K0ZknbFTwLxlUjdOMjUa2Xfj6cepu/tA=
X-Google-Smtp-Source: ABdhPJyvMxieCAu21C5+PVfz2yWWX9ytXdUxoVF8evK3bsrE8Y92FJiB0HEOlFOhHtXntxTD7+2uR7Dx21t0iuJoSCQ=
X-Received: by 2002:aca:52c9:: with SMTP id g192mr2234724oib.54.1604487154307;
 Wed, 04 Nov 2020 02:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20201103162435.13689-1-krzk@kernel.org> <20201103162435.13689-7-krzk@kernel.org>
In-Reply-To: <20201103162435.13689-7-krzk@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Nov 2020 11:52:23 +0100
Message-ID: <CAMuHMdVx_oYFpe8G7iKcQ0FFwpPTTiWZLps3WsLSphqJ0pweyQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] clk: renesas: renesas-cpg-mssr: fix kerneldoc of cpg_mssr_priv
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 3, 2020 at 5:25 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> The struct cpg_mssr_priv missed proper formatting:
>
>     drivers/clk/renesas/renesas-cpg-mssr.c:142: warning:
>         cannot understand function prototype: 'struct cpg_mssr_priv '
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
