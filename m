Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 793CC1A7456
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2020 09:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406428AbgDNHJs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Apr 2020 03:09:48 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42988 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728832AbgDNHJr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 03:09:47 -0400
Received: by mail-oi1-f195.google.com with SMTP id d7so4558424oif.9;
        Tue, 14 Apr 2020 00:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Z5zt2CUahX5IsPzgShiRFj23zj/g56lthuN3s9ga2E=;
        b=fsFjPs6Y14mHhPJvwHG2nVoLYDeiYpwPqBi643pwYF8SsT936r5ZjyTw0+nzLN8NBZ
         bswe+kkXZn0SDEeHK/9XVIKGOBfwSLqfmYS1dj8PRhVEHMIwg/zKaAfuLZiFpW+5ZK/O
         KN/7iWu3GIKwYlMTlkPKL/E+/90in7Sd3M89Vk80M3lzlHeNoq8n2ehSg321k79a2ryB
         uv/88vIUAGMGWxkRZTWcbtZI0GEvxTlxAbnH5vvR9DkzUWxI5kPU3NEkmEB9b7B/Jnw4
         ZqBZ3BWnlrJP5JK1U+4Dnmo9G1RyWDi6UXnZ41hPQu7CidyZPpU8ntDcuW1il1Es9QUp
         zXLA==
X-Gm-Message-State: AGi0PubIsK/GfVSGqwICoMA8o+/vfisRtQV4MnHM4RjGUpf/GrnRQUuX
        HffUSV6qfJErxPRTp4ybrRnILZdG98eMRPf6EFA=
X-Google-Smtp-Source: APiQypJPAEdSB0/mCpnigVvRvJ7XIRVHn8kPh4UNvKk3GhriQALdtPNdVHc6H4U6yfJQ1kTqUN+mE1pGe6RO8Ue6wUc=
X-Received: by 2002:aca:f541:: with SMTP id t62mr257295oih.148.1586848186462;
 Tue, 14 Apr 2020 00:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200413041709.3630-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200413041709.3630-1-christophe.jaillet@wanadoo.fr>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Apr 2020 09:09:35 +0200
Message-ID: <CAMuHMdXoVGkRh63=H6P29JSS6yNCyKZdsAX1_qUNC_mH=aymyw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a06g032: Fix some typo in comments
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 13, 2020 at 5:12 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> This file seems to be for R9A06G032 only. So replace reference to
> R9A09G032 by R9A06G032 to avoid confusion.
>
> AFAIK, R9A09G032 does'nt exist.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.8.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
