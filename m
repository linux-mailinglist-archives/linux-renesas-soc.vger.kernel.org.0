Return-Path: <linux-renesas-soc+bounces-7980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7331095A92E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 02:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A41E283FBE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 00:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E781D12E2;
	Thu, 22 Aug 2024 00:45:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC111D131B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 00:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724287510; cv=none; b=MDvN2IKO35O/ixkkObncMEzih2nDpyGtzPFoH7qxg2HMPaw5MXNNzyLxv2i+hfO8FtMLEpajMy060FKwdslMDsWNT4BfZyMapwtpvnCfdCtY+06WtGoGdco20TktBKdnaPjd6iiXT2LAIdp2xiCKm0jDvIcUcu3fN+XgAwphCRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724287510; c=relaxed/simple;
	bh=3oq5HIHc4D7l0B090BuzynZ8G1qU3cc5jtKJ1WhSEaI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mb1ltSpMKIuN3nRG76Upijpmmfa93Z9ZsVptqAImirY/feOj+5DgUeoKWO+kBjizfMad+dKQnDekDLl4ArqcfbgHmG4ILlfkGKdMkWJh0Xg8iUZ7kca39kQXNkwb5Eqa78QoVypvsdJuk7ArdpgrFZ88kmGqC2I5dZqVJDow9yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.10,165,1719846000"; 
   d="scan'208";a="216223507"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Aug 2024 09:45:01 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0B53D40E09C6;
	Thu, 22 Aug 2024 09:45:01 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 0/2] arm64: dts: renesas: r8a779g0: add PCIe support
Date: Thu, 22 Aug 2024 09:44:52 +0900
Message-Id: <20240822004454.1087582-1-yoshihiro.shimoda.uh@renesas.com>
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
into the mainline, it's time to resubmit this dts[i] patches now.

Changes from v2:
https://lore.kernel.org/all/20240520075931.126476-1-yoshihiro.shimoda.uh@renesas.com/
- Rebase the patch on renesas-drivers-2024-08-20-v6.11-rc4
- Add Reviewed-by tag to the patch [12]/2.

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


