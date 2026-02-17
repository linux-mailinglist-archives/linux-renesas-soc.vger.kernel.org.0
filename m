Return-Path: <linux-renesas-soc+bounces-28282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF/aNp6WlGn3FgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 17:26:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC8714E283
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 17:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5D683046AA2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 16:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A6C36EAAA;
	Tue, 17 Feb 2026 16:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HerFdiRR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10E836EA99;
	Tue, 17 Feb 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345490; cv=fail; b=agCluGQXi58UR1YErXde6OGdHNzTFUGYkLOJMjKl9lcb34BNy5VCFUugNzcdqV6FVtc0RoE/pttVgyR+wnevruqgRf+f0u69S0kOM8isfp1/6eXD2aYmC/MFQLlkeUJ+ZzEXocZA1Yffw676XAjqEP5MH8mljSYiPz7XFFhIPGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345490; c=relaxed/simple;
	bh=h/dUpi/nQ3TRhAdPcOwh6pKLUzUSIz+u1M8ge8PPCh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jPbCZ6RF2juAI0SHLE9JlzeLea3uyl4hPek0PaMfJIerwwiDF5doYzcdxplEl6u40FRblBczWepfGq0fjqWOAiBRXki66comSPhjkjMNL5AhvPKOclX6Hayrh8wUodZ+XDS6VmS3sYghsGM3QVOceXDsyLFt4yCPnAuQT18wSE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HerFdiRR; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmZcFpeWuvc8rtHKAZwbHDwNKFyuqRYg6SHYFX6cpvhAAGCBNQGotZARL1ymkArFUzBSFbfHPC1BzFf27yoAbgm17Jmi+JcnGRa46oMiLlLjba9FYPlwku1qerZVb51j2C2d/t1zbecBm3HG5sLggTrsg11FaaihgHO8mFBXkbwASgwMa/ym+lvLRYzUYEJNbN8owmdBtL6dneBGOpxxCO9ydLwxmuKWTbRG7wr9OvoIwv1z6SvMGezDLnHOagvxGKJSEKOIyIDxsSJsJCsrGG0WG4M5VOy7VluSufL9/FKHTml+pPuoI7ijl2OjbwHDhCH3AzN2kbFaA1o5aMxtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyKk58bg5aW9KuGtOOUupnAAalVfjULOypO45ci1WzE=;
 b=V7v5+/PCTLJuU2hxEaEM9+QHz5z/CfhdohIcntDBea3zYw7AU0EuKCMEutPe3EtCbNxAfzw3OkPzbYZ51zlQpO3pEEWm8f+8hdBBFFCXBW0Vp3nOkOS709cEVSAXV0RAJpKaVuwfj346k9GhZnJc6MBeYfT38fRaqY8hd95GgwY8P53mF+eqb2/nIZwQ1gB7gHTxY5+aOu1UZlP+/8FtWv+dXDnfJK0qbrb0BBoVYPYmIJggGELDCJKdl1PY+sGqAZKPh77380w2oPj+0tCq5GMJd3HVnn3rkd57Ncslklw1B8H8HWtsNveDoIYXZSCCQKMVMHZ+3ligEf8REbwjZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyKk58bg5aW9KuGtOOUupnAAalVfjULOypO45ci1WzE=;
 b=HerFdiRRZPIGQWzO2uYCMv294s11lVGX9P9rQV9UuIv4TXPpO+JaVCHdDY6PQdbl61yyKNbjqbha4A0VzZTmWENYOJSLaNKfKl+RUlRDB/APg8CHoqR76ZpJBNFG8pvwNfmpxk3iotqPxwwcwLJZth3laP5VkrzLmg70AVN6rRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB8581.jpnprd01.prod.outlook.com (2603:1096:400:154::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 16:24:46 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 16:24:46 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/5] spi: dt-bindings: renesas,rzv2h-rspi: Document dmas property
