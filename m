Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EB221CEBF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 07:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgGMFRK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 01:17:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:51734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725804AbgGMFRK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 01:17:10 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2120720724;
        Mon, 13 Jul 2020 05:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594617430;
        bh=aDIzWAOIaa0QdRb3SomcHX9OzL94Axn7+kd+SCdMNdw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0EsVqJ0Hy2e8BkgzejMc/xP2d9JNGv5W2rAiPkNMDrRgeotK8f8mO38If88/WUmW2
         8UaILDeySzlj8/SaZvijSSKWKbgkdklC95JvSirBl+976h/tVGWKjtFtAXpR+Wiy7W
         jt6Ty+7S+2vU6z3rEMFAPP8NSbYsyyVGpWt32MIo=
Date:   Mon, 13 Jul 2020 10:47:05 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     kishon@ti.com, wsa+renesas@sang-engineering.com,
        geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: fix SError happen if
 DEBUG_SHIRQ is enabled
Message-ID: <20200713051705.GX34333@vkoul-mobl>
References: <1594290978-8205-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594290978-8205-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Yoshihiro,

On 09-07-20, 19:36, Yoshihiro Shimoda wrote:
> If CONFIG_DEBUG_SHIRQ was enabled, r8a77951-salvator-xs could boot
> correctly. If we appended "earlycon keep_bootcon" to the kernel
> command like, we could get kernel log like below.
> 
>     SError Interrupt on CPU0, code 0xbf000002 -- SError
>     CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3-salvator-x-00505-g6c843129e6faaf01 #785
>     Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
>     pstate: 60400085 (nZCv daIf +PAN -UAO BTYPE=--)
>     pc : rcar_gen3_phy_usb2_irq+0x14/0x54
>     lr : free_irq+0xf4/0x27c
> 
> This means free_irq() calls the interrupt handler while PM runtime
> is not getting if DEBUG_SHIRQ is enabled and rcar_gen3_phy_usb2_probe()
> failed. To fix the issue, add a condition into the interrupt
> handler to avoid register access if any phys are not initialized.
> 
> Note that rcar_gen3_is_any_rphy_initialized() was introduced on v5.2.
> So, if we backports this patch to v5.1 or less, we need to make
> other way.

Should we really check phy is initialized? I think the issue here is
that you register irq first, so your handler can be invoked. Right fix
for this would be to move the irq registration to later in the probe
when we are ready to handle interrupts

> 
> Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Fixes: 9f391c574efc ("phy: rcar-gen3-usb2: add runtime ID/VBUS pin detection")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index bfb22f8..91c732d 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -507,9 +507,13 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
>  {
>  	struct rcar_gen3_chan *ch = _ch;
>  	void __iomem *usb2_base = ch->base;
> -	u32 status = readl(usb2_base + USB2_OBINTSTA);
> +	u32 status;
>  	irqreturn_t ret = IRQ_NONE;
>  
> +	if (!rcar_gen3_is_any_rphy_initialized(ch))
> +		return ret;
> +
> +	status = readl(usb2_base + USB2_OBINTSTA);
>  	if (status & USB2_OBINT_BITS) {
>  		dev_vdbg(ch->dev, "%s: %08x\n", __func__, status);
>  		writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
> -- 
> 2.7.4

-- 
~Vinod
