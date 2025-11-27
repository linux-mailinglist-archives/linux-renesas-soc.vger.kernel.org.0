Return-Path: <linux-renesas-soc+bounces-25253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE27C8E230
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE9463A725D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DF2330B25;
	Thu, 27 Nov 2025 11:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZWp/f/dB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B20B330326;
	Thu, 27 Nov 2025 11:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244286; cv=fail; b=b0DsHOaA8D5x/X8Ud/6NyZX61n/Ld9Nb8R34AaiojAKWOkkuIeKOrr91UShi7qHVqwapAyoUsEHkXbIkZvbgXNWzKjCVLyPNZbrQr+xZ0VrMmNcTe4MQeHCpHPLcK3/6yPlEdeLOcKg5ToSUnXLNUL33QdheJGYK+I7tg2g51Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244286; c=relaxed/simple;
	bh=yjMKlSTLVX08YpDIgll/xHonnHM2eKnVjGS8vnD2oHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bm5lKBU8bfJpzqg4kPlhiByc+hBL2Mg9V5RrTljEPEiphJfCKDgvvztW8961Dbd+s8AvTBMBN8SNNuUrp6U/VHUxenQqjKeVCGPLT7ME9gZ/KWjR+ke1EkaC3uTa67lyi29hFBRZIUtRktYSaWISYxfj6JBqrRJ3sx9GUlR/IxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZWp/f/dB; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdLZPMIJMu7dQjT7JabaV6gLswQvXgGqRM3LPUjECTf3dG/Wt44YQafB5j9EY1YiFaOYFNBEOrdekuFg2ucHcqqVMG2W2n+PGqIzrPcbMjucYZrjHtXo1Qj0GxQ05hn5+OyCIW8SG18h1QaxQIu9stsi0t2IuN0GbzGg6N/RwUagk406cR3kExQMqi1vXsC0mqY4uzkqzBaDvZar3n2ks5JYtAYd5hS/37ZA5N4/Bxwax9qXF06V9OlYfFhVoaPf+qPEeOZqE8G2tJ0mBr7yUbp93d0RSYhNJSRycCzRcJnLuq2Dco/wG4viBynbEUy9CeUUvL26Er4auM0O8+WvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhigcmQOTkE3FFjHNHJnB0XxDguKFVI4+hry0WhUJ/c=;
 b=FveDyDOiA59OmtsmZodAvcIavRL0D2eDVg8CZZgLukyMetTKe9ifzvAVFEeb8Mbjs+Fx0/rh3bG41XTF9iIlZ3Rqzhm+b4bjVNcOLdRzY6caW1NzCVQejkINsVV8o7o5ygEa6/kX1F63qxUU/07mgwvs+POwq+zaBtQ8Nwg7c8a7ZoNE5MCNWxgNcV66nFy680vVrj/esCummLJ0/Uoyc84I8aC2f/2lNMZvnkdu/NOswuQAI1qcvRqGORICZBg6E5PWP8mJmpnkEQa1aWr2Wcmy2BbbEss23/j0H5sK5LrFlSdicGEvZX8AdGIeFsPOsGK58gG1UxHoKF75SRc72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhigcmQOTkE3FFjHNHJnB0XxDguKFVI4+hry0WhUJ/c=;
 b=ZWp/f/dBeFCaUL06vJcTKGuK3dXjkKjBIx7Ftyj0rhZ7mEmHqQtboywPeqE5cDoQlS3TQp7X7FYnWY3kHnj+GWwJKcRuFZcYNDfSjpYPDCdwyaoknHE3U58kAjbABWgKKeAnBX6zpPgQ2OdG+LeczV3EfTjKJmmfkDg40kuRVZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 11:51:21 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:51:20 +0000
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
	Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 13/22] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3E SoC
