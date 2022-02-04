Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72DAB4A979F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 11:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358248AbiBDKVp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 05:21:45 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:38721 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240125AbiBDKVo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 05:21:44 -0500
Received: by mail-ua1-f50.google.com with SMTP id n15so10031939uaq.5;
        Fri, 04 Feb 2022 02:21:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=svqLy5pvXQb4rCkivk6plPx7uer7NLr1RwupYpn7fTs=;
        b=4j5tV0eVTE81WKzwceNqnjkGUw+xyGqbDiwPKJDbHiBit8Mx9KFZ9yhyNdsxjdannt
         LFTdgufewm1pvZLMVvdQrFw1vZwbUCycXJt3oDGr5X41OkDipwCo5Jh9MOuAfq+g1ijC
         F/0h0iH/EUD6k4/td8xZ4V7RlyeNpKT9mR6zzqOdzuYRussY6r8UsF4xyHREP9m9S3ys
         GD8Z2f5BhO3aTasMADtp4rrkIEaEy/4P6B1L4UAnQxCsBKFVD9pp8KMCpixp5ztpnb+r
         /OxjfatgodGW/WqJFNpFl5gr5SOXMtsTT+fLUQ+MbZ+Jrzum3d1emMPLYO+D0fUAHuTH
         4yIw==
X-Gm-Message-State: AOAM533k4Jmtk+B7pdeqFddKK7+mqNTfxKvRE1QsIkJcuqwHvUffYjVq
        755C3X7otK6tHAzfAYH2wwl2p9BmZdyhiw==
X-Google-Smtp-Source: ABdhPJxpawV9F6FXXacZoAJNjnJKYpL69dSZjBO2fkne+A7w2UjWjBsV1GQ1bxznGTfNZ/r6kJw6oA==
X-Received: by 2002:a67:b704:: with SMTP id h4mr638727vsf.56.1643970103845;
        Fri, 04 Feb 2022 02:21:43 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id d74sm368370vkf.1.2022.02.04.02.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 02:21:43 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id z15so3371539vkp.13;
        Fri, 04 Feb 2022 02:21:43 -0800 (PST)
X-Received: by 2002:a1f:2555:: with SMTP id l82mr770078vkl.7.1643970103255;
 Fri, 04 Feb 2022 02:21:43 -0800 (PST)
MIME-Version: 1.0
References: <20220203170636.7747-1-biju.das.jz@bp.renesas.com> <20220203170636.7747-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220203170636.7747-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Feb 2022 11:21:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVNki+ybeafwdRfhbBbe0NKiyF1D9gjdi2kr8f5TzOc-A@mail.gmail.com>
Message-ID: <CAMuHMdVNki+ybeafwdRfhbBbe0NKiyF1D9gjdi2kr8f5TzOc-A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi file
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 3, 2022 at 6:06 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/{G2L,V2L} and G2LC SoC use the same carrier board, but the SoM is
> different.
>
> Different pin mapping is possible on SoM. For eg:- RZ/G2L SMARC EVK
> uses SCIF2, whereas RZ/G2LC uses SCIF1 for the serial interface available
> on PMOD1.
>
> This patch adds support for handling the pin mapping differences by moving
> definitions common to RZ/G2L and RZ/G2LC to a common dtsi file.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:-
>  * Included common file for RZ/V2L.
> v1->v2:
>  * Added Rb tag from Geert.
>  * Rebased to latest renesas-devel branch

Will queue in renesas-devel for v5.18.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
