Return-Path: <linux-renesas-soc+bounces-8356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D8960808
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 12:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA39B1C20D56
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 10:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4421919E7FF;
	Tue, 27 Aug 2024 10:58:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFEE4C634;
	Tue, 27 Aug 2024 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724756335; cv=none; b=ZR/6dvAHloEFcpQQwfzwi5ajvzZdoecf6qUQObYYqXrykblIPsQNGGc5V7rRff4si6oDRuqq8I/MWXy0BPB3HqCYRWMZiDj2C+Ib3CWm+jzs+AyvPRilwg5ESgHZ6vNw0uktDQhIkEDSfzHYO2SZEERgb3Zo18PDfOvxjkzNAmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724756335; c=relaxed/simple;
	bh=QMF1YCobzDkJ41b8Qp5IU4kTcOkoh3PJb8+p15uixDw=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pc9NcupewweAcW2yLRXRNd7+5kQMScL1reBQrYufY1udvo7JVhbIFiQlIpWHqmPKr2xcd8UpWc9HT7bqYgqKWIu7zMi9QLWZVPiL5d9ZlILGBJb8XMUEP6w7FebhgcUFCzojGLlFnGSO2VC7e4IeHOlc/36ef+17Nt9lglJmU+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WtPZP12DGz6J72t;
	Tue, 27 Aug 2024 18:54:53 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 14F2F1400D4;
	Tue, 27 Aug 2024 18:58:51 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 11:58:50 +0100
Date: Tue, 27 Aug 2024 11:58:49 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Yangtao Li <frank.li@vivo.com>
CC: <clement.leger@bootlin.com>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
	<olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <ulli.kroll@googlemail.com>,
	<linus.walleij@linaro.org>, <marcin.s.wojtas@gmail.com>,
	<linux@armlinux.org.uk>, <alexandre.torgue@foss.st.com>,
	<joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <hkallweit1@gmail.com>,
	<u.kleine-koenig@pengutronix.de>, <jacob.e.keller@intel.com>,
	<justinstitt@google.com>, <sd@queasysnail.net>, <horms@kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>
Subject: Re: [net-next v3 7/9] net: ethernet: marvell: mvneta: Convert to
 devm_clk_get_enabled()
Message-ID: <20240827115849.000079fe@Huawei.com>
In-Reply-To: <20240827095712.2672820-8-frank.li@vivo.com>
References: <20240827095712.2672820-1-frank.li@vivo.com>
	<20240827095712.2672820-8-frank.li@vivo.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Tue, 27 Aug 2024 03:57:10 -0600
Yangtao Li <frank.li@vivo.com> wrote:

> Convert devm_clk_get(), clk_prepare_enable() to a single
> call to devm_clk_get_enabled(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Reviewed-by: Marcin Wojtas <marcin.s.wojtas@gmail.com>
LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

