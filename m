Return-Path: <linux-renesas-soc+bounces-7536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F3593C920
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 21:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE0F3B223CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 19:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF132E40D;
	Thu, 25 Jul 2024 19:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KYXRMePk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1E83FBB2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jul 2024 19:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721936971; cv=none; b=BLXJwSrGohRiya5p71ENDMi8lYwgkBR2yMQ4H6yZTZdYPZ0OXx27DU8nlG30FSMWIOW/f+K8PRa9jsWmrj3uYILSS7OITdIDm52LgVAV0pfHjuveHrj8JrI4H1tRltRYrFmKxkoRLfCp8VReJxunOD83YiqyacvK2pIRnnozp7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721936971; c=relaxed/simple;
	bh=5y8zmYy8bN0Ppbl/ubeA0HBnlO/gy/ufkcPd2sblBnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HZnfmwNhhzpLflgyjziIXXIxm021teJEtPaAN1wzWuXxwr9F9UyHO3R0pAJ1W/le5AMKt6zlVdnQW1MtQUIblhUat0fkoJ0dtIdrZ3rW0ZEqztQ5bMpYojGXb4H2W1EoP6yfKosiE3KSQfql7kXRPLhpkYrI2LHKGKi2Zh8uBOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KYXRMePk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=UbVniGohyDYLEa
	KWwquh2lWfYt+CfUIXE7GcIc0f3jY=; b=KYXRMePkpN215M9Yg57RfB34zth88K
	uOrbTZKQ6zaQAbwq4G9iayRC7vS6xoVj034JjBfjjIcjiftzxNPJmW80ff7UTqua
	My7I7c7PxSvzgyu5s0s1Kg7xoKWAUSBlUac7R+iBzn5U+2ORVHCSz1waSocft70X
	MFxsR7k8XB0ykwlfufmp3Mpyd5M5YvPMz1okZbvj7V4u/I46Fo0IOdsS3JIeg6xa
	ATac1EYXkLAIPEeuCQEHty6CTiVrWFWapnwrIf78JiA8XNotGqwhmDA25YAj2LSy
	bB25xlW/p8AJ9LraWCXiZ6iFinS3cyssdJ/5aFBz1diXroZFwrBLAXAQ==
Received: (qmail 3088267 invoked from network); 25 Jul 2024 21:49:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jul 2024 21:49:27 +0200
X-UD-Smtp-Session: l3s3148p1@u7g/sRcejIgujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT 0/6] PWM & TPU patches for V4M
Date: Thu, 25 Jul 2024 21:49:07 +0200
Message-ID: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here are the patches I prepared to enable PWM and TPU on the R-Car V4M
SoC. Only patches 1-4 are for upstream, the rest are convenience patches
for testers. They are based on linus-git as of today.

As discussed privately, Geert wants to have a try testing these. I
cannot because testing needs physical access to HW which I don't have.
Thanks, Geert!


Cong Dang (2):
  clk: renesas: r8a779h0: Add PWM clock
  clk: renesas: r8a779h0: Add TPU clock

Khanh Le (1):
  arm64: dts: renesas: r8a779h0: Add PWM device node

Wolfram Sang (3):
  arm64: dts: renesas: r8a779h0: Add TPU device node
  arm64: dts: r8a779h0-gray-hawk-single: Add PWM support
  arm64: dts: r8a779h0-gray-hawk-single: Add TPU support

 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 36 +++++++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 61 +++++++++++++++++++
 drivers/clk/renesas/r8a779h0-cpg-mssr.c       |  2 +
 3 files changed, 99 insertions(+)

-- 
2.43.0


