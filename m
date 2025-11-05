Return-Path: <linux-renesas-soc+bounces-24159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E865BC367F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECBFA6614CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B843932F76F;
	Wed,  5 Nov 2025 15:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YkgiEb1A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7779E332EAF;
	Wed,  5 Nov 2025 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357247; cv=fail; b=RrSlVBS6vQ0MDe5ULmrf5iivMLsRhBbpUei6gX0FZWYYZS62GwmhMUcvhJdvdCpoU6h4+7IUP5JqwZ0YSGP2PkFLvUcWHmYW6DMTOEH6TfBfVMeB8vRFk+ot+3ZB+V9NtD8a4Mtc/sf4jvBGwkZF92x5s1SUOFI+AeQtQg8iGBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357247; c=relaxed/simple;
	bh=jSevRLywFVnJzl7hdDJAtw0PdyjdUR+nd8np7OXigqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EkJWS4qUZ+f8O0jtoXTRBWml9F2vQTxw5MPy2mscCSrLDxobDqGyS4EX2WnDEJdPcjv+INlY7REs2/i6jfr33hlRQCdReK9FKOEQXjT4SJyHAFyZFxzBvFaWT9iFWK0ZfDN43dBuJ1sX4Dj+pSrONI4QAUEYhpYNqUHe36UjRUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YkgiEb1A; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBQPGZpccN04DhlGUdpe6wBWYQ5kLG/QYO3UP5ZpFqczOwZyOOm+rF/lEy7R2VVjdGghJtNQUolJQa9mDHmXNsfrlw5R0p/z1qhb88WbiCHmEu92ozcUdtC2X4OB5y8LuafTf3H2YcsO/QqoAsdaDdsMY2dVYGxAPLqH4d/XyiwbvvP2Adn0ub9xMaJyAnr0mL/s6P9Ikw/x94xfNPbdePCSHz5MpUMBRmovXFB1xgiHhcpE5e0d5LdIb5onMS7pUswgjyCUOys/eQ3UKPEGE/45gbg8rJF12+/ZqGk06CEQm1cNO8qp9WrNB8KayDyVpgCJ/sJLKfeZjigMsUS9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Exhop1L0lVEAFPxGiUzny4d/uaJK8ZDzhOgVORLQx7w=;
 b=CxKrnN4osWCXjDkpQM6Sgr7c24LN4uNAg/YOANREpmPW8J/llAvD5qvBZnr/E7Yzmm0AuelSyWmMFpQ+D5RitrTAZRnceThUXW1jabmMTPIpdbeSyHW+UjUn/j4GaXr2R37z1NixCQt4vAd7E35RN2vdFeaAlslMghcb0JGQ/L1mQ6ZvaDpMyNFODjAqkX9rKuGeKcFPX7lR6OLr+NRKUXW9Hb107frzDjcSJta2JXNQ7TSiBKBNHkJfiF78Ts9CqHbhEJd2Ut2BUERf+bO0Ypa6qLaFKb6PMgbLd9TizVCB1Lg3Juub+MpkoRhAWps5SEyBaBsOH7R5yaqhQxt8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Exhop1L0lVEAFPxGiUzny4d/uaJK8ZDzhOgVORLQx7w=;
 b=YkgiEb1A0hZCRhvfjxIGBOF0nUeVrYLqdSRP5pGCT+qFml36AR4qe9WBZK/FICVTFOxXuVgVIQbU3ZhZpvU/v0flj6gmfpPOWctV5zHBd20rTx095S9zuIMNdDE8NN6TOgfCt/d62BVoMostb0OsaWteImuQipyvHbQzWSkHxtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9329.jpnprd01.prod.outlook.com (2603:1096:604:1d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 15:40:43 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:40:43 +0000
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
Subject: [PATCH v2 06/21] reset: rzv2h-usb2phy: Add support for VBUS mux controller registration
Date: Wed,  5 Nov 2025 16:39:02 +0100
Message-ID: <39923e450f1ce220cbca28dcf6b215dd9fa79dde.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 53bea4d0-14a3-486d-297a-08de1c81ae3f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GYpM+NvB+P3K2TW6CqbHgLcuuIz+ts3Hiu0ht7CwOjcQuUAPwA1xdDwEABGH?=
 =?us-ascii?Q?caNExvj2tgfi9c1vIdC1eFxc/P9Lxu8sbQuJxUNesJrnf0k+pYUF4/0F3d9/?=
 =?us-ascii?Q?NGIDJcmertx4yAtZO3igI5mu82Aco4ksHivawI0dlTBEZKcdBe2CUNKTuGy1?=
 =?us-ascii?Q?mOjM4OfIaKIir/PFsKGaeHicAz29oNEzt48oHON1f58pbQBG4EEnUqwFauS9?=
 =?us-ascii?Q?P+xvoxbFOj0aMt2y+nyU1S/6Kwit8vwJs9J8+qTPkYFhC+ArBDt3QURJy/ku?=
 =?us-ascii?Q?/449AI07zlbDapX6EoE57kBsDx36YxN9AL7uAa4cyKCO1MtS9bE+gIm/q2el?=
 =?us-ascii?Q?WAuQumtYwB28rdH6/Lmo8rIyDLCiUpb22ak96avjnBen3UKIFDypW1GR/SSp?=
 =?us-ascii?Q?itI69c0wJL+BeXbB+5kV8C40eHHL4Sd0KyVLxEi2l+k3TX/lDtxgJmgAoF4z?=
 =?us-ascii?Q?nTg1+kYHahZ0yf01Ggl01PyYctT+9ttfL3BHcgEfe7E1eE1/EH5Dkl+63HxM?=
 =?us-ascii?Q?oezUduhbRO5TLFL5DZkWaBkdMj57WZhkE/t7skTOOsj9RM1j9v6aferrBBRR?=
 =?us-ascii?Q?PhyvFt9GrTG4TSWF9SfrLtEUJj/1tCp6CPVhkLDA1Qp99dhAHSrt/X26/uZz?=
 =?us-ascii?Q?he19oR4gU1zBnuUv12fTHRwXGuPQUZoacMrCXlF++QqmmTCIxbBgFw6/5H13?=
 =?us-ascii?Q?V/Y1J1+gSNzlKr8uMt4n7ykvsbDKonisvpe3z2TLigSznvlRX4QOU6+lqKB7?=
 =?us-ascii?Q?KKVARjJ3izwoPz6qMQZsL+R9EgYWEzz03H485qlntuaD8+FmdDwwxsCp1pXk?=
 =?us-ascii?Q?AhnhDFkdlFtOYvDIA2tJnNmY0RxNTESoEC5ohc7Wt8JfQpVfgaLSbwY5uZFd?=
 =?us-ascii?Q?joKYlHIv1h0HSwAzMd7Uyjzmc30JHKyrAp1Ika+F1w+KO6DkxXr9lw1KVB9+?=
 =?us-ascii?Q?Oyi4+FLNmgd8AcVl9aaNkvlORhs4fw5oLVneN6aJ9djsXhe/jn1tAHtAkEop?=
 =?us-ascii?Q?cNiiggqbR/+eRTQsqIuGci9Ig1B4UI0v1O764SszPxTuYwHh+f5XIPnZzLR9?=
 =?us-ascii?Q?+WJXSfaaONtwm2bSbBbOvlMz2M2qRgaiNE3Z+QbhkjWXLNiMNU4bv6DCEXSz?=
 =?us-ascii?Q?ChVjJKE5wO1ucqp42CzXtCgekrefI/zKysngiquc+JNyRgut8rX2QyEenQvq?=
 =?us-ascii?Q?CXyjafutwSOwajjaY8d9OPIy/POS0XEkezUIhCE5NQpw7GF9rxDUnvDzwoHF?=
 =?us-ascii?Q?oCxQwpR6Bl+BGZN6iau8htn86m//Csc2HJCq/iPTmZoyF7q5ihYWq3nrav/B?=
 =?us-ascii?Q?H/fPMKCOyT+a7GlyEYrV2kEdY+1FSmQv/VdlgGZYZkysUGXKIV67WHYpT/Ss?=
 =?us-ascii?Q?VDLoE8SClH1/tq8bf/F+mE5UfYi1+GBhIqNTFS0wlFhZnm5tj/o3Oyc9O37p?=
 =?us-ascii?Q?imfQAWLIUWL2UxAvXlQNNYP8kGzkcMcOXba+UixWsMgOP8bQ+ajSiDKJhpTB?=
 =?us-ascii?Q?LDm8SbTgndtugi9FQswE457//ghKuWF6W5oI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bGRmsTlm072D2OVrhh7+v8bjm86eE7emojTW9LeEHeZn1EYPyo+yeaCb4pk5?=
 =?us-ascii?Q?mQapdA9wYA8sE4buy7DCxOzWPuj7FtAOs6xC+FXZy+od0GK6hw48yAzoL8Vy?=
 =?us-ascii?Q?jkHEH46n2IUiWFDquDG5yqdoCy7hdRM6ir8To6A3hFV63qIrUWng+w0dSHee?=
 =?us-ascii?Q?UQFuy7UqctUauwtMAn6nvtkZQY7ucF3/Sc1/QhtToKRrMVxrUuBul8IgdGJz?=
 =?us-ascii?Q?vaT6LMUBSIZKqTLUSycA2wtqbbImu6f/1vhoOfcaddlm/wW8952t5GhFM6af?=
 =?us-ascii?Q?wcPSY5FbhRop8UKD3SeEn4GLQ+yTxbCsSNl06zfNSQU54Jotd4lY37lLnLsr?=
 =?us-ascii?Q?icVISMkUbVcOC7pFgr+QkiVIFI4hfuNa8M2SUm60N5OXABcjZ7MDKdbI3XVc?=
 =?us-ascii?Q?05IE46cMXh67O6YZvoojPInZkEo2rvdqmaZu+mTAet/l7J5OoUYAuCufMf78?=
 =?us-ascii?Q?Rqpd6XL6uASW71y+vPWWJTVY6WOqsqO3j3Rs/vmHwe+07yBnnmOoW1lc6Hzi?=
 =?us-ascii?Q?kPBRjYdCUq8dLGkC1ikoMTXOik61kDM6ax8WFGPC1XGT++k3Cw2nFihZylW6?=
 =?us-ascii?Q?83TYOcV44AhGNvhzmnGuzBfZ8GwzUrAxhgZ7oXV2n/rCJsMmPSUyus9Dq1H3?=
 =?us-ascii?Q?YKnFWZoa4RqjHUg5pX9VAN5jnkL+VCs68cT5m7jDGkuNzE2YiuJbqhZklUxx?=
 =?us-ascii?Q?g1wiFHWd/DQWXURETybgnBQSJtFG2dFCLqdVwCpkbgaYDP3j64p6S5cJvk7E?=
 =?us-ascii?Q?qjB0fJ3+tpgV+x12usqiWu3mexw/0SDPzIMSaTiLX1FogdHNlVxbN9R5jQwp?=
 =?us-ascii?Q?xWPdB86AWGzxEe5N9ZPdzaz603su+XYBYZ8CTN26k5vL5sR9WvXaPLTd6ivf?=
 =?us-ascii?Q?TnOm1NLx1SgY51eAsDG8kpmgSXUxucKisBdeZr6qWYDZRa13P/NsMx18IfC4?=
 =?us-ascii?Q?ux+Xz69Gcq63fno3IetPTfSxuxT4/hXkkQ+TWBzxVEJenG6d5c4QMbV8FlUk?=
 =?us-ascii?Q?nvK+/+4fNznI7opdg6zT7ubnDG4yz2irhCpAEjDfN0O2PpXqmL1GcQhULwls?=
 =?us-ascii?Q?cCXArxbyTzoZp9Uj1KldnUuBbCBCrarfR3UOUILnKPdAvC2VdnMBR3a1qdTL?=
 =?us-ascii?Q?kBENCjsA5uVyto979NI4ikNFn6fJsqi8AZrz/bcCyxA3wJHJOON1sa1TBZEf?=
 =?us-ascii?Q?U3OApkELF9En4+IltviRtfNmKokoFD0iBhPEcthWfZo37IV0cCkXBR8QMjji?=
 =?us-ascii?Q?VPOkHJXWkII1I4pcdf6CxTnYhP+ENng/cHeX4ry03mYWN2WWpzmEoj6W/ZPe?=
 =?us-ascii?Q?mHm4NEnYoXevnSw2a2Jkgh3PxHQYXVXNGRV42mJgW2EJ5qUth1izmXReECwI?=
 =?us-ascii?Q?Js1RjH5tIFyjhrAHX7kJ6iZZjfHMp8uKyuNQdSRM++dhwUKORP89aeyLx0AA?=
 =?us-ascii?Q?Apfwck5qtPr3cmW9aydgG0+o/bXDirUTtObcHtT86abRHoGi488WKoJmv84R?=
 =?us-ascii?Q?t4yqKCc1W8CaNdkUDybGwoP8q6kZAF9mYg5tdxRS60irNfIvqsH3ztVgf+uv?=
 =?us-ascii?Q?8w3F4BmViWODRxv6G66fSagX9yEKQmgYv0XNmzHnIfhdQqPHTltYOrteQOQK?=
 =?us-ascii?Q?ewfwyKydoAp4nP7S2qUyiSM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53bea4d0-14a3-486d-297a-08de1c81ae3f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:40:43.3914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRIDiOvZqJNVk7qre/HhIThDF2YfXba0RXr6nFlWsd3vvkHyOHkPR3GRMW0nNxgPiYm6Vlp7PgWi0hfmZGOFHDajnYZe0xkLdl7n2dmTaEKGJb+BYml0cdNI4vHq/7aO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9329

The RZ/V2H USB2 PHY requires control of the VBUS selection line
(VBENCTL) through a mux controller described in the device tree as
"mux-controller". This change adds support for registering
vbus-sel-mux auxiliary driver during probe.

This enables proper management of USB2.0 VBUS source selection on
platforms using the RZ/V2H SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch

 drivers/reset/Kconfig               |  1 +
 drivers/reset/reset-rzv2h-usb2phy.c | 65 +++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index e1ae624661f3..f54e216ca7f6 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -255,6 +255,7 @@ config RESET_RZG2L_USBPHY_CTRL
 config RESET_RZV2H_USB2PHY
 	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select AUXILIARY_BUS
 	help
 	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
 	  (and similar SoCs).
diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index 5bdd39274612..6074aa8cc13a 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -5,8 +5,10 @@
  * Copyright (C) 2025 Renesas Electronics Corporation
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
+#include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -14,6 +16,9 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
+#include <linux/reset/reset_rzv2h_usb2phy.h>
+
+static DEFINE_IDA(auxiliary_ids);
 
 struct rzv2h_usb2phy_regval {
 	u16 reg;
@@ -104,6 +109,62 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_adev_unregister(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static void rzv2h_usb2phy_reset_adev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	ida_free(&auxiliary_ids, adev->id);
+}
+
+static int rzv2h_usb2phy_reset_mux_register(struct device *dev,
+					    void __iomem *base,
+					    const char *mux_name)
+{
+	struct reset_rzv2h_usb2phy_adev *rdev;
+	struct auxiliary_device *adev;
+	int ret;
+
+	rdev = devm_kzalloc(dev, sizeof(*rdev), GFP_KERNEL);
+	if (!rdev)
+		return -ENOMEM;
+
+	rdev->base = base;
+
+	adev = &rdev->adev;
+	adev->name = mux_name;
+	adev->dev.parent = dev->parent;
+	adev->dev.release = rzv2h_usb2phy_reset_adev_release;
+	adev->dev.of_node = dev->of_node;
+	ret = ida_alloc(&auxiliary_ids, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+	adev->id = ret;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		goto cleanup_ida;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		goto cleanup_ida;
+	}
+
+	return devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_adev_unregister, adev);
+
+cleanup_ida:
+	ida_free(&auxiliary_ids, adev->id);
+	return ret;
+}
+
 static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
 {
 	pm_runtime_put(data);
@@ -162,6 +223,10 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "could not register reset controller\n");
 
+	error = rzv2h_usb2phy_reset_mux_register(dev, priv->base, "vbus-sel-mux");
+	if (error)
+		return dev_err_probe(dev, error, "could not register aux mux\n");
+
 	return 0;
 }
 
-- 
2.43.0


