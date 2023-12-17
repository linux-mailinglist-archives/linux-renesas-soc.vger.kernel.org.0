Return-Path: <linux-renesas-soc+bounces-1167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16800816063
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 17:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C310C2824E2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Dec 2023 16:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E8914266;
	Sun, 17 Dec 2023 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzWI1IvE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889E345BED;
	Sun, 17 Dec 2023 16:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15680C433C8;
	Sun, 17 Dec 2023 16:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702830854;
	bh=tjciZHedxSNHyxizsH3VkAi9eTC9SeqtY6Lb5MIzFfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZzWI1IvEXFRs2mV88K9D32EcI7TRICJa4lFbkd2OnYft80XWJkyUemLlnNaMXpgOa
	 hv+8IGJwm3DN160HM3I9QK5K606PfVezHmQBc30P2BDdlc7LvKL1kDLoC0vAjhjq8W
	 CwfdckTnfmyuEQmgGGmNuXc8YvRII955xIKo3OtJUecHJ2TGlfYWzycFEYZql/z9HS
	 eCSOyGSc/qSoc5rmQzf6kIkSehCqDV6DhJ8OqVbEX3dm3pPYKq296gj8ma4di8ckDz
	 VCxcPIlDZfv+krHk5/iVib0IVqHaPyDd8zPJVtcwDpfXhtfBWK+HlZliiWu7pgl/6n
	 G49t9T4HpP1TQ==
Date: Sun, 17 Dec 2023 22:04:04 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com,
	gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v3 4/6] PCI: dwc: Add dw_pcie_ep_{read,write}_dbi[2]
 helpers
Message-ID: <20231217163404.GB6748@thinkpad>
References: <20231215022955.3574063-1-yoshihiro.shimoda.uh@renesas.com>
 <20231215022955.3574063-5-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231215022955.3574063-5-yoshihiro.shimoda.uh@renesas.com>

