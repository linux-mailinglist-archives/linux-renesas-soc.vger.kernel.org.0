Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC54B674BD4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jan 2023 06:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjATFLH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Jan 2023 00:11:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbjATFKv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 00:10:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6D5A1036;
        Thu, 19 Jan 2023 20:58:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B6E9CB82338;
        Thu, 19 Jan 2023 13:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2131C433D2;
        Thu, 19 Jan 2023 13:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674133803;
        bh=E8WnlaXuMoIHoxLQkdjKRvzK/gOIXYE5uRmmWpBtzqQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=x+vflYQaOjePpkJYvoCf3R8lo6M4R+ygaY/6avHYGCg0F9d/uPVVKyezu8CTpjnhK
         lGV8wSAsIRXaGBye3xT/Rse+TL1pcbgbscXrvpB1NWBO8QJFssmrOP7ziwYHSZMDD/
         pDGZrFbAH/HLVHY+h/YmFI/5kyL+hemCG4SrhrsY=
Date:   Thu, 19 Jan 2023 14:10:00 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/12] ADD USB3.1 HOST, Peri and DRD support
Message-ID: <Y8lBKKPjci7+goiV@kroah.com>
References: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 12, 2023 at 09:58:54PM +0000, Biju Das wrote:
> This patch series aims to add USB3.1 HOST, Peri and DRD support
> on RZ/V2M EVK platform.
> 
> The reset for both host and peri are located in USB3DRD block. The
> USB3DRD registers are mapped in the AXI address space of the Peripheral
> module.
> 
> RZ/V2M XHCI is similar to R-Car XHCI but it doesn't require any
> firmware.
> 
> Host/device needs to do reset release and set the host/device function
> on DRD module, before accessing any registers.

After applying this series and building it on x86_64 I get the following
build errors:

ERROR: modpost: "rzv2m_usb3drd_reset" [drivers/usb/host/xhci-plat-hcd.ko] undefined!
ERROR: modpost: "rzv2m_usb3drd_reset" [drivers/usb/gadget/udc/renesas_usb3.ko] undefined!

:(

