Return-Path: <linux-renesas-soc+bounces-8015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EFB95B441
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 13:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 264281C20A05
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 11:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC031C9435;
	Thu, 22 Aug 2024 11:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nocUyjkI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624801C942D;
	Thu, 22 Aug 2024 11:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724327453; cv=none; b=KIKOV/T0Sc3REoEu/dVLunCtGt03ivuYvAYp5ikuzh9MVbS3IYzc/6kBfG+RZYsGmuc1sTPAf3fO88bJWClmwDkn5jp0+yrNUgnIk6n2cxYSLiG58DxhCNjhgpTrLfpXHqOT1HTjE80H685zjW0mj427NVa6+325pEHPvTl28uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724327453; c=relaxed/simple;
	bh=QP80vyJUL9GPG1OF/i9qoFoyxhTTVxUn4we/0W4A3mM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VirhsdWGBppraU4zAFdbm2VZYOIY+u+SfuNOZB9MosaAN+zj87qBfxo8+LOhMsRZIdZDUtgfhUQr8z2EGU6ssk4qW2/nAfXNL2kU8P3gwkdtFzPmuRoa0D+3pU4FlncYEpV3BbvLYduBkse4XnkX/xGdceq4E0xuSAD/So9E8Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nocUyjkI; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36406240003;
	Thu, 22 Aug 2024 11:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724327448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lZibZ0qrTPs+PVhLdaTn4kLI8ejArBOQjFC05CeDtoo=;
	b=nocUyjkIFiU3ty+eXRVhysJcTb4mF2etsONDIlL7SIhWMnrCKvcNx9eTxbd+st8EmDc/bf
	V1yYWEFwhzh01fMkkpbexj+GP3z75RzjQUUNt/m5Hw3DYVPUU7HIwKSo9gINu8zBBcuTrQ
	NloWx6778T7HES7oeVv9TdTeafpuZpRcPhpaak7NU4iOVBVgoAab6gBsy0teuWgXOLR/Gx
	5JWzieWwpczt8JB5Z6TWA7bkJmU0iSy8X6Sly11S3xCrxYxYwfrv5h7/BGNeo/9bbhClj/
	1ns7+Huj7w0/ITN94mn3I8XCzYGjZi0kct+vAgk2v2M1Kxwws0qzaLKIhxiv0g==
Date: Thu, 22 Aug 2024 13:50:44 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: clement.leger@bootlin.com, andrew@lunn.ch, f.fainelli@gmail.com,
 olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, ulli.kroll@googlemail.com,
 linus.walleij@linaro.org, marcin.s.wojtas@gmail.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, justinstitt@google.com,
 kees@kernel.org, u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com,
 horms@kernel.org, shannon.nelson@amd.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next 1/9] net: stmmac: dwmac-intel-plat:
 Convert to devm_clk_get_enabled()
Message-ID: <20240822135044.28d0017e@fedora-3.home>
In-Reply-To: <20240822084733.1599295-2-frank.li@vivo.com>
References: <20240822084733.1599295-1-frank.li@vivo.com>
	<20240822084733.1599295-2-frank.li@vivo.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com

Hello,

On Thu, 22 Aug 2024 02:47:25 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

