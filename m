Return-Path: <linux-renesas-soc+bounces-27309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP+ELp9fcmnbjAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 18:34:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AE96B683
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 18:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4AAC305C53E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 17:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2126C3994DA;
	Thu, 22 Jan 2026 16:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WK8Qdiy+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88298357A29;
	Thu, 22 Jan 2026 16:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101162; cv=none; b=GoGyk6Q7P3doZhoCvzLekpVxjn+jfRyZH4GK70MSfGNFCwqOgInrwLifpTq8993ytI/N7e3iJjWqiHqlQ9obOBtj19rpARUpIXVUJkIT++mnWTezaLB/InzevbkJLJVhEVDlhJQ5DXtIiLoJsZOyVlLj/VAo/3MjiUK0FxyQqfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101162; c=relaxed/simple;
	bh=J5VqdBfB3qJLKokwNzHgugj/xR5O2h1qw7xFVlfjZa4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=kdVv66cO9V25zknpSrBPGzvo/bTFhjspeHbx0Xr4Uvgz8dqhdjBf2UtAmW9Nc7k9YPGZvQz57y1WD84lME4Of3Jzm1Burw08Dv8ISPf4trnAzlucasSRIpFqbVUoKS8PBfExv7Dg/2pQhGvv7FO4HCds2IBqe2HdQg2tDzgH1Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WK8Qdiy+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E2BC116D0;
	Thu, 22 Jan 2026 16:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101161;
	bh=J5VqdBfB3qJLKokwNzHgugj/xR5O2h1qw7xFVlfjZa4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=WK8Qdiy+OYob7AaCGw51BnlD5QnCxxjuxB5EckU4dxg2pceWfpf2hxcKJkAGzgwFv
	 OYvOTfFdeWLftjTHM3KIMbaNG3YhhMm3cp18/6v/6az/gI/YGsh+WTX1ANIJxUNjYh
	 cl/mjuaSdgT3rWYuCgUTf6UHnlg/1tRcJrYbOBdEOp6sNTpKOEKcgzWV5UUBmJd0NX
	 F4SohSFUcSgon4U5tz/wv89xMjr8qloLQOeEn/d6QBDjT0SbWdWqo9mkOmFYG0Sf7l
	 MKr9b6ddz/dSiwuBXDx4us3AZ2sp9epXfvMoT66uX2n8zu/GB8+2jbN0aSSOs+eDIg
	 xXk9RSb1r82KA==
Date: Thu, 22 Jan 2026 17:59:18 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
CC: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
 vigneshr@ti.com, s-vadapalli@ti.com, hongxing.zhu@nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, minghuan.Lian@nxp.com,
 mingkai.hu@nxp.com, roy.zang@nxp.com, jesper.nilsson@axis.com,
 heiko@sntech.de, srikanth.thokala@intel.com, marek.vasut+renesas@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
 magnus.damm@gmail.com, christian.bruel@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 hayashi.kunihiko@socionext.com, mhiramat@kernel.org, kishon@kernel.org,
 jirislaby@kernel.org, rongqianfeng@vivo.com, 18255117159@163.com,
 shawn.lin@rock-chips.com, nicolas.frattaroli@collabora.com,
 linux.amoon@gmail.com, vidyas@nvidia.com, Frank.Li@nxp.com,
 linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v9_4/5=5D_PCI=3A_dwc=3A_ep=3A_Support_BAR_sub?=
 =?US-ASCII?Q?range_inbound_mapping_via_Address_Match_Mode_iATU?=
User-Agent: Thunderbird for Android
In-Reply-To: <s6bnqkbuugi7oio7ybekdbk3dokpbe2bui2wjltdwajxix2app@wosgmhrfsriv>
References: <20260122084909.2390865-1-den@valinux.co.jp> <20260122084909.2390865-5-den@valinux.co.jp> <aXHsd7-WWAGyhy_w@ryzen> <s6bnqkbuugi7oio7ybekdbk3dokpbe2bui2wjltdwajxix2app@wosgmhrfsriv>
Message-ID: <19D609EC-F850-4B43-A83C-0B8C70E641B5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.55 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,ti.com,nxp.com,pengutronix.de,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27309-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7AE96B683
X-Rspamd-Action: no action

On 22 January 2026 15:29:02 CET, Koichiro Den <den@valinux=2Eco=2Ejp> wrote=
:
>
>> To make sure that dw_pcie_ep_ib_atu_addr() cannot be called without alr=
eady
>> having a BAR configured, to we perhaps want something like:
>
>Thanks for the review=2E
>Isn't the existing guard in dw_pcie_ep_ib_atu_addr sufficient?
>
>        [=2E=2E=2E]
>        base =3D dw_pcie_ep_read_bar_assigned(ep, func_no, bar, epf_bar->=
flags);
>        if (!base) {
>                dev_err(dev,
>                        "BAR%u not assigned, cannot set up sub-range mapp=
ings\n",
>                        bar);
>                return -EINVAL;
>        }
>

Well, for a driver that does not call dw_pcie_ep_reset_bar() in their =2Ei=
nit() to disable all BARs that are enabled in the controller by default, th=
e host side will assign an PCI address even if no EPF has called set_bar() =
on that BAR=2E

See e=2Eg=2E
https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/pci/pci=2Egit/commit/d=
rivers/pci/controller/dwc/pcie-tegra194=2Ec?h=3Dcontroller/dwc&id=3D42f9c66=
a6d0cc45758dab77233c5460e1cf003df

There might be other EPC drivers that don't disable all BARs in their =2Ei=
nit(), so I would say that simply checking if the BAR has an address is not=
 sufficient to guarantee that an EPF driver has called set_bar()=2E


I think the safest option is my second suggestion because then we know tha=
t we will only call
dw_pcie_ep_ib_atu_addr()

When:

1) If ep->epf_bar[bar] is set:
https://github=2Ecom/torvalds/linux/blob/v6=2E19-rc6/drivers/pci/controlle=
r/dwc/pcie-designware-ep=2Ec#L363


2) All the other requirements to dynamically update a BAR is also met:

https://github=2Ecom/torvalds/linux/blob/v6=2E19-rc6/drivers/pci/controlle=
r/dwc/pcie-designware-ep=2Ec#L368-L370



Kind regards,
Niklas


