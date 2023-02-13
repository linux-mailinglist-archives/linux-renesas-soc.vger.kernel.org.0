Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07D769448F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 12:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjBMLbd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 06:31:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbjBMLb0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 06:31:26 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E1283DE;
        Mon, 13 Feb 2023 03:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676287876; x=1707823876;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VWN5OOiAB9xaWXHFkGwORZO6cxCmH60Q5zH+sqzc2yI=;
  b=e0zAJAHCM9fWNxdAnB2OGiLolplBJ2lJuK8CQRwPE1O6Y+sjiUvwJbkB
   4K/+idlrEqxZVk1h5KsYd7fhlJfy9yr26Kf8K6Lv5maRGmYHwmFYlbe/D
   U2pOmTIm+LL5GgWPno92cIKkBx4VKMvyecHDYJ44/6hGn65iEIijWesfj
   XlWADAhzTH+6JIBN3uqFdejQMGBWPdIh46PzHCT3tTGHnou7DyzsQlO67
   wnR1ZVSmWyuoYxpykqfzDh7N4i3oZBpejWKogTuy050ki+Kg7m69E8mXe
   QhAdCu2FhC5u5BCk4l2k6sEb1kjrXZMU+P4rVs9KLaSI/bAOCBGl9/WJt
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="311231528"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="311231528"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 03:31:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670789125"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="670789125"
Received: from hdevries-mobl.ger.corp.intel.com ([10.249.36.140])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 03:31:13 -0800
Date:   Mon, 13 Feb 2023 13:31:10 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
cc:     Jiri Slaby <jirislaby@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?ISO-8859-15?Q?Niklas_S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
In-Reply-To: <OS0PR01MB5922139BA73BBBE2556161DA86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Message-ID: <4cfed9ad-bf89-7b1-40cd-7def4c64f1@linux.intel.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com> <20230210203439.174913-4-biju.das.jz@bp.renesas.com> <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com> <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <cc7f4d69-7e68-0d0a-4b89-c4e16dff716b@kernel.org> <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org> <f10bcddd-2905-3f63-dd0a-8424798932dc@kernel.org> <OS0PR01MB592210E15CD943F1987316F086DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <283b2e79-e992-dc35-2a79-feccc93103fb@kernel.org> <OS0PR01MB5922139BA73BBBE2556161DA86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 13 Feb 2023, Biju Das wrote:

> Hi Jiri Slaby,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
> > serial8250_em_hw_info
> > 
> > On 13. 02. 23, 10:31, Biju Das wrote:
> > > So looks like similar to other macros, UART_FCR_EM (0x3) is sensible one.
> > >
> > > UART_FCR_RO_OFFSET (9)
> > > UART_FCR_RO_EM (UART_FCR_EM + UART_FCR_RO_OFFSET)
> > >
> > >
> > > static unsigned int serial8250_em_serial_in(struct uart_port *p, int
> > > offset) case UART_FCR_RO_EM:
> > > 	return readl(p->membase + (offset - UART_FCR_RO_OFFSET << 2));
> > 
> > 
> > Please send a complete patch as a reply. I am completely lost now.
> 
> Please find the complete patc.
> 
> 
> From e597ae60eb170c1f1b650e1e533bf4e12c09f822 Mon Sep 17 00:00:00 2001
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Date: Tue, 7 Feb 2023 15:07:13 +0000
> Subject: [PATCH] serial: 8250_em: Add serial_out() to struct
>  serial8250_em_hw_info
> 
> As per RZ/V2M hardware manual(Rev.1.30 Jun, 2022), UART IP has a
> restriction as mentioned below.
> 
> 40.6.1 Point for Caution when Changing the Register Settings:
> 
> When changing the settings of the following registers, a PRESETn master
> reset or FIFO reset + SW reset (FCR[2],FCR[1], HCR0[7]) must be input to
> re-initialize them.
> 
> Target Registers: FCR, LCR, MCR, DLL, DLM, HCR0.
> 
> This patch adds serial_out() to struct serial8250_em_hw_info to
> handle this difference between emma mobile and rz/v2m.
> 
> DLL/DLM register can be updated only by setting LCR[7]. So the
> updation of LCR[7] will perform reset for DLL/DLM register changes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/tty/serial/8250/8250_em.c | 70 ++++++++++++++++++++++++++++++-
>  1 file changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
> index 69cd3b611501..c1c64f48ee7e 100644
> --- a/drivers/tty/serial/8250/8250_em.c
> +++ b/drivers/tty/serial/8250/8250_em.c
> @@ -17,12 +17,23 @@
>  
>  #include "8250.h"
>  
> +#define UART_FCR_EM 3
>  #define UART_DLL_EM 9
>  #define UART_DLM_EM 10
> +#define UART_HCR0_EM 11
> +
> +#define UART_FCR_R_EM	(UART_FCR_EM + UART_HCR0_EM)

It's easy to lose track of all this, IMHO this would be simple:

/*
 * A high value for UART_FCR_EM avoids overlapping with existing UART_* 
 * register defines. UART_FCR_EM_HW is the real HW register offset.
 */
#define UART_FCR_EM 12
#define UART_FCR_EM_HW 3

Then use UART_FCR_EM consistently within the function you add for RZ so 
you'd need provide both _in/_out with UART_FCR_EM. (You'll have both 
UART_FCR and UART_FCR_EM cases in _out but that seems fine, IMHO).

