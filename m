Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3E27C4C06
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Oct 2023 09:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjJKHhE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Oct 2023 03:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjJKHhD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 03:37:03 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A6BF1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2023 00:37:00 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9b27bc8b65eso1088345066b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2023 00:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1697009819; x=1697614619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8O8oPKWtl15M441He8arxID+J3pb7XNKVUDjACOuXKI=;
        b=FEIR9eJqFRNSHZeVsjXUJr8Pl1GWd2t/QK/4N/uBCbBPmhfPNLDwkjbm6ZlWjqNmyk
         P1LChBqpRjEA+aSCr/glx+VG3wcNbJeIL3jLKyJEZPgLaaL5rzH0l3lQ2ORMMoQfvFon
         Agw2/z0/CeuIrZOIjqXuKttXPV/jMQ4DQQxEmih1IE8LftvPeTA8Rl3NaFqkr8YByJbA
         ac8y3OBzmkRPUaj3qUgf+39tkNBeuid6eXXzknzUs4Oix08rGWvC0nmkFTr32cKmAbaz
         lEnAsnm3UJUAuLm0BWrH1zYHlKUPxDMj2l0TKi4LM/F7aB176uo9mldA3o3TaJnNPzal
         Akew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697009819; x=1697614619;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8O8oPKWtl15M441He8arxID+J3pb7XNKVUDjACOuXKI=;
        b=WUPLpkVyGnT/QgGaeY0lyEfHl+cKIxkkiQfdH08guB+ET0m/x6e65R5orsMg9OC6ZJ
         FvlF0Bdn0gCRvoZyA+O6tnVN0DCVokQ8WJFo6OA/KqWr9UQTdWoX3l2Rbkz1OQevv7/u
         Tkr7FMutG1oMvlUFbjE1I3t5C3a6+u2kc8EDV1sLPJwK3NygH9aWBh9itTacXWeVnPWz
         JAUsb5wPvCQOuoIhxD73mBtulFNNPa2rlKb+7Zt2YFlErUYe55r9qkddMdNvhdSPFzd6
         z1RKmVsVcrwrmw8XLJhl9bIDLd8uQnP1e4LBVvU6lYCKPKgnOAY1jQiSMGSWdG720iTT
         0zkg==
X-Gm-Message-State: AOJu0YxAUPBZRL9WYM3AeIFBV1xO9lVlFD/q0KrMyC35g/PVb2P0l5uE
        LQihIx70LLIfZtWsZbtKeVlTIg==
X-Google-Smtp-Source: AGHT+IGPCvFjW76cfmqCtl7WbzqASU2eiF1JgyrYFLGhxTxSHTcBmV91JwIVpGFTPmPJRWNoiqYilQ==
X-Received: by 2002:a17:906:100e:b0:9b3:47f:1c05 with SMTP id 14-20020a170906100e00b009b3047f1c05mr16022372ejm.64.1697009818718;
        Wed, 11 Oct 2023 00:36:58 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.152])
        by smtp.gmail.com with ESMTPSA id l7-20020a170906a40700b009ae587ce133sm9496699ejz.188.2023.10.11.00.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 00:36:58 -0700 (PDT)
Message-ID: <e1c9c2ca-144c-49fe-940c-9ca8ad40e377@tuxon.dev>
Date:   Wed, 11 Oct 2023 10:36:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: renesas: rzg2l: Use %x format specifier to print
 CLK_ON_R()
Content-Language: en-US
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231010132701.1658737-1-claudiu.beznea.uj@bp.renesas.com>
 <20231010132701.1658737-2-claudiu.beznea.uj@bp.renesas.com>
 <8226bd48-4297-0b32-c733-2e569114a934@gmail.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <8226bd48-4297-0b32-c733-2e569114a934@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi, Sergei,

On 10.10.2023 17:52, Sergei Shtylyov wrote:
> Hello!
> 
> On 10/10/23 4:26 PM, Claudiu wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Use %x format specifier to print CLK_ON_R(). This is easier when
>> debugging as the value printed will be hexadecimal like in the hardware
>> manual. Along with it "0x" has been added in front of the printed value.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  drivers/clk/renesas/rzg2l-cpg.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
>> index d62f1bc1f60e..764bd72cf059 100644
>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>> @@ -1213,7 +1213,7 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
>>  		return 0;
>>  	}
>>  
>> -	dev_dbg(dev, "CLK_ON %u/%pC %s\n", CLK_ON_R(reg), hw->clk,
>> +	dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", CLK_ON_R(reg), hw->clk,
> 
>    Perhaps "%#x" instead of "0x%x"?

Yes, better, thanks!

> 
> [...]
> 
> MBR, Sergey
