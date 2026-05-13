Return-Path: <linux-renesas-soc+bounces-32583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMUlKK+6BGrHNQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 19:53:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C93538625
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 19:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7813F3111041
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 17:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF024DC52D;
	Wed, 13 May 2026 17:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4HDV0M+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D01E4DBD9E;
	Wed, 13 May 2026 17:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778694135; cv=none; b=Itd+6+/duvfcchHSiU+VsJ3JehtGSJVghC0X9YmJJ7H/hRurrhQqL1/t75pA6BNWIA1fz+hIHkTpv6jU3DDRaN3eWtF8C3x1iK9T8t69crsFQkfAe9XbWz8RNVEJd/9GM3DggV0q4XWmPw/FMu42ZOFowPxLIWxNP7mbvTuo63U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778694135; c=relaxed/simple;
	bh=E0zLoEe4OxlTHMdVyWH+4DIkQ+K+q84NfZfyUfKVC1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hop3ZjVJsRV8NzPvpu5xZ1Qbui6I+Cq1oee9Kf+AgK4HLjGwrUX0eOa++QAEsH8Cb6g8S8T/c/dU8xjKeOXQmthuum2BBoeAKrim+m1/d09Svm/0odT0mQ8GJhTaPoS4FH23wueHKEBAMoDejq2w1n4YwX/Hp6yg4P12zmg8n+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4HDV0M+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614DCC19425;
	Wed, 13 May 2026 17:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778694134;
	bh=E0zLoEe4OxlTHMdVyWH+4DIkQ+K+q84NfZfyUfKVC1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4HDV0M+tjdN4VylC22tgK8Fk9XF/JgKbvf/9bfOX4qpMwvbSAGpwRxqB1Bue7LYd
	 6goY9x7H8ocOyeQkHlLqtlMRqLwbi3gHeQcTmYQ/conA109JVX6sYLF3IkieCdLEVV
	 O1zKdUiwKFiKqCVr/gxknO/ipWHNPPxs4aOb2QQ6tEtu66wpuYtdq1XytMGEyOqHC/
	 7zzaMNjBglrJ4/W6hiT8HvO8ufmNfRDDAhlDIeygaEsNsWYtTSrecDHS0oBfTN6eSv
	 RgSkBu+6RFopybS4JRnYZiqUCMQkJB14JzBp3prxn6EiFzsyl4iWk5fXznYjJHNjZz
	 z80JtIhLARulg==
Date: Wed, 13 May 2026 12:42:11 -0500
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: memory: renesas,rzg3e-xspi: Add
 RZ/T2H and RZ/N2H support
Message-ID: <20260513174211.GA1400932-robh@kernel.org>
References: <20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260505112405.667796-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505112405.667796-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Rspamd-Queue-Id: 04C93538625
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,sang-engineering.com,bp.renesas.com,vger.kernel.org,renesas.com];
	TAGGED_FROM(0.00)[bounces-32583-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 12:24:04PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document xSPI controller found on the Renesas RZ/T2H and RZ/N2H SoCs.
> The xSPI IP on these SoCs is identical to that found on the RZ/G3E SoC.
> 
> The RZ/G3E HW manual (Rev.1.15) references bridge channel 1 and its
> bits, however the hardware actually supports only a single bridge
> channel (channel 0), matching the RZ/T2H design. The references to
> channel 1 and its configuration bits will be corrected in a future
> revision of the HW manual.
> 
> Update clock/reset constraints to handle the SoC differences.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Used RZ/G3E comptiable as a fallback compatible for
>   RZ/T2H and RZ/N2H SoCs since the xSPI IP is identical.
> - Updated commit message to reflect that the xSPI IP is
>  identical between RZ/G3E, RZ/T2H, and RZ/N2H SoCs.
> - Dropped RB tag from Rob due to above changes.
> 
> v1->v2:
> - Add RB tag from Rob for the dt-bindings patch.
> ---
>  .../renesas,rzg3e-xspi.yaml                   | 56 +++++++++++++++----
>  1 file changed, 46 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
> index 7a84f5bb7284..e2633476bd54 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
> @@ -30,6 +30,8 @@ properties:
>            - enum:
>                - renesas,r9a09g056-xspi  # RZ/V2N
>                - renesas,r9a09g057-xspi  # RZ/V2H(P)
> +              - renesas,r9a09g077-xspi  # RZ/T2H
> +              - renesas,r9a09g087-xspi  # RZ/N2H
>            - const: renesas,r9a09g047-xspi
>  
>    reg:
> @@ -53,28 +55,38 @@ properties:
>        - const: err_pulse
>  
>    clocks:
> -    items:
> -      - description: AHB clock
> -      - description: AXI clock
> -      - description: SPI clock
> -      - description: Double speed SPI clock
> +    oneOf:
> +      - items:
> +          - description: AHB clock
> +          - description: AXI clock
> +          - description: SPI clock
> +          - description: Double speed SPI clock
> +      - items:
> +          - description: AHB clock
> +          - description: SPI clock
>  
>    clock-names:
> -    items:
> -      - const: ahb
> -      - const: axi
> -      - const: spi
> -      - const: spix2
> +    oneOf:
> +      - items:
> +          - const: ahb
> +          - const: axi
> +          - const: spi
> +          - const: spix2
> +      - items:
> +          - const: ahb
> +          - const: spi
>  
>    power-domains:
>      maxItems: 1
>  
>    resets:
> +    minItems: 1
>      items:
>        - description: Hardware reset
>        - description: AXI reset
>  
>    reset-names:
> +    minItems: 1
>      items:
>        - const: hresetn
>        - const: aresetn
> @@ -109,6 +121,30 @@ required:
>    - '#address-cells'
>    - '#size-cells'
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - renesas,r9a09g077-xspi
> +          - renesas,r9a09g087-xspi
> +then:
> +  properties:
> +    clocks:
> +      maxItems: 2
> +    clock-names:
> +      maxItems: 2

What about resets?:

resets:
  maxItems: 1


> +else:
> +  properties:
> +    clocks:
> +      minItems: 4
> +    clock-names:
> +      minItems: 4
> +    resets:
> +      minItems: 2
> +    reset-names:
> +      minItems: 2
> +
>  unevaluatedProperties: false
>  
>  examples:
> -- 
> 2.54.0
> 
> 

