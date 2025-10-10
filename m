Return-Path: <linux-renesas-soc+bounces-22864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C317BCBC1D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 08:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7DB954E24D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 06:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2751723816C;
	Fri, 10 Oct 2025 06:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aymyfjnn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09032264CC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 06:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760076773; cv=none; b=jZEysN/hAOlCBs9gm0H4iae/cxMPTltsBQweY+hbcx4TQ0AZgaW63VqnghoX0g35lR2hNA6pSJYfzK7HmdcEF7bp2BvqeIRMbz0TSAXiBYpR94XF9w7EX33Jr7O//jNyOQkkXht/HRvmzp+AHDyNn4S5BU+GcXBhezh/97HAoE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760076773; c=relaxed/simple;
	bh=uErdMaPZOakZP2FQK65GUtLdx8UA0vB1/NeorsYWVUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m9aBKxwcS11MEdLaOj/YCWRPj1wrjP1VrzGHCOLC/cW5pdzZUBRFLsfx4Z6ZSiBBY2KO131mqi56b11TvHWob2vnv75T7MADRTOSa/ptbV5Tuyea4tmHKteYYXPo9SPOiBT7LkJCKNhkbayx2ULA0TsUmxuhUW9Udv4yKlejOP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aymyfjnn; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso1505434f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 23:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760076768; x=1760681568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iaBjDzOK6+Hq3OZvI2T/9g3+RsGtKfrTsQeOMUlUy98=;
        b=aymyfjnn3BN+id2N8u/1xgJRMnPCN0kr0xlmnXO52y4br6GLgvb6TB9HP9DPHBbThb
         tCu9Ms+jVKYhm7lHRz/1afnlhkPquOXkWxobhzzQCERu8V/s1HP2Dj3iPy47V8CT+qED
         h5+IVGZJtuZTj98TY/M7GI4lHBQc1v2rfcxSWnH6aV/3c/N0uKAa0smmY3EfDJ6+q011
         YjhcxxkNhqNxxja/4VLUEVNgDWFyJ2CIkwS/dEzuW8dV10SvGnL3K2I8pEhqS89hxM/b
         L1WYxoqpA7my20v4fQpQqtBsVSZYoh1NTHJKuMcyV2VqgW2MSn5GARasnQU9UzKdFnKO
         Uicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760076768; x=1760681568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iaBjDzOK6+Hq3OZvI2T/9g3+RsGtKfrTsQeOMUlUy98=;
        b=dY52h8rvJGp058yDxbbUQbtNhnLp6pByt5UVVtjf/Czn4KrGjVSrLu4loGsqORUwTt
         4JXr/B9Vs+fLfAn2Sv+Powl5PnELIBDdIvmvbcfPslRYUgY4C1PKZISj1zZ6x7piERkB
         LpolqaKSrJtYFBS80RocGT0LjQbDVTtqHBCO5wXpqr5hfDLThZyxfLUB/rqlj29YUiZA
         kkINqTXhsdQRjk3hk78G6Y+gf9I0RoB1pfaYEAYBOGTT7xkfJEfeN+r9AiR1LwYgPIcM
         yNlKmzF7q5GeYyVLR03oas0iwsG/Bo/7WkM24+1SGIfTqar9JS2s6M6VED/fab89JRIg
         SQ3g==
X-Forwarded-Encrypted: i=1; AJvYcCWM9d+0j0112ezNbHP2+2X46ussbtjYWEriAgOdS8UHlSZjURGiDnkwlaLUHCdMxp5l3+6vVakysyzmuSd/nPXbJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv5wqyPFoX/9pIurjdA5l9qV27RGi3MUhjS1x4jjjslNZQteXk
	X5vKqZCVhsCm5lO5PM04+42gQ1h33VtjK2cynJVFAEugqRjy0HhpJNHJdlnCBxuA9PE=
