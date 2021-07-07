Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FDB3BEEAA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jul 2021 20:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbhGGSaz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Jul 2021 14:30:55 -0400
Received: from mail-eopbgr1400133.outbound.protection.outlook.com ([40.107.140.133]:57956
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229975AbhGGSaz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Jul 2021 14:30:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0hgaZXV/OG10XkhC4M1Q7aoHkEGT0BkJrNmb3lw1HNsjAGGxzBZCmsqBATCLV8hcwS0Cibbx8PYa1KITVRcAj5qy4IpOkLqqCiD+qoKA+rTeMLxTAnigEJO0h+qNfRrePOxSkU9G90EezY01L0Fod0TvnuKKr78UeIBRiug7AlfqLGC+RAoHDWE+fv1sSq4GaTaMVP00XuWioO16mvxmu4he7f6l6xwZbqs3k9eXX4Gsj9DJdzlyMvJdoUw85izdvEUqasI0OBjuiZUOPO7ZrLkzGi1KlV48EABEYEjxW802u3zqMGraC1XAAlY08Jj/QGk1Lq89weUq8p4xjeo8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83DuPl+Vw64/H0k+34TTo5j1OKwgdXK0IVwA5B9QAUQ=;
 b=Fsgk7u+hoJv9uNbnE31TBuXjSL0GvAJRAvpz0CqEi6RVFBHCadg7GlkokrptB0z+qzUni5ySU93+dGde9Y1Sd10VuDgkyouuD44k8coC/WiJKIxECb8rwJ1VIBli5KeRHC8iMiVSLhX0O6BLyHgmAONPHiaBNb22pZABDxOJpO3LCPhHm2Q+nQJ0y5PhkV/gQCURihUqPn0EQqgLuFz9rOkuMlMtU42QHdL4WA0mJKd+2lTEhDEyJMfX7r1rhjpCBXCF1qe9iniDmio1/atz1us1BZFNEVGnrlumV4fsm81vkGMg5nnv3PKoetyMfacBYtnLowM9drkIeIJE3IUDNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83DuPl+Vw64/H0k+34TTo5j1OKwgdXK0IVwA5B9QAUQ=;
 b=l2Edbx85+rtCQdB9GSRtKHMVC0TpI6kX1+EIp9Oyep+Zs8RPXEBUmd3vooj313hpqLLFMpO5iy32fT2IoKVdzwHwzb+eJ9FSwfvjtBOEM5dZbQfx5H8QJEaF9eimjX3tllM0rsiR+2uc1pHHeo/mOUNuhk/CRPHUaXYahN3yhkk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OS3PR01MB5847.jpnprd01.prod.outlook.com (2603:1096:604:b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 18:28:12 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4%7]) with mapi id 15.20.4308.021; Wed, 7 Jul 2021
 18:28:11 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
