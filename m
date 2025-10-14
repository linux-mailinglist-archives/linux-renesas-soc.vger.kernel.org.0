Return-Path: <linux-renesas-soc+bounces-22989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BE9BD7DC4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 09:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2079E423881
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 07:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACCF301712;
	Tue, 14 Oct 2025 07:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsrMKE5b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6A3EEAB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 07:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426543; cv=none; b=W543gr8/zf67tqXclzeHzDhDALq3N8fH7GBnTeQkcxr5QjEhDTGIFkDJpwEUzjN6MloXbLChkV2DWx2i7HVeGDG4Nem25oqB2X1mEwMgq2GwJBYU/HNWzKcQv7AXlk2WO65VY8IKwOooyEnxBWSZScNUHQYRlP8uxMsS9iQs0Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426543; c=relaxed/simple;
	bh=f/VP1JwaPHl0gN9W/7M7FIBK+olgYGVQW8M5/2aCtjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YgxrIRodu3yQgs/hkoiYcj3ORegVutsq7hpug8iXi4rhZREgkKotnO3pCsv270ohQNjXpplxDiovyaHo5xw6AKlmV9R+pQEIWdRg46Omc7GllBDsCzXe6cWBimKEqGmPfndu5fBbsW89EIDiUwuWwMV8aqpGd2dx76Kl/XvB+Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsrMKE5b; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b67ae7e76abso1757844a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 00:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760426540; x=1761031340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=udxcmlojE3F7fOPKF6yxZ/kFaR1GodRKUeWEC4VWVWI=;
        b=lsrMKE5bbsiH7WbWlENxQBnq2LgwlCQ7eWmbaL9CokWrI3Mn3aYSb7pnonKsr+EVV0
         tIR2Zkj9cNxyN7Mzwlh9Hk5PqRxnf9JD3t17uzzTTJYWGyZspZZ9tKkHXuhAlG335uw2
         +I2ait8jEw+uuEtp5xuYP3118XrYGxW9I7KoMi9kCKCBhpIC2uXMYm1n5x+0yzRiOwHx
         bGCHazVCbrxOdSnalCU/0LQEBodc/0hfe1tHcSWAN6eEErsmbXXDY+vFTpRJzvGgnRu3
         E8BvZtkvVHf00q5Z1vTYDocCifD7DWL0EzX5Fs2yaFWaHvvpHwJQA8+vAyqRtYaax9O7
         MLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760426540; x=1761031340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=udxcmlojE3F7fOPKF6yxZ/kFaR1GodRKUeWEC4VWVWI=;
        b=Q1lFq/v7Nt1E80dyf3Hdjwyf4p9EHH0rRaBhpbNFh7cdE5ItMeerPBXn/TBNuHx8xK
         efZYbMiLOdSomYjHzm49Osytj32YpJN4778A8FzSGPQT2kyLdS6f84mHbVai9Gh6VDf5
         Ozp5BexuKp0o89Tnx3ldMMkCcvymzWuCLub0kRRMiAY2b3yZf2wEcp0aztN5A/7N7Ks3
         uixhZg9ljECedTKxiME7OIQ3LVzF2H0oD7FlqoB+Be+mjY6UVua6ceWThv/gH+ZW5njk
         BVqu1JiMNU4+U6mGdSnzF9vSEE5BtH9r5kLgtps42NVV2rv0y8MHLjYoQoQ2g8k1f8MY
         h+Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXheNJ0856uwEmy2wb149IBkQEcxfLSFvSyWrAF1SLeuAemvIVCmwrxp6+pGhfLRteBrqapzmkzoUqV/ncNcLiXxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH2oDA1mExBt1f5XyyXaGpLtr6ZukSiYFbqRHsGQlkVLLx61p7
	Nq9xcCcbhHOijxa/TwzvTMPiAT/0gtKQIBuV2nG4iSWxpkxRq3VWLWpR
