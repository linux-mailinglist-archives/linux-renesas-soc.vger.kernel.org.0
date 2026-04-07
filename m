Return-Path: <linux-renesas-soc+bounces-30941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGotAyMf1Wnr0wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 17:13:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FEB3B0BBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 17:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0CBFB3025186
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 15:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0648136074D;
	Tue,  7 Apr 2026 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SrhCrVAr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B66033E35B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574776; cv=none; b=t9wfEj22Ud4sOOMfuv3lStLy9P073yMn1SKuiH+7qiFNwYysbcp/krfqC7A1eYjs/SBHGWu6BtVLV/J9rZXLqRodE3gyo3c/mGCvVmKf0yccFobUgYs6lYdz4wYAs2ZHpstw4PyW1jMfAtZguWx3ugUBVwAGliXjubF5RWhDSmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574776; c=relaxed/simple;
	bh=M5lgZ/rycwHwuDJmxlQA/pldnZYgh5o1O0sdz/ym/FQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rTEtSQXFZIQx/SR6cpdb+4JqWJTWwmf4vOhNm1nGldL2U/zcWt2ZHTz/dmnKFYBm8lTJo4aS6FH2tLAKEvnxZLHl34gYfTD4sEGxMBFEGN02H2YKgN3lmA+5LlT120Dl/iKDuukdTWZPSclNkJHXv7hLmPoSKO+nP6kBQ53IJh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SrhCrVAr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso47805945e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Apr 2026 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775574774; x=1776179574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1hN8mCBwc97NQZYyYnJTNMhtLwGP6OBa0knSNEhsEI=;
        b=SrhCrVArYbSnUexuuKKihGscalGqPI/QzOjFRrHaHr0HlRct9NO7fK80oF7pRUVnnZ
         AQyPhQDVlGJs8hhudrGECrHpN0BY/91AKdbFGKvJLHLRhi+52eBwW/kCT6XirIdABe0X
         tWEtEoYNyZas1wK2Se72Ska3wd27IZZ2Z+a+IRMT3/Ui8pEafrlnzgWd17lOl1+5d/uE
         BLO3DK2eZr+VR7CxRZg2xwvy4xjhZ18iqjspbZZmSbNsvQo+q/4Gv+LUtvyikfuwboqw
         aalWUZjk4oo6QTESph58pqtHp/PR2LjDdu4QTd+O3Ccj0aZLnFx8/5kgU7E1uU4RJXaZ
         Zgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574774; x=1776179574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1hN8mCBwc97NQZYyYnJTNMhtLwGP6OBa0knSNEhsEI=;
        b=c9wgbxoaJ8kattYVhk/IyyU7gVebwIlvPoW+sywy6za3zPq7qOoOKNhZi7IsNAtn/x
         KHdl6GHySro+BQoZ0gXXFEWIJ1IQgJWSEMEM2RMZ2FmoNC3QGv+At7LPO6GDUA7WM8Fm
         Lf2hQZsdvtbVlUtNAH25+TfxWqo5/w8ztKtEJTQnrm9nfUx3NbRR3/u7qckdtSwfZQE1
         xEqNZ92gg8Cb+iiZqG9+yFZqTV8y9HfKyZVYTg+twDA4AU7GzUIr587JtRnoD7O1N3jE
         2eDQCrJsbH7IlQXA/TqNyVFJMmngERxKvO3BF2bsY/8gNY9NZZSvO4CYdzgZJTxGYBhK
         dObQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTZ0N/Cbgg/3nwouG1ifyKEKzUmH9G3eOCxaBkZkb3N7DW9brp2y/ilibdET5oQllSJGpjl/A7f/qyrQvCXfqCDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVrDCB4dc8HNGevIRuqhJw5UO4JYTEeRh9N3yS5ZEQk5N7854D
	YMP1nlcRv/RTsiPkyCWlF7SWA2WT/pKHCoZBCicNy5grZLDmH6qoFyjA/cJiELfOYqo=
