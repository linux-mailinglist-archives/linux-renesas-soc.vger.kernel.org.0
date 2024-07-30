Return-Path: <linux-renesas-soc+bounces-7643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BBA94237D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 01:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2419C286435
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 23:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9DC1917E8;
	Tue, 30 Jul 2024 23:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPRqO0Yc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6485A18CC03;
	Tue, 30 Jul 2024 23:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722382783; cv=none; b=uxhjbAFILsf3xGX1Ln4Myie9S7rEPZf3y1W9O7tjo5VvISamNy8MdXEZVb88k5UGuQ4cWTQg6Rn8pgR8Mi7ZCRcVnbbRznRdRNGhGZiXEoXYvfFCZ8OEBoQzzxuNmMQvMpTPOgWuPDzTPP8qTFzxPeSYLaaGp7EMuZxK5XZWl6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722382783; c=relaxed/simple;
	bh=LTX4ZW4++FE12B+IopXtz43Rn45KZi/DoAxG/MPN6E0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1qzio9AheVj7zCNrDkjn3w7hm+KgHf1ZH2mDITKdN06RNxwpZvOq6QimxmhLvQIdZs8EIKQYz4ggtOagWjfXFhcTibx12HNlQBbvBHbNFDZ7nMQoybWl4rS5epghNsR/a9QeGAk6OGwW7akDElsswjAV23GowYiOFO0hZ5v7A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPRqO0Yc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D187C32782;
	Tue, 30 Jul 2024 23:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722382782;
	bh=LTX4ZW4++FE12B+IopXtz43Rn45KZi/DoAxG/MPN6E0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DPRqO0YcTZSgszVfej0THFUJaqTjMjdW42AiTLDdr+vowee3JIRanEt/b/aPGgsAD
	 vMVb9On6+SzDjYLXlMuTtgzGT60Knu47AE1bWuMN5iENgJx87l+yS7yqUCHEL7+jvA
	 qakR8hnNufkcr7it91odzHsj2rOx9m5PffLGzt0hULrJlauVY9EN8cOMwSt/Z4hA7f
	 dP1n4X1XEkqipDF3lkCh9rpxt670LGOCR6BfTEqwWft9uNSJsUxlKRU2SwQDVQWMJ4
	 kI4pCKA3fp7ko1/OHel+/zUfxFn59PgSA9KY/fb910OWtll+TTBi1S8/7urpDoKE0/
	 Rr/d9q6YpOsjw==
Message-ID: <5ee6820d-8253-4208-8b99-dee78acb0f71@kernel.org>
Date: Wed, 31 Jul 2024 08:39:41 +0900
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
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <df29e7c5-778e-ec11-3276-a6c87da2ec2f@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/30/24 19:09, Geert Uytterhoeven wrote:
>  	Hi Damien,
> 
> On Fri, 26 Jul 2024, Damien Le Moal wrote:
>> Introduce the function ata_dev_print_quirks() to print the quirk flags
>> that will be applied to a scanned device. This new function is called
>> from ata_dev_quirks() when a match on a device model or device model
>> and revision is found for a device in the __ata_dev_quirks array.
>>
>> To implement this function, the ATA_QUIRK_ flags are redefined using
>> the new enum ata_quirk which defines the bit shift for each quirk
>> flag. The array of strings ata_quirk_names is used to define the name
>> of each flag, which are printed by ata_dev_print_quirks().
>>
>> Example output for a device listed in the __ata_dev_quirks array and
>> which has the ATA_QUIRK_DISABLE flag applied:
>>
>> [10193.461270] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
>> [10193.469190] ata1.00: Model 'ASMT109x- Config', rev '2143 5', applying quirks: disable
>> [10193.469195] ata1.00: unsupported device, disabling
>> [10193.481564] ata1.00: disable device
>>
>> enum ata_quirk also defines the __ATA_QUIRK_MAX value as one plus the
>> last quirk flag defined. This value is used in ata_dev_quirks() to add a
>> build time check that all quirk flags fit within the unsigned int
>> (32-bits) quirks field of struct ata_device.
>>
>> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
>> Reviewed-by: Igor Pylypiv <ipylypiv@google.com>
> 
> Thanks for your patch, which is now commit 58157d607aecb4e0 ("ata:
> libata: Print quirks applied to devices") in libata/for-next.
> 
>> --- a/drivers/ata/libata-core.c
>> +++ b/drivers/ata/libata-core.c
>> @@ -4273,15 +4336,18 @@ static unsigned int ata_dev_quirks(const struct ata_device *dev)
>> 	unsigned char model_rev[ATA_ID_FW_REV_LEN + 1];
>> 	const struct ata_dev_quirks_entry *ad = __ata_dev_quirks;
>>
>> +	/* dev->quirks is an unsigned int. */
>> +	BUILD_BUG_ON(__ATA_QUIRK_MAX > 32);
>> +
>> 	ata_id_c_string(dev->id, model_num, ATA_ID_PROD, sizeof(model_num));
>> 	ata_id_c_string(dev->id, model_rev, ATA_ID_FW_REV, sizeof(model_rev));
>>
>> 	while (ad->model_num) {
>> -		if (glob_match(ad->model_num, model_num)) {
>> -			if (ad->model_rev == NULL)
>> -				return ad->quirks;
>> -			if (glob_match(ad->model_rev, model_rev))
>> -				return ad->quirks;
>> +		if (glob_match(ad->model_num, model_num) &&
>> +		    (!ad->model_rev || glob_match(ad->model_rev, model_rev))) {
>> +			ata_dev_print_quirks(dev, model_num, model_rev,
>> +					     ad->quirks);
>> +			return ad->quirks;
>> 		}
>> 		ad++;
>> 	}
> 
> During boot-up on Salvator-XS (using rcar-sata), the quirk info is
> printed not once, but four times.  Is that intentional?

Not at all. I tested on x86 with AHCI and see this message only once. So it
could be that different drivers may need some tweaks to avoid this spamming.
Though it is strange that the initialization or resume path takes this path 4
times, meaning that the quirks are applied 4 times. Need to look into that.
What is the driver for rcar-sata ? Compatible string for it would be fine.

> 
>      ata1: link resume succeeded after 1 retries
>     +rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer device
>      input: keys as /devices/platform/keys/input/input0
>      ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
>     +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
>      ata1.00: ATA-7: Maxtor 6L160M0, BANC1G10, max UDMA/133
>      ata1.00: 320173056 sectors, multi 0: LBA48 NCQ (not used)
>     +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
>     +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
>     +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
>      ata1.00: configured for UDMA/133
>      scsi 0:0:0:0: Direct-Access     ATA      Maxtor 6L160M0   1G10 PQ: 0 ANSI: 5
>      sd 0:0:0:0: [sda] 320173056 512-byte logical blocks: (164 GB/153 GiB)
>      sd 0:0:0:0: [sda] Write Protect is off
>      sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
>      sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
>      sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
>       sda: sda1
>      sd 0:0:0:0: [sda] Attached SCSI disk
> 
> During resume from s2idle or s2ram, the same info is printed again,
> fourfold:
> 
>      ata1: link resume succeeded after 1 retries
>      ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
>     +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
>     +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
>     +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
>     +ata1.00: Model 'Maxtor 6L160M0', rev 'BANC1G10', applying quirks: noncq
>      ata1.00: configured for UDMA/133
>      ata1.00: Entering active power mode
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>  						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>  							    -- Linus Torvalds

-- 
Damien Le Moal
Western Digital Research


