Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDC55B6561
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 04:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiIMCHT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Sep 2022 22:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiIMCHT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Sep 2022 22:07:19 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C1A51A2C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Sep 2022 19:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZF20MNxXjDzQN8h5V/WFQyqSbcs4qsvATTDWZBlzo2lpgO4TclaUfs/OLWH0YGZNjSOf1d7U3+OC6j5TqNhsiqQ80fjqC0h2ZjmPFLJ8el2zVT0JwPkZurS4PPxiEK7MFwMU6Xs5N+MQmwODe5JjkvM4kBEQcRVmGatAXm7AACQHFsh1JcEpr4VlZRUiK4aFcL5FKW6QprJ8fbth+Jjz+kL8aRmFiAAOZJcr3Ah4CMH5v2+DQFwarWIXWomto71OZN18wjHpJotEXoeInoXUHpmH5xa37DAuEcHAvpqxug7bmwHaHsZNvrTF2HVg/KNs2HrAY2ziJrTLjfs+nu+fGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gCpupPBNR8HYyOUs49w9/+bDw4+nDDVCKMls4b4FcY=;
 b=I/cDNTPOyeok5jr2Qnpv2jaInetLXZNDubuocQE/R61NJ4GiJ9JSlUbWD48e/PVJaeTNcl8UkqtNtWqPR1/w+UyCuUkyypTb0eH4Kk2805VXc07tUIno2OuFf3ccICuFQHKzIn8l/TlQdNgnA06ChnSwGBRIX0nkowPQc81dDdx+DGbFoJkcvD4kg1OUqRAnPEZhCG6r2PN7pY5DO35DKRiGCEa3VYaN9LILjas6jrusXHtPJNZ5Jk2SRhKKPR/ssJY274ryfO4jYmPsZf0UBCHQQRCrVTpErkoFYy09u0LUeOXGba3OeSzlTgo+xeGuOwgHSN/c6bjfwqXzFX7a2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gCpupPBNR8HYyOUs49w9/+bDw4+nDDVCKMls4b4FcY=;
 b=KNTYR3nK54kCwJDxOBwfsHjr9yFDqnTxafIaL8/Z7iEyM8FSQ4IKTN4tVlg/2AdtohT+HzPLMKTUZMIUUZ2zwwaO9BTYC2kTwEL1Bl7C+piP+2uHxougnyk6t7gYrcKzQKT4NNOSY3nQvcl3//NCvCucw5AzY3VwQ5KOH/3cLRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB5872.jpnprd01.prod.outlook.com (2603:1096:400:43::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 02:07:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 02:07:13 +0000
