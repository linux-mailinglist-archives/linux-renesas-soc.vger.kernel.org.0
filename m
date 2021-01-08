Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95F82EF2CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 14:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727684AbhAHNAb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 08:00:31 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:34469 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726468AbhAHNAa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 08:00:30 -0500
Received: by mail-oi1-f173.google.com with SMTP id s75so11252826oih.1;
        Fri, 08 Jan 2021 05:00:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5EEF9HPuEss0X7dJBLaIB/WvabU3DT0k1tPZGIcBDng=;
        b=eQJYbsMlLpflPJec8vprDG74noyPEThmzxCXtapkUHSXTxqKn466lEl/nkSYU0Rp5I
         iLXG+I6tuz3DsqEmTnqVy98fNU2XYY55k5RD6XHTRTPG5c0KtZzVDtUqbg9QZnBKYxDV
         BBfVZgJkECaF75+nCHHNLyFAQBamfbg17q/pTyL8Sdc46ngT8AxVn+3/0EA1K9WTEnFp
         IWmBA9MKOiyLI+Y3fFpU3ZigdE+vFyRfP4vlbOCPDjccD8K5QDAyOh+sWhK/POheNxcm
         l156PsMQhvkhqFwqjwjaOo8ecPuzOvPoSC97MbCmvKdxf5qdEpUxu1c0jC+ZGYmX4pQg
         pzoA==
X-Gm-Message-State: AOAM532mGXspPdtXbQQ77ojsInvwKu7HGq82rNzoIXsMbx2bd4c+BHKa
        TEkmfdRx1qFSqAFP/E6hyYwjpsDyk5F4Nz+jR58kETp8
X-Google-Smtp-Source: ABdhPJwnOJKiGorgKn3vmlzSCJzuqRqnIngIPPJn9xd1v9okhw1scNKJ6iSucUgI+0obR6D2FYUHVY9lyH1fo0ZSu+o=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr2181678oia.148.1610110789830;
 Fri, 08 Jan 2021 04:59:49 -0800 (PST)
MIME-Version: 1.0
References: <20201227174202.40834-1-wsa+renesas@sang-engineering.com> <20201227174202.40834-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201227174202.40834-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 13:59:38 +0100
Message-ID: <CAMuHMdXFi8ByqBAUvKiQ=O4mQXN1Vfb854vXXoM7ggy3oNpNBA@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: renesas: rcar-gen3: factor out CPG library
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 27, 2020 at 6:42 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> R-Car V3U has a CPG different enough to not be a generic Gen3 CPG but
> similar enough to reuse code. Introduce a new CPG library, factor out
> the SD clock handling and hook it to the generic Gen3 CPG driver so we
> have an equal state. V3U will make use of it in the next patch then.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.12.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
