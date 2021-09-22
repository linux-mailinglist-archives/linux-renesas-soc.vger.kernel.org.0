Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E9F415023
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 20:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237138AbhIVSuW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 14:50:22 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:58164 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237137AbhIVSuW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 14:50:22 -0400
IronPort-SDR: x6G3qOwPbGWsk+WU9VQ78L2wjXgirFmM2pxg8zebltvv3XM6A/iCfeysZrAoNHgMhcdlAmm6By
 lC1PJo1T3C9IQvWpg8ixPICt2Dc+XztOXPIzw2LIiDY82EL8mFMOyCUOjo07+qa6ZT0pipDdqr
 2aET95yfEqwhA1wXvXRH9DKlbiyqMypY/4dDVJqA7Q8dg+QraCjfWYZTY0ferI/oZnzI7vB6rh
 5AYsGtYwJMOlrSzdXoUKSuVcyud283nl9RIxOdlKhQ1T2jqvjdPy0MB7Cl6gLK7IPs2MOAkty7
 bp2zMPnG5hMGZm8ok7i0CeAG
X-IronPort-AV: E=Sophos;i="5.85,314,1624348800"; 
   d="scan'208";a="66176805"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 22 Sep 2021 10:48:51 -0800
IronPort-SDR: bv7IsKgW5s9Vqqkwc1Cbljx0OJ3Ly0UHYQckcWhmzg9XSGRn9jCEze9gPRtMNKnHgBW49dgHbo
 NdQtTSnrSeqtEEFKFaCS6IPQColD+9AdiKscv3NSibWMXDJctUyY5jQP3Oly5PXXlkweR7O9X7
 QFciv9nymT7UNbh7/NAe91jMZvRnbiM4fTxpuYOCFgWfTmlvrJYaI7YsCh71RheUUGn8vKKUz8
 QlizIuAG/SuUWV3/m+qbuCkzcrDllcBJBOnfr0gckoQVmVbyMeATcH2V6/ec1EpGTPJv+V0N4V
 VgY=
From:   Andrew Gabbasov <andrew_gabbasov@mentor.com>
To:     <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] memory: renesas-rpc-if: Avoid unaligned bus access for HyperFlash
Date:   Wed, 22 Sep 2021 13:48:30 -0500
Message-ID: <20210922184830.29147-1-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

HyperFlash devices in Renesas SoCs use 2-bytes addressing, according
to HW manual paragraph 62.3.3 (which officially describes Serial Flash
access, but seems to be applicable to HyperFlash too). And 1-byte bus
read operations to 2-bytes unaligned addresses in external address space
read mode work incorrectly (returns the other byte from the same word).

Function memcpy_fromio(), used by the driver to read data from the bus,
in ARM64 architecture (to which Renesas cores belong) uses 8-bytes
bus accesses for appropriate aligned addresses, and 1-bytes accesses
for other addresses. This results in incorrect data read from HyperFlash
in unaligned cases.

This issue can be reproduced using something like the following commands
(where mtd1 is a parition on Hyperflash storage, defined properly
in a device tree):

[Correct fragment, read from Hyperflash]

    root@rcar-gen3:~# dd if=/dev/mtd1 of=/tmp/zz bs=32 count=1
    1+0 records in
    1+0 records out
    root@rcar-gen3:~# hexdump -C /tmp/zz
    00000000  f4 03 00 aa f5 03 01 aa  f6 03 02 aa f7 03 03 aa  |................|
    00000010  00 00 80 d2 40 20 18 d5  00 06 81 d2 a0 18 a6 f2  |....@ ..........|
    00000020

[Incorrect read of the same fragment: see the difference at offsets 8-11]

    root@rcar-gen3:~# dd if=/dev/mtd1 of=/tmp/zz bs=12 count=1
    1+0 records in
    1+0 records out
    root@rcar-gen3:~# hexdump -C /tmp/zz
    00000000  f4 03 00 aa f5 03 01 aa  03 03 aa aa              |............|
    0000000c

Fix this issue by creating a local replacement of the copying function,
that performs only properly aligned bus accesses, and is used for reading
from HyperFlash.

Fixes: ca7d8b980b67f ("memory: add Renesas RPC-IF driver")
Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 drivers/memory/renesas-rpc-if.c | 47 ++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 45eed659b0c6..374c92e57538 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -502,6 +502,48 @@ int rpcif_manual_xfer(struct rpcif *rpc)
 }
 EXPORT_SYMBOL(rpcif_manual_xfer);
 
+static void memcpy_fromio_readw(void *to,
+				const void __iomem *from,
+				size_t count)
+{
+	const int maxw = (IS_ENABLED(CONFIG_64BIT)) ? 8 : 4;
+	u8 buf[2];
+
+	if (count && ((unsigned long)from & 1)) {
+		*(u16 *)buf = __raw_readw((void __iomem *)((unsigned long)from & ~1));
+		*(u8 *)to = buf[1];
+		from++;
+		to++;
+		count--;
+	}
+	while (count >= 2 && !IS_ALIGNED((unsigned long)from, maxw)) {
+		*(u16 *)to = __raw_readw(from);
+		from += 2;
+		to += 2;
+		count -= 2;
+	}
+	while (count >= maxw) {
+#ifdef CONFIG_64BIT
+		*(u64 *)to = __raw_readq(from);
+#else
+		*(u32 *)to = __raw_readl(from);
+#endif
+		from += maxw;
+		to += maxw;
+		count -= maxw;
+	}
+	while (count >= 2) {
+		*(u16 *)to = __raw_readw(from);
+		from += 2;
+		to += 2;
+		count -= 2;
+	}
+	if (count) {
+		*(u16 *)buf = __raw_readw(from);
+		*(u8 *)to = buf[0];
+	}
+}
+
 ssize_t rpcif_dirmap_read(struct rpcif *rpc, u64 offs, size_t len, void *buf)
 {
 	loff_t from = offs & (RPCIF_DIRMAP_SIZE - 1);
@@ -523,7 +565,10 @@ ssize_t rpcif_dirmap_read(struct rpcif *rpc, u64 offs, size_t len, void *buf)
 	regmap_write(rpc->regmap, RPCIF_DRDMCR, rpc->dummy);
 	regmap_write(rpc->regmap, RPCIF_DRDRENR, rpc->ddr);
 
-	memcpy_fromio(buf, rpc->dirmap + from, len);
+	if (rpc->bus_size == 2)
+		memcpy_fromio_readw(buf, rpc->dirmap + from, len);
+	else
+		memcpy_fromio(buf, rpc->dirmap + from, len);
 
 	pm_runtime_put(rpc->dev);
 
-- 
2.21.0

