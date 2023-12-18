Return-Path: <linux-renesas-soc+bounces-1179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 854148166B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 07:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75155B216E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Dec 2023 06:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810376FC8;
	Mon, 18 Dec 2023 06:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kk948c3y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2110.outbound.protection.outlook.com [40.107.114.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E4D6FCB;
	Mon, 18 Dec 2023 06:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv3Xn2br0LXbv5Pqs3lvHUvrAZk9CUtQ44KuZ+uwLfSW3b77TLHWtTPGgQJHHZUbAfU9R9ZEAgO0/Zog6L/NXFhwzzEFpd93su0f81NASH1WwTCbeC12VoBKmPm/qnlHR423QnJAen1yIB//ltHYi6hECj3wDErmWwh9q0zZ6pn5urParbpYsALS9hd23Y3LIc9RBL01mGfPO/JEthan50vcMSdmicjKEcr2Ac1vpqQ+u920pjMQEG2eJpFqmL2uK9P0rFTYeUy6StX9QlQF2M6+MVitAJfqoCQ+AnEAAanDCV7fCX1tocidnzm5Vw8+JGA7KFX7cKoRrVPeKVuYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XQHWRTVIn3IR/BVQKSU7VmzH27RAnJGrU21XEgwWMw=;
 b=ZrVtdrUVj+22qvDzDKJUAxYnKAQbUmZEhi0u50KCYXURGsLsInNy4w8vmTcMwQqLJMoXkGl54BEEXlZiT81PUE055UlA1/cWi/vVFdPSJkBw8O719eUKlMtW4erx6JJZZH2SkBMnWRyv1qUziZgaT96YPzqvnm8DB31xCyJCfp9R18jX3o3dTi4c1hsthpVRDzGzwU05G6DDw3RYCfAQMBxGbERkZy0oipi+X//Qm+5TzWQxg76OIYg+YsausZkkkvplaaWECkexHcCgB9gfnc8TuWNb0qjJw+GOpYZK1WDUJ/G30l/1rkrUaqwjCeNcdFiPV3XUcYrprg2Zcc3CPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XQHWRTVIn3IR/BVQKSU7VmzH27RAnJGrU21XEgwWMw=;
 b=kk948c3y6l3dD4iK6g5YSbjlma29/VcMClzIYhWV8Bk5NSnSLDDJ/jw9/U7D8UnQqExocYgEsUOTzqGDyyFNwxSJ7kKJDR1cxnduTbRa2DjDPD/eXY+Vd0+z4H1pK9Vsk08GYs35FdqzZLQXA5cRqpM4uCH9VpYAQWiJN/tonHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8348.jpnprd01.prod.outlook.com
 (2603:1096:400:177::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.15; Mon, 18 Dec
 2023 06:46:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::eadb:ae7b:5fed:8377]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::eadb:ae7b:5fed:8377%5]) with mapi id 15.20.7113.010; Mon, 18 Dec 2023
 06:46:41 +0000
