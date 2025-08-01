Return-Path: <linux-renesas-soc+bounces-19830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC727B17E96
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 10:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A26B83B0B7C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 08:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CC5223339;
	Fri,  1 Aug 2025 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="t/EkB+Fq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE7B223323;
	Fri,  1 Aug 2025 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754038149; cv=fail; b=i+jb2Bq2gQ/4q1Z5GocFHdfrnVnB8x1VkN7TU0MkyynceivUtssf9K/i8ZZjuYKdpWT0K8tct2TUUUiUszhyxyjtM24iDQ0A1qsfL+sfyO+d8Iuy7DlxNWx4UZNCr4VSIZqdf3Y38KyyLqr2b5MFqfDZCmZaNg9TUyhvw6v6Nfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754038149; c=relaxed/simple;
	bh=pzaNSsptiSaHLHrfISD04rUnn5X4jr594HHqOTGGdqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QE0O/FMHkPmULBHZRpQbU9VIiK+n17TEPu7BlEoDHGgzmyAvKzv+xfuQ6lcwwAlM73mBtpEQmrQN1/2beb8dvbfETUS9dTCo3hOsPChX9Fg19BijYYTdStipTAEMdhCTp2+vHX5zsSdfxxYZ2u/iKuxnO0lzAKQ0c4yLuyV3BYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=t/EkB+Fq; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i92YQ0iWBCH5ePacRNBnr4f7HVTQQQlHM/K26oA4jn/8vA8UUXimZrL+JZqqQt5lJA5cyzG7v3aFPOyKDQwnEvZUyxFsJ5ocBu44BjoqzGOpPUG6bXRE5JvX3NSpXqXSbbnCQTlXCgqflvP/EVXgqIXsLY4NKR4rNeqXKfWH4Eo0CWi9U/2k0wivg1agXklnwFTQiKAwkxBsw1qUpHHr2gH/Dy38L5Dg2Hv4NL7uSwR4twkl7RSgzUeZssAohRcNHnxdw/+jsTqn7fKjtVrjuYJpfqJCOrfTmZoTNKVEcLlg/urWUt9247NO3mXjfxbdtXeIFLjHhTjmHOrBJobayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9bTaYojWejIudSkJrII4ie0z9ybUWtyLyb8F49eiA4=;
 b=FLXM70P9m7iEXaouxTvwapOmBHgMeZG0PAq7GwCNnucRO2GDQ4t0J+LimtgslpbMOkefu+QOpt2gys8Pt/BUV8p35s3/RSECyjziexCx3l7XFI0XtaOXDF8PHBv64rYrGBunfA9UbwwQT29qPyeeqeyWSlXd3u85Ykcv7eSaPsmvwdBDkLDEYRJ1zTY2H29JUTXcxJ4oDs9tCQb8gh9jmrijIVWHgTZVpdx9a+GhDIcJ6BXw3pE4JCoopQS/pWKzhvoLMo3F56VdMSBkSWR09YlQQo448sgbcsYcxl/ruHgIXg3VjYlY0F/3XHUxZXiSSuRS/CelrUUBGlL+RgMZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9bTaYojWejIudSkJrII4ie0z9ybUWtyLyb8F49eiA4=;
 b=t/EkB+FqzupE6A4ymanHR390ccQN//Z5M/LY6tBkcKE8x/DF97YRwO6pSB5a6dgf4lwTj8uU4+KFBUgONAqJ0MNkcE+P7hCAA6yCHM2w1WDujE9G21enpZCmcaqLGTpIZjkHOC0pKVtpLSGbgX2Sp+TmfvDO++cOWIT64ANh5Mk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS3PR01MB6657.jpnprd01.prod.outlook.com (2603:1096:604:10b::10)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 08:49:04 +0000
