Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1EB8240512
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 13:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgHJLKg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 07:10:36 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39014 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbgHJLKd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 07:10:33 -0400
Received: by mail-ot1-f68.google.com with SMTP id z18so6927250otk.6;
        Mon, 10 Aug 2020 04:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b5ZUABtlsgiBYK8fcXIjwE8+HKVtbj5bOYrBRraOXHs=;
        b=gXoa3Ns7NOMxeoSXPJLGfUZfgzDtXuaDYmaMqvhF2XP+2xC4vm/MdirTiRo2J56zdy
         1UOSHtVTaItKyq2zZ/8c/kTc4Yx0EneoMl94dHu9HMW7S29t/kEfMuRuM0/B3b2YtDAP
         uMzBEAYAQOXnjIMt0XGoTaaU9kQumuvIxXJp7iNbyTeECI1YLjx9t9nCw+i49UO3MvTE
         DT1uJjqmEUyMAgerG2U12/P7k4eimLk9gEw60ma3D4GpNFxHMUqPSMA/kJAL/3bu/GMg
         e0g6czP3ilkivyVz+Yxa0mRXgqqPyoons7wss8kWEqpoA1Sb3tQVv2ag/cA14RY5MK1L
         Pjcg==
X-Gm-Message-State: AOAM531xr9L6PeonKPsUGsUrU8pmHaQFkd3jxHufuE4DBBjTGUuH0sd0
        9FX/HWAY/k44oE55aa+V/J8ojjSnHFtHQvMvk0Y=
X-Google-Smtp-Source: ABdhPJxB//7K+LA9FFJW2KYiVuSAsbrNpM0G6ysb09NYVMXcU13W/cnH/hWtU7X/w4lrXlqA/ttdGnf1lmq176E2BbM=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr306934otn.250.1597057832771;
 Mon, 10 Aug 2020 04:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200810092208.27320-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200810092208.27320-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200810092208.27320-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Aug 2020 13:10:21 +0200
Message-ID: <CAMuHMdXYEyEOLaNAPL=Uf_wwrxkp4Uoyyn6_HiLSeehvDENUvg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774e1: Add FCPF and FCPV instances
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 10, 2020 at 11:22 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Add FCPF and FCPV instances to the r8a774e1 dtsi.
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
