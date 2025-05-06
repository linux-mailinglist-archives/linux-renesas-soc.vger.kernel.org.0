Return-Path: <linux-renesas-soc+bounces-16715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE6AAAC3A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 14:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 086827B9588
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 12:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7797927FB08;
	Tue,  6 May 2025 12:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hsa8iTyH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4B827F73E;
	Tue,  6 May 2025 12:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533599; cv=none; b=nQfAApE2Ms9cDELiJPKYxQ7yWL5jQl/khZaFRAi1LQr27gywPAprU0vqjr5OUWzsrdsV32NKvsTl2rZ+RHjLSruExZa46kARzDd601/XBsyP86jdizSCGMtH35rUal+JUnCKfUw3cN1oYtFfvqKzAhCuRjGQ+6rVzywyeAv1oFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533599; c=relaxed/simple;
	bh=AfCMgoNqyUTgEP1lsaSow8+SU7rMPeYlgLsE9iebYoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=plovocoWBHfjS/paJKCJoNeWMhux6uZ2tnoX4KW7XDmttz18kIorrXHKEo4Lhq0qA59p8brO7F1N85+3tTZewLx3jMTmxnZq/3MLquO/hGeSieyBgiearDzCSMOKjUmUTjiyhLrg97rDvc6gYc8UXrdekNuC6B7FyZL0sCsCZpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hsa8iTyH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F9B8E45;
	Tue,  6 May 2025 14:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746533577;
	bh=AfCMgoNqyUTgEP1lsaSow8+SU7rMPeYlgLsE9iebYoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hsa8iTyHCYxpx22lIVRnDLbP6fkAqC13G0NKeb3PP07coaYQotvSCOHC4bnr/SuHW
	 t6dTQ/i/zbO5Mvn5iDo/8cXrtHYdB5eNqot7Jf2UBVWiXg8ZDvVIdm+X4kot6oRnkd
	 3QF5fj7PBrCd9bBIB1Cda50FbSGZRtiH8VhJKFGo=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: [PATCH 3/4] dt-bindings: clock: Add macros for RZ/V2H ISP reset
Date: Tue,  6 May 2025 13:12:51 +0100
Message-Id: <20250506121252.557170-4-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506121252.557170-1-dan.scally@ideasonboard.com>
References: <20250506121252.557170-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Scally <dan.scally+renesas@ideasonboard.com>

Add macros for the RZ/V2H ISP resets so that they can be referred to
descriptively in the drivers.

Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
---
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
index cb2ccd9068db..958a2bd3e679 100644
--- a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
@@ -22,4 +22,10 @@
 #define R9A09G057_ISP0_VIN_ACLK			228
 #define R9A09G057_ISP0_SCLK			229
 
+/* Reset Definitions */
+#define R9A09G057_ISP_0_VIN_ARESETN		209
+#define R9A09G057_ISP_0_REG_ARESETN		210
+#define R9A09G057_ISP_0_ISP_SRESETN		211
+#define R9A09G057_ISP_0_PRESETN			212
+
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__ */
-- 
2.34.1


