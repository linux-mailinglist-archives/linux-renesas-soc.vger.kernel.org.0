Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB952D7607
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 13:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405573AbgLKMup (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 07:50:45 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44467 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392539AbgLKMuh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 07:50:37 -0500
Received: by mail-oi1-f195.google.com with SMTP id d189so9647483oig.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Dec 2020 04:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XODk7vx/kezVA+uqz3mqm8tv6+XzVcvTimopyR1Prng=;
        b=afu4HxJIMVt67P4q9HNIin6KQYpLzmHiBhK2pctCoxvo71qRYl9C1+Vy7kM/Ws2HnR
         r28ItNZohMC+rLgaFyF/RJSzhJT9Mq/uwB53ZDf0J+dON8v7zM7ko8EapvmHqSXa4G6t
         nNG/RLeTr4XLkUMPik79ioeFuwlsxOtM+gcKeRavnDj1gA3TTx6PigDDBWmwSZNJHHCV
         mh7PnzKX7RN+Az8cIcILbRrk3hqChIQKstF1rQ5Lz6lvZfR59FsExyvlmePNled3/CHA
         EvwuTVdxwI011KzeXhk65ybg64MkIXh4rlKm0WufaL0SbXkUVJhzpxmnxndy8y3Rw5Cs
         Hubw==
X-Gm-Message-State: AOAM533Fyggvib2ec49hzpPeikgnfAXll1rzgvSEo1uQFnhmxQSZd7po
        U5OcolkFZ33IYzEcBEOYy3JgdN6GlwlDHpFv850=
X-Google-Smtp-Source: ABdhPJxjWrsKWvcsq+tndkx0jQMzkNue7NAeFY0v3ImSfn7yECR5KClhxQrCfcWPXYPhuLa6nyNmq6jfmtE1FCVB1Bo=
X-Received: by 2002:aca:5c08:: with SMTP id q8mr9217561oib.54.1607690996939;
 Fri, 11 Dec 2020 04:49:56 -0800 (PST)
MIME-Version: 1.0
References: <20201210142021.163182-1-julien.massot@iot.bzh> <20201210142021.163182-3-julien.massot@iot.bzh>
In-Reply-To: <20201210142021.163182-3-julien.massot@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Dec 2020 13:49:45 +0100
Message-ID: <CAMuHMdUoEwznsB=-jQ8J8E=9TuOfLwrhgMSyVYNQb5_Y5PwC3w@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: renesas: r8a7796: Add MFIS clock
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 10, 2020 at 3:55 PM Julien Massot <julien.massot@iot.bzh> wrote:
> Signed-off-by: Julien Massot <julien.massot@iot.bzh>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
