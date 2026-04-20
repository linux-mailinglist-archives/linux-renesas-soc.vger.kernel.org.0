Return-Path: <linux-renesas-soc+bounces-31428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FFpO8JZ5mnGvAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 18:52:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24391430250
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 18:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48E5937E985F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 15:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B203DA7F7;
	Mon, 20 Apr 2026 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Z1ad9HW3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3913AE1A8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 14:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776695847; cv=none; b=XOcBr/KsyuFpYHKLYxGg5czZxo2AIaKpra/OxzjgW86fcBvvgavZ3AW17PHywjzDXYfu2KvgDJPdN0E01PIqtWGKDpxwb77OWwtuvg2DGe3jFNmYhhrEflgijorycg+7FBNlAELgnIFJSHus9sRqoN0csmDPvOt5fmfkNVah2Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776695847; c=relaxed/simple;
	bh=G43em0UTQ2JQXzJA76cdqW6wsnO4G8o1Mo5P6nGZgPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ue3erPrxArT1X9cove2Ho9AiHNHQJtb8GEC+8+pOyzIJ2FAicS1MDaVwFg0RbYibkspcgTnrrn9qHqbhjcsIZPGBJoY8LKRK4PjjBxeVjoKeGRUXFQvP2JOKYPNgOQXTxfJFFJVZV1rQNleJCUz/0qlTUGZiizXLnWpufHMCKJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Z1ad9HW3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso6855005e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 07:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776695844; x=1777300644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2uTS1FpJvpBuQ/f8W19roBhKwBLhDMKvzjCC/g1ICM=;
        b=Z1ad9HW3b0ftwI665ozfA7pOvAv/MixGYv/maWoHIEqxhvnBU0SzMrxmu9s2QN+qln
         iyWsKOc7JhZ28n/TmoqfF81rocMwYRRWix0jHEyDkZ2QiMWfOXMsEOfmHZV4Sw0wLZbZ
         O67u2MVUmz1Ez2hsVTzOru86X6Pif0vlP8IjVzM0RRDDLoLUeCqemOQbNDaAMcbZwe1/
         2twhgk6HuVDE8Np5FcVpJfgMDvvd1AanT4gdLw4is9Y5fI/0zYajGEoEzgfSGEYrqTj4
         Rd31hcC4oZ6JR9C+/zcE/3GwDq25NYH3ibyZ08JYqYAnSvd5T4IymwyMEpsbqYv5rWG+
         5KYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776695844; x=1777300644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2uTS1FpJvpBuQ/f8W19roBhKwBLhDMKvzjCC/g1ICM=;
        b=IoMKaGRbIlfxiK5+o3UxhkmMEqqO7oQwweFKTTmB2/470Im7+3RUMmJ+D87liCIY81
         WCrcx+WnFiEWHY56QWz5r4FOYXZTOZHPwmsD63t7HY86SkswkUpdfOZGtmtGGJyuKbbU
         4v6dzyPwworg8jRH1P1QMaCXORplhHoB2oAO39tCFEWp31s2TZg7snp+iuMBxSKnT6gC
         HHOOxGrR8xGuhdxJXRlwKCeKgUH0LM/4/9i6p2TYopPWzjNEfmK2t3/jRrrH/dFHbAFc
         TptEy3Ufipy1+SHNGChUVD64exg51EIRBZK2tqcunzM2YWTY2Nok0jllY2TZXagJM1Zd
         bttw==
X-Forwarded-Encrypted: i=1; AFNElJ9n8FA1uPI39WI+j1S+hurKWhoqfNhVcg8bEJt/89lXuamLSR/kmHHabfgoW1Pf8XbeiEdS/rfceCAM/eFsnes+qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwODcyFAkhzrRCcLZSK3ISfPPKwL/s0W0QvIYYbGsAv7oE6REOQ
	/csw/ogWqoF4YlSr0peXEjUlgEs3a0mMZfujo3HaLL0PhKZPFeHld3JHNvisNSQyH1I=
X-Gm-Gg: AeBDietymW5ZpgzBdpz25Q4U0U5aAuPmmp/ZVLl3K68N29uYWdpJJbmN9CDItrdFB+H
	mXI1+zL1zklTqX1y1GPCKkC0jVqRMmAcVZfC6xtdgFSSVYB0QU7gIzt1ISv0ffWdMjGlqsPKmD4
	EsTWvpz3dGDZOZik+4lYgTXj5EjM/4mkDH7k6a/uLI/3jVHKe53apw52/vNEH85MPDxByC740lq
	nYn5/R1Wv2m9tiL2JNuHaO/zG3xM+3wwYDMyhPPf0xfBQLyBkM6nRdEXxRViL/t+nibuedmpxcN
	hss2JEcoDdjuwSlE7zNAEN9ZXnWbvORitPmZkz6G9sjt+/wsHMoDn4W4Nn4NembrNswwNuAxu3c
	c/HhsPku3wr+U/0wnST692mypoC0z55hVBw6t7ARAxFZ7EvsLKKmbeN8l+kpB2+JlugrKBYYeQ3
	j859KfLUudeaz1taiOhYkzBq+n8kpPJMNlu21ayBpqag==
