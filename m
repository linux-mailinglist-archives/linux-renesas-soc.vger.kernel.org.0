Return-Path: <linux-renesas-soc+bounces-8315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9D295FC94
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 00:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CA47284084
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 22:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6BB19D09C;
	Mon, 26 Aug 2024 22:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o80/auCJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E3119D08C;
	Mon, 26 Aug 2024 22:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724710550; cv=none; b=ZrTJqAKE3foFmdJPsyqaMaEUewiEzMLd2paydzk5zwAgKIipQWGcJ9UgwEaKvCS8XXzSvLlI4IyXfyLUOr195yDzIYni+2ZPVtAqTn3KvdoVpnC2jIUNO4AdOtEqE74Ak1DBgyqSExJojlOnEEiVkJiUO0MaJRtsf43pp88wkwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724710550; c=relaxed/simple;
	bh=q3Z545Cwl9qk9MzIvKMZNtiuz9zz81MQ4m4M1Lw9iIo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y/qib8ubxxU30ORx1EtPX3mQNJmodsA1mVrYt1eqbtf0JexKFclKFYzNLMURZGqaJR+/HDiidewOOt9Zy8wwV3C3EydnbfNGCwWdi+Mb0HSP358mPME6Za2mzeAP+t03x7W8HtzjbN+C0EdzSj+2tOaYNGv8dnOL5rqyKl8JwU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o80/auCJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BDFC4FE9A;
	Mon, 26 Aug 2024 22:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724710549;
	bh=q3Z545Cwl9qk9MzIvKMZNtiuz9zz81MQ4m4M1Lw9iIo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=o80/auCJi8Sgfvg7jUVZhSQD/MidgR2jR43iyA8eZXmMMc0lszYZKttU4XxU82O/k
	 GHbW8Pp/ifKNOFIsPn1bG0ez1d6rkaGSKatr/3aC4E5myrmsGzUMH5IIDR/kHwnDyG
	 ui1RHw7PkZetL+oiRPnEvHZrFtyOsYfc2iisKtP6K5VP0UX/iewQO458963lbryBpt
	 Bih5/+CHj9iyeYiyQak4K/XFKXkq1pat2dWjMgvTz+TKS/ozeHjL2qGCBv0B/iWltl
	 uQv1Rtq4b/sV9F8Hs6522FtIybmpjRsKh48BXFEdEQ38c6rc8oGoix/O7IOZxgD/sH
	 Pu+4sxbyLThoA==
Date: Mon, 26 Aug 2024 15:15:47 -0700
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
 linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier
 <maxime.chevallier@bootlin.com>
Subject: Re: [net-next v2 3/9] net: ethernet: cortina: Convert to
 devm_clk_get_enabled()
Message-ID: <20240826151547.1f0e2f29@kernel.org>
In-Reply-To: <20240823072122.2053401-4-frank.li@vivo.com>
References: <20240823072122.2053401-1-frank.li@vivo.com>
	<20240823072122.2053401-4-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Aug 2024 01:21:15 -0600 Yangtao Li wrote:
> @@ -2403,6 +2401,7 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
>  	struct device *parent;

move the local clock variables here, keep lines longest to shortest

>  	u8 mac[ETH_ALEN];
>  	unsigned int id;
> +	struct clk *pclk;
>  	int irq;
>  	int ret;

