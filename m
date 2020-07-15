Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E85C7220873
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 11:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730310AbgGOJQx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 05:16:53 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45093 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729592AbgGOJQx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 05:16:53 -0400
Received: by mail-ot1-f65.google.com with SMTP id h1so911866otq.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2020 02:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MRfnAWsqydd6pciKSNwgxu43TXF2fRvJxFUv2/iX85U=;
        b=Gwe8vLtIzmqwIqHqUlGV6KvGK8aLYFkDe0UqkIrgIlVPAo5fMEXaVqm4MjvKhm0gsj
         fJwjOdXs1x0dB+3QYWu2G6+r7T1FBc7hx//gg5T+RJa0Hr0jNiJ7NX7LSPkAmC8P6TCy
         v8z2Y/9zklBhjZevilbT8SlYTkH3Oo8rd59SChOGIf1UIAZqPH46C91ils2UdqDzxG1J
         wxUMZIDVkNmYKwJPIfW5hp+R/as5KDpGzaA90W95K4ZvjMyOJGY+QnYw/3d0aeO51K0w
         zmrwlZXv2nfVs5k/abUSP6yWx3v7AGZc16Pl9QecYqFp4/FHw9KcnEeiS9Ja63PEykbG
         n58Q==
X-Gm-Message-State: AOAM532jUZEcHQaTjBguH17npyysT39EaRkgZWHWXaiZEjjlqEO6AbRJ
        kQKlUH6LM1XN8dQMdVUYnZdHGqohJEXZ8zhlmLw=
X-Google-Smtp-Source: ABdhPJx9NOaK5eJdgBGUPbUZRFuYB1FIY988KHPBWBErd3BciEpEbFouJhJn29i4mN31OTRvFpqiwPSFf+iO/+h4j50=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr7761716otl.145.1594804612257;
 Wed, 15 Jul 2020 02:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <1594382634-13714-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1594382634-13714-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jul 2020 11:16:41 +0200
Message-ID: <CAMuHMdX1Hv8rq-WjSe5286GTcx34WWtURmqnGDOZxas5KMZKzg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Fix SD Card/eMMC interface device
 node names
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 10, 2020 at 2:04 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Fix the device node names as "mmc@".
>
> Fixes: 663386c3e1aa ("arm64: dts: renesas: r8a774a1: Add SDHI nodes")
> Fixes: 9b33e3001b67 ("arm64: dts: renesas: Initial r8a774b1 SoC device tree")
> Fixes: 77223211f44d ("arm64: dts: renesas: r8a774c0: Add SDHI nodes")
> Fixes: d9d67010e0c6 ("arm64: dts: r8a7795: Add SDHI support to dtsi")
> Fixes: a513cf1e6457 ("arm64: dts: r8a7796: add SDHI nodes")
> Fixes: 111cc9ace2b5 ("arm64: dts: renesas: r8a77961: Add SDHI nodes")
> Fixes: f51746ad7d1f ("arm64: dts: renesas: Add Renesas R8A77961 SoC support")
> Fixes: df863d6f95f5 ("arm64: dts: renesas: initial R8A77965 SoC device tree")
> Fixes: 9aa3558a02f0 ("arm64: dts: renesas: ebisu: Add and enable SDHI device nodes")
> Fixes: 83f18749c2f6 ("arm64: dts: renesas: r8a77995: Add SDHI (MMC) support")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

In the meantime we have r8a774e1.dtsi, too. As it doesn't make much sense
to officially fix a commit that hasn't been pulled by arm-soc yet, I'll
fix it in the commit that introduced the file.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
