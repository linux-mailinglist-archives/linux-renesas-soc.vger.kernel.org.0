Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A95FC2208C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 11:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730738AbgGOJac (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 05:30:32 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40061 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbgGOJab (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 05:30:31 -0400
Received: by mail-oi1-f195.google.com with SMTP id t198so1700164oie.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2020 02:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JuS5I7KEYQFSqVmWKoY6oLr3hFeFLtHkZO28nl6DOKo=;
        b=FVWKHhBYNt/cU2b/OPkH1cysGyxLuF9/HtiBmRfbi4TYu3hG3XQx6Uma0iITxS2fPE
         XmFguNYLxVsTauNNtF/xC1OV8FhZ6klwR1pE7bLnj2cJgxW3VmTdbcyKYHqCGggmsV5t
         H2svGgxieAVxTHAIt8ID3knk+0gSQhZojfYDM7Zxy03/PLVvD8439UIE+met53i5AmYU
         CoyHVw6d6BFradkqiuJ96wY3SDvpksdFiQ0amU20PMXbZwJjf2z9UqErhp9nA0bexUu5
         5z+tF5L68bdZXZgE3axfjVn2hHaKirhY0CrK8MvKBW6uKyTZ/yUgRKO6OATZQ8ROCrCU
         m8hQ==
X-Gm-Message-State: AOAM5327ifnSHrKhOVzTbypbYw1MrICHbQckWJAiVJ8TlpO/6TnMYlti
        F85RsDpLB0/HG0xWANvBbWhvADEXGOIh3au4AL4=
X-Google-Smtp-Source: ABdhPJyZ7ex/xiy6dVvbhYdHUoqmbG6NZ50/tRyrGTFz6+phSxR+gvdv+LTMnG93PrcQrGBQJQdet78c0XMXy5uE7Wo=
X-Received: by 2002:aca:5c41:: with SMTP id q62mr6789358oib.148.1594805430525;
 Wed, 15 Jul 2020 02:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <1594382936-14114-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1594382936-14114-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jul 2020 11:30:16 +0200
Message-ID: <CAMuHMdWTfmZb6ThBUsRTU_h=9Gt9krON8OVRwn5Y9Q5gV9J7nQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: shmobile: Fix SD Card/eMMC interface device
 node names
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 10, 2020 at 2:09 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Fix the device node names as "mmc@".
>
> Fixes: 66474697923c ("ARM: dts: r7s72100: add sdhi to device tree")
> Fixes: a49f76cddaee ("ARM: dts: r7s9210: Add SDHI support")
> Fixes: 43304a5f5106 ("ARM: shmobile: r8a73a4: tidyup DT node naming")
> Fixes: 7d907894bfe3 ("ARM: shmobile: r8a7740: tidyup DT node naming")
> Fixes: 3ab2ea5fd1ce ("ARM: dts: r8a7742: Add SDHI nodes")
> Fixes: 63ce8a617b51 ("ARM: dts: r8a7743: Add SDHI controllers")
> Fixes: b591e323b271 ("ARM: dts: r8a7744: Add SDHI nodes")
> Fixes: d83010f87ab3 ("ARM: dts: r8a7744: Initial SoC device tree")
> Fixes: 7079131ef9b9 ("ARM: dts: r8a7745: Add SDHI controllers")
> Fixes: 0485da788028 ("ARM: dts: r8a77470: Add SDHI1 support")
> Fixes: 15aa5a95e820 ("ARM: dts: r8a77470: Add SDHI0 support")
> Fixes: f068cc816015 ("ARM: dts: r8a77470: Add SDHI2 support")
> Fixes: 14e1d9147d96 ("ARM: shmobile: r8a7778: tidyup DT node naming")
> Fixes: 2624705ceb7b ("ARM: shmobile: r8a7779: tidyup DT node naming")
> Fixes: b718aa448378 ("ARM: shmobile: r8a7790: tidyup DT node naming")
> Fixes: b7ed8a0dd4f1 ("ARM: shmobile: Add SDHI devices to r8a7791 DTSI")
> Fixes: ce01b14ecf19 ("ARM: dts: r8a7792: add SDHI support")
> Fixes: fc9ee228f500 ("ARM: dts: r8a7793: Add SDHI controllers")
> Fixes: b8e8ea127d00 ("ARM: shmobile: r8a7794: add SDHI DT support")
> Fixes: 33f6be3bf6b7 ("ARM: shmobile: sh73a0: tidyup DT node naming")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
