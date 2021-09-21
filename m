Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915CB4131FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Sep 2021 12:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbhIUKyP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 06:54:15 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:16618 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbhIUKyO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 06:54:14 -0400
X-Greylist: delayed 345 seconds by postgrey-1.27 at vger.kernel.org; Tue, 21 Sep 2021 06:54:14 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632221564;
    s=strato-dkim-0002; d=fpond.eu;
    h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=5ZiL/DvbSdQMOc3siXMKbdtumd46NzwNgOGqyf+Yz9s=;
    b=PwO1SEYt4tSIqcRtfKkrhzSxsrvdy+A+gzmQtIsZMEAhuxWhxKXAIEU5dkMKIaNtgB
    dlusPb1m0sLp1SL/WkpdZ9/n98/+WkX5R+7l1vglcB9vVyrB0puH917GEjx5d7SiC3uH
    K3Z0iQRvIJXnDKWN6D9LZXSMiO2xK4soTNROvYUNLD+ctqQC51YiFhIGRPLfDSnAh20T
    fzlZCFzi0XHB7/6WYJNVFFAOj3QxtIldHvh2J/FdzJlHXLZIEaK7u9qSIJXq0rsg354c
    7WorvfWKUudN+tqabdVxeIQKYqn3DarGqYNtgF1xaOXYKlaEvsiD7ZWXnVoxZ3P9psrG
    79Pg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fGl/w2B+Io="
X-RZG-CLASS-ID: mo00
Received: from oxapp02-03.back.ox.d0m.de
    by smtp-ox.front (RZmta 47.33.8 AUTH)
    with ESMTPSA id c00f85x8LAqi4Hp
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 21 Sep 2021 12:52:44 +0200 (CEST)
Date:   Tue, 21 Sep 2021 12:52:44 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <1484614497.1401661.1632221564869@webmail.strato.com>
In-Reply-To: <b1710bb6ea5faa7a7fe74404adb0beb951e0bf8c.1631699160.git.geert+renesas@glider.be>
References: <b1710bb6ea5faa7a7fe74404adb0beb951e0bf8c.1631699160.git.geert+renesas@glider.be>
Subject: Re: [PATCH] irqchip/renesas-rza1: Use semicolons instead of commas
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.5-Rev23
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 09/15/2021 11:47 AM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
>  
> This code works, but it is cleaner to use semicolons at the end of
> statements instead of commas.
> 
> Extracted from a big anonymous patch by Julia Lawall
> <julia.lawall@inria.fr>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/irqchip/irq-renesas-rza1.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-renesas-rza1.c b/drivers/irqchip/irq-renesas-rza1.c
> index b0d46ac42b892340..72c06e883d1c5fd5 100644
> --- a/drivers/irqchip/irq-renesas-rza1.c
> +++ b/drivers/irqchip/irq-renesas-rza1.c
> @@ -223,12 +223,12 @@ static int rza1_irqc_probe(struct platform_device *pdev)
>  		goto out_put_node;
>  	}
>  
> -	priv->chip.name = "rza1-irqc",
> -	priv->chip.irq_mask = irq_chip_mask_parent,
> -	priv->chip.irq_unmask = irq_chip_unmask_parent,
> -	priv->chip.irq_eoi = rza1_irqc_eoi,
> -	priv->chip.irq_retrigger = irq_chip_retrigger_hierarchy,
> -	priv->chip.irq_set_type = rza1_irqc_set_type,
> +	priv->chip.name = "rza1-irqc";
> +	priv->chip.irq_mask = irq_chip_mask_parent;
> +	priv->chip.irq_unmask = irq_chip_unmask_parent;
> +	priv->chip.irq_eoi = rza1_irqc_eoi;
> +	priv->chip.irq_retrigger = irq_chip_retrigger_hierarchy;
> +	priv->chip.irq_set_type = rza1_irqc_set_type;
>  	priv->chip.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE;
>  
>  	priv->irq_domain = irq_domain_add_hierarchy(parent, 0, IRQC_NUM_IRQ,
> -- 
> 2.25.1

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
