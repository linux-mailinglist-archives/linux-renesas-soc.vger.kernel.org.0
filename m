Return-Path: <linux-renesas-soc+bounces-27868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LXUMmPwgmmWfQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 08:08:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 448E6E286E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 08:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6B1630154B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 07:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C059E378831;
	Wed,  4 Feb 2026 07:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vh9qlUZD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6807922CBD9;
	Wed,  4 Feb 2026 07:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770188896; cv=fail; b=gJLpLUIp0VJ0IkCGYkLJIWKde4TcO7XHbpbvZFOKbVX2PUo35LDO5lK8Tm+VsQFKSIItXFWNvMMqLrfZGkFm8P+xAzJbns4cYGtmONrkJuW4qc1HESEJmdzhcFydKXKTwLaK9FS7IJojwISDZCMIVd7CM+yr0ll1y/jo7oJ5EdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770188896; c=relaxed/simple;
	bh=o8wK7mUOwnOiHYSd003qijitvJKyqqm6WTdA4lw9+/0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VJnTYDv+m0Yru1OpDu6oXCfNFfujpabTq2m0Lcj+Ck2Q6j8DGYKFLxQKAZhZjehJYbTDIMdc0eJAie5m4ACvEbnShebfrLX44Q2SV2loF+IJ3R2OfGZOUJbc7POyYQ73T5Nu9xtPDeko135y7oeL3b+l5uUDmU+k9a5X6jgJFV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vh9qlUZD; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ww8CAoc+A+wi0eZiZOkEfvsuJbEQgLz4mV2WOlFpdlDnxKds1koHqas9aOmlXOldxbyH57V6Sy3Cs/QtfrBrSZVPouqm7/us4uMdD+3ILkKpmicZ7gPjqxjYuo0WVwV9El7q4Mw0B/gRblPkH9nAsmMloLSM3R/DyAW/Feg1Q6aMEPI70k0ywVqv/Xd5+J9syTll5iJKbyjt+0/hZt9LhqN92Uf/gOyxaBGUrtqZvIjXEWV4QlIb+rNjeDhQ4LePYjgWMvurKg7qf3U+aSmWlU2+JhWm9mQgRN0grYfSqBYUEAmenX7DLURGRJMDQNai76vf7WDY1CGDZ7NC1SFa/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDIJc2hPqaHCeGqGGf+mqd2F7tPMf0FbCT8VGoAr/FQ=;
 b=FCLqV/2fZfB6/i4dOWHVXLfGAJBlZFpBDJfaT+uOv7mGGHYnen+lAdVG2n8m/ENsUwWEbxpCmBP39jkTk7ESNWVd8Cl4HTKmz0haVAlhypfz3ypgOe5KVWvBfRSYJqf2I0AKCkbB6B5yMkg+fH4pnkaaXtn6GE2Ci9iF1iAguNJqdPzXVyM7GWU2JeD1xbDTn3huLHx/WJYpZ2WyKgtKDGYjVSZvd5PufuYqwacyiWcUxggEmk4vQBZRYvMX5BBo4F9Jq0cvXaw3MpBx6+zY8nbve37lYVlkArydB/OCrb5mk/OraQT+/7+nTgtkWFD6oJd6nEUK+Nk+bDdN48dk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDIJc2hPqaHCeGqGGf+mqd2F7tPMf0FbCT8VGoAr/FQ=;
 b=vh9qlUZDiwylRebOq+0PCrFGxUFax+U3Z99ax/ya0xCaAqY6MwFIlW8dbq+4fv3torokCyFt66B19jHVrqozqF4F7mONkLQVerFILgOn8lVaGCQy0nwAYHXJOUE2+uj25g3OxzSUHNXc4TvxyN2tv8PrqzeQr/vTKF7bbpIN+Ws=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB9981.jpnprd01.prod.outlook.com (2603:1096:400:1ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 07:08:11 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 07:08:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 5/6] irqchip/renesas-rzv2h: Add CA55 software interrupt
 support
Thread-Topic: [PATCH v2 5/6] irqchip/renesas-rzv2h: Add CA55 software
 interrupt support
