Return-Path: <linux-renesas-soc+bounces-23421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BEABFB581
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 12:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4930189158A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 10:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC2E31E0FE;
	Wed, 22 Oct 2025 10:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDiQhTt7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0431315D41
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128035; cv=none; b=qpceceVt85COma4AM17Lze82YlTGWBfxaMXxKz13ef0bQi0FebtLtneEM60pVMUoZd1oVn+ulmJz8WQGQZTTAd3RdfuCXn3Qvu+2MRrDOyT1d1UirhwZzbST/6r5Gz+07bUet6suJI4FeYK3gq0t1lVNFDOcdedFOlIHBsO/qqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128035; c=relaxed/simple;
	bh=BF5ShB5c0BTgz7Msut/IGByKmDGJuWMtKuMZjpb6TZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZtHkEb0GE4ojHePRd8yMD+t+NM566p0NTfwATVEAG6T4Dt9CIWGlZlLn1rF/+kkxvqNAiSfa61wk02fKIPKA3+fdDZA1ZVP7yYNYPGvsC8TodjguozAUvpok6V2ry1gPEvwzNMmT2obSmtLd1fjLDNglW8tsnGMGnf/7fEmSq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDiQhTt7; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-33b5a3e8ae2so798736a91.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 03:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761128031; x=1761732831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+P7bvsK2sVwN9lA/uy3EC8ga40hp3/IFLOS4kvysOKE=;
        b=EDiQhTt7ncrfLPhLlVVkpqGlwH4+nOA3V1PdSjL/GWdOHG1Gg3OjSV6Ux8LIga1fAg
         U5uVeQvGsh/m2upTqQAhrgZ92qA6HBRxfw9NMvUHqKZNAUnyteADZKTpLs7aIww7LwcD
         gTCTIZuSX9HtlXhDbNwIrYIhxiyei6Y82CSlq7Cngqq6tBYpAcSGOsNivu+WSmozZlGm
         WJRGCCCeyWCeT+d6jeLq0qHs1fXstmu+4VWzoF7vPF3maO1hRlTirMG+HX+aHTu2YFUT
         ZI8E0uT8WxbSi9rDKN97ZqtXf90ahE0hNWBYHpw5o+rmCVZko8wWR3iuqPZv+E0Galpm
         Gisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761128031; x=1761732831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+P7bvsK2sVwN9lA/uy3EC8ga40hp3/IFLOS4kvysOKE=;
        b=UMzss3SsmneBv170GLgVQQSYtlqPpG/dfQPs62mj6ZhEds+M8LMahAba90zUJ9Asdy
         gmbU8I4gdQxr4Oz/6D1abYlvvjSNRQnzRRgq66n0RDJ+4+ArDUelIK8wxmgz0LR6N7F1
         +YieYLxtJBp3TDi1Z95CdpyZgQHz7lZ5Z2NT6Pa6NoJCx1zaGC5E5WrIlDovrbxEbEXL
         B2L6Hq9T8b8hBnbliMh2tNLNurBXDXBMGUlka8MT+cZ8XR5lCPmtS+NVPfwYiVAy0zbK
         sWMRaz/05BH2oKJi/Fi3IQXM5WeGVTkNlxcTfps+f0BWKFiFXgT3IVKl/Rz5Pnb+WrtM
         BVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCViVpfQIFhcJXUnKDeqnX/3Im5Hu8NANq3Ldbwq94P4PjmjVgphyiMTAeBQeN3LKBpoutv1oRiFSItLMcHxYF6T/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpJ/V1cCCz4xvOQisBakKva+OMP6qLus1VKLO/aBbakKsTh7aJ
	gTTE79C2esJpqBChXpKL2iLVgYvBD5DxNdXYuqx8fl+6Ml5IuEv+z9mN
