Return-Path: <linux-renesas-soc+bounces-6381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9786890C465
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2024 09:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37445B217E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2024 07:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7B0745C0;
	Tue, 18 Jun 2024 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9NYB4Tj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304AF73440;
	Tue, 18 Jun 2024 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718694577; cv=none; b=fVvgaYqh17sGIFcmCZrE6BEHuXZaLzR794XAfCMIG8bYrFptPTsmaCAaYty21pF3gpWVxkPKBfrIr3uFAaitA005+YewXLrUBE3zEOuy22nry2y7qeXbX4EqD8+23p4qFDyW9Jhro58mEWNtFWLYVYiiGGMU9gNWT2j24N2TczY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718694577; c=relaxed/simple;
	bh=e6XzdJg33xWRVNzNhUgA1l17Hz8JCuFvsGbY8RSFHzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHxefL0ihDnWEG/shQyvel+aqc4fSUkr8STjUXrIN64iij9ERhjwzOYYdg3tpgU5W53pM58EwnAg4rPHk+/H3ylqcX5CejvVpweUhihdYqiP2BAclporKS81kbFRFgT04sF+OT4poJRVG1KeWGPjI0OagBwDvDl1Bc3cEIME3cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9NYB4Tj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBC0C3277B;
	Tue, 18 Jun 2024 07:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718694577;
	bh=e6XzdJg33xWRVNzNhUgA1l17Hz8JCuFvsGbY8RSFHzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N9NYB4TjMFmhgTdHjD1Cd6/wrVJFfDkjK6O8jZ64o3jse5CrgnJozCb0735mnIObJ
	 4ZareHDMYJScAbYLQoayzTqw7DGYUzlDxMmHyH1k5mokGXSJA0KpROnDBPmTehRE2p
	 ilWtMyUmAUJLzzgkSm5faFSqVa9MbYVErOPQrZjwe7pDJwpRNtm/AqGRqOmjdqIO8J
	 vawEhaTFyTVgkL+esm8P5C4zQKQSZQxRjIMIaB1cdRzjZgMDRmLCkb86sXUYoVlAYI
	 Y6fPUykV4n0Ans35o4LZKwoUO5wNMkQhBq4+mb7LGX4wWMTdb2WbhR/bCx8tLIptlW
	 s5+sfUXVhKhhQ==
Date: Tue, 18 Jun 2024 12:39:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com,
	marek.vasut+renesas@gmail.com, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v9 4/5] PCI: rcar-gen4: Add support for r8a779g0
Message-ID: <20240618070925.GB5485@thinkpad>
References: <20240611125057.1232873-1-yoshihiro.shimoda.uh@renesas.com>
 <20240611125057.1232873-5-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240611125057.1232873-5-yoshihiro.shimoda.uh@renesas.com>

