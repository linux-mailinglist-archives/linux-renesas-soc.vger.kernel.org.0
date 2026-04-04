Return-Path: <linux-renesas-soc+bounces-30893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CZLKatH0WkyHQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Apr 2026 19:17:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2045439BEE9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Apr 2026 19:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC72530068E7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Apr 2026 17:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327152367CF;
	Sat,  4 Apr 2026 17:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJ4WCcNq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2B313E02A;
	Sat,  4 Apr 2026 17:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775323049; cv=none; b=u9SW7+3C4smB33ZwdPC7+4iCtY3zuKKJ0DySmdrEcatOksB64wfdFNaPVgg1mTZME6/u1N6VhJ5sbxYRNSHSlAidVWkSjUmTPa6svAXBmdHOpIM94Pmw0wheAVLm5Z14AeO5bsXNgvQG7quG0OVYSbatrzEerhT19nIL5J3ebkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775323049; c=relaxed/simple;
	bh=da1o/c7ma2TlBTpWGEu3dVWxcf6TfZVrfN83A7BX1uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qE9nDakYJV/A43NUFwbJYW64U552os38Umg1swIA91/pWaZWWnhNnKoz3YbgWwhhZDjPCjQpNduffFbfxS/Nfv5w8bY2mTiKMHREfxbVkh48lz2FnTzM4lDp7yGXkeeZuLilRZx4tTtANZISVwfUXaa3wcp68Ez01uIjH+MCH6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJ4WCcNq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D858FC19421;
	Sat,  4 Apr 2026 17:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775323048;
	bh=da1o/c7ma2TlBTpWGEu3dVWxcf6TfZVrfN83A7BX1uU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TJ4WCcNqWifc0dOa/DeiVnX47sVhr7gCFPdaEQLs0oDM+uarbvpqPHbo9lCQE3xR1
	 uT3s60c+Rq6993F1Z60Y+DAFKVky2pEcZi6wC9xQKbTlpsrXrJeFBt8+Ti3jokFB2w
	 5ohA1vRgoG3krc529qFJeCrEnR+H24G0jeg9OJ9qzQxV07tKCE/XSmgfRtGzCA9dvd
	 0uhGFSyqoI2nVBap/IxUpRK7oUNxuYEqd2Hb6CIi6yq2V+3VMYCPdcQ5EDCKa1NF33
	 kJC8d4/BlA7ic232+n6hVrjyVDBLte3F/umpIFfac30imgjHehylnCtsiJEU54rkDo
	 39VSuqViwOzmA==
Date: Sat, 4 Apr 2026 22:47:17 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, john.madieu@gmail.com, bhelgaas@google.com, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: rzg3s-host: Treat link-down as -ENODEV instead
 of error
Message-ID: <e7ligkrj2jtak6rqivayvhryhovbjeozbinmu2g43k4b2nz34i@npmvltf7agkq>
References: <20260402182354.12515-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402182354.12515-1-john.madieu.xa@bp.renesas.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,gmail.com,google.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-30893-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2045439BEE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 08:23:53PM +0200, John Madieu wrote:
> rzg3s_pcie_host_init() failing to establish a PCIe link does not
> necessarily indicate a hardware or driver error; it may simply mean no
> card is inserted. Demote the message from dev_err_probe() to dev_info()
> and return -ENODEV so the driver defers gracefully rather than printing
> a spurious error.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes in v2:
>  - Dropped Rb tag from Geert as patch structure changed
>  - Moved link-down handling into rzg3s_pcie_host_init() instead of
>    masking all errors in rzg3s_pcie_host_setup() (Claudiu)
>  - Kept dev_err_probe() for real init failures, only suppress for
>    -ENODEV (link down)
> 
> v1:
>   - https://lore.kernel.org/all/20260401143347.8463-1-john.madieu.xa@bp.renesas.com/
> 
>  drivers/pci/controller/pcie-rzg3s-host.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index d86e7516dcc2..0acc21981ee9 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1384,8 +1384,11 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
>  				 PCIE_LINK_WAIT_SLEEP_MS * MILLI,
>  				 PCIE_LINK_WAIT_SLEEP_MS * MILLI *
>  				 PCIE_LINK_WAIT_MAX_RETRIES);
> -	if (ret)
> +	if (ret) {
> +		dev_info(host->dev, "PCIe link down!\n");
> +		ret = -ENODEV;
>  		goto config_deinit_post;
> +	}
>  
>  	val = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
>  	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
> @@ -1655,7 +1658,9 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
>  
>  	ret = rzg3s_pcie_host_init(host);
>  	if (ret) {
> -		dev_err_probe(dev, ret, "Failed to initialize the HW!\n");
> +		if (ret != -ENODEV)
> +			dev_err_probe(dev, ret, "Failed to initialize the HW!\n");

Well, probe() should not fail in the case of LDn unless the controller doesn't
support hotplug.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

