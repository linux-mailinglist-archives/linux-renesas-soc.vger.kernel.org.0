Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEE0719662
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 03:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbfEJB5R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 21:57:17 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:47806 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726802AbfEJB5R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 21:57:17 -0400
X-UUID: 344f83f2b9144eaba0e11e059553f72b-20190510
X-UUID: 344f83f2b9144eaba0e11e059553f72b-20190510
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1513151989; Fri, 10 May 2019 09:57:08 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 10 May
 2019 09:57:06 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 May 2019 09:57:06 +0800
Message-ID: <1557453426.10179.278.camel@mhfsdcap03>
Subject: Re: [PATCH v2 03/15] phy: renesas: rcar-gen3-usb2: detect usb_x1
 clock
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Chris Brandt <chris.brandt@renesas.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Date:   Fri, 10 May 2019 09:57:06 +0800
In-Reply-To: <20190509201142.10543-4-chris.brandt@renesas.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
         <20190509201142.10543-4-chris.brandt@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 2019-05-09 at 15:11 -0500, Chris Brandt wrote:
> The RZ/A2 has an optional dedicated 48MHz clock input for the PLL.
> If a clock node named 'usb_x1' exists and set to non-zero, then we can
> assume we want it use it.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * use 'usb_x1' clock node instead of 'renesas,uses_usb_x1' property
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index 1322185a00a2..1ebb08f8323f 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -34,6 +34,7 @@
>  #define USB2_VBCTRL		0x60c
>  #define USB2_LINECTRL1		0x610
>  #define USB2_ADPCTRL		0x630
> +#define USB2_PHYCLK_CTRL	0x644
>  
>  /* INT_ENABLE */
>  #define USB2_INT_ENABLE_UCOM_INTEN	BIT(3)
> @@ -110,6 +111,7 @@ struct rcar_gen3_chan {
>  	bool extcon_host;
>  	bool is_otg_channel;
>  	bool uses_otg_pins;
> +	bool uses_usb_x1;
>  };
>  
>  /*
> @@ -391,6 +393,9 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>  	void __iomem *usb2_base = channel->base;
>  	u32 val;
>  
> +	if (channel->uses_usb_x1)
> +		writel(0x00000001, usb2_base + USB2_PHYCLK_CTRL);
                         ^^^^ avoid magic number?
> +
>  	/* Initialize USB2 part */
>  	val = readl(usb2_base + USB2_INT_ENABLE);
>  	val |= USB2_INT_ENABLE_UCOM_INTEN | rphy->int_enable_bits;
> @@ -582,10 +587,12 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct rcar_gen3_chan *channel;
> +	struct device_node *usb_x1_clk;
>  	struct phy_provider *provider;
>  	struct resource *res;
>  	const struct phy_ops *phy_usb2_ops;
>  	int irq, ret = 0, i;
> +	u32 freq_usb = 0;
>  
>  	if (!dev->of_node) {
>  		dev_err(dev, "This driver needs device tree\n");
> @@ -630,6 +637,13 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	usb_x1_clk = of_find_node_by_name(NULL, "usb_x1");
> +	if (usb_x1_clk) {
> +		of_property_read_u32(usb_x1_clk, "clock-frequency", &freq_usb);
> +		if (freq_usb)
> +			channel->uses_usb_x1 = true;
> +	}
> +
>  	/*
>  	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
>  	 * And then, phy-core will manage runtime pm for this device.


