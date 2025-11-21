Return-Path: <linux-renesas-soc+bounces-24974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F7C7A7E4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8366C3A25BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B1E3570C7;
	Fri, 21 Nov 2025 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UJtSaBX6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763C53563D9;
	Fri, 21 Nov 2025 15:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738124; cv=fail; b=ZlDPtvLLjTy5QW7dAleWvrdbmGLdL4L/dA35HbjXC3Odt/kbJL0EaMpsd728vEAbCMIpbBUq7Vu4Icse0dKz0CE7QL/+4XpmLf8qUDsL8pn8zj87SECJ6wQ6ZAZm/33IK5Nhteg/Dy8xOb7uMFqpHATqJk07Pivw2NFkdHXDnic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738124; c=relaxed/simple;
	bh=Bpx1OtK+AETWYH1IFieBH9SeLCoksou/1puJzqt58BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZLoHt52X/0pTHPlPDRDVWykGHt3jmoz8D0yOLq3W+e3vCmhXHYpbmIcbooG/t5idzNvVBPm5uy7Lv2+nNhlCgbfM9aD81sL6nm6UrGcpu3KtIhyNmSMmb9g45mZGhsBRhPNrFtOlrcrzGIqbZMxYgjNKlPz3ShSZY+8cA65kGW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UJtSaBX6; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuiqHcfTf4PaaXQtcGh9V1Rxkuze+5fhftNmVjA62zA6dfd+fiRg5CY9CTNBY9oVAGVlvPHqAc7GVS5rICRKFiF+0gusG0Nq/jw07rddSJ0YwtI7JSVf0zE17my2+UPIX6gPAME4xrQBKMZ1v6n6+2+5SK/7pOTY9mhbhXV2uZXMAV3AIEgfelIChyms7teGOW9gUmfYjSF9eAbexsCe4FtbHf7fZuUmg8LGTM+EqbDO8RwhU5gZXhkQXMPL5hbY2i5hIPLvvZFKvHCzlB6CdKsdC1nc3gz3cWDGD/vKgxwthcBD27AhWDgIvqQuGHPodnt0BRvJCIllvO1jrYFCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwzBH7RiifsxXamWIMKJWrh9uykn62xZvI41Ukb2bko=;
 b=f4uoRTBbpBs8RlmI5BQZhc7hurQObCXa+ApGaNiW/iIyHSZmIK8v+sCmCvw4eHHWeJY9cSjZWk2lvtO+3wVQOH2PW5GK0tQz7C7jJhms/8piazgHX6C++lXuYvAAE97Wa0y4cXTXADE46wkXnCY0c2tQugfnqXAOM0akUTsw9KDWUsWOaleNBkE4OY0RQmxmnQqLXx2FjLFSwnzCKQbE8Jfe7u6X41BDSqypDLoQbpWeHc9len7YV6PpNd4jVmdJMWP+IS6T12XdXfAk5CBU/9+8kNVdO+/ZkZYuqvVchspbtUR81rCq7j1yYM8s6pS2KCwCG1U00SY/duVrAb2wYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwzBH7RiifsxXamWIMKJWrh9uykn62xZvI41Ukb2bko=;
 b=UJtSaBX63jWGiLDKIV2wMZOnph9Amn57LXkIrFxC1MdiWoHuHJjmrcFmoZ0oPT4+clOIhOoPV+Ogzu4Hcpqp/f8n81H/ZdPK5yBKNqPy6ElK4EnnQoxjNUYjrFf1DXoT05Ug09u5GXUrvHxeqE5nsuU98wGfm2gEY8BYhS3bjNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB15857.jpnprd01.prod.outlook.com (2603:1096:604:3cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:15:16 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:15:16 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 17/22] arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal regulator node
