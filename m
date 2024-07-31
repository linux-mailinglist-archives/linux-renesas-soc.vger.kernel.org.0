Return-Path: <linux-renesas-soc+bounces-7659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5ED942C96
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 12:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 796ED281BC7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 10:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FB61AC458;
	Wed, 31 Jul 2024 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="J53Zc0Hh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RrcDyNfJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF851AC445
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2024 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722423261; cv=none; b=RiAYhldBQR9fK2mavZMubTGO+ANlBeaIdkGBC4E5TAmvZ9acpR4BdxhgmN2b8RdCAeAN64awaz+VvIrZrbGu8wbr7IozdjhK9DKyB5wxOCQhE4HlB33jIuWE/7huzRVSds6VL9zusQ5IKm0JupKglnIDIwBk1eXcHCQKtGU5+UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722423261; c=relaxed/simple;
	bh=gQ7s33PUWF6/tBlFeQMy+xK+9KfqpkYrli9nOWJPqUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g7rg0opbupauI4vyXkBJ9Be6aIH4+QD0ucu4EV0GnQo2+XBxwZH+/r/ekK9bcSnlfPe5zsbStcEiyHIwa0+ejWlTufX0/TUpruf9On4jZcHIpCRvkB5MadiBm0Pa1ilPkMTmR3U2by4sd8Y5NPSTMkO7ff7P0/SnrY5WcePNG8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=J53Zc0Hh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RrcDyNfJ; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 174911382092;
	Wed, 31 Jul 2024 06:54:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 31 Jul 2024 06:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1722423256; x=1722509656; bh=hA
	V9LN/M7k+SW6pqTvn3Z5K+EmbTbv9rz/Eqw9ZTcoY=; b=J53Zc0HhXhH3DH9IYi
	owJDhEyR63DCAhYqePqSpmILMxRP94Woo3eTo6L/wIo65BPqmM0LHyDv4pgNNU5i
	tDQ3lGYn2+whAtkyVlLKE1rQsGVfCeEk4IhqfTNHPOUyeXIACqcZc4e1ySCW4Jq9
	ohZKjIraRrWoNQ4FZTjWnUrqgIVrQzdC9Ziev8wEXQwfb/IegJfkmsYbEQIz1p3w
	le+c0GrkgPEAQ30Li5lFxmSfU+qt0b9Ok82ULvJyfAoVv3Hbggp4G48AjN78AV1h
	4TzFUaMXTO9LOgdn3NbX6BTnaWkp9TUzgtB/YzqgIyVEWlYJYzuaawbxm4mj6T0+
	NR+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1722423256; x=1722509656; bh=hAV9LN/M7k+SW
	6pqTvn3Z5K+EmbTbv9rz/Eqw9ZTcoY=; b=RrcDyNfJiaGDWTaOkGtSWyy0tbaqJ
	aqDvYG9EkkIcQXtODpMhCekAIt0SWuyIETo/lUH8O86Y2ZXOYjfTS9bY6W1aS1cb
	WdQXiy7p5Gf92ygmblbQV0Xk+SpDGjvNltp4444TY+Jtc4HKQeaJ8EFswjpItlsK
	B7B9WFzAYCGtOJh7Tgg6AvPjM7ijV2tXJkNRvVNvp1jYuKWWVNVHSsK8yfH2SUBk
	YQsxi/dMTgGQSfcM3KrfOdO7ADfBekoJVUDQLd6DwzSzHR2E72e3fQVoWKqtRIwG
	7Hm5a4qfEzhrIpMkTB+bLrwKl/yAGcBJiGqzR56nJh4AJe2Nu0+2yeukA==
X-ME-Sender: <xms:1xeqZkV1Sw2kwSWZAU7-tgsW3iLi3ntktmjumqhsrio17yp_Pnh4Og>
    <xme:1xeqZokID67ims4ZpUpviNb_zdbVhIxaw5RAUuoczqMhgAsFigSIlh6XmRofb2UbW
    q9sZoZ03VpL_GqfS48>
X-ME-Received: <xmr:1xeqZoYQvkE1SxYAYOfOStpUH5XPU7J8Y2YjG8nMjcOM4RA2r0FyF4c74umej4FRC-1sI7ex_LuEiOhiwmUaxs5irA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjeeigdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgfff
    fedufeeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:1xeqZjXZMHXW7ZvanluvhKkjftUVpgkgx6t5rmeW7jb0dU8xd-6EqA>
    <xmx:1xeqZundETgf2kIQpYGS0hXCm0d2stFJoomAIr1GslXCLcJGPxde0g>
    <xmx:1xeqZodurQ6zrh7XXOMNuSWfqtridEtLb1CWITIO8Uxcr6TgTnalgQ>
    <xmx:1xeqZgHrNnoKWhFG-t6XSpKbl_VroMsmo_itV917As2GneEoKBBSUQ>
    <xmx:2BeqZsa1xKXxN_WtNf8fvkShLZxug-nUEZwJSTEDm-vaX01WgrVBCvU9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Jul 2024 06:54:15 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: defconfig: Enable R-Car Ethernet-TSN support
Date: Wed, 31 Jul 2024 12:53:21 +0200
Message-ID: <20240731105321.3196788-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable support for R-Car Ethernet-TSN, as found on the White-Hawk
development board.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2d385f7dabf5..9a345ebddb0a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -366,6 +366,7 @@ CONFIG_R8169=m
 CONFIG_SH_ETH=y
 CONFIG_RAVB=y
 CONFIG_RENESAS_ETHER_SWITCH=y
+CONFIG_RTSN=y
 CONFIG_SMC91X=y
 CONFIG_SMSC911X=y
 CONFIG_SNI_AVE=y
-- 
2.45.2


