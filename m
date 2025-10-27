Return-Path: <linux-renesas-soc+bounces-23708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C49BFC11AD3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 23:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D303A400A35
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 22:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C839A2E5B26;
	Mon, 27 Oct 2025 22:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="twIrxGf5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC7031A7F9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 22:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761603746; cv=none; b=WjUwExUV1ePBVwMvUz5pWLMTyNWxX2UDX4NyJr3iDNfXVRpUJcl94p8jmA4stwtCHp9UJKmi4uM8zSl7gIkW7X7xhG0xJllU+hc5LkFVYUqtPHA4oo29uTEclsshrangiv8tnNSAD6N4PGYecys0n1gnzbFGf7tvqALXU/1YEzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761603746; c=relaxed/simple;
	bh=HsyNkni5+LJVwe8JVoUK/S4gZ/PUxuy2bCpDjD21M3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iSXK2pki0rKD3KRdxL9Do+AoXVWyGrixWwJRk54yVp6xdzAUlm1KD01zSlaVQ+sgPMPdz2CUNrlQfMkCTPQcs6X9yLmWs1fsCMJarUbDkEUMfqAvfzbPJYylnSrdFa2v2j+AvKhd+9UVTd1i18WO/zz7h9GtDoeIuV68CP5X2rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=twIrxGf5; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cwSft3ykxz9snh;
	Mon, 27 Oct 2025 23:22:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761603734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5/3pK6zujFDonsVj2GoPo8C7dKrLczRml5Rg3Cpg2kA=;
	b=twIrxGf5oAkz3VN2NbRBjR8Aifdehe6jVQaT6D0gc1Enkqi4s0H7CtYlTwmCuOrruc/gCS
	41yY7qfOypm+mgNu2FeYHfAeovMWn2rT4a0MG/MfsZP0Ou4xn97LNCJXTGUUTuy0YR87Z0
	ZavyRORIdMDPV/0GqSTY5ghET2OyPD6/hj6CluL73BFP6lG7OLWbaKHe6uS07KsoOZeuf8
	NCVnT906Zu5BJFR66Sd+1r9hIqirdu+5ndd1YUltTWuRRfIWjkSUwP9lC9nzdEecvjMGHk
	BhtG6Cv6Wxv+OHRIcyYHMxr29M3UfCEx+WKKk30FRa/B14zMbgkfxFXCMdDj5A==
Message-ID: <b4af0559-fde5-4321-a42d-8ec82377b61e@mailbox.org>
Date: Mon, 27 Oct 2025 23:22:11 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org,
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
 <31d9c086-4a5e-4f0c-b7b0-b948ac465aae@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <31d9c086-4a5e-4f0c-b7b0-b948ac465aae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: suwfgezzturkzkgm4o4bqr68wgcwcsgy
X-MBO-RS-ID: 85a3a3e40a0411e25df

On 10/20/25 1:35 PM, Tudor Ambarus wrote:

Hello Tudor,

I apologize for my slow response.

>>>>> The "Index Value" shall be the map_id that you passed in the code:
>>>>> spi_nor_post_smpt_fixups(nor, &map_id);
>>>>>
>>>>> Can you please print the map_id value that you obtain without updating it?
>>>>
>>>> 0x4
>>>
>>> This translates to CR3NV[3] = 1, CR1NV[2] = 0,  CR3NV[1] = 0.
>>>>
>>>>> Let's also print the values of CR3NV and CR1NV.
>>>>
>>>> Both 0x0 and 0x0 .
>>>
>>> But here CR3NV is 0, it contradicts the result from above.
>>
>> Maybe I messed up and was reading it the wrong way ?

I really wonder if I might be reading the CR3NV the wrong way ?

>>> Maybe it's the same problem that Takahiro identified: the flash needs
>>> 8 dummy cycles, but the code uses zero dummy cycles, resulting in
>>> reading garbage data, depending on whether your IO lines are pulled up/down
>>> or floating.
>>>
>>> Can you redo the test with the following please?
>>
>> Sure, although I saw some further discussion between you and Kuwano-san , is this still applicable ?
> 
> It's still applicable, it will confirm what Kuwano-san discovered:
> the flash needs 8 dummy cycles for using that read reg command.
> 
> We'll also need a hook to amend the CR3NV[1] value (which is reserved,
> zero on some flavors of flash) and replace it with 1, similar to what
> you did in this patch.
> 
> You can either test or let Kuwano-san come up with a patch addressing
> both issues and test his patch afterwards, sync up with him please.
> 
>>
>>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>>> index 21727f9a4ac6..85443c903e59 100644
>>> --- a/drivers/mtd/spi-nor/sfdp.c
>>> +++ b/drivers/mtd/spi-nor/sfdp.c
>>> @@ -752,7 +752,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>>                     read_data_mask = SMPT_CMD_READ_DATA(smpt[i]);
>>>                   nor->addr_nbytes = spi_nor_smpt_addr_nbytes(nor, smpt[i]);
>>> -               nor->read_dummy = spi_nor_smpt_read_dummy(nor, smpt[i]);
>>> +               nor->read_dummy = 8;
>>>                   nor->read_opcode = SMPT_CMD_OPCODE(smpt[i]);
>>>                   addr = smpt[i + 1];
>>>    @@ -767,6 +767,8 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>>                    * Configuration that is currently in use.
>>>                    */
>>>                   map_id = map_id << 1 | !!(*buf & read_data_mask);
>>> +               dev_err(nor->dev, "i = %d, buf = %02x, map_id = %02x\n",
>>> +                       i, buf[0], map_id);
>>>           }
>> Sorry for the late reply.
> yeah, no worries, it's still fresh.

With current mainline, without the aforementioned patch, with my 
CR1NV/CR3NV printing (maybe broken):

CR1NV=00
CR3NV=00
map_id=00000004

With the read_dummy=8 addition above and the dev_err, I get:

spi-nor spi0.0: i = 0, buf = 00, map_id = 00
spi-nor spi0.0: i = 2, buf = 02, map_id = 00
spi-nor spi0.0: i = 4, buf = 00, map_id = 00
map_id=00000000

The reported failure persists:

spi-nor spi0.0: Failed to parse optional parameter table: ff81

Let me test the patchset from Kuwano-san next .

Thank you for your help!

-- 
Best regards,
Marek Vasut

