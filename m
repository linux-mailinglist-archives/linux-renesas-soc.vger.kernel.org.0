Return-Path: <linux-renesas-soc+bounces-13445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA8BA3EA8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 03:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB61470194F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 02:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD851CAA80;
	Fri, 21 Feb 2025 02:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="d/v8fY93"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630EC2AD0F;
	Fri, 21 Feb 2025 02:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740103685; cv=fail; b=rrADqjlmEpnTkKHEsv/FmVPwtEJA7f6+vAD+ELG/5ov9doEiMLoGTHZlCT47EyiMp7kS7F2iUZT+6cyDteq0dAFassLd3hzxamIOhBMwP3Xmf9KixcT4Z0H2d9Arn7qq36bMxdrQrgnp9Ux9QN62hHqTpxmy9OjIZEa4X+iKrl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740103685; c=relaxed/simple;
	bh=R0OdWDJhVHwxpPIViwW8VQIHs7mBN5Eee3w9GlkyXXY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FN/aeeMEByOMVdGCXaiCk3kZte/BCNll9nyOeEcHHA3mU15Y3toHsjMK9rqWF3WCGLTqgP8uf2VQezcg1osfWG1U7RbVulVvaY/GRYBJ5Zz3Y8OFwlQWtGU/T4tlYGCe8UbZMk8Sdhdv/bxA+mSWgG7W4k3Uu2b+n6QgTEl8d2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=d/v8fY93; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuJaK/d51/TSP9oosU2alhd1+A0heHrh0ccXfr0qudyQieEpUZmK9tAmQyUlXPUHzgbVqEcL7JR3vHnqPhNtzCgSU/ukuXAnftt5gsGtTJUvbovUEpuD2mHFJWReurC0Dlq+NvGYa63JCUUEofRz1YRwjP1jHrK6GpZPj6xVfSyJGoQABo/0vxMWYBTLXLoHUYsyRQJwrpIAE1mMrgbJVJvUzX7Zrl3dnamuccFDaBEBIFydlYzL1z6UASkqG2zJf7wP5sEmuL6ODjVf0tuDG6ka0V6aiVVjco+I2pBuKQ+LBnCwmprQNUQpCk78bEytPc5TKaYQI8fypoZ3kDh+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDb5f/1HB/DRdxuLAUv3P8Z0JWwshDV3BkQIDJBuxsY=;
 b=LYtB8YwN0V8hU/xIPuMY8j8jClTdauJyMnTXJC4zs6YYYZlVpTz/k4RgYtRXG8EoclbO4HFiXJy7DvHvExEjgTNrpCh93X6XeAIZ4eetG4WhJaqYMwFwgKuRSDKqRjbpyb21xAuKYdnLWgBPb7YrAQCchwi0gdGCeODmvEZ51FU2V67kKG4w0BQi/3NLyvQTkjiDvicOOecwkoEC8mwCJ28f3FM0CsbM6IAe0zavHtx+ol3UyCmzXaJv+8ZyI2FlSrmLIOwY9LvAk/nES47gDb40QDP2Tc2UzSzu9YdoB+H8uSrS5iqaQrLQyLGMmPKoq22xcx9GXPON+BHcQZ3+oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDb5f/1HB/DRdxuLAUv3P8Z0JWwshDV3BkQIDJBuxsY=;
 b=d/v8fY93j9AhV9mTYwdxLhxAgVV+R6SCprraM16caeC4ta1epAHNOfLIc90w2wR111VgF2cd9oN8qYmM0Rrj3+kZF6CLGFetBlhl0zt4ngwjtAnf2TDny31TDovsD0DyIDkKhjMSjfsr5Onyy6vW/t6OpZYZLBs48YEZP5SWk1A=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by OSZPR01MB8482.jpnprd01.prod.outlook.com (2603:1096:604:183::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 02:08:00 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 02:08:00 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>, "phil.edworthy@renesas.com"
	<phil.edworthy@renesas.com>, "balbi@ti.com" <balbi@ti.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>
CC: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH RFT 0/3] usb: renesas_usbhs: Fixes for renesas_usbhs
Thread-Topic: [PATCH RFT 0/3] usb: renesas_usbhs: Fixes for renesas_usbhs
Thread-Index: AQHbgukdvuYegvZrMEmqpiUImkfIprNRBNeg
Date: Fri, 21 Feb 2025 02:08:00 +0000
Message-ID:
 <TYCPR01MB11040F182E1964FCEE18292C0D8C72@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|OSZPR01MB8482:EE_
