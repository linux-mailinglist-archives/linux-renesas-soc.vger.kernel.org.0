Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB4B44F060E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 22:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233716AbiDBUKB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 16:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiDBUKB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 16:10:01 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E285910240E
        for <linux-renesas-soc@vger.kernel.org>; Sat,  2 Apr 2022 13:08:06 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id n35so3596623wms.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 02 Apr 2022 13:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EMQqdSoa40fVCj26FqTvVX5CrHbphOJVetZErL+JYsg=;
        b=k+C0vwqQ2WkpQk4r/wrfRONko+IrtaeBEVs7kfbzEy20BsY2OmrGhhe4ouJN/5Tz8Y
         BDVpbxz/PoM7KZ57bN/daozl6GJLXieOQmJneeTkJAgmxHKO1fdykDPdD8NYuRynuvXQ
         bkYy7gGkjh61GDv8+1LokfAry+ZrMjU6mgY4KZ2ulZ7Lc+yhB6NpukwfFMgXCBtoQimT
         eK2jlLkB1giItBIQNAgeAgT+58zoR8pfVqdLAjOzf5qupcbNoWGa1wZQj0PV3ZrkHXo9
         X7E+DGYXq1aZDFsMFRicmZnTgGZT9oCN+6QKe92suohb71YIlFWPqlf/T0EGmlQuKM97
         pjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EMQqdSoa40fVCj26FqTvVX5CrHbphOJVetZErL+JYsg=;
        b=Rb1Vhe0e+WdjHRP0xSlm8UXLNpJdV/L2U6mXXWA02VxtWUqPwvkR92zN7qemDCwhDM
         Vkia9a9DFLpUsHbYWDYx/ccm0l1q2KkMMVQXkP5c1FEdJE6dPPHKhq5+xUbY2EBfoalW
         p3IfsTn60rWAziznqx3nuOEcbyGVtiIgIFQ9N1MMe057PcVcAlvrkXZ7ZmSpp52hZhjI
         ui8Od0DvZCjI14aydpR0q+mqebiJiHay/Ez9QQLjpxlTDqxuH0yre+zHlA1dhM982fmv
         NolZ3YSzvt6BupUyKvzOWdUGdW0wxWJub5E0zOpLetgcWX7yUjubxTODioWgNGWSGuqm
         l+kQ==
X-Gm-Message-State: AOAM531JmWFuu8Mu31rminl/TOdciiOjUmsI5IC+h62UUCaMr7AD6mov
        IwpMPs94Isv7Q36zHT0zMHE1bptOp29dqyk6
X-Google-Smtp-Source: ABdhPJz4NfRr+xsKojlBGB11wNSWga6mv8nLYJJ2WJ5oDpLOFryIXyLKjFGJKH0XiPqNiEf21JjlpA==
X-Received: by 2002:a1c:cc01:0:b0:37b:dcc8:7dfd with SMTP id h1-20020a1ccc01000000b0037bdcc87dfdmr13408290wmb.134.1648930085483;
        Sat, 02 Apr 2022 13:08:05 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id v13-20020adfe28d000000b0020375f27a5asm5535428wri.4.2022.04.02.13.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 13:08:05 -0700 (PDT)
Message-ID: <6cb05255-2cfd-e941-5a7a-e15d7a00edbe@linaro.org>
Date:   Sat, 2 Apr 2022 22:08:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: Add initial DTSI for RZ/G2UL
 SoC
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220402073037.23947-1-biju.das.jz@bp.renesas.com>
 <20220402073037.23947-5-biju.das.jz@bp.renesas.com>
 <dba54e8f-b575-1835-fd30-44d9dcb09635@linaro.org>
 <OS0PR01MB5922A0675D7928834AD33BFD86E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB5922A0675D7928834AD33BFD86E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 02/04/2022 21:37, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
> Thanks for the feedback.
> 
>> Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: Add initial DTSI for
>> RZ/G2UL SoC
>>
>> On 02/04/2022 09:30, Biju Das wrote:
>>> Add initial DTSI for RZ/G2UL SoC.
>>>

(...)

>>> +	soc: soc {
>>> +		compatible = "simple-bus";
>>> +		interrupt-parent = <&gic>;
>>> +		#address-cells = <2>;
>>> +		#size-cells = <2>;
>>> +		ranges;
>>> +
>>> +		ssi0: ssi@10049c00 {
>>> +			reg = <0 0x10049c00 0 0x400>;
>>> +			#sound-dai-cells = <0>;
>>> +			/* place holder */
>>
>> Here and in other place holders - why there are no compatibles here?
> 
> These interface are not tested with mainline kernel and will be added later after testing.
> 
>> What do you hold place for
> 
> As mentioned in commit description, I will get compilation error as the carrier board shared 
> with other SoC's For eg:- RZ/G2L,RZ/G2LC and RZ/V2L.
> 

OK, thanks for explanation. It looks a bit fragile, because it means
that your rz-smarc-common.dtsi enables nodes which are not described.
Although I see the point why it's done like this, so it's fine for me.

Best regards,
Krzysztof
