Return-Path: <linux-renesas-soc+bounces-22954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCA1BD5063
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 18:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63C7B5464E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD5A3081D6;
	Mon, 13 Oct 2025 15:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qi08nNVG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431D63081D3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 15:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370115; cv=none; b=F1s7cAp6CztMwjXgNUbLroLixqRDItn0X6AFY+Lx7SQ39XEB4DsrkoqaoZQx6q+UAl8B/y1XRM4rTp+DoPQk+vlkINDk9B3HLnp8BwobFjL7E/WJ8WzGmbTWXppFW0hgsOuZxbhEi12vblaNWqbuGQVdg4EGfHsVL05QMOxmw70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370115; c=relaxed/simple;
	bh=06TPhQyxr60GFPzcBmNOYvsB/bTvCVAJS3yaHsOuNCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKcf9erTLynp9qo7F5DDTZ2f2ymUH0a8BdZ7QsltGwKugC7c8XiEqV74QU/Q/ACNShFFcjXLTo1M/Bdo3H1R7cFNDlz4umI10j/7pAbjur3ztoIw88BknrpXBQWH1M0OsQqklxL4YlxR5fZIUs06g8xCH79VCiYhyHrH9K60CzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qi08nNVG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e47cca387so43842945e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 08:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760370111; x=1760974911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m0cgqSzE/Lkny12oGQRJ+XqTG+cD4gi7Ovvpfz4TdUk=;
        b=qi08nNVG//W+8/WR+EEZEV23umdSo9CVd7txxCNnQFi7llPkmHQQLxJ1yMsoYaj/uk
         9JOaxR9ZLTw98WzGPDdzxPhtK3EiU8s8jeb/oTbNw3V5sjJc3A8gtnkSxMikG5LnJjGM
         hazwWqPETG6oBs1FM0gKs+LIrCcv5J5AZVY+oOzNpODl+W88+TmKqsZS+vgKZ9fe2KU0
         mUTxraRGC9pgCs0AKu68GZYAPxBVMp4YQJJ1btOevR+5tP1ASFkSPaKWxCinrdEJZAAt
         fSzS2M5TRaoXiDH7VKSJL4iklJtTiQmouZ4tQ20csSyyToGuubFA5dQq56ulNoH7+99R
         7UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370111; x=1760974911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m0cgqSzE/Lkny12oGQRJ+XqTG+cD4gi7Ovvpfz4TdUk=;
        b=wqgTZQQbnvLHt0aWraQDTIJVD67KkyiKzP8Nla5TTHCHgYtLH+iPIE8zxKtOekj+wh
         JlUeCc2HrBALWbNLIDoQo3SUsnmipJ5bh7frq5P4RenL7AGoQSzE/t9/LS3ln1OUxTjC
         Pfc6PksbBFtSghgBjtuxb4R7qz3Fotjufzkc4LuonoXbMQ2lJ626q0IUv6Wgm0aX+9SG
         61MfmPheJEqTURe7JgRRKsPFxuM2G7qXEEly+ojOWpJdr6qKEiaFmk5msl+xWQblMt6Y
         HDyWaFJ3f+AlS0o2GIltefRj3OW9o4wNYdf19DxCohr+90+OHyyJtvzOxa7uv+iMCijY
         BQTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKkYmI8J5YV8dFDtdSAf7AVj+IcVZKFTx07KoMGq7GkgdAuM4RXu3W9FNaW+osG9Ay/fLN5JGotwH/Ta/VqX8bzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgVG5noxM58hep7W61lRTJvA7JqbOV6RSdvCAwrQgY7PcaRP8k
	fPpV7DG1Tl8tRHIjUPiFcNKLS8SPWyqNUintRCIyyTGaG8KzGFYqjC2RR3nEWW+HW1w=
