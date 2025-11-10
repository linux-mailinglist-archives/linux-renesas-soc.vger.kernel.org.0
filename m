Return-Path: <linux-renesas-soc+bounces-24398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1BBC4683D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D038C348904
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8500311959;
	Mon, 10 Nov 2025 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KY0DQYzr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DAE30E85F;
	Mon, 10 Nov 2025 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776671; cv=fail; b=EcXp7QxFH+9y/RCoxMOY2KQawJ0/ds3YerrfjSgTm1KTdWr+u6Brgk4hZuXvuyxKFSKgxAILEA14jeWWu/oQJbY3g2JDhlc34Vha4rwybx+1M2+eMiAwh4a+Bi80pmgMcmFZXM2VLI49LcnC11XiFw5W1g4joCeecKnydgu2HPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776671; c=relaxed/simple;
	bh=HOyF79n+lJ94Mp/kc1osU0BWG7E2ABzHeA90iabtJyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lf/LesT2cCvSm58ibSl6rHke4Y1kJ/H5jS93W4EscadO1gKrEgosOW3lmCdLVRokDm27ANZ4iwaLBazyqFatgHjJwoGlLSu4VS+HijoJgEmjh+RhtkdOuRV00BwCwfBaSkgBHOedKgMKH+SSPiilF4xNWbwR0Plp/cBwKva18oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KY0DQYzr; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGlU5mIp4wgjrdHqB4Duha7UYDCjhWl+ggeWJUn787dvsuLRIsUYxqttUGau2kRgCy6pDPMzsXXCpjAV7SIeXm9il1mOX5Z0X2iH3OMFRqNPEV+6v5lDuwz1ZcsJsGCNcNbW4KoRSZ8U0G4FDV0Y555shPlBd/FKq2FBY1S1ypu2uF9mLY3PsDUR3zm3DZcvsTkt/vlfrHmu1EalwXideSC1PeeoY2Wtj6SylT4apQaUbTxBtZUG4PUgWh2lq4Itjn/7SlCzeG7dc/TDGrkeHCfK50Vgw6P7hXqsXTyNQQvIet3sneE5ZEliJJoSuYqtmpi2pzMVHtR/m1crbNI09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vy0zNA5UpLxd2+uQz6gH6S7P+WwcoK3MhDuikFY8mhU=;
 b=inEMfrca/nFuGzTUk1tnzHOQzSFcG09WGAlR+hCpqkW5v/NdJvKB0gWgxu+ULALvQsHbAxRi52ETwisGQVdLP6/PtBA4sszn5s8iv5UlCjmL72gEG1ge/jkIltBA8pra88dTmTXRrsoJ/QkGPntJTR4pFtpA71Be4kzho7vn0MsM4aGmAYTfLby4u7v4SgN32smUxd9L3VFezTIjXmP556xzp4MF1weE+wtJ0z5+uaZUHw7CN3+SEoT8+40i1bY3m4oQZU+obTGfKsAFVNx+JVAI4lSuCTRRioy26/xV3b8oAyxrxRX4bQPGiH8dab9mIh8M5vEDJTQNGizGBWK6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vy0zNA5UpLxd2+uQz6gH6S7P+WwcoK3MhDuikFY8mhU=;
 b=KY0DQYzrCDXL+ZR5XnpZCmaYezdTYnvOBV+4SkC6xGpWRvWaXwh9iGaMBVV/ZoJw9DwfjNENFgW+bLOw5FO7s7LKGNE+bjjMNkEvQ4lOGQj+iJaylgP8Bk5O0VbjZwh0aU1EyWVbmb2zRjLeDLUm5JdqL/pShCzuEtFbjIHrOEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11558.jpnprd01.prod.outlook.com (2603:1096:400:37e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:11:06 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:11:06 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 18/21] arm64: dts: renesas: r9a09g057: Add USB2.0 PHY VBUS internal regulator node
