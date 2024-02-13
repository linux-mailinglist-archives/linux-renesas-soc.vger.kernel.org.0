Return-Path: <linux-renesas-soc+bounces-2733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9113F853ED9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 23:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49AE2284948
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 22:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F676215D;
	Tue, 13 Feb 2024 22:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oD1E3yuL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B600E12E59;
	Tue, 13 Feb 2024 22:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707863861; cv=none; b=Ndj+mjLmeELMy5iQtNm7JyMndDr7aRH/ukBVzz+ZasXY5PiL1mWg6WyUQX3lXnVJYguKfGtSVA76kv76MFmpJDXmH9/7LfJ36X0oQqZrbli7aC/fu9IHWAM3Qk2Jz3mwzPhGewdiwNfKGraELqJdtKP2wARoGBORaEXe/POMMmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707863861; c=relaxed/simple;
	bh=yNrPFrOQuZ++lycKgUdj2Y51wk4eR9u/KT8Qrxg7YqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyynKuP/N5KZe8YVnDIYfIscIU8mmuceR3N4lqs7//mQu9fXl5aG77abY5gubuhQmI0oAXc8SDr5mKmhcRXnP4TJ+jb0O+p8estmFbZjUDv7e5C6NRs9MvXzkQumtPJwL+dJr6UuuZe+FsBHNIHAJmX6pkw6cGgZsIYYMACQ1wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oD1E3yuL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B37C433C7;
	Tue, 13 Feb 2024 22:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707863861;
	bh=yNrPFrOQuZ++lycKgUdj2Y51wk4eR9u/KT8Qrxg7YqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oD1E3yuLtKTkeF6IeP6efNrRzU0H2Nm4tscRy3huHE2RDEBD2xVhYD8wAgZVSabx4
	 4mE22l8RCRMUyK8nnYaRR3NfnphIDNexSvgNJIXz8QgvvhQb6VZeQSwaMjFelGBQ4t
	 VXXT9TcXKNbPGCz137HN0I+qLUjffa/9N9rqqU5CxgeMBlpveXl6Ev+GNzKTQ8Lf8X
	 I4mgfQLcw6mtIlk4sx0yVJzDCnVbB7kxobyWI5Dv2xNCd34S27Qzga9deZW1WYeakR
	 8cJguZwBbtpJe6yyZsNYuxPnqmFxodbvHfJ66nIwqFUvYbwJ+cuvUCttkO7qFxFWSo
	 kTZN5p5DynPhQ==
Date: Tue, 13 Feb 2024 16:37:38 -0600
From: Rob Herring <robh@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: renesas: Document preferred compatible
 naming
Message-ID: <20240213223738.GA2506718-robh@kernel.org>
References: <20240213192340.2786430-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213192340.2786430-1-niklas.soderlund+renesas@ragnatech.se>

On Tue, Feb 13, 2024 at 08:23:40PM +0100, Niklas Söderlund wrote:
> Compatibles can come in two formats. Either "vendor,ip-soc" or
> "vendor,soc-ip". Add a DT schema file documenting Renesas preferred
> policy and enforcing it for all new compatibles, except few existing
> patterns.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v2
> - Improve the select so it matches on any compatible containing a
>   component specific Renesas value.
> - Make the regexps more compact.
> - Define MaxItems to allow the increased selection to work.
> - Add rmobile and shmobile prefixes.
> - I did not take Rob's ack from v2 as the schema changed a lot after
>   Geerts review.
> 
> * Changes since v1
> - Split the "SoC agnostic compatibles" section into two to make it's
>   intent clearer.
> - Improved the documentation for each group of compatibles.
> - Reduced the number of regexp to create a larger target area. As
>   suggested by Krzysztof the goal is not to validate each SoC name but
>   check for the correct order of SoC-IP.
> 
> * Changes since RFC
> - Moved to Documentation/devicetree/bindings/soc/renesas.
> - Changed the pattern in the initial select to match on .*-.*.
> - Added a lot of missing compatible values.
> ---
>  .../bindings/soc/renesas/renesas-soc.yaml     | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> new file mode 100644
> index 000000000000..57c11022d793
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SoC compatibles naming convention
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +
> +description: |
> +  Guidelines for new compatibles for SoC blocks/components.
> +  When adding new compatibles in new bindings, use the format::
> +    renesas,SoC-IP
> +
> +  For example::
> +   renesas,r8a77965-csi2
> +
> +  When adding new compatibles to existing bindings, use the format in the
> +  existing binding, even if it contradicts the above.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        pattern: "^renesas,.+-.+$"
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    maxItems: 4

'minItems: 1' should fix the error reported.


> +    items:
> +      anyOf:
> +        # Preferred naming style for compatibles of SoC components
> +        - pattern: "^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$"
> +        - pattern: "^renesas,(condor|falcon|gr-peach|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$"
> +
> +        # Legacy compatibles
> +        #
> +        # New compatibles are not allowed.
> +        - pattern: "^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$"
> +        - pattern: "^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$"
> +        - pattern: "^renesas,em-(gio|sti|uart)$"
> +        - pattern: "^renesas,fsi2-(r8a7740|sh73a0)$"
> +        - pattern: "^renesas,hspi-r8a777[89]$"
> +        - pattern: "^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$"
> +        - enum:
> +            - renesas,imr-lx4
> +            - renesas,mtu2-r7s72100
> +
> +        # None SoC component compatibles
> +        #
> +        # Compatibles with the Renesas vendor prefix that do not relate to any SoC
> +        # component are OK. New compatibles are allowed.
> +        - enum:
> +            - renesas,smp-sram
> +
> +        # Do not fail compatibles not matching the select pattern
> +        #
> +        # Some SoC components in addition to a Renesas compatible list
> +        # compatibles not related to Renesas. The select pattern for this
> +        # schema hits all compatibles that have at lest one Renesas compatible
> +        # and try to validate all values in that compatible array, allow all
> +        # that don't match the schema select pattern. For example,
> +        #
> +        #   compatible = "renesas,r9a07g044-mali", "arm,mali-bifrost";
> +        - pattern: "^(?!renesas,.+-.+).+$"
> +
> +additionalProperties: true
> -- 
> 2.43.0
> 

