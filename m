Return-Path: <linux-renesas-soc+bounces-24165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5DDC36944
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 17:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3B6262310B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C981F3358D3;
	Wed,  5 Nov 2025 15:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ucjRuQwG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011068.outbound.protection.outlook.com [52.101.125.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21AB32ED3B;
	Wed,  5 Nov 2025 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357292; cv=fail; b=gNtkSRQ+3GN3efTq1iQNjwWJJlFm4JJakvh4S1utZiAprmNbZsLRysBUXUaC45zfEAHnd0mmb6e7MefzqXp5uIjeISl8OOjdHsnahhUo+NnHhC6f6361s8SSEGfB6HL+VmGQHpEGCiyur2VOGcj5O4Sez7qHVkmS9NCIjj5qxyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357292; c=relaxed/simple;
	bh=YFsXipCXaWkdtlHh5ZiS507xbqJ3FTUHjjN9DNkWuyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CW0l7iz3DlJ5Xqs/8NaoFpfASWPBaGgt/CREbeGUTxqghjdt8PwkZ+NtM6/iJ/nlYFvSKYkX6/p4SU9//EeAL6OH9j95omSMUvtaqO1XO8JX8CYAePdulnzim0ix726S/jnbOEAK5H1hdSUFhEe4n4lzLmqkl9iUV5Y82EVybY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ucjRuQwG; arc=fail smtp.client-ip=52.101.125.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snCetkow/cnHiM8j6okHvA9TFPIDJzKDDccX1aTrtqugKw7oSZPIwQLfHfbNlZ/yCUWnHb1cEDOU7LnqJph4vg+PRoikHMzNAIIH+9+apn4IfSnXX/G8tIDtrnH6Dg9WtsjQIuhvPzpZpTQv03e+CUN/mgOCROssv3ZjUpiBbu5264eKUoXMNAjzetmaORw/Y3IcB8DgK9AEEaSi2hQ6N1fjOJ9uct8JWjL2gwZKtkbjzkaJGJtysZnr3/YeU7CcYj0PH3eZE/pQuGD2XCfpM29yXBPdVXHRfLnUGar11KT1d8R+K3pOZvBZfwTFNCJ9lqzMKEzWf/CZ1/qKzbbkHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H46LUmibafEBzNgg0DzvBobEbHhty0lfSLeuRe3EVZ4=;
 b=h1sNs5DRiSrzHQNDeToJVuDuMUT/u2SqI/mu2UqXGtHArd7SXV7tphJd+xH0i24Wl3yJ9rzq5UQvFssABjnYM+VDfkPhGEwZ6UF8vjoU/O+UHCETDJQz9CK4TqLUQ3UgqLYhb83LvArYp3mGNYx06VcZF1fXmj2+yYTPy/FqKgqLdq8+FOy+jSHK1l7HJgKUmx2sTEI0cfVkEpMIbVhdC1SCr+tLy3LAzLqUzAWGmsrG8xMxiw2Gq4gO+toeuUiVvA3iTAib3fsXgSGx9fjkGvuE0kgi2iTIdxtoPIH5RZZ64G7u2Ha5MrOpJpxRFMluTNg3m5GVOcDWh6YxBPbsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H46LUmibafEBzNgg0DzvBobEbHhty0lfSLeuRe3EVZ4=;
 b=ucjRuQwGDAYz2Q421/bHIYv2GAdSysB+TAp2hFLkobAF6xIdiEP3p5RExiiRaqg9UpchqsoZARAkRJ4lb4+4cYflI525hlvqlfR9O7fw4xhIFjLBTXvSQUIc7RKDlOgln0LpnCsHGLzkdnqeoaNgooAJmCXJIvugM3s9Tt6heek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 15:41:28 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:41:28 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 12/21] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3E SoC
