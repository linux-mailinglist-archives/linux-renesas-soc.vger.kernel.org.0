Return-Path: <linux-renesas-soc+bounces-11875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B45A0235B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 11:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB72C1884DAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 10:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18841DB929;
	Mon,  6 Jan 2025 10:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JqWO7d84"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD4C1DA61E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jan 2025 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736160429; cv=fail; b=t/NJAnm6ZYfyzRDgvXHiP1RLRi5khQWgP3gIHw+Z7b/7PDsf1wbkOEYpowB/4D/ikkbP9rL13JUuln6zmGIHALlfEndku9YcKLGsAm5p20bOEiaNhWvUS5qvZ3s7MNTO07hOFRIFzaMXTHMCOYy93lE26jXGlEUMkzyGgHGZr0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736160429; c=relaxed/simple;
	bh=UPJUW5QrXHsBrsHyyi0YvS1vDGi2xEBp9tPZ2PdPGv4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tDfSIXlCltwVRo39FXZYGGuWZcbXdqikD6UgnM0645Cs2E8vi4VJpYUtin4ebE1NQsvMrIIsAhWAMk7hGWGTb+srNNYOAPba6/xAfajCI+G0opd+g/e6RWYebG87zraPmcioL6nLOCKp1k4AZJr1qovQzwPyX3LiitO/w/HHr9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JqWO7d84; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGnx5zBLciM7pfsjqksx5SKA9E0vLd4Y8eir0YuEJuwAjWjiqX1kg48PlT8nEzR8Kw2JAJk7uQOt1Zg6Tn4qVVMV37WdgKgdgB+Ioc2UXjK4vmh02e7BF6oUnvR7vApLjoehnzCPxpAGznA2nOjWTyn7uNbWenVmG5j/eYZhYjeHSAmYxqZqo5d1CC2tYphjBtIT1Ebc/hskSCswJNT1qNyvo8yABuG0VTirrE5g4oB+9ZPITGMltwMWgPmomzsq4/BLYSAJrJsAq3pcQRMrtm/iSWckoPcIsLGbe3yZhXNJZ/l9HCW348ywZnrekc9kOts6vjkzYEb+QcDgx4KOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bq8jGx+AF7YhYECobPT0IxuCWVSmotI/Xk+XJr0HhS0=;
 b=Th67XYVL62OwuCaoKxS6CRxSIGcjwQvA1PsFzfDTaO7V+ftAeVKtkpirEjSAhvO02wIzFPakwAlwYP8XUrFxmB53Cv9J40+8asVvp8LvxFL43AMwoDK8OAaZ0qLXGjcWaGYlJ+9TLgqP9AX4jDQ6X6cO15gO980y3eGAz6SCEvcdJTFnxgMdP6aubvrqprLEFEuzhslnGTjSdcxmVhyYCP5aGs6jxMz6PBrLBIvTuDqXgUierl+/Ha2xnrFvWxM6jGHpcFl58bpSrC+MMbkcTRJhnyLOKYoB1iKl+DcS2hffR+gMSI2NMD3MpA09trzcZxy/GBCfYwZbT4t3PCGO3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bq8jGx+AF7YhYECobPT0IxuCWVSmotI/Xk+XJr0HhS0=;
 b=JqWO7d84kjUjEo+V7efrO86bK5nlOr5zIaw+QzX585hVYiigeQijP14zaiWK+qcrmSV4v5w1WD7VyMApU1D3t9/E9dye+vqWZ3W1PNx2xayDFp9R5HBgNZzahg+o1s3wV5wqbLM2KkUJFmYfGGCZlfqDaRRMT3p7gT9HC6kIk28=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OSZPR01MB9394.jpnprd01.prod.outlook.com (2603:1096:604:1d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 10:47:04 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%7]) with mapi id 15.20.8314.013; Mon, 6 Jan 2025
 10:47:04 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, "mchehab@kernel.org"
	<mchehab@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] media: rcar_drif: Fix an OF node leak in
 rcar_drif_bond_enabled()
