Return-Path: <linux-renesas-soc+bounces-23945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A92C2345C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 05:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7EBBE4ED8B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 04:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF1328CF42;
	Fri, 31 Oct 2025 04:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXliqMht"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA611F5827;
	Fri, 31 Oct 2025 04:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761886263; cv=none; b=KYqtoQPR4pLozRNlwSVBm07aHlTz+ynKHI0ieN6YnO7Rr95Ew4jzHsAAWsEgmLMZ400Mi2cq7LV1/d2xLUFwiYqsrDZ+61ZZXG7lYCGp1YF2T1wHncUIPio1CUfgb3ugMu5mq/wYPwomn5E1n3lhuEPrD/dVGhSV1nFbjXV0vE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761886263; c=relaxed/simple;
	bh=G44bpHHiuqg+ANzubI4TrUoruxDDx7aa5Q7m+kQvkZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a46ze+AFnRoHiQaI3uEJClyNh7d2bBokEjqdzul43/MtmMfFaVUXDxXqWg9XORC9E5ttHzwW+VYZGsyNsiGlgQBwvQ3wWXMIiv1e6qwqjcvXEG3eg41FdqNt9O/GVVFGjvShUfxgIAUBrvHIdd/oY8s0rVioxRQarv3C6LlTMQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXliqMht; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E2DC4CEE7;
	Fri, 31 Oct 2025 04:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761886260;
	bh=G44bpHHiuqg+ANzubI4TrUoruxDDx7aa5Q7m+kQvkZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MXliqMhtI+f/PfhTT8LI2eyAKC9LIxIi1lDYHyOLsgGgApNkE6QOZDDs3jQyjDBp4
	 oD/WdNb7iZZNPGDvNt8yac7uG7paOzuv6cHv15NDCZXDVUkYgxHgQ2VLw1MJspnuo+
	 YTU+3UN7ZysihCIk4yRlasstcfqMEnNP2ivS2brojGLLjEcd2BDeD+WL8jy+MDGRHT
	 2ZhW5M7sWI4VplxmqCFsepCDUXWunmECYKOq/xNc+ElavFGNEeDnrUJZZ7vbo/fome
	 4vIn2z5FtPpr8lDe4TuG/fDZgxufU7opFYKq3aYkeYY6aExdBD9ACIfzUdbOtmCZuh
	 D8X56kWZB7Jlg==
Message-ID: <19a08b75-13ca-45f9-884d-f96602336dfd@kernel.org>
Date: Fri, 31 Oct 2025 05:50:56 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] serial: sh-sci: Add support for RZ/G3E RSCI SCIF
To: Biju <biju.das.au@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
 <20251030175811.607137-13-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20251030175811.607137-13-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30. 10. 25, 18:58, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add support for RZ/G3E RSCI SCIF(a.k.a FIFO mode). RSCI IP found on the
> RZ/G3E SoC is similar to RZ/T2H, but it has a 32-stage FIFO. it has 6
> clocks(5 module clocks + 1 external clock) instead of 3 clocks(2 module
> clocks + 1 external clock) on T2H and has multiple resets. Add support
> for the hardware flow control.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
...
> --- a/drivers/tty/serial/rsci.c
> +++ b/drivers/tty/serial/rsci.c
> @@ -11,6 +11,8 @@
...
> +static void rsci_finish_console_write(struct uart_port *port, u32 ctrl)
> +{
> +	rsci_serial_out(port, CCR0, ctrl & ~CCR0_TE);
> +	cpu_relax();

What's the intent of cpu_relax in here? It does not make much sense to 
me. If you need delay, use delay.

> +	rsci_serial_out(port, CCR0, ctrl);
> +}
> +
...
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index fac83dace27c..85b89c1ebf15 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3397,7 +3397,7 @@ static void sci_remove(struct platform_device *dev)
>   	if (s->port.fifosize > 1)
>   		device_remove_file(&dev->dev, &dev_attr_rx_fifo_trigger);
>   	if (type == PORT_SCIFA || type == PORT_SCIFB || type == PORT_HSCIF ||
> -	    type == SCI_PORT_RSCI)
> +	    type == SCI_PORT_RSCI || type == RSCI_PORT_SCIF)
>   		device_remove_file(&dev->dev, &dev_attr_rx_fifo_timeout);
...
> @@ -3759,7 +3763,8 @@ static int sci_probe(struct platform_device *dev)
>   			return ret;
>   	}
>   	if (sp->type == PORT_SCIFA || sp->type == PORT_SCIFB ||
> -	    sp->type == PORT_HSCIF || sp->type == SCI_PORT_RSCI) {
> +	    sp->type == PORT_HSCIF || sp->type == SCI_PORT_RSCI ||
> +	    sp->type == RSCI_PORT_SCIF) {

This test is duplicated -- you seem you need a helper for this.

thanks,
-- 
js
suse labs

