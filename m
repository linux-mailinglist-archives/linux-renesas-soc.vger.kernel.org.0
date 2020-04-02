Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB1E19C904
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2020 20:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389297AbgDBSqm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Apr 2020 14:46:42 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:55835 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389065AbgDBSqm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Apr 2020 14:46:42 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MOzjW-1jhEyq0shQ-00PNq4 for <linux-renesas-soc@vger.kernel.org>; Thu, 02
 Apr 2020 20:46:40 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id ED7B8650ABA
        for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2020 18:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xZSLPxJ2yIEM for <linux-renesas-soc@vger.kernel.org>;
        Thu,  2 Apr 2020 20:46:39 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 8D55F650429
        for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Apr 2020 20:46:39 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (10.8.5.12) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Apr 2020 20:46:39 +0200
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id A260880500; Thu,  2 Apr 2020 20:34:25 +0200 (CEST)
Date:   Thu, 2 Apr 2020 20:34:25 +0200
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v5 3/9] media: adv748x: reduce amount of code for bitwise
 modifications of device registers
Message-ID: <72873dc73d3b9a1d46673978326dd5f4f0096a17.1585852001.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585852001.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.12]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6C7266
X-Provags-ID: V03:K1:zo3AvXxdUSW4IDOjQHVLMJWq0ZYIk2R4gjmQwiAlOBSD026RS5V
 HT5jF/QcMUIq84XE76+4FM5jgOXM9gFTGiN+MZJ/4H2ltEEmqNHwLV0T+CusSXLHzUBGUOC
 5B7ALELdu3AjFzMCDcXWnbzf1i9X5oBnH3Y5cSeWrDodOu/nbVfSi09O80GlqCD6lI5F2PV
 Tq5DRJ9L9sw186j+TeqXw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:V4ypD2SAwdg=:JUrdKi4jV/lOEabWpR5CXz
 heeJ1ov8/nz/v3yBBAX5rG++eI6Fs0ChfQ6egb6w0XFh1TK46rzBjVLsDL+84ZqRxV/Xp0pPg
 8ZlzcbyS2rqLDjNLR4coWVONmySKu4Y5eNQMOTaUKyZZexBfJrUbuP1JMcHBx75+FqZuX+Mgu
 NvFlu9TXDtSmKESvG4HXwx+PADo33DmZZOqFPWoM2mqTU6cj/8dPUwzQM6wNiHJO3DFuXtG+r
 HY/GGzxJ3uCWEMbmyMM4zS+M02fYLop3DTkKGdCiAzNbt6kLVZR38CT8dnzF7BAJ7j3pFmdXx
 YSSPWBdQh6lmJWdI5b/qWXbMa72tgD1XyM2R2bF+QkAe5karNvIuswWqQjUGp2JOM8Q0t6NGa
 yj89KwsYLqr6tmOsFzOoxaSTgVkrvzaiYIyGaUc/mN2tFZ12UzwUgyGvtUkLvajlOH9QLvzXs
 0prLjakTXp0Mnucu4j8kwOK8VkCwe/ULAysuYYwPgFf6PSS/Ns5P2zYaD4xpcZd6BoWWi21EJ
 0AU5f32/6nn7kg+KQakKOEr3u8p++uUhzk3n/zYoWClzkIzNCMsoXntTPPRmF9/dmdk+YS2vL
 hFTkeBzO9V4c4v+1Xh7th068I20WTUaNNliz5bGx2vkWOyr2W3JzASSnOurzEJzQQ5cg+Zk+y
 O2qY4mr3o3vrMfMKPo7PoVmyGC2XCgqChOgPQITAqh77vBn0/SdbXe1h7xUGRciLIZ+koj5Qp
 VZGopbbCNfaeFO4/c8yDVtbSFnbvK/QmY41fAQZftbk7CT62uMXEQKN8qx5xH3JhvrdnYEceK
 mBCX5Kzy/oIrSW09CGBO+n4iomToTKV729wS+60LfaJ/Cdm5voCf8dDeUGtu8hdkIAfc8ZZ
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The regmap provides a convenient utility for this.
The hdmi_* and dpll_* register modification macros added for symmetry
with the existing operations (io_*, sdp_*).

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--
v3: remove _update name in favor of existing _clrset
---
 drivers/media/i2c/adv748x/adv748x-core.c |  6 ++++++
 drivers/media/i2c/adv748x/adv748x.h      | 14 +++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index 5c59aad319d1..8580e6624276 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -133,6 +133,12 @@ static int adv748x_write_check(struct adv748x_state *state, u8 page, u8 reg,
 	return *error;
 }
 