x-ms-office365-filtering-correlation-id: f5c00b0d-64a8-451b-04c7-08dd521c914a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?722jVdlkBfE+kwa1fG8pv/oG2N+b2DnKRxkyKdpH36T+lilw7VivAl8xTOhR?=
 =?us-ascii?Q?VQB2p/LYarXMVbFAPVDzM45tqsoHtH5JTglr68TYG6hygUi29CCffitzLFVT?=
 =?us-ascii?Q?PQfHXI3mQZbuXdiAQzMeHM1AWJdUEQYR+zLXAWecziSJY5iidYfz2HndZRRd?=
 =?us-ascii?Q?iexnZwBfYhowKJWmxzCAJpM0ptjBK2//e4oyOxAT9DkRprgs3QB3/iHV9UCB?=
 =?us-ascii?Q?YjGVl57wNS11Lm6m1MtRsuxygBQv/3JnD67kYvWEm+K/Z724sfNcr8A+s3Y9?=
 =?us-ascii?Q?F4G0k9QoTDEOxvCFYYBtnxq5gOKdkEBO4BsH2M5q4Pw0D3eAwUFD/EDOzDaS?=
 =?us-ascii?Q?myQqGlytFfZHAzOdAYp71HJTmY58/dgcS5kDlaGgzccQywIY82WIjA5oKGUv?=
 =?us-ascii?Q?I2yq4kJom6jA6nh19tX4Z6o47OhFQ8r+xtbJEZfxRNq+LRdtS5EkKHzhI7Ld?=
 =?us-ascii?Q?RsD/sO6K+nngeZsEkGOrU8njK+ThkFtAAMWwMPqgDTadMA1vkTnuJgY2F1ct?=
 =?us-ascii?Q?MuOdOuZTTym8mdMr6ifCsf8oUt5JwAMQqNcnQaEAlBsBKn+mRvSIutMnUzJt?=
 =?us-ascii?Q?Khq+uI4ifl9n7MbHc8+EHz2KmZ4feWd0UgfBLGLU/xuvBysVL7dlqplT/Lhx?=
 =?us-ascii?Q?PQJkEi3BT06RQdvtwhT70ZMef8c7bpa/Pr7W7jmRskp3a+TSLRAFASJL7pz6?=
 =?us-ascii?Q?g1AW/FXsB2lgwl9EN9SSLGAbWTd2Lrff2O7lYkAzAtdr5JDDrCXUtj+bOokV?=
 =?us-ascii?Q?D7s+LIprPU0qpY8cI2+a2b9vlbxnOMuMKu8WtwyLR1Bda74nORjNO3syiJEe?=
 =?us-ascii?Q?T4Z0Krq4xqZ3uTLtm8aDh12OsK6YT85v4CSho/0lFwtUzYC5wV69QIzqC+YY?=
 =?us-ascii?Q?1ZjvPTAWIY8wbG6lthSjAmOzH2Vwt5NroTsUrbt4QQQ2IsZGCrfL8N4DnqdC?=
 =?us-ascii?Q?xSd2/Vhw/C7JalrtJFa6bqJO3b/thiStdnh1HagvgzS9w2qYW5rUoyMqRJtn?=
 =?us-ascii?Q?W5f9Ns7ZV7ZamVaum3vQ6eBsziA1m8sp/fn+LGvW+1vYVKjn/PjNjgTl/AYv?=
 =?us-ascii?Q?CWf8qJU1OXHWmZpJRuVjq+w8ifn2Tx56Z4fAaEmrWMbXXwJPyzfgd/av3z6N?=
 =?us-ascii?Q?wbQqE6oylZWrLghMKtY0gBa+P90cRLT36cKDyyr65sR055yJgjLeKx/YDj21?=
 =?us-ascii?Q?Ss8wCMu/5juLJz9l5eYFd/4jd5AYC+LpUA8js9KC/ZVRHO1x3FdpSC8RHfAO?=
 =?us-ascii?Q?PEs9xt81ijpxAIRyXPCFprlgEkEtqNl08JABHxSrWszACBWmRNlTp9RhVJe5?=
 =?us-ascii?Q?28OqaAUJaoTv69PJzLwA3tXSRgsfBdnZkYDNBsKxwJSm+4mZ8pNj+QzRtQ9h?=
 =?us-ascii?Q?sMt+9zu5pr9zVnZZAes0izrSVY0JZyjOPYTsEZ70aK3mJyfkfeF+1Qahgfff?=
 =?us-ascii?Q?EgQhwwph45OkMTKl0h9lrYEXwaqn2WLu?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jaBQ2rAkzn/vgiRysKsQUNRqd6SJ/CJ4CGHjxbldoHaKBjSRFWUWou6BsZVd?=
 =?us-ascii?Q?BpFpQtekPKa2rKm/85LhZmemY6aCCOHumDRuk9NJhO//8b+cqvidfJLwA1Ad?=
 =?us-ascii?Q?sTirBUkDE58K/7T+cx3omDV2OjfE2Qjin9xLdhHob4wSgU7Jk/7AvgOUBvu1?=
 =?us-ascii?Q?kE5cl4h+I+De/W9pPd2SDnfhiGyR1x60FcwWtO++mn6QP87/KwoBYstV3cIg?=
 =?us-ascii?Q?MWhYXMXGTc7YrM/nvy7K+5wsrBoOoFGPEeRRB1fUbE+PNOZLJbZlbecdksOu?=
 =?us-ascii?Q?Sqx/UXXs2HHXZyhxibsyZcjw9iqdWnY93PSuKgGiJVs1rb5vt1QXIfPKjgZC?=
 =?us-ascii?Q?9eO+Cd5Ai76QnVetqtQ6IXWYykHKHSpCzooUUKU6izotwX2aCrTU+GcIumyC?=
 =?us-ascii?Q?LhWPZxpvWXxwq90eMTChTPN32HxnDSls6c8+SfW143O0ejRwd/sCBzimSqvN?=
 =?us-ascii?Q?GRd3If4CcD9CSxQ+60oAeJ1sL+1oNbIfhVfNT6nchiEKlqlP8R4IUFVsj5Dk?=
 =?us-ascii?Q?yvVo4HXNqJuoinMSDWkFgLSlqE7ASsSkYKxyPFS5p/5zDjfC1vD0gqGgLANL?=
 =?us-ascii?Q?sFsCfpAorB0w2pSLHGdGUit7OEeqR9KpI0sZCjVENpgEHfTKESy465fOsGvK?=
 =?us-ascii?Q?JDcZcMEY0H2XWc9923ZueSIuFCBih+w5uGTCtkmUFzNsBghWjrU8Kfi0NV8m?=
 =?us-ascii?Q?pLasWAM0b8Faoe3LP6qthKtihqb2fnpHra2Ayk9xVYRNyA/OLfoeMAOK1ybq?=
 =?us-ascii?Q?2oFd+DXQZ9naPMVzgQo/C2haSeqziZfskYrVJhodQUfK5wLzGugN2iSOc0p5?=
 =?us-ascii?Q?uQIIPepJjZaPXxc2YG5beGSG+LKhiddZKJfP8KcPZEriRj0m9eZAh/G7FIkj?=
 =?us-ascii?Q?1zgcRBy5ZykDBonaQtPt/zkeO/MOWXvnO1XtDgIjmR3HZA0/vR1sTFzDDLE2?=
 =?us-ascii?Q?9vMHMQeb8oK6jHT4rcDsdE2MPLo2Ibu4CCy64ioMmUL3ivx7U+hXfu3A5b++?=
 =?us-ascii?Q?UvDq0K9cTcU8SIIavIOuy2D0yD/hqW1l37sxKaPXUVYinrHtSSF1sblFWoaY?=
 =?us-ascii?Q?sF7BHpxHG9AO/k5+1h6c3EPKNWCI5glgh85i3mEUfolInVlLTVe1P7Ue70yC?=
 =?us-ascii?Q?kxo3T6mhhnAVh6xXpI5mvjSdLxF/jeEmjNDbWIXBvnnqxo7PaqcQ3SOAQCqs?=
 =?us-ascii?Q?1Z5nHZTlZujQjKpObx5TZM5Cwz7SfmXEHFn/z77XztNeQY/LpMLDQnt2BLUY?=
 =?us-ascii?Q?HoC1xo+PokU2HX7S3EqszkPBhRLatFm7Zobjp7LOIbCFXr8fJfj1yE178ys6?=
 =?us-ascii?Q?f5QP5oYRV2a9qmlNyHDGi6ZyJmZej5kXSiac/KyUMS8NjMjfRULy4scfB/4Z?=
 =?us-ascii?Q?t4zqjz1eaVnlCouKJ/cnjdOm9VklfPVhs5+laVDIOL3D511jkTtdnU11LKMJ?=
 =?us-ascii?Q?IUohKvmeMvH1QMmm3KR9OZJ7b7rpT/7x4X8FiRDh642+fd7MhiqzUkM1iDgg?=
 =?us-ascii?Q?76BV44liIgKAS1Ul7ovw5aVa/SOrs00f5r3nEEp2HKkJEENpcFpK4TGNRef1?=
 =?us-ascii?Q?3lbYWIE+gAb/CUgacZwXfE3FLzFKEBWRYCvvRqFsmdepZZEzfFbdfjR8IY7s?=
 =?us-ascii?Q?Zsb/BzBmdHGDyLXtx5IjmnRbk3acK3WopOmruNZD65HRop4lCj5O7Il5rShp?=
 =?us-ascii?Q?xNdAPw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c00b0d-64a8-451b-04c7-08dd521c914a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 02:08:00.6394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rwehJLo5HBgXiNXiyLtriw4orcfZBwFerzqmjfiVbjvdYDGOVFuRbmmZP+T52pYtK3A3MnaAuuPgedAsKTWdFUCb/7aUcKjqqXH+kvrg3PhBRzQWOCbnVTSn9UV2ldQl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8482

