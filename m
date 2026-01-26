Return-Path: <linux-renesas-soc+bounces-27435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFy2EmN/d2m9hgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 15:51:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCD589BCD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 15:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FA833002A3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 14:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0841EB5CE;
	Mon, 26 Jan 2026 14:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TDASyS/7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F1B242D6A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438783; cv=none; b=aVVruH7hR95lvJidxVhpR6/ZUUFr89qaSairdY/LFABQlHmn+IpLPWDVTG2UAD8Qbcn8QoDXi4gf2ScB47Lc3qbMAQYJ3E19lAvplOQjzAB7XO79QmXjq5VRI0cRC1IaYhtmH629qLyuvbfdjt4QeAH6hfuNDa09DcJTQwRtYuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438783; c=relaxed/simple;
	bh=2IbRV9YOig8uEtdAcRc53kp6dqCuCW21kS1SlTHoqkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XlnjhfmSG94WkA3s/zFfZCQKRnUAv/zMgyPtE5Mf/OnJciuneVAgpR6E6mWYOjahWtEC83s9p5sTleRKM52Sl2WEW1BcuABo7uu9KNercVRtzV09IrvTm1ggHi4uFFX7rB4mXxaqHWdvVt/o8Gn/KsYi2YI9WBrCS6JZcT9Za+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TDASyS/7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso46320305e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 06:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769438780; x=1770043580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pm0AyqOIj5dF9Te7g3FRe5p926c2ixXy2A4BKSh5SP8=;
        b=TDASyS/7sKqz1cSLh29SqZ8cACfCu8S4ziTR8DArMLfvIVesEYns/z+FaNQ7GqmP88
         1y2JUK/8VZz0AvJ1XTREdw99JpKm41AFHJB2Lr8mG1V3TJWACUJSPKxUY9Vr48eRtk3b
         CHrM+fVzjZdhhQgwrNqBqPl6TVbWmtEpG7JqsCKQeLWxhSDkDC0fqu3VLWoT/blb/iL+
         Ery4zo1UK2j3SSbCdkn3hTuuwFkUn2i6IlCWgsyKz/m9vkJ4o9HMGDLcDDcy0wjyJSku
         hSsHzMtPNtwza0RM2IiIOZMOvwAQG/1Aqvx9GBGT6p4Fu+1Tb6tRreswnXNQjV+Q/ZtN
         TSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769438780; x=1770043580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pm0AyqOIj5dF9Te7g3FRe5p926c2ixXy2A4BKSh5SP8=;
        b=c3B6cYYI82MPiMXwv09JAGcZ13yZzGZyhAfwIj8PpHZpy8em+I0Zo1EN+YiG8abo9x
         T9q9Dyk+zeG5yPRK7eicURZRjYUON/hzCYukiPNltbR7MhY6FOAA2PG02ng+tvv+A1bc
         YR0WR6UUa6L3lbwzYpYKX55GmBORhKvd2wQDtWzvqiLbzd4WpPRYGdt8urNhZRKwIusL
         ypww8ojILDL5ZjA+WXKv9KQMtjvDgMiXEo49GWfflOWl98/ERFku8lb07M9cHQudac8C
         dAmbCVNItF7ppPayg1wMqd58xoBhfqX8EBMNQ9WVy0K6RKTImcgS4YQv8XXZlnEm3iTN
         fUrA==
X-Forwarded-Encrypted: i=1; AJvYcCXaDXwJwG+894mIYEGngxldln2S7tJlzFpipSE2orK3xyheijNyCwynReFt3t7Xv/pDFRuBvbfP3c1mesjDoGINqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiZVpppqtL8rz4+i84B1REn4PlC7/KFfo7BeGiT/G9Ji9BQ4Gh
	f/Ll1cFq/ul3MAxndl3R0TNukDd62giiRmyxMPTyfqvIYZEM/+KIarRxPW/tMIDv31lPWeTnon5
	j8kdO
X-Gm-Gg: AZuq6aJG4QUIsWW4pAvGi6aw93zubG+9cNB7QxOADPvq5/tmAaXktEINnmoM2+VELWN
	qDArZ/Nig5kJkYZENUbc8rSB3jej6sG0LscrnUF9V3ITFc7gpCtrKHPfI7z+mZzXITzGZVMcLyK
	Yg/HUL53c45caubJEpcicUM7lJ9IkZLwvwab5gC/k2cNiuTQPW/9m26tQV8vY3XT4RIAYGjUFvc
	QL34oOqqwvmC25VU6vE8SFLKVSMmH7dB3+jI2s2qydKJ/BRCjDJ8TAiGfTNglkvuxJE5P1Jj3uq
	pMEn0lmPQHz1vyWIaBo2FD5rysshR8ykMyBCEfZneOUdajARJMAYGMn4xSe+3TT2fV4324cKC+j
	DFK2RFew9BV5xBwj/O5VMPcnouY9RUV12zbJeH07/MPn7nrg21XW2TSV+XYDMlaOuE8+UzdgO/p
	ZweYcwHrdidHncYaprLA==
