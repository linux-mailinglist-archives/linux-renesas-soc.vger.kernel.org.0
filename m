Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E1B4331B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Oct 2021 11:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234905AbhJSJD6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Oct 2021 05:03:58 -0400
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238]:41532 "EHLO
        mx0a-0064b401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234910AbhJSJDt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 05:03:49 -0400
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19J8n91k009700;
        Tue, 19 Oct 2021 02:01:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=L20Nqnyf7vQ9O4AfhNNzZ3L6kVt2EqWUV6pVCg7grDo=;
 b=MbNgKysdVoEKHL88Gi8/Y6c6YGlGPqf3HGtuFOFhaEx0yH/KfHgAbQMqfXceWsxJnDs7
 I/0c7ilkvnDwYIfdLOa8EqGkYJA+QwDueTyAzOVIHTdgf9JCRW26AhD28y2hHc1Z8RV5
 zdfafeZMDYh1CDLRTN9MKJ3IgJtLzgV7WYTG1oDhN76ckSgaU1IkWKkM2hG71q24R/Zo
 GeoPHn5GoYWPRxa7KmNB9M3TzVajHpItk5bce67qRpEk29Ab8o8caSSgGziQNnWciD8B
 x/0WNT4gdlZNW1BdtDXdRdLI7XwDk87Q4/URXYbaXEfUmatukZqsaJ/uq1Ok+12IPDix Sw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
        by mx0a-0064b401.pphosted.com with ESMTP id 3bsab70qum-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 19 Oct 2021 02:01:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2KwwpPKhqdewvsSx96cIIcv/G271HyeH3luNpXYWGoOFkDHpW8ZCizBxhZobo12f9rK+wWv11yb6cEuGbFAv607OJmrQ0UilWdqofae9+Np7RloFyw1K5DGtnfcHaH1SzWiB31WqtWk+AvTsaId69nIdCQVVHMMoMPzy7rZtsD4BoWgpJqRVw+QCOVECoPxHuWlEZFyRiEjdQCHJn6/e21w+9UOG1UFIhdU8W5/zLykPy9NrUTAJZ7gjJHn10S9VFvdBvDm4zH89hejtOt60q6/ydEA7wUSZQ+VnjNfuoNifVREJvcOC6EEfT4+nEceZHNuzoAim6loXurDLZZRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L20Nqnyf7vQ9O4AfhNNzZ3L6kVt2EqWUV6pVCg7grDo=;
 b=lM9MRojCTOhWk4uaPB7c0+W3ZUdTsYvJ4E4yFFQi7HqzHAoaHwdfAQDLmmL5iA91ctQuI2vhhg4AuUsF7BJFANbz4YXX+sn5Km+LCuWrp0iVFxaR5DecjVvtnCLJ7yM89V6SXXWqj+85DnJ66v+2G42KOx1mcVC6cSqO2ndSdP+t8zY445iFM6ZDL42wdjb4Op49RhPPKcFXbbF7miGZItvxsqmZ/AbkR2+7c6jNYSEMPmyy+qrY8hEWESjanV2T+N/JbyaRC2Je+n55G/UVXIf2w+eLHTilxBmNyrUlkiIeDM5rzgCw5qUZIxra4/kXKMpDNNinRyWPKI+3tOvvnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=windriver.com;
Received: from PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24)
 by PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 09:01:25 +0000
Received: from PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::c11a:b99e:67ce:4a14]) by PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::c11a:b99e:67ce:4a14%8]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 09:01:25 +0000
From:   Meng Li <Meng.Li@windriver.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
Subject: [PATCH] arch: arm64: dts: Set gpio5-pin9 as input by default
Date:   Tue, 19 Oct 2021 17:00:20 +0800
Message-Id: <20211019090020.11724-1-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0068.apcprd04.prod.outlook.com
 (2603:1096:202:15::12) To PH0PR11MB5191.namprd11.prod.outlook.com
 (2603:10b6:510:3e::24)
