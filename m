Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88BCD409A48
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 19:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241049AbhIMRGQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 13:06:16 -0400
Received: from mail-eopbgr1410094.outbound.protection.outlook.com ([40.107.141.94]:15904
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238027AbhIMRGP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 13:06:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsiRK8kRozAD6q6TUHJMvID8b8ufAFN+mQGoO/5cosLknDhRxpDo2QeZ3G4RGwIj2xxc/Q1R7QMlOoqgybIBo3TYV2iIHdbJond6IvTDjVcfk6v8JRT7r7lQOiNsRlxWg32Gmh5/njHxx3e4OoNwuRGDF7dqgZJAd7QyJImLmOIpONV5qpKk5wn0UzUUNczsSZ4DvlqaWAcXcYiomkYr1PGd2r4SSGEEk81xVReEc/hUNZIw50XuI9V79MHzI9huJVFrOnRuMiNfD7YiwnZGKyZYgNstH1a8m/xelqjEAow19a/1aieIrOJAKuFCCHbHt/4ure77S5EirNLFpPX9TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0ChRrwYgK99nKbbMb9OzP8kw7UstQYcVLsJfOuBAbEo=;
 b=Rh5vVcrcJ/BOxkW1a4vN2LC0ObA9oIZmGgIgM8dapbO5ph5nhIrvoY/Mh9NqNoNuebUjqSmW2Rz1mmFc4HdoR3KTbpFyoiy6wfPX2fyr6YxUAUzGa155hCE8btBTSpOYa/b0w13ac7Lvb/Cr5jNr0pn0pOWCdRn0cVDId2EUaXk4bFD2d7xvElG/Ih9OMH8bVFERTVaebZdLkVU1cxyAtGBafmN73VaKz88IKvInqUEFMur8VtU6WEgC9fOaj8IGO1WRhXv2yEShwumnb/BojxrO9lKfqA+P7422fjAbSUBQ11Nyj3TrQszGpciQy6Tt9zMS2SNxEgreIg3D6vJaRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ChRrwYgK99nKbbMb9OzP8kw7UstQYcVLsJfOuBAbEo=;
 b=McYcCyEnA8YATrqeTMGcwTlrZQ0SaL24+Ap1IjTa5cLCXXZKtqKk670Cq+k85iXSVLUa795QBpkU7yyz2T596QP9C7Cn7pNOscirdavrMwOWcmn1JfKy0nqcsS47nH8QdDr8wm/4a4XZiudPOPlVLb53yF1vacXUNuIB0DXQ22w=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OS3PR01MB5928.jpnprd01.prod.outlook.com (2603:1096:604:c3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 17:04:56 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::f:1671:816e:bfbe]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::f:1671:816e:bfbe%5]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 17:04:56 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
