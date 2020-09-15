Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB97F26B776
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 02:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727476AbgIPAXg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 20:23:36 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:47064 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726820AbgIOOUZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 10:20:25 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 57C0FE28CFC414171E4B;
        Tue, 15 Sep 2020 22:01:25 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Tue, 15 Sep 2020
 22:01:11 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <yoshihiro.shimoda.uh@renesas.com>, <yuehaibing@huawei.com>
CC:     <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] soc: renesas: r8a779a0-sysc: Make r8a779a0_sysc_info static
Date:   Tue, 15 Sep 2020 22:01:10 +0800
Message-ID: <20200915140110.11268-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix sparse warning:

drivers/soc/renesas/r8a779a0-sysc.c:99:33: warning: symbol 'r8a779a0_sysc_info' was not declared. Should it be static?

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/soc/renesas/r8a779a0-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/r8a779a0-sysc.c b/drivers/soc/renesas/r8a779a0-sysc.c
index 09dac5742c60..d464ffa1be33 100644
--- a/drivers/soc/renesas/r8a779a0-sysc.c
+++ b/drivers/soc/renesas/r8a779a0-sysc.c
@@ -96,7 +96,7 @@ static struct r8a779a0_sysc_area r8a779a0_areas[] __initdata = {
 	{ "a1dsp1",	R8A779A0_PD_A1DSP1, R8A779A0_PD_A2CN1 },
 };
 
-const struct r8a779a0_sysc_info r8a779a0_sysc_info __initconst = {
+static const struct r8a779a0_sysc_info r8a779a0_sysc_info __initconst = {
 	.areas = r8a779a0_areas,
 	.num_areas = ARRAY_SIZE(r8a779a0_areas),
 };
-- 
2.17.1


