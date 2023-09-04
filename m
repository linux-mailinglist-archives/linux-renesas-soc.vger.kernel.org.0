Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7B3A7913DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Sep 2023 10:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbjIDIse convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Sep 2023 04:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjIDIse (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Sep 2023 04:48:34 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52160127
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Sep 2023 01:48:31 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-590685a3be5so11594247b3.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Sep 2023 01:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693817310; x=1694422110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Khc3tS3wG7RxTjRQcnk5Mh95LpFe1+/yTsF/Eg/GTkc=;
        b=KGguPyFDYtrXF35/JsKyhxd1ahgCyyxvMLraO2kk6KiKdJFalbOQfEb/8PAcy5wDt0
         9jj0X+LVkpRRF8IUoNAIu+XBLUthccOuuciR7HQtCfI5h8bCs8EY4a3PWuII7XwZFalQ
         DwGQHJnXYgrGIdNTd9xElkJpRu9qIyxWVvRh0oEqVPKet6GsmpwIukc590BPMyv50J04
         Hb8e8cabXSA64zl9COpRoc2soTDzYzShUqjMlMYYawoyCSC8S51xj7VRpF1hOj8yTZrd
         fCGvZMUPSWN8JzKCdvZFFkjfbKGNqfW518nlp+r0sS6xsYUTN6WA9CbI6GZosxb6bMVN
         vxBQ==
X-Gm-Message-State: AOJu0YwjAhORCu8GTeYlUT0ToMWwaezgscb9OvaHLQCBA4H9lbXGRPyz
        8kfFJjX64BiJGp4UsyBSAmx6ODcdC9uj3A==
X-Google-Smtp-Source: AGHT+IH+3qm/bGVe+QyQAVqjbIEJ0Q5E7BbAM6d3kRFxDvk1s9PxGeTR1kz4/dwLpuqPoJGxwAtscA==
X-Received: by 2002:a0d:cc42:0:b0:58f:a369:fb4e with SMTP id o63-20020a0dcc42000000b0058fa369fb4emr9779304ywd.21.1693817310332;
        Mon, 04 Sep 2023 01:48:30 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id s9-20020a817709000000b005927a79333esm2516517ywc.28.2023.09.04.01.48.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 01:48:30 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d7bbaa8efa7so1058825276.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Sep 2023 01:48:30 -0700 (PDT)
X-Received: by 2002:a25:778b:0:b0:d77:8080:530c with SMTP id
 s133-20020a25778b000000b00d778080530cmr9467087ybc.61.1693817309866; Mon, 04
 Sep 2023 01:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230901132730.2861451-1-yoshihiro.shimoda.uh@renesas.com> <20230901132730.2861451-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230901132730.2861451-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Sep 2023 10:48:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXsx3zN1UhF4twJGyaj+LDunV+c=FkCTQ7nhoqtLdeLGg@mail.gmail.com>
Message-ID: <CAMuHMdXsx3zN1UhF4twJGyaj+LDunV+c=FkCTQ7nhoqtLdeLGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r8a779f0: Add PCIe Host and
 Endpoint nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     geert+renesas@glider.be, magnus.damm@gmail.com,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Sep 1, 2023 at 3:27 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add PCIe Host and Endpoint nodes for R-Car S4-8 (R8A779F0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -711,6 +725,124 @@ hscif3: serial@e66a0000 {
>                         status = "disabled";
>                 };
>
> +               pciec0: pcie@e65d0000 {
> +                       compatible = "renesas,r8a779f0-pcie",
> +                                    "renesas,rcar-gen4-pcie";
> +                       reg = <0 0xe65d0000 0 0x1000>, <0 0xe65d2000 0 0x0800>,
> +                             <0 0xe65d3000 0 0x2000>, <0 0xe65d5000 0 0x1200>,
> +                             <0 0xe65d6200 0 0x1100>, <0 0xe65d7000 0 0x0400>,

s/0x1100/0x0e00/

> +                             <0 0xfe000000 0 0x400000>;
> +                       reg-names = "dbi", "dbi2", "atu", "dma", "app", "phy", "config";
> +                       interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "msi", "dma", "sft_ce", "app";
> +                       clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>;
> +                       clock-names = "core", "ref";
> +                       power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 624>;
> +                       reset-names = "pwr";
> +                       max-link-speed = <4>;
> +                       num-lanes = <2>;
> +                       #address-cells = <3>;
> +                       #size-cells = <2>;
> +                       bus-range = <0x00 0xff>;
> +                       device_type = "pci";
> +                       ranges = <0x82000000 0 0x30000000 0 0x30000000 0 0x10000000>;

The binding example has one extra line, and uses 0x02000000 instead
of 0x82000000.

Which one is correct/complete?

> +                       dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;

My comments above apply to the other channel, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
