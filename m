Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D1B2EB26F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 19:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbhAESXi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 13:23:38 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:35737 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbhAESXi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 13:23:38 -0500
Received: by mail-oi1-f170.google.com with SMTP id s2so565848oij.2;
        Tue, 05 Jan 2021 10:23:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aathDSf0taZ0edUNL5Xx4ucTIs36jeAaxDeIXU4s59A=;
        b=hyFENsSXFqCKRC1Q+Tr+4QLotBvkVvZxO9chhT47tlfkb07kyxnwqV40GY3YsqgRNf
         KUaYAy6YUTJj5i2n6/K0O/UZBHz6Ii6Q6HB6z67m+EESjhvOUeeYGobjFaUvyOm0mc/y
         jNLxW/Bi5WSIIDDSTJQqW0N9JbO+bbrrl1tEnMjid5qLtPWG/FtRQ1LfpB5uJVRuCXHV
         VIA2PXyQvZq9tgcvnZ/bKiIHZwho5UoXDdWOCHeoAw6nxtSeKuM/N135tbraww6GYT/9
         hlsHTxnaJXxwX7a03LOpjXHuff3hshQPcS5U8M22CZMZr5xyfL2uv6ZoK+oAoRUc2fBi
         j+Lg==
X-Gm-Message-State: AOAM5312sPsNM0643+9om4W7kN3KrktPzxh+MMds7z6PDkghdZsF5xnD
        EBn3eo4F3pkaXDH8wSKCq06ACSJw6QI/nAjS1B0=
X-Google-Smtp-Source: ABdhPJxzpzQHV4nCmS01MovMigowUdZhWY5I5Dc1YanetkrVCGvdU6XQZA2WG8SERHbEIEVWTbXETYP37g4y8uYMesg=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr647979oia.54.1609870977807;
 Tue, 05 Jan 2021 10:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com> <20201228112715.14947-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201228112715.14947-6-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 19:22:46 +0100
Message-ID: <CAMuHMdWU3kp4P+HwZ4Mj6xSZWqT112JRYJRG7z5w06AaD9+-dw@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r8a779a0: Add HSCIF support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linh Phung <linh.phung.jy@renesas.com>,
        Wolfram Sang <wsa@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Dec 28, 2020 at 12:27 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Linh Phung <linh.phung.jy@renesas.com>
>
> Define the generic parts of the HSCIF[0-3] device nodes.
>
> Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
> [wsa: double checked & rebased]
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -313,6 +313,70 @@ i2c2: i2c@e6510000 {
>                         status = "disabled";
>                 };
>
> +               hscif0: serial@e6540000 {
> +                       compatible = "renesas,hscif-r8a779a0",
> +                                    "renesas,rcar-gen3-hscif", "renesas,hscif";
> +                       reg = <0 0xe6540000 0 0x60>;
> +                       interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 514>,
> +                                <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
> +                                <&scif_clk>;
> +                       clock-names = "fck", "brg_int", "scif_clk";
> +                       dmas = <&dmac1 0x31>, <&dmac1 0x30>;
> +                       dma-names = "tx", "rx";

It may be prudent to omit the DMA properties, until we can test DMA
operation.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
