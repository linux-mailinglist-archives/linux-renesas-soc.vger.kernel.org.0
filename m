Return-Path: <linux-renesas-soc+bounces-32687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMCFFXswB2oQswIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 16:40:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B45551976
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 16:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B3703002104
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 14:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C921C3B27E8;
	Fri, 15 May 2026 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tCv75lBX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61D52FFF8D;
	Fri, 15 May 2026 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855884; cv=none; b=lAUe6d+1ZxQWRP0FIblK6l/3GshPFj0PSamj3nc+o4cD/huJc6x9JZMBatJkrKRmgFOPGnCgjDDbVF55w6A3ehvuY+F5E5Vr/1YuMPle+CPjrcL2+I0SRJ2CxW/y97SfMIVR9IQm/jxn16UxK8ziIBqNigKyMVM1PxjxP6VBuQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855884; c=relaxed/simple;
	bh=PWeexAqHp+to3y+8P/Yutu/QqNE28sBZxhOH6puKRM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAUxiwJcjc8PRGv+9UQeAf1Nh52qqWBrfWrtVAym0eVnsIZep+85qYR64jqPre1Dh1laNz7DQGroWSrWzZbJR/7YIv60eeMwQ2iHgsvuLupG7BImhsiDUHUt/B/5PZF7SoYOBHNXOMJRAmZrS1dUMkCVkJgRs1niRsYo8nbtBdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tCv75lBX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19E3C2BCB0;
	Fri, 15 May 2026 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778855884;
	bh=PWeexAqHp+to3y+8P/Yutu/QqNE28sBZxhOH6puKRM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tCv75lBXSxkE9qmOvQAEtN6TIp1Z1O4cUSp+BubGPjcPKIAsqk2i58drOCu471PJm
	 KXIItg4+leKxNfP5AQje18Zb5JQGy3VtrsPazHOzBuQOrqjNoudAvobfYdVpJsJejr
	 bkv9+y6ZRN/w0Ynk9+w56irA4PdF8U0AJ/TiASuiAKhsFxPJNy71OlfPW286JF80rx
	 /e/0WFg5J8saIUSLCP4Fp6k2UmOX8QklIu6PU6pLMA+7XICuxkYTD9t2rOPacpQ2si
	 CiEi5uwBMsWqaLOG7vG6fhZYskPJpsHdCTopXtyFYdMKgjr/FtBYfrkRhsHP9EXgaY
	 w2rZubpKwB2AQ==
Message-ID: <b333b1a8-5b6a-4584-b76c-0e1bd0e41a19@kernel.org>
Date: Fri, 15 May 2026 17:37:58 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Avoid long delay in atomic
 context
To: David Laight <david.laight.linux@gmail.com>,
 Pavel Machek <pavel@nabladev.com>
Cc: yoshihiro.shimoda.uh@renesas.com, vkoul@kernel.org,
 neil.armstrong@linaro.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
References: <20260514111300.2152386-1-claudiu.beznea@kernel.org>
 <agY8NAyCcHkhBvBv@duo.ucw.cz> <20260515104749.24135f22@pumpkin>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260515104749.24135f22@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C5B45551976
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32687-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nabladev.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,linaro.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org,lists.infradead.org,nigauri.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nabladev.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

Hi, David,

