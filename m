Return-Path: <linux-renesas-soc+bounces-17535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D179AC4A56
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 10:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D278A188BC73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 08:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E39226CFE;
	Tue, 27 May 2025 08:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="cGwguvis"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844F9248F5B;
	Tue, 27 May 2025 08:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748334610; cv=none; b=Bw5X+HYGDpBik/OoWZKzWlDhWtb6qmJ9dXUX1GJCln/BA/ofaJJr8dowDydTZgmKCyRj4JpHgiSTz5Vp2sf3zm+GEKALQ3qg45RHoULw0yai2VNiHW4avemb/5JM8KRgUyzEnMeDenLQBRvbrI7x1IWPs9DvsPzOp7VsGNK29bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748334610; c=relaxed/simple;
	bh=bokkXsDYu1IhC5cK4pIZHGBgDHkECzX1dIxfgDAGs4s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DkwVU1o52I1ib7YIgAXgRIFUfb6owIOERes0vOw1KBlsExNGJ8YmtQyCqZWjnRJZtxFqLwFWFplVbDgkVYn6Q9cbyRQfSo3ouZLZ5D2vOJ5e2JDWbDdKPcFn93Kd5Q+b03frgXV2s50AgEv5q5o7A549iptRoLe8dldZSltfs90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=cGwguvis; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=bokkXsDYu1IhC5cK4pIZHGBgDHkECzX1dIxfgDAGs4s=;
	t=1748334608; x=1749544208; b=cGwguvis49lRyCfE0+5Qp0SqUXoFrAAHraCB3s2zuIkbSEM
	c80f+/YPhlNF7zr5u/sDQZdr3C8nSYiSKC14MGb6oq9yYaqUtUz5Dle9/PDTpKp+235FtiVCgrlgT
	L55HQXbhJZcUy5Q16srPpwB22eQuoZPG4g2Se7rgUKR9tzXLj1PrqztCaVLFm7GlB6MZfG05qyE5I
	64QQjc7UpSMyvjwKEe7eZYBkEbTHhWkGEtgiGD9jPPQ7Sdc98zUNOLBRun9PUUXU7Eqd8R4PGO/Hh
	0b8ArB2ccQQ/KcvPHys1uPCVE0u3TDKJVpgfyVKi6jPx4EthoalWRip59J25f5cQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uJph1-000000000cV-1wqn;
	Tue, 27 May 2025 10:29:51 +0200
Message-ID: <d33cef50af049c296bc22f1d497993c8b1c74e52.camel@sipsolutions.net>
Subject: Re: [PATCH v3 2/6] ALSA: aoa: Use helper function
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
Date: Tue, 27 May 2025 10:29:50 +0200
In-Reply-To: <20250527082446.2265500-3-aichao@kylinos.cn>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
	 <20250527082446.2265500-3-aichao@kylinos.cn>
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

On Tue, 2025-05-27 at 16:24 +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.

Why are you resending this? You haven't convinced anyone of its
correctness. You haven't even convinced anyone that you even understand
what you're changing ... so I think there's not much point any more.

johannes

