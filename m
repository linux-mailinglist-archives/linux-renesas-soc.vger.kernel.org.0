Return-Path: <linux-renesas-soc+bounces-12178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A7BA12A5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 19:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D374A1888B47
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 18:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3DA19645C;
	Wed, 15 Jan 2025 17:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="f5f8euyf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FZ9yMhTe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AC95223;
	Wed, 15 Jan 2025 17:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736963992; cv=none; b=GO0t/sxfXVI4DEJ67yLOWHKrNtdPKde03WHuyv2AQngF3y3PPq5eIqvZk5FZpblhxfYFlUYGP/Eoi7gO7flhOn78KBe+t9xSOOmGqIYm/F1RW2pOSwMiXb/LCvcXWV+SaudPva2cRmhNpzBZKAMLFEMKIlpQViE1pzdBIebMAf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736963992; c=relaxed/simple;
	bh=yFwdK81YpWUZoTAPZ2kDj5aDydi9tuaKWPc8i1UKCUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=swd4Aooi1Nq1M0Cl62KqVKEKhRQ6ooHa9C/4RBSoe24l4G43I6ngDe6kqyqzvHHAh35aIsB0jLw3reqzbqY0BaHmmxElXPnqTxpb3rdXyyAMEXv99acmTFFtEFbVxq67yoYNs/COYnASJWjyCh7v5bm0CmBfPU7267QICOtKoJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=f5f8euyf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FZ9yMhTe; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 890B4114013B;
	Wed, 15 Jan 2025 12:59:48 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jan 2025 12:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1736963988; x=1737050388; bh=sK
	fB0qfUNEiI1899xVQnNgfLI4E88AF+xyrlWbdN4kE=; b=f5f8euyfyxLXf0yaOH
	KRBKGEO/I6MzqhHy8quGLUhr+TIUJLrw4xfwMJTE/zKCrlh1H41YbLFnH1T3pjWW
	5+SDEE8mwxH1TAjpQGAo5cckcj3Rmj1uUhOy4EFG8R5/dyJ7oukddRMhSe981s++
	SCKFYYnKHErFvNioMzE4YmFDag6CQGHt5uXH9etJkivmx7iVCnSfqIOjsqQUTvi6
	Nc2/4og1RHOmXAjm49rFWjeviTFuo1Qm9d0cmoindlXMiLl7DPO7etMvCWFO0RX/
	dRhSNZhNj1wR184IogzEqNwfALU1sW/Bh/+ROC6IbPDRo0AF81NNw9KX8rRmIjSM
	7nfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1736963988; x=1737050388; bh=sKfB0qfUNEiI1899xVQnNgfLI4E8
	8AF+xyrlWbdN4kE=; b=FZ9yMhTexQOWJjix+PsTUafOZrLU9F70ZpzT5mHw5P4V
	JALcCrI06TyPrt8hBM5cALjUPtJCOAJv/KzhH/GGpwBR5MegOkvat3fC8R7eGYPm
	8n3t+bphunwF3ifyUHYoqbTbnEPtc9uWkfP2OImkIDZLcC0GbvbgvgEhS1xuy14M
	RaJrj/lT0Db/EHk1Oy56foay1Vdduc5H7C5HQBvHoUWedkSi6cbLYtNEAM6MgIJV
	xg+hDB+eqqWNUKqWGbW+9CbasJtiFW84khawxr74WcvFa5uavW+QvwYO+nELEIoH
	nxYATJEW431ZmVd0vL0PqUhkJTUz1M55ieyOq4o6Vg==
X-ME-Sender: <xms:k_eHZxTtdHX9ZVFgidJI_AYrcHb7uGwyxzXmGKAP1-DPcEzgwx-2ZA>
    <xme:k_eHZ6wFLz53M6T2gLBfD0aHMSQgFDsu7imLoyByY-JBSV7Eu2RxgBFAJOPg2aLhp
    7OVrxsNt_89BOVzjLQ>
X-ME-Received: <xmr:k_eHZ21KDhNiwqEDg5Oynt-NJhYfbWuCFA9pyqBzRK3Nddv8VL78LfyHcmyGi8VtK9OjMN71xwnSWu1IoFzJUPi3wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehledgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhu
    nhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedufeeuvdejiedv
    kefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthho
    pehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqtghlkhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrg
    htvggthhdrshgv
X-ME-Proxy: <xmx:k_eHZ5AKU1vBZTjvbC2GyIQnlWfvG0OnvrUHndgAmAzWsuzOBo5pBQ>
    <xmx:k_eHZ6ij3FZqLq-f6szUfV0u8rjNaRLYF6316WE5tpQzUwazW4B0xg>
    <xmx:k_eHZ9o6wUY_Ht7B1-Lz820qSXpxQ8rNWaPoLRXuh-6o_UmofE8-HA>
    <xmx:k_eHZ1h8u3qwWCVR5CokFp6QeV-PnyAE2KWoBdu3MdNFNalZUVfWtQ>
    <xmx:lPeHZyc-Dzpp-ZQVTYfgrXRugSjBP7keDkhZsVpDVZekgcoAT6YVn-wf>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 12:59:47 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] clk: renesas: r8a779h0: Add FCPVX and VSPX clocks
Date: Wed, 15 Jan 2025 18:59:25 +0100
Message-ID: <20250115175927.3714357-1-niklas.soderlund+renesas@ragnatech.se>
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

This series adds the missing FCPVX and VSPX clocks. Hopefully this will 
be the last clock series needed to enable these clocks on all Gen4 SoCs.

Niklas Söderlund (2):
  clk: renesas: r8a779h0: Add FCPVX clock
  clk: renesas: r8a779h0: Add VSPX clock

 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.48.0


