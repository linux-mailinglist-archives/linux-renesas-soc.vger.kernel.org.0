Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5EC61F1E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 14:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728784AbfGHM5u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 08:57:50 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35114 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731040AbfGHM5u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 08:57:50 -0400
Received: by mail-ot1-f65.google.com with SMTP id j19so16094482otq.2;
        Mon, 08 Jul 2019 05:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NqFWBxonx2vF2EoXrhkjP5gIHn8BIHRsF1n1QtEi1X8=;
        b=UXKr+cuA60I+nhV2Ss/eiKla2W5p8mQhTzeulN2eck0z8gaWVFcXd4jAHiS3yfGOIs
         Z7tzuItTFV6zWypU0DMPL9EqjP3qCvqemRu1MdsmrPaRZt243TN7e1yzgo8tfp2EYqqc
         Ao7h1zNg/tW5MhLSM0FfeIxHK1DStRM787tFxY8CeE7n4/gHt+od6XDlZ92eqUPEXUuM
         xxkOb0EG3Z840CZiSU34t4uQvbohf+1ZL1mKT/VZmo1imdIXjvV8bBs0+ICPCv/Pn/Fc
         COWlZWhPlOm8OfUm9wFR05MWAH7Fzk5/k3ss+KNZRdoDPieS6yxaPz0Ltkjhmd0Q9lTo
         YoVg==
X-Gm-Message-State: APjAAAX2ZMmGnrXLAwFOLhLQJ7MArXnyxwTzTtihJLAKeK+xYOmNDpi3
        Y0wIfCNv3bCPxStoi9cPRZdQFUMLRuB1Z1PHkjU=
X-Google-Smtp-Source: APXvYqzr+YdxE2Q+HoE76IXveE+q2igRdLHcefcfIzX6nyNzGDigeE9HdHCJFg/aJ9tndIfMSRiK8yz4yiYQy9DbEDc=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr14321801otc.250.1562590670033;
 Mon, 08 Jul 2019 05:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <1560513214-28031-1-git-send-email-fabrizio.castro@bp.renesas.com> <1560513214-28031-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560513214-28031-5-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Jul 2019 14:57:39 +0200
Message-ID: <CAMuHMdUTWztD05c+p-jgrfDSqa4JxCRdJR=wE5bCgOg+gzo56w@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r8a774a1: Add missing
 assigned-clocks for CAN[01]
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 14, 2019 at 1:54 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Define "assigned-clocks" and "assigned-clock-rates" properties
> for CAN[01] DT nodes, as required by the dt-bindings.
>
> Fixes: eccc40002972 ("arm64: dts: renesas: r8a774a1: Add clkp2 clock to CAN nodes")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I.e. applied and queued for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
