Return-Path: <linux-renesas-soc+bounces-8017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 020B195B489
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 14:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97A612845EC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 12:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741141C93B8;
	Thu, 22 Aug 2024 12:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KhBkwVaI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF6217D374;
	Thu, 22 Aug 2024 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724328247; cv=none; b=C+sjyeWzoKaejgcRVzpBh6Uj4PBDYxErUvdGwpGn5evxrkhf16TU26ViPNn+tAoB82FNgyyI7PgZ/QoYw9MD+n46fToDE2jUJdttIIjL5SsxkNS2YCxZc1W9AMxfad8PCms6smK/KjVFTRwHKgoNwef5KUIwTXuOzsYC4ZsiHps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724328247; c=relaxed/simple;
	bh=Qf0pfe2B4skxex88RWsBgOZlJ1oK+6WmfO9yIv9vPhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NpV9Rz9YbKkusNPiO9EQIK7io1LHNXjS5KTHBjMsoVUKP8wH2tzvVKsBxQS+hIFsnZmdBsK1pP4TnkF9CY+s8EuhONHjouvSh9mpj+dARac0Hz1xcaWYCW48yvG+etcsAPpt7kfoozkqnhFRa6exb9QqKARxCRFHNyai3vqCY8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KhBkwVaI; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 95853C5348;
	Thu, 22 Aug 2024 11:59:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C486E0007;
	Thu, 22 Aug 2024 11:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724327991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V6WzS31XWKQ+PAVvVlTIcXBZWu/ygTzCRj8Asrux5SM=;
	b=KhBkwVaIS0Tti/okSc8ezPChFhGcFeUmJhyL8ECkY33mqZnzIKWU/3C85mPtfYwmDf+Pzq
	zO26tKZ5SRgUa6QuYXuT9ercQuKOwnuuw+aZ+3W5SEwDqMOlbdqVg6AMxKe6piWsa1Qbhv
	Rk0hkrmTzzI49Uk0WOauWL9SgY+iftrsZyAVrz0V7kQj58KAAYorlPAxrlZiVKnbNSjI3/
	WHp0EamOpPX3u2LQJ7VYrFYt+BvbgCRzFX8BKAdZnrK/DpkWaDkLm+gLY2Smu5Ia8KOJfS
	k5aC9bWeDWCpG07eWahcSh+q7p9gh5n48T3+uvEfTDB+Jd0H5/qCosOPONVxcQ==
Date: Thu, 22 Aug 2024 13:59:46 +0200
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
Subject: Re: [Linux-stm32] [net-next 3/9] net: ethernet: cortina: Convert to
 devm_clk_get_enabled()
Message-ID: <20240822135946.356332a5@fedora-3.home>
In-Reply-To: <20240822084733.1599295-4-frank.li@vivo.com>
References: <20240822084733.1599295-1-frank.li@vivo.com>
	<20240822084733.1599295-4-frank.li@vivo.com>
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

On Thu, 22 Aug 2024 02:47:27 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

