Return-Path: <linux-renesas-soc+bounces-28419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wN51Hd5XnWk2OgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 08:48:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C745A1833A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 08:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 302F4300F5E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 07:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDBB33A9DC;
	Tue, 24 Feb 2026 07:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BhroWoCI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892BA3346A0;
	Tue, 24 Feb 2026 07:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771918461; cv=none; b=TriCSKrVM7m5KqRumsM7EgZpi7mBDIqDwsLo6BF1Gp4f6if4WtEtokf0vmxGKga9pgoczMJAc1qnYj7T6w4O215sbPho98ApW7LQsS0Xm+BjtN2deRGNSZJzKug7V4NHERnC/PzwB1yKBpyVy71Jl9zWV8tojA44y1eWDZv6i4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771918461; c=relaxed/simple;
	bh=Lgap8cW+sFentYJ/pHf+roupBaHMsrAyE92Bhg64Txg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HNR1O10dF6q0R6QrvBkC6bBUWP729uCvQsFg9bHWbmnUFN2IoEuwwsnQZNPp5lzfB2do16KHMEStB+qIpouJmS9fzqrG0ZuB6If2DMscRt2W61cTWBzdoirzHA3AZna8r0snKfPxivmna+4+4ZHwg21zML2MWyafHYK9D3lccII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BhroWoCI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 795BDC116D0;
	Tue, 24 Feb 2026 07:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771918461;
	bh=Lgap8cW+sFentYJ/pHf+roupBaHMsrAyE92Bhg64Txg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BhroWoCIHv3k2E4zefp8N1PJPt4HxZDcA8HOlEGpWBivRx3xZLCwQ5rsb8y6jmRhZ
	 3U9bImkplM/zMUNRkAB9Ihz4sCaatjUM1fTsUud7GfZkvrF1pMa1J6rOimQVmDAboy
	 8oShvjB50wWnYcfUZ4yFtlIxVzIpKIrqROSr0RB1MdWexf6zgcO+h9tsxoiDiiRFrR
	 HBOMgWxARoO7IVDy9gT60HAP4lwBOiTiOt9shLMvnkMiGgdOGWM8gRZWv7wYUnC0Iz
	 BoQCCl+DSYOXDz4hlFqjcsTN8J6Eh1iHzKMFKLKMxjEmX3BUtMUfDIxDN4izmwfJjH
	 mb2Q/bfFs/NXg==
From: Thomas Gleixner <tglx@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 5/6] irqchip/renesas-rzv2h: Add CA55 software
 interrupt support
In-Reply-To: <20260209104121.26172-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260209104121.26172-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260209104121.26172-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Tue, 24 Feb 2026 08:34:17 +0100
Message-ID: <87bjhevbly.ffs@tglx>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28419-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de,glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C745A1833A0
X-Rspamd-Action: no action

On Mon, Feb 09 2026 at 10:41, Prabhakar wrote:
>  static int rzv2h_icu_set_type(struct irq_data *d, unsigned int type)
>  {
> +	unsigned int gic_type = IRQ_TYPE_LEVEL_HIGH;
>  	unsigned int hw_irq = irqd_to_hwirq(d);
>  	int ret;
>  
> @@ -445,6 +475,11 @@ static int rzv2h_icu_set_type(struct irq_data *d, unsigned int type)
>  		/* TINT */
>  		ret = rzv2h_tint_set_type(d, type);
>  		break;
> +	case ICU_CA55_INT_START ... ICU_CA55_INT_LAST:
> +		/* CA55 Software Interrupts have EDGE_RISING type */
> +		gic_type = IRQ_TYPE_EDGE_RISING;

So this unconditionally selects EDGE_RISING independent of the type
provided by the caller. Interesting choice and compatible with the rest
of the code - _not_.

> +
> +static int rzv2h_icu_setup_irqs(struct platform_device *pdev,
> +				struct irq_domain *irq_domain)

I told you before that you have 100 characters. Get rid of these line breaks.

> +{
> +	bool irq_inject = IS_ENABLED(CONFIG_GENERIC_IRQ_INJECTION);
> +	static const char * const rzv2h_swint_names[] = {
> +		"int-ca55-0", "int-ca55-1",
> +		"int-ca55-2", "int-ca55-3",
> +	};
> +	static const u8 swint_idx[] = { 0, 1, 2, 3 };
> +	struct device *dev = &pdev->dev;
> +	struct irq_fwspec fwspec;
> +	unsigned int virq;
> +	unsigned int i;

Coalesce same types into a single line. See Documentation/....

> +	int ret;
> +
> +	for (i = 0; i < ICU_CA55_INT_COUNT && irq_inject; i++) {
> +		fwspec.fwnode = irq_domain->fwnode;
> +		fwspec.param_count = 2;
> +		fwspec.param[0] = ICU_CA55_INT_START + i;
> +		fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
> +
> +		virq = irq_create_fwspec_mapping(&fwspec);
> +		if (!virq)
> +			return dev_err_probe(dev, -EINVAL, "failed to create IRQ mapping for %s\n",
> +					     rzv2h_swint_names[i]);

This lacks curly brackets on the if(). See Documentation/.....


> +		ret = devm_request_irq(dev, virq, rzv2h_icu_swint_irq, 0, dev_name(dev),
> +				       (void *)&swint_idx[i]);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to request %s IRQ\n",
> +					     rzv2h_swint_names[i]);

Ditto.

> +	}

Thanks,

        tglx

