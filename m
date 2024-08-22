Return-Path: <linux-renesas-soc+bounces-8008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8925D95B158
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 11:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 246BAB23E85
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 09:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B5417CA04;
	Thu, 22 Aug 2024 09:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CEQSvruf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4699E14EC5E;
	Thu, 22 Aug 2024 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318309; cv=none; b=iKtNEFmyvSsXYMlR+y9SXTG1sB/oqtLjlZjtpED+carHey5XYQsMMGzBPf2Gowf1fqoJ1QhCYlzivQFufu0DxI6PTUTwIXuVEh828MjIEJnq5TCneYyByFSQiMQjoSO02hzhMfyBuTF6bazkhcBiMifgxTNpT9NBvWftFrPC6jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318309; c=relaxed/simple;
	bh=o/88/6mIf0OD0S9oLAuDV3MSyoHkmewYp4gh5qtQxwo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JX+RzZ+FDZvr4qJ8zGoPMYrj4H7Vowp2GjF677GlfJ5z4KuX71BzuKWZQSnA4Uw0YKrkmEiEP2hBD6NoDHAMSKH+PSPmeAiGsfb2GEWP4vKsa2PVFoMVN9ZOWHbWgGN1fezFeYJOCE16ENm91k+ZJE842cEsNjFb8efc15Z7TMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CEQSvruf; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3701E6000C;
	Thu, 22 Aug 2024 09:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724318300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7UVaqvZPZcs8yxKAcxVpWOMqhB7K1Zn1oE1wg32Ip1Q=;
	b=CEQSvrufCu8Q9Q9IvWU1VTCdTJXtDww69u0l5EHqnFVm+beKD3/12H0yiCoVDlh5t4mcId
	qsliZOZij1VRzH2mOxsKJy3nWCsSRQUYiX84ha8mmCQKJPjv4IEgm4dU+0VLKMKj2fG04g
	xQ2VrY08m7qBFjesTYts5/H294xJX7WS1+r2XP/PGCKD3Ynhw6ey3RffiRkY29C4VoT1co
	X5ga9Sxk1wjWjEXP4rZ44gxAJFus8akcnevRgPAQCCqSkxwgCTXWpvBc/B/SyWGINHcikg
	B5DyAAF586tO0Ir7UW1psj4q8Lx+jonx31Gd6m/6GcrDLdwgXwGsPr0DbnWr6w==
Date: Thu, 22 Aug 2024 11:18:09 +0200
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
Subject: Re: [Linux-stm32] [net-next 8/9] net: mvpp2: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Message-ID: <20240822111809.73e125f8@fedora-3.home>
In-Reply-To: <20240822084733.1599295-9-frank.li@vivo.com>
References: <20240822084733.1599295-1-frank.li@vivo.com>
	<20240822084733.1599295-9-frank.li@vivo.com>
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

I've tested this patch on a MacchiatoBin, works well :)

On Thu, 22 Aug 2024 02:47:32 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled()
> to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

