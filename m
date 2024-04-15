Return-Path: <linux-renesas-soc+bounces-4621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 829A08A4EF6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Apr 2024 14:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B29D1F20AA7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Apr 2024 12:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3D4657D3;
	Mon, 15 Apr 2024 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6mNbkSC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5895FBA3;
	Mon, 15 Apr 2024 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713183900; cv=none; b=C8XgcGP4UwNC5PG1Z0/XaI/o7XgBSPaS69I81nJdordD5M537WRSLO/E/9I4gvjlN/r9tkhNyvacjAIc+Z+FL+evwenrLKwxnvGMB7KEdH//dCLRvp7vZ0kmMyAER6IlERsL4eGu9E600kO16eKX0WlEEegrC12TYCfMX7uPcgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713183900; c=relaxed/simple;
	bh=HwhYtPMSm6cLJwaRxlxhxKmSmqUfNInife4UM12bLnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkYAOHHxtRVedCZBgiJmkaXf4SZXVkuYJ1m3s5Vwx0EDCUYjTvnbm45YnIjtvEhDivWuT9UD9QerID8Lkv/8LGIM1bdTni/1IkJvKifpoDehzkhonecqDCdIQQ0CAGlvomlFHryAOJ3JbeEWu3roItN/rLQdYxMQoIDB+RO1XxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6mNbkSC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACF8C113CC;
	Mon, 15 Apr 2024 12:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713183900;
	bh=HwhYtPMSm6cLJwaRxlxhxKmSmqUfNInife4UM12bLnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e6mNbkSCwU17ppBk23wqspxJwzPs+JLMB5PkcAiqDNGKK93ke16IWqB8+KBAZH8OH
	 Tris5ahbi1j497WhJkDKWMDtXOfsLgORc2lGXfDU1/1p3FzQyzKk5cQZ8AIYE3lBpL
	 7yW7PL+z8iGs1oLN94u+sdOxon90q577JWOPIDqmdRXxKFrc6W2ATPV29A3ldaU/EP
	 kz3Wns/Tml4aejrfCXkXFUxL6e6G8v3r+uXIb1WZ8s5CULHv+ZNpr4a4we9PQuPhGG
	 H5nsOxQ525CkxvpDxouvxpjAmYS1OnO6M+6YGSuK+NFE7mCFTPpBnyxPCybgY5tNsY
	 +pPutbtMTGRng==
Date: Mon, 15 Apr 2024 14:24:54 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>,
	"mani@kernel.org" <mani@kernel.org>,
	"marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 6/7] PCI: rcar-gen4: Add support for r8a779g0
Message-ID: <Zh0cljkWBzIZACFd@ryzen>
References: <20240415081135.3814373-1-yoshihiro.shimoda.uh@renesas.com>
 <20240415081135.3814373-7-yoshihiro.shimoda.uh@renesas.com>
 <Zhzk6dOkb8RXjv7o@ryzen>
 <TYCPR01MB11040033FABC78AD0CC459D1BD8092@TYCPR01MB11040.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB11040033FABC78AD0CC459D1BD8092@TYCPR01MB11040.jpnprd01.prod.outlook.com>

