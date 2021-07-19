Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573FD3CED36
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 22:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351904AbhGSRs4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 13:48:56 -0400
Received: from mail-eopbgr1400134.outbound.protection.outlook.com ([40.107.140.134]:37952
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1376678AbhGSRjt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 13:39:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CU4iBPtk1HNxO6PgeF7gLfMOTdl5ljDm7ya6/IP2Z7hD42sC6oyK0+ZNqPNT5fS4qK2iw/tnZbTjQKCHlNBKCX+o+42RaBvmulzUp5jsqIxBj4Dj8ZGsi5xVwNhraHW2SuqGmMAE1OKwsR71LjeNUArESyFxvo4qBYdB3PmU302F1dJBL+kLx9yxbbsJsxzx7QitvMA9o1SCdctLN4VR2vuEzVUiLn/ft71eYzRw+Ey+nXPKVopRSCDr1E9NNOxk9QJ2Pe+iz/MfAizEuTf/gDQx4HNM3Q+7q20NpKSUR7TkLdmyL+TGt+JCOJPQXSoRrnNqQwFu5v5lxr7mfWa6qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Me9oMWmGcaun1i346nwVq/88PuvanUnfMtF+tPJzzTk=;
 b=EFMQWDP9+RYlkTSH4FaFo87J08RMmmMeNKypJExVkbWLE9ywlitIJAyLa14Gf4X+la3sbkPXZ+rmLNzN05FFkb7M4xp15ga0molaxfadP5XR3bOMhI136i7mLM/IM7gQZwh4k7zaH8tI08W+nUPgZLGkyuIT24aDZqrWsrcRElTnL4V7ZLWAUIr7rewPSGGHrgcGBxyIqYb5EfYhc2FGXHN/bAVOiSxZzTWz46OdH6X53impH0LTTieIf+CYGl6X4olJ65u8iNvLi2mjDYReg7iRCoZ1Nr4Xe7Gcr+Dowqh7OAWOmbxKei85Yu0R+1vSfN7UUFF+4Fi/OUc6MQX7Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Me9oMWmGcaun1i346nwVq/88PuvanUnfMtF+tPJzzTk=;
 b=iZvm2YOcjOL2JOim5BHrRLpJyGwuVAAHEjRSEmOfHI+emKFyoNozv5NpZsJbODbw+bSYOwhGB1Q/1gIWfUZB8BknAxZyE4TLx4h6wDAZAZCHQ5r1cVe/aDnoIoFU817oO5CkRC4j/KzyIbgQuzxtwQP87XNQOW7oGmp5Auxk2po=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OS0PR01MB5409.jpnprd01.prod.outlook.com (2603:1096:604:ab::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 18:20:25 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4%7]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 18:20:25 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
Subject: [PATCH v5 0/2] Renesas 8T49N241 device driver
Date:   Mon, 19 Jul 2021 11:19:59 -0700
Message-Id: <20210719182001.1573-1-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0020.namprd21.prod.outlook.com
 (2603:10b6:a03:114::30) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from az-ahelms.na.ads.idt.com (68.225.135.226) by BYAPR21CA0020.namprd21.prod.outlook.com (2603:10b6:a03:114::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.17 via Frontend Transport; Mon, 19 Jul 2021 18:20:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81c78c6d-53f6-4530-90e7-08d94ae1e0d3
X-MS-TrafficTypeDiagnostic: OS0PR01MB5409:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OS0PR01MB540937E4A5250B0A37B0EB69C8E19@OS0PR01MB5409.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OZ5q9BC4mZLPEn2sAThtxN+hGB7sOZeuOZaXvYqJvW/ViZZdlB2/dXdIWhMvaGjGHRC9QsHJvLYOX+N4kjro14xEXkk//jOzzWyyqt/UCF7I5YsDTqxsvjGXXbrT70SSDPFIWcbB68FAXH4/AQk6GtPS0KKSmL26+m6z+QUB4gCaIyWsIPGtUHWPwkfLe6gamXIH9Xq3f4xCvL8e5Xp9r+BdXgNx1WUdd3JlfZ514FrcJJ9KuYscJQh1MkQ6xwkNRYVPkvY2deVIAc7895GBXFZ6Sn5pegDimnFz/Y6xA+u2WI8HCTbI7kdDNHP0qYE53KANs/teVh/wKGqUsKK6OOpOAhC9Ia+kE4Z/+pmhE9JK8weZT5kdx6A41bwTbbCfps7GvSZps7/xf4pQ2PM1AOAgYdqnlBH5hsThiTpUyH6m3xxF3tQVR4vgTisk/leUJ1gv8YJJB0hi80lVuTalf6ypO+CCZVWtGvHj528x65Sfa99ZWc3+BZo7lEeKPqqWjSSQ7KXhgm7/uDO9N348Aq4tLiL5I+VR7ltxBs8NQXfhUbHqoQpwIlilOLFxQPVV+xik83SZuquaa1XhKBs4Z5kKARfXT93NSsMO9JbLe4+PdY0f9ZeQ/keIZVViz67O5HlXLjRGYEC+YQ+zHm44LivjoQP3c4NavpEEmu5YB6nFEd0/CoNRf9UScc7Vx0EkTbOMD0h/kZEYLGObXlP0/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39840400004)(5660300002)(26005)(66946007)(478600001)(6666004)(186003)(66556008)(66476007)(956004)(6486002)(2616005)(4326008)(83380400001)(8676002)(6506007)(316002)(36756003)(8936002)(52116002)(38350700002)(38100700002)(1076003)(6512007)(86362001)(103116003)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LvkmS0M6Md4ubhBdtpvRkp9+OvncE7bY1J/ZNkX0tmBL+79CQK0TcYyFNZ1Y?=
 =?us-ascii?Q?5g6bHxW1r1Za8hPxL+l9HZjTP6KF5PsZDLuDeTOAqG202ImHf0Um+l/Kjksi?=
 =?us-ascii?Q?ianYD4vWXR4iGlpPhWqpQb4WODViV0j3aD3C4cZ6W5WrEVtWxYThbotlaLqN?=
 =?us-ascii?Q?NdtsbNxzo7hUzWYHQ6T4Ntbtt9obDeBsF7LyHb57pMxDhgpIq1V3SGwvAt9I?=
 =?us-ascii?Q?QJ+kXYetAbJIt1vmWrgOnNqgxPcqQjULe2x1CkYjaERowzpzFKgNVf0ZGhgO?=
 =?us-ascii?Q?7J3x7Kv1ejsFAEnpVTH+/SBbVJAJOk7Tu49bAlbpB3sk2Tth6QUkm9oxpfdb?=
 =?us-ascii?Q?1LoSm/uho9UpSps5ZgRp1piAv6VoKNS8rGaDVQ7UXOQxygY/3NUCEqsvBM+j?=
 =?us-ascii?Q?JwI+BeXl43wzvsb3xH9ywv6s8r7tR8QwsLvChWUH8EKcfXtiPZAqxp61GRM7?=
 =?us-ascii?Q?yZXKlxAss76neRfLCqvA0bqaiCC1xHoglwR16+7+nNDKgseIzs8aP5Aufe+M?=
 =?us-ascii?Q?ayVkXwv9doCxVw9xP+u2zotBvxgTtIFhOt5PZxD0OXKblNXqxbH9khyQrarg?=
 =?us-ascii?Q?NR1XeJZ5jAHQOIaASjrzU/hp1VhxvpbrRIA3J5OBUaQVmGtL/x9fONQlND6N?=
 =?us-ascii?Q?ZqfT4Y5ZV2MmEVewyO/GsM0ZhQUWuYYprgeBfEg6YJHmp8bf5HUfQIaNRXyq?=
 =?us-ascii?Q?PAdhqoSzmIu0w/cloOvGp240FecmkyUwpLOTWVeFhcmUK/bj062NI9DqJgvT?=
 =?us-ascii?Q?mbObgi7OABwZOGBuTogls9Dzv6OJUHuCChhnNHYwVKp1MJkTFGnzqiqGImxE?=
 =?us-ascii?Q?+5O3gBxjHngdKPotmoPYKrdJw5wcbXpfNnh8VaQ3OL22RBnwDG0+jm/0EEcw?=
 =?us-ascii?Q?4BTZgz6rAO0yWTRB8mU7MEdl3pR1Vb96amUK7Pw/3eJ/+g70WkKqKXJ6I0RZ?=
 =?us-ascii?Q?/V1jDcjwErM9cZ2I0gHdA75fa5Ioh5dxMYN+SQEJBa8wrT+g3Voa8ysTwE+s?=
 =?us-ascii?Q?tBnFykJxM8+SgrzXOnF56l3jVTpHJGWIzOy94EM1oWY8mVXx9CMzfb6irUEw?=
 =?us-ascii?Q?MPY3QXWreR+wELkXC8F3gTtW2BCBK9tbjLiRYuOwTpHds7nX1Fts5hH3s8sN?=
 =?us-ascii?Q?8b6yxfKVXE7pLLIpRwXzgnMNCzBJMrz7NxkgQbjQgmfEDIkRBDcUYi8PCp3u?=
 =?us-ascii?Q?LsAE6QX3z3pVRxHcfUvbDtRt45Bl8H4Dugaoq262CFLN9rKF8OcYnx986f3F?=
 =?us-ascii?Q?nyXs5ZeWuXaWbTe4L3FMuUFTLdGXy8fojkE3Wii3XGS2hR35RW4zQ2vRhqyn?=
 =?us-ascii?Q?gF7Rz7M3anCV/svltqz5y6Sf?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c78c6d-53f6-4530-90e7-08d94ae1e0d3
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 18:20:25.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGScm6Ju8YS+ilINHs9ZYNKOlE0KNZQMXAhomnUszo44pNgI43M9gQZiJYRo2Hff1kLCpf952kMUqVy8+khI9p/CF2VvGE+jMcC1FqEGBR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5409
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

A common clock framework device driver for the Renesas 8T49N241 universal
frequency translator.

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


base-commit: 2734d6c1b1a089fb593ef6a23d4b70903526fe0c
-- 
2.30.2

