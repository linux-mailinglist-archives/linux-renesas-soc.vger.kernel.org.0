Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98CD6590575
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Aug 2022 19:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236013AbiHKRNR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Aug 2022 13:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235358AbiHKRMx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Aug 2022 13:12:53 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C6DBEE20
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 09:53:24 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id q16so17602585pgq.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 09:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=FrEgly12wj2ttxZWwOI1z30y1JdS/EZuSClhPVGvhZ0=;
        b=QZ5Z6/hK+x84b+71V1583oW+eo8ZntWTD681dmHF5tMcqWEcKm77ur2URjyeChO7Kw
         Dc/Iz1jNz1zd8Fi+wgT9f/kHanPE54dIBe6/4xSI7SpSKExiFGn+QrQ83dGmgHJC6Jw3
         9ug8SKR+1qqNfoxncgtdvbIqbYZysw0Zm7LN6HUf9gqSoZpIuyNEWBRgggHKoUp7GuGt
         Q+u06MkeaKgMmhuYhL1+xqNIwfCQUqZH6YJHidUSgIQ5yQFn/8KRMx0Wxnc2UNR9DlQp
         wIKC6qY1jrS8SB0Fa1602gNNQMLH0m8e7cGFZVnJRUZZtOaiXQU1Y5TA+Br3DwTktk7k
         N21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=FrEgly12wj2ttxZWwOI1z30y1JdS/EZuSClhPVGvhZ0=;
        b=Ii/OFiv9DSbbLyI50KIacqo+zNggLtQMabOv3ZEMuSEWWu3FcJI7HXSb4yRag18P47
         Zjgy7qM2rk348TynRKv/vANJhMGhzxW40SZ9F05sslSY47KdSNKxjpo3jESZl4Q88KaQ
         HV9m7Q/7ZPghwTz0I/FDjVWLjz7MDHZTHI2jEOvOyysEEQz/RQix3vOOp7GU9o7A+8zF
         u/nc8Fn3mUE2D/1U578OO1XyS7OS75gFf1M6xIoJGIaKTsdIba8rz6zQa0Cltpw5cv+m
         6/FOnOBGKREHTeljlzl9lm/dhxgCx4q4adKPvW4P/Jw4wqOk4Yi92djskNWACgjeMkmA
         jCcQ==
X-Gm-Message-State: ACgBeo2cJN2UAXeX84dMlOrWfEnG+8aEVaTXI8oGTwSfdimiZeMH2Bvi
        xSJt0RtflV0LxKGFMsSIXaalBQ==
X-Google-Smtp-Source: AA6agR4fuHrlbaBUcfW6dqvlDIAK+Gdkb0dRJ7THLkB8hrpd5Nm7gJB9VVI4+QcYfHGkZI3VELHz6w==
X-Received: by 2002:a63:8143:0:b0:41b:ee3b:1b66 with SMTP id t64-20020a638143000000b0041bee3b1b66mr14399pgd.31.1660236803743;
        Thu, 11 Aug 2022 09:53:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id w23-20020a1709027b9700b0016c68b56be7sm2751222pll.158.2022.08.11.09.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 09:53:23 -0700 (PDT)
Date:   Thu, 11 Aug 2022 09:53:23 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 09:21:37 PDT (-0700)
Subject:     Re: [PATCH] irqchip/sifive-plic: Make struct irq_chip const
In-Reply-To: <20220624175639.2677-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
CC:     tglx@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
        linux-riscv@lists.infradead.org, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        prabhakar.csengg@gmail.com, biju.das.jz@bp.renesas.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     prabhakar.mahadev-lad.rj@bp.renesas.com,
        Marc Zyngier <maz@kernel.org>
Message-ID: <mhng-16e473fc-4513-4998-b732-9059d2c0b870@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 24 Jun 2022 10:56:39 PDT (-0700), prabhakar.mahadev-lad.rj@bp.renesas.com wrote:
> These should be const, so make it so.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index bb87e4c3b88e..173446cc9204 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -176,7 +176,7 @@ static void plic_irq_eoi(struct irq_data *d)
>  	}
>  }
>
> -static struct irq_chip plic_chip = {
> +static const struct irq_chip plic_chip = {
>  	.name		= "SiFive PLIC",
>  	.irq_mask	= plic_irq_mask,
>  	.irq_unmask	= plic_irq_unmask,

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Not sure if this got picked up somewhere, but it looks fine to me.
