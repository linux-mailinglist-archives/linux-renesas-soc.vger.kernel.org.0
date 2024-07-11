Return-Path: <linux-renesas-soc+bounces-7246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB3F92E246
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 10:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13148B26AFD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 08:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A591534EF;
	Thu, 11 Jul 2024 08:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mJKmBcqt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010033.outbound.protection.outlook.com [52.101.229.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194F61514ED;
	Thu, 11 Jul 2024 08:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686570; cv=fail; b=QDz40odHhg20tWALwDGwug9Hfnml2InD8t2yKufTLed7jhv2MiKLISppb+m13eOearBFxk8+V1fXau9er/w/bAaH6zJduNyjpvhSAF8KTCpl5p93Wp3CVfZYwMCsX6+BYJn5BpDBWnjfi5Hc9FQd0wgxp2uG6kGbbbdG9tgQZJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686570; c=relaxed/simple;
	bh=HEtcj06NIfJaligoanXjWCk50hMsu2eclFrCLkvKPlI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s8MoaDreFa6vZbGnG9QR4dhBGCRLCeX8svbaeFGw8lnvFcbahjUy8aNtRqNXdDIC2ljZJH1zLrzl3ItTeqrJsjN1CSUW1uuq1awh/YW3S6b4nqrSwpR1gqBo46l3mugcUAzLwJYojJOkIwOI2RN8n5REI8kjIVmLeE4mSAfcXbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mJKmBcqt; arc=fail smtp.client-ip=52.101.229.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOe6O4EO/k2Sn/CKL5RzutSMEoVoZtQHDCx7OaX/XK+2kCI4tYPbzjKRz/A/rd/BusKQAAld/n54vhbSvKddvoPG/26y6HyN16qmVBsi2swuMhNI/BSSAdOoo6Dt0ZEMFLbH0Nw8S40CdTBROoKRnf9iGOkKmcfZF4tntuc5d0NPJZiX7oYFaUXyaw5o30UpyHSDU5l7Vu8XT8qdFtrfptkyXhfNCjLxh3yaRcQuzC7ZV9hWmw0J8YE17rRYsuYKohVUmRYx3Uvb7Ljz9qCPCZKHpMo40vq0EZBB0RQbWyuj/p4gacKSRe46Ce9SCMb7LPdS6CMQwPKjB9YxpHgdJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJEaGraq9BHrObrtCDjdksN0kEsziWR+ms9QYjXA1OI=;
 b=yY+/DFqT9zVHmk4dAoaVYsu02YBsR3EpEcHS9o2JBimmywDGP8ekzz7RSHf5QTcW2GDXDd8billedfhI59us4qXlSJX3oIJ8/5wCIrfLTMjU77ZDr/Dk2l/9tyD5kKzGRjXE1txyBId9KRyDIETL/gQEJg/W0WUjP/MOtGS1LFS1P15Br9onIyTaQA8bjmyxIYs20GzRWkRb94CGgV5z0HPUXSLciPTKxtoaDs3xdJ+7JPKpcmAI+WvNe/VFpDqkgKNsStvrBQsyruwpu3Bo6n/ULn17sIj/RnIvQV7AsRDph1gcoDEHI0IEQUYIsL3OjuYAHrVahEMjiXjiFy98gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJEaGraq9BHrObrtCDjdksN0kEsziWR+ms9QYjXA1OI=;
 b=mJKmBcqteVQOh+4oaJyO1QdZmRWp19Hwxusnj+NIE7V0HeLOz720gehDZi1/F3BFEAq8/58saYlLZzgzZJnyBR7WpTBbNI/tdRO5QLgFmsLCg4czgyWd2cBtCEmlj3WmxVU9IvQ+rRLnxK4MQ77ub4c14sXZ5p5m8wBy1O6f3yw=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OS3PR01MB8825.jpnprd01.prod.outlook.com (2603:1096:604:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 08:29:24 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%4]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 08:29:24 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 00/14] clk: renesas: rcar-gen4: Fractional PLL
 improvements
Thread-Topic: [PATCH 00/14] clk: renesas: rcar-gen4: Fractional PLL
 improvements
Thread-Index: AQHa0sqYjZpe90dDGU+x52ogoYdJy7HxMlDA
Date: Thu, 11 Jul 2024 08:29:24 +0000
Message-ID:
 <TYCPR01MB110400CA4023266B96C8077DFD8A52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <cover.1720616233.git.geert+renesas@glider.be>
