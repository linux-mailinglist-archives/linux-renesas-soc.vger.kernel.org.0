Return-Path: <linux-renesas-soc+bounces-32688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ2nL2s1B2rftQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 17:02:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AF3551D1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 17:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4477A301B927
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 15:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD5C3C4B81;
	Fri, 15 May 2026 15:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQKwRrRe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5767B3932D1;
	Fri, 15 May 2026 15:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857299; cv=none; b=ip4zper+tUYT84fBgriyQ39MueS5YIcTisdUwysranvMlyXCm1usq/Zv9+VrjtIwkhPfOqmeF8WB5BvqUnWCye/Mw0LpXL9APOyHGtYDxngUArDuUtanzHCQmB9B8UjWEgR162+7saEbxWa0lvOo/qnqULVNlOaIeF0bstEIK2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857299; c=relaxed/simple;
	bh=itExJiGkZ6HIPPRSW3hnX46O42Hw5jWW8bgNWcx6GsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k28RfVNJzKFiko33+O+jbYxJG7s3vZaybFXHrtaOWbJZyTtkwloQTulUFtkzv3AzKEUI9x8TsKS2q7c2ksVxTHAxPowTU4CyNRI2WhDA/PI7DWuhjDlFruiIHLRqK/aucaH1yZYYQqI3p8s3Eo6eQsWR2yc/6ySi9A8EyGsGw2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQKwRrRe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031B7C2BCB8;
	Fri, 15 May 2026 15:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778857299;
	bh=itExJiGkZ6HIPPRSW3hnX46O42Hw5jWW8bgNWcx6GsA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oQKwRrRe+/gqfIF44ewwvEckptBQdewfykuUSWQAKwdmmGt9Wr2XALjGWxvoeDCiz
	 ywwr5HOqaXNvrSFtQiXF9Dr252nRDzq5AFbaI2/RAhcn50gsc3vuwl/0tw0EA/RqNB
	 HUG28TG3001zHJKvndJspacIZpvj65viG6R1eIq9cPN0Vx1Wbr4+vBuAXO+t8iTF2H
	 PGi8yPgj1V4ID+0sip1lgadlIizGnOR1F1+I4eqSnfgf6luSt2nAWLrxlf4qtcSlCQ
	 KYZvRmK9lIc+keSX4WRKxDI+AHHsWL1IT8pepkDZlhEyT7TNJ/J+W5ZY4ED9hE4C28
	 lSTJ2PbHUecgw==
Message-ID: <a88cbcff-2114-45fe-9ab6-d456c69dba99@kernel.org>
Date: Fri, 15 May 2026 18:01:33 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: sashiko review: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Avoid long
 delay in atomic context
To: yoshihiro.shimoda.uh@renesas.com, vkoul@kernel.org,
 neil.armstrong@linaro.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org,
 Pavel Machek <pavel@nabladev.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
References: <20260514111300.2152386-1-claudiu.beznea@kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260514111300.2152386-1-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 84AF3551D1E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32688-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,linaro.org,glider.be,gmail.com,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

 >commit 856d28e68a5bcfa08fa03aa685cb15772197dedc
 >Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
 >phy: renesas: rcar-gen3-usb2: Avoid long delay in atomic context
 >This commit releases the spin lock before sleeping for 20 ms during
 >OTG PHY initialization and introduces completion mechanisms to prevent
 >other threads from configuring the hardware concurrently. It also disables
 >IRQs while waiting to prevent interrupt handlers from applying settings.
 >Closes: https://lore.kernel.org/all/afhkX2Ys2BG1gnqy@duo.ucw.cz
 >Closes: https://lore.kernel.org/all/afhkX2Ys2BG1gnqy@duo.ucw.cz
 >> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c 
