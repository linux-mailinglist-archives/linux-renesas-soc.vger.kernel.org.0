Return-Path: <linux-renesas-soc+bounces-5-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1397F238A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 03:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E62761C21132
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 02:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF5212B8D;
	Tue, 21 Nov 2023 02:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jc31jy2I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F9CCA;
	Mon, 20 Nov 2023 18:05:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0dLAmeSy2r9t0JpcGIOrf7fBLFtklBTMFkVnmEw+sSWmZwe3J64rFSMaL0YLMXg4ObBXmS9HAFyiJF7+ySnqaDDJYgDv+3/vzuo5YyAoy01r7A9a6/ydP/GatCVe/h5tmwwDDAbvECXE8o3dF3L+thBz0Mxi0u2TgcDauboDzE2gcToF7rsnIZpOiQSblzJ+Uervs6kIql1X6pSvlzfRNbI74lDhmxbBo0XDXLV/k+jetSPVf2VGXjMnwn4j/Gck1XHZnkA3Z1M9YoI+okq9N7kz89iKXK9HRE8BkwQCxxO4JmairjHLyXiLagwO/Rj7ojKLtwYnNTwhtW2Ov4GMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nf3xY1PAXbmc1h5o5cDQBQSYOOxzHqB7UyZxNdaryuc=;
 b=FpQvO1DUD1NcMdkOR+URbmEjgwyjvYcNBGaqFEuSCM1PrECamhxDJjp6z1t+QmHttEmqrNTTYF/gm5bi+dHXGZhtro2GsGSaAtnihUdR1zWiafyahr+L7OPdm+RwxCyhuX6p51IWQBBf1Yk3k7lggsMMJdiba4/l777sUFGnPPoB/62sp6j/glUCUd92dUfdfKJAc3BGZfVCSLP0qaXcAyi9Gg1gMjdkV5+YcGb9zE3qLGw7xAf4KQeidTr4ZFw/xhVV4DM4zJ2QsGZ9oCze6Z9WsrAco8vkOG7k9OMuCbxuMAC3Zw6UMxICg349CvsFZbbqkrp01dQTAaXGFVFq5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf3xY1PAXbmc1h5o5cDQBQSYOOxzHqB7UyZxNdaryuc=;
 b=jc31jy2I37dCaGVxFThEzNDQ3Q3EPMqbE+j1jNM+qfZFl9H+YzLsogmz7n1Bba2IYHCR4h2zBY6uRwlp8PGCdVeMhlm174wuhUG/vXqay95jSkbaG0F89m82Iz2b4jXF8c/uOB4njHQFxOh7QW0zLWcDL0DDF5HbHMLf8lSQZys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8610.jpnprd01.prod.outlook.com
 (2603:1096:604:18d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 02:05:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846%6]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 02:05:25 +0000
