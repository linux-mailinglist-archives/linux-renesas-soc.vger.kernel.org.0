Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB83344E742
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbhKLN1p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:27:45 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:46048 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLN1p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:27:45 -0500
Received: by mail-ua1-f49.google.com with SMTP id ay21so18715028uab.12;
        Fri, 12 Nov 2021 05:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+QGyfq2613eiGpabot8VF0zccLwSOZV7AkgPQyCmYfE=;
        b=aij7NME5qlmLM8DlwANqdzUwcbcd1o12OZ5DG5SilHs2i1HLu1hcGJ/fCKkwYAO8aQ
         jutFqtSL/tXrXcE3RB0wQmxfbKiOqZRJwUoIc35Huc0N3RVytHsrhXM6U5CV3aAFDp1I
         m8LjzXzHeSieiE/wwf+BAk4L6Hh040IOhKpFJCBfFeJaK5In9aFIehoHvNE5EQ76oHnn
         MycUY/9s4m/tyT56aubAgi7TDs8A++C2nPYwVbpn8rRCDcsVxvaOybiVas0rg0RiNsEO
         B8hVmjgU8N65+cYPifnEf/p5joPbctl/oZ/NKq7hSPN7WeigvSmNFbjsw2a/7DRmiCcz
         9FNA==
X-Gm-Message-State: AOAM530T0z+vVwZQLqRsgZ2oPT442YZPM/KTDGiCojEqSeJTKlitk5bJ
        /r6PZJSDfwZllfzFXwexBd5dFccLqxc0Mg==
X-Google-Smtp-Source: ABdhPJzM7FWejKxflF5z705jvTha93dkSXf7mdkvPP/aOfbbM/yRcnl3s9YM/PrOOrK0Z69jGcGg6Q==
X-Received: by 2002:ab0:23c5:: with SMTP id c5mr22080728uan.137.1636723493862;
        Fri, 12 Nov 2021 05:24:53 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id f11sm3893772vkk.50.2021.11.12.05.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:24:53 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id k83so4245330vke.7;
        Fri, 12 Nov 2021 05:24:53 -0800 (PST)
X-Received: by 2002:a05:6122:20ab:: with SMTP id i43mr23431652vkd.19.1636723493269;
 Fri, 12 Nov 2021 05:24:53 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-6-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:24:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX23Fs-WDnBjnpakTAJcoU-acSsdq+M-aivDKh7g=8k2A@mail.gmail.com>
Message-ID: <CAMuHMdX23Fs-WDnBjnpakTAJcoU-acSsdq+M-aivDKh7g=8k2A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 05/21] clk: renesas: rcar-gen3: switch to new SD
 clock handling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The old SD handling code was huge and could not handle all the details
> which showed up on R-Car Gen3 SoCs meanwhile. It is time to switch to
> another design. Have SDnH a separate clock, use the existing divider
> clocks and move the errata handling from the clock driver to the SDHI
> driver where it belongs.
>
> This patch removes the old SD handling code and switch to the new one.
> This updates the SDHI driver at the same time. Because the SDHI driver
> can only communicate with the clock driver via clk_set_rate(), I don't
> see an alternative to this flag-day-approach, so we cross subsystems
> here.
>
> The patch sadly looks messy for the CPG lib, but it is basically a huge
> chunk of code removed and smaller chunks added. It looks much better
> when you just view the resulting source file.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
