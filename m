Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 964C049772A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jan 2022 03:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240742AbiAXCMB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 23 Jan 2022 21:12:01 -0500
Received: from mail-os0jpn01on2111.outbound.protection.outlook.com ([40.107.113.111]:11072
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232200AbiAXCMB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 21:12:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLlMCyoKN71KfIWG+ZLErXnzd8BLmjJRanESD+YN0eahJ17wFgIgVQUn+Diq5BH+lQ5U0sVtqYIX3xb4n0HyqPZMDTrUua9C2S6azNm7UO3Q62VDLRXv40XYAhrLFgw0RrF9uyWgfpEI89yai9AcgzkxlO+oB0YEj7Uh1wnHxSFsIm2vNrXWNaJap6n2QlsOK14Irzfn0aoGVfq4TgkYSs8YDZSt7sTOwX5l7u28GOZCitxfCb1bgLlerqRspebpKEMDmNXmv1OCWfEambPiDGEjeg8dq81DVpVOp4cdc4GT9/KP7Uv8F9fnOXGNAh1lvxPAGSNBM5nGvFgytWw92A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cja0g5qh5HWgiW13vva1nifv+o5CGjZilaYewdr+iaU=;
 b=Du3GK0oTWivoJeKIueHYbDF+CXulgA3aSNyhHYMKafJeKn7K1xyuk8OKFsJQs82nUKWAbzlmH2T4VO0JaPouyCpKLDcw9clHVUj++Yz95pJGkq+kEcSabEDoYjIXhuHmlqD6CnNjxSAiX5Q9NZsUdjosu4HoJUACrp5XC4+w6A4Tv4bSTWePINNBxKo1D0G2P5L//af5vXmYW7DwT/2mI3hawhQyoaYotKnttWJtWHDcwaKEcansGd/2WxHutCx3jidrDJV4/OhHmxOEDH9J5t4Pb3dbsCWonfidejiskUeMeHXK3iGe4naJN0o7t7hPnLYxy3vIgEEZD3odiRTOiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cja0g5qh5HWgiW13vva1nifv+o5CGjZilaYewdr+iaU=;
 b=g4UYYerfihQF270m/U0iOokbjRmkRpsQsBg/3+t6AN8eHXPEqK/80Cv2866j9CMjrhhfEpvty5ojoOFPNEqQV8EKTeQv0sE9IuOqSYLWzn+6ObvVEMR7ufl8DzaqKTsx7BGbdjE2avQjSxvMyxVNVfVU3HITCLAKo8aF82XJGS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6657.jpnprd01.prod.outlook.com (2603:1096:604:10b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Mon, 24 Jan
 2022 02:11:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b1eb:2ee8:fb39:e48c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b1eb:2ee8:fb39:e48c%8]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 02:11:59 +0000
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/3] arm64: defconfig: Enable Audio Graph Card2 driver
Date:   Mon, 24 Jan 2022 11:11:41 +0900
Message-Id: <20220124021142.224592-3-kuninori.morimoto.gx@renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 73cf67f6-af6f-41cf-166c-08d9dedee75f
X-MS-TrafficTypeDiagnostic: OS3PR01MB6657:EE_
X-Microsoft-Antispam-PRVS: <OS3PR01MB665738CAC15E80445B27826DD45E9@OS3PR01MB6657.jpnprd01.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:54;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xEjcb3jVcTsDL12zbSwjwm4OFtI4Im0XFPsR1jOgv7KHSSHwRYCAgBQSmkhA9fEw9a66S9XQNafal91vub1b6FH3CI3QNIyrgQVoFZrQlDuEwAoNfU8hmAeqzypIUrmXHFcyQQkwht7WxMFH0kdQlQq3B2nrmMdKUbewJJp5hte8LIR1eTduTFFUoz1HKbNo7Cwa6IeoHvPZ9zNzHhQyRZV1jlyQzXgxL8fNGk+z74YrBZTe6ghI/ouQ0iGkYWtTnatHtPDML3godLYDQQNkjaRA5gRhgtwWLn/u+Cv7dPER6q9NAM1Ugw2+2nDa8QI7tf4e/boyANxCMGrRChIjSZmmxjncRhb1QxprMsPuBuotWkYTHiN69pI4eeWonopAvH45WtCV6WbBae3wcx+0tDcIz8xEX3ly7wlT2HicXYntfsFEHl1cYSSbkJKVL2l8zoEZrxXwbjb4cVCt0NqZqjPXImN1Mftep2RaCN+3B+1XfaJgZhKoiQ8yLfYMw2VnW6vsfl/PhcWhKVKSrZDdqExTUXhRovw3qM/N3jfVwdQWZ5SsmZYRTNsI+W5cUbRYyutFKXqp5w01fCOKhxqYDhHF9nD7vDzKm2AFiVlovW2tDNaBKcDkwN6bSpG9vfrPhSnFQr/knB8kWfeImariK1vmA5oH7egsCdpUwUpRG/Fpiz1K1IWxKOWT8zJROyB74bHyFaI5aad85MWdjTJkDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(2616005)(4744005)(5660300002)(36756003)(8936002)(38100700002)(66946007)(66556008)(8676002)(38350700002)(316002)(6506007)(4326008)(1076003)(107886003)(2906002)(52116002)(86362001)(103116003)(508600001)(6666004)(26005)(6486002)(66476007)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VEHlghIwrvej/Aj5M7y09l1FqzzAA1+ZwClIYB2MIUqEYTkHF6EX5aozGAtF?=
 =?us-ascii?Q?2YHakh9J3DZS1ByZ4WIOBreb9KuMJ4dwjElI5Fi4xOnG7IaOHtAJ5e0tVXYC?=
 =?us-ascii?Q?onC0Eb2+Fo1m0E1ZzDMui9Yy4mfT02zR/s4Z33X2Wvny81PBdZ5LyR6Dd1/7?=
 =?us-ascii?Q?mvWNc3RVtuW0nKACWU3F20tq4ZrP057LssvAMi5Mx3k1wTea+3rUmbpRs8WS?=
 =?us-ascii?Q?pOHyImBnIJuD30elIy7HXNd8PVzu+rHs7Txgi7oMgOyyLUXsI1t54XgT8hCg?=
 =?us-ascii?Q?nvMRajmieBBTY97MVNX1w9jIa3kutZkWRSkYv7hPVTDV5PSoad8OWtn4z1Ye?=
 =?us-ascii?Q?ihoeJRSQhM8F/etoR0cUKa+SVFNwCzdYNfJLgoo5DOZRUbMoVw1oMMLcfXn7?=
 =?us-ascii?Q?nHxfbezY7Y1izrV6+PrvYHpmdSLoOwYkYtOpdpmeGFcuNXC0y0Fn5kSXXA3W?=
 =?us-ascii?Q?+NudfUUZeiLa/sm3Z6Xi47vJdJ0FOM7KT9tS6OVKclWHuXiIAQTLQTyE+QUP?=
 =?us-ascii?Q?gVKn/xH+zYLdip0bIRdQewlHN8PkmdJaQkpalPEO68l8uYbUqQSNz56V8SGl?=
 =?us-ascii?Q?3VqzMuiaMI8gtdejzEz/TU2crcV5C0qIrSBrOkrzXNyEUs+EEN3JcjtP3y1f?=
 =?us-ascii?Q?FmiSqOEVPva+KNbz/KRoCzXk8rrorzsmpLTKWQPhTcOr5tokOpbgxkB53KrB?=
 =?us-ascii?Q?AGRhYdL6GxtX5laK7T6tXlAAeIt4UGVt2pdPzy47uQ+DzC3zxI6rpcYEfkIv?=
 =?us-ascii?Q?bTyaIYFKMGzBJNHcbIVuXFz2GfP/z2yQAEV1pjMMl6gx6wOezfWahrPW/e2V?=
 =?us-ascii?Q?vLWOhfMq0zGDOHkwx+H30J2GkUo8ayETcetYkzechRjAeftWCXzrilLZSWBX?=
 =?us-ascii?Q?qu22X5/se7Lz1fv0k7k9+RZJ8951M8npYGPJSxccvKDjpaVoadsOuuDPiOnV?=
 =?us-ascii?Q?pPgvmXk5k1S4W/AGXdaJ4Zi7UUt0rkGZTgenb34/vNxeY96x/Hz7Uf+10ieK?=
 =?us-ascii?Q?6S5sOudYwXlVn8arM1LdFD2PyYNwZurAH5SOCUqNnrut6/ggYSN9QKW4jzwD?=
 =?us-ascii?Q?KzTE4nlwdSzRtgIPVAely2e0zYU/J8VeoA2Z3H49rsK4F7NbsjTTieMoCb9K?=
 =?us-ascii?Q?kOs3iRuScyACZmu5I9bDPOx5Py0l0VJCU4xoDQomDyNPa770+jr+EeNw50Kk?=
 =?us-ascii?Q?CFbtRCDs5wH9nY7slwsA1Ri68RWboqIfKZuP5n6E9uhcUUy/UV7i1R7Oxgbc?=
 =?us-ascii?Q?FfDE94Vczk3+38BDcoTspkTPU0cjRIK5cFzL0SMcUfH217TWQp3/8gpVcQEs?=
 =?us-ascii?Q?Hq4YDkHCPKDwPIiqI+3NW9Ziwx8pxMRCmJGumoLXE+VEyiBlhHwY3dKfLtUM?=
 =?us-ascii?Q?ZSjZ6FD35pr/B3lmg2AAk3lH+gBDsmkr0qoKwsJfx5E/15dH9e38x2kGR+8F?=
 =?us-ascii?Q?yKbOPFX71KTgMQi02J7LiX/85KZfJjBad2ujOqdNg3g0+1Tzmg4jyyk5T8t1?=
 =?us-ascii?Q?jKzABToUDc7KnoPeZIn+uYa5hgifLcYqVQ/Sm6EhPyHkME/3SB0l8jmkMNKb?=
 =?us-ascii?Q?ENTTNlMDxqB80rQHsg1qEgCa9tuyUWH1ErkTRTwzJifkdl7PM/XCChJVk3qy?=
 =?us-ascii?Q?cyT5zeZXHuztcNp1c8yBqgvauiXsGAmyTIyF935e8b+p5vhKO/Cvii/cuFNO?=
 =?us-ascii?Q?Me2V5djFhqzKZwmH6IuNgs/D2Cl6MtdHZXnQq2C/IQE+ILfF9VApj4W5iP71?=
 =?us-ascii?Q?RVUBZRFP5w=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73cf67f6-af6f-41cf-166c-08d9dedee75f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 02:11:59.6829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCvwDO/XCXcrK6aTXCHUur5bY+oqvyk1iHIbp3bTUtK0Zsq/vLA5XUSkYCrQ1+f5Nj0hQr2gRnDAbASi8s89vJYZj21lOaR5+T1mwfjypoF59e+R/cmUc9Ww4Ot93BL7
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
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 30516dc0b70e..92635ca9f635 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -809,6 +809,7 @@ CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m
 CONFIG_SND_SIMPLE_CARD=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
+CONFIG_SND_AUDIO_GRAPH_CARD2=m
 CONFIG_HID_MULTITOUCH=m
 CONFIG_I2C_HID_ACPI=m
 CONFIG_I2C_HID_OF=m
-- 
2.25.1

