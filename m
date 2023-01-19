Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A91C6673A6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jan 2023 14:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbjASNge (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Jan 2023 08:36:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbjASNgU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2023 08:36:20 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81840521C9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jan 2023 05:36:19 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id q8so1531658wmo.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jan 2023 05:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rWq/yizVAl7S9V3ovhWY4OsnNwxPEQxeEtQ2nHLCzTM=;
        b=wrNU5GWnr3H3PZs0TZnwnMwYLs7RV49edZQYX8aLXYI+JXQdKOizHSG8dXmZzBN00o
         tZ4oxffn+7chO5VHoAIQeXuJTOKKwCEBcD76xggxuVORvAbk7qUdK/Q5zljj22Txf8Hc
         dPFwyXvkrgLPZwcU9785swysknOCy8VLQsAGVz/RJ/gTvZSOzfWR1N0I/I46Z7KW2t2q
         l25BA3O8GwU/ctBsXouUIYzw3LvnLe/VVDMBDkCyhgt5ZvAz+nAfuF1406sorpWs4GpJ
         4vi8Jgng3X1si/0HSIolJ/lIk+7o+UmA33GARzfeWZwtm92CwJ1MQAlCX1L2vyX/rVsm
         o+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWq/yizVAl7S9V3ovhWY4OsnNwxPEQxeEtQ2nHLCzTM=;
        b=zzLMQ7wzsZLcnVU4G0QEp9UFjgoXG+5hkZ8kuGL719dXSrRrIaRsJXOo8EI+bh8uNZ
         pT8gdJgrzf3A3lspghu/zLyBFqhRbbi8oklLYyeCM7THZbNts+jUbadD0YpfSlPXWPlM
         rLzwtI+A5gSISIFUhJ2eMU1NIhMQi21EpYCvQTU7XBUUGXWkjRwm4H+ug4TSIlAMDonA
         lCGyaKW5piPfLE4XJ+VDgKhGYxopDsy1G2Gi5+kKeCpSNmeXy5N2pbGf4OXV4nbYGhRX
         fQUBiDj4LcIGP/cKY+YcwFHB7VJ1ERWw3Z2vGQe82vXBM7eGmwRcFaFPMI52vyVWZw0q
         BHnw==
X-Gm-Message-State: AFqh2koavfjSj6N6LkjdWMkFfTVWNMYsoW2wSJceCEyFmeR5HakR9ZJh
        5OnyV9zv/NiqqB00XyTHUanpiQ==
X-Google-Smtp-Source: AMrXdXsKjSmcqQHPHyH1l93tp75nCJ2mRi+NoOakU7rVj78hivbHOkzI2srayBQye1ppwblDbCeEKQ==
X-Received: by 2002:a05:600c:5386:b0:3cf:9844:7b11 with SMTP id hg6-20020a05600c538600b003cf98447b11mr10792603wmb.23.1674135378084;
        Thu, 19 Jan 2023 05:36:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d3-20020a05600c34c300b003dab77aa911sm4731569wmq.23.2023.01.19.05.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 05:36:17 -0800 (PST)
Message-ID: <760c9404-62b7-d3c9-4407-4665b1e336bb@linaro.org>
Date:   Thu, 19 Jan 2023 14:36:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH resend] dt-bindings: iommu: renesas,ipmmu-vmsa: add
 r8a779g0 support
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20230119133514.1008925-1-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230119133514.1008925-1-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 19/01/2023 14:35, Yoshihiro Shimoda wrote:
> Document the compatible values for the IPMMU-VMSA blocks in
> the Renesas R-Car V4H (R8A779G0) SoC.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

