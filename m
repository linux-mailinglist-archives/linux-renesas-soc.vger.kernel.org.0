Return-Path: <linux-renesas-soc+bounces-29744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPeXEa1uumnRWQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 10:21:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 489732B8E17
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 10:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 522F030492F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1676939B48D;
	Wed, 18 Mar 2026 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCBaqsjQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E600B1B87C0;
	Wed, 18 Mar 2026 09:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825424; cv=none; b=R/6ry8/h23CnbPnBx5/vMcipq2TBnVhEX29Xmzvi1GjWq46zGjSzKEbKl0QYrlqADFrW5sPtJvGQVeToW7p+PC2mKhvUoexIgb0mFCSv0ThwV4avzsnhiLW0x53Jgx981k5KChCU/ec3QsV58LhzN3sTMlexmmIoB2uRaYCNTXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825424; c=relaxed/simple;
	bh=1bAMJUwleZzW7GDCrHjhA7QBSe3/jidu//rH+g/+KRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npDXFe+0h+Rdto3U3z9Xh2R75waF6Wztjs3345GI/wT3Tz2mXJhAWboY9j/mq75GzLhQ3vZO4Ui8YsHLlkTlg8QbirF1YQWDcpiKktuQnI1tN+7CGFxq1wfL2SAexxzU66CCBM6hPxYa6gNx9kihS7vjo0tguFbOL4eWukTALj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCBaqsjQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED405C19421;
	Wed, 18 Mar 2026 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825423;
	bh=1bAMJUwleZzW7GDCrHjhA7QBSe3/jidu//rH+g/+KRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCBaqsjQNgRJcLepL924vDM7DtHzfxPNoUDsl5nt8b+JSdDZkBdfik0ZwBYU5TSKR
	 x9Mi40nVvj5Kv3o+jUbO9tvKfqTiq6vayv0mV/3jlkQzPZx4kraRnwFd8X36UUnNDP
	 90/rk2T4wVxB3YnzYayTMSyQhDzkVIphnaSCQeHJkwS+ez+O3RA0fAasL/+jwJDmbb
	 fzTmfsAIZNXEtPeV946SIaesRWmIGMtd973mJ1e7ysCaHEMH0AZCMau/MFbGM8z2au
	 5wl87T/c/RywTgUGvlEVEjfAFQ3R234foBfL7sKMVD5nUs9Epc8tXOTJS7s5O5PekF
	 ZYvyWel9DotwQ==
Date: Wed, 18 Mar 2026 10:17:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: renesas: add MFIS binding
 documentation
Message-ID: <20260318-camouflaged-umber-oxpecker-b2b29e@quoll>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317130638.2804-2-wsa+renesas@sang-engineering.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29744-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,glider.be,kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 489732B8E17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 02:06:34PM +0100, Wolfram Sang wrote:
> Add device tree bindings for the Renesas Multifunctional Interface
> (MFIS) as found on the Renesas R-Car X5H (r8a78000) SoC. MFIS includes
> features like Mailbox/HW Spinlock/Product Register.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Checked with 'dt_bindings_check'. Family-compatible values are not
> introduced here because MFIS is usually very different per SoC.

Not sure with what family this would be compatible, but anyway this
should be explained in commit msg.

> 
>  .../soc/renesas/renesas,r8a78000-mfis.yaml    | 160 ++++++++++++++++++
>  .../mailbox/renesas,r8a78000-mfis.h           |  27 +++
>  2 files changed, 187 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
>  create mode 100644 include/dt-bindings/mailbox/renesas,r8a78000-mfis.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
> new file mode 100644
> index 000000000000..dbda28ac781c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
> @@ -0,0 +1,160 @@
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
> +  Renesas Multifunctional Interface (MFIS) provides functionality for
> +  communication between different CPU cores. Those cores can be in various

so kind of remoteproc? The soc directory is dumping ground, so you
should find something more suitable if possible.

> +  domains like AP, RT, or SCP. Functionality includes features like
> +  mailboxes, hardware spinlocks and such.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r8a78000-mfis       # R-Car X5H (AP<->AP, with PRR)
> +      - renesas,r8a78000-mfis-scp   # R-Car X5H (AP<->SCP, without PRR)
> +
> +  reg:
> +    minItems: 2

Drop

> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: common
> +      - const: mboxes
> +
> +  interrupts:
> +    minItems: 32
> +    maxItems: 128
> +    description:
> +      The interrupts raised by the remote doorbells.
> +
> +  interrupt-names:
> +    minItems: 32
> +    maxItems: 128
> +    items:
> +      pattern: "^ch[0-9]+[ie]$"
> +    description:
> +      An interrupt name is constructed with the prefix 'ch'. Then, the
> +      channel number as specified in the documentation of the SoC. Finally,
> +      the letter 'i' if the interrupt is raised by the IICR register. Or 'e'
> +      if it is raised by the EICR register.

