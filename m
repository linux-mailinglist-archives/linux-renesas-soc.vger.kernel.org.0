Return-Path: <linux-renesas-soc+bounces-22780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F337BC3820
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 08:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD5103A64BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Oct 2025 06:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979AF2EB846;
	Wed,  8 Oct 2025 06:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLo9yW8E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273CE2EBB88
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Oct 2025 06:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759906067; cv=none; b=XjVRtTgHc4OjuVL8CBqW47YnYIKanIH/7QRiy6vf9JaA91CkP3aBd/4XJqX/rQJNSAu75qbDSf++e5Ygs8ViOXmE8MXocPmCFYOMdkjyOdvcVgaDEWPRO3+/m1BfjucEH2Dj3BsW3bv/0ChUJPTbqIbhoMkdw2HBQPUcYHWqXOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759906067; c=relaxed/simple;
	bh=nfvnlvN0ChGw76dmp+mIJqsFcoRwDFyXWoB+LfkeeuA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=T2gizvgNdgnzkNXoxzxKAqrQ+jPJBjPeS4y7U7009okoThwFglyASmeeYHNDZ+crQ3tqeHsS1+ZQx/9wDLa80OAoA1jDZK49wUgKe3s95B9am/hsQDvBcymgsmXuMTQiRt5zJXmQxXwBMNVYvjZVucd2hKBwiVziz3fobVGNP3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLo9yW8E; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so5227738f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 23:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759906063; x=1760510863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lApHdJux9f5HaHDvYFJdZledtrlyZnqA5mh2ah9fq9I=;
        b=SLo9yW8E+32P4uOzzQRFh60NZxCJ5HRhwG9/qMrkndObsXknyOLpjuB8A2pKxaMv4s
         VpyAh/BfY3JsuIHGiCn90yP0mivvfwyarHX+jA914Vl9btA0me7cdqyUl8x4wSiv/aWV
         NcXF5a062DCq7nHoui5tLCBLTgmQN03TMmJAOZmADYVY7CL54I96yhKkcdCrE8w2XjHn
         MyckaW3cBlL3pXguJ6xoKvrk83PfX70Ckn1Vdl2qeQ0LgQnJD/en5OqtcsJjo7j3BPun
         u5l0wjegtg8cLH7YYW4Ot9JvEhc+i3EgSbObU6NztDMDawVQkMPo4BJ1wdYV5XQqL094
         FE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759906063; x=1760510863;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lApHdJux9f5HaHDvYFJdZledtrlyZnqA5mh2ah9fq9I=;
        b=ZpBFzYplBSBTWWORQ+frQlAP+3PQ6/G7dF6luSfBXeskP5gkYGk8EvRSBnD4CNLKAQ
         YnkzWp9/EU4SRge659x67kCOdFiXI0W7GKPJJWWexZaoVOQ7Yvgna5B7Wo9oWWnGKp7Y
         uzE4yKRZasD7iY/PhaE/v8/xHJAFZgEOW4qLozTvmdQ1qHIHIl1Cyu61roOcBu0IQIsf
         elRyxtEl+BVYUVWK7S/1zrv3wGnMm0/aQEgyvkFcqqnXHch0qM6SMIm282ktG07XmIp0
         ruhOAGlko1ASpVL73LIIW23A/QOAsV50vnVqg5dNiekEAS+IeV3L0RvTukU5M1vTgtGT
         YT/w==
X-Forwarded-Encrypted: i=1; AJvYcCVrPphDFc6LEJuaflX36ZXYGjNHmoKEKg4K+ZhP3zKAF7lbnd2KosRVsAcq2ypHVp/Ma/d5nCxEBn2hoPa6fj4OtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUiA60RDrhdyzqrzgLh+XKSpEwOlKVlNx4oRi4VYTylYjsPiKX
	XYRXEW56j4cGjEkv4o2CLnGsHLIIR34lIPEJmmnba/M0DomvqYBayo2XZzitoQFkrpU=
