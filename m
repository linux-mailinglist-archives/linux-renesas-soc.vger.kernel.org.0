Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C58D65D5C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jan 2023 15:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239470AbjADOfH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Jan 2023 09:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239579AbjADOfA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2023 09:35:00 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CDE6375;
        Wed,  4 Jan 2023 06:34:59 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6914F80A55;
        Wed,  4 Jan 2023 15:34:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1672842897;
        bh=4HuVOKLU1b+mRBb/Z6L2Ottg2dm66pZwd0aaoiWQq6I=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=vVWbQNI75qWY35yslf5mEpxsxCuWeaG4UPY3b9p3PFVRBE6jL06mbYLmMEb2j4bWz
         ANmt0OvYtBZd+AgQmiNKtujOeqwaRxxaESgFYWALhSOLxbuFMg9YdSM09ilhw+JjcK
         WI8tewqrudR5h56s+yMa4slCq+2KBzBMDI+/TiswmnoUMiCKuYDlAGn69kNdfFF88D
         ZpU18Mi6/ovTDPD/GxQM7gGEi5CSvHE+pPaNAPTSxHozEnO8/giRaCvSZnoFHcp0ra
         7eEkxIgUDNs69+h6n5qcThI7KDGNny4eWWy194nLjXoVEv/nqmCn81UK7Cd5tIpYSI
         V6XAE6GxYhc9g==
Message-ID: <2ba20434-8976-a971-1fee-c393c670d5f7@denx.de>
Date:   Wed, 4 Jan 2023 15:34:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/4] clk: rs9: Support device specific dif bit calculation
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230103123154.3424817-1-alexander.stein@ew.tq-group.com>
 <20230103123154.3424817-3-alexander.stein@ew.tq-group.com>
 <8e9cc8fa-cddc-3c99-9810-f2355a1e1913@denx.de> <5905764.31tnzDBltd@steina-w>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <5905764.31tnzDBltd@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/4/23 11:32, Alexander Stein wrote:
> Hi Marek,

Hi,

> Am Dienstag, 3. Januar 2023, 15:31:21 CET schrieb Marek Vasut:
>> On 1/3/23 13:31, Alexander Stein wrote:
>>> The calculation DIFx is BIT(n) +1 is only true for 9FGV0241. With
>>> additional devices this is getting more complicated.
>>> Support a base bit for the DIF calculation, currently only devices
>>> with consecutive bits are supported, e.g. the 6-channel device needs
>>> additional logic.
>>>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> ---
>>>
>>>    drivers/clk/clk-renesas-pcie.c | 29 ++++++++++++++++-------------
>>>    1 file changed, 16 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/clk/clk-renesas-pcie.c
>>> b/drivers/clk/clk-renesas-pcie.c index 0076ed8f11b0..d19b8e759eea 100644
>>> --- a/drivers/clk/clk-renesas-pcie.c
>>> +++ b/drivers/clk/clk-renesas-pcie.c
>>> @@ -18,7 +18,6 @@
>>>
>>>    #include <linux/regmap.h>
>>>    
>>>    #define RS9_REG_OE				0x0
>>>
>>> -#define RS9_REG_OE_DIF_OE(n)			BIT((n) + 1)
>>>
>>>    #define RS9_REG_SS				0x1
>>>    #define RS9_REG_SS_AMP_0V6			0x0
>>>    #define RS9_REG_SS_AMP_0V7			0x1
>>>
>>> @@ -31,9 +30,6 @@
>>>
>>>    #define RS9_REG_SS_SSC_MASK			(3 << 3)
>>>    #define RS9_REG_SS_SSC_LOCK			BIT(5)
>>>    #define RS9_REG_SR				0x2
>>>
>>> -#define RS9_REG_SR_2V0_DIF(n)			0
>>> -#define RS9_REG_SR_3V0_DIF(n)			BIT((n) + 1)
>>> -#define RS9_REG_SR_DIF_MASK(n)		BIT((n) + 1)
>>>
>>>    #define RS9_REG_REF				0x3
>>>    #define RS9_REG_REF_OE				BIT(4)
>>>    #define RS9_REG_REF_OD				BIT(5)
>>>
>>> @@ -62,6 +58,7 @@ struct rs9_chip_info {
>>>
>>>    	const enum rs9_model	model;
>>>    	unsigned int		num_clks;
>>>    	u8			did;
>>>
>>> +	u8			(*calc_dif)(int idx);
>>>
>>>    };
>>>    
>>>    struct rs9_driver_data {
>>>
>>> @@ -160,8 +157,14 @@ static const struct regmap_config rs9_regmap_config =
>>> {>
>>>    	.reg_read = rs9_regmap_i2c_read,
>>>    
>>>    };
>>>
>>> +static u8 rs9fgv0241_calc_dif(int idx)
>>> +{
>>> +	return BIT(idx) + 1;
>>
>> Can't we just do
>>
>> if (model == ...)
>>    return BIT(idx) + 1
>> else if (model == ...)
>>    return BIT(idx);
>> ...
> 
> I was tempted going this way. But I opted for a callback due to the fact that
> this driver might support 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ as well(your
> comment in the header).
> Even just considering 9FVG, 9FGV0641 has an even more complex DIF offset
> calculation.
> The mapping is
> * DIF OE0 - Bit 0
> * DIF OE1 - Bit 2
> * DIF OE2 - Bit 3
> * DIF OE3 - Bit 4
> * DIF OE4 - Bit 6
> * DIF OE5 - Bit 7
> 
> So the calucation might not fit into one line, so the readability benefit is
> gone.

You can still do

if (model == ...)
  return function1();
else if (model == ...)
  return function2();

which would work without any indirection via callback.