MIME-Version: 1.0
Received: from pek-mli1-d2.wrs.com (60.247.85.82) by HK2PR04CA0068.apcprd04.prod.outlook.com (2603:1096:202:15::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend Transport; Tue, 19 Oct 2021 09:01:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5d91d81-73ed-4aa4-3158-08d992df0795
X-MS-TrafficTypeDiagnostic: PH0PR11MB4776:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB4776D4C16EA869D76BF0C17BF1BD9@PH0PR11MB4776.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RDP89DsrYEXNnZMut6x1TWlrePkrHaWIc3FgOUDdJydvZTUefE5Sef+XRNFRsRSjie9cjnkdbH+lTttmerVYzCUFxQRuZ27Rqh9KFWaThcj3yeW+uXo/NNme4c1ISX1/y/O4s5o1iD5++YVRRM5T2F9btKEfEbBL+wOaO8UiixxTydkHiF4E4zf899dhOW6ffwJ6YAbTqBrWT9vU7t9JjnnRvUaVc1Bi2hZcggINFYJpxNI7IS4Mcqe7Sq6NVScNMvMC6BCW6iaeTWobbd0afvoQJOc0/zGlG2ryRxJQWNy5gH3FV+mOFmatlDOz6hMMWuXgL7P4GrlVxO1Dc25D62tm7wTd2MvTh67SDddjGrEtZAAqkaq6+xQaobNBwI5/HLFWEWbdKJHiW9uJZ7txMwR9t0fPvPM9GcZKtcFP+j2rTsCM7DpxU/pYnCODT2xp+P/XaJ4BgUFeVPdbbl11+mJvAHCH0j1HMQ1NzUyHWbOXcKUYS7Oax75MD3fROuxEdQH2HEt6pg1rWhwexkk3yqYiPJVl5yc0kAYT5aqCYZ5GwFWm/sBYE1Bc/sjTq0lRxOroeJYQ5dMX6rr4KLvC9TLmPZhZZXxVw6zBiCPYtM7+5VivEl5e0w2MRXwW9FqGjqOsAXLlaSk8FgS4E1+8XWy9E3SfQqoAz4xg8p6S8PO8NodW4PgGZSdDlqFsAY3lpsFNOU0XQpw7NyWz58ozug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5191.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(86362001)(2906002)(38100700002)(316002)(52116002)(26005)(66556008)(66476007)(956004)(8676002)(6486002)(36756003)(6512007)(66946007)(5660300002)(186003)(508600001)(8936002)(1076003)(4744005)(4326008)(38350700002)(107886003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rnn41jb6X341eJaPcM7FzDcCIAIserLox8YDQBn88WAFdcHV5oab8AznHIKS?=
 =?us-ascii?Q?Me0qoXdkkDTYc7avXIMm/HNtNOvW65FqcfHfIM/DHa3IiTOJ1XW2+u62maKw?=
 =?us-ascii?Q?5WWS3DOLNpCvR0e/VfJc4SGTNo6++xkUil/0wn8qsWolz8nmJZsAPzLS9gE6?=
 =?us-ascii?Q?IHY/L8r+b04vJiy6E+LEeN9nbPEDPXIrU4iSrdIEOLs0TC+gc47Z9bcE7h3w?=
 =?us-ascii?Q?xyohcoF+TkzJ7N+zBLqVfGH7U+5ksLaHfTuQsbwQXbEBxd/j4XFcwRRHf2Fu?=
 =?us-ascii?Q?Qyt9FMKHHNu5nHPbf7QzAgNFP5jed7lyE2ExsWXSlAaAjbfCtV5dBssqdVHh?=
 =?us-ascii?Q?5z6f2tiihRQBqKOl7s+tVLZu8pV40RptpIbk77lkjH9hJvEwTszeYLNCmoqQ?=
 =?us-ascii?Q?CETtOLuOYDx52xYS5Xual0QZrgz0OuafzesFH76td5FAbntonU+9uFUzs6Pp?=
 =?us-ascii?Q?XcAYFeG74ks4n2o0blXBwDW+XQqewRj/FZ8tqx1w9Q/b2hG4c6gDAVoMSp6n?=
 =?us-ascii?Q?dRROTB7EIqZDeeWcd+BUU6GHFb1q9NxfuYLQqrVqxvPqYZM3Slhl/9RI1cJb?=
 =?us-ascii?Q?f46vdnSoMSCz35tpG4VJ0x/p2rtswq86fkcurZCJ6fXTY2Ys7PkfwW0O9lMe?=
 =?us-ascii?Q?ctkqQM8vL1hcqzJpIHSDmvjnn+kbgF1mdjPDhQL473U4UoYhCpDCOEoWnsDk?=
 =?us-ascii?Q?cR0EWZogHDFxmWy1LFuejtrwUqXLVhaMoK2NyONjQ6cd060/PoA/gTx82P0M?=
 =?us-ascii?Q?/igNPafirJbcV1oLgtVFc/Fd98c+Gf1sWdg4s3MidRL7dSRXjn3oNiQ4Mt6T?=
 =?us-ascii?Q?Q99WIWi6m0vP2Ic0vdRAcA4h5AJ+D6vFxxj3s7SaMlB8O+SfrphrrjSWgG7d?=
 =?us-ascii?Q?vtdITWEjRmUFk/yWS46XA/CNbAMdEEwrBe6hYLWCgWsGpc5VnOewzTE8fz47?=
 =?us-ascii?Q?t2aknBsBgqKoXdRXPS/TzbXJXgb9fJP6eKR09+bsNMpJ6xcODbGdama3jsup?=
 =?us-ascii?Q?xVD3BTf0hHNLP8HDqXw+FeLnrN+qJdbpPQOaePUc/T6GG9dJRqSSfl2zqGV/?=
 =?us-ascii?Q?EpTVKTfQ2skPSDn+MdhUicxU5LTZBobCfJMAUi2TqkUKMsBj4TOCQFrbppXb?=
 =?us-ascii?Q?/aaeZXZ77FIvXnjrREeObQvaU1SutVlhkN+MFljo866xPuSigCF5lm1r/xoK?=
 =?us-ascii?Q?YeFXfVon+LPzzA/J1pI+2SNvBKdB3mniR3pnIsv7TaBvHioy7eO3YmHW/STT?=
 =?us-ascii?Q?5ri5SAGPhN+uDeowLVdW8Xfhur7VdB2lhZtbCuUcxbS5IjZrTAz8CnvQUd78?=
 =?us-ascii?Q?PgqP0jMLJK314InZ+BUbasv3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d91d81-73ed-4aa4-3158-08d992df0795
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5191.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 09:01:25.5760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHF4KSjwqkD9qkZDZfq12cW+uKNB3SQZcZjUj8OwMw3aPKf+78znNnNnn0tKCadgW6+CCqDH0/5MiA+bz0+IpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
X-Proofpoint-GUID: yKYGAZtHQeD8fvf6s5u8-JCwS1FcsVVZ
X-Proofpoint-ORIG-GUID: yKYGAZtHQeD8fvf6s5u8-JCwS1FcsVVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=606 clxscore=1011 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110190055
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The gpio5-pin9 is used as the interrupt pin of i2c external
gpio chip, so set this pin as input by default.

Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 202177706cde..8986a7e6e099 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -205,6 +205,15 @@
 	};
 };
 
+&gpio5 {
+	gpio_exp_77_int {
+		gpio-hog;
+		gpios = <9 0>;
+		input;
+		line-name = "gpio-exp-77-int";
+	};
+};
+
 &i2c4 {
 	i2cswitch4: i2c-switch@71 {
 		compatible = "nxp,pca9548";
-- 
2.17.1

