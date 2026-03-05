Return-Path: <linux-renesas-soc+bounces-28901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLbtGHmlqWl5BQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 16:47:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AD3214CC8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 16:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFA873010278
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 15:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0513C2766;
	Thu,  5 Mar 2026 15:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxzBQkt9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B41A383C8F;
	Thu,  5 Mar 2026 15:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772725622; cv=none; b=irY/gC+MQxMpqyITPVOd/FUV9PoZA/0cnjR8OiDtLCJ45moLufxOCTJ+uRmhVE4CY4ca0efEZrLrPhGvr/itP+toKjHbM7hAWUWeyWE/p/D6hEO7Xdb4JsC/C5NSbCXBNgRdFtz4rhm23arlgVTcv+sXju5rPAjXA+mYgiMA2wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772725622; c=relaxed/simple;
	bh=6UrD4MMAD6TdMI+VrI847e4+aOFasy74D/DSx0DhECc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwP+E0Ky2S3nt71gK3XWw+oQxyfzEeyhSjJGHxDJpfPW98oFNpu2lqYlHzl9mnepy4xBG7qYbMfEcvG6jqAcHE9k+E5cEJqHa11ww8GvpAfLdDLbSuB1cuopjOX7oQChNInfzufBJv1hre+IxsFJ12dRzpsLMQwTJh0kSv5X9zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxzBQkt9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F585C116C6;
	Thu,  5 Mar 2026 15:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772725621;
	bh=6UrD4MMAD6TdMI+VrI847e4+aOFasy74D/DSx0DhECc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SxzBQkt9O4iJVxHLrkQT5LfZrDanYRTn3VjnqrobvC+Hc7TM3+TA4QpqX81xncMgd
	 79bjaGJ5eMX1bj/Nw0IKuORlw5MXUAYvQoA1CzLZIqrKV0tjBXjC0b9W9Rya6YJdmw
	 d0lSNTpBtM5fRxOOg0gzZkRJDJUJeAYL5Q6P7QpMQPkrhvGPtf4c5+/ckZmINBVXRX
	 khroPbMBq/qDCBhuyCQuK3X48z+hbrQhHoKcjmVx/prp/w1ALeCnnC//YhQx3XIYl6
	 ELK1/Y7Lw7tyHvafufrUbKqR2g0NXZYhLgVzI8IYA/OXWjU+wzodOfstgwfzoXOMe/
	 fpdQiXkj8zhvw==
Date: Thu, 5 Mar 2026 16:46:56 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: dwc: rcar-gen4: Use 4K EPC BAR alignment
Message-ID: <aamlcB-X2GCGvR8F@ryzen>
References: <20260305015439.1529006-1-den@valinux.co.jp>
 <aakyvxxFnBkl4io5@ryzen>
 <zxrmrem2esf2j6v3ifaxtlpzmylfs4gpeohn5ekaqehr4rtzna@4utqnzizwbzx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zxrmrem2esf2j6v3ifaxtlpzmylfs4gpeohn5ekaqehr4rtzna@4utqnzizwbzx>
X-Rspamd-Queue-Id: 01AD3214CC8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28901-lists,linux-renesas-soc=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 11:13:14PM +0900, Koichiro Den wrote:
> On Thu, Mar 05, 2026 at 08:37:35AM +0100, Niklas Cassel wrote:
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
> > 
> > You could also mention that CX_ATU_MIN_REGION_SIZE can configured to
> > a value in range 4 kB to 64 kB, so 1 MB is clearly bogus.
> > 
> > Reviewed-by: Niklas Cassel <cassel@kernel.org>
> 
> Thanks for the review and follow-up, Niklas.
> 
> (I initially wondered whether the 1MB alignment had some historical reason
> behind it, i.e. an intentional or unavoidable hack, which is why I hesitated to
> add a Fixes tag. But I agree that it is bogus today.)

My best guess:
Since rcar-gen4 previously incorrectly marked the Resizable BARs as
Programmable, and we know that the minumum size for a Resizable BAR is 1 MB...

pci_epf_alloc_space() and pci_epf_align_inbound_addr() would have done the
"right thing" for these incorrectly configured BARs, when putting an incorrect
alignment of 1 MB. (Even if this would result in excessive alignment for the
non-Resizable BARs, e.g. BAR4.)

Now when rcar-gen4 have marked the resizable BARs as resizable,
pci_epf_alloc_space() and pci_epf_align_inbound_addr() will still do the right
thing (ensure 1 MB alignment for the resizable BARs), but will not result in
excessive alignment for the non-Resizable BARs, e.g. BAR4.


Kind regards,
Niklas

