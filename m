Return-Path: <linux-renesas-soc+bounces-33404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN4LE4AUHmrugwkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 01:23:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 945FF6264FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 01:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C27B830087B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jun 2026 23:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E2836309B;
	Mon,  1 Jun 2026 23:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMPMZ6kI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF421339B1;
	Mon,  1 Jun 2026 23:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780356160; cv=none; b=b9MBCOild9dmBCNQ9qwfjQHWbd1aojc0TQZ8v6fvOoXie6OQdnW5X2YpNO/Dw2tfBn1V96Ivp3pUH4I1QshCW1hA20oJ2IOEuzZm0k7/iPbHWeoS+4pLkUU1Nuqz8rirEzz4pprdvgHycIKmvMV/MI7UOjVr5kQS2AZuQV6L3Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780356160; c=relaxed/simple;
	bh=8JPptXofzftbZfk+jBjs0hIOrObiAo6U/ml8w+ZHZYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCiovjtxdJaVl6bN94dnTFJpn5LD+4K7hNlCsnGlXcQh3mDi2Xv6rp7lxUCvk05+LD23P1kqMXRnGiJ5KuV1e7abn/HStClOfYMcKovADPA67Y0THeF496bnWB9pfH3rOD+OephXw2w17G9UsgDGjjb+qu3j5ZR3ggc9Ciiv180=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMPMZ6kI; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBEBA1F00893;
	Mon,  1 Jun 2026 23:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780356158;
	bh=fZ4HvA/e592DsQSw1Bl5h6ntlU8grYxMDW9LiWsgfR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aMPMZ6kI942daUEfCHVwTcaYmqUKpQtAxeoGnSVi/Qn6doj7se7V2NZfBE39fJYtc
	 U3MElu8hp53Oi56bKP3HNFUaL5MIzSNYJXhrOJB6zHRyLNXEgBNcHlXqOsjD2LFItZ
	 dZWqAl1sqjKjf9ILniy5UokVpe8CqwLGp1Z+U+3Z23TRBXz2tB0BV2xrP0udhsbmKH
	 hKnGlTLpAkaAeUbPn+HuO6Lm3GX2k0PqAXwZoiLo5SVndkCrnog9DKeCH0fqOj1YqS
	 zx+a8sSJLY/2gqdgmWpQGdHvqzVz9l1VZ1QPN7xq6SgC+WsHJ2H6UuBsDn9rsU5YAf
	 +xj4iH5iDYo3A==
Date: Mon, 1 Jun 2026 18:22:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: PCI: renesas,r9a08g045-pcie: Add
 RZ/V2H(P) support
Message-ID: <178035615742.177937.1822067747423866705.robh@kernel.org>
References: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260520164823.436992-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520164823.436992-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33404-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,google.com,renesas.com,pengutronix.de,bp.renesas.com,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 945FF6264FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 20 May 2026 17:48:20 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for the PCIe controller found on the Renesas RZ/V2H(P) SoC.
> 
> The RZ/V2H(P) controller is similar to the RZ/G3E variant but includes
> additional registers and configuration bits for PCIe lane control. It
> supports multilink operation configured as either a single x4 link
> or two independent x2 link controllers.
> 
> Unlike earlier SoCs supported by this driver which only feature a single
> PCIe controller, the RZ/V2H(P) SoC implements two controllers. Both
> instances rely on the system controller (SYSC) for configuration, but
> the required registers reside at different offsets for each controller.
> 
> To correctly identify the controller instance and map the corresponding
> system controller registers, update the "renesas,sysc" property to a
> phandle-array. For the RZ/V2H(P) SoC, require an accompanying cell to
> specify the controller instance index (0 or 1). For all earlier SoCs,
> strictly restrict the property to a single phandle with zero argument
> cells.
> 
> Additionally, make the "num-lanes" property mandatory for this SoC and
> restrict its values according to the hardware capabilities.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Dropped using linux,pci-domain property.
> - Switched property to phandle-array for renesas,sysc
>   to support multiple controllers with different SYSC register sets.
> - Updated commit message for clarity.
> 
> v1->v2:
> - Updated commit message.
> - Dropped un-necessary new line in schema.
> ---
>  .../bindings/pci/renesas,r9a08g045-pcie.yaml  | 34 +++++++++++++++++--
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


