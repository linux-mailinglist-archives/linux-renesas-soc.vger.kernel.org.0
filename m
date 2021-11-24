Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4016945C6E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 15:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349269AbhKXOPJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 09:15:09 -0500
Received: from mail-vk1-f170.google.com ([209.85.221.170]:34468 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244940AbhKXOO2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 09:14:28 -0500
Received: by mail-vk1-f170.google.com with SMTP id j1so1596596vkr.1;
        Wed, 24 Nov 2021 06:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D03uKb0h9X0ojj5T51VhuuYz1l8Uojh4v6pa2E7cVFU=;
        b=duKacy+/WZJoXc63CYtd5tito4KUjL/J6yBJ6szCSu/A4OBigoS4pXMMt8NXf38ycE
         7/HAZHm5j1A75LI3LwqGAUDVF6FgAW0JIiQbOKJg33P1IA+wka9NS6NSOR6wZ/ypl2lc
         Qn8Hp8FZXwfUFh088SccFoUmo09OcN3+NpcxcgB4It1K3BZTfBYxUjA8QjkEQnbTRavE
         QLCUTlkVhgjWvfi7gQkHW/spQ91YHU35JEZOmIOUknYtVOat9FwK4yAF8BOqTAbRakGh
         mikucuwKaa3ldfCBy6XcbXYlKuW7xSSd7qx/sFtCt8AC/r1716CN5+m2QeXNHeHpV/vK
         1xlg==
X-Gm-Message-State: AOAM5331iOtb8C8iIe3RZa0FzgsqEPydctI3o23VljtrIsOVzUxmFeIX
        sM9JLapNIH6IZbKd9g9nHKdQJaimyNCtDQ==
X-Google-Smtp-Source: ABdhPJz/FrNUB7StvP4v7uzKFujWZR7yAuhxLp8ufdFt/JBmaESolsfJMyR8V+SqO7cqQEXAoNcv5w==
X-Received: by 2002:a05:6122:1531:: with SMTP id g17mr167999vkq.32.1637763078075;
        Wed, 24 Nov 2021 06:11:18 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id s2sm8206157uap.7.2021.11.24.06.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 06:11:17 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id az37so5313796uab.13;
        Wed, 24 Nov 2021 06:11:17 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr23954527vsb.9.1637763077373;
 Wed, 24 Nov 2021 06:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20211123141420.23529-1-biju.das.jz@bp.renesas.com> <20211123141420.23529-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211123141420.23529-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Nov 2021 15:11:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU=HJbBLvkssmrW0v+WjKkZMsU6VRkxBmYvC2AWsUL1dQ@mail.gmail.com>
Message-ID: <CAMuHMdU=HJbBLvkssmrW0v+WjKkZMsU6VRkxBmYvC2AWsUL1dQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: rzg2l-smarc-som: Enable watchdog
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

On Tue, Nov 23, 2021 at 3:14 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable watchdog{0, 1, 2} interfaces on RZ/G2L SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
