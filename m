Return-Path: <linux-renesas-soc+bounces-1956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E9084151D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 22:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1380228805C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 21:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F9E1586CE;
	Mon, 29 Jan 2024 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AL5pnWAB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C06D157E68
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 21:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706563442; cv=none; b=Jc3rt6aeNOEb+12x3ODsnsRV+1/BwaGV7GM3NfaRKHKc+R/YqxcLkBy3cecHkYVBs4NGQJspIoG81E3EA9a/78+ZzRQPbeuSeZt3vwbZb1pQB9BD8z/vzDyZy1JR39bbdQPzIloMPh2I9XiRz1Sxw6eq7fPkhn6fb/GoTxxoBxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706563442; c=relaxed/simple;
	bh=jEzwxpuz5CFfLQoe5ztUBCNlMmzOCuLcTiU4MUCUKDA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AOsjIts8TkD4txqjly1JMjOlC6D5U7y6EmkKsjqK14PsPScbnryrM3DA79Pr/yyQM0GA9WoplioZWgrN1hC7ueAAHeJmCblW77AphVLdLjJ4QtN3jWAEDKyaabk77yUjbTc9xOMLT/wSZyU45O9qO827g3hrGc7Vjt/H4tvdUYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AL5pnWAB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=dFgwbTq8YVxdVw
	1XogVWieQvUyW92y3L14zUCqt5Q1c=; b=AL5pnWAB+DzYmtOAAqxXEtvcZAAVcI
	4tacNiSJ1nZXmCuVMBhBGXK4EKEGTRLvYtFgxgqDIw4dY41jRQjtQgWUeXi+SVHP
	kMTWj6tD1kRf5APeO+efjKiUkY5ALGOgbEo7TXDRxSni5qkt4qZ7+YVP9jRuM041
	gIsEfYMtBzBkBGvpTMYkhMVHqqhgXkYljVupz7Ojwc+26pyDm/mZvzDsaHeyP+ou
	VSsZpT7KVYYYsaKWNXyp07MA8luRhkaPlmigw0agx2XQ3Mt7gVIcoki3TNa/uGG6
	ReiGIDsXiIROAHCAp0XkmVZi9toUgy5Heis/9/cbeRzSHOx4bmW0KvvA==
Received: (qmail 2612088 invoked from network); 29 Jan 2024 22:23:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jan 2024 22:23:55 +0100
X-UD-Smtp-Session: l3s3148p1@/bxZQxwQNoVehhtJ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] arm64: dts: renesas: ulcb-kf: adapt regulators to schematics
Date: Mon, 29 Jan 2024 22:23:48 +0100
Message-Id: <20240129212350.33370-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed before, here are suggestions to rename some regulators on
the KingFisher board. Patch 2 has an open question, this is why the
series is RFC. Looking forward to comments.

Based on the patch "arm64: dts: renesas: ulcb-kf: add regulators for
PCIe ch1".

Branch can be found here:
git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/upport_kf

Wolfram Sang (2):
  arm64: dts: renesas: ulcb-kf: adapt 1.8V HDMI regulator to schematics
  arm64: dts: renesas: ulcb-kf: adapt sound 5v regulator to schematics

 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 28 ++++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

-- 
2.39.2