Thread-Index: AQHclWNt0/1NdJkdfk6rFm5nWYjRDLVyG45g
Date: Wed, 4 Feb 2026 07:08:11 +0000
Message-ID:
 <TY3PR01MB1134655D9D775609DDD421DA48698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260203231823.208661-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260203231823.208661-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB9981:EE_
x-ms-office365-filtering-correlation-id: 7047daed-5860-4182-630b-08de63bc286f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dDKPmX4f4bOJnFj1aMxVBjF13QvpuAunkl1x8d+9YglLi8PjLAXf3xJ07wSi?=
 =?us-ascii?Q?TdbO4ZJIzm6hIlgqh40rAJH69snnbKBAHNWe6yoglWleSKfxTuspFbcPhLOq?=
 =?us-ascii?Q?/ck598gaxfIZnnfu/u/ohZkLQib9TRTl52dED1PLxrmzUYqVTq4NoS/tVr7S?=
 =?us-ascii?Q?UiL/ySriwe0UwLJWxHJaVbC2tGz27Z4KKISwN+RVpN3yEon1pibXUI6CvB8q?=
 =?us-ascii?Q?L2jLUX9i9SlgR21Estg56zmGnI/djhE8I1Mj0G/7EtSZxGJwZ+IcuwXdFGfG?=
 =?us-ascii?Q?iAECTIYYNXPuJlPFcxouD3Zp+rXwb+kJ0o/19awlkeF2uQeLCFM4zTzdDsPv?=
 =?us-ascii?Q?X2iERt1Kf031FfKrcdGzsjzyNTaz5YF+1iCMvaP0AsvaUh/nJfXwyUoiJTkm?=
 =?us-ascii?Q?jukVyzeaAebJTbFz1v9r01zeMrtmXyr+4jBPbzZIA4rKlunddmgtNmdtinTq?=
 =?us-ascii?Q?xnidwtOSHJmmVryTRMEnf2V0g3q+4mYnHan8hKRq9NOt50wk7ronHC/a4Wf4?=
 =?us-ascii?Q?SItcp3cxJIu+gtpKzPaqua56OVDEng/PU1XVHEBPIznsyOYhtZXyzYgMaUW/?=
 =?us-ascii?Q?Qe88J80a1RAeY5PXTX3do6G8gI2dki9YTI094/CZFspSFq0zTCcZb7KmgNad?=
 =?us-ascii?Q?8rLbTz83oiymc9QqtuPhfagtr5/4jrRsNkv0h1rZzU0vGDYl0MbbXBjqcbUZ?=
 =?us-ascii?Q?2VEUoVZOKGhiX46ZM4JzCYxVZBN4C07Wu6+evIwOHFwrZ0oI4ULxgc8B5pWr?=
 =?us-ascii?Q?qm552RRnfYsBLokpoT9i2HHpEsDv0XzFDynCVKVO2ZKvd2rZ9gTE3gOfJR37?=
 =?us-ascii?Q?by71q7zC/NwRvU8Al+wWbyccoKUYLNV+5xm77O0SAZiDu+rTJ4u98s7fh5ks?=
 =?us-ascii?Q?yXUiP+xH4p7yAjo1fQtsbHzbCbqyc/OtrW48B1Gips4UE8wgAwRPUZDLHNLh?=
 =?us-ascii?Q?62mHH7rXIoNTZX8FAUhP8sZfAUhddW8LsnEEyFXIOeD3IYGkXaEko9lyXSIa?=
 =?us-ascii?Q?a3a6I4s4DPvz1Mq32OfKYrOLBm4UMusp4ZrxMgMs6KfS7VszwU5v3NcLSG+6?=
 =?us-ascii?Q?lfN0vr686PWwTAOEIrFz+5E78QfocP7qMrjUtDoPC6ghBDD5+eBhjesvkY44?=
 =?us-ascii?Q?kfbkoEg8W/g41gWfTuMdS+je5oJ+R3XtJ2tbrmKActvFAnwG2UaFUEqB/+4q?=
 =?us-ascii?Q?buA9juzJf5hqKtZuFsLFy4btbdzDoe9veQRG9k4jZz10ZfEm5hog4vTpJKbq?=
 =?us-ascii?Q?zgWcIM4aaIG8JnIOgLqfp4HuJGz9dZV79NtLwg0yx1ET05XV+Ipe0DpA2deE?=
 =?us-ascii?Q?pZxegAWxDuCT+SPpEUwuOVQ+qSR3FDwIQwfwnPqDagGvZ8Z7Ue9d1Kug9uzM?=
 =?us-ascii?Q?gRPfGefWsrG2bPPqgi2bOW6i5OkrxUKDoSewi6xhPTAQ7oBkFSr54WmVHkEL?=
 =?us-ascii?Q?YZPtjEYV8NG0BAUohFx8fDfESbyuUhwJLMcRNq5QS0OPXHcC4TXN7HPB9jzp?=
 =?us-ascii?Q?YnqqxKMP+TN2tduI4Xu3ukfguoVuO0TvcdbaDiiMliFzZ48fgZBiuN4q3aA5?=
 =?us-ascii?Q?YTidoOdLBFYX390N5l8fhBLUbQpAgjm+iGX/BrsYkYNX+5nXxl5qiDZFIdIv?=
 =?us-ascii?Q?1fBnXy9P1vXc8yjlmhNi1go=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aL661SRIbbYWapPkQAVToRUH4hm9WWhwdge1DvSjVlR8jIF6UqabU6/fjJZG?=
 =?us-ascii?Q?2Gio6G/dNmTT3CtyYJP0yPziLm4gHlzkNA/jYx8zdzeMbgg/69ghqeZELK6P?=
 =?us-ascii?Q?NgJ8J8zAuD5n6qYLiyll+9KSOzQBaWa3knUmHPqdfIHXgmPNw1hjrqHZ4M4e?=
 =?us-ascii?Q?/B9023fXXvZaiUJAv+mNb0kvjZfdX2xKVqQGAcDZd8wtLLH7734iDy2jkGR/?=
 =?us-ascii?Q?EvMtYuMQhcys2b3zie9SFiOlgvlPcEm2HZAtmMn/KWjWU1gRV9C/2E9aYish?=
 =?us-ascii?Q?gnfabxr+8ANhxMjmZ1t8dEXJtKZvPigNZ0l5v9tnLquvAZtWJEEWF+iLsNH3?=
 =?us-ascii?Q?f5WPrzGQyPKxRqUweZsVjl5gDOBwF1VzHg9N2Zu86YqBXCq4ZvvaDJfgxOVW?=
 =?us-ascii?Q?ittAjxq07VAKuxljpIDM+VlUxTrSYI4qYTbky1CgHIo8n6DDzQFINuhlzKS3?=
 =?us-ascii?Q?8V0BnmAhstygGFR7EIVRVwCQzo+tEuAyqDEKVFhvbiX5CpUIRBbCPubdL6bW?=
 =?us-ascii?Q?hur7hH2UzpiU3c79PL3NxHzV3WPEGRrQ4LvYXQMbN9TIOYSutLbQ2lsnjgZm?=
 =?us-ascii?Q?SdTTlusz9OJ3FW/nNsbysCjbAJABV2iMHe/X2/fODK2C7tpnNEbebsuFZpxu?=
 =?us-ascii?Q?nBXf0U7uM9ttAquXyxx83Cwm207KBD6R9YNSy9iQOy+6X+Qsv+r6bwh79sPz?=
 =?us-ascii?Q?0nPI1N7fn6kmBjEH7I48ylnvCIh+7cu/lQ7pXBcO7bO3zR7V6ZuErEoncR9g?=
 =?us-ascii?Q?RebnVuJYSrOoukK5gMSTIEnC/svlu/i+5g1AMzwKZbJYr4v/4IUmqL+0iG9w?=
 =?us-ascii?Q?0bk1EOSOBmgwtsc6bkTGKMMgdRaqnrY8SAChe9E7NYrbj5h+8Jo2uemJhyon?=
 =?us-ascii?Q?/1MeCNOVieyuDoGYHNfAwBuUNICuLshJhSQjBafohRMFAnaysuCpzb1cvksM?=
 =?us-ascii?Q?pnhe379UHD1X+iAo3+mP2w/DwWZE/Drxe6vpcpk3Um5JYIz7evWmFYnrTwqI?=
 =?us-ascii?Q?uswl4DG93lufIGv6jNdutrfws/KsQMgJZww8jhtN+WfinvON3WEkm6Rftk5R?=
 =?us-ascii?Q?Dru9O5Trf7Sq+iEiY9srjqA7Kirx3JY0VEnNXuBvYJxxwAE6mkqTm8ZEt8qU?=
 =?us-ascii?Q?HeInhFhLX6DfRRkgy8Y/2Ac+59T3S9ixUum3Zn88ZuvmQc+vb7flDQpjjSRb?=
 =?us-ascii?Q?EykHDw+K6Yr8L5CSiyg8xd1j7MU9sJ5EqZBLv4p8cM+TlqODr/lLwMv554Xb?=
 =?us-ascii?Q?enFfJ/vkdOx/N1iqJHQtxlMnqxNZaTfGPFKTZPpuC50KE3cys8/M+YikRtyB?=
 =?us-ascii?Q?aQCtYhVLNohiQ24pI3H+hyJpNtmsNZlm20rIy3qimYbg7FjhlwT7zzxp8yAs?=
 =?us-ascii?Q?mlUX8mBau5Diu5V4Y8zRq++izc3N4onvKU8grpQJZrdxZj6xSPKcf5USx7fy?=
 =?us-ascii?Q?95dFiiRAW1LAeHGc0n1pBJDgMgqtitrE4GWh6FlRZi+aWb0CjZqHY3zbL8N7?=
 =?us-ascii?Q?vmt5oD9nTg34Q04DOyO2Ro7Y37IZnKHCcVbrBiyPMkFKf47xBytE1egPvMlh?=
 =?us-ascii?Q?IN2IV3cW69FrcQ5q127b3Da8WjqNm8ClhkS8V3Mw56b1nMRdYae0tf0kJX5A?=
 =?us-ascii?Q?apPhFAh+XSgLyoTQdaQOtkJ6PDAUKoT4AvKqYoxGjaoMbduFn8Qd8MyaoDgD?=
 =?us-ascii?Q?2OE2pU5GxgEr4iO/ul/V/Fh57xQ6qZMKXBxuZUsJ7/QOD1nP8H65KZnE5Su6?=
 =?us-ascii?Q?DjwOx5ou3A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7047daed-5860-4182-630b-08de63bc286f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 07:08:11.6018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lxBj2nyd0LjbyI+2g+LlTWtGbrZEXRj+6FefIpx2edLJTjlN50m2HtxuKVJbfI0Lnm0HDPXa3giXiWdhQHfdCGKc4u6IR0fWPwNTOi40Z0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9981
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27868-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,glider.be];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 448E6E286E
X-Rspamd-Action: no action


