Return-Path: <linux-renesas-soc+bounces-21229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C829B41201
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 03:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8232E1B62E07
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 01:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887741B4156;
	Wed,  3 Sep 2025 01:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jd8ZBHcx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270192566
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Sep 2025 01:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756863656; cv=none; b=dGk8Ej7ht8iedo1nmKcPjds1trfEq1w99+c8R3w0HLGxPtzObiaSm+872dLOjz5byvavWtMrOHB4NqboeY0QbakhCWRhbQbVd52UnrQYqAaP/CvzRmLB0MBGF2oz9fm5UnbPu/rT2/looUPfmKdrm9hv5+nFv8xDNAg7P++VGAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756863656; c=relaxed/simple;
	bh=qi70FuH4F59czDaHwccUrrTY/2qOpvpkV6gj0pls+Us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0xMdZMLjCYjf7jvbFE21dDBu8hsJ2Awp9u2uYmIpLQb1EOS6keHMFdZvDIG6Ndppi7SxmcMuy1kDTLrbnSA2tylElvDElfIL3P96zzKtXX0jGInQsEJsZnpewzVdJlH/Y4coxqyY6zC5WiW3T3rZB9gltMan/LCpHRXzgd52w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jd8ZBHcx; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cGlgP6qT9z9tLk;
	Wed,  3 Sep 2025 03:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756863650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1BqNoEQX4rycDlfkinssjeMOWheLDxAav4Q7mkJIvlo=;
	b=jd8ZBHcx0QYnJmENe4iRpE1QU8OV26aIPVuMB3UtdVl5Hu2SiHZOifssAZgTEmE4oekCKQ
	+M5IZQgPULnMLDUUxgK6LPfJkmi4+u2O8rZeRircVyrbyzIWFGHJ/DADIP+jG3i6TEo736
	wr73EXOBkbANo/Fr7nXiBbVgqWqfIZioc6Aw9GHakVYzS36aGu0mDMiqceu6epSuqVePe5
	c+esxyA616WX4HiFfwNC/yDehtbT3BOaRXdqWfamU+stlJOj0w5Tk+cJB5pZYytLc0m++0
	CqVNs4YCfuOGrarbM7YvG8OTog445WoedqYzzgSVYkd7EGukDhoJVWb1O1NsrA==
Message-ID: <c0cd93b5-4e94-4e4b-9b84-c96e024bcc3e@mailbox.org>
Date: Wed, 3 Sep 2025 03:40:47 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-renesas-soc@vger.kernel.org
References: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
 <0e0f1195-fd08-4d8b-a247-3c94b5628081@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <0e0f1195-fd08-4d8b-a247-3c94b5628081@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: fn1igd9ynbbw9zz31hpqwwzaxxbj8kb7
X-MBO-RS-ID: e500ef9a5f3e021b51a

On 9/23/24 10:54 AM, Tudor Ambarus wrote:

Hello Tudor,

sorry for the late reply.

