Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B75CF7EEE36
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 10:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234623AbjKQJOe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Nov 2023 04:14:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjKQJOd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2023 04:14:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A91D51;
        Fri, 17 Nov 2023 01:14:29 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A38C433C8;
        Fri, 17 Nov 2023 09:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700212469;
        bh=PC9KD1NJzFJB12TchUtVIkStBkD4NgOLZSmQBaWX3Gw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jI0CAKqVDmdGVBTxkSCgS3DVl9e/H9HEGmW3z7yD3dopHU+lx0k4XEeorbNrP4MeM
         qXAwc+J0Tuk/urmlKN1PwjcTn5/uRMb5z+H/HmOdkcfn79l3hcug3UHFsqIUiW7/1l
         4Doa+y47/WDBE999qj+1xT4Zl8EofWfAsqFz/UvrlGTsSqdPXqxiM7iOis0+iFRQwG
         tLU/tgDk+/wpO17sRLxKu0QFCm1LjUpIp2yS/YlmF4N7jD8mWtBLP15Yb9+A2ofs2C
         MowtLTmGzujM5tiJeO6bxwSPpPOaZ4ZOI8M+kiH4uZYUGAXXK5k6cGHNYa0QgSVxNm
         0Ov7PM7tqgg/Q==
Date:   Fri, 17 Nov 2023 14:44:21 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
        bhelgaas@google.com, jingoohan1@gmail.com,
        gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v2 3/6] PCI: dwc: Rename to .get_dbi_offset in struct
 dw_pcie_ep_ops
Message-ID: <20231117091421.GE250770@thinkpad>
References: <20231114055456.2231990-1-yoshihiro.shimoda.uh@renesas.com>
 <20231114055456.2231990-4-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114055456.2231990-4-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 14, 2023 at 02:54:53PM +0900, Yoshihiro Shimoda wrote:
