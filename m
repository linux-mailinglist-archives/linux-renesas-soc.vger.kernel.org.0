Return-Path: <linux-renesas-soc+bounces-22865-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F83BCBCE2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 08:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57B46405C98
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 06:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AB421FF21;
	Fri, 10 Oct 2025 06:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSTPLKrJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5588B4503B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 06:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760078768; cv=none; b=KIRhkuUnX9GPgSTdNcnvduSk/u6hIYHsrSKhwZG+byup7b+Y0hipC5xZEDA0qdlVXbeDlW32dITx9Vg3loNkn342Y3jKSr652UaRp7MUSa4/uPfzi1VRBuzqEs3lF0UxN99M+V7VqRxJwgOLUYFGGEudMWJ5IKGLJRexE/rl7P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760078768; c=relaxed/simple;
	bh=Wh7ubd5CrLpJVaX02JFE82h3PwB1cpoFHLlsyHrxHhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHS81bN6kHqQbyfOJqPgiVIWyE/RpW6pSARwrdFHQKbFtxU7ztBr6WfKla1kXEbyrwFJV67DRLcFhX8d7iUYaiReJM1p/j1s9DFVshcxBUUKj5Lj48cupA+XNWnMN4izzSRy46vPfXIVCUyfBPnmyNDkAVuYICzCbWy72yairrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSTPLKrJ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-782bfd0a977so1555629b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 23:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760078765; x=1760683565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqRS3A0cdl0vpGq/zTXeUBtM+WtSs/K9G+Qpov6yOz8=;
        b=fSTPLKrJBKZzqyJz0+HTJlOGa8Q/rhSw/Tf18voiDmNV/yU5xV43FRXnr2b0D+Os8t
         thDpmwgDhvkqcaEPHURWUqGOzQb4f85TjpyS1fPhOh/itgZ7Clh0giKyb9ORLzTHNBhi
         8Jw6K7qscLAT6fI1gEGySbavz0z6HEj0whnkYTAgbkjhpseLSkaSqWS2eIZ8hJq5CV47
         l1YkK6s7EWNT3OKxmN7njPu5GAxK8umCFENMlHMNBr6IPStf3pJbYo+d4Vz9QdzaBWTk
         5Dj35jb2gWla8ZcGW8T5kQS2UktDrE5GD9eCfk6R0E3CnTIeH7y2ywBNEOACErQBQQti
         Tj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760078765; x=1760683565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CqRS3A0cdl0vpGq/zTXeUBtM+WtSs/K9G+Qpov6yOz8=;
        b=acFtDFoowHdfE/oEG6KFdv4dDptPv1qSI6MA1DRRVgxH0n4YuNOGKhu+MKIPyysYl7
         eFux9emcRWfPprq9pFi/lJtphIg81M8QYgnAkclHecyp5HiAPcHWELDJj9Sy4zaTxP8i
         oLGkRKOl9+OQ2Rv3333FT/BPa79eE65N1W/N5hsnhn2iqX47QZPNFDRVAADFNLTYx38o
         XyUXIc9ob7OzvIGpwBzhPCGjKYZKlnW5EEnG/bGEeUmSvGuoHp5rg8rGLfqhGuGeays6
         A3qLOB1JCaHZpWb6DqH880KxKKNlIDirhSz2g/TBv3YZk2yPosubTnVF3UnjBOLo0vIY
         Jx0A==
X-Forwarded-Encrypted: i=1; AJvYcCWpW6wLZ/JyUQgOuyVs/ryOOrUfj+tdWI6G1SDBjYkqkzgBkVmt+RkvPT1eQ9NJtV7KXqci7w27Fz0YcoE6Wnuw4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR6WlmpU85yxm/wV8+EIB3A44aNUklVbfFno5TUOjoFgkDtWus
	eSgVnNm9I/VcAMOAqna9Gr8BUqa9/voVQyRs0hpJq2ZYj5JxmKCdI1gj+5Mthg==
