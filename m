Return-Path: <linux-renesas-soc+bounces-31430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLZ3GndN5mkgugEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:59:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C38C42ECCA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 17:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 13EBE300088F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 15:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618F233B975;
	Mon, 20 Apr 2026 15:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="FcopNGgC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E7A22541C;
	Mon, 20 Apr 2026 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776700786; cv=none; b=AgQ1pimVEl0ROG7+fkvCXS0Y/+qyYxr7KsSUrIn+yE+VJNHQXpdh9xTevKoMc5zOGvdVg8uxzBcd1/tJIsJ5u4V9SJrMstCfLpQB7TATjSo33Bv3RNDbRCheKH5laWQYJ2liq/LXxuOo8ObPeK+kEzEA7tnL/Akx5162jrTm2jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776700786; c=relaxed/simple;
	bh=F+3uavhmDAGc52kF/NXU/th6PoQrqO6bisgq+k+jepU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZaaRVVGTa6SAuM/EfqVI4NN5wMXR9hrfXfCN+ul7oqrFRmfGfvpKB2xaikm9R0Z1DlKoQdMNIcyE46whkmgbcrDHxJ7hE6fmf53hgdy5jVqmubvFA1wLKc9DIuMssoi/KBAy3MAmiHYiUOW1b8W/IZOx/doiT17l07EF9GBXSYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=FcopNGgC; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=lVCJquKSxaPgOSN/Bve/cdJzfbYVrSBfEWNOMXHBBzo=; b=FcopNGgCqAFcUENoWwrE+a0+oi
	56ujV3yAIrVZ9D2mclUIxNMqO3JIyoUCFeIgX7rpZexiC+A3fox0ltPRdwJkFEmnd0Os0uX1hePmQ
	x7xUP/eCBE4CZOETfGyAog0OyfB//YHxFLP6ul4PB4JAtmjCqdQG4iylv4rpXYbzXT7A=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wEr2D-000000003m5-2Fds;
	Mon, 20 Apr 2026 11:59:41 -0400
Date: Mon, 20 Apr 2026 11:59:41 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Bultel
 <thierry.bultel.yh@bp.renesas.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] serial: sh-sci: Drop check for zero baud rate
 from uart_get_baud_rate()
Message-Id: <20260420115941.5a7eea7c3cc2116f8f386f26@hugovil.com>
In-Reply-To: <20260420140426.237865-3-biju.das.jz@bp.renesas.com>
References: <20260420140426.237865-1-biju.das.jz@bp.renesas.com>
	<20260420140426.237865-3-biju.das.jz@bp.renesas.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[hugovil.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[hugovil.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31430-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[hugovil.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hugo@hugovil.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,hugovil.com:dkim,hugovil.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 0C38C42ECCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Mon, 20 Apr 2026 15:04:22 +0100
Biju <biju.das.au@gmail.com> wrote:

> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> On DT systems, a zero baud rate from uart_get_baud_rate() is not possible
> even earlycon derives its bit rate from chosen/stdout-path. The zero baud
> guard and its associated done label are therefore dead code. So remove it.
> 
> Also drop the unused done label from rsci_set_termios().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>


> ---
> v3:
>  * New patch
> ---
>  drivers/tty/serial/rsci.c   | 3 ---
>  drivers/tty/serial/sh-sci.c | 2 --
>  2 files changed, 5 deletions(-)
> 
> diff --git a/drivers/tty/serial/rsci.c b/drivers/tty/serial/rsci.c
> index b00c9e385169..40db9daa4272 100644
> --- a/drivers/tty/serial/rsci.c
> +++ b/drivers/tty/serial/rsci.c
> @@ -265,8 +265,6 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
>  	}
>  
>  	baud = uart_get_baud_rate(port, termios, old, 0, max_freq);
> -	if (!baud)
> -		goto done;
>  
>  	/* Divided Functional Clock using standard Bit Rate Register */
>  	err = sci_scbrr_calc(s, baud, &brr1, &srr1, &cks1);
> @@ -278,7 +276,6 @@ static void rsci_set_termios(struct uart_port *port, struct ktermios *termios,
>  		cks = cks1;
>  	}
 
> -done:
>  	if (best_clk >= 0)
>  		dev_dbg(port->dev, "Using clk %pC for %u%+d bps\n",
>  			s->clks[best_clk], baud, min_err);
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 7473b26ce9cf..9be359e04995 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2719,8 +2719,6 @@ static void sci_set_termios(struct uart_port *port, struct ktermios *termios,
>  		max_freq = max(max_freq, s->clk_rates[i]);
>  
>  	baud = uart_get_baud_rate(port, termios, old, 0, max_freq / min_sr(s));
> -	if (!baud)
> -		goto done;
>  
>  	/*
>  	 * There can be multiple sources for the sampling clock.  Find the one
> -- 
> 2.43.0
> 
> 


-- 
Hugo Villeneuve

