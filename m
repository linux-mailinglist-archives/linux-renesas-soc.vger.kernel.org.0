Return-Path: <linux-renesas-soc+bounces-31426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEmeDMFX5ml5vAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 18:43:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C4742FE96
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 18:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65B403141FE3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 14:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485E6377554;
	Mon, 20 Apr 2026 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Mt6szZCq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DA43A1D1C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694533; cv=none; b=mG4e2o7kJZ19eqvGbyRyr485H3Bf8AB+1vrA6VdlkCg8f4JxHa00XASDkiwA2vD3FuGRC0RZWvYJQP5tDqTWaa6T7pQNgcT0uH5GrtDCn0O1bYtMhDwRMwK/oOBF/HyuowULq4ufqPLiTEmHXhk5OiBeqpzSbfNUA18j8SnTmWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694533; c=relaxed/simple;
	bh=ppsjy5cDgZ57Fyuoqm+hMsyL1FzmZJz4ryCWUG3qf58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X20JyykZJLxhGbGsVXk5I05j29oTsuLms0KUXH3o7y4iqP/MlRgjDHFriGeJNEj35wWXKPa3l7AYyoP2VjUmzswjfr6M5rPM2erLva8yRGM6vRP4Ubxny9nF+64sgXu4N89lrFp3w8OseegYQL3y5qPP9wvmxGf5QiDu0Po6Agw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Mt6szZCq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891f625344so9853105e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 07:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776694530; x=1777299330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t1bUvFpr3NIXY40lz2U87H/IH5ItVZVdVUddh0JtzjI=;
        b=Mt6szZCqaIMKyCOHFVNTJN3cvaGHM6/ZUXjXZeA7ru/cnIwI8HL4M79vTKch9fbIIt
         g20pVkGMmv3p2Nk+SVjcnvXbu3Iue7lVTRrPGsBSJogI3mTwRYGP+Cg1KoHQ4bHLixyU
         Mjo8jGNuM4bbUn1IZUmhXTtA2l4cJ61n2snD4pkJULN2OV/jDvE2hQ99wBx8tqKoFbNl
         IfzLfy/LhaIOg0NwlgjSH3J+fll9yBFfd9q/+tDu0ew4aJ4vWgnj9Xeo8CLbEs22AYXm
         3CDF8OFsQLiAg1dYzUFGH8tJHvTieOv7EAcdGNYDKAiGP+mHTz5wlXIVW3If/yjbUZM3
         d4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776694530; x=1777299330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1bUvFpr3NIXY40lz2U87H/IH5ItVZVdVUddh0JtzjI=;
        b=U56WYZkh82z/U6d/eQfDlTIy04KZY/QNBYKVg1OkrlMfJqros35dtNCcO110WdqP1n
         3hdjw7HPr6hjtgjD4qhxaZRWTswUugUdNwjPGn+QW+5NtZcswCRVe2h3m5Q1qv95ZzUe
         CAr6Z0ld5jENCCbRkz2+FhY5Uvuy5swNkYgr5ERgefbuisrQbVLXvjQdJ3rBx2YvUZtE
         iI0MnE8ELgIhamDimzwEd4nqW+5SlVkt87JMMbSD1tVcs05NJNcPUo7f0TrnseBS8GgH
         3b4kZc8UEGI34MyMuaVkdQwoNY7KFIx+WtLXnrI78Uitin5BCxV0Fqfu2gomoSvxs41F
         2scg==
X-Forwarded-Encrypted: i=1; AFNElJ/+DZlTqPsegWxAHUBiE8sGbgB41XnLp7UyJNs47I1shwbapnS6JqY6dnFyHMOmYPV3wOaAuM0Bk7qV4pcj6bhbsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl8aA7xBOdxNmH//HG44gl08pqhb6OrY4N4IdKrhd/T2FWR60g
	Al8pZBQqHAEY4uqUmwIoW5lBwIg2j8ahaDURNBW7V8i7dNYTzGWvCsgRC2kH3udFMJM=
