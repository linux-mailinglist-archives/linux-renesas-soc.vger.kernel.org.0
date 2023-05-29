Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66D0F71441F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 May 2023 08:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbjE2GSI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 May 2023 02:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjE2GSE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 May 2023 02:18:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8DBABB;
        Sun, 28 May 2023 23:17:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126255106133.24.openmobile.ne.jp [126.255.106.133])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64758327;
        Mon, 29 May 2023 08:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685341013;
        bh=ePDUQ1RxSGIiUwSjzwXWcufWMgi1VE2eUijFb3TRkwY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zzz3vH36L52xfvHGSjW3lpi7qd17V3umlChwmpVSlhD3g165Hetyz/QeQmMZFlCtE
         xDdTFgNdn5sEbnXeyvRzebEJt3g8ehrnMWmfgzkGAbAqDTXk4lNo+aLlblK6sfE152
         JUE+Nrc4h2l1QP6RjU1dwOonbuFbSQGE89kycv38=
Date:   Mon, 29 May 2023 09:17:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Zheng Wang <zyytlz.wz@163.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: renesas_usb3: Fix RZ/V2M
 {modprobe,bind} error
Message-ID: <20230529061714.GA25984@pendragon.ideasonboard.com>
References: <20230526143615.372338-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230526143615.372338-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Fri, May 26, 2023 at 03:36:15PM +0100, Biju Das wrote:
> Currently {modprobe, bind} after {rmmod, unbind} results in probe failure.
> 
> genirq: Flags mismatch irq 22. 00000004 (85070400.usb3drd) vs. 00000004 (85070400.usb3drd)
> renesas_usb3: probe of 85070000.usb3peri failed with error -16
> 
> Fix this issue by replacing "parent dev"->"dev" as the irq resource
> is managed by this driver.

If the dev pointer passed to devm_request_irq() is not the correct one,
how does it work the first time the driver is loaded ?

> Fixes: 9cad72dfc556 ("usb: gadget: Add support for RZ/V2M USB3DRD driver"

There's a missing ')' at the end of the line.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/usb/gadget/udc/renesas_usb3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
> index aac8bc185afa..4a37b2e4b9b3 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -2877,7 +2877,7 @@ static int renesas_usb3_probe(struct platform_device *pdev)
>  		struct rzv2m_usb3drd *ddata = dev_get_drvdata(pdev->dev.parent);
>  
>  		usb3->drd_reg = ddata->reg;
> -		ret = devm_request_irq(ddata->dev, ddata->drd_irq,
> +		ret = devm_request_irq(&pdev->dev, ddata->drd_irq,
>  				       renesas_usb3_otg_irq, 0,
>  				       dev_name(ddata->dev), usb3);

Shouldn't you use dev_name(&pdev->dev) too ?

>  		if (ret < 0)

-- 
Regards,

Laurent Pinchart
