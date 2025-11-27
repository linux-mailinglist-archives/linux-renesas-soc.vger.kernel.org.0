Return-Path: <linux-renesas-soc+bounces-25257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 304ACC8E263
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 622BF34247C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75B1331220;
	Thu, 27 Nov 2025 11:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HDfR+cjK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF3C32F74B;
	Thu, 27 Nov 2025 11:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244319; cv=fail; b=KtAcCj1qlDkw7BFIA1ZU0fUoT6PeM1LfSZ4J7yT8fwbLphbj6/uNhJ/WaueoHWNltZLS6SHuY2XqNWCPFySqUDL3xzv3HakJW903E17OHlXf3lihJxz6blhPXwE9iRr3OleSHWPw5wT8eNr7xS0XF1uMeoNkcjJanuxxq3dfeyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244319; c=relaxed/simple;
	bh=Y3TO8w+34YhkyfcG/oNHAQg3oT11kqr1b4iCiZ1daJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FDLnqOmiw7aIJZTIFaoK79KQY9QJVafrZmJHeO5XunEg89KQIihKkOAbs/VH0oLnsQ3BlhylXRuAdaXn3KnyBnonDJkW+Y3G3yj9ldNcm8mfC4F+kxmR7J2yxUOuwHniRScOinRon1GEAupSebIQQFFvkjGvAyvOvvp++xAPXjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HDfR+cjK; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtF1+SfKf/1MFAXivWmQ5lPy5V3rsJ5JQ+D6zRi3CYVVjtit/c7OpbterGnRVMtvRiHpeP8Lt5ojuPzOOkozAbubHMwDBCWrkQfcSBo8tOP+ktyujEU9SOomQYf/sm2R568w2fBFuiKpaZVMbViCXNVWzxA/mfJD6gVq68nru2tWNkk0CP5ZrOPhWJN/I8+T1aiLKGdnmKImIULhfvJO42tDIOv80OvtRDrp8e4xm0rWV1fKklySFMKyfmtKYE32k2WA9QLmC9oQkCuFCkU7SUq3Y8wWX273/gxOxbACEdxSpypuvXhS5j6NJHtxXpy5aSPXDMANCYGuFa+NKpt9wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYft51SzDKR7k9UjJ2g3aCoxGGZdWqVYlc+qG884LN0=;
 b=sGFg4rLnHT7r6zEpVUPtS1dUBMoQq+icSFr7CZ7qb4T01L+BQijrwg2wGFM9fn+6rtLIgL+wPXQYJXvxaqrWPfJxvUgsG7xY50/wVD6epHke9zeLdyO8pWjXPJfmzZeo5nYSK0evrCvJKDI88MaTXZRD81E5r40XCan64QLrqIAJBlSewRlmQE7XsMmtbOSEiZDIIlblZWM2V5H7xOOaUiHBX402oOESUExK4r57CwKJZphm/1EZcEMryQzCSY7rCE3bCXEVLqWz0Mu7WVyhbo1KGDLBnllyeRwUM+fR1igiey4H8e+08BF8gfdzTi2Lr7XOY3CpDf2cPZVO1im9Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYft51SzDKR7k9UjJ2g3aCoxGGZdWqVYlc+qG884LN0=;
 b=HDfR+cjKPjuaAAiUhLw/BdA+mzIQabKSDt/VeRC7kBmmRdFTneFPYtMsNbe5dQ0rR9OyU0ZxNzd1YZa0ocfCVvbmVRIp6zsSslnwan3FjcO8fzrxlDf9TC7gdcdCmahlpB7sE/L8MRGkJBQQ/sOy6z+cXEhJYPHrEdc8HO83UI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 11:51:55 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:51:55 +0000
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
	linux-phy@lists.infradead.org
