Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3CD35757
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 09:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfFEHDW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 03:03:22 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41036 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfFEHDW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 03:03:22 -0400
Received: by mail-lj1-f194.google.com with SMTP id s21so11480494lji.8;
        Wed, 05 Jun 2019 00:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=osYzYbwPlOcKrG/PC8H8GWv1Nj5R7QK9wL1yUwsonBc=;
        b=YT9K87TS1L+r1EFiLLaUcKL8P/rkxIMlZ93iEwCfuAYiJnvNDcEs2wA2ZNyUqgCIVd
         nEayUOWpuRmJzTs1Z8ua2vVuPkX5iPqZ+o/d9pCD5a4sZ+3sWiZQOTtaEjSQHFLLvPGb
         Pcuv2hy2c/4qckaFv6e1SjjkRG0gUfwwTF/2+QbB1BWziPFmZ6H0OYsw7DB+/ZE0VUnI
         d2nyjwOw1Bm5s5RCcZiS2QjRmyDS9eqtg+TnQ9BNqARq/p5dlJSQ6n28jZdurULaNTsK
         ZqAio89WnFnkskA1tjPJCcG4jZcyeui7DwWZF2uc/XA+vQV6r9cP8vfvzHqd8rhQsvnB
         rvtA==
X-Gm-Message-State: APjAAAXM+1p2medbe9z2hpTbwWXCIR3N+4L3s9m558Agz+nYqPbufqZK
        YNdLlhAp9O92ecGR47b051a011brEq7mjYvLW6KbAzwDfrI=
X-Google-Smtp-Source: APXvYqzwh3fVGm1fjYzMw1AVnfNmxjP5Iwroc9j1hk1lhsXlBthTB4FsB5COji/H7zBPGwhpbTYrkhgAtBN8C7k+/Jw=
X-Received: by 2002:a2e:6e01:: with SMTP id j1mr19452629ljc.135.1559718199961;
 Wed, 05 Jun 2019 00:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUObtKUVDohLT501TarPRC6eDnxBqqB5Tj_Tb+-4fwbkw@mail.gmail.com>
 <OSAPR01MB30890E4B76F9605F3726C676D8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB30890E4B76F9605F3726C676D8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jun 2019 09:03:07 +0200
Message-ID: <CAMuHMdXWsNfj1UYXDyh4ZJ0E2Z0jobug4jJ4uTpUa1X4d+Hocw@mail.gmail.com>
Subject: Re: rcar_gen3_phy_usb2: unbalanced disables for USB20_VBUS0
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Jun 5, 2019 at 6:06 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, June 5, 2019 3:06 AM
> > Using a tree based on renesas-drivers-2019-06-04-v5.2-rc3, I started seeing
> > the following warning during a second system suspend (s2idle):
> <snip>
> > So far I've seen this on Salvator-X with R-Car H3 ES1.0 or M3-W, and
> > on Salvator-XS with R-Car M3-N, but not (yet?) on H3 ES2.0.
>
> I could reproduce this issue on R-Car H3 ES3.0 with Suspend-to-RAM.
> # I'm silly but I could not use s2idle that didn't wake up by ravb.
> # https://elinux.org/R-Car/Boards/Salvator-X#Suspend-to-Idle

With CONFIG_PM_DEBUG=y and CONFIG_PM_TEST_SUSPEND=y, you can use

     echo platform > /sys/power/pm_test

to configure the system to wake up from s2idle after 5 seconds.
This allows to loop s2idle without user intervention.

> Thank you for trying it. I have investigated this issue and then I found the root cause.
>
> After the following patch was applied, multiple phy devices are generated.
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/drivers/phy/renesas/phy-rcar-gen3-usb2.c?h=renesas-drivers-2019-06-04-v5.2-rc3&id=549b6b55b00558183cef4af2c2bb61d4f2ffe508
>
> But, on the power_on function, it should set the "powered" flag for any other phys anyway.
> Otherwise, such a strange imbalance behavior happened.
> The powered flag is needed to avoid multiple "PLL_RST" register setting.
> # I think regulator_{en,dis}able() don't need such a condition though.
>
> I'll submit a bugfix patch with your Reported-by tag later.

Thank you very much!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
