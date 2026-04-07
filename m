Return-Path: <linux-renesas-soc+bounces-30950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNocEwJb1WkH5QcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 21:29:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E303E3B3969
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 21:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 299E0301FC29
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 19:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68623542D1;
	Tue,  7 Apr 2026 19:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dA3ZeefX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23A0313E30;
	Tue,  7 Apr 2026 19:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775590142; cv=none; b=mGN586UHPrAW74gU4V/J2MUs+vd8XldtA8NJ/N6vzk75GjPcMFevQkaEHBqVXuVbOCCDtMhp5j5s1/Q+cOmqbOe5xNhT2s3PdFCQ93pU37PunZdupjZRyCBaQmeNL1CU3/wTeS9YHi3nU4h/pCBzy6CtcRK+QTNEfTapCiC3c84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775590142; c=relaxed/simple;
	bh=cgOoRH8ry7zbFnB5ny1ikz2iS1dHVeZMa4kaLWmdFuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzL0j0j1BOMnN0Xwx/OejPm04DJQ7s1X/olQwes1hI0c2IrSkdqC71reufwQ++2a7NJPfs7+OeLUL3SD5v0ONIr6/PnUdRMgoIYsMTFYSMWnRqX2GCSHaxCZWKpWB8D8bAt6Hw9UQSFCx5gTXwsbQhdyqRFy0yY3Fg1jxZMmsp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dA3ZeefX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C206C116C6;
	Tue,  7 Apr 2026 19:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775590142;
	bh=cgOoRH8ry7zbFnB5ny1ikz2iS1dHVeZMa4kaLWmdFuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dA3ZeefXQTe5fPnO1yn3ONCXblFHpiO1+Fchude9+YJVskEzJ8ooygeV73WIY2Lku
	 4iDJaPbVCW6WHjALFWauQFFhyCK/xR9/sH5X6Gpu1RHEbSO44xh5xWF7l1PwhyoFKP
	 1mursg4DM/7696C80voN2qJ3SKoSbhX0msQac2tujYmx5vLes1D6QqP6ZwYeHPKlzp
	 wEQDSXluMclnRnU5MigPb1t+UUPDD7TTMEldqfpZi+dazWb6u01ytbgZ68R0TCn5vW
	 JJJ/J/rLfqV9sOEecuiaD7WGqW9QHEFhjavBG0tm1bLWFKC/SK91FOfUmDHdcxgP0B
	 I/g8nzpMd2YyQ==
Date: Tue, 7 Apr 2026 14:29:00 -0500
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
Subject: Re: [PATCH 01/16] dt-bindings: clock: Introduce nexus nodes
Message-ID: <20260407192900.GA3531350-robh@kernel.org>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-1-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-1-5e6ff7853994@bootlin.com>
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
	TAGGED_FROM(0.00)[bounces-30950-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: E303E3B3969
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:09:23PM +0100, Miquel Raynal (Schneider Electric) wrote:
> Hardware containers can just decouple external resources like clock
> without any more control. Nexus nodes already exist for PWM and GPIOs,
> add a binding to allow them for clocks as well.
> 
> No examples are given, the file is litteraly a copy-paste from Hervé
> Codina's work on PWM Nexus nodes, hence we just point to the examples
> there which already illustrate very clearly the concept of the various
> properties.
> 
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  .../bindings/clock/clock-nexus-node.yaml           | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
> new file mode 100644
> index 000000000000..f07e2972e8aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/clock-nexus-node.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/clock-nexus-node.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Clock Nexus
> +
> +description: >
> +  A nexus node allows to remap a phandle list in a consumer node through a
> +  container or a connector node in a generic way. With this remapping,
> +  the consumer node needs to know only about the nexus node. Resources
> +  behind the nexus node are decoupled by the nexus node itself.
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +select: true
> +
> +properties:
> +  '#clock-cells': true

No need for this.

> +
> +  clock-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +
> +  clock-map-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  clock-map-pass-thru:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

I think this can be omitted because there aren't common cell definitions 
for clocks like there are for GPIO and PWM.

> +
> +dependentRequired:
> +  clock-map: ['#clock-cells']
> +  clock-map-mask: [ clock-map ]
> +  clock-map-pass-thru: [ clock-map ]
> +
> +additionalProperties: true
> +
> +# See the original pwm-nexus-node.yaml description for examples
> 
> -- 
> 2.51.1
> 

