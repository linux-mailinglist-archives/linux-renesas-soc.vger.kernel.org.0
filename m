Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF461312DC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Feb 2021 10:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbhBHJs6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Feb 2021 04:48:58 -0500
Received: from mail-oo1-f49.google.com ([209.85.161.49]:37289 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbhBHJqy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 04:46:54 -0500
Received: by mail-oo1-f49.google.com with SMTP id e17so1766593oow.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Feb 2021 01:46:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=53O7YGMEY18aIs5/quOn80e9abESgPdAxmMk/htppTQ=;
        b=oure2nXzf/1MEOusWakY2QF6H1zR3zQhpCiDmGlD9WhGBqdkikQx+hErAkfTY/0G5E
         HgEv7GQJjE2x19ksZw6Ui1gIVGpzOQhLcN8lpW2BbgugbIwjP0rTWN+bnrAyXlbEzCDZ
         ITUcL7MfQkhuuHgoGB88oyHe8AaIeIzyaoRCcbAEVJ2BHNtdrqcv6V/Nl5wIJZUnwLnz
         V/COS5j9p2iPSmxETBq2eVotRGgbL0xntNExRAiWZ9gxlngqHK3xc1BFhg22DrYF40Sm
         aGuz1WeLqwUpyBs6cZbg3dCQRMQO6MfhvmjEvZc+wR8bSPd3Ki7qLU0ouho4/6k9xUYK
         PQJg==
X-Gm-Message-State: AOAM532UzWjHYzUxaivJJNBxjROaKfpNY1BexWVTocKrSLVp/jDYWGnG
        3wutOdpZEGF3OD98qhcbY0Mbc1CELhn/Db2WoR4=
X-Google-Smtp-Source: ABdhPJwkUZ6ngyHXn5URDnWr+y/bTg5pf6HS9RBx1qHjDcGiF6YJnKvdCsjLwoZu9oDdHAKL9ORuKoZjO1gzwgp9vpk=
X-Received: by 2002:a4a:e6d2:: with SMTP id v18mr12003567oot.40.1612777574055;
 Mon, 08 Feb 2021 01:46:14 -0800 (PST)
MIME-Version: 1.0
References: <1612752464-27838-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1612752464-27838-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Feb 2021 10:46:03 +0100
Message-ID: <CAMuHMdVBAy7wtB-_uOsTg5NiEorCwyHgENrwUQBxtcqRChvp1Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: add sdhi/mmc aliases
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

CC Ulf

On Mon, Feb 8, 2021 at 3:48 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> After the commit 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS
> for drivers that existed in v4.14"), the order of /dev/mmcblkN
> was not fixed in some SoCs which have multiple sdhi controllers.
> So, we were hard to use an sdhi device as rootfs by using
> the kernel parameter like "root=/dev/mmcblkNpM".
>
> According to the discussion on a mainling list [1], we can add
> mmc aliases to fix the issue. So, add such aliases into R-Car Gen3
> and RZ/G2 dtsi files. Note that, if an SoC like r8a77980 has one
> sdhi controller only, the alias is not defined.
>
> [1]
> https://lore.kernel.org/linux-arm-kernel/CAPDyKFptyEQNJu8cqzMt2WRFZcwEdjDiytMBp96nkoZyprTgmA@mail.gmail.com/
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v1:
>  - Revise the commit description.
>  - Remove some alias which SoC has one sdhi controller only.
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/1604654877-30010-1-git-send-email-yoshihiro.shimoda.uh@renesas.com/

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. I plan to queue this in renesas-devel for v5.13.
Unless you want to upstream this as a fix for v5.11, in which case we
have to hurry. Note that v5.10 already has the issue, too.

BTW, shouldn't we add the aliases on 32-bit arm, too?

> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -14,6 +14,12 @@
>         #address-cells = <2>;
>         #size-cells = <2>;
>
> +       aliases {
> +               mmc0 = &sdhi0;
> +               mmc1 = &sdhi1;
> +               mmc3 = &sdhi3;
> +       };

BTW, this is one of the other issues with aliases: where is mmc2?
Yes, I know why it's done this way ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
