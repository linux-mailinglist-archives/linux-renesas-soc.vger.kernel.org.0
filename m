Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03CBD53D3DE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jun 2022 01:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245481AbiFCXaC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Jun 2022 19:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiFCX36 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Jun 2022 19:29:58 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4528B2981E
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jun 2022 16:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=T/phbt3vcAGisqPAgcf24gGsfCa
        exEjo7z4JytiWMV8=; b=HslkWl/PchTP7NBbxUF5SeRMOobOI0rzA1jH1YjSTke
        5eQQsC0naEMpEalfnwQ+n4KFx4koTfQ4eeTrQt89HYXqsEKdcZpygxUI/UL+xtKc
        FzAaSFx/oTZuC7n11fQtsJbamaoyyV2MF+QeVRGQPKSlxaaaIDiWmqvqNOuq4798
        =
Received: (qmail 1097493 invoked from network); 4 Jun 2022 01:29:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2022 01:29:52 +0200
X-UD-Smtp-Session: l3s3148p1@m59uf5Pg/z5ZzIm6
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] arm64: dts: renesas: rzg2l-smarc: use proper bool operator
Date:   Sat,  4 Jun 2022 01:29:40 +0200
Message-Id: <20220603232940.21736-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When checking for defined macros, we want the boolean AND not the binary
one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Found while looking for examples of '#if' in dts files.

 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index aa170492dd2b..6be25a8a28db 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -29,7 +29,7 @@
 #define SW_RSPI_CAN	1
 #endif
 
-#if (SW_SCIF_CAN & SW_RSPI_CAN)
+#if (SW_SCIF_CAN && SW_RSPI_CAN)
 #error "Can not set 1 to both SW_SCIF_CAN and SW_RSPI_CAN due to HW routing"
 #endif
 
-- 
2.35.1

