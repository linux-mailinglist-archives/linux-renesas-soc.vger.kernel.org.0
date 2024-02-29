Return-Path: <linux-renesas-soc+bounces-3344-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A4786C8D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Feb 2024 13:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E10E283182
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Feb 2024 12:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED2C7CF15;
	Thu, 29 Feb 2024 12:07:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9017CF04
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Feb 2024 12:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709208465; cv=none; b=dCQxdhwTm4+IEbVMi4wmOHEQCRQkkDmko3h8Z7aXlkh3C/fYetBxfMS/+JQYjQZEfmz+8g3N9nMACkgzYYhqy9JDkSSD2PK1z9gJ5bsaVZgD7KypZzwNitnFsTKeHAnX8XUh6Qty5JlLEcXaPGanaL8dizs0ohHu+LWlnNGKIYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709208465; c=relaxed/simple;
	bh=Ef9sIozFxO9vCajBNbwhqCmt/E+ENKRPbCHqacYUD9g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TAKZsO2aXFZcgr+B7nIgHFiO4Xb/71zP0pe4sNMdEgEukr3oUXYfTA8AgN7hx7HFKahOzcaTQDr5+REsOTEbKDbB6ndiZocEDU3W7o9YqtP/+zJP47p0+a2cYpgj4XF0pyj9UlnCgKO1NfOdYPxIFrcNLr9ngncpqCedeX37PmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.06,194,1705330800"; 
   d="scan'208";a="195830423"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 Feb 2024 21:07:42 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8A5AC424B03F;
	Thu, 29 Feb 2024 21:07:42 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779g0: add PCIe support
Date: Thu, 29 Feb 2024 21:07:39 +0900
Message-Id: <20240229120741.2553702-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds PCIe support for R-Car V4H (r8a779g0).

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a779g0: Add PCIe Host and Endpoint nodes
  arm64: dts: renesas: white-hawk-cpu-common: Enable PCIe Host ch0

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 134 ++++++++++++++++++
 .../dts/renesas/white-hawk-cpu-common.dtsi    |  18 +++
 2 files changed, 152 insertions(+)

-- 
2.25.1


