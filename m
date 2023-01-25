Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E81B67B548
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 15:59:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235492AbjAYO7w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 09:59:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbjAYO7s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 09:59:48 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CE655B2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 06:59:47 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id jr19so14890048qtb.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 06:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YNNRww7OOpx/e8/akxNovA/Y1N/UKYhMvZuI2Y0SnM=;
        b=UZ5Y1L8n5/TUodqcHZ16XTIxjWw+kJjFkDcGVCeW271+uJyT/AWTIJuZl1HgPKrpB4
         8ikK8rUnO4v27zb8qqLoy3aU29iQo5RF3YPANzdd0+g90kYx7+LjK7u91NuIPCg1NNlI
         U4UqpRColgteXgRpVMiuhZVCRBPYp03BEwXBLhomSR3Q/FUnqOtIJxoSAEbBBuTK7LSD
         H1klRoxWzCtZh0gOfg6hmomJRNl+iB5lwKzTZdK5dmI5SQhHl5uQxEswGJNbZQABe/4T
         ZiOa8IEeIKV2Wy0jFmkJqSLW7cGkfSfhki4YJ1pR+c6cQoounNI5gCGauRTSC9euD+Zw
         KQ0A==
X-Gm-Message-State: AO0yUKVISK3hIxvrvxRCBEDMRKkWp6MdLnv0sJjuJm6vH6FPlrdP+F+z
        Dzsr/mV2ckXiPrYVBmgiZ6ZZXfo97h4tYQ==
X-Google-Smtp-Source: AK7set+fPgXB9B6q5P5nPe6C/imzEDIJCv141R31F+waOJAxuanwGTJVivanu38WWE7EqAxQQH7ASg==
X-Received: by 2002:a05:622a:1001:b0:3b0:6b21:c188 with SMTP id d1-20020a05622a100100b003b06b21c188mr4769815qte.17.1674658786860;
        Wed, 25 Jan 2023 06:59:46 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id o17-20020ac841d1000000b003a5c6ad428asm3382163qtm.92.2023.01.25.06.59.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 06:59:46 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id t16so18641461ybk.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Jan 2023 06:59:46 -0800 (PST)
X-Received: by 2002:a25:37d4:0:b0:80b:8602:f3fe with SMTP id
 e203-20020a2537d4000000b0080b8602f3femr629693yba.36.1674658786178; Wed, 25
 Jan 2023 06:59:46 -0800 (PST)
MIME-Version: 1.0
References: <20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com> <20230123013448.1250991-4-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230123013448.1250991-4-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Jan 2023 15:59:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVM_iCBsHs-zTMQQQsTo1qDh7x2oMAtytzcQFjB740wJA@mail.gmail.com>
Message-ID: <CAMuHMdVM_iCBsHs-zTMQQQsTo1qDh7x2oMAtytzcQFjB740wJA@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r8a779g0: Add IPMMU nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Jan 23, 2023 at 2:38 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add IPMMU nodes for r8a779g0.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -1162,6 +1162,115 @@ dmac1: dma-controller@e7351000 {
>                         dma-channels = <16>;
>                 };
>
> +               ipmmu_rt0: iommu@ee480000 {
> +                       compatible = "renesas,ipmmu-r8a779g0",
> +                                    "renesas,rcar-gen4-ipmmu-vmsa";
> +                       reg = <0 0xee480000 0 0x20000>;
> +                       renesas,ipmmu-main = <&ipmmu_mm 4>;
> +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       #iommu-cells = <1>;
> +               };
> +
> +               ipmmu_rt1: iommu@ee4c0000 {
> +                       compatible = "renesas,ipmmu-r8a779g0",
> +                                    "renesas,rcar-gen4-ipmmu-vmsa";
> +                       reg = <0 0xee4c0000 0 0x20000>;
> +                       renesas,ipmmu-main = <&ipmmu_mm 5>;
> +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       #iommu-cells = <1>;
> +               };
> +
> +               ipmmu_ds0: iommu@eed00000 {
> +                       compatible = "renesas,ipmmu-r8a779g0",
> +                                    "renesas,rcar-gen4-ipmmu-vmsa";
> +                       reg = <0 0xeed00000 0 0x20000>;
> +                       renesas,ipmmu-main = <&ipmmu_mm 6>;
> +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       #iommu-cells = <1>;
> +               };
> +
> +               ipmmu_hsc: iommu@eed40000 {

ipmmu_hc?

> +                       compatible = "renesas,ipmmu-r8a779g0",
> +                                    "renesas,rcar-gen4-ipmmu-vmsa";
> +                       reg = <0 0xeed40000 0 0x20000>;
> +                       renesas,ipmmu-main = <&ipmmu_mm 7>;
> +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       #iommu-cells = <1>;
> +               };
> +
> +               ipmmu_ir: iommu@eed80000 {
> +                       compatible = "renesas,ipmmu-r8a779g0",
> +                                    "renesas,rcar-gen4-ipmmu-vmsa";
> +                       reg = <0 0xeed80000 0 0x20000>;
> +                       renesas,ipmmu-main = <&ipmmu_mm 3>;
> +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       #iommu-cells = <1>;
> +               };
> +
> +               ipmmu_vc0: iommu@eedc0000 {

ipmmu_vc?

> +                       compatible = "renesas,ipmmu-r8a779g0",
> +                                    "renesas,rcar-gen4-ipmmu-vmsa";
> +                       reg = <0 0xeedc0000 0 0x20000>;
> +                       renesas,ipmmu-main = <&ipmmu_mm 2>;
> +                       power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +                       #iommu-cells = <1>;
> +               };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
