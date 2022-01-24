Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC84349772D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jan 2022 03:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbiAXCMF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 23 Jan 2022 21:12:05 -0500
Received: from mail-os0jpn01on2111.outbound.protection.outlook.com ([40.107.113.111]:11072
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240741AbiAXCME (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 21:12:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xo7ATXE4XmCBAqJl3eGA9GzI/ieFWYm4g3mfFUc/81KpvFedgUh4rS+ZET/Gf2QPK7AGjWqSviWc8ixC7tIeCI+KBD1zA7to+JfMQAbl9bJweyBvL9i9/p8+q23M3Or5Wv3jgwu18VDc/mdXdnSyCTe0nUJ3PrWOdZ+AUEWY041lhoX12dPhQWRC+ftPvpyrcNQl1UfYumOJwpNdswDwfl6YBaEJY1w212PUL8omMAPYaak6jncROlhSetusNEXVYK8qVyL4epTNGqJ+5KZac4W/Gi6r/j/+JTex3jSiwawTZmOuWMbo03fNRATDCNhxUdsWYchf2FImzwJSUANUsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KceWP6hb7Ig1NFaymmDY1vKMMnyNmTk8SnoIoZhnr0=;
 b=HJPaZu74QCdUtR4gxAGsguybKELa1v3Km/6yXSBEbX18Ds7kXMwLdwILJhZSS6qf6EiorT8r5dHWcT6lZN4sGjVEwXGkReizSvipq5SkPjJ0K0ibHPrC5kmR2gojtGXUgoRJj/95PDxJiOi2LwIvPhDXF3HVorvDnW6nkgkwqHJr2KJYXpk5N44RN9r1z6o4MXZpKDEm36MGylGvQziMiZ4SgAbMeK3O7CaFM6CM5mTJ0GzKOZ+T3/omuPdhVOylizZ064XzjFgF0pxtABOjIc+fC/PvuMRi8JFQ11wNYwo5K+71XSto2Cy+8dUkSdlAJ0zJ/tE44c+1i4w5LFiqVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KceWP6hb7Ig1NFaymmDY1vKMMnyNmTk8SnoIoZhnr0=;
 b=POsxovTtDbOL6+qtISnikq6q4OiZzkcu0Uwv4P1WqzTjQdbNsKrB7ykqMme54ZjvB6uhmjFm7T1heUZse3qDEllffaQx8Uc/bwoAfa1jEv31uFnTnN6JszE6qwsUm+HO9JDf1xT7dBK04NzksZxsuCQSpgk4ARrJegDUmK/FZYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6657.jpnprd01.prod.outlook.com (2603:1096:604:10b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Mon, 24 Jan
 2022 02:12:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b1eb:2ee8:fb39:e48c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b1eb:2ee8:fb39:e48c%8]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 02:12:00 +0000
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/3] arm64: renesas: defconfig: Enable Audio Graph Card2 driver
Date:   Mon, 24 Jan 2022 11:11:42 +0900
Message-Id: <20220124021142.224592-4-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124021142.224592-1-kuninori.morimoto.gx@renesas.com>
References: <20220124021142.224592-1-kuninori.morimoto.gx@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:404:a::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4c62490-1482-48e1-d09d-08d9dedee78f
X-MS-TrafficTypeDiagnostic: OS3PR01MB6657:EE_
X-Microsoft-Antispam-PRVS: <OS3PR01MB6657E7E3721C7013C5D2E043D45E9@OS3PR01MB6657.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:101;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hEGwMnQgRO51nvNyCLFM4N7Ro5UuwsRO94aHKzefV0zB2p05wiuU+qYeF2PTRY+M2poaRQ9i/lSeqZdngR6Lq+EX/wsDeHXHXj++zxWV1uK4HX9RddUTws4EPkLBvKiaSA/CJi8QtNptRx/qff9xOLNqRago/0aqxzaXpqeMZFs1bAW2V6VIWUh1HG/3jpWOfnecyHB4m2qEzznR2RaDilP1/hwcXXTD8h6zU/yzUFGgbTMxRlC3mxD9F+0O+CN+yf+i2wjviYBEMjlm5g9W/gFDCk1zKCcInxOuOzLZIKKkWpIrZtFbAthQX/bkA4vQGuU2EEyAGNZoJ05U/OoFaYNQmbQno1P5h9IxZbQ2QYsIUHV85r/zCt04zjWBCTEO02QP+SYWjjk3FJ2AO7QJQvvIr69Sz/nvF5viUcuIe3ruCJqVawfjxGo+A+Hoc3OiNJNGZ2OOXpvaD5IpvPPtXX58n4ZWnuBW4n/N1iPjCO4b+KlrkT0Cg3PLzR+DdvUIjL5kJDj1Kdu7aXiSe0PLmZ8/6HRbL5r1tJjBKuHdI3+HaXh7g0nL2cjF+fq7bbXRgvjFZYBQ5NHcc+WuerIbu/u8HjXePdwDHU1FEuz7vPG6aqiwO3mCmSzdvTSjMqS2nNP7BdwUygCc3Slo6drcFO75TM8Jbz1+WR0fYYzOjc8SRyzHsSa1PhROdZGI4Uwzsg7c+0bEPYadpzabTYXnnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2616005)(4744005)(5660300002)(36756003)(8936002)(38100700002)(66946007)(66556008)(8676002)(38350700002)(316002)(6506007)(4326008)(1076003)(107886003)(2906002)(52116002)(86362001)(103116003)(508600001)(6666004)(26005)(6486002)(66476007)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LLgh/J01TtyhGyDh65FGuYEsAGRBWO1EpoKHeO3C6AJoZMkF45lfe+VOEVJr?=
 =?us-ascii?Q?TKXI0bkhfPV+bgQjEvDsJMJNJJiYuNvL5U6KG4/N/KqXBAjDVvD4mpdF1P8I?=
 =?us-ascii?Q?PpA+XrTdJWJVGdvfifBbfJ6EFuJXygmwpqmQYfPhJJaWPZwO86OTi5ViP+1Q?=
 =?us-ascii?Q?sYs7p7WA72UW0+Syj1yKtijKrSS5oSH8MYHbGvjlfGBQezeZQJjDHxZCRMfD?=
 =?us-ascii?Q?C6pSw3mxDKm7Y4O68hJC2bgvLp4PogC1+9MQdRcUh2EPJ70CyB8CWx9+VbvX?=
 =?us-ascii?Q?qrWVVzoTIO2liBAHRicbhrXFVqePD2qEMnAc2FtO2YYiYIHSkt0UCcoU2WkL?=
 =?us-ascii?Q?bgduwkSKEDcMxSMpMiCkdnH9qx0Kcb8BDOuwgPX1289fSivR26U/EFlV2QSx?=
 =?us-ascii?Q?A44Pf/QofPBSvWzBYVSc5HW/44iD9E+At6gPtf7mU0kB/dIV80vXNca9I3TI?=
 =?us-ascii?Q?k6G07azzXMpUQfjjdrP0P2+eH1Rkjkc8g2gmdQrlj+R4LN3s9w7OyDXGxBsC?=
 =?us-ascii?Q?t8I4lJ//lQkkNefwiZj6GQDM7h8EuuVVUVbpoGaowU4IiXboUPhDwcDskDY6?=
 =?us-ascii?Q?xaFT7/VLPv3R2PlBNkSXd3G37wkPeBebM5u3KZ5YBMj1tYh8HDOzo2UPRs3C?=
 =?us-ascii?Q?uwwd4l9brKhIVGgYwWOd9VhcdNEl9xdCTBjM/CQQ6fN1VsP+C+pggSEFEC1z?=
 =?us-ascii?Q?cXcdGP3s6jNQzkqy6RNzfC8Zs0bJV79qZC3iPNgdig3/Ew/IHwIaQIZ5KgX1?=
 =?us-ascii?Q?RXA7lFtqYPzCEmlqKwcncHMOnFa0XISrL0VSVSNYmCLI0x+przG+THZF7JTQ?=
 =?us-ascii?Q?GozsBmQBoqoaF0nssZ35G6diUReG/W3l1+pcyVmZhMBGO1P+fKPKZbQ5RTH9?=
 =?us-ascii?Q?ZRR8fBzeM3XmZzK2wJ+wEr6xVmoNgSjk3yC9lSH8H9waQ58Lb8gQKFIdjl2Y?=
 =?us-ascii?Q?64ti6S4rXzsto280ID/1Wqtig8N7AW6qAIg3+y10C8DZYm3xKk6164g7vEZO?=
 =?us-ascii?Q?EQeqpgS4yzEc0Uyizx/wUIk4IiO+1awMAk2QVv/L7uokUTiCSl94Eho2AWr+?=
 =?us-ascii?Q?0oZpKT/qMaqzb1p79Xj+uEgBUrpSBy5o4QjaqWh+OrigTAP6th3UpP6T198J?=
 =?us-ascii?Q?zTbrVlqhyZJkKLejEEGnXhW9G0cMbQdCwDBAAdlDDxxnUW7ytpDQiiAWfqU/?=
 =?us-ascii?Q?WvncRsaOJWb56UIfTaV1zhHnGwveOAN1NJOqK6Bsp0dY6EBH5kxcZbOiuIYw?=
 =?us-ascii?Q?kZLJ3+LlzNIoT1NCXSiIk/QJCCBlsLpd/eVeshcNa/cOCxZV9ydVbvc+bDl7?=
 =?us-ascii?Q?iRALxsGa6IfSAAYlZ1RtEWyPGhDYjvckuTPiwwaY5ykROF1cVVKEnPhDxbXt?=
 =?us-ascii?Q?3gG0zwb+ZjKX2pIbI4t0XCbe2hiotj96kgBt5melnPlMsV9cDxldQgDYsfWH?=
 =?us-ascii?Q?W+XfpZ4mqXXyzbdiw4+UGmFU9iY2Fh9UXOm9aBOcWt6jNLpfLz0MYM5aScrT?=
 =?us-ascii?Q?QpSGjWVodeaXPQ67VTJc73AxzVNamx+93kmu6dkiA7zx5dRbR5FY3J3JG6os?=
 =?us-ascii?Q?0xRvWD49CauxzaWQ0pnTL4YuOoeJfEcqfRMGpZzUvMO+Och7tSRtIgwTMsZi?=
 =?us-ascii?Q?ONVmJYKWsxPEa7jtY04/sDj6kohh0JIWCjCK5DYB6e6OLJDQ7DyCR5JuEQxl?=
 =?us-ascii?Q?Gj9mLwPNUhlDtCyYAJ+/cyVaer4s487fWS98ZRd5ZiqUxdeT1yUjhlkElAoz?=
 =?us-ascii?Q?DuG6Sz4r/A=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c62490-1482-48e1-d09d-08d9dedee78f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 02:11:59.9797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ysyvoruWvaO4RUxlPO6N5LZ4UuEdlm5BLbCsDgAuSA1pyUuM8MAEIJg/Rs5LZpk0ai9HrGeGV6nUjR0rRY4J+Veuvvwruye8ojGsulysnjEI15GpXfZnSVqZM8xn/H7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6657
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

commit 6e5f68fe3f2d35 ("ASoC: add Audio Graph Card2 driver")
added new Audio Graph Card2 driver which can handle
sound card more flexibly.
This patch enables it on defconfig.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 64aecc9d3306..8313526a1953 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -270,6 +270,7 @@ CONFIG_SND_SOC_PCM3168A_I2C=y
 CONFIG_SND_SOC_WM8978=y
 CONFIG_SND_SIMPLE_CARD=y
 CONFIG_SND_AUDIO_GRAPH_CARD=y
+CONFIG_SND_AUDIO_GRAPH_CARD2=y
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
-- 
2.25.1

