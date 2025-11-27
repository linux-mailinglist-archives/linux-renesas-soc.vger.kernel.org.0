Return-Path: <linux-renesas-soc+bounces-25244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E40C8E1C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D8DCB350A50
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0603E32E15F;
	Thu, 27 Nov 2025 11:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DX8wd3oZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B909B32E159;
	Thu, 27 Nov 2025 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244207; cv=fail; b=q4vdyamVYjRJVuiog21NN0Q43H5k9MRtm5X4W23z/sDUD+8RbvH3tcG5Xt2R282OwK/0+B2orkfa3lXb2l+VAd2RryeUoNaS0aTs3MlrHff+3AAYB9Ppsz3+wDX392V4fNcF2n5F32o4+Hb6tRjTfXy36sXd2Ra3QEHFS5zRVyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244207; c=relaxed/simple;
	bh=rkUk/xTDPSLiDfFF+z1qUgDAmimPeRzNEDnB7beAZOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=caL2eB30qajUpaEMP+YD4T4QjtX6QOmF9uM97Ha/0Kox6d5h552Qc2KyyjFbvJA+d0n1skqODoUudC7HA9MxdmVvQw/YU86pEpH5YUphthdPN9Y1IGg2PC88DL6zRD/vH8EtkgVbluVpt/ka/mV/d8dOZV71zme/b0HITC9ijBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DX8wd3oZ; arc=fail smtp.client-ip=52.101.229.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neRKxjzaKA8cnvj5WSs2SmQ12Meo1c1uEccz8wcGE0jLo6EoPwb4tNmKnJN1DSo3OLZ/esZvMLSkcvZDfqHV9/PmcQEZUBYqbThi23FQ7v2QtrpPcsA4MWKVlZtU/qLxZ7d0LLA9cJkadSeDfdB7HQOpj3+ftKpVs83puZ9l6BxipHrKa2AYZ+zaQyPAPwg7tT89ZKKRRWdEaYPchKxh/MOR5cWpVrQFSAYORtY/2S8dFX28fpA9tMa9atZYF1HCJU3IxjgKZRaaD/kUKkMjmFCLPJPX/tr6UnZHkY6ksqhxlCVG70Sn3lHHjuYz0fdFSXVR23EmgvIX8EtFFk4c6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wjqK+t4/KpdxAqnfmPwYFt+uCV3ecd4XuitnJGj2As=;
 b=bJ6jvDtxMa4Y4+XNExw+xa9PumZB0ySbkiiqbJDyPUEAi4w6u/sIxpGWbb7xEHtkVGeXn7is6HaxCWJnU0MmkzCGH0bN3ZmSbOkPE6klvN2nG9CUX6+u9fxNizUbI84yLtOt5+/CcJM0t6UQgiHo7L+b469FCuXnDZpNWH+k+N7iVYE8iTpyMpAbSBTqMLoVVhvgzRAfQXUnSyqcasY3aHacrqGPv6kVjnWgaqnuhi6zrG5rbs4MZJgYfA/8q7AszDp2w5NMhp3Pn7V3EZ6p5iW7e9wFHJWR6daKFox8YVEYBWp4PRUWfWTL6tA4Q59DQhZC9N3w1DOFW231MDbiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wjqK+t4/KpdxAqnfmPwYFt+uCV3ecd4XuitnJGj2As=;
 b=DX8wd3oZhCaZaOjwPOTyivakkED82UmHpkDON9lxhbWusEplfozkwrgfAV7012vnioe4+0XesSPkoRiTlM7xk6BG15aXRxh07v9ySx4ZKco52LgMKZS67Iqi27+yjB8T8IVHrsUdxc6DkA2FP0OjF4K0hKcgL6Mv83Ql7Dr8p5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9632.jpnprd01.prod.outlook.com (2603:1096:604:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 11:50:03 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:50:03 +0000
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
	stable@vger.kernel.org
Subject: [PATCH v5 04/22] reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device lifetime
Date: Thu, 27 Nov 2025 12:48:31 +0100
Message-ID: <ad04a3f4032f0aeb865b5fc7fe036cc254389556.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: 079ba0ce-17e0-4bf1-6c53-08de2dab19b4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MiEDTCh310ZUfpzz6Y805Kl0ACdSYDmFOJRi3paHdXxI3/IERoOcubiiU1+2?=
 =?us-ascii?Q?jKLj81ph0n1iPDrmDFrm9uKpBjmpZ6I8341rnEJ4nXvMVQuYIHMoIMBtrssx?=
 =?us-ascii?Q?rRd+LSs5GYe67upJ5uUk+/8LoUaKQrfeTKSmLn6K/mfkWFDUfOTEJrTbI8jC?=
 =?us-ascii?Q?O4EJMsWPeFaIzwJ6iKPD2M69juuoM1ipg+9Dp6Qtv6IezHhSKZT2jnCrXQRV?=
 =?us-ascii?Q?LY3qxJCYZYW9TPf9z4JHF4ieY9GhoTQ3JdGQb0qJkChXkplOt3Th7vYAxeja?=
 =?us-ascii?Q?9kGWv9ydn/wSbeZew9/+YQmqAAeKzGkbcQH6dIbOVqF5YubjTQzRSLalPzjT?=
 =?us-ascii?Q?0oPa13D12Oy0rNWpSJ2pYuDql+1Go5mS6phtdbet72YI8EKuRnL08QJ1y5Ot?=
 =?us-ascii?Q?iKjtywb9Q4179AkoJ/uwexycJ1M51n0M6RoQGbXGczlAaS9/Byc3JBrLTLL/?=
 =?us-ascii?Q?c/VkpV6ySJufAIVkgTLe1CqtWIB07shY1IEXQDS1NBFfD0XbNg24i9J+3CBF?=
 =?us-ascii?Q?1rLp8VETzo+oxdo5i68c8ZzEeapo0Jw4xTVSlCaV5NqR2Mh2f6RkLS+5cerY?=
 =?us-ascii?Q?VljWSwKASxWq7nRIUuvy/ksaKwdmfAo2FTimFnlTE9XJ4j7wCBYd5Dw4XdKi?=
 =?us-ascii?Q?dD3ovxpfZH70Dc0uM+3vC+PIrbtjRToEij/yVxoqV7GzpoqS+d9qBPQxFkLh?=
 =?us-ascii?Q?rFh0M3UjJIfB5fWd46QCkg+jgeT0tSuXUSZmMpoI6jORU/l57j7xY//gtPjY?=
 =?us-ascii?Q?Sb4xEmcHFQ6kLhbt/h60Xg8P7EiOSDKvYdTNSc/9wQOdL7NnTgK43rxO+PRK?=
 =?us-ascii?Q?60KD0hbJxDrJupoasgnGHZcaviI2mlpW/83sxoebfbhWzVCYzb4X7RiSZRiL?=
 =?us-ascii?Q?yTY0NWEATUz8fbF2/KbjmBskyyubJtLyMFXclSenzW1G/2Ifb8z92BijYmMW?=
 =?us-ascii?Q?L1TQtYeHPlqrIzPj7IQGqflHGzEkSale31WrfLyB7j8PojCWFaOA5CBcFqsj?=
 =?us-ascii?Q?owq4q/irCovqNz1xZ9ZhXBTM1/mz0nXoElqWt3CtI+M56pRKzI04IrfTShb2?=
 =?us-ascii?Q?aOGpr/OvP7NezVMtA2fLfqDLwBhRQVhbUDiNxmjxmpmgkCqRNT7YbxOdxPH0?=
 =?us-ascii?Q?JlacltGjz3sp6K5RUs73jlvgL7+bDnNcAgvC3ZZEML2UH0uIdo/CXxcKmv0a?=
 =?us-ascii?Q?Oy7EfXImleMGxT9qQDc88bJ7qkHCDampHXzK3yQ/YSvCHqAOxFZq6yTFXbVA?=
 =?us-ascii?Q?9XJOeKa/YOFOwdMD4KrNF5EC3lXV0S0K9tLI2uQNlfSg3AesotGSzJel7xs6?=
 =?us-ascii?Q?fHfYJc8ubVtDRf8UEsSH6iJZOiufBot4AIcWhqHlCgrYw0wwNnOMzLOdin3h?=
 =?us-ascii?Q?CqcP2vOb+GnNUUicFoh+A+qMQ+pyxUqPAdkJOg98y2142kdShwnkXrZF+Ekn?=
 =?us-ascii?Q?H6WitfVxJKNSy73tPINKk5H7CT3F0Uekbd+G4BBYf1xHgXqSPvpIazoZXJcn?=
 =?us-ascii?Q?pm98HiqIxE0D09uSqob7DhSqYTGDOGbMEa15?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7fz465n/jgq59IA17qLmQtSSlURnT0i/OxIPm/fvH65kDeedGX9qEcrJ7nsv?=
 =?us-ascii?Q?5bPnPP+dD0/aWGRIpFsr2U+m4HB93wkf4NuBS8NMnLI5WMyzFhZllmI6cLkz?=
 =?us-ascii?Q?PZNTlWUHVu5BeRYh+IeSaG0J3S24kdLboNoZF7RFSnH7wmYKpTX3bluDZurE?=
 =?us-ascii?Q?Nfmm5NAy0Uom8DD2UcIhkZart9ccPP8lbYypzPjveiz3EBoxkMg76kE99poB?=
 =?us-ascii?Q?r3yx9XE+uOdq+1ip1r2KXPxVWNWFlT3g5XnGijDEdy8pWjijs60mBYJoGION?=
 =?us-ascii?Q?PFjmHZlhW6Wv7XYYGetN6u7xpyc4/Kkla5x3jAOvP5gDoVQbqszKYmS2R7yH?=
 =?us-ascii?Q?UgvJzSFekDXdGNd3d0TL20hw6FexScFkLQjsnhQf9BgN37av2xN9j6FvG1R7?=
 =?us-ascii?Q?6HyK774brKA3+TV6DM19JqEuK67SNTKviwRyL+SnCcmaDHShEbRmhSISBnWE?=
 =?us-ascii?Q?5ioEq+upgY60+98JxmnbZhdIwELSeaYiyaSDl00+ng1AlBb9LVX+NtXPQDGm?=
 =?us-ascii?Q?FWXWiullEp0XHQJJE2lTZ3f9XEfm5yhHNhqJXYt3xeX3+4VoBh8PlAC7xsY2?=
 =?us-ascii?Q?PkqkCXzDPhVeuqHrK0ETWw0h4+HuaHQ68a0CpngkCmslUJiwc+jXkKT5cnZ7?=
 =?us-ascii?Q?BqJgXAe/XM/1ojDK/QlCm9MxA2JjwzjvpPRSah2kJLZWaOLGf5gWd4Iqi5HE?=
 =?us-ascii?Q?Up04f23Bmbs824Pn6m9pUG6ug0WTbJrOJ58aqvpKo8fnuWLrYifxTxUofUW9?=
 =?us-ascii?Q?e/npj7KZKmxTOACPZshURrLjTf4NdENHq6cgM9yZfIGS6h/nxTRqRLVUOzkB?=
 =?us-ascii?Q?hy6ZoiDc513PgLegHqy0crovfK1nfPiDKIgsfeSJmV4YGOVTu4ugvKKBg2PS?=
 =?us-ascii?Q?8RO905aYbnI/RES87wQLWG3OBp3S7VLFabbLX0o28hHFLiv+4JmRkFRq/P6v?=
 =?us-ascii?Q?ZK3LbQsCCKHIUxLO+7Ev4sXvn530Ch3PUN9y5w9eyx6U9donSwRWtRMFOP1A?=
 =?us-ascii?Q?+whZB0YA7vSTmM39M1K3cgfsrYjkKSOgD0lB/8/32IfCuJ/i+nb2c/8FzbQZ?=
 =?us-ascii?Q?7UVjtg7ez1npZnavHS7M3shMOQTz1XXL861CycN6ppue35Yv05pJXBiSutqD?=
 =?us-ascii?Q?tVyO5m2uB+SDZHfsVD4jHIQxcEYiv8ekpRxZ7ORBUAXsvbSlHXRpUqtdI/eu?=
 =?us-ascii?Q?83Z1jpX766hbkNjB1t+eREFc9xFdmyXoTht5rMnGhLPPxwvZ2nELFprwYe7q?=
 =?us-ascii?Q?q831SfhlriT2I/ffibzR79mVfO8zEolxA6O8efHYVBgzqb8iGZs45DO+y2Tv?=
 =?us-ascii?Q?xYTBH5vwM4BNCy7JlFQXYcIyOb8pKtvJPD4cTK/QPdnrf6XbRxaf+/y8uqiO?=
 =?us-ascii?Q?VcGem0bdrrgy5HoI7lhq+4A9lEHxrYoz/290tmip9m9qV5hvg2WGzLZn/75V?=
 =?us-ascii?Q?7HncM/S5akSesTBupgodeB3+mViYsIv2pAROo6zwVhu0vgjzyIgOAB/AAAXa?=
 =?us-ascii?Q?p6Asl3S1uPQGgCfwu2EcE3Da6hewUkkr/vp45eBFVA0k6U/prFcWyfIV6fOx?=
 =?us-ascii?Q?cPPugQoqb9LwDzF96Lwa30uMiSElXduLkpKshhss1s1LOXLlaWAUtWrHmkm+?=
 =?us-ascii?Q?aO7+tcCmsDoP3o/ZsSNYlAI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079ba0ce-17e0-4bf1-6c53-08de2dab19b4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:50:03.0214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3Hun8TCGKXtiC+Z8yzo12wkf+1Eyh4RZLKCjpZ3RQj7o158ZzOQ+6D7hZR3av6HFMeJJgsIUNKcDvKCD6Iqt3h7DjSPZvcVEMZnlM5httI7gaMsZCwRACLMcFX2+ox9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9632

The driver was disabling the USB2 PHY clock immediately after register
initialization in probe() and after each reset operation. This left the
PHY unclocked even though it must remain active for USB functionality.

The behavior appeared to work only when another driver
(e.g., USB controller) had already enabled the clock, making operation
unreliable and hardware-dependent. In configurations where this driver
is the sole clock user, USB functionality would fail.

Fix this by:
- Enabling the clock once in probe() via pm_runtime_resume_and_get()
- Removing all pm_runtime_put() calls from assert/deassert/status
- Registering a devm cleanup action to release the clock at removal
- Removed rzv2h_usbphy_assert_helper() and its call in
  rzv2h_usb2phy_reset_probe()

This ensures the PHY clock remains enabled for the entire device lifetime,
preventing instability and aligning with hardware requirements.

Cc: stable@vger.kernel.org
Fixes: e3911d7f865b ("reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - Added missing Cc: stable@vger.kernel.org
 - Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().

v1->v2:
 - Improve commit body and commit msg
 - Added Fixes tag
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function

 drivers/reset/reset-rzv2h-usb2phy.c | 64 ++++++++---------------------
 1 file changed, 18 insertions(+), 46 deletions(-)

diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index ae643575b067..5bdd39274612 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -49,9 +49,10 @@ static inline struct rzv2h_usb2phy_reset_priv
 	return container_of(rcdev, struct rzv2h_usb2phy_reset_priv, rcdev);
 }
 
-/* This function must be called only after pm_runtime_resume_and_get() has been called */
-static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
+static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
 {
+	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
 
 	scoped_guard(spinlock, &priv->lock) {
@@ -60,24 +61,6 @@ static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
 	}
 
 	usleep_range(11, 20);
-}
-
-static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
-				     unsigned long id)
-{
-	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
-
-	rzv2h_usbphy_assert_helper(priv);
-
-	pm_runtime_put(dev);
 
 	return 0;
 }
