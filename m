Return-Path: <linux-renesas-soc+bounces-8314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F394E95FC8E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 00:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 321C71C2042B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 22:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC11C19CD1D;
	Mon, 26 Aug 2024 22:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+rDslGm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805C6823DD;
	Mon, 26 Aug 2024 22:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724710521; cv=none; b=Yf3TrEbX54jRdMt2CIa9vPjHP/AMQ1RhTeA33M+WnHOXPt1OesiO6bNfcDt8JuZwgJjtYMMznjycErOvjmmsvG3iBlB3wylOdFmo8s7iHM/Hv0Y98JLzf6VdS+n8/vKo+573IdLEAE1JQZfABk8V+IH92vWE49OE4KS6FDhkV4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724710521; c=relaxed/simple;
	bh=n8gcZiAC0tOhqnbHGpl+P3dIj4Y7x2ew9/hSqEmdqYE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NUwTUnMurXJlyIM7xOc63/iy9LAq98d8BXgAjbtVdB1/ijZFkGQxhnCX3eyeN3aktlWzIIncvPHr7Ac4t6Ix33E6iesR3fZNeYUOoHGwFQoDDlDoE9/rX4zceNdTH3/WN2FOiC/UdjZQC0qJsYfE4K/CzuJkIuawnSQXljgJruw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+rDslGm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE93C4FE00;
	Mon, 26 Aug 2024 22:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724710521;
	bh=n8gcZiAC0tOhqnbHGpl+P3dIj4Y7x2ew9/hSqEmdqYE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f+rDslGmjbisVo9bTthG3D9FKhutZ8wRqbAo44ZxhIDHlbkIRfiNO+bHLyS8a2Jyx
	 x96RnINdxQbltUMQdqBcJ8p1uXXRJpU9z9ONfCM8ELuiipd+Lnt5etFKM60/YJ1vcU
	 ZxkRTzQ8PL6OgNlLYd5NY9Jgwf+jtzNGuw+5aUV22ULI/mQcwXnhjJrfj3LZPoJjCp
	 Z44pZanGSjnzwNZ4yh5579PzsS0qw5SI9ETAR7lB4FxwT9rxunRB0vOlvU7gdsBugr
	 QRTZZhpgw63eqigMMBJEulSLYVJ0l1Pzc8EeMpyB1wg5uYB3y6AmVrsDfCKmSKQ5Aq
	 RS3fw3ejwkuJg==
Date: Mon, 26 Aug 2024 15:15:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, ulli.kroll@googlemail.com, linus.walleij@linaro.org,
 marcin.s.wojtas@gmail.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, kees@kernel.org,
 justinstitt@google.com, u.kleine-koenig@pengutronix.de, horms@kernel.org,
 sd@queasysnail.net, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next v2 6/9] net: ethernet: broadcom: bcm63xx_enet:
 Convert to devm_clk_get_enabled()
Message-ID: <20240826151518.6ccaec1f@kernel.org>
In-Reply-To: <20240823072122.2053401-7-frank.li@vivo.com>
References: <20240823072122.2053401-1-frank.li@vivo.com>
	<20240823072122.2053401-7-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Aug 2024 01:21:18 -0600 Yangtao Li wrote:
> diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> index 3c0e3b9828be..6e288cee2c35 100644
> --- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> +++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> @@ -1718,6 +1718,7 @@ static int bcm_enet_probe(struct platform_device *pdev)
>  	struct bcm63xx_enet_platform_data *pd;

move the local clock variables here, keep lines longest to shortest

>  	int irq, irq_rx, irq_tx;
>  	struct mii_bus *bus;
> +	struct clk *phy_clk, *mac_clk;