X-Received: by 2002:a05:600c:1385:b0:485:4eaf:eb54 with SMTP id 5b1f17b1804b1-488fb78260bmr187342395e9.20.1776695843391;
        Mon, 20 Apr 2026 07:37:23 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc14a61asm271273795e9.15.2026.04.20.07.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 07:37:22 -0700 (PDT)
Message-ID: <2d055792-c8ad-440e-8fe6-68b75832e30f@tuxon.dev>
Date: Mon, 20 Apr 2026 17:37:21 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/17] dmaengine: sh: rz-dmac: Add suspend to RAM
 support
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
 <20260411114303.2814115-15-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346C39C7EABCC7A1BC64109862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <36468f41-7808-4fe3-b4bf-94eb128276fc@tuxon.dev>
 <TY3PR01MB11346EBEC14B199CC0729E33C862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346EBEC14B199CC0729E33C862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31428-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tuxon.dev:email,tuxon.dev:dkim,tuxon.dev:mid]
X-Rspamd-Queue-Id: 24391430250
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/26 17:21, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Sent: 20 April 2026 15:15
>> Subject: Re: [PATCH v4 14/17] dmaengine: sh: rz-dmac: Add suspend to RAM support
>>
>>
>>
>> On 4/20/26 10:42, Biju Das wrote:
>>>> +static int rz_dmac_suspend(struct device *dev) {
>>>> +	struct rz_dmac *dmac = dev_get_drvdata(dev);
>>>> +	int ret;
>>>> +
>>>> +	for (unsigned int i = 0; i < dmac->n_channels; i++) {
>>>> +		struct rz_dmac_chan *channel = &dmac->channels[i];
>>>> +
>>>> +		guard(spinlock_irqsave)(&channel->vc.lock);
>>>> +
>>>> +		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)))
>>>> +			continue;
>>>> +
>>>> +		ret = rz_dmac_device_pause_internal(channel);
>>>> +		if (ret) {
>>>> +			dev_err(dev, "Failed to suspend channel %s\n",
>>>> +				dma_chan_name(&channel->vc.chan));
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		channel->pm_state.nxla = rz_dmac_ch_readl(channel, NXLA, 1);
>>>> +	}
>>>> +
>>>> +	if (ret) {
>>>> +		rz_dmac_suspend_recover(dmac);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	pm_runtime_put_sync(dmac->dev);
>>>> +
>>>> +	ret = reset_control_assert(dmac->rstc);
>>>> +	if (ret) {
>>>> +		pm_runtime_resume_and_get(dmac->dev);
>>>> +		rz_dmac_suspend_recover(dmac);
>>>> +	}
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int rz_dmac_resume(struct device *dev) {
>>>> +	struct rz_dmac *dmac = dev_get_drvdata(dev);
>>>> +	int errors = 0, ret;
>>>> +
>>>> +	ret = reset_control_deassert(dmac->rstc);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = pm_runtime_resume_and_get(dmac->dev);
>>>
>>> If this fails for any reason, the next suspend still be called and it will decrement the counter,
>> potentially undeflowing it.
>>> Consider switching to pm_runtime_get_sync(), which suits better here
>>
>>
>> I think runtime PM usage counter underflow will be the less significant problem in case runtime PM
>> fails.
>>
>> Anyhow, could you please provide the code pattern you consider would be better for both suspend and
>> resume?
> 
> 
> system_resume()
> {
>            pm_runtime_resume_and_get() --> PM counter is not incremented in case of error
> }
>   
> system_suspend()
> {
>         pm_runtime_put() --> counter is decremented and prints a noisy WARN message
> }
> 
> Just replace pm_runtime_resume_and_get()->pm_runtime_get_sync()
> this will return the error to caller like previously and also increment the counter
> which avoids warning on the subsequent suspend()

This wouldn't solve anything.

If the newly added pm_runtime_get_sync() fails the next dev_pm_ops::prepare() 
call, accesses DMA IP registers. That will sync abort (due to MSTOP) even before 
any warning (I guess underflow runtime PM usage counter) will be printed.

If we add runtime PM resumes in the dev_pm_ops::prepare() to overcome part of 
the sync abort in the next dev_pm_ops::prepare() call and keep 
pm_runtime_get_sync() blindly, w/o dropping the usage counter on failure, that 
will still lead to sync aborts, because the runtime PM resumes in 
dev_pm_ops::prepare() should only increase the runtime PM ref counter and return 
success.

Thank you,
Claudiu

