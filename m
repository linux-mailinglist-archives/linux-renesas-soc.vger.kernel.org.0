Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 507ED6BAA0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Mar 2023 08:53:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbjCOHx6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Mar 2023 03:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbjCOHxm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Mar 2023 03:53:42 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3980E3668F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Mar 2023 00:53:19 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id x13so24618274edd.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Mar 2023 00:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678866798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1CCMcoXvLkpis235GxP783kPe2pJ/VsfubOnVO3b3CA=;
        b=rbvocE5SvjoBL0CvzN7gMp0FSpwRJPKqFdC9mlCqvIQIbUKt3gNUPDJUIHUvRW0rdL
         WShbM+PL8rM1tsbGGHTHPQy/f/+Oo8Rcqv9UUA4PeLHes6clbHt/EiwBMXKnw0WCIBN8
         tdYktv+3Rrz8DnSJ1G8uJNk46XIKn2FpuJGqMTW8MwOMTgl4yNhjVyZJm2RjSaXLXZam
         R3e1s+wgEvzf5XklopYavWEotDN/7W1T4n8tI/t2lIofgCIeG+hTxmH/llz+S6//TaNl
         jmqO772ZJ5DaOcb6Bk6iU1k73UAB+d/puPHjrgRlusB+VmMq2KQ8bogI9Vzh6VAQKNhh
         2zSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678866798;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1CCMcoXvLkpis235GxP783kPe2pJ/VsfubOnVO3b3CA=;
        b=N4xQ3dd//QW3ozF8ikJYjb20NAsKIkxyZ+eRbG45abZ2lJdQFGRIiCtB8Xce4enkCc
         xOO4ADsJT8PFQkbZPt448TNY/SdSLa/t10hWaiY9+oGDkZwFuAgUmAbnO6F4XKrjEG8Q
         +aYzMABnCKi3rH0vCAi8GjdphBNIBSrIpqr2j6LvsU8fDfVr2LcxXmEwuywroKtGMU/0
         eKxxKb0uVOOZcNcy7anRlh+PulPwaK5L3hLeRB+qrA589CTXOvBziGPdEDWbizDEEqK3
         QYHL91b0y4nk4l2Jt93P9Eb+T2QXGkcmHNxljyqE6+7HTBm18gDLtO21Mo30gzFKcYzW
         cCYg==
X-Gm-Message-State: AO0yUKW6FdbGOXSSufKp3rWn9RdbkGTD9CLHq/TpIac1KCftr2jd5oKp
        DIylF2+sK8xDp641LYU/e54gCQ==
X-Google-Smtp-Source: AK7set/4v4RRpToR1aRHQI+AjoXhbCoezqdXuQossTWmooKSQsFDXaSaGfC3DjHWuCMd0SKLbuffcg==
X-Received: by 2002:a17:906:f904:b0:8b1:2614:edfe with SMTP id lc4-20020a170906f90400b008b12614edfemr1222997ejb.9.1678866797767;
        Wed, 15 Mar 2023 00:53:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906138d00b008b1fc59a22esm2144975ejc.65.2023.03.15.00.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 00:53:17 -0700 (PDT)
Message-ID: <89bb07be-e11d-e248-8798-08b8531e68c7@linaro.org>
Date:   Wed, 15 Mar 2023 08:53:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: dma: rz-dmac: Document clock-names and
 reset-names
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20230315064726.22739-1-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315064726.22739-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 15/03/2023 07:47, Biju Das wrote:
> Document clock-names and reset-names properties as we have multiple
> clocks and resets.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/dma/renesas,rz-dmac.yaml   | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> index f638d3934e71..c284abc6784a 100644
> --- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> @@ -54,6 +54,11 @@ properties:
>        - description: DMA main clock
>        - description: DMA register access clock
>  
> +  clock-names:
> +    items:
> +      - const: main
> +      - const: register
> +
>    '#dma-cells':
>      const: 1
>      description:
> @@ -77,16 +82,23 @@ properties:
>        - description: Reset for DMA ARESETN reset terminal
>        - description: Reset for DMA RST_ASYNC reset terminal
>  
> +  reset-names:
> +    items:
> +      - const: arst
> +      - const: rst_async
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>    - interrupt-names
>    - clocks
> +  - clock-names
>    - '#dma-cells'
>    - dma-channels
>    - power-domains
>    - resets
> +  - reset-names

The clock and reset entries are ordered anyway, so requiring '-names' is
not really necessary.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

