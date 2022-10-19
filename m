Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A316060460D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Oct 2022 14:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbiJSM4i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Oct 2022 08:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbiJSM4J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Oct 2022 08:56:09 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E4123EA4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Oct 2022 05:39:01 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id 8so10563871qka.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Oct 2022 05:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yztcDb/9Hhh5Rkv5M5nLE2clBrl/RANSXIwbIVDKzcg=;
        b=c6TUtOPHf/1jy2RkaZ9KZYqSJRHzD/kcZx5TA9S1o397Mrus0CeSD0Emoa46RX+OXV
         ioJWsrANMi4wmLC6peKtC788oaEqgtld0Y+FYh31c0WO/Xs+8HPJ0CG4svmVo3cQWVvZ
         +32DT1yuGfoLdmVqOca7sl4J3clcFxk2hQlRA0/yV4YlwGHaX3ZHJub0Fa1npAj65XgL
         L0TMPgHvaH0WwEDlhKFwJWyJJS1r6Dz+FibEGoGey2sOnImhL0tipecHyIXjYvHvaUG0
         riDEl7SRMowNXhYbNshwUtoPzIraCVlcwcb4WcklAhR5vSrtu96Y87JzzOrc7l/AhhTg
         gYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yztcDb/9Hhh5Rkv5M5nLE2clBrl/RANSXIwbIVDKzcg=;
        b=KOtVh7N5CwHfF32Hl+WYNkpNDAIAQ3hMDArsjnlTD+xLO6iUPkwq5EEWDOw7vjeGMT
         WG2SqhSNrnro0Gc+m7smREStgBLtbYB2VBZ28N95c5TeBbdkVj8eQ37JlvJuxUcKx6t+
         p1VyclTNreFLVOoaC/ndHq67ECRxn8VGE8iKaC0SDlbWniES+CBKy30cDsFENprDYErA
         EJze0VcpTwt2qalY+55zR8+8YVFOVsUPXBVoZOcMgK1tzQPIhsQugl+jpiP/YLWSZO/d
         8/taEsEXR9A4mCUygo0Izipk+88tgqnHrP3Me1xYto7t2Ai5LQ1TXzPP+l/fKM4nUauA
         LRvQ==
X-Gm-Message-State: ACrzQf1/T7Yft+ijLqS/iL40oILlGfYhjg0F6fQ91XKE2t9nyDA4Vixx
        VcWNs4kfPRh1oTcRVP805mTkzw==
X-Google-Smtp-Source: AMsMyM6SC40e+0JgwyPmZJo+chi9ytQvP9whxlTv+lJaJhecWJIKYPMqoLkW/vEBTOm+/nphGOcI5A==
X-Received: by 2002:a05:620a:28ce:b0:6cf:933c:40d3 with SMTP id l14-20020a05620a28ce00b006cf933c40d3mr5104264qkp.258.1666183076537;
        Wed, 19 Oct 2022 05:37:56 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id bp17-20020a05620a459100b006ce3f1af120sm4916845qkb.44.2022.10.19.05.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 05:37:56 -0700 (PDT)
Message-ID: <11d6f585-bd9f-246f-29e0-719f0551e6c9@linaro.org>
Date:   Wed, 19 Oct 2022 08:37:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4 1/3] dt-bindings: net: renesas: Document Renesas
 Ethernet Switch
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20221019083518.933070-1-yoshihiro.shimoda.uh@renesas.com>
 <20221019083518.933070-2-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221019083518.933070-2-yoshihiro.shimoda.uh@renesas.com>
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

On 19/10/2022 04:35, Yoshihiro Shimoda wrote:
> Document Renesas Etherent Switch for R-Car S4-8 (r8a779f0).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thank you for your patch. There is something to discuss/improve.

> +  ethernet-ports:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        description: Port number of ETHA (TSNA).
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^port@[0-9a-f]+$":
> +        type: object
> +        $ref: /schemas/net/ethernet-controller.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          reg:
> +            description:
> +              Port number of ETHA (TSNA).
> +
> +          phy-handle: true
> +
> +          phy-mode: true

Why do you need these two properties here? They are provided by
ethernet-controller, so I suggest to drop them.

I already commented about it in v3.

> +
> +          phys:
> +            maxItems: 1
> +            description:
> +              Phandle of an Ethernet SERDES.
> +
> +          mdio:
> +            $ref: /schemas/net/mdio.yaml#
> +            unevaluatedProperties: false
> +
> +        required:
> +          - reg
> +          - phy-handle
> +          - phy-mode
> +          - phys
> +          - mdio


Best regards,
Krzysztof

