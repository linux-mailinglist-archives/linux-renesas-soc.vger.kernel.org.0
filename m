Return-Path: <linux-renesas-soc+bounces-12204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B19A13DBA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 16:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E04CA164198
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 15:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573B81DDC12;
	Thu, 16 Jan 2025 15:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ItnRXkQ6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Wgp+Zr19"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FC724A7F6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737041654; cv=none; b=K9ehrZXlZFbndw1UJmeTTrOBjt3KEgti9M8PybMJ5F+vUrGn66EhLOGdAcacO3PTMJLLHtYvF6n+/gzNTJZ4p4/fUfOq3lAOC+9lqli1upI3H5peOD97NfMKGZanMFyBXYDsNy64GmHHFJla6Ks4oJYraHRfWr4jvIEZ2WctfxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737041654; c=relaxed/simple;
	bh=uKPDHAxMZSEyB2u6AMlA2zpbcyEWslgNKgPStJBvL8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pl5Q6NIhflOAExxGoNzyvLMmTLdo4SOwDiG/OfnOF/+Ffse20p6vv7KxnbVEbGKjVN4cBk9wPTKK7WRAIiZzhsTYJ9lCIrwcHTp0c6pxBDKygEm06k+v6+3oumeGJqa/5A/MTEPTng6CrlJOP0uePNwN/C3UDJp0itFskdr1H9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ItnRXkQ6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Wgp+Zr19; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6175E11400C6;
	Thu, 16 Jan 2025 10:33:04 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 16 Jan 2025 10:33:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1737041584; x=1737127984; bh=4s
	LZtsQqiXOx6MVDhhpvktftzSq2Eg0fdZh/iken748=; b=ItnRXkQ6fhD1p/N+wi
	kwlSf5OB9blDL/dwtXsECwasixa+LQGmOvQlYqv1Sv17P5nzKYCsYEwSMxnG15fW
	GekFwPQ/C9mi3GHjPU6VkCQTzhTphFeYDZM5l9ZPdffcqdmMWPaakoUvQyHidv1/
	3jflXvuboKK9T1T65Fdq5fnmh2K5JPv41AqZ7ugD7EQ2xECk9TUdGxSOEXaspLWM
	S62xgGPeuDD3+5uWGRNutYzoiRG6I2MlsUdSZpnwszAYxT7K+IlUFo6eb1u8pUUs
	5n4ulvk5wKk/VlQfomvLrnyrgaUqJROwCrOyt91BKiD98lSIeTc6cNH2B6B3BgJc
	MtXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1737041584; x=1737127984; bh=4sLZtsQqiXOx6MVDhhpvktftzSq2
	Eg0fdZh/iken748=; b=Wgp+Zr19SyZfYxQAl3SU5e1lLFKH/94nLnMje0cornqU
	ZzYyea7SyTFK2d7Yf98lYe+jsatrKi6l/lF+ph3+Wqv6knBDMopqLmQh+63+byIw
	q4GGMukW7oHYEYZ4+p1tudaHPz+WLkR/mKw8RgV1ie9e99EDFHIpZsqrgKtpwmhZ
	TKE2kUQ0gPhI/0ejJ7C2H0ANHw+DMqzkWFoHzI2B4zKPgKwSHsNWv15r+vkZiLOO
	YdarQpQXB87Kqa5fZSHpsNK7vaY1ZYFw4oE0QKL4N+rQqGGzkUVwjaiqU8xurcva
	gsJX7sgJRgOvS+fRQkY99MmB9kNCSpu9DfY72DTIYQ==
X-ME-Sender: <xms:ryaJZwMKV2ppAtSaIqZdm8OigQQF-xzWOlY-eIhexUz3XD9l5n5akw>
    <xme:ryaJZ28RyJaqv_Z32KYaLQdJXEP-3dV66DQMOtJIMuIPZ_sYMSTJFCMs8gnGmOeGj
    N7SMW9gzW_h3LOTu7E>
X-ME-Received: <xmr:ryaJZ3R-jT5bsU9I-faEx9HpWvuNpBuyXMt8byiNruJ1ENDnIxOL8KRKkdOoD1OsPk-GsTqizCX_HLTvweC82kPfdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiuddgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhu
    nhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedufeeuvdejiedv
    kefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthho
    pehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheplhhinhhugi
    dqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshes
    rhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:ryaJZ4t7rjGEIgypr_8ep-sY2T5FoxVFZlcpGszF_TohH0W3oKw8ww>
    <xmx:ryaJZ4dAsZTGtkG_pBPOZheZgRsL0lTbhULfRUgs2WC8uJRdb_fjKw>
    <xmx:ryaJZ81fzJ5wJiansACb83OH9Vg6g-wm_U1JNvcW7-Jg8EmChreIIA>
    <xmx:ryaJZ8-JsMQ1RWzTjmVtj8U02ifaokMywhr_f4FFT3SSjtFGA0ppuQ>
    <xmx:sCaJZ9EGxq6283vsz2s4QmBDF9iO7ZIoffYY8NAfInuwnJZxoFgeD3eN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jan 2025 10:33:03 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] ARM: shmobile: defconfig: Supplement DTB with ATAG information
Date: Thu, 16 Jan 2025 16:32:04 +0100
Message-ID: <20250116153204.615736-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable CONFIG_ARM_ATAG_DTB_COMPAT to allow u-boot to override kernel
command line from DTB using the bootargs argument. This is needed at
lest on H1 Marzen to control the command line from u-boot.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index a8afbd338de7..0030225dbc34 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -15,6 +15,7 @@ CONFIG_SCHED_MC=y
 CONFIG_NR_CPUS=8
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=y
-- 
2.48.0