Date: Mon, 10 Nov 2025 13:08:18 +0100
Message-ID: <e8bb97b310d58a8f7f09e3be7df58d5136ee9b0e.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::15)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11558:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f2bef5-c560-4797-b938-08de205239d4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TBnv0J56XOzSWUdJ0YAQ8gDO0uBnyeevoXZNXHymmT4Tg1sMqqsLXMWY3egR?=
 =?us-ascii?Q?qoxyCYVNdc5RReSFf8TlsW1kb1T/Mrh65gPIiBHaigIdZnYbNILFOlbevIqE?=
 =?us-ascii?Q?dUafXUspJtZwGPHGbkYx9QToAUydvkm63BfnXa05+yeBW6FqV0Ir301noZfQ?=
 =?us-ascii?Q?8zu0yuj+/bA4Q1cxEBZRCjm3TGdqpmCYp91TjEuXfVizpTDnoNar3jFtX3RZ?=
 =?us-ascii?Q?w17mwYcic7/YnKC+Y4PDFgn73VynaKKE6S0xyQznTcS3yyHv2SzhRM2LMJnA?=
 =?us-ascii?Q?pHugTw/lafm3yIlRHTLRjshLBv5zMnFOI4KlwNukyail0+vYfxcGz0iL8l4M?=
 =?us-ascii?Q?hqZlPAJz/CmlJPXOXOwGkjupHkWlnLhkF2BIRLCuN3tLXGHPRvc+DDnt0Zms?=
 =?us-ascii?Q?TO65sJPIsBVoKbZBpl54x0Z4JFibt0wKzMzxj96n/c8YAfENTYt4cX8ehnGE?=
 =?us-ascii?Q?h5AWRPcUNA6Ab+6QOxdojjAhAaSNuGO34bufMIo22dLLZXIGmEw78wkczi3Z?=
 =?us-ascii?Q?AC5jTT9g8D4U0zTcdKkf83LnpbKi/tBpgwTHj5LjdG26JmOf7OGOlXx6lCga?=
 =?us-ascii?Q?TLa5q5OsoqSLepmqyyEi/BhG3rPzCgYFGGtueVwM2XKyZYyvnkA+/Sd/XQ3T?=
 =?us-ascii?Q?L7dp/pF6eQwtR9wIPi7dDTg3nPiUm9duKp/9ytt50O6hM23bZAVr9S9FXvm3?=
 =?us-ascii?Q?iryk4kMT68FU6aUUwZhASo5hcj7tqAcC1ZAxQz6dJmC2C8/FgegMS/LQpYnq?=
 =?us-ascii?Q?viWQ7CFRU5TPGR9yM+yKFiyKDBfJ11XJ8LOLMpZAsZU5D7yF+aXRCqWW73B0?=
 =?us-ascii?Q?1UOgZwrPKlMhgjmTNzrwg8Yy7dGcpMaJewu9JT9IBGNQZo47rfwWeQW7QCAa?=
 =?us-ascii?Q?UnrhXMp81M5/J5VLGz9oIl/KKXnGvex4SdVKFqA5k14VvDkwgGQ+M0bfe+jJ?=
 =?us-ascii?Q?I6MNnejQG3mRQ0GfV+Zd59+NDo5qGA94zdW4QjvNVsKrFKiAFTw8EghXYf0q?=
 =?us-ascii?Q?mDKFysrPfrB6cGLyRvis4A+2buhVohmcO/M4uKs+hFduhDZRgmv084KELdB1?=
 =?us-ascii?Q?cMQXvhdkCTeEH5hpruyjJf/m62SfHEJsa4Ek1fw38w9OfXweoKLdkA6qGc8n?=
 =?us-ascii?Q?TEFPB/G0slf5rRWKWeOH7IISEJZXeiLOTWvVusWEbr1oozpw7ac6PthKfZT5?=
 =?us-ascii?Q?8nWNqbbySQqTXD2AmEl7TdTMOhs8Yyj/l7KeBwD1CWV7Y357ywpTRIMHCAk+?=
 =?us-ascii?Q?oltVqRjnDfBkSSxOk8pafxuMFw2smyGoWHaJqzmPYe37NSJIHo2lGoq9VMm2?=
 =?us-ascii?Q?jfSM+rhfZ+kK2kjFOau/DDmc3Wr+loPniMYlMwaoID5MJNAaSGYcJGhCN/S0?=
 =?us-ascii?Q?GEhE5uP9CDSkcvqUDzEDWnZizvro8409tTjs4KXMiXVyqQ8xJb2OseREW1tX?=
 =?us-ascii?Q?3V6UkDgKZmmdEpW3dQLLZP6nO6kU/uhfvy2mTULSdV4IFyvxIbOeQPI13Jwy?=
 =?us-ascii?Q?LlSs/92QNDnTJpT2WJ7KaetPzMd5LwUvk28D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AZg9mBgMB5tc3vDHnEMtMxQwqeBkp4s7DtIFH/wH+Vr1v7LwLTLh1LGXpcV1?=
 =?us-ascii?Q?Pa/IHQLW9Rn9yNGr7SknVw9nk2ruRTIL0arDFMQgbSAJ3cKadgu16ZMkBuef?=
 =?us-ascii?Q?atVNOoCQUCDpmQUu2nbFVjf8wrVa3Mg9WhdVOOFhgaysm5f2dcCkHU5pPre+?=
 =?us-ascii?Q?B8AZZaaxp1U0g74gSTE1EeB3dzi+zsDN6Wvpomv4k11r9cQfekN7owbvHn01?=
 =?us-ascii?Q?IWfFC/FEmdhe3KlYWv9kWD1tBNTPz2yM2ceb3tBl5zUEcgSSlgA+rjpUxEa7?=
 =?us-ascii?Q?qy4BCY8Pc8DQGpUSoggwjnDnI1nvYSyUK8NTk40SO6hbxXp8CpvkHJklrtpw?=
 =?us-ascii?Q?jHuaOXGLUfsPuK2w7nDzjGSYamiVaToEs8mVUsoZrYjpN237iDqDQQj6zOXy?=
 =?us-ascii?Q?me/Z/NmQjGAmhXYCpP7ks77bcTyKlw42mULKJ2xSq1HiD4O2Iv5WOSGoI6e8?=
 =?us-ascii?Q?C4BzMXR03p9dp+RHEpaFZ2x0C72oAR48uZVIRU1NXf9e2acOT4p5UjZdOWfR?=
 =?us-ascii?Q?ODA28/oF38BMPycfgABpb5tFtlAtPgCe4vfI6+1n8nJ9OMpZBrW2czfMUAxE?=
 =?us-ascii?Q?3+SMuxC/EVMoRsf5LISlEAZJellcmiV7m+zugwSj+McR+0NYFaPRwM1cw1oZ?=
 =?us-ascii?Q?ji/J0rhbi8bcjlDxNyifeF4uIC93ZJuAyjSWY4qyJLMyksXhW/e/Up7NmOPE?=
 =?us-ascii?Q?SISDI0mu/iQxuTrEybK8+aL6ChlzqyCnjhousntJsX0IGaFT9hIgJgCr2xWq?=
 =?us-ascii?Q?lSTk/jvYAmIIAKlSxevqmakKhTqONzfTiR3Xfx/n59eCmtKwdEacUCCe4fDo?=
 =?us-ascii?Q?yAXOONbIB0hR0BH2C+hvIyLWltEZAY7gEF3yFAGQsNJggx3ELNUviWZzxjIk?=
 =?us-ascii?Q?V7SEIiKcq3GHVddU5drNhMOJgqnbjvtWOOIgz/aVa/CEDdChd2MCC+WhN+Cz?=
 =?us-ascii?Q?wGDXTk8jumwv3SJGCacfWMaNAw2ULuiva+U08xGBpwaudd/2Qm1/q7D++el2?=
 =?us-ascii?Q?IiVI+f1sQhvEnd09LM6cua11D3WWJ8kBo+9Odd6NEWd+l20UGupK3lbnT91N?=
 =?us-ascii?Q?a1Bb7s/nEvLoW7or1wy+HnqCxsOkLaHdttoICNcyJssMGFTcTMl7YKTygl7U?=
 =?us-ascii?Q?cjgecoepbcZ3amHqsoKdgh8jofiG3rwQu0VINS4RieHZvspxrb1qzCSW2jau?=
 =?us-ascii?Q?H60SAEO5hH1mbN1u6YKwNs+JSSnziE2iAL1gKUIJL2eoFEzBZl273EXOyruB?=
 =?us-ascii?Q?xJ/DjOS7C8MRImTzXg+oAipKBq0HzkeFaUNgAy7YRDIgSi2xOm0iwfgr6ZX/?=
 =?us-ascii?Q?WMfQRk8JemRctk3/LrvFTELTJ+vGDbQSuedjVBQPe1WcIU4sio6mvpXruXnx?=
 =?us-ascii?Q?aeffeSZs1Rk5KuN54hm4dfzFFqnz38Mzb4UlwR21spPtJt93Xp5lJRUUvC/4?=
 =?us-ascii?Q?YVWgfOrGTsGlIj9rgcKLAEAJR6oVDqMBPFv1sby+pyzj1LFV1t4FsR2uK0kt?=
 =?us-ascii?Q?blhRaoiIsYOFrq01Yx4n9mjhEPltDlMyEuyLZyz1EPqzu05rN3Dp17IHMfk0?=
 =?us-ascii?Q?eqrzKfy2etClSjYLIv2KMYn/5PxfZklDqVQCiy2lDJ4erKSud6A4W+Xbi9RR?=
 =?us-ascii?Q?/2c/dcM8LBQ1dMU9Hvazz+o=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f2bef5-c560-4797-b938-08de205239d4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:11:06.6273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5d8tVO9aztLCo0ncmuFfHPYeC2JQMaAIAdEHRItkLVUo5kzRiaJaTxL3WBwMxb0VcNAgMKo2U9SEeUbeQzJHhJ4nLqYPSkFFHFkk/MvrZYB4YrvSLjK50uAP+hZUuWj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11558

USB2.0 PHY of the RZ/V2H(P) SoC can drive VBUS line via the VBOUT bit of
the VBCTRL register.

Add VBUS regulator nodes (usb2_phy0_vbus_otg) under the usb2_phy0
nodes to describe this hw functionality.

This enables proper management of VBUS for USB2.0 OTG devices and ensures
compliance with hardware requirements.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes

v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 6c6ef5967bc0..69d78ca6ca6f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -991,6 +991,11 @@ usb2_phy0: usb-phy@15800200 {
 			power-domains = <&cpg>;
 			mux-states = <&usb20phyrst_mux 1>;
 			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+				status = "disabled";
+			};
 		};
 
 		usb2_phy1: usb-phy@15810200 {
-- 
2.43.0


