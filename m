Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50366B077D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 13:56:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjCHM4H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 07:56:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjCHM4G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 07:56:06 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01340BCFF7
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Mar 2023 04:56:03 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id a25so65547789edb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Mar 2023 04:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678280162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eaR/SA+UceOTyufqjd1/4bE/BZPQViNAygBLV+332Q4=;
        b=joGvqmF2u9yP4fCQ2Uld2VR/S7mCOtcrM0jb2S9FQLe/CJByQzXzJdejxt0qC/FFeC
         wYXz3wMilpPBMerxYQf5H7d+wJMbzoVrCVi4jESMKlAc95yb3etb7Y5BoYAsAA1DtaQM
         L3zk7c6GUIr1+eQSmQL0NSiLKdUbL/FqGRsH2NfWSePOv6hNKdTN0Ki3wID0Y4TxhYbV
         IyHt8aE+tDWcV/c0hG2qVALZeMowMcmZnBT+gCPLKabfKNRHOlLt4stKQ3vsWV/iCHJ9
         K+cDevLAAi0GifOo0i+qZ/tUp3YXpwDNx/7lLe8SpOAtb3ASz+AYtSbF1B/xF55dB9E6
         llEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678280162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eaR/SA+UceOTyufqjd1/4bE/BZPQViNAygBLV+332Q4=;
        b=6OjzowJyr2xlrX2CiNWc4XB4K7dGkuVq8hzdjGQGRuweLPQ774o2wHhA1tOaqqYAcP
         CLIP3Y2daL0+hcJg+YkAtpsYvPtgrOczcSBKcAc6XjCtKu2vUPRd1ISyY8S18gYcwOzd
         cyg3yVd7g+scTDo15qdgx2E2fxgvrTascPkc0dj0vI92n8/0QV8N9+Dc0V0mfHbxqozK
         fwx2DIRrHPPwDkiBe+0E0Ipb/PWwNLjzC7gCRhld9oSiYKRoA2qyPBZxSMf49+mGCufu
         4GNK/dzHPRv1N7lEwHYv1PMC0C0St5lP6uyp3LtSxCO/7M0AXlgJfbXzarDxZYeFbAN9
         2vYA==
X-Gm-Message-State: AO0yUKVQ7aP12yaGviXmEfPanjtrQIG/aZ30Z4LaVQbL4hWGAHw7d4zm
        ddsz6z4Sy8wm233pNuzQ21D/7A==
X-Google-Smtp-Source: AK7set/sfnfP8xhBHfYHy1tm5WTrxeeLr+UNebeDtn6ltiN53PvOdWYlg1MOQZK/P91Rx25G88R1dQ==
X-Received: by 2002:a05:6402:1347:b0:4ab:1c69:5c4 with SMTP id y7-20020a056402134700b004ab1c6905c4mr16987658edw.26.1678280162508;
        Wed, 08 Mar 2023 04:56:02 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id o22-20020a509b16000000b004c4eed3fe20sm8173378edi.5.2023.03.08.04.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 04:56:01 -0800 (PST)
Message-ID: <874569b0-3d5f-7971-f05f-176aaa7a63ce@linaro.org>
Date:   Wed, 8 Mar 2023 13:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a07g044: Use SoC specific
 macro for CPG and RESET
Content-Language: en-US
To:     Prabhakar <prabhakar.csengg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230131223529.11905-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230131223529.11905-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230131223529.11905-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 31/01/2023 23:35, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Use a SoC specific macro for CPG and RESET so that we can re-use the
> RZ/G2L SoC DTSI for RZ/V2L SoC by just updating the SoC specific macro.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> * No change
> ---
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 254 +++++++++++----------
>  1 file changed, 129 insertions(+), 125 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> index 487536696d90..80b2332798d9 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -1,12 +1,16 @@
>  // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  /*
> - * Device Tree Source for the RZ/G2L and RZ/G2LC common SoC parts
> + * Device Tree Source for the RZ/G2L, RZ/G2LC and RZ/V2L common SoC parts
>   *
>   * Copyright (C) 2021 Renesas Electronics Corp.
>   */
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +#ifndef SOC_CPG_PREFIX
>  #include <dt-bindings/clock/r9a07g044-cpg.h>
> +#define SOC_CPG_PREFIX(X)	R9A07G044_ ## X
> +#endif
>  

I don't oppose it, but since I was asked on IRC about opinion, let me
share my feelings also here:

This patch #1 makes git grep difficult, reading code also a bit more
tricky. It's opposite of readability. The patchset obfuscates which
clocks will be used on r9a07g054 (so patch #2, the one which includes
other DTSI). To figure this out, I need to decode the macro for in one
file and  then open second file... but the prefix is also defined there!
Same constant in two places. So order of inclusion also matters?
Confusing code.

If the IDs and clocks are the same, maybe the constants/names in headers
should be unified?

Best regards,
Krzysztof

