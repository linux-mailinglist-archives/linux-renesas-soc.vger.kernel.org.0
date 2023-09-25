Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 980D27ACD54
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Sep 2023 02:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjIYAxl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Sep 2023 20:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjIYAxk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Sep 2023 20:53:40 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2105.outbound.protection.outlook.com [40.107.114.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03DDFC4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Sep 2023 17:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKcfvhp2PVKsUXjswL4ClhCquX7ajGBNoz2ajHaiRxE3T7SXekSQ0/mXq4p74UWptYHRdmP58Qs0Zb3A0umx9XXSgUnbEqNUt9XbECaI9Fdt21Gf0XHm6+b51KcomMSZNry6uIMB7OWYNL2eF3Ht8yJT1bWwqq06COqBYgbEivxLrAcTJwEObu+RdospO1Lg7uUpqr7ReS3DGnUz5MUj1P8KUssLfETF0dZnCA8AHkpU+0smQY4yJnzC1I/rflBO0LyWHTW1xN9xVhByaY4rdAq77nOp6QzHgFxRcpUORc+9fue3KaLZzH5vmad11ejXd975p1kGGBPfqfk7mGApfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0WN2Ike2whwN1LxDzztJi33/qDcmCJv/+4WFIEAW1Q=;
 b=bV9mKu5POO1MuQZOPt7/MpxAhEVcNnTLbh2H1CCGJvRLNzThgescs/YSNAMUnt+vzn3mbKXOYpXAv+QFtKlrqGtwB4dh8vnTCou6F7pXQBFnkRPt7td8idWXlPFSLgQraiT6d6YYX54mUwjPPg/JKuKOUDiH0qy/YfE///HzBE4kSdsAaM7S79PtZkeXGCTmkH3ccv/kfUS2BPUDG1+z+NvfhEZ0PP4J4AMl7EEVOSjjDPrKJr4CPMPZhDgD4C9u9+MDSHSoPjFvEBqux+gHv6AOLIeDaFOQd3q22WeXtzvXTQfQzUhea3In4++2qVzfJWIxneOJpL6FFdWZUxbFow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0WN2Ike2whwN1LxDzztJi33/qDcmCJv/+4WFIEAW1Q=;
 b=NiJ48/IfOWSsWtSxRXUBgrT9kU+2O+x+B2Jzv65/UiU6h3WF4rDlNVs77k1eo7IdyP4OToXHYMiWu+0VhJ9WT1NvgTou1OzqdT9QboeOXBEBBdzu4c9lYhj6D5kOhVoDNKi0k7sLeXz9nZkgQdW4T4k+ZRDesanrdShV4CtTiKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYBPR01MB5405.jpnprd01.prod.outlook.com (2603:1096:404:802c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 00:53:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 00:53:28 +0000
Message-ID: <877cof8454.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] arm64: renesas: defconfig: add MARVELL 10G PHY
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <87a5tb8461.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5tb8461.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 25 Sep 2023 00:53:28 +0000
X-ClientProxiedBy: TYCPR01CA0091.jpnprd01.prod.outlook.com
 (2603:1096:405:3::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYBPR01MB5405:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf2b71c-e7e5-4e73-7ca4-08dbbd61d4c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VcsU1zP96R+H9hUTovlYNoYLIrq8sNPAlGw8K0ah+LQFJB79A+Fh1kVOUJQG2zW6rWU8rDspq2HqYeAGY+BVIDh6kpOShnBpygHD8GxdYWvnlERSZYbyvMBdHeaccDlWs6bRibNjDn3hmAyQbEz2EYyUmhcETcVd5leScCNVNTn4uQTci1Q7HQ3N4XmeckMhcY9+vujQ+n8WUXojlMZ2oPQWUi7kB0j9laax9B0XNlGidi4ZJGwgIyIhGhfTymwRoRO3eYq1qNEcvv5l5mOn2GY7nFBzEJ5h0yXaKmccNnJ1BXRhxkJ6q6PCfkELPw0MGbqjbPFlPWUT6dUszulR4K2NN2Xtgdgooa5YUHUy7O85CMML317j8alJW1nOAOEkNgF0PAj2VSIABYp6iGt2dl3C9lv7/SeD+06g2oWb4H22//X6fuQQXnB/3cekxaJS9hxHowqQQQVbxrOlzsX8W+QZ6v8NyLgoaSSToHjdQqA2e+F6lOtYoBM7TZUa4kVAYr70d8HmHMsdahUdgolwb0OSyC9b0g8FIb0ynzHBAzuPJBh74qwwG/5Wfq8QgaAbQYFWJsqW7sQCZNFtsOSgv7Q59NfLlmbLT1dMI1LmpQ28hYBuCObndLIoDtUwmCvn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(451199024)(107886003)(26005)(8936002)(8676002)(4326008)(478600001)(5660300002)(66476007)(41300700001)(54906003)(66556008)(66946007)(316002)(6512007)(52116002)(4744005)(2616005)(2906002)(6486002)(6506007)(36756003)(38100700002)(38350700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FNMDLVOpMHsfbPRTQ8ssP4pzH/YVZJbFSYNoRR9DTBrWrrwc/4HvgEqCDY7z?=
 =?us-ascii?Q?MOiaS29RZTpC+Z0x+Irwmv3xbh1SulcdCEcGCo3EnS3n0TjAE9bBfVOJ3Ymu?=
 =?us-ascii?Q?v0oABIxt0Ft/47EbT4bH0qQqI+oLkZB1WDuqe+QTLnSbyM9BsDZ34SI8h+8L?=
 =?us-ascii?Q?uGCPqTMlsN1HWWAg/sZVRpNpCUbR+LbiH6/0gVoO/zhnvRkhP+Mb0q76JyBL?=
 =?us-ascii?Q?qDyasBHCwXQEq/05gptpZSB6ssZSY3PB1lgQaph8q/r/ePrMzJJIYcZfBk0E?=
 =?us-ascii?Q?fho9XGuC6oy2IKR4Gr7zhCcNMrbxrxRXCkUpAcUKS/yXBhIPWkOwH5N4sTeO?=
 =?us-ascii?Q?14ZTtLQ83r3jnllsotrVo8NnxYw7TtosHnRY7sRoDQRXh2cTb+tldD3BtMi8?=
 =?us-ascii?Q?ki6SJ2Zd1PErVhid5Oz+wVUefRL+IcYgbU4z3im2Af1MbzTgIYsl/8F0nbrc?=
 =?us-ascii?Q?dJilRt0sXHiCL10SRqBowGot5uJSs2b4w0masSNuuKBLi7dMaFAW/SupFBGz?=
 =?us-ascii?Q?1H3xAu8lfJZstY17nT1opdc/uOkkrB1PWT+VXACOj26tWxzlfZ4Kqite6012?=
 =?us-ascii?Q?GEIq1BnjXYUTtglL8vTIrz5kek7ZNmfA6vglczJREmhCg0KEIeGMAofqJ8QY?=
 =?us-ascii?Q?9e1TJQaMX5kcL2CoNJlxEgUhIn28si0p7vrwZGlCQX+oesNHjCF+Ie/nJNOQ?=
 =?us-ascii?Q?0E+wEqsxAuql+mp9vApIWwhdvucdDBYwg3npvdu1OlE4nNlpSBO6U8wOY3ih?=
 =?us-ascii?Q?NJT6Q9x5CTUBhXdphH1gUs005eRKzpNjpuq7uKX2pFhRDvNh80HlNlOoPd7H?=
 =?us-ascii?Q?CGKw7aY+doUCZq5LkQpYjbVhVxf0yuDMO5DBA/Dmr/JYjDFSjWQU5x3mldHH?=
 =?us-ascii?Q?kelJonAFQVniyyFqtP5aS9SQWTurwIrLaQUB5h76ebOpRoFuBeNMKkzjCD+r?=
 =?us-ascii?Q?JoMK1AlCnQnxTA4n2zq7BQCTcuGhpOFy17Ryj/y2au3F9P4UCf7F9VSqnbHr?=
 =?us-ascii?Q?i4UE42QLhyJpFWjpKsTTJRC5hw0SkQgwwIeTp7ysRr1z9Q4LCgG4yDpXLhCu?=
 =?us-ascii?Q?DhzzATeT5UDDxhExlQpX0if2LsfhoB0z32Mp6s7RiWJaO90QpStRJaPJo3sg?=
 =?us-ascii?Q?53rXnmc0QlQCAj7mrX8vR+iJYLjzMpIcR078KgvufwswumusB68tKWG4g8V5?=
 =?us-ascii?Q?46oxVVFwfWkoqSaiutFG2T8Boe+Z2mA3LJrygl1le9AZn2o7az0LlvyIH4/C?=
 =?us-ascii?Q?Wip+8NC8hNJIDUabhlQ9LuJ/8AVihi6OMwAWFyCd/slqUWu9xWabepSeEQgD?=
 =?us-ascii?Q?i/PzypsJJQRx/X4g1Q1TuyTLRfaYFFiqOXB9EadGaF0kcuJuWKPhjNZYrRNe?=
 =?us-ascii?Q?JbhPOfZjuwdw34HXDIBafZcrRQXetKowUr25noKfrwjdImfFFeo1eCij/QXC?=
 =?us-ascii?Q?yAPBYyuWc2FpuwDSd4mnAe1v+gnNXewmNgUSgFWgf0Hg1G5aLf4bzu6sFyhX?=
 =?us-ascii?Q?aOULqumjw2BCuPUa8zgmBZEEofxjYXgdWKL4eQsnYky2cpngA3KqESlYxOiB?=
 =?us-ascii?Q?HePBKLjr1GvcgHDn83ShLYdiR/VxsYVXfRLrxTVpBA6XU8CvbS4NBS2zoYpT?=
 =?us-ascii?Q?cDd2UaGWa6glM4PJI+LidFQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf2b71c-e7e5-4e73-7ca4-08dbbd61d4c6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 00:53:28.3709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LuyuhlUy3Pqb7/3kMJTJ9WKLQ0Ad5ZLW4cYOEwors9hLWsf1DkwE+BmTIdpjs2zxu6sI+be5ds2YcoMsVEg0P3r9AchGcpBo+rVorJmmu2fvdBpfnXG3mAmsAmlhL9Yr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5405
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

MARVELL 10G PHY is needed for S4 StarterKit board.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 78d5d35ae9a1..185ee0ebe0ed 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -138,6 +138,7 @@ CONFIG_VIRTIO_NET=y
 CONFIG_SH_ETH=y
 CONFIG_RAVB=y
 CONFIG_RENESAS_ETHER_SWITCH=y
+CONFIG_BCM54140_PHY=y
 CONFIG_MARVELL_10G_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_REALTEK_PHY=y
-- 
2.25.1

