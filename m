Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAED2EB274
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 19:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbhAESYi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 13:24:38 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:46785 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbhAESYh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 13:24:37 -0500
Received: by mail-oi1-f177.google.com with SMTP id q205so490217oig.13;
        Tue, 05 Jan 2021 10:24:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aioYYXt6hctOWT9DBOxmF084CiNjiIIOPszxy5iFjdc=;
        b=Z0FT7NcqMiCEK36kpNbZNX+HxAINeEOpp6H2uqdTqQoivkmZnhFs2y7/DJjpAkoPCo
         0uVDNmDBiIsIByK8SNoZ2H+4ibpFgm5OKiD+isZElCuSzxUlDPxW1vyMrJl9ED06Dpli
         f64F1gXDWm2Xq+JRscWaHIWZvTNGnInoJYT1oHlW9t0qAduuryo05Iet+MAjHjBrFB41
         ZENdDWkVExbcgbkANvxXoVXn8zo85i7dD+vuM+wgwfZnhgoJGOna4NMX080etR+hbKBc
         UqXPGTM/oJhsZZNcHUjTEz/oEBLr2qpG4eyBYHbFAByUlIl7JFHPGa0OdbGSix8GuO6g
         Eacw==
X-Gm-Message-State: AOAM5326u2SET4q0z2lg31a7dGCRCgojdRGNB77muzvNbKWSnUfkpxEU
        XvaFKS3g73tAwKqLTRyWhy8GPsTjua1zyYCdvpCpZBL/
X-Google-Smtp-Source: ABdhPJyeXQcnkpRPcM8MuZfnwD8dISlQsS4hYGnwtMt6BOEe5Fzgqa0nOW/VPR0NSDcK7mqwI0hATe5HJ+1sexv3Xrc=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr639186oia.148.1609871036961;
 Tue, 05 Jan 2021 10:23:56 -0800 (PST)
MIME-Version: 1.0
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com> <20201228112715.14947-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201228112715.14947-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 19:23:46 +0100
Message-ID: <CAMuHMdWwcDEJS82JAF633eYVUREeJc9waAShpgK3yHCUU+NR=A@mail.gmail.com>
Subject: Re: [PATCH 4/6] clk: renesas: r8a779a0: add HSCIF support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 28, 2020 at 12:27 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
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
