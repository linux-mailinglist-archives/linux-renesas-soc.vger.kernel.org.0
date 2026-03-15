Return-Path: <linux-renesas-soc+bounces-29415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLltIRLWtmnLJQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 16:53:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E565E29145F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 16:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82B133020D65
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 15:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0191B23BCEE;
	Sun, 15 Mar 2026 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tb0lmEsg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05264207A;
	Sun, 15 Mar 2026 15:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773590031; cv=none; b=JW8oCNLv4dGD2ZqLhROXQ1hlPmuT1Flud7iqBNTQ80/YQRo1i2gTr18SLc7EBh8yddLXYzwH1AmrrEBNFVvKd99MJoKg1AXgFJTQW73vF/zZ0QpOtohyG8tSqEKDfBBrum3NltNpoGNAtTJ5MPW/nSikUL394cVS2dAQzIyjzSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773590031; c=relaxed/simple;
	bh=sBJUn/42jQXjcgTJZg1ONns3jNiKeHur5pQodUtHXhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWEDW5fbOTIRVZL5x6YR95Ju0dMPn+wEYgFcbRL2Ay9KV9qU/9gfupfNAYmcWb3gQ4W79/yPRc6JAwP7B4EBU2G1zKuHaArMJNaOmJyHdqoubsLVTyv4VQPtWviYqvtfDDy6YzzvfSnHzqFGRX5tTHDzX4JAHVRQXbxK6Ze0vK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tb0lmEsg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD0CC4CEF7;
	Sun, 15 Mar 2026 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773590031;
	bh=sBJUn/42jQXjcgTJZg1ONns3jNiKeHur5pQodUtHXhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tb0lmEsgF86rPVPBYaQQD41fqP4GAoTMT2nqjISwL+vx+AagDPKA4u6cgrmFEugL4
	 sMZSb7+rK5TgfGsP9foxf8TVmecJTQHNLjf2pP6uRO53cC9V5Z02FGxtEthk+yTepl
	 RLXf6itluKKOhEREzyZfJ4A7RV1xWDARAdJvEvqnrn1H7c2+xGuijgogVJER6bQQQi
	 TVfXPDqSAt/BRvogDCsD/JG2DKd4lw7eN79MYCe5it9k23Fp/aoSaCMmxKsDonEewR
	 NdwUc8MBIFexrCwNaqwL59IZ9jrueIVsiiJM3o9lB1Dgb/ukOcdBi00NePx1DUBKnu
	 TKuOl0MFEs91g==