To me that would look the cleanest workaround to the overlapping defines.

-- 
 i.


> +#define UART_HCR0_EM_SW_RESET	BIT(7) /* SW Reset */
>  
>  struct serial8250_em_hw_info {
>  	unsigned int type;
>  	upf_t flags;
> +	void (*serial_out)(struct uart_port *p, int off, int value);
>  };
>  
>  struct serial8250_em_priv {
> @@ -46,6 +57,7 @@ static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
>  		fallthrough;
>  	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
>  	case UART_DLM_EM: /* DLM @ 0x28 (+9) */
> +	case UART_HCR0_EM: /* HCR0 @ 0x2c */
>  		writel(value, p->membase + (offset << 2));
>  	}
>  }
> @@ -55,20 +67,74 @@ static unsigned int serial8250_em_serial_in(struct uart_port *p, int offset)
>  	switch (offset) {
>  	case UART_RX: /* RX @ 0x00 */
>  		return readb(p->membase);
> +	case UART_LCR: /* LCR @ 0x10 (+1) */
>  	case UART_MCR: /* MCR @ 0x14 (+1) */
>  	case UART_LSR: /* LSR @ 0x18 (+1) */
>  	case UART_MSR: /* MSR @ 0x1c (+1) */
>  	case UART_SCR: /* SCR @ 0x20 (+1) */
>  		return readl(p->membase + ((offset + 1) << 2));
> +	case UART_FCR_R_EM:
> +		return readl(p->membase + (UART_FCR_EM << 2));
>  	case UART_IER: /* IER @ 0x04 */
>  	case UART_IIR: /* IIR @ 0x08 */
>  	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
>  	case UART_DLM_EM: /* DLM @ 0x28 (+9) */
> +	case UART_HCR0_EM: /* HCR0 @ 0x2c */
>  		return readl(p->membase + (offset << 2));
>  	}
>  	return 0;
>  }
>  
> +static void serial8250_rzv2m_reg_update(struct uart_port *p, int off, int value)
> +{
> +	unsigned int ier, fcr, lcr, mcr, hcr0;
> +
> +	ier = serial8250_em_serial_in(p, UART_IER);
> +	fcr = serial8250_em_serial_in(p, UART_FCR_R_EM);
> +	lcr = serial8250_em_serial_in(p, UART_LCR);
> +	mcr = serial8250_em_serial_in(p, UART_MCR);
> +	hcr0 = serial8250_em_serial_in(p, UART_HCR0_EM);
> +
> +	serial8250_em_serial_out(p, UART_FCR, fcr | UART_FCR_CLEAR_RCVR |
> +				 UART_FCR_CLEAR_XMIT);
> +	serial8250_em_serial_out(p, UART_HCR0_EM, hcr0 | UART_HCR0_EM_SW_RESET);
> +	serial8250_em_serial_out(p, UART_HCR0_EM, hcr0 & ~UART_HCR0_EM_SW_RESET);
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
> +	}
> +
> +	serial8250_em_serial_out(p, UART_IER, ier);
> +	serial8250_em_serial_out(p, UART_FCR, fcr);
> +	serial8250_em_serial_out(p, UART_MCR, mcr);
> +	serial8250_em_serial_out(p, UART_LCR, lcr);
> +	serial8250_em_serial_out(p, UART_HCR0_EM, hcr0);
> +}
> +
> +static void serial8250_em_rzv2m_serial_out(struct uart_port *p, int offset, int value)
> +{
> +	switch (offset) {
> +	case UART_TX:
> +	case UART_SCR:
> +	case UART_IER:
> +	case UART_DLL_EM:
> +	case UART_DLM_EM:
> +		serial8250_em_serial_out(p, offset, value);
> +		break;
> +	case UART_FCR:
> +	case UART_LCR:
> +	case UART_MCR:
> +		serial8250_rzv2m_reg_update(p, offset, value);
> +	}
> +}
> +
>  static int serial8250_em_serial_dl_read(struct uart_8250_port *up)
>  {
>  	return serial_in(up, UART_DLL_EM) | serial_in(up, UART_DLM_EM) << 8;
> @@ -120,7 +186,7 @@ static int serial8250_em_probe(struct platform_device *pdev)
>  
>  	up.port.iotype = UPIO_MEM32;
>  	up.port.serial_in = serial8250_em_serial_in;
> -	up.port.serial_out = serial8250_em_serial_out;
> +	up.port.serial_out = info->serial_out;
>  	up.dl_read = serial8250_em_serial_dl_read;
>  	up.dl_write = serial8250_em_serial_dl_write;
>  
> @@ -144,11 +210,13 @@ static int serial8250_em_remove(struct platform_device *pdev)
>  static const struct serial8250_em_hw_info emma_mobile_uart_hw_info = {
>  	.type = PORT_UNKNOWN,
>  	.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP,
> +	.serial_out = serial8250_em_serial_out,
>  };
>  
>  static const struct serial8250_em_hw_info rzv2m_uart_hw_info = {
>  	.type = PORT_16750,
>  	.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT | UPF_IOREMAP | UPF_FIXED_TYPE,
> +	.serial_out = serial8250_em_rzv2m_serial_out,
>  };
>  
>  static const struct of_device_id serial8250_em_dt_ids[] = {
> 
