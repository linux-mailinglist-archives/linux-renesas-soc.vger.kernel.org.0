Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1BD1430DAE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Oct 2021 03:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238697AbhJRBrh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 Oct 2021 21:47:37 -0400
Received: from mail-eopbgr1320127.outbound.protection.outlook.com ([40.107.132.127]:26496
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235368AbhJRBrg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Oct 2021 21:47:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwpZXhXki9uF44aqQCY2Ouw2miccLZvRncXbY9yryVhamCBv7LDXeQ269WQiLCiKYBRm25LqhKw5cMJdZd/jw+aWE20qusS6JayedYlJ1maIAfj7VYcltH7HzrOy/0Xc4cRyruxtx7eR5La3cSp7zoFKAOy/Ou2iU1HzdMF6uhgmhw1p4eyj6UfbV3Z/xlvm0bM17z5Lt6jk9JeKku4nHzSlq/Fx3T9ltwk1Sl4D40LdBzJbTXvAHYyFC0c0Qc4XBle7xg5l7gYrLVYYoy40BHWktY4nh8IeOPLkFgXVtYadLHItdzitLUXT/bab73UAtgn1OQzdndx93YU66EdFDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0v34/ac/Vj7Xl5eJ2+w2pnTJIIwH+4spiMC7Af78fk=;
 b=CTrQQPBordrZ+803XPVvxdGbeLWbmlpQBO68LoB7FDPwtztSrZxh2fCTXi/Gxej0dUeqDTD+g4CPq57FYfqujOabMgOj08F3kbughpraAi3yN4LMSLlUNgfE64MHJvcEVMuq94KjuzkD2avNfIE86mvdW7zHaEdKz7l/5it7EZqutuHFRxuTBzl1JMLVGWhrDbgKhHuci/j/yxl0gx1xaX2Zz0XhDv9UpYJSkTvpTu0PTWHfmIu/B85hyEZR0jAJBYCXN+/IDOdYOg1PCkpmMmqXt5r9qZznCHsc0DPhmNr4cIFmFTJhXRhfmYg06V+XlTqI9qFHlRrQlVluAnX83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0v34/ac/Vj7Xl5eJ2+w2pnTJIIwH+4spiMC7Af78fk=;
 b=m5sNPBKJzuMFwhmL9ip+EsBaK+OtdiLbHl2o7n4VTOFQWgoW/B560kYAt08Te3QKDr+uSh0TDtuyIjDqVbTIGknbjTbxJqaM/mVc232MJ7nsTTJJzy5f2nyI6W5qMkqJBZHcjNQkj8siJ8lxgDK3PKDhgn5g8UsH9aEgEmPuLu4=
Authentication-Results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB3822.apcprd06.prod.outlook.com (2603:1096:4:dd::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15; Mon, 18 Oct 2021 01:45:22 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0%6]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 01:45:22 +0000
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] ARM: shmobile: Add missing of_node_put()
Date:   Sun, 17 Oct 2021 21:45:03 -0400
Message-Id: <20211018014503.7598-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0147.apcprd02.prod.outlook.com
 (2603:1096:202:16::31) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
