Return-Path: <linux-renesas-soc+bounces-21682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD900B50AA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 04:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A0674E66C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 02:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8AB1D5178;
	Wed, 10 Sep 2025 02:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FnZyB1+9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011056.outbound.protection.outlook.com [40.107.74.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C8854F81;
	Wed, 10 Sep 2025 02:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757469704; cv=fail; b=AHkste3HU/YQnwKiyXIF3QwwRHdH8g2nXWQeIwFDI5E2+4mPP2p1jHQiYnUe8fcnvMnFNci/68DTL9NHPtgQJyxfkWnNY+RAOPOi4C4qMbv9B3DYMr/mdKZA8VBlhfCngxP9YYMS9buOhFN4BzKXlrGiPPZa707fUNctjvJ5Syw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757469704; c=relaxed/simple;
	bh=pahJ7D6lzWSr/JkOvpwEVB9LEALkToxB7oMRTKuxsvY=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=daizXiKikhSy0QsuGbVnimUCesHntt1XLqFK/K4LTT5VptlCvlUjYOwtHQbWIIPVMsU0aH4yxr68qTN24zUEHSuMMLX5sG2jqLRg5ycluj5lCvEx5fRiFXMiEmmp0BzfGZJE6Voaw/RfSapzD73zq4rGxarKqDYdqC7jkxhjpa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FnZyB1+9; arc=fail smtp.client-ip=40.107.74.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=seSXZBp/dGZMP9JZAN//FHF8IIIId6aXt4bIazDG2KU/zZmuqLbNO24HAYn7qFQ+ZYInv+8ZyGPIyxTsTZmNDWKpwaoTQ7YxSAo70PdoMIMBeQJCWgW1/yzhxR61UhNMm3tm0Dnff5H0kh1qzRdDBggh8Gkz/T2APzduokUFSVc05sdFPQjt1/ODYl4L8AtIkKSNE2Z2i5DScKIlDSeKE1mTN2ihgitF2NQvKrQgMOHBhe/rpSYdNYDrm9choCsBUiWYF8rHyD0MDeYfbF3UNvgXpEWlmqME4y6J75l8IPx6I87sp+Q7qdIzsB8qGTgWE7rMmQLYOOb1TdSDJpm3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbEeIwyKswAYcR88CEOxcLZMfEusZ2mUFn5gr5hOrO0=;
 b=VRHfzVDWfh0d/P8JxZ+QTgaHVzGXKp+j3f+rabRhNp5M+R9AxkQiUy5rLtSO+stpXsTKKzyE5YMU0qKG4IlxuUwbiQb2FfWwLG8J4EcnEghr4I1cfAxi752Po5ow8eA/TJpucSlo7pFLht3x1N+JirtIVY/JLL+2RP89LjAdR4rxl13+jrA98z8YLH1S+SuryMLuIL5KGjpDAMJiCx5PFkpFUDYlSX6yofid+bIT72ss0JVs3Xci/v1IV+ja1HRooTpuBW7iZKwNBi2JT+2qlNGpn9VRxWyl9+GYxykxnBntYwoD82bRkHKn3TRvxr7CulrtXcZ8N11AzcoXKqiPeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbEeIwyKswAYcR88CEOxcLZMfEusZ2mUFn5gr5hOrO0=;
 b=FnZyB1+9HJnnj04HiZ2zjgzcEtQzirszTzlw6yE+qzmdAKiHNNyydNb2ZGpHwIJ9Mx1ZVbf4DcBK3q5kkLtQopNvPrd8qc251ffeH4HVOQsUbodfzXB8xzitLQOfwnoTx2fsr2k1eYy/wyd6zVrMSVNOQeqdFXpLBDO0V8V6BU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8282.jpnprd01.prod.outlook.com
 (2603:1096:400:165::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 02:01:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 02:01:37 +0000
Message-ID: <87ms73vzen.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/4] dt-bindings: soc: renesas: Document R-Car X5H Ironhide
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
In-Reply-To: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Sep 2025 02:01:37 +0000
X-ClientProxiedBy: TYCP286CA0065.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d005ca-0be7-41dc-b6aa-08ddf00df9d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sPBfEQUUxDzzifFksTXYHu9Zh2ugDCxo+CsY7lBtUnHLTMPT0W4Xmw+424hc?=
 =?us-ascii?Q?uBe1RZcg58MZSM1Skw0AzjhcZsCtapDyetpqh4y9GLJgdACm8bH5JDIail/2?=
 =?us-ascii?Q?TzCeHOxJojDRij7IIGeVQUWUDudJJeETx1EMNNtUy44zq82smF7GWGG2r786?=
 =?us-ascii?Q?wsh6AHRPiRuSHshgrIq0fSR8PGqIC6wfULSjwAVaGoNNErYbUEsI4CPviRXW?=
 =?us-ascii?Q?BjC71pyuoSNEfYRsehIeejor7TnsOttm+WQuiRzEh8jAoixc+Z6A3uy+7d73?=
 =?us-ascii?Q?tVPuBXftoSJiOKS3ABArTnGBX8witbasUvSN6KT7N2yG68WAsU5kWMJfyr87?=
 =?us-ascii?Q?9y29mvf/aXBFdEcSzYHuHWMhlMD+Guy6V0258mqv5Ug37wJFOji+KQGJS7IB?=
 =?us-ascii?Q?0FJviCXguSX33kyjvi+Sy20yOleP5M+cZUAMcJp6kL1tqmk72C1DJcCkfp/d?=
 =?us-ascii?Q?eN1DYAnGRcYXcFC7mYVPTU451A1wNl/tvVoPEvu2ImVjSdedSaXBL/8nZyD4?=
 =?us-ascii?Q?gi9WaMz5HGmOz2UxqV4AoU650DJdr4lc/GOF/+GjMVLyKhOAh+Q5JSwlxab4?=
 =?us-ascii?Q?Dxia4iN4dk/f3pYi2+bEXCGTT+4NVRt5cbK2R67fkHlKQdkrFrFIwz2Q5RyJ?=
 =?us-ascii?Q?5BRdUaeDrGGP5r1pOEu45d+09AGfEWXdgbbOQ9DDXnU00VNpBPUKpfKj5MQ9?=
 =?us-ascii?Q?KF3bPDTv5S8fS3bBILCm/1QuyNV035GO6gq1RhwmcK9nWUq8fSjCNbFnD1/8?=
 =?us-ascii?Q?LIhwpUeMu5H1JkS8U4MoJp1Bo4CqrvirgU4o/Ghq6Ru8gpRmupaUZzC8WYfT?=
 =?us-ascii?Q?rfswh3ib8HvRgnvgAlgl/c1nEjYG6+oP1QT6yN6zX9meq3fSfWrFQz5c20OS?=
 =?us-ascii?Q?zMppc+4+5bmQw+qUjeS+ZgWWi5EBE3/vRML1w2mB5EhL6Fvd2C0txautYtE2?=
 =?us-ascii?Q?MouIRh4AdumfhokiZTa0OA/+7nyK13Ftx7nd/urSQc0qikmHChUVQIiaDli/?=
 =?us-ascii?Q?764wgvSgooXBiRAeJXwmTyPI6tLeXNBQhhqU1LbW/eEv7T9rW3FgnWhihO/4?=
 =?us-ascii?Q?1yN6gePuDKcOLoyNygeby7WteV3w3Cqbi+wjF/kM9Fr35WaoKxxglqYi6/30?=
 =?us-ascii?Q?sbGy76sozOt/WD1j0ger0iA4Ovp0pcI9+Ncheyq8+GjvL+IwaG6u6TOTv6Je?=
 =?us-ascii?Q?ZbHOXpGXZ8avuqUgnHYD5wSkk0SJHOPONvuwP1NJsoPKjx40hEI9A0oweW1H?=
 =?us-ascii?Q?T+XzkevoHZpIZa579lUx0Foipe/yEVr0aBY8ei4M9UVK/1+RJrOiihRIeDqg?=
 =?us-ascii?Q?DpnBtOxrMjm6FRh19E8s/lopRUWQB85XEtgvcvL+3S4Nvvd2HUYfuWNzqx+m?=
 =?us-ascii?Q?HQxCF3nnk/4DxHtEIiAVrOreBjnzpmdi822nCUENpQ4ovwReeCNzgZcc6my9?=
 =?us-ascii?Q?sHJ4+RqcFSXz9h+JET+zaWCRHsWM8WmYYHonzMdetlxMir7cZcOSMH6TYoHO?=
 =?us-ascii?Q?eTlh2ATCf/9VLIU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xaKTVEeDPispml/UOqhhf+9V9eIh2Kj03MhIMFFijm4W+iGZHvlF4wKe44A8?=
 =?us-ascii?Q?h5XapWT7jL4yU0lyctrdkh/BvX4DayXPNZP8xdDZwt1PHo2WC695SMgoLFil?=
 =?us-ascii?Q?HWSqUBnVkO2jssHWxyHq2IdMwsu9S5boXXlWE1YBBGrJQPBpKXde3JeWisph?=
 =?us-ascii?Q?RgEpiGlI/JRs7VD8f4345isF7NWiqeaOp8hnp+eyOPJ5zfrLyOCD5H5v+l1w?=
 =?us-ascii?Q?JINUr6V6wyHtxtCHaaS3Rmm3SuRK+q/vfXUj340J4PlarUWWKsRLWrCBkoiM?=
 =?us-ascii?Q?F6f5EeVxxyO8tJAx6yUI2j0gOuhL/xfH09epYtLZINVm+xvgz8U6h016d9CF?=
 =?us-ascii?Q?Yzo0NJP2m8GraaZZ12rc6DwCIWdZXSf/s/mvv/ZXLuyeapAsUS/xBk0SP312?=
 =?us-ascii?Q?aeYvkamTrJw4zBGxjqePd6taEFqmOTXs1VvCOzp14TVwOri2DhD9ZvEofaRa?=
 =?us-ascii?Q?rW7Jpihw4uOmbqtNxdlW6n8qD/fWAIJYVM1OcSoRQvbwrMujX9cBbod5uZmx?=
 =?us-ascii?Q?LDzFlaqhKh18GCE9LsYXVj0O4XasNMbtlPMRWibwu8C6t5pZEOm3SBWXAZ1z?=
 =?us-ascii?Q?wcuh+SHYhHkqy8+IvVlf11c2GeI6RmXFvwOOrA7Zf9wybWJgm4lqukLQtYtm?=
 =?us-ascii?Q?52J9pEtZ5jmu8dqmYYlvHzXyY3uG8iaPbf9BZd28ABTEtwwY0jq+ozwVN4L5?=
 =?us-ascii?Q?Gfgp4QlF0D3rNnZTlD9xrhPhqz8zd8ErqsFGkBBuQk3IDr05InfpmIpTO3Ho?=
 =?us-ascii?Q?83vs/Mgj8OVzwIWo1oqe4ywdDgqAMLQ1swJkjsTz8RJjenKi7LULB6XpR6ZK?=
 =?us-ascii?Q?tjdBj/FGqfv9WaRYXi1DlKZj3sr9PlIROrMQaGoFFY2mzaTx5FyEk0S4ODeG?=
 =?us-ascii?Q?6G1hQ9F/tVczE8d+BoRwNIQRJX3scfui/73R9pfRV1c56RWb3jHqNXEGNhFL?=
 =?us-ascii?Q?+QV5rLtoBok6oCR31ivJtcl9qmkhCU7dsFhkgsO8of2g/FdYSQDFpjhKZV8J?=
 =?us-ascii?Q?4fDv5DA1zid4jB0QXPytuQzYn/szUi4k7eVsY9fXzke7x0rjgc6dO+U30mj6?=
 =?us-ascii?Q?Z5YXh2lgHYS56mUQ/x+qAG7HryretiBWCos+goWWCW7J7Va3nZAREHSL1psw?=
 =?us-ascii?Q?EM3m8v7nZmPYUcopyFiS36vNxZBJZG4WT5gfEKiInGbDL0+iJuszmA+qh7UB?=
 =?us-ascii?Q?oCmYiuDEnnp+KGxErkao/2p5tNSSL5YgCJPVE1vNuY4jJrHTdTj2+Bh1ugnb?=
 =?us-ascii?Q?Rdqi579KDTFnxfiRytWPz1QiCaNqULif1CEWlRycemyZAEbQctYimB/714OH?=
 =?us-ascii?Q?67nSZll+MuDiqvPQTgTqu8dhm6hkLFGvlyphqkAoC70Bz3cLntybTjQY75IE?=
 =?us-ascii?Q?ilsPF3WDTwXdQFhzbiUXYBfIIpuc/4OCA7JwP1eJRrGKkMxATLDkkW1+5wiO?=
 =?us-ascii?Q?bCwbWrR2CXQLjSnz2Z38i9SNrLUx0wQQyARcHdgZo0wisGf/D7byLpc38Dxh?=
 =?us-ascii?Q?1CngiR8IMyreKCwUQ/USxsCnF0N5ad75DJ4ZfgihrGTfHLs2n+HCl+1dFE3R?=
 =?us-ascii?Q?eYddQwV9+woGpsfCr8Hd0gLpbMn6uScY8+RVtVMhoOKSx/brmpfZdwm7IX6p?=
 =?us-ascii?Q?Y1xoZ6eV2hfE9G8dqYsPkPY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d005ca-0be7-41dc-b6aa-08ddf00df9d6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 02:01:37.5015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhFuD3U5IjK1SZMOI6ShYqjs9VXCFy5R+/IIGdwIwKr9IgVDXyjOH7aqyR4C1Oglpk4Jx72Jilb6/XMPL+fKa3MWQ6zmwkuQ5Gek3CQjityIjv580N3JCjSwnuOatf0y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8282

Document the compatible values for the Renesas R-Car X5H (R8A78000) SoC,
as used on the Renesas Ironhide board.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


