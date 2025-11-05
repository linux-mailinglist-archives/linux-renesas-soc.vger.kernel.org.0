Return-Path: <linux-renesas-soc+bounces-24187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F29FBC3854A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 00:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DECF13A9479
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 23:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8569D29BD80;
	Wed,  5 Nov 2025 23:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GlBNUBdI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="upSgPhyY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C9226ED3F;
	Wed,  5 Nov 2025 23:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762384703; cv=none; b=Xd8q5vTt2LH8f+EHAdvwW2JwznEULgwH2fOpTBT/Uaw5tDiXP0psMmYg7eenDSl5xg2At9pyMU4taKw/QbOrlNoVW/SwaYVYj1/ChQFcAZ94nry5qsqZWye5A/kVhC+Cxi1RertPFod0wn9MBxOKexPVH0jZhtZps3pXTH0PdZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762384703; c=relaxed/simple;
	bh=3NMVbkqXUMD307E+0E5cJR8n6AZmx6Wma/VNDqHFlfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QhRgnvDFnjLe4GE3CUgMkWESlBsdX61SAFIrzi9PCVbQqGMnGqfDOfO6eAatZaOMgK/7DxTcz3eohkXIeZUxgyL7Foqw+Nnzord/PgvWIVDU6ZGnOQB6GOsNCRMMoLjgupyVotdiveuTZzMuTNW0/n2D4GCz7HGZTBFyEn0W23g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GlBNUBdI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=upSgPhyY; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 01377EC0176;
	Wed,  5 Nov 2025 18:18:20 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 05 Nov 2025 18:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1762384699; x=1762471099; bh=hx
	IN+QX5DLUrPqBMD7FJt7JyzTZwW6C27wqr+27yiI8=; b=GlBNUBdIDhptJ4J5CP
	sz7MFwGw/kIJi80MM23lqbEUWBzbS7MF9LtrftcOmo9KMJJ+wQwn4X6ROp+JUrCE
	H7RQIxGuMuEG3ycUeUNvpuZGSpbkYuDa99xQANInboL6hlfX4H/DpxaZ34GwmNBw
	JKSkoXjM/bV/43mskYaSsWYciVvRVA1gwx9/cVGHYBq8P4MVi2VOauAdP0WKzcEZ
	5CMZlgeg0pe48PU+0Pn+3VuRCBK2R6iU0YDq3DocBdtWRSe9+R7ecZ/a1tMxrH1V
	QnF6PXup3VCYUZIH7axHhWmOD/kdgErr1JJqKjkgoRKAzAUT5xmJgESDmCaOzTyP
	Mzuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1762384699; x=1762471099; bh=hxIN+QX5DLUrPqBMD7FJt7JyzTZw
	W6C27wqr+27yiI8=; b=upSgPhyYtm9+MNrlwo00QFgK2qM3YzgEZWBzSdI25MMY
	yValuBaQCaBAP7Zlrm0eUv80RLjVamTQXPwL9tEe89ElcXmUN16cO1TUe5OxUG8I
	zXP42U5WMYWfqwApUurD+kUB8zIygYFi11mfbO8SRRv3+/RwxwEjGIbJV7qmMbbF
	0zzfrk/7ayAI/nfyXQBZ8SWT7WbwjEm0N5rZqXY7ujSzsIllRglrl7tQQXPuFv9q
	fFW5rSghLaS0m/WIfX+wbr70ECp3QrYIWWDTyVdWd6ByqQ5sd1n8f0yKduxAS5O4
	Rug0p4JvRLhhUmu1gcV5UbHOx0/B8a6zUfsZ7UaA6g==
X-ME-Sender: <xms:O9sLafNRGmXBqqUDiiLl41mhbeCPIugyqTtUC4Y4i_PQGpQaMaYvsQ>
    <xme:O9sLaf-t29DAzHYNE8XfAIl0celozCHz9cr_vjQi_nZOZ-U5J1l5be-1WveNrib32
    8_LFQJuXDucC1RnKC8azTaG2qQr1wCZTcCWA7FnX6a-WWCXlKLLQ3E>
X-ME-Received: <xmr:O9sLaZGYsGgHFMt77NxBBcIKYlbV2arklMRQHBcOJKtc7XFMlwUGn_cwa2AjFCTALHdtpjMotOEdLozhwLVAb_1L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeehvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrsh
    esrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffef
    udefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhn
    ugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgs
    vgdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtg
    hpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:O9sLaWhMYWLdUPDVD7rU2Wjs48I5if3ExCa17Rk6OZu8wUzZtDDlfA>
    <xmx:O9sLaWu6bXeRru_yGM_RQ3S1ZOgDqH9ChSkFWq4QPkQ8qqIvKi6dyg>
    <xmx:O9sLaZsHUXZZShbzg_rsaM9rQNz3_UeyEC1KN4RuYu0jU_InCFbk6g>
    <xmx:O9sLabHCh5HGKpqM3iApfK-rJ41VG1FS8zzMKfCfkWrADFlsbzV36g>
    <xmx:O9sLafJvFUX4SLo65PUthpOHukYNzbjspxfN420k8tHc5Gpgl2Ac9w08>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 18:18:18 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] clk: renesas: r8a779a0: Add clocks needed for GPU
Date: Thu,  6 Nov 2025 00:18:13 +0100
Message-ID: <20251105231815.1927239-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

This small series adds the clocks needed to use the GPU on V3U. The 
first is by far the most complex as the whole tree branch needed to be 
described.

With this and soon to be posted DT patches the GPU on V3U.

    powervr fd000000.gsx: [drm] loaded firmware powervr/rogue_15.5.1.64_v1.fw
    powervr fd000000.gsx: [drm] FW version v1.0 (build 6889268 OS)
    powervr fd000000.gsx: [drm] Unsupported quirks in firmware image
    [drm] Initialized powervr 1.0.0 for fd000000.gsx on minor 1

And run test applications such as gears.

Niklas Söderlund (2):
  clk: renesas: r8a779a0: Add ZG Core clock
  clk: renesas: r8a779a0: Add 3dge module clock

 drivers/clk/renesas/r8a779a0-cpg-mssr.c       | 9 ++++++++-
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.51.1


