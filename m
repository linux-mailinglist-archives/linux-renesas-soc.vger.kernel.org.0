Return-Path: <linux-renesas-soc+bounces-22779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8D7BC3744
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 08:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE5563AFED6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 06:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8A02BF016;
	Wed,  8 Oct 2025 06:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T+mOK5mL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C71F190685
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 06:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759904457; cv=none; b=PtGIuxZ7b070WuSL8xtOwt2CEPchWGrOiqDv6iJAgq7dRO0lISRQZ2Qdjt6xRckE6nYBL2W7RvLzrVsUWJx3WCcrRE9jJvWu63ZJF795WiuuIcXb6U2BoH01JTbs7lRcZ5kmnNcOw6si1CVOsHmuAkuxEz3rsYNcfQ61C6mzbVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759904457; c=relaxed/simple;
	bh=GmNm6ZVNnapLBt9vLHzbF/IEQ68vwdMcoU2NDedJips=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1rxnoZtWqkfcC8E4tpQnLmEU52+r5KmDyp5dKHFRKb46f7kSXyB+yi+7gcL/RxnF+Z6eHkohdS8ziL8UT84GR3VK8Z3Mqky7jZqrjDD7uJrpQMwTEC3l821cDy5ARnS67Plyj+dk9zvztehFj20j1b1x8tQBP29fvVjyWQ/2Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T+mOK5mL; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b2e0513433bso1094324466b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 23:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759904453; x=1760509253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6IlUjlkyGs4YdsFbyv5BcESqRT9tEItS3RG13G8UheQ=;
        b=T+mOK5mLUASduebcEbQvyL7Fy5lVAdQG6A5xaSsnQ7BQNemdIW2vi2lzuYzgAfE8E7
         yXVdMvSb4PF1FkIsjVuxKlDfw1qgsiXe9vd+aUFQITzEeOOYWlvI4fmmAN/lTUe/F0Pq
         Y3RXsKgoHWVEYdLAb40prXJH+1CHdgkk5YdMsZLnp95NGSusmEL2atxiBPYu8l/s9KUr
         GXgYDuDeh+0a/tC09ti9cMj/XQW4Kbi2sILSfoyXyB8C1+geJws928/F+eQtIKdDyKOD
         Fk7gqLRoi3PlIMLr193rlnyQecTWR9xDjLAY0Ff4Oai7uckTLe7JiAGNZ1qwEQDn1riC
         sttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759904453; x=1760509253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6IlUjlkyGs4YdsFbyv5BcESqRT9tEItS3RG13G8UheQ=;
        b=G54JmlF606HcZkmbblAr0aJPEmnEHTW0o+NLG0eU5S/tJ3IlKQTb7uKCio0OIIxqX6
         lp+7NWkW0jGNy3uoy6qKNCZZtD6FlImwa2aDmLOWzLPZKK98q9Pjff6HuE/mb+Xm9TPR
         CbMXzmewGtflCrvVL7hVT7zgJynrePC92r/QCqFS68Bn7+IHK229IgEAggYQ28YHgODu
         C1XDTjor3NwMwNX/qzqQR3QCLlUiaZCpFS5+Ff3oriaMnD/Puyyebove3cYBEtq+ahId
         XQrGy8zeSsKI4BwqM/EL2hAWUeSDjlGdq298L/7PvDUELd3bPiWmiW+kQxvPlaoW67kh
         sRUA==
X-Forwarded-Encrypted: i=1; AJvYcCVBcaqOW5EhdswVpmoURv3O2gfbeeoWOR9eeUv9ByAhwwViQvpteIlqlM6XwpQl+ERYLInfRpCMPRjJP7vFDSDilg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLfGyzzsA95vHJFUHffMRQwMhPjAo4VxJTYWqJydr2KRgfau6b
	TutcHF4OEK28N6IUngnU2/xAFArEvIf/yAPtsAwWo6FJUTml5jbweD5TUhAyJANefq0=
