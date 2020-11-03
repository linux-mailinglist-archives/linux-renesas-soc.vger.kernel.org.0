Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94022A3E64
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Nov 2020 09:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgKCIOI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Nov 2020 03:14:08 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43418 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgKCIOH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 03:14:07 -0500
Received: by mail-oi1-f195.google.com with SMTP id t143so5992993oif.10;
        Tue, 03 Nov 2020 00:14:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ML4Qf2IqKuHcmdLErDvia81aDuFZXWApB8R0myLdlug=;
        b=M4XZErl9B0aIQdjMek68NW5uPjM3LZS8XFYIG1fECO24XjirO6YXXLBZK4dXtTmcJy
         GuELGoo/XLhkLmco6aZjZr7B6utayagAOUl42VGhy6TLtY6AWvBdx0eu5Vkc77Cz8yQa
         I96gAL0MXmNGZtgaspaBbsny9Mck7iUvLptQkPLJyRIb0ZzjFg6VNgx6cNvWjaoRJbWo
         xaKtR8voriEhtPVrusYA0OYF5RmN+fIMVzGR9rKxrxf5qsWzOIr98qhh5vawvA5L0Q1+
         IdEH0EcO4xA4j66EQTI5jhZ6E30D/QsIZ0Bovrj+qkBwrSlsvXmRtjkRP+y2ReC5Yy1x
         WtPw==
X-Gm-Message-State: AOAM5317/fdRU4nIsu731FiGBWOvVGU1WcT2N+f7qr5UgM58cKVPt8d6
        IA1CP31V/CjGXSLBO58dRXavJ4fPGwraZR6N0F4=
X-Google-Smtp-Source: ABdhPJxd/V5/vQ62F/8v5GZf9h7zRgvzdy/A865p+t6gXgSFDf+t3yUfm1M525rHBfhXHW6P8QU2h35EFUGW1cuZdb8=
X-Received: by 2002:aca:52c9:: with SMTP id g192mr1290541oib.54.1604391246828;
 Tue, 03 Nov 2020 00:14:06 -0800 (PST)
MIME-Version: 1.0
References: <1604375093-6451-1-git-send-email-yejune.deng@gmail.com>
In-Reply-To: <1604375093-6451-1-git-send-email-yejune.deng@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Nov 2020 09:13:55 +0100
Message-ID: <CAMuHMdWoGAEwT97R3pC-864FyG2fc7fQoaBmHxgZPnrRVWE9vw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-usb2-clock-sel: Replace devm_reset_control_array_get()
To:     Yejune Deng <yejune.deng@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 3, 2020 at 4:45 AM Yejune Deng <yejune.deng@gmail.com> wrote:
> devm_reset_control_array_get_shared() looks more readable
>
> Signed-off-by: Yejune Deng <yejune.deng@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
