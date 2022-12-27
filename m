Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9BE6568B2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Dec 2022 10:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiL0JG4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Dec 2022 04:06:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbiL0JGw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2022 04:06:52 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7219AEA7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:06:50 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bf43so18814384lfb.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2022 01:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wgi2g1n+nHbhC11kGT7UTTZnfTwUqhX8cOYNVdVe7V4=;
        b=ClgKJTw7Bl1MJuZRI2HiZuLxT12iHsCqWSjsVVeX3rxiZs1D/Gn9scVdPi+/1yPL1R
         1WrifslyTd0mTUXpqEgdVpAlvre9OhKExBdsih4pp36ofbQplLhQ/+sC09j+WY/dsLo8
         ziglLCPyVN+HzBm0v+CyXJJcH6WIN8eQLO+W+3hJtz6oWkWvyLsuq/CQtBZSnMfApMJg
         l3zofTkWFudPF7ee8VCQHnlzFjVRVWkWN7OvQx/kw0fTCTMieS1jCgboKO7gtWWSaXLs
         LXQ1wAOxVdrVAg9p64mlvxixNn5dPOf+9b4b+Okmb9jTjy8pdc/pbVpq03bun23rFKmy
         ZgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wgi2g1n+nHbhC11kGT7UTTZnfTwUqhX8cOYNVdVe7V4=;
        b=h8pg3rQL5rjo9MxpTYGzDtEhbHjpKzwx/e9TmW2QQzhPqsvW1bpAdPz4Ty9OI67fp1
         Oig8fSlxxh8npK65c5Ov+i+WloCJ0sLDLaOqD2L/WLVqMkaTtar7qdxyIY8mjZqF58qK
         Lv6rvrdlil0ubIPplqAF4kjaWtUzJE0YSOyvcDhRJTJDgePmM7ir8Rg23uO9z9wSE81Z
         dYRMXscp65ku5ZLf+b4DCdaQ2hEh5/WDkJnhuuB8I89Op5HpTcQd7UH3/zMMbaygl6xD
         v+DC9P/muGrlmsfQ3/jZ5xiH66FhZ8rtE3wH+7kWILyRqotEMsBv25hVBsFQRVW/Ykpr
         6gdw==
X-Gm-Message-State: AFqh2kqCJgd968/0/VPky3dZZITYo8aRYf6O0jmxRX0yiAtFUjbUWOe0
        WM8Tds0AzFbttJys+AXWVIAOMQ==
X-Google-Smtp-Source: AMrXdXu1DnHOT4QXJVWjYcj4KtoF8psUezFfIbrl97/RFTeb/sMUQipRBAEYDiflVCFEvtZSvjhcVw==
X-Received: by 2002:a05:6512:169e:b0:4ca:fa2d:2686 with SMTP id bu30-20020a056512169e00b004cafa2d2686mr3993709lfb.35.1672132008806;
        Tue, 27 Dec 2022 01:06:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z5-20020ac24f85000000b004b5480edf67sm2162766lfs.36.2022.12.27.01.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 01:06:48 -0800 (PST)
Message-ID: <2d62f33e-69d4-064c-f226-2d38396f0e9e@linaro.org>
Date:   Tue, 27 Dec 2022 10:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/6] memory: renesas-rpc-if: Rebind fixes and misc
 cleanups
Content-Language: en-US
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <cover.1669213027.git.geert+renesas@glider.be>
 <167213158107.15520.15699943919910529014.b4-ty@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167213158107.15520.15699943919910529014.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27/12/2022 09:59, Krzysztof Kozlowski wrote:
> On Wed, 23 Nov 2022 15:41:16 +0100, Geert Uytterhoeven wrote:
>> 	Hi all,
>>
>> The Renesas RPC-IF provides either HyperFlash or SPI host access.
>> To handle this, three drivers are used:
>>   1. The RPC-IF core diver,
>>   2. An HyperFlash child driver,
>>   3. An SPI child driver.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/6] memory: renesas-rpc-if: Split-off private data from struct rpcif
>       https://git.kernel.org/krzk/linux-mem-ctrl/c/f8fa9cb3fb16e06514fec0bac58996015dedc453

Missing checkpatch. I corrected now:
WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1>
("<title line>")' - ie: 'Fixes: ca7d8b980b67 ("memory: add Renesas
RPC-IF driver")'


Best regards,
Krzysztof

