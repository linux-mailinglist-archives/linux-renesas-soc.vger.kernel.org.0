Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABAEF640796
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Dec 2022 14:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbiLBNRa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Dec 2022 08:17:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbiLBNR2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2022 08:17:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D8FAD11EB
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Dec 2022 05:17:28 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A338E16B6;
        Fri,  2 Dec 2022 14:17:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669987044;
        bh=ZtkycX0MxCw8BpLMiZsfPY7Z6dley9TNj4JeQxc11P4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Mzjxas9ccMLXzEGjg1xWwJbVF6VzpVOLP8Wpzs4aHHpZeUJ1IYu4FLe306D5WdsA7
         MBHeWWXzSDNvf+mCQFAKXgKJR+hqURD9XLVZANcLHutfKPlJFuYkMsYr+K/KklA+H/
         uiDC7p3VVNIhEKbMHk0OjJCNl6O1Mfuf7jJoGvLQ=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH kms++ 3/4] kms++util: Add endian.h
Date:   Fri,  2 Dec 2022 15:16:57 +0200
Message-Id: <20221202131658.434114-4-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221202131658.434114-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add simple endianness supporting write function, and, for now, only one
shortcut helper, write16le().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 kms++util/inc/kms++util/endian.h | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 kms++util/inc/kms++util/endian.h

diff --git a/kms++util/inc/kms++util/endian.h b/kms++util/inc/kms++util/endian.h
new file mode 100644
index 0000000..ea09065
--- /dev/null
+++ b/kms++util/inc/kms++util/endian.h
@@ -0,0 +1,46 @@
+#pragma once
+
+#include <type_traits>
+#include <byteswap.h>
+#include <stdint.h>
+
+static_assert((__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__) ||
+	      (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__),
+	      "Unable to detect endianness");
+
+enum class endian {
+	little = __ORDER_LITTLE_ENDIAN__,
+	big = __ORDER_BIG_ENDIAN__,
+	native = __BYTE_ORDER__
+};
+
+template<typename T>
+constexpr T byteswap(T value) noexcept
+{
+	static_assert(std::is_integral<T>(), "Type is not integral");
+	static_assert(sizeof(T) == 2 ||
+		      sizeof(T) == 4 ||
+		      sizeof(T) == 8,
+		      "Illegal value size");
+
+	switch (sizeof(T)) {
+		case 2: return bswap_16(value);
+		case 4: return bswap_32(value);
+		case 8: return bswap_64(value);
+	}
+}
+
+template<endian E, typename T>
+static void write_endian(T val, T* dst)
+{
+	if constexpr (E != endian::native)
+		val = byteswap(val);
+
+	*dst = val;
+}
+
+[[maybe_unused]]
+static void write16le(uint16_t val, uint16_t* dst)
+{
+	write_endian<endian::little, uint16_t>(val, dst);
+}
-- 
2.34.1

