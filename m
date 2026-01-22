Return-Path: <linux-renesas-soc+bounces-27306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAAKDJBVcmkJiwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27306-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 17:51:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A78526A573
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 17:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F43033337EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB6F39F8BC;
	Thu, 22 Jan 2026 16:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xni3FQzB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1dEWmL8j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263983F6FE0;
	Thu, 22 Jan 2026 16:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098944; cv=none; b=uJN3aXGRh8qH2Ws3mJzvdEbLoThY3E/JFu8NZYXZnbN7HZBaxqIKC1KdENXzs2iEoV8oeuSzrwDjnNbKtZ1vvmdqZDLYa0rM8CCMh76sVeqap9jznoR+Cl3vuA4BLJIJ48LLsbS6wZQuWrm5/JEpBg89H2OGrzJyYFFuntvoSW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098944; c=relaxed/simple;
	bh=2vwW4XGV0Bv8FQY2HIeLl+qklzy0QgK9DDduFzBEC2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZW5oFiwq1WncaiyEX4a+k9wgx5A/+Xf5ZIozftNq2mneMWrLUcMkqr4Cv62tRIsgui8uFlURV4Ke8VEII/7Cqe+gIgLFcvt/W2y12FGrf9AB/uyBDc7TF+1JKpAqLMINDkzeVsxMfwMyYOu+GFBrrzF9lzaQLXcKQbI1N673ZDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xni3FQzB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1dEWmL8j; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 22 Jan 2026 17:22:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769098928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J6b6uHksGTbtrPzD3JvymgswzX4zVCWuFed6MmrWLQY=;
	b=Xni3FQzBk4Ub6okdKLiLfUdz1Nf+yyl9RWEg6DiRq7FWYFI3By9DShTvas0yusyPGDL2z2
	yDBrvkuR9Y/QdR3h8Z/p6MX8jZhCGdhIEzLg5dpm/MAxiXV6vBhuH/uVKJ/zzAmckxL+u+
	oYOubHvBCgshONilzXlOcBTOQV/6krGc1jxwQOUZz/VbUXlEv6SwfkPdwVR8X5sE5fjKyP
	+dAWC2zqbq29QtNJRiI1FZ4nSxZphlSMvpjmzFWDYyO2f4JlHGt1/sQky6rorTVJRLDpfT
	1TdhX6w+X0IlvgpPJY/zmyv0Iv1XiVt4vuDyDc/2JqUeicbcFr+kzN/ZE1kgRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769098928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J6b6uHksGTbtrPzD3JvymgswzX4zVCWuFed6MmrWLQY=;
	b=1dEWmL8jFBjiIr2AVux1VeZ/z/N5LzYjLHyCX3ToqywAgvHKR3U1LNg1CfP2EqqAp9LamU
	YqHh0BrtcVeE80Bw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Cheng-Yang Chou <yphbchou0911@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] linux/interrupt.h: allow "guard" notation to disable
 and reenable IRQ with valid IRQ check
Message-ID: <20260122162206.9wrHkrTZ@linutronix.de>
References: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260121232522.154771-1-marek.vasut+renesas@mailbox.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27306-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,gmail.com,nxp.com,glider.be,huawei.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A78526A573
X-Rspamd-Action: no action

On 2026-01-22 00:23:47 [+0100], Marek Vasut wrote:
> @@ -242,6 +242,21 @@ extern void irq_wake_thread(unsigned int irq, void *dev_id);
>  DEFINE_LOCK_GUARD_1(disable_irq, int,
>  		    disable_irq(*_T->lock), enable_irq(*_T->lock))
>  
> +static inline void disable_valid_irq(unsigned int irq)
> +{
> +	if (irq > 0)
> +		disable_irq(irq);
> +}

| $ grep " 0:" /proc/interrupts
|    0:         43          0          IO-APIC  2-edge      timer

in other words, interrupt 0 is valid.

Sebastian

