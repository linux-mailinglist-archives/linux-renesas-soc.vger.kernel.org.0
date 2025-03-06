Return-Path: <linux-renesas-soc+bounces-14055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5E8A548DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 12:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69020168EE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 11:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9111FF1A2;
	Thu,  6 Mar 2025 11:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LOMn3kfp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6115417B50B;
	Thu,  6 Mar 2025 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741259734; cv=fail; b=hI1JCvDoSQrb/e6nbR9et8InUv+gwqX1LrgrZrcicTt+g6tdWDih0RWViHV86r6hYijFt6x3XtoVwMHQuVE1QWBo3khvhTsL7lU0YBRI1fq5HIRUdWzOd2L7UKR4R/wa40f5/plBLhwCDbG/VvqsE4d0oI6HMyJDXPUhOpJKhx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741259734; c=relaxed/simple;
	bh=3HMQbACVFPMbBrH3xKIRDmTW4sDaeUyfbTYU/HgZTL4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RE8OClL09LP2I3mWfv+qoSJVjBOp2E0COZmoVQCZZRdscEk0THrrhC8V026Tt858kia7MuxmOKHlk6sii/l9yvZxAfwKwlWoqaB1CT7t4yp2U82Z4IkHMwkhwNASKn7HzKkI6ioKp5qmJ+6iKqld/XVt1PScsbwzG+6aM1tHpU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LOMn3kfp; arc=fail smtp.client-ip=52.101.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOqnjf/eeim+BO15dBt948uRRxx025tjB21vzxW0/ISzWFgO0o4GcwP3ThLGbSuAE47Uj9fRWtUtyFZHvgIbGY1DbF6vBJFBNDQS1jqSNQwWPdsFs3SUfG+gpPQotSSIuSZSKwlVtSNVEi9akZHhHRdDQvMH0qLHDzbs6pDnIq4QyqDOA65uG3mHypRM7LFlmNyIATMc27Ln10WdEc8zacWMxZEndobFPO+LkD1SkME79QJaEj2bvc+zjaJZp570UcOaq9oPwm5UsznDf65YXf88fcG0rOkSjX+xiwqfT1ZLLN5X41P4QGXk1vRRssRfzKrvOPqdRiemaU7UgfhCow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qAHKRs+hHx9zqqAidueKfRXD5kDe6arFFu1E7+WqpI=;
 b=NCWJZE1PPNGHksxTvjv+beD/J/+WKfRSSIxReOSmQRneUuqbNrMLCR/jCrl6KoXJc4B5txUxbojC25BT9FZXJ5BtGslfTLlwKuP9k34DQMsLST0bEL/PzwxvywjnRFCXXBFvYJbC2KxyVGTv9Jcv15UBandrBKhGXdDcm2+A611TDjSR/Rr6636yPBo1aD/zAPiRUW/yur/6UcRXwq/jLbM2jfDstGey6N7+Xz8EVpfwQ3C6k2lpQ2slcDKM5ExlAsmC1+0U0QciYpGGiWcC574rI3/ZDskG3U317cmxM+SADJSQJYh5coKXIMHAYEzZpI7ldVCrC6GulKu5bAacPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qAHKRs+hHx9zqqAidueKfRXD5kDe6arFFu1E7+WqpI=;
 b=LOMn3kfpG7og51itSTsrwXfhGwdkeeuTClsPLdhvDuj1IMcjm3u+wtAyW0zWX22EkHwucvu7rWmVHTtAb0wo5eqjD718TS44q1boOqaWfyNXXrWbK15nxTKpN5Gpp9nSKb4WfuDtD/yhtVO3G5XeBEcUFxDSfbgyY0CnQCpF/kU=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OS9PR01MB15621.jpnprd01.prod.outlook.com (2603:1096:604:3bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 11:15:28 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%7]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 11:15:28 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: reset: Document RZ/V2H(P) USB2PHY
 Control
