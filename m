Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5854E2AB43F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Nov 2020 11:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgKIKCf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Nov 2020 05:02:35 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43590 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbgKIKCe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 05:02:34 -0500
Received: by mail-ot1-f65.google.com with SMTP id y22so8355624oti.10;
        Mon, 09 Nov 2020 02:02:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6IDtFc1Zp+sY9uPPoRI4/toEjohndKqY0sUuYOc9pY8=;
        b=IwLnl2ZUYcIGJ9YXq/+a1g93Di49ToXxvXZl9HdjgCJoccm5YejjIkpBpCBBwpmViV
         CBbuuGZj9N5q9BFh1uY1YF8oqg9yB5lPN1yJWEYNDshfiuO4C+8bXnP/Xw85Qs5Cmbn4
         0oq83rOLmxg6QWXEAourHZdqwLcGviy5Gs3tjTAguWkgYVjtK25TH/tu88IQhRvlVDrS
         hox/HKnv5Oot1/o9k7ATnVjc0UpStdHcTYArvMSu7nOg+HlvO1/eRSEv5iv9vVTN+9Yk
         lQL3j5ib8+1yTqLlczLZ3qsv8QMwK7ElhAap1hLQJCZLS6U8KGrNaAZUQxQO+EwbpvgS
         Hclw==
X-Gm-Message-State: AOAM531ma1Q3Y+suiQY3INOm1y80PR/JMdMM3I1paZSNjuEpmvDsYOaS
        hIHvjnWdG0v7nnASvwA//7qABHMamAXKZt6PzIE=
X-Google-Smtp-Source: ABdhPJwbewbcw13rMqhN7okfdHGe6O6/PejWFQjvt2kqHE1YFMA11uN2LVZzCc8/X1ul+a4jJXXKFa6fZ877NgJPPTg=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr9682101otc.145.1604916152661;
 Mon, 09 Nov 2020 02:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20201104105508.21197-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201104105508.21197-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Nov 2020 11:02:21 +0100
Message-ID: <CAMuHMdUFTQTJqRqF7=-RbxKRDUbqEjf8LFpzGHugTNAZ1KV+cQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774e1: Add missing audio_clk_b
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 4, 2020 at 11:55 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add audio_clk_b configured as 0 Hz, this will be overridden by the
> boards providing the audio clock.
>
> Fixes: 8183a7938cfec ("arm64: dts: renesas: r8a774e1: Add audio support")
> Reported-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

> I have rebased this patch on renesas-arm-dt-for-v5.10 branch.

Not renesas-arm-dt-for-v5.11?

Anyway, seems to apply cleanly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
