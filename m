Return-Path: <linux-renesas-soc+bounces-12859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E245A28916
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 12:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E72AD165B61
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 11:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C182080CD;
	Wed,  5 Feb 2025 11:21:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3BE15199C;
	Wed,  5 Feb 2025 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738754519; cv=none; b=eSQAyOjIhJJ0Awpcj6IQCtV1jysznlaSofzu0+epxz9F0EDBDYxQXLH4/hJitph0oFmy8zQ6U7UpMgja5Yl5fZ+iymjCBa4asgKPpvYV6CGaLw37tllwQrdx9qs1m8RrIeSOvNQeTN7GlgOgSY8yqxpEtS4NWXoRq5aeGlKbZxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738754519; c=relaxed/simple;
	bh=wIXFOnpGQSQMo6scGJV9Nt/gbHHfCnczoPF25Q6aO3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=crxlxFXQt2stmqbXT0Z6YoJcYyXrt5gKI9fo/oeH3cmAQH4W/C3aVlgMz6BLtG0pHCC0qnebuwg+mMIGk2ArfIv0yEb9OKl+Gy9dUcF//1DjjEpon6pBos3kgreA7nhWDPlF8lJuCDZ42nlTA/+wMUR2/S9vFP4i1hqolLn7kUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 3XYQi+2eQMGwp+x5gZ3fGg==
X-CSE-MsgGUID: fWnJycvbQqe3KkHeiVxepg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Feb 2025 20:21:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.225])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 34E4841F19B9;
	Wed,  5 Feb 2025 20:21:40 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mark Zhang <markz@nvidia.com>,
	Dave Airlie <airlied@redhat.com>,
	Terje Bergstrom <tbergstrom@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/tegra: rgb: Fix the unbound reference count
Date: Wed,  5 Feb 2025 11:21:35 +0000
Message-ID: <20250205112137.36055-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The of_get_child_by_name() increments the refcount in tegra_dc_rgb_probe,
but the driver does not decrement the refcount during unbind. Fix the
unbound reference count using devm_add_action_or_reset() helper.

Fixes: d8f4a9eda006 ("drm: Add NVIDIA Tegra20 support")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/tegra/rgb.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 1e8ec50b759e..2065157daab3 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -200,6 +200,11 @@ static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
 	.atomic_check = tegra_rgb_encoder_atomic_check,
 };
 
+static void tegra_dc_of_node_put(void *data)
+{
+	of_node_put(data);
+}
+
 int tegra_dc_rgb_probe(struct tegra_dc *dc)
 {
 	struct device_node *np;
@@ -207,7 +212,14 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 	int err;
 
 	np = of_get_child_by_name(dc->dev->of_node, "rgb");
-	if (!np || !of_device_is_available(np))
+	if (!np)
+		return -ENODEV;
+
+	err = devm_add_action_or_reset(dc->dev, tegra_dc_of_node_put, dc->dev);
+	if (err < 0)
+		return err;
+
+	if (!of_device_is_available(np))
 		return -ENODEV;
 
 	rgb = devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
-- 
2.43.0


