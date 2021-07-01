Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DABB73B98EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 01:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbhGAXZu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 19:25:50 -0400
Received: from mail-eopbgr1400119.outbound.protection.outlook.com ([40.107.140.119]:30825
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230006AbhGAXZu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 19:25:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhZt/6dgM9D/wUVfUtRMYefNJAwugltpOt+enDOP9u4bRnrM6a6Or1mWjwrkk+4FpAI0/twUlKKlVEgGOwRRMzmawuPSt+MLVdX3CMCQff2pg22gWtLC0hqzjQs33lmepoZqV1ZQRIn8Sm1S3sRQMPXuXT3QTWBvxFxJ5jQzLD1l0WovpWcQeZS37OuJ7aELnCNUtdedGr+Ss8tg2wm+Vej3KcehDy2DPFF8H127zw8JYxAV/7FAEM6u6qkWMLjnYTtbPyva1MDbJNCKSOquwl9vp4VlKc7P47U3B5cyyLBfEJZLVWR0VG1BZMqjvGKPuY+LCgEmED8MhMh5me1sgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3ayZONCNwtWLv6xgGj0909jMLYXLi+6KvkzvzxzpX8=;
 b=PUrK8Dxz3Q5KBxfKWlT6zI4gsIKbtZmh+9egqAJC+qED7hLmJmAc4GF91kVIAXz2E95a83OQlh5J5cAVYtL+63fGUW28i53v32nhN8Zu9OkINBOIDP3IvkE+OuXhoSy6wIzKrrphKvDbgfSwU4NQez0yOptO0CQP8TOn6z2k6TrRd1NuvT59fS3PF6HE8q8is9A+6SVtSGymw5K/mlWgiP2gEL4NgGNYZx4deZXTK8Lho9xcxUGUN5EWoo/mGajTuz3KbeXI17Ssp4XCHbSMjza14Qy/vbKRNqpIMPP7IxmXynB5XnpXadK4ZXfBdY5j4+mwyAlTdX+fEG4VcWfuEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3ayZONCNwtWLv6xgGj0909jMLYXLi+6KvkzvzxzpX8=;
 b=CTbdzi1jnAOc9uGEF3S8lOOfnZ3Vn7sAUETIz4Vsm0dMLehq+PRnljY+xAUc79pYgg88kKOvyyOJua8U0yRkV4I/0Fo1EhIB8YgOPwE5izBdWTXYHVSBD8UQRT/j5VfZERUvy18yo2gtsz6EgaMs692d30FuGmbdyP6Isj7Di3M=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSBPR01MB3894.jpnprd01.prod.outlook.com (2603:1096:604:46::23)
 by OS0PR01MB5683.jpnprd01.prod.outlook.com (2603:1096:604:b9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Thu, 1 Jul
 2021 23:23:16 +0000
Received: from OSBPR01MB3894.jpnprd01.prod.outlook.com
 ([fe80::fd89:5162:7a65:7830]) by OSBPR01MB3894.jpnprd01.prod.outlook.com
 ([fe80::fd89:5162:7a65:7830%7]) with mapi id 15.20.4264.031; Thu, 1 Jul 2021
 23:23:15 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
Subject: [PATCH v2 0/2] Renesas 8T49N241 device driver
Date:   Thu,  1 Jul 2021 16:22:56 -0700
Message-Id: <20210701232258.19146-1-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202107020640.YyVoU69S-lkp@intel.com>
References: <202107020640.YyVoU69S-lkp@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [68.225.135.226]
X-ClientProxiedBy: SJ0PR05CA0194.namprd05.prod.outlook.com
 (2603:10b6:a03:330::19) To OSBPR01MB3894.jpnprd01.prod.outlook.com
 (2603:1096:604:46::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from az-ahelms.na.ads.idt.com (68.225.135.226) by SJ0PR05CA0194.namprd05.prod.outlook.com (2603:10b6:a03:330::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Thu, 1 Jul 2021 23:23:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b11cac8b-4fe5-4b2b-c3f2-08d93ce7336a
X-MS-TrafficTypeDiagnostic: OS0PR01MB5683:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OS0PR01MB5683FA56BF4B2B786B2522B6C8009@OS0PR01MB5683.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 82+3256GSvn2XoVlanivB4chhbcq8S6GVbpZM3+UEprYGFfKvq9eF8MkhGZAj7c8LvcpS5SQIFi1hW+y4dc3FXZK0H7q6KpLzbqhnbMLOleS1XhHSFuWnOajtAKdzqhRjXz66Nn+OWHMYNXEXocid/mNkR7lmpGwWNTaxsLYnCqKYQBOvgQHGfo3v3R0HC1/RxFc/Ia1OBjGYStBvv7xm7iQU0184A4T+R+uWWlLVMog4BrUdZTutctX3tAn3Y6xWchlWNnTPemIFXxpg4yww1ZLypk4L4pcJLh3s0h1Tz/vNugyR51OrMFN0R5SQVVrd7XG0P0Hco03UB9pGpN9TXVyJlA1VTCGsYZq/zY5xls9h2Vn2KklZaa+sYTVK3sAfYq1eDYfA0rcfsMiN/JrzPLOYOtm7t08JCuOkJUN10gLojBh38aXYHDdAeB0RQT0XEAV3f+gvR0GdFVH3rBQch9BjxRVCMI5NAdWKgTw6F3U9wd/M2iQq21yQlsWfmVW3tFDbPD/bVo6iy/lDY/V0Pkj3Oba+J/opMl31YB+ov3hllPTejZsfjsFd7Clexvb9B93lJEDOMwcgUjZiwtghFrPPYlImKDJiLCMBGKy1RL1l9TY3IlLb8c5QFWE5DA3ud+nGoQvyolZllx3GLLAXXuTPqC3ORhAybi3GOU+R4jMKl9sEM07CuEiS2HaR/oOO0aRNBXCCbsHBPkvYox9zA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB3894.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(346002)(396003)(376002)(2906002)(38100700002)(38350700002)(26005)(66476007)(36756003)(16526019)(186003)(316002)(86362001)(6666004)(6506007)(52116002)(83380400001)(5660300002)(103116003)(66946007)(66556008)(4744005)(6486002)(8676002)(1076003)(478600001)(2616005)(6512007)(4326008)(8936002)(956004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Nd7s7JBHbEzWpwkWiW7HMFohEmX6ouoXoysjh61YFCWLdwK6LO7RHCrn/TS?=
 =?us-ascii?Q?w8xCTKaBs0mW3B0ierRoG1Hd73sbiHxs44KAh09P8RhOIalkSiUKSHeYoyZh?=
 =?us-ascii?Q?5Ra3vLdXicPy65zC9xdG8z+tJ6m1iVjF3ajQD+MpZaqHGKIDN05n8u4WKTc+?=
 =?us-ascii?Q?AyoBDecj8oJxS+xawucmxcqfwYYcE//R2KDRLUw13p9S91WOv6CFV3Fj2Wm0?=
 =?us-ascii?Q?1M2WjYCzT69HQ+I0YiEjwz3G33Aiy7rzs+puc2XCma3mszqMa37qgdhPfIrK?=
 =?us-ascii?Q?y3TJY2mxLzRtUeqLek7RDnJHyGyNqj8QMCQlsJ+cVYy33BuqO1JPG8Bp0xD5?=
 =?us-ascii?Q?9pE8piMvIw0SRFUZ8fvSnkbuoTgYve97gY1mhOSdqTutjuM28/3U8FPEluj0?=
 =?us-ascii?Q?RLfdD+A3nskm8H/HkcnHUgq4BTg/m79oVQ8PNy9Me9jKca+NuAJ6XVR94HpF?=
 =?us-ascii?Q?W7xQ4Mo4ODADJUpk7i143fQM4reRkbL9RKIkn8Uqdk803G7r0KlEPoXpiwKJ?=
 =?us-ascii?Q?xxCvneh0+vJ6haWtJq4wyts2Vzbb8v9fqcemsb/stqq/yhVn8pLyOYD/Wehu?=
 =?us-ascii?Q?lk6RE3tn7IkKAu8urwzbsVLxVJVyfV9i5jsYA4udmmqQGAoQCYBftLRzKeXw?=
 =?us-ascii?Q?3WYRnq4b++CAwzLgKdyDF9vwKrj5SlZ+8U7kDu/JVrT9Bbau6bu3l0TPVihI?=
 =?us-ascii?Q?6hOKuDu7jzD0BbH+F2NMBZHMUUmMF+xNwqu0u/i3ct0I7Aw0/1ZePYOOUgdA?=
 =?us-ascii?Q?4BLWwczBwEyjZmvnTtGj/2NRiKjtx+a7XDq/5SwaXQ9m6gY6F0ThJqxM4hZm?=
 =?us-ascii?Q?KxBuQ2zELwxQvui9UdUK5xWiBHj/UFkv/ONobL1pd8fVLA+6XNAH2KJbbxQM?=
 =?us-ascii?Q?D+ivr2qaM8xpCgunGuC3p0DLrxkXyc7xsV6iDwor+yVEtEskb2OT0BzUAebo?=
 =?us-ascii?Q?cMh2mqrp5DRkWoWab+hpIsjJ1kri0Lk+Mc5db12iAxVcwLpYYWzh46fi2qGR?=
 =?us-ascii?Q?wdV01noTY5EWuLFsfSLwKIepmTbSpqwq0MebAUHt5s9LJUew7ffTy/td3Huv?=
 =?us-ascii?Q?QLS754BrZQy/PB/9+jjcwYVT900+M5JdsC59UeMjjWl10uIbKE46WkQNj0+S?=
 =?us-ascii?Q?GVx8LPXt0ApBxH53oIQjVN2RLveQFpGXNDBUfqlbeTZoE8jrCdVdTDYwM64h?=
 =?us-ascii?Q?yKjkydPwmVH6edMJjP4THUp+uSDxjXjB8BUv8lgganDJMtdNeViUBrq6kb++?=
 =?us-ascii?Q?zQaED2wdKyv4IUxeAq4YPnILYaHgO6q4ImJFvJvK6gqc+amU+Jo9C7FvmuEA?=
 =?us-ascii?Q?WrZih6KYwSFaEGz9eLCQqAdj?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11cac8b-4fe5-4b2b-c3f2-08d93ce7336a
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB3894.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 23:23:15.2549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzzIax859BK3x6SBEZiKeDhfHeJK7JMApLunGYwurnQkshpiwz2HxV2uxHdzZX2Ip848hk18k3/+O0xpXEw5WKg1Mw3rohlo0Xl+WsjRf9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5683
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

A common clock framework device driver for the Renesas 8T49N241 universal
frequency translator.

Alex Helms (2):
  dt-bindings: Add binding for Renesas 8T49N241
  clk: Add ccf driver for Renesas 8T49N241

 .../bindings/clock/renesas,8t49n241.yaml      | 183 ++++
 MAINTAINERS                                   |   7 +
 drivers/clk/Kconfig                           |  21 +
 drivers/clk/renesas/8t49n24x-core.c           | 836 ++++++++++++++++++
 drivers/clk/renesas/8t49n24x-core.h           | 251 ++++++
 drivers/clk/renesas/8t49n24x.c                | 573 ++++++++++++
 drivers/clk/renesas/Makefile                  |   4 +
 7 files changed, 1875 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
 create mode 100644 drivers/clk/renesas/8t49n24x-core.c
 create mode 100644 drivers/clk/renesas/8t49n24x-core.h
 create mode 100644 drivers/clk/renesas/8t49n24x.c


base-commit: 62fb9874f5da54fdb243003b386128037319b219
-- 
2.30.2

