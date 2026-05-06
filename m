Return-Path: <linux-renesas-soc+bounces-32174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC1BHlRy+2lgbQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:54:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FF84DE63A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6DE0309564B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31E13F54BE;
	Wed,  6 May 2026 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5m2Gt/O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2FD3EF0C0;
	Wed,  6 May 2026 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086291; cv=none; b=s1n0EIcY5inUncGSi335jLE6unoifhceeDuon/zzKGjl0O3kPcddEyorfS+SBD6JNsqnHMWjOjuuldBs7sg1drrdOUlKdwmnZ56c1LybW9PlaUcxHJhl7AVSG+lTsmbnm6esY6cFtpmODT/O9+u9Y8b7Mbg+F+WKn54I20cPaSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086291; c=relaxed/simple;
	bh=2K5E0k7GqmHaKFpr4e85ybCWT1y0qN91EcgSjpPThu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDZUdUwOUCZKEhyepsk5ejROUbP6HsTFXCMwWsvlUBgB0kWXTqdrgBpSDmlvtAXnOAzW6Gbo8ZaNkN6EvvigFE78Tr8lE5QrCWCGW0nuXArcJggd+wFjKvQDfIKDgpibIVWqTBI+A2NEwiS1A/Kte6nGlc6NvIlyBqmPdr2/S/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5m2Gt/O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50D0C2BCC7;
	Wed,  6 May 2026 16:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778086291;
	bh=2K5E0k7GqmHaKFpr4e85ybCWT1y0qN91EcgSjpPThu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5m2Gt/OO1X9cbBX03L+ZmgwGKZk9TL/jelC96b0qzb7PDqRpz7z6PFkXJPx2RJap
	 QDw9p/gXe8lHT43hCVkWxmWKUjpDO69eDmIhBudMKaDBoJatu+IvQyntVyAbP2sDGj
	 6/hBYQ1TIbwEMqfVTJn+0gsoqIJnf9oFTWMF9l9VVOHVIs5uIZmI5wnZ0m1GF/klWk
	 6gA5/KoPyzeMJ9Z9eSPK3LsVkcd/HP2y5jFaILcDI0mTd06EQaKE6bHVsDokxz+kL4
	 UhdHRsvV5OyDOMkFOCU7PYCC4HQjCWq85lw9SQxX2hVmJI16UzZWwGqmS2LZ0LoKOP
	 G9tKqrrD3jNBw==
Date: Wed, 6 May 2026 22:21:20 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com, 
	pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com, 
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] PCI: j721e: Set max_link_speed to enable 100 ms
 delay after link up
Message-ID: <5gx6bpy2i65ij44itdfhlrx3tbrbf2yybmhivryw6rmtwwocyr@ppew2wb4ft47>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-5-18255117159@163.com>
 <rlsvpbo4gcix3mmbfsxvmfebnnn4bqm3cv34x4qkxuv3zwydnm@ehi3el63z664>
 <53e37127-975b-42cd-a1a2-35dd3018c45c@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53e37127-975b-42cd-a1a2-35dd3018c45c@163.com>
X-Rspamd-Queue-Id: D1FF84DE63A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32174-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Thu, May 07, 2026 at 12:11:22AM +0800, Hans Zhang wrote:
> 
> 
> On 5/7/26 00:04, Manivannan Sadhasivam wrote:
> > On Wed, May 06, 2026 at 11:23:42PM +0800, Hans Zhang wrote:
> > > Set cdns_pcie.max_link_speed to the maximum supported link speed
> > > (obtained from the device tree property "max-link-speed") in
> > > j721e_pcie_set_link_speed(). This activates the post-link delay logic
> > > added in cdns_pcie_host_start_link() when the controller supports
> > > speeds greater than 5 GT/s.
> > > 
> > > As required by PCIe r6.0 sec 6.6.1, and following the same approach as
> > > commit 80dc18a0cba8d ("PCI: dwc: Ensure that dw_pcie_wait_for_link()
> > > waits 100 ms after link up"), this ensures a 100 ms delay after link
> > > training completes before any Configuration Request is sent.
> > > 
> > > Signed-off-by: Hans Zhang <18255117159@163.com>
> > > ---
> > >   drivers/pci/controller/cadence/pci-j721e.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> > > index bfdfe98d5aba..ee85b8e04f5b 100644
> > > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > > +++ b/drivers/pci/controller/cadence/pci-j721e.c
> > > @@ -206,6 +206,7 @@ static int j721e_pcie_set_link_speed(struct j721e_pcie *pcie,
> > >   	    (pcie_get_link_speed(link_speed) == PCI_SPEED_UNKNOWN))
> > >   		link_speed = 2;
> > > +	pcie->cdns_pcie.max_link_speed = link_speed;
> > 
> > What about other glue drivers?
> 
> Hi Mani,
> 
> pci-sky1.c:
> There is no time to handle the corresponding DTS yet, and the attribute
> "max-link-speed" has not been parsed either. There will be a plan for the
> subsequent upstream.
> 
> pcie-sg2042.c：
> I'm not familiar with this product.
> 

Since this helper gets called unconditionally for all glue drivers, not setting
'max_link_speed' would cause 100ms delay for all link speeds.

So either set 'max_link_speed' for all drivers, or call the helper directly from
glue drivers.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

