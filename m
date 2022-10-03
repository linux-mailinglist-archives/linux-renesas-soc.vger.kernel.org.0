Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 359A65F27A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 04:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbiJCCLQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 2 Oct 2022 22:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiJCCLP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Oct 2022 22:11:15 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2121.outbound.protection.outlook.com [40.107.113.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8726733A03
        for <linux-renesas-soc@vger.kernel.org>; Sun,  2 Oct 2022 19:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8hQJsS3NvT3lZWKLfL4Jw9PrDANRutx29K5cfVgK4c/XB3OCGH5jWRhOo9dJGpU29IYBl36CqwnDRv9fZizX+uO3XbibzksWAAUK/n7fHl2oJlrbWdWph1Ivuq8p2qvIFc+Bak4SkVkytIx1GQj3SIPUvDJAB4ef7woPCnpckk3iyJyHCYM/GVo9SmVn78Q517eur3JSEBX8XecxrxjwNBnVtiX3FJhkdvZDm8q0dwedOZpzWoHHo7X/ncm45/z2B+0jTDQeXIRT9uIYLtIetDqWLyDzdx2uAdMz5NElpLQ3DMzYV2TGK0RviOJLQBY1WXZCK3L91+8S2PPEthorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08nmPc0h4YTmhd8f2ZLyxQuGgKX3Cgnc3AANaDw2r4M=;
 b=dzMPxYziNqeOrp+I2BLvEwbxLVuYJxcznkXf2Cj0JfU9i61z4J7iEA5iysJFzqfg2GV5rmtOf7l7HQFRJv3vFae+wMResGV6EZMJBtj0U0klZByeV8UCtDICePTKLw8q6+1+4BaU3z5UmjZg0AjOXq5+xJ4xZH44yzaoH77WyxvqN1RxNLVpuMTn3fb3jnuzUmPe9mADMCvQ2hTu/5vjLJxbWzWVWO9nuUoJ1EUJVA/kiJvd6AaGPqrs32nVUc7lXCU/ugFRl1CQHyU0xwaN3fIxpFGFSNW/4p31uFsnlyOuLeg5VktPXXqN4g2QJvPpJ77FTjNTmmmIyl8BXyl2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08nmPc0h4YTmhd8f2ZLyxQuGgKX3Cgnc3AANaDw2r4M=;
 b=iuq5/8dvMmunAkP0pkMe1yt4s71GU1apAhA/ZwZ4QGRjoQrFohd9YeUYuoIqgMP1+1xzPbFdDA0KCaE5FAO1IwXRV0mXJRSFmMS8UmykJnJ1ku/FCSsANt/wWbdfhH9SuNAC+UZi4POrqRKeg0MY3CG0bEDYDTuoNF19y3UJ4ZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5889.jpnprd01.prod.outlook.com (2603:1096:604:bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 3 Oct
 2022 02:11:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::41ed:9175:38fe:1134]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::41ed:9175:38fe:1134%6]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 02:11:12 +0000
