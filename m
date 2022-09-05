Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9FD55AC9E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Sep 2022 07:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235232AbiIEFtS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Sep 2022 01:49:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234698AbiIEFtQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Sep 2022 01:49:16 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2121.outbound.protection.outlook.com [40.107.114.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B31362D1E6
        for <linux-renesas-soc@vger.kernel.org>; Sun,  4 Sep 2022 22:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieP6BfjYgP03x5Rqaqm8C/OoTM/csjYThfhAAQAmD8U2QY1oX79CyNWl6St9OZWoWXWFt7wb/P3nM31tZGLDO81H0WvnoBzaThkdAZo7p7jqgYn1ZnvZl/8z1hQCX1exGPPsciTBfN0Sqw86yxa5REi3FC1BG4R0m45zDCXweBoNtiaUkho68MBILLP1ijFpCYS+VheZ9cYAh8WW7RWZeUKsf0KFsUgELzTw+wsTmI/VkyutVu4mGEvgMUyq7hevaqwwE4hnA4hpYdKuldyPyLJBnavUgT4qZr5SNv6BMfJrkzg/AU61tNwikyGnTtNFAKh9n60roge1Oe7VUEzIHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+F0TpPHac9xDk6XLbwIStnrYnf8t6IgVrGo87HIsRTU=;
 b=cynwYGE08N3Q9z11jhzUmb3izN8/PYTDPk4ZYjGMq6aQVX4Zy2JCDXirG4UT+PKAG4svudJReP5TwW5geuS8jgjTR4/PSrBxiKdbAYp8buIarz9vYSM9hz6Fyq+jJ3RWg9UWjQb2lHw90ygoQ/rLogi8lmMB92rspvqpkAHGjulwfP+Y0VOBlkC3nooBxakn2v0MbV6HoWxOi7Sr/Prcke292pkLC0Qb2Bd5t/61R+hTBJ61dSDG2JGu3+Iad9L3FdnpN2nqQ501YF2sDjuQqMAbgpJ7vRiIU2hLAWSPDbSt69IWnSQIYkYMwY8Q/nSzSEbaezlo8itCoPa3ZQ1Isg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+F0TpPHac9xDk6XLbwIStnrYnf8t6IgVrGo87HIsRTU=;
 b=ZPbYABZ2sqEAke/zkPZ5OGytUpMbNhOek4ZYb+4Wt8uWrpt9N9zmGqHg2TicUnMWbBTAdUV8yRFqfRKRZHB2P/qBydK76L2TkRQf3V3opCGdTo6h91bM16ENIU5TmiupFvWu2a7OoFv5TjjVTuiavRUB1Xs4SSGiqzjJjLWaMdY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8058.jpnprd01.prod.outlook.com (2603:1096:604:167::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 05:49:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 05:49:12 +0000
Message-ID: <877d2iweug.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: spider: add missing bootargs
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 5 Sep 2022 05:49:12 +0000
X-ClientProxiedBy: TYCP286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92683729-9da4-40bb-b111-08da8f025c4c
X-MS-TrafficTypeDiagnostic: OSZPR01MB8058:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NVtcQQGZ4h7DFAQbGCN1LDF//enlWwyR5A1sJJ+rSrslfuxaz6CLmfTEYXc9Bmfb/Km2W3bdIFYo42UrEGx10m1+kryPSMBR9NOnoEu2kNhRkmp6oJvwcJGKA5ZD2+fEzuqDfDo3yqq08SUuTyyvLVZGfuTEzsDnYBLnLk0WpDDw8h5WoYVkohl77iJ2PxHCKBcO7gcJTsXcp0nLFUIYbB0aH/4Mp9PJcplKihWYOy9ymDtp2MmgJw94Oao/FLJ9b6s8Iidt/my6SOasIGPpzrfrik1nMBoRVazkEpQH7bNrIHtVEiumP3YhgOPE0GzZ+I7Y/Ne/w+lAdVBC4KZ+ExEHXd7fiu+pLB60IUKeZgXSkE72cn1smx2YEw7cQj42B7iRhn9dZEHwhN1EGWnXaZiMqnlZGJhlsgn1rv8iWT4GYbGKcbj6IPvd29h85CruVdHPB9RgVlytke0AF+4LIKjKheMaUOVn/WAI5yRrAIkaDwm4Blgiku4MbBkuhu78FjGO3gNqgKTx6PfpqmG+haoWyg4fzAdyBfKnbkD5+BuOwXv94jEce0VIX3ZgcGv5iKiEql/C3wIIIpP2Uy/RP0oMKUuuQf4otirZA3N+OT/hoZnG7b4z0xnAqINOE49Ejias8nmrDKFwkArrGl7WIx/1nQVnRkNqWxyI3pvvT6oGURu7YTWVFQcLTsJef6eMCCxd+M+XckMPtggyWUP6h/yffMmMfCdkPthYXQM/NAYC+SS6BGtkNbYNCCnRxw0fyVVtABtBOqxJO1SzBzBDQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(316002)(4326008)(38350700002)(8676002)(66556008)(66476007)(5660300002)(66946007)(107886003)(6512007)(478600001)(26005)(6506007)(6486002)(38100700002)(41300700001)(52116002)(36756003)(54906003)(186003)(110136005)(86362001)(2616005)(2906002)(8936002)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xzx7S2VT5ImUZX9qkYfP2D9bQhOZzePnNklPQkhpz8qKMGejZ//5uD8VRCUr?=
 =?us-ascii?Q?QLeyI9QjIW4PeCLNnOJ7SzH+QVGNg9ntM+aUsIWbtYey66rXWtxEGWyWa1BM?=
 =?us-ascii?Q?uBBPYvFlkZM12NL6rFgFtSpMVXeKvGqkRNi56KxTuHZuHmpWJOWfIGQhndCv?=
 =?us-ascii?Q?dgG96H57Pspnu7yyFiPyX6llWB18mJuid8rLb3FcXLe1ZKe+GpEOexLWxSSu?=
 =?us-ascii?Q?DchGTaQRqTkM+kW2KGXAlhq5bAmb0Z7z21as5JZP/ab77Oa7brPD7bxiAMUJ?=
 =?us-ascii?Q?deYt/i6L4WHLKYAXRY1qXhQo9sjmBfRpXfsqayvLbuHoDEaIz8/dYf+cXpO5?=
 =?us-ascii?Q?CT8bU6p03NB9V9HWpnNHawTfIhQeNQINs9JDobMYmnWGKbiUOJNmFefcxTce?=
 =?us-ascii?Q?VEMAFYMokio2m0wIBeb+sJxBzVKNmmYeD+CMGRRqk/Vdqk1oWEjlzET8PC1q?=
 =?us-ascii?Q?twa5KdeEaJYrVP6z+W0/+TPbuAjC4jrxO8/AQUSrh2nA7AWeF75boi+nTsli?=
 =?us-ascii?Q?Mv3BwW6kvYUOz5u3rqojz69e4NRTOGmOP8Rd5QRqpgOAJS9mXvFCPeXcLIcl?=
 =?us-ascii?Q?3gieKkJvFbMDPpxprtTcc/HAkjRgRV4jafYsMalJOvI0wYaGywa3R7OmMAkI?=
 =?us-ascii?Q?TUg1g+1aq4hC1vX7i9KO9+w02lGqRHEzWEdAkfz4lJJCTlUZQbT2Ukyj91v0?=
 =?us-ascii?Q?tg80TPh8Zwov87CqedhN17KJsYgwrx/yLS9qilmxFFcc6uXdJCruUe6G9ZeA?=
 =?us-ascii?Q?ao/O8LWBqv9sQVrXwfUxVsAP6gZrBk9+NLxa3qaaq9P+KQ2qIPz42K1wBdOM?=
 =?us-ascii?Q?x22P2f0oaKWMWU59znZNCntVtCDvYvVgTumykLT7w8FUg346Ppwni6kfU/Du?=
 =?us-ascii?Q?usIuNUG/FiPUBVHZKvwL1Gq1h4M112yBrTF545yP7vCNZ1E6uA4cURbH1pUj?=
 =?us-ascii?Q?ze7NIkc3SkKVcIBoysxWReII0I1WKgdzplMgHtZLHhL3x5fl/XMOd8z69Q+I?=
 =?us-ascii?Q?7j80vBysk6/V++K/vZHgH3jRT5T9jHUPk9n0SHd/nPTp5qXD/8t4Dqj2RStt?=
 =?us-ascii?Q?24CE5MbDYxavxwro7mGcSytuhPqXOGMbeMgfjXLQSAxWt+q++CCmbhUW1YuV?=
 =?us-ascii?Q?1DooWGsGaIKynY8UKGhts/1HCCShwZS4ncbdtpYoJgD7j0A1UNODsoedYUPg?=
 =?us-ascii?Q?QWPWpzZF2i2wccsvRVcPp01lWMUuuqcF3QTAW00tTKmZBMqmbFztbrqQ/l88?=
 =?us-ascii?Q?UIRHDw7KRPBzsiMcNnVAe9v+ATwZu9qgdH+sCNvfR1/v6rGX2qq3tG9cfdFK?=
 =?us-ascii?Q?qG9E/9OZ24rHjZutGPOrNJNnhVWTF8Dihpkw46r6mPFTmqDtNLhzvWDdWbOy?=
 =?us-ascii?Q?GsrLUDBXWzRYF87iPeX/6yUThq0/3KULCMldwtfhl99we6EjoPnYQPXQeqiK?=
 =?us-ascii?Q?XFmna/4kmyQg3BtHKCG7BfmzX2H3bKw4fdXng0aSo3PF8xKDYfu/zNe+ER7T?=
 =?us-ascii?Q?jm3VklPwZJ7MpnDa4wRKKkSy+q/3SRXvw9/txMGF2BkWrSG143+D0UfAfZTf?=
 =?us-ascii?Q?81qNkUmSD9e7hZoHyaLMRMc/OuPg4cqCji3vE7RIEzVXsB4xwVtCRJihMMvI?=
 =?us-ascii?Q?Rf8ZuhSS8L8aX4rG4pcLLV0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92683729-9da4-40bb-b111-08da8f025c4c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 05:49:12.8676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9/ZowBZRbY3TmUIylz5qaQECCjrWcaC6BothhvhUuHoAmy5FEfTPUHcIx3UdHm3/TfYiYzf1xRdNJ14Y6sbPZo4dGOX4nnowzRXfuKdvYF7ZqABh3Yp6m8MUhloJE8E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8058
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds missing bootargs for S4 Spider board.

One note is that current Spider board doesn't have Ethernet
support yet, but this patch adds standard settings for it, too.

Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
index 7a7c8ffba711..70c081e745bf 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
@@ -19,6 +19,7 @@ aliases {
 	};
 
 	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:115200n8";
 	};
 };
-- 
2.25.1

