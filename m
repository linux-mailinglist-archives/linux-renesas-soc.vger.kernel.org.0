Return-Path: <linux-renesas-soc+bounces-10379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E649C005D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2024 09:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C11AB210D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2024 08:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0676195B18;
	Thu,  7 Nov 2024 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iEyYs2Nz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FA4FBF0;
	Thu,  7 Nov 2024 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730969245; cv=none; b=QbWcDJYkeqVNyb1VSNJGyrlDYkDjKiwc2HpLIh6lWqxwOea3kROo+rUS7lbNv/PM6XPzA2exaAyKxFNTX7gmXL+o9OBgEa48P7slPSan+GL+ZGWoeprGHnd9U+GZbyrRytC1cpjHLF48t0lhXFyxj+0D2DSjuGoWcqy5wRuaDK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730969245; c=relaxed/simple;
	bh=9/KGz9Eqf8L6AckABuzu+EnLUD9DwMieaH9zCgdF3uY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOflHzBPrHCpSpaivq6D4nBwfIh8CHiJf8eSNJdZ1XayXyLQI8vGlYnQI67xd+vnOX6xNYBy3ZxJbtVf/Wc+QVTkpvtQe07yCu8xTNOrfg/jjyYplOy9BY/zLE77ZQ+m58t9K0xBF7sqPU321LWg5l6vKNITKbu1ZT93AzEz0mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iEyYs2Nz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5117C4CECC;
	Thu,  7 Nov 2024 08:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730969245;
	bh=9/KGz9Eqf8L6AckABuzu+EnLUD9DwMieaH9zCgdF3uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEyYs2NzyAXwOllRBBtt61ypuqxImxlWvXnXclkI+SY0H11AsXGNwgA4M28QqrGx1
	 cTP6PdDqgbXb/ad96I9TiWi4/nFjzo245/xxRb1HYzvT8a20x0obqGnSVnu4vgrPdT
	 WUqBeuazkGU+kk8ysYcvbheWdPOl/e7uyTJxviJg=
Date: Thu, 7 Nov 2024 09:47:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, jirislaby@kernel.org, p.zabel@pengutronix.de,
	lethal@linux-sh.org, g.liakhovetski@gmx.de,
	ysato@users.sourceforge.jp, ulrich.hecht+renesas@gmail.com,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/9] serial: sh-sci: Check if TX data was written to
 device in .tx_empty()
Message-ID: <2024110747-kite-pacemaker-6216@gregkh>
References: <20241106120118.1719888-1-claudiu.beznea.uj@bp.renesas.com>
 <20241106120118.1719888-3-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106120118.1719888-3-claudiu.beznea.uj@bp.renesas.com>

On Wed, Nov 06, 2024 at 02:01:11PM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> On the Renesas RZ/G3S, when doing suspend to RAM, the uart_suspend_port()
> is called. The uart_suspend_port() calls 3 times the
> struct uart_port::ops::tx_empty() before shutting down the port.
> 
> According to the documentation, the struct uart_port::ops::tx_empty()
> API tests whether the transmitter FIFO and shifter for the port is
> empty.
> 
> The Renesas RZ/G3S SCIFA IP reports the number of data units stored in the
> transmit FIFO through the FDR (FIFO Data Count Register). The data units
> in the FIFOs are written in the shift register and transmitted from there.
> The TEND bit in the Serial Status Register reports if the data was
> transmitted from the shift register.
> 
> In the previous code, in the tx_empty() API implemented by the sh-sci
> driver, it is considered that the TX is empty if the hardware reports the
> TEND bit set and the number of data units in the FIFO is zero.
> 
> According to the HW manual, the TEND bit has the following meaning:
> 
> 0: Transmission is in the waiting state or in progress.
> 1: Transmission is completed.
> 
> It has been noticed that when opening the serial device w/o using it and
> then switch to a power saving mode, the tx_empty() call in the
> uart_port_suspend() function fails, leading to the "Unable to drain
> transmitter" message being printed on the console. This is because the
> TEND=0 if nothing has been transmitted and the FIFOs are empty. As the
> TEND=0 has double meaning (waiting state, in progress) we can't
> determined the scenario described above.
> 
> Add a software workaround for this. This sets a variable if any data has
> been sent on the serial console (when using PIO) or if the DMA callback has
> been called (meaning something has been transmitted).
> 
> Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/tty/serial/sh-sci.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index df523c744423..8e2d534401fa 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -153,6 +153,7 @@ struct sci_port {
>  	int				rx_trigger;
>  	struct timer_list		rx_fifo_timer;
>  	int				rx_fifo_timeout;
> +	atomic_t			first_time_tx;

Don't use an atomic variable for an informational thing like this, it is
racy and doesn't work properly.  Either use a real lock (because you
care about the locking stuff here), or just use a boolean and live with
any potential races.



>  	u16				hscif_tot;
>  
>  	bool has_rtscts;
> @@ -850,6 +851,7 @@ static void sci_transmit_chars(struct uart_port *port)
>  {
>  	struct tty_port *tport = &port->state->port;
>  	unsigned int stopped = uart_tx_stopped(port);
> +	struct sci_port *s = to_sci_port(port);
>  	unsigned short status;
>  	unsigned short ctrl;
>  	int count;
> @@ -885,6 +887,7 @@ static void sci_transmit_chars(struct uart_port *port)
>  		}
>  
>  		sci_serial_out(port, SCxTDR, c);
> +		atomic_set(&s->first_time_tx, 1);
>  
>  		port->icount.tx++;
>  	} while (--count > 0);
> @@ -1241,6 +1244,8 @@ static void sci_dma_tx_complete(void *arg)
>  	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
>  		uart_write_wakeup(port);
>  
> +	atomic_set(&s->first_time_tx, 1);
> +
>  	if (!kfifo_is_empty(&tport->xmit_fifo)) {
>  		s->cookie_tx = 0;
>  		schedule_work(&s->work_tx);
> @@ -2076,6 +2081,10 @@ static unsigned int sci_tx_empty(struct uart_port *port)
>  {
>  	unsigned short status = sci_serial_in(port, SCxSR);
>  	unsigned short in_tx_fifo = sci_txfill(port);
> +	struct sci_port *s = to_sci_port(port);
> +
> +	if (!atomic_read(&s->first_time_tx))
> +		return TIOCSER_TEMT;

See, what happens here if the value changes right after you check it?
Being an atomic doesn't mean anything :(

thanks,

greg k-h

