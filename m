Return-Path: <linux-renesas-soc+bounces-27316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIcIJZc2c2lItAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 09:51:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BA172BA8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 09:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0ACB7300FB7C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 08:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD3D30C626;
	Fri, 23 Jan 2026 08:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2x/rDF+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971132E54DE;
	Fri, 23 Jan 2026 08:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769158292; cv=none; b=cyoMO9zVzQSXkybhoabL5k3HM20uldq1YKqaf82claNMR4t6L5ALNfE7BBLUWQE+yUPICK5w53S6Q8fzMto5P6UQZJ+hxuMu3J2ASp2HkSS3b/mSH80KS3xNdQRl4oqd4Ug+goUZhcGo1oinVkfKdm7tB7XydlFly4VNxiDARl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769158292; c=relaxed/simple;
	bh=uHLu75YU3d5LFuDqYhNdrTluLj4QmEkgMjijx82wFVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAIToSmVChxu6b6IOpDtjudx+XvTjpG+LQ04rj/lCRmdiH+wzal94Lodzx9kvf+y5HgyF30wD/VnqXCNw0lYAxsw/JMMylEbY5VhovvZwmTFH1WGx6QzD1k/tn4F1J55WtfDAThQEb21RuARgqq0/YKmga7DWzoTM9oKeTdU/5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2x/rDF+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F06FC4CEF1;
	Fri, 23 Jan 2026 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769158292;
	bh=uHLu75YU3d5LFuDqYhNdrTluLj4QmEkgMjijx82wFVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2x/rDF+V1S8nsKTuKOnD9QTwc41mF+XW6CEW4Lczf+0Sd6Nq5HQYPZljIkT06Qsr
	 wIpsWwJl7SNWJGjLv6Eul2oOhcXM+uSeslFw7p/fqlD351FGaNP7tTEeORpdakVZ2x
	 TqvkKLgYvEcqDaF0pIhEqdOwsfBiNwfz73XPMMzNpH57FqZjOmS6Ef5yIk1U5pEv3/
	 sDhbSopJR642hfZEnALQcni3Jw5qQtapD3e7lk65oHsqDb0Bur+Ix0+UDcHnBGwPU1
	 //bi+O56i4qSkHisywxprWy1WySWG064VdIew5tpiaTSmeiHZoS4N3KNcwNWuzGqID
	 JclBA/sfEIjRQ==
Date: Fri, 23 Jan 2026 09:51:19 +0100
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
Message-ID: <aXM2hwCrziK2I8OL@ryzen>
References: <20260122084909.2390865-1-den@valinux.co.jp>
 <20260122084909.2390865-5-den@valinux.co.jp>
 <aXHsd7-WWAGyhy_w@ryzen>
 <s6bnqkbuugi7oio7ybekdbk3dokpbe2bui2wjltdwajxix2app@wosgmhrfsriv>
 <19D609EC-F850-4B43-A83C-0B8C70E641B5@kernel.org>
 <l7wknbayighcczjkqfwhbaqrepjtbgxxstgkntoqvnrs7dnm6g@wvmy67ky37pv>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <l7wknbayighcczjkqfwhbaqrepjtbgxxstgkntoqvnrs7dnm6g@wvmy67ky37pv>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27316-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,ti.com,nxp.com,pengutronix.de,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.982];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11BA172BA8
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 10:16:21AM +0900, Koichiro Den wrote:
> >
> > There might be other EPC drivers that don't disable all BARs in their .init(), so I would say that simply checking if the BAR has an address is not sufficient to guarantee that an EPF driver has called set_bar().
> >
>
> Even if an EPC driver does not reset the BAR in their .init() and some
> default translation is left exposed, wouldn't it be safe as long as
> dw_pcie_ep_ib_atu_addr() succeeds in programming inbound mappings for the
> entire BAR?

For e.g. on RK3588, the default HW configuration of the DWC controller has
all 5 BARs as enabled, with a size of 1 GB.

There is no inbound address translation for these BARs by default.

So for it to be safe, the size of the set_bar() call would have to
match the current size of the BAR, but how should the EPF driver know
that when it has not called set_bar() yet?

dw_pcie_ep_read_bar_assigned() does not return the current size of the
BAR. So you can't verify that the set_bar() call has the same size as
the BARs "default size".


>
> That said, such usage apparently contradicts the documented usage (1st
> set_bar with no submap, then with submap) described in the docs and commit
> messages in this series, and allowing it would make things unnecessarily
> complicated. So I agree that adding such a safeguard is the right approach.
>
> >
> > I think the safest option is my second suggestion because then we know that we will only call
> > dw_pcie_ep_ib_atu_addr()
> >
> > When:
> >
> > 1) If ep->epf_bar[bar] is set:
> > https://github.com/torvalds/linux/blob/v6.19-rc6/drivers/pci/controller/dwc/pcie-designware-ep.c#L363
> >
> >
> > 2) All the other requirements to dynamically update a BAR is also met:
> >
> > https://github.com/torvalds/linux/blob/v6.19-rc6/drivers/pci/controller/dwc/pcie-designware-ep.c#L368-L370
> >
>
> That makes sense, and it ensures that the behavior always accords with the
> docs and commit messages in this series.

I think it makes most sense to put the "use_addr_translation = true"

after the check:

		/*
		 * We can only dynamically change a BAR if the new BAR size and
		 * BAR flags do not differ from the existing configuration.
		 */
		if (ep->epf_bar[bar]->barno != bar ||
		    ep->epf_bar[bar]->size != size ||
		    ep->epf_bar[bar]->flags != flags)
			return -EINVAL;


So we know that dw_pcie_ep_ib_atu_addr() is only called when the size is the
same.


Kind regards,
Niklas

