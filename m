Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35C49675C1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jan 2023 18:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjATRw6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Jan 2023 12:52:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjATRw5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 12:52:57 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 518F6917D0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jan 2023 09:52:16 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id g10so4695461wmo.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jan 2023 09:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oIkO5gx/n6pvdASc/nUcxO9v2oX9ajTXxRa/fHrC1iw=;
        b=EfH8CCMDzmm1bTRKeFTIov4kfsWe7s938mLZT9qtCqcj12h6hVJR22yPWg2ePHluSc
         FzVMs/VLuaYku5u93/kmUgo9J1m37jC8n/Xno8P0Ds2t4upKoUM9Hgrr0PZevxd/ol7C
         1qrR6Inc0z2qaBh/BS+EriD8ufJphDV/rAyb3n5hdTAoiZmKZUdvH4hDFJzj4PUAQ8c/
         bAo5ZHxjuWbyqzXKaiuyfo60cM7wqL2ftBFohSaVUtiRyvPbrzFDiIWy8DnAqGfpJBRq
         nigiIVygMg8NsZMG9pS5rvU4BrmS7XAbqTZqgwhEoBgiape/wlQ7pcd+1BR6qxzSJVAJ
         aLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIkO5gx/n6pvdASc/nUcxO9v2oX9ajTXxRa/fHrC1iw=;
        b=rgcgkNv6pZd02GuYohXtK0tamG8vjCuojqN4zVSJ0TaVmZKMnzm3AG0RuvACxA3H1e
         RBX7d8U/Erz7UDn2VmXIc7vE5KGCxqJo1krbx+J6zX5iNxcnWJqKNCsuFyGcDDXqwjvU
         nQrqc2L2ZrAL1gT15mnRdezllVkAuM2oA/ExDXo4o503uWArSoEmRNhNgtmG40bgLpUi
         faJn7y2FvhJOVkkGrBwPenV8UitVhUqj8TrdOYSI+yZEV2HkMEkA0dNR4rYZ/mNIkjeh
         /eUhU1xup8nCdHQMQ8rHFkWxbI/NRKKOFJyff6rBKm+R8rxJi14kJOHi4Zw48jpu9C/z
         CqSw==
X-Gm-Message-State: AFqh2kpqWbEWHDyDn0r17fRGhomybuw6OGOlMtS8wyOuQoBi7HRAQtC8
        rawPHPdgQSk/tKYdzE5XWSzn4NrqUOU2bsCo
X-Google-Smtp-Source: AMrXdXvPOJQ9RjAcaEge6XAGDaW53pLS+pQACmE0EPeVKjEkKdYG8JSKmiTT68N+aJStg52+K2JyEQ==
X-Received: by 2002:a05:600c:4d06:b0:3da:f0a:83d7 with SMTP id u6-20020a05600c4d0600b003da0f0a83d7mr14851108wmp.8.1674237134886;
        Fri, 20 Jan 2023 09:52:14 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d96efd09b7sm3732949wms.19.2023.01.20.09.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 09:52:14 -0800 (PST)
Message-ID: <87005399-4cef-c705-24ee-11ed49071ddc@linaro.org>
Date:   Fri, 20 Jan 2023 18:52:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] memory: renesas-rpc-if: Remove redundant division of
 dummy
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-kernel@vger.kernel.org
References: <20230112090655.43367-1-wsa+renesas@sang-engineering.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230112090655.43367-1-wsa+renesas@sang-engineering.com>
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

On 12/01/2023 10:06, Wolfram Sang wrote:
> From: Cong Dang <cong.dang.xn@renesas.com>
> 
> The dummy cycles value was wrongly calculated if dummy.buswidth > 1,
> which affects QSPI, OSPI, HyperFlash on various SoCs. We're lucky in
> Single SPI case since its dummy.buswidth equals to 1, so the result of
> the division is unchanged
> 
> This issue can be reproduced using something like the following commands
> A. QSPI mode: Mount device with jffs2 format
>     jffs2: CLEANMARKER node found at 0x00000004, not first node in block (0x00000000)
> 
> B. QSPI mode: Write data to mtd10, where mtd10 is a parition on SPI Flash
> storage, defined properly in a device tree
> 
> [Correct fragment, read from SPI Flash]
> 
>   root@v3x:~# echo "hello" > /dev/mtd10
>   root@v3x:~# hexdump -C -n100 /dev/mtd10
>   00000000  68 65 6c 6c 6f 0a ff ff  ff ff ff ff ff ff ff ff  |hello...........|
>   00000010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> 
> [Incorrect read of the same fragment: see the difference at offsets 0-3]
> 
>   root@v3x:~# echo "hello" > /dev/mtd10
>   root@v3x:~# hexdump -C -n100 /dev/mtd10
>   00000000  00 00 00 00 68 65 6c 6c  6f 0a ff ff ff ff ff ff  |....hello.......|
>   00000010  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> 
> As seen from the result, 4 NULL bytes were inserted before the test data.
> Wrong calculation in rpcif_prepare() led to miss of some dummy cycle. A
> division by bus width is redundant because it had been performed already
> in spi-rpc-if.c::rpcif_spi_mem_prepare()
> 
> Fix this by removing the redundant division.
> 
> Fixes: ca7d8b980b67 ("memory: add Renesas RPC-IF driver")
> Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Sadly, I cannot test this patch myself because I don't have access to
> hardware which uses a buswidth > 1 for the dummy read. However, from
> code review, this patch makes sense. The division by buswidth is done
> twice, once in the SPI driver and once in the RPC core. It should stay
> only in the SPI driver.

Any tests or further reviews on this? If not, I'll pick it up in few days.

Best regards,
Krzysztof

