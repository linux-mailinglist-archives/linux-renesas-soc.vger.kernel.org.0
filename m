Return-Path: <linux-renesas-soc+bounces-1448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9818291E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 02:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8546228633E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 01:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AABA81B;
	Wed, 10 Jan 2024 01:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="M1CRR0S2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2112.outbound.protection.outlook.com [40.107.113.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486CD28EA;
	Wed, 10 Jan 2024 01:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K74BmIZFZOTg1lBQBuVdwQNc+1DaRakSoTe6g+DZvsvojpBx4wNITfXSUJESAfLN9yaEAFx1aNYSK2LRUI9EWUqDLKu2GdTJvwJpTrfJF26XfZ+gmF4A8aa04WfQkEYRHVKqGJScITBjEWdVi/t1oE5B234ogzlkvqKwqp9XqxgxvoY9qQxqtjdySoPjOqztcXQtp/60u27RnJ7Bx6ACqhjYdRm4vpM5J/SSsNDlPgg6EGPuasJdRjhWuVQtM2UGrNbsUpmmJPctuYZXFpER+LkifgsrR+wN0tsK5tnVeOGCDlzrvnvDUk/FoNOEOhly+eS6WNcXNLh2iM/anlveVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XQHWRTVIn3IR/BVQKSU7VmzH27RAnJGrU21XEgwWMw=;
 b=cOlwPBXDzrQMJ5rp2sgrYfEhU5gU/5u5FG8rWuhN76PTni9KW9FdOrV+7nqaJ+sFQlR795RVXMSXUARv2msO6Q0ROFmebMmfYRy2v2kAowvPfey0u6d9VNBDAKMXx3efKWdpRxqYWPYGcc/oicspYc9KqxabE4yTHgSZT4fFD1/IR8pVVE+uH+aheXDkF9EMVddq8IVFheJZjZNm6QzBlywNf5r84wLRw8+IsOYiDVQOBLWeIkXqyFT8Nf0yp5R/ToWT5UEWwShxJgsdkn5ieajCzpBzFV7lZBQQ+e72DRWjkqOZ6WBavNm9vYG0Ud5eHCyCy3x73WrN1GOmxmjV+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XQHWRTVIn3IR/BVQKSU7VmzH27RAnJGrU21XEgwWMw=;
 b=M1CRR0S2yb3d5B/MMxbBKKuKGuDBOQziH37+zoAKn5mOEGMFNQ7bftxVFjMYfRUivUTo3Rh1Oyxjw+yo5faHM+gN+Kn+cLZoIwiJxeKpYGGpf4IPg8J4hdDlcSm/5RwbHBw1bQnNtKZAZDsxosmlFE1MBelwlfLG8NG8CoUK178=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8442.jpnprd01.prod.outlook.com
 (2603:1096:604:195::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 01:14:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 01:14:34 +0000
Message-ID: <87cyuagfba.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 resend 1/4] of: add __of_device_is_status() and makes more generic status check
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
In-Reply-To: <87edeqgfbu.wl-kuninori.morimoto.gx@renesas.com>
References: <87edeqgfbu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Jan 2024 01:14:34 +0000
X-ClientProxiedBy: TYAPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ddffdaf-b1f9-4bd6-d5c8-08dc11798190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jeYTo60qpUoopRSxlX6wQ8p1xRfYGNyAKJ2V/4Xgesj2D9BqedW4IfW5qKAzSjoyyje1WNEQoWwfuvDpUmPi4jzZYyOLFCgunPY7fiACI5QERqSihcBhW7BDKnme9SCGUr5nhTriCeaoaF3PC7aO56R8TL51uVauxROb+cRb6AnQX6Q4rUE5T/lx3q7s0m3Jfo1jhMsTRRUHL12NyfNqfW964fhrjuLgPT6lzUe8NccxyXqicaupkvITyzzXeu+feYjHE/wpWDPqh5m+ASXoVFNx4Sv3c6glc6srOzubXbub41YkDSfZzuc7Dxr9GFRnwF9rwAIKAiPzRWC2kw+WcMNB4P6Mpl7VilI1H9APtSTfcynWAjmdbeeIlJNSZG8lOzGNlVvx+0gSk+eUFkP5QhO5mdYZj+fdFiOWA+d10qTzqg68T7kEamQebLCttn21venyvwF6uaR4aKJbuJIcmM64IdGa4vzLNcpbAHhQH9HmU+5H6V0VFEADggEx1k6KR/sQlF2rV1B9JJdNayr/4kg3aqIIEJxV94AaUKadHtn2ue1EkNstI/eIrP4wr9gOBnieoaAZrnjO/8bTBQDJxbKum1rD2dAgDdkcfj2Epx7m9LDObkpv00hvstgwKwa8rrXnLIKudtakj1FKNpiZAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38100700002)(478600001)(6486002)(83380400001)(54906003)(8936002)(8676002)(66556008)(66476007)(4326008)(110136005)(316002)(66946007)(36756003)(52116002)(107886003)(2616005)(26005)(6512007)(86362001)(6506007)(2906002)(38350700005)(5660300002)(7416002)(41300700001)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lEKj/txH68scWAWHA0oefU+2Mf5CIY7R8MLNGQbuAD//J4eOnr554GoaifyX?=
 =?us-ascii?Q?zxXk+A2GGgTiguaEPb0WwuiJLiGM2oL02A2LetXqTPxM3P7vGj9sok3NLZCa?=
 =?us-ascii?Q?Dq7t9x1AvCm8xXtWUXE0xRSVSU3L04+kq4md6oRKX9NZ7ABDA/1S88zqcVJy?=
 =?us-ascii?Q?Cw99qaEqKHo9fq5kOKXlz73PMalPeKTmo1CBpyaoSaHLgvNNOWWZ24mid+VU?=
 =?us-ascii?Q?xgBY88QBLVDnBzws5J6aoZ8izYtrsRibCmEJIQxO0Xqd0PmWMOVPjYJoGHyC?=
 =?us-ascii?Q?DExcY25vk+5Yz3cXrZU9hhrGtc3yZd8/qPbfcZ4k98LgQzKUvHM+EoiE4HMV?=
 =?us-ascii?Q?dKeS453BsQra57hOO/36EZC3E2evZ+gLK7/he3x1FFbPHiU3f8lc7lM9r52I?=
 =?us-ascii?Q?hXK6GGVIOnQ3AB5yOSZDteyq/lBUXDmcfcX4Ouha0GSaVF+sID7HQrLeRHXz?=
 =?us-ascii?Q?GJ2Dx0iJ+qDMuBQJd98ycQzC6SqgduXK67Yp2B59RYp8nsDHzUaMGPDd6WC8?=
 =?us-ascii?Q?dzYRW8VxZCecZr7WoX2fC2q1+s8qxzyj1droWIFQRA4VzLy7xbhZfLSGgN5b?=
 =?us-ascii?Q?SXRuGC6zfJL0TJ6jZplfnREH0QLady8gtKUiRUVzqOovxVR0EkbATx1094+q?=
 =?us-ascii?Q?qraUakA2tn6uvem+WtJGlNSSf2q6t5HJG642+olNBAZQkUzPvkrznMkxRjyY?=
 =?us-ascii?Q?ddEqbTcWhLCEPbMdRCiHPYU2Ko8nSKsODQ8jjtphnNLVC0qfJR0ckCALU9rD?=
 =?us-ascii?Q?IjL8y/pKyFNV4P0U8hwOAKfv2nfR46fHlGGW1PWPi/V4H8albEz5QVYu9XDc?=
 =?us-ascii?Q?JdrDRfm7gtU4otwS4VseNeuDDD9CBQNx4KakE17uPs7ViiN/mXbcxBhGmdoR?=
 =?us-ascii?Q?J8JXiYM/j2tNEjqu0JcycYAyjarFxRHAgVqnqm/VtLUnrVhQuQrtzVBLSsZS?=
 =?us-ascii?Q?zozVvx1Vg9F/3E2MksKQdK/5W9mhJl2BplyGTbV21k3hv8PywHxr7oHXXsen?=
 =?us-ascii?Q?Kawb1knz2oFSh5CeiExXajNQ3CC9ZQl9G7WSYcW9EVbiAKa1Mm5QZbyFcfnp?=
 =?us-ascii?Q?ubwzTCxieT8l34r+0ngXYdV3vFTtNEJ2yw5JFgmJEMPafO6i9mrobXJcs10w?=
 =?us-ascii?Q?TNKBHRvvUQqf3A1mE9TlAm0pH/iO8Cm9N3ItZDcz6Qq3Zsf66slrfkoQxDAv?=
 =?us-ascii?Q?I3LXa6ViQC9IhJARyj1pXWl01Vz11iWvbXMY0YN57l2WxPcW5lNJ88VHWiRO?=
 =?us-ascii?Q?I7TvpxS6R1121NcYahlYcYE6Qf2ZPwRvcgG8qi2652jJH8J4xAEW4ErxJCpN?=
 =?us-ascii?Q?ST5HRMmV4fRMJRkZI3AxuuzNRqcI4RYXHZrYUhVXf/QmcaoDV2y6P0ryRBMf?=
 =?us-ascii?Q?RFqGt0xRCABcKLt0De4r7EqMtVROGrCWQDVPfvIGMkRx9KwZJP+DSpEt9bv4?=
 =?us-ascii?Q?dqMiJJCZnVv1+VO+Y7/kxyprr0Dhf5V6C0+exata7GDQX8om+laNt/YPEr42?=
 =?us-ascii?Q?CSJuCaXitAAGzjIdHgp9p4yMJpSxyrdp9N3ypqdI3SyMaVtypQSCLWLkinQh?=
 =?us-ascii?Q?8v+TuiOhKZit1yAWyF9pw1wi12TI6FQqKadL4FFYzDRS7CYKfDvt1TvRltRM?=
 =?us-ascii?Q?QWrjHhdmDY5VutnnLUDG/aQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ddffdaf-b1f9-4bd6-d5c8-08dc11798190
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:14:34.3666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQ7YF5GdTi996McHBFuE+UPYKtkj8tU689SygGRfWb6e8uFNWgPHRo8kNYHihQr3K8HuZKMVsB9nzNb6D+Xitkwfn+a+E9uiXWKjqi2iC+ciCKwlbkhO9PqNbj0HY2vh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8442

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


