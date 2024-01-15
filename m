Return-Path: <linux-renesas-soc+bounces-1556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4C582D2BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 01:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CBA51C208D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 00:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675EBA3D;
	Mon, 15 Jan 2024 00:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XjWW/Lwe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFFF64E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2024 00:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0Q60erXOchzs5Tj1rgHG9U2ysabVVwy4tx6OM6NdrwKqXHIsAICSVRGdlPkZ8KaVuL9yPgXdzK1OMfN0qpTZ7HF4OQQm6C9NHhB06vQ2yiwJLEZwDtfSohjZlKsQBeyB2wBXV3CUq/6lZkYGZYdrTtOGfC5sZJCTKKagKih9D8is9ik39iShrHtYtx0DrmxeUIg5uka1P9KYpAsc6HsAFfKPYiHkzf9RYOY6pi/30EUyzO3GOnLm86j4WnJgHvgq7iiykU8VikjBPnWVb/4s4YVa0/NQqbuBg1e6h2uesaSF4SxZi/uTPgvi358zBiXFLqsYk/xP1nnRnXl6tqbdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKhvnhA3OVSQjVuP4ypjn6xzEzZLbz9DofD51avRDmE=;
 b=bv4Tc24g6UudL0qocxVllEe4xuKERTtzGu1h+/gibr0DvHBxwijLCYmmLQZ0BZ4fZrrV6Zf+AmDTjiCbke/icLwnrLDkOFd4z8s1BA80/uNYhJ9m17xgDY0yD06ujah7Y2Pa1cKSRshic99eWCuyqbB+rbnTemrbOJYjgVmPQkz7jyJqKv+EdBV7SeLbpqXsFcmKx5RTkFYdYRLrSS+g6h1QSFt4PMzfL6/tBog+PPtQS7MSw1yHKGG6jJa5lmh5unVpD2UXkuliWHubOnOZKvFU6piXZrbpS8MgNcUZBJuqomYACLJ0Zim9yEva62q373nve/JM3G7O3uUBPkEXbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKhvnhA3OVSQjVuP4ypjn6xzEzZLbz9DofD51avRDmE=;
 b=XjWW/Lwe/FbCwy34zhsRQS8DCocD9cZR7qQE878OgggrLQpnJsp4kiyPVxPf2ClO9oWgCvF5fExeHhpORredEcFiNtiKgNWMdfwNZYS0wLP3BBOMVZGChY8ORS3+GHUi8T60KbbKBXIoHdant+2sBdWaKt8QiDfwn6nR9cE7sng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB5695.jpnprd01.prod.outlook.com
 (2603:1096:400:40::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.17; Mon, 15 Jan
 2024 00:38:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7202.017; Mon, 15 Jan 2024
 00:38:43 +0000
Message-ID: <87sf2ztoq4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] arm64: renesas_defconfig: add R-Car Gen4 PCIe
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 15 Jan 2024 00:38:43 +0000
X-ClientProxiedBy: TYCP286CA0350.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB5695:EE_
X-MS-Office365-Filtering-Correlation-Id: d5be3afa-040a-44ad-cd71-08dc1562539f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Oqfr+czQREW/OMhRXjn2VpgrVX15Crd+FimLU7esiZ+5jXgoHKD1UD33vXElxPYlVvV8EryIUXtEaqAO+DHpEDYleYuo6C1/pNMIQUr46OtlhTO+K1fqoyQyO4tW9xvo3U7uLg6pqEIEGvDB82JvyEgcp1EYPFugnGntE5vE+BoyYhoRyO5vvkyZijfOT4kShS3QOm3OcnYCLaFsZsxRwhAz/PJ6uajqimKOiF2J0rVsTw3SAkx1CXdWJo7lJpZZn51sGzs81U42S1KoEPv0vCxOrGwbW9fa77Pj5tUEJo93HLS9OzCITKrLuwKAGoXoDDnkM/67x5kXE9OyZS/RlYw7uB/eP0TX+etrbBsu7UV6D46IVZGtsgDhhyro7upW73SAUcPVh3Y6os0yq5kCT0bTHtODkrtqrNudD3nrrSGkQfQScRaTE2d7PX3XpkO8hONuOw6khVfsHCSaK9XMo1DF4niS+UucPUDoAE0ZFNM5CmsMGBCEteu5TIQzpCx5WuHJooVfXwD7qLErarVLow+8sr+o5OfMJx+vmLieDirJ3LAqBPtDLBXLS0/svN1wBVuleheo/jc7JOrUkIcSTqUp5pR5gO91pK7NDSAudYjW6recpotX2cIiqqUzPC3K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(39860400002)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(107886003)(86362001)(36756003)(38350700005)(8676002)(8936002)(4326008)(5660300002)(2616005)(26005)(38100700002)(66946007)(66556008)(66476007)(54906003)(316002)(4744005)(2906002)(478600001)(41300700001)(6512007)(6506007)(52116002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PxyDejnf19C25NTaWTCYdfWO8ku0e63mQwkWq/sKPupme53BOsK7LfNwL+gN?=
 =?us-ascii?Q?i4oNgXwOoEVUMWTAThtlUD5/3JWTxaacT2MQnLMpsmokeKf2mHndvtuF7zay?=
 =?us-ascii?Q?3aFFZoGkbzUES57W3ONaEa68TWwxLScdlmGTFAJ6oQIRXZxebyN+gmlYHAYT?=
 =?us-ascii?Q?GvqkSwvUBXi+0CZfz1lYFsRflwTBQXFuJMBHpba9uoCGgeX208jKiB+wyL9Q?=
 =?us-ascii?Q?FUrQtZDBEW86ShKd4VYsI5el9/GQjr33XKqXlukoSmK3ouUKyEZxh7es8g+0?=
 =?us-ascii?Q?dcSa9od/Bh1Kmzvzk66u41PAwebRPyKME4qiwFCMtn6C5+SQkZd74+2Fh/pJ?=
 =?us-ascii?Q?G8kFb6elszIqUxzMufkTU77VDSveBal6qRgYL+SHuhNc4jL5shAiEuBNjAvC?=
 =?us-ascii?Q?i8c+bVeRg/iyMmcnuL2kP6jGrvVF73agPrxROLW98SxRIyZqBZX2cOtdb2o4?=
 =?us-ascii?Q?iWnpgsfu+7Zu+EzPGRo7CrSFNWJZ1+HdujBkV6Q366Au6LVRisnE+VUBfn/0?=
 =?us-ascii?Q?65eo5YlP9o3eaDmsS/5rWWVlWi+X0MVEKY3/FFnRv0i1NCwlBj6PJOiyXiMa?=
 =?us-ascii?Q?c4ksDLGbwQu+pydHUBSFz0E+HV2aN7li8/GG8QMPLV96ZYIeRIg9OjAQiRMA?=
 =?us-ascii?Q?ajUorLhoKnDDmuehgWpkOaQSkrls6x+66ZfZSiR6Kn9cib0CC7nTsezERo5c?=
 =?us-ascii?Q?/P9PGgjI9Up0AzRjGtn1d0CmwcDtnE9Qp+/6wZrdKfLhuOarRLIknuops4aT?=
 =?us-ascii?Q?+OKRzFw/9AAMhL5CloTsdSieNuBEnS185qbI/7z/M/Tnly7jmKaPsyWj3fAP?=
 =?us-ascii?Q?aUGlvcCIbLdPXWGmF8pzJXVR7FU6sApA3FXnKdJ19FZd8V7+3EZbpbv65Hrn?=
 =?us-ascii?Q?frIu76gx0BOB+j2p6mBkVFXa7xYy2H4xqntu2OgGYHuuS3Kxt07rjR3MlBF3?=
 =?us-ascii?Q?gCAegRqTDAB0iV+ckDiHkp3snYICXd18xITTxNGF80wIgqt6KdImUMeO/G6r?=
 =?us-ascii?Q?kGLv/XyEET+Gh/rdt0PxjVJtJnnX95uuxjxclS0JcvK+eIHYUn/KK266xDrv?=
 =?us-ascii?Q?Af992XqSxMZSMeA0eT3Z1/ZS8ikuURVa5aGQ+2fBA+KuS+O6o9+LCO1kBdNl?=
 =?us-ascii?Q?MDk+bDUuUp+6j1XMxQwnQcbHFIoSvcYMRj81acNvfQ9xHkTA0lGrxGohVi17?=
 =?us-ascii?Q?fP6Qc0uxrPhq56reeb0/PEmZ02iFB2PCh2IK4hXGyl3XGp9PnidS/4RV++DR?=
 =?us-ascii?Q?ZRb0Y1ztf14fs9FkgbC9e7wpHR3wOpr2NX99qaiJ6zTxNSBvdx0fLeNJXcCy?=
 =?us-ascii?Q?QiyjcfNL0rsp4tiviBWiQADNba9YMZX8ecl5rSQ/A4kLZWKHdEC/EWKcJnn5?=
 =?us-ascii?Q?HmqEBno+ir1HUKkwOQHYxGvNbnfz0ASVAEECK9TodQu6QSTiXSedDOHa+ehA?=
 =?us-ascii?Q?Bt6562yx0zEwG3YNXDN6ybP+aihu4XTPknQ1T3ieiISymRprg9tQEUGwN+oS?=
 =?us-ascii?Q?WPxrx2m5elSlJArMTDGHRvMlWZmfRNSXe6/xzMb0xULaFEvvx4OqrZDnTYxE?=
 =?us-ascii?Q?4lDyhjJTC96HelxXqV30pr/hvMOdF22a//vqukKH9iWy0TRZAhkWj4gBJR9w?=
 =?us-ascii?Q?+23p6flxCaHi+pijiaCTehs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5be3afa-040a-44ad-cd71-08dc1562539f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 00:38:43.5903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJewE128Y5EjguBT989OP387e8OfuGHQB9cx+CPt9vF9xUZr7Erlm/huXdOK33S3rTjUCDoyPgCKTFq0WxzYZ7fTEHO9VuFzlyUA8H+z6FJUzFjolcMTfCSGa+HoRXo6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5695

R-Car Gen4 is possible to use PCIe, this patch enables it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 7dcc4a712f30..22973fd31c1f 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -108,6 +108,8 @@ CONFIG_HOTPLUG_PCI=y
 CONFIG_PCI_HOST_GENERIC=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RCAR_GEN4_HOST=y
+CONFIG_PCIE_RCAR_GEN4_EP=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=y
-- 
2.25.1


