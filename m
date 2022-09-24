Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC9F5E88F0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Sep 2022 09:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233374AbiIXHIc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 24 Sep 2022 03:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233204AbiIXHIb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 24 Sep 2022 03:08:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D31A1CB00;
        Sat, 24 Sep 2022 00:08:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6252AB80D54;
        Sat, 24 Sep 2022 07:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BBE5C433C1;
        Sat, 24 Sep 2022 07:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664003307;
        bh=6c/UDgdolwfqD83PQ9sBuSa1xIYvI6S1e9FK20vhMTY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MxeTfeslmOm1moCgcFSlNcKJllm2ejCuw7JN6HqYI98NadijHphGk2w6AEx5PFN1I
         f10Q580Z4tWdfqxR1mCbrzbhsmdcn/Ai2lyr2sZ1w/mEiB3qZwnxq7K+9r9Dw9y1nR
         HXoEG2t85qGaQp+iVKhzXxblJX0G4TU5u3Kg1sPk+OusxO60zT6SX1MfQM6EtNBxaA
         bKB+HV2AniYal6pOlcVb+lNeQJbCaMUM2uvIsm30FTVS0E1KuLgpV5KrJXH6kM3Ow/
         zY6tooMZD0syKGsJ1qeLxJqAdN+82P6njbZRQ+ZBqUVtbbJyJ7ad8G06BQ30CYQzoC
         S9kmXJWv2jNgQ==
Date:   Sat, 24 Sep 2022 12:38:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     kishon@ti.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: renesas: Add Renesas Ethernet SERDES driver for
 R-Car S4-8
Message-ID: <Yy6s5qfXxCPsfNxo@matsya>
References: <20220922051645.3442321-1-yoshihiro.shimoda.uh@renesas.com>
 <20220922051645.3442321-3-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922051645.3442321-3-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 22-09-22, 14:16, Yoshihiro Shimoda wrote:
> Add Renesas Ethernet SERDES driver for R-Car S4-8 (r8a779f0).
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/phy/renesas/Kconfig                 |   7 +
>  drivers/phy/renesas/Makefile                |   2 +-
>  drivers/phy/renesas/r8a779f0-ether-serdes.c | 303 ++++++++++++++++++++
>  3 files changed, 311 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/phy/renesas/r8a779f0-ether-serdes.c
> 
> diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
> index 111bdcae775c..68f160b0e8ef 100644
> --- a/drivers/phy/renesas/Kconfig
> +++ b/drivers/phy/renesas/Kconfig
> @@ -32,3 +32,10 @@ config PHY_RCAR_GEN3_USB3
>  	select GENERIC_PHY
>  	help
>  	  Support for USB 3.0 PHY found on Renesas R-Car generation 3 SoCs.
> +
> +config PHY_R8A779F0_ETHERNET_SERDES
> +	tristate "Renesas R-Car S4-8 Ethernet SERDES driver"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	select GENERIC_PHY
> +	help
> +	  Support for Ethernet SERDES found on Renesas R-Car S4-8 SoCs.
> diff --git a/drivers/phy/renesas/Makefile b/drivers/phy/renesas/Makefile
> index b599ff8a4349..a2db7125da19 100644
> --- a/drivers/phy/renesas/Makefile
> +++ b/drivers/phy/renesas/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_PHY_R8A779F0_ETHERNET_SERDES)	+= r8a779f0-ether-serdes.o
>  obj-$(CONFIG_PHY_RCAR_GEN2)		+= phy-rcar-gen2.o
>  obj-$(CONFIG_PHY_RCAR_GEN3_PCIE)	+= phy-rcar-gen3-pcie.o
>  obj-$(CONFIG_PHY_RCAR_GEN3_USB2)	+= phy-rcar-gen3-usb2.o
> -obj-$(CONFIG_PHY_RCAR_GEN3_USB3)	+= phy-rcar-gen3-usb3.o

Why?

> diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
> new file mode 100644
> index 000000000000..1aaf70b3ed3d
> --- /dev/null
> +++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
> @@ -0,0 +1,303 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Renesas Ethernet SERDES device driver
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/phy.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +
> +#define R8A779F0_ETH_SERDES_NUM			3
> +#define R8A779F0_ETH_SERDES_OFFSET		0x0400
> +#define R8A779F0_ETH_SERDES_BANK_SELECT		0x03fc
> +#define R8A779F0_ETH_SERDES_TIMEOUT_US		100000
> +
> +struct r8a779f0_eth_serdes_channel {
> +	struct phy *phy;
> +	void __iomem *addr;
> +	void __iomem *addr0;
> +	phy_interface_t phy_interface;
> +	int speed;
> +};
> +
> +struct r8a779f0_eth_serdes_drv_data {
> +	void __iomem *addr;
> +	struct platform_device *pdev;
> +	struct r8a779f0_eth_serdes_channel channel[R8A779F0_ETH_SERDES_NUM];
> +};
> +
> +/*
> + * The datasheet describes initialization procedure without any information
> + * about registers' name/bits. So, this is all black magic to initialize
> + * the hardware.
> + */
> +static void r8a779f0_eth_serdes_write32(void __iomem *addr, u32 offs, u32 bank, u32 data)
> +{
> +	iowrite32(bank, addr + R8A779F0_ETH_SERDES_BANK_SELECT);
> +	iowrite32(data, addr + offs);
> +}
> +
> +static int r8a779f0_eth_serdes_reg_wait(void __iomem *addr, u32 offs, u32 bank,
> +					u32 mask, u32 expected)
> +{
> +	u32 val;
> +
> +	iowrite32(bank, addr + R8A779F0_ETH_SERDES_BANK_SELECT);
> +
> +	return readl_poll_timeout_atomic(addr + offs, val, (val & mask) == expected,
> +					 1, R8A779F0_ETH_SERDES_TIMEOUT_US);
> +}
> +
> +static int
> +r8a779f0_eth_serdes_common_init_ram(struct r8a779f0_eth_serdes_channel *channel)
> +{
> +	int ret;
> +
> +	ret = r8a779f0_eth_serdes_reg_wait(channel->addr, 0x026c, 0x180, BIT(0), 0x01);
> +	if (ret)
> +		return ret;
> +
> +	r8a779f0_eth_serdes_write32(channel->addr0, 0x026c, 0x180, 0x03);
> +
> +	return ret;
> +}
> +
> +static int
> +r8a779f0_eth_serdes_common_setting(struct r8a779f0_eth_serdes_channel *channel)
> +{
> +	switch (channel->phy_interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +		r8a779f0_eth_serdes_write32(channel->addr0, 0x0244, 0x180, 0x0097);
> +		r8a779f0_eth_serdes_write32(channel->addr0, 0x01d0, 0x180, 0x0060);
> +		r8a779f0_eth_serdes_write32(channel->addr0, 0x01d8, 0x180, 0x2200);
> +		r8a779f0_eth_serdes_write32(channel->addr0, 0x01d4, 0x180, 0x0000);
> +		r8a779f0_eth_serdes_write32(channel->addr0, 0x01e0, 0x180, 0x003d);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +r8a779f0_eth_serdes_chan_setting(struct r8a779f0_eth_serdes_channel *channel)
> +{
> +	int ret;
> +
> +	switch (channel->phy_interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x2000);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x01c0, 0x180, 0x0011);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x0248, 0x180, 0x0540);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x0258, 0x180, 0x0015);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x0100);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x01a0, 0x180, 0x0000);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x00d0, 0x180, 0x0002);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x0150, 0x180, 0x0003);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x0100);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x0100);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x0174, 0x180, 0x0000);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x0160, 0x180, 0x0007);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x01ac, 0x180, 0x0000);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x0310);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x380, 0x0101);
> +		ret = r8a779f0_eth_serdes_reg_wait(channel->addr, 0x00c8, 0x0180, BIT(0), 0);
> +		if (ret)
> +			return ret;
> +
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x0101);
> +		ret = r8a779f0_eth_serdes_reg_wait(channel->addr, 0x0148, 0x0180, BIT(0), 0);
> +		if (ret)
> +			return ret;
> +
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x1310);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x00d8, 0x180, 0x1800);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x00dc, 0x180, 0x0000);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x001c, 0x300, 0x0001);
> +		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x2100);
> +		ret = r8a779f0_eth_serdes_reg_wait(channel->addr, 0x0000, 0x0380, BIT(8), 0);
> +		if (ret)
> +			return ret;
> +
> +		if (channel->speed == 1000)
> +			r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0x0140);
> +		else if (channel->speed == 100)
> +			r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0x2100);
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int r8a779f0_eth_serdes_hw_init(struct r8a779f0_eth_serdes_channel *channel)
> +{
> +	int ret;
> +
> +	ret = r8a779f0_eth_serdes_common_init_ram(channel);
> +	if (ret)
> +		return ret;
> +
> +	ret = r8a779f0_eth_serdes_reg_wait(channel->addr, 0x0000, 0x300, BIT(15), 0);
> +	if (ret)
> +		return ret;
> +
> +	r8a779f0_eth_serdes_write32(channel->addr, 0x03d4, 0x380, 0x0443);
> +
> +	ret = r8a779f0_eth_serdes_common_setting(channel);
> +	if (ret)
> +		return ret;
> +
> +	r8a779f0_eth_serdes_write32(channel->addr, 0x03d0, 0x380, 0x0001);
> +
> +	r8a779f0_eth_serdes_write32(channel->addr0, 0x0000, 0x380, 0x8000);
> +
> +	ret = r8a779f0_eth_serdes_common_init_ram(channel);
> +	if (ret)
> +		return ret;
> +
> +	ret = r8a779f0_eth_serdes_reg_wait(channel->addr0, 0x0000, 0x380, BIT(15), 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = r8a779f0_eth_serdes_chan_setting(channel);
> +	if (ret)
> +		return ret;
> +
> +	r8a779f0_eth_serdes_write32(channel->addr, 0x03c0, 0x380, 0x0000);
> +	r8a779f0_eth_serdes_write32(channel->addr, 0x03d0, 0x380, 0x0000);
> +
> +	return 0;
> +}
> +
> +static int r8a779f0_eth_serdes_init(struct phy *p)
> +{
> +	struct r8a779f0_eth_serdes_channel *channel = phy_get_drvdata(p);
> +
> +	return r8a779f0_eth_serdes_hw_init(channel);
> +}
> +
> +static int r8a779f0_eth_serdes_set_mode(struct phy *p, enum phy_mode mode,
> +					int submode)
> +{
> +	struct r8a779f0_eth_serdes_channel *channel = phy_get_drvdata(p);
> +
> +	if (mode != PHY_MODE_ETHERNET)
> +		return -EOPNOTSUPP;
> +
> +	switch (submode) {
> +	case PHY_INTERFACE_MODE_GMII:
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_USXGMII:
> +		channel->phy_interface = submode;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int r8a779f0_eth_serdes_set_speed(struct phy *p, int speed)
> +{
> +	struct r8a779f0_eth_serdes_channel *channel = phy_get_drvdata(p);
> +
> +	channel->speed = speed;
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops r8a779f0_eth_serdes_ops = {
> +	.init		= r8a779f0_eth_serdes_init,
> +	.set_mode	= r8a779f0_eth_serdes_set_mode,
> +	.set_speed	= r8a779f0_eth_serdes_set_speed,
> +};
> +
> +static struct phy *r8a779f0_eth_serdes_xlate(struct device *dev,
> +					     struct of_phandle_args *args)
> +{
> +	struct r8a779f0_eth_serdes_drv_data *dd = dev_get_drvdata(dev);
> +
> +	if (args->args[0] >= R8A779F0_ETH_SERDES_NUM)
> +		return ERR_PTR(-ENODEV);
> +
> +	return dd->channel[args->args[0]].phy;
> +}
> +
> +static const struct of_device_id r8a779f0_eth_serdes_of_table[] = {
> +	{ .compatible = "renesas,r8a779f0-ether-serdes", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, r8a779f0_eth_serdes_of_table);
> +
> +static int r8a779f0_eth_serdes_probe(struct platform_device *pdev)
> +{
> +	struct r8a779f0_eth_serdes_drv_data *dd;
> +	struct phy_provider *provider;
> +	struct resource *res;
> +	int i, ret;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "invalid resource\n");
> +		return -EINVAL;
> +	}
> +
> +	dd = devm_kzalloc(&pdev->dev, sizeof(*dd), GFP_KERNEL);
> +	if (!dd)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, dd);
> +	dd->pdev = pdev;
> +	dd->addr = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(dd->addr))
> +		return PTR_ERR(dd->addr);
> +
> +	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
> +		struct r8a779f0_eth_serdes_channel *channel = &dd->channel[i];
> +
> +		channel->phy = devm_phy_create(&pdev->dev, NULL,
> +					       &r8a779f0_eth_serdes_ops);
> +		if (IS_ERR(channel->phy))
> +			return PTR_ERR(channel->phy);
> +		channel->addr = dd->addr + R8A779F0_ETH_SERDES_OFFSET * i;
> +		channel->addr0 = dd->addr;
> +		phy_set_drvdata(channel->phy, channel);
> +	}
> +
> +	provider = devm_of_phy_provider_register(&pdev->dev,
> +						 r8a779f0_eth_serdes_xlate);
> +	if (IS_ERR(provider))
> +		return PTR_ERR(provider);
> +
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_get_sync(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static int r8a779f0_eth_serdes_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_put(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +
> +	platform_set_drvdata(pdev, NULL);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver r8a779f0_eth_serdes_driver_platform = {
> +	.probe = r8a779f0_eth_serdes_probe,
> +	.remove = r8a779f0_eth_serdes_remove,
> +	.driver = {
> +		.name = "r8a779f0_eth_serdes",
> +		.of_match_table = r8a779f0_eth_serdes_of_table,
> +	}
> +};
> +module_platform_driver(r8a779f0_eth_serdes_driver_platform);
> +MODULE_AUTHOR("Yoshihiro Shimoda");
> +MODULE_DESCRIPTION("Renesas Ethernet SERDES device driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1

-- 
~Vinod
