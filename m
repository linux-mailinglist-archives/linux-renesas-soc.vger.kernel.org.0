Return-Path: <linux-renesas-soc+bounces-8701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC92E96C097
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 16:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9835F1F2177F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 14:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1713A1DEFCC;
	Wed,  4 Sep 2024 14:31:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAE31DCB2B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Sep 2024 14:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725460269; cv=none; b=WKCxqiqu7v9+LsXj/P7FKXtQ6mPATRnc1aSGQKGaE9FCe2R/kUPCOeYngFV3/d6C0Ly939cfweEzV3kYUKuqXorQvnQ/6l7IR2LBJdD2inQf9GsdT5JeO9Yb0copfa5ujfTw4R3PljY31HoiEX5UFB1wxsYuVPLK8xpk/ce0oU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725460269; c=relaxed/simple;
	bh=PvIExtq/8JZw+HWVjYfMbNbIIf4VpurgjJG5pvlFfk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PuIzcSc6CGT6IQNcGuDXc1MxcSGWCaMicGUfUnQBZsedO+Mv0MHi3bxmRBJAh8egv/1jKHCzTKwYAnTr95HmPNOnmCb9SVBZS25LV/voZOkCrpdr0DLO3sqCYLmLtGKnATzCmr88ZjMYlGCi2DeivZAJChv1u+LbMige428/UFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ef52:68c5:eac1:f6b5])
	by baptiste.telenet-ops.be with cmsmtp
	id 8EWv2D00A3m5in101EWv7F; Wed, 04 Sep 2024 16:30:58 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1slr24-0028JT-If;
	Wed, 04 Sep 2024 16:30:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1slr27-004MyI-AF;
	Wed, 04 Sep 2024 16:30:55 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] pmdomain: core: Move mode_status_str()
Date: Wed,  4 Sep 2024 16:30:47 +0200
Message-Id: <18ed6fb2bb92860f3af1bc7e5e4a01e9dacf2126.1725459707.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725459707.git.geert+renesas@glider.be>
References: <cover.1725459707.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move mode_status_str() below perf_status_str(), to make declaration
order match calling order of the various *_status_str() helpers.

While at it, add a blank line for consistency among the three helpers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pmdomain/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 912bdc131fc0e2b1..2233daaa4168be14 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3311,21 +3311,22 @@ static void rtpm_status_str(struct seq_file *s, struct device *dev)
 	seq_printf(s, "%-25s  ", p);
 }
 
-static void mode_status_str(struct seq_file *s, struct device *dev)
+static void perf_status_str(struct seq_file *s, struct device *dev)
 {
 	struct generic_pm_domain_data *gpd_data;
 
 	gpd_data = to_gpd_data(dev->power.subsys_data->domain_data);
 
-	seq_printf(s, "%9s", gpd_data->hw_mode ? "HW" : "SW");
+	seq_printf(s, "%-10u  ", gpd_data->performance_state);
 }
 
-static void perf_status_str(struct seq_file *s, struct device *dev)
+static void mode_status_str(struct seq_file *s, struct device *dev)
 {
 	struct generic_pm_domain_data *gpd_data;
 
 	gpd_data = to_gpd_data(dev->power.subsys_data->domain_data);
-	seq_printf(s, "%-10u  ", gpd_data->performance_state);
+
+	seq_printf(s, "%9s", gpd_data->hw_mode ? "HW" : "SW");
 }
 
 static int genpd_summary_one(struct seq_file *s,
-- 
2.34.1


