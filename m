Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 636E878EFEC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 17:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238261AbjHaPFC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 11:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237536AbjHaPFB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 11:05:01 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 528F4CC5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 08:04:58 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5921a962adfso10687717b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 08:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693494297; x=1694099097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDRxjQPpz+OLGtgS+biR1C24yp+2T8OZXtT3aT6FDD0=;
        b=jUMtWFpv4KevogKg1dc/t9B1ZgpzeCV2LfePm9hHxY06aTuzyFHM7FbMeW8LEtTqNh
         NFVGzYroPXgLIlF8vEDHtHPt3xf9T5j59EQIYYJZ8qwwWkphltxr/I05HgO4F3VffaIB
         c0zVf2rbYQIzBsHjfpOqM4jRon5ubqx5cghinez9qPwmReCYcSlrgf+w5rKrADss8phC
         A6pfMwuF10gTJJK6RlzhB9fX1eWyn6EOp+WA/QnPws1rbWr7J8M/rAZZexIFMT7wfEqy
         yYkLbBOO2f6JOnNuHobSP+n6cdfLhOZw5w9TWRqEH67itLM/dbMHJ02nJkil1Umyhl4h
         mZQQ==
X-Gm-Message-State: AOJu0YxjyfhtPuYYrR+zUmQ5zV3WNZYswNhH/EjvYUrRDKqzeoliPKr9
        EHSskn0DiVh0UZSLB74O6WMv4DYtSUimUA==
X-Google-Smtp-Source: AGHT+IHe7IgDTK/hIN/Bs4Gk5B34IvBBXdU1hPM5EofZBse/Fi/8E1tNPCLnNVKCAzXsMG7NEZ46bQ==
X-Received: by 2002:a81:8882:0:b0:579:e318:4c01 with SMTP id y124-20020a818882000000b00579e3184c01mr5496430ywf.19.1693494297408;
        Thu, 31 Aug 2023 08:04:57 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id e9-20020a81dd09000000b0058d4eaa6fe0sm461566ywn.52.2023.08.31.08.04.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 08:04:57 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d746ea563f9so670387276.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 08:04:57 -0700 (PDT)
X-Received: by 2002:a25:2448:0:b0:d43:51b3:b5d5 with SMTP id
 k69-20020a252448000000b00d4351b3b5d5mr89487ybk.0.1693494295630; Thu, 31 Aug
 2023 08:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230828041434.2747699-1-yoshihiro.shimoda.uh@renesas.com> <20230828041434.2747699-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230828041434.2747699-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Aug 2023 17:04:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrrwwY=8bySDVYc9jD9zdKbeNytDVUSm7vci6LN=g6Qg@mail.gmail.com>
Message-ID: <CAMuHMdWrrwwY=8bySDVYc9jD9zdKbeNytDVUSm7vci6LN=g6Qg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a779f0: Add PCIe Host and
 Endpoint nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
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

On Mon, Aug 28, 2023 at 6:14 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add PCIe Host and Endpoint nodes for R-Car S4-8 (R8A779F0).
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -262,6 +262,20 @@ extalr_clk: extalr {
>                 clock-frequency = <0>;
>         };
>
> +       pcie0_clkref: pcie0_clkref {

Please no underscores in node names.

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
> +       pcie1_clkref: pcie1_clkref {

Likewise.

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by the board */
> +               clock-frequency = <0>;
> +       };
> +
>         pmu_a55 {
>                 compatible = "arm,cortex-a55-pmu";
>                 interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> @@ -726,6 +740,120 @@ hscif3: serial@e66a0000 {
>                         status = "disabled";
>                 };
>
> +               pciec0: pcie@e65d0000 {
> +                       compatible = "renesas,r8a779f0-pcie",
> +                                    "renesas,rcar-gen4-pcie";
> +                       reg = <0 0xe65d0000 0 0x1000>, <0 0xe65d2000 0 0x0800>,
> +                             <0 0xe65d3000 0 0x2000>, <0 0xe65d5000 0 0x1200>,
> +                             <0 0xe65d6200 0 0x1100>, <0 0xfe000000 0 0x400000>;

Shouldn't that 0x1100 be 0x0e00, like in the EP nodes?
And missing <0 0xe65d7000 0 0x1100> for "phy"?

> +                       reg-names = "dbi", "dbi2", "atu", "dma", "app", "config";

Same comments for the other instance.

The rest LGTM, modulo my comments on the bindings.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