On 5/15/26 12:47, David Laight wrote:
> On Thu, 14 May 2026 23:18:44 +0200
> Pavel Machek <pavel@nabladev.com> wrote:
> 
>> Hi!
>>
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The OTG PHY initialization sequence needs to wait for 20 ms at a specific
>>> step, as described in commit 72c0339c115b ("phy: renesas:
>>> rcar-gen3-usb2: follow the hardware manual procedure").
>>>
>>> Commit 55a387ebb921 ("phy: renesas: rcar-gen3-usb2: Lock around hardware
>>> registers and driver data") tried to address various problems in the
>>> rcar-gen3-usb2 driver and converted the mutex protecting HW register
>>> accesses to a spin lock, leaving, however, a long delay in the critical
>>> section protected by the spin lock. This may become a problem,
>>> especially on RT kernels.
>>>
>>> To address this, release the spin lock before sleeping for 20 ms as
>>> required by the HW manual and reacquire it afterwards. To avoid other
>>> threads entering the critical section and configuring the HW while the
>>> software is waiting for the OTG initialization to complete, introduce the
>>> otg_initializing variable alongside the otg_init_done completion. Any
>>> other thread trying to configure the HW while the OTG PHY initialization
>>> is in progress waits for the completion instead of immediately returning
>>> errors to PHY users. The IRQs were also disabled while waiting for the OTG
>>> PHY initialization to complete, as the interrupt handler may also apply HW
>>> settings.
>>
>> Just... there has to be a better way.
>>
>>> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>>> +static int rcar_gen3_phy_wait_otg_init(struct rcar_gen3_chan *channel,
>>> +				       unsigned long *flags)
>>> +{
>>> +	unsigned long timeout = msecs_to_jiffies(25);
>>> +	unsigned long ret = 1;
>>> +
>>> +	lockdep_assert_held(&channel->lock);
>>> +
>>> +	/*
>>> +	 * The OTG can be initialized only once and needs to release the lock
>>> +	 * and wait for 20 ms due to hardware constraints. Wait for the OTG PHY
>>> +	 * initialization to complete if another PHY executes configuration
>>> +	 * code while the OTG PHY is waiting. This avoids returning failures to
>>> +	 * PHY users.
>>> +	 */
>>> +	if (READ_ONCE(channel->otg_initializing)) {
>>> +		spin_unlock_irqrestore(&channel->lock, *flags);
>>
>> This is not nice, passing flags between functions like this is a red flag.
> 
> It would be better to just inline the code.

I can do that, I tried to avoid it.

> And I'd guess you need to redo the initial tests after re-acquiring the lock?

Could you please let me know what do you mean by "initial tests"

> Or even need to do a state change/reference count before releasing the
> lock to stop other threads 'doing anything nasty'.

I'm not sure I understand this. I'll explain how the patch works:

The HW provides a single OTG PHY. As the HW has a single OTG PHY and the start 
of the OTG PHY initialization is done under spinlock, at any moment, a single 
thread could set the otg_initializing. That would be the thread configuring the 
OTG PHY. And once the OTG PHY was set there is no way it will run again (due to 
rphy->initialized). Unless the struct phy_ops::exit() is called for the OTG PHY.

With the solution in this patch, once a thread sets the otg_initializing, all 
the other threads that will want to set HW registers should wait due to the 
completion mechanism.

If there is any thread that executes wait_for_completion() while:
- otg_initializing is set and
- the OTG configuration thread released the spin lock to execute the fsleep()
if the wait_for_completion times out, the PHY code returns error to the caller 
so the thread calling into the PHY driver will not continue into the PHY driver.

If instead there is no timeout, the waiting thread will have to re-acquire the 
spin lock before executing any HW settings.

If there is no timeout, the code that setup the OTG PHY have already been 
running rphy->initialized = true for the OTG PHY, under spinlock, and no other 
thread will enter the above OTG initialization section:

	/* Initialize otg part (only if we initialize a PHY with IRQs). */
	if (rphy->int_enable_bits && channel->is_otg_channel &&
	    !rcar_gen3_is_any_otg_rphy_initialized(channel)) {
		rcar_gen3_init_otg_phase0(channel);
		disable_irq_nosync(channel->irq);
		reinit_completion(&channel->otg_init_done);
		WRITE_ONCE(channel->otg_initializing, true);
		spin_unlock_irqrestore(&channel->lock, flags);

		fsleep(20000);

		spin_lock_irqsave(&channel->lock, flags);
		WRITE_ONCE(channel->otg_initializing, false);
		complete_all(&channel->otg_init_done);
		enable_irq(channel->irq);
		rcar_gen3_init_otg_phase1(channel);
	}

Thank you,
Claudiu

