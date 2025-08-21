Return-Path: <linux-renesas-soc+bounces-20819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF5FB2EF54
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 09:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 766F47B3F29
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 07:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7522E8B7F;
	Thu, 21 Aug 2025 07:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sdMLfugk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93082E88B3;
	Thu, 21 Aug 2025 07:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760744; cv=fail; b=nOO3zOb4cIq3USDy2W2oSK+EKaus80kekyRHFB+jEZviZ2cDYy0/f1/qez6xS/jqcjPM42YCLtJjJiFJUfEG3s8SjH3vndYsSzOECaecNMt0xOqLGPM2aj68bYqBgfCn94paozPz9T0nIsvuXOSmzEOngrcF8HdlcuU6mKVX16o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760744; c=relaxed/simple;
	bh=FM4g6jTNvY7hG2OOLETg46AU90xAlSeA5tJqIeIZsvE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jG021wFOErHuIbHBbMwBJCBy3W2m/a7kdoVP9niVmg1NA2QISz/ZLEX+uoesP0r0VeAN7NOzQySxhS1ZIxOIkVwmdc0XH5GBji7KYWpZBNPJQ3Z8YS9+DHvUP9o7OxHEuwg0z9sJGRfoWjgPVKhxmPyXWbLzOqHwNE0DmepZY28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sdMLfugk; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/nFOAZ6obCAi4dFWLNS1ocFgGxRorowBthHCTaUs0rorrfKmlkXuKK6PtEC/4pW7sTmPciRdcoFnVot+wmeLfgvdEbuHqls2ZcFI1YM/XYD2zxWu3TvmwEM+0pmprYt2eGkHDEOtyy7wzO3Sb70B8jXF3M8djcsdwDX6zlBruuv1u/pR3+1PYJ/3E+vcjZ4CREAGryqconltUdnvIeWapamZZMXpskVMObLYj6B+VlXRbEiPFmGW/rdgBbyzyz0KOFzGoX1rg+S5VTy5W7TNPnBMZuUohR7kCWLF7S7XnvqRCGesSQhTqUA01E//pP8uggwCHjFOPtgr4h4ftReOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FM4g6jTNvY7hG2OOLETg46AU90xAlSeA5tJqIeIZsvE=;
 b=FQ8rkTwDIXnVFeMDIIOPGUbhG8ARlDA+Rr7dNM4ukiLLj6AGjooWwX0e6wmGZz/SBkgWQME95/LeWqmemz4eaLlIgH6wEs2JbWqooKuS83k7yOiHnu461UfV5Q6pzdn5sOvuVRbR6DLvZc++s/lZ3XLqC1y8MznwsdwHW14KwO+3udrG42y4oHrUp1V1WGTwJBCMeYwdSWRviFP6HEYke/RwYjBggShI4M5EORE/kTCrJG8CO5Uzcen+J6a1WI4pRI4OWX7AwgNx71iwI8oLmKwgAUrw1km9D/+yAyeedYMUl5dIrHE7bcFkFE9RN/6JVDQXwquGCXTOu7nQJNUMOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FM4g6jTNvY7hG2OOLETg46AU90xAlSeA5tJqIeIZsvE=;
 b=sdMLfugk5f/llLlA8SlbWkMDHawR2pumlGJuQlAk7QlT388HRM8nrQW/FqPcFAqV6g6e13RMq0ZeFv4rTHY9LL6cQGEe+CuGzyvbH4uCL5Bswkjzc4ehZGKlzUryPcUzgRNPT0EDyzbyv/EQSvA3Bj2i0uKjA8ZrZxmYQzH5vIc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8667.jpnprd01.prod.outlook.com (2603:1096:604:19b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Thu, 21 Aug
 2025 07:18:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 07:18:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 03/11] dt-bindings: phy: renesas: Document Renesas RZ/G3E
 USB3.0 PHY
