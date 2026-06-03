Return-Path: <linux-renesas-soc+bounces-33530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lGETFKswIGqEyQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 15:48:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A61816383C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 15:48:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A0523037164
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 13:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13B62FD1DA;
	Wed,  3 Jun 2026 13:38:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC491E766F;
	Wed,  3 Jun 2026 13:38:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493918; cv=none; b=iz9V3IIr7SGMzbzMjhihbx93PprXAV3GHyEPkUqCMB+0Nha3myTCIKJ1j+ltFKpYLYTKXM69QM48r76zhAxrPhMsAIBHWGHEA2wgelKm/ztQDSfqjt/wMgDdZd/oQ116yyTZnrwJS5ssa5KlAwHq3gnyzWgDQ79BRgxrtFZsAPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493918; c=relaxed/simple;
	bh=jpfMl3LBsN10XtaqYl6MLqpzotID798CTdJ4oaGnIxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ds4nQfbsJMTiKS75pW1ExwdeUnZcD8VVdoU5prhCBwyZQ+d5xNnBki6DRnow1OGLovgc41ZSviN8ZhlBM+fa06zdAUQuf5e9UJvh1f82hyVwNzvzQ/6Qz27vqQYIfvRA6BeiOjM+Y8WWURXSfwv6LIm5I04XZq/6M7dfRqBh31Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E771F00893;
	Wed,  3 Jun 2026 13:38:33 +0000 (UTC)
Message-ID: <2e62a5af-06f5-4a11-80f1-81c62f9b2311@tuxon.dev>
Date: Wed, 3 Jun 2026 16:38:31 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 3/5] phy: renesas: rcar-gen3-usb2: Lock around
 hardware registers and driver data
To: Xia Fukun <xiafukun@huawei.com>, yoshihiro.shimoda.uh@renesas.com,
 vkoul@kernel.org, kishon@kernel.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, horms+renesas@verge.net.au,
 fabrizio.castro@bp.renesas.com, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "tanghui (C)" <tanghui20@huawei.com>
References: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
 <20250507125032.565017-4-claudiu.beznea.uj@bp.renesas.com>
 <e49fc109-41a2-449f-a232-d8beac2c5e08@huawei.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <e49fc109-41a2-449f-a232-d8beac2c5e08@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiafukun@huawei.com,m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:kishon@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:horms+renesas@verge.net.au,m:fabrizio.castro@bp.renesas.com,m:gregkh@linuxfoundation.org,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:stable@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:tanghui20@huawei.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:horms@verge.net.au,s:lists@lfdr.de];
	DMARC_NA(0.00)[tuxon.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[huawei.com,renesas.com,kernel.org,glider.be,gmail.com,verge.net.au,bp.renesas.com,linuxfoundation.org];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-33530-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A61816383C8



On 6/3/26 16:22, Xia Fukun wrote:
> On 5/7/2025 8:50 PM, Claudiu wrote:
> 
>> @@ -348,6 +349,8 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
>>   	bool is_b_device;
>>   	enum phy_mode cur_mode, new_mode;
>>   
>> +	guard(spinlock_irqsave)(&ch->lock);
>> +
>>   	if (!ch->is_otg_channel || !rcar_gen3_is_any_otg_rphy_initialized(ch))
>>   		return -EIO;
>>   
>> @@ -415,7 +418,7 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
>>   		val = readl(usb2_base + USB2_ADPCTRL);
>>   		writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPCTRL);
>>   	}
>> -	msleep(20);
>> +	mdelay(20);
>>   
>>   	writel(0xffffffff, usb2_base + USB2_OBINTSTA);
>>   	writel(ch->obint_enable_bits, usb2_base + USB2_OBINTEN);
> The fix for the rcar_gen3_init_otg function has not been backported to
> the 5.10-stable branch, which leads to a "scheduling while atomic" bug
> in that branch:
> 
> rcar_gen3_phy_usb2_init()                    ← phy_init() callback
>    → guard(spinlock_irqsave)(&ch->lock)       ← acquires spinlock, disabling preemption + IRQs
>    → rcar_gen3_init_otg(ch)
>        → msleep(20)                           ← BUG: scheduling while atomic!
> 
> The patch for 5.10 is available at the following link:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/? 
> h=linux-5.10.y&id=0f86a559900fbe96af08a3a226a86fac27b02b8f
> 
> Perhaps the stable patch for the 5.10 branch needs to be updated to
> fix this serious bug?

Sasha applied today the patch at [1] to solve this problem on v5.10.

Thank you,
Claudiu

[1] 
https://lore.kernel.org/all/20260501225859.504868-1-nobuhiro.iwamatsu.x90@mail.toshiba/

