Return-Path: <linux-renesas-soc+bounces-29191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOSnJX1JsWlCtAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 11:52:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 079B0262976
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 11:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 282AA329B5FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 10:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D835B3CFF6A;
	Wed, 11 Mar 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPXTMuVt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5F83CF04D;
	Wed, 11 Mar 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773225540; cv=none; b=UzOBBPCxAQQv5kg/zT1hqixT4xTLLs+gTWtS1wkcU1tZ19mDujasgiPAVcvmrCwJnEAnfa21Fi/vSQIkFKb36bEELD1Wvs+N/C/IyEt4cgmL/uUkag5oMprTJuBTchAA3/UWkOO0+5OOQYvqPC4K5DD28voZiB1JsSdBfItRC8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773225540; c=relaxed/simple;
	bh=W7ULGNJxGs/DGU9Myuy1oXiG5LI/4bcuMikaWvPhafA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vm+aP3yctBDRtCWqnFAbrhsLMv+GvCt7vAiOubkbb6owKfm1QtaPFF2r1dRxYhrliQ5saMHzH6WYaSEkEd8vQklpxTi+JQbZIB6rJ1YAW/iXzsBJtnbdRnPx1pr9l7rOqQuwGg+a/ZLITo4LFcdwOWRrTa0jestAHF7/3OD4AjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPXTMuVt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4256C2BC86;
	Wed, 11 Mar 2026 10:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773225540;
	bh=W7ULGNJxGs/DGU9Myuy1oXiG5LI/4bcuMikaWvPhafA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPXTMuVttZqUZ/o7JPPcYnite3Um4wggHLpvXqpIoWuC2usNA6k425SfK6rMs77rB
	 CYWeP0jsQTNUcUIy8PnTh9S3O1nsMJGjNBhq2Dq0SHWq7cP3w5ZyXyw9RdDTA3R1eW
	 S440F5uh0GmInYEkvybjOxJt938zdDJqpyKVdapOCNKsje+vi1+1YLP/xkfpiLNDws
	 05TBCJ8PNE7rD4f12++HjlcvSoHkNaTbYC0bbQKnbCiOof2KrsmYEZaZiY5R+JFXdj
	 /8xPc+/68mvyzrREgIspZOqMj2/RD7sCmgpK/s0D84g4YnUN/WpSgEaH93P51o62GI
	 KrW++eDJAd9HA==
Date: Wed, 11 Mar 2026 11:38:50 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/9] PCI: endpoint: Introduce pci_epc_bar_type
 BAR_64BIT_UPPER
Message-ID: <abFGOoZUX_vexLWR@fedora>
References: <20260302095913.48155-11-cassel@kernel.org>
 <20260302095913.48155-12-cassel@kernel.org>
 <dtxdgxrewfby5hu3cu3pu5kljylm627uc43sw75gk7loimmm6r@ei4w6wmqgd6a>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dtxdgxrewfby5hu3cu3pu5kljylm627uc43sw75gk7loimmm6r@ei4w6wmqgd6a>
X-Rspamd-Queue-Id: 079B0262976
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29191-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,google.com,intel.com,gmail.com,nvidia.com,socionext.com,renesas.com,glider.be,valinux.co.jp,lists.ozlabs.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello Mani,

On Wed, Mar 11, 2026 at 12:05:59PM +0530, Manivannan Sadhasivam wrote:

(snip)

> This also brings the question, do we really need to mark the preceding BAR?

From a pure code PoV, marking the preceding BAR is enough even with the
current code:
https://github.com/torvalds/linux/blob/v7.0-rc3/drivers/pci/endpoint/pci-epc-core.c#L101-L103

However, the current documentation claims that the succeeding BAR must be
marked as BAR_RESERVED:
https://github.com/torvalds/linux/blob/v7.0-rc3/include/linux/pci-epc.h#L207-L210

I want to change this to BAR_64BIT_UPPER / BAR_64BIT_UPPER_BASE, so we can use
BAR_RESERVED for BARs that expose fixed hardware resources (e.g. eDMA regs).


Thus, an EPC driver does not strictly need mark the succeeding BAR with anything.
This was done mostly for clarity. (E.g. with BAR_64BIT_UPPER_BASE it is obvious
that this BAR cannot be a standalone 32-bit BAR.)

If we don't mark the succeeding BAR with anything, IMO, it is less obvious that
the succeeding BAR cannot be used as a standalone 32-bit BAR.

But... since the code already does the "right thing". We could simply nuke this
part of the documentation, and drop the .type for all BARs succeeding a
.only_64bit BAR, if you prefer that option over having a dedicated type for the
"upper base of a 64-bit BAR".


> Why can't we let the PCI EPC core to always assume that if the previous BAR
> has 'only_64bit' bit set, next BAR cannot be used as a standalone 32bit BAR?
> 
> I find it weird or redundant to mark both BARs.

Redundant, yes, but in my opinion marking both BARs makes it unambigious
that two BARs are used when a BAR is "only_64bit".

E.g. Manikanta originally wanted to add code comments for the upper part of
the 64-bit BAR:
https://lore.kernel.org/linux-pci/20260217-master-v1-2-727e26cdfaf5@nvidia.com/

Sure, we can just skip the .type for the succeeding BAR...
But is that really better than clearly showing that a "forced" 64-bit BAR will
always occupy two BARs?


Tell me what you prefer:
1) s/BAR_RESERVED/BAR_64BIT_UPPER_BASE/
2) Change documentation and drop .type for a BAR following a .only_64bit BAR.

And I will respin with that.


Kind regards,
Niklas

