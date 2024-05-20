Return-Path: <linux-renesas-soc+bounces-5410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C748C999B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2024 09:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13A0E1C20C70
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2024 07:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFB917BB7;
	Mon, 20 May 2024 07:59:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C985F1CA84
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 May 2024 07:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716191981; cv=none; b=DjLb54Bwgyn36bfjntZ56m+ncoQigyCl3TJcZ1wGYfjhCxlyhVsOGCGzKghbkOd/vXbR8z4eMivPxJ9c37L8dSE/KUal/jzCmtIonLJo1OIkz+Cn194PmYdtuAdTNVFilAC5SNYLvoQiKiHYiCSGhouCFzfWvPfCKkqeIoH/l3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716191981; c=relaxed/simple;
	bh=v4O3djcn3KjpWaU0r55hbh/YWOt7VkbNIHSN6s/m0HY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R3eGVseqC7cAO8A7XimyZPM1WSvwG5s+32B5BJaRtJGqzW81HAi/U6duGD4LHHklxAfuxDgOy0ci66+ZYn69e7sk/TK0FUEj/0JH6rh2i2fCT+ERex4GGJLannLRObJhU7a4D9p9c7pPYzra8Y1lhvEcS0IAPS2q7ZkWyv7syY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.08,174,1712588400"; 
   d="scan'208";a="205074371"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 20 May 2024 16:59:38 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 50C1041C2B9D;
	Mon, 20 May 2024 16:59:38 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] arm64: dts: renesas: r8a779g0: add PCIe support
Date: Mon, 20 May 2024 16:59:29 +0900
Message-Id: <20240520075931.126476-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds PCIe support for R-Car V4H (r8a779g0).
Since the dt-bindings of PCIe driver patches for R-Car V4H are merged
into the pci.git / dt-bindings branch [1], it's time to resubmit
this dts[i] patches now.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=dt-bindings

Changes from v1:
https://lore.kernel.org/all/20240229120741.2553702-1-yoshihiro.shimoda.uh@renesas.com/
- Fix interrupt-map properites in the patch 1/2.

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a779g0: Add PCIe Host and Endpoint nodes
  arm64: dts: renesas: white-hawk-cpu-common: Enable PCIe Host ch0

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 134 ++++++++++++++++++
 .../dts/renesas/white-hawk-cpu-common.dtsi    |  18 +++
 2 files changed, 152 insertions(+)

-- 
2.25.1