@@ -87,14 +70,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
 
 	scoped_guard(spinlock, &priv->lock) {
 		writel(data->reset_deassert_val, priv->base + data->reset_reg);
@@ -102,8 +77,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 		writel(data->reset_release_val, priv->base + data->reset_reg);
 	}
 
-	pm_runtime_put(dev);
-
 	return 0;
 }
 
@@ -111,20 +84,10 @@ static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
 				     unsigned long id)
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
 	u32 reg;
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
-
 	reg = readl(priv->base + priv->data->reset_reg);
 
-	pm_runtime_put(dev);
-
 	return (reg & priv->data->reset_status_bits) == priv->data->reset_status_bits;
 }
 
@@ -141,6 +104,11 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
+{
+	pm_runtime_put(data);
+}
+
 static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 {
 	const struct rzv2h_usb2phy_reset_of_data *data;
@@ -175,14 +143,14 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "pm_runtime_resume_and_get failed\n");
 
+	error = devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_pm_runtime_put,
+					 dev);
+	if (error)
+		return dev_err_probe(dev, error, "unable to register cleanup action\n");
+
 	for (unsigned int i = 0; i < data->init_val_count; i++)
 		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
 
-	/* keep usb2phy in asserted state */
-	rzv2h_usbphy_assert_helper(priv);
-
-	pm_runtime_put(dev);
-
 	priv->rcdev.ops = &rzv2h_usbphy_reset_ops;
 	priv->rcdev.of_reset_n_cells = 0;
 	priv->rcdev.nr_resets = 1;
@@ -190,7 +158,11 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	priv->rcdev.of_node = dev->of_node;
 	priv->rcdev.dev = dev;
 
-	return devm_reset_controller_register(dev, &priv->rcdev);
+	error = devm_reset_controller_register(dev, &priv->rcdev);
+	if (error)
+		return dev_err_probe(dev, error, "could not register reset controller\n");
+
+	return 0;
 }
 
 /*
-- 
2.43.0


