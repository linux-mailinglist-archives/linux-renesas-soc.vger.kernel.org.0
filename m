Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC39654C55A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jun 2022 12:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343985AbiFOKEJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jun 2022 06:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245283AbiFOKEI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 06:04:08 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72DBF3055F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 03:04:07 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id x75so8309062qkb.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 03:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MNfi8ID5dJI5POjGTZGCs/KS4OMEMSKb1HytXUsc2HQ=;
        b=Vl/sTUDTfFnHo88AZNoYkiQ3Shwc3LvTbFRSoXwFaFbelzU4wX9lQ5+kRF6Z7DRRHO
         I0kmBT+HkrpUBDfkCKMucxkY9oMc1zVpp6NYRfQsX9pY135VAZ4qBExyX4FPLtQddfL6
         jei7eQ5IofkGHLaU4grsyx2Joiz0FMPEoPvmkfjOK2y/bJdphl4P06wY+r8ARz1Mc8VU
         nWAEYyy5xFaD1k8UcjICxBh/t/HcpdwWm6FOgy+4yzcrsrl+Vi/swL1TQ9XLgH5QaUoq
         m+igphT2PVy7SK4HekbMMlyxmsDKBFM25+1JbQd2T+eryaBi7+mrFS+BUMVw1IowiK/c
         p67A==
X-Gm-Message-State: AOAM53026yTLf/9ecNz25dDnIZiO97Y4slMP3QIRqaaxmldqQz4dLONP
        /ki7ZFp125ByRr2e5pIPnrHRYMphwCsXIQ==
X-Google-Smtp-Source: ABdhPJzFGhO32Hc6sM+P92tZ7l75jPL+D00upfAHcBmq9/ljhqfltuxt8gQDAJ3oaHSl+UDOEZqX4g==
X-Received: by 2002:a05:620a:29d6:b0:6a7:62f9:c04b with SMTP id s22-20020a05620a29d600b006a762f9c04bmr7276284qkp.751.1655287446391;
        Wed, 15 Jun 2022 03:04:06 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006a37eb728cfsm12432158qkp.1.2022.06.15.03.04.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 03:04:06 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id k2so19630914ybj.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 03:04:06 -0700 (PDT)
X-Received: by 2002:a25:818c:0:b0:664:a584:fafd with SMTP id
 p12-20020a25818c000000b00664a584fafdmr9471284ybk.543.1655287445871; Wed, 15
 Jun 2022 03:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220530024626.1870277-1-yoshihiro.shimoda.uh@renesas.com> <20220530024626.1870277-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220530024626.1870277-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Jun 2022 12:03:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+mwbymADOLezK7F-sZzi5FgUGez0ZCFdq9bowJfuuCg@mail.gmail.com>
Message-ID: <CAMuHMdV+mwbymADOLezK7F-sZzi5FgUGez0ZCFdq9bowJfuuCg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a779f0: Add IPMMU nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, May 30, 2022 at 4:46 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add IPMMU nodes for r8a779f0.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 46 +++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> index df46fb87cffc..512e0b57fd6a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -343,6 +343,52 @@ dmac1: dma-controller@e7351000 {
>                         dma-channels = <16>;
>                 };
>
> +               ipmmu_rt0: iommu@ee480000 {
> +                       compatible = "renesas,ipmmu-r8a779f0",
> +                                    "renesas,rcar-gen4-ipmmu";

"renesas,rcar-gen4-ipmmu-vmsa"

I thought I had fixed that while applying, but that was for r8a779a0.
Will fix for good.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