X-Gm-Gg: ASbGncuslEfaVCvCjzvBXxscy4F54OumaoodW3ZKmce41KGDkFKF4+nUV0l8/c60ZtU
	FgA5jboIG2AFYKaIvGyXPFGj8k8MAlxf3f3FSFdEaIJEpSgaG1seFmyPsuguu26EVi+HyBINoqz
	Zq/tOliwk9XX0nDzyAu+TZueH5o+xfZxCGF6oDEZo8kJwCd3FfMvaehCplnd+e2weFSNuB8z1Yr
	UhmUzLXD2sCRHnGK/33BfC/JXenIshavc4vPxUVQeNEG3nrXBz0AJgr4I+fNOs32ZMbIB/9nhE2
	ejQlFAoIE6qxp7IbKqIyo/FhOGrvKoCpxwTxMDtX+TR1KetaPMyULSCs3HccV9LunxsnbPJdVwY
	PSpYSeoX8nV9zfAudWGc2eyFbE3umYKP7EMLLKMVgEi4VDBcNztRNLgYJWmVfVrHADzbUxXqOOD
	QQwq8xQga4l5pH5y8whz+eKlRjAg==
X-Google-Smtp-Source: AGHT+IEbsyhOyX5J03ITCLWvHGu4rQeyLlVp71ghKiv4CHoeYypAO1hWzlMB1OMT2B/JQURzo1ciUg==
X-Received: by 2002:a05:6a21:99a1:b0:302:c800:bc0b with SMTP id adf61e73a8af0-32da83e64d7mr13267378637.44.1760078765454;
        Thu, 09 Oct 2025 23:46:05 -0700 (PDT)
Received: from [192.168.0.5] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09659esm1836834b3a.45.2025.10.09.23.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 23:46:04 -0700 (PDT)
Message-ID: <2e14e087-845f-444b-bf68-f68a0a458afd@gmail.com>
Date: Fri, 10 Oct 2025 15:46:01 +0900
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
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
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <b7dfeb8c-7bd3-43c4-84f9-d908f2d76f00@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Tudor,