On Tue, Jun 11, 2024 at 09:50:56PM +0900, Yoshihiro Shimoda wrote:
> Add support for r8a779g0 (R-Car V4H).
> 
> This driver previously supported r8a779f0 (R-Car S4-8). PCIe features
> of both r8a779f0 and r8a779g0 are almost all the same. For example:
>  - PCI Express Base Specification Revision 4.0
>  - Root complex mode and endpoint mode are supported
> However, r8a779g0 requires specific firmware downloading, to
> initialize the PHY. Otherwise, the PCIe controller cannot work.
> 
> The attached firmware file "104_PCIe_fw_addr_data_ver1.05.txt" in
> the datasheet is a text file. But, Renesas is not able to distribute
> the firmware freely. So, we require converting the text file
> to a binary before the driver runs by using the following script:
> 
>  $ awk '/^\s*0x[0-9A-Fa-f]{4}\s+0x[0-9A-Fa-f]{4}/ \
>    { print substr($2,5,2) substr($2,3,2) }' \
>    104_PCIe_fw_addr_data_ver1.05.txt | xxd -p -r > \
>    rcar_gen4_pcie.bin
>  $ sha1sum rcar_gen4_pcie.bin
>    1d0bd4b189b4eb009f5d564b1f93a79112994945  rcar_gen4_pcie.bin
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 207 +++++++++++++++++++-
>  1 file changed, 206 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index dac78388975d..c67097e718d3 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -5,8 +5,10 @@
>   */
>  
>  #include <linux/delay.h>
> +#include <linux/firmware.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/pci.h>
> @@ -20,9 +22,10 @@
>  /* Renesas-specific */
>  /* PCIe Mode Setting Register 0 */
>  #define PCIEMSR0		0x0000
> -#define BIFUR_MOD_SET_ON	BIT(0)
> +#define APP_SRIS_MODE		BIT(6)
>  #define DEVICE_TYPE_EP		0
>  #define DEVICE_TYPE_RC		BIT(4)
> +#define BIFUR_MOD_SET_ON	BIT(0)
>  
>  /* PCIe Interrupt Status 0 */
>  #define PCIEINTSTS0		0x0084
> @@ -37,19 +40,48 @@
>  #define PCIEDMAINTSTSEN		0x0314
>  #define PCIEDMAINTSTSEN_INIT	GENMASK(15, 0)
>  
> +/* Port Logic Registers 89 */
> +#define PRTLGC89		0x0b70
> +
> +/* Port Logic Registers 90 */
> +#define PRTLGC90		0x0b74
> +
>  /* PCIe Reset Control Register 1 */
>  #define PCIERSTCTRL1		0x0014
>  #define APP_HOLD_PHY_RST	BIT(16)
>  #define APP_LTSSM_ENABLE	BIT(0)
>  
> +/* PCIe Power Management Control */
> +#define PCIEPWRMNGCTRL		0x0070
> +#define APP_CLK_REQ_N		BIT(11)
> +#define APP_CLK_PM_EN		BIT(10)
> +
>  #define RCAR_NUM_SPEED_CHANGE_RETRIES	10
>  #define RCAR_MAX_LINK_SPEED		4
>  
>  #define RCAR_GEN4_PCIE_EP_FUNC_DBI_OFFSET	0x1000
>  #define RCAR_GEN4_PCIE_EP_FUNC_DBI2_OFFSET	0x800
>  
> +/*
> + * The attached firmware file "104_PCIe_fw_addr_data_ver1.05.txt" in
> + * the datasheet is a text file. But, Renesas is not able to distribute
> + * the firmware freely. So, we require converting the text file
> + * to a binary before the driver runs by using the following script:
> + *
> + * $ awk '/^\s*0x[0-9A-Fa-f]{4}\s+0x[0-9A-Fa-f]{4}/ \
> + *      { print substr($2,5,2) substr($2,3,2) }' \
> + *      104_PCIe_fw_addr_data_ver1.05.txt | xxd -p -r > \
> + *      rcar_gen4_pcie.bin
> + *    $ sha1sum rcar_gen4_pcie.bin
> + *      1d0bd4b189b4eb009f5d564b1f93a79112994945  rcar_gen4_pcie.bin
> + */
> +#define RCAR_GEN4_PCIE_FIRMWARE_NAME		"rcar_gen4_pcie.bin"
> +#define RCAR_GEN4_PCIE_FIRMWARE_BASE_ADDR	0xc000
> +MODULE_FIRMWARE(RCAR_GEN4_PCIE_FIRMWARE_NAME);
> +
>  struct rcar_gen4_pcie;
>  struct rcar_gen4_pcie_drvdata {
> +	void (*additional_common_init)(struct rcar_gen4_pcie *rcar);
>  	int (*ltssm_control)(struct rcar_gen4_pcie *rcar, bool enable);
>  	enum dw_pcie_device_mode mode;
>  };
> @@ -57,6 +89,7 @@ struct rcar_gen4_pcie_drvdata {
>  struct rcar_gen4_pcie {
>  	struct dw_pcie dw;
>  	void __iomem *base;
> +	void __iomem *phy_base;
>  	struct platform_device *pdev;
>  	const struct rcar_gen4_pcie_drvdata *drvdata;
>  };
> @@ -180,6 +213,9 @@ static int rcar_gen4_pcie_common_init(struct rcar_gen4_pcie *rcar)
>  	if (ret)
>  		goto err_unprepare;
>  
> +	if (rcar->drvdata->additional_common_init)
> +		rcar->drvdata->additional_common_init(rcar);
> +
>  	return 0;
>  
>  err_unprepare:
> @@ -221,6 +257,10 @@ static void rcar_gen4_pcie_unprepare(struct rcar_gen4_pcie *rcar)
>  
>  static int rcar_gen4_pcie_get_resources(struct rcar_gen4_pcie *rcar)
>  {
> +	rcar->phy_base = devm_platform_ioremap_resource_byname(rcar->pdev, "phy");
> +	if (IS_ERR(rcar->phy_base))
> +		return PTR_ERR(rcar->phy_base);
> +

I failed to spot this in earlier reviews. Since this 'phy' region is only
applicable for r8a779g0, wouldn't this fail on other platforms?

- Mani

>  	/* Renesas-specific registers */
>  	rcar->base = devm_platform_ioremap_resource_byname(rcar->pdev, "app");
>  
> @@ -528,6 +568,167 @@ static int r8a779f0_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable)
>  	return 0;
>  }
>  
> +static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
> +{
> +	struct dw_pcie *dw = &rcar->dw;
> +	u32 val;
> +
> +	val = dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW);
> +	val &= ~PORT_LANE_SKEW_INSERT_MASK;
> +	if (dw->num_lanes < 4)
> +		val |= BIT(6);
> +	dw_pcie_writel_dbi(dw, PCIE_PORT_LANE_SKEW, val);
> +
> +	val = readl(rcar->base + PCIEPWRMNGCTRL);
> +	val |= APP_CLK_REQ_N | APP_CLK_PM_EN;
> +	writel(val, rcar->base + PCIEPWRMNGCTRL);
> +}
> +
> +static void rcar_gen4_pcie_phy_reg_update_bits(struct rcar_gen4_pcie *rcar,
> +					       u32 offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl(rcar->phy_base + offset);
> +	tmp &= ~mask;
> +	tmp |= val;
> +	writel(tmp, rcar->phy_base + offset);
> +}
> +
> +/*
> + * SoC datasheet suggests checking port logic register bits during firmware
> + * write. If read returns non-zero value, then this function returns -EAGAIN
> + * indicating that the write needs to be done again. If read returns zero,
> + * then return 0 to indicate success.
> + */
> +static int rcar_gen4_pcie_reg_test_bit(struct rcar_gen4_pcie *rcar,
> +				       u32 offset, u32 mask)
> +{
> +	struct dw_pcie *dw = &rcar->dw;
> +
> +	if (dw_pcie_readl_dbi(dw, offset) & mask)
> +		return -EAGAIN;
> +
> +	return 0;
> +}
> +
> +static int rcar_gen4_pcie_download_phy_firmware(struct rcar_gen4_pcie *rcar)
> +{
> +	/* The check_addr values are magical numbers in the datasheet */
> +	const u32 check_addr[] = { 0x00101018, 0x00101118, 0x00101021, 0x00101121};
> +	struct dw_pcie *dw = &rcar->dw;
> +	const struct firmware *fw;
> +	unsigned int i, timeout;
> +	u32 data;
> +	int ret;
> +
> +	ret = request_firmware(&fw, RCAR_GEN4_PCIE_FIRMWARE_NAME, dw->dev);
> +	if (ret) {
> +		dev_err(dw->dev, "Failed to load firmware (%s): %d\n",
> +			RCAR_GEN4_PCIE_FIRMWARE_NAME, ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < (fw->size / 2); i++) {
> +		data = fw->data[(i * 2) + 1] << 8 | fw->data[i * 2];
> +		timeout = 100;
> +		do {
> +			dw_pcie_writel_dbi(dw, PRTLGC89, RCAR_GEN4_PCIE_FIRMWARE_BASE_ADDR + i);
> +			dw_pcie_writel_dbi(dw, PRTLGC90, data);
> +			if (!rcar_gen4_pcie_reg_test_bit(rcar, PRTLGC89, BIT(30)))
> +				break;
> +			if (!(--timeout)) {
> +				ret = -ETIMEDOUT;
> +				goto exit;
> +			}
> +			usleep_range(100, 200);
> +		} while (1);
> +	}
> +
> +	rcar_gen4_pcie_phy_reg_update_bits(rcar, 0x0f8, BIT(17), BIT(17));
> +
> +	for (i = 0; i < ARRAY_SIZE(check_addr); i++) {
> +		timeout = 100;
> +		do {
> +			dw_pcie_writel_dbi(dw, PRTLGC89, check_addr[i]);
> +			ret = rcar_gen4_pcie_reg_test_bit(rcar, PRTLGC89, BIT(30));
> +			ret |= rcar_gen4_pcie_reg_test_bit(rcar, PRTLGC90, BIT(0));
> +			if (!ret)
> +				break;
> +			if (!(--timeout)) {
> +				ret = -ETIMEDOUT;
> +				goto exit;
> +			}
> +			usleep_range(100, 200);
> +		} while (1);
> +	}
> +
> +exit:
> +	release_firmware(fw);
> +
> +	return ret;
> +}
> +
> +static int rcar_gen4_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable)
> +{
> +	struct dw_pcie *dw = &rcar->dw;
> +	u32 val;
> +	int ret;
> +
> +	if (!enable) {
> +		val = readl(rcar->base + PCIERSTCTRL1);
> +		val &= ~APP_LTSSM_ENABLE;
> +		writel(val, rcar->base + PCIERSTCTRL1);
> +
> +		return 0;
> +	}
> +
> +	val = dw_pcie_readl_dbi(dw, PCIE_PORT_FORCE);
> +	val |= PORT_FORCE_DO_DESKEW_FOR_SRIS;
> +	dw_pcie_writel_dbi(dw, PCIE_PORT_FORCE, val);
> +
> +	val = readl(rcar->base + PCIEMSR0);
> +	val |= APP_SRIS_MODE;
> +	writel(val, rcar->base + PCIEMSR0);
> +
> +	/*
> +	 * The R-Car Gen4 datasheet doesn't describe the PHY registers' name.
> +	 * But, the initialization procedure describes these offsets. So,
> +	 * this driver has magical offset numbers.
> +	 */
> +	rcar_gen4_pcie_phy_reg_update_bits(rcar, 0x700, BIT(28), 0);
> +	rcar_gen4_pcie_phy_reg_update_bits(rcar, 0x700, BIT(20), 0);
> +	rcar_gen4_pcie_phy_reg_update_bits(rcar, 0x700, BIT(12), 0);
> +	rcar_gen4_pcie_phy_reg_update_bits(rcar, 0x700, BIT(4), 0);
> +
> +	rcar_gen4_pcie_phy_reg_update_bits(rcar, 0x148, GENMASK(23, 22), BIT(22));
> +	rcar_gen4_pcie_phy_reg_update_bits(rcar, 0x148, GENMASK(18, 16), GENMASK(17, 16));
> +	rcar_gen4_pcie_phy_reg_update_bits(rcar, 0x148, GENMASK(7, 6), BIT(6));
> +	rcar_gen4_pcie_phy_reg_update_bits(rcar, 0x148, GENMASK(2, 0), GENMASK(11, 0));
> +	rcar_gen4_pcie_phy_reg_update_bits(rcar, 0x1d4, GENMASK(16, 15), GENMASK(16, 15));
> +	rcar_gen4_pcie_phy_reg_update_bits(rcar, 0x514, BIT(26), BIT(26));
> +	rcar_gen4_pcie_phy_reg_update_bits(rcar, 0x0f8, BIT(16), 0);
> +	rcar_gen4_pcie_phy_reg_update_bits(rcar, 0x0f8, BIT(19), BIT(19));
> +
> +	val = readl(rcar->base + PCIERSTCTRL1);
> +	val &= ~APP_HOLD_PHY_RST;
> +	writel(val, rcar->base + PCIERSTCTRL1);
> +
> +	ret = readl_poll_timeout(rcar->phy_base + 0x0f8, val, !(val & BIT(18)), 100, 10000);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = rcar_gen4_pcie_download_phy_firmware(rcar);
> +	if (ret)
> +		return ret;
> +
> +	val = readl(rcar->base + PCIERSTCTRL1);
> +	val |= APP_LTSSM_ENABLE;
> +	writel(val, rcar->base + PCIERSTCTRL1);
> +
> +	return 0;
> +}
> +
>  static struct rcar_gen4_pcie_drvdata drvdata_r8a779f0_pcie = {
>  	.ltssm_control = r8a779f0_pcie_ltssm_control,
>  	.mode = DW_PCIE_RC_TYPE,
> @@ -539,10 +740,14 @@ static struct rcar_gen4_pcie_drvdata drvdata_r8a779f0_pcie_ep = {
>  };
>  
>  static struct rcar_gen4_pcie_drvdata drvdata_rcar_gen4_pcie = {
> +	.additional_common_init = rcar_gen4_pcie_additional_common_init,
> +	.ltssm_control = rcar_gen4_pcie_ltssm_control,
>  	.mode = DW_PCIE_RC_TYPE,
>  };
>  
>  static struct rcar_gen4_pcie_drvdata drvdata_rcar_gen4_pcie_ep = {
> +	.additional_common_init = rcar_gen4_pcie_additional_common_init,
> +	.ltssm_control = rcar_gen4_pcie_ltssm_control,
>  	.mode = DW_PCIE_EP_TYPE,
>  };
>  
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

