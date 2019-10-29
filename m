Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03A50E8C3F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2019 16:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390193AbfJ2P6m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Oct 2019 11:58:42 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55917 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390192AbfJ2P6m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Oct 2019 11:58:42 -0400
Received: by mail-wm1-f65.google.com with SMTP id g24so3153215wmh.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Oct 2019 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ogyg03BfT8gaHZbuV4/3535qjZlsTqwkzaB+k+qmJSk=;
        b=auxvEGz+98ZDBi/3qT4estTcr/B0w8IzvpYRBlJghVDt+kEZTN1DrBp6hsX/szCm0S
         Ntg3b9Z1+ejknx7Ccrkleqkzjl8Ky11vHSpEAGmlWVbc6JJnMtLuoVbGHlLb8LrKT3cn
         uKPaHB3q+wCzJC2R81txkKTpwzgO4YZ3vvsV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ogyg03BfT8gaHZbuV4/3535qjZlsTqwkzaB+k+qmJSk=;
        b=bZvqMyH5JHPFX1y2mpQOaUWNM8xCv2CUcgbMNbNFJOO/Qx8OAt6joXLu8DIaLFLv0G
         2iOZ+MoG70Ev1ClNLhAltMYTdDxJxJwLnmETVHuiUvrzSd9Kx7RGB7xYzyu4N8sF7iDN
         mmri4M+Kcs+g/hfax+voCNEYP0k2h0ZsbRmnx5/bKotUDeUSAX5uTsLk8j9aGEf72lxs
         2at8panBDIQ2RChdAh8v/mTl2eArCKD16daE30+0jW+3B55ONa8ZNUSYoR2AkpNgQA06
         PzQOXaM5Mr8B+4Be4Ra2X46RNBzqnrsAlRynlV02rabvDFIx4pFRAKKoG5Oe19CxaWMi
         yhXQ==
X-Gm-Message-State: APjAAAXGJyyuNKYVA5Y8tF6IzKIWuJWypx6vYBi2PuCB4I/hXwzB+bCp
        VbyHj5tcS/xypTINDiIsdEFlLYd/BbnTklhYgqlsZA==
X-Google-Smtp-Source: APXvYqxXBunHeyxtZsAWTCPejceTiGMbnnAGC4cBuQxzLelWDxFoP9zriSI9AupBxaoECqcivUoGxX1DNc3YZFr8rtQ=
X-Received: by 2002:a1c:6282:: with SMTP id w124mr4723287wmb.172.1572364718992;
 Tue, 29 Oct 2019 08:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191028163256.8004-1-robh@kernel.org> <20191028163256.8004-8-robh@kernel.org>
In-Reply-To: <20191028163256.8004-8-robh@kernel.org>
From:   Srinath Mannam <srinath.mannam@broadcom.com>
Date:   Tue, 29 Oct 2019 21:28:27 +0530
Message-ID: <CABe79T4uF0vnxAbbR-ckr4uBpni3KmD2RYqSS_jUh-KRDFLvzQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/25] PCI: iproc: Use pci_parse_request_of_pci_ranges()
To:     Rob Herring <robh@kernel.org>
Cc:     Andrew Murray <andrew.murray@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-pci@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Christoph Hellwig <hch@infradead.org>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
        Ley Foon Tan <lftan@altera.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Ray Jui <rjui@broadcom.com>, rfi@lists.rocketboards.org,
        Ryder Lee <ryder.lee@mediatek.com>,
        Scott Branden <sbranden@broadcom.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Simon Horman <horms@verge.net.au>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Toan Le <toan@os.amperecomputing.com>,
        Tom Joseph <tjoseph@cadence.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

I reviewed and verified this change.. It is working fine.

Regards,
Srinath.

On Mon, Oct 28, 2019 at 10:03 PM Rob Herring <robh@kernel.org> wrote:
>
> Convert the iProc host bridge to use the common
> pci_parse_request_of_pci_ranges().
>
> There's no need to assign the resources to a temporary list, so just use
> bridge->windows directly.
>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Reviewed-by: Andrew Murray <andrew.murray@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/pcie-iproc-platform.c | 8 ++------
>  drivers/pci/controller/pcie-iproc.c          | 5 -----
>  2 files changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-iproc-platform.c b/drivers/pci/controller/pcie-iproc-platform.c
> index 9ee6200a66f4..375d815f7301 100644
> --- a/drivers/pci/controller/pcie-iproc-platform.c
> +++ b/drivers/pci/controller/pcie-iproc-platform.c
> @@ -43,8 +43,6 @@ static int iproc_pcie_pltfm_probe(struct platform_device *pdev)
>         struct iproc_pcie *pcie;
>         struct device_node *np = dev->of_node;
>         struct resource reg;
> -       resource_size_t iobase = 0;
> -       LIST_HEAD(resources);
>         struct pci_host_bridge *bridge;
>         int ret;
>
> @@ -97,8 +95,7 @@ static int iproc_pcie_pltfm_probe(struct platform_device *pdev)
>         if (IS_ERR(pcie->phy))
>                 return PTR_ERR(pcie->phy);
>
> -       ret = devm_of_pci_get_host_bridge_resources(dev, 0, 0xff, &resources,
> -                                                   &iobase);
> +       ret = pci_parse_request_of_pci_ranges(dev, &bridge->windows, NULL);
>         if (ret) {
>                 dev_err(dev, "unable to get PCI host bridge resources\n");
>                 return ret;
> @@ -113,10 +110,9 @@ static int iproc_pcie_pltfm_probe(struct platform_device *pdev)
>                 pcie->map_irq = of_irq_parse_and_map_pci;
>         }
>
> -       ret = iproc_pcie_setup(pcie, &resources);
> +       ret = iproc_pcie_setup(pcie, &bridge->windows);
>         if (ret) {
>                 dev_err(dev, "PCIe controller setup failed\n");
> -               pci_free_resource_list(&resources);
>                 return ret;
>         }
>
> diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
> index 2d457bfdaf66..223335ee791a 100644
> --- a/drivers/pci/controller/pcie-iproc.c
> +++ b/drivers/pci/controller/pcie-iproc.c
> @@ -1498,10 +1498,6 @@ int iproc_pcie_setup(struct iproc_pcie *pcie, struct list_head *res)
>                 return ret;
>         }
>
> -       ret = devm_request_pci_bus_resources(dev, res);
> -       if (ret)
> -               return ret;
> -
>         ret = phy_init(pcie->phy);
>         if (ret) {
>                 dev_err(dev, "unable to initialize PCIe PHY\n");
> @@ -1543,7 +1539,6 @@ int iproc_pcie_setup(struct iproc_pcie *pcie, struct list_head *res)
>                 if (iproc_pcie_msi_enable(pcie))
>                         dev_info(dev, "not using iProc MSI\n");
>
> -       list_splice_init(res, &host->windows);
>         host->busnr = 0;
>         host->dev.parent = dev;
>         host->ops = &iproc_pcie_ops;
> --
> 2.20.1
>