Subject: [PATCH v6 0/2] Renesas 8T49N241 device driver
Date:   Mon, 13 Sep 2021 10:04:34 -0700
Message-Id: <20210913170436.243-1-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0094.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::9) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from az-ahelms.na.ads.idt.com (192.48.119.236) by SJ0PR13CA0094.namprd13.prod.outlook.com (2603:10b6:a03:2c5::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.8 via Frontend Transport; Mon, 13 Sep 2021 17:04:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7ad0130-7a70-4b09-51cf-08d976d89c7f
X-MS-TrafficTypeDiagnostic: OS3PR01MB5928:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OS3PR01MB5928CE9634B119C2809FC3A5C8D99@OS3PR01MB5928.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QjfzN97+gcU69imuHTbo553hGGVTZyXEEwVno6MnfHZZtnioHBZBdrRHXcMYEJ0wzYzqcJGjXKyqJFgDewSPquI59q0uN9EUWYDeDS81epnW1ZrdgzOmePbuDM8TnUCNw8hGjBz8RxyCv9P09YJZRymYxZ1836iywXWZ5tQp24qSi5NzigD6EjHMNpmoT07FLKQTqKnp1/d5xgWbGwYgPxhUSZzsuRyoUo81E786mRr1AXHxdNzIP3MkrOJWtbws5Y++9VgT9NJbUsbjcbKtVklUUo6wLpe0MHWY6qF0WtkTSLMxBvqe8FV2O/9JA/PhxQ3exDdr+ITELdaT4PnOVg9pQpX9cSfvHlUKhCN0YL7L9eqp6EwcxOywvdlb6GaGmkTgQ7KcAQrRl6UuaMjFMAwfvKjsXQZiclHa50qAk50LOQYvfz9avJV6ujRLj/7+hsk5PIn1Q6lmIyDl1OuiipqONw8JzAubvQ7QbOzFRVyj30ptYoepO+T02clUZJX98i3Wmc1Lqd3jwbgYciv3xk7mSo8ZGwqi2OOh6jk3+eydmgaq8uFPEvPnmUCfffRa4ftszApkCcBF8nDEWJTNc7zGtquiaVSjCgxoSZsQD+uRgLky7dKh5m61FiaGzB/dE7UNTyapXFIFK24/OeCmNaZekZOyPeVA980DqzssnfCGYAc9QSMkTI9exR7Fer4mFVxEaN55iucE0/hZLYoyEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(86362001)(38100700002)(316002)(2906002)(8936002)(66946007)(6666004)(8676002)(36756003)(1076003)(83380400001)(38350700002)(66556008)(66476007)(478600001)(186003)(4326008)(26005)(5660300002)(2616005)(52116002)(103116003)(956004)(6512007)(6486002)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bm2BcZLY2wrwb4BVLwx0QWu4lf0zG0kXvk7sX0Y/oVJgAXSLyEIR7G79w+Aw?=
 =?us-ascii?Q?CSwI1vQCHzSWtXOPV+r3gvmYUXjPZJ0mijZY3Zj9qgOk0bpgPliladep+e8y?=
 =?us-ascii?Q?4pVIJjRGnkJ2ZMw/JAA/WF3oszlGcPYF7Y7YLdTvVFFlRo7VPjTQ1jpzTgSQ?=
 =?us-ascii?Q?ee17GtcRjgEYxXi0NFOKf+tgmrSdQPyJPqw25JiHeMxmEM+8IRdyTwLASk4q?=
 =?us-ascii?Q?F1d/fAqoG1nnOmX0FzXo/ba8QkXOc9AqH86tnPursiWxQYslEKaM0Bx0U2EP?=
 =?us-ascii?Q?fPo0fU3LZAFqD8zyiTJ42m4Ouu24gVQN1Zy2hwRGid044j/BysZibs5w/5l8?=
 =?us-ascii?Q?7GQC6LZiw050mzp3fYvBoRqaV+g97No7K16/mOmfq7LcfBCqGUh/HNc79i2X?=
 =?us-ascii?Q?dmoakFE6bqZJasiZ2KzLouNzE4KIGuF6ayfZD6EDaJfl+6v4H2+2Xq6SXxr8?=
 =?us-ascii?Q?AVUTO4crAXREjBfzetMfKEkBtxNwPxEUOLkeebcb9qPXYeUnxutqy/LwCTkZ?=
 =?us-ascii?Q?M76GXTEwjw43wWPVjBW0LVLoe2zhspM55/CVmS7E+Mmdof/0vmrKSASDANd6?=
 =?us-ascii?Q?JwRH338tjl4p3yjzmIGwD3XMVpEVWg4I4+SIG7xoSxHd4DmqhC65ALM+IW70?=
 =?us-ascii?Q?vnF/AOm/8QJWH0vhQhf9VNJtm5LQbyha0RikZNAx24aRPdmBtj2yvCjsew+T?=
 =?us-ascii?Q?EhJOg7gA0m7ophOdbJWJwK4ZszUHB14JejB4d3YLguxCYNpUtep1v7mk+X57?=
 =?us-ascii?Q?WolQA6LNQyi9CkeAwtzrs/sW6TlkMk/sCQZTXdG2oWg5onh7bboDQYLqwBwV?=
 =?us-ascii?Q?q7eulyKnOvrwlbMs2rkRdT1NFjVtlqu54oLMLuLi2ayrfJ8O6zvHkcwZG8UF?=
 =?us-ascii?Q?MWAcOCO13slBbXBILpVhJNr2svGM9aTzzM8hFyoL0IAXKV0LTnJwTQMq6xOR?=
 =?us-ascii?Q?MgqnvWCdjIdGGPI7FhqW9sDMxIctfQiJ8vSrRI6WEtctbBF82xzUYifJeKYD?=
 =?us-ascii?Q?dykU3I8Tk0x9+FWIKx30WuQgPgUVLP0BLd1yH2gjfZ17V3ImWWfQ0MTQ3aYA?=
 =?us-ascii?Q?Ydf4BetG73Gn++WTdYbUvrOsX83p3gKEzWjS3GxroWnt6BwVwIxUEKXaqzuu?=
 =?us-ascii?Q?SKafsDs1wva0lqhQxa7ggfITVRh98Ez9c7m/ArfbacxqWp/AdUY38kgoHS0F?=
 =?us-ascii?Q?WKs0wOxbzOTW+8CkULEUJaHZ0FXwqe44Bg9NZeJPea1l0rcXmydr8/pLfwYZ?=
 =?us-ascii?Q?rbosLcaJfwS1GcQWUK2cdCuydKtAEs6mT3pV8LZOELmP25YZT70BYOjD2Ong?=
 =?us-ascii?Q?JaGL0j97hxaawfgx3DwhxI1O?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ad0130-7a70-4b09-51cf-08d976d89c7f
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 17:04:56.2897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rQA94qNLGtUcpR7dEZqQfVy+ferUCdephVP03dHaXb/aNM8lDSwat0JmNdo3T217uAju3zawzkkRRuurPaEZ6M77AZuBRFZJfE8ahg/4AE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5928
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

A common clock framework device driver for the Renesas 8T49N241 universal
frequency translator.

Changes in v6:
 * Rebase on v5.15-rc1
 * Ensure Rob's Reviewed-by tag is included
Changes in v5:
 * Rebase on v5.14-rc2
 * Move driver files from clk/renesas to clk
Changes in v4:
 * Add vendor prefix to dt binding compatible property
 * Remove clock-names description in dt binding
 * Remove redundant 'input-' prefix on clock names
 * Clarify the settings property in dt binding, add data type
 * Fix define spacing
Changes in v3:
 * Clarify settings property in device tree bindings schema is optional
Changes in v2:
 * Correct missing semicolon in 8t49n24x-core.c

Alex Helms (2):
  dt-bindings: Add binding for Renesas 8T49N241
  clk: Add ccf driver for Renesas 8T49N241

 .../bindings/clock/renesas,8t49n241.yaml      | 190 ++++
 MAINTAINERS                                   |   7 +
 drivers/clk/8t49n24x-core.c                   | 836 ++++++++++++++++++
 drivers/clk/8t49n24x-core.h                   | 250 ++++++
 drivers/clk/8t49n24x.c                        | 572 ++++++++++++
 drivers/clk/Kconfig                           |  21 +
 drivers/clk/Makefile                          |   2 +
 7 files changed, 1878 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
 create mode 100644 drivers/clk/8t49n24x-core.c
 create mode 100644 drivers/clk/8t49n24x-core.h
 create mode 100644 drivers/clk/8t49n24x.c


base-commit: 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f
-- 
2.30.2