In-Reply-To: <cover.1720616233.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OS3PR01MB8825:EE_
x-ms-office365-filtering-correlation-id: b6c7ca7c-2eb1-4f61-f730-08dca1839209
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dcp3nyPJTkT7jkjiO1CVMQdZFzMsf+V4Bm7xjbOm07wrKOEj70Gdq+rKIP5N?=
 =?us-ascii?Q?Ms8d+nRsrDQso9iTSftZFqhH0997sjwudxZju8jlPnyTDOW/mmGjqShP1gRy?=
 =?us-ascii?Q?XZtH/WXIg9i8Uz457spOo5gUWV573hH3x8HYap5p65bIO7HcsnE0lFnZWP38?=
 =?us-ascii?Q?nFU6vqJcW0CyLjHq6YWm7JiIbdCIwYzm/xtpDDp6QxlaRvIUkp1FMjc7ohfp?=
 =?us-ascii?Q?/BYOtSgL6J/RpCcqIiHaL+upAPvgH4S/M8UuqbfhjCtiGyOH6xOB8TgrF74s?=
 =?us-ascii?Q?BwIdsUWMLITmynrjsBfaQ6brhwSl1VcrhAZukAHNKL94yiuYHFA109NePt9W?=
 =?us-ascii?Q?sOyPU4OnZ8e+ekzAEVrGujCAvAtuzB/EwJkXtjUYIUeOt3VLxx5lbw3MAsT6?=
 =?us-ascii?Q?ZA0Homb5R4XxPG6SYktdUomAIzCgJYEC08Dznn7BeMEFn6izAhEHAgFpdPm6?=
 =?us-ascii?Q?AnXbGFpR5dDIgG3ivU7jnbvG9+fP9rAaTjAV94DOGdSACwcgxZkg+g9gCZPP?=
 =?us-ascii?Q?umvjsuZ1k4rJssZTneMp2h2jDbQQTKFeWHfC4Af4gfVfy7SCspvM2tP1qsEO?=
 =?us-ascii?Q?LdnKR6naSZly25bY8ZN0YWlOYMyDeZSWcZW1K7b9Y6NnHWw6msOGvevSsKzQ?=
 =?us-ascii?Q?oD60So7Bvbt9xrWqZluWJbcr/8bOjjCD/uFTMAhDi2vTlWxF0DYqgTOeaSha?=
 =?us-ascii?Q?8xkzAlSf8KCik7Om6rDX7XgXFaXFm4Ud8UsWaWVU+JcjTs2zgrxo+f2CWIRR?=
 =?us-ascii?Q?F3WvOuyE8QNEbb+b1woxByF/CuTq9FprPOjXncznXuMhuOEf8YIWCpmMit9r?=
 =?us-ascii?Q?nkosIjdT4ILhn3+LlFRfQX7llDVPtnx3o0jUKG0FMjBB5ciTJsvwt2M4nhZG?=
 =?us-ascii?Q?CU4/buxMBycDbXaDiSh5sREszKqpeI/njzp70kxn0CFoTUPrSjob2ykxETTS?=
 =?us-ascii?Q?Kv16PXlapuD6lwPy+ofseHjfZxyjRKSNgNk9TJnGttiPCeBCZw+OPKh14Uat?=
 =?us-ascii?Q?V9Tris+ULNM+8F6yaclObMqap8DbvtxtbucH1hAnUaQNLkYWXFV2/Mw19R+s?=
 =?us-ascii?Q?IQQXdwWJuafw9FI5RVYM2eQ3LyzntZbIHhuO+ZulL90WttDCMdFjpSUqWScQ?=
 =?us-ascii?Q?KmqUJk/DPyUFGusH7fPwYTBDejpgP3R67MT2Id9AKXvIMz14TOaLpaHqBdbp?=
 =?us-ascii?Q?RisAS+7oeDwlLG530dtpahnIbOlY8ysRO4RxrpgEtY6DrfYauW1/qhu8ro4I?=
 =?us-ascii?Q?oYGKjGq8p45xYKS4dCNvytCW9dHimcq/eZMOyDBC6lCplab/jGH/dFg0dN1A?=
 =?us-ascii?Q?DGU6+scJYk9Psh6O8vkS+VyiJ98TTpaqbd7uBxuACG6BNq3lsqmke9C392J5?=
 =?us-ascii?Q?Klw1Ty7/PbYOvrIP0V7UiDHYrBejQy5mZsc2UVjJYMyr0ztKcw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7A7MsXj/HU34MiZeVb8Offmztr7lPRdoEU7xIMyfqLoI9IPaeqR8HIUTphpx?=
 =?us-ascii?Q?P7KxAeEC1qGbZdv5EfOi+JKkaobLQIymwujhQzTvj/FmO0qFyss3+kkeXxhc?=
 =?us-ascii?Q?7ZY9l9lh+hhND75HBvh0UKRfvJTnIITjh4ZhrbNbqHOJcGOqJn9cKym/0OHy?=
 =?us-ascii?Q?yPBPEurjxlFvmsqLnWeUomD4Nh7ldnQO479Azl5hggZGgkfwovlwNXfrLadY?=
 =?us-ascii?Q?pZwRcxEVROzfB/cvF9h7V+cP+SJaQ8izVjkpLU4fyAO2Nb4r0WFIdE1R6Y91?=
 =?us-ascii?Q?pVNn1mQ5I2/XiuMZ15nFPu8FCdjbcjOtinCz25rnmplnhe4BTa/oAYaj4r9o?=
 =?us-ascii?Q?uyQCU4Ap51+LAP+LJDWG0pK3PbbnrTw/P0q8mqbFMl/wKHmYrU3SKZJ+8Rsu?=
 =?us-ascii?Q?0Lm/ALI+bdl5mII6ifrXafDD02HiBbanLI/h5+XU/xx2qCjVQ7bs/DeZKFOJ?=
 =?us-ascii?Q?b9SSBPPzwIVqdwBURnTEoS79hjjqOvl7n91zGHJ5go+omhZZx1mCJQlC4YRF?=
 =?us-ascii?Q?nvW18C/S0tKQGmIbOwT2wQfJBnWOd4vigilPJQ5V+Lm0udaF8ldg0REe7GlW?=
 =?us-ascii?Q?xbXQEUhfMiN3Th03xYm0FXU4eOoc4wLfcNW5ks1Z3WWs2iKuTobNC2ywTmP5?=
 =?us-ascii?Q?hOOCh5mMTC71IaSUWtW3YA+XkVoP2zqERpywwiRyshtDMW81xnJgWnrcNzQD?=
 =?us-ascii?Q?aFfXTJ13mS7Fn+3xm8Pww75HQcS51TkNPoBPKHxcqQaKLHGcK3oXZDExwV1m?=
 =?us-ascii?Q?l1PVAEqI61bzl2rZg3D/QYAD7vPwTu4OXMk35jdSWtDS6AY8cZtX4D4hBvRp?=
 =?us-ascii?Q?vraM/riiTX/TQmUKMImBpuzA9H1Amqp/zK2Vnn9avp6/tghOQKqeZNi5SgPP?=
 =?us-ascii?Q?wZfTZYoIrSiBpHyv1fJ+0WhAjPZAnhw+78U/nYFnWXOJ7YVA4i7jflJ0IW5a?=
 =?us-ascii?Q?qklv+FGRGlN+k2HVrP7RNPJ4rUIOexaHymv7Kf4+iMOt1WUXaDeXZjXwWKb1?=
 =?us-ascii?Q?2Y71sgBCvE6b81rbG5Pgs0CG/5YdsR7Iap/7GYYi3rLn3DuGUI31o9R6zvFj?=
 =?us-ascii?Q?SQ/0bt/uzG3qdeAbFuzDHQrvE2QJaZI16imSAWj44STQSso43/jVtDEALzep?=
 =?us-ascii?Q?GIdl3RZUGRcS0I/Q8Nb5P9+61Jlte5bVZOsLvdk0DO3IAPaCNivY7kxnL3LM?=
 =?us-ascii?Q?ZH7stBqZVq2GOkKRwpdYZpk1pWbHnlTwdTcGxi7YbzRZr7whzPrIGg7hrPVm?=
 =?us-ascii?Q?oux7x0rvwDNL/TbElSXiK3bJ+4liaMkMl6m/k0YZPQHQ3J6N8TTH9mN2VNZ+?=
 =?us-ascii?Q?mcKocUfLM3y0NC2tF8d4LqMiWpd96lo1n6RHt6LdaOqz5x+Jdg1WqzAYHmFV?=
 =?us-ascii?Q?ViS5X97R4GoTG8yY4fuy95XdC+GUhJv/cjTaAiaOqv3ma+SrxDEJtPkv+nMW?=
 =?us-ascii?Q?8IwG6QoucwPaX/oMgfQqdpMK3rj1tFfURvvlAH1ndzWA1kVlg8Lfm996ujLg?=
 =?us-ascii?Q?fC2IuaHDMxj5grP8QHtYwZ8H4C/BCgS72C1l2c8t3Kjh5IU42lfALbxKWo5h?=
 =?us-ascii?Q?mXhoIqBxJ9sJcKlUWMRxJ5c7JwpeG++T2XD7jMAxo8zWqVmq6lfxaqdLOXof?=
 =?us-ascii?Q?DA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c7ca7c-2eb1-4f61-f730-08dca1839209
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 08:29:24.2576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: riHHhlJDcU8NCEuSYLSTod1PiYDOr4Re6f2nXkyEua+3WUT5YPKh12BNJLkuxlJbCe/I2N3tIQGJONLCkijqY+SNyEGFM+41T97adBBqU2rn/XfOxNbiGmr72zkVhhiY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8825

