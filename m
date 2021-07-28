Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41DF3D8AB6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 11:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbhG1JgT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jul 2021 05:36:19 -0400
Received: from foss.arm.com ([217.140.110.172]:53920 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231322AbhG1JgT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jul 2021 05:36:19 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B8701FB;
        Wed, 28 Jul 2021 02:36:17 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85CD53F73D;
        Wed, 28 Jul 2021 02:36:15 -0700 (PDT)
Subject: Re: [PATCH] drivers/soc: Remove all strcpy() uses in favor of
 strscpy()
To:     David Laight <David.Laight@ACULAB.COM>,
        'Geert Uytterhoeven' <geert@linux-m68k.org>,
        Len Baker <len.baker@gmx.com>
Cc:     Kees Cook <keescook@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20210725151434.7122-1-len.baker@gmx.com>
 <CAMuHMdUdmv+YmdtjGJV2Lp_Rvar4kN4uSgSTYqXX9CtCJ+qoRw@mail.gmail.com>
 <80f4574c9f6c4c6780735b0fffd83363@AcuMS.aculab.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <fa2fd44d-8cd7-b700-2e7b-d88c9c52507d@arm.com>
Date:   Wed, 28 Jul 2021 10:36:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <80f4574c9f6c4c6780735b0fffd83363@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2021-07-28 09:36, David Laight wrote:
> From: Geert Uytterhoeven
>> Sent: 26 July 2021 09:03
>>
>> Hi Len,
>>
>> On Sun, Jul 25, 2021 at 5:15 PM Len Baker <len.baker@gmx.com> wrote:
>>> strcpy() performs no bounds checking on the destination buffer. This
>>> could result in linear overflows beyond the end of the buffer, leading
>>> to all kinds of misbehaviors. The safe replacement is strscpy().
>>>
>>> Signed-off-by: Len Baker <len.baker@gmx.com>
>>
>> Thanks for your patch!
>>
>>> ---
>>> This is a task of the KSPP [1]
>>>
>>> [1] https://github.com/KSPP/linux/issues/88
>>
>> Any chance the almost one year old question in that ticket can be
>> answered?
>>
>>>   drivers/soc/renesas/rcar-sysc.c     |  6 ++++--
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> But please see my comments below...
>>
>>> --- a/drivers/soc/renesas/r8a779a0-sysc.c
>>> +++ b/drivers/soc/renesas/r8a779a0-sysc.c
>>> @@ -404,19 +404,21 @@ static int __init r8a779a0_sysc_pd_init(void)
>>>          for (i = 0; i < info->num_areas; i++) {
>>>                  const struct r8a779a0_sysc_area *area = &info->areas[i];
>>>                  struct r8a779a0_sysc_pd *pd;
>>> +               size_t area_name_size;
>>
>> I wouldn't mind a shorter name, like "n".
>>
>>>
>>>                  if (!area->name) {
>>>                          /* Skip NULLified area */
>>>                          continue;
>>>                  }
>>>
>>> -               pd = kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
>>> +               area_name_size = strlen(area->name) + 1;
>>> +               pd = kzalloc(sizeof(*pd) + area_name_size, GFP_KERNEL);
>>>                  if (!pd) {
>>>                          error = -ENOMEM;
>>>                          goto out_put;
>>>                  }
>>>
>>> -               strcpy(pd->name, area->name);
>>> +               strscpy(pd->name, area->name, area_name_size);
> 
> You can just use memcpy().

Indeed. In fact I'd go as far as saying that it might be worth teaching 
static checkers to recognise patterns that boil down to strscpy(dst, 
src, strlen(src) + 1) and flag them as suspect, because AFAICS that 
would always represent either an unnecessarily elaborate memcpy(), or 
far worse just an obfuscated strcpy().

Robin.
