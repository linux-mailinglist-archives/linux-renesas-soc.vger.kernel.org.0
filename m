Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D256A58228A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jul 2022 10:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbiG0Izu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Jul 2022 04:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbiG0Izs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 04:55:48 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90381FCFF
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Jul 2022 01:55:46 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id u17so8928481lji.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Jul 2022 01:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Vuv1p7jjxhoLf3pl6CxfEW9ySyiN1TFLLwtvwe+It3s=;
        b=niNBmcan8R/3RdUV98uGLqwl8cQhwdYhfjDVALzrojVMoplHsWb16qG1S00+uIn+pf
         dSElWqy9craRDZY9wOc/EdXgTsA8gO/vWLc2RxlSRfwmw93lmti0FRzxnkwVI4ylKUwn
         ttgTRs8hGNe4Ns89VT8CpVajbSgwRdGkFSEO4CLZJR9PB5cYk7kmLY3lv0lsVT4DMUR6
         mH7uxRx/N4+BlMPW4x32aDrjDassyGxG9yom4SwAvl1bwAha4RrD87jLSY1HqpYBs5i0
         zh5bYHWoHhqwLFT/G62/x27nKtwMpH3P5pmAgdOjS6tkmLZ6RioI2tRMJHXFdynTNVhs
         5+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Vuv1p7jjxhoLf3pl6CxfEW9ySyiN1TFLLwtvwe+It3s=;
        b=2ZMp2QEsFxOcXAbtVbblcGzXgv3mzdeoa5iU/lI48Dht9gi747AilQsXODkPHWigoQ
         dTNvJwzAcrxLoZrIJfEJb13bn1f2IR1OPYkfnRCfBeLS61YOrvIcUEk0E2AcVxHuwk94
         bnY0d5tsu59ppA07OPEH5PDoVfLaFFNvPTgcC2YmawHuLqGoWqFhCeiPWur2wPap9SjM
         4IluxP1sDANLujlgnzWzINEASOYCYDdPM0ncpfReQyNs+Lb50cRpCCalGu6GVKQxkUUr
         9htPDpFhSkoTd08mn43tMXC5bTV1weilb72GPNlgx327f3VmVK+s6Zl6XynhjpGYU1OM
         vPsg==
X-Gm-Message-State: AJIora9O8c6EtJFRS7DO723VwG9lZHqIY1q/N73WvA9+ikF4AzuhlViX
        eVMPJCjd3cqxh53tcwFj4VA5DA==
X-Google-Smtp-Source: AGRyM1vJCX1i6V7I89K+c9fYQSciskM0/PYxd1o/dkCWLnV5x+RZ4SBIluxK5iib8VSoabYYu9QhJg==
X-Received: by 2002:a2e:bd13:0:b0:246:1ff8:6da1 with SMTP id n19-20020a2ebd13000000b002461ff86da1mr7256869ljq.219.1658912144950;
        Wed, 27 Jul 2022 01:55:44 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id k1-20020ac257c1000000b0048a8e831b38sm1610754lfo.245.2022.07.27.01.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 01:55:44 -0700 (PDT)
Message-ID: <6a87ee9b-f944-ab8c-cc00-fd8bbb22cad8@linaro.org>
Date:   Wed, 27 Jul 2022 10:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>
Cc:     Anup Patel <anup@brainfault.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726180623.1668-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 26/07/2022 20:06, Lad Prabhakar wrote:
> Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> Single).
> 
> Below is the list of IP blocks added in the initial SoC DTSI which can be
> used to boot via initramfs on RZ/Five SMARC EVK:
> - AX45MP CPU
> - CPG
> - PINCTRL
> - PLIC
> - SCIF0
> - SYSC
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/boot/dts/Makefile               |   1 +
>  arch/riscv/boot/dts/renesas/r9a07g043.dtsi | 121 +++++++++++++++++++++
>  2 files changed, 122 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043.dtsi
> 
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ff174996cdfd..b0ff5fbabb0c 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -3,5 +3,6 @@ subdir-y += sifive
>  subdir-y += starfive
>  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
>  subdir-y += microchip
> +subdir-y += renesas

What are you building there? There is no DTS.

Best regards,
Krzysztof
