Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D78A645A3E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 14:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234692AbhKWNmH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 08:42:07 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:41839 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233815AbhKWNmH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 08:42:07 -0500
Received: by mail-ua1-f49.google.com with SMTP id p37so43739614uae.8;
        Tue, 23 Nov 2021 05:38:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sokljAb5QvtyDd43lyfyuPXNgJigeOjG941ao/pWYMY=;
        b=XcUS+Ygj7J85DndGftmzfJ86bvHXBaAHJe0Jjyhn4d8L6OZ4aXUttd1OT+cQC5BbTs
         LaFZTM1WBwTULz8LDT15sliHhO/ru4p1lyZShgZq7Ijk/dWZEmWZ0eIAOz22k7VcbvEi
         efADIIRr6aiQLwVp+mzgkKG0aeYJWroOUKLlEihOBZ65bj7Fkcr8WsU/x8O/UMDrH7sz
         PPNFqVEmHebywgiMjKNjVWG4CLIxH5lDqohmVC322Zt6eVMiunSApNpq6DACTgsMaYgc
         HkbyFLijYJAWA5im7TQHmADUS8ZOLqsmPblsGKJjnMIIkwgO2PP4SoUx10NSCFZBkSj0
         /WqA==
X-Gm-Message-State: AOAM532WxoQKv8jil0gCZxz2xU4yWk05iXQwOdYXtLg3TUr4+CIVo6iX
        fpcCuAVKnK4lSX3qKJRgvE/0TEob9yK67w==
X-Google-Smtp-Source: ABdhPJxHxiQUTjCJ+YN0pRLkCJH23GmL8OAV55O1xRLvzrkn62AbxxskSwQt9yMeyKEMOsiwbElHFQ==
X-Received: by 2002:a05:6130:305:: with SMTP id ay5mr9343248uab.73.1637674738681;
        Tue, 23 Nov 2021 05:38:58 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id l28sm6290389vkn.45.2021.11.23.05.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 05:38:58 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id l24so43887695uak.2;
        Tue, 23 Nov 2021 05:38:57 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr8849925uai.89.1637674737743;
 Tue, 23 Nov 2021 05:38:57 -0800 (PST)
MIME-Version: 1.0
References: <20211122103905.14439-1-biju.das.jz@bp.renesas.com> <20211122103905.14439-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211122103905.14439-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 14:38:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV5c-1wjhWN1kBbbgp7RMZR4NFTg2btyJ1JSxuGhxq9vw@mail.gmail.com>
Message-ID: <CAMuHMdV5c-1wjhWN1kBbbgp7RMZR4NFTg2btyJ1JSxuGhxq9vw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: renesas,sdhi: Rename RZ/G2L clocks
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Nov 22, 2021 at 11:39 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Rename the below RZ/G2L clocks to match with the clock names used in
> R-Car Gen2 and later generations.
>
>  imclk->core
>  clk_hs->clkh
>  imclk2->cd
>
> This changes will avoid using fallback for RZ/G2L high speed clock,
> if "clkh" is not used in device tree and also the code changes in
> driver related to this clocks.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17 if Ulf is happy.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
