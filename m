Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC64639D52
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Nov 2022 22:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiK0Ver (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 27 Nov 2022 16:34:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiK0Veq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 27 Nov 2022 16:34:46 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49623B7D3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Nov 2022 13:34:45 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id bn5so11149470ljb.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Nov 2022 13:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yCU9BCLUUaECqX+PIeXUH6Htfb80scvZnidybbOysXQ=;
        b=uHNBMIP/zYAVzMPTB1lRizMM4XQ0yrES90O2uOSez+0j/g0Nbhq2FReybTyYILjefd
         FOBEqCo1dxf3oKzMScCCvCe/MrI1/ZYqUMHldv7PKXsiXmpFZnXqx/LpD3SCE71iVnjS
         0uQy7Fe+RpoFIhuZGaEiTilW8KQDtqbnWDizB8YxgyACssOjx/j+yZs/gdPkJLfWGQUI
         H6t38/dfyZFqQUMW1Z0EBr9r/p4Is3XuI+89uWUWZhAYhEGWn9fcnChXqRyvhAchgAUv
         XeQyvggKrAluy6vO//0dD8SJSHftdloxNKsuD4oOWRUrTC0BEc8pR7Cj9ClYXSswFg61
         LjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yCU9BCLUUaECqX+PIeXUH6Htfb80scvZnidybbOysXQ=;
        b=LhsIBP703Mi5PsMaSa10/aSMW+1g7TEDLb1XesVN2cdyk7mRH/OndrG18UaW/e/9YP
         IZSbWLXQ/pOqZGRmaFPPOO0XctIN8tqUgCl6rbzOHLyaqIBCDiZ0S26wwYY/wTjZLSGi
         TfDtKMokMN9DAbyfrb7ELI8F3gmfX8h2v5oSflidFcuQtaeWgr/VJv15IULvvppuBVPU
         +7GyABFRRH/68nPI+olCvzrhZtR/vcUTNHa+vUMg098jrbn0Lc0cHPgJGYFPYiMKK5mC
         JhoR/3CLkktP6gJsf2LlU1Q45Er04t3RJHU0unznz6fC4VS9YHcO2zlOZX372ZUZH8iY
         syjw==
X-Gm-Message-State: ANoB5pn39P1ePKLuYJ2/j2n9CeRBKW7W46aW+Sd7Jfbxsgv+XarCujw9
        9NR04l09TdOtKa48geEgNKPJ1w==
X-Google-Smtp-Source: AA0mqf7aev59tmIt/2yL9DLH7XUeWxuyVD2nSDqFjvIEXdBc0sQ2S0AEaYnOn1Ur8GpRvzmap7OtVQ==
X-Received: by 2002:a2e:bf09:0:b0:279:6c82:3e9a with SMTP id c9-20020a2ebf09000000b002796c823e9amr8477502ljr.97.1669584883536;
        Sun, 27 Nov 2022 13:34:43 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d26-20020a19385a000000b00498f3ebffb2sm1419537lfj.25.2022.11.27.13.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 13:34:43 -0800 (PST)
Message-ID: <a75b604c-a671-d2c5-7160-74dcb8a4fa2e@linaro.org>
Date:   Sun, 27 Nov 2022 22:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 0/6] memory: renesas-rpc-if: Rebind fixes and misc
 cleanups
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Mark Brown <broonie@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1669213027.git.geert+renesas@glider.be>
 <b500e42c-f782-79c6-70ce-650e4ea32c54@linaro.org>
In-Reply-To: <b500e42c-f782-79c6-70ce-650e4ea32c54@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27/11/2022 22:31, Krzysztof Kozlowski wrote:
> On 23/11/2022 15:41, Geert Uytterhoeven wrote:
>> 	Hi all,
>>
>> The Renesas RPC-IF provides either HyperFlash or SPI host access.
>> To handle this, three drivers are used:
>>   1. The RPC-IF core diver,
>>   2. An HyperFlash child driver,
>>   3. An SPI child driver.
>>
> 
> Thank you for the patch.
> It is too late in the cycle for me to pick it up. I will take it after
> the merge window.

Optionally, if you want to push it via Renesas SoC tree and there are no
conflicts with existing two patches, then these look good:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Otherwise, I'll pick them up after the merge window.

Best regards,
Krzysztof