Hi Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 03 February 2026 23:18
> Subject: [PATCH v2 5/6] irqchip/renesas-rzv2h: Add CA55 software interrup=
t support
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The Renesas RZ/V2H ICU provides a software interrupt register (ICU_SWINT)=
 that allows software to
> explicitly assert interrupts toward individual
> CA55 cores. Writing BIT(n) to ICU_SWINT triggers the corresponding interr=
upt.
>=20
> Extend the RZ/V2H ICU IRQ domain to include CA55 software interrupts as p=
art of the hierarchical IRQ
> numbering, backed by the ICU_SWINT register.
>=20
> SW interrupts can now be triggered when GENERIC_IRQ_INJECTION is enabled.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Made CA55 SW interrupt as part of ICU IRQ domain.
> - Implemented rzv2h_icu_irq_set_irqchip_state() to trigger SWINT.
> - Updated commit message accordingly.
> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 89 ++++++++++++++++++++++++++++-
>  1 file changed, 86 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index 6c7bbb04c6e4..a2ff7524889c 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -12,6 +12,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/cleanup.h>
>  #include <linux/err.h>
> +#include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/irqchip.h>
>  #include <linux/irqchip/irq-renesas-rzv2h.h>
> @@ -29,7 +30,10 @@
>  #define ICU_TINT_START				(ICU_IRQ_LAST + 1)
>  #define ICU_TINT_COUNT				32
>  #define ICU_TINT_LAST				(ICU_TINT_START + ICU_TINT_COUNT - 1)
> -#define ICU_NUM_IRQ				(ICU_TINT_LAST + 1)
> +#define ICU_CA55_INT_START                      (ICU_TINT_LAST + 1)

