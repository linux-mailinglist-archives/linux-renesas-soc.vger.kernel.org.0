Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 718616775DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 08:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjAWHzp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 02:55:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjAWHzp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 02:55:45 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD62F741
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Jan 2023 23:55:44 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so9968730wmb.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Jan 2023 23:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dT78j5UOCaWZYJCpxnJWictAYXf8HkrCpdNMdQHd/CE=;
        b=cQkW8psAaHVWpbOa2/yejx5t/JpwGrl0BxOK9pa1djggsds/sFdmTewdm8oz8OPsmc
         Bo3J7XOtLQHDt9OgpXIWaojuLWU+IuXMAm4qqPRHbz3N22dNFQjPCTMYfm5aksqenB7p
         MzZEIUC6tXm169oxdV1HC9YgpUYoIf3DLj9QzLOahJVQn2MMMztPtNFemuWJ5W5PlzLK
         LvKdREb9BulGIWHdjW8YAljm0TH2jswsLqWwHJFrwUYdmWgx+Bp+FNS4esV3lbo1kK6e
         vjyhoEYMiKRWjeouPEq9SZ+kuyzx2dEocvBvfWIZgkSnZx1kJJ7qcukotMBjAp392IOT
         reag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dT78j5UOCaWZYJCpxnJWictAYXf8HkrCpdNMdQHd/CE=;
        b=KQxRuYSN5te3NCjFkdEfQXv6ehRdXN72Ip/YVjWYqVxZZ52fI00V32ZCEkZOHzEx0f
         W27++lUfu5Te1rCfcFE/NUER4jJEPxUv+0JnUlZif16AAAAClerRVquEvIhn2YLr+8Vu
         SCbRiOH5FT0hJA5kq9ZNaB4asSCpShBLIGWn5lo7FNSZEHONWkn1Bzl03mhcZLYATSJz
         Ibk2V3BM0k+9i+INrzNDZkO1LNEfw7MNiwH78gCNydPsjv9KTWFjIdCtv2XpzuToz4kJ
         rMWGpinEFfTFT1XR8ElJp2RsnLKPmbGW2FdvltkRC8W3jEaWV/pRFYAuoyBjCM/BaZ9I
         hkKQ==
X-Gm-Message-State: AFqh2koCeyMIfrpngc2kkEBeYdV9zczGaN01oZfoMUuR4u1jXl/GiXeh
        V07pzIA72kpa3kVMV6aEDYkyk+yr1IsJVwI/
X-Google-Smtp-Source: AMrXdXvgIiQjIDU7jVEscMzip4gNS+rSZWTzoHqTyAMVtWtZ3w5K3AVPbSus80KJ6jgzminRlEGIZg==
X-Received: by 2002:a1c:f607:0:b0:3d3:5027:89a4 with SMTP id w7-20020a1cf607000000b003d3502789a4mr31099798wmc.7.1674460542782;
        Sun, 22 Jan 2023 23:55:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o21-20020a05600c4fd500b003c6f8d30e40sm10942947wmq.31.2023.01.22.23.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 23:55:42 -0800 (PST)
Message-ID: <8f9d6e07-6549-9b2e-a45b-f262b59bfe5f@linaro.org>
Date:   Mon, 23 Jan 2023 08:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2] memory: renesas-rpc-if: Fix PHYCNT.STRTIM setting
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        linux-kernel@vger.kernel.org
References: <20230118104656.67706-1-wsa+renesas@sang-engineering.com>
 <fb2a6e85-42ad-8b17-4433-8d5e96c87a80@linaro.org> <Y84wDxiBE6CZqSO5@ninjato>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y84wDxiBE6CZqSO5@ninjato>
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

On 23/01/2023 07:58, Wolfram Sang wrote:
> Hi Krzysztof,
> 
>>> +static const struct soc_device_attribute rpcif_info_match[]  = {
>>> +	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &rpcif_info_r8a7795_es1 },
>>> +	{ .soc_id = "r8a7796", .revision = "ES1.*", .data = &rpcif_info_r8a7796_es1 },
>>
>> Why do you need soc match? Can't this be inferred from device
>> compatible? Maybe the device compatible is not specific enough? Devices
>> should not be interested in which SoC they are running - it does not
>> matter for them, because the device difference is in the device itself,
>> not in the SoC (different SoCs come with different devices).
> 
> I need it because of ".revision". This only applies to "ES1.*",
> there are "ES2.*" and "ES3.*" around which have the same SoC number.
> Also, there is usually no version numbering for the IP core. We need to
> use this scheme in a number of other places already, sadly.

I did not get whether this is runtime characteristics or it can be
customized with compatible (just you did not do it)?

Best regards,
Krzysztof

