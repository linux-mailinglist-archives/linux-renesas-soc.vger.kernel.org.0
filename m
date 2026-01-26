Return-Path: <linux-renesas-soc+bounces-27434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCLkAEJ8d2n7ggEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 15:37:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B8E8998F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 15:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DADCD300D316
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 14:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873C52367D5;
	Mon, 26 Jan 2026 14:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSlvoZ/l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E64222585;
	Mon, 26 Jan 2026 14:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437875; cv=none; b=FseYi+3KlvmkcNkCHZKkzgUp+9ZhuQC9Uf5rQ5/6LKp9LDjBfjjahFoYKDoPyI8qQSgx1cE3sIW8YL1225S78rpVkiiI588tNeAmFFvbpzSdPqWXgLKxWryr52adWGqpVr/Q5haijdA4OTgCk/jFaK9XNNFNASX9i3zSCMFvy7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437875; c=relaxed/simple;
	bh=k8GpdZLn3iqsr7cV1SQIxX+UbLolCJyfkA/4vksjt5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTeng39ENMS3SDxvPg2KFtN5KSMlJbia1217WS7bOCdMNVspKBeaaneX2Xct4p7NlzrSlivt4iPTsR75pZ3u33QRsrx9fLFEK6LEXmAnNfXMDb2N3/3UqCN2PcqOBUtDoc+o0bG8GSwXKDBRtY8HdewmotBnOU8QhZ1bYXYoab8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSlvoZ/l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72ABC116C6;
	Mon, 26 Jan 2026 14:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769437875;
	bh=k8GpdZLn3iqsr7cV1SQIxX+UbLolCJyfkA/4vksjt5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sSlvoZ/lI2lkZ9pflLVWaCRle2CG07MiLPusm2yVEJCLQH5YykZ2k/Z3TtBw54goI
	 TjkuELZAG1XexFvxig81g2nc8K0IXA/xk+TZ7B74MlUJENuqLqbFCH+7zLkfOWfcxf
	 gRTWpibbYxzNGxXJaoPd+Qxgk+X361gsvAslsI2BuKpFcHknGoFweBPi3mpzGHlb9+
	 2JsfEYdC5RR1XF2g5EnO8brHkbA9Kl4myimlIaKTXNQJaGqpaJrONt989PHD+HWoCB
	 D2V6EbkL0Dxs0lDunowPQcC1cWu3SxR2doioU6NFcuAqB8r2yOsjKMDgbY4XOTu0f3
	 T4J/rPEnFfbbA==
Date: Mon, 26 Jan 2026 08:31:14 -0600
From: Rob Herring <robh@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
	krzk+dt@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
	magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	john.madieu@gmail.com
Subject: Re: [PATCH v2 06/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Document RZ/G3E SoC
Message-ID: <20260126143114.GA2223879-robh@kernel.org>
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com>
 <20260123140031.94752-7-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123140031.94752-7-john.madieu.xa@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,google.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27434-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 55B8E8998F
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 03:00:22PM +0100, John Madieu wrote:
> Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> controller to include support for the RZ/G3E (renesas,r9a09g047e57-pcie) PCIe
> controller. The RZ/G3E PCIe controller is similar to RZ/G3S but has some key
> differences:
> 
>  - Uses a different device ID
>  - Supports PCIe Gen3 (8.0 GT/s) link speeds
>  - Uses a different clock naming (clkpmu vs clkl1pm)
>  - Has a different set of interrupts, interrupt ordering, and reset signals
> 
> Add device tree bindings for renesas,r9a09g047e57-pcie compatible IPs.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
> 
> v2: Reuse G3S names
> 
>  .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 127 +++++++++++++-----
>  1 file changed, 96 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> index df30f729d4b3..9565f1774720 100644
> --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> @@ -10,17 +10,21 @@ maintainers:
>    - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>  
>  description:
> -  Renesas RZ/G3S PCIe host controller complies with PCIe Base Specification
> -  4.0 and supports up to 5 GT/s (Gen2).
> +  Renesas RZ/G3{E,S} PCIe host controllers comply with PCIe
> +  Base Specification 4.0 and support up to 5 GT/s (Gen2) for RZ/G3S and
> +  up to 8 GT/s (Gen3) for RZ/G3E.
>  
>  properties:
>    compatible:
> -    const: renesas,r9a08g045-pcie # RZ/G3S
> +    enum:
> +      - renesas,r9a08g045-pcie # RZ/G3S
> +      - renesas,r9a09g047-pcie # RZ/G3E
>  
>    reg:
>      maxItems: 1
>  
>    interrupts:
> +    minItems: 16
>      items:
>        - description: System error interrupt
>        - description: System error on correctable error interrupt
> @@ -38,39 +42,54 @@ properties:
>        - description: PCIe event interrupt
>        - description: Message interrupt
>        - description: All interrupts
> +      - description: Link equalization request interrupt
> +      - description: Turn off event interrupt
> +      - description: PMU power off interrupt
> +      - description: D3 event function 0 interrupt
> +      - description: D3 event function 1 interrupt
> +      - description: Configuration PMCSR write clear function 0 interrupt
> +      - description: Configuration PMCSR write clear function 1 interrupt
>  
>    interrupt-names:
> +    minItems: 16
>      items:
> -      - description: serr
> -      - description: serr_cor
> -      - description: serr_nonfatal
> -      - description: serr_fatal
> -      - description: axi_err
> -      - description: inta
> -      - description: intb
> -      - description: intc
> -      - description: intd
> -      - description: msi
> -      - description: link_bandwidth
> -      - description: pm_pme
> -      - description: dma
> -      - description: pcie_evt
> -      - description: msg
> -      - description: all

Well, that was really wrong... Fixing it should be a separate patch 
before adding the new chip.

> +      - const: serr
> +      - const: serr_cor
> +      - const: serr_nonfatal
> +      - const: serr_fatal
> +      - const: axi_err
> +      - const: inta
> +      - const: intb
> +      - const: intc
> +      - const: intd
> +      - const: msi
> +      - const: link_bandwidth
> +      - const: pm_pme
> +      - const: dma
> +      - const: pcie_evt
> +      - const: msg
> +      - const: all
> +      - const: link_equalization_request
> +      - const: turn_off_event
> +      - const: pmu_poweroff
> +      - const: d3_event_f0
> +      - const: d3_event_f1
> +      - const: cfg_pmcsr_writeclear_f0
> +      - const: cfg_pmcsr_writeclear_f1
>  
>    interrupt-controller: true
>  
>    clocks:
> +    minItems: 2
>      items:
>        - description: System clock
>        - description: PM control clock
> +      - description: PMU clock

I don't see 3 clocks being valid.

>  
> -  clock-names:
> -    items:
> -      - description: aclk
> -      - description: pm
> +  clock-names: true

This should keep at least minItems/maxItems constraints.


> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: pm

> +        clock-names:
> +          items:
> +            - const: aclk
> +            - const: pmu


pm vs. pmu? Are these really different? The "P" here is never defined. 
If it is always "power", then use the same name.

Rob

