Return-Path: <linux-renesas-soc+bounces-9225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FEF98A9ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 18:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEC0D1C218A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12C6193078;
	Mon, 30 Sep 2024 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ARbiLN0Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3530819259E;
	Mon, 30 Sep 2024 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727714186; cv=fail; b=XDdFmOGyVgj3pJWZMevVb749+FoUhcx3i4G7W0/Oky+o0yWrx3TR+VUXrgB45ZmdP05RN+XaiKbXYCmwlSogp46fmM+tvf6g4zi8A0IsWjVmxLYWNIYUJFHkHQgaeMyFwM9hZXlmY3NpgNVMQx1mO6rPBc8GwwIB8y8N76sD4NM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727714186; c=relaxed/simple;
	bh=OCvHEYTakMAvheiaMRLBJVw0mYZmNrhLZQzfn0wr7k8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QJgbGHyD8vltvFGYHWWhEk0ZAN7sfnm9ypMIY/kmhzZdypmRxgATjvSwVbPPAXLFWCNQt3mI7iT6RAKr1KyNChVNHno0UyxU/OfmrAp/BYgK27txjHb0AfUnGWqDzwi0r5LHkL4C+J5ThA27PloEmQQisGD/qDS2HCh5qbtqYAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ARbiLN0Z; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3RkuJ18yqg5Z8G5H0vbo6o2q+eB6dWGK73kIClvOQA5186mxQtmyErAM3dG53uWbZHufjmslkWnss2+mWa2ozKLsF/D/nY4xn9i01+ru/YHo1ImAsV2Su6pawcpofmLB765L4HfiZaPL4Dnyom2rXUy4Se/5mez5Zzbe1VhHwkcZwNeLKlbwfpt2RViqJ1i2UXjj0nSwUtPEF+5X+hvpPz78QiZPeR3dCTu4pI3TxzvqMO6VPEXt8Qm21JaETiIz5v+ErUcdp9ct88aW4GMJJrl1f+px6Rm7V07YuVfG1jzGR/+A2HT5aVRRqbt9Py2r6kzOXNHLN/aH7/E3XWlZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWeRQh/cXzRhb3Jkz1CjcJKySrgbnmgtnoOawXjMCGA=;
 b=pv2uijmdKHd6GiZRAXdd3ApYP5wW/xBnRN7G5F81pvRSddkfRJaEwA2qjXumTjjWoA8TbCOWO32vtY4K0yxv0aLbnO4/V0XEAJSpIoH9F6r+7RFP4vJa0NTeEKFYwYf+xDaVCpBXTkg+ljImW3sTDtlI6geREp77wilcQM1HQ8a7xFNNWJCrGArGueZhT8B8eWBsnT7BskVpyZAaW6GibjKc638XLkfWn3t1VL6kZAeQz4n22yHyGCQr7inwiv8DKFTmJ2barGjEWOCZ23KUv6oUTrGgHd2Tpr+3p0attlKoBNgvdNCVdeLYR0Uj/45YVAKEOLKqIjUjW660isrQmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWeRQh/cXzRhb3Jkz1CjcJKySrgbnmgtnoOawXjMCGA=;
 b=ARbiLN0ZP677UQ2YZDP7kR6b5/GJ0BGWMgteR4x0Xj7RBCi99YwsknmEv/COMrORKNtL/N8N6Wy3rxLisMHmtU1wdK6YJtpeGqTjlNeFy6RLp9B154XUATlT7DgYlII/jn8xoewXQqZ2yu1TiX04JFS/Um6kBXd5hGayhY+hm88=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OS0PR01MB5620.jpnprd01.prod.outlook.com (2603:1096:604:bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 16:36:20 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 16:36:20 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Marc Zyngier <maz@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] irqchip/renesas-rzg2l: Fix missing put_device
Thread-Topic: [PATCH] irqchip/renesas-rzg2l: Fix missing put_device
Thread-Index: AQHbE0jeZ5rsQ++rgUGVV3Ok4wTdk7Jwel8AgAALTzA=
Date: Mon, 30 Sep 2024 16:36:20 +0000
Message-ID:
 <TYCPR01MB12093A2984117267AC18D679CC2762@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20240930145539.357573-1-fabrizio.castro.jz@renesas.com>
 <87ldz9uomz.wl-maz@kernel.org>
