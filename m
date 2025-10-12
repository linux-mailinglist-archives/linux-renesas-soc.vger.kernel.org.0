Return-Path: <linux-renesas-soc+bounces-22905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CB4BD070B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Oct 2025 18:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7704C3C06B1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Oct 2025 16:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94EB62F0C49;
	Sun, 12 Oct 2025 16:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="niWnhV19"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407772EF667
	for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Oct 2025 16:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760285982; cv=none; b=triTvixbCvXx8Ja+zVlRe+Tahhx1C1tc/SWn6usAgD1fj2UrRB6Ul506cP1y+i8K/ZIEMYWu7rAXnP9POs2xNm2pNrUkPeNqRtEHXjC3yhzNjcm/3uK//XCP4f7rj3Y9PI/ZwI4nQobpp/7ZyhMHQCV35ERS37eVj/d2D5H1TuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760285982; c=relaxed/simple;
	bh=c5N2IxzyjX6REXtO3DOTS4p7M02KXi/wvDSO63pzoZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/OjTAbjW73ZXkNHuG6lK5bA7MZxo4Vaw2UFCGHrz8qOEiEGB2riy7oGNhof6TgjNav2pu0KcuILGRpwkZnEwsAt7G4CTJ9vqlwPph2TX7GhpQH2Y0x0fEnLj/+TMvnSJZp77n5ugc2+/z6dqq3agZI8sXnOdfWNt7OaEykjP+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=niWnhV19; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cl5K56BwWz9sNw;
	Sun, 12 Oct 2025 18:19:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760285961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TTVGhi4rnwPwUOPPSMOjl9iwr7lLgw+vjjgrWUfzcVI=;
	b=niWnhV19nCimFJfERMg6CA5bJ7FO6qUylXCnF2Q0j8Y282rut9SrP/lYvFtJQndqNCJgZM
	WZVVRU5JntIwTftZMYzziK+rYR5zhKECeorAhLTRH7W2QcF9pwLaW9pPApfpNtkYr90xst
	8/SoUd9Iv6RmuPWkQ5TkY6KsE1v4SfNluMcyazna0CFP/4HQUg1n7skZJcq9W0yoIDr0aN
	f69bX5v9KIyRmLk8oJSpWEscrQLm0tYWG+zfLkcfa+yryUholzpFMKdugM1qazzbcEmULi
	MB2RFWCBfnvGFNKFoBo1Ikk6zmDtPt2tfMKQekLv3fD6vVE7PhrGIKp5Y9YMvg==
Message-ID: <54058c12-3932-4dc1-bc51-6627fb46094a@mailbox.org>
Date: Sun, 12 Oct 2025 18:19:18 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org
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
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: fcbea66f86f54376f84
X-MBO-RS-META: 6ff8nrurfn4sqzkrxa4joi8fhgofw6dq

On 10/8/25 8:20 AM, Tudor Ambarus wrote:

Hello Tudor,

>> sorry for the late reply.
> 
> That's okay.

Thank you

[...]

>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>> index d6c92595f6bc..d446d12371e1 100644
>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>> @@ -757,6 +757,31 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
>>>>        .post_bfpt = s25fs_s_nor_post_bfpt_fixups,
>>>>    };
>>>>    +static int s25fs512s_nor_post_smpt_fixups(struct spi_nor *nor, u8 *smpt)
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

0x4

> Let's also print the values of CR3NV and CR1NV.

Both 0x0 and 0x0 .

