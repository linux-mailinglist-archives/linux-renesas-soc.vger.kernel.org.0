Return-Path: <linux-renesas-soc+bounces-7672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF31294483D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 11:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A97D5281DC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 09:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD20E187FEF;
	Thu,  1 Aug 2024 09:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDWsvlZU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9397D189B8C;
	Thu,  1 Aug 2024 09:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722504337; cv=none; b=e7yQzPczJKtdx0iOMxgUFfQNQ8TyadaQC/sBbZ1ZLVEgzPs9F8KjtlSDfDJcno7Hl/S1ngOyfZn+x70c/J3zeTS07SwqHSS78RNiPR9BnC4aJPwF64s/TpV3hAAaVR8IvBVi905cV/a0XMtnmBETFE3w+JaQgGGrONBYM3lmj8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722504337; c=relaxed/simple;
	bh=BVMVLbtLjSumwwXj2SimSSQCBYHqr23extdbz4sJTdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dMxoDMHL7pwufQEBTNSR1oahrvSuTwkLyLX2AiNM4jDmhRrXqpjF0lCH8Bp9R+4MrYT4IdEn9rLUmzy1ruWq5jPvsG881Bwd8PvGYfDYJwQxR0OAMsSe23smwmVAyGuu0nDjdhDA4QF56288ftJqKz9Gz0ZA7XpqrI/vY72vNsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDWsvlZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CDBC4AF09;
	Thu,  1 Aug 2024 09:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722504337;
	bh=BVMVLbtLjSumwwXj2SimSSQCBYHqr23extdbz4sJTdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fDWsvlZUwuEQkhV473Q4B4GOs1SX1JCpFYxqgEeY2cnr6B1lh3MJRkNN5rKY4IzVJ
	 d2CDW4X3a0FU0egFvQa+xmitxjYpk5B+JkNUEitgun/uSzCEytH+AI1uECD316wd0i
	 AfrojOp9IJefFNliSa6cdtRCF5ycJuzZ5LuRcGwI/RK35JQlfhzhjWuQjIrswkzqJq
	 uiKgzKnPTjIn1myvFwDq8VzbBtqhNrbBkse3ngD9ALkNzzxEvN2Fz/5am4J+dGVFza
	 PvXjilne+wPyVsh6pY9ojJqiAzooTLei18WsiUA6aHLT9j+tTyD6D0LOsRp+uK56e6
	 snq4DzUpkNqtg==
Message-ID: <0f9d26c0-e79e-4913-862a-3df642177415@kernel.org>
Date: Thu, 1 Aug 2024 18:25:35 +0900
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] ata: libata: Print quirks applied to devices
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Niklas Cassel <cassel@kernel.org>
References: <20240726031954.566882-1-dlemoal@kernel.org>
 <20240726031954.566882-5-dlemoal@kernel.org>
 <df29e7c5-778e-ec11-3276-a6c87da2ec2f@linux-m68k.org>
 <5ee6820d-8253-4208-8b99-dee78acb0f71@kernel.org>
 <CAMuHMdX1WrK_QRiyq+BfFW=ZFgXkxFTBsw0fJoRH0+znUOh2tg@mail.gmail.com>
 <5700ac9c-0f7e-40c2-b969-ad67b0ee96ba@kernel.org>
 <CAMuHMdVbkeeQy_WBcBhKhOzWv=MsCUjsVEBDrEi0b+g_-RKCOQ@mail.gmail.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <CAMuHMdVbkeeQy_WBcBhKhOzWv=MsCUjsVEBDrEi0b+g_-RKCOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/1/24 6:07 PM, Geert Uytterhoeven wrote:
