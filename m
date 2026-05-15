Return-Path: <linux-renesas-soc+bounces-32686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LMHAa8rB2oLsgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 16:20:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAB0551451
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 16:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2954C30053D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 14:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2984418E2;
	Fri, 15 May 2026 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z36CpN9U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A2C3CC7C5;
	Fri, 15 May 2026 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854500; cv=none; b=ngFYkaXsvNKIHQ6cvV3wGIxHquDl+tN9IFeX8m/yKUIfTCKW2neeIebc1YpFXE0+w1GZfK9o0wSC9P5S5G4348O1pYSdI76PtH5uP8Ab2MXhczQV7bPoQS2b2ID31WhgWZK+i+AboLEDKN0wow214gfOmT/8mxGI2Co8VfqHiGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854500; c=relaxed/simple;
	bh=yQWnXkmSBYV3ZtuAW2rc6CZYiOl9hk/SlqVzEGyJZ90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8X8ChuDghghuHCbHP5uQgxHKpE4QNY9eRX+WOhBL+TiApaXIasWz5PdhHBPjrM9DShBO+Tm+ByScEkw7G87RIn6FXWuHGBdK1N0Lr3Eof7m1SvuhOzXHRr7sAwXi+VkRvf4so0PvNEkv129+WMqjqW4YayFRQxBiR6d5zcvlUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z36CpN9U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EB8C2BCB0;
	Fri, 15 May 2026 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778854500;
	bh=yQWnXkmSBYV3ZtuAW2rc6CZYiOl9hk/SlqVzEGyJZ90=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z36CpN9UitkhDRLCBX4339ww2Q3wmt7AatBmqS35QCWKCSW9V/CGzn2OQYG6ACjH4
	 KbDxhYJcE4KcRXYTW01AKt/yBnM5fdFqAWbiqSl5Q/s+L7ezf/EmwqTCF2sZQ1rlIM
	 ldvCd4J4yqHw5312J0vsWVpdsPyr70sgCXhus8zxoKy8Iz2SdvbvJIA9Jc21ob708n
	 Yjy3eNrHHzkfU3q30gIcAy3llGgaJSRQ0xW6KeJpDQzqCE6XCS26P5sFbinGaUReg4
	 JlNv3liMT3HtiIwH7uPLKGB55XcZLySxgtVPnS0Hy6w6rxxFQgMqLF31hOus3bjDAL
	 rG9XauhDwgaug==
Message-ID: <26a33ed4-d851-462a-948e-b19079d12ea8@kernel.org>
Date: Fri, 15 May 2026 17:14:54 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Avoid long delay in atomic
 context
To: Pavel Machek <pavel@nabladev.com>
Cc: yoshihiro.shimoda.uh@renesas.com, vkoul@kernel.org,
 neil.armstrong@linaro.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
References: <20260514111300.2152386-1-claudiu.beznea@kernel.org>
 <agY8NAyCcHkhBvBv@duo.ucw.cz>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <agY8NAyCcHkhBvBv@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6BAB0551451
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32686-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,linaro.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org,lists.infradead.org,nigauri.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi, Pavel,

On 5/15/26 00:18, Pavel Machek wrote:
> Hi!
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The OTG PHY initialization sequence needs to wait for 20 ms at a specific
>> step, as described in commit 72c0339c115b ("phy: renesas:
>> rcar-gen3-usb2: follow the hardware manual procedure").
>>
>> Commit 55a387ebb921 ("phy: renesas: rcar-gen3-usb2: Lock around hardware
>> registers and driver data") tried to address various problems in the
>> rcar-gen3-usb2 driver and converted the mutex protecting HW register
>> accesses to a spin lock, leaving, however, a long delay in the critical
>> section protected by the spin lock. This may become a problem,
>> especially on RT kernels.
>>
>> To address this, release the spin lock before sleeping for 20 ms as
>> required by the HW manual and reacquire it afterwards. To avoid other
>> threads entering the critical section and configuring the HW while the
>> software is waiting for the OTG initialization to complete, introduce the
>> otg_initializing variable alongside the otg_init_done completion. Any
>> other thread trying to configure the HW while the OTG PHY initialization
>> is in progress waits for the completion instead of immediately returning
>> errors to PHY users. The IRQs were also disabled while waiting for the OTG
>> PHY initialization to complete, as the interrupt handler may also apply HW
>> settings.
> 
> Just... there has to be a better way.
> 
>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>> +static int rcar_gen3_phy_wait_otg_init(struct rcar_gen3_chan *channel,
>> +				       unsigned long *flags)
>> +{
>> +	unsigned long timeout = msecs_to_jiffies(25);
>> +	unsigned long ret = 1;
>> +
>> +	lockdep_assert_held(&channel->lock);
>> +
>> +	/*
>> +	 * The OTG can be initialized only once and needs to release the lock
>> +	 * and wait for 20 ms due to hardware constraints. Wait for the OTG PHY
>> +	 * initialization to complete if another PHY executes configuration
>> +	 * code while the OTG PHY is waiting. This avoids returning failures to
>> +	 * PHY users.
>> +	 */
>> +	if (READ_ONCE(channel->otg_initializing)) {
>> +		spin_unlock_irqrestore(&channel->lock, *flags);
> 
> This is not nice, passing flags between functions like this is a red flag.
> 
> You are only accessing otg_initializing under the spinlock. That means
> that READ_ONCE is reduntant.
> 
> But AFAICT spinlock is only held over this function to protect
> channel->otg_initializing access. I suspect correct answer here is
> getting rid of spinlock over this function, and using
> test_bit(BIT_INITIALIZING, ...) or something similar.

If I understand correctly your point here, I don't think making the 
otg_initializing atomic (or using test_bit()) and moving it out of the spin lock 
works for all the cases. Suppose the following:

thread1:                               thread2:

0: sleep                               spin_lock_irqsave();

1: still sleep                         otg_initalizing = 1;

2: check otg_initializing              // ...

3: spin_lock_irqsave();                // ...

4:                                     spin_unlock_irqsave();

5:                                     fsleep(20000);


In this way, thread1 will get access to the HW registers once instruction at 
line 4 will be executed and be able to configure other HW registers when it 
should wait for the fsleep() to finish.

The point with the solution provided in this patch was to not allow any other 
thread to configure the HW while the fsleep() is executed.

Thank you,
Claudiu