Describe why is this flexible. These are fixed devices, very specific
SoCs. They do not come with randomly routed interrupts, usually.

> +
> +  "#hwlock-cells":
> +    const: 1
> +
> +  "#mbox-cells":
> +    const: 2
> +    description:
> +      The first cell is the channel number as specified in the documentation
> +      of the SoC. The second cell may specify flags as described in the file
> +      <dt-bindings/mailbox/renesas,r8a78000-mfis.h>.
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
> +    mfis: syscon@189e0000 {

Drop label and rename node - that's not syscon.

> +            compatible = "renesas,r8a78000-mfis";
> +            reg = <0x189e0000 0x1000>, <0x18800000 0x40000>;
> +            reg-names = "common", "mboxes";
> +            interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "ch0i", "ch0e", "ch1i", "ch1e", "ch2i", "ch2e", "ch3i", "ch3e",
> +                              "ch4i", "ch4e", "ch5i", "ch5e", "ch6i", "ch6e", "ch7i", "ch7e",
> +                              "ch8i", "ch8e", "ch9i", "ch9e", "ch10i", "ch10e", "ch11i", "ch11e",
> +                              "ch12i", "ch12e", "ch13i", "ch13e", "ch14i", "ch14e", "ch15i", "ch15e",
> +                              "ch16i", "ch16e", "ch17i", "ch17e", "ch18i", "ch18e", "ch19i", "ch19e",
> +                              "ch20i", "ch20e", "ch21i", "ch21e", "ch22i", "ch22e", "ch23i", "ch23e",
> +                              "ch24i", "ch24e", "ch25i", "ch25e", "ch26i", "ch26e", "ch27i", "ch27e",
> +                              "ch28i", "ch28e", "ch29i", "ch29e", "ch30i", "ch30e", "ch31i", "ch31e",
> +                              "ch32i", "ch32e", "ch33i", "ch33e", "ch34i", "ch34e", "ch35i", "ch35e",
> +                              "ch36i", "ch36e", "ch37i", "ch37e", "ch38i", "ch38e", "ch39i", "ch39e",
> +                              "ch40i", "ch40e", "ch41i", "ch41e", "ch42i", "ch42e", "ch43i", "ch43e",
> +                              "ch44i", "ch44e", "ch45i", "ch45e", "ch46i", "ch46e", "ch47i", "ch47e",
> +                              "ch48i", "ch48e", "ch49i", "ch49e", "ch50i", "ch50e", "ch51i", "ch51e",
> +                              "ch52i", "ch52e", "ch53i", "ch53e", "ch54i", "ch54e", "ch55i", "ch55e",
> +                              "ch56i", "ch56e", "ch57i", "ch57e", "ch58i", "ch58e", "ch59i", "ch59e",
> +                              "ch60i", "ch60e", "ch61i", "ch61e", "ch62i", "ch62e", "ch63i", "ch63e";
> +            #hwlock-cells = <1>;
> +            #mbox-cells = <2>;
> +    };
> diff --git a/include/dt-bindings/mailbox/renesas,r8a78000-mfis.h b/include/dt-bindings/mailbox/renesas,r8a78000-mfis.h
> new file mode 100644
> index 000000000000..89489c2a4847
> --- /dev/null
> +++ b/include/dt-bindings/mailbox/renesas,r8a78000-mfis.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Constants for the mailbox part of the Renesas MFIS IP core.
> + */
> +
> +#ifndef _DT_BINDINGS_MAILBOX_RENESAS_MFIS_H
> +#define _DT_BINDINGS_MAILBOX_RENESAS_MFIS_H
> +
> +/*
> + * MFIS HW design before r8a78001 requires a channel to be marked as either
> + * TX or RX.
> + */
> +#define MFIS_CHANNEL_TX	(0 << 0)

0, bindings constants are abstract (so without dedicated meaning)
numbers, starting from 0 or 1 and incremented by 1. Shifting this
implies there is some other logic and that would mean - not a binding.

> +#define MFIS_CHANNEL_RX	(1 << 0)

1


> +
> +/*
> + * MFIS variants before r8a78001 work with pairs of IICR and EICR registers.
> + * Usually, it is specified in the datasheets which of the two a specific core
> + * should use. Then, it does not need extra description in DT. For plain MFIS
> + * of r8a78000, this is selectable, though. According to the system design and
> + * the firmware in use, these channels need to be marked. This is not needed
> + * with other versions of the MFIS, not even with MFIS-SCP of r8a78000.
> + */
> +#define MFIS_CHANNEL_IICR	(0 << 1)
> +#define MFIS_CHANNEL_EICR	(1 << 1)

Same here.

Best regards,
Krzysztof


