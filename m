Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B98376A526
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 01:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbjGaXuO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Jul 2023 19:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbjGaXuG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 19:50:06 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3CB10C1;
        Mon, 31 Jul 2023 16:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyKo6XvdsxKEa05HtxLXBs2y+dMLJGU4nQU3twOHWxQ8Lz3RM9QCRN3Pj1ZpMvj37s17DQ8WcJyeGLDaKraUcIayCjsdV5jD/vZ/TG/VMJBbkLCnFEkmBavBczv8nHZ+IxRbCGLIMNFgQMGXtjmxHstyQ4ey3/wj98Xjhg9K/ymRDzh62zQzCACXPPNRKVLqak8qu2rCykWPIACdgdEkZc+z/sJP60pSD4XlKJD+zW1PHDcOM0J+oC0OTpu/kH+3GaHH0H+wxnD8DksybuEDTGCBNDoEccH4tnEqmvaTpqCLmWFpDQaLhU7gSLKwF+Htk/8tGmZ7a6+YLMzzT+NJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEahrsadXHTOxFCP2FJXdkWk1izyLMmocB8N7FWXxIw=;
 b=SXgCP/k0X7vhZVTBp4a2ZOpDry4hhvqsQd0cL+micjU1hU5K2hCUWqh5xUFWWtjE5lWRrVSMe0MKYa/JbmUB3+qdSnPaW4WDUIe33D8MNjoc3iDi2qpdNs52Q/lzAMze0Z9OFhZMK8ZvljUccjObYRmk8gUu0TYWkvn7YC/uil3t/dKFkLh/fQsuAcXtN/XWo5uhh6GnQQzq7FhZYHOCs/cUWFtGrDyZzqutwFT+0G0rnIn9It/MnxfhkP3ZdKoFnYjWnTBieKoP1gIdkpJ/vSoHMSAEIf9cVywpsHWTerC+BLUDUzYkbfEGh84GrCc3VTnV5qXUPxNb7iOanTLBrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEahrsadXHTOxFCP2FJXdkWk1izyLMmocB8N7FWXxIw=;
 b=FQw79RDF7DJoT+3RplNcFgcpT1dPqnBX/ay987pYiy4JBfdjqpBu3Bykfju6Hk06GMu1VNv2uPZchNx9+ajX9xM6E12fcMy7vFv5C1Ntq7jNPttdCp0NkHyOrC4/L9AqTUI6SrguiXGPTy7UMSctPO+Pk/VWeRXXfDOmUxRt4Zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11995.jpnprd01.prod.outlook.com (2603:1096:400:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Mon, 31 Jul
 2023 23:49:55 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 23:49:55 +0000
Message-ID: <87jzufprod.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/9] clk: renesas: r8a774c0: add 922 ADG
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk@vger.kernel.org
In-Reply-To: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0onprph.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Mon, 31 Jul 2023 23:49:55 +0000
X-ClientProxiedBy: TYCP301CA0021.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11995:EE_
X-MS-Office365-Filtering-Correlation-Id: bc06f775-b3db-4910-aeea-08db9220d74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TbqKnA/zdjGkD1051UyhwCUGQBCOft/7P4phhgAVpT5tpxcIdCnAoRRidH+AwOcEBTWby1W8U1DwvFHYIAZF3S2B8sbtZIRWEgrf9p4vQF/ZyGeRmNrocAq0qtGSW3On6Blo2GVwNErcguIfkKaUo1keZ0rgtLyUxgyujFLE6apkeqVTKYWp8ZZWqI5Pv6H4kEsLBjIjkFnfEq6C+1k/Pa/JqX5SMIIlWSQx4MIpVJbEj7YutanxBl7drwdENioi4fmTwyrzTtGCeQqhy8xcPaIT+tM8M6xCv+95eFuiTxvhk5ZN9TGNhADMJ2qsWYuAfIZNxvBtCpc0JGQNb0OM2u7sasakA74Q4XwE/S30sxuKwNpBbT/O0wQNn6xwDqQdzqpbBZXc8hJ37iaAGSYO5HqzqYb4HqTPEgwz9SMK+z0BSiHHdkiyHRfJLFAKh9baHCq9i1aemg8sdowLtL47eEoDr0+3+ZYSq5izAm9U7y1Hjue9hs1/MBqUsbJl9eHaKudmYCq0Vr9sYNKstsRF5/08T61FpH0R5uifeVBkJfeGlG1k5yGFId+UWZXdwNEyg7WSD2GIX0GB28gU30iduKerrip4WOXaLKGB09jL5ZuwLE0kQsMT7CugFEIDNB/U
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(478600001)(6486002)(6512007)(52116002)(66476007)(41300700001)(26005)(6506007)(186003)(2616005)(316002)(66556008)(2906002)(5660300002)(66946007)(8936002)(8676002)(38350700002)(4744005)(86362001)(36756003)(38100700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?quLgL1D/qFm4fbassmhyDwQkVn1jud02klP6jhsGq/T1Jc0Dw51nIqLBV3Y1?=
 =?us-ascii?Q?XjbA5xpOln52ctOgtGn2xMoA3Ox935Dd+e7D0/U82KDUCx74xKAr1rBIe7Fx?=
 =?us-ascii?Q?eKwDCGb8jkY99pu8J/lJ6MSKdZ5BG5Cw6oKWdy33o7fNT3cbq0ZAN5GNieO1?=
 =?us-ascii?Q?4iYhdYBGv03UH2gP+L06iVw2kjLpkQY8+wasRF3k4xrZzulqRcVsSQdZuKir?=
 =?us-ascii?Q?si+Q9CGyJBMat37jjfQ2K4vgckCzwDoQ9DEZhS4VzLjhD3QIJLfEm5FIpAjT?=
 =?us-ascii?Q?/mu+Du6D3zgrOqaM3Et/BnCVn5mB9FcsczyBzgjP2ftt3uVIgPTwBRbGWbgT?=
 =?us-ascii?Q?8BqB3TxVL81M0KAKN41H1U6b4l6RD+kWXC7DVZIV6Lf7SHnR/Z7GhWmlhcfB?=
 =?us-ascii?Q?1ZRl+K500vC+wLL+e8YiV+0NjAtUMI7MfE2q9gIiefBWBfvNUjhUs/T6gelB?=
 =?us-ascii?Q?rksSQltkILAVQRecM+H6RCGKPo2/ynT2CmOPttHjelsfIvzKOPkP7L/Xuyc+?=
 =?us-ascii?Q?sIqURrkUdJ3iFRr+RxrFBI3xGUwe77mUqz5j+/4VIiY2p57O+eKHRU9hZ2bf?=
 =?us-ascii?Q?Y4eNR5EWVr6HTIuTznL6FIe4BpFUqGCE6Uwy/N7IgXovgqVxzxoSCa3CuPcv?=
 =?us-ascii?Q?UIQ5gNm7LR9t3Gfti7xQ0HyQcr+1h7h67NJ/tZBX1NaFmO0Ay+UJjGOXMwlR?=
 =?us-ascii?Q?wlhbrO0NFsDC7w5SWsCl2X1RBWaIiysNT3d5upNQC6Qy3IL7DVYuWrgQN5G4?=
 =?us-ascii?Q?gZ2Q08J+oMlQ1hc+I6E1bS1XUY3A824NNSZu+KS9b5ygAJ2/Rdxm96Iojm35?=
 =?us-ascii?Q?Z2inhdWq4ev5BTGjzZiFE6Sntr6j1thWXh0STb6x5sy1TlsCkxWBYGcDgq5z?=
 =?us-ascii?Q?aFHt+19V+WcSmR8TPG8pAhFF4G61Cavz+AeGZjxr2HuB+IFAKWsl4U2c6jBE?=
 =?us-ascii?Q?fs6W1w3LrGXANZ4PXxymY9FYi8gfZ6qkW9CBcIs/gMYUX6zHlc9yb9sZ/hgT?=
 =?us-ascii?Q?D1KiH5EEMHLStZEV9FjkY81IMVe+LvQKnpUrREYRvoHI/3AT1Qu695QB2sLw?=
 =?us-ascii?Q?8Zylm7LAA10x7aDbqaXV8HmWCUASlCDr5pGBtP2ZW8AT2hbtVZWvfNWlhsiL?=
 =?us-ascii?Q?UwmveI4ViYX/xjn5jK/tnPX0IRD5ruQwoGXA1cf0nnvvPmX2K9NUHaeqx5Ez?=
 =?us-ascii?Q?98l6eS33e3CkiH44UazcuUkrV43IacODGZ7U3WLNKJCFNtMWqokknXVK1ufU?=
 =?us-ascii?Q?EoVeQf2klFFXjerRbf6Bok7RZAZuWEFhlAyCRq4O6F3fEKCvXtwdK8u8hU3Z?=
 =?us-ascii?Q?ZuWihf+6+Oft1XONSPD/WePAZaqBx8xCGZhM2ltV2XRwTGQ+Rfn+6B08grM2?=
 =?us-ascii?Q?G3fQvqNESixl4YqjbLIIxGNGN5MKS9jYSmTLyD9g0x8TojJQpHd7Xmw331Ms?=
 =?us-ascii?Q?qyYfiiVCo1+yRzMZeR/efvkV6UePUM3ZtIwyg8o6jqsldtZQoFZc3C4LBnGC?=
 =?us-ascii?Q?MnCiWUKB2YzeX43YR0HF6j5nkwO5b+24HpayicDlXgW6lYY32j9Z8JMtQZ9j?=
 =?us-ascii?Q?tqnq8iplbpnhny9w/48clpyi2Rhy7uFoLfZDAn5Tfd2q6JbxPXZnon0N/kpr?=
 =?us-ascii?Q?NUfiO5S1cBc8jUEivB4g4ck=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc06f775-b3db-4910-aeea-08db9220d74c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 23:49:55.3200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRYmDOIuLnLkROV+7m4hxpuMXuREXUMQCClKSrT1D4N+7558EEfcChRlfn8339CY6Lhr1/zn8texQIB4ADBoxM31tmGpiutBDXQX8PXvpJ0AeFTNjuq7jE+VuGI5HSI5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11995
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car Sound needs to enable "ADG" on RMSTPCR9/SMSTPCR9 22bit to use
clk_i which came from internal ZA2. This patch adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a774c0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index c9c8fde0f0a6..870f8c55eb28 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -211,6 +211,7 @@ static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
 	DEF_MOD("rpc-if",		 917,	R8A774C0_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A774C0_CLK_S3D2),
 	DEF_MOD("i2c5",			 919,	R8A774C0_CLK_S3D2),
+	DEF_MOD("adg",			 922,	R8A774C0_CLK_ZA2),
 	DEF_MOD("iic-pmic",		 926,	R8A774C0_CLK_CP),
 	DEF_MOD("i2c4",			 927,	R8A774C0_CLK_S3D2),
 	DEF_MOD("i2c3",			 928,	R8A774C0_CLK_S3D2),
-- 
2.25.1