> Since meaning of .func_conf_select is difficult to understand,
> rename it to .get_dbi_offset.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  .../pci/controller/dwc/pci-layerscape-ep.c    |   5 +-
>  .../pci/controller/dwc/pcie-designware-ep.c   | 108 +++++++++---------
>  drivers/pci/controller/dwc/pcie-designware.h  |   2 +-
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |   4 +-
>  4 files changed, 59 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 4e4b687ef508..961ff1b719a1 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -184,8 +184,7 @@ static int ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	}
>  }
>  
> -static unsigned int ls_pcie_ep_func_conf_select(struct dw_pcie_ep *ep,
> -						u8 func_no)
> +static unsigned int ls_pcie_ep_get_dbi_offset(struct dw_pcie_ep *ep, u8 func_no)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct ls_pcie_ep *pcie = to_ls_pcie_ep(pci);
> @@ -198,7 +197,7 @@ static const struct dw_pcie_ep_ops ls_pcie_ep_ops = {
>  	.init = ls_pcie_ep_init,
>  	.raise_irq = ls_pcie_ep_raise_irq,
>  	.get_features = ls_pcie_ep_get_features,
> -	.func_conf_select = ls_pcie_ep_func_conf_select,
> +	.get_dbi_offset = ls_pcie_ep_get_dbi_offset,
>  };
>  
>  static const struct ls_pcie_ep_drvdata ls1_ep_drvdata = {
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index ea99a97ce504..1100671db887 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -43,14 +43,14 @@ dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
>  	return NULL;
>  }
>  
> -static unsigned int dw_pcie_ep_func_select(struct dw_pcie_ep *ep, u8 func_no)
> +static unsigned int dw_pcie_ep_get_dbi_offset(struct dw_pcie_ep *ep, u8 func_no)
>  {
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  
> -	if (ep->ops->func_conf_select)
> -		func_offset = ep->ops->func_conf_select(ep, func_no);
> +	if (ep->ops->get_dbi_offset)
> +		dbi_offset = ep->ops->get_dbi_offset(ep, func_no);
>  
> -	return func_offset;
> +	return dbi_offset;
>  }
>  
>  static unsigned int dw_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep, u8 func_no)
> @@ -59,8 +59,8 @@ static unsigned int dw_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep, u8 func_no
>  
>  	if (ep->ops->get_dbi2_offset)
>  		dbi2_offset = ep->ops->get_dbi2_offset(ep, func_no);
> -	else if (ep->ops->func_conf_select)     /* for backward compatibility */
> -		dbi2_offset = ep->ops->func_conf_select(ep, func_no);
> +	else if (ep->ops->get_dbi_offset)     /* for backward compatibility */
> +		dbi2_offset = ep->ops->get_dbi_offset(ep, func_no);
>  
>  	return dbi2_offset;
>  }
> @@ -68,14 +68,14 @@ static unsigned int dw_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep, u8 func_no
>  static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
>  				   enum pci_barno bar, int flags)
>  {
> -	unsigned int func_offset, dbi2_offset;
> +	unsigned int dbi_offset, dbi2_offset;
>  	struct dw_pcie_ep *ep = &pci->ep;
>  	u32 reg, reg_dbi2;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  	dbi2_offset = dw_pcie_ep_get_dbi2_offset(ep, func_no);
>  
> -	reg = func_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
> +	reg = dbi_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
>  	reg_dbi2 = dbi2_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
>  	dw_pcie_dbi_ro_wr_en(pci);
>  	dw_pcie_writel_dbi2(pci, reg_dbi2, 0x0);
> @@ -102,16 +102,16 @@ static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie_ep *ep, u8 func_no,
>  		u8 cap_ptr, u8 cap)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	u8 cap_id, next_cap_ptr;
>  	u16 reg;
>  
>  	if (!cap_ptr)
>  		return 0;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
> -	reg = dw_pcie_readw_dbi(pci, func_offset + cap_ptr);
> +	reg = dw_pcie_readw_dbi(pci, dbi_offset + cap_ptr);
>  	cap_id = (reg & 0x00ff);
>  
>  	if (cap_id > PCI_CAP_ID_MAX)
> @@ -127,13 +127,13 @@ static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie_ep *ep, u8 func_no,
>  static u8 dw_pcie_ep_find_capability(struct dw_pcie_ep *ep, u8 func_no, u8 cap)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	u8 next_cap_ptr;
>  	u16 reg;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
> -	reg = dw_pcie_readw_dbi(pci, func_offset + PCI_CAPABILITY_LIST);
> +	reg = dw_pcie_readw_dbi(pci, dbi_offset + PCI_CAPABILITY_LIST);
>  	next_cap_ptr = (reg & 0x00ff);
>  
>  	return __dw_pcie_ep_find_next_cap(ep, func_no, next_cap_ptr, cap);
> @@ -144,23 +144,23 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
>  	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writew_dbi(pci, func_offset + PCI_VENDOR_ID, hdr->vendorid);
> -	dw_pcie_writew_dbi(pci, func_offset + PCI_DEVICE_ID, hdr->deviceid);
> -	dw_pcie_writeb_dbi(pci, func_offset + PCI_REVISION_ID, hdr->revid);
> -	dw_pcie_writeb_dbi(pci, func_offset + PCI_CLASS_PROG, hdr->progif_code);
> -	dw_pcie_writew_dbi(pci, func_offset + PCI_CLASS_DEVICE,
> +	dw_pcie_writew_dbi(pci, dbi_offset + PCI_VENDOR_ID, hdr->vendorid);
> +	dw_pcie_writew_dbi(pci, dbi_offset + PCI_DEVICE_ID, hdr->deviceid);
> +	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_REVISION_ID, hdr->revid);
> +	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_CLASS_PROG, hdr->progif_code);
> +	dw_pcie_writew_dbi(pci, dbi_offset + PCI_CLASS_DEVICE,
>  			   hdr->subclass_code | hdr->baseclass_code << 8);
> -	dw_pcie_writeb_dbi(pci, func_offset + PCI_CACHE_LINE_SIZE,
> +	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_CACHE_LINE_SIZE,
>  			   hdr->cache_line_size);
> -	dw_pcie_writew_dbi(pci, func_offset + PCI_SUBSYSTEM_VENDOR_ID,
> +	dw_pcie_writew_dbi(pci, dbi_offset + PCI_SUBSYSTEM_VENDOR_ID,
>  			   hdr->subsys_vendor_id);
> -	dw_pcie_writew_dbi(pci, func_offset + PCI_SUBSYSTEM_ID, hdr->subsys_id);
> -	dw_pcie_writeb_dbi(pci, func_offset + PCI_INTERRUPT_PIN,
> +	dw_pcie_writew_dbi(pci, dbi_offset + PCI_SUBSYSTEM_ID, hdr->subsys_id);
> +	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_INTERRUPT_PIN,
>  			   hdr->interrupt_pin);
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  
> @@ -243,17 +243,17 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int func_offset, dbi2_offset;
> +	unsigned int dbi_offset, dbi2_offset;
>  	enum pci_barno bar = epf_bar->barno;
>  	size_t size = epf_bar->size;
>  	int flags = epf_bar->flags;
>  	u32 reg, reg_dbi2;
>  	int ret, type;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  	dbi2_offset = dw_pcie_ep_get_dbi2_offset(ep, func_no);
>  
> -	reg = PCI_BASE_ADDRESS_0 + (4 * bar) + func_offset;
> +	reg = PCI_BASE_ADDRESS_0 + (4 * bar) + dbi_offset;
>  	reg_dbi2 = PCI_BASE_ADDRESS_0 + (4 * bar) + dbi2_offset;
>  
>  	if (!(flags & PCI_BASE_ADDRESS_SPACE))
> @@ -337,16 +337,16 @@ static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msi_cap)
>  		return -EINVAL;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
> -	reg = ep_func->msi_cap + func_offset + PCI_MSI_FLAGS;
> +	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSI_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -362,16 +362,16 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msi_cap)
>  		return -EINVAL;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
> -	reg = ep_func->msi_cap + func_offset + PCI_MSI_FLAGS;
> +	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	val &= ~PCI_MSI_FLAGS_QMASK;
>  	val |= FIELD_PREP(PCI_MSI_FLAGS_QMASK, interrupts);
> @@ -387,16 +387,16 @@ static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msix_cap)
>  		return -EINVAL;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
> -	reg = ep_func->msix_cap + func_offset + PCI_MSIX_FLAGS;
> +	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSIX_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -412,7 +412,7 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
> @@ -421,19 +421,19 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  
>  	dw_pcie_dbi_ro_wr_en(pci);
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
> -	reg = ep_func->msix_cap + func_offset + PCI_MSIX_FLAGS;
> +	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_FLAGS;
>  	val = dw_pcie_readw_dbi(pci, reg);
>  	val &= ~PCI_MSIX_FLAGS_QSIZE;
>  	val |= interrupts;
>  	dw_pcie_writew_dbi(pci, reg, val);
>  
> -	reg = ep_func->msix_cap + func_offset + PCI_MSIX_TABLE;
> +	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_TABLE;
>  	val = offset | bir;
>  	dw_pcie_writel_dbi(pci, reg, val);
>  
> -	reg = ep_func->msix_cap + func_offset + PCI_MSIX_PBA;
> +	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_PBA;
>  	val = (offset + (interrupts * PCI_MSIX_ENTRY_SIZE)) | bir;
>  	dw_pcie_writel_dbi(pci, reg, val);
>  
> @@ -514,7 +514,7 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	struct dw_pcie_ep_func *ep_func;
>  	struct pci_epc *epc = ep->epc;
>  	unsigned int aligned_offset;
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	u16 msg_ctrl, msg_data;
>  	u32 msg_addr_lower, msg_addr_upper, reg;
>  	u64 msg_addr;
> @@ -525,22 +525,22 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	if (!ep_func || !ep_func->msi_cap)
>  		return -EINVAL;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
>  	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1. */
> -	reg = ep_func->msi_cap + func_offset + PCI_MSI_FLAGS;
> +	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
>  	msg_ctrl = dw_pcie_readw_dbi(pci, reg);
>  	has_upper = !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
> -	reg = ep_func->msi_cap + func_offset + PCI_MSI_ADDRESS_LO;
> +	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_ADDRESS_LO;
>  	msg_addr_lower = dw_pcie_readl_dbi(pci, reg);
>  	if (has_upper) {
> -		reg = ep_func->msi_cap + func_offset + PCI_MSI_ADDRESS_HI;
> +		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_ADDRESS_HI;
>  		msg_addr_upper = dw_pcie_readl_dbi(pci, reg);
> -		reg = ep_func->msi_cap + func_offset + PCI_MSI_DATA_64;
> +		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_DATA_64;
>  		msg_data = dw_pcie_readw_dbi(pci, reg);
>  	} else {
>  		msg_addr_upper = 0;
> -		reg = ep_func->msi_cap + func_offset + PCI_MSI_DATA_32;
> +		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_DATA_32;
>  		msg_data = dw_pcie_readw_dbi(pci, reg);
>  	}
>  	aligned_offset = msg_addr_lower & (epc->mem->window.page_size - 1);
> @@ -585,7 +585,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	struct dw_pcie_ep_func *ep_func;
>  	struct pci_epf_msix_tbl *msix_tbl;
>  	struct pci_epc *epc = ep->epc;
> -	unsigned int func_offset = 0;
> +	unsigned int dbi_offset = 0;
>  	u32 reg, msg_data, vec_ctrl;
>  	unsigned int aligned_offset;
>  	u32 tbl_offset;
> @@ -597,9 +597,9 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	if (!ep_func || !ep_func->msix_cap)
>  		return -EINVAL;
>  
> -	func_offset = dw_pcie_ep_func_select(ep, func_no);
> +	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
> -	reg = ep_func->msix_cap + func_offset + PCI_MSIX_TABLE;
> +	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_TABLE;
>  	tbl_offset = dw_pcie_readl_dbi(pci, reg);
>  	bir = FIELD_GET(PCI_MSIX_TABLE_BIR, tbl_offset);
>  	tbl_offset &= PCI_MSIX_TABLE_OFFSET;
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 3bc03a93732f..5e36da166ffe 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -344,7 +344,7 @@ struct dw_pcie_ep_ops {
>  	 * return a 0, and implement code in callback function of platform
>  	 * driver.
>  	 */
> -	unsigned int (*func_conf_select)(struct dw_pcie_ep *ep, u8 func_no);
> +	unsigned int (*get_dbi_offset)(struct dw_pcie_ep *ep, u8 func_no);
>  	unsigned int (*get_dbi2_offset)(struct dw_pcie_ep *ep, u8 func_no);
>  };
>  
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 1c017997fb3e..70492f562e48 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -394,7 +394,7 @@ rcar_gen4_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  	return &rcar_gen4_pcie_epc_features;
>  }
>  
> -static unsigned int rcar_gen4_pcie_ep_func_conf_select(struct dw_pcie_ep *ep,
> +static unsigned int rcar_gen4_pcie_ep_get_dbi_offset(struct dw_pcie_ep *ep,
>  						       u8 func_no)
>  {
>  	return func_no * RCAR_GEN4_PCIE_EP_FUNC_DBI_OFFSET;
> @@ -412,7 +412,7 @@ static const struct dw_pcie_ep_ops pcie_ep_ops = {
>  	.deinit = rcar_gen4_pcie_ep_deinit,
>  	.raise_irq = rcar_gen4_pcie_ep_raise_irq,
>  	.get_features = rcar_gen4_pcie_ep_get_features,
> -	.func_conf_select = rcar_gen4_pcie_ep_func_conf_select,
> +	.get_dbi_offset = rcar_gen4_pcie_ep_get_dbi_offset,
>  	.get_dbi2_offset = rcar_gen4_pcie_ep_get_dbi2_offset,
>  };
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
