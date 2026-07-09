Return-Path: <linux-renesas-soc+bounces-34953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ILPFDeSRT2qIjwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 14:19:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7E8730E97
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 14:19:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OBUR1DGw;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3E88302B59F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 12:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC4E4219F2;
	Thu,  9 Jul 2026 12:19:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E50D420E78;
	Thu,  9 Jul 2026 12:19:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599577; cv=none; b=TjtBugGK2c2id4gpk0/3mqai2zk6vAzVWE4qzQ0Mwlv/SBFchoUjc0K0FfwJZObLyMaVIyJiDAidc2A5yF3ZlCAt0l9TFNSDMwuc/0wplOXTbgcEmJP3Tbk248yrkqQqaeIpPcVtV5v6BimQO2kjh480lsLs+b1H+Sc0GiUmJd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599577; c=relaxed/simple;
	bh=580PdfO5T/N0wE5TSQ8iHnD+J0cD0gm6d8xwCpWvU+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtOs4ZFtqlRIqu+PKIq8yQmTXH/pldKebUjFYv4siGauOyblKdKPyQqmTHtYQsjrnFgGNu/DfATqbhLhCUmNUSNx4ahWTBlhndB3jMBxM1oYn4QRxWWIz1MXmgLUiWhBhICIKXGq0o/aCx5t2urcBDuHyJnCC3ZBGttnmhaugM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBUR1DGw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99FD1F000E9;
	Thu,  9 Jul 2026 12:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599575;
	bh=gxbdaaWxpr16WNk35CrzdmbV8r7MBy1PuvbOHdfmxDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OBUR1DGwpGFYcbqf0LlDuPPlLYUTgZvfuO5U6Ul/MnY4wx0OBCbaIyS958hgXIYQG
	 K3HyWh9Y84+xfOKpEaJhGRzvHqiItFCexfHA+pSGdHlXhZciC3L2cfVf9qbx4JceWy
	 YBovMQRpd8h8XhMCf/+oCvIa75iStdsgTUnQ3TJrH4YcsNwjLTud6dXAvg0OlXAd+L
	 gwjJfuv3x9oPyJ9zGYNSbp+XSBA4qzthNNE/oLdkz3bagqc/Xp196k1RKx56yjt7et
	 apjnSUESOnPia+q48p/WW3GU1rQT6yzxATz4Lrt3TbnFds9+jUD/nxLrh+cPUmVmrn
	 ACdrFZmlY6HkQ==
Date: Thu, 9 Jul 2026 14:19:23 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle GIC ITS
Message-ID: <ybnitlgx3dcqsesubz6jz7pn6snseuxhtz564tinbtvukianaq@33ubmcynyqmt>
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34953-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA7E8730E97

On Tue, Jul 07, 2026 at 10:35:38PM +0200, Marek Vasut wrote:
> Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
> case MSI are enabled and disabled.
> 
> Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
> configured to 32-bit address width for AXI or APB interface.
> 
> Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
> implementation cacheable and shareable limitations.
> 
> Marek Vasut (5):
>   PCI: dwc: Determine whether iMSI is used before calling .init
>   PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
>   irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
>   irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround

Is there a functional dependency between irqchip and PCI patches? Since the
irqchip patches touch ARM64 Kconfig etc... I'm wondering if it still need to go
through PCI tree.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

