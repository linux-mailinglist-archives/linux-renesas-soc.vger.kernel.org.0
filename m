Return-Path: <linux-renesas-soc+bounces-24158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 34599C36677
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E91034F2DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008F032ED25;
	Wed,  5 Nov 2025 15:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ei8b1l42"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F36031577D;
	Wed,  5 Nov 2025 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357240; cv=fail; b=laLtci9DrDl4JPV9JQzpqaNGyZkDZMlq51nr/cv9mEKfquQTdw0hs01HcRxeQ7TuHw9jv+oJordFPl6t1Edr4NIA+DdHux+AJFsw4PNWTqeypJadBB3B9+1qxmeIGaMFjgDhvsiYhF6hv65MD6B4Bjbyi2AjENKS2cNkk5esQxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357240; c=relaxed/simple;
	bh=KtJyqZsa+WV7w64nE/Nt92gnq+SnouG3Mpk5fsq6jro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lKI6/V7RDiLn7qCv9nLnosu6apCysT0L13FN//9HEiZDP9H4LsNZAqtqguxMMbIafyWRb4LVFuE8kaDdbdYsVDZ430KRrsAiw7Cos0N685g0Wqo4keMt3swdCKLjfDDVkbpuo8EBmndxhEtjQH9HYVtXv5JdMBi2TnYONaa/ZCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ei8b1l42; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqdisTN880jvIftgk7BMlH0Snlu09/SshVPHil3IxBkcPTTBiXclZ3Jt/4XRX8Scd95KAr5A+whSN4wMVLt0ZmZNieDXmoXNXgtXyK5B3iOU/6TfCRvgmA3Agz/vJc0VuPpGof9wuP8vMbhB2fs2Xra/l+ozJEAa3VeZ3PwE1ilymlqzR+IAZK1cifkN5tvEWXSPmsPue72hUHh4wtV7UaukUQKUhkx0gYe8Wio/QQ0ml3Qt6OGhxcvA2MsOrqBhVwI9LbVxDTRGoRsZvssqxEkQtSmrzYbc5Sj7lnNSVdvkwCSCuar5V5MX9P3J7C5B4/NPA64zXIEc0wZM0AY2YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6Tmpzx24vKJz7aTJciqiq01C0q+57stlKSdCWeNtdc=;
 b=l2ZZ9wPzahlaGc1i8/xbG1rI1568pklI3SaWG0ekRwA9bKwwtbpmE+9xoQjbwRO0szHRhFVEVXoxcgGaYBY+w1TqWePPS2Ktcr0e+ezUssdFYrKnABevi4Oic8aErvW/c9civdDKoAbzQnH0ZY/FC9CMmFrEgaHZAVnxGY/EpXjCIOEaaX1/9zOzmzziHbQpRWrXkNmSSr9AKovjNnV5a2wZUyhEhmGx/aFFVztMiv9Kvf8VkJA08OUFisk4i7EGtPlhng13WC+d9Wha0ri0trvoZpmzOEvF9aJa8nLsA8q+MaPiqCu9TsdD+AZJVI86Qg27N2NunKcS3jdBb5dmgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6Tmpzx24vKJz7aTJciqiq01C0q+57stlKSdCWeNtdc=;
 b=ei8b1l4280lDeD24UEhK96OJVNP+nlBtpF6J96sA5vua7+zMqduT95+CALsHoyvTDUoMhLn1Vi6mKoqc4qYHXPcWHV7qA7pyXWmw7pEUyiZ1l1OoMHbEA4jRTF1PHh4RhH4C1bJVbpb/RYESCKZhQZru2B6jfxhpN+fRbSR+bcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9329.jpnprd01.prod.outlook.com (2603:1096:604:1d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 15:40:36 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:40:36 +0000
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
Subject: [PATCH v2 05/21] mux: Add driver for Renesas RZ/V2H USB VBUS_SEL mux
Date: Wed,  5 Nov 2025 16:39:01 +0100
Message-ID: <b0aeaea6408319ba7ae525d19bb6ff6dd566e2bb.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9329:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e9cd8b-8583-4e7d-80a3-08de1c81a9df
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0RcSkd17bVV2DXpJc2ucPalrNHHMTOISqWBZ3SUQ4C4NGyd0NbTnbNORpYc1?=
 =?us-ascii?Q?SnyIAE2st3LW/ZDhqT3izhQhtKguo1zB2CLajAKY18wFUR5qtYdlP/jW+x8w?=
 =?us-ascii?Q?ytPK+UGx+0vvSDep+nCg9XGUwwJVnc5atieiMEUS0utqBVKj06SWEe/v3gj1?=
 =?us-ascii?Q?y9IUMfgX24h8Bh/RkNppfD/7N8ZdI14gL4gXp9Byqc9taps5r/Gwt0TPRyhB?=
 =?us-ascii?Q?l5oFHhrXpKCodteaPNsGmTX42CosH4jLnuaj9SyksSSbGrDRwnrN8GjwiagP?=
 =?us-ascii?Q?ua59HzyQ1FukQy0XiuXFNr/LfLn8nrhQ1hlXJFXAe9X7s0P2vGTsOCgTDTit?=
 =?us-ascii?Q?w+K9iLSHZWrJ3wituKEdnhjLvrfbCnWHo37V1oPkXb0Y3mq/UOU6FUF0NU2T?=
 =?us-ascii?Q?9g/Hny7LLHLIfOfzSp9m05TMV4jpHAANML5NaY6g9Jc6gd9TgVme8jpOCJWM?=
 =?us-ascii?Q?s13imrzVdwuLRV8jfAwX+sROhiOjoAaXaGpun3PhNOROxfEQI85qkvd7HLSj?=
 =?us-ascii?Q?CIm03OMYzwpTM9SQg4QC7u2nS5jX5cMIBFbH4d9YwEZf9PqBBln2md06mSh/?=
 =?us-ascii?Q?+VZr4pCcQ3WfDxgpkx4PJDfK2Y5mpdiGXfrSjNYHRCi1b0lOW6GlfCTD9fY1?=
 =?us-ascii?Q?7VF2ynW2vXkjVx6XErY851d7amcO1SszSKyBUwaNB2C9sDj91o7DGT/JW9ZK?=
 =?us-ascii?Q?YGYKE9vvcekFGkKibbpbMJ6XC0dy6WCFkfvH/N5wJmj8gxflJmOe2lrtqyRJ?=
 =?us-ascii?Q?RMUfBC5JpJ3fVZGSbsCIr2a60JEnmm328MrJILafyg1y/iXRH9Rty7m2YTK6?=
 =?us-ascii?Q?nRsEed5inPZqGEXntMO+PppxYHXZV31FxfRpW2ZqjJtM3Xk7rrUROPjAtICs?=
 =?us-ascii?Q?MeUbpLRcyOr8wZS0D7J8oQ1mLGJTygedZp0vR2Oh2PUPXPha15R6J1+Zr6Zy?=
 =?us-ascii?Q?eHnS1DPFnBui0e0GZq+c1w9rEKd/6OcPxjiQpQyI0UO2gNdF1T/3XohXJMaA?=
 =?us-ascii?Q?u1Tj7/ZKm69yiDGcFKLbFwzhSjSlHLV4pjD4bs+QydAORlNNxUMTPuWm0KiO?=
 =?us-ascii?Q?7mgneY9es5zNRHU6PduR9ndn5Z7Rn2OvwQ3ajLCUrm2yVsSGcLO86HaOgskq?=
 =?us-ascii?Q?7ofcfVlOwQcNsRZYRq9Kjjzr/KgUrJxnejYW3k85JLkMTOBjhpsg42srhyHl?=
 =?us-ascii?Q?8XEdX1gxjv9RqNYsONhJbYFe7PgXU7XjkwI1TGZKXJl12QQhtu1lArw8Kf0N?=
 =?us-ascii?Q?kEzr59jEPsJQvSpR3p4XGyyKw2QLiC82qcr9y83oZ8iT9dx9t2MoOGboBtCS?=
 =?us-ascii?Q?rEu5UgV3gkMajJ+mOrf1tYCw6gXsP7+v+KOogpUi8fh3M559D2fSVml9VsrB?=
 =?us-ascii?Q?71TTotJeiyuN7vvhUIYNrCTNeMynxLtsvHpXuSdJUVsNUOs9XdOpsfxEBO8V?=
 =?us-ascii?Q?D72CSSEA4wF4JO5ojGH11pEtxnRiVgBK6ZNsqiBR7lZVe5XYpozdpG50c8FR?=
 =?us-ascii?Q?YrZrpVRgIupEbAfVYjq1COOFuJSDNnlO61Lz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aNGFpe6s5uoxUTlLaiez+PHHZi41KpiarM67DEdPl0WTUgnBnjSGPWxedpKW?=
 =?us-ascii?Q?2KdT/EX7lIPtUzxFcj3bygssPPPaiTqbdQ2KwtGdipihWSvhBwL30YT52dnt?=
 =?us-ascii?Q?e+7Xo/ly2LDjT3bCT17DRK3InvIqR1hEL1aPltQeIj9wV0ADroq1fO+78Y+M?=
 =?us-ascii?Q?EwOCsLqdCfRT167GxZnAnLlZ0+GJ0h1PNJ86lHCMhh34hYnKoktOB6K1jHEj?=
 =?us-ascii?Q?zy2cr7WtbBOqkjGuQmaySSKLYqIk84qcC0vjQDOYCdc0BqbE281q23cKbwRj?=
 =?us-ascii?Q?IrdLjXJ1zAZ0Hxm27GIsQQGSXjauSnUVYbuomS1oLn+NQt1NAb9te4HvOjyN?=
 =?us-ascii?Q?vLgv77u0DyO1ziJFY4uyjk7Y5YJ55rm8m+Uooj3kHiA2dy6e+xKJUgBOKA36?=
 =?us-ascii?Q?I8tMpHGe/NeRN7DoKBHne18iWQMMboM2pL1FnRn3TDgt5y/njhJ9wck4tbkF?=
 =?us-ascii?Q?bF86p9qm3YnhWPwH3hDDP5QKor0D/uQBFUIsujhlIFDCZmGSkfPF9m3/QJJJ?=
 =?us-ascii?Q?A38uO55Lom/NHbkSwLcVBH1Kkvyr9u/ex3NgX+LJbHWXqILGqJdxTg63WonC?=
 =?us-ascii?Q?yh6P2kcMHlj5r6evS7HWvH14Sg7veeK+YAI+537EWgFYtnxm1xeZQ+VG/R1H?=
 =?us-ascii?Q?he/I+4ARIvhj/DAgkMvcWRSrGLRbO+aUqDrPfBHFgcg+GYIMM98BlZTtTXpf?=
 =?us-ascii?Q?cLKFmYDCKP/1LFgq5J2jVomidRXr7JWKnplUsZY2/YBPM0mEsPTTT4Ho8sZ0?=
 =?us-ascii?Q?iBzlDmpc7PjTQp4F1pdpOBdU84uTFpIJaJpyLaOt66q4ylRqUiQbCc/pIBRX?=
 =?us-ascii?Q?quTjPfbQ3DdtkACtKnuuzNQvu8iNWIcdcQZJy0TvMi5sh7eQJXa1FGwtDqGr?=
 =?us-ascii?Q?yQ946Nm9zrS78brjfbQNI8b2BNKouXrOEIH7RVNMJI8cFrzKZw6D8ScKHeWV?=
 =?us-ascii?Q?Lwq8i1azAzFzaStaVDtjRUNY47qb4IQokMjbJv1DvJbxBvYaoc/J48rX59+v?=
 =?us-ascii?Q?sQoDzVZIGuJ7m2iSvfUAjJGl4ZpEf/Dw9STs84yVwBApvbQOxuEoj/USMqpM?=
 =?us-ascii?Q?Bwq8zuWO28CCcFyPSCdVafOr7vltxjEm5UPS1wmLHsG1IKPtRU4rDeE8taij?=
 =?us-ascii?Q?lKy+4LpHJhTc4/vMbQnriDlzR/HEB2xNb+I6x5Lw0AOSHOczWt8lBFac1UDM?=
 =?us-ascii?Q?0BRWfblZzH08hZpBOyZKk+keJlQhL3+Arpk7I1eU9dm96rNyJ22/woP0r8Pk?=
 =?us-ascii?Q?fcks9eIKe5OcnzHbNxLL/UVKfOPInPwf8N0bRljj3Idc1/w8vAWQvxQ3KreC?=
 =?us-ascii?Q?mHlEOduylXqybbiyv8SDdBzGxv5UiqKcEwr0sE/IrW+uJ6/dFNAKyoTM+7bQ?=
 =?us-ascii?Q?B6+Qbke65keLRwGz7GSm0uIRIUN7mQe8U4QfLBIut7eqX4mptx3gXl+ASwIj?=
 =?us-ascii?Q?EAYrl2XgG/+ZRf9Vy9AYWPtRZUlA7AyqmXgmQUeSdTOmUsR0dgRE8npNEMNk?=
 =?us-ascii?Q?hqbFojZZGuolWADD30ZJz5EIRxDGZDbymzkT13LSDFH5pcS+hCXubs1/X9nG?=
 =?us-ascii?Q?FaVejNvgtlWTlWyllEU6ePv0MKrRAw0I/i+M177mZEnXYwDYy7U3eT0ED0PY?=
 =?us-ascii?Q?LQQtOhnFWIOdKPr50miJfPY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e9cd8b-8583-4e7d-80a3-08de1c81a9df
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:40:36.2793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HojBs4XpSooHaGM8W9aRqlu9wrWtfj+rWnsZrR7BhNtfiFc0GgO6FIdnJWXdEKxUuz/rlHPWAh25h9Yfiuo/jPJyDcmPs3VoHIlBETbjmTkiEO3sqf+FeZgfVIwYuGSB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9329

As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
bit of the VBENCTL Control Register. This register is mapped in the
reset framework. The reset driver expose this register as mux-controller
and instantiates this driver. The consumer will use the mux API to
control the VBUS_SEL bit.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch

 drivers/mux/Kconfig                       | 10 +++
 drivers/mux/Makefile                      |  2 +
 drivers/mux/rzv2h-usb-vbus.c              | 97 +++++++++++++++++++++++
 include/linux/reset/reset_rzv2h_usb2phy.h | 15 ++++
 4 files changed, 124 insertions(+)
 create mode 100644 drivers/mux/rzv2h-usb-vbus.c
 create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index c68132e38138..604f625544ed 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -59,4 +59,14 @@ config MUX_MMIO
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-mmio.
 
+config MUX_RZV2H_VBENCTL
+	tristate "Renesas RZ/V2H USB VBUS mux driver"
+	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
+	depends on OF
+	select REGMAP_MMIO
+	select AUXILIARY_BUS
+	default RESET_RZV2H_USB2PHY
+	help
+	  Support for VBUS mux implemented on Renesas RZ/V2H SoCs.
+
 endmenu
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index 6e9fa47daf56..9421660399af 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
 mux-adgs1408-objs		:= adgs1408.o
 mux-gpio-objs			:= gpio.o
 mux-mmio-objs			:= mmio.o
+mux-rzv2h-usb-vbus-objs		:= rzv2h-usb-vbus.o
 
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
 obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
 obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
+obj-$(CONFIG_MUX_RZV2H_VBENCTL)	+= mux-rzv2h-usb-vbus.o
diff --git a/drivers/mux/rzv2h-usb-vbus.c b/drivers/mux/rzv2h-usb-vbus.c
new file mode 100644
index 000000000000..55193debdfab
--- /dev/null
+++ b/drivers/mux/rzv2h-usb-vbus.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) USB2 VBUS_SEL mux driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mux/driver.h>
+#include <linux/of.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/reset/reset_rzv2h_usb2phy.h>
+
+#define RZV2H_VBENCTL		0xf0c
+
+struct mux_rzv2h_usb_vbus_priv {
+	struct regmap_field *field;
+};
+
+static int mux_rzv2h_usb_vbus_set(struct mux_control *mux, int state)
+{
+	struct mux_rzv2h_usb_vbus_priv *priv = mux_chip_priv(mux->chip);
+
+	return regmap_field_write(priv->field, state);
+}
+
+static const struct mux_control_ops mux_rzv2h_usb_vbus_ops = {
+	.set = mux_rzv2h_usb_vbus_set,
+};
+
+static const struct regmap_config rzv2h_usb_vbus_regconf = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = RZV2H_VBENCTL,
+};
+
+static int mux_rzv2h_usb_vbus_probe(struct auxiliary_device *adev,
+				    const struct auxiliary_device_id *id)
+{
+	struct reset_rzv2h_usb2phy_adev *rdev = to_reset_rzv2h_usb2phy_adev(adev);
+	struct mux_rzv2h_usb_vbus_priv *priv;
+	struct device *dev = &adev->dev;
+	struct mux_chip *mux_chip;
+	struct regmap *regmap;
+	struct reg_field reg_field = {
+		.reg = RZV2H_VBENCTL,
+		.lsb = 0,
+		.msb = 0,
+	};
+	int ret;
+
+	regmap = devm_regmap_init_mmio(dev, rdev->base, &rzv2h_usb_vbus_regconf);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
+
+	priv = mux_chip_priv(mux_chip);
+
+	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
+	if (IS_ERR(priv->field))
+		return PTR_ERR(priv->field);
+
+	mux_chip->ops = &mux_rzv2h_usb_vbus_ops;
+	mux_chip->mux[0].states = 2;
+	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
+
+	ret = devm_mux_chip_register(dev, mux_chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id mux_rzv2h_usb_vbus_ids[] = {
+	{ .name = "reset_rzv2h_usb2phy.vbus-sel-mux" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbus_ids);
+
+static struct auxiliary_driver mux_rzv2h_usb_vbus_driver = {
+	.name		= "vbus-sel-mux",
+	.probe		= mux_rzv2h_usb_vbus_probe,
+	.id_table	= mux_rzv2h_usb_vbus_ids,
+};
+module_auxiliary_driver(mux_rzv2h_usb_vbus_driver);
+
+MODULE_DESCRIPTION("RZ/V2H USB VBUS_SEL mux driver");
+MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/reset/reset_rzv2h_usb2phy.h b/include/linux/reset/reset_rzv2h_usb2phy.h
new file mode 100644
index 000000000000..881e5197e252
--- /dev/null
+++ b/include/linux/reset/reset_rzv2h_usb2phy.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _RESET_RZV2H_USB2PHY_H
+#define _RESET_RZV2H_USB2PHY_H
+
+#include <linux/auxiliary_bus.h>
+
+struct reset_rzv2h_usb2phy_adev {
+	void __iomem *base;
+	struct auxiliary_device adev;
+};
+
+#define to_reset_rzv2h_usb2phy_adev(_adev) \
+	container_of((_adev), struct reset_rzv2h_usb2phy_adev, adev)
+
+#endif
-- 
2.43.0