> On 9/14/24 11:08 PM, Marek Vasut wrote:
>> The S25FS512S chip datasheet rev.O Table 71 on page 153 JEDEC Sector Map
>> Parameter Dword-6 Config. Detect-3 does use CR3NV bit 1 to discern 64kiB
>> and 256kiB uniform sectors device configuration, however according to
>> section 7.5.5.1 Configuration Register 3 Non-volatile (CR3NV) page 61,
>> the CR3NV bit 1 is RFU Reserved for Future Use, and is set to 0 on newly
>> manufactured devices, which means 64kiB sectors. Since the device does not
>> support 64kiB uniform sectors in any configuration, parsing SMPT table
>> cannot find a valid sector map entry and fails.
>>
>> Fix this up by setting SMPT configuration index bit 0, which is populated
>> exactly by the CR3NV bit 1 being 1. This is implemented via new .post_smpt
>> fixup hook and a wrapper function. The only implementation of the hook is
>> currently specific to S25FS512S.
>>
>> This fixes the following failure on S25FS512S:
>> spi-nor spi0.0: Failed to parse optional parameter table: ff81 (err=-22)
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> ---
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Michael Walle <mwalle@kernel.org>
>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>> Cc: Pratyush Yadav <pratyush@kernel.org>
>> Cc: Richard Weinberger <richard@nod.at>
>> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Cc: Vignesh Raghavendra <vigneshr@ti.com>
>> Cc: linux-mtd@lists.infradead.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>   drivers/mtd/spi-nor/core.c     | 17 +++++++++++++++++
>>   drivers/mtd/spi-nor/core.h     |  5 +++++
>>   drivers/mtd/spi-nor/sfdp.c     |  4 ++++
>>   drivers/mtd/spi-nor/spansion.c | 27 ++++++++++++++++++++++++++-
>>   4 files changed, 52 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 9d6e85bf227b..ca65f36e5638 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2405,6 +2405,23 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>   	return 0;
>>   }
>>   
>> +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
>> +{
>> +	int ret;
>> +
>> +	if (nor->manufacturer && nor->manufacturer->fixups &&
>> +	    nor->manufacturer->fixups->post_smpt) {
>> +		ret = nor->manufacturer->fixups->post_smpt(nor, smpt);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	if (nor->info->fixups && nor->info->fixups->post_smpt)
>> +		return nor->info->fixups->post_smpt(nor, smpt);
>> +
>> +	return 0;
>> +}
>> +
>>   static int spi_nor_select_read(struct spi_nor *nor,
>>   			       u32 shared_hwcaps)
>>   {
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index 1516b6d0dc37..d5294424ab9d 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -413,6 +413,8 @@ struct spi_nor_flash_parameter {
>>    *             parameters that could not be extracted by other means (i.e.
>>    *             when information provided by the SFDP/flash_info tables are
>>    *             incomplete or wrong).
>> + * @post_smpt: update sector map configuration ID selector according to
>> + *             chip-specific quirks.
>>    * @late_init: used to initialize flash parameters that are not declared in the
>>    *             JESD216 SFDP standard, or where SFDP tables not defined at all.
>>    *             Will replace the default_init() hook.
>> @@ -426,6 +428,7 @@ struct spi_nor_fixups {
>>   			 const struct sfdp_parameter_header *bfpt_header,
>>   			 const struct sfdp_bfpt *bfpt);
>>   	int (*post_sfdp)(struct spi_nor *nor);
>> +	int (*post_smpt)(struct spi_nor *nor, u8 *smpt);
>>   	int (*late_init)(struct spi_nor *nor);
>>   };
>>   
>> @@ -660,6 +663,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>   			     const struct sfdp_parameter_header *bfpt_header,
>>   			     const struct sfdp_bfpt *bfpt);
>>   
>> +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *stmp);
>> +
>>   void spi_nor_init_default_locking_ops(struct spi_nor *nor);
>>   void spi_nor_try_unlock_all(struct spi_nor *nor);
>>   void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> index 5b1117265bd2..542c775918ad 100644
>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -765,6 +765,10 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>   		map_id = map_id << 1 | !!(*buf & read_data_mask);
>>   	}
>>   
>> +	err = spi_nor_post_smpt_fixups(nor, &map_id);
>> +	if (err)
>> +		return ERR_PTR(err);
>> +
>>   	/*
>>   	 * If command descriptors are provided, they always precede map
>>   	 * descriptors in the table. There is no need to start the iteration
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index d6c92595f6bc..d446d12371e1 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -757,6 +757,31 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
>>   	.post_bfpt = s25fs_s_nor_post_bfpt_fixups,
>>   };
>>   
>> +static int s25fs512s_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
>> +{
>> +	/*
>> +	 * The S25FS512S chip datasheet rev.O Table 71 on page 153
>> +	 * JEDEC Sector Map Parameter Dword-6 Config. Detect-3 does
>> +	 * use CR3NV bit 1 to discern 64kiB/256kiB uniform sectors
>> +	 * device configuration, however according to section 7.5.5.1
>> +	 * Configuration Register 3 Non-volatile (CR3NV) page 61, the
>> +	 * CR3NV bit 1 is RFU Reserved for Future Use, and is set to
>> +	 * 0 on newly manufactured devices, which means 64kiB sectors.
>> +	 * Since the device does not support 64kiB uniform sectors in
>> +	 * any configuration, parsing SMPT table cannot find a valid
>> +	 * sector map entry and fails. Fix this up by setting SMPT
>> +	 * configuration index bit 0, which is populated exactly by
>> +	 * the CR3NV bit 1 being 1.
>> +	 */
>> +	*smpt |= BIT(0);
> 
> Please help me understand this. Maybe a link to your revision of
> datasheet would help me.

https://www.infineon.com/assets/row/public/documents/10/49/infineon-s25fs512s-512-mb-1-datasheet-en.pdf

SMPT values:

i=0 smpt[i]=08ff65fc
i=1 smpt[i]=00000004
i=2 smpt[i]=04ff65fc
i=3 smpt[i]=00000002
i=4 smpt[i]=02ff65fd
i=5 smpt[i]=00000004
i=6 smpt[i]=ff0201fe
i=7 smpt[i]=00007ff1
i=8 smpt[i]=00037ff4
i=9 smpt[i]=03fbfff4
i=10 smpt[i]=ff0203fe
i=11 smpt[i]=03fbfff4
i=12 smpt[i]=00037ff4
i=13 smpt[i]=00007ff1
i=14 smpt[i]=ff0005ff
i=15 smpt[i]=03fffff4

> In the flash datasheets that I see, there shall
> be a "Sector Map Parameter Table Notes" where a "Sector Map Parameter"
> table is described showing an Index Value constructed by the CRxNV[y]
> return values. That index value is the map_id in the code.
> 
> By reading your description I understand CR3NV[1] has value zero as it
> is marked as RFU, but at the same time that bit is expected in SMPT to
> always have value 1. That's why datasheets like this one [1] in their
> "Table 70. Sector Map Parameter" do not describe CR3NV[1] at all, and
> define the index value as CR3NV[3] << 2 | CR1NV[2] << 1 | 1.

Where does this last part "define the index value as CR3NV[3] << 2 | 
CR1NV[2] << 1 | 1" come from ?

> I assume what you're doing is fine as it shouldn't break backward
> compatibility with other older flashes as their CR3NV[1] has value one
> anyway. Correct me if I'm wrong.

I hope so.

> Now looking at the code, what we usually do is to save the flash
> parameters described by SFDP in nor->params, then amend those parameters
> with fixup hooks if that's needed. Here you modify the map_id and then
> let the code use it in order to determine the sector_map. Then that
> sector_map (which is SMPT data from the table itself) is used to
> initialize erase regions. That sector_map can contain wrong data too.

By sector_map, do you refer to the "smpt" array ?

> I'd suggest saving a nor->params->sector_map then call a
> int spi_nor_post_smpt_fixups(struct spi_nor *nor,
> 	const struct sfdp_parameter_header *smpt_header,
> 	const u32 *smpt)
> in case spi_nor_get_map_in_use() fails. This way others can update
> sector_map as well if that's ever needed. What do you think?

This won't work for me, would it ? In my case, I need to patch content 
of CR3NV register to assure CR3NV bit 1 is well defined. I don't need to 
patch the sector_map itself.