Maybe define this after defining GPT IRQ macros[1] for continuity, when
CONFIG_GENERIC_IRQ_INJECTION is disabled ??

[1]
ICU GPT GPT_U0_gpt_gtciada_n.. ICU GPT GPT_U1_gpt_gtciadb_n

Cheers,
Biju


> +#define ICU_CA55_INT_COUNT                      4
> +#define ICU_CA55_INT_LAST                       (ICU_CA55_INT_START + IC=
U_CA55_INT_COUNT - 1)
> +#define ICU_NUM_IRQ                             (ICU_CA55_INT_LAST + 1)
>=20
>  /* Registers */
>  #define ICU_NSCNT				0x00
> @@ -42,6 +46,7 @@
>  #define ICU_TSCLR				0x24
>  #define ICU_TITSR(k)				(0x28 + (k) * 4)
>  #define ICU_TSSR(k)				(0x30 + (k) * 4)
> +#define ICU_SWINT				0x130
>  #define ICU_DMkSELy(k, y)			(0x420 + (k) * 0x20 + (y) * 4)
>  #define ICU_DMACKSELk(k)			(0x500 + (k) * 4)
>=20
> @@ -248,6 +253,30 @@ static void rzv2h_icu_irq_enable(struct irq_data *d)
>  	irq_chip_enable_parent(d);
>  }
>=20
> +static int rzv2h_icu_irq_set_irqchip_state(struct irq_data *d,
> +					   enum irqchip_irq_state which,
> +					   bool state)
> +{
> +	unsigned int hwirq =3D irqd_to_hwirq(d);
> +	struct rzv2h_icu_priv *priv;
> +	unsigned int bit;
> +
> +	if (hwirq < ICU_CA55_INT_START || hwirq > ICU_CA55_INT_LAST ||
> +	    which !=3D IRQCHIP_STATE_PENDING)
> +		return irq_chip_set_parent_state(d, which, state);
> +
> +	if (!state)
> +		return 0;
> +
> +	priv =3D irq_data_to_priv(d);
> +	bit =3D BIT(hwirq - ICU_CA55_INT_START);
> +
> +	guard(raw_spinlock)(&priv->lock);
> +	/* Trigger the software interrupt */
> +	writel_relaxed(bit, priv->base + ICU_SWINT);
> +	return 0;
> +}
> +
>  static int rzv2h_nmi_set_type(struct irq_data *d, unsigned int type)  {
>  	struct rzv2h_icu_priv *priv =3D irq_data_to_priv(d); @@ -429,6 +458,7 @=
@ static int
> rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
>=20
>  static int rzv2h_icu_set_type(struct irq_data *d, unsigned int type)  {
> +	unsigned int gic_type =3D IRQ_TYPE_LEVEL_HIGH;
>  	unsigned int hw_irq =3D irqd_to_hwirq(d);
>  	int ret;
>=20
> @@ -445,6 +475,11 @@ static int rzv2h_icu_set_type(struct irq_data *d, un=
signed int type)
>  		/* TINT */
>  		ret =3D rzv2h_tint_set_type(d, type);
>  		break;
> +	case ICU_CA55_INT_START ... ICU_CA55_INT_LAST:
> +		/* CA55 Software Interrupts have EDGE_RISING type */
> +		gic_type =3D IRQ_TYPE_EDGE_RISING;
> +		ret =3D 0;
> +		break;
>  	default:
>  		ret =3D -EINVAL;
>  	}
> @@ -452,7 +487,7 @@ static int rzv2h_icu_set_type(struct irq_data *d, uns=
igned int type)
>  	if (ret)
>  		return ret;
>=20
> -	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
> +	return irq_chip_set_type_parent(d, gic_type);
>  }
>=20
>  static int rzv2h_irqc_irq_suspend(void *data) @@ -501,7 +536,7 @@ static=
 const struct irq_chip