Thread-Topic: [PATCH v2 1/2] dt-bindings: reset: Document RZ/V2H(P) USB2PHY
 Control
Thread-Index: AQHbjculMtcGsxftVk+Hot8khpQb2rNl9mDg
Date: Thu, 6 Mar 2025 11:15:28 +0000
Message-ID:
 <TYCPR01MB12093A4E8BB151810D0128589C2CA2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305123915.341589-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250305123915.341589-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OS9PR01MB15621:EE_
x-ms-office365-filtering-correlation-id: c27827c9-c375-4849-d58f-08dd5ca0333c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?aalTYakSKIDDtbfzqOljSwjanDbGoQ1zOiiHXH6pO912JHbOM5VE+0jvzMoZ?=
 =?us-ascii?Q?RSd9N0kEAUZIpv6ip+6sspfHSwXoM3UqCrN2S+JRv3XNf7hsiClwC1WYcuat?=
 =?us-ascii?Q?IcJUjtnYeZF4yCIkKargsuJ6yEUJdpOcLLssyMzZxbZCNdvHTxcKL++RKGqg?=
 =?us-ascii?Q?gux6MOQ6RdaIS8gdUG+AQLed+/+cd+6/R48tse+Vp2IK+kXtGwzrvRXFuAOX?=
 =?us-ascii?Q?DgvbFGfN9CHWOnwKu35E7KBde6wdaw5jFlFF2EvPtlHbCnKaXQpavYjrLf8O?=
 =?us-ascii?Q?DgLmM/Fuo1/KEeaZ89oWDAw00OpVoujlMZWnkuDt9pBR9aidqTZ431+lDSZ1?=
 =?us-ascii?Q?tibYrUMS3cif71H/GCsNri2wbdAiFwcOIOSobvdeM+amuJqN+e22vpt3eHoD?=
 =?us-ascii?Q?tGGna39Bdm6Veln0EiNqAeoARU9Z7gRH/u/0CksT/vi8EhhcrnwfJI36Bg6j?=
 =?us-ascii?Q?TRqCyeGZM/vjRif79szhkM2/u+5fCTyFRaJwyON5fFu/YQi1zpWMYS1QiiEo?=
 =?us-ascii?Q?YEtc8U6lrLawVGG+e86pjH//4ysQWv5nSD5n1J4iZeUvDDeXiQXqi7JgRmq4?=
 =?us-ascii?Q?fc4VEkdDha2WMkUVj93Mo0jNhtvvSFGG95f/2eQsycebN7/UmO3zb3rsaXDw?=
 =?us-ascii?Q?1HY1GzL2BHNNRphlwM2dKvcGx7EglS+oTAgcXG1Np1JMNPvZjIrBaNGS1fud?=
 =?us-ascii?Q?ACPR2+o3g6mHlzKqudLGDsmSqps5qc0SQQi1rpgtLdjzfmo/NPr2lyr22+XU?=
 =?us-ascii?Q?ycUyDIALvPqEBE7IySfQwmTLslAIJT54Cd0eFGgbW29i40h/a4A0LBIJKfHw?=
 =?us-ascii?Q?riw7KRyMP7J3c7o2H1HpcL5y6/OSUtpJCusngRlxbquHP3JQXRm4KuosMx9R?=
 =?us-ascii?Q?2o5bKlXClu60wQZFiIqu5ok9y+/XSZ8y8lAyqFf/6C1orCGMiIHkIQ0iGYa+?=
 =?us-ascii?Q?EiQ0opVQFMQ+PfLDz92JMbJeDMk/j3YSdOgRv3QRCNAdHZczvz7iJBLQHN49?=
 =?us-ascii?Q?sjjoju+YOK2kQQYwtJEKtmgeMldX7mvTKKOiEntz8seJzK80X3A9+YawRLKn?=
 =?us-ascii?Q?1qmSl7jV5UjPmpMBcmS9uzDLxDq0foazmw2p6yOEiPrhwG76As+vUKZ/6Pkt?=
 =?us-ascii?Q?5iboAeafkKPS98UaLUKTXWgEVQbRwlMavasbcCz+uWL2zWE2FAdK11D5eJ4q?=
 =?us-ascii?Q?3NXSeqN9Bgy5yLkEjMpZSrBG6j4dMQf3YkCzLHbjUsEngd+hq4UJq39hrYhK?=
 =?us-ascii?Q?AtG+eM8uXRHVW0vomzs1BjiujnDPJtErsxx4gjS0WZJrvBGQHRzAHLdPwz7M?=
 =?us-ascii?Q?AmqnIs9hJAH5mJ14a6ZSG6O39RI6qFxpEBTX/wQFD1cmieuxrnkoa9tUMGOT?=
 =?us-ascii?Q?Xz4oWrZ1OXHcAR80VnZT3XhTQHU1Kehh9UjJiAj66QvzS4k9RA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2fDu7l+ECOifOlaaOI1+31YheMFqr3RM/ZRuzcE5aX1cjHuo6uiFAoo+M/D8?=
 =?us-ascii?Q?wlV0nTXXLfFDJqFnxg4jgufoJiHtNkzZjLiLM6SfARRbTVkrwVt0DFybQzE2?=
 =?us-ascii?Q?IJo96gkflC/MqbouQx1hM+hoNzCzfHRMsfTHK6+Gf95rRjFCRsDnRz7Vz37b?=
 =?us-ascii?Q?VMYEllOiaKehN/GptxpWDjp/M6RwXUc1TwNKUNYHxdZfykGp1mDFwFJpwGJv?=
 =?us-ascii?Q?bbqN2QrSD6EvxzaTQTGI1pcQktY2DRnMWPYf9jIas1L06CXd+ubR5gRXuBXw?=
 =?us-ascii?Q?c4efoXEkzYns6IF/RgbxMdQAEqHn/oMTuorxH/hhUCnmAN3ChGZKLGoq4m2R?=
 =?us-ascii?Q?TV8XIFKCPMNKcJ81Oh+AcnzCvv0nIVaBcjds4rJvJpolAvzqVa41oFTpnF9a?=
 =?us-ascii?Q?ru0Oi1bXe/5tBlK9EO/MPMJjOfWkuS7Cllo7KWXt+V9DtdWrg4zBR+4xUcvJ?=
 =?us-ascii?Q?6MOazJYC8/O4yDO+edJ6xT8ecg+yEO9Zf9kaEL9gT6EIwLIeDDNO6RvPIROf?=
 =?us-ascii?Q?KrJM3ABW2I+EVR/EMWHOQcQlHKJ+N1CbHFKmDWoguIR1up+TNg1ZS1ZJgngA?=
 =?us-ascii?Q?9QAKkJfIfDPSQkGu65PZ+hVZ4bU0N7Dpi0G8S0F/LqjcjT4ygcUmAdVyoVvQ?=
 =?us-ascii?Q?3HBCleuVSLYCdAL/Y/bAoi8tuWTuSUaN/zAi4ZXlwVq4OFbAPyy6xL+6njr2?=
 =?us-ascii?Q?2dWUEQQ232cneLJFpADgPjQKwKtWIi5xnla7sYls9KiZgUw8P0FkWzwcjnhG?=
 =?us-ascii?Q?Q8YeQ1FujIUb7HDkx9G8/Kn8RwE3R0zY8BtpQ+1dMW2iZqb5P6ris3GzLVEC?=
 =?us-ascii?Q?iosPYenpw+shX7PZaXynu28QegST+VDUm3Gqm0AIwMmeACqhLaVqSDjo+zd/?=
 =?us-ascii?Q?qiz2A+gxDPcRHdNJXJmBGcSDv6JACIY04mWMH1D9o10L1lUMgn0SjHwtwOfs?=
 =?us-ascii?Q?g3mxiK9u1yH/wTuJ47mE9lSP4FDuqHcxdrsFCXIBVdvHCRwjnPODqbnp6l5l?=
 =?us-ascii?Q?c6XsoDPGJYGDDNLS/3dr5YMZ6+V+iPwyQ1glf13lDku7yQLQtBVwVCLm/HUG?=
 =?us-ascii?Q?lpZMPy1rBAq+LkCIBLhg07uDewei4puazxmtVnGa6NyEUbXaAWovNPDvaHqe?=
 =?us-ascii?Q?4S/SxPh2+yrUFdbV7VfW4CbNbHhoCoaIQXhpEBKMfwTJ2KyfP7I0b8zGVgAb?=
 =?us-ascii?Q?3ay9Lx600S3SusjbWu9fasBUaa/bs8p+78+vm9Wc+t7YWfv6LqZ/EWkA/qi1?=
 =?us-ascii?Q?vMB91Zpi/NHYXHdnQCNNz5GEW8yOd0WasQmDV9Lb6zDJr7whZKcDUBUndYIN?=
 =?us-ascii?Q?9nm5EZz6q3u4d9nrUzFIlH8GofgOKkvvK/jWJQ7Ik8QBkSIYdCrSWjHbUF48?=
 =?us-ascii?Q?URBR1e3Wog/41aCK5e288iUCGAW69IUfZvcFVqsHmtyECFkyr5+oGk4i5clZ?=
 =?us-ascii?Q?hPpJQ6xrsEnBKI4+VM03vObU1XcngixX3/2fNEIymyxmkTHJ2HsWpPxL7Mt3?=
 =?us-ascii?Q?oBGHDq0Y443eZXSHUBFFLUSkGxx7zXLGViOW3D8/dz258A9HZY6CeCaj7/3i?=
 =?us-ascii?Q?I2Qp3KUQLJmQjjx0a5pQwIzd97gUiAjAKLFTRqEvOv+rr++cHJ7QffrQgQto?=
 =?us-ascii?Q?vg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27827c9-c375-4849-d58f-08dd5ca0333c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 11:15:28.0474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NlxmLhlpYmtLF3I9KC/5QscP/Xz1XOPGJrM0RfZQxEIbAalUDgOvjPyHPa9Y+VJt5dX5A21TCVd04T5/596biuDFXxLekCUdPag94radkQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15621

> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 05 March 2025 12:39
> Subject: [PATCH v2 1/2] dt-bindings: reset: Document RZ/V2H(P) USB2PHY Co=
ntrol
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add device tree binding document for the Renesas RZ/V2H(P) USB2PHY Contro=
l
> Device. It mainly controls reset and power down of the USB2.0 PHY (for
> both host and function).
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  .../reset/renesas,rzv2h-usb2phy-ctrl.yaml     | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h=
-usb2phy-ctrl.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2ph=
y-ctrl.yaml
> b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl.yaml
> new file mode 100644
> index 000000000000..ed156a1d3eb3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl.=
yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-ctrl.yaml=
#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/V2H(P) USB2PHY Control
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +
> +description:
> +  The RZ/V2H(P) USB2PHY Control mainly controls reset and power down of =
the
> +  USB2.0 PHY.
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g057-usb2phy-ctrl  # RZ/V2H(P)
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  '#reset-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - power-domains
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> +
> +    usbphy-ctrl@15830000 {
> +        compatible =3D "renesas,r9a09g057-usb2phy-ctrl";
> +        reg =3D <0x15830000 0x10000>;
> +        clocks =3D <&cpg CPG_MOD 0xb6>;
> +        resets =3D <&cpg 0xaf>;
> +        power-domains =3D <&cpg>;
> +        #reset-cells =3D <0>;
> +    };
> --
> 2.43.0


