Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2183C791D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 23:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235708AbhGMVom (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 17:44:42 -0400
Received: from mail-eopbgr1410134.outbound.protection.outlook.com ([40.107.141.134]:35925
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234947AbhGMVom (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 17:44:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2wbaqXwPePBHRxYF0ztRbw4czEq0sZNDOxetJd2Fe3Lx3YFc4bSoiFrmzm7F/KqrXAdzLKdTqNq/QOzTTOBv2/0R9hkjLYhRWfFCjpC8vTtZNZLZkEOVQAxwoxirdnyZN9G832xS/llYV5QOCIPB+lebobYlI8KUSOeg6xId6vJBPaUXW2QAJo0/9Re9eHsrcZ0neDbBOAYpX1TslljVn6cMkXtCnWkeB+jp4qV4YPe8GwRS4LaCnB6VaRH5kzbo1zNHv/ED8CvDBFjGqq2G1Xjyio3iGf6WyoOg1gYhxdoJAZyP6BOI8CT2aqvc5VaVPL4caZdugW3Pn1JEmmsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rM/2JJ4BIuZRY1ZNjJaE5ABiexcRT1tqdOq+3yN+Z5A=;
 b=KJYVOUTpVAIAA6Hw93FZl1d106XEimWGVJvnxS7VZ7u6y0tSggpqp03UzfjOLhAhtk/zZ3xipI7Gx3lToYK7XRkUEaPnkOI+Cx9sjAM4eU3tf5SOv5b+CsGtdBvDvtbDr82nKyPxNBZoR6scaelrX0BzcUc9VYVqZv5HPpzSge2eccYuXwvRd5RgTpMPbvfTJTPuIuat304LrfJsp54lLRjL9sLvx8KmDWJQ+toLdZkarP59+/2BnOjUmtLFpQ2HZEMR7JF30JHLjt6G4u+DqlFWWL1pcW44IxcHFCfLPORDOjxznRsqin/A875KjQKA06nUf+eUXmMKMCM7krx3GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rM/2JJ4BIuZRY1ZNjJaE5ABiexcRT1tqdOq+3yN+Z5A=;
 b=n3Q/DMBNzSnUKBQJ1dTKwb/xQNFIM9dj3Ufr2V4T+bmVV5w7YGgow3TJZ3xnNKTz6JkqPAQ88UMoKwFLYl4Ny6i9TBEWYwmHPGfQYMb0yngn92NsQaLv2i5sdCQU4nVT786cqOqc/IzC/oWcQ4r8SyVI8qLTI041z2qkJ7vgKjQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=renesas.com;
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com (2603:1096:604:5b::23)
 by OSBPR01MB3576.jpnprd01.prod.outlook.com (2603:1096:604:4d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Tue, 13 Jul
 2021 21:41:48 +0000
Received: from OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4]) by OSAPR01MB3892.jpnprd01.prod.outlook.com
 ([fe80::e1ee:a98a:2ba3:aee4%7]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 21:41:47 +0000
From:   Alex Helms <alexander.helms.jy@renesas.com>
To:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
Subject: [PATCH v4 0/2] Renesas 8T49N241 device driver
Date:   Tue, 13 Jul 2021 14:41:24 -0700
Message-Id: <20210713214126.2278-1-alexander.helms.jy@renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0080.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::21) To OSAPR01MB3892.jpnprd01.prod.outlook.com
 (2603:1096:604:5b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from az-ahelms.na.ads.idt.com (68.225.135.226) by BYAPR07CA0080.namprd07.prod.outlook.com (2603:10b6:a03:12b::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 21:41:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a6a471d-9da5-4421-a3cf-08d94647042b
X-MS-TrafficTypeDiagnostic: OSBPR01MB3576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <OSBPR01MB357632BBA75B260AA4DBF1A0C8149@OSBPR01MB3576.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y/IDzaNu96MkKbWO3q92WY1HjauAL6qFY/HCeqw17Kb5OHSnwzltSkIAVZikD8IGxUtQQJlIbFzHwziFb+XGMjKBM0en2E9g5ORO0ppMDhEWS033JHkJIdG21EtXutX7VlU8w33KuM02mwcFc6Llj/VpZ/ytqXtFGktgH/1h7oAMbY4BMiHFtF/IbPIB9Jny9qfCIy+yQXMb/2XpECk5s0gJ/BjutoQ8q0d/HXZwYU68g4I1wc5DN3NUrhbMsQNlyxhW4wa68xtfvsw7XM/ALKcLHt13twlT9Ff+NEc3B0/xKH6nXV5mVj0C9v59R8lpw5VPZLblqltFirEYDVEqcsQWG+z5FwDtr1HPqejUyXiIVNuzSYEEN59IR97v9bySSlMwXoNe24HSLI/g/INhpsCNnauYf67UDZPTMdey2ttf5KNh5QW8723Ul4avQsb0QOp/Lf7u1mk3RjHcvtb/FunYeTYz6n0Tx+Do+otq3ugZEerGRstvAQGNG67WBp09zfcUMaqzOUAn6/LSwBN7qsedE+My2IbiWk6wnO6KHKSQn4VcdLqP6lwmz+9JY2Kli2d4Typ7Vaeu+NrGvpq2MwhFZ+80yf/tc0aNpC2ZRSAmVtK4hoY210cPXdzcBtpk8a6upN5YXXLrCAzZ8A8hNCi9ZrkNSunkuHbt8BprcM/nFGvCPCDkH8wJHpwCw+VP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3892.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(478600001)(38100700002)(2906002)(2616005)(6666004)(6506007)(6512007)(6486002)(1076003)(103116003)(8676002)(186003)(4326008)(36756003)(38350700002)(86362001)(956004)(5660300002)(26005)(52116002)(8936002)(66556008)(316002)(83380400001)(66476007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gZEKo/EIE/is1imqWSKj52N3GF5coX0Mw0Kr2KP07LIpb7wrP+5dQD7FdOTl?=
 =?us-ascii?Q?/cEBFlnLpT5wu0AC5MkxJWkrFiqV8gOIlZE69nLw/DZB/xdSZD9MkPmb7+GB?=
 =?us-ascii?Q?6S9DffEwWzZuLVhKgH5vbxfvPJAP0skF6/1fsE51AE561memFabXx5qCr7lu?=
 =?us-ascii?Q?3PBCBIcpGq233swhH6g9NXv+5/ygbFyCs/P2wB6EUyEgu3HqUCP4qVMptcfU?=
 =?us-ascii?Q?1AiPSC5Go20cHsqblEKGsf3ZxcvcifP3MPEOGLFVZHQlPvUtlkOyIAx6cten?=
 =?us-ascii?Q?gp+0kusDDlbUiCiXMXpQJNZZ/SL10H9uLYRKWIEfsdElkdW/8Kh8y+IS817s?=
 =?us-ascii?Q?XvIdAe5xzop3OpTF3qvepbTNvmyhtKw/+jw4Cvw2w2dPC/vsaFhS9vyHJcli?=
 =?us-ascii?Q?lqkzYVaZdK8HguXqhm0vA6Sm9YlwxnvjeQ4kIboU+01XA1H7qGsKWATER7mL?=
 =?us-ascii?Q?Hgz240bRoS0YRC7uXmQ4dnEP/kmJ6Ra1G2EhiySsArQUu7UcJV7ndCOtkt7/?=
 =?us-ascii?Q?GcrMOYmnmCEtEx146MuR/Lzte+AwJnNsENKqzUUs2gNgdMcUYMIij+VKUf2A?=
 =?us-ascii?Q?DQ6KtCwcfHwoBzfOofzf7JxVyTuNNhxIUHdLwtZbWCduY6t2MszTw3m5mt+g?=
 =?us-ascii?Q?TOqVtQWDU6TAmqGZ35fkREdjRavflkhUUdMzcJbIFHe/V5MJMbIJGyhyqmCP?=
 =?us-ascii?Q?9GLEph6vk6GrVUzRxR17JMzNrSyIufhJXYJbq3YSLUovX7m2OSFbd6YHugFm?=
 =?us-ascii?Q?ORLFGZlgQAtOQo/Eu6WMbXFpu4b4BW/rrZU5iWwGPt54D/MgHzlRj7mBcwH2?=
 =?us-ascii?Q?dQFxmqEDtRcRRRo2B3lg4IYm0yQti2iRkKbV/BA3XMEzXay9xm/Jzhraze6K?=
 =?us-ascii?Q?aPbJXplaipYqUa7bcJPLUdQkZ1gGvV2DHEemU12EvZZGSbPoCkIARNRT5csU?=
 =?us-ascii?Q?M6MfUWIgPKeseHA5wp0hXzvXhet0S3nMFQ+/Ki7hJnmnUhL9O1kCyWAKvN1t?=
 =?us-ascii?Q?j0FfWCvPC3+LqjU0UhUUny7DidNpD8R8vZlpOS++H+DIMshdwZZdY/wBWoj7?=
 =?us-ascii?Q?X/MjxpXylqpb+18qVmJjCJ/eLhxqtlHmcqHctAjSvZm1M/VwMTti4UGdq447?=
 =?us-ascii?Q?WAjdFo4hhEVsBH57xMNAqALOTlVASuAWA2frPUBnTcrBTucyaCgRt/u76y3T?=
 =?us-ascii?Q?pGOHF3vsBU2Z1WGX4aj/hvv5zT1xMVyVVXcwYQC1kzIzR2Ah+vt62kzr81iI?=
 =?us-ascii?Q?pI6/Lae5NgRHZ0EtEXPTjcdLPh82IiOYXyCuSVy3LIKVBRSYQjR5/pDf8eZ8?=
 =?us-ascii?Q?A/keJaufvBOGpR369Y4Z1Nbf?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6a471d-9da5-4421-a3cf-08d94647042b
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 21:41:47.8625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjOL/4g72Ts80URc6vEC481NBx9dNEHTOwV74PUyB/BWbIbJItNaVmMIQtrIeUmpoNCTXaaN7ZXu9uuS7ZJ0CdkHRLdV9319WCtZYyzAkdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3576
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

A common clock framework device driver for the Renesas 8T49N241 universal
frequency translator.

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
 drivers/clk/Kconfig                           |  21 +
 drivers/clk/renesas/8t49n24x-core.c           | 836 ++++++++++++++++++
 drivers/clk/renesas/8t49n24x-core.h           | 250 ++++++
 drivers/clk/renesas/8t49n24x.c                | 572 ++++++++++++
 drivers/clk/renesas/Makefile                  |   4 +
 7 files changed, 1880 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
 create mode 100644 drivers/clk/renesas/8t49n24x-core.c
 create mode 100644 drivers/clk/renesas/8t49n24x-core.h
 create mode 100644 drivers/clk/renesas/8t49n24x.c


base-commit: 62fb9874f5da54fdb243003b386128037319b219
-- 
2.30.2

