Return-Path: <linux-renesas-soc+bounces-29989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JEuM8EOvWkz6QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 10:09:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E032D7C45
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 10:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E75A4303C511
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 09:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FE4328616;
	Fri, 20 Mar 2026 09:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idzU29BZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5205A328B7D;
	Fri, 20 Mar 2026 09:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773997234; cv=none; b=DTaIxs8/mM2xDA8hcbtUdXYiMlPLorVaTJpXIKQgPUORmqSUMdZSmIiGlmxz9BOKLEzi8yxSW6/svIy3vrmX8WBnJYfCvpI9PawGV+n4xoHYedvnSGqjqts70aUgc6qRutYiCFW9KCqYEDl8C3SmpihvcEEC/jgFtbf+odpwOJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773997234; c=relaxed/simple;
	bh=fRiRWT6T3RGiyzohfCBp2WnuxT9XIeIAMw872dKHltY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g32NeOWPN/tJzuD4OVhi2AygSwiQni6Y6Qqe6Ax/xwEtBxMRdtlhdP/JorChdfYyy/DVnZmwLjkdull5L8sJzd7q9d3DntLvCvJGx7KuYbXVhlLgOUhoRskdXq+ZsZHSyk5pGsdJINoj36LeJhD2t43fCOXTG7K6ZIYCthDuxaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idzU29BZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFC0C4CEF7;
	Fri, 20 Mar 2026 09:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773997234;
	bh=fRiRWT6T3RGiyzohfCBp2WnuxT9XIeIAMw872dKHltY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=idzU29BZIQnTJ75paSfi7ZNWYm7ko+ZuNAYd0rLy/v4+lYn4Z6nedf8nB0jCCWbCC
	 RDhFntcCv2FH0rIE2sqA8ha1ffHVycfEHbnIcGi0w3qbfQzYJaCIwgUSBNmLHkDnAQ
	 pqtM7wEAuPeAF8854R3bEajXAPgUH8/hjXOPolhGDohjfwDzypDwxHV9mH+p1UKPZS
	 MIi17PmHEaaagAeLJK3Z+O5TioGqXUH+ebUSyc5DQ2ENnnhI224pEb3IA4vQIvXOAE
	 d7Bej+wHCAAs8Q50JTnXFLwrCXAP89BPVm4hrGmn0McXPGd8jXyevbC6owOcsNYEGD
	 fbOtU8G/ZBl8Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 15/15] irqchip/renesas-rzg2l: Add shared interrupt
 support
In-Reply-To: <20260311192459.609064-16-biju.das.jz@bp.renesas.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
 <20260311192459.609064-16-biju.das.jz@bp.renesas.com>
Date: Fri, 20 Mar 2026 10:00:30 +0100
Message-ID: <87fr5ulvtd.ffs@tglx>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29989-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.787];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 45E032D7C45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11 2026 at 19:24, Biju wrote:
> +static int rzg2l_irqc_irq_request_resources(struct irq_data *d)
> +{
> +	unsigned int hw_irq = irqd_to_hwirq(d);
> +	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> +	u32 offset, tssr_offset;
> +	u8 tssr_index, tssel_shift;
> +	u32 reg, inttsel_reg;
> +	u8 value;

Once again: Proper variable declaration ordering please. Do I have to
repeat that every other week?

Again the same type salad.

> +	if (!priv->info.shared_irq_cnt)
> +		return 0;
> +
> +	if (rzg2l_irqc_is_shared_irqc(priv->info, hw_irq)) {
> +		offset = hw_irq + IRQC_TINT_COUNT - priv->info.tint_start;
> +		tssr_offset = TSSR_OFFSET(offset);
> +		tssr_index = TSSR_INDEX(offset);
> +		tssel_shift = TSSEL_SHIFT(tssr_offset);
> +
> +		reg = readl_relaxed(priv->base + TSSR(tssr_index));
> +		value = (reg & (TIEN << tssel_shift)) >> tssel_shift;
> +		if (value)
> +			goto err_conflict;
> +
> +		raw_spin_lock(&priv->lock);

scoped_guard()

> +		inttsel_reg = readl_relaxed(priv->base + INTTSEL);
> +		inttsel_reg |= TINTSEL(offset);
> +		writel_relaxed(inttsel_reg, priv->base + INTTSEL);
> +		raw_spin_unlock(&priv->lock);
> +	} else if (rzg2l_irqc_is_shared_tint(priv->info, hw_irq)) {
> +		offset = hw_irq - priv->info.tint_start;
> +		tssr_offset = TSSR_OFFSET(offset);
> +		tssr_index = TSSR_INDEX(offset);
> +
> +		inttsel_reg = readl_relaxed(priv->base + INTTSEL);
> +		value = (inttsel_reg & TINTSEL(offset)) >> offset;
> +		if (value)
> +			goto err_conflict;
> +	}
> +
> +	return 0;
> +
> +err_conflict:
> +	pr_err("%s: Shared SPI conflict!\n", __func__);
> +	return -EBUSY;
> +}
> +
> +static void rzg2l_irqc_irq_release_resources(struct irq_data *d)
> +{
> +	unsigned int hw_irq = irqd_to_hwirq(d);
> +	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> +	u32 offset;
> +	u8 inttsel_reg;

Your type choices are really interresting and both variables are not
used in the outer scope. Declare them in the scope where they are used.

> +	if (!priv->info.shared_irq_cnt)
> +		return;
> +
> +	if (rzg2l_irqc_is_shared_irqc(priv->info, hw_irq)) {
> +		offset = hw_irq + IRQC_TINT_COUNT - priv->info.tint_start;
> +
> +		raw_spin_lock(&priv->lock);
> +		inttsel_reg = readl_relaxed(priv->base + INTTSEL);
                ^^^^          ^^^
                u8            u32

Seriously?

> +		inttsel_reg &= ~TINTSEL(offset);
> +		writel_relaxed(inttsel_reg, priv->base + INTTSEL);
> +		raw_spin_unlock(&priv->lock);

Thanks,

        tglx

