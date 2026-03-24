Return-Path: <linux-renesas-soc+bounces-30134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKoRATn1wWmmYQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 03:21:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF263011B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 03:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F503302DE39
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 02:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C3E33A033;
	Tue, 24 Mar 2026 02:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Bx7tBR+R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC51036C0CB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 02:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318883; cv=none; b=kXVniNBv1qKumfZxxy30zdOq99GmHLGjCmFHnKvCcwEYbb8+23td465y3N3Q6UjrBp1/Jagej20FasGu06iqoPAN+SPyMQTa3DzqV3Asf3IR1HNYiS+jEYBfH3N6r5KKKvDhhsjLgMQKRgxeFwMPOfqvbuHTChVKcnRMWk2+ycE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318883; c=relaxed/simple;
	bh=N8uGtnOrLSSYq7rgYu08rxjElQse66qBIYWu/BzwXTE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SMkXY/e+vn1yxHzfSuPbgQtBeYne6f9/A9CPkH5T5LfehAyiFg2HDXsTh3/a8ZUEz/brOhRfgpeb5ayUfV6Dfxm+Ovo44StpEQFLFnqhl4zKhYXBwzwjntq3OpZ8CpD6C0Mb1RMM9fJcqUGBqbuS+lSgEiMsP66jjQw0B8co3b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Bx7tBR+R; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774318880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L6ywbevgg011A/v8dkRvqjFGFhUuQBymJSUH5ys5Owg=;
	b=Bx7tBR+RASxBeR0llj4jjTeIAf+o+tXCCBFdZg+qSSQe00g1nm+YJq4QW/PGHIe0MljQJe
	l4BnwfYfSLSMV6TpZdPycRlbb9SixlHtQhpTMcw1SwUl35K/z2oqVfhZBscWTxkidl6meb
	wY0ByAmCpG8ZPkUEkDdpx8RrsGB3+vY=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,  linux-kernel@vger.kernel.org,  Jassi
 Brar <jassisinghbrar@gmail.com>,  Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Magnus Damm <magnus.damm@gmail.com>
Subject: Re: Sashiko review feedback (was Re: [PATCH 2/3] soc: renesas: Add
 Renesas R-Car MFIS driver)
In-Reply-To: <ab-vWbjdlAIt1qaX@ninjato> (Wolfram Sang's message of "Sun, 22
	Mar 2026 09:59:05 +0100")
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
	<20260317130638.2804-3-wsa+renesas@sang-engineering.com>
	<ab-vWbjdlAIt1qaX@ninjato>
Date: Mon, 23 Mar 2026 19:21:13 -0700
Message-ID: <87a4vyynl2.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30134-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roman.gushchin@linux.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:dkim,linux.dev:mid,sang-engineering.com:email]
X-Rspamd-Queue-Id: BFF263011B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wolfram Sang <wsa+renesas@sang-engineering.com> writes:

> Hi all,
>
> I am usually not into AI but I can definitely see value in its review
> assistance. So, I checked what Sashiko thinks of my series and found the
> comments to be largely reasonable. I'll copy and answer them here, a)
> for a more complete review process and b) to give feedback to the
> Sashiko-devs (CCed). Thank you for the service and efforts, I hope we
> can justify the additional energy consumption here. Please let me know
> if such replies are actually helpful for you.

Hi Wolfram!

These replies are definitely helpful! I can't realistically look into
all cases across all subsystems (I simple have not enough expertise),
but I'll try to look into most cases and hope that other engineers will
help here.

In your case it looks like most findings were real?

Thank you!

