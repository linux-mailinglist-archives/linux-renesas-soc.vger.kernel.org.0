Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4A4F78399D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 07:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbjHVF6W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 01:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbjHVF6V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 01:58:21 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F92187
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 22:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMSafN8oN8pQv1qJ341eDlvft/A7pBA7kDaCOlkIbe4U2Yp6YktF3chvQcndlLQIiBVEl4g4zLW0ojToPnPe+AKOjZtHR5n7uwpCWnmIEBEH0mUlX9wlKbBuhImxxnUhQf01StfIbfR/nSkcegtnv60lQwrZSHA8SWDeodRnQE74+msYGdm/r1Bb6cvgUvjA1VjdPEg2LLReIKebMjRjsUAed9vcAkerfd7OoqvMxbIbhDh7mQKAH0gbIc66Kef0fvPeaPL/Mcl4eTpXeOoUMOf8lEhXFzLQZ3XJHlzvkQ29yvI5oL4AUo15LmXQsbDP+DE5GjDARzTz8baOwp+pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huEosP6KsYxMWU2yANG+7VjUT2BHvUDCydPcfCd79tc=;
 b=FgpkveIb8ZJV3DagyWnW2pIA6ZMgPC4q0V3EOOQ8KTkoFQfIDxthy8zMSNtaoWWT8fnQrZpsKvh5oQbZPbE75XilQMsaPUHma73dbIXLHkBCblw84mpSThBTnX1OxBAc4BN8DW/QkX1XubeUwCeFRiKGSEYaIyg8x8OatmO8Wgw6FBSdQ/resOrwZtYT1+DoHk7OmxNEWIe17qiUxz9JVpKh1M5aI/TyrV00dEOI46tVsyT11q3dFb+KJey/jOPXp5BcLPNx/NVVJNuTcEO5Q9PDNaThBiSjduCRAWpKvUn4TFyjvNQZstqPhZ9Ttct8jEd4UD1wTDfG1NdttF5Bcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huEosP6KsYxMWU2yANG+7VjUT2BHvUDCydPcfCd79tc=;
 b=Tvm+cr3WyaZdDiFzKvTqtarO3sLx3VcpgXC873ZvD5YQn+ypYzPMs7HAhQ6QsNlYhFqGVohwH4nZVk4gVWkaC5uMaXJzrmqJCYQvW0z4MuOvsyqmn1ypOHt93ySe478lFF5qOy/LOHM+U15WhFRyiDPhLjCMa9B7DlPFntcjUbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11746.jpnprd01.prod.outlook.com (2603:1096:400:404::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:58:16 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 05:58:16 +0000
Message-ID: <87sf8bsjns.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/15] arm64: dts: renesas: r8a77951: handles ADG bit for sound clk_i
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg2jsjot.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 22 Aug 2023 05:58:16 +0000
X-ClientProxiedBy: TYCP301CA0060.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11746:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d38147b-be79-413a-e1ce-08dba2d4c729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s0gyUnEm/OUWmXjvd88YvcJl4yAm4vtKKoIyB3T239SH9iB801GwLXLNS1cSoDhi7NQ/1k5zAWyyk0vulUYVdZ0Kx4KU7K2wbNHVpSMw6BjvRoZDG9adxL9qxyQJa3eUBRgZ8OsV4rJYwTZxjgLBC+FXbWlKdeeOcJ+7eCDMaYlLj3yfZ4YsqY3rLA8AteuKk8JnjUbzTAHnCgJqIRVjOfzgnP8i0n/nSzp1jxhAe3IWSL8p27NqBQ6o/urayfXcT+Z4xAxfKQOHpddUbTrzGFe+CpWzZmp41w+Fu3MkB3mYRkUiZxaSI+DN2rZXcN/FQeZeSAzc8hCFM9cVVseWICHViFTMrHO0jOwCSxBNk3Vl5qXVry+IpIuErd9ycu3jyNuoumvpsLM/cEJYjHBFgxWVuhPdIAA8qgfClyqYyxDOKeezAIJqn67y6IfQmNNj4AK3AZJuDxhBm8BRk0+2pteWHIqpXqgXPcuq+NpSXT/U4uEECKtoG2U0fMixHphzT7jdqK0DUPbuGv1LGAEqYj+RT4sDdI1atA+lbrT+qqNuQgyrfmqtoMwhtlUi7ksF2FSiLpxJl/2E3cHbAdDBSIOWwLg4zswLHHvWQctewZZ6Fo7RCCgjM5z1h6fa2Vxt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(66476007)(66556008)(316002)(6512007)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(4744005)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iNYWTcK99V87ENkuTLiVK/+xFRzxWtU8O6QYeQjPQIv2wy7MapuHBTatBY/J?=
 =?us-ascii?Q?zlaDfqdyQJ8xBnPg6cTZxAEWFp2tjWcBryh8R0pXvM8/gv85DU1F8aoRE5v4?=
 =?us-ascii?Q?1r+sGTE34wOWL5XM3AdLIG/MpEVzfBUlCIUmU9iNlZ8A7KUA5D4lYhJV7B++?=
 =?us-ascii?Q?32AzOyd3Xs9pgWQ2MAZ3hQo4d8emIeUojfCfHX7DJz/SDyiSWAyQxln1e4oF?=
 =?us-ascii?Q?Nrihul+bIUDn/d/SoXYXfhaF/zBijFO+ebjW1GzYIS3jeB6460cHt5Kq4mIp?=
 =?us-ascii?Q?quDwgjHbIfSUxNBc60NPXrvRyVgxQ+ieY8RY+t125Zz94blN4ak2onwmOMwO?=
 =?us-ascii?Q?ufUM97wyIqOtrw6KN1nsEjUctoEN13C6MJHtt3dRHgAYlmS8hiOMrK3A2b1g?=
 =?us-ascii?Q?TaxTHFD/d6CShOv7WPKLuDt2JfjtqHVmN2S7pPi+QT/yzszDxTcBQr6L7BXK?=
 =?us-ascii?Q?KLNJJKA3X7GB9eVzFlN3sjWK3Y412Jri+9YfVR89CMt/TtbVyYmohOIHzpU3?=
 =?us-ascii?Q?LBAc1tmcwQ3oP5HRI8i2Ab4NbEtdY4jqC3RuqClP6JBWeGQJLIIGIgi5sVTt?=
 =?us-ascii?Q?V4HEB625vHnWgPFPZCOBd+L9rOwy59N3Y0fbwciw/2ZNwlQidbdp8uLjgH9u?=
 =?us-ascii?Q?KPjwiPSKs4Oee8L0bhWnRhWhquSC8AxfoRP8+F3Ueb3ZbihmvRj7kWw2BJ2i?=
 =?us-ascii?Q?rUwOzV4xA8g5Rl35UH7nVeDcsXV0z1x+Ff8qL2bExoucxfXwgPpAgpcZPxpv?=
 =?us-ascii?Q?77RGq/67a08OYDobW2KWkt73DbjVWn6V3TLzIjtJuZcf/RMe+qxbhJaTtgY5?=
 =?us-ascii?Q?qfTFNnPnES+k6IzhXK/RSatpquNm3sCqIoyedqkaBToDjhu8jryUFrxiTSYx?=
 =?us-ascii?Q?emu82YgtmoMn18C0zNx6Mm5wviEwDxwXd6QZVWAZWkqWndggklZfTE0Nnofr?=
 =?us-ascii?Q?aYps2GC4zQ7wntRhSKhqBgWuHsZzbnVJUn7OdoTy4DtcILTr14ENMmP1spB6?=
 =?us-ascii?Q?TW4Tw+ySXed8ZR7QvmxpRhb217EC7lRlJHiCTyK++N4CzBpSGQ5BRjlLnbPn?=
 =?us-ascii?Q?ANoIi9r3ljoZhYw5wKS1FWQtw/wRhkpwlHbxfVtBCBT6U5l6O0vJWuSZ3YBv?=
 =?us-ascii?Q?CCQUxIRzIPwcv0fSUKGRl7+hT9H1UVRpWljXHN/RSxNjjjY32rjIhztTtBFV?=
 =?us-ascii?Q?jOGyK5n2Gdxvkg226Bqk7meO/VHynLshTuJiSLESGhjRB/oFEjacLbAcZvNQ?=
 =?us-ascii?Q?JcaiHsgc9OMzy2ZQfRznsXIDM78TQ1Z6Cth5R3A9Hl2E9MZhwTG89WsbY6qY?=
 =?us-ascii?Q?ONimiyobovtchTrS1d6kxv1c5BXEU9o5rFqmgLdnrc/I8SKPWkpjH4nO2UFs?=
 =?us-ascii?Q?l+EPhs7QlBTeqqyysPs1zaszSgin1O7gNgkfL3gFizjZKRCTdxBV2EG7abKk?=
 =?us-ascii?Q?a9Y13iXTR1h1/us99DEK6tR8HbgEWsSHcUc1Bm/6Ef8FJfUj7boZm+njywrr?=
 =?us-ascii?Q?znSgKKd7AG7YOeEvX48kV8FPr2AJ2o9yLM3jy8QbQTMIA4MgycHXMqynM/mk?=
 =?us-ascii?Q?/SFl4q6nHrzDJQbTWjXpVo6ONwI/TPjjoqwqkKlCShgfFHHsglt2rBBhfR0O?=
 =?us-ascii?Q?ifjy8QHgZTsVNoGrzZJj17g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d38147b-be79-413a-e1ce-08dba2d4c729
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 05:58:16.2223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWsE6rMbMf9/7Qh7nViFY4/ZFn1PBmqLzjBNlUBOSYwudxuBKidgAW3NfMDMU3XCeXFDCfDGAJk1cPKUlP3yYWFx5aNvv9menhMgwXYzai/dAbvtdKa6RremDebZ7Wep
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
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 6d15229d25ab..80035578de26 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -2032,7 +2032,7 @@ rcar_sound: sound@ec500000 {
 				 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 				 <&audio_clk_a>, <&audio_clk_b>,
 				 <&audio_clk_c>,
-				 <&cpg CPG_CORE R8A7795_CLK_S0D4>;
+				 <&cpg CPG_MOD 922>;
 			clock-names = "ssi-all",
 				      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
 				      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
-- 
2.25.1

