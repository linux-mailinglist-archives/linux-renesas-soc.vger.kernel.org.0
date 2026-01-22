Return-Path: <linux-renesas-soc+bounces-27272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKn5OATucWlaZwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27272-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 10:29:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0D8648CB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 10:29:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D7E2C509A31
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 09:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D600E365A0D;
	Thu, 22 Jan 2026 09:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/d07n/X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5662835F8BD;
	Thu, 22 Jan 2026 09:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073798; cv=none; b=QXYk9FcuXVJp6Nm5NjgfUq1NFFZvPPjBl61HXMBbb3918/z9MO9YnlnBhvYel006qs+/E4HzUGV1K4vMoSYA20hrfZ4Wk+JkLr4xwK97gpa/iNQT7/0ODwxRSzfYRUZw9H53XggJqwDuq96Mw5HSTp/uB75k+QjWJV+ycZXkpzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073798; c=relaxed/simple;
	bh=yJdKxIhYOUpUaBpsLGMKL4pD24z5wQ6BB3Ktu++YZqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOu+NIpgDgDa2sAFBOsTTZFgWHBFM/cqxUOIs9HgBgs6wB6Mstik5tzogHMDb93qWtNpFvcOv330BUbyLul6WopWCGGeGSAmR+3gQgFFhNQ6N0xJwm4UK3UO/L6d2SFc62/5I/WNoyDdNZxtEaw9PyoUQ36RVo/Z/dQgoFfKzb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/d07n/X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884DDC19423;
	Thu, 22 Jan 2026 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769073797;
	bh=yJdKxIhYOUpUaBpsLGMKL4pD24z5wQ6BB3Ktu++YZqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/d07n/XiyO/GYZA1Yd61IttxQ1mcR7bpCASWYbyei4lGJrH3PzHwefIKkxhhG09v
	 s9iROZk+AcPE1TdQ6wq2CuzVLOdZLG00uls+kKsGdO7o2a835s1hR7nfr3lHNKxahc
	 WInb/vUcRfD54E3+d9LLeGUTAFbeRlunWUOAe7Sg475DZoOrmt5E9Y11BEfWsTnxEA
	 jcCrYjAyE3xNwG+HYbDG5Sk3kA5856FxsG5fQfOuOxTSCbemYdcpjucRZIE2C2vRE4
	 iENgMKmwOc/YEnCZixdTiAK1LlKU1woO2U5+vPN+6Mvz69683ULDROGOXRqdESB3gr
	 dFtW0t7lKni2Q==
Date: Thu, 22 Jan 2026 10:23:03 +0100
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
Subject: Re: [PATCH v9 4/5] PCI: dwc: ep: Support BAR subrange inbound
 mapping via Address Match Mode iATU
Message-ID: <aXHsd7-WWAGyhy_w@ryzen>
References: <20260122084909.2390865-1-den@valinux.co.jp>
 <20260122084909.2390865-5-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122084909.2390865-5-den@valinux.co.jp>
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
	TAGGED_FROM(0.00)[bounces-27272-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,valinux.co.jp:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B0D8648CB
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 05:49:08PM +0900, Koichiro Den wrote:
> Extend dw_pcie_ep_set_bar() to support inbound mappings for BAR
> subranges using Address Match Mode IB iATU when pci_epf_bar.num_submap
> is non-zero.
> 
> Rename the existing BAR-match helper into dw_pcie_ep_ib_atu_bar() and
> introduce dw_pcie_ep_ib_atu_addr() for Address Match Mode. When
> num_submap is non-zero, read the assigned BAR base address and program
> one inbound iATU window per subrange. Validate the submap array before
> programming:
> - each subrange is aligned to pci->region_align
> - subranges cover the whole BAR (no gaps and no overlaps)
> - subranges are sorted in ascending order by offset
> 
> Track Address Match Mode mappings and tear them down on clear_bar() and
> on set_bar() error paths to avoid leaving half-programmed state or
> untranslated BAR holes.
> 
> Advertise this capability by extending the common feature bit
> initializer macro (DWC_EPC_COMMON_FEATURES).
> 
> This enables multiple inbound windows within a single BAR, which is
> useful on platforms where usable BARs are scarce but EPFs need multiple
> inbound regions.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---


> @@ -331,6 +503,13 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  		    ep->epf_bar[bar]->flags != flags)
>  			return -EINVAL;
>  
> +		/*
> +		 * When dynamically changing a BAR, tear down any existing
> +		 * mappings before re-programming.
> +		 */
> +		if (ep->epf_bar[bar]->num_submap || epf_bar->num_submap)
> +			dw_pcie_ep_clear_ib_maps(ep, bar);
> +
>  		/*
>  		 * When dynamically changing a BAR, skip writing the BAR reg, as
>  		 * that would clear the BAR's PCI address assigned by the host.
> @@ -369,8 +548,12 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	else
>  		type = PCIE_ATU_TYPE_IO;
>  
> -	ret = dw_pcie_ep_inbound_atu(ep, func_no, type, epf_bar->phys_addr, bar,
> -				     size);
> +	if (epf_bar->num_submap)
> +		ret = dw_pcie_ep_ib_atu_addr(ep, func_no, type, epf_bar);
> +	else
> +		ret = dw_pcie_ep_ib_atu_bar(ep, func_no, type,
> +					    epf_bar->phys_addr, bar, size);

If someone calls set_bar() with a submap, without having called set_bar() first
without a submap, we will still call dw_pcie_ep_ib_atu_addr() here.

To make sure that dw_pcie_ep_ib_atu_addr() cannot be called without already
having a BAR configured, to we perhaps want something like:

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 0567552b784c..fe26b7f7b212 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -487,6 +487,9 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
        if ((flags & PCI_BASE_ADDRESS_MEM_TYPE_64) && (bar & 1))
                return -EINVAL;
 
+       if (!ep->epf_bar[bar] && epf_bar->num_submap)
+               return -EINVAL;
+
        /*
         * Certain EPF drivers dynamically change the physical address of a BAR
         * (i.e. they call set_bar() twice, without ever calling clear_bar(), as


or


diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 0567552b784c..8aeaa6fe53f9 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -475,6 +475,7 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
        struct dw_pcie_ep *ep = epc_get_drvdata(epc);
        struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
        enum pci_barno bar = epf_bar->barno;
+       bool use_addr_match_mode = false;
        size_t size = epf_bar->size;
        enum pci_epc_bar_type bar_type;
        int flags = epf_bar->flags;
@@ -510,6 +511,9 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
                if (ep->epf_bar[bar]->num_submap || epf_bar->num_submap)
                        dw_pcie_ep_clear_ib_maps(ep, bar);
 
+               if (epf_bar->num_submap)
+                       use_addr_match_mode = true;
+
                /*
                 * When dynamically changing a BAR, skip writing the BAR reg, as
                 * that would clear the BAR's PCI address assigned by the host.
@@ -548,7 +552,7 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
        else
                type = PCIE_ATU_TYPE_IO;
 
-       if (epf_bar->num_submap)
+       if (use_addr_match_mode)
                ret = dw_pcie_ep_ib_atu_addr(ep, func_no, type, epf_bar);
        else
                ret = dw_pcie_ep_ib_atu_bar(ep, func_no, type,