Date: Wed,  5 Nov 2025 16:39:08 +0100
Message-ID: <0c6e8a5150a439d2a86467a5b5164f034bec3bb5.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b6dd4b-d002-488b-2c15-08de1c81c928
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O748tIKaIxVGTPShClM38uawvmoLE+7j32yoty4vD3x/TpJ3GR6JqGqNQ4Cu?=
 =?us-ascii?Q?CcSzxGbvpTuqLwpJzmJi7xswT+Whs+BR+FbvYNMOyJjHKe/r+6YzBLxUvyvj?=
 =?us-ascii?Q?hU0yiins3vEis2ATWJJjD3dJzmGn+HKraXLzDZ/z8RUqPZ/fLg/pcLnK3e57?=
 =?us-ascii?Q?xl2uio3SXg/nUFBI8GatzV1v/YC/S/N4ST0pWHf5dy8ZctqRXTteFolvAQi+?=
 =?us-ascii?Q?fF/RFQ2+JHNfkgZkFsuAmWGa89FGYFks4CKCOGcIkvsEKte4JOYFOcXI/W1h?=
 =?us-ascii?Q?aIR4+HapBgz/AfQ0yAr5/oi2Jeq3K+5AhADsT5dT3plFcA+QXIRobVJAbSdc?=
 =?us-ascii?Q?hVsuBhzCwAEKDUi81WXKGpW/F31vUJ0gdsgnwgJdbKrFEjUHKhIiEbRgP+T3?=
 =?us-ascii?Q?J84bAkCuIGwdFzKA46xRWUSwLHvM++K9ajQsYYGqsbJv6SXZZh9dwXSlfQIU?=
 =?us-ascii?Q?fjXDtK30s5BrYXf5VgFc3zITYw3vEwY31B34CvtP1VgPoetVbb42iWMi0EnA?=
 =?us-ascii?Q?czozKzcg8IqprPoR1sDVx8BQSc+FlpUbi9n7B3QiR7AaYpbntxR6ToU+6UcS?=
 =?us-ascii?Q?4eQZikuWKAlUuFA3yPfIXEED8FFCZx+fp3Z1eIyDKiT9WO/SQoJ7PyIAm5ia?=
 =?us-ascii?Q?slQIYWsfPorpdzyDUmiRF082VFi8Ma0yJ9MRZ+lR9wBPkZvoZmgd6ZrdQ55U?=
 =?us-ascii?Q?H5NruYczS8XN+wN5nnhhtgrUAmxQlbbjz+tP8wVRsW+pSadJGZ7dlv48k041?=
 =?us-ascii?Q?z/x1gh6o1bNs7RYoT4+9VDD2jN8yUljcwwLtOyS9MUyYM9BMpHPzMgsdR1Ff?=
 =?us-ascii?Q?pVCJ6uddOkITYvqa/9YMErgNB243FTR7UvGEkPXID6BD1jFkKJ/qBQQqRnEK?=
 =?us-ascii?Q?HNl9x2j/HwDOK1+ZLOgHzVC/n6elxNaw9JcHUwl1TxfqnWKj6KzhdlIGkalr?=
 =?us-ascii?Q?9olzY7tG3Maihbv8fb1MbuEXU14ra/5FFTjMTM9zhugi9ASW2bUCLH12No/V?=
 =?us-ascii?Q?q40Zci3rkDxXFoqXMex8XsJ8qm/gFVUSWA4/79ICC7+XkFP3OXmoh7ygUich?=
 =?us-ascii?Q?dgYzzjKyN8A/eX/YrC40Y8X32mC6ZoZ76igcPshXpozZ8v1HZ2Sap4yFRmsc?=
 =?us-ascii?Q?sK+3r+UGJGBdbonrr6x0H/mqSNxH78rATkhk9sfV9ohH0b+KvHQ4pZ4D0yer?=
 =?us-ascii?Q?tf/nCBrz4enVlhE+zSdTzIb0/FqfDsfUlIZoVjF4AbU83KIvcOPOtlqJ3aQw?=
 =?us-ascii?Q?t/kVpFiT5OLNS2nBEVs5o+TeWs633vcYKHDF18PXLNjPsHJB3+njDYH7WPq7?=
 =?us-ascii?Q?sHFfj0Ua3vcqamWIIeAr49yJ3VQXJLCtUV/7TnCEjlHmYOjwwR173LK42aUg?=
 =?us-ascii?Q?1j8BRg6W/GZM6pqUiBJCD3bp7HGEe9ANf7KqTKcIdGgC+IeUioV2wazIa44W?=
 =?us-ascii?Q?l9yMzzCPRWlFTG5zqpkgM5no66Awd2doKLzkdKyBEQhXxaKqRmEGVP/Ya5uQ?=
 =?us-ascii?Q?GFat0rriFeMZRzNfxvra5p1OHjAgkFfmo6MJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?68ismbix6XYJukgf2sh/FOAMKyERbxlLlJRrKognnEdhKC/mP/fOIjxadS2+?=
 =?us-ascii?Q?x6KfnS3w6bJVSyhced5yB1+ea5U1j/j/sT8+IgUsqMHos2SVNwMKKkvHHRBR?=
 =?us-ascii?Q?VUkZAnMZKx2qnu6cDFL6+7JtqHlXj8FpdMtpjoXQzr31x7zyxHeFENBT534W?=
 =?us-ascii?Q?lprvfr/qtp+Oqb2GCzV8GVRseDXeCExHsPsAposY9Fuc6grhJOaKoyVMIoAU?=
 =?us-ascii?Q?hkzzeMit2GWNln7lxnOGXX9/suxGl1CZesLC+sJbblf5Aw4gN1UNoMRGwfcx?=
 =?us-ascii?Q?tBtZRoE9DsukVG20Gw/mtLnybzjwuXsWUwHGVwW7M46HDB0QKvGzHi3bF6Oy?=
 =?us-ascii?Q?2FrD2odISQr2lpQHJrTIUrOr+Sxyt33DFI+0cycyFymViWZEboT9VJqsukui?=
 =?us-ascii?Q?uWGewvi/fa/Qg7jNdd6XK8jAh0SzGDrEFDee9+d1Xc6MbsYRxfi1LV6asB8p?=
 =?us-ascii?Q?AXKuIlre3m3oH60rzAl4cH4U2GA7plMIy4Z8QUS83wk9DIPxSxVPdUOXajpV?=
 =?us-ascii?Q?5trLWYh3V0Q8sQGy9Z0JdBKOQaIBaCLuWiu6K1h8MKA1wiEHClRyO13lwqOj?=
 =?us-ascii?Q?FlthGEj29SYnyUBUyhd3Dk+y7jA2tRsHgJRl0BY5Bw4bF9wWagL/CrLIdLa+?=
 =?us-ascii?Q?dVCnSooNm8BxbDgbMgPtDCB6vR/q5WxeF+bUVIXz2NfKtloMGfkpjVK0GJhD?=
 =?us-ascii?Q?L5UykAC/vZcfTFW507zsXyW4qtSAsK916QRJZZ5iWCZzMKWsnDVXxOE9U40H?=
 =?us-ascii?Q?cRhq/29H/oehjirFflcsslGbbLn4BExmfm7RpBTLPEtMvXmrwOuMDwXKuS81?=
 =?us-ascii?Q?RHMBuFhjLkEF+CKzp6xXltmDkGRQPkqrmZl1O1PkT0/kZCY0EmpCAZT75bqF?=
 =?us-ascii?Q?VfCqH3Ks59aNCD2J95n85XNxCgAaO66Pkwbn4Q4A7AScxweJbkvqZHicJVKe?=
 =?us-ascii?Q?eNxDwrkmKwEW5n2svjr00vbKfRSc2MTIYXhFSISXGs9XtfemG1QtDZCNvA7I?=
 =?us-ascii?Q?aDjmmerVHwu+OUVQ1appNdsV1leGcugb/VQXRznKVbsvJ5l5vXtCcvlXv4hh?=
 =?us-ascii?Q?YXMj5x016I/HKxg3WiZil8IHK3DbNQ1LvIDZg3YTJTXqGNyE8wuhgJwSV/pl?=
 =?us-ascii?Q?noF4sfe/t29uTCu2f1uoP5CIdfZLQEkMJLJr31NPGfs0uPh68iRMxgKbYqOW?=
 =?us-ascii?Q?Ng+LruKTwaF7o6KA0A6WyNdZF2juNf05OdjOGbsEI9OfGVgJumkHh6cynqfC?=
 =?us-ascii?Q?/BOZklm1u+HOJsQltP8Vikxpzzl360lDKcrscbOgtOzKgz14JDXjRRcbUzgx?=
 =?us-ascii?Q?iQSu3EpuemKov/OPu+3tpy9ZItht8jiHRCb8PVQ20C8AdWotgLQKKykSu5lc?=
 =?us-ascii?Q?k+7cyLiieHztUNdUI2K1neqRfwKQbmh01EkVTq6Rhb7GVoTk1W9Q7faWfhgg?=
 =?us-ascii?Q?dJGt7hUVUiucxF9jN/BjwSaCChv4TZjviT/XfVNscWy2KBlnbg2GMNfDKyld?=
 =?us-ascii?Q?Ojh+4QAU1V9Z0QK9sJp3zTFz9pSUvYmM2r9BKaO0g41T1dTXyT6mSXxsExZe?=
 =?us-ascii?Q?PfcYzCqYCLT31YvXcvAHluxHi1bCzITI0jbP89TfYpBwJ96RAA2UaVXJS78Z?=
 =?us-ascii?Q?Cw/WD2CIWiPiQ0T4FX9SojE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b6dd4b-d002-488b-2c15-08de1c81c928
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:41:28.7444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yw3RNNt1EZxNYzrfZsVGWNsCg/cCwsLnrdAOtRR/62l810LAeO6wQPq5Foq5wxHREqn4btTFhhkPB/scJkQeY9SmONlXHhiEUIeOmCC3FqegrY+3DSw2RzDdkjZMbf1J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

Document USB2.0 phy bindings for RZ/G3E ("R9A09G047") SoC.

The RZ/G3E USB2.0 phy is functionally identical to the one found
on the RZ/V2H(P), so no driver changes are needed. The existing
"renesas,usb2-phy-r9a09g057" will be used as a fallback compatible for
this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected CDooley tag

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 899a20797bb8..73a52bb67f9b 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -41,7 +41,9 @@ properties:
           - const: renesas,rzg2l-usb2-phy
 
       - items:
-          - const: renesas,usb2-phy-r9a09g056 # RZ/V2N
+          - enum:
+              - renesas,usb2-phy-r9a09g047 # RZ/G3E
+              - renesas,usb2-phy-r9a09g056 # RZ/V2N
           - const: renesas,usb2-phy-r9a09g057
 
       - const: renesas,usb2-phy-r9a09g077 # RZ/T2H
-- 
2.43.0


