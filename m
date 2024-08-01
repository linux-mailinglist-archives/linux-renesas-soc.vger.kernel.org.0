Return-Path: <linux-renesas-soc+bounces-7675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E0D94498C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 12:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B63951F284EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 10:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF32F170A3D;
	Thu,  1 Aug 2024 10:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTXPxGCf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85937170A32;
	Thu,  1 Aug 2024 10:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722508941; cv=none; b=CNftYcu2UzGNqolZgTQjdROMhcIG4SNlzk3SnOfcp3qWxq08LRX9BD5ebevE4IzZxAasX416j18Z/tpCHmbqMVSpOMw2c114vi1qnxOkXe8HwdSl7O0zW6RA72x7WOHxZ0Wd0xt83KsFerKSHevOfmJm+gEQVIBOgpzZH7wawMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722508941; c=relaxed/simple;
	bh=LylfDqJdfUF92RaMQEMWd2YonPzALZnPZvBlVQgw2hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e/h6Hdk+8dyfJKYPx7f1QMlpolxu2bHkZWPJMzLKOLXaDPwehEOuTCiswn5V4QK2r8HIDij8NPnfyKs5oMZdRXOnLhiulFuDnCC52c9NEbj37dN+pXlmgTU9bVeNX0qWVVJVEbVsS39fWy2S5BsvLBGMfr+bcstbaxbxqyzqcZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTXPxGCf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B469C32786;
	Thu,  1 Aug 2024 10:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722508941;
	bh=LylfDqJdfUF92RaMQEMWd2YonPzALZnPZvBlVQgw2hk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZTXPxGCfLUw/1fThj7zQSFnsrqx+e6afhd/JG2L2fTXIE8zOJQYHeqaJ+2iTdy/ib
	 x4ADzK1rRAYbxDJEEMUhoU+ARxE6T/Go7MiY4RrjXJof+AwDBi8QrwhWK4lYXbLJtC
	 mAXo+v3y7rLWTDHuSyv5WL740n4IcDrjn3d5tQ8495kucZNs1g49m/Pl91jhtN2QtB
	 GzZ1zFydEYUdNQmxvuGJKY645NvhNteZhcHJPKadWvjzYgrMVbP2TgW7HThbollhYH
	 pxto5Cm3t89RBOTvuUiuxRs0YBQjsAZ967JEEJk/oTXyKQijUL6tcpHUTdUCtzeyfT
	 eGFdQoSsHTzSQ==
Message-ID: <daeda931-7b82-42e6-af8e-49d9d6e8eb20@kernel.org>
Date: Thu, 1 Aug 2024 19:42:19 +0900
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
 <0f9d26c0-e79e-4913-862a-3df642177415@kernel.org>
 <CAMuHMdWduj2CeB=dqzHPNgHxTXgpWD18H_ew1zp_rc6OwyqHQw@mail.gmail.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <CAMuHMdWduj2CeB=dqzHPNgHxTXgpWD18H_ew1zp_rc6OwyqHQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/1/24 7:05 PM, Geert Uytterhoeven wrote:
> Hi Damien,
> 
> On Thu, Aug 1, 2024 at 11:25 AM Damien Le Moal <dlemoal@kernel.org> wrote:
>> On 8/1/24 6:07 PM, Geert Uytterhoeven wrote:
>>> On Wed, Jul 31, 2024 at 11:08 AM Damien Le Moal <dlemoal@kernel.org> wrote:
>>>> On 7/31/24 16:27, Geert Uytterhoeven wrote:
>>>>> On Wed, Jul 31, 2024 at 1:39 AM Damien Le Moal <dlemoal@kernel.org> wrote:
>>>>>> On 7/30/24 19:09, Geert Uytterhoeven wrote:
>>>>>>> On Fri, 26 Jul 2024, Damien Le Moal wrote:
>>>>>>>> Introduce the function ata_dev_print_quirks() to print the quirk flags
>>>>>>>> that will be applied to a scanned device. This new function is called
>>>>>>>> from ata_dev_quirks() when a match on a device model or device model
>>>>>>>> and revision is found for a device in the __ata_dev_quirks array.
>>>>>>>>
>>>>>>>> To implement this function, the ATA_QUIRK_ flags are redefined using
>>>>>>>> the new enum ata_quirk which defines the bit shift for each quirk
>>>>>>>> flag. The array of strings ata_quirk_names is used to define the name
>>>>>>>> of each flag, which are printed by ata_dev_print_quirks().
>>>>>>>>
>>>>>>>> Example output for a device listed in the __ata_dev_quirks array and
>>>>>>>> which has the ATA_QUIRK_DISABLE flag applied:
>>>>>>>>
>>>>>>>> [10193.461270] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
>>>>>>>> [10193.469190] ata1.00: Model 'ASMT109x- Config', rev '2143 5', applying quirks: disable
>>>>>>>> [10193.469195] ata1.00: unsupported device, disabling
>>>>>>>> [10193.481564] ata1.00: disable device
>>>>>>>>
>>>>>>>> enum ata_quirk also defines the __ATA_QUIRK_MAX value as one plus the
>>>>>>>> last quirk flag defined. This value is used in ata_dev_quirks() to add a
>>>>>>>> build time check that all quirk flags fit within the unsigned int
>>>>>>>> (32-bits) quirks field of struct ata_device.
>>>>>>>>
>>>>>>>> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
>>>>>>>> Reviewed-by: Igor Pylypiv <ipylypiv@google.com>
>>>>>>>
>>>>>>> Thanks for your patch, which is now commit 58157d607aecb4e0 ("ata:
>>>>>>> libata: Print quirks applied to devices") in libata/for-next.
>>>>>>>
>>>>>>> During boot-up on Salvator-XS (using rcar-sata), the quirk info is
>>>>>>> printed not once, but four times.  Is that intentional?
>>>>>>
>>>>>> Not at all. I tested on x86 with AHCI and see this message only once. So it
>>>>>> could be that different drivers may need some tweaks to avoid this spamming.
>>>>>> Though it is strange that the initialization or resume path takes this path 4
>>>>>> times, meaning that the quirks are applied 4 times. Need to look into that.
>>>>>> What is the driver for rcar-sata ? Compatible string for it would be fine.
>>>>>
>>>>> drivers/ata/sata_rcar.c, using renesas,rcar-gen3-sata.
>>>>>
>>>>> I added a WARN() to ata_dev_quirks() to show backtraces:
>>>>>
>>>>> Call trace:
>>>>>  ata_dev_quirks+0x98/0x19c
>>>>>  ata_dev_configure+0x74/0x12d8
>>>>>  ata_eh_recover+0x8d8/0xd08
>>>>>  ata_do_eh+0x50/0xa8
>>>>>  ata_sff_error_handler+0xd0/0xec
>>>>>  ata_bmdma_error_handler+0x7c/0x12c
>>>>>  ata_scsi_port_error_handler+0xc8/0x5f8
>>>>>  ata_scsi_error+0x90/0xcc
>>>>>  scsi_error_handler+0x148/0x308
>>>>>  kthread+0xe4/0xf4
>>>>>  ret_from_fork+0x10/0x20
>>>>
>>>> OK. So it is ata_dev_configure() being called many times from EH. Weird.
>>>> But I have not a lot of experience with the bmdma drivers.
>>>> Need to look into that.
>>>>
>>>> In the meantime, can you try this ?
>>>>
>>>> --- a/drivers/ata/libata-core.c
>>>> +++ b/drivers/ata/libata-core.c
>>>
>>>> @@ -4087,7 +4087,7 @@ static void ata_dev_print_quirks(const struct ata_device *dev,
>>>>         size_t sz;
>>>>         char *str;
>>>>
>>>> -       if (!quirks)
>>>> +       if (!ata_dev_print_info(dev) || !quirks)
>>>>                 return;
>>>>
>>>>         sz = 64 + ARRAY_SIZE(ata_quirk_names) * 16;
>>>
>>> Thanks, that reduces the number of quirk prints from 4 to 2 during
>>> boot-up, and from 4 to 0 when resuming from s2idle/s2ram.
>>
>> 2 times on boot... Hmm.. So that means that you are seeing all the probe
>> messages twice (and not just the quirk message), right ?
> 
> No, I do not see all probe messages twice.
> 
> $ grep ^ata dmesg:
> 
> ata1: SATA max UDMA/133 irq 128 lpm-pol 0
> ata1: link resume succeeded after 1 retries
> ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
> ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
> ata1.00: ATA-7: Maxtor 6L160M0, BANC1G10, max UDMA/133
> ata1.00: 320173056 sectors, multi 0: LBA48 NCQ (not used)
> ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
> ata1.00: configured for UDMA/133

OK. This path should get rid of the useless extra print:

commit 3c65fcbf942c26ece6d1efef7ad1405c0163575f
Author: Damien Le Moal <dlemoal@kernel.org>
Date:   Thu Aug 1 18:04:22 2024 +0900

    ata: libata: Print device quirks only once
    
    In ata_dev_print_quirks(), return early if ata_dev_print_info() returns
    false or if we already printed quirk information. This is to avoid
    printing a device quirks multiple times (that is, each time
    ata_dev_revalidate() is called).
    
    To remember if ata_dev_print_quirks() was already executed, define the
    EH context flag ATA_EHI_DID_QUIRK_PRINT and set this flag in
    ata_dev_print_quirks().
    
    Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
    Fixes: 58157d607aec ("ata: libata: Print quirks applied to devices")
    Signed-off-by: Damien Le Moal <dlemoal@kernel.org>

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index b4fdb78579c8..2309927b7c23 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -160,7 +160,7 @@ MODULE_DESCRIPTION("Library module for ATA devices");
 MODULE_LICENSE("GPL");
 MODULE_VERSION(DRV_VERSION);
 
-static inline bool ata_dev_print_info(struct ata_device *dev)
+static inline bool ata_dev_print_info(const struct ata_device *dev)
 {
        struct ata_eh_context *ehc = &dev->link->eh_context;
 
@@ -4025,10 +4025,16 @@ static void ata_dev_print_quirks(const struct ata_device *dev,
                                 const char *model, const char *rev,
                                 unsigned int quirks)
 {
+       struct ata_eh_context *ehc = &dev->link->eh_context;
        int n = 0, i;
        size_t sz;
        char *str;
 
+       if (!ata_dev_print_info(dev) || ehc->i.flags & ATA_EHI_DID_QUIRK_PRINT)
+               return;
+
+       ehc->i.flags |= ATA_EHI_DID_QUIRK_PRINT;
+
        if (!quirks)
                return;
 
diff --git a/include/linux/libata.h b/include/linux/libata.h
index d5446e18d9df..f8fb9bc7c743 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -378,6 +378,7 @@ enum {
        ATA_EHI_PRINTINFO       = (1 << 18), /* print configuration info */
        ATA_EHI_SETMODE         = (1 << 19), /* configure transfer mode */
        ATA_EHI_POST_SETMODE    = (1 << 20), /* revalidating after setmode */
+       ATA_EHI_DID_QUIRK_PRINT = (1 << 21), /* already printed quirk info */
 
        ATA_EHI_DID_RESET       = ATA_EHI_DID_SOFTRESET | ATA_EHI_DID_HARDRESET,

-- 
Damien Le Moal
Western Digital Research