On Mon, Apr 15, 2024 at 09:19:43AM +0000, Yoshihiro Shimoda wrote:
> Hi Niklas,
> 
> > From: Niklas Cassel, Sent: Monday, April 15, 2024 5:27 PM
> > 
> > On Mon, Apr 15, 2024 at 05:11:34PM +0900, Yoshihiro Shimoda wrote:
> > > This driver previously supported r8a779f0 (R-Car S4-8). Add support
> > > for r8a779g0 (R-Car V4H). PCIe features of both r8a779f0 and r8a779g0
> > > are almost all the same. For example:
> > >  - PCI Express Base Specification Revision 4.0
> > >  - Root complex mode and endpoint mode are supported
> > >
> > > However, r8a779g0 requires specific firmware downloading, to
> > > initialize the PHY. Otherwise, the PCIe controller cannot work.
> > > The firmware is attached in the manual of the r8a779g0 as text.
> > > So, convert it to a binary file by using a script.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 201 +++++++++++++++++++-
> > >  1 file changed, 200 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > index 980a916933d6..4e934e9156f2 100644
> > > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > @@ -5,8 +5,10 @@
> > >   */
> > >
> > >  #include <linux/delay.h>
> > > +#include <linux/firmware.h>
> > >  #include <linux/interrupt.h>
> > >  #include <linux/io.h>
> > > +#include <linux/iopoll.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of.h>
> > >  #include <linux/pci.h>
> > > @@ -20,9 +22,10 @@
> > >  /* Renesas-specific */
> > >  /* PCIe Mode Setting Register 0 */
> > >  #define PCIEMSR0		0x0000
> > > -#define BIFUR_MOD_SET_ON	BIT(0)
> > > +#define APP_SRIS_MODE		BIT(6)
> > >  #define DEVICE_TYPE_EP		0
> > >  #define DEVICE_TYPE_RC		BIT(4)
> > > +#define BIFUR_MOD_SET_ON	BIT(0)
> > >
> > >  /* PCIe Interrupt Status 0 */
> > >  #define PCIEINTSTS0		0x0084
> > > @@ -37,19 +40,47 @@
> > >  #define PCIEDMAINTSTSEN		0x0314
> > >  #define PCIEDMAINTSTSEN_INIT	GENMASK(15, 0)
> > >
> > > +/* Port Logic Registers 89 */
> > > +#define PRTLGC89		0x0b70
> > > +
> > > +/* Port Logic Registers 90 */
> > > +#define PRTLGC90		0x0b74
> > > +
> > >  /* PCIe Reset Control Register 1 */
> > >  #define PCIERSTCTRL1		0x0014
> > >  #define APP_HOLD_PHY_RST	BIT(16)
> > >  #define APP_LTSSM_ENABLE	BIT(0)
> > >
> > > +/* PCIe Power Management Control */
> > > +#define PCIEPWRMNGCTRL		0x0070
> > > +#define APP_CLK_REQ_N		BIT(11)
> > > +#define APP_CLK_PM_EN		BIT(10)
> > > +
> > > +/*
> > > + * The R-Car Gen4 documents don't describe the PHY registers' name.
> > > + * But, the initialization procedure describes these offsets. So,
> > > + * this driver makes up own #defines for the offsets.
> > > + */
> > > +#define RCAR_GEN4_PCIE_PHY_0f8	0x0f8
> > > +#define RCAR_GEN4_PCIE_PHY_148	0x148
> > > +#define RCAR_GEN4_PCIE_PHY_1d4	0x1d4
> > > +#define RCAR_GEN4_PCIE_PHY_514	0x514
> > > +#define RCAR_GEN4_PCIE_PHY_700	0x700
> > > +
> > >  #define RCAR_NUM_SPEED_CHANGE_RETRIES	10
> > >  #define RCAR_MAX_LINK_SPEED		4
> > >
> > >  #define RCAR_GEN4_PCIE_EP_FUNC_DBI_OFFSET	0x1000
> > >  #define RCAR_GEN4_PCIE_EP_FUNC_DBI2_OFFSET	0x800
> > >
> > > +#define RCAR_GEN4_PCIE_FIRMWARE_NAME		"rcar_gen4_pcie.bin"
> > > +#define RCAR_GEN4_PCIE_FIRMWARE_BASE_ADDR	0xc000
> > > +
> > > +MODULE_FIRMWARE(RCAR_GEN4_PCIE_FIRMWARE_NAME);
> > > +
> > >  struct rcar_gen4_pcie;
> > >  struct rcar_gen4_pcie_drvdata {
> > > +	void (*additional_common_init)(struct rcar_gen4_pcie *rcar);
> > >  	int (*ltssm_enable)(struct rcar_gen4_pcie *rcar);
> > >  	enum dw_pcie_device_mode mode;
> > >  };
> > > @@ -57,12 +88,144 @@ struct rcar_gen4_pcie_drvdata {
> > >  struct rcar_gen4_pcie {
> > >  	struct dw_pcie dw;
> > >  	void __iomem *base;
> > > +	void __iomem *phy_base;
> > >  	struct platform_device *pdev;
> > >  	const struct rcar_gen4_pcie_drvdata *drvdata;
> > >  };
> > >  #define to_rcar_gen4_pcie(_dw)	container_of(_dw, struct rcar_gen4_pcie, dw)
> > >
> > >  /* Common */
> > > +static void rcar_gen4_pcie_phy_reg_update_bits(struct rcar_gen4_pcie *rcar,
> > > +					       u32 offset, u32 mask, u32 val)
> > > +{
> > > +	u32 tmp;
> > > +
> > > +	tmp = readl(rcar->phy_base + offset);
> > > +	tmp &= ~mask;
> > > +	tmp |= val;
> > > +	writel(tmp, rcar->phy_base + offset);
> > > +}
> > > +
> > > +static int rcar_gen4_pcie_reg_check(struct rcar_gen4_pcie *rcar,
> > > +				    u32 offset, u32 mask)
> > > +{
> > > +	struct dw_pcie *dw = &rcar->dw;
> > > +
> > > +	if (dw_pcie_readl_dbi(dw, offset) & mask)
> > > +		return -EAGAIN;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int rcar_gen4_pcie_download_phy_firmware(struct rcar_gen4_pcie *rcar)
> > > +{
> > > +	const u32 check_addr[] = { 0x00101018, 0x00101118, 0x00101021, 0x00101121};
> > > +	struct dw_pcie *dw = &rcar->dw;
> > > +	const struct firmware *fw;
> > > +	unsigned int i, timeout;
> > > +	u32 data;
> > > +	int ret;
> > > +
> > > +	ret = request_firmware(&fw, RCAR_GEN4_PCIE_FIRMWARE_NAME, dw->dev);
> > > +	if (ret) {
> > > +		dev_err(dw->dev, "%s: Requesting firmware failed\n", __func__);
> > > +		return ret;
> > > +	}
> > > +
> > > +	for (i = 0; i < (fw->size / 2); i++) {
> > > +		data = fw->data[(i * 2) + 1] << 8 | fw->data[i * 2];
> > > +		timeout = 100;
> > > +		do {
> > > +			dw_pcie_writel_dbi(dw, PRTLGC89, RCAR_GEN4_PCIE_FIRMWARE_BASE_ADDR + i);
> > > +			dw_pcie_writel_dbi(dw, PRTLGC90, data);
> > > +			if (rcar_gen4_pcie_reg_check(rcar, PRTLGC89, BIT(30)) >= 0)
> > > +				break;
> > > +			if (!(--timeout)) {
> > > +				ret = -ETIMEDOUT;
> > > +				goto exit;
> > > +			}
> > > +			usleep_range(100, 200);
> > > +		} while (1);
> > > +	}
> > > +
> > > +	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_0f8, BIT(17), BIT(17));
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(check_addr); i++) {
> > > +		timeout = 100;
> > > +		do {
> > > +			dw_pcie_writel_dbi(dw, PRTLGC89, check_addr[i]);
> > > +			ret = rcar_gen4_pcie_reg_check(rcar, PRTLGC89, BIT(30));
> > > +			ret |= rcar_gen4_pcie_reg_check(rcar, PRTLGC90, BIT(0));
> > > +			if (ret >= 0)
> > > +				break;
> > > +			if (!(--timeout)) {
> > > +				ret = -ETIMEDOUT;
> > > +				goto exit;
> > > +			}
> > > +			usleep_range(100, 200);
> > > +		} while (1);
> > > +	}
> > > +
> > > +	ret = 0;
> > > +exit:
> > > +	release_firmware(fw);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int rcar_gen4_pcie_enable_phy(struct rcar_gen4_pcie *rcar)
> > > +{
> > > +	struct dw_pcie *dw = &rcar->dw;
> > > +	u32 val;
> > > +	int ret;
> > > +
> > > +	val = dw_pcie_readl_dbi(dw, PCIE_PORT_FORCE);
> > > +	val |= PORT_FORCE_DO_DESKEW_FOR_SRIS;
> > > +	dw_pcie_writel_dbi(dw, PCIE_PORT_FORCE, val);
> > > +
> > > +	val = readl(rcar->base + PCIEMSR0);
> > > +	val |= APP_SRIS_MODE;
> > > +	writel(val, rcar->base + PCIEMSR0);
> > > +
> > > +	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_700, BIT(28), 0);
> > > +	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_700, BIT(20), 0);
> > > +	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_700, BIT(12), 0);
> > > +	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_700, BIT(4), 0);
> > > +
> > > +	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_148,
> > > +					   GENMASK(23, 22), BIT(22));
> > > +	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_148,
> > > +					   GENMASK(18, 16), GENMASK(17, 16));
> > > +	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_148,
> > > +					   GENMASK(7, 6), BIT(6));
> > > +	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_148,
> > > +					   GENMASK(2, 0), GENMASK(11, 0));
> > > +	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_1d4,
> > > +					   GENMASK(16, 15), GENMASK(16, 15));
> > > +	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_514, BIT(26), BIT(26));
> > > +	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_0f8, BIT(16), 0);
> > > +	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_0f8, BIT(19), BIT(19));
> > > +
> > > +	val = readl(rcar->base + PCIERSTCTRL1);
> > > +	val &= ~APP_HOLD_PHY_RST;
> > > +	writel(val, rcar->base + PCIERSTCTRL1);
> > > +
> > > +	ret = readl_poll_timeout(rcar->phy_base + RCAR_GEN4_PCIE_PHY_0f8, val,
> > > +				 !(val & BIT(18)), 100, 10000);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = rcar_gen4_pcie_download_phy_firmware(rcar);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	val = readl(rcar->base + PCIERSTCTRL1);
> > > +	val |= APP_LTSSM_ENABLE;
> > > +	writel(val, rcar->base + PCIERSTCTRL1);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > 
> > Is there a reason why you didn't chose to implement this as a PHY driver
> > in drivers/phy ?
> 
> This is because the initialization needs both PCIe and PHY registers' settings
> alternately like below:
>  Write PHY regs
>  Write PCI regs
>  Read a PHY reg
>  Write PCI regs
>  Write a PHY reg
>  ...
> 
> Best regards,
> Yoshihiro Shimoda

I see, that makes sense. Thanks.


Kind regards,
Niklas