> rzv2h_icu_chip =3D {
>  	.irq_disable		=3D rzv2h_icu_irq_disable,
>  	.irq_enable		=3D rzv2h_icu_irq_enable,
>  	.irq_get_irqchip_state	=3D irq_chip_get_parent_state,
> -	.irq_set_irqchip_state	=3D irq_chip_set_parent_state,
> +	.irq_set_irqchip_state	=3D rzv2h_icu_irq_set_irqchip_state,
>  	.irq_retrigger		=3D irq_chip_retrigger_hierarchy,
>  	.irq_set_type		=3D rzv2h_icu_set_type,
>  	.irq_set_affinity	=3D irq_chip_set_affinity_parent,
> @@ -571,6 +606,50 @@ static int rzv2h_icu_parse_interrupts(struct rzv2h_i=
cu_priv *priv, struct device
>  	return 0;
>  }
>=20
> +static irqreturn_t rzv2h_icu_swint_irq(int irq, void *data) {
> +	u8 cpu =3D *(u8 *)data;
> +
> +	pr_debug("SWINT interrupt for CA55 core %u\n", cpu);
> +	return IRQ_HANDLED;
> +}
> +
> +static int rzv2h_icu_setup_irqs(struct platform_device *pdev,
> +				struct irq_domain *irq_domain)
> +{
> +	bool irq_inject =3D IS_ENABLED(CONFIG_GENERIC_IRQ_INJECTION);
> +	static const char * const rzv2h_swint_names[] =3D {
> +		"int-ca55-0", "int-ca55-1",
> +		"int-ca55-2", "int-ca55-3",
> +	};
> +	static const u8 swint_idx[] =3D { 0, 1, 2, 3 };
> +	struct device *dev =3D &pdev->dev;
> +	struct irq_fwspec fwspec;
> +	unsigned int virq;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < ICU_CA55_INT_COUNT && irq_inject; i++) {
> +		fwspec.fwnode =3D irq_domain->fwnode;
> +		fwspec.param_count =3D 2;
> +		fwspec.param[0] =3D ICU_CA55_INT_START + i;
> +		fwspec.param[1] =3D IRQ_TYPE_EDGE_RISING;
> +
> +		virq =3D irq_create_fwspec_mapping(&fwspec);
> +		if (!virq)
> +			return dev_err_probe(dev, -EINVAL, "failed to create IRQ mapping for =
%s\n",
> +					     rzv2h_swint_names[i]);
> +
> +		ret =3D devm_request_irq(dev, virq, rzv2h_icu_swint_irq, 0, dev_name(d=
ev),
> +				       (void *)&swint_idx[i]);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to request %s IRQ\n",
> +					     rzv2h_swint_names[i]);
> +	}
> +
> +	return 0;
> +}
> +
>  static int rzv2h_icu_probe_common(struct platform_device *pdev, struct d=
evice_node *parent,
>  				  const struct rzv2h_hw_info *hw_info)  { @@ -626,6 +705,10 @@ stati=
c int
> rzv2h_icu_probe_common(struct platform_device *pdev, struct device_no
>=20
>  	register_syscore(&rzv2h_irqc_syscore);
>=20
> +	ret =3D rzv2h_icu_setup_irqs(pdev, irq_domain);
> +	if (ret)
> +		goto pm_put;
> +
>  	/*
>  	 * coccicheck complains about a missing put_device call before returnin=
g, but it's a false
>  	 * positive. We still need dev after successfully returning from this f=
unction.
> --
> 2.52.0


