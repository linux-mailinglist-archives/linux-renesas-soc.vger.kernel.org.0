Return-Path: <linux-renesas-soc+bounces-28026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGT0IwcVh2nBTQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Feb 2026 11:33:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AACAF10586F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 07 Feb 2026 11:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B5503004063
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Feb 2026 10:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A677311599;
	Sat,  7 Feb 2026 10:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="om4VhiIo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CEB29992A;
	Sat,  7 Feb 2026 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460419; cv=none; b=ayMRCOq69CTAudonJL/dEn3B+8O/M1JKT1qPsSrEe9l1qQqIewq6OXtZcJ88K2QAEMAmUby5CzBtVSrZkBgQ24Z98/vlmX3i7zHndBuPJ8BqGTqnaagG3xjOdqUbOOlPVa4FHPB6mBNS1EAAFOrpPZG5cVslyug2zVk1VX/Moog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460419; c=relaxed/simple;
	bh=Yf+tjw6UvsfUIHxrpQP1d/4M57nt1iv7AXVufu+6nro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMAcKzJfKjtXWzMU/JBUVYbLjBl94FzrM0h5gsc3Q29YS/J/EUs79sKIwZGsBz/uEPM9eHQAFxF0Lup26Rlum67t0zl0BS65pOdPs14Eqj8y43gKtpJpKw2nON2K8Mn459hKC+Ygy9PY7UeHq3VXMG9LwDroXO19aFtFHPzcDhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=om4VhiIo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A14C116D0;
	Sat,  7 Feb 2026 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770460418;
	bh=Yf+tjw6UvsfUIHxrpQP1d/4M57nt1iv7AXVufu+6nro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=om4VhiIoyD62gBUs9G4jfADQIBj+I6Xt/+WfnV3N+CEW76n/V7/1M17dBe2OLaDlX
	 YNSUFk6mJ7cRV4eyB4DLjogsVsLDJQ8++vdiDhpEzB2rpzQbwH0qAyOpL0y+3aoOAo
	 bOL3K09fDHlroYIjlOtobDdW+XaHUjD8OnE3F0yzrQodv+I/4EkyFy9xFjzhCKfhOC
	 fz+EOXHqsTXnD87jE32Plintpg/jF/4kU6CaqtP95WwnTsAYWOPzbiz97L64GawTjn
	 hp9oUPzBGhliACjNxUicshDZ+wEDF8LNHD8QhGMe3LtUXxfJGcvqWuqL1sngyELn9V
	 pkFezC9iBxddA==
Date: Sat, 7 Feb 2026 11:33:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/9] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Use pattern for interrupt-names
Message-ID: <20260207-spiritual-victorious-wren-519a0f@quoll>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
 <20260206111658.231934-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206111658.231934-2-biju.das.jz@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28026-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AACAF10586F
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 11:16:44AM +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Simplify the bindings by using pattern property for interrupt-names.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change
> v1->v2:
>  * New patch.
> ---
>  .../renesas,rzg2l-irqc.yaml                   | 120 ++++--------------
>  1 file changed, 23 insertions(+), 97 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
> index 44b6ae5fc802..a0b57d808639 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
> @@ -48,107 +48,33 @@ properties:
>  
>    interrupts:
>      minItems: 45
> -    items:
> -      - description: NMI interrupt
> -      - description: IRQ0 interrupt

I do not understand how this is related to simplifying interrupt-names.

> -      - description: IRQ1 interrupt
> -      - description: IRQ2 interrupt
> -      - description: IRQ3 interrupt
> -      - description: IRQ4 interrupt
> -      - description: IRQ5 interrupt
> -      - description: IRQ6 interrupt
> -      - description: IRQ7 interrupt
> -      - description: GPIO interrupt, TINT0
> -      - description: GPIO interrupt, TINT1
> -      - description: GPIO interrupt, TINT2
> -      - description: GPIO interrupt, TINT3
> -      - description: GPIO interrupt, TINT4
> -      - description: GPIO interrupt, TINT5
> -      - description: GPIO interrupt, TINT6
> -      - description: GPIO interrupt, TINT7
> -      - description: GPIO interrupt, TINT8
> -      - description: GPIO interrupt, TINT9
> -      - description: GPIO interrupt, TINT10
> -      - description: GPIO interrupt, TINT11
> -      - description: GPIO interrupt, TINT12
> -      - description: GPIO interrupt, TINT13
> -      - description: GPIO interrupt, TINT14
> -      - description: GPIO interrupt, TINT15
> -      - description: GPIO interrupt, TINT16
> -      - description: GPIO interrupt, TINT17
> -      - description: GPIO interrupt, TINT18
> -      - description: GPIO interrupt, TINT19
> -      - description: GPIO interrupt, TINT20
> -      - description: GPIO interrupt, TINT21
> -      - description: GPIO interrupt, TINT22
> -      - description: GPIO interrupt, TINT23
> -      - description: GPIO interrupt, TINT24
> -      - description: GPIO interrupt, TINT25
> -      - description: GPIO interrupt, TINT26
> -      - description: GPIO interrupt, TINT27
> -      - description: GPIO interrupt, TINT28
> -      - description: GPIO interrupt, TINT29
> -      - description: GPIO interrupt, TINT30
> -      - description: GPIO interrupt, TINT31
> -      - description: Bus error interrupt
> -      - description: ECCRAM0 or combined ECCRAM0/1 1bit error interrupt
> -      - description: ECCRAM0 or combined ECCRAM0/1 2bit error interrupt
> -      - description: ECCRAM0 or combined ECCRAM0/1 error overflow interrupt
> -      - description: ECCRAM1 1bit error interrupt
> -      - description: ECCRAM1 2bit error interrupt
> -      - description: ECCRAM1 error overflow interrupt
> +    maxItems: 48
>  
>    interrupt-names:
>      minItems: 45
> +    maxItems: 48
>      items:
> -      - const: nmi
> -      - const: irq0
> -      - const: irq1
> -      - const: irq2
> -      - const: irq3
> -      - const: irq4
> -      - const: irq5
> -      - const: irq6
> -      - const: irq7
> -      - const: tint0
> -      - const: tint1
> -      - const: tint2
> -      - const: tint3
> -      - const: tint4
> -      - const: tint5
> -      - const: tint6
> -      - const: tint7
> -      - const: tint8
> -      - const: tint9
> -      - const: tint10
> -      - const: tint11
> -      - const: tint12
> -      - const: tint13
> -      - const: tint14
> -      - const: tint15
> -      - const: tint16
> -      - const: tint17
> -      - const: tint18
> -      - const: tint19
> -      - const: tint20
> -      - const: tint21
> -      - const: tint22
> -      - const: tint23
> -      - const: tint24
> -      - const: tint25
> -      - const: tint26
> -      - const: tint27
> -      - const: tint28
> -      - const: tint29
> -      - const: tint30
> -      - const: tint31
> -      - const: bus-err
> -      - const: ec7tie1-0
> -      - const: ec7tie2-0
> -      - const: ec7tiovf-0
> -      - const: ec7tie1-1
> -      - const: ec7tie2-1
> -      - const: ec7tiovf-1
> +      oneOf:
> +        - description: NMI interrupt
> +          const: nmi

Your commit msg is completely inaccurate. You are not simplifying, you
are CHANGING by allowing any order.


Best regards,
Krzysztof


