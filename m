Return-Path: <linux-renesas-soc+bounces-9327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2830A98E89A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 05:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87255B255F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 03:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BE218054;
	Thu,  3 Oct 2024 03:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Kr5qRevS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011007.outbound.protection.outlook.com [52.101.125.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1290A2E62C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Oct 2024 02:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727924401; cv=fail; b=HtOL8zwvdZE6+txP3+L+FMRT73LR9NgJtfN7idVH61bVeS2LOPbw/N5+sifrsvMQ63oxENnyJiIBNdJPkBIiphGEqkBoUSdvYTWS9d0LmtFwbx2RSgFQo3bslZT+6OHPU7gxusDoVl+wAzXmGGLuGD2UEXFlXgzdNeO3yt5NogI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727924401; c=relaxed/simple;
	bh=g0u3QD5+OVPnCPT2/pMb04eCAL+b/kY2QxLYYTzTL/k=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=lW0UoIvNRoZ8nMeUNRUpe1aRi7N/hHasLunIIdW0Wzutf1PcD+Ba6T0blJyA+fuUsUhyXf2ZTCVphhbKSRInXjo4IA0YJ+4njDq/5Q50hRVU0F9FO7cfCoeBmBNh0cNmWSX1ksVVxr401Ed8a4YoS/smXpndZ63S2MULQBSTFD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Kr5qRevS; arc=fail smtp.client-ip=52.101.125.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Av0xC9DSw8weSSaPBYGTsk8AbUvA06uSEIfWKRn6eoE8mWULABeJGK2/tGgIfRj8dAITlCkBq7zZx7XUpGLQZCui68cKcju+3DIUeEpU0Wk5FhDsGZ9SGMdU8WK7RsMEMQYHlB0wYxsGtDLiq8GsRxBaiCZ9D2/ABewQ38RXLdsSKjdZ2C3l+lDRHDwT0SWEHzAwYDc674PZcv5nIKs3aUyIKIbQt8aVeAm6KfOQn3RpcrfkPxPjeNf9oWlDsc5OMzkvlqX5F0ZNrsc15R4FKfrZHXlKUNzcTy0OpSv6sELWSCQlpN0Zm/LXh1+TNBCNys3tohtHnVhWS5dmJaeVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awFLhZiWxqdyytNb4AXsk0kfr7cFfhR+rkq/xO4qHhI=;
 b=ZABb+P0oSmNT6BAUH1sU7yCf1UNnWPCSeFCJD1Tcwd+6BRv1W62UBE+g1TgEStcj12J9+Gi30FHxd6LFO5JpGqMLoaCfvaaWvep3zgp7Iw+HNejgkEMGQh/gK2+cci5JTVlKuFZTh33Lvt5EG7zcjU4xmTW39tqCVTZV7UY/wkHvN44UWSykbLz/r2mFv37BV+IHu7HYihmf2bywDSDbCpcK57DKRVYNQKzqXTx2/04kGTs6DdMTWI7jBEnXdmSC5178kb3fOoNslQ7nd7P/U3SJZXeR4GOJwztKuRQzQf26r5uG3WyRB7AE+EBan/IGAl0N2M5V9QnxAJzjptbp0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awFLhZiWxqdyytNb4AXsk0kfr7cFfhR+rkq/xO4qHhI=;
 b=Kr5qRevSt+Yp7BoGv3fgxkB2IFrCvwatyjnvhDZ9HPdO7/MxkQyj5S3pughbzGab+784fWbc9Za25k/NOf4eAbeilyaLxyosw/lOeAaS2AuG+IRc0XAB6IlLwGuCHJdens9444ii5u7/1gc0Cdn1gJsCbqyaGXSwObq4vLKTABE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12162.jpnprd01.prod.outlook.com
 (2603:1096:405:f5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 02:59:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 02:59:55 +0000
Message-ID: <87jzephowk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] dt-bindings: memory: renesas,rpc-if: Document R-Car S4-8 support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Oct 2024 02:59:55 +0000
X-ClientProxiedBy: TYAPR01CA0109.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12162:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a9a738-340b-4464-4137-08dce3577593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UWnSVZ4csRK9lQKtZzRWxrPB2tDCuFgE624mu5KPCkA4duR4GPKkq0LbgOck?=
 =?us-ascii?Q?47qs8znhoaygmKMrkXgQsEwhvp3l9TeZQ90pXd3zaCu7cmYrVxdHFjSXJRx2?=
 =?us-ascii?Q?C0QL89HIlpuzpQU7TJ6suZkfrR1lxY3k7iu+s6U9Nt59PLTvE5kK24UltYfQ?=
 =?us-ascii?Q?24Ne6sKTUZtZBDgXlWi3sDrwSb2b6T5dvKCgGctSLM97//p4ONF+S0lYbjKA?=
 =?us-ascii?Q?dV51TrCt7QJAiXpuxSBlAwc4uKbqQXOUx+H/vggqD/N9Jv30ivyPI1dSKomd?=
 =?us-ascii?Q?MKbzHXa6xqMBOjev1VSNp0ZWxdU4JinXxe0LEZI5sHcuh32xD4BRHksruPUE?=
 =?us-ascii?Q?WZoNuDnlh5P0kJe5tWwpLYFWryZ2MrZTWiNbSSQMUNNn1L86masbewZxm7PC?=
 =?us-ascii?Q?oJpm/uycITEudMR2l3MVL5M3cawCQ7lCLwW1m0a0X0kZWfZ+euR5vnyW0xTd?=
 =?us-ascii?Q?Eglm2brzM6tQbuOUTLbPeKIurKAZ40+YbVQg1iHdhxz6AnYcr5It9kOBj+vR?=
 =?us-ascii?Q?kHzk7hJmiRhuzpU7gOsuWcSVoZbDQTmf0I8jjlqXMTpXIvuw/OxNW+shkPE1?=
 =?us-ascii?Q?mY8wyvo8QS26jaZoLTxZ9i6UxZV6F8Dkz/85kUbj+kjy6e9bur4sDwIq2GFx?=
 =?us-ascii?Q?BQYPBlJHaYV7f2iLsrO+oC3RNQvxojTik53a0KjCpnXL8CJjjFrt5Nw+Abqz?=
 =?us-ascii?Q?XmKORp/9BxJRQUjP53uP6NdhxsqU/OheEs1+ABMmoo/NBsKCOx42OuTPN+NE?=
 =?us-ascii?Q?ihzKaXDkRGAIfFzr+5cXfwMRr/6yMpFIEwwq6CGuzaVpPEpSV6N8LiDgRmxW?=
 =?us-ascii?Q?kD1SzQ9Z/eBWfCwGDXeIco/PDBF7pvvTupl7y4swqnN9ahn+VVLFNOwYqZEc?=
 =?us-ascii?Q?Y2+6DQ0yPiOcN9oZbhVg2Nc7FojiiA8VdkY5CncBwWeInVTB7dWf6UX8Pael?=
 =?us-ascii?Q?DpOg79yDrQLVXbQBD4aGqSavUSRO89D0qlQEXT+SckxvjacRIJZoAzrMP5Qt?=
 =?us-ascii?Q?F7rwqveCnV9dANPKLVniYLJPDRm1ntq6K6XSJBWBE3XUE3DErqscWf2jd2EK?=
 =?us-ascii?Q?iXpV0tXmXT8Lx9T6PHC60nGUgTHWraD5TPdD507WjSE2RGjy1ioOvmA2iFd0?=
 =?us-ascii?Q?8usnZDlrF84M2tAZz8YH7dolWOYqlqyT+8aJxC2suzvxjXnKIE2AiGKI6ZaC?=
 =?us-ascii?Q?cpbCZGzEHm9ubS/pus4xBvbU99uUyDA38BadiTiDejLXgEttnYPiAiFY/9h+?=
 =?us-ascii?Q?aDdTehEJbP6M8IYpFPxpALxxMTZNMkAeXK36pfeFM3hUjk9EPe04MgU+HRt6?=
 =?us-ascii?Q?DCYnxytMPfk+2Uo6w6eWvMyIVRbUfjWrM0TWMiCjl3cPjg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+fqoR3AWS49F45zlWnUAg+WUFqWX5hWN6ZkFtwJ/qFhjI2iHS/mJT03omcin?=
 =?us-ascii?Q?YBm5A9u5BjkHD23vf+HLKxf3jSo/U6bo/CV8RzqSp7zVMpK16GiZBfAmrJK5?=
 =?us-ascii?Q?PySj4L2ps24FHUAVS/dZXB0TJ567x85YVDTVOD2mnwE3gaXGXB2Xdm/oDVPT?=
 =?us-ascii?Q?5sW5L8LYhVzHXCipGPLPqg34FNOFX/QOwmdLt1coxTkCM13SHz1A1Duez0Yk?=
 =?us-ascii?Q?tcW3EOYY6KCg20uYnsEmktpNhS/bEiRUml5Nkc7vaiPCCW8YztT8YyCMBMZC?=
 =?us-ascii?Q?fZ6ZbEvOtuwrKG5LkvAQyaq8dRX4GWZ0ZKpL3SCif33TepQO744FUh0hUZ2O?=
 =?us-ascii?Q?g+NLKvOKUDACQ6RlRfbPCDtXwz4GmxASs55vBg9m6gYIFcXQY3rej7RYWniJ?=
 =?us-ascii?Q?UOCZmkoIb6BikOx/N5REWGWbOatZ3uO74yIs5aRvmT7poSt1B8lSAgcI/FfZ?=
 =?us-ascii?Q?TApwmfxqhSSRvNltbbRwonkjDZ12JnYvfT6nFckdkeWyqUt2qGggtJpKge0i?=
 =?us-ascii?Q?clLNjcLoKMTMF0+ST0SVsfh1PSmCo2yn8TJTJfr7Dsg9w7nH+5c1sef2UULL?=
 =?us-ascii?Q?115XM2LwgmxwFpflKJ4tJfMW0LA3Gqwvp83LawQLHYD5e+O3J9JRtyaWtrHm?=
 =?us-ascii?Q?R9JZE16TVKKP8KyoF9rjurMPepvJcqcnfdJJhWpg2yM8yfPBDYYMRt3J/R0s?=
 =?us-ascii?Q?R6f2zq6KOOqyqgj/EL/vV8UAcYNEm5znUaFA954EFEEEqme09lIMTPNXIbFL?=
 =?us-ascii?Q?n06AB1/aZAHKmttBXTiiBQIoKF1wzEVgaaw0ZlA1eBbd5oxXZ+a4euByOIHL?=
 =?us-ascii?Q?1s8H10d84wYro2grcIrj57NhELTSo2Z5YcFisyjILyZiBnN/nePrF0KZpvOq?=
 =?us-ascii?Q?6HPHbtr+FZopJ0MsiAXraCIxIrnFrJ0gTVpH14uN3vS65I1Ata+dXxvXsibJ?=
 =?us-ascii?Q?cM+xEe9cot5olZamxpZXPAIAXfx3tQnqRZ3JxfO2bTV7g3VZx6GLL2NCusnB?=
 =?us-ascii?Q?yUxWyQuXXKB4Vt8Jh1KJD1pVixaIeGbmUQfUBasI0/uUCm+0diC29Pcf6IML?=
 =?us-ascii?Q?7o/f066gbRG9nTfcz8ijRBnXXDMmyQzdM5juppdly7nTpi4ZGKp9LsuAvBut?=
 =?us-ascii?Q?DxsXqfWkw8eGHhdTkActSP+knDr1EQ6vSSB8mgiDttgSRD/cKvFGn/cQ+p2Y?=
 =?us-ascii?Q?vMqEdxmLT5UsUtjmibpektp/1lyna+xtMHuAE04yFSEMk9sDaiDUjNbL0ZxO?=
 =?us-ascii?Q?ppkLKKTtpNADzzPPvhXqKHfMloO/JposGlcIijOd+xYMYDcI0w3GdO3sTmmD?=
 =?us-ascii?Q?avzD+0vTN2qCi/kEdqPEb3s17JFQTeXgJzTeO5rjc4zzq629jYwnfxpl46jX?=
 =?us-ascii?Q?GPZPkmGD0e04/aKRD+miJPeUW6Osys2wY6gnX19jNX2bnU14hCmmqH7IiRbB?=
 =?us-ascii?Q?89uVsmsOWlqvChiXro43XT7EeeHOzFkbMWCxa7cXZ5+hKy30Icrf0keH0ZJO?=
 =?us-ascii?Q?FbLbrE5jcea15i64JAWOtgKwOOcwH4Lub1TdfXtC9mWvsvRVUVjPeDrOLXuG?=
 =?us-ascii?Q?776FoLGcu9Sg4jk3lsn2rlNxGcIrmBhIJEoy+BeVy0LB5P3qDrBz/guktoOV?=
 =?us-ascii?Q?gQjThHRg39Va/yEBxT5vdLU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a9a738-340b-4464-4137-08dce3577593
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 02:59:55.4739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TyCxIn5tbpp/9ZtJuhZ6jjhgrZ1MBc/St+VK5j6ETYb+wgoLn69YqlGDJV9B9Lviuax8uG011Ad8XtUkPW3/E2Kd7Y0zBGOFN4wetjsfkZtqtsqc1UGYf+mnYtAZku5D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12162

Document Renesas RPC-IF for R-Car S4-8 (R8A779F0) SoC, which is
compatible with R-Car Gen4 SoC family.

Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/memory-controllers/renesas,rpc-if.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
index 4f4bc953e31a..b6215d86b9d3 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
@@ -44,6 +44,7 @@ properties:
 
       - items:
           - enum:
+              - renesas,r8a779f0-rpc-if       # R-Car S4-8
               - renesas,r8a779g0-rpc-if       # R-Car V4H
               - renesas,r8a779h0-rpc-if       # R-Car V4M
           - const: renesas,rcar-gen4-rpc-if   # a generic R-Car gen4 device
-- 
2.43.0


-- 

