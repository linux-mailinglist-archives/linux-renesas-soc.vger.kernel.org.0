Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7748E74ABBF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jul 2023 09:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbjGGHUy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jul 2023 03:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjGGHUy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jul 2023 03:20:54 -0400
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2102.outbound.protection.outlook.com [40.107.215.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 952B71FDB;
        Fri,  7 Jul 2023 00:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEvSqwQsrLqPeg4LUQPKAGTWvgvMnG7MyznoQ+1fLTqtvkprcbNnxgv0vzo4UBXNVIfEnp1L8i+JzcTb6XIKRBKQ5K2JiUg25Keykpcv6PF6jZzNkIzoeG2sZLfcwXwoSqBmIam0pbPI/Qot02L7GZg60zXCXtzKIjwVm1h+5MAX3J1LPXn38r5XLveLQA0Bb20OvIpQ/bSXOzEVXQcyYxnqrBJSb5ANrYyToc93kI1U1T0WNkx6OoQGzAqIZ6MYd/hMofNZxpjF7lsnoNOaoSMI0Jhlgxyi5QupWdP9+GjRbK+FmohY/KfOzfP7ebg3A/8/i4ae7cKqoRt9dmsf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sueL6bmHylA686jA6mVhKi7yXxUHBSJQDngnUT3zNJ0=;
 b=EHP8gvN5geWhh7HeQKwb1kGa003fYBcKVA0VnttxHynYjn6ERQ845t1lNIe/U6xqTw0AGORYRBR5Yq3Gg+Z32SIIyeR5K+fDVb5uOp4/YN0ofgY5BfTTvoWqO3Gw2nR8Y/XvE5jRIdaNSqbQBsf95f5n2WJDrAQ+rRNCohFTNbrFzN//ciie++LffngJDcyJqnDq2nGXna7yjegbaihAGR6QKoZmPgC7ZVqkuJSjZabUOMptmNlxBNoF4Fm3bZXI4tLfsYfoF7ywmefpCYgS9wny2nblRv8DefRS7O21ruRXq2SyAbcZQq1yiB62UPk+2QzF80vLJR78cZderWZFcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sueL6bmHylA686jA6mVhKi7yXxUHBSJQDngnUT3zNJ0=;
 b=jfW/b0VSm1vRDNfvMjJp2i/vyUsotnmKy3AVb+hkW6K+BkjND/dPLf1zYFjcODGujxdYF0Ara14/mjKYTX9rU8WRd1AoBZ/eBYcY+5oVdV7nIqKxRizbLF40KDSK3xbjAORTGXvjF29/QLbQBDFKNFh6mu6m9WbRmdlVmFZkOXTf+5ZlEDdjDEI3r0/DBBTW1tT6cecv4bmoCbyKzLn6tX0JGdMEGPAPmKrG2qIbhnEVP4J7V95R7KNe/Gw7TuCXKGKBTnPK/rQaGjs9LA+lUg82uxfHqUIoKDyRDZLfYBG5is/QaBHwsw6xQwWmqKMTku8KjmADTxQkoNk7vv2CsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by JH0PR06MB6704.apcprd06.prod.outlook.com (2603:1096:990:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:20:46 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:20:46 +0000
From:   Yangtao Li <frank.li@vivo.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Yangtao Li <frank.li@vivo.com>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/18] drm/renesas: Convert to devm_platform_ioremap_resource()
Date:   Fri,  7 Jul 2023 15:20:17 +0800
Message-Id: <20230707072034.48977-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|JH0PR06MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 128b2b5a-1ecb-4513-e985-08db7ebaae15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2a21PTJ2ENPFyUbGMZU2cKp9OYRbfmrptgAIAWI2121fPOaFYrGl1MnowrofZcDR17KOy+P/PLRemJCnHkFdx1jSsgzOCFGXIg5DTjbsOGaoTSjMm+CYizUEQKKM/R+jNhOjXj+ZFb7lXamh2GFqcWBSuDBKh3vtauEJx3GHB4/px+B0Jx2OaWp/9OvXOfdKAf6b37ZOS6/rupbyidrduVNEjRijOtATwUJpFknZuhnLt6b9Op8vLtCP5mLyTy/IhhWm4rzi5UJzhPUdDdyDqJ9Ls9YTmKjwVdp5/h7eRYJQ4NaTjIClHXGYQuCFB1FuccS9PuvkYOE+hZ2l2fzX1v/62bFHQT7Jdx9mlWyf0YNhDuEFU5sMBXRHJDZSzrPNGtndK+47saCPsWZowncW/qdcfcYbb+iB56jTXNmJWQmApAUlvuCGIgkzd8Kpf3PCGNsW7Wb+6bOz44V2r/kccTyesItZL3z1KM9EloGeQkenL1PVYNx6rIxiiR9VL0fwgUkWSDAJCjbI5pcTRe5uBKhPB2mKnX/FE9fehHKU05EWAX8qd3axr5m8uYV4akUQ6egHNhqGtySf2WJDsyRn5sAD6TqHOoJbJ0qDR3U6GVTCqlbTCPgVCMv1GchRHgL5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199021)(8936002)(8676002)(41300700001)(2906002)(316002)(478600001)(6666004)(110136005)(6512007)(52116002)(6486002)(66946007)(66556008)(4326008)(66476007)(38350700002)(38100700002)(5660300002)(2616005)(83380400001)(186003)(86362001)(36756003)(6506007)(1076003)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D+tfAoTcGfmvhqTQfLI22ECbUIZ0XxDwee6oSZ7lAj+PkogHgDL5Q/VcfZT0?=
 =?us-ascii?Q?pGDW4Bwht3xqPFlDlFPg93Uq5srZnbBF48D6kLL3ErePI8S26LGKWMMBa00Y?=
 =?us-ascii?Q?la4AmCoekIp48T3ntiLKK5oV+cjwAz1s+6LHnxYV9KfVMtP0mtrs6sz/5IJJ?=
 =?us-ascii?Q?sH70kiO8oWx1m+X79BzYNlwczRm/5YUhPgKvCBaznP+NRaoH/sXY10/v50Kr?=
 =?us-ascii?Q?HbeVZvMFu705nI1VEe4R1b3VE3YZeniL+nWSf5c3cd2wa3KVmpuPgYrXAmEZ?=
 =?us-ascii?Q?9Kez310A/8shP9/tjeHEsFXjYKJFeJg4AAWzV2XoqRznEkXbvi7MBHSb71aR?=
 =?us-ascii?Q?nqxqJTciaaGaW+BzaupJCtU3Qcf3LulglXrWmLZdpsrZyn/mSNj5f8pHHpHu?=
 =?us-ascii?Q?RD+EPuTqFS5dvbCdT+tJgUr3PvTOP8X0kRCwlE7HHcSSa6QDzJnWr/3aN6go?=
 =?us-ascii?Q?xSU9+crT+uJAw5hUo5IX0NX6i5QmQhdNXm1L66DkUJ1Iskg1/odmGXMND4vL?=
 =?us-ascii?Q?6rq3opkxkpxC/D8cZV5JyToaWJVLn/2Vtl1MSuXlpS6m2XQ9ibiW1LX+B43I?=
 =?us-ascii?Q?Z+jYbzXp8pg2f7Wx9KXjw7KhVflSuqVhM47L2i1NwnIYlBFvG9cH2MBJZwRN?=
 =?us-ascii?Q?Kqfi+aB+H7MLnunIoZOfFv5f5nO3WloT0riykxSX+ceNielobuGzkd2gQ5os?=
 =?us-ascii?Q?3Ofoc822LB/3jyXMSVMsJx+/EkX2+vBvYhw7Ubdb+NuQETwwJ/PVYc+kZeuG?=
 =?us-ascii?Q?HnVs0QSCBiKHBRVRLPeVGui64GaHvgTY+HRbJsS0zuHPRhVc2yaXrXJqQHvn?=
 =?us-ascii?Q?6J1itAh6/k5EfXtMXWaHatvCd7pigBN20JwGQ9Wn7Dtx9xAJxRthbbnuLLOA?=
 =?us-ascii?Q?ywgTwvMJwvZoIRn89wzyLscePvsK/+AX3nM81nVa1A6YmS1qVuYG1//G+0a7?=
 =?us-ascii?Q?qedryn1teTo+Ukj8qS/P2ejfDR/1QDcUmOxcYqVhca9IReV4W562eIilyjjf?=
 =?us-ascii?Q?BcPtBLo0qnvs9YYfZPhxu/hES7jxrPDcdujxu9dKeu4/yuTRMLa5BgP8QUVa?=
 =?us-ascii?Q?Y1jkmoiTXIOzb3x17IMASCAsXu04BfgQ5AOHMRE8pGADKZzHAdP8PyQbPoEq?=
 =?us-ascii?Q?KH5aMtJmaDNwhDBttUSt7qx2YbyOYtPAI4113WSK6/j21ZIAYYzPTeoSjdng?=
 =?us-ascii?Q?z8/YqEz7DXuK1/+z2/Sf5d8sNtEO3Fvrb1t+MaRstdOcQbI9UPRABBkUq28a?=
 =?us-ascii?Q?jzn1v9SNDzgUlpUM5SKqcfK9vgFTMvOkrJctBRlO8j4jQ/KmH9bQk2F9BZoi?=
 =?us-ascii?Q?YJBqoiyfIYTKiHVcpeZqDStJ1yAGT2lKumuHexqgIr2nTHnAB3uKNZxuHH0n?=
 =?us-ascii?Q?EoAi5TVczcFPN64/QxvIS2IdlF3ogcHSvDMGmPEuriSdANZh+M8N7Q7rxoZW?=
 =?us-ascii?Q?qzg6v/C/30K5hRK9YhQCKYMqoi15XcHm8V+YknbmJD4vVdkJwJmrrLgH3lYW?=
 =?us-ascii?Q?RlF7CCkcUoidXMaVHY0twOtXXUQbP5ckMywtkt6a0yr6vXHMKMrTk4cFa/Vb?=
 =?us-ascii?Q?fmJ4mLBQHLwE1OIJ2mwQ+ZX0231ve6AD0mHRz0qL?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 128b2b5a-1ecb-4513-e985-08db7ebaae15
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:20:45.7168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzpuNYJd5mTCRH9LR7wxRmonyiR6hnh256vOm697sFWCTFveZ2OjW3H+TzNQ0w0I3iuLeUWEGXhfEAmFIMEOvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6704
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index e10e4d4b89a2..4bf9f5d15fa8 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -1002,7 +1002,6 @@ static int rcar_mipi_dsi_get_clocks(struct rcar_mipi_dsi *dsi)
 static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 {
 	struct rcar_mipi_dsi *dsi;
-	struct resource *mem;
 	int ret;
 
 	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
@@ -1019,8 +1018,7 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Acquire resources. */
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->mmio = devm_ioremap_resource(dsi->dev, mem);
+	dsi->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dsi->mmio))
 		return PTR_ERR(dsi->mmio);
 
-- 
2.39.0

