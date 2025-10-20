Return-Path: <linux-renesas-soc+bounces-23317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 821C2BF0DB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 13:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 632114E3631
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 11:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2398D259CA0;
	Mon, 20 Oct 2025 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZFT611HV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ECE1D63D8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760960117; cv=none; b=GqaGpbAJ6M6qezbUGJqPwo1ylZsEMqX85IIDjYYl910bja1P3o178YGg5iNlWKqz7srvaeEyx7i/X3xwegvak0Zdvfs451UHOxng1OpXfZCN9hgSFc2Q9gYRuRYX/egnfG+669xiss/BGYtTqoSxlwv+QkfzmmZnCRf3Vyjku+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760960117; c=relaxed/simple;
	bh=QVfddinD1gbYse+0dO9HUZp7IWgrckoe7kjqn0sbFm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=irA2zJWLeFRK1FDCAzyvQ7kb/d4LbNFKHUSlE5qwsouSmysdkFI1RLFSwvuCy9+l6+o0KWm6USb0jQuzpDhJ0fb6BbMOIGVNXICyySMgvrDhRkeO2KMBTDO5a3m80/dQLIgjesZEtJTUj6UJrdWE5n1PB2gcp3rcINnTdVBUQjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZFT611HV; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63c09141cabso6313855a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 04:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760960113; x=1761564913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lVOiWvOXMFLpBcsmZhIb1ehYx8YPAUPw3m9ePPZKo/E=;
        b=ZFT611HV/EP1na6PgFjj/6KUiMkmpK1EHaT3NYf42EVua3YUtAqzrlD7z91O28ntPf
         CoUh/Lh9so84h4YRFWgGnu+a6rxPoKaFWOdj5+bmo3jo9xPQxLyv/qBNbUomP9caTL28
         uxAm0KjaWZqtwTCAXNfsUKgKudNo/842J7yYTXMZr2KgsOAIxMs52vXFE6NCrXzKrdYl
         FwEyoAWVK4vTBOg10m7w8s+W5MNf+9LpxTrc+3WoBRGMb/LRY242yVYVUEVvHmSZLks4
         Vot7lUmy1zs8V2Nwwi7FdAflB6x8L+8o5QT0hh2hTxFB49F4/j6F6AA2tHx891ZuGLOb
         MOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760960113; x=1761564913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lVOiWvOXMFLpBcsmZhIb1ehYx8YPAUPw3m9ePPZKo/E=;
        b=vRhO9j4Nc5RIxVSpX2cqz7Ulw3GUqalzdUg+UdTaVrQ86auzVjuUzcl04G7AGqj+Fl
         wNV+0iYyT+pDPVFrK30dDCpearQ1WJemGKB4Y704akJxyI0iYyViLrLGxL8PzcZn37Wu
         FhWsIVTyrDLDG976a2oLJkRXuS3dZOXS8EJUi4wwbAUlxyQM6eLZQT6ECzOL8gpfz66+
         VRRtpGFnsyBQn+2LvS7i7+HhI4QRJ8MjaHlnZvzZfG36rkrVRThZ9O7IyBB4YjF0j0oK
         KnrZ9DOZyib8t1flBfSk/ogaFjlTGqgseVsp08VvpgrgRQ/oLYlMTEBVJJkgmIdvT+dl
         X3BA==
X-Forwarded-Encrypted: i=1; AJvYcCXIqJw0rXwwVpmGcLJt9oJRtMrTPoQvksLM8akmrvmLHaA63lsKEgY+NV0mrYDiN+ePNE68mpsfVbafdsGEn/DWWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Lt+fArcTB7bKwxW9RdjyMZ0iLWP18DMzNelIlHi0Ynabub/0
	mEHiFKGdGmwSPrIJ0XBm3Ak5V74OJn8GEGSbW2lLpWJ5X8cG+yYa6dRgIycgWnoK8XU=