Subject: [PATCH v3 0/2] Renesas 8T49N241 device driver
Date:   Wed,  7 Jul 2021 11:26:57 -0700
Message-Id: <20210707182659.20548-1-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0045.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::22) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from az-ahelms.na.ads.idt.com (68.225.135.226) by BYAPR06CA0045.namprd06.prod.outlook.com (2603:10b6:a03:14b::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 18:28:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d93afdc9-aadf-4120-e79b-08d94174f982
X-MS-TrafficTypeDiagnostic: OS3PR01MB5847:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OS3PR01MB58473727CD041F04FD4C26A8C81A9@OS3PR01MB5847.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cz1UMab0QPDBtp844vUBdEf+skdNbEpPur3kgTE+5RKd/1sgNyZ0+qs1swnvKWl71gO66yJzKZeW5oPuH4q5m5NFlHVsjPWWAuABBgSzz1mf7JAkBB6n7sBqxPIQjIyFAW+0T2rZ2pVj5aJ6NWqHgzNa7c27s5nwwLJ3qjM0AiNoXFcPnA1yBQ+mb+s2lmCLyu+uBUCdXwfhDj0lbiID8m1t8/XWSzYGKQhoErFZiM9pGLXAzJAxp3s8CcxxdbRSfA3kD4EFljaN4dFcKVW78UFi9VyMJwv19tEvbRLj57e7/B+qenCwFp6BbD8ZkbSHBCWVimab0U2KcsD+EiIXGBx4My3039rUSuO/OIdaafRMi1kSsSS/45mBqiA6FIIidza8v5KCN5JqI4mefE6F1KY4sege/qiwcDyTyNDDEqbXD7bxjw1fmK120Lx+8zrIfqfbIonBZ0VOhEUSD8IZRgwgSQB6Cf1GLV/9QD0wBSdxKwPgtX2UWZtYRT4J2xVAqJKKfdXG/Zxhhu/4sbHe6JqZpcABaLPlH6nv7R3f1VWXUWwYt8API9Bsef0vVnlTPdwNqH+eKphcXog7Lo+EMxXzheq/+jVxA73Luls9/YTEFzPRz4Br23fDE6STCrRHNaHXNupHUnMnc2udJcMCeXKEAe2AeRT+5XfOorZj8u80iAEQj/rpgZvJsGslIQQy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39830400003)(396003)(6506007)(66476007)(2616005)(103116003)(8676002)(186003)(86362001)(36756003)(4744005)(6666004)(26005)(4326008)(83380400001)(956004)(52116002)(8936002)(1076003)(478600001)(66946007)(6486002)(38100700002)(2906002)(5660300002)(66556008)(316002)(38350700002)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m7xD+HXT514wVLUMSLNDsmGCJDq2XTKfM9M6YeYa6F8jThlRaFgh2oeC6VeT?=
 =?us-ascii?Q?xKUMoCRHn77t4cbko3rz3H67nHi/WTERWuy0naT8JW8E9Vb3A47UJ8sFIaDG?=
 =?us-ascii?Q?0KlSyadvxyziOpadIQb2tzo1VioFMTVHwyxQcqx5LURIQ27XTTn2C5K91nUz?=
 =?us-ascii?Q?P1orB6EjzP73tSiyoFXDGozGLUTZEPx32ZP2MnoDUIwVh8eWIh2kHnOQJVVp?=
 =?us-ascii?Q?qMbrZs48S95FWRhvjhCeD07YNYmFfv1cKWGJkY7sj9qCu30R7yrcUllZqbjx?=
 =?us-ascii?Q?XYUJProWvp25OUdH/Z6NDllzd6nNY2TrwSzqyGu5FszklmWdgJunG86ks3ih?=
 =?us-ascii?Q?90P6B0IQdjOxaUnioMcozaNDCgrea2BBWAvB32hQ+QfsvXtQwl3Xv754Z/am?=
 =?us-ascii?Q?YHfXItioeskvZ7oSfkR3zB5QMAaUUaLuXLwheLt1b9qoR4kd76STx3KwyDIi?=
 =?us-ascii?Q?LDIdtdH23fouy/qSWg8BL6PQzTIoN8azCCVO8Rqz4Ffo/kgNloIw9soVFVor?=
 =?us-ascii?Q?/fqmtgzU8Im2M6J4QXOfNp8OIK0YFRYEcbdMb3zq7oBu7DmZ/sTyON/OEyMO?=
 =?us-ascii?Q?DSaA3n+trKFIFQLpyfc9Ner33dWKhE1yB1jnkwBd7OHUTy8EZABZb7HmCgsI?=
 =?us-ascii?Q?iFfX8RcncfgPnuXA61smT0Crd5Dji/4eCx2SzYL5K6VcMVQsBHWgyod/LBOU?=
 =?us-ascii?Q?WxMUOJbFat/A3VTOktkuRnrmz8sYLsHnpATH2O6y0u++sRCqW7FGQHB84utv?=
 =?us-ascii?Q?fQDcH1aO6Xm49qmQ1CVA9ziV9zemaShGSoV7rn1XuBm5IA+3EZOD7dc/a2Qw?=
 =?us-ascii?Q?kGGFCbu8dU6/3fYTpQu7usjl8uh532zRZqukSVZ6pZkfD2rUMg++hFMG9KQU?=
 =?us-ascii?Q?NMY0mB1yoMzeZPvsyMR9asiYtrwXor8ejuebJ+BP2oGs9WDimnBjrm2u7QI0?=
 =?us-ascii?Q?lf1kJLWiorDKxtMGH4jiUGC/PJ6YTLIIzoHqRwBIP4Lp3Kj/q6L52nuZse9W?=
 =?us-ascii?Q?m1DbfLbNoGfJMj8OeBWj3RR78H1s0SbSR9bPkmzfRCDrm51aYo6Vrf1jq0XH?=
 =?us-ascii?Q?uyT5nqIJIQYYRkouKAYsIiw5PztEJ+/ucbDjDoxNfnkG00tEeQz+5ZWq4qIx?=
 =?us-ascii?Q?YJzGv5dqIETc0SsLg5Vf8OxFHuU/TVCVR7TxNqf6s/HSkYZd0xbfHiS8+00a?=
 =?us-ascii?Q?amvit5wvb5h582C7li60C6PEb88E/E6Zsc6Z8rCss58msQnZ9KIXrxzUy5WW?=
 =?us-ascii?Q?3+eQyCWFYPoux8233txjrD/c0yRnDNVpGnPvcIGa2o8/LH9GirOPc5XItPnK?=
 =?us-ascii?Q?ktsqY/nt+OYHVaVoldd/iszk?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93afdc9-aadf-4120-e79b-08d94174f982
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 18:28:11.1241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruNVoIAp9VGdJj9bokB3r2pwKT6qHpOymWdlrvMfWSsdzWP1iRJMGCRWAfyGbiBkS0r3nSM7psvCdgcwuXefZGq+/Mbj4oXWxR3KLRJCdr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5847
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

A common clock framework device driver for the Renesas 8T49N241 universal
frequency translator.

Changes in v3:
 * Clarify settings property in device tree bindings schema is optional
Changes in v2:
 * Correct missing semicolon in 8t49n24x-core.c

Alex Helms (2):
  dt-bindings: Add binding for Renesas 8T49N241
  clk: Add ccf driver for Renesas 8T49N241

 .../bindings/clock/renesas,8t49n241.yaml      | 188 ++++
 MAINTAINERS                                   |   7 +
 drivers/clk/Kconfig                           |  21 +
 drivers/clk/renesas/8t49n24x-core.c           | 836 ++++++++++++++++++
 drivers/clk/renesas/8t49n24x-core.h           | 251 ++++++
 drivers/clk/renesas/8t49n24x.c                | 573 ++++++++++++
 drivers/clk/renesas/Makefile                  |   4 +
 7 files changed, 1880 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
 create mode 100644 drivers/clk/renesas/8t49n24x-core.c
 create mode 100644 drivers/clk/renesas/8t49n24x-core.h
 create mode 100644 drivers/clk/renesas/8t49n24x.c


base-commit: 62fb9874f5da54fdb243003b386128037319b219
-- 
2.30.2