X-Gm-Gg: ASbGncuejwa2J+gfmFi5Xaf1C7QsQUX0Rbd8wVTESTf193AC218fNWsgzEDyeKhs2Og
	mCxHnRSqlY5zMYOwjcf9RN3fmtJePPaC5X4ujMOp0IjN5lTyJuMsqYve+rgsEwwxotjsqQMheDj
	JUvcqVaUImvqwakPhTGTQIqfiNeV7KbH/Fa2lj+6mxM14fioUf+sb80vY8Ym2+IF0O9BB5zzEGJ
	ZKycMczoIiLxXGU4fi52j6nOBupM0WYSsi6RTiDm1Wa7MUTQOTvFsIS6C/tDD/9AuKz8fZtNWvi
	UHhCzQqDshy1geVtjl99mBHK2ezwIjhAyyK9LQ5iZGFoaVuoefYjfVGaSLnyjM1Qosylfka0fqr
	hMtyw3Ogz5eBgg9cKx2jxuMXtSpMnUpnrPwHTcdfGMNX95Kz8To1Sfo4ytNL9Gyx+NnuB1svMPf
	OoqEUreYt77Z1rmBVb
X-Google-Smtp-Source: AGHT+IEP70tjYLfzgnPkqvlVFFryoODGWd2XIVX2t3fsl/hLLA42sESt8O0pJsKCzjFYolL9wHJD8w==
X-Received: by 2002:a17:903:2b03:b0:264:70e9:dcb8 with SMTP id d9443c01a7336-2902739f408mr292638515ad.55.1760426539906;
        Tue, 14 Oct 2025 00:22:19 -0700 (PDT)
Received: from [192.168.0.12] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f362fasm155223145ad.97.2025.10.14.00.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 00:22:19 -0700 (PDT)
Message-ID: <6862d57c-32ad-4c55-a919-90ac7eb6914d@gmail.com>
Date: Tue, 14 Oct 2025 16:22:15 +0900
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
 <2e14e087-845f-444b-bf68-f68a0a458afd@gmail.com>
 <5d833999-7a6b-4a14-b1d0-03f53dd75773@linaro.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <5d833999-7a6b-4a14-b1d0-03f53dd75773@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Tudor,