Hello Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, July 10, 2024 10:11 PM
>=20
> 	Hi all,
>=20
> Currently, almost all PLLs on R-Car Gen4 SoCs are modelled as fixed
> divider clocks, based on the state of the mode pins.  The only exception
> is PLL2 on R-Car V4H, which uses a custom clock driver to support High
> Performance mode on the Cortex-A76 CPU cores.
>=20
> However, the boot loader stack may have changed the actual PLL
> configuration from the default, leading to incorrect clock frequencies.
> A typical sympton is a CPU core running much slower than reported by
> Linux.
>=20
> This patch series enhances PLL support on R-Car Gen4 support by
> obtaining the actual PLL configuration from the hardware.  As these PLLs
> can be configured for fractional multiplication, an old patch to add
> support fractional multiplication is revived, too.  Of course some
> cleanups are included, too.

Thank you for the patches! I reviewed all patches and it seems good.
# I sent a nit comment on the patch 4/14 though.

So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> Note that struct rcar_gen4_cpg_pll_config still contains the default
> multipliers and dividers for PLL1/2/3/4/6, while they are no longer
> used. Probably they should be removed, too.  Or do you think we should
> retain them for documentation purposes>

I think that retaining them is good for the documentation purposes.

Best regards,
Yoshihiro Shimoda

