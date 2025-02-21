Return-Path: <linux-renesas-soc+bounces-13451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CFEA3EEEB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 09:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32F113AA5EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 08:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C102010E2;
	Fri, 21 Feb 2025 08:44:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D72201031
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2025 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740127499; cv=none; b=Q1c6wHXiZt0ZEVf1SpXNscVqyNTiUzXq0ee05/dZS09/GyzAQtQ0Dg8/7ToTjll5+cugheez8k9jSN7TZAQJ69PmNaSNaf6BaTcI3LHJAsTqvDpkhC1wB+c4un1sJsNDgpKNAKpjeXG7g3URXhUnG8QuyZosj2mO3eFndiJ4XVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740127499; c=relaxed/simple;
	bh=6i83hX6VwKD3ElMxhPpSnKnbx/de5TK77AP6kfQbiqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmO81lKy0wuNhcI3Hfwort4sAN7p28DNn3HiawmvlEDCSnT1VLKCxA3we4XULZStI2Cbcb46XVdH2hJlAjbcnNFM3eNyC4JiWAJ4J/aDGvvm3hDuA5tGyNHh+HfRWIG3oyc+Ff2vEiGRilUfSRlSC8TgYhcTmlIGY68XvKGtMfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by albert.telenet-ops.be with cmsmtp
	id G8kp2E0080y8aK5068kpU7; Fri, 21 Feb 2025 09:44:50 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlOe4-0000000BKsd-33gP;
	Fri, 21 Feb 2025 09:44:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlOeP-0000000E5K4-0fTB;
	Fri, 21 Feb 2025 09:44:49 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] clk: renesas: rzg2l: Remove unneeded nullify checks
Date: Fri, 21 Feb 2025 09:44:46 +0100
Message-ID: <64702c33396dde2689b44d3e326aa1727ef1557a.1740126560.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740126560.git.geert+renesas@glider.be>
References: <cover.1740126560.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/G2L family clock drivers never had a need to nullify clocks.
Remove the unneeded checks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rzg2l-cpg.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index a6b87cc66cbba485..b91dfbfb01e31cd8 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1116,11 +1116,6 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 	WARN_DEBUG(id >= priv->num_core_clks);
 	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
 
-	if (!core->name) {
-		/* Skip NULLified clock */
-		return;
-	}
-
 	switch (core->type) {
 	case CLK_TYPE_IN:
 		clk = of_clk_get_by_name(priv->dev->of_node, core->name);
@@ -1355,11 +1350,6 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 	WARN_DEBUG(mod->parent >= priv->num_core_clks + priv->num_mod_clks);
 	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
 
-	if (!mod->name) {
-		/* Skip NULLified clock */
-		return;
-	}
-
 	parent = priv->clks[mod->parent];
 	if (IS_ERR(parent)) {
 		clk = parent;
-- 
2.43.0


