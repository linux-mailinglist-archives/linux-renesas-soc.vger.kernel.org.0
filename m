Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0712E07CA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 10:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgLVJOm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 04:14:42 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:34038 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgLVJOl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 04:14:41 -0500
Received: by mail-ot1-f43.google.com with SMTP id a109so11351134otc.1;
        Tue, 22 Dec 2020 01:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y/CVZnXbdh3GVjGmeRZ5ybCRX51zJKs1vzq/M4NVM6c=;
        b=MXQn03fbv0Vt+iP548FPhI7lCxpAkVhVnh6nLsvsEwN3Urt2Qm2eviUCy4z23jtYtd
         +mg7rcZrd6K0E2PueEjTFEMqA2rYjQQNTH/4w06kGbykBt7ZOIoCnA0ACNynrcYT5PgC
         LGr8RAD4hawa3uFJ7Ovimm2u8PrAkHzv84NjQquEVcb/pL3yVbLuI82BbXYdxJcRWmkV
         yynJmDFT69PlOJoj3JE7gTvgjA5I0uKR2brp6wKKfJ5he42O8jq+twMqiSDvrzCl7vIp
         Xiwj20oxUQ7RGL0kvSudqOHgY9O3355lebEfok7j5kkNNhAmQZyGOnPK+sDyfqUoqIHr
         YBjQ==
X-Gm-Message-State: AOAM533IlrJ85gV6LSLVO3B/6Kkwq9pFuCsYU/osMoElXBmKw8lx5i82
        F1kivtv84Ynbb1KlzboSZ0qtnpXkXh1mKktjFxQ=
X-Google-Smtp-Source: ABdhPJwL3+OqyzxP/zepnj5gAjKTUB/LKqoYOVNv0A9v/rJSkbVz+Ujp+OEzJsQFhIAaj2T70+xIY9CKTTRVv4UuVlo=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr15046822oth.250.1608628440510;
 Tue, 22 Dec 2020 01:14:00 -0800 (PST)
MIME-Version: 1.0
References: <20201218173731.12839-1-wsa+renesas@sang-engineering.com> <20201218173731.12839-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201218173731.12839-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 10:13:49 +0100
Message-ID: <CAMuHMdV2hnNoZdLme=BRKz9vfGe22ZUCw6HiJM5ZUvhU2=P0rA@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r8a779a0: Add RWDT node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 18, 2020 at 6:37 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Hoang Vo <hoang.vo.eb@renesas.com>
>
> Add a device node for the Watchdog Timer (WDT) controller on the
> R8A779A0 SoC.
>
> Signed-off-by: Hoang Vo <hoang.vo.eb@renesas.com>
> [wsa: rebased to mainline]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12 (with sort order fixed).

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -85,6 +85,16 @@ rst: reset-controller@e6160000 {
>                         reg = <0 0xe6160000 0 0x4000>;
>                 };
>
> +               rwdt: watchdog@e6020000 {
> +                       compatible = "renesas,r8a779a0-wdt",
> +                                    "renesas,rcar-gen3-wdt";
> +                       reg = <0 0xe6020000 0 0x0c>;
> +                       clocks = <&cpg CPG_MOD 907>;
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 907>;
> +                       status = "disabled";

No interrupts property? ;-)
As we don't have it described yet for the other R-Car Gen3 SoCs, I
suggest we do that in one batch...

> +               };
> +
>                 sysc: system-controller@e6180000 {
>                         compatible = "renesas,r8a779a0-sysc";
>                         reg = <0 0xe6180000 0 0x4000>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
