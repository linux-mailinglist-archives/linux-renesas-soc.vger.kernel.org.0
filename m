Return-Path: <linux-renesas-soc+bounces-27686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKjxFs3FfGm+OgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 15:53:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AB1BBCA8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 15:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C01430097F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09C3328B7F;
	Fri, 30 Jan 2026 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PwpN3yb1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9216328F50F;
	Fri, 30 Jan 2026 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769784762; cv=none; b=t6XxVaLy770lNMTCGv6ORVRHCefUjhPHfZN147IVwfFn/eYugjcqf8moYt3qlqyyQsjByjirKQxPo7EAQO12FvJT9aKS/MYL+fwtdpWYJ/n0qCkZY/yluPUKY7KXscHygF6TGadkc3B4Wy2Xyd3khOWdCs8iaQdHpATC2yaWoUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769784762; c=relaxed/simple;
	bh=KxjC8u30LIXy40FLQVParJ3wLNyEqHVzZGtjgnyIcU4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aGs87ceZBjLg0QRggHXqGgujNfHyz5rQR8eQQaZhKvZaqMTShgGB7j0JYYoE+F5uzecuBX9JMR+HY8ZQZOygaqM5NHgqWlZ3dlhPaMSZREZ+hzzFja29e45PPOCBD3H2Nidy8OXVnmAtFTVcKApmxdFvburtzhMOuoc0zxnwbTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwpN3yb1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51EBC4CEF7;
	Fri, 30 Jan 2026 14:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769784762;
	bh=KxjC8u30LIXy40FLQVParJ3wLNyEqHVzZGtjgnyIcU4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PwpN3yb1zObc/yX7ObOJD36+XQIQYyjsrfp/vQVraMPy2wZYcInjNjh2SMNRI6OrT
	 EgjCAM3rSuREcZMQmN6gk1tV7wcw8GBz4cqnQC2x0Al/srIB/kD5PrcYP2AVcr1e/n
	 +VdNRmnQ3fb0jUfmffjkwajLUq4/0Eptq1nGdYUYR96QImQaLJstwdbXOqBEfTKpDd
	 AN+9Kyuzk2bW7JWHiDzj7eVsGAuMD0p2iYoDu0dbstM12reiIJpefNFD1h11jBstaY
	 qL9tthHOIIHNZsb6n24SXFz0/2A7LjiFZlRnZRyaqFiYCFbzbLJQo6joWLyhuQ1y6H
	 21q4m0QDNQN8g==
From: Thomas Gleixner <tglx@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm
 <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 4/6] irqchip/renesas-rzv2h: Add CA55 software interrupt
 support
In-Reply-To: <CA+V-a8sjADs_=81h=5R1nEFt3LWVNuHS1y-kH6Z5ANNp0Sci0w@mail.gmail.com>
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260121150137.3364865-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87cy2wcqe2.ffs@tglx>
 <CA+V-a8trA53J5xt-p1odHkqeHgk_qXKQeXsf-QOfz2=JmTOSYA@mail.gmail.com>
 <87bjicm66u.ffs@tglx>
 <CA+V-a8sjADs_=81h=5R1nEFt3LWVNuHS1y-kH6Z5ANNp0Sci0w@mail.gmail.com>
Date: Fri, 30 Jan 2026 15:52:38 +0100
Message-ID: <87fr7nkv9l.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27686-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,glider.be];
	FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A5AB1BBCA8
X-Rspamd-Action: no action

On Fri, Jan 30 2026 at 11:17, Lad, Prabhakar wrote:
> On Thu, Jan 29, 2026 at 9:59=E2=80=AFPM Thomas Gleixner <tglx@kernel.org>=
 wrote:
>> It tries first to inject the interrupt via irq_set_irqchip_state(),
>> which only works when a chip in the hierarchy implements the
>> chip::irq_set_irqchip_state() callback.
>>
> I did implement irq_set_irqchip_state but it doesn't land in the
> rzv2h_icu_irq_set_irqchip_state(). So I was wondering if I missed
> something.
>
> #Trigger int-ca55-0
> root@rzv2h-evk:/sys/kernel/debug/irq/irqs# echo trigger > 14
>
> #The trace looks like below:
> irq_debug_write()
>   -> irq_inject_interrupt()
>      -> irq_set_irqchip_state()
>
> This lands in GICV3. For the RZ/V2H ICU only interrupts port_irqx and
> tintx interrupts are registered  in irq_domain_create_hierarchy() for
> the rest of the interrupts these are supposed to be directly handled
> by GICv3.
...
> How do you propose to handle this? irq_inject_interrupt() would work
> if I move int-ca55-x and icu-error-ca55 under
> irq_domain_create_hierarchy().

Correct. That's how the hierarchy works.

