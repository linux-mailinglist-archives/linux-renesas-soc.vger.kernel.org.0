Return-Path: <linux-renesas-soc+bounces-31188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA4NJ9pA2mmFzQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 14:38:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF8D3DFF3D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 14:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90318300E148
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 12:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9D31D798E;
	Sat, 11 Apr 2026 12:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JXWXRQ9M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA092175A9C
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775911127; cv=none; b=uxHw6rovVYiXpBz96yfE4A2N+AfTCCC/hIYd4Qzj7Ql6k4M/yUn3CeHlAWA3KWC/t0yzLM4hb7tciZ6KMazft3P7t0T/UVmgKjVs2sosqSjI/1U7BY+K0mtJBYy0WFgiqdvB7sJgS4l8sCqlbm05kG9LSCmr5PcVie5RXtp9WSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775911127; c=relaxed/simple;
	bh=i+pQwJ5xqs5M5ypuPeuIDBf+kIH1BYcd/Hw6yFSK5Y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGrLVNISAUDFad/cup/JxWXZjglcZ2rI0Cx14owODLj1EPw+v4T/r2+9gPpBE8izCmAMhNWKHI15fyLjrTfltaeryUQSRZzF8IMwJvuMhWgD0dICZ2dh9mVB+FaejThBbCKIXq9PFlQFikc1lBWquyF2YevqqCkUPnDV5jyMwpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JXWXRQ9M; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so46114705e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775911123; x=1776515923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yE4wcQKN4kem8Y2lVQo69XargwGADU8xbkrwOp7CO4Q=;
        b=JXWXRQ9M2/axU6NnP+lUcv/slzgAO7h/a0tIXB7PJf/pF3gTjZbqsIIeBBs9jc0Ott
         c2HxSV4MK45SP6oCq+v02lafQqymg7FkwEonofQehsKvAtO+H6UAySuzVAr3yM93l2fd
         z/c9mRHU3w5SlqGElauFuaUoeU9IfNeUWphZ+eGbCt2cBQrPVWAMivYdN+70akthpAwt
         JolBcG/7cUnlOu8uP9UKQbiXYPX4Vgfikf862toV84F3PLotgL3KrAqr69STh8uTVDna
         rHrN0GYcYzgbOetFYTKVKY5G0ljgU2otfYZqF4wUmLhxHaSz0hZYDMsKDlcz8HZhfYbL
         7rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775911123; x=1776515923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yE4wcQKN4kem8Y2lVQo69XargwGADU8xbkrwOp7CO4Q=;
        b=Bz+4j+soKvKsQlrR6TYjwTHZMOOvWWS5tTRrvdP9qqBz0ujCYPYUCFqpRVhCYqKbb+
         mfCAn+46c/b/LoYfy63mv/6t50DqS1EOiusC3dGWXfyyHwDGyTXTqYSNDBMmF3a7S2uu
         J8HCEQ7lDcjXFY7pfHTBQ+sEM2YcJqXNy8bFXVBQvLoHSDYnnVN/46iFt4+xCS5XjD/k
         uL1bOxmvtvq+BhKW7pfAB+zYSKZnbC9l45qAPBhSxFImGQUq1SspcFOVrVleoqcHgvyp
         cnHDtF45xb4fCnrd1NUq+mgHx3nXCQUlgjYcgw2HWcyCggPQ0BBFeZVRHUil1Zlx0GA1
         5n/w==
X-Forwarded-Encrypted: i=1; AJvYcCU6IFTox9p39eZ7UYE4ZnNIIzXr8aZ8v5qee4Pq/SYfZcU+94Vv6a9UxSpb5hM9+aV1f2Rn9UrrsKChFChenpYI7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVs+73z7iSwnpJAqSAuGpTl49IRTDP1Po6ANlOLKtx94reiTDp
	2GG8BAxCm9twwm+0KRPikgGZYtU234SV8QSbFKI1/x5efkrN1EMAI+69WBgpYasZgs8=
