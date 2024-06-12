Return-Path: <linux-renesas-soc+bounces-6089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8DE90489B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 03:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AC142854CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 01:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A087FB663;
	Wed, 12 Jun 2024 01:55:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AF5A34;
	Wed, 12 Jun 2024 01:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718157300; cv=none; b=KrlQO8/6L/dBEzyXlJ5/vCvvGW2XmTi3komtKkXR0b2E+chRG+IlSI5BZnp0Ds2snlF2OWNymAVDvJ+tjG2FMuQRQoE/2t77/yAOD5DuismVSG8peygrQ5BXz09mduDei4bP6OQEterMGm8xAZqHKAh1KpGv6YLXS2ZMS+U1A5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718157300; c=relaxed/simple;
	bh=r8PY6QEOhPtRFjfjSiFU8lPQ8wJfWgLeOtd1jLIo/JA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KxqIvgxmsk0MJ40mI4xgI75LixvmiL/9Sn80yYzvLXhHL7OkcqVoR9LK1uNCU8oT0lzV9yqGf9AW2NbHPURN2sZOrdJZOq6+urXsf8qen6+sHpPxZA5gT9YloDRkJy9aKcJeTcoM2QkVs3rCF9aA3udxC0WhNaHG9wVzHNpWJlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VzT4y4fKBzmcTP;
	Wed, 12 Jun 2024 09:50:10 +0800 (CST)
Received: from dggpemd100004.china.huawei.com (unknown [7.185.36.20])
	by mail.maildlp.com (Postfix) with ESMTPS id E4FD5140EEF;
	Wed, 12 Jun 2024 09:54:53 +0800 (CST)
Received: from [10.67.109.211] (10.67.109.211) by
 dggpemd100004.china.huawei.com (7.185.36.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 12 Jun 2024 09:54:53 +0800
Message-ID: <ce637b13-de98-4a77-9df6-8bc6ec177009@huawei.com>
Date: Wed, 12 Jun 2024 09:54:53 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v4] arm32: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<arnd@arndb.de>, <ardb@kernel.org>, <linux@armlinux.org.uk>, <afd@ti.com>,
	<akpm@linux-foundation.org>, <kirill.shutemov@linux.intel.com>,
	<corbet@lwn.net>, <rppt@kernel.org>, <robh@kernel.org>, <tglx@linutronix.de>,
	<linus.walleij@linaro.org>, <maskray@google.com>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>, Chris Brandt <Chris.Brandt@renesas.com>
References: <20240316023932.700685-1-liuyuntao12@huawei.com>
 <CAMuHMdWMAg59p+hzeLG9Uc3X55Vt9ccNy5BRoPX0RJbxrMOFLA@mail.gmail.com>
From: "liuyuntao (F)" <liuyuntao12@huawei.com>
In-Reply-To: <CAMuHMdWMAg59p+hzeLG9Uc3X55Vt9ccNy5BRoPX0RJbxrMOFLA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemd100004.china.huawei.com (7.185.36.20)

That's great, thanks for your testing.

On 2024/6/11 20:45, Geert Uytterhoeven wrote:
> Hi Yuntao,
> 
> On Sat, Mar 16, 2024 at 3:44 AM Yuntao Liu <liuyuntao12@huawei.com> wrote:
>> The current arm32 architecture does not yet support the
>> HAVE_LD_DEAD_CODE_DATA_ELIMINATION feature. arm32 is widely used in
>> embedded scenarios, and enabling this feature would be beneficial for
>> reducing the size of the kernel image.
>>
>> In order to make this work, we keep the necessary tables by annotating
>> them with KEEP, also it requires further changes to linker script to KEEP
>> some tables and wildcard compiler generated sections into the right place.
>> When using ld.lld for linking, KEEP is not recognized within the OVERLAY
>> command, and Ard proposed a concise method to solve this problem.
>>
>> It boots normally with defconfig, vexpress_defconfig and tinyconfig.
>>
>> The size comparison of zImage is as follows:
>> defconfig       vexpress_defconfig      tinyconfig
>> 5137712         5138024                 424192          no dce
>> 5032560         4997824                 298384          dce
>> 2.0%            2.7%                    29.7%           shrink
>>
>> When using smaller config file, there is a significant reduction in the
>> size of the zImage.
>>
>> We also tested this patch on a commercially available single-board
>> computer, and the comparison is as follows:
>> a15eb_config
>> 2161384         no dce
>> 2092240         dce
>> 3.2%            shrink
>>
>> The zImage size has been reduced by approximately 3.2%, which is 70KB on
>> 2.1M.
>>
>> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
>> Tested-by: Arnd Bergmann <arnd@arndb.de>
>> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> Thanks for your patch, which is now commit ed0f941022515ff4 ("ARM:
> 9404/1: arm32: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION") in
> arm/for-next (next-20240611).
> 
> I gave this a try on my custom configs for RSK+RZA1 (RZ/A1H)
> and RZA2MEVB (RZ/A2M).  According to bloat-o-meter, enabling
> HAVE_LD_DEAD_CODE_DATA_ELIMINATION reduced kernel size by almost
> 500 KiB (-8.3%).  The figures reported in "Memory: ... available"
> were even more impressive: 1032 KiB more free memory than before.
> 
> As these boards have only 32 resp. 64 MiB of RAM, and some products
> even use RZ/A1H with just the 10 MiB of on-chip SRAM, this is a good
> improvement to have!
> Thanks!
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

