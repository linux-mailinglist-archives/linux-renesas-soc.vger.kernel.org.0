Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCEB664269
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 14:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238046AbjAJNvu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 08:51:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238613AbjAJNvh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 08:51:37 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABB67CBCC;
        Tue, 10 Jan 2023 05:51:28 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 81E0282131;
        Tue, 10 Jan 2023 14:51:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673358686;
        bh=MZyci7iDloBlmWMi0pKgA4nJCRC2UFKYpgBdOZ4XGkg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=qIr392BdZJA/Z1P75f0u7dDCIq7ZzNkYYHD3MMlbMKQE8btFGcbSiuX+KbdXhNZKv
         bhgkzsWEYeY2gJsT8CV++KkF8gR9w9kEfdqTLzuYTq49BlZ3cUUYMCys93NZuglxhz
         i2c8JkkVlSrqX3qB0Pk0oSrGXvmaEXsA3pmjevb1TWcPeFLd25dw5UVebhpaUIFgot
         NW/I0AScbgDxKnX8uDp4rEB1ltzAYvA6l+SiT7hs38ls6ImdIwozQTLi3nzNDtNQMT
         Us8QSu3c2Ckxz9xk4oyJXcYMKeK+mX2pe3cbPErXo9qTR/mnBByzH0tVQOW/RYXHlg
         Ek3h3YkThFWgg==
Message-ID: <e8c7e0de-0e6e-e523-d15b-32c1ba3d9142@denx.de>
Date:   Tue, 10 Jan 2023 14:51:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/4] clk: rs9: Support device specific dif bit
 calculation
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230110100003.370917-1-alexander.stein@ew.tq-group.com>
 <3216146.44csPzL39Z@steina-w> <a2fd6077-a5ae-a694-3637-e83ca044da69@denx.de>
 <2211925.iZASKD2KPV@steina-w>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <2211925.iZASKD2KPV@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/10/23 14:47, Alexander Stein wrote:
> Hello Marek,
> 
> Am Dienstag, 10. Januar 2023, 14:37:19 CET schrieb Marek Vasut:
>> On 1/10/23 14:22, Alexander Stein wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> thanks for your feedback.
>>>
>>> Am Dienstag, 10. Januar 2023, 11:31:49 CET schrieb Marek Vasut:
>>>> On 1/10/23 11:00, Alexander Stein wrote:
>>>>
>>>> [...]
>>>>
>>>>>     static int rs9_get_output_config(struct rs9_driver_data *rs9, int
>>>>>     idx)
>>>>>     {
>>>>>     
>>>>>     	struct i2c_client *client = rs9->client;
>>>>>
>>>>> +	u8 dif = rs9_calc_dif(rs9, idx);
>>>>>
>>>>>     	unsigned char name[5] = "DIF0";
>>>>>     	struct device_node *np;
>>>>>     	int ret;
>>>>>     	u32 sr;
>>>>>     	
>>>>>     	/* Set defaults */
>>>>>
>>>>> -	rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
>>>>
>>>> Are you sure this line ^ should be dropped ?
>>>> Shouldn't the bitfield be cleared first and modified second?
>>>
>>> Well, I had in my mind that this function is called upon probe with
>>> clk_dif_sr being cleared anyway, so this does essentially nothing. And
>>> the DIF bit is set unconditionally, so what is the point of masking it
>>> before?
>>
>> Good point, but then, what's the point of ORRing either ? Just do a
>> plain assignment.
> 
> OR-ring is necessary as this function is called for each DIF output (see idx
> parameter), so plain assignment will clear the previously set bits.

Ah, got it.

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !
