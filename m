Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0364312804D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2019 17:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfLTQEU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Dec 2019 11:04:20 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43107 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbfLTQEU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Dec 2019 11:04:20 -0500
Received: by mail-ot1-f66.google.com with SMTP id p8so12388657oth.10;
        Fri, 20 Dec 2019 08:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/0luK+WwgKuSiOa98RbWzLq3abcmu9sv6SofOdHarLw=;
        b=bPKNyCD3NGqeyJXSpFjy17xvhfWOqg1vcw39RDn7vorA1FbyH5T6tXOASKTqqWoeUq
         rMUmveMs4YG5W0W2DXCK6WVdPr43RrPsxJtsb7XTIQvG3btAMVnhgO3fY0L7D87g9n1S
         7Scl7fW7L9m6kg56RQ54oeYIIgLEvqJZapwVK+Uyp72GK0NDFWLTr4UMIjO/jVWWyy8V
         ZCOaeZ3/+PLmZAoTNEVUeaTALkwB5pNR4w2KOveel/TzU0VGJ9nPNzTMRM1/blhDz94Q
         Gzy8/0Gq5lN1csZ71CXG8PTsZz5kiBfYRKMHaLuUa0pfsoZCybuV3DA7MFdAVjx4M9Ob
         Zdfw==
X-Gm-Message-State: APjAAAVU6TWxsTiFbIiim/bP+dCf0baRyVAeLjeC/nZLMHke3XYMWLf8
        IozkMZJCqmF58keZIqnZDvMOeKRTSg/wQJHXixo=
X-Google-Smtp-Source: APXvYqwIBXEf8Or8cIB/dLb8EUcezl3h1qf5WHhhSUgyISMMo6XfEF6/MW1vA50EZ88LJQNV52+2bem/u3xmPUfK7XM=
X-Received: by 2002:a05:6830:2141:: with SMTP id r1mr15678372otd.39.1576857859067;
 Fri, 20 Dec 2019 08:04:19 -0800 (PST)
MIME-Version: 1.0
References: <1576667617-35615-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1576667617-35615-1-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Dec 2019 17:04:07 +0100
Message-ID: <CAMuHMdX71dO803qY+GyYx5Dz+miat3f=NCOFc8aBn_pmqe5Zog@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Fix EXTAL Clock frequency
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Dec 18, 2019 at 12:15 PM Biju Das <biju.das@bp.renesas.com> wrote:
> As per the schematic, the extal frequency is 16.6666MHz. However
> it is wrongly mentioned as 16666666 on the SoC dtsi.
>
> Fixes: 438419ebd3f86221390 ("arm64: dts: renesas: Add HiHope RZ/G2M
> main board support")
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -154,7 +154,7 @@
>  };
>
>  &extal_clk {
> -       clock-frequency = <16666666>;
> +       clock-frequency = <16666600>;
>  };

Given the schematics say the accuracy of the part is specified as 50ppm[*],
changing this doesn't matter much, IMHO.

[*] Yeah, that's more than 4s/day, so it would made a lousy watch, if not
    for NTP ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
