Return-Path: <linux-renesas-soc+bounces-23769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C96C152F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 15:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7182A34890F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 14:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70F830F52A;
	Tue, 28 Oct 2025 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="mVwMakhK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4DB1531C8;
	Tue, 28 Oct 2025 14:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761662136; cv=none; b=Ja6Ltm9Q1EqCObsjFxPDZQstoMBh+3jTbURa8DHgdsM7tSFcsLm7KObZeYCvtsyamypucA6ps8LDZHyY/CTXrACxoxpGI1FmW66Yr4t2+QMo27P/EZ7KMrMJY9ZnyXfuYfCdyaMBJQ6CsybxFwDgfW7rsN615FZvIdXe8/EYiC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761662136; c=relaxed/simple;
	bh=VCjNPrVkmpy3CfBLjThG/OxJUmGjSr0+/dpOK1q87Nc=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=AEKwB4glLDYZRwFCrTheI54gVJnuMlSNCIXtcw47zRrMYzmByNbaw4vX2eaEzogWzJe9FJl5WtlZ6M78ESyvWJHznF2cw1CccO999b4IT7/bJq6D5Y6+2yX374CVOyQbXU/7FC5SAIfVR2jtEjObsZCzFBwizBlUnksq3mJ3pWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=mVwMakhK; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=LJDtBKc8a9u66BdED1w8L1Sc16+T2HtLc/aLzQtfUY0=; b=mVwMakhKHwApVrb5AVkfVSic5M
	joiA1s4aUDvJE+Fs5zEgtXKFgIxj6w3lvIR02pOMtAcTJxySfmMTQQb/2AKC2Aki5QLEc4B2f/yQw
	+5DOcsb58w+DX4y5NO5CJQIpA9PcCRwuhByCw3emwqXGAd8XOUImudoRxHzyV8Sik0O8=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:54770 helo=pettiford)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vDkn4-000528-Fi; Tue, 28 Oct 2025 10:35:14 -0400
Date: Tue, 28 Oct 2025 10:35:13 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, Nam Cao <namcao@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Message-Id: <20251028103513.a107e9765c73926ceca8454a@hugovil.com>
In-Reply-To: <20251027154615.115759-7-biju.das.jz@bp.renesas.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
	<20251027154615.115759-7-biju.das.jz@bp.renesas.com>
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
Subject: Re: [PATCH 06/19] serial: sh-sci: Drop extra line
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Biju,

On Mon, 27 Oct 2025 15:45:53 +0000
Biju Das <biju.das.jz@bp.renesas.com> wrote:

> Shorten the number lines in sci_init_clocks() by fitting the error
> message within an 80-character length limit.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/tty/serial/sh-sci.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index b33894d0273b..699c39b81c4b 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3009,8 +3009,7 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
>  
>  		if (!clk && sci_port->type == SCI_PORT_RSCI &&
>  		    (i == SCI_FCK || i == SCI_BRG_INT)) {
> -			return dev_err_probe(dev, -ENODEV,
> -					     "failed to get %s\n",
> +			return dev_err_probe(dev, -ENODEV, "failed to get %s\n",
>  					     name);

You can even put it all on one line with the now 100 columns limit.

>  		}
>  
> -- 
> 2.43.0
> 
> 

-- 
Hugo Villeneuve

