Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5AA28EE12
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Oct 2020 10:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730097AbgJOIAT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Oct 2020 04:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730017AbgJOIAS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Oct 2020 04:00:18 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616B8C061755;
        Thu, 15 Oct 2020 01:00:18 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y16so2204709ljk.1;
        Thu, 15 Oct 2020 01:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GUVIS48kKC77t6jdyKn+dopbQ3M+OKPCuFIPcBhR+JQ=;
        b=hVkVVKlLJkN++hWJjnX0kB1YjbwdlZ0wrANRJYtos+YK+WY/SjuSXp16Yc9lZXxJGg
         sCxk2hqv3CKRHdwdhWKR8EuRskRkTZLvpd4HDOPpX3QhGoii4qLQd/urXY8SKbeNE3c+
         gNlxxtCVz/LI8HfLzF5000foCgYUzXg7V3MZKgXjGoterj/7CC6Fmx/8ZYJEBVVDL5eu
         0zzNl37ReibfFfKtsWxdhfyDwhjhHMU6QJNkFUYX2RU+5Khbb5TFoKWSYcsb7c8XV6kI
         0axxs7Vr0Y2rygjGx4GWa5dMMmT/XgRPOZjFaCfB7wn2zTjL33mPUIeoXR8ekyFOS9Pb
         UdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GUVIS48kKC77t6jdyKn+dopbQ3M+OKPCuFIPcBhR+JQ=;
        b=khrq6ufMmzXO6A0bcS/I0Bm2zDkjuGDVLWPhqcmaeRMgntpMIcTmc6q9rC0oI23PKo
         lbtyzbuzUYPRN+nmHp5slFHDzm0Rx8A6UgpS72xCU2SHiucepKHuV0LL6xao0EqRXZlh
         k/BaW07YVN0v4PSnZ39qtHfWue4E3x4r3zoq87RI4LBsogAQp5EeUXmbLhW/QxhdkiXO
         uTPnKv7xHvVfpqW6DsdW7y1EHWUsHHZ4VxR6mdIAVbx8rlAVExRqisYxsnnCQTfKTwcP
         pMAyChqIRqbfYUyOTdRwcMLP3Jka9oQsQ56noNod5JLQpa4d3k7ORMJxeowuVPdfrSt6
         aKrw==
X-Gm-Message-State: AOAM5305E82aeA4hKOlYORdzcPMyQF+DlSOni2/5RhktVnzHUzuJyhhQ
        oh6Xh7R+T5Wbi4448eCptHUsUt3YQXA=
X-Google-Smtp-Source: ABdhPJyIzjfsdNejKPFGyjiqpOzC39VHDLtOeAqzzwQA5isFxKvYAwVyNkj4gVtUcc8BN8cMCN06OQ==
X-Received: by 2002:a05:651c:96:: with SMTP id 22mr818458ljq.76.1602748816698;
        Thu, 15 Oct 2020 01:00:16 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:46ee:db0d:fce7:c400:51d0:be7a? ([2a00:1fa0:46ee:db0d:fce7:c400:51d0:be7a])
        by smtp.gmail.com with ESMTPSA id u14sm741288lfr.119.2020.10.15.01.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2020 01:00:16 -0700 (PDT)
Subject: Re: [PATCH 4/6] clk: renesas: r8a779a0: Add VIN[00-31] clocks
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org
References: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
 <20201014094443.11070-5-jacopo+renesas@jmondi.org>
 <0de062e4-0385-444b-1abc-881c313a6479@gmail.com>
 <20201015093227.y3n5ohzuydg2fe3t@uno.localdomain>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <f75c5be2-ef40-bd08-dc0b-b025045b15d4@gmail.com>
Date:   Thu, 15 Oct 2020 11:00:04 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201015093227.y3n5ohzuydg2fe3t@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 15.10.2020 12:32, Jacopo Mondi wrote:

[...]
>>> Add clock definitions of the VIN instances for R-Car V3U.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>>
>>> ---
>>> Clocks at indexes 730 and 731 are named 'vin0' and 'vin1'.
>>> I assumed it's a typographic error and renamed them 'vin00' and 'vin01'
>>> ---
>>>   drivers/clk/renesas/r8a779a0-cpg-mssr.c | 32 +++++++++++++++++++++++++
>>>   1 file changed, 32 insertions(+)
>>>
>>> diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
>>> index bd54a28c50ee..2a00eb82013f 100644
>>> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
>>> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
>>> @@ -149,6 +149,38 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
>>>   	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
>>>   	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
>>>   	DEF_MOD("scif4",	705,	R8A779A0_CLK_S1D8),
>>> +	DEF_MOD("vin00",	730,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin01",	731,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin02",	800,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin03",	801,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin04",	802,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin05",	803,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin06",	804,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin07",	805,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin10",	806,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin11",	807,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin12",	808,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin13",	809,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin14",	810,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin15",	811,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin16",	812,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin17",	813,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin20",	814,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin21",	815,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin22",	816,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin23",	817,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin24",	818,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin25",	819,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin26",	820,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin27",	821,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin30",	822,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin31",	823,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin32",	824,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin33",	825,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin34",	826,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin35",	827,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin36",	828,	R8A779A0_CLK_S1D1),
>>> +	DEF_MOD("vin37",	829,	R8A779A0_CLK_S1D1),
> 
> There are 32 VIN instances (hence the [0-31] in the subject), grouped
> in 4 units of 8 channels each.
> 
> I can drop the [0-31] in the subject if it's confusing.

    Please do. :-)

>>     The subject says VIN[0-31]?
>>
>> [...]

MBR, Sergei
