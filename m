Return-Path: <linux-renesas-soc+bounces-30202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NWdEyViw2m1qQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 05:18:45 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6F831F9B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 05:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C4883069053
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 04:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295452FFFBE;
	Wed, 25 Mar 2026 04:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CSaa5cGQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8572ED843;
	Wed, 25 Mar 2026 04:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774412283; cv=fail; b=o6rptdfFwCMR8F4A3P0ktJBlfcXM5uoqA4GNUq2DIle4sQE5gvP25KohPKlO+yJauHd4LppjJo5hXOWRF8xWPo9Gmkm7ihPg/vAtDGX9cqIzWUST8L1eLYdQRBv5jlVIlkFkNmUbL9ffJvSyPFqJ0c/FMssvzkv9T4t09dwZYEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774412283; c=relaxed/simple;
	bh=lbbzWKeHHT18Gq0sjEN+GDRByraHjlCfwl0acbjJUVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GoKpsTr8lxxbOpo1dl0sYOxNFo+/UDZJOqge+14/rVefzjeaJsLfcSpWwA7lnC4ugsSqxYlwrUyPlxIbrN8StGX8pzipPfyVWYSuMLzIReLG8YTmeHlVY03zf5M/n/wgMlF2vC3fYoIO/i763qHbTFwQVPaquYR1/+4FVcLx0c0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CSaa5cGQ; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2R0A8RpYk8pPoixSzkmljiISW6TjOv0rggICR24x+8/Mr0ONsqtRvF6Z6vwcSApaSpgVYnN0gG0gaC/ZgDaseO/yPGzZKPF9Yn0DOGpZt/JVsDQHukGtPkbfIHuzw2XI5Zp8Vn0GDWsICfUWCNRFXY1Zqj6uPtIv156tPfFz+6JEoba87eggJJIIYL4iz+BKxsADEJqc/ejrx7NWEkAkzYhJ276KTcbU4hzx3eAPGc0Xr/RcI+/rqYEJIJBpl8U9bqlBPGC7eOtk7F+nn8O63sS4Wc5poF5C/8rMmpU3u9QE+SPeP0lDPRdvMlCeY8b5FbFxlYqIUSvRZOvZJ3Ikw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVp2NU6P3RfgcVJ4NnPU5867NwDURHdPLMvOWMc54xc=;
 b=NBMpZgksz8vPIYLJFb60iTgOuX3UV2FbAErJSjJhksrsTllj3vDDI39mQ/Niqnmpu8vhZV1P8BTHg5nPoSRBqrNfLZ4Xpt5c8kJtTifXU6Cr3lSDjsEv8hntN92GV/oj40dzeRDeVv0I6MwLtS8shRwkFVPmzaL0iXGOxWohR+nVn5UnxmAkpsSkK6WbINTq5jPuvrfmG1eTBnImy2VVq6yyJZx+4krufqR4C2qs9LWppCdNu/PNWjmAKprzPhai8Mb71vDgY58yA5mLjlvJBQf0qkcXtQ/iyuJThl9lac35hlvXV45SthMJHUFS69fK12ARXQ8WnRmbZd2BKbi3Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVp2NU6P3RfgcVJ4NnPU5867NwDURHdPLMvOWMc54xc=;
 b=CSaa5cGQZW/DkirT6dNSaFG+UrSa/jO87gB6mzlYKHIpsnOMq7P6AjQnCftk3OWsesGtVLIX/c1zg5al3pGlH1ULBVOmbL/U3ZKtLtIPsRrkLAJZW8D2t5lac89PjiWUI0aKjzrvfTO7INV60X7Q02BnrQy2oAgM40lXunr1pNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by OSZPR01MB7130.jpnprd01.prod.outlook.com (2603:1096:604:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 04:17:58 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 04:17:58 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	Linda Xin <linda.xin.jg@renesas.com>,
	Tabrez Ahmed <tabreztalks@gmail.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dawei Liu <dawei.liu.jy@renesas.com>
Subject: [PATCH v4 2/2] hwmon: (pmbus/isl68137) Add support for Renesas RAA228942 and RAA228943
Date: Wed, 25 Mar 2026 12:17:28 +0800
Message-Id: <20260325041728.68-3-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325041728.68-1-dawei.liu.jy@renesas.com>
References: <20260325041728.68-1-dawei.liu.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0011.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::17) To TYWPR01MB11935.jpnprd01.prod.outlook.com
 (2603:1096:400:403::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB11935:EE_|OSZPR01MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca3c0a3-7fd4-49bd-642e-08de8a257ee4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FHZ1dGBwuZSpVQ+/uR1Wo4JWTc4YTsAHHtX6RRwG32iAKZgtO98gL/7GCxCrJ7pPJnKT2S/dnFQ47fiWOUUlhH4MBRZrq71QjGxne0N/dA6mNTRO04E7Tep48pmi4Ht4u1z64eSka+yRuSkkCuIq2C47mbMpA93mOMG+GP9sc73FZfUJ53R4uCoTlKPW5J5KbH8+zhTXo4lJcSNocmiBx7+u7gUYT6EjUafH3xU/wKLHPE3qgb+i7nRMtx+m5liwPU499g9RGsimsLqaoOnREy4A2AFUQLyxZR7QIM5ixFoe2jQSI8WpZLnLUJvNP1764RvIQ0ZdTosDLytszI4mX/PM9lyC9v/Zv/A04JdSOLqfH6wXQptPJ2Idp9KstIngpzEc6Vqd0xbbiiNNMmirNURv2gRDioyAJbNrlFLvVC8wJbPuxUfdjeSTe8wPoJJNliGsePFzceBdQe4JhYHkdHlqH27ZxYziiI0Avx2UM9h1pa10JdX5E+rsQXLaBoRODJRmlru1A7KW9ZQByNCrXOTw0/EBe91pX1/gwSh961E1ofmYSpKoqZpopAtdKEgGfH4cJ/+B7d26OifeWTZatjw0dmhGhwNbOdQYF+Bu8ZkQfuACFD6GMpEe04vD2Ty7vDZnT+g8Nfptw8H0B7Qt/PgoE2nhQ4hdndOhdFK5ZQMKpxUQccDqb3nLv6U5pFShV+rCPnSwx2JXFgdXOmUkswM1yOklO9SnvKjzHPefQn4dd0OaW89hjjB//XNmJLGSGBnF/2/R/294beZAbg04e4/y+qT4p0c05JzAB0XXvdM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p3FbvWYMBmlU6g1eKnUsmCQxNyHqPPfucfm5so1NiamNXhNyfg41RFzA7uMF?=
 =?us-ascii?Q?wi10+T01Ro8+9jvab9BKOtVy3Xs/5bNUaTsWLYd5J7fCxy82Ff+vNfnvFCm9?=
 =?us-ascii?Q?PPhJSPKSSTHfv87N2aUAOhlAr1+AzhZsImSE9HQDAelF6hiqhO1o9/Pussgg?=
 =?us-ascii?Q?7HzWRirnfyW3ZzWqzw19ckAtTpNf2HkwGAnMJRNLsWx1w3Vp7Wno2wFuhAKF?=
 =?us-ascii?Q?E/LVh7ifzhxIqHveiu5Qyz+h42Zbug9JPYKYrLSQKPYlZ3lVMwKIfA5r5Izy?=
 =?us-ascii?Q?mHs++HRZH9NdFsD3nMK5v1NYShnN7eNJtyk3t6ZTpRL87eu+jO9RFRu2HJBI?=
 =?us-ascii?Q?+NNuwvf+FLAXQVOES0tcKAVE9ePXtrhkNKYSOXG7W/6GKf9khDTaxSUaKbAf?=
 =?us-ascii?Q?sEIqUXp/z0jBAFUkLHmhXqVESVqhbbFv/iZMusKbF4c7iSO0MK2yExnd9eQJ?=
 =?us-ascii?Q?GQDSriZQvSA6TAmKL3qidXnzemW8nDs+NPlgfcpwD+y+CrppdpftpYFPGTYC?=
 =?us-ascii?Q?hipn9RcwSle4kLq12hNJlnpqvtcozRgDJVA9BbISuog33HyTbXMB0Lh1cwvd?=
 =?us-ascii?Q?AktxSnZgFK+MJzEBcBYDmELl140ziyYw6FYE5lksrDhx7aCiXEcTaqIfhi6x?=
 =?us-ascii?Q?q6la1TlPhDZzWt91yN0LXcDSs1t+zkmwvTR5g7eLddGXU86CmWiMfpdEuE2r?=
 =?us-ascii?Q?Ao9FsHowCqWB7jgRNJqgk8IE3mEO5t5jmzAKKyih8VaxrRNSWsm2FLaxpqSr?=
 =?us-ascii?Q?WIaDSWg/fEdiW03BHamIMrFP9D/17m2n9ZbaPJesx/YjtuWH6coy4XRvBjBl?=
 =?us-ascii?Q?oIgmdqBSk4Kq2vDSCTKNQ6iRD7EywTl4BLldjNMrTmGyLfHBFzHChS5oBurf?=
 =?us-ascii?Q?+9K5A58k0UIczXZTDhtDffyjS8qN6I07pltP2oxHLwUb3l7wvx3GRRHUxF9A?=
 =?us-ascii?Q?I+nAYFwmlmwBu0QxknMqIQQUfqo50/FlGg+FAISmzInyRe7kbM9hwelpThjY?=
 =?us-ascii?Q?r0xx1rQgQfTbTwh6aOW45C/XSq4ZmKItSq5tewGSZJBsJGJPDkoKEuHrdkNa?=
 =?us-ascii?Q?JAoOh4umFHzfn2fWdGl3Yg3PgM0XGOYAchc+UuwoQUdGn1bWiq0rtBTHL6FS?=
 =?us-ascii?Q?NefJe9sjhXQpYU+7IoB4FMRmigklqeinHqx45Ixm8EcuRRv5aLurjtG3wQ7l?=
 =?us-ascii?Q?Nw6V4g2F6AYTn1onyVuJjcviCiHNzRi8VnCkWdDDBNZXuKo/FwkCTEOuEP6g?=
 =?us-ascii?Q?fWcW2jv2Bg9JusMJCWRK1CXKNBiLd1CTwYC4xS1m3scY8t0hXg6EC2HlRUWp?=
 =?us-ascii?Q?VGCKAGiSWBh7QyD40/ph9bjjwUNfp6/D+JXsBlFP4wvDilvHkRJk88N9l0Hu?=
 =?us-ascii?Q?604NQTe2fcDNmTA2jCzW1XogtEDnfhd9LqoKgXwwrITzzdsuQ73G0tgD1q6f?=
 =?us-ascii?Q?99QnOeUbfixdvsiaR6e4599PhfMC2KlWK35qpr4CWGt37zLyWXBaFV6KK2+G?=
 =?us-ascii?Q?Nydgq6w5zgeF9maFQZzgeFjmny6ZjhAL+5Do4xqGnZyYGKG3lnCLcfs7TfZu?=
 =?us-ascii?Q?CDa9U+vdU3L2XOoXhTOH6A39jh7QlBIfvQMu8Ef7t0h/fMyUlnZ53jFxpoPP?=
 =?us-ascii?Q?A7cwLS+4p22JXO7NqSlcrJQMEoqnIfqzMU/rvpSS3PPsAUpOANVaYEjhWxc5?=
 =?us-ascii?Q?A8cvzml+jwseak3f2odmMgPoJWqSV4TfpVZf35kEZaMF9UWUbKsi/eQejK5R?=
 =?us-ascii?Q?wgqgQNZV+Q=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca3c0a3-7fd4-49bd-642e-08de8a257ee4
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 04:17:58.2782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGDKr2850GB2MMz3GSKe4msYmxhX7h3DOcWZV0dOF2w9exw4L2XO4caqyhA6ZujYk08DcEn2L5fxrtzquDyOYAQCzaNLFmTh/IOQqqQv7ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7130
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30202-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.liu.jy@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF6F831F9B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add I2C device IDs for Renesas RAA228942 and RAA228943.

At the Linux PMBus hwmon interface level currently supported by this
driver, these devices are compatible with the existing 2-rail non-TC
controllers, so devicetree will use fallback compatibles and no
dedicated OF match entries are needed.

Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
---
 Documentation/hwmon/isl68137.rst | 20 ++++++++++++++++++++
 drivers/hwmon/pmbus/isl68137.c   |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/hwmon/isl68137.rst b/Documentation/hwmon/isl68137.rst
index e77f582c2..0ce20d091 100644
--- a/Documentation/hwmon/isl68137.rst
+++ b/Documentation/hwmon/isl68137.rst
@@ -394,6 +394,26 @@ Supported chips:
 
       Provided by Renesas upon request and NDA
 
+  * Renesas RAA228942
+
+    Prefix: 'raa228942'
+
+    Addresses scanned: -
+
+    Datasheet:
+
+      Provided by Renesas upon request and NDA
+
+  * Renesas RAA228943
+
+    Prefix: 'raa228943'
+
+    Addresses scanned: -
+
+    Datasheet:
+
+      Provided by Renesas upon request and NDA
+
   * Renesas RAA229001
 
     Prefix: 'raa229001'
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 3346afdf3..03c9adc0e 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -432,6 +432,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 	{"raa228228", raa_dmpvr2_2rail_nontc},
 	{"raa228244", raa_dmpvr2_2rail_nontc},
 	{"raa228246", raa_dmpvr2_2rail_nontc},
+	{"raa228942", raa_dmpvr2_2rail_nontc},
+	{"raa228943", raa_dmpvr2_2rail_nontc},
 	{"raa229001", raa_dmpvr2_2rail},
 	{"raa229004", raa_dmpvr2_2rail},
 	{"raa229141", raa_dmpvr2_2rail_pmbus},
-- 
2.34.1


