Return-Path: <linux-renesas-soc+bounces-25317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB666C915F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 10:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1700F4E694E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 09:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16CA3009FF;
	Fri, 28 Nov 2025 09:11:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEAF2C21DC;
	Fri, 28 Nov 2025 09:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764321097; cv=none; b=cwLTyMnLw1SEO5aBHAn8VSYcQobxMZtcCx5uzTcjap1MSjsGn9nE5dmqNvs+iwK7Ikg/jrbjPwSEFneIxKoA9fC8d1vfkPe4FEmav8zsROYJX6bCFtef/RaGylVASxpZ99zCLNejhl7XO628p3FjMicKWzkgyEbpbc8SaVAS9BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764321097; c=relaxed/simple;
	bh=oKbOKqIJ4OZwgm6FE3nrIr79kGsBu0FdwqWljZvVBwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CimWi9AQZ948+bYIKnGJF9pJx3htJFiR+GM39kb385CcBHRKfLeGOhDUksRCtG7JFOYqPDYbrupjKig9hIBWyKQfhelb3v/YRKcsC6OskNmworzvI4quXOKqtjQRd3fZK/4g7bmwwxGe81wKv9ifwSOqeWl6+eJ4zHhdFA78wGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5EEC4CEF1;
	Fri, 28 Nov 2025 09:11:35 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mfd: core: Improve compile coverage of mfd_match_of_node_to_dev()
Date: Fri, 28 Nov 2025 10:11:27 +0100
Message-ID: <7b9a4a355c5da3fe812ead663285d05b64b84857.1764320964.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As of commit c7fe3bbfd622b5ee ('mfd: core: Use of_property_read_reg() to
parse "reg"'), all code in mfd_match_of_node_to_dev() compiles fine when
CONFIG_OF is disabled.  As the sole caller of this function is
protected by IS_ENABLED(CONFIG_OF), the #ifdef inside the function can
be removed to increase build coverage, without impacting code size.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mfd/mfd-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 7d14a1e7631ee8d5..6925bedddc80bbb7 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -100,7 +100,6 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 				    struct device_node *np,
 				    const struct mfd_cell *cell)
 {
-#if IS_ENABLED(CONFIG_OF)
 	struct mfd_of_node_entry *of_entry;
 	u64 of_node_addr;
 
@@ -133,7 +132,6 @@ static int mfd_match_of_node_to_dev(struct platform_device *pdev,
 
 	of_node_get(np);
 	device_set_node(&pdev->dev, of_fwnode_handle(np));
-#endif
 	return 0;
 }
 
-- 
2.43.0


