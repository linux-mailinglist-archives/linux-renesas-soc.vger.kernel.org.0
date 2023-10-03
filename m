Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFB17B5F12
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Oct 2023 04:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjJCCdN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 22:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjJCCdM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 22:33:12 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 335DBBD;
        Mon,  2 Oct 2023 19:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSoNB0TgcTH/z6Lw4Tjlnh8Ci8yB35BLVp7makD+FIOkOggNGYB+E+mmInqsyQRNtdb+eVq9wFcjYMHCpmffJCiM7rrjDlZM4F/29aV+7qmrkU1SbET6knkDAJrZ+8LxypzEwilS+Ld3ixD8hNMNcQzugWRwkVVpkg3cF3ayjKOBvylk8WXnJt2YVx/modQ/qzXtNR1ztpcPQdDCiqY0KOS+zsnS+UD/LjqcQC+ldws0fDtJfh7iANI/GYK5s7UA0UI/7OWw4b35TPh2bd9vWKwurdKjJS671S8/M4f5cNdZ/Xg+q3HdXhLIM74fmNgEwKUWq4JXiqFkfasy7Bm1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ec2JxZh3gWvM81rXDvVuvnERN5KCzNRk7UngEenFbJE=;
 b=ZCQzE7cDKN3qUWViwmorVIoDqax4QGMW3uMsRT4fNh86HklO7s5czNPfLPeScIymr3glrQH9sSfYIBHObrbQmPH2UlCY9TeEjr7zAQaJgpVP3CdL4xewFpihORzeBifskB4Wi5hZeVuO/q8nsrxquHQwy+5UqmTI7JsWjDUeXw/I2Xfbtgb5ifibrFEb7UZ61x0mq0Fy0q8gdHMKjWOwUJNMX480M9350EncjXCEhj4UfWoS4jxZNwOBVqwGrLVBNlWKI8L+7GmhqZVEBzBaoCdP0k/4BKeIaLhZhwmEjaS2+T5tlSjTZVR/fKAYtOTPBK9UrcMhj3H/S/4mTeDVzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ec2JxZh3gWvM81rXDvVuvnERN5KCzNRk7UngEenFbJE=;
 b=XgwqB+WQsOjB3xlh+UJakaIZBRjsnI+1/gR44CqnD9c4cL7Oz6CCFvRHx8SbjxqyAyJXLAz9OpnWfInsGOkEU9mKyL+8+46pT2014SaDYFCW723w2VkiAoQxTXrkj4stYAKdymdVQMW8YZEWChMBZoSvlc5kjTqCnVfNecGVjfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7781.jpnprd01.prod.outlook.com (2603:1096:400:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 02:33:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 02:33:04 +0000
Message-ID: <87v8bofna8.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hai Pham <hai.pham.ud@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Dege <michael.dege@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 0/4] arm64: dts: renesas: Add R-Car S4 Starter Kit support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 3 Oct 2023 02:33:04 +0000
X-ClientProxiedBy: TYCP286CA0054.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d39c0f-068b-407f-ba21-08dbc3b9123c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pUvVTILybldQXk+76ugViL757s8nfIxvRgf35SpOpMqyO3QoO9vSSSloiXf6yA1pV/iYkhVgaKlFaY+xQrGx0XSZgXypMk6TiR5hctpxh/Lj2y0d5aFznsYWaalgp5Ve5OEoGeuGWAHuoZWQ0FIz93CB0zVy9E9UHr/VFqAS9v3rvmoSa2i2pFciz7jXM/dWgEfOCxrNype91ENyYM1262TmQrkHPib7sqoRYvmDNQeu961Ciky92kaBEp5gIADNFhi30Cpa11WJx5sxF5oCzvmXzBgu+kMiA3nE650PRWe2Hu9gXx2xm5ohCpM9GLG+v8bViXeQ9EsZtkHZispuKqaX5aRsX6TudgVU9dwrwFYrEMyM89i6hdOsi8mXxMZ0Ogah8BgJufNDlSbw2wM10Qu5Ye3EmCejpnZ8HgyEm2kFG6yQvrG+8lQsMPfRqsvrB8/uk2AILFsox/ItxLjllGx5cxcK8Hl9/tMHmINZmejNIE2p1tTo63LZGiPowIeetMSBrKsBeQrkAAOMRGIiLqV7Wfc69sAHo7qU88dS+oJeBZ45wvHHyuCuOR5qGD+ZHiU+QKHUet11urqLhtMzatVnD/ZiFwQSn1R7UF0rfT1/+c07M0dpUvHClhlsO/Cd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(52116002)(966005)(6486002)(478600001)(38350700002)(38100700002)(86362001)(921005)(2906002)(7416002)(41300700001)(2616005)(83380400001)(6512007)(26005)(36756003)(66556008)(66476007)(54906003)(5660300002)(6636002)(316002)(66946007)(110136005)(8936002)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lD00/TwgdB5+OKWa4Tf9AhPL4azyZvkO8npmzDR0fjFXiHKUcGyW3xq2tnzE?=
 =?us-ascii?Q?NFILc0L+7G8nSRD/s3iI+wRZH2wdgHjlThuwboA/1Gv/ccUKC1hFlXzQn1p2?=
 =?us-ascii?Q?Rog4LgTBnbNhys/iutHCZb2W0Xh91tu76Dj/Rb5VMPSymmZH2TJtvC/BsOQK?=
 =?us-ascii?Q?sIJbaqWqgXctzmTjWKHRhgx/IAr1GtB8jc3ZxXL/ueysxcKQ0skpjJElZwCX?=
 =?us-ascii?Q?z/ciMX8PluM5M6vlb9bOLbgoAqs9Rvx4HYxiXZ4gt3HYvTbfBFp/HufqyKMr?=
 =?us-ascii?Q?G2+4UPQlcTR00+T4Cptk3i20IS3BWIAmXczAQpijzzLbYANpfW5QihbYS0au?=
 =?us-ascii?Q?x9te9AIsM1oEMsG4TTNvnPKJwhK8LXuwte3Em1Gd6SSm3YmPSkx+4X3h5JeI?=
 =?us-ascii?Q?2WkOQV20z4yRY6vKRNZUtb3ScNjuRxvi9MaErDnQtK21LnnoLR2o3v/B/wE1?=
 =?us-ascii?Q?+1/SNo+R0k517gNBaN3y7Xziw/U/AbanvLgUCmt+GrWQqoH10/JtxP7hu9jv?=
 =?us-ascii?Q?8b0Z1LfJy7wH3pScg8UiCh/k11JR5C3dS5yTUHIENhJbFIDR9RlunfysifmL?=
 =?us-ascii?Q?byjJJXykNKkjL6pJN69hTav4SLn+NPcFxHN0v++LF3QtXMBSo7ych5RcwfDt?=
 =?us-ascii?Q?k/kpxvK3gBAFR1Wi6B8G6k0HjgPss4ZKoVghenesOL6azijWpKmaNyDdtmID?=
 =?us-ascii?Q?KDrw8vZm5n1rI82kkWr0Cz18BjU7iviwE7rBb3OQzuk9m3BW+ZxAPLlx/WrX?=
 =?us-ascii?Q?6QjFxiPrnCCI1fTxVnWD7XAFxHcNI6k/7xCMkr2gOL4STuS649utMRqxjOji?=
 =?us-ascii?Q?5aibysOHabq2lvqJGmaPW+d/kn9YPtG/lr8s37Uy3vx5Zo13wz/Hlagp1Cr8?=
 =?us-ascii?Q?BU+ZIEjwKm7fKojoBPTILRsa/al8+hkNegvE1QdM07hr+q/ATAIcSUdBCXxu?=
 =?us-ascii?Q?Ek/t8TC3/vacWq18RQvk6U8gHpm99tg0+W0+l9dpKG97hR3XC84MyXvyTIlh?=
 =?us-ascii?Q?gWtOqDk23LK+kGL6yjmNzsX+MGJ99RoLfugE0XPLjSdcao7/tIdQhhm96Khx?=
 =?us-ascii?Q?YGLLsgo8TNMRXF+av8HEYhinhDpSGxTfCduo58JaHUX2E9zWvhKyEWdkEcjH?=
 =?us-ascii?Q?9TKXPSdwHlY91rj4WwehJhXNSzaulLcUEiyM4Wa4kiAoP1DLizF3cw8DvwG+?=
 =?us-ascii?Q?6XMY3CPhsFAqQOUbAehF8NY3thtlZnMjJLoCRoXbhJzjWGSI+bWSQ05Hl0ez?=
 =?us-ascii?Q?ogZVc1AicomJRwkyqKx15zjEexoZTJdXnYdYh4XJPKrNFuVL0XeRS9+ieLcM?=
 =?us-ascii?Q?V64Vv1PG1ICOzZt90sWIQJuSpEJgnhljDpMZPdQ1IgytTGLOCo+3hBtXvtL2?=
 =?us-ascii?Q?OOg15pdDE8YdfsfICp8SSZO0vPW7AJqeI4BRD8C8GFL/NorJ0g+cBWLQlecy?=
 =?us-ascii?Q?///6ht8UY5yPRu4lW3yf6W8vR24T5mDzOE/8n4sElHDZX9irfXXWL3ZpfcLF?=
 =?us-ascii?Q?lTndiqgFhN3lxslyBun6r5URYLP48HKTQn6ViyrwjKdcEQWxBTQ6IWLJejDd?=
 =?us-ascii?Q?Kwus+nhHK+LWPfDHktoP4iX9592H7U2lcwnkfjB8973pDhFtEcxGMc5oEy2g?=
 =?us-ascii?Q?LtOUCQ8RnruxkLq1zY5hytA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d39c0f-068b-407f-ba21-08dbc3b9123c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 02:33:04.6461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWR4kXyMRCVDdZ0nIC7IZtvz9zyCWi+KvmQuDpk35RhLg5FqUB0RTbv6JDwdKYFpXzqk+O9Zd6Ih6Lu1bJK5d7grFrjdzq8FqEiqm78HDDkldqOVAJ8imri77BubGi4Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7781