X-Gm-Gg: AeBDietKFbhpzG278uR+3GPD4hMNOSW5tRnifHb4+HcGxc/abX9y/fzgKOfwp4rY27q
	U7LJAgrNGM+aCgiLYKYu6ExnEg1kjSYm8HZOzQmkz62eGA2VWK92QVdoyTNBnIcfB3At435e+3f
	xOCbZfUxRPAQrkgYza/0ggDCJAqm5NRhEiB+xvfBxwku9MjL+7XAgytgko+FRrGlONUuvUKzv6O
	UfyqibL+u/s2J1jmhoqkM0Zn4JD8tfKzxiBlaSabUS5L0SXrKE7fKQfD/3JVCxeSy64/Sf0DJNK
	kepRLejSoFmEx1A4mJnbK3CyElhhuLV5RYOYICHZTJy7M4V5BUazX8Rul7llJaMCJZleCQf7OvW
	lcOi72S17Cg7Avy1Z6V0pyGkvzdKxRpkjmnBpA9MPMJ/MosuJX0UgMKQXtLQTuW/1mfzs8TlUj5
	Jv46fWnp/5TtO/cUuK4MbhfVM10dt0f0EWdtGvwcKR9LzR7WEg82I8
X-Received: by 2002:a05:600c:570f:b0:488:a502:8955 with SMTP id 5b1f17b1804b1-488fb882f13mr152359325e9.4.1776694529960;
        Mon, 20 Apr 2026 07:15:29 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46471sm28832892f8f.28.2026.04.20.07.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 07:15:29 -0700 (PDT)
Message-ID: <36468f41-7808-4fe3-b4bf-94eb128276fc@tuxon.dev>
Date: Mon, 20 Apr 2026 17:15:27 +0300
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
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346C39C7EABCC7A1BC64109862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
	TAGGED_FROM(0.00)[bounces-31426-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C4C4742FE96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/26 10:42, Biju Das wrote:
>> +static int rz_dmac_suspend(struct device *dev) {
>> +	struct rz_dmac *dmac = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	for (unsigned int i = 0; i < dmac->n_channels; i++) {
>> +		struct rz_dmac_chan *channel = &dmac->channels[i];
>> +
>> +		guard(spinlock_irqsave)(&channel->vc.lock);
>> +
>> +		if (!(channel->status & BIT(RZ_DMAC_CHAN_STATUS_CYCLIC)))
>> +			continue;
>> +
>> +		ret = rz_dmac_device_pause_internal(channel);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to suspend channel %s\n",
>> +				dma_chan_name(&channel->vc.chan));
>> +			break;
>> +		}
>> +
>> +		channel->pm_state.nxla = rz_dmac_ch_readl(channel, NXLA, 1);
>> +	}
>> +
>> +	if (ret) {
>> +		rz_dmac_suspend_recover(dmac);
>> +		return ret;
>> +	}
>> +
>> +	pm_runtime_put_sync(dmac->dev);
>> +
>> +	ret = reset_control_assert(dmac->rstc);
>> +	if (ret) {
>> +		pm_runtime_resume_and_get(dmac->dev);
>> +		rz_dmac_suspend_recover(dmac);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int rz_dmac_resume(struct device *dev) {
>> +	struct rz_dmac *dmac = dev_get_drvdata(dev);
>> +	int errors = 0, ret;
>> +
>> +	ret = reset_control_deassert(dmac->rstc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_resume_and_get(dmac->dev);
> 
> If this fails for any reason, the next suspend still be called and it will decrement the counter, potentially undeflowing it.
> Consider switching to pm_runtime_get_sync(), which suits better here


I think runtime PM usage counter underflow will be the less significant problem 
in case runtime PM fails.

Anyhow, could you please provide the code pattern you consider would be better 
for both suspend and resume?

Thank you,
Claudiu