Date: Tue, 17 Feb 2026 17:23:46 +0100
Message-ID: <ea6ed3b82c5a326732adfc0fcdb2922bfcad2591.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1771344527.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0320.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::9) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: f4fb6fba-707a-4da9-f665-08de6e411081
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OjceEyEfM70z46ckrJRlMCLUSjOhjXZURZqbjZx2J3cShNcklG2ptuB5q7wd?=
 =?us-ascii?Q?l4wJ2TczvIUHDxpZLYffsPEcwSUI7JoN3MDRWW+0GlMSGDLzhnmY3h3L8Cjx?=
 =?us-ascii?Q?ijvCteWUMzWFxBUyVX8b4BzGr8H+spugDu3XknsZxfrEOYTBoTpfwGIR1KYk?=
 =?us-ascii?Q?h/WuvSDROTiOEISvmQ1uicvrDB2FmZsum8kvzeZ3ErLIqi8E+Vr/5dRdda7B?=
 =?us-ascii?Q?/PfkhYHaOLJ7PU3SNeMU8cPPhFwt3rFYYgXve2zNDsfKNZPBamDzUIRAPwMb?=
 =?us-ascii?Q?VdNU7uCD5/2Dp73/OId6O9LB2bi+L9UTgaIJKLQtftktql/HZRsreMZk+6cW?=
 =?us-ascii?Q?CYkgwEC7Mlid7N5UsIcqbbPv0wQM05N3lV0CmmppeoUERhWXPSIBrvw0PCd4?=
 =?us-ascii?Q?/TACuycjkrtKWlWUe8cWGusPG7Iz/QovKtEfczbDQmCO0CSfpO5Z8gxtd5L6?=
 =?us-ascii?Q?31M0dlUf9s8LAcn/oNOiSugxhxNIHz4KchFkZjNeZuYp5+/nZ74rRGFrxmls?=
 =?us-ascii?Q?voLYsqkC7f8PNIqmGHYXsPS4w1UfkiH/Lxe+lPG2/TM4Z5roP39P+JeGmAKS?=
 =?us-ascii?Q?W5DhGL+f6AgCY3WroQmKR0+4afaYPOH1VEXjWGjoiBcZWEvME0wJonHnHkRR?=
 =?us-ascii?Q?GFGxVZ1hw19Z6NkTGlpckTKW1yCU6P6WYNfbzzDADiFI5FZ9DPWXufT02fYR?=
 =?us-ascii?Q?Uw7JhBsoIEUBdtF6EJbAuNIaldyjzLkVwYcm0K4h7MB6J+glp2h/uB/SARTT?=
 =?us-ascii?Q?4lni/VOyfNqFVSET92xxyFCmr6bmKyeFKsrMyaLZEnfhqGWeKQBt+bHxjPmD?=
 =?us-ascii?Q?MPqt5dLkmkz08eWptxKOufrAJPSLvMEUHwVPax8HkP/pn2kVv5pO51LQsL10?=
 =?us-ascii?Q?PVDQV48HWJ+cLjvHsNzD0Q7jSShQ8mk6RtuVusAMSu+X/oHtriRFAcCkZ2+N?=
 =?us-ascii?Q?FUjsvZhuWVyrNIx+TFQPafBWFY91KRy1YqImB4XtF4+2RgJ90T6OvYzby2gZ?=
 =?us-ascii?Q?samPFfCDdEtuYB5T/nnjbVshsWdORKLV8IqWdKx9TZmCp0xD3+V2//cfKqKl?=
 =?us-ascii?Q?qKv9WyOzpDxCKgf5BVdIZbTV3jUt8fvPJmtiXoHw1NyvoIw+EMHYDFN0wnyy?=
 =?us-ascii?Q?r0CfmaZ39eENUXOuTJTB4Y0oi1YsSbSPg1xME6VmrzqxjDWQspvyfV5cZvlx?=
 =?us-ascii?Q?M6PzZYy3cTJlVvHJ2PE6x2tSUjCC6nbE4C5qT2KpqkHw1fjTYsnCLeXnZW3q?=
 =?us-ascii?Q?0o34lAd0dTP7F66GVMYFEIf16hx9wvO4v5m/M23imAEE+VUmj8FNF9HUVnCx?=
 =?us-ascii?Q?MOGcNQn3YGHA2tVOP12n3bDhirKC1m95qkA8Aj93JIWTyqzYrwkCo+U5jjeC?=
 =?us-ascii?Q?Z0bChn8s6DIcjWHrIMgTf0OPikeZUlgCu0I+sFi1PoO3OX1ugtZ3CX/DnKaU?=
 =?us-ascii?Q?T/LOjECrgUXbAV4zFFFtNgg+PdrLKKrUsRiJTvoNOMpAmDEkAtLD6NfcB7Fs?=
 =?us-ascii?Q?ZGV7dpn7NADoSakvabfbItXAJVUy2X9z7u3QX82eZ/wiBcIlB6oJqM9Qheki?=
 =?us-ascii?Q?f3xgmBWIAoYpI/88WrqRXB4gkXoLpDznizRgICCWv3mxottUOhKr699D0Gys?=
 =?us-ascii?Q?6iTGUCu6GIJ2igQDpb7vOaY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YvPrVT0GwcnkKmZV7g7aifvVWsTdwcJyCItLtAXCWwionKYFwZQc2MM+5oGZ?=
 =?us-ascii?Q?p5A1P+Z6SwMKLurLX0/gebLXBrgSBuBPLAxoN6WSApsmebHZoTIHyI2klQbz?=
 =?us-ascii?Q?pkMbwOuCYZznGHPs4irqwOqkHL/GtZhzvcAghkdy+vJF7OL27QQ1hs6GjfoS?=
 =?us-ascii?Q?PEBGeTDernA5hST5K47ZmuEGw2/BB0ecXdLeiEO8uXyrh+5sSiESiTaBvU3l?=
 =?us-ascii?Q?DQ88/82MaskBrDleS5IUcOu9AEw28jM5EB4B8Grf0HiK2mcMRznfHITkPNwG?=
 =?us-ascii?Q?R6eDYGVLE7Votaefzc8KJgNrX60rPPQGqxOEInbLv7d9OGU/k1cMAraF7p1K?=
 =?us-ascii?Q?zQrTcT7iYPZAD8daLxCDo6DSKjWmP/gqFFUvxFrNuG4xL40UQiU+wtfnWyKO?=
 =?us-ascii?Q?ubZvdZfmyOtCeahjYZw3Tr/hwsmxU/l2IaVs2hhSK+ZTQOO+Q2CJIIE92KSW?=
 =?us-ascii?Q?Iksozbnd3fFCl9DejTV++uvqqmQdaOtq1UWa92JWr9Eio7icGgsGo5DBF6Vw?=
 =?us-ascii?Q?tyl8pxz2uqAe+DgQXX9Eghq3sO3HJ2cNwn+Oi8du84gkSrILCivo4GBhv1BP?=
 =?us-ascii?Q?jgtu6i22CEKA48f/XNeCTQwB+Nne1TRtaHIrMc2Vq5/xZofXQaOi1qzkJvbQ?=
 =?us-ascii?Q?/62Id4D9OQ8b0+/4q5cYJOXtxKfcN9HizJiWjWAgvH0WeCJza6vcoA7mXqA6?=
 =?us-ascii?Q?efc7WRXtgfPtP5ngLreqe3R/IUZTOE3Fi5EX4Za0dQwJi3h627Ap7EOLTzsR?=
 =?us-ascii?Q?0lpo/Ws55lqVSD7zuFyDJKc9WrZrbtiymq589daqmx0X0tgU7rMYFPtKbF3i?=
 =?us-ascii?Q?Q526/YOz5EsjXJgAfWg9QQlIdzS9U1ekzLeObCgRZD/R5bG1q9BC5x1RSwkh?=
 =?us-ascii?Q?HTJXWrMQhjfTgTDAgFbD1Y9Os6MYIxbd+fgxZtnj2HIhjcVVACI6QW0QT3EW?=
 =?us-ascii?Q?9h1+MT5I/tMd9OoLxXOetsTGPAbYoHVl9VpjFiqqFugMEgK4XoRaSj2eg2aV?=
 =?us-ascii?Q?jb8u5lOjvC2dFQzu78ONbK5ZGKms1lzyvhcXwD5kN3ysbNJGyWCGmBJWhgsr?=
 =?us-ascii?Q?sS1OdSHueZNAvgjrAHH0UKBWG677hvJCd+wGMHLKz8k2YfYkvgfxhUfLep+8?=
 =?us-ascii?Q?xZ+Qz/8VtlXIkF+7JA7S2xlsDHu9bs50xmNU2p6japAJqwMA45N9wxYjnvvx?=
 =?us-ascii?Q?IBAToQYDOYo7OnVKTuyEvwb5iCM+ZdtC5lzRvA4648y2RoXwFThezTd5heBs?=
 =?us-ascii?Q?HGa72TIz5mSHAxblipQwo4qMJLuCMv4+0bHDTsS3z5seR9ViZZ0OlsYidXO/?=
 =?us-ascii?Q?4PARfPhKoIhfwx5OdtCVszlbqvkn00etSBIKVOytTYZH6tULUK/avWiM00XI?=
 =?us-ascii?Q?VtBwd79UNTU7DlOmuMEgSIIFEIW4+AQYyzo7JYo/k9E7TDgjLAEvxw9E4E+L?=
 =?us-ascii?Q?ulMNp1JRDlYkG1laQDE9X3aFWlki7nN+KYpK/idbXb7vEhA6qaH+Ww5GZCH7?=
 =?us-ascii?Q?VccrMohJkfF8RtbgSkplgqJsgMP4rg6tGyB9N0PcDw5q1zjIVMHFY9oZr9lU?=
 =?us-ascii?Q?jqr2GJeum1iLm9Q9h3QcDJhmbkJBNFAOMPKrNPH+Uw9ieLOZ0i/C1GFdgtla?=
 =?us-ascii?Q?1VY+nkX+kG8/1GRjXdaiHctT2i95I++QFBS1IcoADkPpVmDpZeALnUB8gOYr?=
 =?us-ascii?Q?CI8SYb8PNEXizBuM6NgiFsaxb/4X559HsGDruvGGw4+62q3yT+gd80FSdtgp?=
 =?us-ascii?Q?jUax2gxdxjpaIkPS97fy/QjRN5/asCMfB3VlehVpXeGyK6L80Wc6?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fb6fba-707a-4da9-f665-08de6e411081
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 16:24:46.5744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRNGM77h0LExBxnyL1iOza3IdIEbM+ehnZRrrUJ2xQV7lDLqBTan2Ym95u2EEgfuWF+I/F8vSLGOrrpcG85m82pGYAGlvxAWpCsP0LMd6fGGNz29EDn9Y/syHtt7IoQA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8581
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28282-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,baylibre.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5FC8714E283
X-Rspamd-Action: no action

Document the dmas property to state it must be specified as TX/RX DMA
specifier pairs.
This clarifies the expected ordering and improves binding readability
without changing behavior.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 - This patch depend up on [0]
 - [0] https://lore.kernel.org/all/20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com/

 Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
index cf8b733b766d..d6a5338d6521 100644
--- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
+++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
@@ -60,6 +60,9 @@ properties:
   dmas:
     minItems: 2
     maxItems: 10
+    description:
+      Must contain a list of pairs of references to DMA specifiers, one for
+      transmission, and one for reception.
 
   dma-names:
     minItems: 2
-- 
2.43.0


