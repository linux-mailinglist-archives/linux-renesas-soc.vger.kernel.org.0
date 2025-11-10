Return-Path: <linux-renesas-soc+bounces-24392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B8337C46804
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A4EB43489C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F58312822;
	Mon, 10 Nov 2025 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SwsBf+CI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8483630E83F;
	Mon, 10 Nov 2025 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776628; cv=fail; b=FfRfGLy+l5staD4uzu67C8BNo4WJOKxFonTDnj5GvlAqrT71X/kLpRiP5D6JoYta/aIeJWtI1h1u3vAxxu1iWzHDVWwY8Osg07aPrQZhdydUd7MMAim3BO240IX6erZSG6YtK8BchnNfHVjEvjiQm7SXrRjGARjVkc5moqzoVwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776628; c=relaxed/simple;
	bh=ySf2mSpuOy2gtOXn2KwayIePsht+7mBlDT1+38OlJfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ETe5xxHEdD6ttmdrDCJ2ebecDFs+t99gnyeSkjo7FsvxxUhYpC3lad3wyRO/Hvqa4Xy0Y9iIvGmGyRpytrr45NaQo/65cyAMtPC97T+x9nPgiZw9qn1DHCXicNqvVE4Ff4Y652vkfdPB7QdkV01PpzOQbwWyBKqw1sIzxO4sh3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SwsBf+CI; arc=fail smtp.client-ip=52.101.125.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3SpvnpUOzU2e3NKlaCngElesx/q5/n1ml7xAa15xCaVtUKDM3Ul7slbDNcFf3QicoAzRuVLUiNOEhvoNyTL/qfc9VA63MCIaY3aIhbanFvUs5lvgpHain88q31isHpjDihg+l5Hpar/hgSzefkSU0VnevtfS/RXx85bVTqaO2l5XQLjRWH9cHLK7qzr9a0ehSbEFJnjUFY0HQVyYDmchDo5Q6KDrB1DPGvNOex8r8f3F3gUD77JvHAgeIZFGaJwjfPAv8LmoTrtCCvc9hAumEM6pcaRZYuj7Y1FXHcrhweO1Pn1i09tXimYNleW7tuAOb+nJ0xLCVwh7lxBrzrB3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNHBpq3LMZcQe3RczMOybvD5uDIUCvCY3NOPpoycXzc=;
 b=mD9+sHZbg0ngaXeFA/P/CKubCp6k6muj/Q6YKhr9CcJQO+Ph5NieC0hnN1cONcHFMEPO3P1/Key7KCrNWcjfj0gyzNd7LB5rWS7wrMtigrBi6RBnKrtzBTNIebklSxFAmJ8AlADwbfMRy2TH2Ms08WLpHs1zvVAvZUedTu0aLjrd5GrUJvSdhvarCVMmD2G/ZJlsG7ZQ0DaZ76VgC6l/uKtFC7MVYsLvexovlrbO9R2Qr+YHzKfCXdINMPv3cQLfbKspbXiNHtw9hXB6wbBN/0VPIio1zHPW+W+/xEoi7jaNY84jf0wkAq4f4HgCq9Zri3mMi09EVXxhF5sJTYQbCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNHBpq3LMZcQe3RczMOybvD5uDIUCvCY3NOPpoycXzc=;
 b=SwsBf+CI+cKKIR23fJgNPU3tT1I8S2zWiIMITTU5YuJoTe2Zpn5lmxOA0JFaTWCYUwLVtvgap4Ch4VcnbPdFOkN6hwiEzcQZT6KAGvl4yI24eB4gSH/sEE+xkq51bhI1jTbyUjeIgcIAQclzJM9XctWRmiCeNZl5gkLKyHSGvh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8436.jpnprd01.prod.outlook.com (2603:1096:604:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:10:24 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:10:24 +0000
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
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 12/21] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3E SoC
Date: Mon, 10 Nov 2025 13:08:12 +0100
Message-ID: <1250e23964d559381bfaccbc0b9d41e0d9629b3e.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 493ff73b-ccff-4e1e-d7e6-08de2052209f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+2f+ak0Cdih8gsrHkiXuavRzkI2ng5VLmzkTfMZ4ljYjMJ5/ad0SUlDUyZPe?=
 =?us-ascii?Q?NldrwPe7NBf1J8fPxRygfmnyqN19wqRMC5yDkhmtptCse35q5lhDKGUcAX+b?=
 =?us-ascii?Q?AZ3zSfAAmaw28VJcx/xQZ521bxH3LaDjcLhkYWt04HVaApJt+ZZKGl5GvZ6A?=
 =?us-ascii?Q?bwbSoY00zE6nvpne09Vxqtn2D2VkygR8NBrRARmOxItmR07s4nrJs9/8MZ0D?=
 =?us-ascii?Q?pdtgImlVGQQbCWSbqbCM8kOQPjyGGEorTNFPDCMra8n5c9dMj0aQyyjz+hcJ?=
 =?us-ascii?Q?SZ2ftJ3xtPP3LfH3ydQ4pRHTvuDMVRPC7fSXMLTRAlfQAMgZKbMKKTu73veW?=
 =?us-ascii?Q?Wjfab/UAF4k9+SiA42+VQJgGTXafGxDAUG6xR7KuPdO4qOAu5N8bIvZ4JlLl?=
 =?us-ascii?Q?lbZLKg6uvedNp0ZcGg4jlxrrdf5TVrI1LROlTHSOZoYO00t8Dz295W8VOApm?=
 =?us-ascii?Q?LWhvtk3vRf2xwfn2GKBPFSFzhUH0xST216YhgCjOxvTl1WCcTLkzl57l2bTz?=
 =?us-ascii?Q?BIf3qeEDZIgV62SG5jmvT+t8yrjW85uWM+oJ+J/0qPIUldHwee17N1Bt/wOi?=
 =?us-ascii?Q?Fi5qcEccXrZieWw0rPrvv/GVeNCjncdn2VNL+9UTkjYkMTgIIfSEgLpqQ52e?=
 =?us-ascii?Q?eOsVJzShB8FefunEh4LQkdy3DeNXE8Z9DfpFYxIXAX1IYtXyvzX6Lvf7F+9d?=
 =?us-ascii?Q?VtfJoJ+NIgv5PQtWPvKss3uULPEphMtUNMps0cZdAcgAP7gekI743ze56rZX?=
 =?us-ascii?Q?MJ+Ker3AUEvQ2uxj1IcIx3EKlCv57J9Gio7sQgHZTOXP4nrj0tBeOLeCkGup?=
 =?us-ascii?Q?n7UznikZoJf/cEYZZSxJUwW9K65HelXUpST7PVQom2ssdJt+AG3j+hWxqTbb?=
 =?us-ascii?Q?5gk2x5a5jZAX3ODmb4iMUf2Sd/cU4OliT3nQnE+a+5CXqxPl7vmIApZmiEle?=
 =?us-ascii?Q?MAuRaxsJz+uYYj4U9zfqsEUCRKt9pQ+8jHz9kYT2spqH0cgesBAXjbfsST+q?=
 =?us-ascii?Q?7koeChL2QZE5USDjYpKltjTwF5SRjaTg6CwbECh421/3FtskU3rs92Agu1WL?=
 =?us-ascii?Q?zjxCVAglmEkwWqSg3FYzchrW8/vFdmV7p4GZxpve8/qOCerj//WDsOb93Zij?=
 =?us-ascii?Q?H9P5+bcDvtpijCHiDtNZKz2IkeQfXA2HpHSDjMBXuTcYDIXfqB3qjXe6LoVB?=
 =?us-ascii?Q?ZyYQ+bdbE5TM4we6y7HCtZkMx0Il8ilpULB4HdmV0j5J7Qm1gppIpvE5afKD?=
 =?us-ascii?Q?qKJiNmObFAO5DhhcmB71d5WJqlWR6qGDxpS3NxgD1f7FvFZ/CurRU/jv5Jxj?=
 =?us-ascii?Q?S91mWdf32S5vM6oaRIUklc91k2XF+lPq1/bZL+l0JIBnDHQItHsxs4oJ1sZj?=
 =?us-ascii?Q?L7WbDSlgaDxanYR8/L2pLKa/wNYbhz5lh25ISzmQej9/RtmbHRJIy13wrf6u?=
 =?us-ascii?Q?zzoD0OPCYKmAvxEBimP+/Hf/vVwzp5OqrEsaJDTALg8M8N2aloOESUGPof9l?=
 =?us-ascii?Q?Ziw51ZMQX2ikZOxnTsh2VCsvF4MYs8v3lSBG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ex293PZLDNH1/doUT8QL6/EjEI8nKHg+z/QcEnJjJAi7sPj/0Qwz+OstBn6p?=
 =?us-ascii?Q?XwhRbXAfvUFGmaAaVTYlX0Xfnj7XyECeUbi3gcNkkXVWVWKhT+mR9ACtuUK7?=
 =?us-ascii?Q?9EehlhL9m12iLJ82EueMuBP7JjMgg7to5bnRJqPYqE5He3+PIkBLJpLKSYxs?=
 =?us-ascii?Q?NNFt+HKO0zVzpKsdmNwsgfzDZ5CyR7XLmpstj4MA17Fd3w+6zhzhCotmSWEM?=
 =?us-ascii?Q?4oUOYY7FM2ujKSoT/gu6IoxC/YyXVGAv1IlAvyDBlFNSIuPNwauZy/lAXD6y?=
 =?us-ascii?Q?tKO83//8dgLpNFTNH9rKdKGBxAJrBUPTayW4bEfRxjSb8h36/ZA7LujZEmoP?=
 =?us-ascii?Q?9qG6qzH5WHiO/7gCuiuHBZgEB0MimWB6uWFzUi/OG/MVdAAJ2tkE/ORHgCfO?=
 =?us-ascii?Q?9JqxOs2A4VCEj48IDlnaaFNoa49tD+ngiaJwnVtzy7yip2N7j+gf94iVdYB8?=
 =?us-ascii?Q?eQB6M+JswGX4Tuonevn86FBuGQ4WTpr+QmKT2BPiGp1j6JdDlRJeV51kZD4/?=
 =?us-ascii?Q?TvwBfYwj1ZYIoTwat2NB1KejxJ2mvKjhSBkoIb8MGJqwjkqyqei8MCxvDwME?=
 =?us-ascii?Q?g8A72ibkh45Gni0zhkJjhreUvl42UmKXBAOh59gKrGzwpToBCO4adFW2XRmg?=
 =?us-ascii?Q?uVEoG9tvEUvqDbZvuwMu7OKKdebddHAGP7UGhZNz4zGzpU+xCVCt/YkGcdS4?=
 =?us-ascii?Q?jHAM0dJf4Vi8Fz+kZjLXesHidzWEYV1n70wrNtMS79iDidSjsXAy7tFws5mQ?=
 =?us-ascii?Q?9HHSi3+oYfXKl3IYKzJVXhGOqCeajpXj0FcxINKOd1uD5Ol18HcToZx0Zl8x?=
 =?us-ascii?Q?V76SgCiLrsit1OyLI3n70QGgYIWg5I6QfQaVL+DB5zos4hhfZbTYZTwM0Ozx?=
 =?us-ascii?Q?ZRYCH+eSMFEd8N/lPddora8M2xSfrbHO/1glo7wTbjpaN4DcFBVY/hpQKyYn?=
 =?us-ascii?Q?5Fux9JDKyPykN8W9trcRvx+4Ov0oFwOlJoaQ14s9Edg5ozk2q6pZ3CY1r9MX?=
 =?us-ascii?Q?njqbo8I7q/P8yqfoh49SgJIqbvNhrRVhb6MLLcloTQe7+Ns39SPclE0hLtKG?=
 =?us-ascii?Q?HVl7ZQXql4qMAx7zRAfG13Mg7Tlut5P8gz7OjSszYdd0THPNRSedqYjMurNh?=
 =?us-ascii?Q?KFjngmADJ7N5GsiTC2UtTuPraGzJrN6tu8kk5gnPmWX+wTtdHKqya60H7nx3?=
 =?us-ascii?Q?XKKJAtrzGWxzPxcmUAbCZwulnsiEzo8CK3xg+oyLw9hkO4pohhT4og7wggDn?=
 =?us-ascii?Q?bLrnwPnHdK8ejKv0oqG4VWl7towQ4/7N5mGAz6guJyEswPcpqfXz/qp5+AzJ?=
 =?us-ascii?Q?6rTGWpQh/2DM3Xw1IAruB0tV8uwb8vT/VYAxuVGmw6dPOYIiNhDk+qrTQg8y?=
 =?us-ascii?Q?8gLlBNv7g3v3bgifn/T5WCjo/hEfsaBn/+pLkmtOwWb2rIrp9e61ThxWeyuV?=
 =?us-ascii?Q?kpqH9eri7neE82ROZ2ma/Xy8A1F/VWqkDsQrhZHLYKCFYd5lV9clZRIe0AIs?=
 =?us-ascii?Q?JC5x7EM8z1Vr8lsgbbh5UsX9MuWjPvgQQa2LmBFKnPUisMjRlY0DhZVD8Osv?=
 =?us-ascii?Q?iX7yuCG8OQBwDYJjnnmAMfcArCGT83JsIa3jtg3VEXmw3MTNbPJh725S1YQL?=
 =?us-ascii?Q?Hs80Ypl2PbZKvNM40qY/YpQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 493ff73b-ccff-4e1e-d7e6-08de2052209f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:10:24.3468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Do5pPCMWuyN48irywGvVTD3+6MHbBfIeFVBsCKesVN9OlYfsXQ0a/1y9YTIS3m7bZ/RNwu/uWVmO5JW1/MdsbN2cvlXJF+G9H6MeZlZUxLFSHWCEceLMnLEvQmLvIGcL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8436

Document USB2.0 phy bindings for RZ/G3E ("R9A09G047") SoC.

The RZ/G3E USB2.0 phy is functionally identical to the one found
on the RZ/V2H(P), so no driver changes are needed. The existing
"renesas,usb2-phy-r9a09g057" will be used as a fallback compatible for
this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes

v1->v2:
 - Collected CDooley tag

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 448da30757f2..9740e5b335f9 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -41,7 +41,9 @@ properties:
           - const: renesas,rzg2l-usb2-phy
 
       - items:
-          - const: renesas,usb2-phy-r9a09g056 # RZ/V2N
+          - enum:
+              - renesas,usb2-phy-r9a09g047 # RZ/G3E
+              - renesas,usb2-phy-r9a09g056 # RZ/V2N
           - const: renesas,usb2-phy-r9a09g057
 
       - const: renesas,usb2-phy-r9a09g077 # RZ/T2H
-- 
2.43.0


