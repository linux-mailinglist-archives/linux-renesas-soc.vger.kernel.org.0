Return-Path: <linux-renesas-soc+bounces-23255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D72F1BEAECD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 18:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B71C55A03C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 16:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348CB2C027E;
	Fri, 17 Oct 2025 16:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BWF3yg54"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF282E8882
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 16:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760719886; cv=none; b=I3qdMV8neQQy4k5K2W2NhYdWg1xX7kUrB5ODqDjkSfiC+Mso+fH0MBmD8jj/SS8iCzfltBpgRcWvqp5h+tEagLMrn40F5wmVx4MEgNAzgxX/CV5TfxmdFdL46paugRIKLoQS9wdyQtNoXxGUMgb2+RDMaqEZqWtjpBmUCCvf5k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760719886; c=relaxed/simple;
	bh=oqiFxGMnLqRrMkrdAsvjVjLt6XjtrdNFQ/bU24xMJPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+66zx47Qbll2dAcXZSfQpTT5Wom5k6kpC/TdOm9U4VrWNyVl4FUwMAcTrEKsWTJX/3p/eKcFqHR+E3o3P7S2Mq5X+BPdpmKnqRnFd5gUKK7YMoYUrHurBeswr7UWsFEfHirkhhCukBZqjG4yN8uEsKydqGfYVCfYt45/rQQ2eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BWF3yg54; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cp9ng5HpGz9srJ;
	Fri, 17 Oct 2025 18:51:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jIKeB5CQhhRPKbeo1qJepeHkfAJbZnPhMPeHkZf6nQ=;
	b=BWF3yg54b3Lnhf2AJh2Zr+YdNBLmsxPtolOLfuJYp9ya/vYL4edsOiiP9K5g7R8IwJQz+w
	banMzejlrNxzfscA1LJQ05ybqG+oBwsO3u0/DMG7XBHXDunU89Bklym7OCizeBoHy8RrWK
	5/I2sZTJ+7Rhzx0wLb2gT3WQ2tGst1jqtMOoF7hgRu2zO6tnkw0c+/e5UC06ARjGnpfvWl
	ycSRgOV9gfGzVNUmH9ALoLZWEPL4MFyw26NVaC0t4pSeAKRqCbkRetHJe8TXkqYL/oP7YF
	IU31I1EXb1dMvcINvSq4XfUb8TTmCESfsLrp/I5E3PjBFwMPWgm7aF4SBEspjA==
Message-ID: <6426cb80-249b-4ebd-9826-91c87299f7b6@mailbox.org>
Date: Fri, 17 Oct 2025 18:04:16 +0200
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <7732351b-bf21-423d-bb70-177001cd24b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: fd004e20aedda8e2407
X-MBO-RS-META: 6mzo15prrcdzk15kadqathdwyffz8kmb

On 10/13/25 5:41 PM, Tudor Ambarus wrote:

Hello Tudor,

>>> The "Index Value" shall be the map_id that you passed in the code:
>>> spi_nor_post_smpt_fixups(nor, &map_id);
>>>
>>> Can you please print the map_id value that you obtain without updating it?
>>
>> 0x4
> 
> This translates to CR3NV[3] = 1, CR1NV[2] = 0,  CR3NV[1] = 0.
>>
>>> Let's also print the values of CR3NV and CR1NV.
>>
>> Both 0x0 and 0x0 .
> 
> But here CR3NV is 0, it contradicts the result from above.

Maybe I messed up and was reading it the wrong way ?

> Maybe it's the same problem that Takahiro identified: the flash needs
> 8 dummy cycles, but the code uses zero dummy cycles, resulting in
> reading garbage data, depending on whether your IO lines are pulled up/down
> or floating.
> 
> Can you redo the test with the following please?

Sure, although I saw some further discussion between you and Kuwano-san 
, is this still applicable ?

> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 21727f9a4ac6..85443c903e59 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -752,7 +752,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>   
>                  read_data_mask = SMPT_CMD_READ_DATA(smpt[i]);
>                  nor->addr_nbytes = spi_nor_smpt_addr_nbytes(nor, smpt[i]);
> -               nor->read_dummy = spi_nor_smpt_read_dummy(nor, smpt[i]);
> +               nor->read_dummy = 8;
>                  nor->read_opcode = SMPT_CMD_OPCODE(smpt[i]);
>                  addr = smpt[i + 1];
>   
> @@ -767,6 +767,8 @@ static const u32 *spi_nor_get_map_in_use(struct spi_nor *nor, const u32 *smpt,
>                   * Configuration that is currently in use.
>                   */
>                  map_id = map_id << 1 | !!(*buf & read_data_mask);
> +               dev_err(nor->dev, "i = %d, buf = %02x, map_id = %02x\n",
> +                       i, buf[0], map_id);
>          }
Sorry for the late reply.