X-Spam-Status: No, score=-1.7 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

This patch-set is v4 of R-Car S4 Starter Kit support.
It needs Rswitch bug fix patch [1] which was posted to Ether ML.
I hope it will be accepted for v6.6 Kernel.

[1] Link: https://lore.kernel.org/r/20230925003416.3863560-1-yoshihiro.shimoda.uh@renesas.com

S4 Starter Kit is possible to setup details via config exe,
but the DT will be more complex. This DT is assuming "default" settings
to avoid confusion, and also assuming it is used under NFS system.

R-Car S4 Starter Kit is using new R8A779F4 SoC which is updated version
of R8A779F0. This patch adds new r8a779f4.dtsi file but is using existing
r8a779f0.dtsi internally.

v3 -> v4
	- tidyup typo "r8a7799f0" -> "r8a779f0" on log
	- tidyup typo "INT-EX"    -> "INTC-EX"  on log
	- use script for To/Cc

v2 -> v3
	- alphabetical order on pfc
	- use "OR" on dts SPDX
	- remove UHS from mmc
	- remove unused "sd_pins" from pfc
	- add Co-developed-by:
	- add interrupt on rswitch
	- fixup node name on rswitch
	- re-add "st,24c16" on eeprom
	- add "renesas,r8a779f0" on compatible
	- fix typo "s/r8a77f4/r8a779f4/ on dtsi

v1 -> v2
	- correct board name
	- removed BSP specific device
	- alphabetical order
	- add missing compatibles
	- add new r8a779f4.dtsi


Kuninori Morimoto (4):
  dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
  dt-bindings: soc: renesas: renesas.yaml: Add renesas,s4sk compatible
  arm64: dts: renesas: Add Renesas R8A779F4 SoC support
  arm64: dts: renesas: Add R-Car S4 Starter Kit support

 .../interrupt-controller/renesas,irqc.yaml    |   1 +
 .../bindings/soc/renesas/renesas.yaml         |   7 +
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts | 240 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779f4.dtsi     |  12 +
 5 files changed, 261 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f4.dtsi

-- 
2.25.1

