Return-Path: <linux-renesas-soc+bounces-17363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4268AC0955
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 12:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0594AA2796E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C85286425;
	Thu, 22 May 2025 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="se5hit4f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583BF23496B;
	Thu, 22 May 2025 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908277; cv=none; b=IImn5rYhpXrjKEuRdmJJRllMzH58x5Z5uuOVQMgZKoIvYBTtkBfutnOahqRBRbFOhqr6GZKIUnbqYbbiS5mM6fkV9Fw1q7z0gGrIk0/Hs6jj7k/EtKh5njbRg9BgisZi8olKBZuvZWP3P0v/yedIXK4rLOPFbqVZ6YSMcsHEajc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908277; c=relaxed/simple;
	bh=InhhMxNFIQ0YLLJDL2Gl9Q+2MAVGPnLn4WsrFUhRBlw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IBbXa11IC8E5ZgASzt0fmrmlPQZ+VVCAc9FW2IgH1T+g68TFdaYmkOERWV5GyI4zyDMxvT2oj6zXKNkSxAGOyY6SNEfmQiuxVa20skdTQXaqujJbOpnp9LUHNHF7GLfTykIaQTLU05IqmU6YYAfO2Ke7CfTvJ/I/j40RMrap5n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=se5hit4f; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=BEvqtXUoRY2MtYTRcX5uBf01lX2zWH/6+T3j+WmGUyc=;
	t=1747908276; x=1749117876; b=se5hit4fhMs1V9H6LVAuUsWeqjjYdNJhk8CM3QpCAEp4wG0
	ownKbcGCYJmSPtFonD1DCaxzwUOMlkEdztstRZvC87qAm728xKImzJPB09fpi1Yu1hv/h26DLmRq1
	2aPgVNGCZ2QwmbD/Qfeo+YVpUvlDnxORGFqCnWz8z08x/ioGI0SlTP3MgeqSNn5Fm2XS2VmuNs08q
	ySoHSG/u++9/66O+uOU/vy2iO33fWC/w7QamvlCcAxAFM6K96G6Te3FdiTiXtf1R4q90YxdQU3gGb
	nKwKpVePz/Sy5hh7sh90dAIrmDJDdhS0ObPk7ugt4QYrJErty7dwmUj6DJJzEAdw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uI2mm-0000000GdCj-3E2p;
	Thu, 22 May 2025 12:04:25 +0200
Message-ID: <3fa189cfc0a52572008590efbf5f4ad05c81dbc6.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ai Chao <aichao@kylinos.cn>, perex@perex.cz, tiwai@suse.com, 
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, broonie@kernel.org, 
	jbrunet@baylibre.com, neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, 	festevam@gmail.com, nicoleotsuka@gmail.com,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Date: Thu, 22 May 2025 12:04:23 +0200
In-Reply-To: <20250522050300.519244-3-aichao@kylinos.cn>
References: <20250522050300.519244-1-aichao@kylinos.cn>
	 <20250522050300.519244-3-aichao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2025-05-22 at 13:02 +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.
>=20
> Thus, use this helper to simplify the code.

> -	for_each_child_of_node(dev->ofdev.dev.of_node, np) {
> +	for_each_child_of_node_scoped(dev->ofdev.dev.of_node, np) {
>  		if (of_device_is_compatible(np, "i2sbus") ||
>  		    of_device_is_compatible(np, "i2s-modem")) {
>  			got +=3D i2sbus_add_dev(dev, control, np);

Given the structure of this code, this either fixes a leak, or is wrong.
I really don't know which of those two it is, it's been decades, but
either way it's not a change that simply "simplif[ies] the code".

johannes