Thread-Topic: [PATCH] media: rcar_drif: Fix an OF node leak in
 rcar_drif_bond_enabled()
Thread-Index: AQHbX2KG9d+aL9kaFUa3cqPld+/E27MJkO/Q
Date: Mon, 6 Jan 2025 10:47:03 +0000
Message-ID:
 <TYCPR01MB12093E9362EDBB2F2BC1EA59BC2102@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250105111050.3859712-1-joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <20250105111050.3859712-1-joe@pf.is.s.u-tokyo.ac.jp>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OSZPR01MB9394:EE_
x-ms-office365-filtering-correlation-id: fadc7b8c-05ed-4a93-7dfc-08dd2e3f7536
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?kz6b57iQK5qZ7FUz5uBhPJrtBNRtg0Zw+xUotWt+AcR3QSSIPczFrD7NW8nd?=
 =?us-ascii?Q?5qu13XsUgm8e9blqMsCbTpcjie/lxOCqUd2rrxhRogfH+tmQoY2VTTHdwns4?=
 =?us-ascii?Q?T2EhycA1pVgd90eMM8cUivqzDlIjhDz9raBgAOUOM5zIfSakEFNoTqg7RmtB?=
 =?us-ascii?Q?yqG7SsCnd400rkqn/bhOhJ4B4bUfK3o1JvJYl36fHYr0zM3sMYrZ/U1ux1Fk?=
 =?us-ascii?Q?K+D17oLF5CXVZPnXhvNjjVCjoOZfiU/1dJSAatXrTjlZGHtwRdOL0sOdXVmS?=
 =?us-ascii?Q?I3CfMXUdZzIOyl2z1/7AnuzSCEOt/OUPq2KKYkUK5sPOB9tpNrts7VpzOrZ9?=
 =?us-ascii?Q?TgdbKudtKc/mFcjzKv7i5luENT7d/iqpvfb7MwOhxUjj25Ig8u8oDoWlIL7S?=
 =?us-ascii?Q?GEw+YdD+cfbhZrwN7ZIqzu8tEweBjuyH4iE8tZyxn+sLH4eeum3SfYQfUDCh?=
 =?us-ascii?Q?MOwUX+0p6lAFteFFN+J5G1NAmv/yFiJ1xQYB9FK79UnzpDfeun/OidySW318?=
 =?us-ascii?Q?Y5jPi1s29UoHiQ4Cy12aLbS79AF/Ok57CW4Ig0Jd+/4zIsziHcrh2qZUf41w?=
 =?us-ascii?Q?4YlrMUHr7JVe1FPRbFUMuxKpk7Morn4PziFWaC5a5PhPf5YWzX2JLSPPlhwF?=
 =?us-ascii?Q?XwV9ea3IoshD+5p7xnOBsX1oUtpilDdKEuB4AhxYOcPbH/xa1VdEGpNswjMP?=
 =?us-ascii?Q?Jtb7UJxUmowdyumW4L2FFYZl0mdK+ALb6I6ju8aD55kS6/ayQ4HTQuJuJvyR?=
 =?us-ascii?Q?U6mkbbd0xQa8dxNf2N7KDnY1eNSyWf4qgsEsQ+MEr71cPtSfgy2yn6uBls7e?=
 =?us-ascii?Q?cl0kMHpCbdC8R20Zz53zu5fgeCyubMZ67B69Q/rP5fi4JKMiznz47PKS1sDW?=
 =?us-ascii?Q?MLd+jHgNt+SGuQw+6ddnALiNKB7IjoIIk+pI7Biw+lQ+WNA9vr5vjdLmlhmn?=
 =?us-ascii?Q?7RFa/E8fWysukQH5HWDxSdWspfd2I4g2EyLpOAJqJKI+lw+t/C80knrJ2d2d?=
 =?us-ascii?Q?BNCBO/YaFXEvelB3YJDGCjqQUNcksbSZwlTaCPGMOqlWgwWKcKr/YC4uAe/4?=
 =?us-ascii?Q?kMrQcsNEDxSSFF2loU9FMZ21ubunOBooL+B2MtP/qcP1kKAYJNWVtmLgEGar?=
 =?us-ascii?Q?GFF8oRFzsGjgICXSmDvWrwwFobm450fwrG+x0jScnfXJPGEnx69ows2nuZU6?=
 =?us-ascii?Q?qjgZagVRMscPzxk9r8Ks2lII2+wqXeRAer9LErlAVl9ax4PYGY4s1B3b2Gaj?=
 =?us-ascii?Q?xEa47fqLLUZonbD0+HfBy3WVTZdWXIILT+8SgW1ACVtBg2YGOkVk+dyMzBkr?=
 =?us-ascii?Q?dbyplvmxF020U1aDgkZN76+P8iqymFsXAzpAF1zjsnDvli4x4vGQ9THE9DCA?=
 =?us-ascii?Q?4YoERAO8/L/fJJ3N/E6wzSw/1Qh1xQCI6Ji3k/33C8ib5l7ZuQf/diYL9flG?=
 =?us-ascii?Q?O/RhZwp6Lz8kx2aa2Y/hA4f45bgVhYvP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?v3pfelNfX8U6Rqm9sNIRomtxa09CPpRqXPm1Fio9NEYuFwK+nLvcfZM36OyA?=
 =?us-ascii?Q?8GS2QdEApc1W5BbimD9cXKi0apMWoy/sP167lyr/4rfiFyxvzEE+tuy30AtT?=
 =?us-ascii?Q?JftAxRawsmLCjHDfWQrKDCgyk4SoHB4qEsrhZeFBACvScgiir5V/IEJVdLN6?=
 =?us-ascii?Q?02ZG7ecTJyiXAU7BsU5PbtBOy/FDJ8hAKicE1fAW0pBcJWFiYxhSIvueelJ1?=
 =?us-ascii?Q?QrUXDmc8dYzLdBCB/WU6cuW6l32TgspT5XaH/MjJLN780ksFbTeUdOUpjf3H?=
 =?us-ascii?Q?8sX1pxdfJzQQSRUDTlKP154H3Xs2SS597Ezcfmtk2PZQPHsc1qHAnyRv4v1U?=
 =?us-ascii?Q?wiI0uRG6LWiHi16abpJvDITGTn+Fgr0yzmuQNm3yfNx7ksg+jqaLpowJ6Tyb?=
 =?us-ascii?Q?J5nQNmNapYoySMTa2sZeEnLRYQPL7zePn1eSMRBEdAgxyCSXFacti3p8nRfY?=
 =?us-ascii?Q?MwieVnDQzeU+IWGDf2CJgCqu+JvlE8/V5e+a2lhG1EDhJq2u2A51bdrCA73N?=
 =?us-ascii?Q?4m8MB3Jw04FlBS3MB0S7Dzn3sU2hnQG4iIo2WnBpvEAgoGLR11IQa+/b0Xgd?=
 =?us-ascii?Q?AQyr+Oa2iWtPifk3eNH8ZZ/2Xroso9VYoTm9vp5BcPbR7appZj0K6R0WNG/u?=
 =?us-ascii?Q?fQaKUDXSW4ZnJs6fLpOfqRxgvbAbKLSRbJ0m53rRUD8ByyzpDe8CYlXxVy/T?=
 =?us-ascii?Q?QBoodo//8Xu9MrVs3qYINkpDCKCYyylyIShfbkEGxBN7upH5P7tRp8Ju4rO0?=
 =?us-ascii?Q?44J9R5ZAR5QRYeSy31v5AS7cuG8XyXwJFlMWwBLsgW9QRr32O38nTQhDI4yj?=
 =?us-ascii?Q?y8/ItynYceLWXwcRzkz9re1b30KxETzGUigsO6KsCwfaoTZGz+FnkrRHqif6?=
 =?us-ascii?Q?lk0kK6MvNiU+VlbFrRBZ1C5J0AKFM7zHlcuAs3g3oRjIrGeA0Q+J6dKcqDNw?=
 =?us-ascii?Q?+pZWCwbtNQXJaJWCFMRWw2nOE5x/niVW27zG9BS1Y03VjDcIsxe+iKEhiUoT?=
 =?us-ascii?Q?1h45Ihqu1H4kc26Y6Z5r0Nhi8m5TICBmA1XN+iuTUgWYSu0lZxlvNAiCyAyO?=
 =?us-ascii?Q?1YiUyvcC6/NCVB79yL3KFI5a6G5Xj45XJoK8Z5apm6KgOnhQYSUH6MgHU1J/?=
 =?us-ascii?Q?XWmZhgU9XbB5xiaEAyo56OHRaWaD7AyPzRntFYGbL/3HDV3jt7PTom0tu7gt?=
 =?us-ascii?Q?E2xo+1KKpVS+0GLOvU9pc06a+jfroHWIegjDHyneO6i7BOPIQQh9LABnNP6Z?=
 =?us-ascii?Q?p0Ccxbgnib737EtZ4aPwWRmSgwhBu0L0LsUGjf2EdRJXO/D7QB+KlpXIAbGt?=
 =?us-ascii?Q?5X5OsVrG0mjt2qcjOPA7YeqLFLezVn48Q2xIvDSgSUBXF5ElZTEgG2rD8PLH?=
 =?us-ascii?Q?q9BcJaGeO6adV5iuuRWcot+EZb7kOWORILE70UZYjW7o+DqTvR6BO1AdxJUh?=
 =?us-ascii?Q?NSz4l76hY1OUeo6pIE3fsZrqRWGpahAfgwVX9cka7HbNbs+ZVOWCR1PAbMQF?=
 =?us-ascii?Q?WWr4mjZtI+3TRf1bTY20Y/cw4P0q+WCFcNaLsHeZjOpLiiUlYvoe03nAM3mG?=
 =?us-ascii?Q?/Ck765TyFr7vVXIptwlLmPb7HJv3NKzsYU9LToxNbNErvgDzDbO2LjWyeoPf?=
 =?us-ascii?Q?ig=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fadc7b8c-05ed-4a93-7dfc-08dd2e3f7536
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 10:47:04.0190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vGJBgUTvxDpblhnShpB16BZXGwnY66HX1h6Eoa4hKU6yzmJbbDScPL2OIOSlrovhBJ++shd936Moo8Uwwqww3EG6gl9KgJ25qc6wZZ1tds8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9394

