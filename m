Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9569F7B4B3E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 07:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235441AbjJBFyk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 01:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjJBFyj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 01:54:39 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2109.outbound.protection.outlook.com [40.107.114.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4A29B
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Oct 2023 22:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDVcVi6JS+/e1mAzO8BZNXbhy+TWoGizd1ANWRoOGCztZAfY/KWuLQeRiUPo07K2JOK9AHvuT6VAYCx+qBG8PkDc0fkn2pbz5eGZcZ/Mg2FbEu/vUgS0GHNGIg+9a0FFAh/k5SJ2oRIALHaG2DNqY6xAqSrm7un47FcQzY7knFkNTR9N6+qIrZrdqq8AZ90G9Y/oa2Ue3s8ACXoTyN87/Lvslis60/bF+GHlmcv7vlzaOXOp6Gz+LQbeqBvRTIOu84NtKRlmBpexmdJc1/fZQvaF/cPrh6LcGQGkLc9C+a6lLBrMZnArD8x3cnsls4a86W7wL5LpYQB0bZ9d4sTAsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KttpMcutJ7kLr3RVPd9ZDbzz7gjPp3EWBcvSOmhMt1o=;
 b=Grfl+mclRVyIXOXsSSGyXTmKA4LXhtnDhs0OdU1xSGSUMIeqeXeCzdbZZPxovTF20bcXpdcFh9tDbHJA8Ntk9tasJEXyFBGEExllWkjphG9rnHuFNp3ayhU+1mE09OD82ofzhIHyo537XtRn7f0mNIBso6yTrqEiHq+mPtRPfC6mTKchB9bPzqchI1AWPfAqVY9DCgquh3TeEkYTwMQptrHJZvAVj5HdcMVfFyGT4PlsDucZpXmf4uHOcuMfDog0WVXnbJfEvqsOwivg0Ajz3a1+LWC42clFgF5w6+CblMzSNEvD4iFW76kzh+3PY0n956DnkcHx4hjE+T7e4B51Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KttpMcutJ7kLr3RVPd9ZDbzz7gjPp3EWBcvSOmhMt1o=;
 b=IQ8DYEyGbipx+gGqdua3rORKKCoB453uAqtibt8wq93HQdm2qJFdf9fggFI1iqQymlJW6+Z3gn5vgiW9439PCwcaClWzJWyNQFx0y5Iv/jkj4fyaRqwG1DIrUhfTS4MZajKppd7P58mLn3EwOao2j+aVnobsgmPH2osTkIowJS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSYPR01MB5351.jpnprd01.prod.outlook.com (2603:1096:604:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Mon, 2 Oct
 2023 05:54:33 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 05:54:32 +0000
Message-ID: <87fs2tefhj.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 0/4] arm64: dts: renesas: Add R-Car S4 Starter Kit support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 2 Oct 2023 05:54:32 +0000
X-ClientProxiedBy: TYCP286CA0263.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSYPR01MB5351:EE_
X-MS-Office365-Filtering-Correlation-Id: aca8cd81-5893-47f9-3fe4-08dbc30c0cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JKYANAlwcGncqPqTxXDe7sUTS4E1VYF7KIzXQ6B6cBb3SheHiPSK10Do4QKV5vdi+OHvlDvphfVqDz04JWurwsp64+F5pmGz4c71zRD2nbw+XzK3XQuqi1qQqRelzSvJM6cE7ueTwQPVBs/wYAWWX50ivVgfM02+Uq2VCIyKhwVgBJYOL1p4L/moyiPpaSx1XuAOMY3xhP+CiL42F3FcorHn+29TapoPEVLe5OqrbH1vLTJOpyUxVZ34A1RYoGDYkai0RbNm/ofZ7A5XOQRIwKxUL4JKqNrFNSp0Y8rQdojFa/QzT+qUsFM/K5BcgYOTwd8vqLcdfW9a7DlNmPLWH4t74ZVG8D6GVvOpPmgeELgvsBHbzo1uGzCuDCxZd90CXaA5I0xS2g22FQTMrGPNAQJ+Jzhi8eUrCwiHXj9+qfbPVMTSALYhwYZ1sO5bqhbOvcX08++Tz8/Uxn5cSuQPC9I7oraNXyx3YNeeVXJYztL5+34cbiUhzlVbVxz9CGVszMG2cj7EXuNPMgfmNfZWxyJBW2aiodrITloLkroFcL3NGClrChf/UjVKE3SOWLXN93nhSLtWHKx23JgIrTTUYBAdJ/cN8gYKorIusgwghdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(366004)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(83380400001)(36756003)(2616005)(26005)(107886003)(38350700002)(38100700002)(478600001)(86362001)(41300700001)(5660300002)(8936002)(8676002)(4326008)(6486002)(966005)(6512007)(2906002)(54906003)(52116002)(66476007)(66556008)(316002)(6506007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qnLV/UQ0vzFoLt4J5vk2VR/UNYWNx3ULV2zhLGYkCexf/FCyfoxnkUXzYOdp?=
 =?us-ascii?Q?UHYKVfZ/d/Amjs/3r0uGhyAZdf+IKJ7SMFpC24u8LchvFK519hge3t3OgcmC?=
 =?us-ascii?Q?OvYI3tF9x5u3sSMTkjtsZ9lje85NhKrPqlfKvtNOPhQn/AvEehvvcYw/Ja3d?=
 =?us-ascii?Q?BxtkmvZhqF8O7Bc1itYtPm1mwRfUsoIX7ZfxqrDNxS0IPnOldabVXk5lWYXz?=
 =?us-ascii?Q?2LDFzFvt22aVouUMRl+6oGKJee95JhoTLIfyoGS8VcKpQedY9bJpNmUIKCQf?=
 =?us-ascii?Q?PKJIaM/cUT8abrxKgRiUR26SdDSJ1eM1Z1dSL703S2kjvd9KzR8FFqGll3Ma?=
 =?us-ascii?Q?i0mdijvc3mpAIkzQ+cOpjxAwAN2HaJduYCTclLIM1YhwTwadlLBrhOcmPzeW?=
 =?us-ascii?Q?8XTDI/earsE2OerLSSrHGcZ8Bjjp3J3NmLwoKLgJWe3+ADw/vmLe27Svoij2?=
 =?us-ascii?Q?sO+CVFU0+iinNdkBT/JA6uyIqvG3oYpT1/vWg9TKxeyM+f4Uw9ksXIGE3yyL?=
 =?us-ascii?Q?Yoi65Q7Mt8V8mq2EUGSQv0yp19CiZ/WQ4GHGTZmDt7Ap0eze4+HksKylr7ws?=
 =?us-ascii?Q?F0tM0PBBPTiTZqkIVU9Sj6dNUPetAD6v6q2c0OvmChTbUJIUNsvSsLRQWNxv?=
 =?us-ascii?Q?qC5EAoFSggBixB3hHasymK4QUDP2VnWG/eFKcMty0J/zzrhrElVcxIT0q/VM?=
 =?us-ascii?Q?sMhiLSL3xXqDafvPHTLfdsaTsQnjBRNLsePyD2WfRrQ6Nj9E3yHWFM8Gn76A?=
 =?us-ascii?Q?qZx4yLMjew4noXxn2737s22lfGOmlfqx2n0IyM6J36SRofm0eR1VOhrs7d4g?=
 =?us-ascii?Q?2GnhK7Ff8A3yQRU+2J0F/l35d4OmKR8Mr4hK7YIYKVeIDNaPvY9OiBoH4d7d?=
 =?us-ascii?Q?1DqPJ8rAFYOIlZRy2uNnixn1x7mqTsueRv8wcEAxrmtvAtBMn3n04v9pm70S?=
 =?us-ascii?Q?u7z7PIhNXhcGgTbFpwX83eaoyOkkv6g+kM44FsQf1Few6eu3YemLfWWT0Kxt?=
 =?us-ascii?Q?MTCk9bS0NB7OJLufRUntMevaMRy+2KhNLTjXlDoIjus6oer4xLaQVidsMUha?=
 =?us-ascii?Q?MipL+5sgRq1gWuJXytbZteNRmfdabOvowAvhMzQa64yKMi+38DM3lVsa26JG?=
 =?us-ascii?Q?ISEY8TIJHqupoOAYGguOCKuMUyvlqqc4LHhRJQXXoG1xzpfXO8AXGBpJgJpD?=
 =?us-ascii?Q?SzwoPwNJP4f2OaJT1/5TMpvEDBIopIwQTGkQMNfQ0+N4CdVBxr6ovEAvtp8R?=
 =?us-ascii?Q?7X86AdnqVa8qBmB3yrI41bs/p2HwWZ30HStBZEwuuNJwjmYwhAJ7i28W3BQC?=
 =?us-ascii?Q?YI1qk8/Kh7fqsMIYAKGlLxXUkyEQDfuKnXq9endamPTnUSRHWbN9lLvJwLoA?=
 =?us-ascii?Q?4+NqpyjPlr8ogy4nKEfzIByigRkKD4wEwWsXxxZoRWPuPWx0gOnTCcKPhQFe?=
 =?us-ascii?Q?N5Ab1aHZEAvhfYnh4k++lAc8ikd5Q3QphFtKF5IYT2fm/b+ne0w3P4UItZfU?=
 =?us-ascii?Q?ETc3wLYNlA8ts2JPsWC1ypUGt8+qoYP/rS2WYx1gL4yqJo8XMDqu2CVG6vQf?=
 =?us-ascii?Q?5HqO6bDUS1TU7FiZ4UzoRQZ4LJweA5CobIrl7NiIOAh908aqzmPscpUb5A4t?=
 =?us-ascii?Q?jw7RLcTdBfz0lT1fsUUFFa8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca8cd81-5893-47f9-3fe4-08dbc30c0cf0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 05:54:32.8619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tswARH2Zs727A8tb4LU9pJtBZC4Sfa1+wIl8AqpoxIy2o+n08XQbvf+wl5GBAMb6D9Y+vHZOoY9tRexr8DcUPDumhESeD4jub1sCd1mPtbxs3P1yOWQ8ckQJHqVCEun1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5351
X-Spam-Status: No, score=-1.6 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Geert

This patch-set is v3 of R-Car S4 Starter Kit support.
It needs Rswitch bug fix patch [1] which was posted to Ether ML.
I hope it will be accepted for v6.6 Kernel.

[1] Link: https://lore.kernel.org/r/20230925003416.3863560-1-yoshihiro.shimoda.uh@renesas.com

S4 Starter Kit is possible to setup details via config exe,
but the DT will be more complex. This DT is assuming "default" settings
to avoid confusion.

R-Car S4 Starter Kit is using new R8A779F4 SoC which is updated version
of R8A779F0. This patch adds new r8a779f4.dtsi file but is using existing
r8a779f0.dtsi internally.

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

