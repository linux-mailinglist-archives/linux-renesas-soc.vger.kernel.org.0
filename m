Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2E06CF27D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2019 08:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729987AbfJHGMu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Oct 2019 02:12:50 -0400
Received: from mgwym01.jp.fujitsu.com ([211.128.242.40]:39836 "EHLO
        mgwym01.jp.fujitsu.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729981AbfJHGMu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Oct 2019 02:12:50 -0400
X-Greylist: delayed 664 seconds by postgrey-1.27 at vger.kernel.org; Tue, 08 Oct 2019 02:12:49 EDT
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by mgwym01.jp.fujitsu.com with smtp
         id 2e24_21cc_57c59d0c_0b10_4216_b41d_5f6082831cc1;
        Tue, 08 Oct 2019 15:01:36 +0900
Received: from durio.utsfd.cs.fujitsu.co.jp (durio.utsfd.cs.fujitsu.co.jp [10.24.20.112])
        by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0ED27AC01B0
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Oct 2019 15:01:23 +0900 (JST)
Received: by durio.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1008)
        id D1DCF1FF21A; Tue,  8 Oct 2019 15:01:22 +0900 (JST)
From:   Keiya Nobuta <nobuta.keiya@fujitsu.com>
To:     geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org, nobuta.keiya@fujitsu.com
Subject: [PATCH] pinctrl: sh-pfc: Fix PINMUX_IPSR_PHYS() to set to GPSR
Date:   Tue,  8 Oct 2019 15:01:12 +0900
Message-Id: <20191008060112.29819-1-nobuta.keiya@fujitsu.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch allows PINMUX_IPSR_PHYS() to set bits to GPSR.
When assigning function to pin, GPSR should be set peripheral function.
For example in using SCL3, GPSR2 bit7 (PWM1_A pin) should be set to
peripheral function.

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

