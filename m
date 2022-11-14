Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07348628606
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 17:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236609AbiKNQvk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 11:51:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238082AbiKNQvV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 11:51:21 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D0B9317C7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 08:51:07 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id a29so20240739lfj.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 08:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDefeFOW+fjlJ4uGNcUgwly22kaxUqvW0JzM0upSvxo=;
        b=r4MppkcU0QYGwv20P5KS50okZi9kRvIohxqMTuhCU4vWZG61tPs/9DZc8cQlWPbDv1
         FBBHUpn/h79LVc5TMD+UHZIyucBWuQJZjdkTUdsTF5TDl4SB96uCkEXNir6foH09+K7D
         sxSalJVMThPrDWqaVB8/KyZXGLb4vo8ZLkpm4d9R1NLPGs3aRHgFXbdkPOaV2r/XpHIq
         2B98EbXuiLoxKrhZLI16hHeI9CV3Db1sE630xmkm3mHZBHrIe9/gyeQNfZtcJnXK7cUj
         9r4uEVH8jXRZlwIg+XhUcdj3sgVzEfCPOFuDWM4ZpJJo6cpHDHlLKpKe3U2B4LVZqlNN
         NSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDefeFOW+fjlJ4uGNcUgwly22kaxUqvW0JzM0upSvxo=;
        b=t4Wdk9ezTEyYdRhKJ6l3DsGfvcWLmlz9Yl0qsWY2PgmxlQMb1jOF28yD0gjGWsMMQ5
         wv+Zzuo8O8n/i5tg1ADVhCGKrizTLh3nsoRrLtWGPttGJL/tZgfVShV+bFXCOdrRuaib
         9YBmOtRa/GMMS99z2hEX6gWkawgUMP0dTO2qk1JqoTypdo2Z/ZsJ7/S4SFcwyLiFQZvc
         oE6XO1cyhP04hz7Lo5VYN1ou+sVCysc8hUE/Hc4PyMqUwXSM75leZoJ7Ecjd030NyWmq
         sM5CbeWqhEw7piGBSbEXPx6xGIcH+TPefQyCR33+QIqDqMmDtATGoLKCJ1MwQq0AAk4a
         YB0Q==
X-Gm-Message-State: ANoB5pmbl94ZWJ6lcUdrq81dZnMn9wiafe0hsoxRzaUVPuZrMfN/klS3
        g/jIDcnAAVp9uBRPey5PFuVb9w==
X-Google-Smtp-Source: AA0mqf4nBo7CZmb6pOqZhj+G0BAY0ykcwrUx9j7DLuu0rHgU4YKuk9gqHTELt1CB/C0l4OEVtjkT/Q==
X-Received: by 2002:ac2:5ccb:0:b0:4a2:4f74:f47c with SMTP id f11-20020ac25ccb000000b004a24f74f47cmr4173672lfq.367.1668444665569;
        Mon, 14 Nov 2022 08:51:05 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y20-20020ac24214000000b004b384ae61absm1881087lfh.198.2022.11.14.08.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 08:51:05 -0800 (PST)
Message-ID: <a3e5d695-535e-8587-6ccc-4c65fbeba278@linaro.org>
Date:   Mon, 14 Nov 2022 17:51:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-2-biju.das.jz@bp.renesas.com>
 <ae35fd75-64d3-3ab9-8cc0-3cbcc9c34b78@linaro.org>
 <OS0PR01MB59229179DE3D3D00C4963F3186009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a7bbfdd1-1abd-2ee5-1d32-47d0bcb7e1f2@linaro.org>
 <OS0PR01MB5922863B8EC8DF54D8E881FE86009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922C8A590502C8820B05A7186059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <839d9740-e814-897e-d484-ded3d531a97a@linaro.org>
 <OS0PR01MB59226FC7CA88208AB5C0AED586059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB59226FC7CA88208AB5C0AED586059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 14/11/2022 17:44, Biju Das wrote:
>>>>> If the hardware manual said this is called "foo-whatever-name" or
>>>>> "rz85736dfnx2", you would use it as well?
>>>>>
>>>>> Node names should be generic.
>>>
>>> I got the following feedback from LSI team.
>>>
>>> *The reason why we use "configuration" and not "controller" is the
>>> possibility that users might take it to mean "control" of system
>>> operation (product operation). This unit determines how the whole LSI
>> configure to operate LSI, so we use "configuration" for this IP name.
>>>
>>> As per this it is not a controller. It is a Configuration IP.
>>>
>>> What should be generic node name for system configuration IP?
>>
>> Then it's closer to chipid and should be in hwinfo?
> 
> You mean, sys: hwinfo@a3f03000 instead of sys: system-configuration@a3f03000 ??

Rather be put in hwinfo directory. Typical name is "chipid", but I don't
know if your device is a chipid.

> 
> Also the same IP block is present on rz/v2ma as well?
> 
> Shall I use the same file renesas,rzv2m-sys.yaml for both r9a09g011-sys and r9a09g055-sys?
> 
>>
>> Anyway, you wrote in bindings description: "performs system control", so what
>> can I say?
> 
> SYS functional description is as follows.
> 
> The SYS controls the overall configuration of the chip, such as

Exactly, it controls, so it is a controller... Anyway, do not introduce
your own names, but use something generic. There is no single reference
of "system-configuration".

> 
> ● Bank address settings for DMAC
> ● Bank address settings of the units for ICB> ● ETHER AxCACHE[1] (C bit) control function
> ● RAMA initialization control
> ● MD[7:0] pin monitoring
> ● LSI version register
> ● General-purpose 32-bit readable/writable registers
> ● Observability counting stop control for ICB
> ● WDT counter stop control
> ● Reading of the temperature sensor reference value
> 


Best regards,
Krzysztof