Thread-Topic: [PATCH 03/11] dt-bindings: phy: renesas: Document Renesas RZ/G3E
 USB3.0 PHY
Thread-Index: AQHcEfZu+pwZcXU5REy+jNNS6IB9qrRr+OuAgAAArICAALl0wA==
Date: Thu, 21 Aug 2025 07:18:59 +0000
Message-ID:
 <TY3PR01MB113467039A598C0EDC284AE198632A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-4-biju.das.jz@bp.renesas.com>
 <20250820-primer-shaded-66da9fa4bcae@spud>
 <20250820-commodity-curator-1f580789885b@spud>
In-Reply-To: <20250820-commodity-curator-1f580789885b@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8667:EE_
x-ms-office365-filtering-correlation-id: 67a34074-8e02-4695-ec60-08dde082ffac
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?D7GIrHQS1GI7uxd+L8WFTKzPB1H6RlmeRyZo4HKwDj7CVZLWJ2Ln1C/5+5fj?=
 =?us-ascii?Q?4JJmlpQLGlqGhiO1kVCtxbM+a7qm17aM/A3m88mUSqQr2Iod0blVXmRALTWS?=
 =?us-ascii?Q?oRKt3I+uqjQ15yiA7LuxAReIHVYuO999reGZVSBzs+DPZmWbE53sR+s85KcX?=
 =?us-ascii?Q?/CFDU9rCC0i8QwlTA0gn2K/nmyRSdhTSzeWxWQL3IeW+4YK9lTSC42C18BRi?=
 =?us-ascii?Q?QwgF4FcnA7LkSid7s5h0J+BnvxoscXxLuLgT6yWn/UjIYeuw4AvtBL1WxR+0?=
 =?us-ascii?Q?PLxSUSjcSi52OudHFQZluBfhVB+15wRYrtvgmet/3d7tn4SyuEwGLYKxxHYu?=
 =?us-ascii?Q?6qGCWGE9BrkyLI5GqX9uWOgt8UgxXe11Bp7Yd6U8T74q61HglYvf1m0i5TBv?=
 =?us-ascii?Q?yNwQ0aHN37T638y4NkNJxHnxj5UGfBzQU7BiVi3b7BJ7B0iChbmd7woO62Ek?=
 =?us-ascii?Q?NEAO2XF1sJR2MToxvjDq+B8lE1Tltp2B4UqDtzRQU9j8JtagT1Ara+kUECYB?=
 =?us-ascii?Q?kHK1WJt0hEha+Jk5WmR5NJA+2yLw7c6hlklnVTeplmk+VlEH39O+z3XOrPjl?=
 =?us-ascii?Q?rHJdPr/guj61EgVTx97vHVEVoM3nU9Sa1qVleIxOyxsT+S3Qci87d5eP6jsf?=
 =?us-ascii?Q?kdnir1b9liKlL0/ZZkEHeGhF2yCzvcRAeSlJTenbQTwnp5XjApP0FZjcrobZ?=
 =?us-ascii?Q?iRNyLDWoUxFx+DQQSpFOG/M9SO36rub1LMf+S+GFUNbx19KLiVaqFo+2+aXb?=
 =?us-ascii?Q?JSXchVflgpxgv3A9INuvfyNsHIb2K339hKyYOqkI32kTztku1sROSj1r2nLF?=
 =?us-ascii?Q?4qqWe4wy6jbb9kYG+63d938NNqf6cD4JYeNVbk8vfrgaXdLG7WrzxK9WB+Nu?=
 =?us-ascii?Q?Llw6SoKRLgg+AKEGLHbs6DlmisI2nGaDQ0zBwj0Pcl6a29TO7/Hy4iC814E8?=
 =?us-ascii?Q?3HQLrL27nT0SdMvSMOmtz2Hc9WKQJnRu0EzWJAh5EY73hnLGCsnnQnmqhZ54?=
 =?us-ascii?Q?cBT5Ua30pPFZpdz7fNRr1mWdewBOwDVm39MsrV7PMQqsc+JHaWj1kLBlBTpc?=
 =?us-ascii?Q?cDVydSvl6J7AdRBoxHgSNIBekqNLWOPhbKHE3sMSFi7a78p4bqqtFDj5NXVt?=
 =?us-ascii?Q?jVZqe8PyZZ2yOc26I1oFcMR0XW1G3F989TdYIZAmAqDJFo95sbsqyhBp2IIp?=
 =?us-ascii?Q?y7DdUENI5w/X8glshkyZM03ZEIuWqTr0S5jb+tOSCi9NIlOFGLJxXgPhSCrD?=
 =?us-ascii?Q?cxfKdqF7X+LX8gj+8GVjnbRpC22zmSnZIpM8QBtn1wDpHrN1MdbKhfCkRCEJ?=
 =?us-ascii?Q?qu7EJy7cgIK3RrdyOW70hQhDV5SL2rBiAEHRFgGyJu3p5xpGpCH1gaj+30y3?=
 =?us-ascii?Q?jcSmyWk93tvEs5kciGaMIjGSpuwVvcgDU1eybJZcv5xcA625H4SLowItEHzx?=
 =?us-ascii?Q?65R2zvsxjWK/7i26kPzv3tzg4/aXnWWkSSi4OF+fnQJYv95lAs87a6UmHSO7?=
 =?us-ascii?Q?IpRCZ6EC1OxlcWY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZlTGJA0Bgnq+mclcy3aF4OcJ/oppeVZ9HNlPodtX9yey5n0f+bX0z7JqXyrv?=
 =?us-ascii?Q?ZEs+hmARLz7rVSjPHRkdiRh7KgdpfzDI4sNpjjEa7E6jsmsia1f73tYmVO+6?=
 =?us-ascii?Q?sDgobIuvwSgK8qhaxUX3lDLfxXBV+ukdJuXLbSfn2ZTd5pw/vNaMsHMk4+cq?=
 =?us-ascii?Q?IMoVpyKrthUjc4VNUrrpnrRo5Juqki8hnmXCjb/pcjIo1ZO9yhEZaxWegisa?=
 =?us-ascii?Q?FVLMWBlk/bG7BB37xvJbSy+wP+srl0ZP3+CmxZlpP54xS1mHDvrKKoDCySKi?=
 =?us-ascii?Q?e6PD9w41+S9riavWPvCR2niol5xOYibh9/DBQb56R1LoHM3a4tVbWfSkT1vF?=
 =?us-ascii?Q?tI+TwQy1pGXkhKdwL18ROHN7TUnd1xsYrwv9/jZA9FX1LWcQuS349GOLYSf9?=
 =?us-ascii?Q?jPsfkJr0DQNl14t+NLEFt1u6Xtw4mjbyifzcTXYkuzElsl1Vdpga0j4XKWnh?=
 =?us-ascii?Q?EFK260l8U+V0Rvsn7V0QDgA6Dw9C/Bk9mra4LimV/w27njLgxlFQMVpcBhy4?=
 =?us-ascii?Q?UWkJ3+rR46G3Uom9fxdudpi3fzLR/1WqsTv35CSlmlNKKSvxDLbYXWV3wIlJ?=
 =?us-ascii?Q?BiAkxbMEvk1VqTHjUZFR6Lgvaq1wivkhJvGuhqaPtHi9+d3PHAf03M8bKmIe?=
 =?us-ascii?Q?lloVCpidnNJRCuKNGC8Jac/KZF45gGUXJPKOuv/kk94GPuwKSOPNc+XOpp3k?=
 =?us-ascii?Q?jQ9BGUDDY1cvdBvn2QR3algkxlolI5Pazu+48XvKvuTwJKgxZN5j29qlc9U1?=
 =?us-ascii?Q?oF+0Hr63G96dtQtimDgypsL6RxQxPPSXL9xCFouWpUjqD9QI/FlQ87YeL0xH?=
 =?us-ascii?Q?qaymzfHDYuYicLmDPykC8WdbrKqFUC4dJBx1Gecuxum+JOB0+Y2kGhfPRgc8?=
 =?us-ascii?Q?USvNLMmxfyfYNIEEr4bF7kbgHDOZiJ5DOIaqdAZmr+2kTu5uBvfIoB+EFOyg?=
 =?us-ascii?Q?hkjN//ULn6CkK1xTSIlBvALtLyXhk2zFMi/AiLjO7yM2eCy3ZUePO6OAgtkr?=
 =?us-ascii?Q?o05ATGlhr6aGpnLnm9B/eA/3xwgrNunfSznxJz1fU6Gx2mJZ+aFtjWXpMXna?=
 =?us-ascii?Q?N0S4VyNZk3LY8EO49mNHNRUBSoSGoUL411RXilG4zJAyxKGe1RETlLV3lCJU?=
 =?us-ascii?Q?oCZVdDW6LQYHPc7dpHk3gnlWPHrQxGLMQcAMlBkhmEsgJwbRRMiI/TikOONk?=
 =?us-ascii?Q?qTdpr5Nr+Vt8jOYyC/kOVpcxgLrx0TwzaoxzO7W8aqP7l4p8GdHeUr35Qjja?=
 =?us-ascii?Q?b/0L8Hldn0EztFHrCB5JLBV0IGqAyH4OypjHrDSxSrTRXvBYEvk2V5N//9R3?=
 =?us-ascii?Q?C8bhVEI+eKUFS2qdHK5Db7qmmOa4Hf6OWIFTDlokDGbn+6VZ+NlA+Jt8/7b3?=
 =?us-ascii?Q?4ldy1+zQGu+lat0FhCCpUjH1MFfadLhkNjgGWCwRHW/cJjz90ka4hvP5Bspp?=
 =?us-ascii?Q?tI3K+n+nBypGQs83yk+Uyo84wtXIKl0QBFVxjg/Nz/x4sj7sScx8U+KXec6O?=
 =?us-ascii?Q?92vd3ir7qFAqsagz2oPjDSY0exjCibodEEYq1WuWCy8PQmSr0y6VyDSWgFgp?=
 =?us-ascii?Q?c0uCSDsDXc4lRMfvRPGjfJZUmFQO8Vvci7h9uLLX9vpj0SEq/0XBRpd3x8pc?=
 =?us-ascii?Q?+A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a34074-8e02-4695-ec60-08dde082ffac
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 07:18:59.6126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mGl/cUJvPe97frKAWRPhXBF+WYDSPwpsuHQNUfRP8dL6TETbzV8CL1pF3rUUvHmosku1imrnDZvwY8Fuv/rXOljAZuoOUgfDDp8E7Ir1gIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8667

Hi Conor,

Thanks for the feedback.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 20 August 2025 21:13
> Subject: Re: [PATCH 03/11] dt-bindings: phy: renesas: Document Renesas RZ=
/G3E USB3.0 PHY
>=20
> On Wed, Aug 20, 2025 at 09:10:07PM +0100, Conor Dooley wrote:
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Now that I look again, same applies here with the different filename and =
compatible. Copypaste mistake?
> Or why does the compatible not match the filename?
>=20

r9a09g047 is SoC part number which also known as RZ/G3E SoC.

I just followed the convention used in [1] and [2].
Please let me know, should I change rzg3e-usb3-phy.yaml.yaml-> r9a09g047-us=
b3-phy.yaml ?

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
Documentation/devicetree/bindings?h=3Dnext-20250820&id=3D44b91d61c505863b8a=
e90b7094aee5ca0dce808f

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
Documentation/devicetree/bindings?h=3Dnext-20250820&id=3Db2d25905366b4e6791=
f60e6bc76a636d1b88e6f8

Cheers,
Biju