Date: Sun, 15 Mar 2026 21:23:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
Subject: Re: [PATCH v8 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe
 controller
Message-ID: <rxb3ym45xd3xtvgghezds6mfocan2d55yhdxjitzhoa6gyjra4@l2xiy5d5mzqy>
References: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
 <20260306143423.19562-13-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260306143423.19562-13-john.madieu.xa@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29415-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,google.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E565E29145F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 06, 2026 at 03:34:19PM +0100, John Madieu wrote:
> Add support for the PCIe controller found in RZ/G3E SoCs to the existing
> RZ/G3S PCIe host driver. The RZ/G3E PCIe controller is similar to the
> RZ/G3S's, with the following key differences:
> 
>  - Supports PCIe Gen3 (8.0 GT/s) link speeds alongside Gen2 (5.0 GT/s)
>  - Uses a different reset control mechanism via AXI registers instead
>    of the Linux reset framework
>  - Requires specific SYSC configuration for link state control and
>    Root Complex mode selection
> 
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> 
> Changes:
> 
> v8: Collected Claudiu's Rb tag
> 
> v7:
>  - Renamed RZG3E_PCI_RESET* defines to RZG3S_PCI_RESET* as these
>    registers are shared with upcoming SoCs (RZ/V2H, RZ/T2N, RZ/N2H),
>    dropped associated "RZ/G3E specific registers" comment
>  - Dropped "RZ/G3E SoC-specific config implementations" comment
>  - Unified function naming to rzg3e_pcie_config_{pre_init,post_init,
>    deinit}() and rzg3s_pcie_config_{post_init,deinit}()
>  - Simplified comments as per Claudiu's suggestions
>  - Used local mask variables for compactness within 80-char limit
>  - Fixed L1_ALLOW error path: goto config_deinit_and_refclk since
>    port refclk is already enabled
>  - Fixed resume: reordered MODE before RST_RSM_B to match probe
>    sequence, fixing error path handling
> 
> v6:
>   - Use rzg3s_sysc_config_func() with per-function calls instead of
>     rzg3s_sysc_config() with -1 skip pattern, as suggested by Claudiu
>   - Extend enum rzg3s_sysc_func_id with L1_ALLOW and MODE entries
>   - Use regmap_update_bits() consistently for all SYSC accesses
>   - Shorten comment to "Put controller in RC mode and de-assert RST_RSM_B."
>   - Drop "Enable ASPM L1 transition" comment (function ID is self-documenting)
> 
> v5:
>   - Introduce rzg3s_sysc_config() helper for sys configuration
> 
> v4: No changes
> v3: No changes
> 
>  drivers/pci/controller/pcie-rzg3s-host.c | 90 ++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 44ce056d62c6..b7f92f5aee4a 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -111,6 +111,15 @@
>  #define RZG3S_PCI_PERM_CFG_HWINIT_EN		BIT(2)
>  #define RZG3S_PCI_PERM_PIPE_PHY_REG_EN		BIT(1)
>  
> +#define RZG3S_PCI_RESET				0x310
> +#define RZG3S_PCI_RESET_RST_OUT_B		BIT(6)
> +#define RZG3S_PCI_RESET_RST_PS_B		BIT(5)
> +#define RZG3S_PCI_RESET_RST_LOAD_B		BIT(4)
> +#define RZG3S_PCI_RESET_RST_CFG_B		BIT(3)
> +#define RZG3S_PCI_RESET_RST_RSM_B		BIT(2)
> +#define RZG3S_PCI_RESET_RST_GP_B		BIT(1)
> +#define RZG3S_PCI_RESET_RST_B			BIT(0)
> +
>  #define RZG3S_PCI_MSIRE(id)			(0x600 + (id) * 0x10)
>  #define RZG3S_PCI_MSIRE_ENA			BIT(0)
>  
> @@ -183,10 +192,14 @@ struct rzg3s_sysc_function {
>  /**
>   * enum rzg3s_sysc_func_id - System controller function IDs
>   * @RZG3S_SYSC_FUNC_ID_RST_RSM_B: RST_RSM_B SYSC function ID
> + * @RZG3S_SYSC_FUNC_ID_L1_ALLOW: L1 allow SYSC function ID
> + * @RZG3S_SYSC_FUNC_ID_MODE: Mode SYSC function ID
>   * @RZG3S_SYSC_FUNC_ID_MAX: Max SYSC function ID
>   */
>  enum rzg3s_sysc_func_id {
>  	RZG3S_SYSC_FUNC_ID_RST_RSM_B,
> +	RZG3S_SYSC_FUNC_ID_L1_ALLOW,
> +	RZG3S_SYSC_FUNC_ID_MODE,
>  	RZG3S_SYSC_FUNC_ID_MAX,
>  };
>  
> @@ -1151,6 +1164,42 @@ static int rzg3s_pcie_config_deinit(struct rzg3s_pcie_host *host)
>  					 host->cfg_resets);
>  }
>  
> +static void rzg3e_pcie_config_pre_init(struct rzg3s_pcie_host *host)
> +{
> +	u32 mask = RZG3S_PCI_RESET_RST_LOAD_B | RZG3S_PCI_RESET_RST_CFG_B;
> +
> +	/* De-assert LOAD_B and CFG_B */
> +	rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_RESET, mask, mask);
> +}
> +
> +static int rzg3e_pcie_config_deinit(struct rzg3s_pcie_host *host)
> +{
> +	writel_relaxed(0, host->axi + RZG3S_PCI_RESET);
> +	return 0;
> +}
> +
> +static int rzg3e_pcie_config_post_init(struct rzg3s_pcie_host *host)
> +{
> +	u32 mask = RZG3S_PCI_RESET_RST_PS_B | RZG3S_PCI_RESET_RST_GP_B |
> +		   RZG3S_PCI_RESET_RST_B;
> +
> +	/* De-assert PS_B, GP_B, RST_B */
> +	rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_RESET, mask, mask);
> +
> +	/*
> +	 * According to the RZ/G3E HW manual (Rev.1.15, Table 6.6-130
> +	 * Initialization Procedure (RC)), hardware requires >= 500us delay
> +	 * before final reset deassert.
> +	 */
> +	fsleep(500);

It is strongly recommended to do a dummy read before adding any delay to make
sure that the previous write got flushed to the hardware and the delay is valid.

So I added a dummy readl_relaxed() before this while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

