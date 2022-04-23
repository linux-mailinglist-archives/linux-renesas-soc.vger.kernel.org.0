Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D415150CD10
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 Apr 2022 20:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236821AbiDWTA2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 23 Apr 2022 15:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236814AbiDWTA0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Apr 2022 15:00:26 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FF734B8E
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Apr 2022 11:57:29 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id i27so22221946ejd.9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Apr 2022 11:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0/I1Lqd6FAD3duZ+xmmPKJycik6MTwR4HUFPeaOkIwM=;
        b=QshAl1jLuzly+O5WdWGcR6Djz8uNukbP8CvWoJ1UxBL7toCaSYk0xjT2Ud9s75+5DG
         7P6s9BkMLHlTFRPHXBulJHi4AdSLusk8bDg9kZzrCOuzZuwbrN+Mjm3W7GH3u4qK3bMV
         l9OJ0kQeDuyMFzEtY68sgmTFMKCFzGJSprN7j7UZ3i++gxxgPkbGhuXTS9RxZ7ib2dQp
         6w5J98a2xXAjheiwqD0tZvyNflOZ7YCX/zHuGNlATwhpfGukPHC4vZ2DgXlVVGIIMqUE
         wlNvKEvKe7GahYnij7PALc0D69eIgWPog/5TcmDM1A2FFaJ2hX8XsKSNhKtGHfGJ8BEp
         pUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0/I1Lqd6FAD3duZ+xmmPKJycik6MTwR4HUFPeaOkIwM=;
        b=btr4OfuRIETd69AirD3QLlkSWoCLTTOO3GHLo+9+9J6oUodXutxJa2/ivkjfJA03zQ
         Mr6CYC3Wa4dl4aiGhovIuhhbbi3NbOFKbMQGyMriM2matq9Nz/ycfibzlOg3a72z/dw3
         bNivsBLZxCWSD2DbFuHjvI3a+HbmGw0FRYbSdwefhwuAx0TvWBQxdkiTRGM9A8UKz6R5
         ScZJy5VYEuGVOBkM+2hAKtxS+5k/xTnnQIebnZOepOML+qDWdLRRpb85hHsFN5ICK/z7
         xb9msJTm3d98Jznau4iWgveiCrbkddpPdXMd9eusuzUd6BE0HcFc2iMBH5r7TuIPwfrL
         bLOA==
X-Gm-Message-State: AOAM5314laGfzMUrEm+KeJw0j1hsnkBhzOW0SI1UfA/uSPSf/Wqz3RLW
        Pxl/PF2RMZKmDDxgaZn9mVxBMg==
X-Google-Smtp-Source: ABdhPJxv2VSufWS3KnWj8fOA1UatMkaO4h6P6PeGuzoylZ/Rnpo+u6tOONQ76ewNinXUigLhzSODiQ==
X-Received: by 2002:a17:907:1b09:b0:6d8:faa8:4a06 with SMTP id mp9-20020a1709071b0900b006d8faa84a06mr9303922ejc.701.1650740247702;
        Sat, 23 Apr 2022 11:57:27 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l6-20020aa7d946000000b00420bd71e06bsm2481959eds.79.2022.04.23.11.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 11:57:27 -0700 (PDT)
Message-ID: <164bbdf7-e74d-7f30-6657-6c80d2f91a97@linaro.org>
Date:   Sat, 23 Apr 2022 20:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: iio: adc: Document Renesas RZ/V2L ADC
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
References: <20220423131654.131390-1-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220423131654.131390-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 23/04/2022 15:16, Biju Das wrote:
> Document renesas RZ/V2L ADC bindings. RZ/V2L ADC is identical to RZ/G2L
> with same number of channels.
> 
> While at it remove RZ/G2LC SoC from binding documentation as it does not
> support ADC.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
