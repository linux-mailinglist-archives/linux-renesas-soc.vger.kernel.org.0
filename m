Return-Path: <linux-renesas-soc+bounces-9788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 673A099FBAA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2024 00:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00C3DB21C85
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 22:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E541DB366;
	Tue, 15 Oct 2024 22:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CLcTQAXq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7B51B3948
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Oct 2024 22:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729032504; cv=none; b=o1U7S47Uh3e7Pw6Q57LnETp/uHVFhSdK0JlnNs9AG/1vrPyZLscMKyc9e6SXwgl0K290kw8AGj0qlB6AQvo54gykp+TlJJBphftv+bDoVEvynxbCWIPb6IE/MOnCD+8ZtEeMaqjkAkG6/KC1HxvixuSExX/805GoFVArk/AB0L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729032504; c=relaxed/simple;
	bh=5OWm1ESXfuTgWbEeZNMScug/6ToTuJ9Ns98iHAexnI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lIX7l0A4QEHz93y0H1x7A4avXjrSOIZ1o1aVbAJOBKneFhA+pWeFNCnDaS/x3HzeGNKHEXoQd5fYvYq4KmlC6FPoGi2g4oc+VvasE01hccwX1w/grdTAMRlvlUfUzMLSG7KHNfDxMfHemU1Uujgfl1kWmnv2LiCs/nHP/HgiFgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CLcTQAXq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=+GbmbIChsY4kB0
	0LBWSR3AoclZrf9Upz8iPH0udnEic=; b=CLcTQAXqaWZyi7p4upyKz9cf7GgyT9
	vO8RQdqhNw9/FHuNXl6UXZ9no/myuC/5Ub37Jqb/PvrJPnpI/lhLjfMui3AvoDfV
	uHV0zI8x4HsrpTbeC2HVaXIIapB9pgfLmIQGFwzJnvEX5iVqBSuipfKVGaOS9W0U
	pFdIPhMjvElyNG/U3SGN4BxMZiZcvAnh9XPmEL9Y+BSsRiqhs8vBq0YGXtfM2FT3
	T9a7D35j7B+bqOKjg5INRr2/sKFVL8KNlknae/9ASoK+kOsqWXeqgaVuWus98S37
	3wJO9qSYrKJkqJEysumX5HdU8KMDxRU0sc/qV0zHqg/FR/PZKUPdj0gw==
Received: (qmail 2861113 invoked from network); 16 Oct 2024 00:48:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Oct 2024 00:48:17 +0200
X-UD-Smtp-Session: l3s3148p1@7ynLv4sktrIujnvF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/2] ARM: dts: renesas: r7s72100: add DMA for MMCIF
Date: Wed, 16 Oct 2024 00:48:01 +0200
Message-ID: <20241015224801.2535-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the DMA enablement patches for RZA1 are now in linux-next, the DTS
DMA additions for that SoC can now go upstream as well. Tested with a
Renesas Genmai board. Let me know if you have comments.

Happy hacking...

Wolfram Sang (2):
  ARM: dts: renesas: r7s72100: add DMAC node
  ARM: dts: renesas: r7s72100: add dma entries for MMCIF

 arch/arm/boot/dts/renesas/r7s72100.dtsi | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

-- 
2.45.2