Message-ID: <87h70lhd1c.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] arm64: dts: renesas: condor-common: add missing bootargs
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 3 Oct 2022 02:11:11 +0000
X-ClientProxiedBy: TYAPR04CA0020.apcprd04.prod.outlook.com
 (2603:1096:404:15::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 33dd3e6d-af19-47d2-d4df-08daa4e48b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0mhvcGk6AhnQpMLArcELABSNGWFDlkPRIgHNJqYnNva62sFVCayY+YtEeR4Fuel47nUShN1KZeFwDgE3yVtd9Ph18GkpfaJSTGZzjI3ghKy29WVMrg29Zlv97KGbW/FIOQ94Ca+lM3bJVReyzzAcIi2RQ7ZeZP6d7jVN4sw4i4DOIZ7oDSht1UZK4+DC0gYPKwdq2pA627hL1Fu0Tfwljuj31GrB0BrJb2SwnoBXZURck6J+4p1pkgECGJ2dyZRq8IK3iWGRC0Ktgmau2edHaa/zAgG026ucpT9JUgXHjJhckZgpV1wwpshLBH674RxweBuVEnSQ37tMKP7xc0K7kSeLHj3Psa0ClUbi3LyC0uBknNrbgDY6i52i9YIqbYSXGwjGyfyzBLZbPda4MA9aj6BKwJDSmy5dhNirVde9JBRqM0kiYvjvkR2kw+GAgGic3m1jkxYWeM2jIDVQpy/BSD664o+mYR9bpvTLRoZVn8plDHQfExwn4muv8XVslrhfDu5GHUh3Y9xGHjB3wZQngy12CCx6duwl3rhqTs8xoiXPlQCitV1lh9b0wbCpi5fQ4RZ5NHLpOoFwFCraCm/+BtKUxmVHwjJr91ZgkPVcoHGg9m8X2Yf1uSRkt0Y5g2jA9veb/+KpnUXNtI6qPcNx+AEypytx38yxO2MFF3e5iv+11dX7L/AgLbOJpwbfI9ImsYEyqLR8gvszwf50eVFyYHuaSvIGeV0SmjO5eYo2q0JDKXUll5Egw5FH54mTotwUKCJF8LFyVn5LFdYEXIuOVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199015)(6916009)(478600001)(54906003)(6486002)(316002)(38100700002)(186003)(4326008)(41300700001)(8676002)(66556008)(66476007)(66946007)(38350700002)(6506007)(52116002)(26005)(8936002)(36756003)(5660300002)(4744005)(6512007)(86362001)(2616005)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oKL13UtkSWjkclJyrJFbm6oaglIWjGgqfsV45Ge2/76fJR+2A2dnnj/Hc7I+?=
 =?us-ascii?Q?7boUNvz4ycQh49Fplhy8B7qBs+dRs+4vap1IgG8FjH5jOQT1mYDC1g87szgx?=
 =?us-ascii?Q?Ke86CVN90zrge9oFBDYhcP/uUJXk+jQfXZ3ZYBfBB84hl3wxF2jRMwKbbCiV?=
 =?us-ascii?Q?3Ih3LxCDtKTFPd9/GQwwJLcOW89kIz7CGHyDZHbw8d9/2wQP1+GD7YCnHENs?=
 =?us-ascii?Q?dSxwfvMC9ILZulFkTY6iUJYoY1AWeEPwr7bk+RaT3o4sHLi1bL+1v3oQHIeH?=
 =?us-ascii?Q?bzRMNUe5eF3JXfg6QDiLn288v8JksFZua2pqgEc7h9i+E0M/Mei1i3CMuq6p?=
 =?us-ascii?Q?o4W7th8/LIwAQYBpPUIexDOg8ypODw+7zoDdhoFv2C69IORMb1PVfda7gNA3?=
 =?us-ascii?Q?VxcFJeNA/mWtyMgDRIH+ALRBItys7ij4cSPct+UTUHN3Dnn/65am4rdhzTEQ?=
 =?us-ascii?Q?JrHBOo0HuM8HLmoLfGjdyW6s6APJK2ZNKE8j9emVMpxzKGZapsnG6wAzOe76?=
 =?us-ascii?Q?0iB15OJgTxIlkpW/WMhHtwZ1AZ4da6iw+AfoZgEh6yC7crPmoXO88sh9qmOS?=
 =?us-ascii?Q?JiG9rhlojcyl0WQQRiNrg3WlAT7QJUduoImhhELz2Z+omJVHY86Wa1arfwcC?=
 =?us-ascii?Q?I6wU1WNqzutxybde/a15PUVhDBBlw1uFjmRYixdsTLMDFwxAJLpzkrJBwVU/?=
 =?us-ascii?Q?fVuiTpIsT4onHJzKpKYGglCsGmZTzEREKUUNcUHb70hrLZWCO0gOE635Qf1m?=
 =?us-ascii?Q?qoaQeefqg8jF1EOndBKP/AZnCASOAXViwq1nP3ukmT4yaQid51ftJFsnRRhv?=
 =?us-ascii?Q?5O8RUZNG4WhAkFjB21xUjMl2hzvkJoLliHK55UuLUcGgYdNreFJmbrPwdL9P?=
 =?us-ascii?Q?KZTmF5JcVTKQ530VLwo0E9slW0yee9XIGjOxMnXhRU2tpE513iWplpa87s5a?=
 =?us-ascii?Q?slFmBu1YPaGhJzBxgz3bVoqZCjibZODmBRXd88D7vMd2R6Q5qIlTJtQnQt5k?=
 =?us-ascii?Q?zFMMs4/5GrZsLOF9QMk2y5uMpp3mDVar7MpWGfvdATm8DP34/kIdVFEn9MdY?=
 =?us-ascii?Q?aIEk0XHbe2GH1S/mAW1amUipIqOCjPwK6q5MV7p1SYjB3CxmzEG5L5y8Dj78?=
 =?us-ascii?Q?MZAUDNSMZfsZNN0899KLeDPjfUdTbX8/OFNjdoFG7+PmJshoX5KeZBdY8czg?=
 =?us-ascii?Q?AWzzBl/47FrlLOef08bOHjCmY2vOBpQvISTw5oyRl6/Bcp0IMKfIZJkoNaFt?=
 =?us-ascii?Q?c0vaRKT+DtfndK0LVWWCvGKZEIlHntB28TZi0JQBpiOZJPTeotn6LOsOjy3c?=
 =?us-ascii?Q?AEzpxFrtrbOBX/p02yogMqG30mv/WMRY/mg1aZpvQ5zQ1HseEylIrFBKMaW2?=
 =?us-ascii?Q?WEfWXOW8dj9rLGxQ09t+Lter37tWfyHm5GlZ2XIi+QRbPE8UD8TBJ3W03OMo?=
 =?us-ascii?Q?YuCpY20EtPwbDPIEaLu6V8lopFUdO+6/5laDg8CCIT394lerHpwmclVNcj+M?=
 =?us-ascii?Q?MOmjoHCOfJSoh/gekw7dFnCIlgXo5dBIPYfs/RBP8sAxYVnaTvMEq7HYhm18?=
 =?us-ascii?Q?PWi/C7TOkNgE9WpAAmJI5o9fhoLoPXXgtr7uVC1rN3OlMeEWNIoxKnIVU5gM?=
 =?us-ascii?Q?/zJ8FPrgd/JMuYZB67rMRRU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33dd3e6d-af19-47d2-d4df-08daa4e48b0e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 02:11:12.3531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+E2vxcl7UueTEh6KV2LFrHxD5PF89LaIfDCgFY9x0LErV4Ccld0E9AKcAAhjCsvEWHclR6c2xXNu0NSXTAxAIeil5qUC7XjMRsjWjSKKlTuSRms0m07+xVd5qebOB1s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5889
X-Spam-Status: No, score=0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch adds missing bootargs for V3H Condor board.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/condor-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/boot/dts/renesas/condor-common.dtsi
index dfbe35bf46e0..7c34d14dcd7e 100644
--- a/arch/arm64/boot/dts/renesas/condor-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
@@ -21,6 +21,7 @@ aliases {
 
 	chosen {
 		stdout-path = "serial0:115200n8";
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 	};
 
 	d1_8v: regulator-2 {
-- 
2.25.1

