Return-Path: <linux-renesas-soc+bounces-4855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F8A8B038E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 09:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25DEFB27260
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Apr 2024 07:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4671E1581FD;
	Wed, 24 Apr 2024 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Um9E0F0p";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="igoxtT0v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wflow4-smtp.messagingengine.com (wflow4-smtp.messagingengine.com [64.147.123.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79084157A55;
	Wed, 24 Apr 2024 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713945397; cv=none; b=ijIU4PYvIXJPJ1zAsnOa/ycDG4sq972z+g8i0qwqMLN66xdtsTrUyOAcH5zLpu4mzkYJePsSyceMEPA/3wEdvlaCWSXjmF/W4LaQgUuJSfvCZwQZlTMWEgpgauLmLlHgf/koSs/B1IYUXWP3lxypIQtahaT8avrMe79haJZnjt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713945397; c=relaxed/simple;
	bh=+SFtZ+kZR19Nfg9veXGeTNXJ2Kstfsr87YXPexLJSaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSMY40lN4pDilBpqLLvudBBIpHWrfyfohLGHKGfeRzPOaczhsK39cumCwQEheSfkPHakawiZPQzKh0mxvFFLQ8FYWzzIvJIdNtBrwonhCyo4jpb2CvqKbMdo6GnSTVArxHnsr0ttbbr46zpTe8zl6qROSF8EUPlWQ7SR0BB1cSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Um9E0F0p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=igoxtT0v; arc=none smtp.client-ip=64.147.123.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailflow.west.internal (Postfix) with ESMTP id 6B4D32CC0338;
	Wed, 24 Apr 2024 03:56:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 24 Apr 2024 03:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1713945389;
	 x=1713948989; bh=u0gtjem/Soe2tYvsmI9O7+Uy5Dm8uBBRSTaXhubc5cA=; b=
	Um9E0F0p84MWX4LDQGBn5asAq5nW+JZGDcHGZM8yuWIeyeeEjxy+pH8H7+C9oT6g
	FgBuFwoqhuxzWsRQHmqDfZ1KjoyVBIyL//5m3zjBtV8WcVjDYcuZt/eoqOSzsb85
	54pfwngY4/V/waHA6nY2A1WRi9R3gf8G66E7vtO6KPtc3gFcCc09hPr+BAdg/NNP
	kHZt4Ea9b/I+EU/jkue0vBfM6GaA2OHNoe7n8/01z7ck6FWLLuNK8/EgZiVDPxf1
	e1VMHomUaIuBkXB2KTUe/Msov2QrWZ10L1ZU/0x4kp6agX2g5b+CTSu0lo+xxMR0
	1PtI40ZM+Xuymrp/KisiOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1713945389; x=
	1713948989; bh=u0gtjem/Soe2tYvsmI9O7+Uy5Dm8uBBRSTaXhubc5cA=; b=i
	goxtT0vkntJqKqqRp1pF1xxBkP/PMiWAsyKukhXtWkUQd1Qm6e07iMRlXiLp9ukQ
	iDdjMFW9bQPluYEoTnLB1b6VgWwCByzNRhE+k3BDsX1k7W9w18PV124ipkC0PhR4
	UekBuVK/ZN+Di0ALBfsiPZzrbB8Iq3PVgwL+wKP2R65zYgwgJGZpXZ3uMgbpA4jE
	v30g8X+Mbs9Dwjpzme+1zRz49zEh5yFEwINtCFTg8WC+xyMyqW508sy1K071zZ6b
	lfIs2Mc/Vk5l1mFkHSA0GnXa+ghbdCSU71fG1CQuJ/utJMoTq8o08pDuyCsiYCDo
	mAwi8P04pEeFe0TqODxEg==
X-ME-Sender: <xms:LLsoZti-j_ve6hALK6z1CgP-_u6XJOnuXu7g9LOdvuOS6BT2zBxMmQ>
    <xme:LLsoZiBuwMhu06yBx4KKpKnwoU_DYUdak-CNTCqO6swBQKpaVFOEXVYOve4eHrr_p
    yjSeHZ_CGtEHvrNf7M>
X-ME-Received: <xmr:LLsoZtH7v5ntomdfQc783EQwbXakZSRUag1Z4uDyJkStAqBS_Q2-4g6vwHOi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelvddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhi
    khhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvg
    hnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleel
    hfffjefgfedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohgu
    vghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:LLsoZiRqi5ppKQKdsCAR6QHIBBxjepbSDBRZZNRjUkgP0LcW9dkheQ>
    <xmx:LLsoZqxNLFx3xVWtWX7yGl1l8ObDaFY6inkeD3iIheoQiZKyv86bOw>
    <xmx:LLsoZo42HFBwmBOzH8-oEOBR1ACYnY5v69xm7I2m_jJ8XH1gyUSSDA>
    <xmx:LLsoZvxfjFYSstzoaKTe1AQ9Bi7KcVvTeWJ7P92BmTFP--uLQZfJlA>
    <xmx:LbsoZlzAoVI-ClnFwvwhNuCsQbTuy0xbf1h1dRhatDVMTDs9RG1_0Ydi>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Apr 2024 03:56:28 -0400 (EDT)
Date: Wed, 24 Apr 2024 09:56:24 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] net: ravb: Fix registered interrupt names
Message-ID: <20240424075624.GB60057@ragnatech.se>
References: <cde67b68adf115b3cf0b44c32334ae00b2fbb321.1713944647.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cde67b68adf115b3cf0b44c32334ae00b2fbb321.1713944647.git.geert+renesas@glider.be>

Hi Geert,

Thanks for fixing this! I noticed this as well but was dead-set needing 
to finding a way to preserve ehtX names, and wrote down I needed to to a 
large rework here to allow for this. Using the device name is more 
clever!

On 2024-04-24 09:45:21 +0200, Geert Uytterhoeven wrote:
> As interrupts are now requested from ravb_probe(), before calling
> register_netdev(), ndev->name still contains the template "eth%d",
> leading to funny names in /proc/interrupts.  E.g. on R-Car E3:
> 
> 	89:  0      0  GICv2  93 Level  eth%d:ch22:multi
> 	90:  0      3  GICv2  95 Level  eth%d:ch24:emac
> 	91:  0  23484  GICv2  71 Level  eth%d:ch0:rx_be
> 	92:  0      0  GICv2  72 Level  eth%d:ch1:rx_nc
> 	93:  0  13735  GICv2  89 Level  eth%d:ch18:tx_be
> 	94:  0      0  GICv2  90 Level  eth%d:ch19:tx_nc
> 
> Worse, on platforms with multiple RAVB instances (e.g. R-Car V4H), all
> interrupts have similar names.
> 
> Fix this by using the device name instead, like is done in several other
> drivers:
> 
> 	89:  0      0  GICv2  93 Level  e6800000.ethernet:ch22:multi
> 	90:  0      1  GICv2  95 Level  e6800000.ethernet:ch24:emac
> 	91:  0  28578  GICv2  71 Level  e6800000.ethernet:ch0:rx_be
> 	92:  0      0  GICv2  72 Level  e6800000.ethernet:ch1:rx_nc
> 	93:  0  14044  GICv2  89 Level  e6800000.ethernet:ch18:tx_be
> 	94:  0      0  GICv2  90 Level  e6800000.ethernet:ch19:tx_nc
> 
> Rename the local variable dev_name, as it shadows the dev_name()
> function, and pre-initialize it, to simplify the code.
> 
> Fixes: 32f012b8c01ca9fd ("net: ravb: Move getting/requesting IRQs in the probe() method")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index b621ddd4539cf517..384ddad65aaf641a 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2729,19 +2729,18 @@ static int ravb_setup_irq(struct ravb_private *priv, const char *irq_name,
>  	struct platform_device *pdev = priv->pdev;
>  	struct net_device *ndev = priv->ndev;
>  	struct device *dev = &pdev->dev;
> -	const char *dev_name;
> +	const char *devname = dev_name(dev);
>  	unsigned long flags;
>  	int error, irq_num;
>  
>  	if (irq_name) {
> -		dev_name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", ndev->name, ch);
> -		if (!dev_name)
> +		devname = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", devname, ch);
> +		if (!devname)
>  			return -ENOMEM;
>  
>  		irq_num = platform_get_irq_byname(pdev, irq_name);
>  		flags = 0;
>  	} else {
> -		dev_name = ndev->name;
>  		irq_num = platform_get_irq(pdev, 0);
>  		flags = IRQF_SHARED;
>  	}
> @@ -2751,9 +2750,9 @@ static int ravb_setup_irq(struct ravb_private *priv, const char *irq_name,
>  	if (irq)
>  		*irq = irq_num;
>  
> -	error = devm_request_irq(dev, irq_num, handler, flags, dev_name, ndev);
> +	error = devm_request_irq(dev, irq_num, handler, flags, devname, ndev);
>  	if (error)
> -		netdev_err(ndev, "cannot request IRQ %s\n", dev_name);
> +		netdev_err(ndev, "cannot request IRQ %s\n", devname);
>  
>  	return error;
>  }
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund

