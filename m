Return-Path: <linux-renesas-soc+bounces-27616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GrACKaPe2nOGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:49:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DEAB268F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E2C3E300DF52
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 16:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366DF345CC6;
	Thu, 29 Jan 2026 16:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gV76hw6M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22622345CA8;
	Thu, 29 Jan 2026 16:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705372; cv=fail; b=NxsOlLtYOCckddBYuIUe4OO7t2K0e0fgEZ8UlIfYN61ZwsL+wCZgTK63o6GGeqYHz++h7kd6uZpxQZFqociz/D92+gv+WfyfCAymNNM6s5s5Oe6zd6rACoWQQQ89nR9SCCVQw26v17jKlt/vV4wCbo7alQo+0gvmYfgrxfpuIRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705372; c=relaxed/simple;
	bh=Fz8tGYnxwNath2zu/Adbww6DY8y7sa2PPOj+In++wCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uy9bBnzs3Vs90gdkC0GUwvZOrVX3pnpcnJxSkbOQ4bIij9QhWE/z0NViWdWi0f0YfKREkR7Y8mZRJ6HDwOnXHG1o7qmWDd34hzs6YweQzPSV+V6FJei95c+H5kFgDOZfJ7AcKeBjGLvUQfeDkMQyes1YOAWfKXTIcPUoaDSOy2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gV76hw6M; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byHG6adpQeUdBlNUR4KbwVNxl2QtWF4WQd0qoAMoxXkyYFDWpfzn3nvXgBq1xUHMjnBCwtoMX3HvTZATY0U3aI+czzo1sbePZ05IL0PZ3fIOHY5Kli5JvqfsiDrZiUAtY/Jktv0aFx+nFTLa5YYvWquC9jqP+Z7vowD0PllTQCHBj7t2+d0Zo5UGyDvAz7XU3RkBAW8D90p3XbnYmO2N62aIYHYs1I5YxTDgMtkgtS3LK5IzWafqfDZsPYFZU3IqaTlO7pemX7xUt4M5KnH6M+atLgzxRCuwmmMjOKv5BCHBCRGMI9YaEQb5OiK+LFRhTrF4CCZ0J6ZZjSM5CY1YCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/epwmx/HiBUwJs+kLccUXbE8eHoTXj9XSmuwpwSoO0=;
 b=MWGJYFM0qZalCM9bikFi7+r7ZJVV2R6s0qljzc0UbqKzYmq4Hb3SoH8Q56NakFw/K7VUdD4qsPoMu3NaHAzS2qT6QKofNNx6zFDjFTbt8YEK4bsz46pVILivJAdOIHZTgb+MFi4tBTK83/HKzYrOT2cv4ULWqXnB2HJAon7mUDfryc8O6YxXU9SD2M5kZmiiMwxBWAdQeiBMDSBJk3QL5wXMMCiE+bKYJH2bNmRQtF5Av9mNyeMugdtIAoEsAIVlWNhObqX+ES7TonPemEcCea/YB3I4m/6msqaI2DaV1/UK0YkEURMlnGlRJ7QO58VBtbGeC5PFE41EIKTqo663qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/epwmx/HiBUwJs+kLccUXbE8eHoTXj9XSmuwpwSoO0=;
 b=gV76hw6MQqKwI+bLr1+hpZXJyyqLVyX9YcCjR+d1vEt5Q9p/yXbfoY8njqpvsRLfK1p09qZcM+1PMo36uPLemKctZS6pi56CcAHPBwP3lXdeTQGjzfYfUt5El162tcxYc2M84dHKgNDGw6oGsVcGkwObFzRWLvtu4N7kWZZIjtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13517.jpnprd01.prod.outlook.com (2603:1096:604:332::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 16:49:28 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 16:49:28 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/2] dt-bindings: mux: Remove nodename pattern constraints
