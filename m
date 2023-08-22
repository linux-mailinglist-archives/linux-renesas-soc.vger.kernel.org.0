Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6B3678399B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbjHVF6N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjHVF6M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:58:12 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E56193
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyPHocNORv3Qqb4SIlb2Vfvuo+ILtNYhcDfa6B2S+5+TnfgMZ9hcQ17GvdL3/baIuqfvauQSB0GjJB3jr8ZTmimq/UdLmVKLi+ceRImm2my+N5WHI9zEAdmoPpkf/UBeprgw1LV/XgMKFnOpUtOt6GJCqH9qkooElzUJeNzizk67MIgqIvV0VifIbbh3BcKin23nr9YfbOqatL/n+hzhzM9R6s3NWgEE613nxTcvAcJRbH6E4Dyrt0+/6yveERS0CTF9T9XEofQtUuJZE/CcuphuhQU0N3NUGdZsPyU7DlMlRrikdlSvUuNYCBrCJLlDUiREgbv0VdZn8rDofetP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOrJkWG8Cq2J9f4E16xU38pCWVi/Aa7WJH5DnGM+51U=;
 b=THhRFc8TU4hebg1SaMEaLvX1X1Qgda6DOfQxmcjk3CzSacFR43dHn8OV3Lh107BmUPGsr3DBgMR7GM3clZemLP5pbqlPBGAtJCvqd6K/D621TwyarwHTi6TxnY/twtkeiENNZinNRGcmIv1+WdM5o3ldAupm9dG8OrMF+HzgbPleFrLSGFbYAw18h9YoA8onTB7dMIlY2tpexeoj7xtdzVctJ3TgKfV04rZHzXmMG2CdORHU70rbv1u+KbVUq/XMWGvaaBLg3Nsruxzak+wwyXBBoB7+LtImb3uR5AGTAs8PCIYWiO+arcimWwIC6pwhNJ42R+AdQLV1Vy7mlZ4k6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOrJkWG8Cq2J9f4E16xU38pCWVi/Aa7WJH5DnGM+51U=;
 b=lWZlruQDLlFPeR8UJ4kEZUI8rez2nhH850grze3GXljKkH5Jk56VkgVkP+uJ7PEGfrg77TcCtqeehQAoJoKmagzHuniaFnZsa3W+mOAm/IvKwoeDAHxx20PoM/BiRvGYFeGcuiIlIF1KLb7odPBAx49j/d5XSySTRAN0dQjaltU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11746.jpnprd01.prod.outlook.com (2603:1096:400:404::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:58:07 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:58:06 +0000
Message-ID: <87v8d7sjo2.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/15] arm64: dts: renesas: r8a774c0: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:58:06 +0000
X-ClientProxiedBy: TYAPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:404:28::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11746:EE_
X-MS-Office365-Filtering-Correlation-Id: be8a5d93-ce0d-4e93-5c04-08dba2d4c128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gavW1RH5WZd7FE7WUXvAA8dLfaZtTKOL9QMQr314/YC+vMd+XNlXFq4JAwzUxAg+Mecdd7QF1VkAzTAe7UgZ4txU1OgAqoUJAjxudNnp0Vdo5/g/iVJaPNIB4fTLaLLQldjcBqvC5xd4Gu18hyoPZCOnpmWFq9KZDWMfQ+P6nGultaSmEaPqIxDAs0YH3NKFk403rqpruUbVKtPBEENrmrIDEHCJKExPHaPL+FIzBKvwS9aCr5xZf/ZekvXQWzgx9fq3iLtMHtU81O33tj8Ezz5L2A8mwZiviloUEUOD2IgPBKsxHCcVaQbg+iFh+74n8EjaX41GozTCbKBq4UQP1Ttaw7iRjFRXvfFSMwNwDFUn5fvfetZlUwJWQxqUi1vrl6tkoALFapK5IyDflnBKOSUOr12Ja/GOJ+I2ce/SQ3LMQOjZ09dU0zzW+YtH0fiN1Z7uogPpdXz4+9Q7ZI+D7QrBBnu7jVxIvFG7nDrtE/LmYrWttYRaAwtgBkuPT4O9LcIUQ6tesmoPcLU7O/BlCX5rMMvi2lWjHDjazGxlUb+Ix0EQ/25IEiyP0ug74Ly9xSDIRxrGU3uZQ72RzJVpgHR2KR3kyrkEvUX67MXnLOlt4a4YpCzAItLWS7UhpxrO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(66476007)(66556008)(316002)(6512007)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(4744005)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vwcG8SN7Dh2X2nNtq89YNsQMJ8U2SEwRpjLc0acLti8fIY2PdfOU0HmiebE2?=
 =?us-ascii?Q?TbtkEp/DkCwvsd7yXjahCR84rsOdyn0HwkqdDcUsz83pLzb2aZNFRCot8IpZ?=
 =?us-ascii?Q?4NfxF6a+VlE+AZ/iyZxAYtepLTjPURdwbpWFgxbz2yN9Y+oBpkwSXgLO5gDf?=
 =?us-ascii?Q?o2DC5dFFC901Fqj6GYduItOooXNyeY0FWOe4XZYG+gsh3FyjpBGUqsHcV7QC?=
 =?us-ascii?Q?cZQz85e5BBWCACqWQEEyqkLdpae7cjKWE4ADyNvewVbvuT8BV9S5zy5jyARv?=
 =?us-ascii?Q?3SCN0zr+kFas+Vfn3qLu0/hrL3v3q5JYmieGvqFJXr/NeKenW4O/BYwGCGLt?=
 =?us-ascii?Q?l/NuZEVKBs/FjH1He9CrGcAuOCVpmsEHS5BreFdAcKeQ4/R2Ojl+AYQn9I3g?=
 =?us-ascii?Q?9InhFP8XS1eFFMajoKV06W3Sp0ilTSu7AKPBFGhoE+oXpNerV20wvLa8XDt6?=
 =?us-ascii?Q?rKF2PUeX+ptQhPML+nVWG1ZE+02edmYno/1eL2RLDj+GyjNxL1E88dc6mEZ8?=
 =?us-ascii?Q?flRWUZQ82UVmnaVA5zQN8BX+hQmcPyi1HcAVUkwUk6Gy7iRzAMqlxF00kuLL?=
 =?us-ascii?Q?Do3iuf0mvi2AxuLBXtrS4B/sQ5byV/RpesiPfpW1t9Cn1mAaZqKYTlMS+zAd?=
 =?us-ascii?Q?fOFGcU520Vq28L2q7n5f2mAQV1jm0ZMythKFBxIk1TtXQkWJaS10oFsqNI5K?=
 =?us-ascii?Q?LXCLH/mJbwzM60dBRSC42BTC0S3c7rbocbsGRgPrhjXNescZCUgOy1VFn22f?=
 =?us-ascii?Q?kI9bq7l8ef6R3Mf5TEcoEpbkDh3VMah8kbx9FYfV1pzm43Wfo0ByV9AvxxoV?=
 =?us-ascii?Q?qyI3uyZ2rryb5LxYIJdoq+i0XJ138/gWh0q/TBIKLYw6sEF5sYjNERqxzjv4?=
 =?us-ascii?Q?6MjZxIC6bEwFyZ0fNOnu42laQgEZKhsJ4EbMfw1zr55ef4VuCw5pyTv0pxFL?=
 =?us-ascii?Q?jaCtnvY04QUEUNcJNeJaLTESPsFEqJla7YHJYboOl06FHIDqWLHtuDxmY4Bg?=
 =?us-ascii?Q?0Vi3wSKrTVdZ3z/VRZ99PvDzAslYkW5/Pd/xiOuR2tYkgtK2xgwRbNLqmedd?=
 =?us-ascii?Q?QtAYZOYyJrgR5sLbzrAcwso/fatNgR31xmiUQNZ6Q5pBi8ghQdT8dQBXbCtC?=
 =?us-ascii?Q?gvrtrkLRV2B4Lrnf7f7sg8sywsCq237+snfj8+9cbvW/a9+adlTsOGQaMJwv?=
 =?us-ascii?Q?UFdWAyhZ8o92R/Ox+z8vJv80VZuzJdIio70bRRz1qPhPABVH27TGxL2q9wU3?=
 =?us-ascii?Q?c4WsZFVfzCFa5thyDVKhbNTTZ10zwFQMjPnolBuA6GFdmHsLIzPnp/lvmZOs?=
 =?us-ascii?Q?IZDAzeTIyxww+IwoFEPUcek4ApQJMkb5djk3S5ojWJPfrN0N/zfYeEUvo4AT?=
 =?us-ascii?Q?Hz1HFWepC1ODDRygQ8J9n/zXUXmlEYnYmX1uv4Goa36HAs2kO5OgYoddJL/F?=
 =?us-ascii?Q?IAmMUH/uM9fh/gayDP1Ptth46nCba/cX5tSeQ8b9h7a747RLYGk8mQ8/hnSa?=
 =?us-ascii?Q?gcGpiKc+MJ35eo79LXONVnDprjufGvyxhQ9UJtiB8ziT7FoHYdemZ4Oz5zqt?=
 =?us-ascii?Q?E5CA5ajd1SVMX5G302+duucsKlWge9S9wK05+a/BsxpeaHRSuY8L/gmFUqi4?=
 =?us-ascii?Q?oIaN3QQMdarubd+iMCOMztc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be8a5d93-ce0d-4e93-5c04-08dba2d4c128
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:58:06.3722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7uGhQgF76jDsmCPdaiTcxQ/SVpWiK1h0wID08nAmy69xWgT/p/LXvzYq8iSvbt2wwSzH5QIJliw+OcaF+Y6ZMZ2taRU/EvBkoHmNURkFaKnqyPfnWxKe934hL1CopNw7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11746
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car Sound clk_i needs to handle "ADG" bit on RMSTPCR9/SMSTPCR9.
This patch do it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index ad2e87b039ac..eed94ffed7c1 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1350,7 +1350,7 @@ rcar_sound: sound@ec500000 {
 				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 				 <&audio_clk_a>, <&audio_clk_b>,
 				 <&audio_clk_c>,
-				 <&cpg CPG_CORE R8A774C0_CLK_ZA2>;
+				 <&cpg CPG_MOD 922>;
 			clock-names = "ssi-all",
 				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
 				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
-- 
2.25.1