Message-ID: <87edgjc13v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/4] of: add __of_device_is_status() and makes more generic status check
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
In-Reply-To: <87fs0zc14m.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs0zc14m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Nov 2023 02:05:25 +0000
X-ClientProxiedBy: TYCPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: edb22356-6bf9-4e48-ee56-08dbea365375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HkWUMQT/ebpRnBjkP8uguCok4Qp1SVZUONbYL/8R1mYn/WyQNnIbR1qJr8UZ+ZGYrm6EKz2sLPYwfeesbhtpXGyeLfSnXrK7VibX+zyB0470gVc20Cf35aQjidkU6bP9jmQZ1r8AD3lscRiC4+8xrOHZZV8+EQh3j5UAUBiy55G1m+3RvZrniYraqp7T1dPpuGd2jdbdtugPz3XTpPfBVAghXxEWTPHvfKRIknfsvR9r6f97a0sqHTp8HytQa2Gv6CedB0aY+x8tvfQ0QS2YC6p2JLeocsuYziElFch1Hqkz54gNZBj+cih+C2djUnlFI+Gm5rxEAbkeaVGoxof/H+sjKsNT8yQ65AfXVNiIg93uEcij8kacVPm18SNSVQj7EjkeuqEcVWuO+zTrTlTIhoc26q76DE10SAJhr6UH17n0yFRsm7IS8lkD44PkZVq5zTLEepQGIMslGiZT4j5xpa2cb0ATIZcALNVA3frK5+WateYSrpStB1Ag0q7MbdJMuayKNZOxvBMvpIIeVQF+8JJKNg8pxvg1lo8XVVfgEpdoEqB5Ho7ptmjVjkJXgfkXDOh9XZRTVO7i+MK9sQ555SvhXnh+pDfOIaIdOvDX966ngBmsczoHaOIDgo4P641POLkyAHJodRK0I1pHESVljw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(4326008)(8676002)(8936002)(86362001)(7416002)(5660300002)(38350700005)(41300700001)(36756003)(26005)(83380400001)(52116002)(6512007)(6506007)(2616005)(107886003)(38100700002)(316002)(66476007)(54906003)(66556008)(66946007)(478600001)(110136005)(6486002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6u8bH50m/WJwbyY/pYUd2mZQ9Am37H/pXpHQ13wN1PtJG6gNy8qBZJpTQUjG?=
 =?us-ascii?Q?S9cRC56LRyQeafYVfVfQWvnOCpOiVjMGibFJmidOCZ6tnEbu+noznULJsEB5?=
 =?us-ascii?Q?TjfQ7j2ffO9c1nLZTqO/ZsYPp5b6BU2PpotwB9TdWU8C3QAHSnthWXuHN65K?=
 =?us-ascii?Q?RQ8WzYd53jTEN+JoNsZ9a+27fWDq4jzI86uOye4EhGyV/S54BdP3Duc9GI0S?=
 =?us-ascii?Q?AktX1hD9qar8kcO2NnLNGFi5BnI/gX80ksWhp89ssnxCrBv8OikVP4GJdWku?=
 =?us-ascii?Q?91omqBuZfrn776OGVg60B+KBnHXUmTbMDNJQv7ewWDp7Gi5PhBqypRLib7Nl?=
 =?us-ascii?Q?cEHwWzZ9Y2D4x/PTyH5GouD/hl1StNM6CAC+G6IcfWNo4o7lgVVXbSgL+8mF?=
 =?us-ascii?Q?lxSjTb9DMonKENVe2xNckq9pYITROCP8cW+wHdJE8Rw49XWUh+RC+Y0UTTw2?=
 =?us-ascii?Q?ThO0uDa+MkcMcI/+gDWpf1Gp/NYmAyf/zVn9DVEi1ASzApr0kyOQUf6pHFI3?=
 =?us-ascii?Q?yJEcxP0aRUTfEQA6fgP6Dyoz+6ZlUpyiGgXOkm3z8q5w25WjRYWYm2TDT01B?=
 =?us-ascii?Q?T0qyuGoJK2GPR6JD38dLk5c0QZtTOifY6j0gfoOiAD3RyDSvUEKm6BJDFPU4?=
 =?us-ascii?Q?Nlo5AGq8egsuP+AOG2qXOXzWHFzyw+sE5oqtAFOC2Twuv+6S8gxzIsKkjnmk?=
 =?us-ascii?Q?RG48lVH0QhYLCB7v2uDhKx7+PQrTBHiZFCyIP+dwavbu+4WggT4LgZLreibI?=
 =?us-ascii?Q?P6/T9x38mN1cNoCv0rWoYR2xolDzb9KvqZ2zLlsCQ8L/Z4gckY+RrkLKMMrM?=
 =?us-ascii?Q?LWBK53ZQiTunCap9zDjre76GgYx+6KWYjEKWYruaeXpaZy4xMKbWNMqR+Fw5?=
 =?us-ascii?Q?oWQLpUsf0wz8VkvdnZdRgHof74cZNkao9J31KEyPTEb56GWk0KtBLoWgtbbR?=
 =?us-ascii?Q?e0HoPJ8n1PTNe76NGk8h1TI8zFAks4tKJZylGjAe5ZkSEiOuyoWOb0vGLOXP?=
 =?us-ascii?Q?7wnNEK2zF/tUJPGWe67QQqR35i+6jxPiYF+djeIveuIcrufRkXVqT8Nwh7R1?=
 =?us-ascii?Q?l8cb+XqWW7wnUL95uR12eRQdgrK+dyr64+qheDUthhadNKJPXsXH8t+e6x7H?=
 =?us-ascii?Q?V4xejE+XRi4HVDUkJ+HDvKLxoLEge376OcVXZ6zMqsownPeJwVSxMC+U04Zd?=
 =?us-ascii?Q?D7ukzCdasHOu/cYmxNWlmKFuE61BSnAJa4iHU7EorPkjviwLa+QxCkJACw57?=
 =?us-ascii?Q?f1D4E/LbKiEZWvm6ZN86Z31cMFtUl7EHPtJBofz1RR46EyrPfZttcro3s4TY?=
 =?us-ascii?Q?RRtmfpnv2fyuZVPn2x0edFOaF07Lv7cFW5CpMHC2bGUxY/Bixfh+KpCRWhw/?=
 =?us-ascii?Q?mmy8COnGQQPuLaVmS6fvJC1JV/8XEIe7DxKSe4BO5/S/O0Z7+Eh9dMejToMY?=
 =?us-ascii?Q?8bPxs3f0EBp6kURL0d1XbgIpiDwPpi7HgcMrJgWqcYyQUrsLuBQrzyBSH0zt?=
 =?us-ascii?Q?qL2sfWMpr75i6s/yik2KXaahJW/C5+Z/SkDv+/WxoI9zMLXgCVd1BjkkLcVm?=
 =?us-ascii?Q?U3WbHtCIccEzjOxF218PLJzEqSZeXw0YHAtMg7RE4sJ5MU+FaOMa7jNCsTYQ?=
 =?us-ascii?Q?n1h8gj6hhd0jQhiJPYJCYUQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb22356-6bf9-4e48-ee56-08dbea365375
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 02:05:25.3851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: polxUJJ+7002m3eL7G0+76TOC7WF4XY0dnmtS21XBkzBw9QBrW+e5BHaE//Y1awfxt6CRhqaFzC3ol3dHIFKvZegD9+Ajqo/H69wJDolyGn+ZYmPR/6YpSGw1OC/5445
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8610

Linux Kernel has __of_device_is_available() / __of_device_is_fail(),
these are checking if the status was "okay" / "ok" / "fail" / "fail-".

Add more generic __of_device_is_status() function for these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
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


