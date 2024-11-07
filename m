Return-Path: <linux-renesas-soc+bounces-10380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C11E9C006A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2024 09:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43BF01F216FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2024 08:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2ED519992B;
	Thu,  7 Nov 2024 08:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NHEhGAE9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879C838FB0;
	Thu,  7 Nov 2024 08:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730969365; cv=none; b=fmDVl+FKm6jTr5D1/ikeWp15jCnsxdsnE33vvNiVmPCP3dyvT0fiPlEuAyYIE608I8c3t2KyhyMm7pvHTkc01PcYBrouBxIAwBmrkdKeKNbwwlo3QSxm9sgxiS30aBtAOG03DM30MdMuxMyZRGSwALAO/J0ER/5CzJaYEv/lQq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730969365; c=relaxed/simple;
	bh=vjon/zJTAXFvGwmeL4pwBi0XmwFi/lU/L1QGrgpU90c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBL2n8KO9DNelVFC6hEEzUn6zzX69hmtdLppeoOnD1oYWBCdZY4GBVKPZ4wG1QRj/HjLbaUG9Y52xG76sq0rZgW6slcj+AskS4/Wl4azUslWPEPSyoNWrAfC/UlYoRwO5j1szTWq2GkR4+shgDODrj+zAEk3kp9UrptUtei9ZzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NHEhGAE9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65175C4CECC;
	Thu,  7 Nov 2024 08:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730969365;
	bh=vjon/zJTAXFvGwmeL4pwBi0XmwFi/lU/L1QGrgpU90c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NHEhGAE9p2WWzi7v6Hvg47UG5N8Im8469ew4G8gU5dN27FnlO0uGQ5hfKmGdGuqJk
	 abtb6FdAnLV8ManJUW177FCyF2GPrgZnEISI9SBwtp6J654SpO+wgdIoHYjgTnnamh
	 BxztT8yMfIwsQ/cpV/Lg9NsJiPFYklgfOw14uc/Y=
Date: Thu, 7 Nov 2024 09:49:05 +0100
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 4/9] serial: sh-sci: Update the suspend/resume support
Message-ID: <2024110752-establish-subduing-225c@gregkh>
References: <20241106120118.1719888-1-claudiu.beznea.uj@bp.renesas.com>
 <20241106120118.1719888-5-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106120118.1719888-5-claudiu.beznea.uj@bp.renesas.com>

On Wed, Nov 06, 2024 at 02:01:13PM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The Renesas RZ/G3S supports a power saving mode where power to most of the
> SoC components is turned off. When returning from this power saving mode,
> SoC components need to be re-configured.
> 
> The SCIFs on the Renesas RZ/G3S need to be re-configured as well when
> returning from this power saving mode. The sh-sci code already configures
> the SCIF clocks, power domain and registers by calling uart_resume_port()
> in sci_resume(). On suspend path the SCIF UART ports are suspended
> accordingly (by calling uart_suspend_port() in sci_suspend()). The only
> missing setting is the reset signal. For this assert/de-assert the reset
> signal on driver suspend/resume.
> 
> In case the no_console_suspend is specified by the user, the registers need
> to be saved on suspend path and restore on resume path. To do this the
> sci_console_setup() function was added. There is no need to cache/restore
> the status or FIFO registers. Only the control registers. To differentiate
> b/w these, the struct sci_port_params::regs was updated with a new member
> that specifies if the register needs to be chached on suspend. Only the
> RZ_SCIFA instances were updated with this new support as the hardware for
> the rest of variants was missing for testing.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/tty/serial/sh-sci.c | 53 ++++++++++++++++++++++++++++++-------
>  1 file changed, 44 insertions(+), 9 deletions(-)

Does not apply as I didn't take the atomic_t patch :(

thanks,

greg k-h