X-Gm-Gg: AeBDietB15GPLo0lgdSHr5V/V+OkCJfkQVByBfPxztrY9+oPUbGJcxEZN8J7CmUcHgN
	i29S3te7gf0ZJzsk2QZhCKz59zfnZO/34R0c2EU+XcGTQjQcgJ8yYB2Dy/c5/UVf/0t6LsxancA
	+5zqf2y9gGqKsS6PX4rwCJwAD7GqAV6zEXzQr8wdjYKd8pZao4fi0w8kXnvuO+WXRXGvkA/P9wU
	4xaw7GghS27gEvxg3zlesVVmdBMOH/3xqui2f5h5QPItrMjtJY381yJt+Y7ToICEpP6+EegiLLk
	nvKTvtt4njxlz4gGNK8a4S3GJHxJ5NRul78dWpGdOEoACzeflH3ySEhYA84byLORy7zhVnGiwbC
	9cRAV+qt+UWScepdVWKGwsCfXFcJAbvIhAZNOeK5gntFi6UM/b9FQQvdBfBUeIJ4t7s5S/t87LL
	I0LdIqjangzhjwHEQML1UXTxPGbTvoTcxdjDTKMmI8Tg==
X-Received: by 2002:a05:600c:a109:b0:488:b187:3c with SMTP id 5b1f17b1804b1-488d68431ebmr66421005e9.14.1775911123257;
        Sat, 11 Apr 2026 05:38:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5df2062sm47369605e9.12.2026.04.11.05.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 05:38:42 -0700 (PDT)
Message-ID: <f3577fe6-efc6-4acf-956b-93be6d498238@tuxon.dev>
Date: Sat, 11 Apr 2026 15:38:41 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/17] dmaengine: sh: rz-dmac: Save the start LM
 descriptor
To: Biju Das <biju.das.jz@bp.renesas.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "Frank.Li@kernel.org" <Frank.Li@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Long Luu <long.luu.ur@renesas.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260411114303.2814115-1-claudiu.beznea.uj@bp.renesas.com>
 <20260411114303.2814115-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346602C7FD8ACAB74BB568486262@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346602C7FD8ACAB74BB568486262@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31188-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:dkim,tuxon.dev:email,tuxon.dev:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: CEF8D3DFF3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/11/26 15:34, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: 11 April 2026 12:43
>> Subject: [PATCH v4 07/17] dmaengine: sh: rz-dmac: Save the start LM descriptor
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Save the start LM descriptor to avoid looping through the entire channel's LM descriptor list when
>> computing the residue. This avoids unnecessary iterations.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v4:
>> - none
>>
>> Changes in v3:
>> - none, this patch is new
>>
>>   drivers/dma/sh/rz-dmac.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c index 6bea7c8c7053..0f871c0a28bd
>> 100644
>> --- a/drivers/dma/sh/rz-dmac.c
>> +++ b/drivers/dma/sh/rz-dmac.c
>> @@ -58,6 +58,7 @@ struct rz_dmac_desc {
>>   	/* For slave sg */
>>   	struct scatterlist *sg;
>>   	unsigned int sgcount;
>> +	struct rz_lmdesc *start_lmdesc;
>>   };
>>
>>   #define to_rz_dmac_desc(d)	container_of(d, struct rz_dmac_desc, vd)
>> @@ -343,6 +344,8 @@ static void rz_dmac_prepare_desc_for_memcpy(struct rz_dmac_chan *channel)
>>   	struct rz_dmac_desc *d = channel->desc;
>>   	u32 chcfg = CHCFG_MEM_COPY;
>>
>> +	d->start_lmdesc = lmdesc;
>> +
>>   	/* prepare descriptor */
>>   	lmdesc->sa = d->src;
>>   	lmdesc->da = d->dest;
>> @@ -377,6 +380,7 @@ static void rz_dmac_prepare_descs_for_slave_sg(struct rz_dmac_chan *channel)
>>   	}
>>
>>   	lmdesc = channel->lmdesc.tail;
>> +	d->start_lmdesc = lmdesc;
>>
>>   	for (i = 0, sg = sgl; i < sg_len; i++, sg = sg_next(sg)) {
>>   		if (d->direction == DMA_DEV_TO_MEM) { @@ -693,9 +697,10 @@ rz_dmac_get_next_lmdesc(struct
>> rz_lmdesc *base, struct rz_lmdesc *lmdesc)
>>   	return next;
>>   }
>>
>> -static u32 rz_dmac_calculate_residue_bytes_in_vd(struct rz_dmac_chan *channel, u32 crla)
>> +static u32 rz_dmac_calculate_residue_bytes_in_vd(struct rz_dmac_chan *channel,
>> +						 struct rz_dmac_desc *desc, u32 crla)
> 
> U32 normally used with register read/writes hardware related.
> 
> Here it is just computation which returns number of bytes. Unsigned int will be
> appropriate instead of u32.

Please check the type of residue as defined by dma_set_residue().

Thank you,
Claudiu