+int adv748x_update_bits(struct adv748x_state *state, u8 page, u8 reg, u8 mask,
+			u8 value)
+{
+	return regmap_update_bits(state->regmap[page], reg, mask, value);
+}
+
 /* adv748x_write_block(): Write raw data with a maximum of I2C_SMBUS_BLOCK_MAX
  * size to one or more registers.
  *
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index 09aab4138c3f..0a9d78c2870b 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -393,25 +393,33 @@ int adv748x_write(struct adv748x_state *state, u8 page, u8 reg, u8 value);
 int adv748x_write_block(struct adv748x_state *state, int client_page,
 			unsigned int init_reg, const void *val,
 			size_t val_len);
+int adv748x_update_bits(struct adv748x_state *state, u8 page, u8 reg,
+			u8 mask, u8 value);
 
 #define io_read(s, r) adv748x_read(s, ADV748X_PAGE_IO, r)
 #define io_write(s, r, v) adv748x_write(s, ADV748X_PAGE_IO, r, v)
-#define io_clrset(s, r, m, v) io_write(s, r, (io_read(s, r) & ~(m)) | (v))
+#define io_clrset(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_IO, r, m, v)
 
 #define hdmi_read(s, r) adv748x_read(s, ADV748X_PAGE_HDMI, r)
 #define hdmi_read16(s, r, m) (((hdmi_read(s, r) << 8) | hdmi_read(s, (r)+1)) & (m))
 #define hdmi_write(s, r, v) adv748x_write(s, ADV748X_PAGE_HDMI, r, v)
+#define hdmi_clrset(s, r, m, v) \
+	adv748x_update_bits(s, ADV748X_PAGE_HDMI, r, m, v)
+
+#define dpll_read(s, r) adv748x_read(s, ADV748X_PAGE_DPLL, r)
+#define dpll_clrset(s, r, m, v) \
+	adv748x_update_bits(s, ADV748X_PAGE_DPLL, r, m, v)
 
 #define repeater_read(s, r) adv748x_read(s, ADV748X_PAGE_REPEATER, r)
 #define repeater_write(s, r, v) adv748x_write(s, ADV748X_PAGE_REPEATER, r, v)
 
 #define sdp_read(s, r) adv748x_read(s, ADV748X_PAGE_SDP, r)
 #define sdp_write(s, r, v) adv748x_write(s, ADV748X_PAGE_SDP, r, v)
-#define sdp_clrset(s, r, m, v) sdp_write(s, r, (sdp_read(s, r) & ~(m)) | (v))
+#define sdp_clrset(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_SDP, r, m, v)
 
 #define cp_read(s, r) adv748x_read(s, ADV748X_PAGE_CP, r)
 #define cp_write(s, r, v) adv748x_write(s, ADV748X_PAGE_CP, r, v)
-#define cp_clrset(s, r, m, v) cp_write(s, r, (cp_read(s, r) & ~(m)) | (v))
+#define cp_clrset(s, r, m, v) adv748x_update_bits(s, ADV748X_PAGE_CP, r, m, v)
 
 #define tx_read(t, r) adv748x_read(t->state, t->page, r)
 #define tx_write(t, r, v) adv748x_write(t->state, t->page, r, v)
-- 
2.25.1.25.g9ecbe7eb18