> Thanks for your comments!
>=20
> Geert Uytterhoeven (14):
>   clk: renesas: rcar-gen4: Removed unused SSMODE_* definitions
>   clk: renesas: rcar-gen4: Clarify custom PLL clock support
>   clk: renesas: rcar-gen4: Use FIELD_GET()
>   clk: renesas: rcar-gen4: Use defines for common CPG registers
>   clk: renesas: rcar-gen4: Add support for fractional multiplication
>   clk: renesas: rcar-gen4: Add support for variable fractional PLLs
>   clk: renesas: rcar-gen4: Add support for fixed variable PLLs
>   clk: renesas: rcar-gen4: Add support for fractional 9.24 PLLs
>   clk: renesas: r8a779a0: Use defines for PLL control registers
>   clk: renesas: r8a779f0: Model PLL1/2/3/6 as fractional PLLs
>   clk: renesas: r8a779g0: Model PLL1/3/4/6 as fractional PLLs
>   clk: renesas: r8a779h0: Model PLL1/2/3/4/6 as fractional PLLs
>   clk: renesas: rcar-gen4: Remove unused variable PLL2 clock type
>   clk: renesas: rcar-gen4: Remove unused fixed PLL clock types
>=20
>  drivers/clk/renesas/r8a779a0-cpg-mssr.c |  25 +--
>  drivers/clk/renesas/r8a779f0-cpg-mssr.c |  18 +-
>  drivers/clk/renesas/r8a779g0-cpg-mssr.c |  26 +--
>  drivers/clk/renesas/r8a779h0-cpg-mssr.c |  22 +--
>  drivers/clk/renesas/rcar-gen4-cpg.c     | 209 ++++++++++++++++--------
>  drivers/clk/renesas/rcar-gen4-cpg.h     |  28 +++-
>  6 files changed, 209 insertions(+), 119 deletions(-)
>=20
> --
> 2.34.1
>=20
> Gr{oetje,eeting}s,
>=20
> 						Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
> 							    -- Linus Torvalds

