Return-Path: <linux-renesas-soc+bounces-32452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCWtKHfTAmrPxwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32452-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 09:15:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C88551B97D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 09:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E3C3301A992
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 07:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B4E478E5D;
	Tue, 12 May 2026 07:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+IycF6/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9DB4418F0;
	Tue, 12 May 2026 07:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778570098; cv=none; b=rlY7FyS4hETruthHVZfwN4SiqRG375ttnAMX+XDivwWkxntdWkDw/l1gumkr8CEaFKCY10taq1L3U7Ia+CstsMXd34qUyTXOrHRJKrj0eMSiKpU2SaA+l1c9Rp29il12iYTgjLI3e5c0q2KxBMMmFrL3cgUQQXbdI0c9TeJ5a0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778570098; c=relaxed/simple;
	bh=1Q4A1Q+QYp9tlNCUSo8+pB11jnBSTmWLxUPJejRy7uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjC8dHcnJOZ1rVD074QEPGkEkR5W72K7TL6Ek18H/vd5JJjfgYqZmTiBBz4cxw9jurWE13W2fIRYNOVWGzHuF+4cFC1rlR3cfNt60jP5I4/9OPlMWJsvu+wYXnxtLFmxG2frg+gd+oFHCNNzoz6mIj5fvWB+PWBp/QBWrCuoKfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+IycF6/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345A6C2BCB0;
	Tue, 12 May 2026 07:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778570097;
	bh=1Q4A1Q+QYp9tlNCUSo8+pB11jnBSTmWLxUPJejRy7uQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+IycF6/JGxzaOmea/L7dX3YcYpWRMeQYigppxCWGK83fhXhnd68xPVSnAukYO+nx
	 KbpGO1P7ZrH95D5TyETTmw+U6JPP1+uCTHisELA/u85SDJ8aRbSYnQ0DecYxtisUTW
	 eJwSo+3seiEYf0ZkVDU4QcXChUJQffuvrri27Mxzt+hg7TjVQJ8EtE3xVEDd5brHNP
	 pJlIImkgCx1rQCJ8UmZOn3f7y+KalI/iVKA3nBVLjIajgnKeJHa6w3wtznloOnCIiz
	 G2tfifp1WmFmLEUE187xCIe37mjVZibLWJ0Z0HewQDTOHE87iunynKyKk25thuVd9Y
	 ljG+Hf52MbVXw==
Date: Tue, 12 May 2026 16:14:55 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, bhelgaas@google.com, 
	lpieralisi@kernel.org, vigneshr@ti.com, jingoohan1@gmail.com, 
	thomas.petazzoni@bootlin.com, pali@kernel.org, ryder.lee@mediatek.com, 
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] PCI: dwc: Use common
 pci_host_common_link_train_delay() helper
Message-ID: <20260512071423.GB3606279@rocinante>
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-5-18255117159@163.com>
 <20260511070139.GA1096586@rocinante>
 <6xcq6e6c2jc7wxhvv3kjwp5d2ik62ed7kukb3e62yogf3phtxk@6besox4h2v4n>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6xcq6e6c2jc7wxhvv3kjwp5d2ik62ed7kukb3e62yogf3phtxk@6besox4h2v4n>
X-Rspamd-Queue-Id: 3C88551B97D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32452-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[163.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com,vger.kernel.org,lists.infradead.org,tuxon.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kwilczynski@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hello,

> > > -	/*
> > > -	 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link
> > > -	 * speeds greater than 5.0 GT/s, software must wait a minimum of 100 ms
> > > -	 * after Link training completes before sending a Configuration Request.
> > > -	 */
> > > -	if (pci->max_link_speed > 2)
> > > -		msleep(PCIE_RESET_CONFIG_WAIT_MS);
> > > +	pci_host_common_link_train_delay(pci->max_link_speed);
> > 
> > This comment could move to the helper you added.
> > 
> 
> Not required, as the macro definition in drivers/pci/pci.h already has an
> elaborative comment with spec citation.

So it does, indeed.  Thank you for checking!

	Krzysztof

