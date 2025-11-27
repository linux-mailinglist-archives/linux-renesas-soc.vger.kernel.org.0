Return-Path: <linux-renesas-soc+bounces-25252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD32FC8E221
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99CEA3B0022
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A967330309;
	Thu, 27 Nov 2025 11:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="T8G41L4x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011038.outbound.protection.outlook.com [40.107.74.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9435C32FA31;
	Thu, 27 Nov 2025 11:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244276; cv=fail; b=ZtaaZnUwYwBMTXX3ByIe+CfWZWPa0if4JZN8lxYNQlrByTGkObZN4+R9pXnt1plmmBAodTAPFed+nw8e2xDS+qk2Lndo5i5TJ8/8rtIsGrXq30OLUWNYNVhZauojtsi0lMArvs9q4a8DeUeOOH3v19mz6VOjhq8SJ0fH+ogHu6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244276; c=relaxed/simple;
	bh=0pmBf2sGZ7BRNXeZKsrT8ylqKC0Yi5eSBmet3JxlgqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kEdY38gHcFFOMZ8My9sm071ZNngAzvT70RLSeVEIx5zFEoQ9KTdmxUvvgmAa+vg6rrqKbiAvtengpeBQkmnoPRjxuNSjRbNq4IlCXVeJfkFnKVa0KS3PciT+VIr2BFtHBHwHe8+CtEEKavkk/ewbV/64oV1oxmNQTH6gK3+blW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=T8G41L4x; arc=fail smtp.client-ip=40.107.74.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fj+1EkEKV2HdCyHJX0HOsuPGyMyDu9UMWbcuJNt71ft6nB24Q3s+JpaBHSvmpuUEBj8l9FUHqENsTsunvnM9xiHtUeYhc8eLyBLOaGeQwH5nuI8OsovNXgVRoHp2S5POr/riOkAWyULTqBBo6X9aSGepupJL69+5FWqkjbA1BVQqpojWPzPPGaSBx8XGfyQwGHJ1PfWgqbsgYc5A81nTdvOkvknXtr3a3oUG97krh+yGGS6pzzLz26HOFYGX0yxKFoMBK8XGcW3OoRdietePCkSf46l7lJf+2pr4y3+bAoF8hhZC1OczA5dc3NAmHQLqR1LJ8fM8seX8PCCuVpzX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGkG9ONTSVo7XTY/2TNluaFZ+sRahLPTl7kiSRfcYF0=;
 b=d/oZnvXqXVes39/sxJ5lTi4M4QzxuIWdvrnBbOhFHT9Xdx4PnQT/UXxwfGyqKsreQ2jhpmcz/rVFL4AYdg6X6zOm1Eo6APUgzCcfxlBaGnNQbEC5JnuEe37YuxvB7xp5yu3BWpLRoBkkMW2Gh3kEgWMbDK2qgr0vhUL8GeLA/JE/Zx3zkvwXLIYL5ceWqe00K3ZzJrXdb21cFpzDaxIFlYn1rcuGoerh8j5wSKivBTg58IwugFy++lJ6mrbuMvA8JtO31h59MYvtengVjU3DvKTrf8w19xoLqP4sZ0NrBfwG8G8ZQddgtBGFmehhSvgvI0Aiziu4AcNbzSwrQHvUNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGkG9ONTSVo7XTY/2TNluaFZ+sRahLPTl7kiSRfcYF0=;
 b=T8G41L4xVPcUP7lewZqLnhIHqhO/t9q7eOTFM7XVsA/FDpIPdnutXih4LgYd0RhkCSRR+qpSZv3N2HmnOMw37rp9HZfqrJjIf8Q9MPRj1QnRO6VRdfr2bwXI3uPicVQaa3gTCG10vVbby0/XW9rjakRyv089EU5k2PAyNlGXe3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 11:51:11 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:51:11 +0000
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
Subject: [PATCH v5 12/22] dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
Date: Thu, 27 Nov 2025 12:48:39 +0100
Message-ID: <33e2552871c7a93a75ccaface5491f994c6156f1.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: fa53cc93-3c5f-474c-d75f-08de2dab42ae
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KGrkCiVqPiVPW+28ud6w1eMgt6ZyaMIEs4rW0trypEJgDgnE1uMTI9B8DzMC?=
 =?us-ascii?Q?BLa42quOdSm3vxUlRvF2SVI0DYq4pH1tJSOdlxrUeRDdWBXxCuicwS+asmAL?=
 =?us-ascii?Q?ZJpMa8ep//FuwjwiUKm63TcpfAnMy7V400Urk3/+lZFzmfloOta8Z4ke968T?=
 =?us-ascii?Q?qm6KUXpFYkxfW9yJXMQUbkzZsnDuA8RHvZU3r6UsItm+PBBgTfFEYITOjhL7?=
 =?us-ascii?Q?TQX97fptsP/lCRXTqGn0AkGijXJNiugpyzdN5kE2skqcGalZ7YK2zkSZ/sZP?=
 =?us-ascii?Q?QWI0d+FfrBFC6mSaS/hLPcZIXBOmY63TF/tIQsUoNGCdBgMnegeYH6TQNbv9?=
 =?us-ascii?Q?zTnLLICRFEND1HRjFXJ77JQqrfqwQaRhAwj6/7cqcudsRhFTmtSYXvCIbL6U?=
 =?us-ascii?Q?ZJSQtfnqGH7pWb3Vlonbtr2BPZkMMnNryIvVf7z+4o8j+kx+BHq640+L7amx?=
 =?us-ascii?Q?8wBdRWoIA8c44C2fZAsxz+ZlKjm2AkMi2rdscoagDfxqXqR4asUA06n+LCiV?=
 =?us-ascii?Q?dYnr/SJWoajhn/BiOjMD/XI1Mgw+ipnculi3+Z9+nUCLSx5nKTV7zsjzwB7Z?=
 =?us-ascii?Q?r/PAiEbTysAlpvEsxL4a1ZwctGbINUmATp62jhBvrfrLwGskAfWYQgy1kulL?=
 =?us-ascii?Q?7qaytYNfBpgpzYtsS3xoswmBTupDE3Pu9BZWXQw5d8jBN3LQbwmjdlaxdIM8?=
 =?us-ascii?Q?3q/Ocsf22kFvXZNF0RvsW/DGT1zyANViBYaDZegxPvHYSy9QyM09Xud5+j8y?=
 =?us-ascii?Q?Ag6rsYoXV8wVqdPa7YTCitDTSLj28gm/YQlusqrNved5szL50cs/mFenGDrK?=
 =?us-ascii?Q?fJv+bgxk4LUFOhoBVsA88fqws7Eu+nSp+gqAExt/4wo5a/3Pn5gosy5JTk/u?=
 =?us-ascii?Q?JZcfjYoQPgugMdJjj/2VL4ut/n35BbgD4YlLNx4vjWPMS/d9KqnYLlVrhos3?=
 =?us-ascii?Q?hfeO7csW6KMZ/XWMsa5b+fG6K9a0Uv+Miim8NMhyJkzS0jVrzRUkAIfJQajp?=
 =?us-ascii?Q?fKw+ZEuqWT/JloevUNVKSSGqJZWPx8+0dWoImlZd+4BNFI0CGVWZqGsYAESj?=
 =?us-ascii?Q?Lc+sUgoIBJH3RJUdW426VevEJMsP41gO2iPnmSjUJJkWUMMxVzckbrYoZrnk?=
 =?us-ascii?Q?wr6pLJbQWmyWhVlh9CxnGKHlvxcAzuVzv+dVXfqXuAAQRDUg0U2TnxRgOzn9?=
 =?us-ascii?Q?S7x/LXufTnCEnr8dzfvVGqZrscU0M/Rh3mX6KD1jUutVY7un2oEKw13Qy7s1?=
 =?us-ascii?Q?mgdhcekUsX5b1ehmfwzpDJG1ltim8HnUK+MJlMNEXx5Qx7qFUrglrgeOBQ0T?=
 =?us-ascii?Q?AC7eR6l5MoV0BXj3ndV5xVRQogxBZ7ZUq5SHSYIp8ShU3fB/KRHp9ueI5u94?=
 =?us-ascii?Q?2N+y2j+X/mZ/6+y5gU2Ms+vEC70hrRtBzBKMeYu84eKI8udE6AVKyZJ4Ysf9?=
 =?us-ascii?Q?zUy5MORZgW6tTsgPBloLDxCiouVkzNp1g47V2lI9O4bT4PQ2V0K9ABnEl3wy?=
 =?us-ascii?Q?p29XsA5YR6zyIgh0ddYOkUaXLJttWx3OSxW6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0qnb7adKsj68+WWVxXMFvOaCtPyz5RxTS59SVrBkuGI4hrnOMo24NuYWCcol?=
 =?us-ascii?Q?w948zEvZObVzf7v0XI271PtWV+jH1bJ/GpZqjrAIYOQWLQME5yjcXs+dtRNH?=
 =?us-ascii?Q?zWsxsVmPwD0bjLeXkJnPr2IWW03G2Eml866L1fTAPH0dF3oLXDU6gXOClPiA?=
 =?us-ascii?Q?zSuDcMHjX5TVJnDH5GEsCWIP6OSu7AnEhlP0eU/U/3yl/gDbbCmG9Y77Cr9O?=
 =?us-ascii?Q?/kS7drFd3dY8rwwW/yQf05wQmhNO5lbBbXpimBk8mhjEVvrng7lliKcVz2Qn?=
 =?us-ascii?Q?t3P0C7VBJl+TVVkLbILVvXwbTKVPWR6b/SRORowpK+TCIJM8Sre5UWS91niS?=
 =?us-ascii?Q?bvPw57DJ9UvgqP1xAd4dIaH+FUzyUuJssKCk59mUF1axWAiIXbjd2CZhzihF?=
 =?us-ascii?Q?8ZG9HGRlywFW3VkygAW/OlHNRPWXEiqLCZGdTy+Lr26Wx1hNEaTmCEB41y67?=
 =?us-ascii?Q?HR5TchMA0TA8Sy2O9IYReK9wHEfsa3WeuCy/GAmAtUNtdG9XfmHt/LyK0RQv?=
 =?us-ascii?Q?Ejkg6tuXZ/+Iob0YHwYNY/4YuztroLHYhhinsu5MX+wp9h1YgoeJo0xiTbP7?=
 =?us-ascii?Q?y0/NsmkE5IX+5GVWPbu7FpM48/ZglwsGCm/X8PtnLMMjAU5TYaj4Ykj/GOWR?=
 =?us-ascii?Q?GAzq08tCXVVei3ne9Kca5ZPsN4L6XEKzZtFngolWUwcuDo+IP1rpWyMUrs37?=
 =?us-ascii?Q?F8WB4O5hFbM0Z5Qz1k5HjqnfKDu60dZhxQjBmJRjfLzEYZUTmPSvS2Ruegzx?=
 =?us-ascii?Q?TRVZHqGK6JP9QczVvkWiB+YpKfP0HbYvilqFL7ZR5roKyKIVUNmUXkgTMWEz?=
 =?us-ascii?Q?Ys28cyRd8NPQrycQ7l5AknEOEbT4FYDi5SN31wCAANF70GPSEMz8U4ImDVTk?=
 =?us-ascii?Q?eozBfGupQG8Xhk6q35ngdlm0EB6nmysn/ZZ9divxu+mNfEW9ZPKYOM8xbzzF?=
 =?us-ascii?Q?I2y8XI/l5W2ZZp9KCNgshH1t5lvb/MZ0O7PjAwBwi7sI4K90zOVn2scGx7Vp?=
 =?us-ascii?Q?xiZ62ate93SFB0Lspv58l7DWxlfF2F+9ATGs0aeRKbtX8+oxs8oHi01IG+hp?=
 =?us-ascii?Q?RoGCyoYFjI/WjXSvBhztw/SStvu2Qh8YEjyCqENZCPrl91o5JlRr9hl2kuYV?=
 =?us-ascii?Q?0UJdR34+K03QlrXkUDi0QRwI989XAKzswZMPpRyt+6acwwrZR5yFvO23XZ1R?=
 =?us-ascii?Q?N48XDEquGgrX4BLqsN6/mAbrugzLkA/q8BcJ86OmSGYsbQPvNtNuDyK+wf5S?=
 =?us-ascii?Q?78DxoeL8Bf9mmFqCSJhhHblKN27tITQj6dfoS6cmZawanyuGs0qlknl13vTY?=
 =?us-ascii?Q?MbIWWL9q1hxQkdLDPbr/1L6VfHXilj6BTK1BpvSh2gHBs2sNfyjJBmmVQlEf?=
 =?us-ascii?Q?Zk4vVtROeqNKq4Y0+qAU+tzLV1BNOp1JenRKffSFG7KXR4hOZMIDKVnRsRm4?=
 =?us-ascii?Q?TAjmMy3zjZJ3FS0hDIirQ319Tj6+5ZNcKhdZX1eFlpQ+BH0NhVa+eVqNZLhD?=
 =?us-ascii?Q?/W4+G4sK9zV4TAim7Mj/vfIrREPq9H8TYmBMF/9uTQm4aDNPyB+GZA8iGesL?=
 =?us-ascii?Q?bhQAa8pvB1493ysGm/yRyD92m93F7MPG6fAMzsJxWPWdk2tpbFtdbrWfo06l?=
 =?us-ascii?Q?1ClKbh3r8LX/vBhlI0N6we0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa53cc93-3c5f-474c-d75f-08de2dab42ae
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:51:11.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yfc8DcBTK0OTVr08b9OlL7AhVTmyLzOXXehuHEo84SwugV5Lwf0oDMN6Qga+uKKeLU8WYHTA1CB6p78h+haqQ4R0tgDCDDXyxedZUU2FuQm6w3pndXDuw2tXyQ3drggJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

Document the Renesas USBHS controller found on the Renesas RZ/G3E SoC.
The USBHS block on RZ/G3E is functionally identical to the one found
on the RZ/G2L family, so no driver changes are needed. The existing
"renesas,rzg2l-usbhs" fallback compatible will continue to be used for
handling this IP.

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

 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index 0b8b90dd1951..dc74e70f1b92 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -27,6 +27,7 @@ properties:
               - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
               - renesas,usbhs-r9a07g054 # RZ/V2L
               - renesas,usbhs-r9a08g045 # RZ/G3S
+              - renesas,usbhs-r9a09g047 # RZ/G3E
               - renesas,usbhs-r9a09g056 # RZ/V2N
               - renesas,usbhs-r9a09g057 # RZ/V2H(P)
           - const: renesas,rzg2l-usbhs
-- 
2.43.0


