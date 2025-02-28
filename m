Return-Path: <linux-renesas-soc+bounces-13798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A86A497CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 11:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B1963BAF1B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 10:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0278F25A65F;
	Fri, 28 Feb 2025 10:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="G3HqjH0H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010013.outbound.protection.outlook.com [52.101.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B65E25D91F;
	Fri, 28 Feb 2025 10:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739904; cv=fail; b=f2oYFgyH7MQIkGbGBOtsCjcxWnK+2grl7tBUGIzCZ3lWDN/zsoIeER0CEZ2PEz6FGAJxMK24vYLMYx+rk7IGTjRlN8tf+SA34aRdt5Z5/Lvu1Ty1TE/zHpuN49FPYyVmd/fnmPSOTTx8LYQUpynbhFAOWIP1DwY6NfOa7dIwJ7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739904; c=relaxed/simple;
	bh=uszFfgrOCIRXwO4j7stiofLsIWDit2oS130xavnfR+s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VcuQMY8YmoIzK0qQOotTPsl/lFSSZUZOxSz2WNrWac2IqxzskvfKZbhyLx04N4rfX7yxkE9ZphYBPybwrwkYc8CgCL3DI4fZJtuLKWAtZ67zBcr+FBYccnN0o3O3YZC173WDFOU5gvIj60lvPaU32BJCm34SV+SH/d71oxUG/mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=G3HqjH0H; arc=fail smtp.client-ip=52.101.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HI25JJNt+65htH8aZONEzaqoKwkJ5BD8lJA0alDXYsgpc+Og0NLYxwhkuauLggyHVwdap4MtmKULIbUnj2NXeQSTGWwfa5FxhNHt/jiR3n+s7TDSCNpU6SePTKu8QbBABb8teXzISwcDQcxMY2wjV/DsYQF73z6xGCJEzbb3L4n/8/sNUB5qAlKEDY6Uaom1A78zJjd8rM+olFSV6T6Ug7vaEv+ouF+/Vu9iPScBNxYCo8IX+UMRxpem6l/yqyZMkhFAY6eQBEoamHUHixr5+fe+CPjZa3EcRLO2/mYFfZdBb+FfmKa53HaNZB1M05Rpw+t+GDYEiwZqKNwnSVB2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmXsmLn+lez6LUSV96hPRk8W83OY2asJaptfbTF9CHg=;
 b=bmitKzF7a9jC5RIxXd18YUw/vypi7QYPhl5DK0sWqMYNCA3Cbli8m+I6yDbYYKVetOrni0usZdk3iTq/xpYRNfczgjIKh2LSiLYkwWE49NZcIspbbCIdUIFm7e6kFWA8WaXZSUKzCSDCNMhxJOC8EgZSHlliavOuQ5tpZgFppJdq8m7iZxCyx+IVLr49Yx0sAYdhOallJMlzwQy4qvY9CsAIwoaorxF01OufzE4O3k25bylX7ab+WUMgph12iqYv2Tb9rj+ogwExOVeDulKRRP/4U1JgepSt5extCJgImHE+Sutya8Tr2xlURFXbs5V6ZjJqA/dW+w1ovxU4Gy+KDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmXsmLn+lez6LUSV96hPRk8W83OY2asJaptfbTF9CHg=;
 b=G3HqjH0H3lE4ROsUkjLWPY+KN/EaXxfltB5pRW6Z4r25Lu+EcDvimdNSJG5eVW68vVu2DtmwN4uMY43V0iDbKQXDLAb7uLhpHyzAWQBbxHUjM7o/vzd11kl/+QdVJudTts8OMWq/wFmEjr9FwN1Qa/+8yvaZPmX0D8hVSpPWXtM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13528.jpnprd01.prod.outlook.com (2603:1096:405:1c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 10:51:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 10:51:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: RE: [PATCH v3 2/8] mmc: renesas_sdhi: Arrange local variables in
 reverse xmas tree order
Thread-Topic: [PATCH v3 2/8] mmc: renesas_sdhi: Arrange local variables in
 reverse xmas tree order
Thread-Index: AQHbeJzMpx2w3btvoEuE4ElRf+m+DrNclzCAgAAU4HA=
Date: Fri, 28 Feb 2025 10:51:38 +0000
Message-ID:
 <TY3PR01MB11346D11A0E08EAA0C6481E9C86CC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
 <20250206134047.67866-3-biju.das.jz@bp.renesas.com>
 <Z8GDjUv4qJwhocF9@shikoro>
In-Reply-To: <Z8GDjUv4qJwhocF9@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13528:EE_
x-ms-office365-filtering-correlation-id: ff3a06d7-5bfb-4ba9-df9d-08dd57e5e0f8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KEvZfgwJAKhj7lhVb+N8kbjXKKXi6sz/5fRE/3bEwXRQHSU99Pauk/zS9poF?=
 =?us-ascii?Q?Yz+QnFJxKRlFZsRG4ZwItofff6p1T4OLocOzmuZWOkQi8TAW/FfWDFnddpeP?=
 =?us-ascii?Q?KENIiuBUo1wthfP6Z92Zv/rrhx59172MdjYYNiLGc+VDINi7EEwME1r7y5on?=
 =?us-ascii?Q?KeBqzv6cxtN9KhCoqcbjkspRQsIM71bACopz2k9VYoLi1dwY2xBuYoZ/5uce?=
 =?us-ascii?Q?eMd+yQfyuvI52XjdV8zodtNvILxzOnoA+yPPDXSVPVDLk9NAYQ7dO5vvxc8R?=
 =?us-ascii?Q?mhaHFfCKKUwAFaoHZSO7Cx2wXBk+YMunOaaipjVdXf1NnaK1n1CZua3aLiod?=
 =?us-ascii?Q?A22kCXzPscpx04AGgV73jZgc8cgIqRuKTN/AhGH4a5KHp4oRje5uIaZgPNp3?=
 =?us-ascii?Q?m/YUxWlLL32BDWe8dVgnlnQ6m29fHxaK0hYycSXYcd2gjizfj2RFONmqzN33?=
 =?us-ascii?Q?r/bPwAxmFsrC8DYgwG18V7XxOr1FmQAP8YFOsfPEe1JwqpA1MP+UZaw4cgPU?=
 =?us-ascii?Q?c06y9eM5HxeZRkr+b52n5Q5kfSxeqmyCD/U/WdB7PUaPu2pvm0a6NtD+qGQI?=
 =?us-ascii?Q?PSujBdUyPRNSMQTSiaBmn0e6n48I6Ux85Ddl5E9j7Z4eiRWaK4Ii9Ij0xh15?=
 =?us-ascii?Q?z/DyXVGuKOIzH6o/6a2wSYi4+wgUH+Hq+RrftZVSfrSPn1nAyTGRY8VYtXEA?=
 =?us-ascii?Q?9eE4HwOV6qsiWT/IXrC+0gCtZMbBZKuIuVSvBR57Mw8NGYbriRdzb6neZ4Vn?=
 =?us-ascii?Q?8gR/rWvdsM3eVLA0YeD/RsbS6Ym/ViqeTEwPt0u4WqS5bENF7kcmvnjaUcj8?=
 =?us-ascii?Q?1DDwCC6tFfRsP6s6dFhu5sRLsvxWA8vNcZKWXI+AHFCGGL0ZGQC4u8UP04OU?=
 =?us-ascii?Q?83qhlrfIBfxKK6MesDVLN40PyydDmU9nEmSyA/TAqGW9uy3bSosw5Ix1U+oN?=
 =?us-ascii?Q?v5BXHiTUihlIeo1Mqm+rNvd17VE+2n0qbE1u9MH2krmkz8LerLd9IHVHXw/q?=
 =?us-ascii?Q?raPeFkNje24STZ3/q59EfTiESHXYQY/Gusvuam8/fCrRqF2m40OFEhS2G+OF?=
 =?us-ascii?Q?zPFy6B/a3QdL9+o234A9UaHWtlGH8HrKI3GDwbhLEuY2D9QITgxWM6kcjdm6?=
 =?us-ascii?Q?PsLaSh0jusY2O/sD8zXOEzN+U88XSWc2LENfZWVaZQrOwBuSXdj9pJ2KJRRZ?=
 =?us-ascii?Q?tpgf3YZMXibDmNSbjfwthVuPYtsCHmqCLSysTK7ZmX/agEnCfKNq4lwFWx2+?=
 =?us-ascii?Q?5QMGq6+E8oOIGTCGtSeoooVgjy63u4/o9LXhaSI5cWtwJWA7mgaY2PlBjGx0?=
 =?us-ascii?Q?M4Tju8fFSKZ4cmOR/EppMr+1PwKj/ElFAKUnHEGLqv6i9lltjFNh34VQ1F7o?=
 =?us-ascii?Q?WUIZaC4MBtZoDHa12exB+6DJZWgGE/6CAR2+DWP52ThsSwI19NPbl/2Dw881?=
 =?us-ascii?Q?JMfwRLVgAUhhQKX/OgoYYn5KvtZIBqkv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ydJMUTAL9keuzcQUACD3FaWBF+p8j0IA7KvirR2cgxGb85q+CooMmqxfnVn6?=
 =?us-ascii?Q?UGc6B63YCWuozqWdpAsM1/eaBiQzfNuvS0ajsNCKpemqNJey2RzmSocQH5SU?=
 =?us-ascii?Q?4jT13rRppFMK5oUmH2XfDe/vqwfhc5TyUNhCfa96XPFczjvfRM2yJ3SUTqDH?=
 =?us-ascii?Q?u/2k1Qx07k8l7kONH9DpdqAPJP/3xugKeafE5z7UUPBpB/M+qMIbPKwIGSRy?=
 =?us-ascii?Q?FryvuIgntYcRZK0Y1n23EtGjKiYBBHHa6Yf9q02J2CdfwCLrUmaXeQ0J9ysB?=
 =?us-ascii?Q?PonhglEkWUPKeXTZSMRakwYpDaFHq9FMddmGkdmHHU2n4pvfgS57663xTQMv?=
 =?us-ascii?Q?2V1zLCBmQB+J6zBEnObTGFxznxU6HxCK8d928XnrwD37Adzkp8EZJ9YuRQvQ?=
 =?us-ascii?Q?LJUSJEWxlwJiYeEz9cb83LUHTEOgeZei/S9GSn/J3bp/vcr9CveM/VoDTgJz?=
 =?us-ascii?Q?GIlZtiEOSNCBHkPk5+C3J9ApKxxG0E36xq908zEmGSZ1CKvvHYNgqMw9jq5U?=
 =?us-ascii?Q?6lAo6b+tZ13EggTxf7H+lJ3i+RTPcjiGwDspQb7RVLJdIfeYK2apzKkBnSDt?=
 =?us-ascii?Q?SA7FmfDmQxL/aNcwaUlB5mb9WeHrON5Fy3TlNcJCQpFmwdNaN263bmXn3zNM?=
 =?us-ascii?Q?dMt8PTzydZn1Ot1YJph7dnjACwR12MH7lo9xRzJmK2Rq2l2qfkdKaxpxQ81o?=
 =?us-ascii?Q?n3ld1W0ZaB7A++iO2f+lAs/NVKzd09Nt2VyYBerQToPaX+Adwo1hPJ9LG1wm?=
 =?us-ascii?Q?lOp1SSo6wVszCTi0xb8FVnlEi69Qqge/5Kt7JxooS13JE94UHAaH707EwUZh?=
 =?us-ascii?Q?/VvxVMGDgmn0Wx8p+sCXFYcjxLt7BFD4Y642MltsMIAmhChhPt+23DQtAf6q?=
 =?us-ascii?Q?IpjIu1o9/bNiEqDjliYwrSv0qImjkQCTcmI3NB3fZSh1DpgL3BOShsYAbCHq?=
 =?us-ascii?Q?a9yZhp7RDLDlM84QCULjUQM8NUs5HuaKJOwCfLuu+ZlnKLBEKfPnKHM9/v45?=
 =?us-ascii?Q?ErOYHrwKQ6lKNexX88CmLS4+ZQldqVAfT4fG8JhcLp8bkkj6kW7kcqCPngUH?=
 =?us-ascii?Q?O48ddQZHXB/ZCk6VNOkdmwG36XyhGt/HXyKlY/0Cs8qNRksY7u8zVvJaKWpN?=
 =?us-ascii?Q?Jf+pTxZgSyWd1vzR1jSsKA6PxMmvWSUMsJabjy1rTze98lSRtZ8yPiyvzZJ+?=
 =?us-ascii?Q?pwj17czrM2i2FXU0FLyp+LF2rDjR9ztPeiHvVmf4LB4kgj0bxvw2N9GTQzW6?=
 =?us-ascii?Q?pmXeGWaBYgACe6vG6mbQ0+NxUkN1a9Jo98dUBVAQ3hmGu81IJNKpiYc3AdLu?=
 =?us-ascii?Q?kh1IIvo6EcmHMlvCDuyPxMVWqYWSE9+Vdraa0HDo25c78I82D0d18qQR1WjF?=
 =?us-ascii?Q?FoabE6BSGC95/UauZ/UGRP7OOx+Oh7w1eMdhsNiYaFkZQ2w4N8MQtMYXygXA?=
 =?us-ascii?Q?50Jmi9/kAWoIQR8WjVHEJhcm70YAl6lOF69Yn7vjLCPYIDg/YCiUqKoQ6+UT?=
 =?us-ascii?Q?evG7Gx0Y7uquu6sZWWEzz4FMJt4eo5DbwhKCmCNM4Xq4NmVQzgjlU3oAG98A?=
 =?us-ascii?Q?UbE6FCrAe4GGibYX8bpKz/4caBEtDgqXL0tzq9haBo5NLtV53ztUs/WnPUdO?=
 =?us-ascii?Q?4g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3a06d7-5bfb-4ba9-df9d-08dd57e5e0f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 10:51:38.9983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v04+SAZO5MnF4YoF8aTotRjK2hFAAsBKjqmZ7c3bmaPkhI/mk9Z5CQNZPAt/v8h2uCNTSprKzy3Z4ZLB/2XaIM+tV9gmYxNKboCyYOcyILs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13528

Hi Wolfram,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 28 February 2025 09:36
> Subject: Re: [PATCH v3 2/8] mmc: renesas_sdhi: Arrange local variables in=
 reverse xmas tree order
>=20
>=20
> >  	struct tmio_mmc_data *mmd =3D pdev->dev.platform_data;
> > -	struct tmio_mmc_data *mmc_data;
> >  	struct renesas_sdhi_dma *dma_priv;
> > +	struct tmio_mmc_data *mmc_data;
>=20
> I'd prefer to have the same types close to each other.

OK, will drop this patch.

Cheers,
Biju


