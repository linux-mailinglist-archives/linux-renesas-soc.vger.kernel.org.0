Return-Path: <linux-renesas-soc+bounces-10657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 075719D54BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2024 22:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5DD71F22661
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2024 21:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462321C9EA4;
	Thu, 21 Nov 2024 21:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="s9uT45ix"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BAB4502F;
	Thu, 21 Nov 2024 21:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732224766; cv=none; b=RJ6EeP+oU80iOGrehP9K2bZGIx6NtjQWp+44Z5914RgNtTHSSzolitVBiqQPvclUh0OUOtMlP3jI7xKJnsJV+lL5vtfz5WboTA4wqc4yDfMr8ViQUk4arErrxDGB1Oiy5ZI5ixl8EIq9Rg4Doqrj+OOvI5GgnYZTcuHeVS1dTaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732224766; c=relaxed/simple;
	bh=htrvxQ/acJt2mn32w1njKdyG5hdJdbkfDKs+NrdqLFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMqpM1eAFH7yKh3NlLwm0DOGOXZt2clgKrMOShgMvELh3CIYMcTXQjnBzXqaiDWpIuhQ8T6r9/EfFU325tx3rOrbtKUcrdw/cJyW5v6/WRHTxwswtE7PwSuiniE020lwS9UbW06KZd//5gxWg2iPkGfI/Lb9d4NG/9tnYIHjN+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=s9uT45ix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9E1C4CECC;
	Thu, 21 Nov 2024 21:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1732224765;
	bh=htrvxQ/acJt2mn32w1njKdyG5hdJdbkfDKs+NrdqLFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9uT45ixbZuVdMo+D7KF90yl/M4gz4FOZG+z4QHSwZQfBNYtRrDTQPsMu4MO3iA2k
	 KELBNAWcrzFY/wAazJxMr+f7n9L4juBJIsbng4iTsYokcXzUXiV61ml2PxRXi/d1Z+
	 sXDGeU4Ie5dXi7xqKv8lgIOngFjO7GAhkwmoxzjA=
Date: Thu, 21 Nov 2024 22:32:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, jirislaby@kernel.org, p.zabel@pengutronix.de,
	lethal@linux-sh.org, g.liakhovetski@gmx.de,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 2/8] serial: sh-sci: Check if TX data was written to
 device in .tx_empty()
Message-ID: <2024112128-faceted-moonstone-027f@gregkh>
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com>
 <20241115134401.3893008-3-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115134401.3893008-3-claudiu.beznea.uj@bp.renesas.com>

On Fri, Nov 15, 2024 at 03:43:55PM +0200, Claudiu wrote:
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
> been called (meaning something has been transmitted). In the tx_empty()
> API the status of the DMA transaction is also checked and if it is
> completed or in progress the code falls back in checking the hardware
> registers instead of relying on the software variable.
> 
> Fixes: 73a19e4c0301 ("serial: sh-sci: Add DMA support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Why is this bug/regression fix burried in a long series?  It should be
sent individually so that it could be applied on its own as it is not
related to the other ones, right?

Or are you ok with waiting for this to show up in 6.14-rc1?

thanks,

greg k-h

