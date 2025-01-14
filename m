Return-Path: <linux-renesas-soc+bounces-12124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 709AAA1101A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 19:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92653188B2F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 18:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D011FDA92;
	Tue, 14 Jan 2025 18:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="DZGKjBYl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TjjI3tHd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73EA1FA838;
	Tue, 14 Jan 2025 18:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879426; cv=none; b=H/VQA7x6hzYsbhsn4Z6hD+6r8kXSCuqPdU1/BfD2D7kU+1ybGVBHZNhlKwB+Dj4JSbFHHh29h5Sw3YEZClUjq5dCniOOzuKw3Jp3gk3h7ldqYmn58cQbhdZAYgSR3YZXcln1AI9pnAAiXsdj2egxTUjdbIC/B6GpG5AT1Dhuugk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879426; c=relaxed/simple;
	bh=oB0qvuT3ZtGtdR69AAuh6mR5mNiL1s47GDDuOT93PvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T5STmIIuF4lcSjj/DvWUckAlZfLL695ytBMM2EZAknDddLNmKLP0/XNTzzdmvKUMBr/VNL5ygfUEBtszhSXcreqMCoQ+IF5wy2/O1y7V8OVLmxbIpSTchrIXcBqsUUGE4kp+ua34aPRe5BSEvNB5VtIXJEe3Ghd89XrMPifWZq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=DZGKjBYl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TjjI3tHd; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DEB50254018A;
	Tue, 14 Jan 2025 13:30:22 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 14 Jan 2025 13:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1736879422; x=1736965822; bh=K/
	KqfITyG642C48UqKAyBtrTsFLhK6LLcwmBbG8kWdw=; b=DZGKjBYlS+ZUAd0VEd
	mwJ55YGUDRLA8+ENxYT0aY+x+84H9KQ04uBiPuWCTz4ulZ7oKMnK1LUIG+SLa6de
	5ThL0dWdALbDZM7NvCVWJlNemlSNasWjDP2wi10KIefe0pGJY+QWy1AEjGPogwjW
	WiIyFL6RlMJqnFQc85Bgi/yr0IN9uMRuqMh2tH4z9OZ3+Hc1bwOsmkOEr+QfYXgV
	xsVKt2FBvdjP3q7Z+Udeh4CFwrvBafrHqEIQsR4uK28q7MlML6xYdfpfOpaDSr3j
	SSrKmUk+sZPHXjqbQsX7O/umZyjw5YXrNv32bmEP25v96fcZLqRu862pKtCFffQK
	HCUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1736879422; x=1736965822; bh=K/KqfITyG642C48UqKAyBtrTsFLh
	K6LLcwmBbG8kWdw=; b=TjjI3tHdic3YphWFTBDVngLctJreD9fLQXP++RVx6w8Z
	li8e977dj3jfqECdlWYSUSlaxhL+XrPImWGVB+80YByITqgflRBOM2Iqzw8yT8Dp
	v/a+HDtxFM7/U9EglOqgiasWxOSU/9YTHEc02QXvkprk9it03beICVBGNcglgdBk
	MnrXhI9RpRkPYIjTfJzGsA8lX6f5BWOxVSJrvlHkDIcihNQl5Y768wcVT51JkSTJ
	lfTEZqonz2w10nN4ulI3ueQOr/23Hp/uJHnHm/JhCB0ps048H9/3+1P+LUvOYVZD
	Mt8B/szlYOIareiOUwXRIdn1McjGMkDRzHTSHNemxg==
X-ME-Sender: <xms:Pq2GZ0ay78BNWBYQoUl8-9ufbk1r1Gki-DbTnLRzIX9ij0d_-fJVBQ>
    <xme:Pq2GZ_bnt9Rp6CMH96Fp_ijGVViad8No2Z7x_Z7gp4ExbYBEsPBzuOgpFUFIWABn6
    4Jx7wwcP0xxwZX7IKc>
X-ME-Received: <xmr:Pq2GZ-8f3e6ji0dlBMIUhJa1FZMFWd3FTWo3TE5y6l2vpSYAkAqibs4ocoZGbOQP4R4kg8FQwsXzLxon2k2Rp2E2Zw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhl
    uhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrg
    htvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefgffefudefuedvjeei
    vdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhn
    rghtvggthhdrshgvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthht
    oheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnh
    grthgvtghhrdhsvg
X-ME-Proxy: <xmx:Pq2GZ-q-Dla0Oy1DZzf_IRIN-zA_3KEiasu73BUUvov0ZSGBhgfsrQ>
    <xmx:Pq2GZ_pJyQvxKqZU29owtW3E5th7pwdvEVaXToojScLPHdcGCfsSMw>
    <xmx:Pq2GZ8S3iVwje9uJVQMJ8uXlo7jdjZ2CzPDHApgFaMyurbMfoXk15Q>
    <xmx:Pq2GZ_rnCvVBUKeW8TQUoZjzBnfWq-C_mptPvawgVJJU7_jYjaQ5Yw>
    <xmx:Pq2GZwm8j37DCjkMZnf51Tvqt4LKkVY39ezIA7X_N2QaDaX7xCqv9cRi>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 13:30:21 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] clk: renesas: gen4: Add ISP core clocks
Date: Tue, 14 Jan 2025 19:30:02 +0100
Message-ID: <20250114183005.2761213-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

This series adds the ISP core clocks for V3U, V4H and V4M. It have been 
tested on all platform's and known good values read from the ISP on V4H.

Niklas Söderlund (3):
  clk: renesas: r8a779a0: Add ISP core clocks
  clk: renesas: r8a779g0: Add ISP core clocks
  clk: renesas: r8a779h0: Add ISP core clocks

 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 4 ++++
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 3 files changed, 7 insertions(+)

-- 
2.48.0


