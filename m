Return-Path: <linux-renesas-soc+bounces-18958-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E260AAEF676
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D08F23B030E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 11:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D3F272E44;
	Tue,  1 Jul 2025 11:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cbpHIqLF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lnrvg433"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED2826FA77;
	Tue,  1 Jul 2025 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369197; cv=none; b=p0ftu+mT/gv5IZ+tuI9/gpjbbYwqbl2mN2WSP6GLDYtUt7ywn/erkdFmFnh/s8R0yJY0kaNzXubDv2xEftq0vJ4vxE0vodhlJWh7GCrUbmiF8yQDLcUbk0y0D4FuqTrOim21Q1RErpLMrhmPj+5y/ne68Jv+2Hd1SG5xeFTaVRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369197; c=relaxed/simple;
	bh=Dbh17C4ZddLI4MNJV5rJGd6lIsaFCzIspA1akFenc0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gSfigEWaX/jjfAr0rYZ2/9McFqoC8TX524/DN2YxVgK5QEK8h6m1vCiXJQv97KFR3ZPVfJgJ5FpYrWiFh2VJU9kbSBK0Pc2eoeneoFzAoDjPvVMYSErxFFnAnLv4604I9MjmpqF4Mhy/r3ydA2tTW9brqnSbC9jslRZjOgV3Gg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cbpHIqLF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lnrvg433; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 2B4FFEC04D6;
	Tue,  1 Jul 2025 07:26:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 01 Jul 2025 07:26:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751369193;
	 x=1751455593; bh=XkSvBqQjyo5Nk7yK6lJdYedlIsB+wMqs8eRrgIyn8cg=; b=
	cbpHIqLFTXyspIhSJs2dE8e4l2pSma5GqBTWNHKWB0SP1bQaqnx3bIfNdpfzibmW
	hOwNgf6lbg0wo0OF9Sw9BvXiYzBUL4LysC+KK/uFh4Rk12OMTlsCH24tBDlULINv
	EwuQZNavcnGMVYtZjMKS0xaxAh1q5XhS6oYG3kJRS5S3jtRoVhQ9U0Ydzso+56lI
	px3VyPa/xZ5lBX1kfaWIal1kD+W85DLqfOCbR1FRyueHy/OMF0kOKLpc4N5FPHFe
	15QgKGLm2pjeI3OCgeSpWEBoEpwvPlBrp9XlExJkp0Isf+zMUNkhtb+xv63mbBzW
	4OFLnF8cDsXsVBYNJfOTGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751369193; x=
	1751455593; bh=XkSvBqQjyo5Nk7yK6lJdYedlIsB+wMqs8eRrgIyn8cg=; b=L
	nrvg433hbogUTvcUe/uDA//W/UNqhtMY8Sae9AZbiA0POxGNSepFaCxZmfX3RAcU
	wLDYtNGSgR+72y39Ja0iSEsgwaCgYMMZx+KVEUit4/fhgl+WSCUqwioR5gA5flZh
	5DXCFbF2y6uK5tUkfsEi9q9kz8mf6rSiA6td5V+rj+8I4pwIS1B2xQsfWhTD0AQE
	DFQCc0fdw5KoQSqy5yNirvCruez70QhjDCcIoNSbcYriJIGQktpA3bujV95AyZbc
	PtmASqME2WeWDGEBzs+g9H1KghLYEIv4SEgzxtRuFDLGkB/WlaGcjz6c+yKTI/Ns
	qmthMxvl9eWes3U3RFhEA==
X-ME-Sender: <xms:6MVjaGqwz6etb77bgPbQKBOASfC7mbYMMcNsh11x1uhihUpCB6gLtQ>
    <xme:6MVjaEp1m-HGmI-v-FbJ4FYHxLBTR7NxICR445RdofgufesMAE6uovxYfZrjw_Gsq
    6accr0lNBqQaekp5D8>
X-ME-Received: <xmr:6MVjaLPEKf4qjDeGmxoJJrIkyp1s-OxL5enVI4rHNDjO1EY0h61TjxqgVQtgkNpWHX9paqLMmgIFzeHNsamz9qLb_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgs
    vgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghsse
    hmrghilhgsohigrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshho
    tgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:6MVjaF7-aJJB2RBuq9z72xdbaPd5r58xIgKo0b6PamuRCp9DC6wSSQ>
    <xmx:6MVjaF6GKOqHwR9pbn32KwfnzcNkS20wIgb3hBQSgrUI0YmqwOPhyw>
    <xmx:6MVjaFhGiP9rGGDhxto9hifqqb-Ir_EoSJcIBXK71AzhVKdwB_eD3w>
    <xmx:6MVjaP6U9tfqfmVPFtspTlFayMezazxB5UnEJ3cUfzcxjYFvRjCTSg>
    <xmx:6cVjaIcJLfYepuvU3xH11BeXfGBCjHebUsElauJoM4R7dCXYk-E_s9XB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jul 2025 07:26:32 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/5] arm64: dts: renesas: r8a779g3-sparrow-hawk-fan-pwm: Add missing install target
Date: Tue,  1 Jul 2025 13:26:08 +0200
Message-ID: <20250701112612.3957799-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701112612.3957799-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250701112612.3957799-1-niklas.soderlund+renesas@ragnatech.se>
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
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
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


