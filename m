Return-Path: <linux-renesas-soc+bounces-33422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x5/dK9/DHmpxUwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 13:51:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F7F62DB8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 13:51:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C2C73001180
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 11:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE413655E7;
	Tue,  2 Jun 2026 11:49:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA1334676F;
	Tue,  2 Jun 2026 11:49:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400959; cv=none; b=TAqHUGIq2qzlyBbO4lTp8R78Aw/0REI604KX99ZLiQ3Ix/aLeYvQK8NUOJ1py/Fn02N7h7L3unGjyIXQ/cAAZfX7R0ZVbjbW4+SKLzXnjiFvDAY3L6QU5e/AZb7p6rdzbmc4npVq9fthqN7qyIKd3gcguGbNoRSoDsErDzQWl9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400959; c=relaxed/simple;
	bh=BPaQXDX9DfioE/lo/6/O84iTu0gb9JOE47FAzI78Yo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eu/McjtU+amvnYdSkcxSpezA7qlqqdkqgpSxzvhdhTWd4qyQxSoxRVBoZ0SgaTD0v2CM9ERXhuC6lI8LOFr7QIgyW3cmdmlMFy9dIPq1e7tsVGB/2eki3P1qbxkLgusfjAGMYkGRAZvbbGtgNzSi7ImY+hemvciSQ+sLWW1vpmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3587D1F00893;
	Tue,  2 Jun 2026 11:49:16 +0000 (UTC)
Message-ID: <343031b7-f011-4c27-a1d6-a84b31ab30ce@tuxon.dev>
Date: Tue, 2 Jun 2026 14:49:14 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] i3c: renesas: Add runtime PM support
To: Claudiu Beznea <claudiu.beznea@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
 alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-18-claudiu.beznea@kernel.org>
 <ahC2NfJl0bD1pFcX@lizhi-Precision-Tower-5810>
 <8f1cd05b-b866-47ac-8ef4-e5e607247cf7@kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <8f1cd05b-b866-47ac-8ef4-e5e607247cf7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33422-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@kernel.org,m:Frank.li@nxp.com,m:wsa+renesas@sang-engineering.com,m:tommaso.merciai.xr@bp.renesas.com,m:alexandre.belloni@bootlin.com,m:p.zabel@pengutronix.de,m:linux-i3c@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:geert+renesas@glider.be,m:wsa@sang-engineering.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,tuxon.dev:from_mime,tuxon.dev:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04F7F62DB8D



On 5/23/26 13:23, Claudiu Beznea wrote:
>>> +    i3c->dev = &pdev->dev;
>>> +    pm_runtime_set_autosuspend_delay(&pdev->dev, 300);
>>> +    pm_runtime_use_autosuspend(&pdev->dev);
>>> +    ret = devm_add_action_or_reset(&pdev->dev, 
>>> renesas_i3c_dont_use_autosuspend,
>>> +                       i3c->dev);
>>
>> do you cleanup resource in renesas_i3c_dont_use_autosuspend(), look likes
>> needn't it.
> 
> According to documentation at [1] this is necessary.
> 
> [1] https://elixir.bootlin.com/linux/v7.1-rc4/source/Documentation/power/ 
> runtime_pm.rst#L616

Actually, the cleanup helper of devm_pm_runtime_enable() takes care of this, 
thus I'll be removing the renesas_i3c_dont_use_autosuspend().

Thank you,
Claudiu