Received: from OS3PR01MB6657.jpnprd01.prod.outlook.com
 ([fe80::8575:e22a:3c44:76f0]) by OS3PR01MB6657.jpnprd01.prod.outlook.com
 ([fe80::8575:e22a:3c44:76f0%5]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 08:49:04 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: renesas: r9a09g047: Add DMAC nodes
Date: Fri,  1 Aug 2025 10:48:23 +0200
Message-ID: <20250801084825.471011-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801084825.471011-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250801084825.471011-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MRXP264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::21) To OS3PR01MB6657.jpnprd01.prod.outlook.com
 (2603:1096:604:10b::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB6657:EE_|TYCPR01MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: 04906a0a-be53-4bf2-4bd7-08ddd0d8449d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kuAZokyGMxF49AlIBlibMhJtMe7PxTEBfPpkRJ5mrlzkPHTLQDa1IdotHco0?=
 =?us-ascii?Q?PP3rJyuEppH9jICnmkkeqXfYZFyz/fys+j6Sm5pLv6clO41zkLLLf+yUE5dI?=
 =?us-ascii?Q?N2ZkyVSNuSKdOT2l1cQwVJTDQ3EclQXORiiWGl5sPoidoDT7AtMx6cqoxfl0?=
 =?us-ascii?Q?DrKJK95c4fHtp8dQ1EIpkv2XLAab6zPQ2SKbUsYZ35u6dV1oedORz/6TvspN?=
 =?us-ascii?Q?Qs1RfXw9B34DUMaday8Zb0lS622PV01nl5QZ+9kYmJpLcAGFlF3/H8JzRNm2?=
 =?us-ascii?Q?5CheZaS9c9N/h6k67D89QrfbWTb8TxRKLXOolzdC0DhQ6QdiiD26YjwFpBON?=
 =?us-ascii?Q?FpaAqGW0ks9GNonssmTLv8gk14TFopCBDYhst98m3+As12+BLcg3D2o23d+5?=
 =?us-ascii?Q?epUQggIT5Vs5/mSOea8rugKIrQVmD30h2nsiYPeeGePqR8l6RIPyNj6MOz8W?=
 =?us-ascii?Q?QZugK4/c6l8UvcmvfGA+gaReYvwxYYBqNe8f5T9xUV1JuIrsdUxYkrt4fzpj?=
 =?us-ascii?Q?H552V7HCT6ym6oJC8c3w6KMOcz8C/EfH/+H8KiZMR36vU0Jr6akRUh+9MpgA?=
 =?us-ascii?Q?PEOUs51b9WoH2bexj4PSIl0Pom+Ygarqien5dit6CbNh2QOIOd1vwZww+zAR?=
 =?us-ascii?Q?LWn59zj4R6Q5KdbBwFAwGsh4LfBiWDaQIOWa8GjKgA4Pv/qdMW5xbk+AWDiz?=
 =?us-ascii?Q?NZ1SOaq8M0WvmqR/jnARabNWxueZ4uZPQgXoHUWWiNjvH/I0NVo2XVclhMNf?=
 =?us-ascii?Q?Tv5hWr9nm2VLCNQPUdfdVGAFkEwHSzAPKsH34Y7Ek8LPNxx0E0zJgB/2pFPE?=
 =?us-ascii?Q?huJiYNdOPWf6DZiYFxO6N3MyEJcIJPYvJVIo4UZNyuoCenx6CdKpJy1JZanD?=
 =?us-ascii?Q?VTi/T5s67TX5+fGPu6wL7cRqSHAKida1hE4m9EX1mFVq+XOyIA1fisP3ubhO?=
 =?us-ascii?Q?TmVbzwkPoax9/A7wSfalJ0J7b2SOvkKnoPOOcWaFbRnRwZfcY/i19md6HCq9?=
 =?us-ascii?Q?QcjD4moMqmcgb7HUa0iCvOeMMWHWlbsK8FXnegQIeC8kOTlioI5us49XU2Sf?=
 =?us-ascii?Q?+17kzUzatydZljfmuwvddSG4iWfY9vjQ4kR8ix+K9S3O3BhWuFryYAw6i4To?=
 =?us-ascii?Q?KfVRVFjZ92Se3iqhVgI19MQ5z4NhvP5YOrmhYEYAYjxN7KTAmp16bARhoKhu?=
 =?us-ascii?Q?KNOqiFBkA108WoKCQN+LQYPKZ2pfL0xSBGwCKPII65tTWzmFjfbedAImBIgr?=
 =?us-ascii?Q?hQTcsmy5E7GEl9gGlsQgPkcQpBKb86Ai3DcpIE+sXkW0/LHD2qB0YLuJ+At7?=
 =?us-ascii?Q?I9fASivYubPw+T2R6odyZzRRkdptZDzbmKCCErI+SIFZrl/JXAjE0az7rPOQ?=
 =?us-ascii?Q?tWWMJbP/mlS7MFttZFDs2bu0htqgC1VfeSp9YZ6fJTyZQ4NaXtEK16sul3j7?=
 =?us-ascii?Q?z1S2Uww9icpNRvL5HCWujI8uc9oEd3An5/8x/CHIvxZq9Z72QHR58A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6657.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MylWTukJBPwwGbJnUvcnS1q6zdTZeAh86ZLU3aT2IqH58aek+iDOqsJz5VNm?=
 =?us-ascii?Q?2hu+t/y9EAfe2tWNZ+dEEi2Gex9XXYvd7ylqW3m0W1s3yiX9n5/wist4fVFp?=
 =?us-ascii?Q?Zb+ZRhSgI8yBoy8M4m8dVYA5NS9GA4XgC1OVlqYDhvgOwA6xA1JX0V9Mx/Bm?=
 =?us-ascii?Q?DeYZi+wS2KsXJnZbITQyoCFpm2RIxVQ82DIttu+4Ds5vD6lzbJ3GBYAk1VAM?=
 =?us-ascii?Q?Qbpmm525zcl31Pps6SF7lbhhkW85c8WAWNFr2fxf3LnFBywBQKAdW+NokkaT?=
 =?us-ascii?Q?UHh/V3TeVbqGewjxmHlzoWhL8vhWz/DcXVBDeG/SWgFZbMAuM0umajfjP0R2?=
 =?us-ascii?Q?9n/PLlPYoNDOieCezUmSueFJ3HgvmuOuxAv3uAykaWTkryhNHLPUPsNYABcA?=
 =?us-ascii?Q?tsvj7X3ONHLQKtIneiDIZbosaPc55+bpUXymI/ETw0ROzZYsY28Y17Qm72+J?=
 =?us-ascii?Q?wmgUaUCHR93kJtAzEwPKx8clk2ESkzCvzhPOU8J6sIszpkiOEdDfzC1rQTkt?=
 =?us-ascii?Q?Q6RlhJvZeGEmBHLBI0RGMvAY4RyslA7cPu/JiebIvjAjY81enA43w7px8psy?=
 =?us-ascii?Q?Y47Thi1joYx6SNo9przLwhWsl/Ml21r57jp8qCsPUjaNzoqkABffbQZ0vl6C?=
 =?us-ascii?Q?d59pXXwyaB1Od7R8CvVbD20VMp5ChchNouSNLnBw6l3JHiwwXlfOlMg7VgS/?=
 =?us-ascii?Q?sK2Olz2pV+QUNGzQUurrifc0ibtHdxxZSQp0DI6NeaAXMngFvjfJhEudwizM?=
 =?us-ascii?Q?Lxtw/Cno6fF8LWnXnOiczCGFrC7uKj6mv8JseXs+44By1WEMiP2/xwziw15k?=
 =?us-ascii?Q?L9QRX0CP3M8bvOHd2NUq1j0OTaSEkRZSttEv+03KRXMmk5lFjjqxTFPvLQbD?=
 =?us-ascii?Q?pHEINGxZKopXUSz9qtEn5A80P+gLZZhcT8LPJMj+SDM48iO6+bwy3lJ32HVx?=
 =?us-ascii?Q?zPxxTPEn+rTTAt3XiCFP+3bphSmiP2jE+LsK81DYp58k5w2Tyo7BPk8Y+0eF?=
 =?us-ascii?Q?jnvhFtkFFwymVhvfmjkAmvgoBkkZMSnEX+xZh3+aTtJLX9lf5pocNOfdHCZt?=
 =?us-ascii?Q?Jah1dpt558rKlFNvc34Ee4rLIlK5nhzNl6X4BXb4jptllzJD5iEb8uyF+euN?=
 =?us-ascii?Q?7qy4m/Shfv1m3CxKDqh21wTERUaHMJkRgslyK3ixvSxfmVrunXSfbvNRb1Ik?=
 =?us-ascii?Q?BgCxdmO09Rdu/Z2TmmXKXVjlZqPEEBq9tEQ9JEIAGqlihLPLRusbyt91PtQA?=
 =?us-ascii?Q?l7ilF49tsLJ80nDuDS5f+2upHvowJcuUy1vbQFfPCxwVILAvIVZt9MT25hc1?=
 =?us-ascii?Q?PalBflFE3IWY96uRjXgdqajOLkU8IzWs9u2+0SjY8BnNGfUP66MEhIszslh7?=
 =?us-ascii?Q?bOh6cgvJkD/qMAZ6GWP3uPdF676OjbCHYc6v+EbkSkqHtcALvts+rIOgNrja?=
 =?us-ascii?Q?F2eH1wMsE3O1HP5YC9bn6ssFZaa6AZNTMunhdJ524TsBH6BJTSTFyo0t2Pmd?=
 =?us-ascii?Q?Y+llUYqPqZrI6iBThwOS6DNdnWhkobtrL+naAl7flzSxt3Z8/58JTjz/kBXf?=
 =?us-ascii?Q?VBxT5TFJSGFgUEve7/cdqvNeEOzXIm2SievvjdMfmoVrgZvsmPcs+yS9eQSu?=
 =?us-ascii?Q?uuiORQ5Gd70Fny8ZciID8fU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04906a0a-be53-4bf2-4bd7-08ddd0d8449d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6657.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 08:49:04.0317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApRIXY1cjMSRVFvOvbxocQlaL1UKl22cOhGUbc2DhY7j65gV2G4efttd9XGBfjLyMG8VAbvJzDMfdZjHLB0s8fQqR73xbCj0dWEB3jqZ/3nvYJKj5l0QhVSQgT5zGlfq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

Add nodes for the DMAC IPs found on the Renesas RZ/G3E SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 170 +++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index e4fac7e0d764..eeccd1345f71 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -301,6 +301,176 @@ xspi: spi@11030000 {
 			status = "disabled";
 		};
 
+		dmac0: dma-controller@11400000 {
+			compatible = "renesas,r9a09g047-dmac",
+				     "renesas,r9a09g057-dmac";
+			reg = <0 0x11400000 0 0x10000>;
+			interrupts = <GIC_SPI 499 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 89  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 90  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 91  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 92  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 93  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 94  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 95  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 96  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 97  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 98  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 99  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 100 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 101 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 104 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x0>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x31>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 4>;
+		};
+
+		dmac1: dma-controller@14830000 {
+			compatible = "renesas,r9a09g047-dmac",
+				     "renesas,r9a09g057-dmac";
+			reg = <0 0x14830000 0 0x10000>;
+			interrupts = <GIC_SPI 495 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 25  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 26  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 27  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 28  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 29  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 30  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 31  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 32  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 33  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 34  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 35  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 36  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 37  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 38  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 39  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 40  IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x1>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x32>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 0>;
+		};
+
+		dmac2: dma-controller@14840000 {
+			compatible = "renesas,r9a09g047-dmac",
+				     "renesas,r9a09g057-dmac";
+			reg = <0 0x14840000 0 0x10000>;
+			interrupts = <GIC_SPI 496 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 41  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 42  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 43  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 44  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 45  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 46  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 47  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 48  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 49  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 50  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 51  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 52  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 53  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 54  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 55  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 56  IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x2>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x33>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 1>;
+		};
+
+		dmac3: dma-controller@12000000 {
+			compatible = "renesas,r9a09g047-dmac",
+				     "renesas,r9a09g057-dmac";
+			reg = <0 0x12000000 0 0x10000>;
+			interrupts = <GIC_SPI 497 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 57  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 58  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 59  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 60  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 61  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 62  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 63  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 64  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 65  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 66  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 67  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 68  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 69  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 70  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 71  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 72  IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x3>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x34>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 2>;
+		};
+
+		dmac4: dma-controller@12010000 {
+			compatible = "renesas,r9a09g047-dmac",
+				     "renesas,r9a09g057-dmac";
+			reg = <0 0x12010000 0 0x10000>;
+			interrupts = <GIC_SPI 498 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 73  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 74  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 75  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 76  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 77  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 78  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 79  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 80  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 81  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 82  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 83  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 84  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 85  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 86  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 87  IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 88  IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 0x4>;
+			power-domains = <&cpg>;
+			resets = <&cpg 0x35>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+			renesas,icu = <&icu 3>;
+		};
+
 		scif0: serial@11c01400 {
 			compatible = "renesas,scif-r9a09g047", "renesas,scif-r9a09g057";
 			reg = <0 0x11c01400 0 0x400>;
-- 
2.43.0