Subject: [PATCH v5 17/22] arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal regulator node
Date: Thu, 27 Nov 2025 12:48:44 +0100
Message-ID: <f33b5566511a946e4e909854213e75c12d89a441.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 156a71a6-f295-46ee-1d91-08de2dab5c94
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YyLpUwY+jzHgJ8IYIa9ZoQ6HTQ/9U+/wiOfJ5gKG5dbzNnrxi2Al3DTtWsRN?=
 =?us-ascii?Q?1mPZezf1rIva/yYoKJOgYGKBH6FHNBnFwHRgE8p/2h0WVPzjXx9pvju3uRg/?=
 =?us-ascii?Q?3r8MSs6cFbNLeaOzVpGlcYtXyObwwcq9AYh4m8T4eIHwmlYCUJkAoM8MIaT/?=
 =?us-ascii?Q?7fEgQ2tggQ4dvtXVy9xpicYieinKc1KzFbtY82NvCltlK5fborLS+GAKVORa?=
 =?us-ascii?Q?pVP47w5sGFNG3EbJw5WLfp4VM1p9Mro/v0my6HIeQ21WCDcLKt/P/WbGVCXn?=
 =?us-ascii?Q?u9Q7OaOyyVlfhmTti3qtduFWLgB/L7uu5JaYaoBogZQGa7M4gvPNnJgoMFK8?=
 =?us-ascii?Q?6Q46fswacPFSVZAgVVyRFAJSSCJopDo1Mr+H9JuPK/q99BUb47TnhGMx7Nev?=
 =?us-ascii?Q?iHjGzzme2WVYsg1kfA3mhX21eVsTy/xmIfAtE1lbr+dynhGdSU8Sqolj3tQL?=
 =?us-ascii?Q?s7UY7pG4an/ZVzYsD3HdI5cjTKVT0P8iMRiBKkKVg+kb9qfJ+7MySHqsduY4?=
 =?us-ascii?Q?3Pa1SUCvEqsbQWpFMWJS3890Bs43cVMfU6x1bYNXT2hVHeB9P0bFenlTKhJH?=
 =?us-ascii?Q?2oE/jhD67/0zX8Fe55I0OMWMuEmogBOcy3u90q4+Bak4gHScZdavqcymmKkt?=
 =?us-ascii?Q?1N94agE9sK+gKfo66Dojuo/o8VuEPrMWp9mfiJjeKuyJgi+xwVenXgG5k9FB?=
 =?us-ascii?Q?bLFUUL0WLfvqvN36NZNOtp6JybhtvyN5w5IfkNBgYcspz+ufQD7DglMf4fr/?=
 =?us-ascii?Q?ILFcA8T4uG76MSxxtWWMSElJpuGxKmbpJdJ7MC3UYOV2s6pLk4kDg7U4PzYA?=
 =?us-ascii?Q?9LH34UFo8lFHgCP0Z7f/V2zVYPJ2PSWrInfUsGlyGUAiUroNcNVVLMcJgauS?=
 =?us-ascii?Q?vXwhtYpaO5u6icTj2klTniaFOrsL2J5mzz8a6sw/YUB8y397tS+owOqyp8m5?=
 =?us-ascii?Q?G9AVJn76y560nkezx9ck+MO/yEgRS3JRngkq5xsyhagVEdJBVce+zKXrmG3P?=
 =?us-ascii?Q?3SrK/JrCDWrWUaRWFIbhZrX12oU8jsyu9UYumOEEHnr5NCQmfZbLsq0/NaMO?=
 =?us-ascii?Q?hpQii4G/5cMSOXb2XXPxkX5Dom5ynSK6nyGbvHk+RH9m0v4gYIxDJCxNeyJG?=
 =?us-ascii?Q?h3yrL2Akt4cdMRdmRJ3mM2AwEDc+Rvm9W4CjkIQ/3jyuZ3TCIdML7yIfKabz?=
 =?us-ascii?Q?N1fsjmA3gKW8dxH3BYef0tPn4oIZF8RiwYyfZXVoxfbq690aJ2tDguOiT0yx?=
 =?us-ascii?Q?QqX0L0KdbQZhBAdVNyqE2AlgD2kzAX53bqwFkVafz2vtYSLLQLS9AnFfFyyb?=
 =?us-ascii?Q?G200sjAzP+EFD5WtqRkRqALtlbtRjfHkYFSyjTnSf9DFym96VF44/RUP+fPm?=
 =?us-ascii?Q?1sGmULOeAQF8Ky1K4J6Unxio4lB/Y99zf9C5skrDyy5aHrLiF1NBTjmIOMM3?=
 =?us-ascii?Q?QE4ypET4tN/guREtT7IGff1XyJRuS8YRAZhVTUMBTnwJYGpn559MJRmHhVkj?=
 =?us-ascii?Q?cWVgjWJr0wD3kHAXQSwLYqXd98S3Kkz4/koU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x7y/tFwqnw6pNCxgU8sQYadiokuNABnJpyjggQiihaNievJfT95XkwBUOMdo?=
 =?us-ascii?Q?klq4GxqHitSL+a6eHzyski0p/R06pUX8osF3thFBuQTnTzLVzb6R5gXe567t?=
 =?us-ascii?Q?b5n5W5nMvTYufxbGKTsDmlbJlWBepfcS33ONfZW5QSxREcCKoP2AR2v0Drrj?=
 =?us-ascii?Q?kl9K2mSpFrRStCGFt2+PGV39ElkxenYWGKaDvalrexrzm+xnwIIjjytWx/qK?=
 =?us-ascii?Q?jr+6Ei3D8SXte4PWtyXF2WOJR0S+9n9Y06cHDZZlbNMu1HJgoqLd7AFG/syb?=
 =?us-ascii?Q?ahApFnHx95CdcaXfhh+ZMXxZP7i/bBOFePq5vEUpNl5wfcvXpt/5HpwTx5Q4?=
 =?us-ascii?Q?RDNtF0zyn7whbWWtwhirW8gf6ucM5SNWpC1FHklS53ihvq075Lzuf22vWsfB?=
 =?us-ascii?Q?mKHbT38/aSHbChMhiAIATnMJMWnGbeGLZqby3AcnyWZ8NavzLmllc7zcWnph?=
 =?us-ascii?Q?+kLD4cGELJPielkMnIKL//u0DZ0u2sDcIz/ZwUcLH2cIxEq6M5nMFa2JMrtc?=
 =?us-ascii?Q?uKocJdGMSK6pYxR/cZ6FEFOjT/TBx7KGGjMEQzxFBWjwj2qGO9ekwOByGYzG?=
 =?us-ascii?Q?LfX4xIhnrcNVod0t6LzeIaY4uLtZawNZD4mK3XPeIzBdMUb9FG7amgiJukPc?=
 =?us-ascii?Q?AlQ3/EEO61caSRBzpMAofSBHISzIKRrAcB1e5+CS/c8ORM5xLlryCDtSe758?=
 =?us-ascii?Q?BH2QjUZ1nu7CQPdXeFtoudiMX0nLDfmNyhIujo+jH+YE98iAsR2nk0oXA8gs?=
 =?us-ascii?Q?oMVaA3Bnz8Oyl9Shuc8vD64diUZW/GppqapNh5slMJkUgd08Sxo8fd6Yc9jl?=
 =?us-ascii?Q?DckQ35CbgZFVt7Y0xpu5zqR8NrHE/MkaZlykwpLtZ/050QRYy6OR6JmA2TEU?=
 =?us-ascii?Q?jZBUCx5F03Za+0BmQSglssnkHbq+4rOryc1EYhZnFOrJM3YuZjeKgx2/6cNz?=
 =?us-ascii?Q?BefYxw67d9VGYps/E+nUwerfNXUOJ2skh/5NcTab2bhz4sckGt3CysNOUntH?=
 =?us-ascii?Q?R49hS/+wZ+YGZ/kaZ/cXN4HACkajqxFQKbUggdDFGsmDzv2fKTmOfbGUpzDm?=
 =?us-ascii?Q?U90OA0108A+r1gfhLmkke/pKq//pr+ttTlGCbLrEAEo7R81QgCW/5gt8XM+e?=
 =?us-ascii?Q?3N1rWSDArDpEuIM60HkWiTaj9WOMeaqM4a+pCSTckmka/sonxCl/u42MydhV?=
 =?us-ascii?Q?o1GwKoqpJWEwilWpIom4aD/0o9hC8crYtUnEPedW2Ha495WGQnUZpYVUc0OO?=
 =?us-ascii?Q?vE/U7JjlsS8ahBH14TAfQYcRvTfH3XMTEabs61alTcPCRGFVJ1Jq4Fye1yNS?=
 =?us-ascii?Q?yVQuUgdY/4+ohJO973fgmKKbXfry9B7UxbS0tEcN3SPlpeNovu5Tq8y4cwJX?=
 =?us-ascii?Q?o2jlN+aavfCDR1xBDLwA201QISD+5mXAJUaU0r4NH3lAPtch6fn2cJqmGHbN?=
 =?us-ascii?Q?znBU4nrSNA2uKu3fTlvj19HVrD/ox1ypasYEL0bOLocztdtDIIpIyCHfKOR4?=
 =?us-ascii?Q?MK0u4uBxNfoRewYQh63nZXocdD4WUjiIkzs+7pb61ge64wuuiw15MY+X+GZ3?=
 =?us-ascii?Q?SsoVpXXXf1QOumQ1lBCc2RfCXNSP7mc7m4VOKdB6x630O6Mg1WuNsoFCR3YF?=
 =?us-ascii?Q?erOC36MShhZ4ewdMKUph0r8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156a71a6-f295-46ee-1d91-08de2dab5c94
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:51:55.3035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCJd+I0ZX0Xc4kPyEBoHtkgGWeE2AkM87OwraPLVgndC/dirjbPVk/0XUJ2yNrOzrGRVb9gQs/9wAkbTpwd9Ti4kZf8XzoXdGK9WKIyAZ4Oq9rFn+4d4AtbzHz3SNMEB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

USB2.0 PHY of the RZ/V2N SoC can drive VBUS line via the VBOUT bit of
the VBCTRL register.

Add VBUS regulator nodes (usb2_phy0_vbus_otg) under the usb2_phy0
node to describe this hw functionality.

This enables proper management of VBUS for USB2.0 OTG devices and ensures
compliance with hardware requirements.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes

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