X-Gm-Gg: AeBDieuRNtpEIfrgbElk0CN1O6pmdvukGkKpa2SdFaOXIDUdhzTP4WZW2Wi6i8CqANB
	FLrjEjAh4eeRo2oLMdca2AQVsTal7QiHIFBBSefyxorDZ/nVZ6zQ3lFp5jX9ApPhd8EsafrLPwP
	Lwzqj1L2PbSXcBtBKK+odyrpI7zOJDdUSJ9xejY2lYvOY0cM31RVO0uogBGEBQP5jFkv9urGyxK
	lTU2XS/gfM0Md/GdIm0VmOiAmjPc4Dcw7yi1ZO6E/Tq5R8BFY9Sp1SQyo/N3EthRLRriH+cFnuL
	GaCZKI5x5i6gKzByltJdeF/cCtfz2ygnc0qOqW+TtgDoqhcTc2mbwKfr9GKW+8sDNla8wlA/ROA
	Al+XuI+R/oZw7Ps7yTyxEsBNv7lG5AmvBPalilKCmwu1X883pwKOBzv12Ve1ZMj2mzNlQqUkwFx
	A12pcjnat8P9ymoxcjMO9q3O0mvwbtNmJOX+F8lkS97Q==
X-Received: by 2002:a05:600c:3b1b:b0:485:2a4b:7bc3 with SMTP id 5b1f17b1804b1-488996a3560mr236913405e9.4.1775574773822;
        Tue, 07 Apr 2026 08:12:53 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a8ddfde7sm428997685e9.5.2026.04.07.08.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 08:12:53 -0700 (PDT)
Message-ID: <77514d1b-e418-47db-9b47-8f7d8a4cedc5@tuxon.dev>
Date: Tue, 7 Apr 2026 18:12:51 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/15] dmaengine: sh: rz-dmac: Add cyclic DMA support
To: Biju Das <biju.das.jz@bp.renesas.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260407133507.887404-1-claudiu.beznea.uj@bp.renesas.com>
 <20260407133507.887404-12-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB11332705744F2802F745C1567865AA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB11332705744F2802F745C1567865AA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30941-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,gmail.com,perex.cz,suse.com,pengutronix.de,glider.be,renesas.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B0FEB3B0BBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Biju,

On 4/7/26 17:36, Biju Das wrote:
> 
> Hi Claudiu,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: 07 April 2026 14:35
>> Subject: [PATCH v3 11/15] dmaengine: sh: rz-dmac: Add cyclic DMA support
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add cyclic DMA support to the RZ DMAC driver. A per-channel status bit is introduced to mark cyclic
>> channels and is set during the DMA prepare callback. The IRQ handler checks this status bit and calls
>> vchan_cyclic_callback() accordingly.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - updated rz_dmac_lmdesc_recycle() to restore the lmdesc->nxla
>> - in rz_dmac_prepare_descs_for_cyclic() update directly the
>>    desc->start_lmdesc with the descriptor pointer insted of the
>>    descriptor address
>> - used rz_dmac_lmdesc_addr() to compute the descritor address
>> - set channel->status = 0 in rz_dmac_free_chan_resources()
>> - in rz_dmac_prep_dma_cyclic() check for invalid periods or buffer len
>>    and limit the critical area protected by spinlock
>> - set channel->status = 0 in rz_dmac_terminate_all()
>> - updated rz_dmac_calculate_residue_bytes_in_vd() to use
>>    rz_dmac_lmdesc_addr()
>> - dropped goto in rz_dmac_irq_handler_thread() as it is not needed
>>    anymore; dropped also the local variable desc
>>
>> Changes in v2:
>> - none
>>
>>   drivers/dma/sh/rz-dmac.c | 144 +++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 138 insertions(+), 6 deletions(-)
>>

[ ... ]

>> @@ -500,6 +562,8 @@ static void rz_dmac_free_chan_resources(struct dma_chan *chan)
>>   		channel->mid_rid = -EINVAL;
>>   	}
>>
>> +	channel->status = 0;
>> +
>>   	spin_unlock_irqrestore(&channel->vc.lock, flags);
> 
> Maybe create a patch to convert all the spin_{lock,unlock} with guard()
> in this driver.

This series already has to many patches and I want to keep only what is 
necessary for the cyclic support. My plan is to do the guard conversion after 
cyclic support gets merged.

Thank you,
Claudiu

