Return-Path: <linux-renesas-soc+bounces-28677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK3FLvQYpmmeKQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28677-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 00:10:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 249A61E65DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 00:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AB9330B2DC8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 22:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7391A6802;
	Mon,  2 Mar 2026 22:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzzM0hXI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1996D3909B1;
	Mon,  2 Mar 2026 22:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772490712; cv=none; b=FkyRFP0n0dd5CuCEyIld5caua0BLjIFijnfl+wrhlhZujTz/u4I5U947dTr1KiWiWfKokpA4+9INqNLbsq2KwpOkjoG/qVzbT/3IwgNCnw8dbjhLMmwklYGNAql8D343ODXXd3/W1Rjb2GbtXfLYmjEnliofaQXZQqDGlDhSHZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772490712; c=relaxed/simple;
	bh=FXyUDqI+w+73xXcYRSmngbx8XlY8fhEB12BUpd94HdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=k/pBbI58LRzv5Gpx9W+18ZgHj0473Gvl32TsvHdC8t+vILJMvsg0khPELjOLDsZO91HQbHJ0eNT2cIGZ5kMgniLFKlkjCSh2Rkf+ByB4HxEusZEnlxXrP9kUzxslIjtBDkIF+KySwU6fg7+hkU/vy2N7rjfQMtqVCqUpjeXagCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzzM0hXI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C5EC19423;
	Mon,  2 Mar 2026 22:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772490711;
	bh=FXyUDqI+w+73xXcYRSmngbx8XlY8fhEB12BUpd94HdA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=EzzM0hXImSeQz6Y2eQRTwnEtXJ7iiEpoat06jCLZFL2WbeNAmq0rE2D0UdG+Bph3/
	 cTuCeoyVZSf4EVtBUmSC7aL5z+Qaer5fy1fmJhGP3oDmTFalAUSo6a7jJ43kEmW0RA
	 xvnXCQianOoigX9zaqEkEuO6x+8suA1BzS8GIFjpIiylsBAZQW787ZpLyOQcSeIni6
	 E1FsT2Hr3ZNrdYJr1962VbDjORbnMk/h4/gMQG9fyFjW8FiuqPb3tgmGvHRwrrSCEv
	 veFI0i4rzjtTr//pEZOhlFWFNh2+xs9YSNFnr925w0RYoITSMaytFeQp0Hna3J32rk
	 SWPfzIcQodsiA==
Date: Mon, 2 Mar 2026 16:31:50 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, geert+renesas@glider.be,
	magnus.damm@gmail.com, cassel@kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dwc: rcar-gen4-ep: Mark BAR0 and BAR2 as
 Resizable BARs
Message-ID: <20260302223150.GA4022590@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210160315.2272930-1-den@valinux.co.jp>
X-Rspamd-Queue-Id: 249A61E65DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28677-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,renesas.com,kernel.org,google.com,glider.be,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 01:03:15AM +0900, Koichiro Den wrote:
> R-Car Gen4 (S4) implements the PCIe Resizable BAR capability for BAR0 and
> BAR2. Advertise them as BAR_RESIZABLE so EPF-requested BAR sizes are
> reflected to the host.
> 
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes since v1:
>   - Reword commit message only, no code changes.
>   - Rebased onto pci/controller/dwc as of 2026-02-11
> 
> v1: https://lore.kernel.org/linux-pci/20251023072217.901888-1-den@valinux.co.jp
> 
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index a6912e85e4dd..3d4a889e38cc 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -422,7 +422,9 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
>  	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
> +	.bar[BAR_0] = { .type = BAR_RESIZABLE, },
>  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> +	.bar[BAR_2] = { .type = BAR_RESIZABLE, },

I guess the "Resizable" property is not something that is discoverable
at runtime?

You mention the Resizable BAR Capability, so I wondered if the driver
could use that to figure this out.

 * @BAR_RESIZABLE: The BAR implements the PCI-SIG Resizable BAR Capability.
 *                 NOTE: An EPC driver can currently only set a single supported
 *                 size.

Is this comment about the single supported size still accurate?

>  	.bar[BAR_3] = { .type = BAR_RESERVED, },
>  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
>  	.bar[BAR_5] = { .type = BAR_RESERVED, },
> -- 
> 2.51.0
> 

