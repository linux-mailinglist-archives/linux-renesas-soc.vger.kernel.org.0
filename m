Return-Path: <linux-renesas-soc+bounces-23190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5C2BE63AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 05:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 117474E11A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 03:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FC11FA859;
	Fri, 17 Oct 2025 03:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luoXQuM0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765811C84BC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 03:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760672683; cv=none; b=M3AdtoSuVm2/80OxT32HpuPNUweGOJ6eQ3kf9kvVFPq7Qk2ei3BhqRknsZ1UxxBeRrEBrplVL1cYR4KAVL9f7v0l0x+9zEsWN6rkC5k4UgoS0R3qz7n8WqLD4s3fNCFAZ3ZU94fZ+UTUBMwsyffhyNLHJWRp03xgNluGSKFeeG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760672683; c=relaxed/simple;
	bh=r9ShVRkveKv3Fmknz3VGed773i/KwY2sS5Vc7wWNIBs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TgdXMUZDOFLeA18orxN+KYiY+BHTi+7TmYIrukk1WqpmG6dj+mSt3yRC/c+d9h+wVGtslV2DgqwBzpmksvFHW42f/GYanA9LHQF//dZcc+09hewgUO9WqOB17TP1aGN7PA8Jo1kUW7EQfkTUbsouywpVS0DS3pVgt2Pf+VCWajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luoXQuM0; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27eed7bdfeeso17731155ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 20:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760672681; x=1761277481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e9vG9FB62ZPi8eB3ORsQrd/l6R9HelLxRMwAISsvg20=;
        b=luoXQuM0hhlQXa3eW2YSZxbdH8VgGEfE9iqk5ah6Hl1luPxTmM1VWQ+TDj4ftD6GHu
         LcN0aYQey4mGvvEKzFvBCyGTyLV9RYNvMUGYgjL6ptyUhxG6I/XyJ9HQlIUz/mIS4U9T
         u1BM+YDM8Dc5eZnn7ygHQokJX3RbxjqqPc1VT461Pv6H2LqAGUUztpH5i2lAAFwcNEfa
         /S0SzYGpacyLCn5YVC+CpjYla83JHlmcn4wzSVhN0lIQz4xPiwWQ8y+j50PyV0xrKbDn
         GFng+htwrxvJN5T5ZPkbi8vjjJJr45OkYFrjXc368lDKF+HNr916u5AHVoDKyBTABXWS
         DIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760672681; x=1761277481;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e9vG9FB62ZPi8eB3ORsQrd/l6R9HelLxRMwAISsvg20=;
        b=nldVcPqwnlKETYmm4YN1M55h4fJ1SoemEDd5As7/w397vTPClFMHn6JLfgf5ZN3F2l
         DlbvgEGpBR0z+kU59qPVmWy74bcEHIw9MNmkwUEtkpr9UbXA3mKI/J3uebiwyUP2ctok
         AHBI3S5Ml47Nez5X0nf/7cevqOnNKqct/jbx5IwpVFkmHVcqVs8i+7rsyxJtbaTnsWoY
         lwHzToiUWaSHzsaOEGccPbovWLn6RLMDsp+jt6KJ04egmaCl9oYJLNuhGiWOENNAWe+P
         o0jhxY9A+hnGcZg7ZYxXrvuFfLbW7pO+f/0yQGNrWsxnh2WhU+xxeBlbZZ6rPcSVGfgv
         1iUA==
X-Forwarded-Encrypted: i=1; AJvYcCU3WIaIhQ3liuGnbIyrIOyOpTsKRhjFRVD0p3PpLIdj0VaAP/K4nRdS6HZX55+XBakWbVFlxS59pT/eDxBK7UpqxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXCQZshngOJp6gkDTq4cyhREP6SRv2XIAPIUDJxVdMgUi9RPHV
	En442vJa9ZtzKt8XBrlGphM2pol0PxICS5gMs7TN93NiiVjsntX9K1Nj
