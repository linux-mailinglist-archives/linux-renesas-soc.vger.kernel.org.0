Return-Path: <linux-renesas-soc+bounces-30952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI6wAQJf1Wlq5QcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 21:46:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBA93B3F06
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 21:46:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 42CD63022CA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 19:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022073783C3;
	Tue,  7 Apr 2026 19:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9VEnleF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24AD3368B2;
	Tue,  7 Apr 2026 19:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591091; cv=none; b=VeC38H75dT4Q0t2YrMuynnbFrLB6Fb2lC42a0Gv6OkKnz3X2ogdd8vKv3fSS+NETdp13xD1MfWDoM1PSfxiKGXvzSF51HO8LrruNHqeqbOgmR9lLre75TNmiwg8V1rujNHH5v2MkDweCRYN9csxWa4HUtbnLuAd6Pv00Xx4f8Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591091; c=relaxed/simple;
	bh=SKAFaaFdKuQzJeQHb501QmOdWc9hK4UYaByCoM39Rhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQbQE31gefKmJnYw3iCAaGh1202JepkuJfp3k1HuSkrTX39gc5wYa6awHEDq7gur4iZjmpKVX6NVVngyLHP5naAusnpdkfjtQN7/2rs2Otaj4Y5XBlyHU+5WcDe7ZU7Ff4oQpmQoCYBPQWPf2izdORTBOkSYRxR7wCPq/IiAl6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9VEnleF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DB2C116C6;
	Tue,  7 Apr 2026 19:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775591091;
	bh=SKAFaaFdKuQzJeQHb501QmOdWc9hK4UYaByCoM39Rhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9VEnleFDFq0gSwXG9RGpKwBchSL6GpLomnphcGlzmy+7t7OLI5cDCnZ8tIaWPQU5
	 Ba3JRzDfE77sCyRKU8VGymk/VSlgFjqKXPjnOOF6Uq5AXWPqqFQ7bYxTUpupW9gt0j
	 sUY+uQ3vweKZ59R71VE7FCDxiOSSRcQlDmnOWriD9RhOv4ENDv5k9Q+NVsYeGJuLhF
	 jYTY4u3VcZXRqly8sjy2/TrfEck3kFYZC4vJWDcyNcoU3rF4FXU33HRDEwYUwrNZix
	 APnoTItamTPtt7Bnq4ooof5aYTqRC49UWDc5eUXDMWVjzOfmSmX8lUh2PCCkOuxqIA
	 vO7M4SXURJ3rA==
Date: Tue, 7 Apr 2026 14:44:49 -0500
From: Rob Herring <robh@kernel.org>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 05/16] dt-bindings: bus: eip150: Describe the EIP-150
 container node
Message-ID: <20260407194449.GA3542959-robh@kernel.org>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-5-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-5-5e6ff7853994@bootlin.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30952-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: 9EBA93B3F06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:09:27PM +0100, Miquel Raynal (Schneider Electric) wrote:
> Part of Inside-Secure's SafeXcel family, the EIP-150 is some kind of
> container node composed of:
> - a public key accelerator,
> - random number generator,
> - an interrupt controller.
> 
> It also acts as proxy for the clocks.
> 
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  .../bus/inside-secure,safexcel-eip150.yaml         | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/bus/inside-secure,safexcel-eip150.yaml b/Documentation/devicetree/bindings/bus/inside-secure,safexcel-eip150.yaml
> new file mode 100644
> index 000000000000..1b3d83a852f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/inside-secure,safexcel-eip150.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/inside-secure,safexcel-eip150.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Inside-Secure SafeXcel EIP-150 container
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +description:
> +  The EIP-150 is a hardware container, it has its own interrupt
> +  controller inside to which a random number generator and a public key
> +  accelerator are wired.
> +
> +allOf:
> +  - $ref: simple-pm-bus.yaml#
> +  - $ref: /schemas/clock/clock-nexus-node.yaml#

Generally, if a schema has 'select: true', you don't reference it as it 
has already been applied. And you have to list the properties here 
anyways because you need to define how many #clock-cells for example.

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: inside-secure,safexcel-eip150
> +      - {} # simple-pm-bus, but not listed here to avoid false select
> +
> +  clocks:
> +    minItems: 1

Seems to me you are adding this to satisfy simple-pm-bus. Maybe this 
should just be simple-bus?

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^interrupt-controller@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/interrupt-controller/inside-secure,safexcel-eip201.yaml#

Better to just list a compatible you require. Like this, the schema is 
applied twice.

> +
> +  "^rng@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/rng/inside-secure,safexcel-eip76.yaml#
> +
> +  "^crypto@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/crypto/inside-secure,safexcel-eip28.yaml#
> +
> +required:
> +  - compatible
> +  - clocks

> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges

The bus schema requires all these already.

Rob

