Return-Path: <linux-renesas-soc+bounces-28800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGUDLC5uqGkkugAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 18:38:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 284CE20542B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 18:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9FC130120FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 17:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A1F35BDAC;
	Wed,  4 Mar 2026 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4awxQI6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C0239A05F;
	Wed,  4 Mar 2026 17:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772645656; cv=none; b=Yy80bVntLG5MKWWgsPena6tU4b5yqjmKeGxkV1YK5x6/8w/vhuVMRiKqyZmmgTDV2FJv56d2QqZb7R/l6KBX5fwPbA9AYZBOtFFhxCPn/jUiJk02FlvLq/+QcQtt2aq3PqgekEYmPAwvfuX23/pTY6YyD+CReqiwiyhyaiN+bkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772645656; c=relaxed/simple;
	bh=/LPKmotmI8lUo2wOICNb9tp9KvlZLh5e3yBDGvs7odI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMaz631I3Xza+vgfafdJq3+PmuDtoBwrXdmNEqvyj568F6cyFhfIcr0NUx2o/AixJB8RGvaNTqeVBf83pjL69y3+NVwxpjNhqONloTHhfss9HTEhJhdZCuPfpKyyyW4gJiu1v1Gm6g4w7oALUGwQCXjq780viuRNzWEpLtIBdrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4awxQI6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B094DC4CEF7;
	Wed,  4 Mar 2026 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772645655;
	bh=/LPKmotmI8lUo2wOICNb9tp9KvlZLh5e3yBDGvs7odI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W4awxQI684hgnexGb8x/nbZK4CZq777X84LG4misRieZ4d417/DBDBb6n5EmrQZ0s
	 5mEYwK5wW/q/g/in5GgDaIdWq2JJYGWfIko2Z6j+7cFFh48ZYrBgNpt3fPdrWkKgBE
	 VbzjAuCdkuAWgV0iK+0+zy8Gh8mFZcpyCXozcdtRk7kGsiQXDKAIrFUAXbLYFd3vVZ
	 nNTjaVFCmo5ERwxoyLcEKHNBHn5vZAqzi4CvYxR5d0Ml0glo3phc3xGHxWfJ9uDgUH
	 R0aKEg1QJ4fTqZfDD9Y99iWFbA4DD2OrMFkfTwEV2JojfAK5MXxK6G0NYL+LdCVNn/
	 BJo15HaPyI9jQ==
Date: Wed, 4 Mar 2026 18:34:09 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Koichiro Den <den@valinux.co.jp>, Bjorn Helgaas <helgaas@kernel.org>,
	marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
	bhelgaas@google.com, geert+renesas@glider.be, magnus.damm@gmail.com,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dwc: rcar-gen4-ep: Mark BAR0 and BAR2 as
 Resizable BARs
Message-ID: <aahtEe3Klcg4QDyJ@ryzen>
References: <20260210160315.2272930-1-den@valinux.co.jp>
 <20260302223150.GA4022590@bhelgaas>
 <ns62mpoyrskr5q3uoy7gfjzideede2xqpixsllwhc3ozkz4us3@ltdzzshbgxla>
 <aag0bu6Me7aUNAdK@ryzen>
 <sreho2ezzdlndgzazx5alj3cx2snli4yemtrhiamjmr2v3myj5@yudnnbek4wbq>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sreho2ezzdlndgzazx5alj3cx2snli4yemtrhiamjmr2v3myj5@yudnnbek4wbq>
X-Rspamd-Queue-Id: 284CE20542B
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
	TAGGED_FROM(0.00)[bounces-28800-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[valinux.co.jp,kernel.org,gmail.com,renesas.com,google.com,glider.be,vger.kernel.org];
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

On Wed, Mar 04, 2026 at 08:04:52PM +0530, Manivannan Sadhasivam wrote:
> > 
> > So this is not something unique to BAR type/sizing scheme, the same arguments,
> > for/against, also applies for msi_capable/msix_capable.
> > 
> > Manivannan, would it be possible to automatically initialize msi/msix_capable
> > on Qcom once a reference is provided, or would this be too late?
> > 
> 
> Yes, with a valid reference clock, it should be possible to read the
> capabilities and detect these. But there is no way we can make sure that the
> reference clock is always be present. Maybe we can do it using a devicetree
> property that you tried upstreaming some time before:
> https://lore.kernel.org/linux-pci/20250425092012.95418-2-cassel@kernel.org

I was thinking something more like, e.g. dw_pcie_ep_init_registers() calling:
1) A function that hides broken features.

2) A function that allocates and initializes features in epc_features.
   E.g. msi_capable = true, msix_capable = true, barX = resizable,
   based on the information it can parse from the capabilities list.

The allocation done in 2) could be dynamically allocated memory, so the
information could be kept even if the reference clock is lost at a later
time.

At least during dw_pcie_ep_init_registers(), I would assume that there is
a reference clock, even when using Common Clock, e.g. as default on Qcom.

Anyway, while I kind of like this idea, it would be a significant change
from the current design.

E.g. pci-epf-test makes use of epc_features already in .bind().
I don't know exactly how e.g. Qcom works, do we know that we will have
a reference clock in .bind() ?  If I remember correctly, we only know that
we have a reference clock in .epc_init(). So this change would also need
to modify all existing EPF drivers to not make use of epc_features in
.bind(), and only make use of epc_features first after .epc_init().

So it sounds like quite a big change. Probably a design we would want if
we designed the PCI endpoint framework today, but doubt it will happen now.


Kind regards,
Niklas