Message-ID: <87msu8m2id.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 1/4] of: add __of_device_is_status() and makes more generic status check
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
In-Reply-To: <87o7eom2jn.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7eom2jn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 18 Dec 2023 06:46:40 +0000
X-ClientProxiedBy: TYCP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1e0674-6980-464f-451c-08dbff95177a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6v6UMsFkgBMDGsVtz5Nif7dwhE12f8f7003ok5Qmu9znw2BKbOWMFXtAY9HTDSy5JYZm5Yn7tN66jGfMbyItx0gPd0dyeDg5lAMtSXvZad/h+dX5dXKlvHBBiJe/L+MsUuXZ87O9z0yJClfn0NqzqOL0/stUSUJFQkdu4N8MBsjWfN95ea72CTrshB/WnRHAZLGue/0dHcWPcighuz8jMgfnlRD172XWbi0qVU/gEVQXtqjEt3AfVULrn9jr0Xirm0SVkkOGHIf19Sw75SBo5yF/Fy+t+dZcjlALDhj/p9tT+LRTB4sfRPUxnko93bOgo6c5Rgr3p0VjEpH/H+5GeRcNvp4PHrKN1bntjRVHagiYXWctdt6F+/5bYihn+Uasd6SqWr99XCKUmuUim9gilFFAohm9OYLarWCHSudaFHYlz21Lgvq5JF729rYt0gs6tumygWU3M+6q9t2vZLjRl01BjtK1W8NS46ezGh7aoDunZP2+le7sPcvaHr94MkleEBkFG1W1UaeeKR/0q5Y5QIuweDOhLWvYTih5rjPro0Zy/7Ke5sqB7+O5q83rbaUbAyKpoqoOz8m8zRClLZdjW6+AduFCtaC9s061dWaya2N5eCVRMCE+3xX3Km6fsc6TcnJ8XRLhS2pBVdGDHtMZnQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(136003)(376002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(66556008)(110136005)(41300700001)(54906003)(316002)(66476007)(52116002)(6512007)(6506007)(66946007)(2906002)(6486002)(86362001)(8936002)(2616005)(8676002)(478600001)(107886003)(38100700002)(26005)(4326008)(7416002)(36756003)(83380400001)(38350700005)(5660300002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B+BwJ5hzJkNU/HBCfQ/B5KZiXj7FI27XjuXZhzDjutJRm7ymoi1B3/+z3Qnf?=
 =?us-ascii?Q?49FG8swjpguOFMGSuDMDkJnktPu71Y2Fgu0BJo0cqZu/ODgNQYhNkWAEDw90?=
 =?us-ascii?Q?TqDiz1I1sIa5Vs022SbQoANsJhLHGO2lUyKZN8E4OkdBGGFd6NkaARYyFmzM?=
 =?us-ascii?Q?JTlm55uyzBIyOwUcax/Ra3VRiWj14FCeV9Jycukui+/0vuIJfxSRwjqKFqHm?=
 =?us-ascii?Q?aI22xJ+Qi4r9JfQ56K48AEsTiQkGwLT28T5OgoVKjDu29VhGg2sZjJaIcUoY?=
 =?us-ascii?Q?9hOEoFI/2oEgKly+1CkOxVsubsyO79SlrKeUnDG5883+FPhnNY+WFkcC7r0z?=
 =?us-ascii?Q?ADJZRIZMEKQR9G7XZgrwUAtIrCieO0/o4JBbxCjPpuxexVGMBjsf75tPBl5X?=
 =?us-ascii?Q?RE0az+MhSkZuSVj0hRWumU8xsJ+jGCBIZsQKWUpUdTE8Xi+41w2SgRaBfxBo?=
 =?us-ascii?Q?gSXsUi1Js4+GEkPsWGS/r7hQXa3bs3bDx1XdlR9mQNrox75vBUQfQhWJy6/4?=
 =?us-ascii?Q?58P1eXA1kAkFJ+csYstlMd1epHnHVwydzOu/BPtiORRP4HByN1llebVv6NLC?=
 =?us-ascii?Q?3XhlteXia3CCzsovc7kDYYiGtl+yu+/hnGDGNcq2kdEVr5oR1VZeGwYaiTeE?=
 =?us-ascii?Q?Z1VAVvRyRT2QgiGYV1p2ugY8fp8bgMyGCd+JekiqGnaLcGEhjchp8gHiEsQF?=
 =?us-ascii?Q?AfEfTzR5zZUJgYwyBtrC295GknQq0cgn/VsL48AdBtSeqa8qFtov+Zonp1T8?=
 =?us-ascii?Q?TeYmVJvdfjnmxsV6g45kcYpcIBfQuzzvNK5lYLOssM5K4MOJ+r03Dj57tO3N?=
 =?us-ascii?Q?UXXmItTl02pDbsiPXJ5dOZdS6OIdal8DwOr6iNBQCnKpaen4SEI+7uMYtNmD?=
 =?us-ascii?Q?oZUI6H1E/6diZ7ox29Gf6iCdXA6PtpVSzIpPpQkFKFaDP9NsdnGWALrhqfFe?=
 =?us-ascii?Q?BOq2KA8T3ghCLUIJ58KtS3l94n4IRdidlG6Z5GoXAu+lHBSzwJpLX1T8aaBm?=
 =?us-ascii?Q?NiG583z66qqV7bp/hh8NDNBmKG/gVP9QlWGs1s0Rjt2l37OduDeROYmNyQ1q?=
 =?us-ascii?Q?d3Pmb1hqpcQfSWHYtU0DIek9aDr0M1GflmTmupmKl4hI70Szz43gsWSU8nGN?=
 =?us-ascii?Q?Kzvo5osfhaPYw6UAhdQ/1zSadky58tUKMxeiFI5bRvYuEPsF83WLDRAqHPzb?=
 =?us-ascii?Q?AAFud2lJjgXk7d/a50Fv9gefArcgP9PEcO8FmEOVDMdfgZ8hncXQI6/jqkjw?=
 =?us-ascii?Q?ZeSGp1eiDdxLgAOvACcTwU7RVi0MuOA1XaeR98F/vWfo9K7+SKfKG2ZmCcw3?=
 =?us-ascii?Q?dHEJFeEfBe+adwNZEZi7zJJER3eOR9W26IE5lE3mUaLxHiGmBs0ZszHxQbOD?=
 =?us-ascii?Q?/jcTXCqW0q0piPkeOb3QnxEg006rHcR6KADcwx/5aLgS+eb0Qbpu4x5BQFpH?=
 =?us-ascii?Q?cgk5LQ+BWJTO6spOvhkPZnVC8qNgE2i/bQvo6+SKvN/oJLmDVhuPdO5ybrha?=
 =?us-ascii?Q?7VfPhB4X5V2eqERI9uTCwPTnk+RQsXtRrEuM3PG3hiUQQ9HVyQ54f07MaX7n?=
 =?us-ascii?Q?rTN/TzOf5NxI5JOHPNiMZ4sAhsOrjPgFlGs0EA2S19DDaZOYIn0rQNJHyBRj?=
 =?us-ascii?Q?VJ7c/OTQfLdzKiFl7NvLfQk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1e0674-6980-464f-451c-08dbff95177a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:46:41.3144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYM8qzCYEIwJdk11X7FKecvKlPF57U1Dv7HjvRTs0nEmMFLEkkgV/mgPGh4HlEJ4c8DJl8SXf+0cd6Jw/vmtQI8vHzdtzpGGDugBki4zrfgroBfTvlImLjs6eJA6zXD+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8348

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