Message-ID: <87k06858oe.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH RESEND] arm64: dts: renesas: white-hawk: add missing bootargs
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 13 Sep 2022 02:07:13 +0000
X-ClientProxiedBy: TYCPR01CA0024.jpnprd01.prod.outlook.com (2603:1096:405::36)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e39735-df92-4bae-1449-08da952cacd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G1XhajETiLqYBgIxLX3y6CnbfOwMz+r7yeCAxgkuIy2dvoR8xdj9H44HY2iP6IJaCDEw5ek8XwZ92aM7CHPa72+dMkfrig9DB+qgeOtGW59J1zS+72IXGmv+qY1OjfBWl07x+gS9ThD5DTY1bAxmAE1zpoWkZGkM03lPRtd4jB7eXlqyYKva73WdFq2ymMyRljmXperPamv/j4N56K0Zp/JMZP2mReQsEAQ3f1KjT8E5OTxObeBT2tA579gxjGQ/5+sQIvs42bmHj38/Z8kCjoXqz22wp7iYJBvSpcgZZzbOiO1JlIEX59szKLKrlt3dH6kPa0NAXQ0GAgdJoUNrthWhc2e/54MgT9OC8028zC65X7ZzodRosD7mAqymoagqybFJnx18MeG1ZkmawYyOf8F7UOKM7V1yD65hsmixW6dJK9EZ/61iYjX+zcEPFS7Q8sG1OHSkGyLtOXEMC6pMF9f3yqHePj6znNaUgHYuO8Oe6suV4Bg24zYaVlPUjteh5bENkt/XHPpD922VSTSteYedaU8CAkDJk8nidZM01Gcz6rgbB+rBcc+2e0dHqFsyXvTiNirt106KssFCAtWrb64tIA/DYNtV3KJpf/IE5BxrRedj7vdAgcRJLtY6mbO4Lj1Dtb4koPH5I8KJOZb5yT6mKV1Kz6Ir8+wpfhsjFNmv/HoF7Cfe3m4HqEvbeuVGjru7yP/xztzB8COD89+3pEx3MGkyXIYJfEiKDRZUrmORtJ2egmYybBtrZwA5dUb4/wvDDb+zw8I4Mb98Z40Xmg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(38350700002)(26005)(316002)(54906003)(6486002)(36756003)(66556008)(66476007)(38100700002)(186003)(6506007)(4326008)(6916009)(41300700001)(6512007)(8676002)(5660300002)(86362001)(8936002)(478600001)(2906002)(66946007)(4744005)(52116002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6e9Fz63wBvtQGy4+j+jibnc8A9tzcwCEkiruul9zem1ZtxZLvROhQmHJbsnJ?=
 =?us-ascii?Q?PWfbc5dS5iSH0YAASSSkTD0C2hBpRl2S6aRAdXakYhbbAnxFnQUrEQTTsBU3?=
 =?us-ascii?Q?SGDkkDiFDzkBDGHNLuaDbM1gEatJ4IptZRlQHQ52sp0/E8MMauYapiG3RArt?=
 =?us-ascii?Q?cVz+uCIhPp2V6kUPkwQ72KAcJ0ppyCQokm6X3IdCad4vJRCjKsZpJ6VtsBP5?=
 =?us-ascii?Q?RVbUfZhieNSQf6rglTWAV+ct6AYb4m6yz6LoOnWZjkg4BD5EE7jQWC5pHWdO?=
 =?us-ascii?Q?otJf3hLnMrqRtUoT7tlNO0AZ2yX5A7vq8fsj/m+0kOnfwMI98BKmb5lF65+b?=
 =?us-ascii?Q?SrCOpnCclRMstDBo3urM7ED+RgNgaFHnhHZ1sx2tOiSaI3NeCie1MjQ94Xk+?=
 =?us-ascii?Q?45emmbIy0KAWbB0WhXhZN4bodLF3hdD+vHke3lg77XDcXphhFF9xbkDthd5R?=
 =?us-ascii?Q?UCWpAuFxLI7LlB4bPAmGUoZpnfwhqBV8kzjNbqr5V7VwILn21VrDPlZkquPi?=
 =?us-ascii?Q?gYRG7STXiNvNgSjOlBiFILtZENxhsI7CJZWReGCI5pXPkUD4Eu/0NU6m0pDM?=
 =?us-ascii?Q?DfvpYX5lhoERZTT0MN1+JhFJKTQ7yHgYfvHthIDegqVVCa6GgHZfDRN/92Lw?=
 =?us-ascii?Q?2pAaePmhGroVllKdlvTELSneek+EQDTbemTc4J97wFvPycItklukpvc43D+R?=
 =?us-ascii?Q?UZ0yqkKZBxRrJS19l8cFvajxgnfzohH1pTvYMbU9WugTTKGxo5azMjigNQBE?=
 =?us-ascii?Q?ohK6fMJDDQW9IgcJPhZzlGhxdzE5AHPq9JOP1MMPGt21Cpbes+jmZdtVVuo3?=
 =?us-ascii?Q?dkzoJ2Rlo1SVFW4vAB9LwffSCtMHYJRW1KvNHP/edaZ18RLJdoIqaqah67zn?=
 =?us-ascii?Q?38bDhqadf/WWjtjJcJR+KjxJIwAw52axiP6TErBAj7Mam+3RyJGZXqlZdFPP?=
 =?us-ascii?Q?taNFDESHY5NWPQAUiQt0h2McQvDxpbJ57+TJ+qBcLdY6T/ufWjGBZpMKaByH?=
 =?us-ascii?Q?Ha3oEYS7jKCnNW6EvuBkEaNIi7WL0+psGMSn6PfxFVVeiXILZo5spu7bjZJ4?=
 =?us-ascii?Q?Nsq9B/8Zl+yysQ3I5Pxu4/A2DJELbjAMAQE4saB5DlqvlbQ0lp0GjiNtzue6?=
 =?us-ascii?Q?qLjgCdNVcQD+EMJNENDAK246UVHb/DXvGOS/8YhxWPBoS0qgnHutuY0xLxpr?=
 =?us-ascii?Q?7ahRBqOVahv8nYDTUGqdYsKOhFIVMA9st/sELyOD6+mzhZRffwLbqS7hA/F1?=
 =?us-ascii?Q?AJflBeqafZcjrrnAZyH4wjZgHAjV7m3D7hvEv5uoBSTWjUwl/Nw15DGiPr9w?=
 =?us-ascii?Q?oyA+vgy0+Fuc2wIBGEaqdR+GLS+j53I5DAEzOSDew7Np5JRqdQp789v79QzF?=
 =?us-ascii?Q?bJXosqdVgieH/55bK5IpNWDdtsIDL2sxAT4jfKOpxAd67F2pZtDtD+/btVRu?=
 =?us-ascii?Q?zDchk6BpBPBMQI2JhwaRaYxm7rogrHNuv9VQO5+MNJdbeNcwFDMjIjoLdWZT?=
 =?us-ascii?Q?nA/BVNedtKVpSdHM1CGMrnx5zdlZXoGDSsJcX+QjsQyh23bHeMdcTrHwPmVq?=
 =?us-ascii?Q?NQBFmC5Nk5G0nEptUHe04kPMotOnUoAieHxcaecu0NXIisdJqs6/osamL3st?=
 =?us-ascii?Q?FSlIP78RYDIHJu/auyPC/GI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e39735-df92-4bae-1449-08da952cacd2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 02:07:13.8144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFGhm4RLT0HLHa73bsIhByfBdQHm4oU4VsvxxTSUgkpQsQrw7lFOw/IYvejUmm+exc6s1Xjj8TfMubTYseXVBBAkn7wDXe9rqqkNVRLD/POutsKtaOMVYmCtX8cD0Q6p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5872
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

This patch adds missing bootargs for V4H White Hawk board.

One note is that current White Hawk board doesn't have Ethernet
support yet, but this patch adds standard settings for it, too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
index bc0ac109b17c..34b018cd0c9c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
@@ -17,6 +17,7 @@ aliases {
 	};
 
 	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:921600n8";
 	};
 };
-- 
2.25.1

