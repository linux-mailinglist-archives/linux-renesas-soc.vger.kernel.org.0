Return-Path: <linux-renesas-soc+bounces-32157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECZ0BdZn+2llawMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:09:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEBD4DDE3B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAA0D307EC72
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F243F7888;
	Wed,  6 May 2026 16:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rErI/Xa/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD373F23B5;
	Wed,  6 May 2026 16:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083412; cv=none; b=ZD4IDqgFDH0SxTD+SloEPnSWLIAFbTAK7E2bseeXv8NBwimrGIXAABu8mAOSsZRYTmLwc2T+Ahqa091T1A4hSVOUgHaXrJqGLO1RBFMZjtJvcyqshMX7Kr/1e/PN8jvXbiQ3ERdthLvAlYBXVqR8+BDFNaHQb4PFHYNJzLXZgl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083412; c=relaxed/simple;
	bh=D7wD6AzQrfQznPONV9GRM3q9KpiebSKEPsnKHA4ZTg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcjOEAoVWnbndlJtCVZZyxbzrBMRezs1CiGZXWPfMp2XQnF0RfXWFmfT83EEZ4galaM4eg8Y6YCswQz+ATU7zC63nIy9djwmbl1QoWGBKg9KIetgqchGS/GQRFmnK5JkS4+txeo6pvcA+iNpttnMiK+ZM+1xJ/mJwok5uJyPDwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rErI/Xa/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DA5C2BCB0;
	Wed,  6 May 2026 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778083410;
	bh=D7wD6AzQrfQznPONV9GRM3q9KpiebSKEPsnKHA4ZTg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rErI/Xa/Sz0vIh+pL7XfyNJMZYTiQrj/hBdSpM4Tz7W6bsYY6WwTXAlSV+KHa7b0F
	 KGnevHCvYPNuBWT8voXSIYzlkTEoNi6zB/PKxDq+4xKYo4TIDAOyG4KLGOVkY2EGcp
	 PYxctxHRTEIqJiH/YmgF14GoBiiRWYCdoVTdb6q8ZUDqvruBa9xMWnaQ30Wff3gLNn
	 YejsgZua3jATErmQAkcK+i9TIBk95Gtjyd/rb8Sbj4HHroO2CnEWrbarj0CfiHd6B+
	 TO5al7zrda2resDqCebdMiDvkkSGV/kUTsqbnmPAJV3JTAP0TI4XUIyPIpHx8X/M7E
	 0EAnbDC1Jk+0g==
Date: Wed, 6 May 2026 21:33:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com, 
	pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com, 
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and
 100 ms delay after link training
Message-ID: <jmqw5tmgbpou5lanjcnolrpmipgnny6chm53wqybtqg4epfuql@cxqryplrmylk>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-3-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506152346.166056-3-18255117159@163.com>
X-Rspamd-Queue-Id: ADEBD4DDE3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32157-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com,vger.kernel.org,lists.infradead.org];
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

On Wed, May 06, 2026 at 11:23:40PM +0800, Hans Zhang wrote:
> The Cadence LGA (Legacy Architecture IP) PCIe host controller currently
> lacks the mandatory 100 ms delay after link training completes for speeds
> > 5.0 GT/s, as required by PCIe r6.0 sec 6.6.1.
> 
> Add a 'max_link_speed' field to struct cdns_pcie to record the maximum
> supported link speed (or the currently configured speed). In the common
> host layer function cdns_pcie_host_start_link(), after the link has been
> successfully established, call pcie_wait_after_link_train() to insert the
> required delay if max_link_speed > 2.
> 
> Glue drivers must set max_link_speed appropriately (e.g., from the device
> tree property "max-link-speed") to enable the delay.
> 

You need to club those glue driver patches into this one. Otherwise, you'll end
up breaking bisectability.

- Mani

> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/controller/cadence/pcie-cadence-host-common.c | 4 ++++
>  drivers/pci/controller/cadence/pcie-cadence.h             | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-common.c b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
> index 2b0211870f02..51376f69d007 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
> @@ -14,6 +14,7 @@
>  
>  #include "pcie-cadence.h"
>  #include "pcie-cadence-host-common.h"
> +#include "../../pci.h"
>  
>  #define LINK_RETRAIN_TIMEOUT HZ
>  
> @@ -115,6 +116,9 @@ int cdns_pcie_host_start_link(struct cdns_pcie_rc *rc,
>  	if (!ret && rc->quirk_retrain_flag)
>  		ret = cdns_pcie_retrain(pcie, pcie_link_up);
>  
> +	if (!ret)
> +		pcie_wait_after_link_train(pcie->max_link_speed);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(cdns_pcie_host_start_link);
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
> index 574e9cf4d003..e222b095d2b6 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.h
> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
> @@ -86,6 +86,7 @@ struct cdns_plat_pcie_of_data {
>   * @ops: Platform-specific ops to control various inputs from Cadence PCIe
>   *       wrapper
>   * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
> + * @max_link_speed: maximum supported link speed
>   */
>  struct cdns_pcie {
>  	void __iomem		             *reg_base;
> @@ -98,6 +99,7 @@ struct cdns_pcie {
>  	struct device_link	             **link;
>  	const  struct cdns_pcie_ops          *ops;
>  	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
> +	int				     max_link_speed;
>  };
>  
>  /**
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

