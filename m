Return-Path: <linux-renesas-soc+bounces-20099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F33B1DB0D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 17:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6815F3BEAA6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 15:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D75262FE4;
	Thu,  7 Aug 2025 15:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="o6RfYceq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A781C5D72;
	Thu,  7 Aug 2025 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754581961; cv=fail; b=TpxLn4wZlYMWAYCdk8ZhzgBbISu/e3e959Th2W9wLUDuHd9JpX3ed92/9JZph6wKc1qk4/iebUSW/0kABfUYETducJAYqkiKyiNUD6xD3yvw3FNzIIGQCBaZTFbKAqz7okxXBDxhWBxSnFAMFOk8WhYkm+vnP7urPsbTsUZX0fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754581961; c=relaxed/simple;
	bh=rKvYySxl06no3qTyfbWKpXtEDAxg2jaZ8YPkncyRpFk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tbEj5lDWOi68Ip+uVMlk2zg7R3LSkhdmVQKNoQTUpM+mj2qppRHaJ7fZZerunE7UxeLo0aGGNiVGCl2sBjgmJcns3AAlOo4BZ/eP7ZteMBhgdHBNK88vb3L4xUWaXDqnd0ldzA4Z8rZhed+p0YzLYT6nCw4Dlzl/QlJ66eN9kTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=o6RfYceq; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hq2BeUyQwyE80ANkQhYb5KOeGA0RsMwrTYHejGXk29GSJS8Qrciit7w9O2eiAHFJ2m146QPlj59pMk/yhUxNd4AfgubNm/FN0u0mhK5W8shRRXi13xPfb0ZBNWaArlSfK2b4eTHisXIJmnsppijKovX2KgFybG8ae/BDOzE/+HFLD+tw79oS9i05Se2cjvqLzQWqE2LBZv+xF8O825iDioEr6IJZOMScJrKEBAhgBgQr5AgvXEYQD+31CoRn4L3adGs71es8rKK6kL4F7crpAzvbBOlNpee880EJtPNAI1nR46YHkF80jWudvwrZj6+i5yrQfvcr7dzNm63Dlu2r9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E//MX7aiR+eZRblKs7thP02WbRbGJlLTZ1ef7U6yi9g=;
 b=Xr0lZSa9hwIXzYyiGhP1s5DMju0XYi06Q+SnPy8BD4f7tXI05+Z77OVfmygM+mF4oXqJW8cd6fJdSwWGyi+OxZZAKKD/PysoTs1g1onitIGB7x9VkyxerS9MXxwgMeKgqe+RdtNn3pnAkDDR5q4gDEBvkW9F8mY3mf48js3MPFuBqGnIhNIGQf1/1mi09ZbarYee+9S0TRpMweVBXQzf12d0i6C9E9QHDLVG7G2Ot4wOboD4eTcW0kEwRhTW6lvOqXUhus9ZZI7XdUVtSLM1fJS7EOldoyONalDDZd/xqjZ9+ogKxPgg2hDnhNbDvXdPGvxX/xOppUr76874EFCuWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E//MX7aiR+eZRblKs7thP02WbRbGJlLTZ1ef7U6yi9g=;
 b=o6RfYceqj7T6Ws+q4grhT+IlTRL3XUSVdriHGoQuDoR7psLS/t/ZqBRs2PwWHET9S3eahxzXPEMprooCb2KlWaKpxGYhtplpQxlukXR+zpNo9TlVmy4JzqKJk6H7CuK0rYGGy2VOfEaAkucd4cF8NNbpot9IrEul7aeG8KYvkjI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB15426.jpnprd01.prod.outlook.com (2603:1096:604:3be::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 15:52:33 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 15:52:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C
Thread-Topic: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C
Thread-Index: AQHcB64SgansaqhVLkmqdmQQ2H+QybRXVi5A
Date: Thu, 7 Aug 2025 15:52:33 +0000
Message-ID:
 <TY3PR01MB1134633EEEB64A0F24711E522862CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
 <20250807151434.5241-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250807151434.5241-10-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB15426:EE_
x-ms-office365-filtering-correlation-id: 9ad9ce02-4e47-48ef-2d2d-08ddd5ca6c71
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?lceDVQeJ8Sh4bFSiJhp+yBvOyLgSSFrLEwsHIGanzOihupMU32NwwQDWth+s?=
 =?us-ascii?Q?Unx5G7OW4sX5OaDCFfe+X3a0dsE/Im5d3PdwNRS1UyLRW4yqGcmJXPdj3uNJ?=
 =?us-ascii?Q?QQndpO0qJz5ycfV9/uRM+0b3VrBnW63vzgscJ6PB79X5f88dnO3qsF+U8JzK?=
 =?us-ascii?Q?T4hFGyax1Qdrd05CTZ4lYZkDKMV1qWApqEibp3cK9cyhVO8iXDcwG7c8+TKn?=
 =?us-ascii?Q?EziVGp8JWCnAd5RqNLdKQQxU392xb26HSeGnyDYJ2D0jXdKjWt1BdiLPCESc?=
 =?us-ascii?Q?vFSLhuTGDyjhqlxqGk8E+irpWmlrBaiWHUqmy/EVHVWvBvJAmxqmzhic8Dm0?=
 =?us-ascii?Q?PZ5Ohmn7yEDAvpmXeswM5zBiNlBP3X0RVsdnpZwbuiZNdjD7dYF0KruXMStv?=
 =?us-ascii?Q?mQoLze280W+RkHQo9nhjYwthUO8my9gxEHAMqcm+WnZuMaMwhAU26z6fmi2s?=
 =?us-ascii?Q?uQ+C0LUPmnc+YkqfQKF4osDhXPHWASvkexhmEYiTYiiSnlotmNPp8fIiTB8J?=
 =?us-ascii?Q?R/U66yPvJl0mu31z9Y08E54Onc9MVGv2HNhQTGSAbocIlcV0uUaSb68qLCEH?=
 =?us-ascii?Q?kHfhJWrx0VRHPwxLaazkVXcXyGjWil3m9/CqsAD6mq73tEMdxx5zmTfRLFzU?=
 =?us-ascii?Q?WDlyJTjrpYipGRZLRXwd7tpsLZn2/vRR2iZtThAXh60SWm/A+R8+ppTRtRSW?=
 =?us-ascii?Q?bgS60HiO7/H0EqczX+jVFOT2beSndFxELG7Lv+7MDu2rpj11XJ7Z6qd49kf4?=
 =?us-ascii?Q?RkP/Y2HozhuJr7PomLwcChGR8hIcYop1OHkWQTZq5OqV7S949HH6KErQSHUW?=
 =?us-ascii?Q?3Mbzm/gzLMNgCUCEDos5D1yuC9uOiBCljK6YDnz0F+zaQ+P0VOI1PL4OG/1/?=
 =?us-ascii?Q?txNysl8csVSlA+Ul3gADnYJ9W1fmzvLw7g7aicBAihjx6+Va24LIX0SSbBld?=
 =?us-ascii?Q?WQyS79ALH6qd6g36t12eYjGjNScCJcPjJOxtgeQrabW+OsKhF3GLITx66d/v?=
 =?us-ascii?Q?ybtwZ0g3feC3CzPz20DVEQsa1KPGZ8oIg9z8nT946BpyrwKBGM+eVPchn75/?=
 =?us-ascii?Q?3d36Dl1oulkm3+HUHuBA94Nd0hm71jy1f6bV2R5cJiuwi3rY9K0QRCSX4jON?=
 =?us-ascii?Q?WMYHOww9le2lsVS15IwXpDuMZLHBq3lWnryxh+/3Cw1Xoe3L9VT5tXpkiU8S?=
 =?us-ascii?Q?d+qwCj9SfR+x0+2CJu74BIqrSa9x8i6fi+g8ssXI00HvgJ7H6gFJafczCmbw?=
 =?us-ascii?Q?Z3cHi4EiDQ/YkZ/frdDOCwBfxJp/qNNNeUTAAO4CRqKN4OZlDGBObbt4wWsQ?=
 =?us-ascii?Q?2HqrYMBmct+USBQQDvuCHJF0EoeJPEJd3jlsL//bOezwiKw+5RaLkp1QvTLi?=
 =?us-ascii?Q?EvFUBKwxrCGkV50kXHelO9lvMCLTwdJa/l6nueSSLwS9sXGhTiGwlGKDis5x?=
 =?us-ascii?Q?1I4XtHuqdimOMKXrLsbk2h4ZBvqClQmkv+aMJKb6Icgw9bUv6hMNqg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?G1Xo+IzAN7tN9wx0gOZQZu8sjHVaYbFAUj5K8M679vUyxLuc/K2dPX7CABv4?=
 =?us-ascii?Q?sfKAodF/uqEKMh9OcoEdD7/w3dHNmzC6lnX7FCtoJ9rPmNm65SpvkusEMwEH?=
 =?us-ascii?Q?Gwf2QwYui64R5LC+UNVgsSyVzPmLXALHclagPquKPmGLIJ2B2Ufn9snVFDgr?=
 =?us-ascii?Q?EqzIwXa29hwjMX3S5JMMehn+YZcAzfgxoRk30Ft7Td0H5IX6XbVgCys6BoGz?=
 =?us-ascii?Q?7Q+g1z8H3IwqkZ8HjFvFz/n1ulOCefWq7Zm3NDFFmk3DsHvs/oULSVu18odW?=
 =?us-ascii?Q?rdoJkRk3j1DcnjcTZ59dhFPZtj3Mn+aICHXAmBQrqDZOpG74e8plXcBGphOM?=
 =?us-ascii?Q?tePOmr7xzR9tGl9oIjblRt7jot5o9wcbLfhsgREALPTzb+lPIU9st+b6ihEj?=
 =?us-ascii?Q?N5a/pmCl2DNGSt/TQTFBhrMNMi/MgPZ5XbWeznVi3pJMY879H1iL4r/JWl8q?=
 =?us-ascii?Q?QivtXCch+iDBvDFQOxt7PJ6qDyOHFIcpuDUzxcmzch6c1Dq2r7iQVUkczlNE?=
 =?us-ascii?Q?OtkD9G6CJD89RVx1maSlkmSZKOu4Bd0bP37/cuGqT1pNwltOugVCzzOdHGc8?=
 =?us-ascii?Q?S2L/Xo/Th6cGsKdKnAi4CstZoYfJ0uOVRiKBS4psOP6ngDZ+R8WHnnYSYejE?=
 =?us-ascii?Q?81uEAdN7VamhiN6t1lQ4zcJMCfbI2xg0R3QaeFF5jYmQS/YxT20Gc9og170L?=
 =?us-ascii?Q?m/v/QxMIG3L/iOB1XMDoJzSF8ibUh6k8jUqoglhwo34vNsG8Ngm1Z/DL8fb7?=
 =?us-ascii?Q?FUkmhlrZZO9QxXTqi1uxolLE4aAD/7CH18g7hAqs6I4zggwYme3eDlOs83JF?=
 =?us-ascii?Q?e6l1hC3ncIxYoF1ws+4rLr1b9XPdlFm7iVMqthKHblVppUYRYzyXi9OyWqzX?=
 =?us-ascii?Q?IBol3LAtLBIxc51QieZWvoihk3Bre/G1WH5E3qKL6Ov1sppM5AWZkx9OEyuC?=
 =?us-ascii?Q?DfcnBy0Q98pfdEpvoSDLudsSIdUVbJAY/+vFuUA4UY6GT1pXDxUv6/MGqyPr?=
 =?us-ascii?Q?K0HkJRy+Zqx8X9gRD92WKBlkBSgufL4i6S8Ghz/i+ciFZQg/t/8j8dDf+GmN?=
 =?us-ascii?Q?HvPTHhVnrnLYp0dfz2M1CBRGwZtforpC5B6SUXkGQiwg7K0TP4A0YxpET7f4?=
 =?us-ascii?Q?w1dmn09bbAQTfeU4gl6MW/W7eKQBQv3yZBk0/8ZN6bmMMTLjaeFHThCM6KB0?=
 =?us-ascii?Q?PdYb+Ge4uCueMIPhdJsdRlwNwRaRd+en5CVW3RDQIODL+bb0OCYsWRxcZ1pE?=
 =?us-ascii?Q?eX1h0PVvRolOilsMkbFr9LPnLMR9TDC9QfNg5/5cF2q73rIw0xKr4HqvhU/l?=
 =?us-ascii?Q?XafBZmvKIBUPyxxUQJrkhe9OirEvdJ5YpEeZ6PR5IYLxuJbc6qllJGUPADu3?=
 =?us-ascii?Q?MRWvQsAJHEYIAHRNGZuQxD4XroPc9MXdWgoMcEoOfL+qabIjBJI3SrHnZiZY?=
 =?us-ascii?Q?fJx6B/9qqTrYr6PXGnU1DNKer+jBfXxcId8EcHSJfAUq9HmOIs8zVTDzOLpH?=
 =?us-ascii?Q?0HQNE9QefNwY8GJZ2VSOf0h7UbLLnW2H+dtiCniCBqgnUScS3jiLjJcJ6iWq?=
 =?us-ascii?Q?UHcz2kW37BRXWK+NwFWg+8Q3wB4Si2y1HECkjfVczSa/ERsVrTV/LHtLVqAV?=
 =?us-ascii?Q?4Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad9ce02-4e47-48ef-2d2d-08ddd5ca6c71
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 15:52:33.5772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fFqQI/MZCvzpBhGWi8Q3Fi/vsOmLVS/Qf1626xNE3WZH3k9KKEaRJJxzkwTW/NN2VzDRLZaTLtCju924diVTTDMpR7bFH2KSwFrNO6uN8pM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15426

Hi Wolfram Sang,

Thanks for the patch.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 07 August 2025 16:15
> Subject: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable I3C
>=20
> Enable I3C on the dedicated connector of the RZ/G3E module. Provide safe =
defaults allowing to connect
> even to slow I2C devices.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3e-
> smarc-som.dtsi
> index 7faa44510d98..0c3156129aae 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -5,6 +5,8 @@
>   * Copyright (C) 2024 Renesas Electronics Corp.
>   */
>=20
> +#include <dt-bindings/i3c/i3c.h>
> +
>  /*
>   * Please set the below switch position on the SoM and the corresponding=
 macro
>   * on the board DTS:
> @@ -122,6 +124,12 @@ raa215300: pmic@12 {
>  	};
>  };
>=20
> +&i3c {
> +	i2c-scl-hz =3D <100000>;
> +	i3c-scl-hz =3D <12500000>;
> +	status =3D "okay";

What about pinctrl settings here?

Also from the pinctrl xsls sheet there is a note. Have you taken care this?

When the pin function I3C is selected :							=09
    I3C Bus Interface has a function to switch the pin output to Nch-OpenDr=
ain or CMOS.							=09
    Use the register on the I3C Bus Interface to switch the pin output mode=
.							=09
    At this time, the setting value of PFC_NOD.reg should be 0 (N-ch open d=
rain OFF).

Cheers,
Biju						=09

