Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5DF3B0802
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 16:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbhFVPA1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 11:00:27 -0400
Received: from mail-vs1-f41.google.com ([209.85.217.41]:45936 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbhFVPA0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 11:00:26 -0400
Received: by mail-vs1-f41.google.com with SMTP id u10so889936vsu.12;
        Tue, 22 Jun 2021 07:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X/cKPxNBLanv5KEQaU47YcM/fTqe7XjQZM+sjih2CP4=;
        b=h7m8bsVq5KTrAtyEzw/yQgaEcRHd/xiewt0+BU6QD5AYB9tQsEE+waY4xF+VJOim+R
         WhkZYw9RxPK6U0SdO+J4j3PQ4rgKMOBcopvzKIDQ9Tzqf3Ok+397VPZ/fttYnxxclbw+
         vJVSYZv3y9IsYEzsnP7cK8pKE+X/91F9Ya1FYZ/PvwQvl7g+G8e3sS+vupZqCflylyCh
         clnCxf1qDunCkFi1dir+sDSebvbIK4WwuIND6tSR0KzP07uVJLsOOg3rPBgL3X9wDjqp
         Dr13PFfhhKee96hhCAfQVxELKEVuajD3cV0XCG3A3InSHgu0aoIOw7KqHCoWVcqW0ida
         ks8Q==
X-Gm-Message-State: AOAM5307GSeKIPZ2wtiyK+TisT1e/zLqLlTEjekFNYKhQD1ufvEU/I0n
        AwXIf7xDHhp3lNJQOW0AjglKawRvX0D2H5fy0Cs=
X-Google-Smtp-Source: ABdhPJyGOotv/eXH6M9JzTSYML2CzZ68AdlE14Z2Qow7/AYGl4jhr/LcCoefUVvqhLR6aJ2ldEdzabZdFSs3Mw3YmO0=
X-Received: by 2002:a05:6102:2011:: with SMTP id p17mr23249419vsr.40.1624373889520;
 Tue, 22 Jun 2021 07:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com> <20210618095823.19885-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210618095823.19885-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Jun 2021 16:57:58 +0200
Message-ID: <CAMuHMdXpK5__A36Xw99GT4KV39-RZTF84nwnBFiJj2cvxthfyw@mail.gmail.com>
Subject: Re: [PATCH 2/7] drivers: clk: renesas: renesas-rzg2l-cpg: Add multi
 clock PM support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Jun 18, 2021 at 11:58 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add multi clock PM support for cpg driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
