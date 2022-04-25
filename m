Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAF6F50E5DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 18:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241924AbiDYQdM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 12:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234388AbiDYQdL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 12:33:11 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF2E637B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 09:30:07 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id kq17so7543631ejb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 09:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EU4QiPP93gBlWOe2hApZIvBdZh/GzN6+GSAbqnd1hoQ=;
        b=k5UcG9yzd5C+t8pNBeRZNZogRTEGnCU1O8cr+kn04NtswKGSVst089clW2lDdh3uv5
         GvcwBnd4xXtZF8qs7sMp+8fI7hYbSZLvrtqd1zSajKS1Iw9rYRbCFrl9kRJNyZqS80Ff
         BvElCMS8mnpGNoXYmURPCLc3ZuD2ZGZ0Qpmf1YHkr0m/316f1QrUnETqHSDbrzlYY4Sj
         PncIvjdhTbqZ8ZrIngf8ZXLXQl4jJobTLzG57bpwuy22JVp50H0g1NBzHacHcfqBDErc
         CWMsGuQp1TwyskeXq/j29vtBgEbX+/Mnsgu9+zGWb4X9dRqfAMXp48Oj0rPPwxtKpYJz
         gA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EU4QiPP93gBlWOe2hApZIvBdZh/GzN6+GSAbqnd1hoQ=;
        b=YbF8iHZCfqhUFdKctP26hcczZcBcKfmzTI94xGLJl5X5dyBikODz4V454UtamrcJZ5
         /m6oNFPnIiPV1Wc3ylf2S4Stkh6cuIh/RuZhsbzUjPnKuRucaX6VoGf6Efx/es9h2tJR
         0nArxBs2jz6DRSGEYdi2cFU7dQYw92kMZ15tWVTYR44v23l/58V+w0wpLNx7z6DHAce0
         5s8u9j4ubaubV6laoYT80dQbwUkp2ck4siOqQBKurspPszZM4BoSAwXOn+BvKH2PHczw
         BnZMJ3pArTw/Bxq8lxyXy6fj7L7bm9Ql4jgbthMR1zc+twdoq8Mem4wHbvA/2PVzqMqI
         jggg==
X-Gm-Message-State: AOAM530jlEMxeaWV9XmNB0/GP/0cPCcmmQfuZY3lPVkscxQGtUQatsv8
        PIUIoixDrI1JRKjXQkBo3g69Kw==
X-Google-Smtp-Source: ABdhPJyb7RSeWvgIu/XMZI6hViaDXKdRVhUABAMdlPkExjnMZkDVSCxU0agCcrztfH45qOGSOqpnBg==
X-Received: by 2002:a17:906:730c:b0:6f0:f69:b2e with SMTP id di12-20020a170906730c00b006f00f690b2emr16867495ejc.276.1650904205504;
        Mon, 25 Apr 2022 09:30:05 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s27-20020a50ab1b000000b00425e8a3a7a0sm1589979edc.10.2022.04.25.09.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 09:30:05 -0700 (PDT)
Message-ID: <d3fbb3cf-19e2-a2ad-1976-f9687150a866@linaro.org>
Date:   Mon, 25 Apr 2022 18:30:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Fix external clk node
 names
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220423140658.145000-1-biju.das.jz@bp.renesas.com>
 <f9c6e5e2-c819-d309-0c11-b87deb772858@linaro.org>
 <OS0PR01MB5922CFACC8FEC6D67E6BFC4986F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220968EBDF76A16F7E63A386F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <7bd2ae6d-c55f-4ab7-0c98-72da0d5d4050@linaro.org>
 <OS0PR01MB5922619EE8816DA1676BAB4D86F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ddf78c65-7cac-04cf-9f8d-e19335815473@linaro.org>
 <OS0PR01MB59222BF5C0D4749C8AAFC57F86F89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <886fda10-fad9-83c4-10f1-1ae36cf0a6b0@linaro.org>
 <OS0PR01MB5922AB6D16AB716FECAA140786F89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB5922AB6D16AB716FECAA140786F89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 25/04/2022 18:26, Biju Das wrote:
>>
>> What do you mean "ok"? I said "clk-[0-9]", so "clk-0", "clk-1", "clk-2"
>> and so on. No specific prefix.
> 
> Ah ok.
> 
> As you mentioned above "generic part is "clk". You add specific audio/audio-X prefix
> or suffix"
> 
> So based on that, I thought "clk" is generic part and "-1-audio" as suffix, "clk-1-audio" 
> should be acceptable.
> 
> For eg:- If I plan to match the label name with the hardware manual(audio_clk1),

Labels are not restricted (except using [a-z0-9_], no dashes), so it is
perfectly fine.

> 
> then, as per the discussion we have, the node names should be
> 
> either
> 
> "audio_clk1: clk-0"
> 
> or 
> 
> "audio_clk1: clk-1"
> 
> Or
> 
> "audio_clk1: audio1-clk"
> 
> Correct?

Yes, correct.

Best regards,
Krzysztof
