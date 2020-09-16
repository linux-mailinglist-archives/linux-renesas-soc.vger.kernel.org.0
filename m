Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC0F26B957
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 03:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgIPB0a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 21:26:30 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:12293 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726023AbgIPB0a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 21:26:30 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 1B602DB28524526F960A;
        Wed, 16 Sep 2020 09:26:26 +0800 (CST)
Received: from [10.174.179.108] (10.174.179.108) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Wed, 16 Sep 2020 09:26:24 +0800
Subject: Re: [PATCH -next] soc: renesas: r8a779a0-sysc: Make
 r8a779a0_sysc_info static
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <20200915140110.11268-1-yuehaibing@huawei.com>
 <CAMuHMdXnuHnML3Gop4o3k_K9nYBRsc7w1cUgGcMrAso5oOKc5Q@mail.gmail.com>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <9b20d554-eb3d-918e-54ec-b1f374b24a20@huawei.com>
Date:   Wed, 16 Sep 2020 09:26:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXnuHnML3Gop4o3k_K9nYBRsc7w1cUgGcMrAso5oOKc5Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2020/9/15 23:22, Geert Uytterhoeven wrote:
> Hi Yue,
> 
> On Tue, Sep 15, 2020 at 4:58 PM YueHaibing <yuehaibing@huawei.com> wrote:
>> Fix sparse warning:
>>
>> drivers/soc/renesas/r8a779a0-sysc.c:99:33: warning: symbol 'r8a779a0_sysc_info' was not declared. Should it be static?
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> As commit 7f29315cf4211316 ("soc: renesas: r8a779a0-sysc: Add r8a779a0
> support") hasn't been merged into arm-soc yet, is it OK for you if I
> just fold your fix into the original commit?

Sure, it's ok for me.
> 
> Thanks again!
> 
>> --- a/drivers/soc/renesas/r8a779a0-sysc.c
>> +++ b/drivers/soc/renesas/r8a779a0-sysc.c
>> @@ -96,7 +96,7 @@ static struct r8a779a0_sysc_area r8a779a0_areas[] __initdata = {
>>         { "a1dsp1",     R8A779A0_PD_A1DSP1, R8A779A0_PD_A2CN1 },
>>  };
>>
>> -const struct r8a779a0_sysc_info r8a779a0_sysc_info __initconst = {
>> +static const struct r8a779a0_sysc_info r8a779a0_sysc_info __initconst = {
>>         .areas = r8a779a0_areas,
>>         .num_areas = ARRAY_SIZE(r8a779a0_areas),
>>  };
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