X-Gm-Gg: ASbGnctI+mZeQYJydxqNPslvxUnn2AhhM9ByFWhSq1Ii8aE1kcXpe0SdpxaiqylWzO4
	relOoph1/9Bdw9SgXJ6uZ547dQLL/lZbc7xqZkt/wKd1g4IZHqcpOK3JrvdkEnfYcX2PnLz7duW
	u89Rm1hk4GNZJMCOJIi7FLmHjpfD0tGNOfOAi1hllvfQbXVgR4aYyNzAwo0jRo++lPTk7aj8Ja0
	Ml4c4+CVQ0Qz8dS8fQdrV2HBypAyKTlq3cwZMJytzSOnXuCcpI37UxesgwvCr9ie8SvfXH+9ObX
	xE1qbFGAo60Of2RTUUVI1azZ7mYvan/21loP43Omh5SnbQlzRUhQCJzhdcz6I3l4GMgU6Wu6TBQ
	YpFKA8OlyvAxP9bHukZxLEccOvFGXSIP4QZsmGRoek5OzvbhRF3hZrfyaxVEgrwbLFzpk2xSW+/
	lNfM0UQXTtJz653DlURhkK809oR9L9xqg8RkYKQYu0GRH6pOqivA==
X-Google-Smtp-Source: AGHT+IH5o7Y8lzLyBnCro6lbcAsLtmI2D6CLO+EFPq8WhZqx0C8KzjC0TEtoYNySI4TY/LcAfrkQmw==
X-Received: by 2002:a17:90b:1c06:b0:31c:39c2:b027 with SMTP id 98e67ed59e1d1-33e21ef1205mr4504235a91.7.1761128030798;
        Wed, 22 Oct 2025 03:13:50 -0700 (PDT)
Received: from [192.168.0.5] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1591dsm14398008b3a.7.2025.10.22.03.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 03:13:50 -0700 (PDT)
Message-ID: <53b6f061-d8b1-4228-b647-9d229f03b999@gmail.com>
Date: Wed, 22 Oct 2025 19:13:46 +0900
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
 <54058c12-3932-4dc1-bc51-6627fb46094a@mailbox.org>
 <7732351b-bf21-423d-bb70-177001cd24b9@linaro.org>
 <6426cb80-249b-4ebd-9826-91c87299f7b6@mailbox.org>
 <31d9c086-4a5e-4f0c-b7b0-b948ac465aae@linaro.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <31d9c086-4a5e-4f0c-b7b0-b948ac465aae@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Tudor and Marek,

I have submitted new series.
https://lore.kernel.org/linux-mtd/20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com/T/#m2fa41b89e36d6061df9e979f49c573e46fd0d5c4

Please review and test then give feedback.

Thanks,
Takahiro

On 10/20/2025 8:35 PM, Tudor Ambarus wrote:
> 
> 
> On 10/17/25 5:04 PM, Marek Vasut wrote:
>> On 10/13/25 5:41 PM, Tudor Ambarus wrote:
>>
>> Hello Tudor,
> 
> Hi!
> 
>>
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
>>
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
>>>                    read_data_mask = SMPT_CMD_READ_DATA(smpt[i]);
>>>                  nor->addr_nbytes = spi_nor_smpt_addr_nbytes(nor, smpt[i]);
>>> -               nor->read_dummy = spi_nor_smpt_read_dummy(nor, smpt[i]);
>>> +               nor->read_dummy = 8;
>>>                  nor->read_opcode = SMPT_CMD_OPCODE(smpt[i]);
>>>                  addr = smpt[i + 1];
>>>   @@ -767,6 +767,8 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>>>                   * Configuration that is currently in use.
>>>                   */
>>>                  map_id = map_id << 1 | !!(*buf & read_data_mask);
>>> +               dev_err(nor->dev, "i = %d, buf = %02x, map_id = %02x\n",
>>> +                       i, buf[0], map_id);
>>>          }
>> Sorry for the late reply.
> yeah, no worries, it's still fresh.
> 
> Cheers,
> ta


