Return-Path: <linux-renesas-soc+bounces-32446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CZtKLLMAmo+wwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 08:46:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0671651B37B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 08:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2214301648B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 06:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79BB368D5A;
	Tue, 12 May 2026 06:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBl4oMHC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ED7384CC8;
	Tue, 12 May 2026 06:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568364; cv=none; b=NTjxI6pSjjLBeFV8MSgRqPxhRJI5t+oHUk1DQxGqJTSFXZCrtTrehsQM2tKBcM+jFMHXuO1676U+BQZkHhXd5Kq48kMONj0JLb96BoqXQ5n4Fl9wkSV68biUR3DwZ5k9+8joq339shJcGEPGxFIfsEJAb/H3w8f7c1agr2lzaP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568364; c=relaxed/simple;
	bh=VAAooZdAHq7yxsPkipwHQqbk+GRu3Iwv5qRj77qUp6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZaTddgdbl3SUeQSse2Phk2TmaHyFOTdnwR8D0Q8OuWEd2X6vjnyC2YWfYIA4ZIju1S0+hs2TZSRI4ZDWGARwwUkfpj74MroIb3NAxumQWHlT+xcRvp5coa/DWS4bTJJoq7Cyq7s55vKzJv49DI2WxrbuBFrRv4WKdFb9X1Sf7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBl4oMHC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200A9C2BCB0;
	Tue, 12 May 2026 06:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778568356;
	bh=VAAooZdAHq7yxsPkipwHQqbk+GRu3Iwv5qRj77qUp6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBl4oMHC/xeme2LpC+JsDfFlC4qgcElZlHpVcAhdFgdYBJmo7FLPtGzHhJMw6v/Qv
	 ncrHHgnpXxabPJ995QP/ITM2pOqsEJjC8BKAeqfW8tt7V5bMI2iS0FxQeJzX3zpvTq
	 ByfBrngaxg7wPt9Yp/nZ+b+PgP33NqZWMKrFfS9WaqdvHAKpFIR/i+M/vOf2WDFgZ/
	 G/nPcberearmfWnTsVVHyAPhoJ0JAvj6aWjsWrq4Qm1PVrUyTrQ7VcveNjMOGiHO8m
	 x70pgldCKqhwspmPyCZylPc0SUzIGP0+XF4doUU7cceDOh0PVv206oSbq31QGWmCSb
	 s9tXrKK5IpsJQ==
Date: Tue, 12 May 2026 12:15:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, bhelgaas@google.com, 
	lpieralisi@kernel.org, vigneshr@ti.com, jingoohan1@gmail.com, 
	thomas.petazzoni@bootlin.com, pali@kernel.org, ryder.lee@mediatek.com, 
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] PCI: dwc: Use common
 pci_host_common_link_train_delay() helper
Message-ID: <6xcq6e6c2jc7wxhvv3kjwp5d2ik62ed7kukb3e62yogf3phtxk@6besox4h2v4n>
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-5-18255117159@163.com>
 <20260511070139.GA1096586@rocinante>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511070139.GA1096586@rocinante>
X-Rspamd-Queue-Id: 0671651B37B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32446-lists,linux-renesas-soc=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 04:02:42PM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> > -	/*
> > -	 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link
> > -	 * speeds greater than 5.0 GT/s, software must wait a minimum of 100 ms
> > -	 * after Link training completes before sending a Configuration Request.
> > -	 */
> > -	if (pci->max_link_speed > 2)
> > -		msleep(PCIE_RESET_CONFIG_WAIT_MS);
> > +	pci_host_common_link_train_delay(pci->max_link_speed);
> 
> This comment could move to the helper you added.
> 

Not required, as the macro definition in drivers/pci/pci.h already has an
elaborative comment with spec citation.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