X-Gm-Gg: ASbGncuCW0a/32Tcx8U3IyUx8Z2ZUdRGgPYRWxW3QC1iU4vptD7lJX86CklD3a7CDAd
	iWuj+QaWkFQMotLxNJwghR7376wvgPzbxqtEcOl+h1UxxqA0EeTJ9PCjSZdvXTyJ2yvImyxeRdu
	kPb3umF+rWdDGD/QD/xO5nvErjxcMcbgkJd4MT27TCK4raf2Q5Xor/RyxXZE2IDcKjEBKYdTNHV
	TIZzP43dt6bHu2b2f2lTzfxQjwxJNi14HG0vSwXUzoY5ncwaXM3q6ryTb3Lrs7YULsQIOZam4pp
	g2+XbJNyDeysp5FiauikxrAwZrB48ffBzQmx25B2/ovjOMs9RU8TQkTyPKwVsJTV5NSEsrQQ8Dz
	Hx/lxxSRGhgr/1+QGcwKebGizyeXy0tJKbJ2OIxzQRCNdSwYFQJaoUaduTSJcc+IddNuruQ==
X-Google-Smtp-Source: AGHT+IGh8oDuuWwMguLDIqgXRZe5AJ544sIsSyppdgo2hhGR3cGdu6cD2SGzRjwV0oVUUUajbK304Q==
X-Received: by 2002:a17:907:25c6:b0:b3b:4e6:46e6 with SMTP id a640c23a62f3a-b50aa393beamr226556566b.1.1759904453300;
        Tue, 07 Oct 2025 23:20:53 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa62csm1531371566b.19.2025.10.07.23.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 23:20:52 -0700 (PDT)
Message-ID: <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
Date: Wed, 8 Oct 2025 07:20:51 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Marek Vasut <marek.vasut@mailbox.org>, linux-mtd@lists.infradead.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-renesas-soc@vger.kernel.org
References: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
 <0e0f1195-fd08-4d8b-a247-3c94b5628081@linaro.org>
 <c0cd93b5-4e94-4e4b-9b84-c96e024bcc3e@mailbox.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <c0cd93b5-4e94-4e4b-9b84-c96e024bcc3e@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/3/25 2:40 AM, Marek Vasut wrote:
> On 9/23/24 10:54 AM, Tudor Ambarus wrote:
> 
> Hello Tudor,

Hi, Marek,

> 
> sorry for the late reply.

That's okay.

