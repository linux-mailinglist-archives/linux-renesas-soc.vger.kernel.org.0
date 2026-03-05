Return-Path: <linux-renesas-soc+bounces-28847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIiDN2s7qWkd3QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 09:14:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FBD20D461
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 09:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C5A4A30011A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 08:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A6136681C;
	Thu,  5 Mar 2026 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJmlEj89"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBDF3E47B;
	Thu,  5 Mar 2026 08:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698470; cv=none; b=EB1mXq7F1BHkV3Qs76dxHe1Gleme2AaloSgIqdl4MLPwdAtXswzi7WriImNrv5kL/Xm9PfTBDx0P4DG+8k2FOEx2DJ/NACO5gcqIb8eLSTKXf0+BcLlPyr9zF9V6MI12CChzuWgFvegPnH76Udp8CaysjWj1313iDue1H8Ya4P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698470; c=relaxed/simple;
	bh=FSse59W+Ff1LZvFEhUNPBkjgYw1dPirV7rnWSCr1Sj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQqNVzhlTYwUw9Fy6PA5lz/+09eSlSErtCYM3njpuDww/y+eiGfmmCXL2YAjL2K25U2rhjVBar0xhGQF23Ip+Gqy25OCbNP9RzS7eeN6drIkoBovqpN2MzD3zQoslSghy3wVbV4XxIXLNdlUpFn22EsQkTasU0TW/AVml1kaohk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJmlEj89; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08E3C116C6;
	Thu,  5 Mar 2026 08:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772698469;
	bh=FSse59W+Ff1LZvFEhUNPBkjgYw1dPirV7rnWSCr1Sj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJmlEj89myprl/gUS3k/FHDfnjy8K0fq/9TU1ywSJk7t+JZpLSZZbNFqbAg9nLJYY
	 bmJ4gA5cWGgxTE5NRNFQ7hGZoAP4QAHSxrJ/EVSU5sCWNJVdUqHdoKDk6gFahOIpXj
	 8CwbI/0BuB14m7P8IB1O4OadNu45J27lWilkHlsxMQfQ1+quYib2uLoeh9rRzbhXoH
	 t1I2cgH8HRdPV4JGyiwxd7C+xdXOFuA4VmrogucT+OhSYKlrcJLmhNufl4CG9TxGh7
	 fHulUxMC+9s2xzNTpSB6eF0/nQJbHXgX15Y00ho/PJervz3gCgDMeIajT6lY6oNXnD
	 jBz6OsXbl/NXg==
Date: Thu, 5 Mar 2026 13:44:17 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Niklas Cassel <cassel@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: dwc: rcar-gen4: Use 4K EPC BAR alignment
Message-ID: <wroiqhvgph4nrvpkunzpej3ruxv2hvo4itu5kw4xhlrlgpifo2@4hmnpth7eppw>
References: <20260305015439.1529006-1-den@valinux.co.jp>
 <4o42bskgjazgawswex7sfuvptmbho5gb7inmilntygpm7vdt7p@fcb6ttbbnb45>
 <pd56nggmapksuvbk662cwdqwott6lhc7zhlczmxf5jooe3l3od@ytkoxpi3cf7s>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pd56nggmapksuvbk662cwdqwott6lhc7zhlczmxf5jooe3l3od@ytkoxpi3cf7s>
X-Rspamd-Queue-Id: C7FBD20D461
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28847-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,renesas.com,kernel.org,google.com,glider.be,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 04:03:03PM +0900, Koichiro Den wrote:
> On Thu, Mar 05, 2026 at 11:27:42AM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Mar 05, 2026 at 10:54:39AM +0900, Koichiro Den wrote:
> > > R-Car S4 Series (R8A779F[4-7]*) uses a 4K minimum iATU region size
> > > (CX_ATU_MIN_REGION_SIZE = 4K) as per R19UH0161EJ0130 Rev.1.30.
> > > 
> > > Update the advertised alignment to 4K, as described in
> > > commit 2a9a801620ef ("PCI: endpoint: Add support to specify alignment
> > > for buffers allocated to BARs").
> > > 
> > > With the previous 1MB alignment requirement, iATU programming for BAR4
> > > on this platform often cannot be performed, since a 1MB-aligned target
> > > address may fall outside the tiny 256B BAR4 window.
> > > 
> > 
> > Can you clarify this part? What do you mean by 'falling outside of the 256B
> > BAR4 window'? Where does the failure happen exactly?
> 
> My primary motivation is to use MSI doorbell [1] for epf-vntb.
> 
> epf_ntb_db_bar_init_msi_doorbell() passes message address 'low' to
> pci_epf_assign_bar_space(). The message address is a fixed physical address,
> or IOVA if EPC is attached to an IOMMU domain.
> 
> Even though the doorbell window size (the difference between the 'high' and
> 'low' message addresses) is typically small, forcing the base address to be
> aligned to a 1MB boundary may push the mapping base much lower than necessary.
> 
> For example:
> 
>   When the doorbell message address 'low' is 0xffdff0a0,
> 
>   - With the previous 1MB alignment, it is aligned down to 0xffd00000.
>     The offset becomes: 0xffdff0a0 - 0xffd00000 = 0xff0a0, which is far larger
>     than the 256B BAR4 window, so the mapping cannot be programmed.
> 
>   - With the correct 4K alignment, it is aligned down to 0xffdff000.
>     The offset becomes: 0xffdff0a0 - 0xffdff000 = 0xa0, which fits within 256B
>     BAR4 window.
> 

Okay, thanks for clarifying. This information should've been present in the
commit message. Though, the top motivation is to comply with the reference
manual.

>   Note: if the address were e.g. 0xffdff1a0 instead of 0xffdff0a0, the
>   4K-aligned offset would become 0x1a0 (416 bytes), which still exceeds the 256B
>   window. (For simplicity, the 32-bit write width is ignored here.) In such a
>   case, programming the mapping would still not be possible.
> 

Hmm, that's probably fine as we would be running into hardware limitation.

>   Also note that I used the term 'aligned_mem_size' above, which is the local
>   variable name in pci_epf_assign_bar_space(). The corresponding struct
>   pci_epf_bar field was renamed from 'aligned_size' to 'mem_size' by commit
>   483768846d66 ("PCI: endpoint: Rename 'epf_bar::aligned_size' to
>   'epf_bar:mem_size'").
> 
> [1] Precisely speaking, the "embedded" doorbell fallback:
>     https://lore.kernel.org/linux-pci/20260302071427.534158-1-den@valinux.co.jp/
> 
> > 
> > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > 
> > Fixes tag?
> 
> Commit e311b3834dfa ("PCI: rcar-gen4: Add endpoint mode support") is much later
> than 2a9a801620ef ("PCI: endpoint: Add support to specify alignment for buffers
> allocated to BARs"), so I believe it makes sense to add:
> 
>   Fixes: e311b3834dfa ("PCI: rcar-gen4: Add endpoint mode support")
> 

Please add it in next version.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