On 10/10/2025 3:12 PM, Tudor Ambarus wrote:
> 
> 
> On 10/10/25 7:01 AM, Takahiro Kuwano wrote:
>> Hi,
> 
> Hi!
> 
> Thanks for chiming in, Takahiro!
> 
>>
>> On 10/8/2025 3:20 PM, Tudor Ambarus wrote:
>>>
>>>
>>> On 9/3/25 2:40 AM, Marek Vasut wrote:
>>>> On 9/23/24 10:54 AM, Tudor Ambarus wrote:
>>>>
>>>> Hello Tudor,
>>>
>>> Hi, Marek,
>>>
>>>>
>>>> sorry for the late reply.
>>>
>>> That's okay.
>>>
>>>>
>>>>> On 9/14/24 11:08 PM, Marek Vasut wrote:
>>>>>> The S25FS512S chip datasheet rev.O Table 71 on page 153 JEDEC Sector Map
>>>>>> Parameter Dword-6 Config. Detect-3 does use CR3NV bit 1 to discern 64kiB
>>>>>> and 256kiB uniform sectors device configuration, however according to
>>>>>> section 7.5.5.1 Configuration Register 3 Non-volatile (CR3NV) page 61,
>>>>>> the CR3NV bit 1 is RFU Reserved for Future Use, and is set to 0 on newly
>>>>>> manufactured devices, which means 64kiB sectors. Since the device does not
>>>>>> support 64kiB uniform sectors in any configuration, parsing SMPT table
>>>>>> cannot find a valid sector map entry and fails.
>>>>>>
>>>>>> Fix this up by setting SMPT configuration index bit 0, which is populated
>>>>>> exactly by the CR3NV bit 1 being 1. This is implemented via new .post_smpt
>>>>>> fixup hook and a wrapper function. The only implementation of the hook is
>>>>>> currently specific to S25FS512S.
>>>>>>
>>>>>> This fixes the following failure on S25FS512S:
>>>>>> spi-nor spi0.0: Failed to parse optional parameter table: ff81 (err=-22)
>>>>>>
>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>>>> ---
>>>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>>> Cc: Michael Walle <mwalle@kernel.org>
>>>>>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>>>>>> Cc: Pratyush Yadav <pratyush@kernel.org>
>>>>>> Cc: Richard Weinberger <richard@nod.at>
>>>>>> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>>>> Cc: Vignesh Raghavendra <vigneshr@ti.com>
>>>>>> Cc: linux-mtd@lists.infradead.org
>>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>>> ---
>>>>>>   drivers/mtd/spi-nor/core.c     | 17 +++++++++++++++++
>>>>>>   drivers/mtd/spi-nor/core.h     |  5 +++++
>>>>>>   drivers/mtd/spi-nor/sfdp.c     |  4 ++++
>>>>>>   drivers/mtd/spi-nor/spansion.c | 27 ++++++++++++++++++++++++++-
>>>>>>   4 files changed, 52 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>>>> index 9d6e85bf227b..ca65f36e5638 100644
>>>>>> --- a/drivers/mtd/spi-nor/core.c
>>>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>>>> @@ -2405,6 +2405,23 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>>>>>       return 0;
>>>>>>   }
>>>>>>   +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
>>>>>> +{
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    if (nor->manufacturer && nor->manufacturer->fixups &&
>>>>>> +        nor->manufacturer->fixups->post_smpt) {
>>>>>> +        ret = nor->manufacturer->fixups->post_smpt(nor, smpt);
>>>>>> +        if (ret)
>>>>>> +            return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (nor->info->fixups && nor->info->fixups->post_smpt)
>>>>>> +        return nor->info->fixups->post_smpt(nor, smpt);
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>>   static int spi_nor_select_read(struct spi_nor *nor,
>>>>>>                      u32 shared_hwcaps)
>>>>>>   {
>>>>>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>>>>>> index 1516b6d0dc37..d5294424ab9d 100644
>>>>>> --- a/drivers/mtd/spi-nor/core.h
>>>>>> +++ b/drivers/mtd/spi-nor/core.h
>>>>>> @@ -413,6 +413,8 @@ struct spi_nor_flash_parameter {
>>>>>>    *             parameters that could not be extracted by other means (i.e.
>>>>>>    *             when information provided by the SFDP/flash_info tables are
>>>>>>    *             incomplete or wrong).
>>>>>> + * @post_smpt: update sector map configuration ID selector according to
>>>>>> + *             chip-specific quirks.
>>>>>>    * @late_init: used to initialize flash parameters that are not declared in the
>>>>>>    *             JESD216 SFDP standard, or where SFDP tables not defined at all.
>>>>>>    *             Will replace the default_init() hook.
>>>>>> @@ -426,6 +428,7 @@ struct spi_nor_fixups {
>>>>>>                const struct sfdp_parameter_header *bfpt_header,
>>>>>>                const struct sfdp_bfpt *bfpt);
>>>>>>       int (*post_sfdp)(struct spi_nor *nor);
>>>>>> +    int (*post_smpt)(struct spi_nor *nor, u8 *smpt);
>>>>>>       int (*late_init)(struct spi_nor *nor);
>>>>>>   };
>>>>>>   @@ -660,6 +663,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>>>>>                    const struct sfdp_parameter_header *bfpt_header,
>>>>>>                    const struct sfdp_bfpt *bfpt);
>>>>>>   +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *stmp);
>>>>>> +
>>>>>>   void spi_nor_init_default_locking_ops(struct spi_nor *nor);
>>>>>>   void spi_nor_try_unlock_all(struct spi_nor *nor);
>>>>>>   void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
>>>>>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>>>>>> index 5b1117265bd2..542c775918ad 100644
>>>>>> --- a/drivers/mtd/spi-nor/sfdp.c
>>>>>> +++ b/drivers/mtd/spi-nor/sfdp.c
>>>>>> @@ -765,6 +765,10 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>>>>>           map_id = map_id << 1 | !!(*buf & read_data_mask);
>>>>>>       }
>>>>>>   +    err = spi_nor_post_smpt_fixups(nor, &map_id);
>>>>>> +    if (err)
>>>>>> +        return ERR_PTR(err);
>>>>>> +
>>>>>>       /*
>>>>>>        * If command descriptors are provided, they always precede map
>>>>>>        * descriptors in the table. There is no need to start the iteration
>>>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>>>> index d6c92595f6bc..d446d12371e1 100644
>>>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>>>> @@ -757,6 +757,31 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
>>>>>>       .post_bfpt = s25fs_s_nor_post_bfpt_fixups,
>>>>>>   };
>>>>>>   +static int s25fs512s_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
>>>>>> +{
>>>>>> +    /*
>>>>>> +     * The S25FS512S chip datasheet rev.O Table 71 on page 153
>>>>>> +     * JEDEC Sector Map Parameter Dword-6 Config. Detect-3 does
>>>>>> +     * use CR3NV bit 1 to discern 64kiB/256kiB uniform sectors
>>>>>> +     * device configuration, however according to section 7.5.5.1
>>>>>> +     * Configuration Register 3 Non-volatile (CR3NV) page 61, the
>>>>>> +     * CR3NV bit 1 is RFU Reserved for Future Use, and is set to
>>>>>> +     * 0 on newly manufactured devices, which means 64kiB sectors.
>>>>>> +     * Since the device does not support 64kiB uniform sectors in
>>>>>> +     * any configuration, parsing SMPT table cannot find a valid
>>>>>> +     * sector map entry and fails. Fix this up by setting SMPT
>>>>>> +     * configuration index bit 0, which is populated exactly by
>>>>>> +     * the CR3NV bit 1 being 1.
>>>>>> +     */
>>>>>> +    *smpt |= BIT(0);
>>>>>
>>>>> Please help me understand this. Maybe a link to your revision of
>>>>> datasheet would help me.
>>>>
>>>> https://www.infineon.com/assets/row/public/documents/10/49/infineon-s25fs512s-512-mb-1-datasheet-en.pdf
>>>>
>>>> SMPT values:
>>>>
>>>> i=0 smpt[i]=08ff65fc
>>>> i=1 smpt[i]=00000004
>>>> i=2 smpt[i]=04ff65fc
>>>> i=3 smpt[i]=00000002
>>>> i=4 smpt[i]=02ff65fd
>>>> i=5 smpt[i]=00000004
>>>> i=6 smpt[i]=ff0201fe
>>>> i=7 smpt[i]=00007ff1
>>>> i=8 smpt[i]=00037ff4
>>>> i=9 smpt[i]=03fbfff4
>>>> i=10 smpt[i]=ff0203fe
>>>> i=11 smpt[i]=03fbfff4
>>>> i=12 smpt[i]=00037ff4
>>>> i=13 smpt[i]=00007ff1
>>>> i=14 smpt[i]=ff0005ff
>>>> i=15 smpt[i]=03fffff4
>>>>
>>>
>>> thanks!
>>>
>>>>> In the flash datasheets that I see, there shall
>>>>> be a "Sector Map Parameter Table Notes" where a "Sector Map Parameter"
>>>>> table is described showing an Index Value constructed by the CRxNV[y]
>>>>> return values. That index value is the map_id in the code.
>>>>>
>>>>> By reading your description I understand CR3NV[1] has value zero as it
>>>>> is marked as RFU, but at the same time that bit is expected in SMPT to
>>>>> always have value 1. That's why datasheets like this one [1] in their
>>>>> "Table 70. Sector Map Parameter" do not describe CR3NV[1] at all, and
>>>>> define the index value as CR3NV[3] << 2 | CR1NV[2] << 1 | 1.
>>>>
>>>> Where does this last part "define the index value as CR3NV[3] << 2 | CR1NV[2] << 1 | 1" come from ?
>>>
>>> In your datasheet flavor, from "Table 70 Sector map parameter", page 152,
>>> "Index Value" column. I deduced the formula by using the CR3NV[3] and
>>> CR1NV[2] values. The datasheet says:
>>>
>>> "When more than one configuration bit must be read, all the bits are
>>> concatenated into an index value that is used to select the current address map."
>>>
>>> and that the "the following MSb to LSb order to form the configuration map
>>> index value:
>>> • CR3NV[3] — 0 = Hybrid Architecture, 1 = Uniform Architecture
>>> • CR1NV[2] — 0 = 4 KB parameter sectors at bottom, 1 = 4 KB sectors at top
>>> "
>>>
>> In old datasheet, Table 70 had CR3NV[1] column and the description about index
>> value had another bullet:
>>   • CR3NV[1] — 1 = 256 kB uniform sector size
>> These were removed when the default CRNV3[1] value was changed from 1 to 0.
>> As Marek pointed out, SMPT still involves CR3NV[1] expecting the value is
>> always 1.
>>
>>> The "Index Value" shall be the map_id that you passed in the code:
>>> spi_nor_post_smpt_fixups(nor, &map_id);
>>>
>>> Can you please print the map_id value that you obtain without updating it?
>>> Let's also print the values of CR3NV and CR1NV.
>>>
>> I did this in my environment and found another, fundamental issue in SMPT
>> contents and the way to parse it...
>>
>> The SMPT describes Configuration detection command latency as '1111b: variable
>> latency' and in spi_nor_smpt_read_dummy(),
>>
>> 	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE)
>> 		return nor->read_dummy;
>>
>> This results in 0 latency.
>> However, in S25FS-S, register read latency is 8 cycles by default. That means
> 
> If you hack the code and set 8 cycles for the read latency, do you get correct
> results?
> 
No, we still need fix like Marek's or something.

> Can the variable latency be determined by parsing SFDP?
> 
No, I don't think we can determine by SFDP.

> Cheers,
> ta


