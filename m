Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56BEE324CD4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Feb 2021 10:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234932AbhBYJ1U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Feb 2021 04:27:20 -0500
Received: from mail-oo1-f46.google.com ([209.85.161.46]:36619 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236365AbhBYJ1N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Feb 2021 04:27:13 -0500
Received: by mail-oo1-f46.google.com with SMTP id x10so1222886oor.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Feb 2021 01:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V0L9lOqVSBM2VYOgd+GWaF3ixdDNxTtFwg78Vd4lA8Y=;
        b=Q9ATg3c+IUYeq9mRPqL99Do/kZmD/9b1EJklBEe8aIUa7mDBIGkqAC+oO1601STErt
         R4o6b8tLUOnuP9643fccj5/DQkYvH2fz1aqWGd9OfdhCCuy1PAhi5BAoYvmUjxNPbSjW
         wmWsreQnQJo0b2cEXCqQi5PIx+EtktPowrSkbSLsHieezAdTbedw7VN1BWUDzhxGBRM5
         cWDIEBzjqtw+XxL+If44oQf9ad/coGXPYhV6sbbnqilBv0DCMbh5Ym3Xvr70tCtt4Klm
         C7BdFbNap+/TWAgkjTC90FCJoDtNsUUqEy1iMTnXNcXyvmS2TYvdCg4MTiHwnzruHsIb
         0i6A==
X-Gm-Message-State: AOAM531UvQpM5A0bLj9nLAwCvZEvIpA6tDQt7RnkqeptblnTROyYKjtj
        Fj0fGvrZvfZhKoAicmZ2qDXRFrqQ6X/2RH6vNxf/tutG
X-Google-Smtp-Source: ABdhPJy386pdMyV6wacYIwBuq7FpEc7UASXY4RbONmd4RHYNl2a/4O3QZb+ikPHq/SpwxSjth354AmgyxqwzB4S+qDw=
X-Received: by 2002:a4a:bb14:: with SMTP id f20mr1616127oop.1.1614245192231;
 Thu, 25 Feb 2021 01:26:32 -0800 (PST)
MIME-Version: 1.0
References: <1613131316-30994-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1613131316-30994-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 Feb 2021 10:26:21 +0100
Message-ID: <CAMuHMdWvSJdAq3P7+FKd=MMU25YPJCML5_5-vKCo=wq58qmcQw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: Add mmc aliases into R-Car Gen2 board
 dts files
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 12, 2021 at 1:02 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> After set PROBE_PREFER_ASYNCHRONOUS flag on the mmc host drivers,
> the order of /dev/mmcblkN was not fixed in some SoCs which have
> multiple SDHI and/or MMCIF controllers. So, we were hard to use
> such a device as rootfs by using the kernel parameter like
> "root=/dev/mmcblkNpM".
>
> According to the discussion on a mainling list [1], we can add
> mmc aliases to fix the issue. So, add such aliases into R-Car Gen2
> board dts files. Note that, since R-Car Gen2 is even more complicated
> about SDHI and/or MMCIF channels variations and they share pins,
> add the aliases into board dts files instead of SoC dtsi files.
>
> [1]
> https://lore.kernel.org/linux-arm-kernel/CAPDyKFptyEQNJu8cqzMt2WRFZcwEdjDiytMBp96nkoZyprTgmA@mail.gmail.com/
>
> Fixes: 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.14")
> Fixes: 21b2cec61c04 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
