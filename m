Return-Path: <linux-renesas-soc+bounces-30383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEWfKkhzxWmN+QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:56:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C503399A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 18:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33C3B31EB070
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 17:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB44421F0B;
	Thu, 26 Mar 2026 17:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEIe77U6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818003446CC;
	Thu, 26 Mar 2026 17:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774546874; cv=none; b=AQvdlWsSmq1ERNOExMUry12fP235WStJQqOcMmAKu8yQnqE4HYTt5uURoQWP3vq6ZC4stYsMTjxyf19J9GtkfL/rFg8BZ+PJU0kPwI7VUA7Jdzgw/ksnuyJd9p8FmiFe6DVGTP9uCG9XrcFIxto3Ai7TEaLgA/rGKjGjnxPPmgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774546874; c=relaxed/simple;
	bh=y2HmnRcLJJ8HS4kuIm9lQr9tyMPyTUtfBDwLVFKrKqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9iT2ziEAXjhbTACtReUuc+l+uQvG2E9DewBr58+bYBiHFLBveejKgipKDJHA8dKo8nldT4nJp0zhaMp2iXVhpNLDCnQXL8RlyOH+MqPZcio7alViWlQ1vRcJ/9Rmgt54wKWOLOdIQs2bUQiqJI/hE/7b2AhIPBsMF0GHk6ybTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEIe77U6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CBCC116C6;
	Thu, 26 Mar 2026 17:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774546873;
	bh=y2HmnRcLJJ8HS4kuIm9lQr9tyMPyTUtfBDwLVFKrKqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GEIe77U6Ip02xX+b0iJGz2iUhHFHIUBzkDmC77AYhSoc8RUWXJnpJr/hV4bVuFzyY
	 xBphxVhSjCjJSE015JYnDTx4sZRgkTNPRY1iC9DTpwLSqhcJQEizXYP5p3Yt7a3Kaw
	 R9qitskxyCRoNFJzme8kGbxp887C9poIjnYH/uJc824LxCdw+UlqTd5Miw1sr2rjtz
	 Gtf3NFPxVRdJEJ2jZFRlQqS9SwoiJBNQALjzWe+6a4xGC0PrhJgth12/kaYjzcKIzr
	 qo19TB6oWmdIHQDgfnRaBN5jea+y88y6UPVCesH1xceAtkOQCB/CcpOm9W4em68pHj
	 WUrCs72uILyCQ==
Date: Thu, 26 Mar 2026 23:10:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>, bhelgaas@google.com, 
	helgaas@kernel.org
Cc: lpieralisi@kernel.org, jingoohan1@gmail.com, kwilczynski@kernel.org, 
	florian.fainelli@broadcom.com, jim2101024@gmail.com, robh@kernel.org, 
	ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	claudiu.beznea.uj@bp.renesas.com, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com
Subject: Re: [PATCH v9 1/5] PCI: Add pcie_get_link_speed() helper for safe
 array access
Message-ID: <yxtwt2gwwasccsfrymnfahn3ruimnpa3noctqbdurei5yzi233@6j5wzkudjrb7>
References: <20260313165522.123518-1-18255117159@163.com>
 <20260313165522.123518-2-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313165522.123518-2-18255117159@163.com>
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
	TAGGED_FROM(0.00)[bounces-30383-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com,google.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,broadcom.com,linux.intel.com,vger.kernel.org,lists.infradead.org,bp.renesas.com,rock-chips.com];
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
X-Rspamd-Queue-Id: 27C503399A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 12:55:18AM +0800, Hans Zhang wrote:
> The pcie_link_speed[] array is indexed by PCIe generation numbers
> (1 = 2.5 GT/s, 2 = 5 GT/s, ...).  Several drivers use it directly,
> which can lead to out-of-bounds accesses if an invalid generation
> number is used.
> 
> Introduce a helper function pcie_get_link_speed() that returns the
> corresponding enum pci_bus_speed value for a given generation number,
> or PCI_SPEED_UNKNOWN if the generation is out of range.  This will
> allow us to safely handle invalid values after the range check is
> removed from of_pci_get_max_link_speed().
> 

Bjorn: Could you please take a look at this patch and ack if looks good? Rest of
the patches look good to me (I might squash patch 5 with 4 while applying).

- Mani

> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/pci.h   |  2 ++
>  drivers/pci/probe.c | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 13d998fbacce..409aca7d737a 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -108,6 +108,8 @@ struct pcie_tlp_log;
>  				 PCI_EXP_DEVCTL_FERE | PCI_EXP_DEVCTL_URRE)
>  
>  extern const unsigned char pcie_link_speed[];
> +unsigned char pcie_get_link_speed(unsigned int speed);
> +
>  extern bool pci_early_dump;
>  
>  extern struct mutex pci_rescan_remove_lock;
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index bccc7a4bdd79..d6592898330c 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -783,6 +783,22 @@ const unsigned char pcie_link_speed[] = {
>  };
>  EXPORT_SYMBOL_GPL(pcie_link_speed);
>  
> +/**
> + * pcie_link_speed_value - Get speed value from PCIe generation number
> + * @speed: PCIe speed (1-based: 1 = 2.5GT, 2 = 5GT, ...)
> + *
> + * Returns the speed value (e.g., PCIE_SPEED_2_5GT) if @speed is valid,
> + * otherwise returns PCI_SPEED_UNKNOWN.
> + */
> +unsigned char pcie_get_link_speed(unsigned int speed)
> +{
> +	if (speed >= ARRAY_SIZE(pcie_link_speed))
> +		return PCI_SPEED_UNKNOWN;
> +
> +	return pcie_link_speed[speed];
> +}
> +EXPORT_SYMBOL_GPL(pcie_get_link_speed);
> +
>  const char *pci_speed_string(enum pci_bus_speed speed)
>  {
>  	/* Indexed by the pci_bus_speed enum */
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