X-Gm-Gg: ASbGnct0SeiqpDKHDiV+SznfQlJcWRYqZC/igaILLeiEFyqeC5I8Lnswf0QvzZhECCW
	bk8YKArpG5MnDfZSr7dO6oAlCek4a6IfAPnDY5t0Whqk4PLR+XSqjigZQQiQ2OHWuiXeqhjuqrR
	wQqdAe9/UA8RNIuqFpBW2SFE1BMjnHziDyeJTEY0FPckXONt8OFA3U0WKoDS9O9L3rJgMlx5V6M
	flN7vHkSOGnuRlfjqUDQ9Tm8tHhJWQpELjqq3uLijbr2CInkUIfmn8v44l5nUYaZ+xR7qJE5mNT
	37V39ml2yzny+GvjlZi4VT6mT0KKPR+cwFpSiwzZBLYsrMbruDJHyuNzqPhJD40z5QsRfGwGWLs
	Df+2vv+O7z3LK/rYA86iyMe+askNRuwSOpiH5s0gaFzMxDpqoKO5DNg==
X-Google-Smtp-Source: AGHT+IErbgRPouCLJ3ihzzGsKtJPDYqWKv6AN5tCiCcmCCZs0elKZ7cnKADTbeL0YwMoAYuiw2HXbA==
X-Received: by 2002:a05:6000:2504:b0:3ee:11d1:2a1e with SMTP id ffacd0b85a97d-425829b0d45mr10657041f8f.10.1760076767977;
        Thu, 09 Oct 2025 23:12:47 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e0e70sm2435395f8f.40.2025.10.09.23.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 23:12:47 -0700 (PDT)
Message-ID: <b7dfeb8c-7bd3-43c4-84f9-d908f2d76f00@linaro.org>
Date: Fri, 10 Oct 2025 07:12:45 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Takahiro Kuwano <tkuw584924@gmail.com>,
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <30512807-e10b-4414-8cb7-85b1a21ef9fc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/10/25 7:01 AM, Takahiro Kuwano wrote:
> Hi,

Hi!

Thanks for chiming in, Takahiro!

