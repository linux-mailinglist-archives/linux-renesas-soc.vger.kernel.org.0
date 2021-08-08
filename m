Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0313E3BD0
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Aug 2021 19:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbhHHRHC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Aug 2021 13:07:02 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:26040 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232123AbhHHRHB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Aug 2021 13:07:01 -0400
Received: from [192.168.1.18] ([90.126.253.178])
        by mwinf5d75 with ME
        id f56W250073riaq20356WZB; Sun, 08 Aug 2021 19:06:40 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 08 Aug 2021 19:06:40 +0200
X-ME-IP: 90.126.253.178
Subject: Re: [PATCH v4 2/3] drivers/soc/renesas: Prefer memcpy over strcpy
To:     Bernd Petrovitsch <bernd@petrovitsch.priv.at>,
        Len Baker <len.baker@gmx.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        David Laight <David.Laight@ACULAB.COM>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-hardening@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210808125012.4715-1-len.baker@gmx.com>
 <20210808125012.4715-3-len.baker@gmx.com>
 <39485c0e-511c-50a0-83be-f9ce6fc47e67@petrovitsch.priv.at>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <c33adb9e-9604-3d89-5a5b-152eb03e5b54@wanadoo.fr>
Date:   Sun, 8 Aug 2021 19:06:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <39485c0e-511c-50a0-83be-f9ce6fc47e67@petrovitsch.priv.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

Le 08/08/2021 à 17:35, Bernd Petrovitsch a écrit :
> Hi all!
> 
> On 08/08/2021 14:50, Len Baker wrote:
>> strcpy() performs no bounds checking on the destination buffer. This
>> could result in linear overflows beyond the end of the buffer, leading
>> to all kinds of misbehaviors. So, use memcpy() as a safe replacement.
>>
>> This is a previous step in the path to remove the strcpy() function
>> entirely from the kernel.
>>
>> Signed-off-by: Len Baker <len.baker@gmx.com>
>> ---
>>   drivers/soc/renesas/r8a779a0-sysc.c | 6 ++++--
>>   drivers/soc/renesas/rcar-sysc.c     | 6 ++++--
>>   2 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/renesas/r8a779a0-sysc.c b/drivers/soc/renesas/r8a779a0-sysc.c
>> index d464ffa1be33..7410b9fa9846 100644
>> --- a/drivers/soc/renesas/r8a779a0-sysc.c
>> +++ b/drivers/soc/renesas/r8a779a0-sysc.c
>> @@ -404,19 +404,21 @@ static int __init r8a779a0_sysc_pd_init(void)
>>   	for (i = 0; i < info->num_areas; i++) {
>>   		const struct r8a779a0_sysc_area *area = &info->areas[i];
>>   		struct r8a779a0_sysc_pd *pd;
>> +		size_t n;
>>
>>   		if (!area->name) {
>>   			/* Skip NULLified area */
>>   			continue;
>>   		}
>>
>> -		pd = kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
>> +		n = strlen(area->name) + 1;
>> +		pd = kzalloc(sizeof(*pd) + n, GFP_KERNEL);
> Zeroing the allocated bytes is not needed since it's completly
> overwritten with the strcpy()/memcpy().

The strcpy()/memcpy() only overwrites the pd->name field, not the whole 
pd structure.
I think that it is needed to keep the kzalloc.

Just my 2c,
CJ

>>   		if (!pd) {
>>   			error = -ENOMEM;
>>   			goto out_put;
>>   		}
>>
>> -		strcpy(pd->name, area->name);
>> +		memcpy(pd->name, area->name, n);
>>   		pd->genpd.name = pd->name;
>>   		pd->pdr = area->pdr;
>>   		pd->flags = area->flags;
> 
> And similar for the second hunk.
> 
> MfG,
> 	Bernd
> 

