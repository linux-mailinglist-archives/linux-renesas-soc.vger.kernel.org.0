Return-Path: <linux-renesas-soc+bounces-27248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB9lBHlccWnLGAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:08:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 779F55F462
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 00:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9574790406C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 23:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434B243E4B5;
	Wed, 21 Jan 2026 23:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inQ8ihCa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1416F42E011;
	Wed, 21 Jan 2026 23:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036881; cv=none; b=MPy1zwxFzO76YQj72DfwF9FhZy2Hl6vuflEjgICFmnwUwds93IewuvdYNFKXkwhnOJ24xQz5zAcQstxUCR8V85cn6wLD9o7EIdxpSk4h4B54RFKwcnuGxptjJRrVcwJfA8q563Kv2dcDgwJyhWumG9MuJCgAenlYB7wHBIbKzXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036881; c=relaxed/simple;
	bh=tmAuTsXHCVdBB2fbqTRVjuONr67Va3lmn5fvJN6U36k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hL5RYroHT8HM/L/BWNaK96iTopppsT68/y3YNyGLjS32ZCo2mc/l3C8dWWuCC25vYvZRnI3W0i6cvDwAwOsKyZ4Ng8PFVtKJsAfMnsLO5q4oV4xvzAd5S5fhReIdIJcyWqnZxJkg3tgWZ7PvnVAPMY3TOnerCOYytbJPjNPZFac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inQ8ihCa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889DDC4CEF1;
	Wed, 21 Jan 2026 23:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769036880;
	bh=tmAuTsXHCVdBB2fbqTRVjuONr67Va3lmn5fvJN6U36k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=inQ8ihCaoWGCMX3UpBQITxU3SWCs0FEAF2WTuZj3eeaodvwGFV7BD5GmVujibdrry
	 UAEsE2kgp+AWTtG+v/HGLfYzb/YazbRO1yU6RLciNriRI842svN3zaOmwDzOJZOkzQ
	 VhD+rHplMJQJZkg/UQtSSlRDIz9K/V3W2/Srf4VTSBr/CRVopxUeW+tF1cd0j7IRkq
	 eIaiKKxokPVot7hpgvrW9i7UX+hb/cA/H9I/e5aYzBTcVEYR07gDqLzrQZvf7bwa9i
	 DDMx9lRwP7KoDWzLckqt0oYUlEojWJwFBYwqPdOTLhWZxtI84HrEjYNC1ds0zJ3UXZ
	 U7ghUBWJtbZ9A==
Date: Wed, 21 Jan 2026 17:07:59 -0600
From: Rob Herring <robh@kernel.org>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Santhosh Kumar K <s-k6@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 03/17] spi: dt-bindings: cdns,qspi-nor: Add examples
 for testing the specific cases
Message-ID: <20260121230759.GA223990-robh@kernel.org>
References: <20260121-schneider-6-19-rc1-qspi-v3-0-43e70fab4444@bootlin.com>
 <20260121-schneider-6-19-rc1-qspi-v3-3-43e70fab4444@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-schneider-6-19-rc1-qspi-v3-3-43e70fab4444@bootlin.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,ti.com,bootlin.com,sang-engineering.com,se.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-27248-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.9.96:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,bootlin.com:email,0.198.132.80:email]
X-Rspamd-Queue-Id: 779F55F462
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 06:04:59PM +0100, Miquel Raynal (Schneider Electric) wrote:
> It is very painful to modify this file because the core IP described is
> so common, it has been implemented in many SoCs from different
> architectures. Both `dtbs_check` and `dt_binding_check` are rather long
> commands, even when restricted to a single schema files, and letting
> this file evolve without risking to break other DTSs is painful, because
> there are arm, arm64 and riscv platforms impacted and no way to check
> all of them at the same time.

OTOH, examples aren't meant to be exhaustive test cases of all 
possibilities. If it was me, I'd actually just get rid of all the 
examples. They are generally just a copy from some .dts we already have.

> Instead, we can identify the few specific cases which may need extra
> testing, and fill the examples section to cover them all.
> 
> Add examples to cover the Starfive (resets) and Pensando (fifo-depth)
> cases.
> 
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> index 123caef8f61e..62b97ab607f3 100644
> --- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> @@ -189,3 +189,38 @@ examples:
>              cdns,tslch-ns = <60>;
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +    spi@13010000 {
> +        compatible = "starfive,jh7110-qspi", "cdns,qspi-nor";
> +        reg = <0x13010000 0x10000>, <0x21000000 0x400000>;
> +        interrupts = <25>;
> +        clocks = <&syscrg JH7110_SYSCLK_QSPI_REF>, <&syscrg JH7110_SYSCLK_QSPI_AHB>,
> +                 <&syscrg JH7110_SYSCLK_QSPI_APB>;
> +        clock-names = "ref", "ahb", "apb";
> +        resets = <&syscrg JH7110_SYSRST_QSPI_APB>, <&syscrg JH7110_SYSRST_QSPI_AHB>,
> +                 <&syscrg JH7110_SYSRST_QSPI_REF>;
> +        reset-names = "qspi", "qspi-ocp", "rstc_ref";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        cdns,fifo-depth = <256>;
> +        cdns,fifo-width = <4>;
> +        cdns,trigger-address = <0x0>;
> +    };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    spi@2400 {
> +        compatible = "amd,pensando-elba-qspi", "cdns,qspi-nor";
> +        reg = <0x2400 0x400>, <0x7fff0000 0x1000>;
> +        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&flash_clk>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        cdns,fifo-depth = <1024>;
> +        cdns,fifo-width = <4>;
> +        cdns,trigger-address = <0x7fff0000>;

This one really just looks like a subset of the others.

Rob

