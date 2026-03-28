Return-Path: <linux-renesas-soc+bounces-30535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AApuHrTVx2kddQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 14:20:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0302534E816
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 14:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0ED23016B9E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 13:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E050D38BF82;
	Sat, 28 Mar 2026 13:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2NT2jnO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7692377550;
	Sat, 28 Mar 2026 13:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774703450; cv=none; b=DDvQ7wS0YfUv721JTl4wve1px8F3RdH+6FYA1Mk/Y+PiYP4QRIhnqVcvlXqstkBcOQ/y9GIbJ64xvWvtqF+gsaRMS1iNFb02UCtklatmLMCTStmPSa2UR7Ap5GPKgLXgBKfq3hA4S2V0yroZ8UqD6viQS8xyc3sBSDh7ql2L5dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774703450; c=relaxed/simple;
	bh=BLDbeDKJZle3vRx68q25l2uuwBLUQTfRDz/M+4Dx/bc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A9c/NuExxdNBdftSOm0p9ctNUjbufg/ndKL+eV/m4WTcTfUEaCqi3jhkW53n9Ovs+/jB6//m5EBb4NthOWdTtOkRvPxW13cn9v02Zb/4oFGeIcqsCft48bzoSUMBCXuc+BMFa1rWfnXaok9amOu9DgJJwXnNeVPBJhzoaAvSjzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2NT2jnO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6E7C4CEF7;
	Sat, 28 Mar 2026 13:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774703450;
	bh=BLDbeDKJZle3vRx68q25l2uuwBLUQTfRDz/M+4Dx/bc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U2NT2jnOQC9F38xeBkF5DCdQklNsxk0J8b++wtfjtFoLzNZQxmrAaSqE8ceEfUdeU
	 OVJmrcImMSpKDNFhH/JFPWeX18A2k14ft1fLJW2qKLP/3Gk6vTWb+TrGjxW9qsv01O
	 uwlnCV3Out3cM+Ozl5rbAdsbJJjwXtUOot3TAKMzvI0l8Ff9q51+ihNrvUCpnwIYtH
	 XeD6rMWaTtNgLEU3F/ny4gcKpE/lmu2s/qdeSPz7jtCUkt0IJZv4bU2eozVwoT20PE
	 rO/Wt4QgYQAscBhVrczfx1kU5t0PUYKuZe2xccwdg6ackbVT4B8yu+Rt01JUpyA+ht
	 4WOWaX3s8N8LQ==
From: Thomas Gleixner <tglx@kernel.org>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Olivia Mackall
 <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jayesh
 Choudhary <j-choudhary@ti.com>, "David S. Miller" <davem@davemloft.net>,
 Christian Marangi <ansuelsmth@gmail.com>, Antoine Tenart
 <atenart@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pascal EBERHARD
 <pascal.eberhard@se.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, "Miquel Raynal (Schneider Electric)"
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 12/16] irqchip/eip201-aic: Add support for Safexcel
 EIP-201 AIC
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-12-5e6ff7853994@bootlin.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-12-5e6ff7853994@bootlin.com>
Date: Sat, 28 Mar 2026 14:10:46 +0100
Message-ID: <87pl4oayll.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [4.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30535-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_TO(0.00)[bootlin.com,baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[se.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 0302534E816
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27 2026 at 21:09, Miquel Raynal wrote:
> +config SAFEXCEL_EIP201_AIC
> +        tristate "Safexcel EIP201 AIC"

TAB, not spaces please

> +	select IRQ_DOMAIN
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 Schneider Electric
> + * Authored by Miquel Raynal <miquel.raynal@bootlin.com>
> + * Based on the work from Mathieu Hadjimegrian <mathieu.hadjimegrian@non.se.com>
> + */
> +
> +#include "linux/irq.h"
> +#include "linux/stddef.h"

That's not a standard include format.

> +
> +struct eip201_aic {
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct irq_domain *domain;
> +	struct irq_chip_generic *gc;
> +	u32 type;
> +	u32 pol;
> +};

Please follow:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

> +
> +	/* Type register indicates:

See 'comment style' in the same document.

> +	 * - '1' for edge interrupts
> +	 * - '0' for level interrupts
> +	 */
> +	if (*out_type & IRQ_TYPE_LEVEL_MASK &&
> +	    EIP201_AIC_INT(aic->type, *out_hwirq))

No line break required. You have 100 characters.

> +static int eip201_aic_probe(struct platform_device *pdev)
> +{
> +	struct eip201_aic *aic;
> +	struct clk *clk;
> +	u32 rev;
> +	int irq;
> +	int ret;

See 'variable declarations' in the same document.

> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;

Leaks the chip and the domain.

> +static struct platform_driver eip201_aic_driver = {
> +	.probe = eip201_aic_probe,
> +	.remove = eip201_aic_remove,
> +	.driver = {
> +		.name = "safexcel-eip201-aic",
> +		.of_match_table = eip201_aic_of_match,

See above.

Thanks,

        tglx

