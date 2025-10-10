Return-Path: <linux-renesas-soc+bounces-22863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 261D2BCBC05
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 08:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9A01534FA66
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 06:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405857261A;
	Fri, 10 Oct 2025 06:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBnQu+C2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EBF23CB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 06:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760076068; cv=none; b=FCBGZeoiF8TQ6g2gYIzmPyrGAc6FNwakmptOA5n7p9gIXzCTDw3cuPFLiXZMbY4Jx63GccP6asRyOPZxiPSuurGtseVNmDmWxlYQ+h+r5M7jzvNa9kAB9Mqi8UfLqdLzbCTwMKa79h8s06a2E9riQSEZs20hh9KWOUom7W35MzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760076068; c=relaxed/simple;
	bh=8H7f0xjM6hHcy5st+LNC8ErHq65uKGs/9PT1CE1joBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MN3ATzh57/GVyJ/bt4C5+TclUnBYubv9RLkHuY7/hZtS+b+fh5/bHj6uCyc4sMT4kQr8pU1J/6paj5X1H29Qx3pl5Y5aT/KXGMbCJLXsXs1FbR+bA4POaV8q36JWpqjg6cqAIrd9z1tztLzRB8y9sh1RGDCaHfj/Mia//6Nqvu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBnQu+C2; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b57bffc0248so1365859a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 23:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760076065; x=1760680865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBh7bOMRc8RfixJSwVg+w1UI1XG5H2Qj/otNH+QFWyo=;
        b=SBnQu+C2D/NzrrVgpeJxOEEOlfvbOHZyq3mIGMbHQSt2+aGzii4Vgo9JpeW2y2tuj0
         zd5eB5nG/KfkGp8XLh/ycqJD4ApdgSReoUpWNGCo7ViBZhN0G3IdXvp1ekCXl66vSroJ
         zOxjeab42vqJS+sVTwtriD+w3n+CsYS+lAo55suw1SNAZk1+rToD91YDonWngcqh3nvB
         tSZYCvBnQ/J3jyDLigtSMXFNrfBs/kZdLWqHMQkdt0vD6j24HEmxSpUjJoQnEXHCEKwp
         pW3mDEIxa7YeFIG+noAuiVneu2Ux76QC2lu9vJvVVHIW6t0cbYJe63y2996nIm5c7EXv
         pX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760076065; x=1760680865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBh7bOMRc8RfixJSwVg+w1UI1XG5H2Qj/otNH+QFWyo=;
        b=k2Eqg4OL0N2yz4Df36RrTkuxnrsW/B+FuQp0VNi6b42TllEqBc7wgirrrLGuEhYT/1
         K7WIr5RyaHMAxxH8fGChRMuGQ8HZbz+5tKj2AkZxRTztVOsuy0eR4w2daWZ2XFbmarce
         VN5RHic3nP8DmgVz/maNQatcxN5Lvfng0Bo2uvKY/3VUd4sZ3FWyJxc8My4xhaBn/44g
         rua6QluG5C6Ws0aYgSjhaIOdaWpOOR3EvlsVWQUsey6zHqzfEW3On+BWskh33M6Qa7Jg
         U+LCYVvO47dU4skw8ZuCzqbYchQHSsUnnDx49fhCPSb4ufTTNABxvom0769P3rCtSQ11
         LVxA==
X-Forwarded-Encrypted: i=1; AJvYcCUBXbmeWEVEOTxX6xWj60UxexcqRz1numFrd/+FkDQUIrwYYclFQUSGrIdgkgVi20hEPw6YPEkMwnlSCeUnFhU9Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvLmxfgS7GDu77S8mbGMq+zP4LRkh/9hOfBVpW3JrPybW2+EJk
	4Pd8+caOVjV5PUwb+/pLT8DqnBGeti+GzyuIHnkNA3crJMX39CvfZChu
X-Gm-Gg: ASbGncve8P1NJd1c5NKEEYkoZH/RmwG6NSAabXEJ0PamnnkyjtlyELvFgqvkD6XnTrl
	/wg2A70xSk0rpwQluCLnJZs4mTypGCEOjo8TyTJqna6Bj6xkm9z7kLlcH0eo6txeU9sN0xXK9Zb
	yV9qY45xu5wrPatzdYUvM/jFasiTn2CZHxFGTeu3QoTYrGRcCyjgvQub+jAeG/E10nUowTF7+qE
	ShXNzUGOCit7WAjm4BARnwnahD1J3wX0Y1NJInyTDKeOvonb1bzywMWqXorL5KfJ5IuBgM56Rc3
	rXFb69NTlGScnOwmqVjLfZAarRttquusyoQFhxwxI1tbDpai/4jWx1oQJBf8QkqFxF+X0iV7woq
	CY/txHjMOcVpboOll88w1uPLXvVpxmOrQxmrA8YYgKSUcXsO9ux5FKXGxAUMC4u8GyViTV+oH14
	64mqjPIYm+OSC/9NpUQOpXUW3DmA==
X-Google-Smtp-Source: AGHT+IGLnK+0xTAvqT3bOCBH+3gnuTTsOfWEH7N7R4Gl3MtTPgrPhCcGt+n0jmQhdzDbpyv8wy4hog==
X-Received: by 2002:a17:903:1904:b0:267:c1ae:8f04 with SMTP id d9443c01a7336-29027f22b27mr109943275ad.20.1760076065364;
        Thu, 09 Oct 2025 23:01:05 -0700 (PDT)
Received: from [192.168.0.5] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cc8bsm46268495ad.38.2025.10.09.23.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 23:01:04 -0700 (PDT)
Message-ID: <30512807-e10b-4414-8cb7-85b1a21ef9fc@gmail.com>
Date: Fri, 10 Oct 2025 15:01:01 +0900
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
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10/8/2025 3:20 PM, Tudor Ambarus wrote:
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
In old datasheet, Table 70 had CR3NV[1] column and the description about index
value had another bullet:
  • CR3NV[1] — 1 = 256 kB uniform sector size
These were removed when the default CRNV3[1] value was changed from 1 to 0.
As Marek pointed out, SMPT still involves CR3NV[1] expecting the value is
always 1.

> The "Index Value" shall be the map_id that you passed in the code:
> spi_nor_post_smpt_fixups(nor, &map_id);
> 
> Can you please print the map_id value that you obtain without updating it?
> Let's also print the values of CR3NV and CR1NV.
> 
I did this in my environment and found another, fundamental issue in SMPT
contents and the way to parse it...

The SMPT describes Configuration detection command latency as '1111b: variable
latency' and in spi_nor_smpt_read_dummy(),

	if (read_dummy == SMPT_CMD_READ_DUMMY_IS_VARIABLE)
		return nor->read_dummy;

This results in 0 latency.
However, in S25FS-S, register read latency is 8 cycles by default. That means
the SPI controller reads garbage data as CR3NV and CR1NV value. In my particular
environment they are 0xFF as IO1 is pulled up, so map_id is 111b.

Let me think about how we can solve this.

Thanks,
Takahiro

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

