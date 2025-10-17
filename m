Return-Path: <linux-renesas-soc+bounces-23210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0040CBE7D27
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 11:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2AC66E23FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 09:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCDC2DC32E;
	Fri, 17 Oct 2025 09:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ceG2T7pc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D5C2D877F;
	Fri, 17 Oct 2025 09:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760693605; cv=fail; b=iSzSmUfHGQ88rfPL3J7AcfRaeGcuvVvicCH1hQsLbPffG5uF808qWCtoOcGTB5QecONYEdKLlz0IzZf7hs6OE+kezZQPD7VFp0spbeYeHXOr0E3NJAQyaLWt7/SOeBfLjHK/ONV1JDd68eM5q062oZReSWTZZZovtTH/82PYxEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760693605; c=relaxed/simple;
	bh=URdFbfaDwD6UYWorhzCkbqL0S+PhnJnvhZviwhRyoh4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q7a3KQARPCYOnMx7R6DH8KQgt7kHOmj51sLD7wdVy+Z+SBQXA7qyxJJuTCkA0vPAzA60MWbzt1e3HTGsRHjAm+UR+kzy35lftdsZKH0bwV331mem/2NAXKPoqRhvTLPzJaAyiZQN31/qud2piLbvQgCozjgb/UsXb3Ku5b8plcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ceG2T7pc; arc=fail smtp.client-ip=52.101.229.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8Y0NuVghy2IQnlnFKMcmPly4icokUfd95VaYO5fCpgQn5n83uj5xQcfGwXMhhhpsbKPcdBn/DtTDrh17ZRrKgAveW/sUG+UtRVkRs8zRsdq2Ylm4/efReFugMrbUiCzwUES+odPShXwT/pG+Uc3oBu0vV0D2tNVK7fgY9AJStSqrNpDQQG7F5JFHQ7ClC2ZRoA/NfIh98SNkjMn54Z6hPDYqIpAO8PYVSK9+vx1f3p/8+bVKa/ZGzUbT6M7V3EwItMdHotZpXEpgzvVnjgdaEY/8gf1BjaQB47JarHQSsPxhR2F9iJOPjw/Wd0aLb1+A8Le7ipgHeH9AzsgzFaJdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUmQ9u2YFb5WTRz0diUempdxZPukisnyR2+LiAvbwDo=;
 b=qPeWG7Fz14q6jmddggS+JpLwMhklYKS4Bukt9OViQuY0XxSs0uDaA4f1H4GqU6gM+uyxJ918fJ6rU76w0eYI2fiyVbb48xH1s9a7kBAbme2cSdDYUGwYcGUGUU/HxoJe9yjPKufY+6tfzX5aKUhkkvKZuN9crK28yloQ5jYigrWRqh2kI5qWzxuggs6quJvzQDtDbpOEj4v7dCfpEOOwJXyslfmWp4s5PXe/QqesvcOLyQVDqwcYoP2HueF7AlQx1vGTpvVttcndZbhdiP3/2lSpxqC6wm8PcxcUEDJi1GLpXCAhtsw2a0u1+5wfhruR7w1695CSPgPGvoSds/eTaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUmQ9u2YFb5WTRz0diUempdxZPukisnyR2+LiAvbwDo=;
 b=ceG2T7pcMywJQ/jVKuWjbbbbEieLuzZelzLVkNUiaye0pu5624GYsLkvFXcgUHdDjTgCUkxLBJYo8Ygxc83G072jzRdyiR3e8fG5v2FAfq37yngR0lTh/VEisMkedij7RWabzysgExH2pN2wx0u8hDp5XX05kB1sLN6YN5uxiBI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13062.jpnprd01.prod.outlook.com (2603:1096:604:335::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.6; Fri, 17 Oct
 2025 09:33:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 09:33:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 2/9] phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver
Thread-Topic: [PATCH v3 2/9] phy: renesas: Add Renesas RZ/G3E USB3.0 PHY
 driver
