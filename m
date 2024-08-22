Return-Path: <linux-renesas-soc+bounces-8010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 562AC95B228
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 11:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C1C81F256B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 09:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39C51865EC;
	Thu, 22 Aug 2024 09:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="glrNT2RD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160C8185B75;
	Thu, 22 Aug 2024 09:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724319770; cv=none; b=a0zK3ExzoOuypiiIz6+AUPqpQ3/FxD03Y6EFH+YLhLuov+qEhsGKs9Uo0Bojw/R1cKU9E2Fndqz6paSrbDF1YfzskyCUSJ4J3YhV2oJUyX0cL/Lg84gtlNsujpEsayWxAv7/Kn8ndHeHauMGQgLf/0+OVjvLcKV46ELo6H7fT6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724319770; c=relaxed/simple;
	bh=OUiI5PGC3hJPJCqJB5CyRDDbUWF73ccfhFBxv46Cr5A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ql5HdoTHYLnRwfNM1A7Q/lrKjMoMilL31RsP15BqKaN+NGvGSn+8ui5cH+j/TZWGsRq7lCLYkwjhbj9pxbfoueih3dIEGWFkAzIgmgKYvmB1CrpJXHO/PSeKmH8/bkY+dzVRsTB46GSAnGkHNKDnQGBKAKXkR9Xul0OuwU0Koig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=glrNT2RD; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 098C420005;
	Thu, 22 Aug 2024 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724319766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLYel8MERsORw87KG40ZczmgE+PRQ3IJYM7INT7rTyo=;
	b=glrNT2RDuY8jBpkmsN+su8jt0vQ/IVHPXE8hnhq9Z5C7PM5Ni2gIFHr/M5ohGOyyeIDxk8
	JQXb0f3r6eCJfD2Oz8o0+0D6Sw2dwlCVOzlVqbuyZ/W09foeRt9EEl0RtRts2t0ZXhe4Ib
	wmowORp3s4ESDpsW74uwpQDDLsxRmHxcJED4hXNLdFyuuCr7mnk5ny9x2Wi3pjHO9Yd7B+
	jwjkVM2k9i8QYoVOdS5iaEpERhXeExgi5fj4lonxkJoBiV9q0Bz5DdI0JhVXmCtv+UMaOn
	+vXB0tts/wDyJjx/kys7vmDUtt60jtX3GzWThAJucbPdirjiGOtot9U/SyW1CQ==
Date: Thu, 22 Aug 2024 11:42:42 +0200
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
Subject: Re: [Linux-stm32] [net-next 7/9] net: ethernet: marvell: mvneta:
 Convert to devm_clk_get_enabled()
Message-ID: <20240822114242.112dda9b@fedora-3.home>
In-Reply-To: <20240822084733.1599295-8-frank.li@vivo.com>
References: <20240822084733.1599295-1-frank.li@vivo.com>
	<20240822084733.1599295-8-frank.li@vivo.com>
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

This looks good to me,

On Thu, 22 Aug 2024 02:47:31 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