On 10/10/2025 5:34 PM, Tudor Ambarus wrote:
> Hi, Takahiro,
> 
>>>>>>> On 9/14/24 11:08 PM, Marek Vasut wrote:
>>>>>>>> The S25FS512S chip datasheet rev.O Table 71 on page 153 JEDEC Sector Map
>>>>>>>> Parameter Dword-6 Config. Detect-3 does use CR3NV bit 1 to discern 64kiB
>>>>>>>> and 256kiB uniform sectors device configuration, however according to
>>>>>>>> section 7.5.5.1 Configuration Register 3 Non-volatile (CR3NV) page 61,
>>>>>>>> the CR3NV bit 1 is RFU Reserved for Future Use, and is set to 0 on newly
>>>>>>>> manufactured devices, which means 64kiB sectors. Since the device does not
>>>>>>>> support 64kiB uniform sectors in any configuration, parsing SMPT table
>>>>>>>> cannot find a valid sector map entry and fails.
>>>>>>>>
>>>>>>>> Fix this up by setting SMPT configuration index bit 0, which is populated
>>>>>>>> exactly by the CR3NV bit 1 being 1. This is implemented via new .post_smpt
>>>>>>>> fixup hook and a wrapper function. The only implementation of the hook is
>>>>>>>> currently specific to S25FS512S.
>>>>>>>>
>>>>>>>> This fixes the following failure on S25FS512S:
>>>>>>>> spi-nor spi0.0: Failed to parse optional parameter table: ff81 (err=-22)
>>>>>>>>
>>>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>>>>>> ---
>>>>>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>>>>> Cc: Michael Walle <mwalle@kernel.org>
>>>>>>>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>>>>>>>> Cc: Pratyush Yadav <pratyush@kernel.org>
>>>>>>>> Cc: Richard Weinberger <richard@nod.at>
>>>>>>>> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>>>>>> Cc: Vignesh Raghavendra <vigneshr@ti.com>
>>>>>>>> Cc: linux-mtd@lists.infradead.org
>>>>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>>>>> ---
>>>>>>>>   drivers/mtd/spi-nor/core.c     | 17 +++++++++++++++++
>>>>>>>>   drivers/mtd/spi-nor/core.h     |  5 +++++
>>>>>>>>   drivers/mtd/spi-nor/sfdp.c     |  4 ++++
>>>>>>>>   drivers/mtd/spi-nor/spansion.c | 27 ++++++++++++++++++++++++++-
>>>>>>>>   4 files changed, 52 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>>>>>> index 9d6e85bf227b..ca65f36e5638 100644
>>>>>>>> --- a/drivers/mtd/spi-nor/core.c
>>>>>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>>>>>> @@ -2405,6 +2405,23 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>>>>>>>       return 0;
>>>>>>>>   }
>>>>>>>>   +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
>>>>>>>> +{
>>>>>>>> +    int ret;
>>>>>>>> +
>>>>>>>> +    if (nor->manufacturer && nor->manufacturer->fixups &&
>>>>>>>> +        nor->manufacturer->fixups->post_smpt) {
>>>>>>>> +        ret = nor->manufacturer->fixups->post_smpt(nor, smpt);
>>>>>>>> +        if (ret)
>>>>>>>> +            return ret;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    if (nor->info->fixups && nor->info->fixups->post_smpt)
>>>>>>>> +        return nor->info->fixups->post_smpt(nor, smpt);
>>>>>>>> +
>>>>>>>> +    return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>   static int spi_nor_select_read(struct spi_nor *nor,
>>>>>>>>                      u32 shared_hwcaps)
>>>>>>>>   {
>>>>>>>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>>>>>>>> index 1516b6d0dc37..d5294424ab9d 100644
>>>>>>>> --- a/drivers/mtd/spi-nor/core.h
>>>>>>>> +++ b/drivers/mtd/spi-nor/core.h
>>>>>>>> @@ -413,6 +413,8 @@ struct spi_nor_flash_parameter {
>>>>>>>>    *             parameters that could not be extracted by other means (i.e.
>>>>>>>>    *             when information provided by the SFDP/flash_info tables are
>>>>>>>>    *             incomplete or wrong).
>>>>>>>> + * @post_smpt: update sector map configuration ID selector according to
>>>>>>>> + *             chip-specific quirks.
>>>>>>>>    * @late_init: used to initialize flash parameters that are not declared in the
>>>>>>>>    *             JESD216 SFDP standard, or where SFDP tables not defined at all.
>>>>>>>>    *             Will replace the default_init() hook.
>>>>>>>> @@ -426,6 +428,7 @@ struct spi_nor_fixups {
>>>>>>>>                const struct sfdp_parameter_header *bfpt_header,
>>>>>>>>                const struct sfdp_bfpt *bfpt);
>>>>>>>>       int (*post_sfdp)(struct spi_nor *nor);
>>>>>>>> +    int (*post_smpt)(struct spi_nor *nor, u8 *smpt);
>>>>>>>>       int (*late_init)(struct spi_nor *nor);
>>>>>>>>   };
>>>>>>>>   @@ -660,6 +663,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>>>>>>>                    const struct sfdp_parameter_header *bfpt_header,
>>>>>>>>                    const struct sfdp_bfpt *bfpt);
>>>>>>>>   +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *stmp);
>>>>>>>> +
>>>>>>>>   void spi_nor_init_default_locking_ops(struct spi_nor *nor);
>>>>>>>>   void spi_nor_try_unlock_all(struct spi_nor *nor);
>>>>>>>>   void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
>>>>>>>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>>>>>>>> index 5b1117265bd2..542c775918ad 100644
>>>>>>>> --- a/drivers/mtd/spi-nor/sfdp.c
>>>>>>>> +++ b/drivers/mtd/spi-nor/sfdp.c
>>>>>>>> @@ -765,6 +765,10 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>>>>>>>           map_id = map_id << 1 | !!(*buf & read_data_mask);
>>>>>>>>       }
>>>>>>>>   +    err = spi_nor_post_smpt_fixups(nor, &map_id);
>>>>>>>> +    if (err)
>>>>>>>> +        return ERR_PTR(err);
>>>>>>>> +
>>>>>>>>       /*
>>>>>>>>        * If command descriptors are provided, they always precede map
>>>>>>>>        * descriptors in the table. There is no need to start the iteration
>>>>>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>>>>>> index d6c92595f6bc..d446d12371e1 100644
>>>>>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>>>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>>>>>> @@ -757,6 +757,31 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
>>>>>>>>       .post_bfpt = s25fs_s_nor_post_bfpt_fixups,
>>>>>>>>   };
>>>>>>>>   +static int s25fs512s_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
>>>>>>>> +{
>>>>>>>> +    /*
>>>>>>>> +     * The S25FS512S chip datasheet rev.O Table 71 on page 153
>>>>>>>> +     * JEDEC Sector Map Parameter Dword-6 Config. Detect-3 does
>>>>>>>> +     * use CR3NV bit 1 to discern 64kiB/256kiB uniform sectors
>>>>>>>> +     * device configuration, however according to section 7.5.5.1
>>>>>>>> +     * Configuration Register 3 Non-volatile (CR3NV) page 61, the
>>>>>>>> +     * CR3NV bit 1 is RFU Reserved for Future Use, and is set to
>>>>>>>> +     * 0 on newly manufactured devices, which means 64kiB sectors.
>>>>>>>> +     * Since the device does not support 64kiB uniform sectors in
>>>>>>>> +     * any configuration, parsing SMPT table cannot find a valid
>>>>>>>> +     * sector map entry and fails. Fix this up by setting SMPT
>>>>>>>> +     * configuration index bit 0, which is populated exactly by
>>>>>>>> +     * the CR3NV bit 1 being 1.
>>>>>>>> +     */
>>>>>>>> +    *smpt |= BIT(0);
>>>>>>>
>>>>>>> Please help me understand this. Maybe a link to your revision of
>>>>>>> datasheet would help me.
>>>>>>
>>>>>> https://www.infineon.com/assets/row/public/documents/10/49/infineon-s25fs512s-512-mb-1-datasheet-en.pdf
>>>>>>
>>>>>> SMPT values:
>>>>>>
>>>>>> i=0 smpt[i]=08ff65fc
>>>>>> i=1 smpt[i]=00000004
>>>>>> i=2 smpt[i]=04ff65fc
>>>>>> i=3 smpt[i]=00000002
>>>>>> i=4 smpt[i]=02ff65fd
>>>>>> i=5 smpt[i]=00000004
>>>>>> i=6 smpt[i]=ff0201fe
>>>>>> i=7 smpt[i]=00007ff1
>>>>>> i=8 smpt[i]=00037ff4
>>>>>> i=9 smpt[i]=03fbfff4
>>>>>> i=10 smpt[i]=ff0203fe
>>>>>> i=11 smpt[i]=03fbfff4
>>>>>> i=12 smpt[i]=00037ff4
>>>>>> i=13 smpt[i]=00007ff1
>>>>>> i=14 smpt[i]=ff0005ff
>>>>>> i=15 smpt[i]=03fffff4
>>>>>>
>>>>>
>>>>> thanks!
>>>>>
>>>>>>> In the flash datasheets that I see, there shall
>>>>>>> be a "Sector Map Parameter Table Notes" where a "Sector Map Parameter"
>>>>>>> table is described showing an Index Value constructed by the CRxNV[y]
>>>>>>> return values. That index value is the map_id in the code.
>>>>>>>
>>>>>>> By reading your description I understand CR3NV[1] has value zero as it
>>>>>>> is marked as RFU, but at the same time that bit is expected in SMPT to
>>>>>>> always have value 1. That's why datasheets like this one [1] in their
>>>>>>> "Table 70. Sector Map Parameter" do not describe CR3NV[1] at all, and
>>>>>>> define the index value as CR3NV[3] << 2 | CR1NV[2] << 1 | 1.
>>>>>>
>>>>>> Where does this last part "define the index value as CR3NV[3] << 2 | CR1NV[2] << 1 | 1" come from ?
>>>>>
>>>>> In your datasheet flavor, from "Table 70 Sector map parameter", page 152,
>>>>> "Index Value" column. I deduced the formula by using the CR3NV[3] and
>>>>> CR1NV[2] values. The datasheet says:
>>>>>
>>>>> "When more than one configuration bit must be read, all the bits are
>>>>> concatenated into an index value that is used to select the current address map."
>>>>>
>>>>> and that the "the following MSb to LSb order to form the configuration map
>>>>> index value:
>>>>> • CR3NV[3] — 0 = Hybrid Architecture, 1 = Uniform Architecture
>>>>> • CR1NV[2] — 0 = 4 KB parameter sectors at bottom, 1 = 4 KB sectors at top
>>>>> "
>>>>>
>>>> In old datasheet, Table 70 had CR3NV[1] column and the description about index
>>>> value had another bullet:
>>>>   • CR3NV[1] — 1 = 256 kB uniform sector size
>>>> These were removed when the default CRNV3[1] value was changed from 1 to 0.
>>>> As Marek pointed out, SMPT still involves CR3NV[1] expecting the value is
>>>> always 1.
> 
> If CR3NV[1] is always 1 even in the old datasheets, then replacing
> CR3NV[3] << 2 | CR1NV[2] << 1 | CR3NV[1]
> with
> CR3NV[3] << 2 | CR1NV[2] << 1 | 1 (CR3NV[1] was always 1 anyway)
> for the index value/map_id is backward compatible and okay, even for the
> older flashes.
> 
> Then Marek's idea of updating the map_id via a hook is sound. If we're going
> to update just the map id, I'd rename spi_nor_post_smpt_fixups() to
> spi_nor_smpt_map_id_fixup().
> 
>>>>
>>>>> The "Index Value" shall be the map_id that you passed in the code:
>>>>> spi_nor_post_smpt_fixups(nor, &map_id);
>>>>>
>>>>> Can you please print the map_id value that you obtain without updating it?
>>>>> Let's also print the values of CR3NV and CR1NV.
>>>>>
>>>> I did this in my environment and found another, fundamental issue in SMPT
>>>> contents and the way to parse it...
>>>>
>>>> The SMPT describes Configuration detection command latency as '1111b: variable
>>>> latency' and in spi_nor_smpt_read_dummy(),
>>>>
>>>> 	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE)
>>>> 		return nor->read_dummy;
>>>>
>>>> This results in 0 latency.
>>>> However, in S25FS-S, register read latency is 8 cycles by default. That means
Sorry, this was not accurate. In S25FS-S, register read latency of RDAR(65h) is
8 cycle by default. RDSR(05h)/RDCR(35h) has no latency.

> 
> Is there any other reg interaction in the probe path? What number of dummy cycles
> is it using?
> 
Only SMPT parse uses RDAR(65h) that requires dummy cycles. 

>>>
>>> If you hack the code and set 8 cycles for the read latency, do you get correct
>>> results?
>>>
>> No, we still need fix like Marek's or something.
> 
> Right
> 
>>
>>> Can the variable latency be determined by parsing SFDP?
>>>
>> No, I don't think we can determine by SFDP.
>>