X-Gm-Gg: ASbGncteXvRAiWhtWI38UKLf1xeswze9wAa7nUsQyzmuIlkW2ivZu+k7usg2z6xwtua
	xdFTqJgpzUQLa9PRp5aR+Q3L4z81k22oHRQ9I30ccZP+sav5UVbMoMGyIeXdI5ilYhI8nATNeEG
	QKODQpnO+0AbBjZGuMr175Rrwpwl5Kj3a5ppJGYztw9FwSb1naKm4OdgR8QwpOMwa30P/5TTAVC
	E5On9bjbER4Ci+PTZ6m9clS0urYxtEJKEmNFknwH+6VmEq2lIVnjL0+joCdmCZSzFsv5MuD2CGU
	nOb9myHKngT/Qx+mN9Dg4CvlUrSmtV+6dDI3MHilWqgTpNAGIduU+R9eorFksv+Dz7fXTo7WiFU
	FWrAoIRYpa8XgsHmx4PTQkAq2JmLlPRNuFcIjGmyjRRVONL/xJoWe3p/Bl6G+NSRR
X-Google-Smtp-Source: AGHT+IFKYw7QIOx3KawOwzG5qTW3beZOTdk9+jOTSPXwHNds5Qi4tQ8FekRB2sLyFkvKy6W5j9kTDA==
X-Received: by 2002:a05:600c:3f1b:b0:46d:5189:3583 with SMTP id 5b1f17b1804b1-46fa9a20793mr152610355e9.0.1760370111512;
        Mon, 13 Oct 2025 08:41:51 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5d0006sm19059187f8f.34.2025.10.13.08.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:41:50 -0700 (PDT)
Message-ID: <7732351b-bf21-423d-bb70-177001cd24b9@linaro.org>
Date: Mon, 13 Oct 2025 16:41:48 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Marek Vasut <marek.vasut@mailbox.org>, linux-mtd@lists.infradead.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Takahiro Kuwano <tkuw584924@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-renesas-soc@vger.kernel.org
References: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
 <0e0f1195-fd08-4d8b-a247-3c94b5628081@linaro.org>
 <c0cd93b5-4e94-4e4b-9b84-c96e024bcc3e@mailbox.org>
 <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
 <54058c12-3932-4dc1-bc51-6627fb46094a@mailbox.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <54058c12-3932-4dc1-bc51-6627fb46094a@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/12/25 5:19 PM, Marek Vasut wrote:
> Hello Tudor,

Hello!

>>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>>> index d6c92595f6bc..d446d12371e1 100644
>>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>>> @@ -757,6 +757,31 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
>>>>>        .post_bfpt = s25fs_s_nor_post_bfpt_fixups,
>>>>>    };
>>>>>    +static int s25fs512s_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
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
>> The "Index Value" shall be the map_id that you passed in the code:
>> spi_nor_post_smpt_fixups(nor, &map_id);
>>
>> Can you please print the map_id value that you obtain without updating it?
> 
> 0x4

This translates to CR3NV[3] = 1, CR1NV[2] = 0,  CR3NV[1] = 0.
> 
>> Let's also print the values of CR3NV and CR1NV.
> 
> Both 0x0 and 0x0 .

But here CR3NV is 0, it contradicts the result from above.

Maybe it's the same problem that Takahiro identified: the flash needs
8 dummy cycles, but the code uses zero dummy cycles, resulting in
reading garbage data, depending on whether your IO lines are pulled up/down
or floating.

Can you redo the test with the following please?

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 21727f9a4ac6..85443c903e59 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -752,7 +752,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
 
                read_data_mask = SMPT_CMD_READ_DATA(smpt[i]);
                nor->addr_nbytes = spi_nor_smpt_addr_nbytes(nor, smpt[i]);
-               nor->read_dummy = spi_nor_smpt_read_dummy(nor, smpt[i]);
+               nor->read_dummy = 8;
                nor->read_opcode = SMPT_CMD_OPCODE(smpt[i]);
                addr = smpt[i + 1];
 
@@ -767,6 +767,8 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
                 * Configuration that is currently in use.
                 */
                map_id = map_id << 1 | !!(*buf & read_data_mask);
+               dev_err(nor->dev, "i = %d, buf = %02x, map_id = %02x\n",
+                       i, buf[0], map_id);
        }
 
Cheers,
ta