X-Gm-Gg: ASbGncvhU9k+oWhptdnZGa6kfVOJyJUhkadM2Oko7Nsh7/II1ZnIrXMt9frUrBqEhf2
	jvjtr3WCQF/79zvDjER41UVC524m+U4fvT0aFL06rNw+bqst/4VF/hQ+5HAS6cGAE+Tw0kqAr9J
	NUOXEgyxj0oRN8+uTFSQf7SbMFrJGJF/d5l+4DPpxOzbHrPZv4x6e5TiLMnbWK8W7hZTApxmoJ7
	QVoeh81XIKwhmGmWPFGDZ1iH60Txw+GO1/cIEOefRcsEf7WXMqthG9gHC4mnV8m06jrhGU1KZTu
	xVf6TxFzRMLj1C1U5anBeBt7a2fEo6m6SmJOZgd4N3As5ZNwLLqz+uBaTBbJnfaFZRoA+2sc7vf
	QIK264BzTUTjt9/BWk64R92cuC8lfk3hU9pzWkKN8Ss5yjN0wYh1cpOpHogKtgUm4ryRnzUnJrg
	dcITXnMBCYpxBdnqxNzrH56wVwHAhkX4GIR8qMUDelCI0hgJS6gaYlw1PaPNY7fg==
X-Google-Smtp-Source: AGHT+IH5565PPey3s6T5YqzpKJAM+2wZ/ppp3oNFH7Rvo0m5ycyQ4UbE2wJOnHPZqHBdfxqU0HUAvQ==
X-Received: by 2002:a17:902:dacf:b0:271:bd13:7e73 with SMTP id d9443c01a7336-29091b585fcmr73260065ad.19.1760672680592;
        Thu, 16 Oct 2025 20:44:40 -0700 (PDT)
Received: from [192.168.0.12] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a917sm47223205ad.11.2025.10.16.20.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 20:44:39 -0700 (PDT)
Message-ID: <198a5d4f-d02b-4716-a01b-8138d3b576db@gmail.com>
Date: Fri, 17 Oct 2025 12:44:35 +0900
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
From: Takahiro Kuwano <tkuw584924@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Marek Vasut <marek.vasut@mailbox.org>, linux-mtd@lists.infradead.org,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-renesas-soc@vger.kernel.org
References: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
 <0e0f1195-fd08-4d8b-a247-3c94b5628081@linaro.org>
 <c0cd93b5-4e94-4e4b-9b84-c96e024bcc3e@mailbox.org>
 <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
 <30512807-e10b-4414-8cb7-85b1a21ef9fc@gmail.com>
 <b7dfeb8c-7bd3-43c4-84f9-d908f2d76f00@linaro.org>
 <2e14e087-845f-444b-bf68-f68a0a458afd@gmail.com>
 <5d833999-7a6b-4a14-b1d0-03f53dd75773@linaro.org>
 <6862d57c-32ad-4c55-a919-90ac7eb6914d@gmail.com>
Content-Language: en-US
In-Reply-To: <6862d57c-32ad-4c55-a919-90ac7eb6914d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Tudor,