On Fri, Dec 15, 2023 at 11:29:53AM +0900, Yoshihiro Shimoda wrote:
> The current code calculated some dbi[2] registers' offset by calling
> dw_pcie_ep_get_dbi[2]_offset() in each function. To improve code
> readability, add dw_pcie_ep_{read,write}_dbi[2} and some data-width
> related helpers.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  .../pci/controller/dwc/pcie-designware-ep.c   | 184 ++++++------------
>  drivers/pci/controller/dwc/pcie-designware.h  |  93 +++++++++
>  2 files changed, 153 insertions(+), 124 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 1100671db887..3ab03c0c14c0 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -43,46 +43,19 @@ dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
>  	return NULL;
>  }
>  
> -static unsigned int dw_pcie_ep_get_dbi_offset(struct dw_pcie_ep *ep, u8 func_no)
> -{
> -	unsigned int dbi_offset = 0;
> -
> -	if (ep->ops->get_dbi_offset)
> -		dbi_offset = ep->ops->get_dbi_offset(ep, func_no);
> -
> -	return dbi_offset;
> -}
> -
> -static unsigned int dw_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep, u8 func_no)
> -{
> -	unsigned int dbi2_offset = 0;
> -
> -	if (ep->ops->get_dbi2_offset)
> -		dbi2_offset = ep->ops->get_dbi2_offset(ep, func_no);
> -	else if (ep->ops->get_dbi_offset)     /* for backward compatibility */
> -		dbi2_offset = ep->ops->get_dbi_offset(ep, func_no);
> -
> -	return dbi2_offset;
> -}
> -
>  static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
>  				   enum pci_barno bar, int flags)
>  {
> -	unsigned int dbi_offset, dbi2_offset;
>  	struct dw_pcie_ep *ep = &pci->ep;
> -	u32 reg, reg_dbi2;
> -
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -	dbi2_offset = dw_pcie_ep_get_dbi2_offset(ep, func_no);
> +	u32 reg;
>  
> -	reg = dbi_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
> -	reg_dbi2 = dbi2_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
> +	reg = PCI_BASE_ADDRESS_0 + (4 * bar);
>  	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writel_dbi2(pci, reg_dbi2, 0x0);
> -	dw_pcie_writel_dbi(pci, reg, 0x0);
> +	dw_pcie_ep_writel_dbi2(ep, func_no, reg, 0x0);
> +	dw_pcie_ep_writel_dbi(ep, func_no, reg, 0x0);
>  	if (flags & PCI_BASE_ADDRESS_MEM_TYPE_64) {
> -		dw_pcie_writel_dbi2(pci, reg_dbi2 + 4, 0x0);
> -		dw_pcie_writel_dbi(pci, reg + 4, 0x0);
> +		dw_pcie_ep_writel_dbi2(ep, func_no, reg + 4, 0x0);
> +		dw_pcie_ep_writel_dbi(ep, func_no, reg + 4, 0x0);
>  	}
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  }
> @@ -99,19 +72,15 @@ void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_reset_bar);
>  
>  static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie_ep *ep, u8 func_no,
> -		u8 cap_ptr, u8 cap)
> +				     u8 cap_ptr, u8 cap)
>  {
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int dbi_offset = 0;
>  	u8 cap_id, next_cap_ptr;
>  	u16 reg;
>  
>  	if (!cap_ptr)
>  		return 0;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
> -	reg = dw_pcie_readw_dbi(pci, dbi_offset + cap_ptr);
> +	reg = dw_pcie_ep_readw_dbi(ep, func_no, cap_ptr);
>  	cap_id = (reg & 0x00ff);
>  
>  	if (cap_id > PCI_CAP_ID_MAX)
> @@ -126,14 +95,10 @@ static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie_ep *ep, u8 func_no,
>  
>  static u8 dw_pcie_ep_find_capability(struct dw_pcie_ep *ep, u8 func_no, u8 cap)
>  {
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int dbi_offset = 0;
>  	u8 next_cap_ptr;
>  	u16 reg;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
> -	reg = dw_pcie_readw_dbi(pci, dbi_offset + PCI_CAPABILITY_LIST);
> +	reg = dw_pcie_ep_readw_dbi(ep, func_no, PCI_CAPABILITY_LIST);
>  	next_cap_ptr = (reg & 0x00ff);
>  
>  	return __dw_pcie_ep_find_next_cap(ep, func_no, next_cap_ptr, cap);
> @@ -144,24 +109,21 @@ static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int dbi_offset = 0;
> -
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
>  
>  	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_VENDOR_ID, hdr->vendorid);
> -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_DEVICE_ID, hdr->deviceid);
> -	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_REVISION_ID, hdr->revid);
> -	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_CLASS_PROG, hdr->progif_code);
> -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_CLASS_DEVICE,
> -			   hdr->subclass_code | hdr->baseclass_code << 8);
> -	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_CACHE_LINE_SIZE,
> -			   hdr->cache_line_size);
> -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_SUBSYSTEM_VENDOR_ID,
> -			   hdr->subsys_vendor_id);
> -	dw_pcie_writew_dbi(pci, dbi_offset + PCI_SUBSYSTEM_ID, hdr->subsys_id);
> -	dw_pcie_writeb_dbi(pci, dbi_offset + PCI_INTERRUPT_PIN,
> -			   hdr->interrupt_pin);
> +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_VENDOR_ID, hdr->vendorid);
> +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_DEVICE_ID, hdr->deviceid);
> +	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_REVISION_ID, hdr->revid);
> +	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_CLASS_PROG, hdr->progif_code);
> +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_CLASS_DEVICE,
> +			      hdr->subclass_code | hdr->baseclass_code << 8);
> +	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_CACHE_LINE_SIZE,
> +			      hdr->cache_line_size);
> +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_SUBSYSTEM_VENDOR_ID,
> +			      hdr->subsys_vendor_id);
> +	dw_pcie_ep_writew_dbi(ep, func_no, PCI_SUBSYSTEM_ID, hdr->subsys_id);
> +	dw_pcie_ep_writeb_dbi(ep, func_no, PCI_INTERRUPT_PIN,
> +			      hdr->interrupt_pin);
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  
>  	return 0;
> @@ -243,18 +205,13 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	unsigned int dbi_offset, dbi2_offset;
>  	enum pci_barno bar = epf_bar->barno;
>  	size_t size = epf_bar->size;
>  	int flags = epf_bar->flags;
> -	u32 reg, reg_dbi2;
>  	int ret, type;
> +	u32 reg;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -	dbi2_offset = dw_pcie_ep_get_dbi2_offset(ep, func_no);
> -
> -	reg = PCI_BASE_ADDRESS_0 + (4 * bar) + dbi_offset;
> -	reg_dbi2 = PCI_BASE_ADDRESS_0 + (4 * bar) + dbi2_offset;
> +	reg = PCI_BASE_ADDRESS_0 + (4 * bar);
>  
>  	if (!(flags & PCI_BASE_ADDRESS_SPACE))
>  		type = PCIE_ATU_TYPE_MEM;
> @@ -270,12 +227,12 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  
>  	dw_pcie_dbi_ro_wr_en(pci);
>  
> -	dw_pcie_writel_dbi2(pci, reg_dbi2, lower_32_bits(size - 1));
> -	dw_pcie_writel_dbi(pci, reg, flags);
> +	dw_pcie_ep_writel_dbi2(ep, func_no, reg, lower_32_bits(size - 1));
> +	dw_pcie_ep_writel_dbi(ep, func_no, reg, flags);
>  
>  	if (flags & PCI_BASE_ADDRESS_MEM_TYPE_64) {
> -		dw_pcie_writel_dbi2(pci, reg_dbi2 + 4, upper_32_bits(size - 1));
> -		dw_pcie_writel_dbi(pci, reg + 4, 0);
> +		dw_pcie_ep_writel_dbi2(ep, func_no, reg + 4, upper_32_bits(size - 1));
> +		dw_pcie_ep_writel_dbi(ep, func_no, reg + 4, 0);
>  	}
>  
>  	ep->epf_bar[bar] = epf_bar;
> @@ -335,19 +292,15 @@ static int dw_pcie_ep_map_addr(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  static int dw_pcie_ep_get_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	u32 val, reg;
> -	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
> +	u32 val, reg;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msi_cap)
>  		return -EINVAL;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
> -	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
> -	val = dw_pcie_readw_dbi(pci, reg);
> +	reg = ep_func->msi_cap + PCI_MSI_FLAGS;
> +	val = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	if (!(val & PCI_MSI_FLAGS_ENABLE))
>  		return -EINVAL;
>  
> @@ -361,22 +314,19 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	u32 val, reg;
> -	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
> +	u32 val, reg;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msi_cap)
>  		return -EINVAL;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
> -	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
> -	val = dw_pcie_readw_dbi(pci, reg);
> +	reg = ep_func->msi_cap + PCI_MSI_FLAGS;
> +	val = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	val &= ~PCI_MSI_FLAGS_QMASK;
>  	val |= FIELD_PREP(PCI_MSI_FLAGS_QMASK, interrupts);
>  	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writew_dbi(pci, reg, val);
> +	dw_pcie_ep_writew_dbi(ep, func_no, reg, val);
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  
>  	return 0;
> @@ -385,19 +335,15 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no)
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	u32 val, reg;
> -	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
> +	u32 val, reg;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msix_cap)
>  		return -EINVAL;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
> -	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_FLAGS;
> -	val = dw_pcie_readw_dbi(pci, reg);
> +	reg = ep_func->msix_cap + PCI_MSIX_FLAGS;
> +	val = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	if (!(val & PCI_MSIX_FLAGS_ENABLE))
>  		return -EINVAL;
>  
> @@ -411,9 +357,8 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  {
>  	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	u32 val, reg;
> -	unsigned int dbi_offset = 0;
>  	struct dw_pcie_ep_func *ep_func;
> +	u32 val, reg;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msix_cap)
> @@ -421,21 +366,19 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  
>  	dw_pcie_dbi_ro_wr_en(pci);
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
> -	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_FLAGS;
> -	val = dw_pcie_readw_dbi(pci, reg);
> +	reg = ep_func->msix_cap + PCI_MSIX_FLAGS;
> +	val = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	val &= ~PCI_MSIX_FLAGS_QSIZE;
>  	val |= interrupts;
>  	dw_pcie_writew_dbi(pci, reg, val);
>  
> -	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_TABLE;
> +	reg = ep_func->msix_cap + PCI_MSIX_TABLE;
>  	val = offset | bir;
> -	dw_pcie_writel_dbi(pci, reg, val);
> +	dw_pcie_ep_writel_dbi(ep, func_no, reg, val);
>  
> -	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_PBA;
> +	reg = ep_func->msix_cap + PCI_MSIX_PBA;
>  	val = (offset + (interrupts * PCI_MSIX_ENTRY_SIZE)) | bir;
> -	dw_pcie_writel_dbi(pci, reg, val);
> +	dw_pcie_ep_writel_dbi(ep, func_no, reg, val);
>  
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  
> @@ -510,38 +453,34 @@ EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_legacy_irq);
>  int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			     u8 interrupt_num)
>  {
> -	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	u32 msg_addr_lower, msg_addr_upper, reg;
>  	struct dw_pcie_ep_func *ep_func;
>  	struct pci_epc *epc = ep->epc;
>  	unsigned int aligned_offset;
> -	unsigned int dbi_offset = 0;
>  	u16 msg_ctrl, msg_data;
> -	u32 msg_addr_lower, msg_addr_upper, reg;
> -	u64 msg_addr;
>  	bool has_upper;
> +	u64 msg_addr;
>  	int ret;
>  
>  	ep_func = dw_pcie_ep_get_func_from_ep(ep, func_no);
>  	if (!ep_func || !ep_func->msi_cap)
>  		return -EINVAL;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
>  	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1. */
> -	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_FLAGS;
> -	msg_ctrl = dw_pcie_readw_dbi(pci, reg);
> +	reg = ep_func->msi_cap + PCI_MSI_FLAGS;
> +	msg_ctrl = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	has_upper = !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
> -	reg = ep_func->msi_cap + dbi_offset + PCI_MSI_ADDRESS_LO;
> -	msg_addr_lower = dw_pcie_readl_dbi(pci, reg);
> +	reg = ep_func->msi_cap + PCI_MSI_ADDRESS_LO;
> +	msg_addr_lower = dw_pcie_ep_readl_dbi(ep, func_no, reg);
>  	if (has_upper) {
> -		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_ADDRESS_HI;
> -		msg_addr_upper = dw_pcie_readl_dbi(pci, reg);
> -		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_DATA_64;
> -		msg_data = dw_pcie_readw_dbi(pci, reg);
> +		reg = ep_func->msi_cap + PCI_MSI_ADDRESS_HI;
> +		msg_addr_upper = dw_pcie_ep_readl_dbi(ep, func_no, reg);
> +		reg = ep_func->msi_cap + PCI_MSI_DATA_64;
> +		msg_data = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	} else {
>  		msg_addr_upper = 0;
> -		reg = ep_func->msi_cap + dbi_offset + PCI_MSI_DATA_32;
> -		msg_data = dw_pcie_readw_dbi(pci, reg);
> +		reg = ep_func->msi_cap + PCI_MSI_DATA_32;
> +		msg_data = dw_pcie_ep_readw_dbi(ep, func_no, reg);
>  	}
>  	aligned_offset = msg_addr_lower & (epc->mem->window.page_size - 1);
>  	msg_addr = ((u64)msg_addr_upper) << 32 |
> @@ -582,10 +521,9 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			      u16 interrupt_num)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	struct dw_pcie_ep_func *ep_func;
>  	struct pci_epf_msix_tbl *msix_tbl;
> +	struct dw_pcie_ep_func *ep_func;
>  	struct pci_epc *epc = ep->epc;
> -	unsigned int dbi_offset = 0;
>  	u32 reg, msg_data, vec_ctrl;
>  	unsigned int aligned_offset;
>  	u32 tbl_offset;
> @@ -597,10 +535,8 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	if (!ep_func || !ep_func->msix_cap)
>  		return -EINVAL;
>  
> -	dbi_offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> -
> -	reg = ep_func->msix_cap + dbi_offset + PCI_MSIX_TABLE;
> -	tbl_offset = dw_pcie_readl_dbi(pci, reg);
> +	reg = ep_func->msix_cap + PCI_MSIX_TABLE;
> +	tbl_offset = dw_pcie_ep_readl_dbi(ep, func_no, reg);
>  	bir = FIELD_GET(PCI_MSIX_TABLE_BIR, tbl_offset);
>  	tbl_offset &= PCI_MSIX_TABLE_OFFSET;
>  
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 5e36da166ffe..b92e69041fe8 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -534,6 +534,99 @@ static inline enum dw_pcie_ltssm dw_pcie_get_ltssm(struct dw_pcie *pci)
>  	return (enum dw_pcie_ltssm)FIELD_GET(PORT_LOGIC_LTSSM_STATE_MASK, val);
>  }
>  
> +static inline unsigned int dw_pcie_ep_get_dbi_offset(struct dw_pcie_ep *ep,
> +						     u8 func_no)
> +{
> +	unsigned int dbi_offset = 0;
> +
> +	if (ep->ops->get_dbi_offset)
> +		dbi_offset = ep->ops->get_dbi_offset(ep, func_no);
> +
> +	return dbi_offset;
> +}
> +
> +static inline unsigned int dw_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep,
> +						      u8 func_no)
> +{
> +	unsigned int dbi2_offset = 0;
> +
> +	if (ep->ops->get_dbi2_offset)
> +		dbi2_offset = ep->ops->get_dbi2_offset(ep, func_no);
> +	else if (ep->ops->get_dbi_offset)     /* for backward compatibility */
> +		dbi2_offset = ep->ops->get_dbi_offset(ep, func_no);
> +
> +	return dbi2_offset;
> +}
> +
> +static inline u32 dw_pcie_ep_read_dbi(struct dw_pcie_ep *ep, u8 func_no,
> +				      u32 reg, size_t size)
> +{
> +	unsigned int offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +
> +	return dw_pcie_read_dbi(pci, offset + reg, size);
> +}
> +
> +static inline void dw_pcie_ep_write_dbi(struct dw_pcie_ep *ep, u8 func_no,
> +					u32 reg, size_t size, u32 val)
> +{
> +	unsigned int offset = dw_pcie_ep_get_dbi_offset(ep, func_no);
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +
> +	dw_pcie_write_dbi(pci, offset + reg, size, val);
> +}
> +
> +static inline void dw_pcie_ep_write_dbi2(struct dw_pcie_ep *ep, u8 func_no,
> +					 u32 reg, size_t size, u32 val)
> +{
> +	unsigned int offset = dw_pcie_ep_get_dbi2_offset(ep, func_no);
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +
> +	dw_pcie_write_dbi2(pci, offset + reg, size, val);
> +}
> +
> +static inline void dw_pcie_ep_writel_dbi(struct dw_pcie_ep *ep, u8 func_no,
> +					 u32 reg, u32 val)
> +{
> +	dw_pcie_ep_write_dbi(ep, func_no, reg, 0x4, val);
> +}
> +
> +static inline u32 dw_pcie_ep_readl_dbi(struct dw_pcie_ep *ep, u8 func_no,
> +				       u32 reg)
> +{
> +	return dw_pcie_ep_read_dbi(ep, func_no, reg, 0x4);
> +}
> +
> +static inline void dw_pcie_ep_writew_dbi(struct dw_pcie_ep *ep, u8 func_no,
> +					 u32 reg, u16 val)
> +{
> +	dw_pcie_ep_write_dbi(ep, func_no, reg, 0x2, val);
> +}
> +
> +static inline u16 dw_pcie_ep_readw_dbi(struct dw_pcie_ep *ep, u8 func_no,
> +				       u32 reg)
> +{
> +	return dw_pcie_ep_read_dbi(ep, func_no, reg, 0x2);
> +}
> +
> +static inline void dw_pcie_ep_writeb_dbi(struct dw_pcie_ep *ep, u8 func_no,
> +					 u32 reg, u8 val)
> +{
> +	dw_pcie_ep_write_dbi(ep, func_no, reg, 0x1, val);
> +}
> +
> +static inline u8 dw_pcie_ep_readb_dbi(struct dw_pcie_ep *ep, u8 func_no,
> +				      u32 reg)
> +{
> +	return dw_pcie_ep_read_dbi(ep, func_no, reg, 0x1);
> +}
> +
> +static inline void dw_pcie_ep_writel_dbi2(struct dw_pcie_ep *ep, u8 func_no,
> +					  u32 reg, u32 val)
> +{
> +	dw_pcie_ep_write_dbi2(ep, func_no, reg, 0x4, val);
> +}
> +
>  #ifdef CONFIG_PCIE_DW_HOST
>  irqreturn_t dw_handle_msi_irq(struct dw_pcie_rp *pp);
>  int dw_pcie_setup_rc(struct dw_pcie_rp *pp);
> -- 
> 2.34.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

