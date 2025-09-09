Return-Path: <linux-renesas-soc+bounces-21592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CA0B49ECC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 03:45:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 103BE189499C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 01:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320AF22A7E5;
	Tue,  9 Sep 2025 01:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="D/SL7Dw5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011062.outbound.protection.outlook.com [40.107.74.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8B426AD9;
	Tue,  9 Sep 2025 01:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757382298; cv=fail; b=Fwe37HkYomtlZt71v667l3Of8jk5xfbkYhKh1KlF9ypkCf980Xqe2kgg8JDKbnb8/kd6KPURX6+/Vrte1qMSYrOBC5mMsE5G6EHnSyl+X7g5j6eOmC+Q1UKxct2lq4RtxU9h3XrOXgjUaHD1YQSby+QHpUvM6WGHatyuppecF3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757382298; c=relaxed/simple;
	bh=gdeAtCAzxx3zH0k3cqTS/9sIG6J6chSR4uDYpzloTzI=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RF9ED4Lm0mGen/axolwuUgbsWzn4BDxxEOGEzICXiZAD8UUBYvYzepw1R70cgriPibe4+f2tXA/vNIOZ6Qd0PC1k7aFME0R+yVcJ8kK3LZ1CnEMLlWDXfV3Pk1phPStH3od68LL1tPms2pF022uJVg4SbUpMZKqLKvpLDk9hADY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=D/SL7Dw5; arc=fail smtp.client-ip=40.107.74.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdGuMZEiRWFgPENN+4WoKeIpPYt+YUJaAlEGOGx9O7myctSlx8/A9wnuRHLTmNpWMjs2upaDWSZmmS1mvNjnGpcLGHd8z9gzTdoodCl1cJwfNgzHW8aAPyceWYfWuQ9kxteLZ2R8DWpYJkGApv8nRY7JlLVOPPdODcD4B2ccJ8D4+8yVytqBv4MfpVMv5RPA6M49yDPiT9NjDp7IBW6BrGWm2bj/jTfZH6h97n6nrwefssO089EuWkH1fA7A4JrXH1fHXanSLbwmO0Y1tgtoXLAoyLUEePevNc32W1pj8lNOrl7MSye7uTER2+/mitxZBIq/bGBB2PP0tpoWRNPrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4nN2lqubOcM80ns8haQe3d29Snhdn58Oc7giOiFqso=;
 b=H6dhYEoveRrDEdji1h+f6I67npas3n1qUTu+o2Kl6Ju5BS8cDNYwx6lbaCcBfIUomKcpRxI6acpGRP7nPrbZVM7Enw1Kr8HNrsZvJqR2q8AhQtvn/0zD/WjArliTdyHMniAsL6hfGeOs1tXjM0Rw6qyVOvhzmqQgYYNkmyMacMQdR6TQHkAmAG3CAkh4MHN2eQ3j3LXmg/XRxcWn9M5k+5H1/l+RySWpYHLRhyC0M8pNGBb6gorCQE1u/gi6u7VNOUAo73JG0YRaX7esh6jrpcDihithQlVD863QSFFJHV29VPBrqwbMLB9RnI7uyFuwrj9hugBSbotZ4PiOoJqQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4nN2lqubOcM80ns8haQe3d29Snhdn58Oc7giOiFqso=;
 b=D/SL7Dw5V9V0MZel9sV95UofC2RovYGmV/7xxrJd0IFy/bwkyH+vo7dPHjNkjGJWWG9sQFfRRe1FffpAB+w+s8Ttzd9sEfLQUhUxuStsOZT9CzitNn/ItYio2G/FZI/ste82hhq+51obTUZtKmtumXyKebE1RoYXXEsFbLcA9vE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11404.jpnprd01.prod.outlook.com
 (2603:1096:604:23c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 01:44:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 01:44:53 +0000
Message-ID: <87segw9z6z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/4] dt-bindings: soc: renesas: Document R-Car X5H Ironhide
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
In-Reply-To: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
References: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Sep 2025 01:44:53 +0000
X-ClientProxiedBy: TYCP286CA0116.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11404:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c5de96-3320-411a-a3b6-08ddef427914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hw9C0xY7H7D0Dss9YoOjU1UXZ73OMiCO7J3I3DrdqAMfPWSQ2sKZAya9XwAh?=
 =?us-ascii?Q?bhaygZmkJZQ2vdvOV4lbIy0Co4xGvYnmV399Y+HlZzgxUfYvfW37TD9gAyic?=
 =?us-ascii?Q?Jc0Vo/+J34PH66LVIVIQyZgWjAU9o44mTtszY+aklLJqEJ72ozBIYc78NC4h?=
 =?us-ascii?Q?H92UJqCbk7LX6vTpF966IVSRgw8kEbdVXIZiJywv4h9kAaDXNVAARX0GMBvL?=
 =?us-ascii?Q?5eYB8XE6YrWOQuMSApfnqqWsoCt3rzOzuxxAYMJqhCXmvatFIE3JnMwxXSXe?=
 =?us-ascii?Q?rDGSilFhlp5NCUdiOlQpgXDEcUr371PIONi4Mzi836zU///ZaOnD50vtsaM1?=
 =?us-ascii?Q?9L9p19SSFGgbDsAdN5v9yReMPu4m8uC3D38x7ueD4cSVHQOd6UxCxLpSwGYU?=
 =?us-ascii?Q?X5H+01CMmJ35Vb2NjzPPjfG2gALBV6B3j7CwFh8fKtFfQdG9fHp38PcvZF/h?=
 =?us-ascii?Q?vYEUJ/Zbcg8061WBD/83mttk/qFnvGT6H8J/c+dS4Km3qnHV7CNhCyxBmcN0?=
 =?us-ascii?Q?1cM0TgnEHcmbLpmqxdNGBpkpC89jo2S+aFuWOSg+we7026Ve+bCdXLLCeawU?=
 =?us-ascii?Q?7cak8fjbJJ06cbKoYGDqXlrdVd9MxtZn/vIZeuK89JG6rR0U+5Ku+09oH+l5?=
 =?us-ascii?Q?LiyyN4Vy588NzuBn71FGjznDBv1OEfMEQg7jfCBZzH6eAwbwsX0DhAL8MBN/?=
 =?us-ascii?Q?Djpe0jL5FpDcw6Ra4NFGd/MpYueHswaM7U0EaZh3clBgUdQyW8VXMaqSGlto?=
 =?us-ascii?Q?IlVHUE5a6LFf47s1Qxl3lo0GQxXKU/XtpPn/BWNm8lU8TEoZGedgMXk5MsEf?=
 =?us-ascii?Q?ucjsK+GZgcxPLgVt/GBoStSSP4DQAH5wbzwMZTIVzIENqUzSakjw8KsMUpGs?=
 =?us-ascii?Q?u4Sz6Yi4y1tYA9Hi+H6xMMVcXV2XnftDCCVk2Brl9B4VBPIlIKXtG0gxQ+6R?=
 =?us-ascii?Q?gABMGmZAg//qA3D5cs2o6ZsxlVZWVXZOXwDmgq90t/H7G5wT3WzfCfDGXPeT?=
 =?us-ascii?Q?NAJIXRfqNTE5MKV6JLAmlmiuA3eyL5ZxP/Xk8Wq1ktPENrPDrFv1br4WvhU2?=
 =?us-ascii?Q?HTRX1LMXW5ezWYU3G7pQ33dSrmJSwUok/5piniolCkUYtWbKImEqrkyxjUQp?=
 =?us-ascii?Q?dVYf/FN6oezru2oHZMqlzjPmZOxuAkS1W1NFeVwM2oxAR7PW+mVraCDKcFyj?=
 =?us-ascii?Q?dnJacChOt7EDHdBPg6bb0MGOPx5WNfAumZJ+QLSMSqLxl4MT3LPTQrT32GsS?=
 =?us-ascii?Q?rGEkAqUcbDOtw4YXSm7g9QRlOYEaTEvWhdOfIzGszd7h1owGuRFhoN3NqYNI?=
 =?us-ascii?Q?Qz912acX2h3rLFAtluQ5bU8ExOftFuLqfoKpPCevJxZA0ZM9XosB9PSFACXm?=
 =?us-ascii?Q?WKqs+zXRssh2UnKaC7Zbmh8RXJLrOudFCP4/aMFvtW/1ZXIKsKLe3XEc6G4m?=
 =?us-ascii?Q?FYAqvIbcctsHW4p6TWudXiyCB0Dixtg7zurosR21nOeTIB64NTvR1fGMQL/k?=
 =?us-ascii?Q?le6PByRFkv+HvY8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vipOrwCb7+Y0n3LoVGt/qCPbaD5TCV0Vt/liu5Y6UOCCp63ZH0KCmIKlEro+?=
 =?us-ascii?Q?tbKvRK8FgNailxVns8+bZPanvLYrXLiqkScAavRZeh3aKPVAKT5zTck8C2wk?=
 =?us-ascii?Q?pZjrkAdzZY5S6oOJYMEHFJIRBwjkBlVoebo8W5hXEzO7Uqw+KcM4Iyt7yZIs?=
 =?us-ascii?Q?d3sWTNADcQEAbgFYpB9km4f09JzIjiU385jSohcf38VYjzLmyH6423DR+2/e?=
 =?us-ascii?Q?odTxObd96TGFZC9aaDwn7nyOX3ZUrI8Hev8Rswpd2+lNIeage/uaOI4R4THP?=
 =?us-ascii?Q?NELeV8cwOmC3VXoUxmxaDpqdAiCHTSzRZUzTFuaNryi1bfLn/ESGpoI5igpn?=
 =?us-ascii?Q?5W5XIdkN94m7jHTIqo2aoir5A9tXhjlBNETZo61LtFE7tkwzIo95f07fDKeV?=
 =?us-ascii?Q?I3RI06PQ8xb/8RbA0bBxvFOyKnUlJCnm9/O+mdK6ehHSdMPavYz0DrPpwWhv?=
 =?us-ascii?Q?r3Dj4noII6TOHCYTVb7pYzvw9wM9Sq7uCju8PrZRbGfuFUs5WjlMPrLUIvrR?=
 =?us-ascii?Q?lx/hqzwQfTqRpuOjavcSs3lpjj8tiQJGZIHWagsEcn6wL3ja/aSq1H2Sd4Hy?=
 =?us-ascii?Q?A6Bsb501hg19hwxDXiK82+rfmF4wlg0df8dzmftI5/JlhK7q4d344rB1nyMp?=
 =?us-ascii?Q?j69Va0a7fZOOCitu+r1o9vj/8Pms+ammeBl9hXRoGxPRLocpjEvllOe97mM2?=
 =?us-ascii?Q?qsRZjJQJlKrx1C0+x7XOIOpWH2QsHeImK8MPza7Lh3cIv+b6xEqLUXVckAxW?=
 =?us-ascii?Q?NXgnhpjw53k3HFs7KGhtfiVKGRJA/TCBMde6nJDumKeTitFjp5SEcBKQXSMp?=
 =?us-ascii?Q?ucxHuvVL1JzTLbSWfRDcEDvl1+NVQkAmgHWMFRgaFgxa36FT2Qr7xKuEOvDl?=
 =?us-ascii?Q?aqpcYVk1y1c8A99QQUAMwfClQyGBu103UqL6gxbqYeA7hHbsFgo5QyNNVG0K?=
 =?us-ascii?Q?hCuVD9XvgoEew3yC/3bebC+X7wBVPmhBqV52HaADG8OuC+vMc//7ishNTXYK?=
 =?us-ascii?Q?3wVqOkmhWr/LqkoCBgu/jdmnQKXD4xES5fIdplFvPbfNVjRhx8NcaaPf+sHf?=
 =?us-ascii?Q?yuRElEu+Wl3EQ9fJ8eE4jF4gbZ3geewHlEK8y00Gs82vrbyXq2wPmKVUqhjd?=
 =?us-ascii?Q?4tnKgnoLRmWCPmuIrwrmNWxAAS+6gvwPV5GsbIm2WdEArXmzrQ2B8YrRUi9R?=
 =?us-ascii?Q?eEZPrGln+Bh43gxG7Y0Yy4MSe8BGj/3CUvjME4y3WzJQShsbvgkTeaCFBlX7?=
 =?us-ascii?Q?Yz80o30cD5cHYtzDYhUA0jirUQFlUOouJWLB+APT/ng5lpYWqxDjfMuBkc2/?=
 =?us-ascii?Q?lbEsoaDhKfobl0PH/E/Q6E5MtsKkCtRNuFUFb6pzk3aoeL7/kYXFbWLGhj+9?=
 =?us-ascii?Q?yECeBWKMkgH30RrZ0cko7jlVT5rZqs6v/+oz77cPrAULF2XDd1BaYWdqbHOh?=
 =?us-ascii?Q?pAgL18b4CIfnocEHDd1bF/OZdD39PEN2KKbGvggh4OB6EAhbwSBV6awqOf3+?=
 =?us-ascii?Q?toeiPkCetQbhbEDRPBWBrOIl6SP+h40GIPYN89Ayl4Yzrl1nlZkgnUPwRU7o?=
 =?us-ascii?Q?wBmzoxZPnVwzmaVWTOKjSMNfnjUueKq79cK9z3K5gI190pFZiVsuE5bXFN4c?=
 =?us-ascii?Q?E09+uMxTww0OUENe/Iv5USo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c5de96-3320-411a-a3b6-08ddef427914
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 01:44:53.6346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlf1zF6irujuPKboQxAOf9hLWkO6CpfpHHLErgHGbE0CdbNB+VJJI3PJqE0P/rpTVjH5At63pXPYc2xdcDGmBd5FSnC/iN5pgFDM7sMociGp/2xoWoBclqQRnMudUbv/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11404

Document the compatible values for the Renesas R-Car X5H (R8A78000) SoC,
as used on the Renesas Ironhide board.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 5f9d541d177a..f4947ac65460 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -473,6 +473,12 @@ properties:
           - const: renesas,r8a779mb
           - const: renesas,r8a7795
 
+      - description: R-Car X5H (R8A78000)
+        items:
+          - enum:
+              - renesas,ironhide    # Ironhide (RTP8A78000ASKB0F10S)
+          - const: renesas,r8a78000
+
       - description: RZ/N1D (R9A06G032)
         items:
           - enum:
-- 
2.43.0


