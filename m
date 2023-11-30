Return-Path: <linux-renesas-soc+bounces-441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C92377FE68E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 03:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84FFB2820EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Nov 2023 02:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FD3E55E;
	Thu, 30 Nov 2023 02:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lGXIHi+5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00505D50;
	Wed, 29 Nov 2023 18:14:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nROYsg3I8JIJCDqCmaisUSdRaKnJzuBL4EcqGiGxRFM8TcTSheklOscPdMzUAvvqR8NdBP0bRGw2BRpjPX6FHE7cBq2RxCBjT5dEuWCZULCg91X2HhULGHSclcQOGi2iRp6T0lPsuZbTAhM9PCQprzsiNyKuDGANqfnbsEW65VmCG5LLD2muaAQ4bfnTfP1gY3qUCx3tyXq4JJ/aZWSLmjkOi8Qt/rGC2Td9QPGoNHdkdqHazB9PLcg3L+wJbeJiVW/780Z3zUbZoWBXK5hBDCNFSvXCZM8nnAFevnmlz5FfwuP63IyrhImnAoWRvE3aFkWopJrSIf9KikduuyudOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xa8GT0VxUza85Ru2MUTrCo0fkoYNH+NXki+bfQgVGe4=;
 b=e3sIJHGxmFg9MCkBhpZhLk84xY9n52JkXK4bLjyZFVQ7IkIMZVvpGDTIvXaghDDFNHq2B7Jg/z3AD/BC4JoWpVRtqV4Y7Uq8vbVr8ieclQi1XuJrYRUj/46pyEVMrbucMUYOR8Ntk6XQBM9Job6d/2xgLKLjETODeDuxTLzKqpgRbEG1qyjCFzQjHiCf7Mg3fD7wQrabLr5Yl9QXck8nl+gw6SrYHioDi4whZk3QY9/H3kz52TRkgxsba/yPeGA04qLKhvff1bfFyeLLokPxiV5vtJjnEFT/r7CebZI1VtXEv42DgxXLVXlYjqBaBVuePcYy8xK4TCpb1g7lrG6ofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xa8GT0VxUza85Ru2MUTrCo0fkoYNH+NXki+bfQgVGe4=;
 b=lGXIHi+5FXZ2K4WgrreWcSfv0BwZlrKb+x4usudXPAZEUsp9V3HHr3jo+/Ebb/1tZdN/f3OUV/H0wODh0Xo+U6F+57EPsOM1PJsHe2nwUQaEFBvf28DzKOvjbircu0as9pSTCB+MXI/PKZlYwzDbYCJw8IPZCrPL2+po0tfKtsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB10717.jpnprd01.prod.outlook.com
 (2603:1096:400:2ae::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 02:14:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7046.015; Thu, 30 Nov 2023
 02:14:54 +0000
Message-ID: <87ttp40yxt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/4] of: add __of_device_is_status() and makes more generic status check
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
In-Reply-To: <87v89k0yyj.wl-kuninori.morimoto.gx@renesas.com>
References: <87v89k0yyj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 Nov 2023 02:14:54 +0000
X-ClientProxiedBy: TYCP286CA0270.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB10717:EE_
X-MS-Office365-Filtering-Correlation-Id: e1437b47-5072-4c98-57d5-08dbf14a247e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i+tBgdDRLjmFW3aF+3uc2npPRARK0z/NpdJNGbOeovDTMROLLmJn8d/NbHmmo+HA8bqDyHCdwg46hKx3n+Z5pokcO0Q6OEW4d7Em1SBPjzgSB+JTnbfdki0OYVNWU3iW7sNIUOKLRk9RzxRsRk84EOHtHIeN94JLPa8aUBQIWJa424Jl0nOsy3X3Sh/k4wsrhH4uYYrIOPnLVFzJpj7O6BY2qCksYzcSqLh3SAMDQNBREkIQDZdD3YG63PlH9M9GGREZe29d60rOF3H7KejfxgXjWI5lW6x9uJp6J/VyTnlW943wDkmZi+i400QI/w2RqcdSENSR0URf2YPhHJ40wPBDWSBCkyy9pXlS8FoQ8w6pctDsbRNq5aygrOBbbbvc+nekekSBgkt6EkOJSFYnBvgdr5SF90H5Dw1jX/5tzxMW5lFTSEm08994wLZHHzxTfUmS2mUF/UlR2pUNlkXS8wgTVPVpjd7wJ+QunZPdj/VXmAnOIs1qH49YJYNbtTf4zey60QnlYLed6CQcnSrozd/+HoOoVpS8GkasnbQG4bmHAYOox8pCVEH5/XpUDuLX2+N84ioTvbbxxDUZP/cbobs37JnD1acJKQRjYl3X7RVkhlWWRg3PKIJhXhaN8QZIOoHA3sui1Ytkv0HVQZZ/OllFSIk9rfnMmMWjQj3cm+Hau2ENHBHhgK7c68bT2SHx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(5660300002)(2906002)(7416002)(8936002)(8676002)(4326008)(38350700005)(36756003)(41300700001)(202311291699003)(86362001)(6512007)(52116002)(6506007)(478600001)(6486002)(83380400001)(38100700002)(110136005)(26005)(316002)(66946007)(66556008)(66476007)(54906003)(2616005)(107886003)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bh754bFT3tcwFt7bQ3DB7ANz80Cx9L2MkIRX/7EY1TsEGaXfzwIru9148VSi?=
 =?us-ascii?Q?cJ3i0smHOxJFZJEhFyAU0bzKx5WZaPym/bTTVy79NRRlgYcWyMTQVkVIaBut?=
 =?us-ascii?Q?iKB3dHX02ucyhDk5rX9FQNfhoOySRWOJhIgZDDAOj9gbhsl3zUjXtFSgmk4W?=
 =?us-ascii?Q?1SkUAhWRivwO6tG5MAW4D0O7/FZX8gvkPLPU15+rop6lYIffw+4/73IOIncs?=
 =?us-ascii?Q?wcBYz4fl2b7wSMnYO0iUkYL6W8rkEeNke2PDkEmplQBCIyENDpyqj64n3f24?=
 =?us-ascii?Q?xmMsodZ/SashUIiUoaw3lFUYX3ecbQbK8oicIYB0lwWoccr6O/Hq1RA1RAb5?=
 =?us-ascii?Q?YDb5z/mzQB1UGgi3EkvGRI/6jgl3/jPNDlWwX78KYMBSnR/2XUa4x1/KC5fi?=
 =?us-ascii?Q?9/PPohrebMrqaRa4cuYRjnqlrquKRjMf2A6BI4Eb1I6MXUP1nDHxz0qox2Ls?=
 =?us-ascii?Q?8vZtUYUAJHHHVUcu+3yD7/ofowx+HIeAvsRWKbJc95/AXQe3hXcTuJIM2eUG?=
 =?us-ascii?Q?76WzobcFoQVMrjSZp+vM97SNRUhqOkLf4Z+V4AUhJZEHO6cg09GWkIHPhEoJ?=
 =?us-ascii?Q?1LVJm4IXMYx8o/QH5vRWu87LcvR63Q3yC9bWl0eO1xQvMCjUatzXaFWEe+Sj?=
 =?us-ascii?Q?Kpak8u3FfFtov8QMpggGdQN+R6Z2HQx65utVv/hrGH5Avrc3PBRhlV2hS7UD?=
 =?us-ascii?Q?9xBFuRzgJvAt3GbpJSuhwCvWoPWcVDMZQqGkxOOXV4tfrhUE+Pz7lq6Pcmn9?=
 =?us-ascii?Q?QBjtOaDRqPhxRCqloOG8pgNzAG9SafyYM6TvKVkjxK27+4RZvc4JeFQH6kzN?=
 =?us-ascii?Q?WpcUyHjye/7mqKlIy9myZUdboVnSTHUVBifBr3OxJUs/lxbvRLTpchL/rEZw?=
 =?us-ascii?Q?Ie+2GZtHjitd14FIUQG+gw1eqvwTPcW91heQXM8iRlqI8bPND1Ng2sF0iHI1?=
 =?us-ascii?Q?JjQG+IfwbFD50r9YURCvqJPdylnRMWFuCiQvCJjkdobLWMfoH2Y6wxfejlNI?=
 =?us-ascii?Q?DmNG70ufBSkirIpsYzk2biM4nGq1xf7POgrMBetxAjrFyT/PjhGj9Jspy4Ha?=
 =?us-ascii?Q?c6kArD/3WiYrtRqisO8U5+tAp3fuVmY3XTkoGYfe9vzTwwXkRkAuaJGwr3U8?=
 =?us-ascii?Q?ADOOkm7Oq4PqWfNwc0m4dRm1YauqS0FiUl6jhvHGnrUalAsiFObhfnt5PK11?=
 =?us-ascii?Q?bsoJ9S9w6VPFT7HBAGXqcCAPqsdRKi0b7X9zYiPuFSJ+fwU7rm8BkCFLVf9v?=
 =?us-ascii?Q?o0yvYT57/t+79NGgA/TGi5FuUYeZq/TPvyvzb+DAxDMckySs2NzMRmtuHaqc?=
 =?us-ascii?Q?Q0KSHF4iOL/Qv4jSZld6ukBbqG9SUTAuN9AZW6y/jDJ/bynFfZa9pFGaffYE?=
 =?us-ascii?Q?OkdSN388mbieNRpqLvqLfolwbVGicz8+wA9wqYCIPec0gyOhB4CIKqbgap3q?=
 =?us-ascii?Q?M6PST2icfyENxu4S7j5JXYXf+KxHAs5PAwAtcUnKk02917gMKzRlvKygT7Y0?=
 =?us-ascii?Q?V1gUYe8HqsvhcNGS8IFye+2MXnZE35knlEzmf3LnjVrY3RSxVyaJne+WGZbp?=
 =?us-ascii?Q?ntkXERXamne3ZdR0P++xUN5F+6fAzq7xfkJBEDwTlVPRiI+oGA4GVF2LRKjf?=
 =?us-ascii?Q?VuplNu+K0ddW8HMN1zUUIS8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1437b47-5072-4c98-57d5-08dbf14a247e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 02:14:54.5912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vhj7aQGDmAslF2pQyzWsIxk6BskOgBJ/coqB/TvZzVOPEWpTBCAnG3Ajhl065qNt46eW4rUTlRt29bKCXxV8buUtdnzyclyy9fi1xiNllH36UMXi/GbK1ToSWzKlpA3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10717

Linux Kernel has __of_device_is_available() / __of_device_is_fail(),
these are checking if the status was "okay" / "ok" / "fail" / "fail-".

Add more generic __of_device_is_status() function for these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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


