Return-Path: <linux-renesas-soc+bounces-23942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A68E5C22382
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 21:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D7B0189059D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 20:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A48C28727B;
	Thu, 30 Oct 2025 20:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="JsVH6t/s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C3D34D3A9;
	Thu, 30 Oct 2025 20:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855729; cv=none; b=V2ZY/29zUObb4kHTbqT4hJH8K8/PiN9GhQBhQllI27O+6Ruf/LU4vCePdaV8yITMdojPEPHVII3vsunGaNWQ7vcZHddmlu+56gZyX/f4KXmMDJeH5pNvJAWItNoW2mEdhVthEeXgNcEvrI103HNa25BVeYiFQ6pE0TH104XIZpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855729; c=relaxed/simple;
	bh=+qddq8ivl69bviH94J/4a7qBKaRH5h2V++1III/mAYo=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=jlWDGH0vu8CbG7PQKeAmorA7a0B8icLV5v080oWXpGXL7/1rIuupyIj87NtcsSaQl3Ov+1nGzbEqn1QgDHxKjm+OyXCZt4VvQKAP/GvzjaM6pklEm30tKd8ceFpSjl4+gF3koRty1Ufe7fr420qiMYp0JgaT1gARep8I8fm/2Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=JsVH6t/s; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=uFmtd/vYYlTJwBHe3T7xj0NJ1lv/xoQEpnuJNEuit0c=; b=JsVH6t/siweN1pL16Ifw9HEP2R
	wONuMjqP3pUASYHE9b+EIEOcQtjcCagYSiumOl6OxZjo1Y8fBf1W9lFLqDk1rwlw4LU3rdj93qBed
	0VbxGD+MdI+UHzqlaNiHtfKbTGecz8rRrhFq4WXtekyGPsaPXv5gQfBh6rRQ1ylzDQU0=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:33640 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vEZ9f-0007Lk-Kh; Thu, 30 Oct 2025 16:21:55 -0400
Date: Thu, 30 Oct 2025 16:21:55 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Message-Id: <20251030162155.d08e9d6fd3100092be2ade80@hugovil.com>
In-Reply-To: <20251030175811.607137-4-biju.das.jz@bp.renesas.com>
References: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
	<20251030175811.607137-4-biju.das.jz@bp.renesas.com>
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
	* -3.6 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH v2 03/13] serial: sh-sci: Drop extra lines
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Biju,

On Thu, 30 Oct 2025 17:57:51 +0000
Biju <biju.das.au@gmail.com> wrote:

> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Shorten the number lines in sci_init_clocks() by fitting the error
> messages within an 100-character length limit.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated commit message 80-character->100-character.
>  * Increased line limit for error messages to 100-column limit.
> ---
>  drivers/tty/serial/sh-sci.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index b33894d0273b..e9345f898224 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3008,11 +3008,8 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>  			return PTR_ERR(clk);
>  
>  		if (!clk && sci_port->type == SCI_PORT_RSCI &&
> -		    (i == SCI_FCK || i == SCI_BRG_INT)) {
> -			return dev_err_probe(dev, -ENODEV,
> -					     "failed to get %s\n",
> -					     name);
> -		}
> +		    (i == SCI_FCK || i == SCI_BRG_INT))
> +			return dev_err_probe(dev, -ENODEV, "failed to get %s\n", name);
>  
>  		if (!clk && i == SCI_FCK) {
>  			/*
> @@ -3022,16 +3019,14 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>  			 */
>  			clk = devm_clk_get(dev, "peripheral_clk");
>  			if (IS_ERR(clk))
> -				return dev_err_probe(dev, PTR_ERR(clk),
> -						     "failed to get %s\n",
> +				return dev_err_probe(dev, PTR_ERR(clk), "failed to get %s\n",
>  						     name);

This one can also be on one line (99 characters).


>  		}
>  
>  		if (!clk)
>  			dev_dbg(dev, "failed to get %s\n", name);
>  		else
> -			dev_dbg(dev, "clk %s is %pC rate %lu\n", name,
> -				clk, clk_get_rate(clk));
> +			dev_dbg(dev, "clk %s is %pC rate %lu\n", name, clk, clk_get_rate(clk));
>  		sci_port->clks[i] = clk;
>  	}
>  	return 0;
> -- 
> 2.43.0
> 
> 

-- 
Hugo Villeneuve