> 
>> On 9/14/24 11:08 PM, Marek Vasut wrote:
>>> The S25FS512S chip datasheet rev.O Table 71 on page 153 JEDEC Sector Map
>>> Parameter Dword-6 Config. Detect-3 does use CR3NV bit 1 to discern 64kiB
>>> and 256kiB uniform sectors device configuration, however according to
>>> section 7.5.5.1 Configuration Register 3 Non-volatile (CR3NV) page 61,
>>> the CR3NV bit 1 is RFU Reserved for Future Use, and is set to 0 on newly
>>> manufactured devices, which means 64kiB sectors. Since the device does not
>>> support 64kiB uniform sectors in any configuration, parsing SMPT table
>>> cannot find a valid sector map entry and fails.
>>>
>>> Fix this up by setting SMPT configuration index bit 0, which is populated
>>> exactly by the CR3NV bit 1 being 1. This is implemented via new .post_smpt
>>> fixup hook and a wrapper function. The only implementation of the hook is
>>> currently specific to S25FS512S.
>>>
>>> This fixes the following failure on S25FS512S:
>>> spi-nor spi0.0: Failed to parse optional parameter table: ff81 (err=-22)
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>> ---
>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Cc: Michael Walle <mwalle@kernel.org>
>>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>>> Cc: Pratyush Yadav <pratyush@kernel.org>
>>> Cc: Richard Weinberger <richard@nod.at>
>>> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
>>> Cc: Vignesh Raghavendra <vigneshr@ti.com>
>>> Cc: linux-mtd@lists.infradead.org
>>> Cc: linux-renesas-soc@vger.kernel.org
>>> ---
>>>   drivers/mtd/spi-nor/core.c     | 17 +++++++++++++++++
>>>   drivers/mtd/spi-nor/core.h     |  5 +++++
>>>   drivers/mtd/spi-nor/sfdp.c     |  4 ++++
>>>   drivers/mtd/spi-nor/spansion.c | 27 ++++++++++++++++++++++++++-
>>>   4 files changed, 52 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index 9d6e85bf227b..ca65f36e5638 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -2405,6 +2405,23 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>>       return 0;
>>>   }
>>>   +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
>>> +{
>>> +    int ret;
>>> +
>>> +    if (nor->manufacturer && nor->manufacturer->fixups &&
>>> +        nor->manufacturer->fixups->post_smpt) {
>>> +        ret = nor->manufacturer->fixups->post_smpt(nor, smpt);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>> +    if (nor->info->fixups && nor->info->fixups->post_smpt)
>>> +        return nor->info->fixups->post_smpt(nor, smpt);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static int spi_nor_select_read(struct spi_nor *nor,
>>>                      u32 shared_hwcaps)
>>>   {
>>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>>> index 1516b6d0dc37..d5294424ab9d 100644
>>> --- a/drivers/mtd/spi-nor/core.h
>>> +++ b/drivers/mtd/spi-nor/core.h
>>> @@ -413,6 +413,8 @@ struct spi_nor_flash_parameter {
>>>    *             parameters that could not be extracted by other means (i.e.
>>>    *             when information provided by the SFDP/flash_info tables are
>>>    *             incomplete or wrong).
>>> + * @post_smpt: update sector map configuration ID selector according to
>>> + *             chip-specific quirks.
>>>    * @late_init: used to initialize flash parameters that are not declared in the
>>>    *             JESD216 SFDP standard, or where SFDP tables not defined at all.
>>>    *             Will replace the default_init() hook.
>>> @@ -426,6 +428,7 @@ struct spi_nor_fixups {
>>>                const struct sfdp_parameter_header *bfpt_header,
>>>                const struct sfdp_bfpt *bfpt);
>>>       int (*post_sfdp)(struct spi_nor *nor);
>>> +    int (*post_smpt)(struct spi_nor *nor, u8 *smpt);
>>>       int (*late_init)(struct spi_nor *nor);
>>>   };
>>>   @@ -660,6 +663,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>>                    const struct sfdp_parameter_header *bfpt_header,
>>>                    const struct sfdp_bfpt *bfpt);
>>>   +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *stmp);
>>> +
>>>   void spi_nor_init_default_locking_ops(struct spi_nor *nor);
>>>   void spi_nor_try_unlock_all(struct spi_nor *nor);
>>>   void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
>>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>>> index 5b1117265bd2..542c775918ad 100644
>>> --- a/drivers/mtd/spi-nor/sfdp.c
>>> +++ b/drivers/mtd/spi-nor/sfdp.c
>>> @@ -765,6 +765,10 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>>           map_id = map_id << 1 | !!(*buf & read_data_mask);
>>>       }
>>>   +    err = spi_nor_post_smpt_fixups(nor, &map_id);
>>> +    if (err)
>>> +        return ERR_PTR(err);
>>> +
>>>       /*
>>>        * If command descriptors are provided, they always precede map
>>>        * descriptors in the table. There is no need to start the iteration
>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>> index d6c92595f6bc..d446d12371e1 100644
>>> --- a/drivers/mtd/spi-nor/spansion.c
>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>> @@ -757,6 +757,31 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
>>>       .post_bfpt = s25fs_s_nor_post_bfpt_fixups,
>>>   };
>>>   +static int s25fs512s_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
>>> +{
>>> +    /*
>>> +     * The S25FS512S chip datasheet rev.O Table 71 on page 153
>>> +     * JEDEC Sector Map Parameter Dword-6 Config. Detect-3 does
>>> +     * use CR3NV bit 1 to discern 64kiB/256kiB uniform sectors
>>> +     * device configuration, however according to section 7.5.5.1
>>> +     * Configuration Register 3 Non-volatile (CR3NV) page 61, the
>>> +     * CR3NV bit 1 is RFU Reserved for Future Use, and is set to
>>> +     * 0 on newly manufactured devices, which means 64kiB sectors.
>>> +     * Since the device does not support 64kiB uniform sectors in
>>> +     * any configuration, parsing SMPT table cannot find a valid
>>> +     * sector map entry and fails. Fix this up by setting SMPT
>>> +     * configuration index bit 0, which is populated exactly by
>>> +     * the CR3NV bit 1 being 1.
>>> +     */
>>> +    *smpt |= BIT(0);
>>
>> Please help me understand this. Maybe a link to your revision of
>> datasheet would help me.
> 
> https://www.infineon.com/assets/row/public/documents/10/49/infineon-s25fs512s-512-mb-1-datasheet-en.pdf
> 
> SMPT values:
> 
> i=0 smpt[i]=08ff65fc
> i=1 smpt[i]=00000004
> i=2 smpt[i]=04ff65fc
> i=3 smpt[i]=00000002
> i=4 smpt[i]=02ff65fd
> i=5 smpt[i]=00000004
> i=6 smpt[i]=ff0201fe
> i=7 smpt[i]=00007ff1
> i=8 smpt[i]=00037ff4
> i=9 smpt[i]=03fbfff4
> i=10 smpt[i]=ff0203fe
> i=11 smpt[i]=03fbfff4
> i=12 smpt[i]=00037ff4
> i=13 smpt[i]=00007ff1
> i=14 smpt[i]=ff0005ff
> i=15 smpt[i]=03fffff4
> 

