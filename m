Return-Path: <linux-renesas-soc+bounces-30316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMPqKHD4xGmC5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:12:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E592331FFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BC1F301BEC6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 09:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAABC3AF64B;
	Thu, 26 Mar 2026 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HuZie4H9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C675434EEE5;
	Thu, 26 Mar 2026 09:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515802; cv=none; b=hC8Z5UeqbrX3kaLWzbWS1viWRXdlT1sTz7ZbMJggNqP3GtTisA9MjhGv9FB7FpYDcKlwQci9MztyuA8PNCiy+oYBZqB+nztL+dNOaaMOvWHwOKzP0Iy1WAbM7NdGp51BX4XhmlSiy6UQpY6SDDc327vEDizN1BiHK9lvt72VEDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515802; c=relaxed/simple;
	bh=KWquyYpNTRQ2FFSXokOqbO0npmNcbFXxbWHw0wqfMnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyXMXC6s7kKqtijB/ZZ7cltT4r6L9bBGlF88dKlMTBn4bXb43HarxxfiSUZpzjGucueOBHK9MV9OMla22+6bRhho9tXh/xW4lU9sNfpxLBh61Wj3rMrGtMPr/YNgEZtiEpZEbmtAqEu8wZWN410XUs1c7EnfPOZlyFZNaU7IdS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HuZie4H9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D505BC116C6;
	Thu, 26 Mar 2026 09:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774515802;
	bh=KWquyYpNTRQ2FFSXokOqbO0npmNcbFXxbWHw0wqfMnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HuZie4H97DP27oCCg9eEjYnSxijKDCme9SpNpVp75ETQBVUGZw020Hno5VYc3GupE
	 x5Se2LAuE6mbnrOV/1iMIA2Jpl8jKKs5WCOduOEBitWEfrBZPar41S8RAe29VhDwNJ
	 NkZ5+LO2rx6nP+5WqyrJ/JV9xND7+AQPLJODbWtDH4aX4beED5//klMJQm2EbCw2RL
	 TKm4JJujCUUwpcbNN6mjiL/azQpbj2YVYhlFbHWEu2tN98hKgCffz5883wNHddr2Gr
	 iej6Z5RdimOeNhM25Rz1cpzJKIZaDSy7tvXVKgI+g4V7CSEUOL7sGaUhG/6OQIT8dJ
	 c3i83LeE6zQHA==
Date: Thu, 26 Mar 2026 10:03:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Marek Vasut <marek.vasut@mailbox.org>, devicetree@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: renesas: Document MFIS IP core
Message-ID: <20260326-magnetic-cautious-earthworm-aee7ec@quoll>
References: <20260325110717.17083-1-wsa+renesas@sang-engineering.com>
 <20260325110717.17083-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325110717.17083-2-wsa+renesas@sang-engineering.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,mailbox.org,glider.be,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-30316-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sang-engineering.com:email]