X-Gm-Gg: ASbGnctAwlR9mUR+8nsgB4c1AdpHhW8UGZooO+wdHSqfXb9jGDYBt1FYvVo4TY1JKTe
	WLOUFR1EtpHze3+tkwjHKnp1Re08tNH8Z7oGALQZWqSPRwqgZhAhNzmYmMeafsLuHalHS8Lemr8
	hqHNWTa+lbOf0aHn/8vB2zCQtXiDWUForEuebXSXihhuq5lBvZlr9lneCKXa/GY7bN6wahn0Xb1
	hVt60I+QS7SQssU3PEeCXr6rd8d6IfMqcUjlGF8CaGe1wbY/pYTLuCDyRGXaRSOeY8uPLEiBHv1
	sMzNxq+dc3gdgOSoqufMVv+vZMX0gVBFMJFaxsJF0jwD9Q3iXWzm8rZyiZoZslaQoPTxU8G0935
	kjcZ8ZVwvf7zNrdL2lpJO0LptPDGndD77T6IkUjGM3jecN5s/0SbP07IC1wA=
X-Google-Smtp-Source: AGHT+IGNNcVM43kk8VUBftqKwr1tQjHK/h8aYd29K5nV8PHNHdZwOaLf9AMLq/h21uNULN/u3Hae7Q==
X-Received: by 2002:a05:6000:18a9:b0:3f7:ce62:ce17 with SMTP id ffacd0b85a97d-4266e7d4406mr1233757f8f.38.1759906063281;
        Tue, 07 Oct 2025 23:47:43 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9c0d267sm23805485e9.8.2025.10.07.23.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 23:47:42 -0700 (PDT)
Message-ID: <f8bcf0e8-53a6-4a83-bf14-037110b03422@linaro.org>
Date: Wed, 8 Oct 2025 07:47:41 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Marek Vasut <marek.vasut@mailbox.org>, linux-mtd@lists.infradead.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-renesas-soc@vger.kernel.org
References: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
 <0e0f1195-fd08-4d8b-a247-3c94b5628081@linaro.org>
 <c0cd93b5-4e94-4e4b-9b84-c96e024bcc3e@mailbox.org>
 <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
Content-Language: en-US
In-Reply-To: <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

+ Takahiro, he works actively with IFX flashes.

Maybe we shall add a per vendor MAINTAINERS line, so that relevant people
are added by scripts/get_maintainer.pl.

No other comment after this line.

