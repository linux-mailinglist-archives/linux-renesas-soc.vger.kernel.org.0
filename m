Return-Path: <linux-renesas-soc+bounces-7048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC45A926CBA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 02:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44493B20F9C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2024 00:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F63802;
	Thu,  4 Jul 2024 00:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nL6qbWDO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D23A4C6E;
	Thu,  4 Jul 2024 00:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720052526; cv=fail; b=IE5BHh2vFCdbgD2Py82egUrZ3FiRs2lehr5qRxxwbiIRGuWidgRjg0JcgkAmovEmyluHyywL/mN/2H0ClvoC1fCZsIhStxN+lb2V8mL7gTT6CQ9i0/Nk621sYT+hvmdrJ1Vn2ymbekreoz/5pA90hEB/v+ToCVNAtV43KqsQD6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720052526; c=relaxed/simple;
	bh=3CAvZqMhShaTqThePH2n8DQUI5BC3+EKZeqIyJ+41L8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TjjY3mTsQqw+fokXqSO8hb5zklunKDYKS1IEwdT9OxPpwSrHCfOfoyxHDl9FAFvfKAf8wqv5D4JOKy/m/kvRdL0AsMp4bFddzyegEB7rrN4pkIzUMey8l+N0HEnpn9VPqSiEsHAIPSvpvS/i6NlhhnQvdDsUrxMoJhWXzgIuPLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nL6qbWDO; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPECKAORJ5VXu3+rhd2grXwOC3f5m+G9vxjqd99d+z5pIV2357L1Mr49lmUVGZDIKjg8jyD9MetaS6qMqlm2AktC63klwz48/FpQfK1TSQcW6NKznLiQXK/Eu+Zd7eDSEFO/GYVyHGydAtEJwrObjdKXvrxYpSNniRIPTsCOqrASOdDvbjUrjCx7B82sf5yN8bTb7gSfinfXQSy6hxr/+UezxPhhUW2x1Xjn9GXf/sz56ljawsFu8E7rgYbeg/ilEAMBVPduQAfaTCCa69Gdlo0KoIkiF7ri7IJG3aVRHDEVtQ0jh/2RTKkBbh4s79cugJIL8ThC9uM2HC+JNEotcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CAvZqMhShaTqThePH2n8DQUI5BC3+EKZeqIyJ+41L8=;
 b=e43t5jO3wjRBR1Ic69TSqSVEzGuMbOILlj2bWpDRJOLqdUHHmV/Vaw/JKbkdB0D9IOClyce8hEq9V578IKFy+8lVURGlCqGUDxDxCl96De80DIV+X7Lt3P6jKMS9Z9LFAU2iXBOlSkHsS9zjzcF4rGjB8RLhr0KeF6+7709KLAux3/5A5e2Fv/PpqzRZ5F784+FLQmQi5DayaHyQSP9PdtwOQWcaCPD8QI8dMyp/PFRIaIAPD01DIgg/5wcAzW5F5h71mVL3+hMGOeHCaAiB0882yxKM9SK3QJvfFtnjl2QCrlMWjToJzweff2wkGD5WdE8hvSdVjM0Blr9HjcgHJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CAvZqMhShaTqThePH2n8DQUI5BC3+EKZeqIyJ+41L8=;
 b=nL6qbWDOwY1FxMf9MjTt1RwFhq5dmCPbPe49fn7sIqxaqAswcfYcAT+2SFfSuph0KAqa3bsiMyMHqsu9WgboUm7egX0kI3uA5fktP5/X0NfgOX2k5GtIS12Oj18thP6wG1SSt7vPxPRapvpARK3F8OI+o4iFhlWGoxqnIcJAGd0=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYCPR01MB11753.jpnprd01.prod.outlook.com (2603:1096:400:3e3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 00:21:55 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%7]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 00:21:55 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul
	<vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v5 3/4] phy: renesas: phy-rcar-gen3-usb2: Control VBUS for
 RZ/G2L SoCs
Thread-Topic: [PATCH v5 3/4] phy: renesas: phy-rcar-gen3-usb2: Control VBUS
 for RZ/G2L SoCs
Thread-Index: AQHazKnKNtEeezobkUmZelehsk0187Hltp8A
Date: Thu, 4 Jul 2024 00:21:55 +0000
Message-ID:
 <TYCPR01MB11040D7140A97F61D8F518BECD8DE2@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20240702180032.207275-1-biju.das.jz@bp.renesas.com>
 <20240702180032.207275-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240702180032.207275-4-biju.das.jz@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYCPR01MB11753:EE_
