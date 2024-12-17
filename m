Return-Path: <linux-renesas-soc+bounces-11481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 893249F5573
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 19:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3621C173AA8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 17:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E0C1F9405;
	Tue, 17 Dec 2024 17:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K0G36yCh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C531F8EF8;
	Tue, 17 Dec 2024 17:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734458035; cv=none; b=u7CW78JoPb2EZb367Q1ch0DZdZie38D/TW5mc5nRVtx8nOlMPvn5kzKY2rW8iB6dsHx9WzMabUGTkbwkw4p0ynTZka/uSc2nQii6ArBaYRzERAH6SdyuIsOog3LHY1KKI3QZAUd4FIO1OR63M3YYi9CyTmNJzvjM50XHdg2SGxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734458035; c=relaxed/simple;
	bh=rji7fuJ+nfU15UTSB6vLVG140Qi+CGv4QLziZBZ09iE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I24QsT6hytq2XmZYasNjBACIWbPjPu0vr2Qpd7XiZDDBtFjFU2O0CaGwWugchVGnUfEkrm9D/s6I0b6CudCKfTf4hckduAHtL+nTDRBdiQQz/fn7U/RN0iriuszmK1WH0UKaLqGCFEOvV12G6HVL5D6FVGd3wc38jh3RfIfdtbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K0G36yCh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49D063E;
	Tue, 17 Dec 2024 18:53:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734457994;
	bh=rji7fuJ+nfU15UTSB6vLVG140Qi+CGv4QLziZBZ09iE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K0G36yChFTe/59yVz7gEmacwuEjfd3iMHocqCqYmMODU3r3yp/xV2a6HsB9Zejbt3
	 27nBH8NtGIQMAxXg68PbT5BGUD10eVu3tmVUQGGGj20I6IlFHiLG47Ydnm9VaY9dk0
	 r/JQWEeCGuaMUc4tqk6GK6GUXb4/Y2O+X+m8t6Eg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 17 Dec 2024 18:53:14 +0100
Subject: [PATCH 1/4] clk: renesas: r8a779g0: Add FCPVX clocks
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-rcar-v4h-vspx-v1-1-de04ea044ed4@ideasonboard.com>
References: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
In-Reply-To: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=rji7fuJ+nfU15UTSB6vLVG140Qi+CGv4QLziZBZ09iE=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnYbqtKHF/Sc1gvQcdRJxKP56ly07N2z7q+SkOE
 prT5q89DcaJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2G6rQAKCRByNAaPFqFW
 PCD5D/9TMaIQrG3n/8GLxon3ylJGWSKcmFr8A0mR0uxsnH3Rs8wZS09nazMgcFvNoBSdJ9C01UN
 o1+HS7kAXiJYzxAlR9xdQn/oqyns1kiyifpuSu+m6GpyfdpW41nACohDDLqWLo6Jpt+HrrTQ773
 G8Zu9JmgrCPGbneRp4gocfdysy08k9CZQKXdQ6X7qEIZXUlBNsLXELP0ZN+1MC0DEXT3diRGEuU
 wSMHngtM8NMPb2Z5cLGVTZy+8A7xzsOxSnXfTcoxyqS7kCYF46G8ffleRTZ3Ows/KQn0Y8AqMVH
 ItbVGWsy+Jt5Xm0zWj0mYb4p3Uqa9wEpV4B0o/w6IxqvirIEKggFA5lJmxKgDwL50Px/1bCTs5W
 RIh0EGqNqg2TlmCjdQ7lD0rDMCKRdaOPpAOTIg83CT8QDdVgQybfsuODE0MWiD++OIKuQwIPsNe
 cmghKTmeZcO/f+nGqpxB3jA4AZ8hhB5yXBLqG8MREhX/8vKKQtsLQyBQDpXL1B3t4kfu+xfy8GL
 JQrZwFCrjfP3lmQBhTDZ/2/LigqLmxB4juCNnmEc+BV1lQpc8WPhX6V+/arx6LADgB4G3mSbgvD
 7IjV1rwUgrzm/PPOzxfpn6WEj+mLzPUGwUn1IHDtBeYOK/qhVsgaJki9WRpKo+v/ymP/lJb56Zk
 AX7GI555sEBMItQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add the FCPVX modules clock for Renesas R-Car V4H (R8A779G0) SoC.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 55c8dd032fc325c63727f21dc4d38b8e08ce0ca0..dc9ac2839ad9bb6c222db015de72fe8d9e7fe208 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -238,6 +238,8 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("pfc2",		917,	R8A779G0_CLK_CP),
 	DEF_MOD("pfc3",		918,	R8A779G0_CLK_CP),
 	DEF_MOD("tsc",		919,	R8A779G0_CLK_CL16M),
+	DEF_MOD("fcpvx0",	1100,	R8A779G0_CLK_S0D4_VIO),
+	DEF_MOD("fcpvx1",	1101,	R8A779G0_CLK_S0D4_VIO),
 	DEF_MOD("tsn",		2723,	R8A779G0_CLK_S0D4_HSC),
 	DEF_MOD("ssiu",		2926,	R8A779G0_CLK_S0D6_PER),
 	DEF_MOD("ssi",		2927,	R8A779G0_CLK_S0D6_PER),

-- 
2.47.1