Hello Claudiu-san,

> From: Claudiu, Sent: Thursday, February 20, 2025 1:13 AM
>=20
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Hi,
>=20
> Series add fixes for the Renesas USBHS driver identified while
> working on the Renesas USB PHY driver (series at [1]).
>=20
> Series (with [1] on top) was tested on Renesas RZ/G3S with consecutive
> unbind/bind and data transfer tests before/after the unbind/bind.
>=20
> The unbind/bind was also tested on the devices with the following
> device trees but w/o checking the data transfer (as I only had
> remote access w/o USB devices connected):
> - r8a7742-iwg21d-q7.dts
> - r8a7743-iwg20d-q7.dts
> - r8a7744-iwg20d-q7.dts
> - r8a7745-iwg22d-sodimm.dts
> - r8a77470-iwg23s-sbc.dts
> - r8a774a1-hihope-rzg2m-ex.dts
> - r8a774b1-hihope-rzg2n-ex.dts
> - r8a774e1-hihope-rzg2h-ex.dts
> - r9a07g043u11-smarc.dts
> - r9a07g044c2-smarc.dts
> - r9a07g044l2-smarc.dts
> - r9a07g054l2-smarc.dts
> - r9a07g043f01-smarc.dts
>=20
> Please give it a try also on your devices with [1] on top as well.

Thank you for the patches!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I tested on my environment (r8a77951-salvator-xs.dts) and it worked correct=
ly.
So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> Thank you,
> Claudiu Beznea
>=20
> Claudiu Beznea (3):
>   usb: renesas_usbhs: Call clk_put()
>   usb: renesas_usbhs: Use devm_usb_get_phy()
>   usb: renesas_usbhs: Flush the notify_hotplug_work
>=20
>  drivers/usb/renesas_usbhs/common.c     | 6 +++++-
>  drivers/usb/renesas_usbhs/mod_gadget.c | 2 +-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> --
> 2.43.0


