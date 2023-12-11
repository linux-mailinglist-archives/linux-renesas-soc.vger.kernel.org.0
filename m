Return-Path: <linux-renesas-soc+bounces-877-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EFB80BF88
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 04:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DEB41F20F3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 03:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1496C15ADB;
	Mon, 11 Dec 2023 03:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MCN53NVg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2098.outbound.protection.outlook.com [40.107.113.98])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB8DCE;
	Sun, 10 Dec 2023 19:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8f9rIzSa9Q58dgOabOb+/+onPE+uUwn0wDf3zP3lGuQKlFYwGwv5bPyJKd86zhnj+bbvgxi6G6WAfzgz9tf5V9v/outbdMqIzvR1w+PV3oQtUJRGvRGcvLvpvb79yhLIPYOzPsY1y0RV35gUj60ukQKb6SaiVTs8YanqtDVtV2XbLDCTaZkgZ6AH1zMVORxdUcCP4iPdDhVPUrNP56zhVZ/h8609lcxymeTEpy3mUyT1CL9w5t11OQo9ReEnXgtb/IE1rTwmRnViK3BjZfjMkxeGaC9nRaP6iKPv9Nv7C/P5GzVXmSsbTJlV85vTUoKLTiFe+WnpEcJNfpKPNwMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XQHWRTVIn3IR/BVQKSU7VmzH27RAnJGrU21XEgwWMw=;
 b=OqDzuFV3yOhvlbAbPb6Dm3uSIVngQy/1zjvqkTfTxB+NSNxNNJQ1Tg7dAB5rtdRJIA85rOvlmRMpfA5YmwW9Zwcro8ZZrEmJGXufX4Y2fJZW1/mQYk5et9VpvQUB3XERxybYh/h8GfPBBNixnK/OFO+0R0wBYawNBcEvI/b1OWFeak7M/Sa+2BGoBI0bWyyjKV++SItUgfRdEotte0sswjoV6Ev6JihqigbNMocgjE5d/7rdr8S+S5PWRMIvqWVYPE6EK6TzvCKyYFr9C6Y34CCMfH78tKjG/rMOY/LgP2Ww4WzC7hj+kQQJOZDvdWMXk5QqjiQBPbHvbdkxevA8jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XQHWRTVIn3IR/BVQKSU7VmzH27RAnJGrU21XEgwWMw=;
 b=MCN53NVgfevxdrI1UICVc9IR+6QQ3F0gAkHXB4gkxTLQfWOfqRRc6q2rxEswoYk7pY7y+SjEc3bY2l2RNoMZy9FXGQ5wHOsa8uj9pFP8F+VFfbUNxRATbVdYY1fvNuAlATVx1R/L8LmbPq5m1CuJD86OvIfWDyrbgUchWjbDtig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.21; Mon, 11 Dec
 2023 03:03:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7091.020; Mon, 11 Dec 2023
 03:03:07 +0000
Message-ID: <87v895o2z8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 1/4] of: add __of_device_is_status() and makes more generic status check
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Frank Rowand <frowand.list@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Aymeric Aillet <aymeric.aillet@iot.bzh>,
	Yusuke Goda <yusuke.goda.sx@renesas.com> 
