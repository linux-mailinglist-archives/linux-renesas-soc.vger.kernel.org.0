Return-Path: <linux-renesas-soc+bounces-10668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F63B9D5F27
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 13:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA569B28E03
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 12:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FE42309BF;
	Fri, 22 Nov 2024 12:46:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C6B1DF72F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Nov 2024 12:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279597; cv=none; b=cLUoTI/4m2/ycpLC/1vhZqZ4hvRnTgJz5qR97z63H14TqsHHZg8OYcdG+DD32YrJWmPOyWQIGAkt4xy246XMmRk+4f/EzkUbNuyvjb0KOem1oAwlkfCKxqG5zq89yOng3rctlCmwSsY6j/Z3H9vQcR12OMYzfEnsQgaOJXNQFVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279597; c=relaxed/simple;
	bh=YBZfbi1E1Z1muA6JqChJAJV5YAgilEn2Hm/7ZPFopY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edVyt9Xi3/B9WcZGw1av3nb3umlZVN3PJBpu5MPJfnUPMJ5Vwr+M95OIPWLWDEIq8O4gzBemqzWEvP+4WC3P/aaAT2mQt/oA7Iywmi+MzkbouxbPEUFFibQ3Q1/eItCT7/wjYxePwTyeogvd8meC00TnxJFWvgbY+oajMW+9BLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: +HrNBDh9QlGBYDvOeHqPJQ==
X-CSE-MsgGUID: i7c6AAKNSRapkRdrMiTnHw==
X-IronPort-AV: E=Sophos;i="6.12,175,1728918000"; 
   d="scan'208";a="229765867"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2024 21:46:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AB1BA423A742;
	Fri, 22 Nov 2024 21:46:21 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 05/12] soc: renesas: Add RZ/G3E (R9A09G047) config option
Date: Fri, 22 Nov 2024 12:45:41 +0000
Message-ID: <20241122124558.149827-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a configuration option for the RZ/G3E SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 9f7fe02310b9..6d2e135eed89 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -345,6 +345,11 @@ config ARCH_R9A09G011
 	help
 	  This enables support for the Renesas RZ/V2M SoC.
 
+config ARCH_R9A09G047
+	bool "ARM64 Platform support for RZ/G3E"
+	help
+	  This enables support for the Renesas RZ/G3E SoC variants.
+
 config ARCH_R9A09G057
 	bool "ARM64 Platform support for RZ/V2H(P)"
 	select RENESAS_RZV2H_ICU
-- 
2.43.0


