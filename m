Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B4F38296F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 12:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbhEQKJJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 06:09:09 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:40618 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbhEQKJI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 06:09:08 -0400
Received: by mail-ua1-f46.google.com with SMTP id z14so814770uan.7;
        Mon, 17 May 2021 03:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9xseL2+XE1J6V0vqH7pxR1BitLaPIz05W/5hwHbzwlk=;
        b=UqYdlo7zG/K7N1s6fdO1Uvd5Q7p4Z46qSiEUNHiisdhN1uzlPtbILONgCjhBUjFgDV
         jJHJ6vcbt8KXKgRFBQEKO0uv7RTbNtB8vJBgBmduI/4ANBeKXq1t7Qupi60bLiE4ntIj
         V1vOIJ7i0F/aAzNmwti9F1+UNtviMxE8W2Yz1YsTqaBucwmpzQEaOZ1+FXW3wLX9Jzxs
         LEpBhVwd90+7L1CldS6J8xJw4BPGFFCoWo3/VMMnzen+846TtPkqFX8OGqDG9bRjN6Yj
         zuehJ+VV/8Om+haFYTtZywIk9wn0DSA4nKhc83zr41MCiZoN9va9TscVY3ncM6xxRwfb
         z3UA==
X-Gm-Message-State: AOAM533XLR1qbiMlm7e5ITWxWuugfkRoRIwwNDfKwVD9loG2HhGzch/a
        jxvnjZwXrYaiVV+3KYKcpRgYS3A7G5FRcliMSvA=
X-Google-Smtp-Source: ABdhPJyOeqHUlARITC2WUqRxSoVofkxcJZsWewLwfS1XCXOH2n3sJhCmm08dH0bx8P9A8SpcGijPw/m9NHGCw1Z4KD8=
X-Received: by 2002:ab0:59cb:: with SMTP id k11mr38558443uad.100.1621246071083;
 Mon, 17 May 2021 03:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210513114617.30191-1-aford173@gmail.com> <20210513114617.30191-2-aford173@gmail.com>
In-Reply-To: <20210513114617.30191-2-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 May 2021 12:07:38 +0200
Message-ID: <CAMuHMdWVR0q046fYeCOsTVsnRGm7EcmWL5wDNG5pZ-_qE5c96A@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: beacon: Fix USB ref clock references
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

Thanks for your patch!

On Thu, May 13, 2021 at 1:46 PM Adam Ford <aford173@gmail.com> wrote:
> The RZ/G2 boards expect there to be a external clock reference for

an

> USB2 EHCI controllers.  For the Beacon boards, this reference clock
> is controlled by a programmable verasaclock.  Because the RZ/G2

versaclock

> family have a special clock driver when using an external clock,

has

> the third clock reference in the EHCI node needs to point to this
> special clock, called usb2_clksel.
>
> Since the usb2_clksel does not keep the usb_extal clock enabled,
> the 4th clock entry for the EHCI nodes needs to reference it to
> keep the clock running and make USB functional.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.14, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