thanks!

>> In the flash datasheets that I see, there shall
>> be a "Sector Map Parameter Table Notes" where a "Sector Map Parameter"
>> table is described showing an Index Value constructed by the CRxNV[y]
>> return values. That index value is the map_id in the code.
>>
>> By reading your description I understand CR3NV[1] has value zero as it
>> is marked as RFU, but at the same time that bit is expected in SMPT to
>> always have value 1. That's why datasheets like this one [1] in their
>> "Table 70. Sector Map Parameter" do not describe CR3NV[1] at all, and
>> define the index value as CR3NV[3] << 2 | CR1NV[2] << 1 | 1.
> 
> Where does this last part "define the index value as CR3NV[3] << 2 | CR1NV[2] << 1 | 1" come from ?

In your datasheet flavor, from "Table 70 Sector map parameter", page 152,
"Index Value" column. I deduced the formula by using the CR3NV[3] and
CR1NV[2] values. The datasheet says:

"When more than one configuration bit must be read, all the bits are
concatenated into an index value that is used to select the current address map."

and that the "the following MSb to LSb order to form the configuration map
index value:
• CR3NV[3] — 0 = Hybrid Architecture, 1 = Uniform Architecture
• CR1NV[2] — 0 = 4 KB parameter sectors at bottom, 1 = 4 KB sectors at top
"

The "Index Value" shall be the map_id that you passed in the code:
spi_nor_post_smpt_fixups(nor, &map_id);

Can you please print the map_id value that you obtain without updating it?
Let's also print the values of CR3NV and CR1NV.

(idea for enthusiasts: we can add a debugfs interface to query registers)

> 
>> I assume what you're doing is fine as it shouldn't break backward
>> compatibility with other older flashes as their CR3NV[1] has value one
>> anyway. Correct me if I'm wrong.

Now that I revisited the datasheet, your comment "use CR3NV bit 1 to discern
64kiB/256kiB uniform sectors" is misleading because a) I understand that
CR3NV[1] is not involved in the sector map selection (the "Index Value" is),
and b) the choice as per table 70 is between uniform 256 KB sectors and
non-uniform map with 4KB sectors at top or bottom and the remaining 256KB.

Let's get those CR3NV and CR1NV values so we decide how to tackle this.

Cheers,
ta

> 
> I hope so.
> 
>> Now looking at the code, what we usually do is to save the flash
>> parameters described by SFDP in nor->params, then amend those parameters
>> with fixup hooks if that's needed. Here you modify the map_id and then
>> let the code use it in order to determine the sector_map. Then that
>> sector_map (which is SMPT data from the table itself) is used to
>> initialize erase regions. That sector_map can contain wrong data too.
> 
> By sector_map, do you refer to the "smpt" array ?
> 
>> I'd suggest saving a nor->params->sector_map then call a
>> int spi_nor_post_smpt_fixups(struct spi_nor *nor,
>>     const struct sfdp_parameter_header *smpt_header,
>>     const u32 *smpt)
>> in case spi_nor_get_map_in_use() fails. This way others can update
>> sector_map as well if that's ever needed. What do you think?
> 
> This won't work for me, would it ? In my case, I need to patch content of CR3NV register to assure CR3NV bit 1 is well defined. I don't need to patch the sector_map itself.


