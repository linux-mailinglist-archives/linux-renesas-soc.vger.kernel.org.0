Return-Path: <linux-renesas-soc+bounces-7656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9487A9429EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 11:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21B531F25A31
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 09:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F64C18CBE2;
	Wed, 31 Jul 2024 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjiER/Cj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071AE1CF93;
	Wed, 31 Jul 2024 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722416894; cv=none; b=A13CZ8J6kGIA7bxanR0sKsjVkldB34ZlAW+TX7kZA+KotWSufbnqEWDl8WDnQu3wHHQwaR3DSUL7vOXbvWwWMhu6blEoAu0rddo2sBuL7GRJ2pyuDWPJ3Tqa6P/K5Ru61l3Zr5RjbbajXuNeyxnL3b09Dhedq1x21yMK9Gyhssg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722416894; c=relaxed/simple;
	bh=AGsjYo3462TR1zkoYQnDrPHs7h6EYDj56rV91Fv5MJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrxhkfA6q7emOvhqOqek4qvVQ1txg64prQ35OrU1hqQgICCkYK9GDPnq+8wTyf82hBmT+d0FBSZayQiQwrLMRX/Mwirq+U6Sqgd6bVPAzGL6kiluzyKLs1Nn0Ufjo2ckjvaJQL5aux2xzK0/DuuDOyaJBvF4BavmQ5AO/fj2TsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjiER/Cj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A6EC116B1;
	Wed, 31 Jul 2024 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722416893;
	bh=AGsjYo3462TR1zkoYQnDrPHs7h6EYDj56rV91Fv5MJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kjiER/Cj9uwoNgqonllkD6UHnkgYIcOWbTmP5T3cwCtSOMSC6UUGhu57NmYjcx2Yu
	 F0L46KLldnOxJYJjX7EcxXmkk8P0Pok1NFvTAYROz9fUUeyBQ73HUVN4kgSzmYxno8
	 ItazmmeSAU83TXMVIL8tPECkhtVYLGBakV/MxfezdqRZElabCGjJkgPnHKERhLIVC6
	 3Yg4ZytpInec2brefi6yiGOEau6VdVYOQ/jvzld3FT6D1D82AkkoVC+qDAIBzVoDEe
	 hpgCOO2ljWakSFeMbYVZsZlfHQTguhe6V9sgNi2gXievBJcyuFPelQUaNKRYFX23Qe
	 bFI/VA1jAPbrQ==
