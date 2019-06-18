Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0E24A371
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 16:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbfFROIz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 10:08:55 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41546 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727584AbfFROIz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 10:08:55 -0400
Received: by mail-lf1-f65.google.com with SMTP id 136so9386016lfa.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2019 07:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LQM/TAVB7gNprmQOImN/wuvcZWDoXAv+yuV+vnTA770=;
        b=NTBPKAS/kWr9mL3Z6nJhvLHa0F0mA5gd6KF2Domn2BNGkEWyvIdsixGmaJ6g+Sg9mi
         YuO0e/355jCffocPCwv8y8JUVTTBCjG8X6/T8N2f0mw9f1v+Lf/EQq5dD9tzbm+gBxUY
         I0oYS7T125GWW18tP25U3AQ49x2StcQbL9jWOsF6DWWsaQ0wKOda8Fa9d5t05uXrghUN
         t6rcEUXJ65Rox+UUzD5eQ/HQ4lBxQiHpkOZf/bbMw+OWApFXIJ54gfh54g9E83elkeUx
         4ksd7muGs27S+P9PyylImkE/ePq1TMUIb9CbAlgrcOv4S/iWff00YtQpxrwY0VrmAucf
         zXBQ==
X-Gm-Message-State: APjAAAVGJBqD+1yFssEKt5XgzagjhxR+ESms2WDVIvRiOIsez/dYjirT
        4/w9VMIwNI7hrW3pmgDrGt+ES7DcupZyqRd1+8SsyJ8Z
X-Google-Smtp-Source: APXvYqz1u0Js3N4iKOY/8taoSONb5DavBufpz+O6YvG0n/Gx2kSW5+D8YAcKI067BmaiyDK+pDzaaCtvNQy10e+BXFc=
X-Received: by 2002:ac2:5467:: with SMTP id e7mr35185080lfn.23.1560866933199;
 Tue, 18 Jun 2019 07:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <156076300266.5827.16345352064689583105.sendpatchset@octo> <156076301133.5827.18087893489480810339.sendpatchset@octo>
In-Reply-To: <156076301133.5827.18087893489480810339.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Jun 2019 16:08:40 +0200
Message-ID: <CAMuHMdXrDMuhOSuFNYmAxX+vZWWL3GqKKsz6OiBkpeGrgg_ZTg@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: Update CMT1 DT compat strings on r8a7740
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Mon, Jun 17, 2019 at 11:16 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Update the r8a7740 to use the CMT1 DT compat string documented in:
> [PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740
>
> The "renesas,cmt-48" portion is left as-is to avoid breakage until the CMT
> driver has been updated to make use of the new DT compat strings.

Hence wouldn't it be better to update the driver first, and the DTS in
the next release, so you can remove the "renesas,cmt-48" portion with
the single DTS update?

This is how it was done for R-Car Gen2:

v4.15 has commit 83c79a6d8d7f4821 ("clocksource/drivers/sh_cmt: Support
separate R-Car Gen2 CMT0/1"),
v4.16 has commit bf50e0ab4f5062bb ("ARM: dts: r8a7791: Update CMT compat
strings").

> --- 0001/arch/arm/boot/dts/r8a7740.dtsi
> +++ work/arch/arm/boot/dts/r8a7740.dtsi 2019-06-17 14:21:14.647792561 +0900
> @@ -83,7 +83,7 @@
>         };
>
>         cmt1: timer@e6138000 {
> -               compatible = "renesas,cmt-48-r8a7740", "renesas,cmt-48";
> +               compatible = "renesas,r8a7740-cmt1", "renesas,cmt-48";
>                 reg = <0xe6138000 0x170>;
>                 interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
>                 clocks = <&mstp3_clks R8A7740_CLK_CMT1>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
