Return-Path: <linux-renesas-soc+bounces-18887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A8CAECA6D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 23:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97D2C1898536
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 21:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD45E224227;
	Sat, 28 Jun 2025 21:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="HlN6YFMr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LDKs5tC9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF7221CFEF;
	Sat, 28 Jun 2025 21:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751147788; cv=none; b=IdgWzuB+azovt/IrBaxFFqzKc48o2pgKB9EC2Yzzd4XpcOVfC/rRQDGsBu2dqvVoGJ7urtCddjmRvJJsGJtTIfgZRtH3HBegorjCD9GmAVlCwe7VjHTdRdOgIdSVOQ8b9SHHUQKYkTkFh8K2915yXm6oF63mkpedGARiLHFZLu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751147788; c=relaxed/simple;
	bh=d+xEHkVVmu3akWXPD9EcfcRa7OBulZzXqG05tYR8j5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RXWXZOUX8fgaQb6DvdutG8y6idy1uCd66kY8SLflKWRBWnBHE/dJZXvI/AwdYJx/W98Jx2l+5eKpm9i0t4YMy73lr/KqtWZeuDulUreFevMTE3fzxwZmL15e5a9OwFVsnIo4awEMyTT7pTbzO4dpev61/EU21LvcvC+0zZUt0bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=HlN6YFMr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LDKs5tC9; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C8FE47A0133;
	Sat, 28 Jun 2025 17:56:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 28 Jun 2025 17:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751147785;
	 x=1751234185; bh=w4G+356idh5gojsdVfhSI6uksiPLrlRv1vv+Tp0Fgak=; b=
	HlN6YFMrYv80+5nL3ANW+ZkJW88Pb6X5SZgEMYt27mPgh3YcFAhNcNnA/NGVSu45
	SVYCJCuGvVZX9nSxUa9d+QZYYDZUnyHALjwaZsirmDehXNgbNxKO3rWi1zmnwr6j
	w2/bYiRyJfbdiUjG6dZ9p7uHErAVLlGzC1OkRRH3xiozzeLIBK2/K27d6uAWlIpW
	bLGykbDtyJEp/UwNGSPyrlUtI2qmpPTeIV6E03KdMXL/ziCbETmdaCJvj1c5vWGv
	wvSHG/TJyp0MqYn4+NDWbMoLMt3nGSTado0l75GvTavZe7UsDADpYpzdB9661Sag
	euYGVWKqpd8jqKfwUWiurA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751147785; x=
	1751234185; bh=w4G+356idh5gojsdVfhSI6uksiPLrlRv1vv+Tp0Fgak=; b=L
	DKs5tC9/wsiV09Vh6VIvh9QT6GwpV9ruZud20AJuuBoMG0I+ArGDnAMQ319xNe2o
	X8l8D5p8EvO/cjCSXE7Wr6BadCKQqwpDxev77wK59GE5cM9LYn4fgOZX2EOgBtlY
	vR9La6QRdveyz4hGoZAoF5eI5ozfdPMW7HIuiuUrLiDPNJ7YQQOal+NvAu1BrN/q
	88m+SvZ4uYcTqaRv+DC4dwRgWN9NWM+vqoCSSTOkNPPoe8LzVmFPVeWQHsOKnEGN
	HMahKKvTYv+YA1dp0ZRYhPexwVv8my5nAZ5b3h5Ei1KqSigREadBqej6JUVetv0J
	zngvW4aNBDMa6lk2YdbQQ==
X-ME-Sender: <xms:CWVgaOUL0_Yyl2xYX_CZu9WUuYKEGTHTm4IJ4pb5XRxFf9HY7B35OA>
    <xme:CWVgaKnqnYkLl6nlxdYXDrMjzrI9vo284O_0JoSTlzHHUwLGd5tuEYCqDm5w9ZTuL
    q1r_VBvwk6T8eFezf8>
X-ME-Received: <xmr:CWVgaCYYPVKpRK0g12iGz1nnVRS9x73GHn6dspM1gqxrpsqQRqdBCIOFn-kpKULDsZdbykvO0MXEue-3yQAHvcPc5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedtfefh
    heegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshesmh
    grihhlsghogidrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgt
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghr
    lhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:CWVgaFXYoGPYMMYnzgAzXsnAMZc0zXHHzLDtKGkKIxtTwO1gB2kCaQ>
    <xmx:CWVgaIk-eE5-Lfxbd_wyaNs5LIvfdCUYAwZ_i69hhS8bCPKs8KCO1w>
    <xmx:CWVgaKdSlGamyVEdd71qh1ysewn2bqoQxTGcy7el5W2LkOB7E_4IBg>
    <xmx:CWVgaKHM-mUAvC0KxNYs5nn_pbwzWzS94AbzYAW9ZHfjGIgpL-MB3g>
    <xmx:CWVgaIKxp6fbWPRHDDJHf3zezZa2Isu81h9jSnjigLhelZgH24D828bc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Jun 2025 17:56:24 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/5] arm64: dts: renesas: r8a779g3-sparrow-hawk-fan-pwm: Add missing install target
Date: Sat, 28 Jun 2025 23:53:33 +0200
Message-ID: <20250628215337.1688969-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250628215337.1688969-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250628215337.1688969-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The target to consider the dtbo file for installation is missing, add
it.

Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 677ba3aa8931..47e46ef99d36 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -96,6 +96,7 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
 
 DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
 r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
 
-- 
2.50.0