Date: Thu, 27 Nov 2025 12:48:40 +0100
Message-ID: <32c6393bc89fd7f4b354def0028220a1916315e6.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB15042:EE_
X-MS-Office365-Filtering-Correlation-Id: 0db10c65-cc81-4438-4065-08de2dab47f6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m4TniBbTFNCRT+sJhWLfZNPofJHmzK63HK5LOmvyqjyNBrqmJNx1W39Snb5A?=
 =?us-ascii?Q?u2ZJ6Jm4eh+DJZRwE5Jx17UyhvMvNZkPf3D0g1xfNDq5x/lVNBnrDu4qgvEc?=
 =?us-ascii?Q?cmwwSMXRVVWWKpIs856fA0u5XDv09v5KQBIt4dEMYNX7aKLOkRpDsx6zhJTe?=
 =?us-ascii?Q?1qS7dFTSaUsvYUTJMSaXMV9OghtHfrwrDcjWSURJj9G408zEDO+jPktXf6NW?=
 =?us-ascii?Q?hVA0CdCKeVZ9mHPZ4EZATciXSXf+KkD3y/cplbVOjI5P9/9J5q17hWhS4EFK?=
 =?us-ascii?Q?z4L6q3ZneC/w7BcXP4cuIXkkdbae3b2e45sGU6H0rOIcD4qJd2b+peMGRwd3?=
 =?us-ascii?Q?6QHj41AkfND2OJ2dbLJDmDtprrwOapP2/dgmZNi6TsyVL0bCje4i8TBgqY65?=
 =?us-ascii?Q?85EvcDGZRi/d0KCfiITUc9yC7zY3HDIYIJ259VlhI6Mv4G7pBf0OvGPDwTox?=
 =?us-ascii?Q?4V8QFqIk0ANJQYbuaZruEJynVFdO8Dwg84kThfIhe+iGffH57j1oGnCueKut?=
 =?us-ascii?Q?wFWMWqkivheBFujA3Wo+REtKgwdyeu2MWnKi9XwCLFehGgRY0JGXg2Lr5iqA?=
 =?us-ascii?Q?HxMR2Og4DoC/AjU96Zsr7dOWo+y38HG5vxxfmmQfWD3qMO0oTJB2Pnkkvk4Z?=
 =?us-ascii?Q?lFI0YuuJJaZl0wgawEfaYtH+lLnWjtr6T00cEqNaf+DVzfQW3HNWjgguPO9i?=
 =?us-ascii?Q?bVslg1lf26CLHTSwyGc13C4NdmtFZRl/F+wBTvSLgnWGJm0t4TXvJd2M2uvd?=
 =?us-ascii?Q?hhTbfJkuLEV60Q6zGG8DnIkv2YGw+XLGW9JOOw80LKHYqZoMA4V+yRP/n1Q8?=
 =?us-ascii?Q?A/MWtFL3JvdegF3nZjANcfDFS0HTsEuPJzF53CT6GS50jfEVW/pOmYovRewX?=
 =?us-ascii?Q?fU7wRyzHlN2YfKWKVo9V4hk3LyllLCbZ4lvzH01kBHPaY+skHT3FUSI86/yP?=
 =?us-ascii?Q?NuMUcyFUVIP6JMAA1TBvuGhrxp+4ouOlHlC2BO1UzeGtTL4Ue0VbOtjdqZkz?=
 =?us-ascii?Q?Pi8edgN3y1dhuxlSVA3BbYPHSzlngp6fCNkvBr8Wp28kU5TPwJPa6xtqPlcM?=
 =?us-ascii?Q?BU8sYa9+KO69aAoSmpwysy1281YEOHNzYSY6YwCd99yiAWLEh44U+Ahg0zlM?=
 =?us-ascii?Q?vnZOqrAkQqO3zO8wE5seS/qDCRYHV8mnCqtni5GlkqVUqhXqF2VD9MZZ3qdx?=
 =?us-ascii?Q?bzVqZY/Ci9ofEWipqxxJqCCVmxoP4Ecvrqf5nurM/oqyQRAjH/YwhxjPGreV?=
 =?us-ascii?Q?VEOKXzpUORnQZvF9ByUXaw5hg2dUrYodI7gvamiP0d3OM1m/ccEBNPUK4a9M?=
 =?us-ascii?Q?sYa6WOEUcZ0eidhHPA2MIxm3lEJX7+fCtywawM2cDaVG7w9lT4l4o7MzDFQ2?=
 =?us-ascii?Q?slkCHZtblAVfzT38hlJE0S2fjXgRGnMLtAnSQspa68NVTwZm1Qoyctua2ekW?=
 =?us-ascii?Q?Afumd6TbHRGiuHS7DuZcAIMBRxFOzd+LF0pZ4UXJd4I1R2sMPB0GklA+tr1X?=
 =?us-ascii?Q?M+DRff1C0Rrqv9HQ4XpqRHKJrpXIK6u/fAiC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nltqvf8ayPB68GHBOjsA4yE0dfb/kwEFxyJerTDyPcpz9KnkiQC65jGO8KfZ?=
 =?us-ascii?Q?GKoYjsLY46le3S7zbNefhWxlvjZ2r0vjvegp27RHgW16sHYpIU9CpWQgMDTX?=
 =?us-ascii?Q?2rltclF127JMcWk+KE1xfiwTdaCpNcoDeMdqorevtHcsfHnkAhYgeOd0K8I5?=
 =?us-ascii?Q?BZKrJTj+WCOCICtOSjJWdjZ2oISBz4k3ex4VZ1Fsek2Vu/1ZxkuTltNfPP4q?=
 =?us-ascii?Q?c1nKDjvKAjGmwxc/UCgHHRNJRwZTY7SM6rftDhvSsptHlLlzp1y8KJo01J3X?=
 =?us-ascii?Q?QQselv2SL7ortNAMVi24x5ANJuc4GjUspaWAD7EBXZWJrFjLef5VS31wfDzC?=
 =?us-ascii?Q?oI1Xfmxm8PdtiAOjEnear/Jn+abfEERTo7CEyPfTpkZXTM2jCtefNx7/gOnE?=
 =?us-ascii?Q?EtRSMB6vl0Yq57z9EsTkle3u1vtKC4ADgnESPtbr7pzHskP5dYakCEoTxoV/?=
 =?us-ascii?Q?+pw1fWwFac9nzXbYB2ImtXJG3iIGmEFcDaeNobwkZKqbHfE0hmAMOuUg0HzK?=
 =?us-ascii?Q?LxWNqvEdNjm0Mzj9AF0N3mTY6TaUPcDiKoMo/Cos7KTbTuE0lv8q4XZvcyPj?=
 =?us-ascii?Q?wCxF/IGuHUSJ+57kT6tqiAGRkcf6cv7i534HUSgqN8galsDNrSMW1NjiZjGl?=
 =?us-ascii?Q?WGfKSTLONmiQv80ItZrvMrQVMAuzxZAgfvhkZmpnCrAZULbirB34gRtffyxj?=
 =?us-ascii?Q?66/YVSd5ZD2XJmWSo8EwNoxFjOo133VW1WRA3+kQR+jypRUT60YLN9j5nvc8?=
 =?us-ascii?Q?Ndwybz8k+Iang1gqoFaTTuIgJNAUYELW6pVOoRg+YGlbXvxQIXlZuq0QrhID?=
 =?us-ascii?Q?A71oIYqSgXRIVqtlX0ujQiP+pTgzf8NX4CZewFTGc7hqf3WtBZMigAz7D2sP?=
 =?us-ascii?Q?ajJassm3LN13F057tZ2J7iMVoxiouU0zG6mFKwFEg5yGWPgYMHi/xDK3ClEF?=
 =?us-ascii?Q?2WCNA0WcM6fy5BOznLM4Rdvpni1oCO7f7VG47Xb3ntCbk5nJaJiQlHqTg7/e?=
 =?us-ascii?Q?21cPqETAnguWNNjmBsIOwWZQ6ieM0X5Yw8EdByxZBfMQg8BY69gR4T5q42bp?=
 =?us-ascii?Q?V94xb0U51Ig4jQgd0fZx1OmDTMhDyILgYiX7BOdJyTxPvm9MUvb9CjI53p80?=
 =?us-ascii?Q?pP0ugPzBfIaMHM+L/wJYQr6Kms5unMiV5snVBgEYg+YhfuV2v1tp3N1uAdmJ?=
 =?us-ascii?Q?PxJne6qasVBhXI/hxbD+d/a6M0xyafgDjTBSZyQj/Z+AXEW3HFwF0wMfWdQj?=
 =?us-ascii?Q?0gfD+6bqPg4+DmS+k0XmkpH4BLtB/aqGEPXG0Gtcl0tZS6Csijb7q/HOJ1dS?=
 =?us-ascii?Q?IxSndYHyaCZtzHN1/iNR9eBrR7Dcjv/rkUgKWErdZXlQQG1rT9Cq/pdsWBSa?=
 =?us-ascii?Q?7CohsRKDUlb6K6FDZCTFw5uYw2uAvvXdC8KOuIQp9qqQ/jBxi6v5qiK2PAYR?=
 =?us-ascii?Q?obfpNGM86NSKb5B0Qx3GDs6nJ6Eggv5uy1e+gYE4wLEEP2kHSwBp3j0JYqmm?=
 =?us-ascii?Q?He2ahSanVq4xX12IMKxGUZUDdzhPv2Amj67IikkJW3EUTM7lNN4wCGd1Aryi?=
 =?us-ascii?Q?T1lvYPq8ABZ13/v9bo0l3HoWI+pQA7iqaEXDkDr1bjcQOjzx3n4MC2O24Rdm?=
 =?us-ascii?Q?53VUB91uurRiEazYNOLexJ8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db10c65-cc81-4438-4065-08de2dab47f6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:51:20.6570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zu89go6gddsUf4tohHEjG9jsAtPAzg1bycWIWeXjrbtkX99pN/fQjq3j/wPMrHoBPUJ3sSeEeazDZbHhQQ3/BPu4e4GU464c3rte2OaMjrOqAgrlrN5lp42dCkuH2Ven
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

Document USB2.0 phy bindings for RZ/G3E ("R9A09G047") SoC.

The RZ/G3E USB2.0 phy is functionally identical to the one found
on the RZ/V2H(P), so no driver changes are needed. The existing
"renesas,usb2-phy-r9a09g057" will be used as a fallback compatible for
this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes

v3->v4:
 - No changes

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