> 
> On 10/8/2025 3:20 PM, Tudor Ambarus wrote:
>>
>>
>> On 9/3/25 2:40 AM, Marek Vasut wrote:
>>> On 9/23/24 10:54 AM, Tudor Ambarus wrote:
>>>
>>> Hello Tudor,
>>
>> Hi, Marek,
>>
>>>
>>> sorry for the late reply.
>>
>> That's okay.
>>
>>>
>>>> On 9/14/24 11:08 PM, Marek Vasut wrote:
>>>>> The S25FS512S chip datasheet rev.O Table 71 on page 153 JEDEC Sector Map
>>>>> Parameter Dword-6 Config. Detect-3 does use CR3NV bit 1 to discern 64kiB
>>>>> and 256kiB uniform sectors device configuration, however according to
>>>>> section 7.5.5.1 Configuration Register 3 Non-volatile (CR3NV) page 61,
>>>>> the CR3NV bit 1 is RFU Reserved for Future Use, and is set to 0 on newly
>>>>> manufactured devices, which means 64kiB sectors. Since the device does not
>>>>> support 64kiB uniform sectors in any configuration, parsing SMPT table
>>>>> cannot find a valid sector map entry and fails.
>>>>>
>>>>> Fix this up by setting SMPT configuration index bit 0, which is populated
>>>>> exactly by the CR3NV bit 1 being 1. This is implemented via new .post_smpt
>>>>> fixup hook and a wrapper function. The only implementation of the hook is
>>>>> currently specific to S25FS512S.
>>>>>
>>>>> This fixes the following failure on S25FS512S:
>>>>> spi-nor spi0.0: Failed to parse optional parameter table: ff81 (err=-22)
>>>>>
>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>>> ---
>>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> Cc: Michael Walle <mwalle@kernel.org>
>>>>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>>>>> Cc: Pratyush Yadav <pratyush@kernel.org>
>>>>> Cc: Richard Weinberger <richard@nod.at>
>>>>> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>>> Cc: Vignesh Raghavendra <vigneshr@ti.com>
>>>>> Cc: linux-mtd@lists.infradead.org
>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>> ---
>>>>>   drivers/mtd/spi-nor/core.c     | 17 +++++++++++++++++
>>>>>   drivers/mtd/spi-nor/core.h     |  5 +++++
>>>>>   drivers/mtd/spi-nor/sfdp.c     |  4 ++++
>>>>>   drivers/mtd/spi-nor/spansion.c | 27 ++++++++++++++++++++++++++-
>>>>>   4 files changed, 52 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>>> index 9d6e85bf227b..ca65f36e5638 100644
>>>>> --- a/drivers/mtd/spi-nor/core.c
>>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>>> @@ -2405,6 +2405,23 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>>>>       return 0;
>>>>>   }
>>>>>   +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
>>>>> +{
>>>>> +    int ret;
>>>>> +
>>>>> +    if (nor->manufacturer && nor->manufacturer->fixups &&
>>>>> +        nor->manufacturer->fixups->post_smpt) {
>>>>> +        ret = nor->manufacturer->fixups->post_smpt(nor, smpt);
>>>>> +        if (ret)
>>>>> +            return ret;
>>>>> +    }
>>>>> +
>>>>> +    if (nor->info->fixups && nor->info->fixups->post_smpt)
>>>>> +        return nor->info->fixups->post_smpt(nor, smpt);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>   static int spi_nor_select_read(struct spi_nor *nor,
>>>>>                      u32 shared_hwcaps)
>>>>>   {
>>>>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>>>>> index 1516b6d0dc37..d5294424ab9d 100644
>>>>> --- a/drivers/mtd/spi-nor/core.h
>>>>> +++ b/drivers/mtd/spi-nor/core.h
>>>>> @@ -413,6 +413,8 @@ struct spi_nor_flash_parameter {
>>>>>    *             parameters that could not be extracted by other means (i.e.
>>>>>    *             when information provided by the SFDP/flash_info tables are
>>>>>    *             incomplete or wrong).
>>>>> + * @post_smpt: update sector map configuration ID selector according to
>>>>> + *             chip-specific quirks.
>>>>>    * @late_init: used to initialize flash parameters that are not declared in the
>>>>>    *             JESD216 SFDP standard, or where SFDP tables not defined at all.
>>>>>    *             Will replace the default_init() hook.
>>>>> @@ -426,6 +428,7 @@ struct spi_nor_fixups {
>>>>>                const struct sfdp_parameter_header *bfpt_header,
>>>>>                const struct sfdp_bfpt *bfpt);
>>>>>       int (*post_sfdp)(struct spi_nor *nor);
>>>>> +    int (*post_smpt)(struct spi_nor *nor, u8 *smpt);
>>>>>       int (*late_init)(struct spi_nor *nor);
>>>>>   };
>>>>>   @@ -660,6 +663,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>>>>                    const struct sfdp_parameter_header *bfpt_header,
>>>>>                    const struct sfdp_bfpt *bfpt);
>>>>>   +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *stmp);
>>>>> +
>>>>>   void spi_nor_init_default_locking_ops(struct spi_nor *nor);
>>>>>   void spi_nor_try_unlock_all(struct spi_nor *nor);
>>>>>   void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
>>>>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>>>>> index 5b1117265bd2..542c775918ad 100644
>>>>> --- a/drivers/mtd/spi-nor/sfdp.c
>>>>> +++ b/drivers/mtd/spi-nor/sfdp.c
>>>>> @@ -765,6 +765,10 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>>>>           map_id = map_id << 1 | !!(*buf & read_data_mask);
>>>>>       }
>>>>>   +    err = spi_nor_post_smpt_fixups(nor, &map_id);
>>>>> +    if (err)
>>>>> +        return ERR_PTR(err);
>>>>> +
>>>>>       /*
>>>>>        * If command descriptors are provided, they always precede map
>>>>>        * descriptors in the table. There is no need to start the iteration
>>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>>> index d6c92595f6bc..d446d12371e1 100644
>>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>>> @@ -757,6 +757,31 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
>>>>>       .post_bfpt = s25fs_s_nor_post_bfpt_fixups,
>>>>>   };
>>>>>   +static int s25fs512s_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
>>>>> +{
>>>>> +    /*
>>>>> +     * The S25FS512S chip datasheet rev.O Table 71 on page 153
>>>>> +     * JEDEC Sector Map Parameter Dword-6 Config. Detect-3 does
>>>>> +     * use CR3NV bit 1 to discern 64kiB/256kiB uniform sectors
>>>>> +     * device configuration, however according to section 7.5.5.1
>>>>> +     * Configuration Register 3 Non-volatile (CR3NV) page 61, the
>>>>> +     * CR3NV bit 1 is RFU Reserved for Future Use, and is set to
>>>>> +     * 0 on newly manufactured devices, which means 64kiB sectors.
>>>>> +     * Since the device does not support 64kiB uniform sectors in
>>>>> +     * any configuration, parsing SMPT table cannot find a valid
>>>>> +     * sector map entry and fails. Fix this up by setting SMPT
>>>>> +     * configuration index bit 0, which is populated exactly by
>>>>> +     * the CR3NV bit 1 being 1.
>>>>> +     */
>>>>> +    *smpt |= BIT(0);
>>>>
>>>> Please help me understand this. Maybe a link to your revision of
>>>> datasheet would help me.
>>>
>>> https://www.infineon.com/assets/row/public/documents/10/49/infineon-s25fs512s-512-mb-1-datasheet-en.pdf
>>>
>>> SMPT values:
>>>
>>> i=0 smpt[i]=08ff65fc
>>> i=1 smpt[i]=00000004
>>> i=2 smpt[i]=04ff65fc
>>> i=3 smpt[i]=00000002
>>> i=4 smpt[i]=02ff65fd
>>> i=5 smpt[i]=00000004
>>> i=6 smpt[i]=ff0201fe
>>> i=7 smpt[i]=00007ff1
>>> i=8 smpt[i]=00037ff4
>>> i=9 smpt[i]=03fbfff4
>>> i=10 smpt[i]=ff0203fe
>>> i=11 smpt[i]=03fbfff4
>>> i=12 smpt[i]=00037ff4
>>> i=13 smpt[i]=00007ff1
>>> i=14 smpt[i]=ff0005ff
>>> i=15 smpt[i]=03fffff4
>>>
>>
>> thanks!
>>
>>>> In the flash datasheets that I see, there shall
>>>> be a "Sector Map Parameter Table Notes" where a "Sector Map Parameter"
>>>> table is described showing an Index Value constructed by the CRxNV[y]
>>>> return values. That index value is the map_id in the code.
>>>>
>>>> By reading your description I understand CR3NV[1] has value zero as it
>>>> is marked as RFU, but at the same time that bit is expected in SMPT to
>>>> always have value 1. That's why datasheets like this one [1] in their
>>>> "Table 70. Sector Map Parameter" do not describe CR3NV[1] at all, and
>>>> define the index value as CR3NV[3] << 2 | CR1NV[2] << 1 | 1.
>>>
>>> Where does this last part "define the index value as CR3NV[3] << 2 | CR1NV[2] << 1 | 1" come from ?
>>
>> In your datasheet flavor, from "Table 70 Sector map parameter", page 152,
>> "Index Value" column. I deduced the formula by using the CR3NV[3] and
>> CR1NV[2] values. The datasheet says:
>>
>> "When more than one configuration bit must be read, all the bits are
>> concatenated into an index value that is used to select the current address map."
>>
>> and that the "the following MSb to LSb order to form the configuration map
>> index value:
>> • CR3NV[3] — 0 = Hybrid Architecture, 1 = Uniform Architecture
>> • CR1NV[2] — 0 = 4 KB parameter sectors at bottom, 1 = 4 KB sectors at top
>> "
>>
> In old datasheet, Table 70 had CR3NV[1] column and the description about index
> value had another bullet:
>   • CR3NV[1] — 1 = 256 kB uniform sector size
> These were removed when the default CRNV3[1] value was changed from 1 to 0.
> As Marek pointed out, SMPT still involves CR3NV[1] expecting the value is
> always 1.
> 
>> The "Index Value" shall be the map_id that you passed in the code:
>> spi_nor_post_smpt_fixups(nor, &map_id);
>>
>> Can you please print the map_id value that you obtain without updating it?
>> Let's also print the values of CR3NV and CR1NV.
>>
> I did this in my environment and found another, fundamental issue in SMPT
> contents and the way to parse it...
> 
> The SMPT describes Configuration detection command latency as '1111b: variable
> latency' and in spi_nor_smpt_read_dummy(),
> 
> 	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE)
> 		return nor->read_dummy;
> 
> This results in 0 latency.
> However, in S25FS-S, register read latency is 8 cycles by default. That means

If you hack the code and set 8 cycles for the read latency, do you get correct
results?

Can the variable latency be determined by parsing SFDP?

Cheers,
ta