Received: from localhost.localdomain (203.90.234.87) by HK2PR02CA0147.apcprd02.prod.outlook.com (2603:1096:202:16::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 01:45:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9b87cb1-2a7c-45d4-e5f7-08d991d8f2b7
X-MS-TrafficTypeDiagnostic: SG2PR06MB3822:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SG2PR06MB3822365E834F83177350B321ABBC9@SG2PR06MB3822.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0i7+CXbzIwTfHlvGloYHIGIsOhX1difZkQH5hfx8JlWKXpo2aHIS03UqXppDf1ROBg15rRv2zaHdI6Z8+eYqMYmM/I0KInNpYUwu2sqhbizRGvO8wc6MraO5lhMopgrahcfXgjn4r8RRghDmSbKCsA5U8UaHJz+N+a6Dky/wIsiegBVcYMQC/DJxeu9qL6PPFzCTkke2ZLymSAhnyUQ5Y3Yzd63ZGvNiArInNV1qf+GVyDWP9UsX2mQD0BhY/xE1b1CLQZSDQEifJPiAUdjYLBAKBuDC9NHVeoPfaYCQbCtcwjp0pc9plVzRS4CBTwt6xvvDlv4zZPq10dZ22DKKBq+MUtM9P0SmjCcRCLrPsa1I0Ujk9wASLhQhnhEYNRQlvhb++RoL/6zETvAko8+CkyW05XcyE0IWhhZSZFPDpLa/3JfxF0ijThBldK8wuFng6LAZhu9IbwelE7EYh2Tdz5hV9CwEbzILCD+wULnPcwlfCOojTA8CM9ZjE16t2RPREkfkuN2NzKfWzc+vf3d49IHO1rwGfyK0zVN6u50iCbW5O+ZCGJS/VuCnRRjUZk8YALNTM63QSIH29qJdJaJN60Zd0pxx0/jansS7XA6eDhPMyw9pOlbHYPhMfWWI2hqxnzI8EzT5jJqHfqn3CFA0XzZj02wIncIaBZBVnrm0VbYsqo8uYWsbp723RmBNrZO81AtV7CAAMdRapidDxg8r9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB3367.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6486002)(66476007)(66946007)(66556008)(8676002)(956004)(2616005)(508600001)(26005)(8936002)(38350700002)(38100700002)(6506007)(5660300002)(36756003)(107886003)(110136005)(1076003)(4326008)(316002)(86362001)(186003)(6512007)(52116002)(83380400001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tYAJQZ6D2QJnOJFbFXSmcMjbGRQ5XcKEoGX8MAl14wKjmEH8kU94ZEhloy8g?=
 =?us-ascii?Q?Fv1yxjBorUtIUpgQMH5TGpFE3tRFUFbFi5RKWUMiQLipO7uUxuvV0DFa0oB0?=
 =?us-ascii?Q?mqgd9aVylyJT1CrXN7cSwLBdgB3IxY/I3mm4UgRHjP/WY4kcVm/s8NxXLlCe?=
 =?us-ascii?Q?srz5oCL9nu5J+uE2J/zXf3I9bRKR8mLcraQRor6c+q7ELenpiYny9WkJLrw4?=
 =?us-ascii?Q?4LIlHA/Q3wxPWoJfikH0E+kT6LlIsxV2InLA5wUfeSDOK893jTb8EfExKIjj?=
 =?us-ascii?Q?2lsZYYGUs7xyluQuACwMeUM3p+N4NgQLV9i0Cu1OboHLzQgyuBSSyLj1IvY+?=
 =?us-ascii?Q?YOWGcNUVTE7yypTPvEOA4oiLgNsvRhuqKCch+zgbPMMx5noQbsh3HU8inRjB?=
 =?us-ascii?Q?lo3Nko5l6VVWXWCSJw+QNbLHgeovwyU0WoMwHoYZDyupb8+TwhjHdTBWQhz1?=
 =?us-ascii?Q?VUkwWB2FMgCDHbcEjGtrDlUap8wCCP+j5Tt/3WsJvZ6mT6+n8t5/CN6dmyH+?=
 =?us-ascii?Q?HbAJGnz3Aic3Jl/wX5DylkCHAM8tR+c6YagzWBnsiiADI2bm33iKpPFhuRIf?=
 =?us-ascii?Q?/vlrNqGlnVzlZ6FSWIEQ72nXtUcJx8U8Q9EkhjuzuzqaWHSknHFygSW3AZSn?=
 =?us-ascii?Q?bXLmWk9RZirpV7xOIjHM2/ZqLNLFXR4hRPa2BXbXWVlnUuqtz7l56qmc2AMe?=
 =?us-ascii?Q?1TlbKwcM7U9V1UoMRTlNZTPKGIFyrBeF9hyDCLLmSjmrPVThn+TbGA44pSMG?=
 =?us-ascii?Q?TMG6mYC9ZdRecdpRYz8JbDl1kIdyVPQFqSX6UGjs+x/mzFHKlNUo6nbjKr1J?=
 =?us-ascii?Q?enEsZcfFTnq177kcWqj9WYzGmpS6oZJD2xvEQ2lXL39hkVLvV4pZt1HaGv+1?=
 =?us-ascii?Q?8hxN0EnQiHB9BiPihOIBy/Yg4LrVHg4JUbLUs8XB1HkGT16dLrTZUHiF+2tT?=
 =?us-ascii?Q?UjYqcVhgBqi9bNBD5ntivB7X215kXoap84QUbnd9feTy1YnN6X5X0SNo5v9P?=
 =?us-ascii?Q?zVsgF2HAk4oTkNo5Q4piabjRRV8vi2wGxyve4rnAU+Xjmaa+nCylQOkYswT6?=
 =?us-ascii?Q?roiNWEK5XlmyFAF6qzjQAe1EVodJXtYLG/SMroJ/oSOQyLcZnndShkbabY4n?=
 =?us-ascii?Q?usCJR5ZUuFNRvNIAGtgmWnVer3bLQADkihoG6DzlW8iyqChoE1FJ2nX0hfns?=
 =?us-ascii?Q?0IQunpaIWVBZy5B9kIGJdFZ+LsH7CklHjcM9p4SGowY7xDfDAxL2to++Ebdk?=
 =?us-ascii?Q?LcZHuBvPQk9v9wqgChiDhdQyc89AhpVgnn//GwzfqLH6TdZ+x/NOT2HDCR9y?=
 =?us-ascii?Q?7JhX57TjjHj4/6BUMPKqm8u4?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b87cb1-2a7c-45d4-e5f7-08d991d8f2b7
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 01:45:22.2946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuYiAt/OYUWNuAe9XSc/mH8x1314E/8Sh+hjmEcnv+nZkMNQSQc4y35xCMWZjcMi2RkM+lborz0fqIT9C1do4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3822
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix following coccicheck warning:
./arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c:156:1-33: Function
for_each_matching_node_and_match should have of_node_put() before break
and goto.

Early exits from for_each_matching_node_and_match should decrement the
node reference counter.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index ee949255ced3..09ef73b99dd8 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -154,8 +154,10 @@ static int __init rcar_gen2_regulator_quirk(void)
 		return -ENODEV;
 
 	for_each_matching_node_and_match(np, rcar_gen2_quirk_match, &id) {
-		if (!of_device_is_available(np))
+		if (!of_device_is_available(np)) {
+			of_node_put(np);
 			break;
+		}
 
 		ret = of_property_read_u32(np, "reg", &addr);
 		if (ret)	/* Skip invalid entry and continue */
@@ -164,6 +166,7 @@ static int __init rcar_gen2_regulator_quirk(void)
 		quirk = kzalloc(sizeof(*quirk), GFP_KERNEL);
 		if (!quirk) {
 			ret = -ENOMEM;
+			of_node_put(np);
 			goto err_mem;
 		}
 
-- 
2.20.1

