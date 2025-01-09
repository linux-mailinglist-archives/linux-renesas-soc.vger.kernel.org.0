Return-Path: <linux-renesas-soc+bounces-11986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A44A0762A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 13:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 871AE167F21
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 12:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCE721859A;
	Thu,  9 Jan 2025 12:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="MjP2z39a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CdQoiOMc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23225215074;
	Thu,  9 Jan 2025 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736427297; cv=none; b=YO3+vuUfijGTkzCQNXhWRh0SY6P3heoo9UP9frlabtcMhcIOLjOwssxP8d+8oD4+a2JtybqYfZNjUzVjJ1ZWGRC2ESEW4fMiZc5NOrAk5WHELy9rn6mUxLMeFWJF308v8b7Y6f34DMuqAlaSzBuAgaf9iemtuwVpsNoydasiqwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736427297; c=relaxed/simple;
	bh=UKuzNOAq2BRVIFbQ/ptyooIkT5PzFtsm0StZofvGJz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eMsEppeVqEsQ+I3c6bv4pTBAWsSiHbPPSFRScn28ja1toh79sLUUL65vnU35cxDzVhg8uEgmM6e9jW2Zuis0ptQ8Qtcxt5KdSq6/STQPFkobOS3LGDef0i+bxdwmXzmAokYAfyME7YE8uAeJWKv/m+J0MAYFVBhdEqnhINR60tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=MjP2z39a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CdQoiOMc; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id D9DF51140126;
	Thu,  9 Jan 2025 07:54:54 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 09 Jan 2025 07:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1736427294; x=1736513694; bh=wS
	ZUeLCqrfniYeuIT4ZZysXNB9aEjuUp58VNinew1GA=; b=MjP2z39anX4TtXT6SE
	5S+0/W8TvAc5XoRDVa4vDf8mTVeme8yBzGRLhh93v8jf5ZAlc2fHW1gJbS4QUwpr
	U4ERpb/O3sfw7zjv8fHyZQuGtGtx2Z7LwryzI+/pBfQgEsNJnrbUlZrF5Q+3/ag0
	pUqnyb5wMHtPWh9++42FbpVvqPYpODG+ENZY0eeoMj/ntgzIvdgCzaXyw/BkBosX
	Fl1Au7NkSFdtAX1Ok75RSfUHKCn09kBLCawBr2WaGuSj8JvILBNbDXk0o8JyOTij
	HQAXghjGB92KaUi0ZCFPFKrYRKH+iKAgFr1EACqWDLD0uBq3Xmorgo8zbuD3O+7x
	LjEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1736427294; x=1736513694; bh=wSZUeLCqrfniYeuIT4ZZysXNB9aE
	juUp58VNinew1GA=; b=CdQoiOMcQapACJeOsQVQDn7OM1JVWDl+IM+8C8+lKH8N
	O/1gx39djYmQJeNu+hhBu23bl2YxIKRakb9AfGRPc+ZsOsEb+chZLG5Z+r8JSdjn
	IBzAypgSJWobZ5Vs03kYd6AqiM7s8vJSgBqQHSyTKxSjBeDFwdhSAOs74U7DMQGh
	3ScMFGhwO13e8jfDV+nBjcuWa0i+FWDwRMuklH42XIKVayvmiAt0CUzR+3bPDNYz
	t49avhqIe74VaF9DZcMbxi8fUNFXE5akeQofM0JWov9D5n2kKzN0vOr8bSmOiI4l
	h7mhnWG6lc8OmdwSgf5Q8VwGRcfZhupzGhvN+xjsAg==
X-ME-Sender: <xms:Hsd_Z_mfkCma1aMV7jA6gr8bho6ITWWC18--wzoUbKrgZCKlG70-pA>
    <xme:Hsd_Zy3vz1H_ofJJuL7-Vw3Fdw2xu_Ea7_ANDLqR_7sYSTjfPYFVnbJu0KhBnLWB7
    aasBwhC4QnWWiFzjik>
X-ME-Received: <xmr:Hsd_Z1qcRyF9nWRDFREZ1aZesDX7pZ2K3H1bWYxJKvaS9_pKk-AYn1d-qezNd5CmCqqR8kTQYhqbaxIMOO0nGFju9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhu
    nhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedufeeuvdejiedv
    kefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthho
    pehjrggtohhpohdrmhhonhguihdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurd
    gtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgv
    nhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:Hsd_Z3na0fWkxWZzuBNASMF_ikhP9sv9kdDbbAKUZ7z-X4PDp7L-6A>
    <xmx:Hsd_Z91_csZh_RBGTerzAM0ln5LdtfUOw0oxj98NM8P5SImu6RZtWQ>
    <xmx:Hsd_Z2ubQ2TZMSiFKmJtFYCKV2SIHTJFRYcN6zb1zg1aLHI-cl9Dwg>
    <xmx:Hsd_ZxXgrPH2HZiJqtHOsZlv1yNSj-LXakVEEKSVBgMn5QLjl36jCg>
    <xmx:Hsd_Z1-SvMq380hmAtjlyiiR261y0sfNaOHDZJaDpe6OhyY5Ipd_tiXh>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jan 2025 07:54:54 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779a0: Describe FCPVX and VSPX
Date: Thu,  9 Jan 2025 13:54:31 +0100
Message-ID: <20250109125433.2402045-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert,

This series series describes the four FCPVX and VSPX devices found on 
V3U. The power-domains reflects that of the ISP they are connected to, 
{FCPVX,VSPX}n is connected to ISPn.

Niklas Söderlund (2):
  arm64: dts: renesas: r8a779a0: Add FCPVX instances
  arm64: dts: renesas: r8a779a0: Add VSPX instances

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 80 +++++++++++++++++++++++
 1 file changed, 80 insertions(+)

-- 
2.47.1


