Return-Path: <linux-renesas-soc+bounces-27658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LEKBXTYe2l3IwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27658-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 23:00:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F57B5258
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 23:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBECE3013D68
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 21:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05670366DDF;
	Thu, 29 Jan 2026 21:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9Mz/lyw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D313367F42;
	Thu, 29 Jan 2026 21:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769723949; cv=none; b=OcRnDSMu+9t9GAJuZlhhlEgzlkLKfxc+vZwhriHEVRjFGDv+6Qs/NZkvrqdytz0lljD+Iy2KmSHngV5bKd7T77u0rxguu9x0E7NV/5nbCwupK/27cImjeUD9OxHZSASRI6/Q/2CDEWc4jXKzouR3FtzDoVdziFkLasAkJeoyDww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769723949; c=relaxed/simple;
	bh=jUu/LakvUR0IMN5LgzfTpfIwqjTmYJzfl88EeQDwqOE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CKysRw5LphPSMHteCp72NqTsMZVldLUuZsIOVfO6A6Ilha7TKTPUTqxa4dbw/lT2fQZgztPw5/9L8ZgkKbWOhOWY0PswQ2VVeIGapWvWNJgfT0T6o48lNs9IV+s7DML70n63wYs7OKRHnaQUlrLSlriMzjTf/IqJpvfMgTmWZE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9Mz/lyw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2621BC4CEF7;
	Thu, 29 Jan 2026 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769723948;
	bh=jUu/LakvUR0IMN5LgzfTpfIwqjTmYJzfl88EeQDwqOE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i9Mz/lyw9wJV+vqSTMGdUDzGEFjpiCRf2W1mVEs/F68unrHWSO2f70OCF4RT3RLUv
	 X1F0bHO+GJciW5TLHKSufv3VbbS6zyP3HIktDcSqnPNBuv3vo4bVvl1HoT64Y5reqk
	 w7TfZkwnQJfUqTI2zEedvwR6TNVsHLasQlOrhERd4hAXv6ymfYBKKcVsqt8kF8SDCz
	 VmHiL+QT3UVpClWem0JwQtjrRAOn5F03gYIBlvJCJrZU38GfaXChhLdcolXp8kCrY/
	 aYGzisALymWQ6R5a6siVQw+aIBXF+/mMRYgokV7KnmTLpqM3is3fdHfgRDtN9t8BUK
	 Jd0jMPugG154Q==
From: Thomas Gleixner <tglx@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 4/6] irqchip/renesas-rzv2h: Add CA55 software interrupt
 support
In-Reply-To: <CA+V-a8trA53J5xt-p1odHkqeHgk_qXKQeXsf-QOfz2=JmTOSYA@mail.gmail.com>
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260121150137.3364865-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87cy2wcqe2.ffs@tglx>
 <CA+V-a8trA53J5xt-p1odHkqeHgk_qXKQeXsf-QOfz2=JmTOSYA@mail.gmail.com>
Date: Thu, 29 Jan 2026 22:59:05 +0100
Message-ID: <87bjicm66u.ffs@tglx>
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
	TAGGED_FROM(0.00)[bounces-27658-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[pengutronix.de,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
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
X-Rspamd-Queue-Id: 75F57B5258
X-Rspamd-Action: no action

On Thu, Jan 29 2026 at 21:24, Prabhakar Lad wrote:
> On Mon, Jan 26, 2026 at 4:03=E2=80=AFPM Thomas Gleixner <tglx@kernel.org>=
 wrote:
>>
>> On Wed, Jan 21 2026 at 15:01, Prabhakar wrote:
>> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> >
>> > The Renesas RZ/V2H ICU provides a software interrupt register (ICU_SWI=
NT)
>> > that allows software to explicitly assert interrupts toward individual
>> > CA55 cores. Writing BIT(n) to ICU_SWINT triggers the corresponding
>> > interrupt.
>> >
>> > Introduce a debug mechanism to trigger software interrupts on individu=
al
>> > Cortex-A55 cores via the RZ/V2H ICU. The interface is gated behind
>> > CONFIG_DEBUG_FS and a module parameter to ensure it only exists when
>> > explicitly enabled.
>>
>> Can't you reuse/extend the existing mechanism provided by
>> CONFIG_GENERIC_IRQ_INJECTION (irq_inject_interrupt(), irq_debug_write())
>> instead of implementing yet another ad hoc debugfs magic?
>>
> Can you please point me to a driver which makes use of it? In my case
> the interrupt needs to be triggered when BIT(n) (n=3D0-3) is written to
> ICU_SWINT.

Care to look what irq_inject_interrupt() does?

It tries first to inject the interrupt via irq_set_irqchip_state(),
which only works when a chip in the hierarchy implements the
chip::irq_set_irqchip_state() callback.

If that fails, it uses the resend mechanism, which utilizes the
chip::irq_retrigger() callback.

I'm sure you know how to grep for drivers which implement one of them :)

Thanks,

        tglx

