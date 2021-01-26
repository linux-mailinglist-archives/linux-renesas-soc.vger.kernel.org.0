Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DF03042F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 16:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391565AbhAZPuh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 10:50:37 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:36422 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391843AbhAZPuZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jan 2021 10:50:25 -0500
Received: by mail-oi1-f170.google.com with SMTP id d18so9594357oic.3;
        Tue, 26 Jan 2021 07:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jgEi7FwFsaNNCaOhqNYWzzMOntaDZT+FwTY7v2XrGtg=;
        b=CS95uyIm+RNLa0fkNXLAliUEtdffsjv5FJyYwdpl1U8DXV/6vsTVTymSl3ZZs6gCLH
         PPOdSf3oPZ8Ro/SLeY+oMzLCAlMlLDXTh2VRCEzC3VGqIlnyfOrlqLefpZAPZiknQFAu
         kuTQCwq9cvgC+XCUhzl3u6y7syrxKBgoQOuGt+gyNeKFVHliEqp1c2vT8jUYomobILCi
         mZm7EshF8R69ZigfS2Li5Zd5LWOEpMT4ZQmNUg0O+GM/l1C4bw6y5LZEyNUNLxiSPT7J
         9JGBbzOYm60e0OIC68Drfp7QwHvg2TNfLTNjMg/OAz7RA8633xSSQ58Qzzwr1Ppsyo8F
         RgxA==
X-Gm-Message-State: AOAM532bwsAPKQbW2DGkhdm9TFo6W8Ckx/7qXsTN4P+6eEYqcYJ0GOkw
        nYw6TldQHst8U8FfXoym2Hqnpn5HvrXoRq4BQaU=
X-Google-Smtp-Source: ABdhPJz6rZTc7tvHGT/n4NsRQLTEmdA+GC28JTm7C8iYFCkmNVDu+6kFnvCZhxc/8jOHNatyH/Gli4T/tzJFeUfpsA4=
X-Received: by 2002:aca:4d8d:: with SMTP id a135mr161425oib.153.1611676184114;
 Tue, 26 Jan 2021 07:49:44 -0800 (PST)
MIME-Version: 1.0
References: <20210126124540.3320214-1-lee.jones@linaro.org> <20210126124540.3320214-12-lee.jones@linaro.org>
In-Reply-To: <20210126124540.3320214-12-lee.jones@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Jan 2021 16:49:33 +0100
Message-ID: <CAMuHMdWtN+TbjVqch0nmKxfAVuqD0UV8Eq3a2sVBiYjFJqiT0g@mail.gmail.com>
Subject: Re: [PATCH 11/21] clk: renesas: renesas-cpg-mssr: Fix formatting
 issues for 'smstpcr_saved's documentation
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 26, 2021 at 1:45 PM Lee Jones <lee.jones@linaro.org> wrote:
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/clk/renesas/renesas-cpg-mssr.c:168: warning: Function parameter or member 'smstpcr_saved' not described in 'cpg_mssr_priv'
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
