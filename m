Return-Path: <linux-renesas-soc+bounces-23770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FBCC15423
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 15:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B64B502895
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 14:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0A23375A7;
	Tue, 28 Oct 2025 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="e/wkHfYp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F123385B1;
	Tue, 28 Oct 2025 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761663084; cv=none; b=oprUnYE5qzVZRDPMlxfYyMk3E1CAOvIoiEihDjLAI4tX5TlQo7GfQrB8JPXJ9v6qR2m5587TGRbqJacPi1fbeifbkk0Oh3Ge9xliqj4l2GmiHFDOnDJyeu2/m8USlxkmpDP2IKCoYW1httQYwBaSMx+WrEc0nxJI4XnTnDXs1tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761663084; c=relaxed/simple;
	bh=6SCaZQgnFDKF5k2WDsmt+w74ViFXz5rNxAu4Lq7OVGU=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=uTy0h5j2UX9GrVjoMcNmAH7DVgL7RLgPReZTG0Sze7S8vRqpWt2cCUDdu4My3LFdm/MwTSuPkbeV8g0QgPFpUdG23J7wIceBfEDlVfZaNicoeYbPauA+sLpCc2ikLaqFQbQn4FG3bz00xT/Rs7BaM/fV2++LJOj4JfU2zNUDPEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=e/wkHfYp; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=N+b06vew3koexRPglLOUCJvi8spH76cxGloOjXHNz7E=; b=e/wkHfYpZEb5mKmHkH0MHz+TKb
	jeY/nD+pr31LqBdWNcEBas+IJhQh0BexosNJNDY+Xi3bPHdmgGyFlyJ1g6PO1iCT92vG3kvFhUBI1
	7vbMUvWV4AoQvUK5tonqRpD9MtxMnqRXvzLUOX77cEJa1jh01VJHkFn6jkBc4Ua8OCzQ=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:57862 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vDl2W-0006uJ-Ec; Tue, 28 Oct 2025 10:51:12 -0400
Date: Tue, 28 Oct 2025 10:51:11 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, Nam Cao <namcao@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Message-Id: <20251028105111.b0363ccd0eac7691191b6afe@hugovil.com>
In-Reply-To: <20251027154615.115759-13-biju.das.jz@bp.renesas.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
	<20251027154615.115759-13-biju.das.jz@bp.renesas.com>
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
Subject: Re: [PATCH 12/19] serial: sh-sci: Add support for RZ/G3E RSCI clks
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Biju,

On Mon, 27 Oct 2025 15:45:59 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> RZ/G3E RSCI has 5 module clocks. Add support for these clocks.

In "[PATCH 03/19] dt-bindings: serial: renesas,rsci: Document RZ/G3E
support", you mention that "...RZ/G3E has 6 clocks...", and here 5?

 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/tty/serial/sh-sci-common.h |  3 +++
>  drivers/tty/serial/sh-sci.c        | 14 ++++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/tty/serial/sh-sci-common.h b/drivers/tty/serial/sh-sci-common.h
> index ef1d94ae8b5c..f730ff9add60 100644
> --- a/drivers/tty/serial/sh-sci-common.h
> +++ b/drivers/tty/serial/sh-sci-common.h
> @@ -17,6 +17,9 @@ enum SCI_CLKS {
>  	SCI_SCK,		/* Optional External Clock */
>  	SCI_BRG_INT,		/* Optional BRG Internal Clock Source */
>  	SCI_SCIF_CLK,		/* Optional BRG External Clock Source */
> +	SCI_FCK_DIV64,		/* Optional Functional Clock frequency-divided by 64 */
> +	SCI_FCK_DIV16,		/* Optional Functional Clock frequency-divided by 16 */
> +	SCI_FCK_DIV4,		/* Optional Functional Clock frequency-divided by 4 */

I see 6 clocks here?

>  	SCI_NUM_CLKS
>  };
>  
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 5f5913410df9..d45bdda2b6c1 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2994,6 +2994,9 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>  		[SCI_SCK] = "sck",
>  		[SCI_BRG_INT] = "brg_int",
>  		[SCI_SCIF_CLK] = "scif_clk",
> +		[SCI_FCK_DIV64] = "tclk_div64",
> +		[SCI_FCK_DIV16] = "tclk_div16",
> +		[SCI_FCK_DIV4] = "tclk_div4",
>  	};
>  	struct clk *clk;
>  	unsigned int i;
> @@ -3003,6 +3006,9 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>  	} else if (sci_port->type == SCI_PORT_RSCI) {
>  		clk_names[SCI_FCK] = "operation";
>  		clk_names[SCI_BRG_INT] = "bus";
> +	} else if (sci_port->type == RSCI_PORT_SCI || sci_port->type == RSCI_PORT_SCIF) {
> +		clk_names[SCI_FCK] = "tclk";
> +		clk_names[SCI_BRG_INT] = "bus";
>  	}
>  
>  	for (i = 0; i < SCI_NUM_CLKS; i++) {
> @@ -3018,6 +3024,14 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>  					     name);
>  		}
>  
> +		if (!clk && (sci_port->type == RSCI_PORT_SCI ||
> +			     sci_port->type == RSCI_PORT_SCIF) &&
> +		    (i == SCI_FCK || i == SCI_BRG_INT || i == SCI_FCK_DIV64 ||
> +		     i == SCI_FCK_DIV16 || i == SCI_FCK_DIV4)) {
> +			return dev_err_probe(dev, -ENODEV, "failed to get %s\n",
> +					     name);
> +		}
> +
>  		if (!clk && i == SCI_FCK) {
>  			/*
>  			 * Not all SH platforms declare a clock lookup entry
> -- 
> 2.43.0
> 
> 

-- 
Hugo Villeneuve