Date: Thu, 29 Jan 2026 17:48:48 +0100
Message-ID: <dbe73c0777eca61cf14442f4082caae62b61805a.1769703480.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769703480.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769703480.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13517:EE_
X-MS-Office365-Filtering-Correlation-Id: 743ffcda-3b3c-4693-5d85-08de5f565dd4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cWrP2CEq0I3geaZTqo7YRSUkooe8vZfVYnkMI14GKR6wiApvzCYNcUPaXUAZ?=
 =?us-ascii?Q?rBrFpTQ3ksUiZOeorhTlYKXfXBt4gG6+ScH013/8LT7eVQfKplz3f3KLT7kT?=
 =?us-ascii?Q?r8yg1CfhnlcHCaAjFsl7o7BAAYXfN3737/NpmxvGBadWCET8MCTYte8djmlf?=
 =?us-ascii?Q?wzwshHzTcKGiPyud+oXalBqh7g09VmHFmoUzluKHR6kCStLqwck5uJxlQL9o?=
 =?us-ascii?Q?VrKe3mVnWBdkoDDUiJT5gqdC1dtJ+iGgpqT+itSQ3G+o+o5F1aiIn1+f6+Ek?=
 =?us-ascii?Q?i9x/oUHQ/qPnOwVK/bT00ojQ7WJbgtp8IZvbUPuPUFRl83u31iAWrj0IPHvN?=
 =?us-ascii?Q?+iTqVOqC1szgnq7UZmG1sfKPzegtqKhBo+ua8xRUv1BFTdbIFR/RUnWfQBa9?=
 =?us-ascii?Q?BnNxaU3Zeml2DY6/CbLe97nkeZnCUY2oWqpkPGy2L/6D+GbRrboia86vV4x9?=
 =?us-ascii?Q?WNP3bi++zbLy+kFggsRp210bvjZo021rT6K5V5+12Kir6Ofqs7ljzzh045Eo?=
 =?us-ascii?Q?N5tbhc/ErtRYIs/xw0FSngMVts6YDO6rb1O+yi0DOorU1nsVh8gztHwuw8Hq?=
 =?us-ascii?Q?gbcGoJtdCtZkUSHS+gID83DHUIGRo2mX/OZvuu800r7OHGGw8ANJRyeU5OSA?=
 =?us-ascii?Q?9lang9YN1EKin1sUNdmVFEL2b3CEnQAOYOLzXgyWBnAYwpN76+Y3fIqwTEEE?=
 =?us-ascii?Q?izphiroyTsu2FTsLF5eeHpfK9fREjEPdzwbaYBaFHa70QnmObVve2S6H41Xj?=
 =?us-ascii?Q?CLnGItuhALXgMX0XcRGHm71cZlyNtU/jzSeqzrQsFX449Do8d3rcpzsvzB9N?=
 =?us-ascii?Q?iVWPOcog+YmxdMK+29RsbcsvM85BVbuIjN5hpiqOFGMEd43g0gIhTAPUhFrX?=
 =?us-ascii?Q?sW64p2BrrTol1EJ3/TNjfuOnBQ3BfmW2bDvAmxCx7A2BmWtCyyw5BPRDMIL7?=
 =?us-ascii?Q?In/WJNZjUDRQQ94dp3NZYZknMV8YzcE72l1pkrKcpqCR/n5022GqlHDmBcR8?=
 =?us-ascii?Q?R7mSXpH7uaXNXwOmoW2YtOkzD6T4D8UC5s6A3g1RIXBxPocPAFFS7W8zed46?=
 =?us-ascii?Q?gclV5yW0J5WGax8+LbEuZ31bEYBa+oDbh4oAQutUWpGz0K9efZtP8PSawthF?=
 =?us-ascii?Q?QrpazhsliNwSVtq5wVDYPpuw17Jq5h7ncYtw3n8YE3TpduTzOM3MYzM0kGL3?=
 =?us-ascii?Q?vZk48T2K5hjGGqgZtsvRBsaxfacLd9OOUTRS0yiAKrkFM8bke5YVBRHTULbZ?=
 =?us-ascii?Q?IBufNzpphGlbfZXWsFb8Yg3ZZaz2h8nCFq65ZUxb/W++pvXyeOG3Whiu8v3x?=
 =?us-ascii?Q?wcN9BC74n/+rHgwB1g1ZN5OVGRk3HRa5dm2CnuX3ryImYEp2VM2fVCSZijqg?=
 =?us-ascii?Q?nZc98fXo2xlDRtevBzwZUximbkbbe7qZZ2bAbuxxA+hlHyOEntqgGqe64w8s?=
 =?us-ascii?Q?g3ey7T4zBLsRvRTqStWNCNLvT51/G7+erGfa0elNc+KNDGcQ13LrzMr7rwer?=
 =?us-ascii?Q?jdXA0WIPWZL9cul4Pt0Cz1t+iFyBWELw4Iy6YWgbmpYFiKJKwcdJqFlVBZ7g?=
 =?us-ascii?Q?oeZNaVB4VotpP9KfZpv7Dqtoe59EV09f40/VfpkjE6dGd2Q65aV8Wj/IAy/6?=
 =?us-ascii?Q?7Naiia0MtcpITRwyEAMy2Oc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iXMO8dMY+86xg2KH+bQzbyoF3qvaJjtCpKAh3XXYObi5Y3Ad9XgV8NoSLcTX?=
 =?us-ascii?Q?Ha8AhOb2rTHzTU/iVPdRrDt3rXrfrFaPOQxmRmvFnXVlTLQqJFMRGEsGTUu8?=
 =?us-ascii?Q?qkfrIhv0XCZPavju4Jvb3juZj57Lo0SMnoM2RlDpVRYxYTcgOKHrzSarLrdZ?=
 =?us-ascii?Q?0BXxHUdE81b0Dj66Bj5IPR+C7iLEPUR8shg9CnrwNCaDI8RJivgm/Y0cxdJY?=
 =?us-ascii?Q?j/jYa0Je31BeiqB5aX3M0AAPNa5ejE1yuRoxZuuzXsq9ExX3rlddT2XEjkeW?=
 =?us-ascii?Q?eGXarw4UtfXCQPu3i19tEBDGSIWT942Es0y8HwHh2gEcGFJQWsVjH2GLBOFF?=
 =?us-ascii?Q?Uz3MufhkG4RKtliRaBwWRgLR/LY6NyXU3/NbriQm8eXrZhm0DunLqr37aw3F?=
 =?us-ascii?Q?grWcPXr/09GICB7/E0ww5R6giLQgiMccL3ysbyuvTPHroNnjUVFfi0jOCEm8?=
 =?us-ascii?Q?c0IrH76pMaII49EfLesN4aCx9xWGsosZOi+R7IkIIJcW/6UUS2gbr4jAxLt/?=
 =?us-ascii?Q?QzgRQXBa6vxo5fLZEYnm+MRVttB1yjdk/wxNTURZtJ6YsgiIgKDcPKF//V1w?=
 =?us-ascii?Q?M+RccDqHsH3AotSo4hCeCN2YTH3AkZQsgHnXZ6LEHEbSZrYqXVeyJIhxFAJv?=
 =?us-ascii?Q?/CqH1f/t3pMKqELYcEshQAiEXtTz/5xM13e42OTpDg5WKGV+JY/pJmhAQvAn?=
 =?us-ascii?Q?5102qeRgtxvasldXHvvsHDBNLzjPzc/Z0VybqVtrUINKFeFsMmBOKC45v9qA?=
 =?us-ascii?Q?2nWwJhBtZ5YNaXtNBNfRr7H55n9I3xLAwWvETmwgfVI2EGT/MazmowTX/H2b?=
 =?us-ascii?Q?6UWFk5OvXrpZXkxNSi+/F9Gb/hbejI3XaBrOhu+79lfAp1x3HgkKhmwLJSww?=
 =?us-ascii?Q?KVFsbZA2tg5aQ9NoyKOWN1x3gzxAHqFnJSZ3os5Csb9Fx5Zqwe29fRAvIYbW?=
 =?us-ascii?Q?1VDDYtfm7wT5P3ElXvnsTVRustjwh8edhvMiYwNh16ZGIHI4RcdND4zfaXRb?=
 =?us-ascii?Q?sEqvHoWkM49VBOTGgWtMZAz+TuRSMJ5p6bDqagjKKxqNUeGtYGbk+peY2Hfi?=
 =?us-ascii?Q?WaBwWwEwK7pPRsoL2SSyXqiQ+ixHEzuR2GJ6K0wzIdIh8smehSZXj3vnP+Vg?=
 =?us-ascii?Q?H/KJu2Tt6RT8R7fV0rbjHy50GwUZ3+XeQSayiT7M6Ioc4XE7gLt6Hzz4eD5Q?=
 =?us-ascii?Q?6RS0LAoVKk4+SgZzu29xPg/myd3K2lpvA7XENgarrgNxS9F1JFlwT1RFwI9G?=
 =?us-ascii?Q?sW7scaJpdBlS/0+wnKMOTY3oz3D6Lz/ZdERzQTdlFq/Qg2rqXAmN+kj7Umry?=
 =?us-ascii?Q?rLiVhTDe64siCerkfljDmoTYive3kgy2ugc9U24iF5IKjtONk+iNSDDp0Juw?=
 =?us-ascii?Q?86NauiKI8/68h3irth+ddo1Xa3nZlNHhtQM0Z2symu0zF6nnWxXpuzROkZW8?=
 =?us-ascii?Q?ktB1tbpLhYSQo6nJgI9hrPr9XBEud8mZums7CfY58r59GD318vtvFTO6iXdp?=
 =?us-ascii?Q?u8DiK4wd/XT/MEuLuGxIHLsisZmZQJo91SXfUxqeAHN/8dugWFNd2+8GCwnD?=
 =?us-ascii?Q?XMEcc1I4CdIvVMJFtqlIh2NnicI8HHbXk+8CBgrsMrAfagt936v+s2e1v7iG?=
 =?us-ascii?Q?dYMLv/FbgAHHU3syicPXkszbVKuaxCw+/zxriwX4Uic7iMlvzQZrSQixuoQh?=
 =?us-ascii?Q?Pc6SRfujOiaREtbbafMmMB8v/+5OBjuO3giEgDzUlqj2BKJtVr7MBmrndULQ?=
 =?us-ascii?Q?K835W10y11fNIQQsDfqrR+OHy2/y5llgugq7zTep0CNplDocq/3R?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 743ffcda-3b3c-4693-5d85-08de5f565dd4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:49:27.9945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yD7KOAnaOBkFiDoPSUr9tdXPE5uT4pCqnEKhF0TBv/jIaFlSkWo+ACD9xzY6q0UoVtiaGsfTxWZEyh12EsHSKpPRkoP7iW4pdRxdOFivqnKjzeO00Ay86CUrdStmORud
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13517
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27616-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim,microchip.com:email,renesas.com:email]
X-Rspamd-Queue-Id: E2DEAB268F
X-Rspamd-Action: no action

The nodename pattern in  created an unnecessary restriction that forced
all mux nodes to be named with the 'mux-controller' prefix.
This prevented valid use cases where mux functionality is part of other
hardware blocks that should use more specific naming conventions.

Remove the $nodename pattern constraints from both the 'select' keyword
and the properties section of the mux-controller schema.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - No changes.

v5->v6:
 - No changes.

v4->v5:
 - Added Reviewed-by tag from Conor Dooley.

v3->v4:
 - New patch.

 Documentation/devicetree/bindings/mux/mux-controller.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mux/mux-controller.yaml b/Documentation/devicetree/bindings/mux/mux-controller.yaml
index 78340bbe4df6..6defb9da10f7 100644
--- a/Documentation/devicetree/bindings/mux/mux-controller.yaml
+++ b/Documentation/devicetree/bindings/mux/mux-controller.yaml
@@ -63,18 +63,12 @@ description: |
 
 select:
   anyOf:
-    - properties:
-        $nodename:
-          pattern: '^mux-controller'
     - required:
         - '#mux-control-cells'
     - required:
         - '#mux-state-cells'
 
 properties:
-  $nodename:
-    pattern: '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
-
   '#mux-control-cells':
     enum: [ 0, 1 ]
 
-- 
2.43.0


