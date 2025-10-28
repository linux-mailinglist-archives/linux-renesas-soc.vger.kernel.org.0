Return-Path: <linux-renesas-soc+bounces-23772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C5C15715
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 16:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C40944EB503
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 15:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3AD33DEC6;
	Tue, 28 Oct 2025 15:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="abrye3Jb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8E82E7BAA;
	Tue, 28 Oct 2025 15:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761664970; cv=none; b=DCjrDSq862ourM+U0Ecdbhfim0/cB7HBxvvkcYXzZy4Jl6xN+oe48FBPpN3wJyhyZq7eEd6L6Ou1QAz20dDKzBcNOPganHRp5DvTTWpV5NdaDgfUftt+wauYNry8VW0o4vjJ20F5aYJZM7lNhQ7pqFUa/accH14FmgRr0XjXN5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761664970; c=relaxed/simple;
	bh=BMbaCBC8OjadEwM3Rxx/5gwGtv9gfPXMEDFWwvK7R/M=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=GGUk37KMEdHcpa46Io0HsxZ4kRIXXW8rEw4Jqtox5/vIEts4sEfz9FEw6po7ugcuCke50sFku9biBWlf/gCW6r9PmYdJOKg7xDS6g9U7lkpI3tZf06i5AWoXGslmUZXZFny7ErW0PeIvUYiAJsKYDdi3DG2iDAK2CvtAOwFWY0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=abrye3Jb; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=YZe70+J2LTT9wG74NWbXIHlBAQ3uiSlX/49wCmNNjZk=; b=abrye3JbvalvxZLpkfHEAVs47p
	vW/HOO+dg0mwRD4fdbtO1ALrKtvAlGQ2F6NgFSJzB3oDr/AOGTTXd6Oaj/0ZvTWbpwy/gQ4XU3J46
	Jr+F6CQNnYGnQk6a/EI6aofbNKU6FQWnDccHSwtvjg3/J5pln5fotnTcFrMid3m6cku0=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:58716 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vDlWv-0003ei-Ae; Tue, 28 Oct 2025 11:22:38 -0400
Date: Tue, 28 Oct 2025 11:22:36 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, Nam Cao <namcao@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Message-Id: <20251028112236.c832fb48ad9fafcd2cf34b57@hugovil.com>
In-Reply-To: <20251027154615.115759-16-biju.das.jz@bp.renesas.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
	<20251027154615.115759-16-biju.das.jz@bp.renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -3.2 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH 15/19] serial: sh-sci: Add support for RZ/G3E RSCI SCIF
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Biju,

