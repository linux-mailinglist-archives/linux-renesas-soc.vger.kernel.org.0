Return-Path: <linux-renesas-soc+bounces-29383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJXAIBhVtGk4kAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 19:19:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B111288A3F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 19:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6CF6630041D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7AA369206;
	Fri, 13 Mar 2026 18:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WkuBmUY5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B753537D0;
	Fri, 13 Mar 2026 18:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773425939; cv=none; b=u2eRhWdZ3ljPwVyhhIzLNbd6MrCCzMlsHM0RrIFBaCyuKJKTNSutS1lUDYiHjS9Kfc3UbZ8O1+0QoELj6t2SdkELV8urmUAaid5ne/w6kyAREdmVEXRn2BpVXQEhBZKD82q7e9IrwyQVlEf4SLP763SJ20tzXSeFIEHl5uQ3p4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773425939; c=relaxed/simple;
	bh=2NXO+yF+55T7F+hpfAb0nuG4E5nybIth2x/Lfeit0v0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XdwrgaZZAJv4G6I2UYoHtplsnchdY864Qi/qvJk+Xqy+XDc4jRVhZloSebu+7pIWdk1cSgcI6A4W80mmNYDf2T47G4VdFANHSMLbCOn4Yf0mcZ9nprQJpDyw3AV55v3l/uRPUJh6/jwUAqjKgtgvcIRDDlihMozx6u9HKWkkcnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WkuBmUY5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49944C19421;
	Fri, 13 Mar 2026 18:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773425939;
	bh=2NXO+yF+55T7F+hpfAb0nuG4E5nybIth2x/Lfeit0v0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=WkuBmUY5zECY4w8HigOp4c5Dc0Y7y2nfHD6yuEYwFaBxRHSoHOnEVTjF7hkT0eQkA
	 AFvQ0/U9ShmNbMyzF+0wQhrhDsQwyNxKjC32q2tl+0EsRInNZqjgNxUjA0SajeBrn6
	 kHFj31oHvk4O5GY8i8NmF5RD6dgQrjiCuW1ZNS0TlFAoxlpUagAwvkYpFuqyVtZphY
	 QVlHtHnRkgjRr9/4FntuZCDQbU9JYgsYDVeDARhaRlMuvQRsZqk8X1fkK1i1jrac4k
	 8sYPWv4uyylodoV2LcLxP/nDTVvuq2bcgK0cxCWY0hcOSstFpl3VMDzH3SGAkgADCP
	 f+nDIUI0cgl7Q==
Date: Fri, 13 Mar 2026 13:18:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: Koichiro Den <den@valinux.co.jp>, jingoohan1@gmail.com, mani@kernel.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
	bhelgaas@google.com, cassel@kernel.org, Frank.Li@nxp.com,
	vigneshr@ti.com, s-vadapalli@ti.com, hongxing.zhu@nxp.com,
	l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com, roy.zang@nxp.com, jesper.nilsson@axis.com,
	heiko@sntech.de, srikanth.thokala@intel.com,
	marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	kishon@kernel.org, jirislaby@kernel.org, rongqianfeng@vivo.com,
	18255117159@163.com, shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com, linux.amoon@gmail.com,
	vidyas@nvidia.com, shuah@kernel.org, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v10 3/8] PCI: dwc: Advertise dynamic inbound mapping
 support
Message-ID: <20260313181858.GA1427542@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2b03ebe-9482-4a13-b22f-7b44da096eed@foss.st.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[valinux.co.jp,gmail.com,kernel.org,google.com,nxp.com,ti.com,pengutronix.de,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-29383-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[56];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2B111288A3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:59:26PM +0100, Christian Bruel wrote:
> Hello,
> 
> While testing after this series, I encountered regressions on the STM32MP2,
> which I am unsure how to fix. The failures depend on the order in which the
> tests are run.

c0f1506f6354 ("PCI: dwc: Advertise dynamic inbound mapping support")
appeared in v7.0-rc1, so apparently we added a regression in v7.0?  Do
we need to revert this?

> The STM32 ATU has 4 inbound entries. After enumeration, the first 4 ATU
> entries are allocated within ib_window_map.
> 
> On the first run of ./pci_endpoint_test -v BAR3(for example),
> SUBRRANGE_SETUP calls dw_pcie_ep_ib_atu_addr(), which frees only one ATU
> entry (BAR3), because we were in the bar_to_atu case, for the first submap
> but fails to allocate the second submap. So the test FAILs.
> 
> On the second run with a different BAR, SUBRRANGE_SETUP test calls
> dw_pcie_ep_ib_atu_addr() again, freeing the required ATU entry (BAR1) and
> successfully using the second ATU entry (3), which was left unallocated by
> the first test. then now the test PASSes
> 
> Therefore, the first invocation of ./pci_endpoint_test on any BAR always
> fails. Other invocations are fine because the first one has left the missing
> necessary ATU entry free. Whatever initial BAR number is used
> 
> I am unsure how to fix this. Always freeing all BARs before calling
> set_bar() in the epf-test seems overkill, but safe.
> I am also considering modifying dw_pcie_ep_clear_ib_maps() to clear N
> num_submap entries even if ib_atu_indexes was not used yet, since only the
> full BAR is used during the first invocation from bar_to_atu. But the
> question is which ATU entry to select ? BAR+1 ?. This seems empirical.
> 
> I am not bothered by test failures due to an insufficient number of BARs
> (this is already the case for BAR5,6), but the fact that the failures depend
> on the test order is frustrating and show a regression.
> 
> But I'm not satisfied with either of the 2 possible fixes mentioned above.
> 
> Do you have any other thought ?
> 
> thank you
> 
> Christian