In-Reply-To: <87wmtlo2zs.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmtlo2zs.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Dec 2023 03:03:07 +0000
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11269:EE_
X-MS-Office365-Filtering-Correlation-Id: a058cbbb-ed54-4510-14e7-08dbf9f5b38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ep02xroLNWZ5NGelCZwJxaf7ovTSlEYB+YCxtxpEllv7LfbFl+hC/gVvzArEXxnipoeseJMLLzmmVvYg/Q6M1W1S0TdVlSvk8PzNWy8ILAlUTrv+3NXeLd5C6JaPDg0EzfHyc77JgabPDEFMIbERUfsUsgVZ4bPeuHWh5LBhIbQYlMSSREaU34G4IErHGKFB7yQYCi/sb7+O1FnQzJZEaL3jddeE0S7Fol0kqGnCl5vMzqryNl17ly5D/0dTRnq715tLDYeTzxidaC1OXTL4gbgxaFJaatJpsnq4AUhxp9PiFutRPJARGjwc+jEndt01Hcj89EoJu0NLpd6WelCvwNDqsTkrTi7GAKZ6IqeFa+RfusOYXFJbMakx758XYo4BRERvhsCDusmtgiGaf668XTB2sWQPnaJ3sW9Y1/d40b7JXEcSMJQx5Q+zwxryEy24kKOsAZAOkel3wfLS+jSKelIm8wAG9H8fr8ou6oeKRVOojaZ7dGNgxD2gSsnwu/kH1QZ5Q03Hd6oXzPuOehazt98M5H8TAcWlsNvAHfRacwMyVcNhbB+pnN8j3P6hd1Yo7b/tm546yI6zMBufSUJ+GacZe+/aYCsJBb+kYUnERpLY+keLMp2Zomh1752HlHVJa2NGW6X/8PQe6SA0uGmj/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6512007)(6506007)(5660300002)(26005)(2616005)(107886003)(36756003)(7416002)(54906003)(66476007)(66556008)(66946007)(6486002)(2906002)(83380400001)(41300700001)(38350700005)(478600001)(86362001)(8676002)(8936002)(4326008)(52116002)(110136005)(316002)(38100700002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dg2AYBC2UkTk62xJVSvg46ganfTFJfdnjRMedTXWx76p0dHQgkyUonVBggWk?=
 =?us-ascii?Q?gGczXmMjvFgYUB3eO0KOxGrihNAOcbNQx9LLKGduV9C8CQqYeqiUJlryyhde?=
 =?us-ascii?Q?by/VX/JwO2b+nB1jc+gFG6caO7gyRFqAkIn7i4knCCpf91DVArwa+rm3Yuqd?=
 =?us-ascii?Q?pZFkXpGEHnfUNgq/AFYZzc0bU8L/5zMBVghucez3IEo/LOSGCBveqP+wxzcY?=
 =?us-ascii?Q?DvOvTr9aZxC0nYgbbR3LVdjbKrRvcM8fLJxBjK+vJlX8W1fh9z4vdUZwQORn?=
 =?us-ascii?Q?DbV313UIe2WP4vw0guMkRUXVxOFxkolbbc5FQgkT+SnHYLhRiud5qne4D2+1?=
 =?us-ascii?Q?jH2nJ0oHMSXT8NZZCorwSK+5gVubNNdHm8xSP4lSjxJ/P1HkzbsOMvlioA3K?=
 =?us-ascii?Q?edlwc5k8N7lAY4bZoj+h7gIQgi66e5fdhYqqViYOkLT1Y/aQU7tT1M9z5I+R?=
 =?us-ascii?Q?zElqpkwF/Rg14GMLLfEfDkVNhCPsDeY9ittRVMHX2R1LmQHJorLOqaasm1DR?=
 =?us-ascii?Q?y7qvkrKxJemkJ45DpOMRMx+J700cLoxmSx2imikZd2RxLFUJk4aoYtw19CH+?=
 =?us-ascii?Q?uchcI7/m10wEldIKObxV3agHVEiBBMZ4FHKAgNujlxaYU101ySOR/C1QG8bM?=
 =?us-ascii?Q?4Eh3ZxXOXq0ZgH2bQJDxVu0dfuKjPhNpD+cAsJobFS/kSKh0URfbEGuwT01S?=
 =?us-ascii?Q?u4cjw3C31MCTb6vHhhf6mHWSCV8YXkBr7axM8oJqa7fXqmEoo7gXPdW9wa5o?=
 =?us-ascii?Q?aZFODilNGt1AUe6l9E1iZDMc35J/Iquie1AuVo29PNZDUuQZzh+N2HgMAQ+d?=
 =?us-ascii?Q?1ORinIF2D7RcPa1wXlcq8Cl6erBrNfzOyW7Ur+Xqh8qr8Z7q2x1njRo17ynA?=
 =?us-ascii?Q?jeAl/8d84XjTOJRgRm3GYoflP1QyRZZuGgs3M8lQBbwUaduhAsieL0QiV59o?=
 =?us-ascii?Q?s89UrDF5jFeHJysHV7BCzuLJqtoT8UGGWQ5b3peLohvaKEkWa/VfAsMb+rn9?=
 =?us-ascii?Q?qNNtur+wolT8/hzoMNUQhCen+BbNRPpZHknH3z5LTL1UI9DrO31w+z+Tg3WL?=
 =?us-ascii?Q?EHoYdHUFEgwiLugY1HZlE1wYmFuJV+tf+em8VGmCgycNU9YgGRMZ68IWGmEz?=
 =?us-ascii?Q?0FgkEB2bOqxw9VvA4QdqxaDmr/VrUwwWhiY4pSa6OZxIxN5CwBBIQPyEwHBY?=
 =?us-ascii?Q?SI/Lf0RTiML5fTDqXU1CctxTxs/eGMvhBmoHUIywsNUvINcpp59MvW08fyPn?=
 =?us-ascii?Q?2kVD0SwhOEbAYJzwtkCL04aCWcTqDzlp4lNCcpnebh0Oho5dMPHNv5BIjWO9?=
 =?us-ascii?Q?OWH0wls7NudIpG9q6OYvCavc2CgypbVnr32bLGdkjbNd2EZPc72w7j2/tNbR?=
 =?us-ascii?Q?vcah1a6TTdLCs/v2MTgF+5EzhMeVJeNFmRM4dR8CXrkvbx1UYgQ87ja1gikF?=
 =?us-ascii?Q?LjOupxMOMnzPbue6IBsSjMYfE5wAcRpPH3D/LXWlEQoHFLCk0cKYmrd89Yhj?=
 =?us-ascii?Q?TYZg+QQjVbK/GQ86h9s6EgAZQ/8jTNw4c5BX4awi9V0sWj7ByzMu9Fhu2BIe?=
 =?us-ascii?Q?8/2W+IHoDpMMJRP6Mn0Tec/PSYcRM4W1PE7udfKXxXmaRFJUZd4anb6gOtim?=
 =?us-ascii?Q?WJNKZqJQ5WJJieXnuC5s4Xk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a058cbbb-ed54-4510-14e7-08dbf9f5b38a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:03:07.8447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsZbqcKOff0aCf/Dmywa5myLRLrhzzhexqhhOgOjnkTf0nxugxs9NywcnsobpPF7eve747WMcn7VfLitYa4/jl7BpMZP+6F+dCSQRIMU/tSOAhN7Q67Tsl6rPOdPKLnB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11269

Linux Kernel has __of_device_is_available() / __of_device_is_fail(),
these are checking if the status was "okay" / "ok" / "fail" / "fail-".

Add more generic __of_device_is_status() function for these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/base.c | 57 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 21 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 8d93cb6ea9cd..3cb467a7e747 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -415,15 +415,8 @@ int of_machine_is_compatible(const char *compat)
 }
 EXPORT_SYMBOL(of_machine_is_compatible);
 