X-Rspamd-Queue-Id: 0E592331FFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 12:07:13PM +0100, Wolfram Sang wrote:
> Document the Renesas Multifunctional Interface (MFIS) as found on the
> Renesas R-Car X5H (r8a78000) SoC. MFIS includes features like Mailbox/HW
> Spinlock/Product Register/Error Injection/Error Detection and the likes.
> Family-compatible values are not introduced here because MFIS is usually
> very different per SoC.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Still passes 'dt_binding_check'. Double-checked with some invalid DTs.
> Thank you to Krzysztof and Geert for the review.
> 
> Changes since v1:
> * moved header from 'mailbox' to 'soc' and fixed ifdef-guard
> * handled interrupt numbers and patterns per compatible
>   (tried to remove minItems, didn't work.)
> * extended descriptions
> * in the header, explain that bits are ORable flags
>   (I hope that shifts are okay then? Like in other upstream examples)
> * use "system-controller" instead of "syscon"
> * dropped label from the example
> * improved subject and commit message
> 
>  .../soc/renesas/renesas,r8a78000-mfis.yaml    | 187 ++++++++++++++++++
>  .../dt-bindings/soc/renesas,r8a78000-mfis.h   |  28 +++
>  2 files changed, 215 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
>  create mode 100644 include/dt-bindings/soc/renesas,r8a78000-mfis.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
> new file mode 100644
> index 000000000000..2839642ec116
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
> @@ -0,0 +1,187 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/renesas/renesas,r8a78000-mfis.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas MFIS (Multifunctional Interface) controller
> +
> +maintainers:
> +  - Wolfram Sang <wsa+renesas@sang-engineering.com>
> +
> +description:
> +  The Renesas Multifunctional Interface (MFIS) provides various functionality
> +  like mailboxes, hardware spinlocks, product identification, error injection,
> +  error detection and such. Parts of it can be used for communication between
> +  different CPU cores. Those cores can be in various domains like AP, RT, or
> +  SCP. Often multiple domain-specific MFIS instances exist in one SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r8a78000-mfis       # R-Car X5H (AP<->AP, with PRR)
> +      - renesas,r8a78000-mfis-scp   # R-Car X5H (AP<->SCP, without PRR)
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: common
> +      - const: mboxes
> +
> +  interrupts:

Missing constraints.

> +    description:
> +      The interrupts raised by the remote doorbells.
> +
> +  interrupt-names:

Missing constraints. See writing bindings.

> +    description:
> +      An interrupt name is constructed with the prefix 'ch'. Then, the
> +      channel number as specified in the documentation of the SoC. Finally,
> +      the letter 'i' if the interrupt is raised by the IICR register. Or 'e'
> +      if it is raised by the EICR register.
> +
> +  "#hwlock-cells":
> +    const: 1
> +
> +  "#mbox-cells":
> +    const: 2
> +    description:
> +      The first cell is the channel number as specified in the documentation
> +      of the SoC. The second cell may specify flags as described in the file
> +      <dt-bindings/soc/renesas,r8a78000-mfis.h>.
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r8a78000-mfis
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 128
> +          maxItems: 128
> +        interrupt-names:
> +          minItems: 128
> +          maxItems: 128
> +          items:
> +            pattern: "^ch[0-9]+[ie]$"
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r8a78000-mfis-scp
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 32
> +          maxItems: 32
> +        interrupt-names:
> +          minItems: 32
> +          maxItems: 32
> +          items:
> +            pattern: "^ch[0-9]+i$"
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - "#hwlock-cells"
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    system-controller@189e0000 {
> +            compatible = "renesas,r8a78000-mfis";

Since I expect next version, one more detail I forgot to ask last time:

Use 4 spaces for example indentation.

> +            reg = <0x189e0000 0x1000>, <0x18800000 0x40000>;
> +            reg-names = "common", "mboxes";
> +            interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,

....


> diff --git a/include/dt-bindings/soc/renesas,r8a78000-mfis.h b/include/dt-bindings/soc/renesas,r8a78000-mfis.h
> new file mode 100644
> index 000000000000..52e17fea1a03
> --- /dev/null
> +++ b/include/dt-bindings/soc/renesas,r8a78000-mfis.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +#ifndef _DT_BINDINGS_SOC_RENESAS_R8A78000_MFIS_H
> +#define _DT_BINDINGS_SOC_RENESAS_R8A78000_MFIS_H
> +
> +/*
> + * Constants for the second mbox-cell of the Renesas MFIS IP core. To be treated
> + * as bit flags which can be ORed.
> + */
> +
> +/*
> + * MFIS HW design before r8a78001 requires a channel to be marked as either
> + * TX or RX.
> + */
> +#define MFIS_CHANNEL_TX (0 << 0)
> +#define MFIS_CHANNEL_RX (1 << 0)

No improvements and no answers to comments. Same review, drop, not a
binding. If disagree, respond to v1 comments.

Best regards,
Krzysztof


