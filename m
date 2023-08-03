Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB4976E018
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Aug 2023 08:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbjHCGTI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Aug 2023 02:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbjHCGTH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2023 02:19:07 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DACD89B;
        Wed,  2 Aug 2023 23:19:04 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04764C0006;
        Thu,  3 Aug 2023 06:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1691043543;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VhI5vCPN+R0xd4H4c7oVi65dOJLgC90tXaITSdvpX38=;
        b=cgtX1cOzaVzDcL97g26JYpcOkGdgZvSQg/mTPSeMrLGnS6XmFoOc8OzIJkw+Dt+uytHWUC
        njDLhG8tEF6ED0PLpEkFnFBJGUD63dakBmT9oRu1ZljlgZct9B4pcecf51csdZnEMWz0VB
        FfZijUD/W2nqYxivKPi3skZ38StRapE3t7lxrYGbbkuMvAEEa8ywYfCzg+Fyn7bPu/oxGZ
        qgLTYKyKxgGDRjnEWxTGCipDMc+CJpr+oxtIZ0F4YPp4qL1NSz9re+szj0VDnbxXnc4GUR
        ZBG72TFbsIjua7BFqI6/TQgxlh05Open8V0jFuX1PfrOiwUJRzUo1BFjZIu/2g==
Date:   Thu, 3 Aug 2023 08:19:00 +0200
From:   Herve Codina <herve.codina@bootlin.com>
To:     Li Zetao <lizetao1@huawei.com>
Cc:     <gregkh@linuxfoundation.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH -next] usb: gadget: udc: Remove redundant initialization
 for udc_driver
Message-ID: <20230803081900.250f0cc8@bootlin.com>
In-Reply-To: <20230803032838.3045730-1-lizetao1@huawei.com>
References: <20230803032838.3045730-1-lizetao1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Li,

On Thu, 3 Aug 2023 11:28:38 +0800
Li Zetao <lizetao1@huawei.com> wrote:

> There is a warning reported by coccinelle:
> 
> ./drivers/usb/gadget/udc/renesas_usbf.c:3381:3-8:
> 		No need to set .owner here. The core will do it.
> 
> The module_platform_driver() will set "THIS_MODULE" to driver.owner
> when register a driver for platform-level devices, so it is redundant
> initialization to set driver.owner in udc_driver statement. Remove it
> to silence the warning.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/usb/gadget/udc/renesas_usbf.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/renesas_usbf.c b/drivers/usb/gadget/udc/renesas_usbf.c
> index 3482b41d0646..657f265ac7cc 100644
> --- a/drivers/usb/gadget/udc/renesas_usbf.c
> +++ b/drivers/usb/gadget/udc/renesas_usbf.c
> @@ -3378,7 +3378,6 @@ MODULE_DEVICE_TABLE(of, usbf_match);
>  static struct platform_driver udc_driver = {
>  	.driver = {
>  		.name = "usbf_renesas",
> -		.owner = THIS_MODULE,
>  		.of_match_table = usbf_match,
>  	},
>  	.probe          = usbf_probe,

Acked-by: Herve Codina <herve.codina@bootlin.com>

Thanks,
Hervé