In-Reply-To: <87ldz9uomz.wl-maz@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OS0PR01MB5620:EE_
x-ms-office365-filtering-correlation-id: 0e40af28-9a92-4ca9-0b41-08dce16e03ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gYqKgJ9R9c/iKS4UqP+5BA3ecck8lu83wHs07nDZNIlBrDiFcDXm8mPsBJYy?=
 =?us-ascii?Q?6fgNFww/H1Sygvv2APOuqXXsNteJYu+7yzahd0Sm0B2/nRPCuVLmCjFmWHyF?=
 =?us-ascii?Q?tef206ShBon7WhXAmjhYsJZGvlKx4Yuh+Lo25KONBRyJShELXtu44PMD0FCN?=
 =?us-ascii?Q?6CCagN3Kxh9Srv9U+NYEG1TkZ+dJ9Ccui6cXnnb3tIs96HHwEp19EkaEr7pC?=
 =?us-ascii?Q?AarZ88ZqcE48PkIxsRGbw17w9G2Vm20TnzcV3EAufFR675s1rUav5lWHYFxq?=
 =?us-ascii?Q?yN436hLhO/p0eg69g71c1bo6HK1llz+dkVOGHACISZJ2JeftqUJBWXd+sa5K?=
 =?us-ascii?Q?0Wqb1e88uUKzFpXuLiwf6KmkDNKj37+SoXFXsS3tP2XAiQvMBY5WeHPbD66d?=
 =?us-ascii?Q?ZafbZu6GDI77L7hUFQgARn6gyH3qkX93uLRiwlpUzyeS2HfjMhqcyPOouDy/?=
 =?us-ascii?Q?gPl+A917FB3H1r7SIhMEjiq7dHSBPiiCs+j0FrFqZ8qJsZJizpg31v8mXhx7?=
 =?us-ascii?Q?/p/uNpVT8bjB3ai55yiBXETC/0HTziQzm4JlLBKtco4XlS5T5/zX8PtYvnT8?=
 =?us-ascii?Q?yhehGmyunc6t92FtpFffCvj2S6nHp+1yocFMmW8+VmHHbQLzsN391kLg+Key?=
 =?us-ascii?Q?zKaGm1FQ2jGHU07/KdbD5T5N8L/eTNE6YMQIjIropQzFiTYsOM60hLQ2U2MK?=
 =?us-ascii?Q?2MZpXMV0zHQQkPLE4Ej6wK5polZFvVhc9DdOp5Y0r7/q1zynaz/tJvfco6Lk?=
 =?us-ascii?Q?h02oYDojQPXNOe0BkKeOlzPRNYx6H9VyD3miLrrakXkBWAp4hiXXUUj39DIq?=
 =?us-ascii?Q?EVFh4pjGPVx2xRwauV12UCrNuqVDvrr7/5CzuEtFtjj8Zs5Eq61+jCaJAA/+?=
 =?us-ascii?Q?nLQVeIoY6eWVr2AuleygbCukZCIJbMwv+LX0oiWie+E+Tgkwqz2ze21rfaRx?=
 =?us-ascii?Q?M6TjTm2RPMwS2PaVVRnfvJwGFQRVdGN+uaLwVR0+MFKbFdkzJuZnrr924wX6?=
 =?us-ascii?Q?dyFOvctLJq3ZeP/IPk7NiqgMLcc5K5ock0/oul7bN5Ts3P4q75to+nvmMlQu?=
 =?us-ascii?Q?8Me1HfMX/zI2+rNiT2eM+ORsRSsUXS86VlmqD9GdEjq7lbUar8fD9EBS8OCR?=
 =?us-ascii?Q?5Zl3pfr0CukLMu9xAzaF1vbV46l10rBy4q0lZAhV7Iqxj+GkhYtjpQ/c1QNb?=
 =?us-ascii?Q?7kZj3GoDNl/ZguroxgHGKwGFA7p6JEZmnE5LE4pDpPWtWU1PlpJ7izqB93bp?=
 =?us-ascii?Q?sLbkXni/YqsooeV4rRE8tVgWGaY/KYKzhHObPRtfOBdGjJf1UfDHkTCan1Z8?=
 =?us-ascii?Q?iwrEE3lPfE7eqJSTqfQmd+oLPup6y16TS8MjQck0CrfKlA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?O0OMY9O8Etl6/rXjaUWXpHcKHx13MwMizVEHkC+As8dBywbXuKhSY98phYsm?=
 =?us-ascii?Q?KgS7/6d2OlRTsxJj4Sjzeh1+gOthpjGUlLfkIG4XmLHxqMpmvd0Ci5VKBbF3?=
 =?us-ascii?Q?IYWwy2jCyk+OC2Yuvb0N7pFHuHzjrbAy1VicpQ8xKiTUUe/nISaeXr9XmYsI?=
 =?us-ascii?Q?lJOp68EEylG4URWJjO8cEpiCf7E6zDDIuLbe17mMd4y1EmdKH9pcgd1I3qcU?=
 =?us-ascii?Q?wxlfAzxil2mVDQOzZSsRD0rw5edYFZCgEqwrt+zt3KcY0Wc6+kVFYVpcCAVN?=
 =?us-ascii?Q?NnEtvhRLi59AvTrmJXznnMWdRKT6MKciK68tc81fihE+FWVEzNwWlrIEnSmi?=
 =?us-ascii?Q?RzNczxLlBESdnUe795Cv+ruv0AR3zXAHHWnK8ccmMzhB4v8QaYuMdMogCvYW?=
 =?us-ascii?Q?JH06Dt1W0g7PDg2VdWCgExcHHGNqfykORcVPNys4PWok140LTdQFtVOlEc6u?=
 =?us-ascii?Q?TdnMkE/Voy3Z3ET78Bn2YjBOAM2mz1Sx+KICdm4XEJkQCxfBUtxmQ9C2v4M2?=
 =?us-ascii?Q?UzgLGpXNJyjptMhGjay/nFezGNaYtlbzVTgRO+mqR8IFp9EyCEPIrOkwGN+h?=
 =?us-ascii?Q?FuaXxQRHgWD9XgE/py3/XzBy9E71FER3nZOW59wJmLphXtBQ7UlYrJAVvg2m?=
 =?us-ascii?Q?KB+7Of954aQqtWZHd0JIFut+l8UZL+2K8nQV5sasuLX6ch8wpk+hiu1Lp0xJ?=
 =?us-ascii?Q?hD+GwGpuJxm0D39wSh6JFBWgaVfmV+BQ1VLMG7qLukMRcSbNcMHE985LWde/?=
 =?us-ascii?Q?MKSP8GPur8O9A4qyiuIWMMzMGxLlFH7bcxKYyV633DGcGiUevPGBteS2o0jI?=
 =?us-ascii?Q?vRzQ2qvg+W9t6UJ0yLkWS1qEF8X/vCvcHSDasi/4JeueKQiYM9Ep/iczTtYk?=
 =?us-ascii?Q?ok4tYJcHNmxSN+f94EWwbfBMmlVkKNMNo9H1BcrMC4AdCCVn7QlmJSsIgJtd?=
 =?us-ascii?Q?/i1VVdULk9ZziPQH0IIu0MJuQAfcEein2UNppXPYaiKTTZP6BNlKZvpRFBAj?=
 =?us-ascii?Q?0fe1/zckUpvXcq6vbgOCUXhM7GY9I38TVjoB+xFS8tv2JjTa95vdlxbZNlta?=
 =?us-ascii?Q?51iML6EPDvjyHDz9xlTZUNbmNkkfPfCG81Yan86RLB8vGVEWjm3Jj8QK+ASo?=
 =?us-ascii?Q?/C+jVv2JkhJi6c1YJZFh77LcpDDU6CfDRYLQBfoT8j1pzOK9jJtkNf8+jYGV?=
 =?us-ascii?Q?w3qLzvwdS6hdLjjEatRtyKOFkSFxrKMiTJTIgPO5a0bfVxOrEkL/wfvJ2dyo?=
 =?us-ascii?Q?7bx93hQrgWma6n82Jew0+gXk9GPpEvnRYI74jNTfcZuoH9U0q6zvdzl/uxmy?=
 =?us-ascii?Q?AetbK9Ubk+gcFFCt55BGXMOT97vr1IqhL60yDiRrwoPs7t8HT5iO0SUDXSUg?=
 =?us-ascii?Q?R+2oD+Z24EuSA9I0JvkvcpdnsCwUtKPDJETgenv7uGfw4fV2nwOrPH47bxwB?=
 =?us-ascii?Q?DwV42YN5/aqXWmv2E/mD7PgdJj83LCuBIrxVnFjjz4a8ba0c/ioNN+BMD0dL?=
 =?us-ascii?Q?0T44DCFXDCWTfOG8K/GEPEb0MfkRWtN2ssFSh+j9/iXRCIC6+NRBoQFyoqFU?=
 =?us-ascii?Q?1+v+1YZrp24zaBb7gijBRqrKUM8PBCPEzLEH3yp8+QfI8kR1SrsWuvyLfYzI?=
 =?us-ascii?Q?3A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e40af28-9a92-4ca9-0b41-08dce16e03ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 16:36:20.7887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vNAtWHJgZLy9MZ4/B/702EjXpuaTZl1VONdLBrt3HkcYzXzknV1NC+HBlVKu4a5rlrxHhkzNxxKDy4gYGuark9ySDBqNqU+9LvP+/JrrcFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5620

Hi Marc,

Thanks for your feedback.

> From: Marc Zyngier <maz@kernel.org>
> Sent: Monday, September 30, 2024 4:50 PM
> To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Subject: Re: [PATCH] irqchip/renesas-rzg2l: Fix missing put_device
>=20
> On Mon, 30 Sep 2024 15:55:39 +0100,
> Fabrizio Castro <fabrizio.castro.jz@renesas.com> wrote:
> >
> > rzg2l_irqc_common_init calls of_find_device_by_node, but the
> > corresponding put_device call is missing.
> >
> > Make sure we call put_device both when failing and when succeeding.
>=20
> What sort of lifetime are you trying to enforce?

Function rzg2l_irqc_common_init uses pdev->dev until its very end.
My understanding is that we should decrement the reference counter
once we are fully done with it. Is my understanding correct?

Thanks,
Fab

>=20
> It looks to me that you'd be better off doing *one* device_put() right af=
ter you have found the parent
> domain, but that completely depends on the above.
>=20
> Thanks,
>=20
> 	M.
>=20
> --
> Without deviation from the norm, progress is not possible.

