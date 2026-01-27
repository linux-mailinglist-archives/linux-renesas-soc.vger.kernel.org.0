Return-Path: <linux-renesas-soc+bounces-27463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDlRGzqFeGmqqgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 10:28:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1123B91B54
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 10:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA2BA3083AE3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 09:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22953346BF;
	Tue, 27 Jan 2026 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uzn1bCt4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0F5333730;
	Tue, 27 Jan 2026 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505300; cv=none; b=MMmROz2QqoN6cC0GSUcCaK64Vw5ySFX6ffXMJqOXbm0aiaH2XOrxjjVx23+w2dzAcXBU/N41vUnw/x7lLGcVqeNRIGaQNOb5ZQ4SKi0tpHTz7dec+FDcry23W2q5PM8rXfMRXfzlA58XPC5+ZsGnJyc0a/kZD8b0dsFtXDoUqmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505300; c=relaxed/simple;
	bh=X/XJ4WH36Wvr4m263XilEXK9xEJd1Byhczn9mtxIbcY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Bo8bHAd/XkPvTI7EbhdDA2lhIeQRT+YiYo6Q4fORxh/p6eH8ZoxBfubtQ43HG5pzkXmuuDJELuOwkKv6xrHeJedTXnY6X829krcGsm9ZvaoeOra+SC2MTMwMTNg/C0eWwIn3y2/AzLE/67S7t2rwk2XqAZ6ulIk48DKLj7/RyZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uzn1bCt4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC51C16AAE;
	Tue, 27 Jan 2026 09:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505300;
	bh=X/XJ4WH36Wvr4m263XilEXK9xEJd1Byhczn9mtxIbcY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Uzn1bCt4kmxL0BzRLvIZkD/PexmcyeD1Km/EiysHGZccGGrESZVGanhAOwoWwW4l9
	 XRZrsuaFPHY49GH1x5dkQFX2j5Fhl8/Rir2KcBV99lABfCxvm6gOGIve/Oniym8ite
	 DPW0GmWq6iT2f0plHZVdVXLKrDFmbLZ14Y8hmRJ0gW7kwoRaNav20t3q5MdqWbkJwX
	 c+Hj26PxWag0HGXbOrwDBs67oA4d8kDt+NmGJzJTFXvrSDQ5uncbrlUFH6/xAAiW5G
	 apNnf0IhqUUQYjmzNA4LdSB7WH7ADA1U7WK7FLJ3/uTjaxHBkUg+k/gnE/DnKGil4G
	 dfL1SfM398Qkg==
From: Thomas Gleixner <tglx@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-input@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Cheng-Yang Chou <yphbchou0911@gmail.com>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Frank Li <Frank.Li@nxp.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Jinjie Ruan
 <ruanjinjie@huawei.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>, Marc Zyngier <maz@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] linux/interrupt.h: allow "guard" notation to
 disable and reenable IRQ with valid IRQ check
In-Reply-To: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
References: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
Date: Tue, 27 Jan 2026 10:14:56 +0100
Message-ID: <87sebrbenj.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27463-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,infradead.org,gmail.com,nxp.com,glider.be,huawei.com,oss.qualcomm.com,kernel.org,linutronix.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1123B91B54
X-Rspamd-Action: no action

On Thu, Jan 22 2026 at 00:23, Marek Vasut wrote:

$Subject: linux/interrupt.h is not a proper prefix. Just use 'genirq:'

Also what means 'allow ....'? Subject lines should provide a concise
summary of the change, i.e. something like:

        Provide conditional disable_irq guard variant

> Introduce disable_valid_irq scoped guard. This is an extension
> of disable_irq scoped guard, which disables and enables IRQs
> around a scope. The disable_valid_irq scoped guard does almost
> the same, except it handles the case where IRQ is not valid,
> in which case it does not do anything. This is meant to be used
> by for example touch controller drivers, which can do both IRQ
> driven and polling mode of operation, and this makes their code
> slighly simpler.

How many of those have this pattern? From a cursory look I found not
even one as your example is neither applicable to upstream nor to next.

> +static inline void disable_valid_irq(unsigned int irq)
> +{
> +	if (irq > 0)
> +		disable_irq(irq);
> +}
> +
> +static inline void enable_valid_irq(unsigned int irq)
> +{
> +	if (irq > 0)
> +		enable_irq(irq);
> +}
> +
> +DEFINE_LOCK_GUARD_1(disable_valid_irq, int,

'int' because it matches the function argument type of the inlines,
right?

> +		    disable_valid_irq(*_T->lock), enable_valid_irq(*_T->lock))

disable_valid_irq is a pretty non-intuitive name if you look at it just
by reading a usage site. It's not really improving the readability of
the code, it's in fact obscuring it as the reader has to actually look
up what the hell this means and then stumble upon a completely
undocumented lock guard define.

I'm all for using guards, but using guards just for the sake of using
guards is not a really good approach.

Thanks,

        tglx

