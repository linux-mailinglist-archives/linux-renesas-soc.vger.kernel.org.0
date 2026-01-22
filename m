Return-Path: <linux-renesas-soc+bounces-27270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JqvIwDrcWl6ZAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27270-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 10:16:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E42066462C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 10:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C2DE1602550
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 09:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C15387579;
	Thu, 22 Jan 2026 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgCpabng"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4150333ADBE;
	Thu, 22 Jan 2026 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072872; cv=none; b=XRjYmFzjEtBYXysx1nucEYhCepYdqETa5Aj73/NQc+lDWLKAOzJi5OtVWI8zcv4DO8fvmdR8q/bKv4DkAZJHN5nItk6FDUJUXO0uqJn7ER+ofewiKrQEylZjuEqO4LQ5F78jea+ElVgJy77fgG9Zw8M6+RD3FA9uLgWkpjpatjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072872; c=relaxed/simple;
	bh=AgonMyAfa9uiPAYfh9C/Bgq2TL9WZTm/OGzex9FWfw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHYfevWIb7PLsIrGal6ewtFLqn4kmWRmVZHLRnioccnqLYZMb4PcFP9Y0+pl041Dlpwov9PthaE0X1l5OFMNFoJQVQCPOWEsCBr/CqbqBC2070pnvl5dcLOxhNEv2h/eEIpDj8YzODLLTej5h0XmJ04wQV8Y2cM2b8Vx4EVNJJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgCpabng; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850BEC116C6;
	Thu, 22 Jan 2026 09:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769072871;
	bh=AgonMyAfa9uiPAYfh9C/Bgq2TL9WZTm/OGzex9FWfw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hgCpabng6JJHn8xRpFIZe3jTHR9hU+5UBwyWFBOynni6OUUO5/1LoqwoNeWABlfHH
	 gFmvsu+Ub6HroBHFQTsKy+WnxPMz/gQd32yzv35wwosxYpo/r5KPPNHf3S8poDZQ1t
	 HISyuOKpUtPye2gQr26v0sinjWCgnIQYxi5rUZ8wg/pqcqs5ipg8mXkbJumpMhnWR7
	 EXBy2GsYM/M4JjzUfFP3ECw10Z7D8Bfohlp4OSOeSOPVyRSQRir/Lo2mT1CUbha70Z
	 A3+ca+pqctDTrEzrRZ1OKIfJYqzm2ukB26n/6MxUMKSJjmcRWe9D5UpYHAncWnxW3r
	 TwSzrWaOtE4jA==
Date: Thu, 22 Jan 2026 10:07:37 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	vigneshr@ti.com, s-vadapalli@ti.com, hongxing.zhu@nxp.com,
	l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com, roy.zang@nxp.com, jesper.nilsson@axis.com,
	heiko@sntech.de, srikanth.thokala@intel.com,
	marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	christian.bruel@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, thierry.reding@gmail.com,
	jonathanh@nvidia.com, hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org, kishon@kernel.org, jirislaby@kernel.org,
	rongqianfeng@vivo.com, 18255117159@163.com,
	shawn.lin@rock-chips.com, nicolas.frattaroli@collabora.com,
	linux.amoon@gmail.com, vidyas@nvidia.com, Frank.Li@nxp.com,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 5/5] Documentation: PCI: endpoint: Clarify
 pci_epc_set_bar() usage
Message-ID: <aXHo2YDMkMnFb2LI@ryzen>
References: <20260122084909.2390865-1-den@valinux.co.jp>
 <20260122084909.2390865-6-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122084909.2390865-6-den@valinux.co.jp>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27270-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,ti.com,nxp.com,pengutronix.de,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,nxp.com:email,valinux.co.jp:email]
X-Rspamd-Queue-Id: E42066462C
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 05:49:09PM +0900, Koichiro Den wrote:
> The current documentation implies that pci_epc_set_bar() is only used
> before the host enumerates the endpoint.
> 
> In practice, some Endpoint Controllers support calling pci_epc_set_bar()
> multiple times for the same BAR (without clearing it) in order to update
> inbound address translations after the host has programmed the BAR base
> address, which some Endpoint Functions such as vNTB already rely on.
> Add document text for that.
> 
> Also document the expected call flow for BAR subrange mapping
> (pci_epf_bar.num_submap / pci_epf_bar.submap), which may require a
> second pci_epc_set_bar() call after the host has programmed the BAR base
> address.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>

