Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC06D693FCE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 09:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjBMIme (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 03:42:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjBMIm3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 03:42:29 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B670FCDE2;
        Mon, 13 Feb 2023 00:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676277748; x=1707813748;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vRLfUOrWL+iiJxyckEBGErfKVAAh6T6bQFHdW9i3AFo=;
  b=EzvSk8VvsEQJzP2d8eGbq0OLRwqLKmtGtj3HnNQL9IYvGehefSoqiMjm
   kvkN167fkf/AExkEP+yd2h2kH/mEN0YJiw5WNJ9Nx1xOo0+x7DlGoZDo1
   60POzIYEjL5oRGbItxGP3yo0NuPXNSzMK6OFmLeemc/FjKA+VC2K9Kwn2
   GM5MWXcqReugUZLWno9xdstSL0QKqaFDF/CNZY2ZH6hzErk2s4aoBlZRR
   8w4Wp+tv6VQhMLReV8vHh8FFAYZR21Ocu9iSDhffceYgq7ViqGlXut3oh
   Y7YLYEX8KIQUZZXJjMa9M1LVGLTNE7GqCSmeVhTFW6ZlvtMjJUVi8psfa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="332149373"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="332149373"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 00:42:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="997620374"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="997620374"
Received: from hdevries-mobl.ger.corp.intel.com ([10.249.36.140])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 00:42:25 -0800
Date:   Mon, 13 Feb 2023 10:42:22 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
In-Reply-To: <20230210203439.174913-4-biju.das.jz@bp.renesas.com>
Message-ID: <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com> <20230210203439.174913-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 10 Feb 2023, Biju Das wrote:

> As per HW manual section 40.6.1, we need to perform FIFO reset + SW
> reset before updating the below registers.
> 
> FCR[7:5], FCR[3:0], LCR[7][5:0], MCR[6:4], DLL[7:0], DLM[7:0] and
> HCR0[6:5][3:2].
> 
> This patch adds serial_out() to struct serial8250_em_hw_info to
> handle this difference between emma mobile and rz/v2m.
> 
> DLL/DLM register can be updated only by setting LCR[7]. So the
> updation of LCR[7] will perform reset for DLL/DLM register changes.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Replaced readl/writel()->serial8250_em_serial_in/out() in serial8250_rzv2m_
>    reg_update() to avoid duplication of offset trickery.
>  * Added support for HCR0 read/write in serial8250_em_{serial_in, serial_out}
>  * Added UART_LCR macro support in serial8250_em_serial_in() to read LCR
>  * Reordered serial8250_em_{serial_in, serial_out} above serial8250_rzv2m_
>    reg_update().
>  * Replaced priv->info->serial_out to info->serial_out.
> v1->v2:
>  * Added serial_out to struct serial8250_em_hw_info
> ---
>  drivers/tty/serial/8250/8250_em.c | 67 ++++++++++++++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_em.c b/drivers/tty/serial/8250/8250_em.c
> index 69cd3b611501..a90a5cc4234a 100644
> --- a/drivers/tty/serial/8250/8250_em.c
> +++ b/drivers/tty/serial/8250/8250_em.c
> @@ -19,10 +19,14 @@
>  
>  #define UART_DLL_EM 9
>  #define UART_DLM_EM 10
> +#define UART_HCR0 11
> +
> +#define UART_HCR0_SW_RESET	BIT(7) /* SW Reset */
>  
>  struct serial8250_em_hw_info {
>  	unsigned int type;
>  	upf_t flags;
> +	void (*serial_out)(struct uart_port *p, int off, int value);
>  };
>  
>  struct serial8250_em_priv {
> @@ -46,6 +50,7 @@ static void serial8250_em_serial_out(struct uart_port *p, int offset, int value)
>  		fallthrough;
>  	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
>  	case UART_DLM_EM: /* DLM @ 0x28 (+9) */
> +	case UART_HCR0: /* HCR0 @ 0x2c */
>  		writel(value, p->membase + (offset << 2));
>  	}
>  }
> @@ -55,6 +60,7 @@ static unsigned int serial8250_em_serial_in(struct uart_port *p, int offset)
>  	switch (offset) {
>  	case UART_RX: /* RX @ 0x00 */
>  		return readb(p->membase);
> +	case UART_LCR: /* LCR @ 0x10 (+1) */
>  	case UART_MCR: /* MCR @ 0x14 (+1) */
>  	case UART_LSR: /* LSR @ 0x18 (+1) */
>  	case UART_MSR: /* MSR @ 0x1c (+1) */
> @@ -64,11 +70,68 @@ static unsigned int serial8250_em_serial_in(struct uart_port *p, int offset)
>  	case UART_IIR: /* IIR @ 0x08 */
>  	case UART_DLL_EM: /* DLL @ 0x24 (+9) */
>  	case UART_DLM_EM: /* DLM @ 0x28 (+9) */
> +	case UART_HCR0: /* HCR0 @ 0x2c */
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
> +	lcr = serial8250_em_serial_in(p, UART_LCR);
> +	mcr = serial8250_em_serial_in(p, UART_MCR);
> +	hcr0 = serial8250_em_serial_in(p, UART_HCR0);
> +	/*
> +	 * The value of UART_IIR and UART_FCR are 2, but corresponding
> +	 * RZ/V2M address offset are different(0x08 and 0x0c). So we need to
> +	 * use readl() here.
> +	 */
> +	fcr = readl(p->membase + ((UART_FCR + 1) << 2));

I don't get the meaning of that comment. It doesn't seem to match what 
your code does as the code seemingly has nothing to do with IIR (and 
none of you changelogs refer to IIR either)?

Is the only reason for this that serial8250_em_serial_in() currently
lacks case UART_FCR: ? Why cannot that just be added there?

-- 
 i.

> +	serial8250_em_serial_out(p, UART_FCR, fcr | UART_FCR_CLEAR_RCVR |
> +				 UART_FCR_CLEAR_XMIT);
> +	serial8250_em_serial_out(p, UART_HCR0, hcr0 | UART_HCR0_SW_RESET);
> +	serial8250_em_serial_out(p, UART_HCR0, hcr0 & ~UART_HCR0_SW_RESET);
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
> +	serial8250_em_serial_out(p, UART_IER, ier);
> +	serial8250_em_serial_out(p, UART_FCR, fcr);
> +	serial8250_em_serial_out(p, UART_MCR, mcr);
> +	serial8250_em_serial_out(p, UART_LCR, lcr);
> +	serial8250_em_serial_out(p, UART_HCR0, hcr0);
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
> @@ -120,7 +183,7 @@ static int serial8250_em_probe(struct platform_device *pdev)
>  
>  	up.port.iotype = UPIO_MEM32;
>  	up.port.serial_in = serial8250_em_serial_in;
> -	up.port.serial_out = serial8250_em_serial_out;
> +	up.port.serial_out = info->serial_out;
>  	up.dl_read = serial8250_em_serial_dl_read;
>  	up.dl_write = serial8250_em_serial_dl_write;
>  
> @@ -144,11 +207,13 @@ static int serial8250_em_remove(struct platform_device *pdev)
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