x-ms-office365-filtering-correlation-id: 1809af17-be87-4cd8-a030-08dc9bbf4f94
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?0mIh5wKdZCuX40yLC9p81eyNRCCQSow94/WYKfoOpq94VwMM/d3nERxkFdtx?=
 =?us-ascii?Q?4VUQqmYrO3dkZL2ujWx+ZzaBsHlOvYTRvFQlKpxn/F0GSmUltnrwAS8QDIJl?=
 =?us-ascii?Q?0uScnBkoPv09VRNOdW2D8drnyLDbZu0Qm301or1Ilq5SblmC1usNkIrXHUBf?=
 =?us-ascii?Q?p0dQl9tdSyWXeSB2oNHmDQy+ZUcfbQXqHfPjpctmyRLZUyt2sOE2I/Nd1Fqo?=
 =?us-ascii?Q?aYbZBdt226i+jzRRkQWeAGHeguZAJUdQA7efkQloJSXduSuGUMgzKAwxnRCm?=
 =?us-ascii?Q?wgNFMCq1j67cvXkhzjowo2iTYOLBLRlQWR003rLUEp28tcjdkTARODGkZ1bG?=
 =?us-ascii?Q?/rl7saajmidAvbmhjRoD/pAwWDPn5fskmHeZ8rbbyM3nQcJOCgHMrI/P5Eqn?=
 =?us-ascii?Q?rynPnvTDrojadrxiju3ejm4psBqybl0vkvEwXsY4gnN0EUeyY3dWwei/VQaB?=
 =?us-ascii?Q?nBVHh6sWY7TyOlVZqV6bFdpRZxXOeHh6Ru3QBeS6g6vPTjyAbH0f50i8SPt9?=
 =?us-ascii?Q?uQyevYNoV9WrbsgMgcbwLfRmACdzs8sF/aHgSJSr5WozgaREu/XDYCuUp3Qw?=
 =?us-ascii?Q?HiS0+iHX9gjZoNTNedef4aXtjUeDcxItagqCDi2LjPMr2fJENE2UPl2sqhKQ?=
 =?us-ascii?Q?wjg23YVuWgil5nx+wLdJaiSXRNI4KSaDU8Dswo198F7pia08CYeCmXfnBmte?=
 =?us-ascii?Q?+PHfs2jWTGKoP7WeZZ+8Ve97/Tlcxb7kVvBjDo4n+vJ43IdJIjKDrlRiV89a?=
 =?us-ascii?Q?Rsg+iQAeDYWLJFkzewJDwX2V5yu3AFEVQ4/h9MYU5F9nt01mPQ5VcRgIJ2nc?=
 =?us-ascii?Q?b8Ye248OfKk4vAuZVLSjQsnnU4haZLdVgN2pChPv3E1kWLNybZkqUFRd5az1?=
 =?us-ascii?Q?uoDI4J+4qVofhvAwMSayV5C+ByMAE9mWhHeiR7p2Att7TahvKEf10ROcDGw/?=
 =?us-ascii?Q?BQgRscHh48bvTYUWXN7vpas8gWQt5v3XU3781AmC048HAjRFS+XhiQkiwWYO?=
 =?us-ascii?Q?jQ/iSzGebFjqaYUq46LRUbusTdl8Y/yg2w+fwM1aEzJdJZUXjJ9/cTY3TC+E?=
 =?us-ascii?Q?NjJIrJAyN0GDS6K9J/WGNBMwwce9mvspJ2D+fd9hUIaWbRJvMFvXxp9oopxK?=
 =?us-ascii?Q?GU+tI03eeUrvO2vUyvJTG9MnN8IYHw/TSo4i1Qs+ZQPjtKKITmDyGeIHyGZY?=
 =?us-ascii?Q?AsiOzEb+rDAUMqdcaX8EwLV3WgoUpzzfKjmaCPgqhMSBXmPpKwKCnHLrJnfy?=
 =?us-ascii?Q?3skEW1fVzymYyHrZjw7txO0ce+K4W+QOVtg2gu7lsuyAFoGxWr5yhQRxkQjZ?=
 =?us-ascii?Q?OolHsyXBYpKBxoA1Fzh09/oArdah8Tjq+lwzFvItD+b8UVZcOejb3Fyi6TKw?=
 =?us-ascii?Q?oZPm1IMaJuSukl9p4VgFczxz0kA2clrptGuSednSpTNXR9MhAg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AcuGClbgWjyi7/QPu851d8pdgN3Tj7T7H216eTsBZOBBfwgb6z5xDiLc1/M7?=
 =?us-ascii?Q?HOnsvotD2h+J1ZIwhA7Hr2pLPayJ2sdGOVlyNhcA8FXRkzoH1x2Ho2xHEmF3?=
 =?us-ascii?Q?3dp2K2wiRXQCVFYbACi2wjm1Z5PySaws1DOkR2fkIRq9NIVTs/8o7ySDmfh4?=
 =?us-ascii?Q?TxgeZXqwfonsoxHT7N7EJ4Y3glxLpgARGeFzPDvtoBcnHIGCeO/3VIlv5OND?=
 =?us-ascii?Q?xo0uxeZpg/uR5ZortHkzlmiTsiyBu8DwIWpij6qf9Z4HgZS9q4zmONzUu3Cl?=
 =?us-ascii?Q?KKlkxz6KqZJDHOeW6A9zN2YCbfRX0h4LR/GLkWEpbJprCU/2Ysx90TL86nrN?=
 =?us-ascii?Q?dkcIKtoyzMQ9BvCgm2dA49RoXhl+SUuaAsw06g+c8M++JmMg6LZGusxStm61?=
 =?us-ascii?Q?J3NfIS7QZuqmSZrvoTG95Tf/kjMBq60YUIG9QMGD93MHhOtxmdzQaPar+tHU?=
 =?us-ascii?Q?Mnej7+JG38ODVUjloQ7FujGSBW9X11rcgxF9Iw6nD35yrPB+FRAKsEFshSpD?=
 =?us-ascii?Q?wWmRL/ksBsuTc/BqYnCel/kpCZ95ae5zkKksz/Z62rffs46dX/n6mw8hzxjN?=
 =?us-ascii?Q?nOiKiE6kVJeQ5Rs+A3GDADvF2P+UGanusdHm/YkGVoUcUun5NOru+R9jNE5+?=
 =?us-ascii?Q?m5kxdOz6ZFjVtq6wJ0RguuA+CKugfgTF5K6+/dIhOiDcFrpmjM3cENuhGHxH?=
 =?us-ascii?Q?/Bla/j9sG5qenPZU41Mz5owOHLNsLAOqBwcqXxLLNcCj5iNuqm22LKY2Jml0?=
 =?us-ascii?Q?fcaGeu5Jvelx8cHRAOT1FNja/HNXVHXcfkTuOhRLfFRH8iaUkqoFNopGRQku?=
 =?us-ascii?Q?GIDltF2xaZ0HCN/nYxezddpuo2PBvyZmnsh/wgdxPLyI+DwIcQDHn/ER6P+h?=
 =?us-ascii?Q?XD4gQJDUNXAehpnXhtng2ak/uTJY7Dx/f777Vw9HNTu63ny4S2QFbBQQoSbG?=
 =?us-ascii?Q?+Mp8fCzxrEZsYCMqv0FaRhMTauNYbYsGD3CzagvNAJgriDOanX0oUEnMb0Mb?=
 =?us-ascii?Q?jCPrAHk5TouFjF2ButWW13j1HuqpHv0Xd+/13ZY922vrSsGv+4dFAUi6w6XL?=
 =?us-ascii?Q?EwWHB1nqxFU/aKpQKkoNqqf+JpcnQqjX4TZQnbLSF0OrXlyy6oEzVe+WrJlp?=
 =?us-ascii?Q?/n5/57RL9rkhlcoa2w5xk8fcPtwSlhCBlVZtZ7nyxNM+Fee/evXpMP5NIcmO?=
 =?us-ascii?Q?ZZyb9ZfwUqCW1sB+G3FiHoe0X3aadBfdRHaxutIP2lzEqgwpyjnbzVPGt0iv?=
 =?us-ascii?Q?U15YNkuoJ1Nr10RzTDMUkPmjhRSvsCKl5LCcmz41LlUHIIFG3fMsx+RHyD/V?=
 =?us-ascii?Q?17rrAgu9DFjyF3vTEldYdWxOf64pW477UD3gemnfLKcpn8+T34j2ToEcDpo7?=
 =?us-ascii?Q?r5KNTwaAspR/yP21KSFJkTJupzMPNoNj+aMDuO4VjxEFg51VregdAQKbxfoS?=
 =?us-ascii?Q?qGZ0TMtVN5w35PNAmNGBca5/UTl6zG57pJgMikbGHF6PxF3i41TkSyOkZ05S?=
 =?us-ascii?Q?pJp1rzZIE66J9Tc6Lm5lf0a3ynMZsX1lnd1DdOjn8GNUd2sYbukGZ8QwIzBr?=
 =?us-ascii?Q?pWhwRagYqm3TXSeDkur3c4IJqm2ZBWpOpEvFHmXq3XQrK6rn4fDiLTT9JQvV?=
 =?us-ascii?Q?o0hGR8U4WVI7rFjSJCLapDUVsgGj2ICrsdhLMc5Q3YcX5nuRYhK1Jhh/LLGh?=
 =?us-ascii?Q?8Rvl1g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1809af17-be87-4cd8-a030-08dc9bbf4f94
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 00:21:55.5746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sv14Wb0p7BtJZw275fQ83bLbcwkKmbFQ+u4QRqV9CqmzDAjQFs9FzUBSR14UfMpkcCxR4Vag/s+VqAjzAG0GGITDeklv5I2jCWbYsT2SwFk3t1VXJMg3ulnF4/F91JND
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11753

Hello Biju-san,

> From: Biju Das, Sent: Wednesday, July 3, 2024 3:00 AM
>=20
> Use regulator_hardware_enable() for controlling VBUS enable for
> RZ/G2L alike SoCs in interrupt context.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Vinod Koul <vkoul@kernel.org>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