On 10/14/2025 4:22 PM, Takahiro Kuwano wrote:
> Hi Tudor,
> 
> On 10/10/2025 5:34 PM, Tudor Ambarus wrote:
>> Hi, Takahiro,
>>
>>>>>>>> On 9/14/24 11:08 PM, Marek Vasut wrote:
>>>>>>>>> The S25FS512S chip datasheet rev.O Table 71 on page 153 JEDEC Sector Map
>>>>>>>>> Parameter Dword-6 Config. Detect-3 does use CR3NV bit 1 to discern 64kiB
>>>>>>>>> and 256kiB uniform sectors device configuration, however according to
>>>>>>>>> section 7.5.5.1 Configuration Register 3 Non-volatile (CR3NV) page 61,
>>>>>>>>> the CR3NV bit 1 is RFU Reserved for Future Use, and is set to 0 on newly
>>>>>>>>> manufactured devices, which means 64kiB sectors. Since the device does not
>>>>>>>>> support 64kiB uniform sectors in any configuration, parsing SMPT table
>>>>>>>>> cannot find a valid sector map entry and fails.
>>>>>>>>>
>>>>>>>>> Fix this up by setting SMPT configuration index bit 0, which is populated
>>>>>>>>> exactly by the CR3NV bit 1 being 1. This is implemented via new .post_smpt
>>>>>>>>> fixup hook and a wrapper function. The only implementation of the hook is
>>>>>>>>> currently specific to S25FS512S.
>>>>>>>>>
>>>>>>>>> This fixes the following failure on S25FS512S:
>>>>>>>>> spi-nor spi0.0: Failed to parse optional parameter table: ff81 (err=-22)
>>>>>>>>>
>>>>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>>>>>>> ---
>>>>>>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>>>>>> Cc: Michael Walle <mwalle@kernel.org>
>>>>>>>>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>>>>>>>>> Cc: Pratyush Yadav <pratyush@kernel.org>
>>>>>>>>> Cc: Richard Weinberger <richard@nod.at>
>>>>>>>>> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>>>>>>> Cc: Vignesh Raghavendra <vigneshr@ti.com>
>>>>>>>>> Cc: linux-mtd@lists.infradead.org
>>>>>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>>>>>> ---
>>>>>>>>>   drivers/mtd/spi-nor/core.c     | 17 +++++++++++++++++
>>>>>>>>>   drivers/mtd/spi-nor/core.h     |  5 +++++
>>>>>>>>>   drivers/mtd/spi-nor/sfdp.c     |  4 ++++
>>>>>>>>>   drivers/mtd/spi-nor/spansion.c | 27 ++++++++++++++++++++++++++-
>>>>>>>>>   4 files changed, 52 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>>>>>>> index 9d6e85bf227b..ca65f36e5638 100644
>>>>>>>>> --- a/drivers/mtd/spi-nor/core.c
>>>>>>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>>>>>>> @@ -2405,6 +2405,23 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>>>>>>>>       return 0;
>>>>>>>>>   }
>>>>>>>>>   +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
>>>>>>>>> +{
>>>>>>>>> +    int ret;
>>>>>>>>> +
>>>>>>>>> +    if (nor->manufacturer && nor->manufacturer->fixups &&
>>>>>>>>> +        nor->manufacturer->fixups->post_smpt) {
>>>>>>>>> +        ret = nor->manufacturer->fixups->post_smpt(nor, smpt);
>>>>>>>>> +        if (ret)
>>>>>>>>> +            return ret;
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    if (nor->info->fixups && nor->info->fixups->post_smpt)
>>>>>>>>> +        return nor->info->fixups->post_smpt(nor, smpt);
>>>>>>>>> +
>>>>>>>>> +    return 0;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>>   static int spi_nor_select_read(struct spi_nor *nor,
>>>>>>>>>                      u32 shared_hwcaps)
>>>>>>>>>   {
>>>>>>>>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>>>>>>>>> index 1516b6d0dc37..d5294424ab9d 100644
>>>>>>>>> --- a/drivers/mtd/spi-nor/core.h
>>>>>>>>> +++ b/drivers/mtd/spi-nor/core.h
>>>>>>>>> @@ -413,6 +413,8 @@ struct spi_nor_flash_parameter {
>>>>>>>>>    *             parameters that could not be extracted by other means (i.e.
>>>>>>>>>    *             when information provided by the SFDP/flash_info tables are
>>>>>>>>>    *             incomplete or wrong).
>>>>>>>>> + * @post_smpt: update sector map configuration ID selector according to
>>>>>>>>> + *             chip-specific quirks.
>>>>>>>>>    * @late_init: used to initialize flash parameters that are not declared in the
>>>>>>>>>    *             JESD216 SFDP standard, or where SFDP tables not defined at all.
>>>>>>>>>    *             Will replace the default_init() hook.
>>>>>>>>> @@ -426,6 +428,7 @@ struct spi_nor_fixups {
>>>>>>>>>                const struct sfdp_parameter_header *bfpt_header,
>>>>>>>>>                const struct sfdp_bfpt *bfpt);
>>>>>>>>>       int (*post_sfdp)(struct spi_nor *nor);
>>>>>>>>> +    int (*post_smpt)(struct spi_nor *nor, u8 *smpt);
>>>>>>>>>       int (*late_init)(struct spi_nor *nor);
>>>>>>>>>   };
>>>>>>>>>   @@ -660,6 +663,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>>>>>>>>                    const struct sfdp_parameter_header *bfpt_header,
>>>>>>>>>                    const struct sfdp_bfpt *bfpt);
>>>>>>>>>   +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *stmp);
>>>>>>>>> +
>>>>>>>>>   void spi_nor_init_default_locking_ops(struct spi_nor *nor);
>>>>>>>>>   void spi_nor_try_unlock_all(struct spi_nor *nor);
>>>>>>>>>   void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
>>>>>>>>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>>>>>>>>> index 5b1117265bd2..542c775918ad 100644
>>>>>>>>> --- a/drivers/mtd/spi-nor/sfdp.c
>>>>>>>>> +++ b/drivers/mtd/spi-nor/sfdp.c
>>>>>>>>> @@ -765,6 +765,10 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>>>>>>>>           map_id = map_id << 1 | !!(*buf & read_data_mask);
>>>>>>>>>       }
>>>>>>>>>   +    err = spi_nor_post_smpt_fixups(nor, &map_id);
>>>>>>>>> +    if (err)
>>>>>>>>> +        return ERR_PTR(err);
>>>>>>>>> +
>>>>>>>>>       /*
>>>>>>>>>        * If command descriptors are provided, they always precede map
>>>>>>>>>        * descriptors in the table. There is no need to start the iteration
>>>>>>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>>>>>>> index d6c92595f6bc..d446d12371e1 100644
>>>>>>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>>>>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>>>>>>> @@ -757,6 +757,31 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
>>>>>>>>>       .post_bfpt = s25fs_s_nor_post_bfpt_fixups,
>>>>>>>>>   };
>>>>>>>>>   +static int s25fs512s_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
>>>>>>>>> +{
>>>>>>>>> +    /*
>>>>>>>>> +     * The S25FS512S chip datasheet rev.O Table 71 on page 153
>>>>>>>>> +     * JEDEC Sector Map Parameter Dword-6 Config. Detect-3 does
>>>>>>>>> +     * use CR3NV bit 1 to discern 64kiB/256kiB uniform sectors
>>>>>>>>> +     * device configuration, however according to section 7.5.5.1
>>>>>>>>> +     * Configuration Register 3 Non-volatile (CR3NV) page 61, the
>>>>>>>>> +     * CR3NV bit 1 is RFU Reserved for Future Use, and is set to
>>>>>>>>> +     * 0 on newly manufactured devices, which means 64kiB sectors.
>>>>>>>>> +     * Since the device does not support 64kiB uniform sectors in
>>>>>>>>> +     * any configuration, parsing SMPT table cannot find a valid
>>>>>>>>> +     * sector map entry and fails. Fix this up by setting SMPT
>>>>>>>>> +     * configuration index bit 0, which is populated exactly by
>>>>>>>>> +     * the CR3NV bit 1 being 1.
>>>>>>>>> +     */
>>>>>>>>> +    *smpt |= BIT(0);
>>>>>>>>
>>>>>>>> Please help me understand this. Maybe a link to your revision of
>>>>>>>> datasheet would help me.
>>>>>>>
>>>>>>> https://www.infineon.com/assets/row/public/documents/10/49/infineon-s25fs512s-512-mb-1-datasheet-en.pdf
>>>>>>>
>>>>>>> SMPT values:
>>>>>>>
>>>>>>> i=0 smpt[i]=08ff65fc
>>>>>>> i=1 smpt[i]=00000004
>>>>>>> i=2 smpt[i]=04ff65fc
>>>>>>> i=3 smpt[i]=00000002
>>>>>>> i=4 smpt[i]=02ff65fd
>>>>>>> i=5 smpt[i]=00000004
>>>>>>> i=6 smpt[i]=ff0201fe
>>>>>>> i=7 smpt[i]=00007ff1
>>>>>>> i=8 smpt[i]=00037ff4
>>>>>>> i=9 smpt[i]=03fbfff4
>>>>>>> i=10 smpt[i]=ff0203fe
>>>>>>> i=11 smpt[i]=03fbfff4
>>>>>>> i=12 smpt[i]=00037ff4
>>>>>>> i=13 smpt[i]=00007ff1
>>>>>>> i=14 smpt[i]=ff0005ff
>>>>>>> i=15 smpt[i]=03fffff4
>>>>>>>
>>>>>>
>>>>>> thanks!
>>>>>>
>>>>>>>> In the flash datasheets that I see, there shall
>>>>>>>> be a "Sector Map Parameter Table Notes" where a "Sector Map Parameter"
>>>>>>>> table is described showing an Index Value constructed by the CRxNV[y]
>>>>>>>> return values. That index value is the map_id in the code.
>>>>>>>>
>>>>>>>> By reading your description I understand CR3NV[1] has value zero as it
>>>>>>>> is marked as RFU, but at the same time that bit is expected in SMPT to
>>>>>>>> always have value 1. That's why datasheets like this one [1] in their
>>>>>>>> "Table 70. Sector Map Parameter" do not describe CR3NV[1] at all, and
>>>>>>>> define the index value as CR3NV[3] << 2 | CR1NV[2] << 1 | 1.
>>>>>>>
>>>>>>> Where does this last part "define the index value as CR3NV[3] << 2 | CR1NV[2] << 1 | 1" come from ?
>>>>>>
>>>>>> In your datasheet flavor, from "Table 70 Sector map parameter", page 152,
>>>>>> "Index Value" column. I deduced the formula by using the CR3NV[3] and
>>>>>> CR1NV[2] values. The datasheet says:
>>>>>>
>>>>>> "When more than one configuration bit must be read, all the bits are
>>>>>> concatenated into an index value that is used to select the current address map."
>>>>>>
>>>>>> and that the "the following MSb to LSb order to form the configuration map
>>>>>> index value:
>>>>>> • CR3NV[3] — 0 = Hybrid Architecture, 1 = Uniform Architecture
>>>>>> • CR1NV[2] — 0 = 4 KB parameter sectors at bottom, 1 = 4 KB sectors at top
>>>>>> "
>>>>>>
>>>>> In old datasheet, Table 70 had CR3NV[1] column and the description about index
>>>>> value had another bullet:
>>>>>   • CR3NV[1] — 1 = 256 kB uniform sector size
>>>>> These were removed when the default CRNV3[1] value was changed from 1 to 0.
>>>>> As Marek pointed out, SMPT still involves CR3NV[1] expecting the value is
>>>>> always 1.
>>
>> If CR3NV[1] is always 1 even in the old datasheets, then replacing
>> CR3NV[3] << 2 | CR1NV[2] << 1 | CR3NV[1]
>> with
>> CR3NV[3] << 2 | CR1NV[2] << 1 | 1 (CR3NV[1] was always 1 anyway)
>> for the index value/map_id is backward compatible and okay, even for the
>> older flashes.
>>
>> Then Marek's idea of updating the map_id via a hook is sound. If we're going
>> to update just the map id, I'd rename spi_nor_post_smpt_fixups() to
>> spi_nor_smpt_map_id_fixup().
>>
>>>>>
>>>>>> The "Index Value" shall be the map_id that you passed in the code:
>>>>>> spi_nor_post_smpt_fixups(nor, &map_id);
>>>>>>
>>>>>> Can you please print the map_id value that you obtain without updating it?
>>>>>> Let's also print the values of CR3NV and CR1NV.
>>>>>>
>>>>> I did this in my environment and found another, fundamental issue in SMPT
>>>>> contents and the way to parse it...
>>>>>
>>>>> The SMPT describes Configuration detection command latency as '1111b: variable
>>>>> latency' and in spi_nor_smpt_read_dummy(),
>>>>>
>>>>> 	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE)
>>>>> 		return nor->read_dummy;
>>>>>
>>>>> This results in 0 latency.
>>>>> However, in S25FS-S, register read latency is 8 cycles by default. That means
> Sorry, this was not accurate. In S25FS-S, register read latency of RDAR(65h) is
> 8 cycle by default. RDSR(05h)/RDCR(35h) has no latency.
> 
>>
>> Is there any other reg interaction in the probe path? What number of dummy cycles
>> is it using?
>>
> Only SMPT parse uses RDAR(65h) that requires dummy cycles. 
> 
How about introducing new fixup like get_smpt_read_dummy() and call it when
read dummy is variable?

 static u8 spi_nor_smpt_read_dummy(const struct spi_nor *nor, const u32 settings)
 {
 	u8 read_dummy = SMPT_CMD_READ_DUMMY(settings);
 
-	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE)
+	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE) {
+		if (nor->info->fixups && nor->info->fixups->get_smpt_read_dummy)
+			return nor->info->fixups->get_smpt_read_dummy(nor);
+
 		return nor->read_dummy;
+	}
+
 	return read_dummy;
 }

>>>>
>>>> If you hack the code and set 8 cycles for the read latency, do you get correct
>>>> results?
>>>>
>>> No, we still need fix like Marek's or something.
>>
>> Right
>>
>>>
>>>> Can the variable latency be determined by parsing SFDP?
>>>>
>>> No, I don't think we can determine by SFDP.
>>>
> 