> Hi Damien,
> 
> On Wed, Jul 31, 2024 at 11:08 AM Damien Le Moal <dlemoal@kernel.org> wrote:
>> On 7/31/24 16:27, Geert Uytterhoeven wrote:
>>> On Wed, Jul 31, 2024 at 1:39 AM Damien Le Moal <dlemoal@kernel.org> wrote:
>>>> On 7/30/24 19:09, Geert Uytterhoeven wrote:
>>>>> On Fri, 26 Jul 2024, Damien Le Moal wrote:
>>>>>> Introduce the function ata_dev_print_quirks() to print the quirk flags
>>>>>> that will be applied to a scanned device. This new function is called
>>>>>> from ata_dev_quirks() when a match on a device model or device model
>>>>>> and revision is found for a device in the __ata_dev_quirks array.
>>>>>>
>>>>>> To implement this function, the ATA_QUIRK_ flags are redefined using
>>>>>> the new enum ata_quirk which defines the bit shift for each quirk
>>>>>> flag. The array of strings ata_quirk_names is used to define the name
>>>>>> of each flag, which are printed by ata_dev_print_quirks().
>>>>>>
>>>>>> Example output for a device listed in the __ata_dev_quirks array and
>>>>>> which has the ATA_QUIRK_DISABLE flag applied:
>>>>>>
>>>>>> [10193.461270] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
>>>>>> [10193.469190] ata1.00: Model 'ASMT109x- Config', rev '2143 5', applying quirks: disable
>>>>>> [10193.469195] ata1.00: unsupported device, disabling
>>>>>> [10193.481564] ata1.00: disable device
>>>>>>
>>>>>> enum ata_quirk also defines the __ATA_QUIRK_MAX value as one plus the
>>>>>> last quirk flag defined. This value is used in ata_dev_quirks() to add a
>>>>>> build time check that all quirk flags fit within the unsigned int
>>>>>> (32-bits) quirks field of struct ata_device.
>>>>>>
>>>>>> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
>>>>>> Reviewed-by: Igor Pylypiv <ipylypiv@google.com>
>>>>>
>>>>> Thanks for your patch, which is now commit 58157d607aecb4e0 ("ata:
>>>>> libata: Print quirks applied to devices") in libata/for-next.
>>>>>
>>>>> During boot-up on Salvator-XS (using rcar-sata), the quirk info is
>>>>> printed not once, but four times.  Is that intentional?
>>>>
>>>> Not at all. I tested on x86 with AHCI and see this message only once. So it
>>>> could be that different drivers may need some tweaks to avoid this spamming.
>>>> Though it is strange that the initialization or resume path takes this path 4
>>>> times, meaning that the quirks are applied 4 times. Need to look into that.
>>>> What is the driver for rcar-sata ? Compatible string for it would be fine.
>>>
>>> drivers/ata/sata_rcar.c, using renesas,rcar-gen3-sata.
>>>
>>> I added a WARN() to ata_dev_quirks() to show backtraces:
>>>
>>> Call trace:
>>>  ata_dev_quirks+0x98/0x19c
>>>  ata_dev_configure+0x74/0x12d8
>>>  ata_eh_recover+0x8d8/0xd08
>>>  ata_do_eh+0x50/0xa8
>>>  ata_sff_error_handler+0xd0/0xec
>>>  ata_bmdma_error_handler+0x7c/0x12c
>>>  ata_scsi_port_error_handler+0xc8/0x5f8
>>>  ata_scsi_error+0x90/0xcc
>>>  scsi_error_handler+0x148/0x308
>>>  kthread+0xe4/0xf4
>>>  ret_from_fork+0x10/0x20
>>
>> OK. So it is ata_dev_configure() being called many times from EH. Weird.
>> But I have not a lot of experience with the bmdma drivers.
>> Need to look into that.
>>
>> In the meantime, can you try this ?
>>
>> --- a/drivers/ata/libata-core.c
>> +++ b/drivers/ata/libata-core.c
> 
>> @@ -4087,7 +4087,7 @@ static void ata_dev_print_quirks(const struct ata_device *dev,
>>         size_t sz;
>>         char *str;
>>
>> -       if (!quirks)
>> +       if (!ata_dev_print_info(dev) || !quirks)
>>                 return;
>>
>>         sz = 64 + ARRAY_SIZE(ata_quirk_names) * 16;
> 
> Thanks, that reduces the number of quirk prints from 4 to 2 during
> boot-up, and from 4 to 0 when resuming from s2idle/s2ram.

2 times on boot... Hmm.. So that means that you are seeing all the probe
messages twice (and not just the quirk message), right ?

Note that I prepared a better patch for this:

commit bc021024de6034a31a818103e4a9845390ba0c47
Author: Damien Le Moal <dlemoal@kernel.org>
Date:   Thu Aug 1 18:04:22 2024 +0900

    ata: libata: Print device quirks only once

    In ata_dev_print_quirks(), return early if ata_dev_print_info() returns
    false to avoid printing a device quirks multiple times (that is, each
    time ata_dev_revalidate() is called).

    Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
    Fixes: 58157d607aec ("ata: libata: Print quirks applied to devices")
    Signed-off-by: Damien Le Moal <dlemoal@kernel.org>

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index b4fdb78579c8..3fc9a68d4f45 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -160,7 +160,7 @@ MODULE_DESCRIPTION("Library module for ATA devices");
 MODULE_LICENSE("GPL");
 MODULE_VERSION(DRV_VERSION);

-static inline bool ata_dev_print_info(struct ata_device *dev)
+static inline bool ata_dev_print_info(const struct ata_device *dev)
 {
        struct ata_eh_context *ehc = &dev->link->eh_context;

@@ -4029,7 +4029,7 @@ static void ata_dev_print_quirks(const struct ata_device
*dev,
        size_t sz;
        char *str;

-       if (!quirks)
+       if (!ata_dev_print_info(dev) || !quirks)
                return;

        sz = 64 + ARRAY_SIZE(ata_quirk_names) * 16;

But if you prefer to see the quirk message only once, then I will need to
change this and use a flag to remember that quirk info has been printed
already. But in your case, I suspect you see all probe messages twice, no ?


-- 
Damien Le Moal
Western Digital Research