b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
 >> index 79e820e2fe55d..5a18bbd87c3b9 100644
 >> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
 >> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
 >[ ... ]
 >> @@ -388,32 +392,68 @@ static bool rcar_gen3_are_all_rphys_power_off(struct 
rcar_gen3_chan *ch)
 >>      return true;
 >>  }
 >>
 >> +static int rcar_gen3_phy_wait_otg_init(struct rcar_gen3_chan *channel,
 >> +                                   unsigned long *flags)
 >> +{
 >> +    unsigned long timeout = msecs_to_jiffies(25);
 >Could this completion timeout be too tight?

I tried to have a bit increased compared with the fsleep() value to avoid just 
being to tight but not to big.

 >The initializing thread uses fsleep(20000) which guarantees a minimum sleep
 >of 20ms. Due to scheduler jitter or timer wheel granularity (especially if
 >HZ=100, where 25ms rounds to just 2 or 3 jiffies), the 20ms sleep can easily
 >exceed 25ms of wall-clock time, causing this to spuriously return -ETIMEDOUT.
 >> +    unsigned long ret = 1;
 >> +
 >> +    lockdep_assert_held(&channel->lock);
 >[ ... ]
 >> @@ -427,7 +467,10 @@ static ssize_t role_store(struct device *dev, struct 
device_attribute *attr,
 >>                        const char *buf, size_t count)
 >>  {
 >>      struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
 >>      bool is_b_device;
 >>      enum phy_mode cur_mode, new_mode;
 >> +    unsigned long flags;
 >> +    int ret = -EIO;
 >>
 >> -    guard(spinlock_irqsave)(&ch->lock);
 >> +    spin_lock_irqsave(&ch->lock, flags);
 >>
 >>      if (!ch->is_otg_channel || !rcar_gen3_is_any_otg_rphy_initialized(ch))
 >> -            return -EIO;
 >> +            goto unlock;
 >> +
 >> +    ret = rcar_gen3_phy_wait_otg_init(ch, &flags);
 >Does checking the initialized state before waiting for the lock to be
 >released introduce a race condition?
 >Because rcar_gen3_phy_usb2_init() only sets rphy->initialized = true after
 >it finishes its 20ms sleep and reacquires the lock, a concurrent sysfs write
 >to role_store() during this 20ms window will see initialized as false and
 >immediately return -EIO instead of waiting for initialization to complete.

It is better to have it as suggested here, thus I'll adjust it as proposed.

 >> +    if (ret)
 >> +            goto unlock;
 >[ ... ]
 >> @@ -512,6 +556,11 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void 
*_ch)
 >>              goto rpm_put;
 >>
 >>      scoped_guard(spinlock, &ch->lock) {
 >> +            if (READ_ONCE(ch->otg_initializing)) {
 >> +                    dev_warn(dev, "%s: Got IRQ while waiting for OTG 
init!\n", __func__);
 >> +                    return IRQ_NONE;
 >> +            }
 >Does returning early here leak the PM runtime reference?

Indeed, I missed that, will adjust it in the next version.

 >The interrupt handler calls pm_runtime_get_noresume(dev) at the beginning of
 >the function, and releases it at the rpm_put label. By using return IRQ_NONE
 >inside the scoped_guard, the code bypasses pm_runtime_put_noidle() completely,
 >preventing the device from ever entering runtime suspend.
 >Additionally, since this interrupt is requested with IRQF_SHARED, could
 >another device sharing the line trigger a valid interrupt during the 20ms
 >OTG initialization window? If so, this would print a spurious warning to
 >the kernel log for a valid shared interrupt event.

That's a valid point. Better would be to just mask the interrupt locally.

 >> +
 >>              status = readl(usb2_base + USB2_OBINTSTA);
 >>              if (status & ch->phy_data->obint_enable_bits) {
 >>                      dev_vdbg(dev, "%s: %08x\n", __func__, status);
 >[ ... ]
 >> @@ -550,8 +605,22 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 >>      }
 >>
 >>      /* Initialize otg part (only if we initialize a PHY with IRQs). */
 >> -    if (rphy->int_enable_bits)
 >> -            rcar_gen3_init_otg(channel);
 >> +    if (rphy->int_enable_bits && channel->is_otg_channel &&
 >> +        !rcar_gen3_is_any_otg_rphy_initialized(channel)) {
 >> +            rcar_gen3_init_otg_phase0(channel);
 >> +            disable_irq_nosync(channel->irq);
 >Could channel->irq be 0 here?

In theory, AFAIK, this code should not be executed when the interrupt is not 
present as the OTG PHY needs the interrupt.

 >In rcar_gen3_phy_usb2_probe(), platform_get_irq_optional() is used. If it
 >returns -ENXIO, channel->irq remains 0. Since rphy->int_enable_bits is a
 >statically defined non-zero value for OTG PHYs, this would pass 0 to
 >disable_irq_nosync(), which manipulates critical system interrupts.
 >Also, does calling disable_irq_nosync() on a shared interrupt line starve
 >other devices?
 >Since the interrupt is requested with IRQF_SHARED, masking it at the
 >interrupt controller level means all other unrelated devices on the same
 >physical line will have their interrupts disabled for the full 20ms
 >duration. Should shared interrupts be masked locally at the device level
 >instead?

That would be better, indeed.

 >> +            reinit_completion(&channel->otg_init_done);
 >> +            WRITE_ONCE(channel->otg_initializing, true);
 >> +            spin_unlock_irqrestore(&channel->lock, flags);
 >[ ... ]
 >> @@ -598,6 +678,7 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 >>      struct rcar_gen3_phy *rphy = phy_get_drvdata(p);
 >>      struct rcar_gen3_chan *channel = rphy->ch;
 >>      void __iomem *usb2_base = channel->base;
 >> +    unsigned long flags;
 >>      u32 val;
 >>      int ret = 0;
 >>
 >> @@ -607,11 +688,15 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 >>                      return ret;
 >>      }
 >>
 >> -    guard(spinlock_irqsave)(&channel->lock);
 >> +    spin_lock_irqsave(&channel->lock, flags);
 >>
 >>      if (!rcar_gen3_are_all_rphys_power_off(channel))
 >>              goto out;
 >>
 >> +    ret = rcar_gen3_phy_wait_otg_init(channel, &flags);
 >> +    if (ret)
 >> +            goto unlock;
 >> +
 >>      val = readl(usb2_base + USB2_USBCTR);
 >>      val |= USB2_USBCTR_PLL_RST;
 >Does dropping the lock in rcar_gen3_phy_wait_otg_init() introduce a race
 >condition with the !rcar_gen3_are_all_rphys_power_off() check?
 >If two threads concurrently power on different PHYs, both will evaluate the
 >condition as false because neither has reached rphy->powered = true at the
 >end of the function. Both threads might then sleep in
 >rcar_gen3_phy_wait_otg_init().
 >Upon waking and reacquiring the lock, both will unconditionally apply
 >USB2_USBCTR_PLL_RST, which could catastrophically disrupt the PHY that was
 >just initialized by the first thread.
 >Should the power off condition be re-evaluated after the lock is reacquired?

Yes, rcar_gen3_phy_wait_otg_init() should be called first.