Thread-Index: AQHcJxsB4WEAEevS/ki9ydDHX5kXSrTGQ8KQ
Date: Fri, 17 Oct 2025 09:33:19 +0000
Message-ID:
 <TY3PR01MB113463C03C6860C5B945BE52586F6A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
 <20250916150255.4231-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250916150255.4231-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13062:EE_
x-ms-office365-filtering-correlation-id: 5b88e284-011d-44da-186f-08de0d60356d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?D8VuDKveIxqJ97oVNltYxst5narRG8ewzu/CDLSREY+Je+LlJ7uQ553AIcAC?=
 =?us-ascii?Q?hTmNpn2Z4Z0ecsB42Fp5Ct6bp2TFMRYny3ztT3fU1FSli0Iz1DNLJgWExSO4?=
 =?us-ascii?Q?Pmi3lDM7zbISrhm/JbufnfBGgdDjGS42/dl2U1dppctFSlO/foT6IroGJ0TN?=
 =?us-ascii?Q?iYo+gpGG47HHwEZuEmJfQrRbWw3/YU2AsU68C8CjL290EC+Tg5g58CA+Kaxz?=
 =?us-ascii?Q?0zWPDBoJ0dDZu/vXZn/Ip39oxiTRsoR3/wykeWoxH6AwjbgHy3Ih9+XQJfqx?=
 =?us-ascii?Q?+LhmFJ6xB9jlwbTbI9sIi434m4MDtz2T0RBkvXFfGXBVnv7Jp2y/O9SO4kvX?=
 =?us-ascii?Q?6kXfIuzL15RLYLLOvi7Kf8acbVvrWT0IavbITKluV4UOKDJTCjtBr0p64lK+?=
 =?us-ascii?Q?lnOrVqGWFNpxLA7WwA3BiziYc9n1Johlk2ay67U/rN741UxXklFfPqia4WY7?=
 =?us-ascii?Q?syM86ZGaGN1G8YlK1EJbnvtYwaeOmsuMaQJZPNq2XgRRsd2WTz1UdU2Q/K4b?=
 =?us-ascii?Q?f27pzknChvN6X3TmIq9LhdpeDfnyuE7CBaC3rLtcqUEfvGhgmC5kM8oK8GnI?=
 =?us-ascii?Q?Ysm3bhlrvoPi+iJpdYo3kyNNGyTYzIYRGxqe6NYuLzW/kqnyZol8a4ozS1Yt?=
 =?us-ascii?Q?9MKA0Hszex2Yz36E9g98VmF2cL3qWZ+6/7fe5bignRAkkH1mFg858tf7umzs?=
 =?us-ascii?Q?BoOEGyzRxxRmDrTbjq7clS2nBQpqeiOY5LkEvV0WKFtaqj253knti0PA3SIy?=
 =?us-ascii?Q?hDyT+/+SZgD98rMEVv/dGm3IoBFD6/zq8Dpjr4LT2fBr2Q+tdchi0KeUWb4u?=
 =?us-ascii?Q?GnlvJZyxa29bOQGoVUXIznj5lqhx9j6cYmXmGgHS9a5Cp0vdFi0FHQXLR+gI?=
 =?us-ascii?Q?kPWIec7Ae0M0gLSJRo67pEDMWLdSRPJUbuS86nLgdDrLLOM+YQAcp5wR8rZf?=
 =?us-ascii?Q?Znpc48JrnEOQJYLI59vfGBbAl9K168Wv+leLsn1B+6X1bd8O8Sif/ewr1wzl?=
 =?us-ascii?Q?uF5OTIVBKwgXuYTJpEWOXoJU+cVTXdy8yOtCb0/ojlte5o+o7AY7PsoPMfm+?=
 =?us-ascii?Q?OWMIgoolNo667gn0tg0dgjTcBD3Ssb5znz7FL4HVVdJ6hoYThRJIZ6sKyrHK?=
 =?us-ascii?Q?AnPk70Vk01c9IeMxRp4B+Xd5o8X//7JzZ0/O6CFMbdkZZfnOJAbx6zHItas8?=
 =?us-ascii?Q?NDvAdneRqAQ5j7PMOeB/3RM9rctMSUatctSNg2LdB9dnfCOxNvUCxg8EmGrc?=
 =?us-ascii?Q?ePnsOhpW8ERqYDJkmIXAc6qJBTWkMK6z/BoF/5XBf0fQ/ndKHS0eruKYcUOf?=
 =?us-ascii?Q?JLvhxUdj2Mh4Vbtg3Ck43kzQIIg1U8eW4TYWnhg8XDvz20TgUw/YBWeY3qye?=
 =?us-ascii?Q?OEIeNj0YUPJBsrJiAtXhcOx10DVrzPYmHykGqzsh5TE//B9pm7G9oELjB6U8?=
 =?us-ascii?Q?sqA4IkVSqYBaI9e2kq9jq8zRMBMLYBmilB4ynVKibUL1oa5P3nsFwbdG+zHM?=
 =?us-ascii?Q?R5oy6hAcd+D3psOhrtcsEduNezCqE6OMqfYQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sXR+2Z2JSgJyTwK8ZVBUrvFG+Kjo4IdU/hTfcm7JlEaQt1Q5jTQemNdOXRQD?=
 =?us-ascii?Q?MRICI4kAtOiV8Bh650D/vc+nR1IciVTgmTkloidmWEiXLJUhJC8VJv3YeLpR?=
 =?us-ascii?Q?Pq3xzdiZ4Eu3tYe8DSJIkp0BrgpQFpg/+6Ki6J0RFne3HyRp0dUVnpL9fsr9?=
 =?us-ascii?Q?NBV6K8IKrr3yv89hQoSQZ3HttMqnfUe4xedO0XzbNk3zCDKf2cwKjk/sM3QI?=
 =?us-ascii?Q?QzGmLfRmOk+dMP7pkn1m8l42qkPFCDui2a2Dd3E7RsrfhZ7d9lqHHGW4zdOp?=
 =?us-ascii?Q?zfFcANxHhpJLjuPnGTVRG4pSOjjoz+sN5op6M4DimsIU9NMsX/jQCUH/sWPk?=
 =?us-ascii?Q?0hErfp5c74+2GtnhFOByeGexN1pLPRINUgawmuqLggxKtNdMLYhYphLnidhg?=
 =?us-ascii?Q?oupdvphdnbM3NVISMqzqIO/sSh19MQX3D8XV4dA4hi7JXIzK7vlExIjkuDOo?=
 =?us-ascii?Q?8Fda8wQogMXlTquB9bvxK7xv27Q5evGuPJ6vmM4RpN3rhXWEgPIvcm5zKOkQ?=
 =?us-ascii?Q?mAk5IJ8t6VkrjZWXy/CcprnPl+4IrBZviz9da47tbrX7W/W2xM2BuvkvmvOv?=
 =?us-ascii?Q?QcoQZV7gC+izBgXYQ+wa3zJ8Ci8DcNcOEK5U0n8LAJCXS54BR/Jf9DB/WCbp?=
 =?us-ascii?Q?PltcoGpktuZIPG6dk0XkYL4HHsQgrpmC/yQ1u7iW7mM/wukn/uUvQxK4R+44?=
 =?us-ascii?Q?Y2kAtoJRThayxskKarBS2BN6cZJeoW6VBWIAW3O1MzDtjX7mY8GMm2jRp1T9?=
 =?us-ascii?Q?XFy+zYzfnLknL5MWyVV5imehbuuke5gWjURPRgEFElVRsDs0cIwLXlcG5M6i?=
 =?us-ascii?Q?eiurAAbiD57LvP/KkdMHxEkxlUoJ+0W/+OfOW9Wz88PxXoMhEaG1EYW4QjW6?=
 =?us-ascii?Q?v3eQMXK/mxJH/HjO4Q7exiqF7zwI4QSDNrJnnuK78bucQV30m/39v1RM8VWo?=
 =?us-ascii?Q?zVQnGGhsjbSoQWdQAR0bPJTDap3LzxSUnprldeojGFinmQU/jeyqZLfAysCs?=
 =?us-ascii?Q?HBLzKxax7PGszjSxzgR/6PCJzJJNLEzk5DqyVCLtZDApkyfKsqKs22ZeXvky?=
 =?us-ascii?Q?QSuOND4m53E+8yr7ajXHCtTuZwxJwAqJJ/QXiVun7FxV7jYWLv87gxqBWMQ4?=
 =?us-ascii?Q?6S4SpcVO6OuRNl1WSx3q4mIi3QC8hnTKklvkLX0EAF/DPZ+nYVMTDS4yPprw?=
 =?us-ascii?Q?re4ktgTUw8D62a9c5Fjn1A+lht6vbeX4dD/3ZSMe+INXZL2LixhKZvN1cuke?=
 =?us-ascii?Q?7EUJWDPjMA15JRi/iYJ6qd/tb+PvR2a8WljFswEGgwbFsTHLMGzjUnHtoQGC?=
 =?us-ascii?Q?76d92wWlmssU9NYZ8z5Pxg69Qv3HltPGPPraoG/8fKFhNfq63ErwOuKazi++?=
 =?us-ascii?Q?OeyjiTlKl2s1PSc238r/cU6/aKrl/UnQfG3o8EUB+uhk5zRu08+bDEVUFeFD?=
 =?us-ascii?Q?AVLib60Plry5QPLaAjaUhfkbT1IsjQbfe852ezlHNLB2AOwUEPqp8ZOYQLmr?=
 =?us-ascii?Q?x6X4tVX9t7gaS/FbsxljhYFDB6pWHj/UevgTltLNrspUWyao03WaUBEiKYWE?=
 =?us-ascii?Q?rEHByItO1gNxmJe8880IMx+nXaYNVpw/f+DggKBo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b88e284-011d-44da-186f-08de0d60356d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 09:33:19.7533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dpYASxc1Ud+SQPmRZqx135M3j09SEX2PldEonzFC4xLvbVHEo777pCKbLK0NxDLmfDkGJBvcLnYK8Z453tZ8T5BThSa1JPbvgfP/w57snuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13062

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 16 September 2025 16:03
> Subject: [PATCH v3 2/9] phy: renesas: Add Renesas RZ/G3E USB3.0 PHY drive=
r
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add Renesas RZ/G3E USB3.0 PHY driver. This module is connected between US=
B3 Host and PHY module.
> The main functions of this module are:
>  1) Reset control
>  2) Control of PHY input pins
>  3) Monitoring of PHY output pins
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Replaced devm_reset_control_get_{shared}->{shared_deasserted}
>  * Dropped remove() callback
> v1->v2:
>  * Replaced magic numbers with macros.
> ---
>  drivers/phy/renesas/Kconfig          |   7 +
>  drivers/phy/renesas/Makefile         |   1 +
>  drivers/phy/renesas/phy-rzg3e-usb3.c | 259 +++++++++++++++++++++++++++
>  3 files changed, 267 insertions(+)
>  create mode 100644 drivers/phy/renesas/phy-rzg3e-usb3.c
>=20
> diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig in=
dex
> e342eef0640b..16211072098e 100644
> --- a/drivers/phy/renesas/Kconfig
> +++ b/drivers/phy/renesas/Kconfig
> @@ -40,3 +40,10 @@ config PHY_RCAR_GEN3_USB3
>  	select GENERIC_PHY
>  	help
>  	  Support for USB 3.0 PHY found on Renesas R-Car generation 3 SoCs.
> +
> +config PHY_RZ_G3E_USB3
> +	tristate "Renesas RZ/G3E USB 3.0 PHY driver"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	select GENERIC_PHY
> +	help
> +	  Support for USB 3.0 PHY found on Renesas RZ/G3E SoCs.
> diff --git a/drivers/phy/renesas/Makefile b/drivers/phy/renesas/Makefile =
index
> 8896d1919faa..0e98083f2f0c 100644
> --- a/drivers/phy/renesas/Makefile
> +++ b/drivers/phy/renesas/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_PHY_RCAR_GEN2)		+=3D phy-rcar-gen2.o
>  obj-$(CONFIG_PHY_RCAR_GEN3_PCIE)	+=3D phy-rcar-gen3-pcie.o
>  obj-$(CONFIG_PHY_RCAR_GEN3_USB2)	+=3D phy-rcar-gen3-usb2.o
>  obj-$(CONFIG_PHY_RCAR_GEN3_USB3)	+=3D phy-rcar-gen3-usb3.o
> +obj-$(CONFIG_PHY_RZ_G3E_USB3)		+=3D phy-rzg3e-usb3.o
> diff --git a/drivers/phy/renesas/phy-rzg3e-usb3.c b/drivers/phy/renesas/p=
hy-rzg3e-usb3.c
> new file mode 100644
> index 000000000000..6b3453ea0004
> --- /dev/null
> +++ b/drivers/phy/renesas/phy-rzg3e-usb3.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G3E USB3.0 PHY driver
> + *
> + * Copyright (C) 2025 Renesas Electronics Corporation  */
> +
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#define USB3_TEST_RESET				0x0000
> +#define USB3_TEST_UTMICTRL2			0x0b04
> +#define USB3_TEST_PRMCTRL5_R			0x0c10
> +#define USB3_TEST_PRMCTRL6_R			0x0c14
> +
> +#define USB3_TEST_RSTCTRL			0x1000
> +#define USB3_TEST_CLKCTRL			0x1004
> +#define USB3_TEST_RAMCTRL			0x100c
> +#define USB3_TEST_CREGCTRL			0x1010
> +#define USB3_TEST_LANECONFIG0			0x1030
> +
> +#define USB3_TEST_RESET_PORTRESET0_CTRL		BIT(9)
> +#define USB3_TEST_RESET_SIDDQ			BIT(3)
> +#define USB3_TEST_RESET_PHY_RESET		BIT(2)
> +#define USB3_TEST_RESET_PORTRESET0		BIT(1)
> +#define USB3_TEST_RESET_RELEASE_OVERRIDE	(0)
> +
> +#define USB3_TEST_UTMICTRL2_CTRL_MASK		GENMASK(9, 8)
> +#define USB3_TEST_UTMICTRL2_MODE_MASK		GENMASK(1, 0)
> +
> +#define USB3_TEST_PRMCTRL5_R_TXPREEMPAMPTUNE0_MASK	GENMASK(2, 1)
> +
> +#define USB3_TEST_PRMCTRL6_R_OTGTUNE0_MASK	GENMASK(2, 0)
> +
> +#define USB3_TEST_RSTCTRL_HARDRESET_ODEN	BIT(9)
> +#define USB3_TEST_RSTCTRL_PIPERESET_ODEN	BIT(8)
> +#define USB3_TEST_RSTCTRL_HARDRESET		BIT(1)
> +#define USB3_TEST_RSTCTRL_PIPERESET		BIT(0)
> +#define USB3_TEST_RSTCTRL_ASSERT	\
> +	(USB3_TEST_RSTCTRL_HARDRESET_ODEN | USB3_TEST_RSTCTRL_PIPERESET_ODEN | =
\
> +	 USB3_TEST_RSTCTRL_HARDRESET | USB3_TEST_RSTCTRL_PIPERESET)
> +#define USB3_TEST_RSTCTRL_RELEASE_HARDRESET	\
> +	(USB3_TEST_RSTCTRL_HARDRESET_ODEN | USB3_TEST_RSTCTRL_PIPERESET_ODEN | =
\
> +	 USB3_TEST_RSTCTRL_PIPERESET)
> +#define USB3_TEST_RSTCTRL_DEASSERT	\
> +	(USB3_TEST_RSTCTRL_HARDRESET_ODEN | USB3_TEST_RSTCTRL_PIPERESET_ODEN)
> +#define USB3_TEST_RSTCTRL_RELEASE_OVERRIDE	(0)
> +
> +#define USB3_TEST_CLKCTRL_MPLLA_SSC_EN		BIT(2)
> +
> +#define USB3_TEST_RAMCTRL_SRAM_INIT_DONE	BIT(2)
> +#define USB3_TEST_RAMCTRL_SRAM_EXT_LD_DONE	BIT(0)
> +
> +#define USB3_TEST_CREGCTRL_PARA_SEL		BIT(8)
> +
> +#define USB3_TEST_LANECONFIG0_DEFAULT		(0xd)
> +
> +struct rz_usb3 {
> +	void __iomem *base;
> +	struct reset_control *rstc;
> +	bool skip_reinit;
> +};
> +
> +static void rzg3e_phy_usb2test_phy_init(void __iomem *base) {
> +	u32 val;
> +
> +	val =3D readl(base + USB3_TEST_UTMICTRL2);
> +	val |=3D USB3_TEST_UTMICTRL2_CTRL_MASK | USB3_TEST_UTMICTRL2_MODE_MASK;
> +	writel(val, base + USB3_TEST_UTMICTRL2);
> +
> +	val =3D readl(base + USB3_TEST_PRMCTRL5_R);
> +	val &=3D ~USB3_TEST_PRMCTRL5_R_TXPREEMPAMPTUNE0_MASK;
> +	val |=3D FIELD_PREP(USB3_TEST_PRMCTRL5_R_TXPREEMPAMPTUNE0_MASK, 2);
> +	writel(val, base + USB3_TEST_PRMCTRL5_R);
> +
> +	val =3D readl(base + USB3_TEST_PRMCTRL6_R);
> +	val &=3D ~USB3_TEST_PRMCTRL6_R_OTGTUNE0_MASK;
> +	val |=3D FIELD_PREP(USB3_TEST_PRMCTRL6_R_OTGTUNE0_MASK, 7);
> +	writel(val, base + USB3_TEST_PRMCTRL6_R);
> +
> +	val =3D readl(base + USB3_TEST_RESET);
> +	val &=3D ~USB3_TEST_RESET_SIDDQ;
> +	val |=3D USB3_TEST_RESET_PORTRESET0_CTRL | USB3_TEST_RESET_PHY_RESET |
> +	       USB3_TEST_RESET_PORTRESET0;
> +	writel(val, base + USB3_TEST_RESET);
> +	fsleep(10);
> +
> +	val &=3D ~(USB3_TEST_RESET_PHY_RESET | USB3_TEST_RESET_PORTRESET0);
> +	writel(val, base + USB3_TEST_RESET);
> +	fsleep(10);
> +
> +	val =3D readl(base + USB3_TEST_UTMICTRL2);
> +	val &=3D ~USB3_TEST_UTMICTRL2_CTRL_MASK;
> +	writel(val, base + USB3_TEST_UTMICTRL2);
> +
> +	writel(USB3_TEST_RESET_RELEASE_OVERRIDE, base + USB3_TEST_RESET); }
> +
> +static int rzg3e_phy_usb3test_phy_init(void __iomem *base) {
> +	int ret;
> +	u32 val;
> +
> +	writel(USB3_TEST_CREGCTRL_PARA_SEL, base + USB3_TEST_CREGCTRL);
> +	writel(USB3_TEST_RSTCTRL_ASSERT, base + USB3_TEST_RSTCTRL);
> +	fsleep(20);
> +
> +	writel(USB3_TEST_CLKCTRL_MPLLA_SSC_EN, base + USB3_TEST_CLKCTRL);
> +	writel(USB3_TEST_LANECONFIG0_DEFAULT, base + USB3_TEST_LANECONFIG0);
> +	writel(USB3_TEST_RSTCTRL_RELEASE_HARDRESET, base + USB3_TEST_RSTCTRL);
> +
> +	ret =3D readl_poll_timeout_atomic(base + USB3_TEST_RAMCTRL, val,
> +					val & USB3_TEST_RAMCTRL_SRAM_INIT_DONE, 1, 10000);
> +	if (ret)
> +		return ret;
> +
> +	writel(USB3_TEST_RSTCTRL_DEASSERT, base + USB3_TEST_RSTCTRL);
> +	writel(USB3_TEST_RAMCTRL_SRAM_EXT_LD_DONE, base + USB3_TEST_RAMCTRL);
> +	writel(USB3_TEST_RSTCTRL_RELEASE_OVERRIDE, base + USB3_TEST_RSTCTRL);
> +
> +	return 0;
> +}
> +
> +static int rzg3e_phy_usb3_init_helper(void __iomem *base) {
> +	rzg3e_phy_usb2test_phy_init(base);
> +
> +	return rzg3e_phy_usb3test_phy_init(base);
> +}
> +
> +static int rzg3e_phy_usb3_init(struct phy *p) {
> +	struct rz_usb3 *r =3D phy_get_drvdata(p);
> +	int ret =3D 0;
> +
> +	if (!r->skip_reinit)
> +		ret =3D rzg3e_phy_usb3_init_helper(r->base);
> +
> +	return ret;
> +}
> +
> +static const struct phy_ops rzg3e_phy_usb3_ops =3D {
> +	.init =3D rzg3e_phy_usb3_init,
> +	.owner =3D THIS_MODULE,
> +};
> +
> +static int rzg3e_phy_usb3_probe(struct platform_device *pdev) {
> +	struct device *dev =3D &pdev->dev;
> +	struct phy_provider *provider;
> +	struct rz_usb3 *r;
> +	struct phy *phy;
> +	int ret;
> +
> +	r =3D devm_kzalloc(dev, sizeof(*r), GFP_KERNEL);
> +	if (!r)
> +		return -ENOMEM;
> +
> +	r->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(r->base))
> +		return PTR_ERR(r->base);
> +
> +	r->rstc =3D devm_reset_control_get_shared_deasserted(dev, NULL);
> +	if (IS_ERR(r->rstc))
> +		return dev_err_probe(dev, PTR_ERR(r->rstc), "failed to get deasserted
> +reset\n");
> +
> +	/*
> +	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
> +	 * And then, phy-core will manage runtime pm for this device.
> +	 */
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	phy =3D devm_phy_create(dev, NULL, &rzg3e_phy_usb3_ops);
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy), "failed to create USB3
> +PHY\n");
> +
> +	platform_set_drvdata(pdev, r);
> +	phy_set_drvdata(phy, r);
> +
> +	provider =3D devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(provider))
> +		return dev_err_probe(dev, PTR_ERR(provider), "failed to register PHY
> +provider\n");
> +
> +	return 0;
> +}
> +
> +static int rzg3e_phy_usb3_suspend(struct device *dev) {
> +	struct rz_usb3 *r =3D dev_get_drvdata(dev);
> +
> +	pm_runtime_put(dev);
> +	reset_control_assert(r->rstc);
> +	r->skip_reinit =3D false;
> +
> +	return 0;
> +}
> +
> +static int rzg3e_phy_usb3_resume(struct device *dev) {
> +	struct rz_usb3 *r =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D reset_control_deassert(r->rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		goto reset_assert;
> +
> +	ret =3D rzg3e_phy_usb3_init_helper(r->base);
> +	if (ret)
> +		goto pm_put;
> +
> +	r->skip_reinit =3D true;
> +
> +	return 0;
> +
> +pm_put:
> +	pm_runtime_put(dev);
> +reset_assert:
> +	reset_control_assert(r->rstc);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops rzg3e_phy_usb3_pm =3D {
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(rzg3e_phy_usb3_suspend,
> +rzg3e_phy_usb3_resume) };
> +
> +static const struct of_device_id rzg3e_phy_usb3_match_table[] =3D {
> +	{ .compatible =3D "renesas,r9a09g047-usb3-phy" },
> +	{ /* Sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, rzg3e_phy_usb3_match_table); static struct
> +platform_driver rzg3e_phy_usb3_driver =3D {
> +	.driver =3D {
> +		.name =3D "phy_rzg3e_usb3",
> +		.of_match_table =3D rzg3e_phy_usb3_match_table,
> +		.pm =3D pm_sleep_ptr(&rzg3e_phy_usb3_pm),
> +	},
> +	.probe	=3D rzg3e_phy_usb3_probe,
> +};
> +module_platform_driver(rzg3e_phy_usb3_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Renesas RZ/G3E USB3.0 PHY Driver");
> +MODULE_AUTHOR("biju.das.jz@bp.renesas.com>");
> --
> 2.43.0

Gentle Ping.

Cheers,
Biju