Date: Fri, 21 Nov 2025 16:12:06 +0100
Message-ID: <a792556437afda5302c0aea47132416783df68ee.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB15857:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afcf1f1-3cb9-4bf9-87f9-08de2910c6b6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?87vqXWzY6N9Fe87dC/tnrRV4WuvDWtNL0yOgWFWoMNqQcD56X1Z9rEYCUgxH?=
 =?us-ascii?Q?XT5rmCw1f/fg20AxhDBa8i2XXGjXkHX+vVPbE+Z9XSNmPIbGEn2Ie5aieMs4?=
 =?us-ascii?Q?Ob8eVkodMmHcEeiPYhNwP7J+JqeoKMDMhpT9fGWYztNwjAJmbpjV34DdllTP?=
 =?us-ascii?Q?6WNKinasZGJOfZXyrdQjTMiZeCCdAGHYNoAATf+ix1FNQVkow2wwNPW46RWZ?=
 =?us-ascii?Q?84GiLi3WDopyAwZWTZznzpQcjMOtYHmn2dCgOkdeOAZZ5+BZbpxBwoYcXhVk?=
 =?us-ascii?Q?nfU2zbFw4PIqESYzN+k2UimaeGyTF8dJcXyhjwxQf5JnANHB7zvmKITeaOpq?=
 =?us-ascii?Q?CwfCHPrb7WfBAkWiOihj765P2NIMNMLmn1hraQQ7+2FZ6bQN2pCmlX+CP8gc?=
 =?us-ascii?Q?bo2rWJ37hdeMmX/M8oLA93T2eNnLO6Vsh+KPTUtlRqttkuvP2iEzPslIuufs?=
 =?us-ascii?Q?Omefj2fwVslSMikM7tWaxKCCZ5A42CXf3bzUEDoF6g0QckYAVHqunc+zbtre?=
 =?us-ascii?Q?c1x4H1n5JCn6rkWUxZpmQfnHy+xKv4UAoG/EvT+dpGEC7Fwt4IaEc4ig3cts?=
 =?us-ascii?Q?P/Y3mfPbbYipdUjg0EnUu9Th9PAugdekvri4JN3K9jZTA7h1gpfROeXFCBSt?=
 =?us-ascii?Q?gGAewIAwfNNAVNABT0HXzVCYw27OA8iB2oNBBXhJDDBXxRZejB+J8FeLoN3o?=
 =?us-ascii?Q?wcnitAxjstuBsUdgG5MAb1PNrfkgDT1zSTeRAsz9EVewmXnunKKvq6tzkBL4?=
 =?us-ascii?Q?uFQZxwaAgiMEiXw0A6OkD65AZ6eSsmXImh1QTZLuUL99OKtE9BteNQShS999?=
 =?us-ascii?Q?ROeYg3+4BeJ4EGQGsnuui71AS555gg9Npvu3Vd3XpfN+Grl5OU5L/WpOC5zr?=
 =?us-ascii?Q?VrjkGEc3WG+tfrrbmb1xheOiGA3QNoXhCsm9OhP5bc1iVcJRudxiuLov5cis?=
 =?us-ascii?Q?Fd3MYJ7XUCP0gCKI5SMbS7/AlCQijtkK9sBT4XWKyxARTlg7k73jxooTyHRP?=
 =?us-ascii?Q?BItxO5Ul28H9xr7Ox424Mxpfz4aeUzneaY0F4Vta3J+oEnrj+u+9wo5G8kdD?=
 =?us-ascii?Q?MmFTIK9z0uXr3/5TRBxnHCct0J/4VPheZpCJ16crPJI0fjYJS9q6b/jCwEwa?=
 =?us-ascii?Q?Y7ghtkKypii6LL6QtCROqpNixZyJPx/kgPTHmTeGwUDDPNvlzbff+3lihC6P?=
 =?us-ascii?Q?YW40xzwLevRTzrvO/iXAeFgcA4qE8f81NjpeB5i/gZusABWok/sxaABr29W1?=
 =?us-ascii?Q?jVq3s/Cyf77nfjPNgCg0k0deCXflFk+ElLncYTRXXMzPnkM6IK+6ZU9OZ+oO?=
 =?us-ascii?Q?m3oFgGwaM4SGJX2aBeE2m9+a+JCiB1aNfTD57fMNC9NTZ/vrR4WmG9ZQ4Os9?=
 =?us-ascii?Q?pKLNmI33qV3e0D66zF7HdD5KcXUgY9Wwr85GomrfGzl/DnvVxq0aMFqNrm5Y?=
 =?us-ascii?Q?Qyiw3xlRl5weqyu0YLztKiOiMevbQLnjnkUEurz/ustC+3wokizbbvTB1Kwl?=
 =?us-ascii?Q?EBU7f/xhzPK9XFG7ifc+E7BX+dXoDa0Fa4We?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dc6gDRV8BpZsXVSO+0ZOCOqHQM61roG4p/vwVh3u5Hsa/TckHaBYL+JycJiB?=
 =?us-ascii?Q?CvQTBHK2cr1yIhiHco//6ascrk11gTloD65DFUYmqwdceaT3+9RRKSJN9N+V?=
 =?us-ascii?Q?EiLgmPljMMjGkgZeQtr3bv4fssaALdWsDVH8q5yZ9guZdmdLoQAnYqAXvdBl?=
 =?us-ascii?Q?HFVP0z01ghdMMHnu9mWC7XukQ5eC1cCMwoqfn1N3qpnuVrSoeOtdQBSsRJm1?=
 =?us-ascii?Q?qK/KcxupnrvSVRWxgyBjrmHfp/NNxK6rY8x/VN8o4hKEuxImrSbpr93vn5Oc?=
 =?us-ascii?Q?7VqWfA33AQAMfcx0q0rjWAGUwAG4kHKCIJDxa9yjJn8K9NN7BMX+VKHiqQaJ?=
 =?us-ascii?Q?H4wJrMWSxP/dNaBTstggO72vWDIZ17/EBRHjqJriyipkKF7oXSlih199/VJn?=
 =?us-ascii?Q?rBNLshSD/8+xI2D+ctHhBoFOE3FC9UUjjQsn+x4jiFjVRcWlpppts5lgzxn3?=
 =?us-ascii?Q?57zbGA6tRaZLsDT6SQhSnFL9fo7J6mkdmql1lGfiv6QgmmuBGd9/T/aVd2wp?=
 =?us-ascii?Q?/X7HaGhtTn6nSsAZ7u69ISy9AdBBPeBnpONtxv71VMh0/Z+Qjyt7VpJQXKHQ?=
 =?us-ascii?Q?RfJqzR6qO5hLuVe2BU/ptWrdn32dYJS27m7DsJBma6es4PLdoihM/E0KJpNt?=
 =?us-ascii?Q?KNtRNOKGoOvPJB39QFYwhVCJHQvSFAIselIHW9nJIEnPwvU/mmoadxFdP74m?=
 =?us-ascii?Q?aDj0P6D5qfig87rJwfzOb8dDbf8vWOqCdPLR+PT/U3JMY+VXSRxuGxGdPJKD?=
 =?us-ascii?Q?w3UkmF17ik0IoDQbXaFU4Nd8V53xd/riAReHeO1GSiKpx9lkDi0Q6ZkLXT1j?=
 =?us-ascii?Q?bKiDEPAx7ypTHtPkvEh/aSxI+t1q/BOxoaOi/Wmqv/5y1AYPfwQDCPs4sZFx?=
 =?us-ascii?Q?qK1KqcOiQBcqH9s+EOFytPJBqac1gkQvjCtkCx8lekiT35/Ly1HApfa5QULm?=
 =?us-ascii?Q?kZe+B5EIKsJwGVwXisGgLSZogmn919pg3hREeyZHtVjJAt032n9S4WYDeTa/?=
 =?us-ascii?Q?4D2DFkpq8LyAX7tU6svOMMfMpQQmGD8RDvftaPd9LQXPjckw8M53481/MlDj?=
 =?us-ascii?Q?TO7UMcg5tWT4xJiyhAeeAxfEN0MDacwEndD3TBH7im9KsjF33QSSjiGAJNUr?=
 =?us-ascii?Q?LqYeWPtM7ZFfP6G6so05xycepkSpdapGOwFC6KL1EaYlrL/3JCocIzw4kTBJ?=
 =?us-ascii?Q?oV6p3y2oo8MbU9slB0hdVhUHn29tKb8vWeQcPxsrEI4hEb1duDVMmwPcpz/W?=
 =?us-ascii?Q?hLsMya3ERP8yFK3OXH/UEf9EaLnoo4/5i2UTpfAeBE+74EDr3fXO8Nm6Xm/r?=
 =?us-ascii?Q?4fyKPKo5k8eBhoow2hrKp8nzrew9TcF2Lkaz1Sg7Vp81HRQgSmZuiBvLHz6p?=
 =?us-ascii?Q?FFXW8+PHWjY89nP2KQ95Qj2kEqXKffT5kci1nEYyoEiIYN7DSOP31bOvOEpC?=
 =?us-ascii?Q?NcGieex7+mQbsJ0iSQR59SZ5NWWr/VmdUnxbVth61FJG6zK+ZtjUpfcLA33S?=
 =?us-ascii?Q?TZ1l7XI2yObQyYBNVAsxJYrWdE2Yy3FcPGCYvDsbI8/l3/cDp844i8QqsNZz?=
 =?us-ascii?Q?w8OR5AhIvCj48+6uMuv6tEvbGVGjIVIFtCE0EJa0ksXLPD28UhOxXJkSIzWQ?=
 =?us-ascii?Q?B7wTHPbZmN9xN56kdJi60cs=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afcf1f1-3cb9-4bf9-87f9-08de2910c6b6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:15:16.6856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rornQGXSMRbZCNy9cHbZR3j6djl95oAyq+tTScdsMkRrGcxtmZuqcze6ZjHEnFuvFtN4yBMMiWyuuUBiRVzNBq2kSrfmUZMGLtjJdNELhHbztkPY7DP8jearpgAhYVYt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15857

USB2.0 PHY of the RZ/V2N SoC can drive VBUS line via the VBOUT bit of
the VBCTRL register.

Add VBUS regulator nodes (usb2_phy0_vbus_otg) under the usb2_phy0
node to describe this hw functionality.

This enables proper management of VBUS for USB2.0 OTG devices and ensures
compliance with hardware requirements.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index fd2b72caeceb..c22721de7c23 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -665,6 +665,11 @@ usb2_phy0: usb-phy@15800200 {
 			power-domains = <&cpg>;
 			mux-states = <&usb20phyrst 1>;
 			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+				status = "disabled";
+			};
 		};
 
 		hsusb: usb@15820000 {
-- 
2.43.0


