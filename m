Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA5B66420B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jan 2023 14:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbjAJNhs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Jan 2023 08:37:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238678AbjAJNhg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 08:37:36 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A77078EBE;
        Tue, 10 Jan 2023 05:37:23 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6DC3A82131;
        Tue, 10 Jan 2023 14:37:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673357841;
        bh=rUVOc1Q4f6dBa/+fbkNkdb4Z9kVHm2qXq/WuCCffHes=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=dxIZ1slJfL9uSyO8lIMLEWHNcKsCsJgMsisW+98tqzSLJQnKamtTmVt+r9iihkQ7Q
         h2CBXiy8zSWx0f+G+nvyNJQlr9m7iEocRzTsE85P0tDsVraBNfqmJALWKg1zvFfvJw
         rvXO3czNH8J67xcPm8Li1Ax9yag8KLWk+VJBpnwe3IIjy24bKLR9PLvhp9NnaVJILx
         /3QEq/nGS8uK/SUbAZqfwin/4jRLNYDv29nCS5ys9tQ/WMtQfumHVQXoK7Hy4a5Cop
         7xlSRPGZgoyfZ6Vrpsspk6Rqq6N5lnxAvDJCGC65BKG2A/dHxkFnGE0BRogJVLdZUZ
         thFImh/RPanoA==
Message-ID: <a2fd6077-a5ae-a694-3637-e83ca044da69@denx.de>
Date:   Tue, 10 Jan 2023 14:37:19 +0100
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
 <20230110100003.370917-3-alexander.stein@ew.tq-group.com>
 <54e39604-088d-da4e-2779-4a635995db17@denx.de> <3216146.44csPzL39Z@steina-w>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <3216146.44csPzL39Z@steina-w>
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

On 1/10/23 14:22, Alexander Stein wrote:
> Hi Marek,

Hi,

> thanks for your feedback.
> 
> Am Dienstag, 10. Januar 2023, 11:31:49 CET schrieb Marek Vasut:
>> On 1/10/23 11:00, Alexander Stein wrote:
>>
>> [...]
>>
>>>    static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
>>>    {
>>>    
>>>    	struct i2c_client *client = rs9->client;
>>>
>>> +	u8 dif = rs9_calc_dif(rs9, idx);
>>>
>>>    	unsigned char name[5] = "DIF0";
>>>    	struct device_node *np;
>>>    	int ret;
>>>    	u32 sr;
>>>    	
>>>    	/* Set defaults */
>>>
>>> -	rs9->clk_dif_sr &= ~RS9_REG_SR_DIF_MASK(idx);
>>
>> Are you sure this line ^ should be dropped ?
>> Shouldn't the bitfield be cleared first and modified second?
> 
> Well, I had in my mind that this function is called upon probe with clk_dif_sr
> being cleared anyway, so this does essentially nothing. And the DIF bit is set
> unconditionally, so what is the point of masking it before?

Good point, but then, what's the point of ORRing either ? Just do a 
plain assignment.
