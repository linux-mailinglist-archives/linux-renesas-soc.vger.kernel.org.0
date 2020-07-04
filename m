Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 853CE214740
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2020 18:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgGDQIg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Jul 2020 12:08:36 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:44911 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727069AbgGDQIg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Jul 2020 12:08:36 -0400
X-Halon-ID: 9b44e85e-be10-11ea-933e-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 9b44e85e-be10-11ea-933e-005056917a89;
        Sat, 04 Jul 2020 18:08:34 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] MAINTAINERS: Add ADV7180 bindings documentation
Date:   Sat,  4 Jul 2020 18:06:44 +0200
Message-Id: <20200704160644.3040636-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200704160644.3040636-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200704160644.3040636-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the YAML dt-bindings document for ADV7180.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 496fd4eafb68cccc..9f1902fb961d8ad3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1073,6 +1073,7 @@ L:	linux-media@vger.kernel.org
 S:	Supported
 W:	http://ez.analog.com/community/linux-device-drivers
 F:	drivers/media/i2c/adv7180.c
+F:	Documentation/devicetree/bindings/media/i2c/adv7180.yaml
 
 ANALOG DEVICES INC ADV748X DRIVER
 M:	Kieran Bingham <kieran.bingham@ideasonboard.com>
-- 
2.27.0