>
>> > +static void mfis_write(struct mfis_reg *mreg, u32 reg, u32 val)
>> > +{
>> > +	struct mfis_priv *priv = mreg->priv;
>> > +	u32 unprotect_mask = priv->info->unprotect_mask;
>> > +	u32 unprotect_code;
>> > +
>> > +	/*
>> > +	 * [Gen4] key: 0xACCE0000, mask: 0x0000FFFF
>> > +	 * [Gen5] key: 0xACC00000, mask: 0x000FFFFF
>> > +	 */
>> > +	unprotect_code = (MFIS_UNPROTECT_KEY & ~unprotect_mask) |
>> > +			 ((mreg->start | reg) & unprotect_mask);
>> 
>> The mreg->start and reg variables are combined with a bitwise OR. If
>> mreg->start has overlapping bits with the reg offset, could this yield an
>> incorrect physical address for the unprotect code? Should this use
>> addition like mreg->start + reg instead?
>
> No, if a device tree is so wrongly setup that the bits overlap, then '+'
> instead of '|' will only lead to a different wrong address.
>
>> > +
>> > +	iowrite32(unprotect_code, priv->common_reg.base + MFISWACNTR);
>> > +	iowrite32(val, mreg->base + reg);
>> > +}
>
>> Can mfis_write() be called concurrently by different processors or
>> interrupted by an interrupt handler like mfis_mb_iicr_interrupt()?
>
> Yes, it can. It even needs a hwspinlock instead of a regular spinlock
> because it needs protection against cores which may not run Linux.
> hwspinlock support will only be added later because of dependency
> issues. My plan was to add the protection once we got hwspinlocks. But
> maybe I should add just spinlocks now and convert them to hwspinlocks
> once their support is in.
>
>> > +static void mfis_mb_shutdown(struct mbox_chan *chan)
>> > +{
>> > +	struct mfis_per_chan_priv *per_chan_priv = chan->con_priv;
>> > +
>> > +	free_irq(per_chan_priv->irq, chan);
>> > +}
>
>> Since mfis_mb_of_xlate() skips interrupt lookup for transmit-only channels,
>> leaving per_chan_priv->irq as 0, and mfis_mb_startup() guards the request
>> with if (per_chan_priv->irq), will this unconditional free_irq() trigger a
>> kernel warning when shutting down a transmit-only channel?
>
> Yes, I seemed to remember that free_irq() can handle this, but it will
> in-deed trigger a warning. Also, the reasons Geert mentioned in his
> review apply.
>
>> [ ... ]
>> > +static struct mbox_chan *mfis_mb_of_xlate(struct mbox_controller *mbox,
>> > +					  const struct of_phandle_args *sp)
>> > +{
>> > +	struct mfis_priv *priv = mfis_mb_mbox_to_priv(mbox);
>> > +	struct mfis_per_chan_priv *per_chan_priv;
>> > +	struct mbox_chan *chan;
>> > +	u32 chan_num, chan_flags;
>> > +	bool tx_uses_eicr, is_only_rx;
>> > +
>> > +	if (sp->args_count != 2)
>> > +		return ERR_PTR(-EINVAL);
>> > +
>> > +	chan_num = sp->args[0];
>> > +	chan_flags = sp->args[1];
>> > +
>> > +	/* Channel layout is described in mfis_mb_probe() */
>> > +	if (priv->info->mb_channels_are_unidir) {
>> > +		is_only_rx = chan_flags & MFIS_CHANNEL_RX;
>> > +		chan = mbox->chans + 2 * chan_num + is_only_rx;
>
>> Does this code allow out-of-bounds access if a malformed device tree
>> provides an arbitrarily large chan_num? Should chan_num be checked against
>> priv->info->mb_num_channels before computing the chan pointer?
>
> Yes, Geert pointed this out as well.
>
>> [ ... ]
>> > +static int mfis_mb_probe(struct mfis_priv *priv)
>> > +{
>> [ ... ]
>> > +	mbox->chans = chan;
>> > +	mbox->num_chans = num_chan;
>> > +	mbox->txdone_poll = true;
>> > +	mbox->ops = &mfis_iicr_ops;
>> > +	mbox->dev = dev;
>> > +	mbox->of_xlate = mfis_mb_of_xlate;
>> > +
>> > +	return mbox_controller_register(mbox);
>> > +}
>> The mailbox controller is registered using mbox_controller_register(), but
>> the driver lacks a remove callback to unregister it.
>> If the driver is unbound, devres will free the devm_kzalloc structures
>> backing the mailbox. Will this result in a use-after-free regression since
>> the mailbox subsystem still retains the controller in its global lists?
>> Should devm_mbox_controller_register() be used instead?
>> [ ... ]
>
> Yes, this was overlooked so far.
>
>> > +static int mfis_probe(struct platform_device *pdev)
>> > +{
>> > +	struct mfis_priv *priv;
>> > +	struct device *dev = &pdev->dev;
>> > +	int ret;
>> > +
>> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> > +	if (!priv)
>> > +		return -ENOMEM;
>> > +
>> > +	priv->dev = dev;
>> > +	priv->info = of_device_get_match_data(dev);
>> Can of_device_get_match_data() return a null pointer here?
>> If the driver is bound manually via sysfs or instantiated in an environment
>> lacking device tree match data, would this lead to a null pointer
>> dereference regression later when accessing priv->info->mb_num_channels in
>> mfis_mb_probe()?
>
> The latter case would be clearly a driver bug. In addition with the
> former case, it probably makes sense to handle this more gracefully,
> though.
>
> Happy hacking,
>
>    Wolfram