X-Received: by 2002:a05:600c:4fc6:b0:47e:e72b:1fce with SMTP id 5b1f17b1804b1-4805d06a5edmr62679165e9.37.1769438779698;
        Mon, 26 Jan 2026 06:46:19 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d85206fsm283271695e9.6.2026.01.26.06.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 06:46:19 -0800 (PST)
Message-ID: <74692e8a-220f-4248-9481-81bb331597f1@tuxon.dev>
Date: Mon, 26 Jan 2026 16:46:16 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: vkoul@kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de,
 fabrizio.castro.jz@renesas.com, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com>
 <20260126103155.2644586-7-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWhY7nNanQ=h8HGrWyDfpCSL33QFJorhLCgnKASbmHiYw@mail.gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWhY7nNanQ=h8HGrWyDfpCSL33QFJorhLCgnKASbmHiYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27435-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,bp.renesas.com,gmail.com,perex.cz,suse.com,pengutronix.de,renesas.com,vger.kernel.org];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:email,tuxon.dev:dkim,tuxon.dev:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9CCD589BCD
X-Rspamd-Action: no action

Hi, Geert,

On 1/26/26 16:26, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Mon, 26 Jan 2026 at 11:32, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> On Renesas RZ/G2L and RZ/G3S SoCs (where this was tested), captured audio
>> files occasionally contained random spikes when viewed with a profiling
>> tool such as Audacity. These spikes were also audible as popping noises.
>>
>> Using cyclic DMA resolves this issue. The driver was reworked to use the
>> existing support provided by the generic PCM dmaengine APIs. In addition
>> to eliminating the random spikes, the following issues were addressed:
>> - blank periods at the beginning of recorded files, which occurred
>>    intermittently, are no longer present
>> - no overruns or underruns were observed when continuously recording
>>    short audio files (e.g. 5 seconds) in a loop
>> - concurrency issues in the SSI driver when enqueuing DMA requests were
>>    eliminated; previously, DMA requests could be prepared and submitted
>>    both from the DMA completion callback and the interrupt handler, which
>>    led to crashes after several hours of testing
>> - the SSI driver logic is simplified
>> - the number of generated interrupts is reduced by approximately 250%
>>
>> In the SSI platform driver probe function, the following changes were
>> made:
>> - the driver-specific DMA configuration was removed in favor of the
>>    generic PCM dmaengine APIs. As a result, explicit cleanup goto labels
>>    are no longer required and the driver remove callback was dropped,
>>    since resource management is now handled via devres helpers
>> - special handling was added for IP variants operating in half-duplex
>>    mode, where the DMA channel name in the device tree is "rt"; this DMA
>>    channel name is taken into account and passed to the generic PCM
>>    dmaengine configuration data
>>
>> All code previously responsible for preparing and completing DMA
>> transfers was removed, as this functionality is now handled entirely by
>> the generic PCM dmaengine APIs.
>>
>> Since DMA channels must be paused and resumed during recovery paths
>> (overruns and underruns), the DMA channel references are stored in
>> rz_ssi_hw_params().
>>
>> The logic in rz_ssi_is_dma_enabled() was updated to reflect that the
>> driver no longer manages DMA transfers directly.
>>
>> Finally, rz_ssi_stream_is_play() was removed, as it had only a single
>> remaining user after this rework, and its logic was inlined at the call
>> site.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/sound/soc/renesas/rz-ssi.c
>> +++ b/sound/soc/renesas/rz-ssi.c
> 
>> @@ -1116,15 +936,19 @@ static struct snd_soc_dai_driver rz_ssi_soc_dai[] = {
>>   static const struct snd_soc_component_driver rz_ssi_soc_component = {
>>          .name                   = "rz-ssi",
>>          .open                   = rz_ssi_pcm_open,
>> -       .pointer                = rz_ssi_pcm_pointer,
>> -       .pcm_construct          = rz_ssi_pcm_new,
>>          .legacy_dai_naming      = 1,
>>   };
>>
>> +static struct snd_dmaengine_pcm_config rz_ssi_dmaegine_pcm_conf = {
>> +       .prepare_slave_config   = snd_dmaengine_pcm_prepare_slave_config,
> 
> This fails to link if CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM is not
> enabled (e.g. renesas_defconfig):
> 
>      aarch64-linux-gnu-ld: sound/soc/renesas/rz-ssi.o: in function
> `rz_ssi_probe':
>      rz-ssi.c:(.text+0x538): undefined reference to
> `devm_snd_dmaengine_pcm_register'
>      aarch64-linux-gnu-ld: sound/soc/renesas/rz-ssi.o:(.data+0xc8):
> undefined reference to `snd_dmaengine_pcm_prepare_slave_config'
> 
> Adding a select like this white-space damaged snippet:
> 
>      --- a/sound/soc/renesas/Kconfig
>      +++ b/sound/soc/renesas/Kconfig
>      @@ -56,6 +56,7 @@ config SND_SOC_MSIOF
>       config SND_SOC_RZ
>              tristate "RZ/G2L series SSIF-2 support"
>              depends on ARCH_RZG2L || COMPILE_TEST
>      +       select SND_SOC_GENERIC_DMAENGINE_PCM
>              help
>                This option enables RZ/G2L SSIF-2 sound support.
> 
> would fix the build.

Thank you for reporting and proposing a fix. I'll take care of it in v2.

Claudiu

