Return-Path: <linux-renesas-soc+bounces-4557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7A88A3294
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 17:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 270971C20B80
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 15:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537021482F0;
	Fri, 12 Apr 2024 15:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="wY7+GLHS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D0913CFBD;
	Fri, 12 Apr 2024 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712936215; cv=none; b=H2A84RJ3BsjqqMM4T2RWAnuEf/4b10OUzRCuYO5UNUh6YvgNh+/f8NfcU/nbrXPZEXB0elh9UvBSOI+9JBaMp8pOizxObrhvbavUk1+9WmNz8bprw6jmyj5ekynOzdtMHa+7Xudlws/M8zPjMWDhSO0Pue7jtuuw+ipF4GObwF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712936215; c=relaxed/simple;
	bh=UKQ7Fh43p00kZ3dschuaUC3weBeCJWxZpZx3BvScHN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avkIxKvEQBIrWuD25tu3K5O+OSLP1bsjp4EWUay56U/1dNnssynwca5F2U0PagP0JSIv/YO2LuK7IuSlEzZc3FqNxrnTKvARA3QCIZMEnrxTNypk2r0o9yGehvXL/1JxNXgZfJoBtzkhIQY4J/nIAlom8wYfC3JMp0DhtrDjT8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=wY7+GLHS; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jn4IXShQbH558J+hrlWaxSa87daE1lZM4FipQqLK9Pk=; b=wY7+GLHSDlBHYYj2NNCNNwktG6
	N5fTpRntb5rCjzjqQBjNfYGhpOY1jt26YssraXPA3kz4StBuIIG7DP65m1xPty7gnziLsB2HLes3M
	KcdhvP+2Wu+yFs/+6MwMLrECVNRlYB0BI1R9arwkpfUYjhR3b6s+2x1twD2d0xN/sddJIkEG+z2FB
	/f8aqRn5k+r7TyUNA5YAFqc7dEec9GS+qGDywCkuXqqzuI3nF7iUm1xTJKAGEWjifEa/kuok5/9tW
	aKuL9F/P6u+2xhoED6MzCZpJskimmlSfTrDCvDgGxdQh0ZFG53/yskynV6qypH7tHye47vOTYlPdG
	DqNc37hQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41818)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rvIxF-0002eV-2b;
	Fri, 12 Apr 2024 16:36:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rvIxD-0007vK-VC; Fri, 12 Apr 2024 16:36:39 +0100
Date: Fri, 12 Apr 2024 16:36:39 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: Update API documentation related to clock
 disable
Message-ID: <ZhlVB/z7Qojr3Znx@shell.armlinux.org.uk>
References: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
 <20240318110842.41956-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318110842.41956-2-biju.das.jz@bp.renesas.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Mar 18, 2024 at 11:08:40AM +0000, Biju Das wrote:
> 
> The API's related to clk disable operation does not explicitly
> states the synchoronous or asynchrous behaviour as it is driver
> dependent. So make this part clear in API documentation.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change.
> v2:
>  * New patch.
> ---
>  drivers/clk/clk.c            | 3 ++-
>  include/linux/clk-provider.h | 3 ++-
>  include/linux/clk.h          | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 25371c91a58f..f5fa91a339d7 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1010,7 +1010,8 @@ static void clk_core_unprepare_lock(struct clk_core *core)
>   * if the operation may sleep.  One example is a clk which is accessed over
>   * I2c.  In the complex case a clk gate operation may require a fast and a slow
>   * part.  It is this reason that clk_unprepare and clk_disable are not mutually
> - * exclusive.  In fact clk_disable must be called before clk_unprepare.
> + * exclusive.  In fact clk_disable must be called before clk_unprepare.  The
> + * synchronous or asynchronous clock gating operation is driver dependent.

What is important is that:

	clk_unprepare(clk);
	clk_prepare(clk);

must result in the prepare operation being completed before
clk_prepare() returns. The same applies to clk_disable(clk) followed
by clk_enable(clk).

Since these comment updates are aimed at the unprepare/disable
functionality, I think they're fine.

Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

