Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5077BE2BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Oct 2023 16:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234088AbjJIO2Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Oct 2023 10:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234554AbjJIO2X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2023 10:28:23 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E1EB9
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Oct 2023 07:28:21 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40666aa674fso43488485e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Oct 2023 07:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696861700; x=1697466500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jaxTCWdqEwpHMFZ/k9l1kxgISLFvaRHznpUGV5E8oyw=;
        b=Vy4M/QWXJiOwlz6JXkFrbc8xxY/jLo94dld8sK0D6VX/YU8Arj5cPKBqPs9kFtPZcf
         5bcYG/MKW9fejO2wrDWWrHsKujY0wuslqRth7WT+1QlabWIsfYmYRnITdBiHU2enIw3E
         q2FQJpBBHZbxDjvtku6kiCBqBUrbfvZpW5BdTmdk7d6PA/wA2Iz86ARurxmIqJuoIecE
         +0kUlfuAHZqDjbxykrnUyMfxWzQobAte1lx8Y9UJhZhyk/Tb3CYiAGQKr4Rw0XHiwSDT
         r5iVjmWl2/j0ynifwwin3+eE/YmkE4tAlliEKALtA3ZODa9UX9eix7fbpjvGR03ZiXnV
         Lx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696861700; x=1697466500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jaxTCWdqEwpHMFZ/k9l1kxgISLFvaRHznpUGV5E8oyw=;
        b=ciGdIiV/QeZ74HpO5LOpVUtCcyyjXctN9NV4qhLj5ZVdD6ZfIr0J5PdnIpknh+l/Y9
         MFZl4IhCfXfqlyGSzxNGzsdrJeYROX8ZNhrsFS0tt6U04g3tRGKwYBQojUEiWiY6iftm
         itEkPK5ChWU8Q95uw0ztpZ1g0g7pSI63Uqm9X8yGDq6jt9HiN0shskAGdRFjFOQX+yxZ
         ifZiP3M6H2tWMWHmZfF6+TgvbxdmrzboiDMnX1sTyfdiTldCXC3C63ks9rmoZJY+L42W
         xMEP0aGd/5QnvDJZOmsY+9HjQazXB/k1O8F8ozUNHDCE7RTcTTsIzoHIqvbuMMnpfC7V
         6/qQ==
X-Gm-Message-State: AOJu0YwS0cE766fMORRJyG598RarK3JD7IiKFCR5s3yzMzl047p52OaO
        j4+oMrKkajuhx1s9MovKp/h9hg==
X-Google-Smtp-Source: AGHT+IHPx2g19dEJyQjEKpONxssLueazSgV9mC0ZnOd2rJWMa5sbVjl2Lz6+EQkU+2CdW/whY50bsw==
X-Received: by 2002:a1c:6a18:0:b0:401:eb0:a974 with SMTP id f24-20020a1c6a18000000b004010eb0a974mr13345124wmc.3.1696861699960;
        Mon, 09 Oct 2023 07:28:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:88ad:b7c0:92ba:cace? ([2a05:6e02:1041:c10:88ad:b7c0:92ba:cace])
        by smtp.googlemail.com with ESMTPSA id i9-20020a5d4389000000b0031ad5fb5a0fsm9814573wrq.58.2023.10.09.07.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 07:28:18 -0700 (PDT)
Message-ID: <eb5bea56-6ad8-4617-a9cf-d4226fd45c56@linaro.org>
Date:   Mon, 9 Oct 2023 16:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add RZ/G2UL MTU3a support
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230727081848.100834-1-biju.das.jz@bp.renesas.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230727081848.100834-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27/07/2023 10:18, Biju Das wrote:
> This patch series aims to add MTU3a support for RZ/G2UL SMARC EVK.
> Also it fixes overflow/underflow interrupt names.
> 
> v2->v3:
>   * Dropped patch#4, as it accepted for 6.5 fixes.
>   * Moved patch#2 to patch#1 as it is fixes patch.
>   * Added Rb tag from Geert for patch#1 and patch#3.
>   * Updated the link to lore for Closes tag for patch#2.
>   * Documented RZ/Five SoC as the same IP used in RZ/G2UL SoC.
> 
> v1->v2:
>   * Added Ack tags from Conor Dooley for binding patches
>   * Updated commit description RZ/G2UL->RZ/{G2UL,Five} for patch#5.
>   * Fixed build error reported by kernel test robot by replacing
>     GIC_SPI x ->SOC_PERIPHERAL_IRQ(x) for patch#5.
> 
> Biju Das (5):
>    dt-bindings: timer: renesas,rz-mtu3: Fix overflow/underflow interrupt
>      names
>    dt-bindings: timer: renesas,rz-mtu3: Improve documentation
>    dt-bindings: timer: renesas,rz-mtu3: Document RZ/{G2UL,Five} SoCs
>    arm64: dts: renesas: r9a07g043: Add MTU3a node
>    arm64: dts: renesas: rzg2ul-smarc: Add support for enabling MTU3
> 
>   .../bindings/timer/renesas,rz-mtu3.yaml       | 67 +++++++++---------
>   arch/arm64/boot/dts/renesas/r9a07g043.dtsi    | 70 +++++++++++++++++++
>   .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 11 +++
>   .../dts/renesas/rzg2ul-smarc-pinfunction.dtsi |  6 ++
>   arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi | 13 ++++
>   5 files changed, 134 insertions(+), 33 deletions(-)
> 

patches 1,2 and 3 applied

Thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

