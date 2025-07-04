Return-Path: <linux-renesas-soc+bounces-19203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE50FAF8F79
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 12:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 115873BE210
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 10:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 231CE2ED86C;
	Fri,  4 Jul 2025 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="f2o81nFS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nTN/UJ0o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CF22BEC23;
	Fri,  4 Jul 2025 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623722; cv=none; b=tnk8zrniYT6cZbRCpFmb548ZZQrUrl9m+Fd4gh6kMORzQ0TtuGy5ijrJXwCzL/vsAaqhjCmN9vHYjYAdlSlsZmV+O5125ROVJan1I/4oS/uKiLU8VoT/nt/8lfwBLeKdPDHwYIzQ1CEkI70S/uhLv6JslwQHZASZIucKb1EcZwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623722; c=relaxed/simple;
	bh=4dP/diqUD+RAaYy1UmaHPjg9KbmCmMuFrmhta7zvVnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OjItyU7AtW/16/kQJmZ7dAZTLEecPpUcz6eNA3LFidKDICKQW9k++a4d5PZv/WaEqDmlrEorr7XC1b8Cy2TFtOS1dj9EoFEhPIVgLSEs+lFbBCvYG9j+8m8cnPnYEBK72oYKuOY6Z/REzxEM++4WxemKOqDjxXuz6EEvI5kggAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=f2o81nFS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nTN/UJ0o; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 52EB21D00149;
	Fri,  4 Jul 2025 06:08:39 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 04 Jul 2025 06:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751623719;
	 x=1751710119; bh=3BYHZX+vzmZUzuRnOAWh8DFclshJEM+62uK8EWEL79g=; b=
	f2o81nFS1xyhKrW13jCIJv98gRDUPIaLsVALPz0zTfPM27KLbtB7XRR9iNGseSOv
	xo+10Bcyx10+XarINj1YFyQ/idN25YQDV6h7FNPN76oDj4KOzxB3l+W5U4Q5u83j
	pI+3z6f0VcaHGxRZ3Ky329xiTf080Lv+N3oTEoMUpcKz9rlC1v2ZWkPexcqc7/8M
	EE5HWop55sLDDf1LConJ2hTshU+Z9k46OP6LanXIJlKdK8hMz+lZ5jVAyVKxOJY+
	73ejVYcz0knYAOW5NH/jKb/CNhwhJxUbVT6HVn2GDQS7MrBcUcBmouBEvCFTnZS3
	mFwEDjy8jhqeK29TWduI4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751623719; x=
	1751710119; bh=3BYHZX+vzmZUzuRnOAWh8DFclshJEM+62uK8EWEL79g=; b=n
	TN/UJ0ocPJNtEisM0APvbNwZ6i1PidiiUNdq/C82N0xCEnEBjMk7F63CD1VcDH9E
	PvEhoVPRyj9Rw/DRRm9nkmotDBEMtTA+ZbpmXwDOraCzN0vNY4AL1f6DvctSK9Bz
	CvYJgZFghKp1kMfZ21sevU6zJHMgU6FZbtrUjHRYrJK+FxYfYfI3Q33sUkpvy4ww
	QQb7lW1azqJghARMaRpEYJIZaoqHztZJORaoNPq5jt128lVkm+N2HWVvMX3LJGZL
	VxsUsHIZULKsk/M9qCUV36i66Ovb3IHjHLUZ51EZDcrPliM2N6mZURPkFsbLYBXy
	fuSG3Omse6XkpLwZqbzyw==
X-ME-Sender: <xms:JqhnaMFwES1HBO4UaMUxxv0JCP7NZfYiLsIKTXvcSbC2u6R3lUun_g>
    <xme:JqhnaFWEnHOXGUQZoSL4E3S3zO3sbwHfkY7QNFgcPhPW4lOWFg7PefGkMDVqhoqZD
    g9ApNikUw9g3l_94Gk>
X-ME-Received: <xmr:JqhnaGIORYQaSaG1fPZdsrEVfJDgjwfv3Hno43tSLZGvU8dzvQQn3HmOB2SWYK6kfMX3DsUD3j5XCPJlz_DBBGupKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdr
    sggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrh
    iikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrsh
    esmhgrihhlsghogidrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghr
    thesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnh
    gvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghv
    ihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklh
    grshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:JqhnaOGXjt_pms40ByeyhivDiIDoipzHHOnpSG6bDUgY81njrgtTdA>
    <xmx:JqhnaCWV2qkfcKjxn6SfGvfqBheH7J9UwrzGnLO9abAPTdCm50mvUw>
    <xmx:JqhnaBNbE8mlYv1dvDqrJZFff1TpxAq-CX-h8_Jn_4sbeaUH1COqNg>
    <xmx:JqhnaJ1qMuNY0SPGOKto8hhaaKv2Z6k31G1x_piUKf09kRawnTEsgQ>
    <xmx:J6hnaHU1gdKGb0EH7wxjqhi6mY21FdauiV-VMFIfet5rKHy-2KUTwRth>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jul 2025 06:08:38 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 1/5] arm64: dts: renesas: r8a779g3-sparrow-hawk-fan-pwm: Add missing install target
Date: Fri,  4 Jul 2025 12:07:30 +0200
Message-ID: <20250704100734.3387856-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250704100734.3387856-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250704100734.3387856-1-niklas.soderlund+renesas@ragnatech.se>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


