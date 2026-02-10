Return-Path: <linux-renesas-soc+bounces-28141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CiiH9hPi2nwTwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 16:33:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE3811C7D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 16:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B42A33001F8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 15:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8092DC769;
	Tue, 10 Feb 2026 15:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ioZir31k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDBD2AE78;
	Tue, 10 Feb 2026 15:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770737618; cv=none; b=bzKol1pJVlmdq50nH2wbTou7sYFQxzv1cJmWqvU/GhCvQbCodzF26zHjaz+gp56JrtM/d+gHFuktVV+OhBqXdGRa86NDDLTsfT+SvvJkNEMCm1epyZtRxtSai8IbZQ46eK4iqctGqd11hEZpm2DMObqrN5dTg7bnxkzmy/EZDdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770737618; c=relaxed/simple;
	bh=GFaYYRq44e9+oXgkQza3zdQqRmgOu2fIjBH9AorqALQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sv/93zAFMO6W9e9GxZU9PmAcoYSzHS43OM1ou0h+3BUQvyQVTu8EtseKJTdnOBD9ZOezftITk00ua3XBezJ3g+yg0KPPduf4NAVtGdoGKFRXoDLvKbGT2FtXzwrkGX1oL/Bc5ftE/MxVEwntXxuVQyytn1sHdHySkztZcT6BOPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ioZir31k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C738C116C6;
	Tue, 10 Feb 2026 15:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770737618;
	bh=GFaYYRq44e9+oXgkQza3zdQqRmgOu2fIjBH9AorqALQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ioZir31k0/OMlxyEL+Z5F7df+u/veGdTXTTvoY/M8PlcMAHPpeLbc8ntXhE5XGyEO
	 GsfK4qJYCAOHrZhxZuZZaWlF6YWLIR9hLagu+C21Tj1YKZNojxknjUGCLT6orbXOOg
	 VwGyiWUUMQ5XZTAH5npZHIDyiaWVixx53fB9xc4M+6MJSa5X1u5ALFOteovF4J2QbU
	 AullzyCARmBT20h9QyGTXPNI9/m28oOpjNTTWYC9rrwyeOTwcN7UNJjNs8Ze59jqHY
	 n4L7RwVEXm/1oitX/KQN3pCjJ0YN4UXlbi/JpXyKfSqj8YDZ2qp+i5b0FErrJgPKMb
	 4Porqu4SScsDA==
Date: Tue, 10 Feb 2026 16:33:32 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, geert+renesas@glider.be, magnus.damm@gmail.com
Subject: Re: [PATCH] PCI: dwc: rcar-gen4-ep: Program Resizable BARs and drop
 1MiB BAR limit
Message-ID: <aYtPzCDH7ZEucnjH@ryzen>
References: <20251023072217.901888-1-den@valinux.co.jp>
 <aYsHjNL_c0Z30-KH@ryzen>
 <5kxesjz73i7gpaffna56buhqwmmqrukuyyg4lnlrmbylmmd2qy@756mchjaouz3>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5kxesjz73i7gpaffna56buhqwmmqrukuyyg4lnlrmbylmmd2qy@756mchjaouz3>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28141-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,kernel.org,google.com,glider.be];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8AE3811C7D4
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 12:31:21AM +0900, Koichiro Den wrote:
> On Tue, Feb 10, 2026 at 11:25:16AM +0100, Niklas Cassel wrote:
> > On Thu, Oct 23, 2025 at 04:22:17PM +0900, Koichiro Den wrote:
> > > R-Car Gen4 (S4) exposes BAR0 and BAR2 as Resizable BARs. Program them
> > > accordingly by using dw_pcie_ep_set_bar_resizable() instead of the
> > > programmable BAR path.
> > > 
> > > Before this change the driver left the Resizable BAR capability
> > > untouched and only wrote the BAR register, so the RC enumerated BAR0/2
> > > as 1 MiB regardless of the size requested by the endpoint function. For
> > > example, configuring a 2 MiB window for pci-epf-vntb still produced:
> > > 
> > >   ntb_hw_epf 0000:01:00.0: \
> > >   Size:0x0000000000200000 is greater than the MW size 0x0000000000100000
> > > 
> > > Program the Resizable BAR control so the RC sees the requested size and
> > > ntb_transport can use larger memory windows.
> > > 
> > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > index 80778917d2dd..dbad741b8286 100644
> > > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > @@ -421,7 +421,9 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  
> > >  static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> > >  	.msi_capable = true,
> > > +	.bar[BAR_0] = { .type = BAR_RESIZABLE, },
> > >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > +	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
> > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > >  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
> > >  	.bar[BAR_5] = { .type = BAR_RESERVED, },
> > > -- 
> > > 2.48.1
> > > 
> > 
> > Reviewed-by: Niklas Cassel <cassel@kernel.org>
> > 
> > Considering that this patch has not been picked up yet,
> > perhaps resend it using [PATCH RESEND].
> 
> Thanks for the Reviewed-by. As almost four months have passed, in hindsight the
> commit message sounds a bit too awkward now..
> I'd like to update it to at least remove ntb-specific wording and make it more
> compact and concise, like this:
> 
>   PCI: dwc: rcar-gen4-ep: Mark BAR0 and BAR2 as Resizable BARs
> 
>   R-Car Gen4 (S4) implements the PCIe Resizable BAR capability for BAR0 and
>   BAR2. Advertise them as BAR_RESIZABLE so EPF-requested BAR sizes are
>   reflected to the host.
> 
> If this looks good to you, would it be okay for me to keep the Reviewed-by
> tag? There will be no code changes, only this commit message rewording in
> the RESEND.

Looks good to me, and you can keep the R-b tag, but if you update the
commit message, then you should probably send it as V2.


Kind regards,
Niklas

