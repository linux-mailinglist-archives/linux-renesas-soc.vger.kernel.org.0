Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D1925C111
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Sep 2020 14:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbgICMdx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Sep 2020 08:33:53 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43657 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728685AbgICMco (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 08:32:44 -0400
Received: by mail-ot1-f66.google.com with SMTP id v16so2499503otp.10;
        Thu, 03 Sep 2020 05:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=can7pBcZYDul0Yv961+RYr27uzFiovUj2L4qqu06vo4=;
        b=m0at/2ZddyPOrGauz8Gik9j7DIC1dBfoT9idULCGENTPwCcWJcRmA8up5jC3ZEtz+G
         hp/s36QaYWVnK6h78VXGRtowL0MvGKs+LJujLgp9a5hndSKjQ7ct6wHs8GB4NtIEfpdB
         IbihvUZzu4JVsY8fTin9i/YYnkYYzQ+p9wuHTvq7ckMi3UYDaKrxnk4LqCkLEZdvEC6e
         mkw0msAD9irWXrQHUB/KTaveirn9L7B3lv8RT0CSWf+LCm6Xt1x+fgkhoGpxAut8heKD
         o2tp5MCr16PEY7rbMwTer1Ru67k1KcY7AwuTFUFFs8xsTrog/lVf3b2A3ifjjQRuYijy
         pfng==
X-Gm-Message-State: AOAM532xBakKRoNlzv4q1UFNZ/iCX1cQ1TseWex00otlESEZSqaSAiD4
        /kL7NsPhclU8mB15oCBassTfwK4t1mA9gZZ3T3a6eLcg
X-Google-Smtp-Source: ABdhPJx6ZN6dIKCLmZa8/h6JuRl/a8sbPFsQdsiD7b3k8qmpNJCRyue7gicu/8dRp3YgYp1zte94/1mVNN5TwHZSEPk=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr1387866otl.145.1599136328504;
 Thu, 03 Sep 2020 05:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200827145315.26261-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200827145315.26261-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200827145315.26261-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Sep 2020 14:31:57 +0200
Message-ID: <CAMuHMdWs-K=i7Z7fcsWTPj0N_eqs03KUGL6msiCyQXd6v2tq0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774e1: Add FDP1 device nodes
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 27, 2020 at 4:53 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Add FDP1 device nodes to R8A774E1 (RZ/G2H) SoC dtsi.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
