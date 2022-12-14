Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C6A64C727
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Dec 2022 11:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237944AbiLNKcW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Dec 2022 05:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237981AbiLNKcH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Dec 2022 05:32:07 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E7CB720BE8;
        Wed, 14 Dec 2022 02:31:54 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,244,1665414000"; 
   d="scan'208";a="146164652"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Dec 2022 19:31:53 +0900
Received: from localhost.localdomain (unknown [10.226.93.99])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 73023400004C;
        Wed, 14 Dec 2022 19:31:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-iio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v9 3/5] Documentation: ABI: sysfs-bus-counter: add cascade_counts_enable and external_input_phase_clock_select
Date:   Wed, 14 Dec 2022 10:31:34 +0000
Message-Id: <20221214103136.2493474-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214103136.2493474-1-biju.das.jz@bp.renesas.com>
References: <20221214103136.2493474-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This commit adds cascade_counts_enable and external_input_phase_
clock_select items to counter ABI file.
(e.g. for Renesas MTU3 hardware used for phase counting).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v8->v9:
 * Added available blocks for external_input_phase_clock_select_available
 * Removed the "This attribute" from the external_input_phase_clock_select
   description, and capitalize the word "counter" from description.
 * Removed the "This attribute" from the cascade_counts_enable description,
   and capitalize "counts" and "counter"
 * Moved these device-level configuration blocks to top of the file.
v7->v8:
 * Replaced cascade_enable->cascade_counts_enable
 * Updated commit header and description
 * Added external_input_phase_clock_select_available entry for driver-
   specific enum attribute and created a new entry block for it.
 * Add a line stating cascade_counts_enable is a boolean attribute.
 * Added missing 'component_id' suffix.
v6->v7:
 * Replaced long_word_access_ctrl_mode->cascade_enable
 * Updated Kernel version
v5->v6:
 * No change
v5:
 * New patch
---
 Documentation/ABI/testing/sysfs-bus-counter | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
index ff83320b4255..97c1bd7a5df2 100644
--- a/Documentation/ABI/testing/sysfs-bus-counter
+++ b/Documentation/ABI/testing/sysfs-bus-counter
@@ -1,3 +1,33 @@
+What:		/sys/bus/counter/devices/counterX/cascade_counts_enable
+KernelVersion:	6.3
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Indicates the cascading of Counts on Counter X.
+
+		Valid attribute values are boolean.
+
+What:		/sys/bus/counter/devices/counterX/external_input_phase_clock_select
+KernelVersion:	6.3
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Selects the external clock pin for phase counting mode of
+		Counter X.
+
+		MTCLKA-MTCLKB:
+			MTCLKA and MTCLKB pins are selected for the external
+			phase clock.
+
+		MTCLKC-MTCLKD:
+			MTCLKC and MTCLKD pins are selected for the external
+			phase clock.
+
+What:		/sys/bus/counter/devices/counterX/external_input_phase_clock_select_available
+KernelVersion:  6.3
+Contact:        linux-iio@vger.kernel.org
+Description:
+                Discrete set of available values for the respective device
+                configuration are listed in this file.
+
 What:		/sys/bus/counter/devices/counterX/countY/count
 KernelVersion:	5.2
 Contact:	linux-iio@vger.kernel.org
@@ -215,6 +245,8 @@ Contact:	linux-iio@vger.kernel.org
 Description:
 		This attribute indicates the number of overflows of count Y.
 
+What:		/sys/bus/counter/devices/counterX/cascade_counts_enable_component_id
+What:		/sys/bus/counter/devices/counterX/external_input_phase_clock_select_component_id
 What:		/sys/bus/counter/devices/counterX/countY/capture_component_id
 What:		/sys/bus/counter/devices/counterX/countY/ceiling_component_id
 What:		/sys/bus/counter/devices/counterX/countY/floor_component_id
-- 
2.25.1