Message-ID: <5700ac9c-0f7e-40c2-b969-ad67b0ee96ba@kernel.org>
Date: Wed, 31 Jul 2024 18:08:12 +0900
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
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <CAMuHMdX1WrK_QRiyq+BfFW=ZFgXkxFTBsw0fJoRH0+znUOh2tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/31/24 16:27, Geert Uytterhoeven wrote:
> Hi Damien,
> 
> On Wed, Jul 31, 2024 at 1:39 AM Damien Le Moal <dlemoal@kernel.org> wrote:
>> On 7/30/24 19:09, Geert Uytterhoeven wrote:
>>> On Fri, 26 Jul 2024, Damien Le Moal wrote:
>>>> Introduce the function ata_dev_print_quirks() to print the quirk flags
>>>> that will be applied to a scanned device. This new function is called
>>>> from ata_dev_quirks() when a match on a device model or device model
>>>> and revision is found for a device in the __ata_dev_quirks array.
>>>>
>>>> To implement this function, the ATA_QUIRK_ flags are redefined using
>>>> the new enum ata_quirk which defines the bit shift for each quirk
>>>> flag. The array of strings ata_quirk_names is used to define the name
>>>> of each flag, which are printed by ata_dev_print_quirks().
>>>>
>>>> Example output for a device listed in the __ata_dev_quirks array and
>>>> which has the ATA_QUIRK_DISABLE flag applied:
>>>>
>>>> [10193.461270] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
>>>> [10193.469190] ata1.00: Model 'ASMT109x- Config', rev '2143 5', applying quirks: disable
>>>> [10193.469195] ata1.00: unsupported device, disabling
>>>> [10193.481564] ata1.00: disable device
>>>>
>>>> enum ata_quirk also defines the __ATA_QUIRK_MAX value as one plus the
>>>> last quirk flag defined. This value is used in ata_dev_quirks() to add a
>>>> build time check that all quirk flags fit within the unsigned int
>>>> (32-bits) quirks field of struct ata_device.
>>>>
>>>> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
>>>> Reviewed-by: Igor Pylypiv <ipylypiv@google.com>
>>>
>>> Thanks for your patch, which is now commit 58157d607aecb4e0 ("ata:
>>> libata: Print quirks applied to devices") in libata/for-next.
>>>
>>> During boot-up on Salvator-XS (using rcar-sata), the quirk info is
>>> printed not once, but four times.  Is that intentional?
>>
>> Not at all. I tested on x86 with AHCI and see this message only once. So it
>> could be that different drivers may need some tweaks to avoid this spamming.
>> Though it is strange that the initialization or resume path takes this path 4
>> times, meaning that the quirks are applied 4 times. Need to look into that.
>> What is the driver for rcar-sata ? Compatible string for it would be fine.
> 
> drivers/ata/sata_rcar.c, using renesas,rcar-gen3-sata.
> 
> I added a WARN() to ata_dev_quirks() to show backtraces:
> 
> Call trace:
>  ata_dev_quirks+0x98/0x19c
>  ata_dev_configure+0x74/0x12d8
>  ata_eh_recover+0x8d8/0xd08
>  ata_do_eh+0x50/0xa8
>  ata_sff_error_handler+0xd0/0xec
>  ata_bmdma_error_handler+0x7c/0x12c
>  ata_scsi_port_error_handler+0xc8/0x5f8
>  ata_scsi_error+0x90/0xcc
>  scsi_error_handler+0x148/0x308
>  kthread+0xe4/0xf4
>  ret_from_fork+0x10/0x20

OK. So it is ata_dev_configure() being called many times from EH. Weird.
But I have not a lot of experience with the bmdma drivers.
Need to look into that.

In the meantime, can you try this ?

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 10d61c7523f0..24344de57428 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -76,7 +76,7 @@ static unsigned int ata_dev_init_params(struct ata_device *dev,
                                        u16 heads, u16 sectors);
 static unsigned int ata_dev_set_xfermode(struct ata_device *dev);
 static void ata_dev_xfermask(struct ata_device *dev);
-static unsigned int ata_dev_quirks(const struct ata_device *dev);
+static unsigned int ata_dev_quirks(struct ata_device *dev);
 
 static DEFINE_IDA(ata_ida);
 
@@ -4079,7 +4079,7 @@ static const char * const ata_quirk_names[] = {
        [__ATA_QUIRK_NO_FUA]            = "nofua",
 };
 
-static void ata_dev_print_quirks(const struct ata_device *dev,
+static void ata_dev_print_quirks(struct ata_device *dev,
                                 const char *model, const char *rev,
                                 unsigned int quirks)
 {
@@ -4087,7 +4087,7 @@ static void ata_dev_print_quirks(const struct ata_device *dev,
        size_t sz;
        char *str;
 
-       if (!quirks)
+       if (!ata_dev_print_info(dev) || !quirks)
                return;
 
        sz = 64 + ARRAY_SIZE(ata_quirk_names) * 16;
@@ -4388,7 +4388,7 @@ static const struct ata_dev_quirks_entry __ata_dev_quirks[] = {
        { }
 };
 
-static unsigned int ata_dev_quirks(const struct ata_device *dev)
+static unsigned int ata_dev_quirks(struct ata_device *dev)
 {
        unsigned char model_num[ATA_ID_PROD_LEN + 1];
        unsigned char model_rev[ATA_ID_FW_REV_LEN + 1];

That should remove the multiple prints.

-- 
Damien Le Moal
Western Digital Research


