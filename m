Return-Path: <linux-renesas-soc+bounces-8016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D701995B45B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 13:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15A221C22EDC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 11:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D571C93DE;
	Thu, 22 Aug 2024 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Gkf/OszT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596D319E7D8;
	Thu, 22 Aug 2024 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724327790; cv=none; b=eAmCby/LAN9ITewBmc0471+bbNi4lfTMZzYDrZboVC9I/7d4cyUwMnE3woQgXyS7tL1Yf1jldo6p3QveYrb4W7f34J8xO+lA0Hx0Tj32X8BvE0YhnHZsum4dnb/2YLtP1mFM46uNRGlGjOXQ12BT5ewMl7gPPwmxNSTx0sqT81M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724327790; c=relaxed/simple;
	bh=wCZ/RqvUaI9pmi2QwxuBeDkz4tI51Ex2sMXt6lPcgA4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q2paML+gXhYZRIjxWoA4wexRmFywU4a11rGCutIFZuC9xl0cr8pGCGEROPHSDJJOTzZMFHxNmwBrJ5s4id5uxTVarjaJDMangF0IBS31/cS6i/yLAyW4rsEr3ZzAbPcE2OEhhpur/L4RURIpSLv8mFmgtluJ9k8587OCPghzcys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Gkf/OszT; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42C44240009;
	Thu, 22 Aug 2024 11:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724327786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gOwxgtxFAxYkk7+l7KBiOk6VqViegG+X4kGMpiBsEo=;
	b=Gkf/OszTAyzJ4UL7JWAhorzjFpHa9YZk/knbSvzZMWiYR/gsX3vGUS0W/UcuXE88EWTD/q
	N5vdK2U48d1gIQpUChHYHilR7KkVvjUDeDSWRBXrZTSY/WMBLeyjD7chhw5p9bVQqard0L
	qvN9lT1lp+lZAP1zFfkjeU64eV4z3BRSfJqc9IIGIDTq+TbefvY10+K3tNeLuPOL8wZKIz
	tDxM359xOKHifHiW+6fbC21dGftgAdV4hTriKsWgNs6dcrWVbiC13Rp4Qhq2vrE8lUbs2q
	Fjb9IeoGAUNpkmP+8eEzrjhX2Nx5ssjhQHcpQ4/vz5+GzMv2ZhjIrHEX+K8sKg==
Date: Thu, 22 Aug 2024 13:56:24 +0200
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
Subject: Re: [Linux-stm32] [net-next 2/9] net: stmmac: platform: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Message-ID: <20240822135624.4ca9a98d@fedora-3.home>
In-Reply-To: <20240822084733.1599295-3-frank.li@vivo.com>
References: <20240822084733.1599295-1-frank.li@vivo.com>
	<20240822084733.1599295-3-frank.li@vivo.com>
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

Hi,

On Thu, 22 Aug 2024 02:47:26 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

