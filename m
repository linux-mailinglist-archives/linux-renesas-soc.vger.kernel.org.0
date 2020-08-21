Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2123D24D584
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Aug 2020 14:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbgHUM5g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 08:57:36 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40869 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgHUM5e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 08:57:34 -0400
Received: by mail-ot1-f65.google.com with SMTP id h16so1472398oti.7;
        Fri, 21 Aug 2020 05:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oRAzEfIgQrSeDg+xvF8A8FPFPbG3VhPyO/5fKQRhXVk=;
        b=TnowRt26h6VLVoD3hHkX8SVtOvlAhr1Bnw2eTVVapir0y0Up+BNTuJZOil5cICe50r
         hzsQL4R5nPpAfIXCZQULnpQ3GcwrNPpbAt9nxZtb7L2Ve77SQgq23b7E0mVTG2cJzRHn
         +ONJMdg6QFAsgOfBzTiViHX+dskkrlmIL7d2Xt0EZDE1tU9HeM6VZMZ8bPtcrsi5swfY
         +wiQ2KXcbNK662d/IZqgsJKUMv5blhHpELH40ToseJ77eBn0Y32162MkNQL78Eo35tQm
         8rFDUjJOrq2JN0Kd0Ug0CVKWwAQ6fKdR9/MdeJxfsLLbCPlatYVA1MxHljfULzzjIPFb
         QwCw==
X-Gm-Message-State: AOAM533Oi5BY1x4y0Fh1vYwpeUSH2QOQdc+YE8TXFjO8RsjXWb/JgL9X
        FnzkfAUs581fDQ8TB6xogn1gSbAwYGL/j1c/WfMJ98ug
X-Google-Smtp-Source: ABdhPJyrowlAUZuOruZSLQeU4SRabkyazL1Z2LCpmYviVLirFX8NPUVc6XdQ0mDp4OLxKHW7VNyvC90YKK/DAUHIV+w=
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr1864132otn.250.1598014653879;
 Fri, 21 Aug 2020 05:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200816193316.7641-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200816193316.7641-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200816193316.7641-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Aug 2020 14:57:22 +0200
Message-ID: <CAMuHMdW9bd0fFqELaR14tzUFiydRPBS3ytNRE7UURo6bwsMqAQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: r8a7742-iwg21m: Sort the nodes alphabetically
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

On Sun, Aug 16, 2020 at 9:33 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Sort the DT nodes alphabetically so that its easier to maintain.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
