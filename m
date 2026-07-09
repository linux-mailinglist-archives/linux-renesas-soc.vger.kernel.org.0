Return-Path: <linux-renesas-soc+bounces-34959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NoJnOp6bT2rMkwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 15:01:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A1291731544
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 15:01:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZJyPhLvb;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34959-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D70BE303E21E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 12:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990601BC2A;
	Thu,  9 Jul 2026 12:59:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8818472;
	Thu,  9 Jul 2026 12:59:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601975; cv=none; b=uQgSe/otg/QJO8bBC+vGYYYvKj7SXGvl24kUZRmSXCn0Rj8Ck6kEWrcWRPxm5gmd8JTkSSKAfmbHGYvehXxxtR6MtjBZq1ybMwp0U63BzCgxRLlMeydtv4va5znUd8JBqN/9Kpa5hiKZhLsDcqtEIVT3Jkb7Y5I6IkeL6pTyk4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601975; c=relaxed/simple;
	bh=QKI142QLNtb5WzHJQGQ1nLN0e46hxo01GIz0yLvn+08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4QH4aHmEusf1i88i+OEXLWse4+FgE8QPz6OzVXjt3RE//zpunUmp5JmkzW4gie2emERhmNld+f3NM1+OulBq95Y2bdsVJ8bzqOs+aZ5MFZXUbk10TK0fUfTRCAntM3szPlCYvzsW7tlRhmRKLg00IEazJlKdsQWgKQ0aSnk4Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJyPhLvb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0781F000E9;
	Thu,  9 Jul 2026 12:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783601974;
	bh=tqMttItt0pf+IcTJhIeWNZ9VHmFvWCzWLjBMEsf634s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZJyPhLvbi/hb55SdQlQjgiAAGpUqF6UxSc83CCFPtEGvMQF4U+r8x+5gLWf1o0zM5
	 gKmlmZUTLqW9tPTtw2gJ5XaqppVjixK+Q7YggF8Gx8Y08nNVkWGuSylILlwyEzFxBe
	 woYOsUKB98S+3f10X9FsekSMOAHjw+NgdsDkoam9UzUplgv1CY1cVr8SB9YuSMj5ez
	 FIOGpXszWaKItE/VjbvXHdi/joeTcx/VpLXAZb4ysEMB3g9TXnh/Hnd4Ld/XodmSYr
	 w3uv+b4k4k7UaU2901kIiMBcU26pgR7xFOXHjSrjYT8rP0VflsPs9dBC7/idsB6JDM
	 iM5yzV3n+XWXw==
Date: Thu, 9 Jul 2026 14:59:23 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-pci@vger.kernel.org, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/5] PCI: rcar-gen4: irqchip/gic-v3: Handle
 GIC ITS
Message-ID: <ael3rodbevow3q7r4y6zavouh3pvoljmyaev5it6dknyaw7vcb@szfampjit4ds>
References: <20260707203743.88299-1-marek.vasut+renesas@mailbox.org>
 <178360186732.755595.3582150626313807959.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178360186732.755595.3582150626313807959.b4-ty@b4>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34959-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:marek.vasut+renesas@mailbox.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[mani@kernel.org:query timed out,linux-renesas-soc@vger.kernel.org:query timed out];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1291731544

On Thu, Jul 09, 2026 at 02:57:47PM +0200, Manivannan Sadhasivam wrote:
> 
> On Tue, 07 Jul 2026 22:35:38 +0200, Marek Vasut wrote:
> > Configure all R-Car Gen4 PCIe controller MSI registers fully, both in
> > case MSI are enabled and disabled.
> > 
> > Patch GIC ITS driver and add quirks for R-Car Gen4 GIC ITS, which is
> > configured to 32-bit address width for AXI or APB interface.
> > 
> > Switch R-Car V4H to use GIC ITS in its DT and describe the GIC ITS
> > implementation cacheable and shareable limitations.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [3/5] irqchip/gic-v3: Refactor GIC600 limited to 32bit PA erratum handling
>       commit: 96b193897fd374fcb63a782c52f8b079134d0222
> [4/5] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
>       commit: 14e8394423ffd4fd28884ec8b4d5ba15be6e7e0d

B4 got confused here. I applied all 4 patches.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