On 10/8/25 7:20 AM, Tudor Ambarus wrote:
> 
> 
> On 9/3/25 2:40 AM, Marek Vasut wrote:
>> On 9/23/24 10:54 AM, Tudor Ambarus wrote:
>>
>> Hello Tudor,
> 
> Hi, Marek,
> 
>>
>> sorry for the late reply.
> 
> That's okay.
> 
>>
>>> On 9/14/24 11:08 PM, Marek Vasut wrote:
>>>> The S25FS512S chip datasheet rev.O Table 71 on page 153 JEDEC Sector Map
>>>> Parameter Dword-6 Config. Detect-3 does use CR3NV bit 1 to discern 64kiB
>>>> and 256kiB uniform sectors device configuration, however according to
>>>> section 7.5.5.1 Configuration Register 3 Non-volatile (CR3NV) page 61,
>>>> the CR3NV bit 1 is RFU Reserved for Future Use, and is set to 0 on newly
>>>> manufactured devices, which means 64kiB sectors. Since the device does not
>>>> support 64kiB uniform sectors in any configuration, parsing SMPT table
>>>> cannot find a valid sector map entry and fails.
>>>>
>>>> Fix this up by setting SMPT configuration index bit 0, which is populated
>>>> exactly by the CR3NV bit 1 being 1. This is implemented via new .post_smpt
>>>> fixup hook and a wrapper function. The only implementation of the hook is
>>>> currently specific to S25FS512S.
>>>>
>>>> This fixes the following failure on S25FS512S:
>>>> spi-nor spi0.0: Failed to parse optional parameter table: ff81 (err=-22)
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>> ---
>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Cc: Michael Walle <mwalle@kernel.org>
>>>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>>>> Cc: Pratyush Yadav <pratyush@kernel.org>
>>>> Cc: Richard Weinberger <richard@nod.at>
>>>> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>> Cc: Vignesh Raghavendra <vigneshr@ti.com>
>>>> Cc: linux-mtd@lists.infradead.org
>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>> ---
>>>>   drivers/mtd/spi-nor/core.c     | 17 +++++++++++++++++
>>>>   drivers/mtd/spi-nor/core.h     |  5 +++++
>>>>   drivers/mtd/spi-nor/sfdp.c     |  4 ++++
>>>>   drivers/mtd/spi-nor/spansion.c | 27 ++++++++++++++++++++++++++-
>>>>   4 files changed, 52 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>> index 9d6e85bf227b..ca65f36e5638 100644
>>>> --- a/drivers/mtd/spi-nor/core.c
>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>> @@ -2405,6 +2405,23 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>>>       return 0;
>>>>   }
>>>>   +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    if (nor->manufacturer && nor->manufacturer->fixups &&
>>>> +        nor->manufacturer->fixups->post_smpt) {
>>>> +        ret = nor->manufacturer->fixups->post_smpt(nor, smpt);
>>>> +        if (ret)
>>>> +            return ret;
>>>> +    }
>>>> +
>>>> +    if (nor->info->fixups && nor->info->fixups->post_smpt)
>>>> +        return nor->info->fixups->post_smpt(nor, smpt);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   static int spi_nor_select_read(struct spi_nor *nor,
>>>>                      u32 shared_hwcaps)
>>>>   {
>>>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>>>> index 1516b6d0dc37..d5294424ab9d 100644
>>>> --- a/drivers/mtd/spi-nor/core.h
>>>> +++ b/drivers/mtd/spi-nor/core.h
>>>> @@ -413,6 +413,8 @@ struct spi_nor_flash_parameter {
>>>>    *             parameters that could not be extracted by other means (i.e.
>>>>    *             when information provided by the SFDP/flash_info tables are
>>>>    *             incomplete or wrong).
>>>> + * @post_smpt: update sector map configuration ID selector according to
>>>> + *             chip-specific quirks.
>>>>    * @late_init: used to initialize flash parameters that are not declared in the
>>>>    *             JESD216 SFDP standard, or where SFDP tables not defined at all.
>>>>    *             Will replace the default_init() hook.
>>>> @@ -426,6 +428,7 @@ struct spi_nor_fixups {
>>>>                const struct sfdp_parameter_header *bfpt_header,
>>>>                const struct sfdp_bfpt *bfpt);
>>>>       int (*post_sfdp)(struct spi_nor *nor);
>>>> +    int (*post_smpt)(struct spi_nor *nor, u8 *smpt);
>>>>       int (*late_init)(struct spi_nor *nor);
>>>>   };
>>>>   @@ -660,6 +663,8 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>>>>                    const struct sfdp_parameter_header *bfpt_header,
>>>>                    const struct sfdp_bfpt *bfpt);
>>>>   +int spi_nor_post_smpt_fixups(struct spi_nor *nor, u8 *stmp);
>>>> +
>>>>   void spi_nor_init_default_locking_ops(struct spi_nor *nor);
>>>>   void spi_nor_try_unlock_all(struct spi_nor *nor);
>>>>   void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
>>>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>>>> index 5b1117265bd2..542c775918ad 100644
>>>> --- a/drivers/mtd/spi-nor/sfdp.c
>>>> +++ b/drivers/mtd/spi-nor/sfdp.c
>>>> @@ -765,6 +765,10 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>>>           map_id = map_id << 1 | !!(*buf & read_data_mask);
>>>>       }
>>>>   +    err = spi_nor_post_smpt_fixups(nor, &map_id);
>>>> +    if (err)
>>>> +        return ERR_PTR(err);
>>>> +
>>>>       /*
>>>>        * If command descriptors are provided, they always precede map
>>>>        * descriptors in the table. There is no need to start the iteration
>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>> index d6c92595f6bc..d446d12371e1 100644
>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>> @@ -757,6 +757,31 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
>>>>       .post_bfpt = s25fs_s_nor_post_bfpt_fixups,
>>>>   };
>>>>   +static int s25fs512s_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
>>>> +{
>>>> +    /*
>>>> +     * The S25FS512S chip datasheet rev.O Table 71 on page 153
>>>> +     * JEDEC Sector Map Parameter Dword-6 Config. Detect-3 does
>>>> +     * use CR3NV bit 1 to discern 64kiB/256kiB uniform sectors
>>>> +     * device configuration, however according to section 7.5.5.1
>>>> +     * Configuration Register 3 Non-volatile (CR3NV) page 61, the
>>>> +     * CR3NV bit 1 is RFU Reserved for Future Use, and is set to
>>>> +     * 0 on newly manufactured devices, which means 64kiB sectors.
>>>> +     * Since the device does not support 64kiB uniform sectors in
>>>> +     * any configuration, parsing SMPT table cannot find a valid
>>>> +     * sector map entry and fails. Fix this up by setting SMPT
>>>> +     * configuration index bit 0, which is populated exactly by
>>>> +     * the CR3NV bit 1 being 1.
>>>> +     */
>>>> +    *smpt |= BIT(0);
>>>
>>> Please help me understand this. Maybe a link to your revision of
>>> datasheet would help me.
>>
>> https://www.infineon.com/assets/row/public/documents/10/49/infineon-s25fs512s-512-mb-1-datasheet-en.pdf
>>
>> SMPT values:
>>
>> i=0 smpt[i]=08ff65fc
>> i=1 smpt[i]=00000004
>> i=2 smpt[i]=04ff65fc
>> i=3 smpt[i]=00000002
>> i=4 smpt[i]=02ff65fd
>> i=5 smpt[i]=00000004
>> i=6 smpt[i]=ff0201fe
>> i=7 smpt[i]=00007ff1
>> i=8 smpt[i]=00037ff4
>> i=9 smpt[i]=03fbfff4
>> i=10 smpt[i]=ff0203fe
>> i=11 smpt[i]=03fbfff4
>> i=12 smpt[i]=00037ff4
>> i=13 smpt[i]=00007ff1
>> i=14 smpt[i]=ff0005ff
>> i=15 smpt[i]=03fffff4
>>
> 
> thanks!
> 
>>> In the flash datasheets that I see, there shall
>>> be a "Sector Map Parameter Table Notes" where a "Sector Map Parameter"
>>> table is described showing an Index Value constructed by the CRxNV[y]
>>> return values. That index value is the map_id in the code.
>>>
>>> By reading your description I understand CR3NV[1] has value zero as it
>>> is marked as RFU, but at the same time that bit is expected in SMPT to
>>> always have value 1. That's why datasheets like this one [1] in their
>>> "Table 70. Sector Map Parameter" do not describe CR3NV[1] at all, and
>>> define the index value as CR3NV[3] << 2 | CR1NV[2] << 1 | 1.
>>
>> Where does this last part "define the index value as CR3NV[3] << 2 | CR1NV[2] << 1 | 1" come from ?
> 
> In your datasheet flavor, from "Table 70 Sector map parameter", page 152,
> "Index Value" column. I deduced the formula by using the CR3NV[3] and
> CR1NV[2] values. The datasheet says:
> 
> "When more than one configuration bit must be read, all the bits are
> concatenated into an index value that is used to select the current address map."
> 
> and that the "the following MSb to LSb order to form the configuration map
> index value:
> • CR3NV[3] — 0 = Hybrid Architecture, 1 = Uniform Architecture
> • CR1NV[2] — 0 = 4 KB parameter sectors at bottom, 1 = 4 KB sectors at top
> "
> 
> The "Index Value" shall be the map_id that you passed in the code:
> spi_nor_post_smpt_fixups(nor, &map_id);
> 
> Can you please print the map_id value that you obtain without updating it?
> Let's also print the values of CR3NV and CR1NV.
> 
> (idea for enthusiasts: we can add a debugfs interface to query registers)
> 
>>
>>> I assume what you're doing is fine as it shouldn't break backward
>>> compatibility with other older flashes as their CR3NV[1] has value one
>>> anyway. Correct me if I'm wrong.
> 
> Now that I revisited the datasheet, your comment "use CR3NV bit 1 to discern
> 64kiB/256kiB uniform sectors" is misleading because a) I understand that
> CR3NV[1] is not involved in the sector map selection (the "Index Value" is),
> and b) the choice as per table 70 is between uniform 256 KB sectors and
> non-uniform map with 4KB sectors at top or bottom and the remaining 256KB.
> 
> Let's get those CR3NV and CR1NV values so we decide how to tackle this.
> 
> Cheers,
> ta
> 
>>
>> I hope so.
>>
>>> Now looking at the code, what we usually do is to save the flash
>>> parameters described by SFDP in nor->params, then amend those parameters
>>> with fixup hooks if that's needed. Here you modify the map_id and then
>>> let the code use it in order to determine the sector_map. Then that
>>> sector_map (which is SMPT data from the table itself) is used to
>>> initialize erase regions. That sector_map can contain wrong data too.
>>
>> By sector_map, do you refer to the "smpt" array ?
>>
>>> I'd suggest saving a nor->params->sector_map then call a
>>> int spi_nor_post_smpt_fixups(struct spi_nor *nor,
>>>     const struct sfdp_parameter_header *smpt_header,
>>>     const u32 *smpt)
>>> in case spi_nor_get_map_in_use() fails. This way others can update
>>> sector_map as well if that's ever needed. What do you think?
>>
>> This won't work for me, would it ? In my case, I need to patch content of CR3NV register to assure CR3NV bit 1 is well defined. I don't need to patch the sector_map itself.
> 