On Mon, 27 Oct 2025 15:46:02 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> Add support for RZ/G3E RSCI SCIF(a.k.a FIFO mode). RSCI IP found on the
> RZ/G3E SoC is similar to RZ/T2H, but it has a 32-stage FIFO. it has 5
> module clocks instead of 2 on T2H and has multiple resets. Add support
> for hardware flow control.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/tty/serial/rsci.c   | 279 ++++++++++++++++++++++++++++++++++--
>  drivers/tty/serial/rsci.h   |   1 +
>  drivers/tty/serial/sh-sci.c |   9 +-
>  3 files changed, 279 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
> index ade5ee479e99..4c74251dc171 100644
> --- a/drivers/tty/serial/rsci.c
> +++ b/drivers/tty/serial/rsci.c
> @@ -11,6 +11,8 @@
>  #include <linux/serial_core.h>
>  #include <linux/serial_sci.h>
>  #include <linux/tty_flip.h>
> +
> +#include "serial_mctrl_gpio.h"
>  #include "rsci.h"
>  
>  MODULE_IMPORT_NS("SH_SCI");
> @@ -59,6 +61,41 @@ MODULE_IMPORT_NS("SH_SCI");
>  #define CCR1_CTSPEN		BIT(1)	/* CTS External Pin Enable */
>  #define CCR1_CTSE		BIT(0)	/* CTS Enable */
>  
> +/* CCR2 (Common Control Register 2) */
> +#define CCR2_INIT			0xFF000004
> +#define CCR2_CKS_TCLK			(0)	/* TCLK clock */
> +#define CCR2_CKS_TCLK_DIV4		BIT(20)	/* TCLK/4 clock */
> +#define CCR2_CKS_TCLK_DIV16		BIT(21)	/* TCLK16 clock */
> +#define CCR2_CKS_TCLK_DIV64		(BIT(21) | BIT(20)) /* TCLK/64 clock */
> +#define CCR2_BRME			BIT(16)	/* Bitrate Modulation Enable */
> +#define CCR2_ABCSE			BIT(6)	/* Asynchronous Mode Extended Base Clock Select */
> +#define CCR2_ABCS			BIT(5)	/* Asynchronous Mode Base Clock Select */
> +#define CCR2_BGDM			BIT(4)	/* Baud Rate Generator Double-Speed Mode Select */
> +
> +/* CCR3 (Common Control Register 3) */
> +#define CCR3_INIT			0x1203
> +#define CCR3_BLK			BIT(29)	/* Block Transfer Mode */
> +#define CCR3_GM				BIT(28)	/* GSM Mode */
> +#define CCR3_CKE1			BIT(25)	/* Clock Enable 1 */
> +#define CCR3_CKE0			BIT(24)	/* Clock Enable 0 */
> +#define CCR3_DEN			BIT(21)	/* Driver Enabled */
> +#define CCR3_FM				BIT(20)	/* FIFO Mode Select */
> +#define CCR3_MP				BIT(19)	/* Multi-Processor Mode */
> +#define CCR3_MOD_ASYNC			0	/* Asynchronous mode (Multi-processor mode) */
> +#define CCR3_MOD_IRDA			BIT(16)	/* Smart card interface mode */
> +#define CCR3_MOD_CLK_SYNC		BIT(17)	/* Clock synchronous mode */
> +#define CCR3_MOD_SPI			(BIT(17) | BIT(16)) /* Simple SPI mode */
> +#define CCR3_MOD_I2C			BIT(18)	/* Simple I2C mode */
> +#define CCR3_RXDESEL			BIT(15)	/* Asynchronous Start Bit Edge Detection Select */
> +#define CCR3_STP			BIT(14)	/* Stop bit Length */
> +#define CCR3_SINV			BIT(13)	/* Transmitted/Received Data Invert */
> +#define CCR3_LSBF			BIT(12)	/* LSB First select */
> +#define CCR3_CHR1			BIT(9)	/* Character Length */
> +#define CCR3_CHR0			BIT(8)	/* Character Length */
> +#define CCR3_BPEN			BIT(7)	/* Synchronizer Bypass Enable */
> +#define CCR3_CPOL			BIT(1)	/* Clock Polarity Select */
> +#define CCR3_CPHA			BIT(0)	/* Clock Phase Select */
> +
>  /* FCR (FIFO Control Register) */
>  #define FCR_RFRST		BIT(23)	/* Receive FIFO Data Register Reset */
>  #define FCR_TFRST		BIT(15)	/* Transmit FIFO Data Register Reset */
> @@ -142,21 +179,162 @@ static void rsci_start_rx(struct uart_port *port)
>  	rsci_serial_out(port, CCR0, ctrl);
>  }
>  
> +static void rsci_enable_ms(struct uart_port *port)
> +{
> +	mctrl_gpio_enable_ms(to_sci_port(port)->gpios);
> +}
> +
> +static void rsci_init_pins(struct uart_port *port, unsigned int cflag)
> +{
> +	struct sci_port *s = to_sci_port(port);
> +
> +	/*
> +	 * Use port-specific handler if provided.
> +	 */

Put on one line: /* Use... */

> +	if (s->cfg->ops && s->cfg->ops->init_pins) {
> +		s->cfg->ops->init_pins(port, cflag);
> +		return;
> +	}
> +
> +	if (!s->has_rtscts)
> +		return;
> +
> +	if (s->autorts)
> +		rsci_serial_out(port, CCR1, rsci_serial_in(port, CCR1) |
> +				CCR1_CTSE | CCR1_CTSPEN);
> +}
> +
> +static int rsci_scif_set_rtrg(struct uart_port *port, int rx_trig)
> +{
> +	unsigned int bits;
> +
> +	if (rx_trig >= port->fifosize)
> +		rx_trig = port->fifosize - 1;
> +	else if (rx_trig < 1)
> +		rx_trig = 1;
> +
> +	bits = rx_trig << 16;
> +	rsci_serial_out(port, FCR, (rsci_serial_in(port, FCR) & ~FCR_RTRG4_0) | bits);
> +
> +	return rx_trig;
> +}
> +
>  static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
>  			     const struct ktermios *old)
>  {
> +	unsigned int ccr2_val = CCR2_INIT, ccr3_val = CCR3_INIT;
> +	unsigned int ccr0_val = 0, ccr1_val = 0, ccr4_val = 0;
> +	unsigned int brr1 = 255, cks1 = 0, srr1 = 15;
>  	struct sci_port *s = to_sci_port(port);
> +	unsigned int brr = 255, cks = 0;
> +	int min_err = INT_MAX, err;
> +	unsigned long max_freq = 0;
> +	unsigned int baud, i;
>  	unsigned long flags;
> +	unsigned int ctrl;
> +	int best_clk = -1;
> +
> +	if ((termios->c_cflag & CSIZE) == CS7) {
> +		ccr3_val |= CCR3_CHR0;
> +	} else {
> +		termios->c_cflag &= ~CSIZE;
> +		termios->c_cflag |= CS8;
> +	}
> +	if (termios->c_cflag & PARENB)
> +		ccr1_val |= CCR1_PE;
> +	if (termios->c_cflag & PARODD)
> +		ccr1_val |= (CCR1_PE | CCR1_PM);
> +	if (termios->c_cflag & CSTOPB)
> +		ccr3_val |= CCR3_STP;
> +
> +	/* Enable noise filter function */
> +	ccr1_val |= CCR1_NFEN;
> +
> +	/*
> +	 * earlyprintk comes here early on with port->uartclk set to zero.
> +	 * the clock framework is not up and running at this point so here
> +	 * we assume that 115200 is the maximum baud rate. please note that
> +	 * the baud rate is not programmed during earlyprintk - it is assumed
> +	 * that the previous boot loader has enabled required clocks and
> +	 * setup the baud rate generator hardware for us already.
> +	 */
> +	if (!port->uartclk) {
> +		baud = uart_get_baud_rate(port, termios, old, 0, 115200);

Here you do not check the baud return value, as you do a few lines
below...

> +		goto done;
> +	}
> +
> +	for (i = 0; i < SCI_NUM_CLKS; i++)
> +		max_freq = max(max_freq, s->clk_rates[i]);
> +
> +	baud = uart_get_baud_rate(port, termios, old, 0, max_freq / min_sr(s));
> +	if (!baud)

Here you check the baud return value...

Maybe simplify and commonize the above code with something
like:

--------
if (!port->uartclk) {
    max_freq = 115200;
} else {
    for (i = 0; i < SCI_NUM_CLKS; i++)
	max_freq = max(max_freq, s->clk_rates[i]);

    max_freq /= min_sr(s);
}

baud = uart_get_baud_rate(port, termios, old, 0, max_freq);
if (!baud)
    goto done;
--------




> +		goto done;
> +
> +	/* Divided Functional Clock using standard Bit Rate Register */
> +	err = sci_scbrr_calc(s, baud, &brr1, &srr1, &cks1);
> +	if (abs(err) < abs(min_err)) {
> +		best_clk = SCI_FCK;
> +		ccr0_val = 0;
> +		min_err = err;
> +		brr = brr1;
> +		cks = cks1;
> +	}
> +
> +done:
> +	if (best_clk >= 0)
> +		dev_dbg(port->dev, "Using clk %pC for %u%+d bps\n",
> +			s->clks[best_clk], baud, min_err);
>  
>  	sci_port_enable(s);
>  	uart_port_lock_irqsave(port, &flags);
>  
> -	/* For now, only RX enabling is supported */
> -	if (termios->c_cflag & CREAD)
> +	uart_update_timeout(port, termios->c_cflag, baud);
> +
> +	rsci_serial_out(port, CCR0, ccr0_val);
> +
> +	ccr3_val |= CCR3_FM;
> +

Remove space here to be consistent with below statements?

> +	rsci_serial_out(port, CCR3, ccr3_val);
> +
> +	ccr2_val |= (cks << 20) | (brr << 8);
> +	rsci_serial_out(port, CCR2, ccr2_val);
> +
> +	rsci_serial_out(port, CCR1, ccr1_val);
> +
> +	rsci_serial_out(port, CCR4, ccr4_val);
> +
> +	ctrl = rsci_serial_in(port, FCR);
> +
> +	ctrl |= (FCR_RFRST | FCR_TFRST);
> +	rsci_serial_out(port, FCR, ctrl);
> +
> +	if (s->rx_trigger > 1)
> +		rsci_scif_set_rtrg(port, s->rx_trigger);
> +
> +	port->status &= ~UPSTAT_AUTOCTS;
> +	s->autorts = false;
> +
> +	if ((port->flags & UPF_HARD_FLOW) && (termios->c_cflag & CRTSCTS)) {
> +		port->status |= UPSTAT_AUTOCTS;
> +		s->autorts = true;
> +	}
> +
> +	rsci_init_pins(port, termios->c_cflag);
> +	rsci_serial_out(port, CFCLR, CFCLR_CLRFLAG);
> +
> +	rsci_serial_out(port, FFCLR, FFCLR_DRC);
> +
> +	ccr0_val |= CCR0_RE;
> +	rsci_serial_out(port, CCR0, ccr0_val);
> +
> +	if ((termios->c_cflag & CREAD) != 0)
>  		rsci_start_rx(port);
>  
>  	uart_port_unlock_irqrestore(port, flags);
>  	sci_port_disable(s);
> +
> +	if (UART_ENABLE_MS(port, termios->c_cflag))
> +		rsci_enable_ms(port);
>  }
>  
>  static int rsci_txfill(struct uart_port *port)
> @@ -181,13 +359,32 @@ static unsigned int rsci_tx_empty(struct uart_port *port)
>  
>  static void rsci_set_mctrl(struct uart_port *port, unsigned int mctrl)
>  {
> -	/* Not supported yet */
> +	if (mctrl & TIOCM_LOOP) {
> +		/* Standard loopback mode */
> +		rsci_serial_out(port, CCR1, rsci_serial_in(port, CCR1) | CCR1_SPLP);
> +	}
>  }
>  
>  static unsigned int rsci_get_mctrl(struct uart_port *port)
>  {
> -	/* Not supported yet */
> -	return 0;
> +	struct sci_port *s = to_sci_port(port);
> +	struct mctrl_gpios *gpios = s->gpios;
> +	unsigned int mctrl = 0;
> +
> +	mctrl_gpio_get(gpios, &mctrl);
> +
> +	/*
> +	 * CTS/RTS is handled in hardware when supported, while nothing
> +	 * else is wired up.
> +	 */
> +	if (!mctrl_gpio_to_gpiod(gpios, UART_GPIO_CTS))
> +		mctrl |= TIOCM_CTS;
> +	if (!mctrl_gpio_to_gpiod(gpios, UART_GPIO_DSR))
> +		mctrl |= TIOCM_DSR;
> +	if (!mctrl_gpio_to_gpiod(gpios, UART_GPIO_DCD))
> +		mctrl |= TIOCM_CAR;

Maybe separate these if blocks with a blank line for readability.

> +
> +	return mctrl;
>  }
>  
>  static void rsci_start_tx(struct uart_port *port)
> @@ -346,6 +543,28 @@ static void rsci_receive_chars(struct uart_port *port)
>  	}
>  }
>  
> +static void rsci_break_ctl(struct uart_port *port, int break_state)
> +{
> +	unsigned short ccr0_val, ccr1_val;
> +	unsigned long flags;
> +
> +	uart_port_lock_irqsave(port, &flags);
> +	ccr1_val = rsci_serial_in(port, CCR1);
> +	ccr0_val = rsci_serial_in(port, CCR0);
> +
> +	if (break_state == -1) {
> +		ccr1_val = (ccr1_val | CCR1_SPB2IO) & ~CCR1_SPB2DT;
> +		ccr0_val &= ~CCR0_TE;
> +	} else {
> +		ccr1_val = (ccr1_val | CCR1_SPB2DT) & ~CCR1_SPB2IO;
> +		ccr0_val |= CCR0_TE;
> +	}
> +
> +	rsci_serial_out(port, CCR1, ccr1_val);
> +	rsci_serial_out(port, CCR0, ccr0_val);
> +	uart_port_unlock_irqrestore(port, flags);
> +}
> +
>  static void rsci_poll_put_char(struct uart_port *port, unsigned char c)
>  {
>  	u32 status;
> @@ -367,14 +586,30 @@ static void rsci_poll_put_char(struct uart_port *port, unsigned char c)
>  static void rsci_prepare_console_write(struct uart_port *port, u32 ctrl)
>  {
>  	struct sci_port *s = to_sci_port(port);
> -	u32 ctrl_temp =
> -		s->params->param_bits->rxtx_enable | CCR0_TIE |
> -		s->hscif_tot;
> +	u32 ctrl_temp = s->params->param_bits->rxtx_enable;
> +
> +	if (s->type == SCI_PORT_RSCI)
> +		ctrl_temp |= CCR0_TIE | s->hscif_tot;
> +
>  	rsci_serial_out(port, CCR0, ctrl_temp);
>  }
>  
> +static void rsci_finish_console_write(struct uart_port *port, u32 ctrl)
> +{
> +	rsci_serial_out(port, CCR0, ctrl & ~CCR0_TE);
> +	cpu_relax();
> +	rsci_serial_out(port, CCR0, ctrl);
> +}
> +
>  static const char *rsci_type(struct uart_port *port)
>  {
> +	struct sci_port *s = to_sci_port(port);
> +
> +	switch (s->type) {
> +	case RSCI_PORT_SCIF:
> +		return "scif";
> +	}
> +
>  	return "rsci";
>  }
>  
> @@ -414,6 +649,17 @@ static const struct sci_port_params rsci_port_params = {
>  	.common_regs = &rsci_common_regs,
>  };
>  
> +static const struct sci_port_params rsci_rzg3e_scif_port_params = {
> +	.fifosize = 32,
> +	.overrun_reg = CSR,
> +	.overrun_mask = CSR_ORER,
> +	.sampling_rate_mask = SCI_SR(32),
> +	.error_mask = RSCI_DEFAULT_ERROR_MASK,
> +	.error_clear = RSCI_ERROR_CLEAR,
> +	.param_bits = &rsci_port_param_bits,
> +	.common_regs = &rsci_common_regs,
> +};
> +
>  static const struct uart_ops rsci_uart_ops = {
>  	.tx_empty	= rsci_tx_empty,
>  	.set_mctrl	= rsci_set_mctrl,
> @@ -421,6 +667,8 @@ static const struct uart_ops rsci_uart_ops = {
>  	.start_tx	= rsci_start_tx,
>  	.stop_tx	= rsci_stop_tx,
>  	.stop_rx	= rsci_stop_rx,
> +	.enable_ms	= rsci_enable_ms,
> +	.break_ctl	= rsci_break_ctl,
>  	.startup	= sci_startup,
>  	.shutdown	= sci_shutdown,
>  	.set_termios	= rsci_set_termios,
> @@ -440,6 +688,7 @@ static const struct sci_port_ops rsci_port_ops = {
>  	.receive_chars		= rsci_receive_chars,
>  	.poll_put_char		= rsci_poll_put_char,
>  	.prepare_console_write	= rsci_prepare_console_write,
> +	.finish_console_write	= rsci_finish_console_write,
>  	.suspend_regs_size	= rsci_suspend_regs_size,
>  	.shutdown_complete	= rsci_shutdown_complete,
>  };
> @@ -451,6 +700,13 @@ struct sci_of_data of_sci_rsci_data = {
>  	.params = &rsci_port_params,
>  };
>  
> +struct sci_of_data of_rsci_scif_data = {
> +	.type = RSCI_PORT_SCIF,
> +	.ops = &rsci_port_ops,
> +	.uart_ops = &rsci_uart_ops,
> +	.params = &rsci_rzg3e_scif_port_params,
> +};
> +
>  #ifdef CONFIG_SERIAL_SH_SCI_EARLYCON
>  
>  static int __init rsci_early_console_setup(struct earlycon_device *device,
> @@ -459,6 +715,13 @@ static int __init rsci_early_console_setup(struct earlycon_device *device,
>  	return scix_early_console_setup(device, &of_sci_rsci_data);
>  }
>  
> +static int __init rsci_rzg3e_scif_early_console_setup(struct earlycon_device *device,
> +						      const char *opt)
> +{
> +	return scix_early_console_setup(device, &of_rsci_scif_data);
> +}
> +
> +OF_EARLYCON_DECLARE(rsci, "renesas,r9a09g047-rscif", rsci_rzg3e_scif_early_console_setup);
>  OF_EARLYCON_DECLARE(rsci, "renesas,r9a09g077-rsci", rsci_early_console_setup);
>  
>  #endif /* CONFIG_SERIAL_SH_SCI_EARLYCON */
> diff --git a/drivers/tty/serial/rsci.h b/drivers/tty/serial/rsci.h
> index 2af3f28b465a..ba255f58c088 100644
> --- a/drivers/tty/serial/rsci.h
> +++ b/drivers/tty/serial/rsci.h
> @@ -6,5 +6,6 @@
>  #include "sh-sci-common.h"
>  
>  extern struct sci_of_data of_sci_rsci_data;
> +extern struct sci_of_data of_rsci_scif_data;
>  
>  #endif /* __RSCI_H__ */
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 7d1c8338f36c..379528c6725a 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3403,7 +3403,7 @@ static void sci_remove(struct platform_device *dev)
>  	if (s->port.fifosize > 1)
>  		device_remove_file(&dev->dev, &dev_attr_rx_fifo_trigger);
>  	if (type == PORT_SCIFA || type == PORT_SCIFB || type == PORT_HSCIF ||
> -	    type == SCI_PORT_RSCI)
> +	    type == SCI_PORT_RSCI || type == RSCI_PORT_SCIF)
>  		device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
>  }
>  
> @@ -3498,6 +3498,10 @@ static const struct of_device_id of_sci_match[] __maybe_unused = {
>  		.data = &of_sci_scif_rzv2h,
>  	},
>  #ifdef CONFIG_SERIAL_RSCI
> +	{
> +		.compatible = "renesas,r9a09g047-rscif",
> +		.data = &of_rsci_scif_data,
> +	},
>  	{
>  		.compatible = "renesas,r9a09g077-rsci",
>  		.data = &of_sci_rsci_data,
> @@ -3765,7 +3769,8 @@ static int sci_probe(struct platform_device *dev)
>  			return ret;
>  	}
>  	if (sp->type == PORT_SCIFA || sp->type == PORT_SCIFB ||
> -	    sp->type == PORT_HSCIF || sp->type == SCI_PORT_RSCI) {
> +	    sp->type == PORT_HSCIF || sp->type == SCI_PORT_RSCI ||
> +	    sp->type == RSCI_PORT_SCIF) {
>  		ret = device_create_file(&dev->dev, &dev_attr_rx_fifo_timeout);
>  		if (ret) {
>  			if (sp->port.fifosize > 1) {
> -- 
> 2.43.0
> 
> 

Hugo.

