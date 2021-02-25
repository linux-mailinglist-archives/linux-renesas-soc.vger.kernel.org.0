Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F794324FF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Feb 2021 13:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbhBYMrh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Feb 2021 07:47:37 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:38218 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhBYMrh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Feb 2021 07:47:37 -0500
Received: by mail-ot1-f48.google.com with SMTP id s3so5528538otg.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Feb 2021 04:47:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tNGtEBRcJSdgmfCrpym3saAxZM10LXmg580WlkwnVGw=;
        b=cVqTtYzjA8RXDqPAQQsQUWLGjil2rTUFFpHHgQYS1ioZgDKhcy7azZGPNGjzfNrgto
         l9QcbOJ1aOzJyn3QGaq1HxNV3ldjgYeyzUjqtFYipd7m/OtJVYdlfaDs7s+0OMleCxil
         H0VbCFUT4z5Harp9nGP5T3lGyH8HTFQIby5u1Lt1OqOCYrA1dZyQgaTEsqmnj1tfh7ls
         A2f95TdBSjs7PPk5h8U/iya9x0PL7xiM6Iaif1orNhIO1ZHLhtFe1KMZeEWpo8ixwgPx
         8u71YBZbkERuslFLfR2q1sZ+nkfhCT/gf3mZJogaYmTSf3YZrzUPs/5xgu7vdO0g1M50
         VXCw==
X-Gm-Message-State: AOAM533NRM+GYG1wXjy+Rv7CpJ2hiCvi8zP/IKbzBwFbHKQJebevZgNZ
        I3hn1U4ZGVFXODa5DlCLWnxsfhSF+vkK6s8c+6s=
X-Google-Smtp-Source: ABdhPJziweyiiEyi6h6R3Rg3gO/URI96RNyW7Ab+hcppeKYGofGffgWAYhKj+x+tH7HN4INewr338xCO9NuAmwKXfNg=
X-Received: by 2002:a9d:328:: with SMTP id 37mr2097161otv.250.1614257216244;
 Thu, 25 Feb 2021 04:46:56 -0800 (PST)
MIME-Version: 1.0
References: <1614255382-6377-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1614255382-6377-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 Feb 2021 13:46:45 +0100
Message-ID: <CAMuHMdWLBX89R+jZSZSofgL-ONhjFBBdMDwd44Tuu8BY46+GjA@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: Add mmc aliases into board dts files
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Cc Ulf

On Thu, Feb 25, 2021 at 1:16 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> After the commit 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS
> for drivers that existed in v4.14"), the order of /dev/mmcblkN
> was not fixed in some SoCs which have multiple sdhi controllers.
> So, we were hard to use an sdhi device as rootfs by using
> the kernel parameter like "root=/dev/mmcblkNpM".
>
> According to the discussion on a mainling list [1], we can add
> mmc aliases to fix the issue. So, add such aliases into Renesas
> arm64 board dts files.
>
> [1]
> https://lore.kernel.org/linux-arm-kernel/CAPDyKFptyEQNJu8cqzMt2WRFZcwEdjDiytMBp96nkoZyprTgmA@mail.gmail.com/
>
> Fixes: 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.14")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v2:
>  - Set the aliases into board dts files for consistency with R-Car Gen2.
>  - Change the subject.
>  - Add Fixes tag.

Thanks for the update!

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -36,6 +36,9 @@
>                 serial0 = &scif2;
>                 serial1 = &hscif1;
>                 ethernet0 = &avb;
> +               mmc0 = &sdhi0;
> +               mmc1 = &sdhi2;
> +               mmc2 = &sdhi3;
>         };

Looks like on Salvator-X(S) the two SD card slots are labeled
SD0 and SD3, so the last one should be mmc3?

What's most important? Getting the naming right, or matching the
traditional naming?

https://martinfowler.com/bliki/TwoHardThings.html

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
