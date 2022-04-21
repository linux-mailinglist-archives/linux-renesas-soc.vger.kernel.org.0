Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2823750999C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Apr 2022 09:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386081AbiDUHoO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Apr 2022 03:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234668AbiDUHoM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Apr 2022 03:44:12 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8E213E11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 00:41:23 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id p18so207947edr.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Apr 2022 00:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Uv7cPKaUArzIITMcA4aXXtgjHbTkK+doRZ3K15+Bmlo=;
        b=hEOdozmXH3eaNDgD/oRHrc2xyadazXOIopE1mPkGfP/inUNms8Ac/2w3hzc+Hm2+Gb
         UW1MyqxUquuMBdVIvhOlWnWkIO1GEM8aq3Ga9z8Xva98irEa8LF3oyHdOG96CZSuPyXB
         KrMO/j/R6XMDFH928uvnZcUeQmmrKqXEaUzSy1QpC1dkdbP7YyiDNB6zmFr7klSD8Nw8
         fjY17XZ8Bo05L5vz2b5OTZM1xm/j9djH7SNudYUvYhq5k3ULBC4CQA3H6fhMW12HLe82
         llX7Kq4oQ76RO9rJGwAVydNvDSpPtR+RKWV71petPg314S6+d1qFLn+eNE/fTttsBzAX
         iz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Uv7cPKaUArzIITMcA4aXXtgjHbTkK+doRZ3K15+Bmlo=;
        b=BllrSX4DVjRx+SU78kOk/YEu2ZH4AeGYrGTEhC9AeIP55zxd7eZ+rmxL3qrtNOq4wv
         1S6bPzp6+sWEqLxFpDuR392ag5ZF5wIPj6KQF2a9CMfYWXvZpdFjenrx1lON2ohxN5OF
         W9pgTBo1Iu24emqOoUdxRyROSB1JDqLPkMilvjqHnug6k8Zw8Sz0+h203d1rtz2hu6Rl
         VklyErMYHZESQ6E2RFdrVDNX3aMvv/z8WEFf+ubIZwMZ6xBU5g5hZqqsGQ5CfWWozzhi
         kIhIIrspNsfYOj5Jy4Jt8NyXJW097gekpXa8yU/C3Ixu8pw86fxZ3hjwYNEuVZjvmGzH
         hLxw==
X-Gm-Message-State: AOAM5328/ygZ9gxVo0dE9S4rD0AlqHcv654SRPvsqI+VmCBr4dvRQSmL
        Ft+xnzajkzCZ1lD9vxtcLQ5Z6A==
X-Google-Smtp-Source: ABdhPJyDSIJPWtDreUktJgwGwA4rnrToJQn+4WMfPlbwKSwdvhGWyc6rjslk3+RKyhdEolriw4H+lw==
X-Received: by 2002:a05:6402:1148:b0:413:11e0:1f58 with SMTP id g8-20020a056402114800b0041311e01f58mr27030007edw.113.1650526882501;
        Thu, 21 Apr 2022 00:41:22 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q2-20020a056402032200b00423d4516387sm7633157edw.75.2022.04.21.00.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 00:41:21 -0700 (PDT)
Message-ID: <e5dabb07-eb0f-539d-12da-784ef0096e34@linaro.org>
Date:   Thu, 21 Apr 2022 09:41:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 02/15] dt-bindings: arm: renesas: Document Renesas White
 Hawk boards
Content-Language: en-US
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420084255.375700-3-yoshihiro.shimoda.uh@renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220420084255.375700-3-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 20/04/2022 10:42, Yoshihiro Shimoda wrote:
> Add device tree bindings documentation for Renesas R-Car V4H
> White Hawk CPU and BreakOut boards.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

Squash it with your previous patch, please. Documenting just SoC and
immediately later the board compatibles is too big split.


Best regards,
Krzysztof