-/**
- *  __of_device_is_available - check if a device is available for use
- *
- *  @device: Node to check for availability, with locks already held
- *
- *  Return: True if the status property is absent or set to "okay" or "ok",
- *  false otherwise
- */
-static bool __of_device_is_available(const struct device_node *device)
+static bool __of_device_is_status(const struct device_node *device,
+				  const char * const*strings)
 {
 	const char *status;
 	int statlen;
@@ -433,16 +426,45 @@ static bool __of_device_is_available(const struct device_node *device)
 
 	status = __of_get_property(device, "status", &statlen);
 	if (status == NULL)
-		return true;
+		return false;
 
 	if (statlen > 0) {
-		if (!strcmp(status, "okay") || !strcmp(status, "ok"))
-			return true;
+		while (*strings) {
+			unsigned int len = strlen(*strings);
+
+			if ((*strings)[len - 1] == '-') {
+				if (!strncmp(status, *strings, len))
+					return true;
+			} else {
+				if (!strcmp(status, *strings))
+					return true;
+			}
+			strings++;
+		}
 	}
 
 	return false;
 }
 
+/**
+ *  __of_device_is_available - check if a device is available for use
+ *
+ *  @device: Node to check for availability, with locks already held
+ *
+ *  Return: True if the status property is absent or set to "okay" or "ok",
+ *  false otherwise
+ */
+static bool __of_device_is_available(const struct device_node *device)
+{
+	static const char * const ok[] = {"okay", "ok", NULL};
+
+	if (!device)
+		return false;
+
+	return !__of_get_property(device, "status", NULL) ||
+		__of_device_is_status(device, ok);
+}
+
 /**
  *  of_device_is_available - check if a device is available for use
  *
@@ -474,16 +496,9 @@ EXPORT_SYMBOL(of_device_is_available);
  */
 static bool __of_device_is_fail(const struct device_node *device)
 {
-	const char *status;
-
-	if (!device)
-		return false;
-
-	status = __of_get_property(device, "status", NULL);
-	if (status == NULL)
-		return false;
+	static const char * const fail[] = {"fail", "fail-", NULL};
 
-	return !strcmp(status, "fail") || !strncmp(status, "fail-", 5);
+	return __of_device_is_status(device, fail);
 }
 
 /**
-- 
2.25.1


