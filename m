Return-Path: <linux-renesas-soc+bounces-27947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFGcKIOdhGmI3wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 14:39:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF57F3626
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 14:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 190FB301A501
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 13:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA47D238C0D;
	Thu,  5 Feb 2026 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Itbsta7c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E1922FE11;
	Thu,  5 Feb 2026 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298751; cv=none; b=R4/trLZl0oWqbZcZRQ+GHeKu3bgxn/iVcWBgCwsbwjujKuL9ryOAjmjv/ByMc44reIgidmiUn/TorddODe5dg5OBnDbeggGfpJAiVS9myWTPRywh6rubgbQnwa4OpF1EEwyTteL05QgkjXryXnA4fEl8qQQMuBUq76PNi7yUnDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298751; c=relaxed/simple;
	bh=wN0q/0KPZHRLq6xmnBKir/PT2rWwEvSZPoOZn/Yc3JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHAfjNsJcG0sFCV0CFqRLdtMC1DTSUU+8d09bDipy30PwjObZzZIVZldViKEBS1/V3jw1ebyVWL3+Jnedq6/LSPHvaA5dyKrANxASJWUuZquBUtfBoFidSCFfcVEIIzgWyfC2AVAMiv4yhEgWrb1/r9A4CBdBVyvQt3xjKsrsMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Itbsta7c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2A7C4CEF7;
	Thu,  5 Feb 2026 13:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770298751;
	bh=wN0q/0KPZHRLq6xmnBKir/PT2rWwEvSZPoOZn/Yc3JY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Itbsta7c4LVDCkw8q4sdyBfuc9CWpzGL8pDHY3+8ngZ6E9HtvZPgHZvoy/oeO8oLY
	 Mzju2TuVb9HWvRTO4sF/tk2gwDWwhZxgcvpRDvsJXzSu/bYBb/Z7sbNzxVHWeC0EoW
	 ptvajtV+u1sUrx2wdn3xtti2r04+0V8xylRJ1BAoW8FCFOauM4VmgwD4EHe2JCz7HE
	 4zcnAyAIhOrAdubW4GnWT5VRW+/LHmhcFl3y5uyct4CevpT1sVXaD3zCS2ciMRb2lU
	 /y+5Y4LRKkNYruJM6vA/Tot8r5puBHDdXVNLxmC/lU0Leq64ZO48lVsad9ApgQ3mkO
	 hbTs8f4wVsknQ==
Date: Thu, 5 Feb 2026 14:39:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/9] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/G3L SoC
Message-ID: <20260205-polar-gifted-lionfish-ef8a8d@quoll>
References: <20260204180632.249139-1-biju.das.jz@bp.renesas.com>
 <20260204180632.249139-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204180632.249139-3-biju.das.jz@bp.renesas.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27947-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 3AF57F3626
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 06:06:18PM +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Document RZ/G3L (R9A08G046) IRQC bindings. The IRQC block on RZ/G3L SoC
> is almost identical to one found on the RZ/G3S SoC with the difference
> like it support more External IRQs, GPT Error Interrupts and also has
> additional registers for GPT/MTU IRQ selection, shared IRQ selection
> between external IRQ and TINT. Hence new generic compatible string
> "renesas,r9a08g046-irqc" is added for RZ/G3L SoC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Simplified the binding using pattern
> ---
>  .../renesas,rzg2l-irqc.yaml                   | 42 +++++++++++++++----
>  1 file changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
> index a0b57d808639..311741122b05 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
> @@ -30,7 +30,10 @@ properties:
>                - renesas,r9a08g045-irqc     # RZ/G3S
>            - const: renesas,rzg2l-irqc
>  
> -      - const: renesas,r9a07g043f-irqc     # RZ/Five
> +      - items:

Drop items. The point was to simplify, so just enum.

> +          - enum:
> +              - renesas,r9a07g043f-irqc    # RZ/Five
> +              - renesas,r9a08g046-irqc     # RZ/G3L
>  
>    '#interrupt-cells':
>      description: The first cell should contain a macro RZG2L_{NMI,IRQX} included in the
> @@ -48,17 +51,17 @@ properties:
>  
>    interrupts:
>      minItems: 45
> -    maxItems: 48
> +    maxItems: 61
>  
>    interrupt-names:
>      minItems: 45
> -    maxItems: 48
> +    maxItems: 61
>      items:
>        oneOf:
>          - description: NMI interrupt
>            const: nmi
>          - description: External IRQ interrupt
> -          pattern: '^irq([0-7])$'
> +          pattern: '^irq([0-9]|1[0-5])$'
>          - description: GPIO interrupt
>            pattern: '^tint([0-9]|1[0-9]|2[0-9]|3[0-1])$'
>          - description: Bus error interrupt
> @@ -75,6 +78,8 @@ properties:
>            const: ec7tie2-1
>          - description: ECCRAM1 error overflow interrupt
>            const: ec7tiovf-1
> +        - description: Integrated GPT Error interrupt
> +          pattern: '^ovfunf([0-7])$'
>  
>    clocks:
>      maxItems: 2
> @@ -106,6 +111,22 @@ required:
>  allOf:
>    - $ref: /schemas/interrupt-controller.yaml#
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a07g043f-irqc
> +              - renesas,r9a07g043u-irqc
> +              - renesas,r9a07g044-irqc
> +              - renesas,r9a07g054-irqc
> +    then:
> +      properties:
> +        interrupts:

Missing minitems. Previously it was not 45, was it?

> +          maxItems: 48
> +        interrupt-names:
> +          maxItems: 48
> +
>    - if:
>        properties:
>          compatible:
> @@ -118,12 +139,19 @@ allOf:
>            maxItems: 45
>          interrupt-names:
>            maxItems: 45
> -    else:
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a08g046-irqc
> +    then:
>        properties:
>          interrupts:
> -          minItems: 48
> +          maxItems: 61

minItems instead. Just like it was in the old code.

Best regards,
Krzysztof


