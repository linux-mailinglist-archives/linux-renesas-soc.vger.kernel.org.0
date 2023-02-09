Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBBC2690BB6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 15:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbjBIO3k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 09:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbjBIO3j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 09:29:39 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F685C888;
        Thu,  9 Feb 2023 06:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675952977; x=1707488977;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1jK+NkthxLRcjk6uhZiNcI/lPSkl8dRR58tmBjTDojU=;
  b=STcNvOu8SCGxt5YCAba+wO01dG+TaujzQ6uWUHrD3yknLTWpnl2rdJNd
   VP/844BxnxbMXEAiLCPdwCdWXFdpJL913oGMHA8lZh8WyQeLOVCfXb00E
   WWRu3zXcEdCcOFQ/HUSO913Aox75fu5JYWTqohcHYGbE0W2fQqdlEnSLm
   picVCv0DdOA9lZGUWIM9G2JYJ4DE97gq46pylp72cwp9NziLwGI8ZYZCZ
   wHGO7geH6SSB/3ZsBG4Jd2eYJqgqJi6nuHQX2lj2DeDhC68/fuXwd3rwA
   FhynDj7YJiL6YV8ORhJc7sA0O+Fq1pg2xl7Xp1Zq/LaUsqlEzAaUPCQ2b
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309765506"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="309765506"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 06:29:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="756413571"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="756413571"
Received: from enguerra-mobl.ger.corp.intel.com ([10.249.36.120])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 06:29:35 -0800
Date:   Thu, 9 Feb 2023 16:29:32 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] serial: 8250_em: Add serial8250_rzv2m_reg_update()
In-Reply-To: <20230209132630.194947-4-biju.das.jz@bp.renesas.com>
Message-ID: <6feee947-a66-81eb-59b-e882e665af25@linux.intel.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com> <20230209132630.194947-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 9 Feb 2023, Biju Das wrote:

> As per HW manual section 40.6.1, we need to perform FIFO reset + SW
> reset before updating the below registers
> 
> FCR[7:5], FCR[3:0], LCR[7][5:0], MCR[6:4], DLL[7:0], DLM[7:0] and
> HCR0[6:5][3:2].
> 
> This patch adds serial8250_rzv2m_reg_update() to handle it.
> 
> DLL/DLM register can be updated only by setting LCR[7]. So the
> updation of LCR[7] will perform reset for DLL/DLM register changes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/tty/serial/8250/8250_em.c | 49 +++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
> index 3a45aa066d3d..a1e42b8ef99d 100644
> --- a/drivers/tty/serial/8250/8250_em.c
> +++ b/drivers/tty/serial/8250/8250_em.c
> @@ -9,6 +9,7 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/of.h>
>  #include <linux/serial_8250.h>
>  #include <linux/serial_reg.h>
>  #include <linux/platform_device.h>
> @@ -18,14 +19,53 @@
>  
>  #define UART_DLL_EM 9
>  #define UART_DLM_EM 10
> +#define UART_HCR0 11
> +
> +#define UART_HCR0_SW_RESET	BIT(7) /* SW Reset */
>  
>  struct serial8250_em_priv {
>  	struct clk *sclk;
>  	int line;
> +	bool is_rzv2m;
>  };
>  
> +static void serial8250_rzv2m_reg_update(struct uart_port *p, int off, int value)
> +{
> +	unsigned int ier, fcr, lcr, mcr, hcr0;
> +
> +	ier = readl(p->membase + (UART_IER << 2));
> +	hcr0 = readl(p->membase + (UART_HCR0 << 2));
> +	fcr = readl(p->membase + ((UART_FCR + 1) << 2));
> +	lcr = readl(p->membase + ((UART_LCR + 1) << 2));
> +	mcr = readl(p->membase + ((UART_MCR + 1) << 2));
> +
> +	writel(fcr | UART_FCR_CLEAR_RCVR | UART_FCR_CLEAR_XMIT, p->membase + ((UART_FCR + 1) << 2));
> +	writel(hcr0 | UART_HCR0_SW_RESET, p->membase + (UART_HCR0 << 2));
> +	writel(hcr0 & ~UART_HCR0_SW_RESET, p->membase + (UART_HCR0 << 2));
> +
> +	switch (off) {
> +	case UART_FCR:
> +		fcr = value;
> +		break;
> +	case UART_LCR:
> +		lcr = value;
> +		break;
> +	case UART_MCR:
> +		mcr = value;
> +		break;
> +	}
> +
> +	writel(ier, p->membase + (UART_IER << 2));
> +	writel(fcr, p->membase + ((UART_FCR + 1) << 2));
> +	writel(mcr, p->membase + ((UART_MCR + 1) << 2));
> +	writel(lcr, p->membase + ((UART_LCR + 1) << 2));
> +	writel(hcr0, p->membase + (UART_HCR0 << 2));
> +}
> +
>  static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
>  {
> +	struct serial8250_em_priv *priv = p->private_data;
> +
>  	switch (offset) {
>  	case UART_TX: /* TX @ 0x00 */
>  		writeb(value, p->membase);
> @@ -33,6 +73,11 @@ static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
>  	case UART_FCR: /* FCR @ 0x0c (+1) */
>  	case UART_LCR: /* LCR @ 0x10 (+1) */
>  	case UART_MCR: /* MCR @ 0x14 (+1) */
> +		if (priv->is_rzv2m)
> +			serial8250_rzv2m_reg_update(p, offset, value);
> +		else
> +			writel(value, p->membase + ((offset + 1) << 2));
> +		break;

Create serial8250_em_rzv2m_serial_out() that does the necessary magic and 
calls serial8250_em_serial_out() in other cases.

I think you can use .data in of_device_id table to pick the correct 
.serial_out function so you don't need to add that bool at all.

>  	case UART_SCR: /* SCR @ 0x20 (+1) */
>  		writel(value, p->membase + ((offset + 1) << 2));
>  		break;
> @@ -111,6 +156,10 @@ static int serial8250_em_probe(struct platform_device *pdev)
>  	up.port.uartclk = clk_get_rate(priv->sclk);
>  
>  	up.port.iotype = UPIO_MEM32;
> +
> +	if (of_device_is_compatible(dev->of_node, "renesas,r9a09g011-uart"))
> +		priv->is_rzv2m = true;
> +
>  	up.port.serial_in = serial8250_em_serial_in;
>  	up.port.serial_out = serial8250_em_serial_out;
>  	up.dl_read = serial8250_em_serial_dl_read;
> 

I'm bit lost why you need patch 1/3 and cannot set the port type and 
capabilities here?

-- 
 i.

