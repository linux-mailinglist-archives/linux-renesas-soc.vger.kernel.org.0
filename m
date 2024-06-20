Return-Path: <linux-renesas-soc+bounces-6564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41588910A24
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 17:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E78285F21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 15:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A4E1B013A;
	Thu, 20 Jun 2024 15:40:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B703B1B013C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 15:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718898000; cv=none; b=Fl2tWN61o6immwInPrlr3ZCCfnNRo/UCCcFe4s9mU3dxeP/UM7FNhVFQYl1eKutbFh/WkRxI+LXebMABgp2kuLUWIiawqVG+dxYymoogKL4BWIYktBzypoFZ1pYix3mPmPLlNw90dNwQcKRQa+Wzh3iHOjOu1abmtaTIGlDpYJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718898000; c=relaxed/simple;
	bh=Oh/XNnIXMWckXGB3LZdCngk6WfCW3KRvbELGvIZUJGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nn8meI6cJQ4ikfWNvYihu6b2FDZkGKdb303sRDqhLgihGBoTGcQboHmWSdsd4g2dSYXYWokQxKk55BdHVJFJqHxbtKWMczuy2eUL4sTDtQrpVAV517+sk9HUfKNzT/GPkX09QMdjC8AVlDi9F72nijviDUwzxY1rlNF0IjJsN6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:260f:cd5c:91b1:523c])
	by michel.telenet-ops.be with bizsmtp
	id drfo2C00S0Y0hZi06rfouM; Thu, 20 Jun 2024 17:39:49 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sKJt6-0005LV-Oa;
	Thu, 20 Jun 2024 17:39:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sKJt6-000LnU-MK;
	Thu, 20 Jun 2024 17:39:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] mfd: tmio: Remove obsolete .set_clk_div() callback
Date: Thu, 20 Jun 2024 17:39:45 +0200
Message-Id: <e0fa98f138a7b2836128178f8b3a757978517307.1718897545.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718897545.git.geert+renesas@glider.be>
References: <cover.1718897545.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit bef64d2908e825c5 ("mmc: remove tmio_mmc driver") removed the last
user of the .set_clk_div() callback in the tmio_mmc_data structure.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/mfd/tmio.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
index eace8ea6cda05a3d..aca74ac1ff69e6f7 100644
--- a/include/linux/mfd/tmio.h
+++ b/include/linux/mfd/tmio.h
@@ -101,7 +101,6 @@ struct tmio_mmc_data {
 	unsigned int			max_blk_count;
 	unsigned short			max_segs;
 	void (*set_pwr)(struct platform_device *host, int state);
-	void (*set_clk_div)(struct platform_device *host, int state);
 };
 
 /*
-- 
2.34.1


