Return-Path: <linux-renesas-soc+bounces-28844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGfCB90yqWnM2wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 08:38:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EF020CCA6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 08:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2BE1304D654
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 07:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DD4328B61;
	Thu,  5 Mar 2026 07:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+aN0GkL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2305327C1D;
	Thu,  5 Mar 2026 07:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772696261; cv=none; b=dlMEjxvL1ayI6/0U0gImWHBCAxLJe0tKpJl8HoUO19Hk9HQ4R9LaQgR3j1X+bfqVwVkcqZsziEVZdZ2ns0bCosZy476KfToKLQ6i7J6CgmPlWbkPTan2kwMFtKdCzS9bAokYA3givzP21rSz/Wc7Q1zATLrg2r9tJUArB+ZxU2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772696261; c=relaxed/simple;
	bh=I2T2MALFcQPlATqJAknnF/UeTg1MuA4qLIU68kXuTg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrXBxbtdG/tCv2lU80Nye6kxrj59PM1R3CVSFexbJ1EWOJDRU+KVhmE5Xspx/mC1qBAVJAciUgs9gw64+nwAgBWBEfMfUgzUITqHVsyHxvypLcZ5N9K90P+F6zbJv/4n8nFTCLXvxd4gDB7s2lAiWiqh+3hwsFab4eVsnZYa9Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+aN0GkL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185B9C116C6;
	Thu,  5 Mar 2026 07:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772696260;
	bh=I2T2MALFcQPlATqJAknnF/UeTg1MuA4qLIU68kXuTg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L+aN0GkLVW2KCMkKbKCqfUcB+dKaaDxnZ2MOhgObf+ekqk/Yxk3g+zKqPy/Pcg/wA
	 scyE+Nr3E1Vn+dtL3kRqudYuXhumHOhsfmEO7IFc382awdpWkbdQ54MTfwi4IUJmxl
	 IxGkz3H7/C/ppl9FE4PzGMfbYgqBO5ZxeEGiBu/iNwt0JJ1G5YiJuKzLJJKJhQQl+Q
	 rPGv+Nvzb8boUrA2e9sWIxO+zIBCOXoP2/cjd2v1YQiUUDqTRWJaC3ML2ZBQ1TMWL8
	 eW1YkAuqs+8gOEcfefRvFAh5gG4wvwNL3rfBb0UAcz6H1bF2cRB5joWIS23MiwEBQy
	 DvXALyJ4/pQtg==
Date: Thu, 5 Mar 2026 08:37:35 +0100
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
Message-ID: <aakyvxxFnBkl4io5@ryzen>
References: <20260305015439.1529006-1-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305015439.1529006-1-den@valinux.co.jp>
X-Rspamd-Queue-Id: 85EF020CCA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28844-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 10:54:39AM +0900, Koichiro Den wrote:
> R-Car S4 Series (R8A779F[4-7]*) uses a 4K minimum iATU region size
> (CX_ATU_MIN_REGION_SIZE = 4K) as per R19UH0161EJ0130 Rev.1.30.
> 
> Update the advertised alignment to 4K, as described in
> commit 2a9a801620ef ("PCI: endpoint: Add support to specify alignment
> for buffers allocated to BARs").
> 
> With the previous 1MB alignment requirement, iATU programming for BAR4
> on this platform often cannot be performed, since a 1MB-aligned target
> address may fall outside the tiny 256B BAR4 window.

You could also mention that CX_ATU_MIN_REGION_SIZE can configured to
a value in range 4 kB to 64 kB, so 1 MB is clearly bogus.

Reviewed-by: Niklas Cassel <cassel@kernel.org>

