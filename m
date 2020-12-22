Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565842E0739
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 09:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgLVIch (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 03:32:37 -0500
Received: from mail-oo1-f41.google.com ([209.85.161.41]:45398 "EHLO
        mail-oo1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgLVIch (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 03:32:37 -0500
Received: by mail-oo1-f41.google.com with SMTP id o5so2783333oop.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Dec 2020 00:32:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oGMcArsZy5KaSvWQoTWjJD5CpvFTEbbVMky0I6E13Os=;
        b=Fg3Ov0YmSre6me23d2uroOCgHADGJJQTBNPUfKa9LxNnS1c4F7h2zPlyuFA+5Jz/qI
         uWuEk6hLkWU9X7Ybz49nwoaqpUnmL9PTkFY1RmHBe3JCTyGaib5/DXxKop3SYISFJ0zU
         C3ViaSSj86V0r58pptOQ5JIQ4zYJXQ5HLXezeOY2pw8xQ0bdX3kSyopuwVA+j9y7EwAY
         G4emNmpjScJ38YxWf/LaqMTJ+S/LRPfDycxQDKjI5Wkin0DP+hPVpMng4iDWX1hsllzC
         LL8JyTGue9dKr0SRoUtHKZppf8zp5wL+CMMz2ySlE6VKDRRMMH8STqOh1xWxsoAXI5cj
         655g==
X-Gm-Message-State: AOAM532scme0BPmIsG1p/s9J68U0KBrcT3wfmdHOtMmBLiXv1cQK/v+4
        tb/LIgQ50vVjSr7elhYu5sTqWBBLRsawP/FU+KHPV7vYGIA=
X-Google-Smtp-Source: ABdhPJw2dkGszXolXBXNKiVWLms6lI1wM4lmyhYIOdB13oE4ufFRNOvnmN4019I9uuSJ29OJLSMSORnSCTewDNR7EeQ=
X-Received: by 2002:a4a:c191:: with SMTP id w17mr14315187oop.1.1608625916491;
 Tue, 22 Dec 2020 00:31:56 -0800 (PST)
MIME-Version: 1.0
References: <160856260968.18420.18181463640865928753.sendpatchset@octo>
In-Reply-To: <160856260968.18420.18181463640865928753.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 09:31:45 +0100
Message-ID: <CAMuHMdXitUvZXgfensfWo0BnFZ681MTcRRm3kvrEoOKStdt6JQ@mail.gmail.com>
Subject: Re: [PATCH] r8a77965 CMT test setup using UIO
To:     Magnus Damm <damm@opensource.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

Thanks for your patch!

On Mon, Dec 21, 2020 at 4:31 PM Magnus Damm <damm@opensource.se> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> This patch contains kernel modificatons to allow some basic testing from
> user space of the CMT0 device included on the r8a77965 SoC.
>
> Not suitable for upstream merge. No attempt has been made to turn this into
> somewhat clean code, so consider this a rough hack. The patch is a combination
> of the following:
>  - Device Tree modifications to expose CMT0 via UIO
>  - code to add UIO driver debug code
>  - adjustment for the compat string matching in MODULE_DEVICE_TABLE()
>
> As Geert kindly pointed out there might be better ways to do this.
>
> For the kernel, simply apply the kernel patch (including a few debug printouts)
> and make sure to extend your kernel config with CONFIG_UIO_PDRV_GENIRQ=y.
>
> The code in this patch is similar to earlier posted series but has been
> ported from r8a77965 to r8a77961.
>
> [PATCH 0/2] r8a77961 CMT test setup using UIO
> [PATCH 1/2] r8a77961 CMT0 device exposed via UIO
> [PATCH 2/2] UIO CMT test program
>
> The most tricky challenge was to trim down the kernel size to be able to
> boot with the old boot loader. The user space UIO test app remains the same
> as for r8a77961 and can be located in the mailing list archives.

Does the size issue go away if you load the Image at 0x60000000 and the
DTB at 0x68000000? That works for me on R-Car H3 ES1.0.

> --- 0001/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> +++ work/arch/arm64/boot/dts/renesas/r8a77965.dtsi      2020-12-21 22:20:47.036998593 +0900
> @@ -334,19 +334,6 @@
>                         reg = <0 0xe6060000 0 0x50c>;
>                 };
>
> -               cmt0: timer@e60f0000 {
> -                       compatible = "renesas,r8a77965-cmt0",
> -                                    "renesas,rcar-gen3-cmt0";
> -                       reg = <0 0xe60f0000 0 0x1004>;
> -                       interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
> -                       clocks = <&cpg CPG_MOD 303>;
> -                       clock-names = "fck";
> -                       power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> -                       resets = <&cpg 303>;
> -                       status = "disabled";
> -               };
> -
>                 cmt1: timer@e6130000 {
>                         compatible = "renesas,r8a77965-cmt1",
>                                      "renesas,rcar-gen3-cmt1";
> @@ -414,6 +401,16 @@
>                         #reset-cells = <1>;
>                 };
>
> +               cmt0: timer@e60f0000 {
> +                       compatible = "uio_pdrv_genirq";
> +                       reg = <0 0xe60f0000 0 0x1004>;
> +                       interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 303>;
> +                       clock-names = "fck";
> +                       power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
> +                       resets = <&cpg 303>;
> +               };

Why move the node?
This would be easier to review if you wouldn't move the node.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
