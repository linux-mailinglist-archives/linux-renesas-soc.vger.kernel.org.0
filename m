Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B988CF26A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2019 08:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729693AbfJHGG1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Oct 2019 02:06:27 -0400
Received: from mgwkm04.jp.fujitsu.com ([202.219.69.171]:57711 "EHLO
        mgwkm04.jp.fujitsu.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729879AbfJHGG1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Oct 2019 02:06:27 -0400
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by mgwkm04.jp.fujitsu.com with smtp
         id 7a77_89ef_c4cd36b0_f205_43d4_806c_9093f6cfdcaa;
        Tue, 08 Oct 2019 15:06:23 +0900
Received: from durio.utsfd.cs.fujitsu.co.jp (durio.utsfd.cs.fujitsu.co.jp [10.24.20.112])
        by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 76C99AC00D8
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Oct 2019 15:06:23 +0900 (JST)
Received: by durio.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1008)
        id 50BA21FF426; Tue,  8 Oct 2019 15:06:23 +0900 (JST)
From:   Keiya Nobuta <nobuta.keiya@fujitsu.com>
To:     geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org, nobuta.keiya@fujitsu.com
Subject: [PATCH 4/4] pinctrl: sh-pfc: pfc-r8a77965: Fix typo in pinmux macro for SCL3
Date:   Tue,  8 Oct 2019 15:06:19 +0900
Message-Id: <20191008060619.30237-4-nobuta.keiya@fujitsu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191008060619.30237-1-nobuta.keiya@fujitsu.com>
References: <20191008060619.30237-1-nobuta.keiya@fujitsu.com>
X-TM-AS-GCONF: 00
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SCL3 is assigned to GPSR2 bit7 referred by IP1_23_20 macro.

Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 44c9892..8bdf33c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -732,7 +732,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	HRX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
 	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	VI4_DATA7_B,	I2C_SEL_3_0,	SEL_VIN4_1),
 	PINMUX_IPSR_PHYS_MSEL(IP1_23_20,	IERX_B,		I2C_SEL_3_0,	SEL_IEBUS_1),
-	PINMUX_IPSR_PHYS(IP0_23_20,	SCL3,		I2C_SEL_3_1),
+	PINMUX_IPSR_PHYS(IP1_23_20,	SCL3,		I2C_SEL_3_1),
 
 	PINMUX_IPSR_PHYS_MSEL(IP1_27_24,	PWM2_A,		I2C_SEL_3_0,	SEL_PWM2_0),
 	PINMUX_IPSR_PHYS_MSEL(IP1_27_24,	HTX3_D,		I2C_SEL_3_0,	SEL_HSCIF3_3),
-- 
2.7.4

