Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 371A8235351
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Aug 2020 18:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgHAQSw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 Aug 2020 12:18:52 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:58131 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727854AbgHAQSw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Aug 2020 12:18:52 -0400
X-Halon-ID: aedb821b-d412-11ea-933e-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id aedb821b-d412-11ea-933e-005056917a89;
        Sat, 01 Aug 2020 18:18:50 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 3/3] MAINTAINERS: Add ADV7604 bindings documentation
Date:   Sat,  1 Aug 2020 18:18:25 +0200
Message-Id: <20200801161825.96837-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200801161825.96837-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200801161825.96837-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the YAML dt-bindings document for ADV7604.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f0569cf304cacb87..82786ab100f2fff6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1091,6 +1091,7 @@ M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/i2c/adv7604*
+F:	Documentation/devicetree/bindings/media/i2c/adv7604.yaml
 
 ANALOG DEVICES INC ADV7842 DRIVER
 M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
-- 
2.28.0

