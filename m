Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1115117DE87
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2020 12:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbgCILPo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Mar 2020 07:15:44 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38054 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbgCILPo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 07:15:44 -0400
Received: by mail-ot1-f68.google.com with SMTP id i14so9146812otp.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2020 04:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kA32WbQVwQpjCUpxAFLPNLzrm2W9gC5xFGf28dRoAGA=;
        b=MkwCpsojtOooV0zt5mvvF+O2Dga0oy338RoIm4RUZf3TFeLcrTBJPG6GrmuaLqcedM
         b0mTuwQBiABtTMHAYEhPHYaPVk7VjnMpdvSFgR78FN51Xx3vC8ovb3R7phksZ9wTqG2u
         /WZ42SPsBOBECi3t10Q1B6pR5y8FMByR+YImDmgdgCH5K+B76cAbUm/gJRLitHqRTw8j
         xql8c6u+hJ3D6KWOSfyDhmJ8/2eVNjC2KtQc4QfwdhprMQDILf7ScJxYwpe4QxKowsjk
         FMDPjDlTkv0fy2kggLKtfrWmWf3l0dtIAy4e6jAdwL486lgegUXWsszFsPKYXE0RmVRO
         Ig9g==
X-Gm-Message-State: ANhLgQ0WctqxmjtoxCwRJDTI7LerAOr25NJD2JO/UDoREHtSgyQLbPjS
        TClrLFQsQ8RWnmb5Ef1iFSdnzn4FFvtvcVUTDtckQ3rv
X-Google-Smtp-Source: ADFU+vv7Ybs0FAyjQtSclUR2lwRQezZVca0/MGCWkU/4e1MdWqQ9o8SFoR6Q9yLXmwDcbWTk2gpDG0l1iRYuaUds/Pg=
X-Received: by 2002:a9d:4d02:: with SMTP id n2mr3178108otf.107.1583752543428;
 Mon, 09 Mar 2020 04:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200309064425.25437-1-yuya.hamamachi.sx@renesas.com> <20200309064425.25437-3-yuya.hamamachi.sx@renesas.com>
In-Reply-To: <20200309064425.25437-3-yuya.hamamachi.sx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Mar 2020 12:15:31 +0100
Message-ID: <CAMuHMdVxAzHA1s0v7X=ne1ExAa54ef_iwVTcP=GgJgi98FOrpQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Add support for M3ULCB with
 R-Car M3-W+
To:     Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hamamachi-san,

On Mon, Mar 9, 2020 at 7:49 AM Yuya Hamamachi
<yuya.hamamachi.sx@renesas.com> wrote:
> Add initial support for the Renesas M3ULCB board equipped with an R-Car
> M3-W+ SiP with 8 (2 x 4) GiB of RAM.
> To avoid build error on 'ulcb.dtsi', ssi2 is added into 'r8a77961.dtsi'.
>
> Based on commit 92980759c1699a3c10beb00f411270197ac89544
> ("arm64: dts: renesas: Add support for Salvator-XS with R-Car M3-W+").
>
> Signed-off-by: Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the M3ULCB (R-Car Starter Kit Pro) board with R-Car M3-W+

The above long line needs to be split.

> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r8a77961.dtsi"
> +#include "ulcb.dtsi"
> +
> +/ {
> +       model = "Renesas M3ULCB board based on r8a77961";
> +       compatible = "renesas,m3ulcb", "renesas,r8a77961";
> +
> +       memory@48000000 {
> +               device_type = "memory";
> +               /* first 128MB is reserved for secure area. */
> +               reg = <0x0 0x48000000 0x0 0x78000000>;
> +       };
> +
> +       memory@400000000 {

As Sergei pointed out, the unit-address is wrong.
Interestingly, r8a77961-salvator-xs.dts has the same issue.
Will send a patch.

> +               device_type = "memory";
> +               reg = <0x4 0x80000000 0x0 0x80000000>;
> +       };
> +
> +       memory@600000000 {
> +               device_type = "memory";
> +               reg = <0x6 0x00000000 0x1 0x00000000>;
> +       };
> +};

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.7, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
