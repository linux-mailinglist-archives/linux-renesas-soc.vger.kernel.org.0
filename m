Return-Path: <linux-renesas-soc+bounces-24282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3F0C3D75C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 22:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D1D6F4E053C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 21:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554BB30596F;
	Thu,  6 Nov 2025 21:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="T7pFFc5R";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D4lLPjs5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2860D145FE0;
	Thu,  6 Nov 2025 21:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762463795; cv=none; b=PJo/pKi8MhBsQvA29KHqIhrY4RhfE+EQkM2y/0g6tilVPwe7G/d3z+iTQ2EgdFdEqRHSmGbli+OSY1FQm0EU63cUjqPb5J0ac5fA2Hm6DIdIMGtK70Pb/PekqKYTH3d70xaYoqwdoWBgqIpMbhrzbdm0f6xDfNjlZTYewD5EYuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762463795; c=relaxed/simple;
	bh=s10X8RRYY1qcyl0uwF8gY4W/0k8Vm/XGcCV/YoVxiDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H2l0YCdZqnalHV1lpxwR7uv+HM9wH4Hff9O+Cc/ZUYuNgKV8bvVtHdVw0arIXzCFo+qTzL37dAFoIbWP/HUrGZEP1S3R+R7nXdpUzMoA3DqnSN4d7+1dcb58AUsAHD2/DPT8ZhHGQBlNMS+E3+sIsbFVUpOCpA1V3oeOLm3p6aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=T7pFFc5R; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D4lLPjs5; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3A8E31400157;
	Thu,  6 Nov 2025 16:16:32 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 06 Nov 2025 16:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762463792;
	 x=1762550192; bh=6ufc5ay1et0D8jgHXDmf65MqnKbmPHZDwmxZs04kQhk=; b=
	T7pFFc5RTjZufIfaXJlaKYY7nbqcBIf07+yXhFi4n2yFYkVS/giNh2xZi/Tthvk2
	mz2ZaUw1Uek8NGeYiGo/zcCecxJg5FIX7+JjTmgs4OdgCcu/xuwp3i2j3r0n8eA0
	jg7Ud7Y+Z0Sh0iMyzfZQLTInL9f+V0GWxHywovMNc2N07KWkTMnjQqiT6Y+ZHOqw
	1AfKi/r2cuSZZ3w9kQVN5nuySE4LMrMfrwvnHCenJLk5BMtqo8HEwAMLStoKz+6p
	w9bgDjimUkGpJkPg64R1U2NjQv3WnjYSuFsG1amno67+yUmuc2ER8i41jI4ZWLik
	7FUw8pKQoN+Vbt7fN0VJQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762463792; x=
	1762550192; bh=6ufc5ay1et0D8jgHXDmf65MqnKbmPHZDwmxZs04kQhk=; b=D
	4lLPjs5n2ajUkYiNrX+OAelSxyq5rXXlDVRT8lN26tiNbXgb2ir/11aTCQgqmhyi
	VWMDulZj6imlaL356BelhOKij/eLi+ItwuEKj7KBWsf1Rs0okUvljP9Gl7Jlp8qB
	5fFinjmcS1z2Py3gSEdlbDbvWKWL1/JLBwBpVSOFBds2uboniuRHly9n/KVXzWuH
	nzKtJar8TPGVQ4pLFGBEmGknp9X8/u1U1xx5CEDpYhCy2ZIs2BPuA8AeG0ze2vYx
	8xz8GG7Wig0/HJatCw7JbDxtwg4eo3uWaqViLw0hZZ+BoTkRdZfWufRqI1YpuCQ9
	Q6R8BBchRvF2PEOCRQawA==
X-ME-Sender: <xms:LxANaSMjrdwkSvH67-jXKkYStf-uoLa1aTx1lX2w86u7iXdq9f55Bg>
    <xme:LxANaW_fjxrXUbOlxmP_BhywI2Sajr3asuPwLoA5gj3nLqMRjyVL1RPCbIyzrnv3k
    6-YD2UKHIZdO26wQmPt80K0mHyPTjQ5uah3_KHJxBmECEZQbqOMQRU>
X-ME-Received: <xmr:LxANaUFFFGIL5kOr4Ve2qlKuQ_H0SuVxReb6VYDS6FvVvzVdVFa20dyRkup7AtY8OpaVKCizwbm4f_Q8vP-xsXLX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeejkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedutddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghr
    rdgsvgdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpd
    hrtghpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghh
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:LxANaVjzN_ElHbUCcmwSqMCGtPX6-RQ5DI4kybsUlLL9VAiR-VfMtw>
    <xmx:LxANaZtuDihPo8wxU1MSuTz_KjGjM6gVpceBgoA7Fx3AL5LwXS6ekQ>
    <xmx:LxANaQvg4Mg9EiWgKL3tTG85HinhxgK35ap5pWV5nXsChBxXpXH7WA>
    <xmx:LxANaWGKe5zw_NxnCMao-uhAM0lLwve9Z5KVBzFscssO7TZsErI9JQ>
    <xmx:MBANaaLwr5sLWCmwBnGCMPHQDDqD2QfOwrg8ikU8Z5nK1U6wcak_7kAG>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 16:16:31 -0500 (EST)
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
Subject: [PATCH v2 1/4] dt-bindings: clock: r8a779a0: Add ZG core clock
Date: Thu,  6 Nov 2025 22:16:01 +0100
Message-ID: <20251106211604.2766465-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the core clock used by the GPU on the Renesas R-Car V3U
(R8A779A0) SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
index f1d737ca7ca1..124a6b8856df 100644
--- a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
@@ -51,5 +51,6 @@
 #define R8A779A0_CLK_CBFUSA		40
 #define R8A779A0_CLK_R			41
 #define R8A779A0_CLK_OSC		42
+#define R8A779A0_CLK_ZG			43
 
 #endif /* __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__ */
-- 
2.51.1


