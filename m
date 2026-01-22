Return-Path: <linux-renesas-soc+bounces-27269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIQdMbDqcWl6ZAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 10:15:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA01645F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 10:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 87ED86002DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 09:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9DD38A721;
	Thu, 22 Jan 2026 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzS2xZFu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6067033FE17;
	Thu, 22 Jan 2026 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072630; cv=none; b=aD+VR2QM9SfDdL3Co6TEjgbO8wJGGMON1Tqi/NA94rp1H6IlPhIzuBnGo8hOZDlPThuyr4lDXuOVHh8TSCspUmF3kaBylu7T82ZslS4PFAyg4zhbK4Ad+2DZxlL7GRfoaNLvYyOpo/TWB3iyI2Z/uGBAsO9ReWcI30EorTJffVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072630; c=relaxed/simple;
	bh=/MehKJmORgEwpJF+msBgFBXkm59BZbIQr2N6eBZwaBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVZilleJ97NAvbRgk7VgNjTFRg721I1B6lCsgxQ5AuaHnkhBRlIkiw/ou6mW6ZJkVkxcsP49BRQv32js1Rmc2/FEz/OuIuGItRGPnv/A6etfLmtwpBQvjj8f9ZJLPU6svGFnD0hCFxwDi/xVfyB0HVPcvISJyhs8HH2lZwRUbks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzS2xZFu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B24C116C6;
	Thu, 22 Jan 2026 09:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769072627;
	bh=/MehKJmORgEwpJF+msBgFBXkm59BZbIQr2N6eBZwaBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzS2xZFueyQor31YESEgMROI8UCRsNdNneVBo50jCEGgFSMndbkcVLiq094C9Jgwo
	 35xH5C7NvzIFyWXvYPRYokoInGijcOBS0s7kTSD2rs1/MqN9zduYtpaudJCO+JuAqG
	 qcWHYywg7hKt7GdHjeGmWDOUYJB6iwtmm/ueYCQLgRuZFzV2GbCuKXuU2MXYlJakLG
	 aH44EBU6o0ftXLIKcH4ybHu24Fk6i93FHqusQwGGBCq7PliSXGB5LtBmwErA8ofuSI
	 1bNHoT4dAhRVT8PtymGXeVJ7cNMHyPdS0U6tbkBKYlgKT3Kc03EbDVdYMvih9iEmwv
	 v/QGCAMt1Lw/Q==
Date: Thu, 22 Jan 2026 10:03:33 +0100
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
Subject: Re: [PATCH v9 2/5] PCI: endpoint: Add BAR subrange mapping support
Message-ID: <aXHn3zuxxfBN1yps@ryzen>
References: <20260122084909.2390865-1-den@valinux.co.jp>
 <20260122084909.2390865-3-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122084909.2390865-3-den@valinux.co.jp>
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
	TAGGED_FROM(0.00)[bounces-27269-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,valinux.co.jp:email]
X-Rspamd-Queue-Id: 6EA01645F8
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 05:49:06PM +0900, Koichiro Den wrote:
> Some endpoint platforms have only a small number of usable BARs. At the
> same time, EPF drivers (e.g. vNTB) may need multiple independent inbound
> regions (control/scratchpad, one or more memory windows, and optionally
> MSI or other feature-related regions). Subrange mapping allows these to
> share a single BAR without consuming additional BARs that may not be
> available, or forcing a fragile layout by aggressively packing into a
> single contiguous memory range.
> 
> Extend the PCI endpoint core to support mapping subranges within a BAR.
> Add an optional 'submap' field in struct pci_epf_bar so an endpoint
> function driver can request inbound mappings that fully cover the BAR.
> 
> Introduce a new EPC feature bit, subrange_mapping, and reject submap
> requests from pci_epc_set_bar() unless the controller advertises both
> subrange_mapping and dynamic_inbound_mapping features.
> 
> The submap array describes the complete BAR layout (no overlaps and no
> gaps are allowed to avoid exposing untranslated address ranges). This
> provides the generic infrastructure needed to map multiple logical
> regions into a single BAR at different offsets, without assuming a
> controller-specific inbound address translation mechanism.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>