> From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> Sent: 05 January 2025 11:11
> To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>; mchehab@kernel.org
> Cc: linux-renesas-soc@vger.kernel.org; Joe Hattori <joe@pf.is.s.u-tokyo.a=
c.jp>
> Subject: [PATCH] media: rcar_drif: Fix an OF node leak in rcar_drif_bond_=
enabled()
>=20
> rcar_drif_bond_enabled() leaks an OF node reference when the
> of_parse_phandle() returns a node and of_device_is_available() is false.
> Add a of_node_put() call before returning NULL.
>=20
> This was found by an experimental verifier that I am developing. Due to
> the lack of the actual device, no runtime test was able to be performed.
>=20
> Fixes: 7625ee981af1 ("[media] media: platform: rcar_drif: Add DRIF suppor=
t")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Cheers,
Fab

> ---
>  drivers/media/platform/renesas/rcar_drif.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/p=
latform/renesas/rcar_drif.c
> index fc8b6bbef793..c5d676eb1091 100644
> --- a/drivers/media/platform/renesas/rcar_drif.c
> +++ b/drivers/media/platform/renesas/rcar_drif.c
> @@ -1246,6 +1246,7 @@ static struct device_node *rcar_drif_bond_enabled(s=
truct platform_device *p)
>  	if (np && of_device_is_available(np))
>  		return np;
>=20
> +	of_node_put(np);
>  	return NULL;
>  }
>=20
> --
> 2.34.1


