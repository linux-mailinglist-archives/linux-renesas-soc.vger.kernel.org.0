Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED2432CE60
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Mar 2021 09:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236662AbhCDIZd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Mar 2021 03:25:33 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:45302 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236728AbhCDIZ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Mar 2021 03:25:26 -0500
Received: by mail-ua1-f51.google.com with SMTP id c44so8959504uad.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Mar 2021 00:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HD+b2kYHB3ps+BLJxxwZkRTYTKKlKGh2esKuoFtFE1M=;
        b=E1+y6/Ek9n1+nQD/rnSPWC2TGJcfD7vPDQkMBoTWycbmW4GtedzC0o/FRV7djpW3YS
         miuQx354ZvNANpsrWTDgyhgg7uSz5hASYy0B/ekndEl7b9x22db1BUZq44YltG6PDoHh
         7GwjdBB0SPDvkgeTofbxabi4It8n2Z3Da7hpzFO5c7xewhkb5MaxddwB96xygltwBHcz
         PZ5KFgN/WPEXKACEiMAn0BxtaYxLDlgseoSucHhXpyBMIH2/c2OwCHq06jCBz623oIMx
         hAXlRan0l8eqnGmInU08zXAT3Hc4kpvI9jdQpbvZotK8bT8szHswEJvCvsQHLdoyE0wT
         6xCA==
X-Gm-Message-State: AOAM532oPCvbb9SAxdBzdMYM7/QXxJiTGjS5BoafoEuxzG4y9GgupcKT
        KCpXRbZPaEaQCYArGZ7gyexyUEF2L65kKmWoEjU=
X-Google-Smtp-Source: ABdhPJy7TA2yMW2Hq9FCojQDdWnMIphxAxDmTYKh9HRgtBFbeblmMwuHmck4SlyivBPMr6FS0GSh1oCSNRvnc3WhFcQ=
X-Received: by 2002:ab0:6045:: with SMTP id o5mr1702280ual.100.1614846285713;
 Thu, 04 Mar 2021 00:24:45 -0800 (PST)
MIME-Version: 1.0
References: <1614596786-22326-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1614596786-22326-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 4 Mar 2021 09:24:34 +0100
Message-ID: <CAMuHMdW7m8Y9y-DmSmAPFTxY6bKiyH3guFKsd=x_oCc+y+8j=A@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: renesas: Add mmc aliases into board dts files
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Mar 1, 2021 at 12:06 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> After the commit 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS
> for drivers that existed in v4.14"), the order of /dev/mmcblkN
> was not fixed in some SoCs which have multiple sdhi controllers.
> So, we were hard to use an sdhi device as rootfs by using
> the kernel parameter like "root=/dev/mmcblkNpM".
>
> According to the discussion on a mainling list [1], we can add
> mmc aliases to fix the issue. So, add such aliases into Renesas
> arm64 board dts files. Notes that mmc0 is an eMMC channel if
> available.
>
> [1]
> https://lore.kernel.org/linux-arm-kernel/CAPDyKFptyEQNJu8cqzMt2WRFZcwEdjDiytMBp96nkoZyprTgmA@mail.gmail.com/
>
> Fixes: 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.14")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.13.

> --- a/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
> @@ -21,6 +21,9 @@
>                 serial4 = &hscif2;
>                 serial5 = &scif5;
>                 ethernet0 = &avb;
> +               mmc0 = &sdhi3;
> +               mmc1 = &sdhi0;
> +               mmc2 = &sdhi2;

The last one is used to host a fixed SDIO device (the same is true for the
other beacon boards, and for cat874).  As there is no need for the user
to refer to this mmc bus, I don't think it's strictly necessary to have an alias
for it.  But it's nice to have, for consistency.

> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -17,6 +17,8 @@
>         aliases {
>                 serial0 = &scif2;
>                 serial1 = &hscif2;
> +               mmc0 = &sdhi0;
> +               mmc1 = &sdhi3;
>         };

Note that on cat874, unused sdhi1 is wired to an expansion connector.
If we ever see an expansion board adding an SD slot to SDHI, we can
change the aliases to make mmc1 point to sdhi1.  The SDIO device
won't care.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
