Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09035CF248
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2019 07:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729878AbfJHF4W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Oct 2019 01:56:22 -0400
Received: from mgwkm03.jp.fujitsu.com ([202.219.69.170]:10119 "EHLO
        mgwkm03.jp.fujitsu.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729375AbfJHF4W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Oct 2019 01:56:22 -0400
X-Greylist: delayed 673 seconds by postgrey-1.27 at vger.kernel.org; Tue, 08 Oct 2019 01:56:21 EDT
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by mgwkm03.jp.fujitsu.com with smtp
         id 6e60_00f3_a9be7f5c_81ce_4201_a191_3366bad9cd9c;
        Tue, 08 Oct 2019 14:45:05 +0900
Received: from durio.utsfd.cs.fujitsu.co.jp (durio.utsfd.cs.fujitsu.co.jp [10.24.20.112])
        by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id BC019AC00C0
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Oct 2019 14:45:04 +0900 (JST)
Received: by durio.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1008)
        id 998591FF21A; Tue,  8 Oct 2019 14:45:04 +0900 (JST)
From:   Keiya Nobuta <nobuta.keiya@fujitsu.com>
To:     geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org,
        Keiya Nobuta <nobuta.keiya@fujitsu.com>
Subject: [PATCH] pinctrl: sh-pfc: Fix PINMUX_IPSR_PHYS() didn't refer to GPSR
Date:   Tue,  8 Oct 2019 14:45:04 +0900
Message-Id: <20191008054504.29508-1-nobuta.keiya@fujitsu.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch allows PINMUX_IPSR_PHYS() to change the bits in GPSR.
When assigning function to pin, GPSR should be set peripheral function.
For example in using SCL3, GPSR2 bit7 (PWM1_A pin) should be set to
peripheral function. PINMUX_IPSR_PHYS() doesn't need to reference the
IPSR field, but it need to reference the GPSR field.

Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 63d2089..12d15b6 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -423,12 +423,12 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
 /*
  * Describe a pinmux configuration in which a pin is physically multiplexed
  * with other pins.
- *   - ipsr: IPSR field (unused, for documentation purposes only)
+ *   - ipsr: IPSR field
  *   - fn: Function name
  *   - psel: Physical multiplexing selector
  */
 #define PINMUX_IPSR_PHYS(ipsr, fn, psel) \
-	PINMUX_DATA(fn##_MARK, FN_##psel)
+	PINMUX_DATA(fn##_MARK, FN_##psel, FN_##ipsr)
 
 /*
  * Describe a pinmux configuration for a single-function pin with GPIO
-- 
2.7.4