X-Gm-Gg: ASbGncuKMFNEr3m5zyHRKiFygTfUcOu+9+EhGWRC88nXlSulcUevX5c2I2qfSUgthPT
	dNk6XbypHIi3KJBWS5853JitJARr8pbKvxTwFM3dSBqQbtS4CLGG0MitfEddDESRfgZSAs6ijbF
	QCzvBvwt36hj3GHKa5/qo1krHrTBRN7wIiBldmfR6PxddkRAtNrKUtbBBQyR/AKJ4OfTakkFTIH
	kW9bQwR0xY7nWVbHE5rIlzY/4te2rmUahvUqL1vT+SSRbUvGVmosr4JK0X2mGOmNH8gz/29QoIQ
	O+Kmbe94uSnGShH/5zsWu+gyYyEuFTINKHo+FsGd1YdjJQGE5f+34bMyB2hScRsOo/bhOmsPFJy
	0238CgNHyo6G+LUCn2fbusAgaNzAdyph/827eShwEeLW+HVkKB9HP2QAwo1EuxQQvVgAByOsScG
	5hKaZhkCry
X-Google-Smtp-Source: AGHT+IGmQaYS5YQrTXUZnVbXbPa6WETnNR7RFo6LEjL9c8jO6SH0WaHZGgofjnkJG3Bekcn4U1sz+A==
X-Received: by 2002:a05:6402:2049:b0:634:6d87:1d28 with SMTP id 4fb4d7f45d1cf-63c1f6dfc43mr9044826a12.35.1760960112921;
        Mon, 20 Oct 2025 04:35:12 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4943027fsm6574326a12.26.2025.10.20.04.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 04:35:12 -0700 (PDT)
Message-ID: <31d9c086-4a5e-4f0c-b7b0-b948ac465aae@linaro.org>
Date: Mon, 20 Oct 2025 12:35:10 +0100
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
 <7732351b-bf21-423d-bb70-177001cd24b9@linaro.org>
 <6426cb80-249b-4ebd-9826-91c87299f7b6@mailbox.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <6426cb80-249b-4ebd-9826-91c87299f7b6@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/17/25 5:04 PM, Marek Vasut wrote:
> On 10/13/25 5:41 PM, Tudor Ambarus wrote:
> 
> Hello Tudor,

Hi!

> 
>>>> The "Index Value" shall be the map_id that you passed in the code:
>>>> spi_nor_post_smpt_fixups(nor, &map_id);
>>>>
>>>> Can you please print the map_id value that you obtain without updating it?
>>>
>>> 0x4
>>
>> This translates to CR3NV[3] = 1, CR1NV[2] = 0,  CR3NV[1] = 0.
>>>
>>>> Let's also print the values of CR3NV and CR1NV.
>>>
>>> Both 0x0 and 0x0 .
>>
>> But here CR3NV is 0, it contradicts the result from above.
> 
> Maybe I messed up and was reading it the wrong way ?
> 
>> Maybe it's the same problem that Takahiro identified: the flash needs
>> 8 dummy cycles, but the code uses zero dummy cycles, resulting in
>> reading garbage data, depending on whether your IO lines are pulled up/down
>> or floating.
>>
>> Can you redo the test with the following please?
> 
> Sure, although I saw some further discussion between you and Kuwano-san , is this still applicable ?

It's still applicable, it will confirm what Kuwano-san discovered:
the flash needs 8 dummy cycles for using that read reg command.

We'll also need a hook to amend the CR3NV[1] value (which is reserved,
zero on some flavors of flash) and replace it with 1, similar to what
you did in this patch.

You can either test or let Kuwano-san come up with a patch addressing
both issues and test his patch afterwards, sync up with him please.

> 
>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> index 21727f9a4ac6..85443c903e59 100644
>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -752,7 +752,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>                    read_data_mask = SMPT_CMD_READ_DATA(smpt[i]);
>>                  nor->addr_nbytes = spi_nor_smpt_addr_nbytes(nor, smpt[i]);
>> -               nor->read_dummy = spi_nor_smpt_read_dummy(nor, smpt[i]);
>> +               nor->read_dummy = 8;
>>                  nor->read_opcode = SMPT_CMD_OPCODE(smpt[i]);
>>                  addr = smpt[i + 1];
>>   @@ -767,6 +767,8 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>                   * Configuration that is currently in use.
>>                   */
>>                  map_id = map_id << 1 | !!(*buf & read_data_mask);
>> +               dev_err(nor->dev, "i = %d, buf = %02x, map_id = %02x\n",
>> +                       i, buf[0], map_id);
>>          }
> Sorry for the late reply.
yeah, no worries, it's still fresh.

Cheers,
ta

