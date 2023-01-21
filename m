Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4442A6765B9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jan 2023 11:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjAUKem (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 21 Jan 2023 05:34:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjAUKem (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jan 2023 05:34:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D294718A87;
        Sat, 21 Jan 2023 02:34:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7EC86B82B88;
        Sat, 21 Jan 2023 10:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7397C433D2;
        Sat, 21 Jan 2023 10:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674297278;
        bh=Hn5wcaiy+leZKED4HRUyYNHdqwAWfMoVRI3MvccFlvQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rdF7KufZVtRXa2DzHvZHmu2ZRr7pSR7t38YcX+9sqPJhLhY7zz5/gcPWm62oEmaSG
         k9pyvYS3WDFcMIVBMlidY9UymKp4+H3bYLgU8bM5/V+8oYdVcamiqchpLeOT0tzzCB
         4qHPPGGorSSgpMHp9wd3KRXYIuWl9szX+TZ7HlmU=
Date:   Sat, 21 Jan 2023 11:06:02 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 00/12] ADD USB3.1 HOST, Peri and DRD support
Message-ID: <Y8u5Cpl2B5b2mzPp@kroah.com>
References: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
 <Y8lBKKPjci7+goiV@kroah.com>
 <OS0PR01MB59221827031B393F6FB693E786CA9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59221827031B393F6FB693E786CA9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Jan 21, 2023 at 09:59:53AM +0000, Biju Das wrote:
> Hi Greg,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH v2 00/12] ADD USB3.1 HOST, Peri and DRD support
> > 
> > On Thu, Jan 12, 2023 at 09:58:54PM +0000, Biju Das wrote:
> > > This patch series aims to add USB3.1 HOST, Peri and DRD support on
> > > RZ/V2M EVK platform.
> > >
> > > The reset for both host and peri are located in USB3DRD block. The
> > > USB3DRD registers are mapped in the AXI address space of the
> > > Peripheral module.
> > >
> > > RZ/V2M XHCI is similar to R-Car XHCI but it doesn't require any
> > > firmware.
> > >
> > > Host/device needs to do reset release and set the host/device function
> > > on DRD module, before accessing any registers.
> > 
> > After applying this series and building it on x86_64 I get the following
> > build errors:
> > 
> > ERROR: modpost: "rzv2m_usb3drd_reset" [drivers/usb/host/xhci-plat-hcd.ko]
> > undefined!
> > ERROR: modpost: "rzv2m_usb3drd_reset"
> > [drivers/usb/gadget/udc/renesas_usb3.ko] undefined!
> 
> The file drivers/usb/gadget/udc/rzv2m_usb3drd.c is not getting compiled,
> 
> If USB_RZV2M_USB3DRD=y, USB_XHCI_RZV2M=m and USB_RENESAS_USB3=m and 
> Because of that modpost is giving undefined error.
> 
> So I have updated the KCONFIG like below and now it builds OK now. I will send next version
> based on this, if there are no comments.
> 
> -- a/drivers/usb/gadget/udc/Kconfig
> +++ b/drivers/usb/gadget/udc/Kconfig
> @@ -180,10 +180,17 @@ config USB_RENESAS_USBHS_UDC
>            gadget drivers to also be dynamically linked.
>  
>  config USB_RZV2M_USB3DRD
> +       tristate 'Renesas USB3.1 DRD controller'
>         depends on ARCH_R9A09G011 || COMPILE_TEST
> -       bool
> -       default y if USB_XHCI_RZV2M
> -       default y if USB_RENESAS_USB3
> +       default y if USB_XHCI_RZV2M=y
> +       default y if USB_RENESAS_USB3=y


These should just be:
	default USB_XHCI_RZV2M
	default USB_RENESAS_USB3
right?

thanks,

greg k-h
