Return-Path: <linux-renesas-soc+bounces-16202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 034B0A95588
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 19:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98F837A58C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 17:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAF51E5209;
	Mon, 21 Apr 2025 17:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hzt3+90j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011008.outbound.protection.outlook.com [52.101.125.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC59C1519B8;
	Mon, 21 Apr 2025 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745257836; cv=fail; b=A9rmhJzINCl/Whln7GQ6yiaPtN8tAOFH/95uNwwW3ftpRcFgWnYGMGfGJPDMIGz6OolUUXG+TDmfB0Yji1Pkp3gYILtMtismGDEbok8VkaEWeuSB19ID67qUeez+BHT3ANg36+gBRy8vjdOv4TAJIbWFHlx/IG7KbQ+hCdpAlc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745257836; c=relaxed/simple;
	bh=NVXbTZWAvjRxl4gnwmTxJi1GK73RyJB1LnjzttbahPU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rEOUCIVWbMMcu5R10alZY9PNrkMKXsbAvRp1ma70QV2gJQGHPE2w3cod4tmNZudmqrT6hOHGJbGR3ubA963jZ6A3GajRAHYmYXkB7yD5Wc7XA0JOBF1aXe2eG3gyl255HlSsl6Me5dbnyJ6Sdw4j7TrXZ5xz9YRMbVjXzFup/GU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hzt3+90j; arc=fail smtp.client-ip=52.101.125.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAXPangvnkJ0MlQ3OHHC2qOA5ATy84eyAksR73rvulbf6vKZC+A2jvaQpSP8WIiaasbCsuIxiYT/R0znsKerrKy9K33LJQ+CIG7HQvNgoytO0twDsbiA/HWuOmpi7obYuIKAxU+P5KSMZkpndAHOMrow3KG6SW4kBsOOzNy4607rxWRfHcVGDTUnS5Sz0QQK+pDtScKYkzQ82Jezht0Iy/oN6ZJtdguE/98DFa0WUiSUuhBaVqizh2heqVGnjLb3bI/FTGvn+V5nxwoLwxLCSn5WOwe7v11fya/zTS+2CgG78A9/+QUbMRBv5m+qx9W0WwGV7nouE/ytlgJWgeUJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy3PF2JiMIobW/wkOYgS7t4FZxnsC+J0jJ+DS7Dl/rQ=;
 b=jgdUfLuo31XMoZjM4nyOJ6c75NHHTctolzgtIxgzPXloJJ06LTyJ/PoDvFVyr0trbyx/TJ+Q8uxSjqn0pfm2N09kkul26Riq2Vz0xE4ROmP5wKbjO0q1sHtMEKoVfqXzP7g8TR4vwcLlemY/rLS0P86p8A+doDZsrxN0MtE/c504fMYkTHyxvyIpOFQKUnvVhQ0nsuEj+tMlKg5t2II3O7O2iZ4hRt/RaHmlrwOlGHNaF6Z950woGRY2uErJIv7iCk4Ao7Zw5Ll9i30c2irFzOiB+abiOdRTPPSKFc+pLX25y9H7kRCRPspF7DeODLqi4ssxaPWasDDj5SEEr/CwHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xy3PF2JiMIobW/wkOYgS7t4FZxnsC+J0jJ+DS7Dl/rQ=;
 b=hzt3+90jZcax56Qv2+qUJztMazcrg7xY3a22pQnDAhw1ubTfbGKumdphq8FgEt40Pf8ZO2PJZEKcjYARZmfVLJKQRb50aoLk6IBdOed2TQyVSxLl0m732w7JMw5vRCC/n5PZ0nm1cVoIjds4mYRKRwTFocsRFdjU6Of+0q56JHA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB14083.jpnprd01.prod.outlook.com (2603:1096:405:223::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 21 Apr
 2025 17:50:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 17:50:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, "Russell King (Oracle)"
	<linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
	<richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu
	<joabreu@synopsys.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Topic: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Index:
 AQHbp7UXRdTsn2oCYUWD5qYhUQGHu7OjbUQAgAAVgQCAATLSgIAJgP8QgAAGBICAAAEN4IAAEkSAgAAhbNCAAAn7QA==
Date: Mon, 21 Apr 2025 17:50:25 +0000
Message-ID:
 <TY3PR01MB113466ADD365C6C569923F9A486B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
 <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f27b0531-11dd-4074-9c79-172953d28292@lunn.ch>
 <TY3PR01MB11346FA4767B74B2CBB2CAFB786B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <c27a2359-ee55-4d20-907d-314eee30ed4f@lunn.ch>
 <TY3PR01MB1134652607E0CB04ED520EDFF86B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134652607E0CB04ED520EDFF86B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB14083:EE_
x-ms-office365-filtering-correlation-id: 817c66ef-0d25-4ded-1120-08dd80fcff34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vDvhcDPXR1oJNE4IO8DC5FSxsToII+joOWIQMGaEF8E+d3I16en/o/TbeTHT?=
 =?us-ascii?Q?vpToHq6cKDzDzDGutpDIZZyUjmCEkBKfplTkJpbEzJ6m1d4cJYGG2TbWq6Xg?=
 =?us-ascii?Q?yr7Qw/a4DbLanRdADq6oI96xbVx+RxFgC861a7oX9DIBvOYjwQqUDLaRpJWO?=
 =?us-ascii?Q?e1gIDx+JNaxJ0Bian3D6ltAPYJP9Mjf1R4HREO2byFhTY39cnRModJDnPopg?=
 =?us-ascii?Q?3/146i+7hFaGGU864Ql4maNOaSemkc7DPsPQtsDrvAHJsO7c9eBCLpoIXA/g?=
 =?us-ascii?Q?QWyz5lHiJRq0bgYj28gOcy3JjFGyo5Wnw05OWkehsJ2Xej8L+cAv8QXPl/1m?=
 =?us-ascii?Q?YWOFOHzfVWs5nsnLUufXrpi4YDev/fCJ1b6ifTVDijv1OXzqxZzb91pzgqXH?=
 =?us-ascii?Q?5SQfY4O7gc7eXPv/h2vi91Fxczm1Xp9uoHXfeZkEdpdL0McwgAXsVeDAa0ri?=
 =?us-ascii?Q?UkiBj7PIvUCvcg4BH71uOT/g8CVBHlB8Uz5VxYOxPZfqZMJ5qsWSAtRYumuJ?=
 =?us-ascii?Q?c4/MgbS6rhoy/IOtDKTy+20xOrGLwGmdvxs8OhMy3IVgKaH5O0hpu7U8pzB4?=
 =?us-ascii?Q?iRrqKzKgAsjE0RD+OioETuzZF4tK5KjNzgXqpgQZS4gcPkzScSA5oN+PxiZM?=
 =?us-ascii?Q?0gaYDHf4RowxcuQQr8maGeoQuW5OIjkxO+rBpMEVK8khWD94xyKVpybrHw21?=
 =?us-ascii?Q?94G3MSHKGumlb561Jgl55MvZxpLjBJfdvFGd/RI5bnD56KLIYtwhbCEHVGOQ?=
 =?us-ascii?Q?PthR71jHvujGYCGT0razTZ5iISpLpyq+RKWKeWHwoEUVgj3RW+VX25KlX5TH?=
 =?us-ascii?Q?5h5Y67CLeYNgW9CgBXoIeZybtId+1dkyha7koKtvILP9ttz4wuUpu9tI5NC1?=
 =?us-ascii?Q?3sDYFm2wvd3FPxy75gT/cLsNWHCHWTtnmuL1XEa3635Xg0NlAUjdqifr1gtu?=
 =?us-ascii?Q?c7SmgfZKz/nTWwhthcymlEG3tDpB5AmIm4PLsX+exii4TA/M7sbc8JLW3JyF?=
 =?us-ascii?Q?zToB5MU3Ugg8hxW+roHTBRFKH01ESruL2TSKLCBy3BgqkNHy/zOMGp/9++v9?=
 =?us-ascii?Q?D5zIi00+jVnuXt0juPG4FpvOB4ShcGQtfevGMsFIadRi4zUsXTrnuKdCLkKk?=
 =?us-ascii?Q?NQfHPggNRI6Wcs14CnMZ1U0L/5KYVrIqYx0MN8ZnJZDkFviMNA13sPm6bnum?=
 =?us-ascii?Q?SeMtNSDZsuzDgG1IbhG6TJCHpvw8WGl+M9UIex7QlUB/rXoY8Ud5dWjX9St6?=
 =?us-ascii?Q?EapD5CXM0c3Xg2Uma8T+93xYd6DfWmGiByl6ffQxIN6hNDIL9rCEPcvM9wVm?=
 =?us-ascii?Q?Zs46PfutlSya/LGTKHybZAjCOMz5LqDAbYNFbuESmQ+/gcg53xopmmnmVAjd?=
 =?us-ascii?Q?Fc+tRSNiz2ne9xXCVJ9Meroa3V8+Q8gO9wHEEHwk5BpM5cA6qtpQUPRxQbvZ?=
 =?us-ascii?Q?wsKIXZ4EglMVJRIXBNhGD41yJ3hR+TqWcZLP1mBOSyo6jZ/qwCDGf83wB4A+?=
 =?us-ascii?Q?kiRbeXOM21YNL/M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2+MpEPnMNPsQ9CmfYU6nTj/il/ABD4hg1Q9mX1Z1Rj3NoTwoa/llSjwSzJCX?=
 =?us-ascii?Q?aMOXQ2cG0fAS32b+oiBknpuVMZ7mcoViRfdLnEY3pYgamIsZcpi+XrEhsijQ?=
 =?us-ascii?Q?yMctOf9yN+CjTfXHrTZE0BhQZpHyaQWesrNNSBCE2CZm5NTkDreUc2oib04A?=
 =?us-ascii?Q?ZggtLrIsTekOSa1fwD3vJSFs2EzJpZU2D4+56i8n5J8j/u8n86yamynU4olq?=
 =?us-ascii?Q?7ogFqVidqqgKUlWGv9x3Qmnal0NDxIi0u4hmj+yhrjkaddWiDnCpEOsPoEtX?=
 =?us-ascii?Q?omFjHf9AwHgLQBv/FXKyhZkyAv/FfZnk9W2eoZXlFGlHQ7bSz4X69cGyyQ1a?=
 =?us-ascii?Q?n4m5OlDoEv61bPWfSafc9CVvVLUowEYx0C9VD3eKzL2lsinsIOjIkYKhNZXu?=
 =?us-ascii?Q?X3KQvh0AjW/5HnahxUXtoAHK1Lm/2niYwGe6QBWj7rWwPHKZkDOWZCswC32V?=
 =?us-ascii?Q?RPVGMkNpZwAEISNc2MA4hE539+M7K8/wSscpbdACGjDR62HjOgqGMnTr1Wj5?=
 =?us-ascii?Q?KacXqRU3zZXwkdXNpc+wb6x6vSLqBG3djwCd1puYEkyYa7p3azsbtFobS3q0?=
 =?us-ascii?Q?pqqYDrQ60xtvKEFGmUKkPlwvIReN8R+rGUD2mnN2Fh7NPkQzFPaFmXeUMz4u?=
 =?us-ascii?Q?TjUPxgruU3HdsdIY6praLUgK2W/5/F7RN2sNoFKOLMjIXsy7bgj8ydv6hkx7?=
 =?us-ascii?Q?nPUKMIeXGNiuvNUvQJclBvqWT1ov3MD7/fGk4OsuBkxJR3GzAU0KgVqicbbm?=
 =?us-ascii?Q?gI44doWPBGszKslxi/VOhFsMobLAna+xP+8RVKtvwtTfOXtQAeUCsjiqQylM?=
 =?us-ascii?Q?7Lm8Zs3fyiewG0iCz7GxGA71nVkgCT66quZ7b8Do5LuYuAqACCyQGrN3Y22k?=
 =?us-ascii?Q?MLjuDyQGI4AHy1r+qkbYs+iEJDmILSQX1pw2uNhV+RTMSXAAJmp2RD9Prqzs?=
 =?us-ascii?Q?mm0RnTeiZkSSdMCyXQ72SZlmC3krxVSGH3HJ73MLOa+eCl/LPlKw0wo+dUHX?=
 =?us-ascii?Q?TGAUUNbk2nikUR/IWeTGdJhw2KeaymnWo14m4y4bwM1xRlDmlxPKmI6GgekM?=
 =?us-ascii?Q?tH0OV0t9fTXs1JakJL1jLnEMiFKEHp093OzrTJr+hWob9/RMBiVxT4Nl3oT6?=
 =?us-ascii?Q?kcrNSHaDSUItxRto2Mm5g5OreWMjFW0Scz/YaAJXmCPDHNg7oc3BjWXq/xKF?=
 =?us-ascii?Q?Zc6lOlQSRThY4Q8+jrIHL5Ati1zVmyahi4xxPl8MH6lttEYAN/IdjE394luv?=
 =?us-ascii?Q?Pwn+YYxS5956sVJaSnwTdKpCpi67Cf0jQuoGtqXDgQfu7LTzsqGR3b+hOZnZ?=
 =?us-ascii?Q?hsG+vtO0SY053g/r4wYyFo7i2XKbX/dWlmpQRe1ktjM1sX03CFdHf8y6fwbG?=
 =?us-ascii?Q?J9SCilsIIfbh1pga1cOEkj5QqYj2WDOO1l6TFtwLYQXfxDpF7QBeLcf82Jmg?=
 =?us-ascii?Q?tChUG3us0ldtRWyPk2me4U5aijAefKG6Qhu0/mSCPxga0x48aqEKdnI0neb8?=
 =?us-ascii?Q?070zbd4/HVPfYs8bIH5kSfMolIWbm70PNahxZpsMB9Rxicr/s/9/U5LC99IV?=
 =?us-ascii?Q?rbLyQoWBGvU6j3Qrhtar7fCK+f0fJ/RqKuk1YbCU0N3cMqFYX846iuHKcIKt?=
 =?us-ascii?Q?lg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 817c66ef-0d25-4ded-1120-08dd80fcff34
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 17:50:25.8098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +lcOsbkle14CEQqbaCFXh0eb62eRX99mtgIb3BI3nmDGIuMmlteIZbjX/O7vi0SXrOvalFSSDJGxwWKa+UMAQN4NQ9qr/i6d+n7JPtcNIC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14083

Hi Andrew,

> -----Original Message-----
> From: Biju Das
> Sent: 21 April 2025 18:26
> Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer fo=
r Renesas GBETH
>=20
> Hi Andrew,
>=20
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: 21 April 2025 16:12
> > Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer
> > for Renesas GBETH
> >
> > On Mon, Apr 21, 2025 at 02:22:01PM +0000, Biju Das wrote:
> > > Hi Andrew,
> > >
> > > > -----Original Message-----
> > > > From: Andrew Lunn <andrew@lunn.ch>
> > > > Sent: 21 April 2025 15:02
> > > > Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue
> > > > layer for Renesas GBETH
> > > >
> > > > > > On the RZ/G3E, the upstream support for testing S2R is not yet
> > > > > > in a usable state. So for now, I'll switch to using init/exit
> > > > > > callbacks and drop the PM
> > callback.
> > > > >
> > > > > FYI, On RZ/G3E, for STR to work with mainline, we need to reiniti=
alize the PHY.
> > > > > I have done below changes on top of [1] to make STR working.
> > > >
> > > > Can you explain why you need to reinitialise the PHY? The MAC
> > > > driver should not need to do this, so something is wrong
> > > > somewhere. If we understand the 'Why?' we can probably tell you a b=
etter way to do this.
> > >
> > > Without this change bind/unbind works. But for the STR case, without
> > > reinitializing the PHY, even though the IP link is UP, I am not able
> > > to talk the NFS server or ping
> > the host properly.
> > >
> > > I checked clock/reset before and after reset everything set as expect=
ed.
> > >
> > > Only change during STR is, on wakeup we need to restore direction
> > > (MII/RGMII) of IO block for ET0/1_TXC_TXCLK (IO attribute) in the
> > > pin control driver. After that looks like PHY init is required to tal=
k to server.
> >
> > When talking about suspend/resume, is this with or without WoL?
>=20
> Without WoL.
>=20
> >
> > If WoL is enabled for the PHY, the PHY is left running while the
> > system is suspended, and so all its clocks and reset lines also need
> > to be left enabled etc. On resume, there should not be any need to touc=
h the PHY.
>=20
> OK.
>=20
> >
> > If WoL is not enabled in the PHY, it should get powered off. On
> > resume, phylib should be reinitializing the PHY.
>=20
> OK.
>=20
> >
> > Which of these two cases need the reinitialisation?
> >
> > The reasons i can think of for the PHY needing a reinitialization are:
> >
> > 1) It lost power when it did not expect to loose power
> > 2) Got reset when it did not expect to be reset
> > 3) Clock not ticking when it should of been ticking.
>=20
> OK.
>=20
> >
> > So you cannot just check clock/reset before and after, you need to
> > look at the order of events. The loss of power, or a reset after
> > phylib resumed the PHY would not be good. Similarly, if the needed cloc=
ks are not ticking while
> phylib resumes it would also not be good.
> >
> > I would also suggest you check the datasheet for the PHY, and does it
> > document anything about the clock input TXC_TXCLK is connected to?
>=20
> It is connected to TX_CTL on micrel phy.
>=20
> > Does it need to be ticking while configuring the PHY? Any action which
> > needs to be taken after this starts ticking? Is the pinctrl resume bein=
g called before the PHY
> resume?
>=20
> Pinctrl resume is called before PHY resume
>=20
> Previously STR did not work, because of not restoring direction (MII/RGMI=
I) of IO block for
> ET0/1_TXC_TXCLK (IO attribute) .Because of this, the direction of IO bloc=
k is set to IN (input) MII
> mode instead of OUT(output) RGMII mode.
>=20
> Now everything works. Thanks for your detailed pointers.

I need to debug this issue further as without reinitializing the PHY, the S=
TR wakeup is not stable
(Linkup, but not able to contact the server).

[   34.572232] dwmac4: Master AXI performs fixed burst length
[   34.572232] renesas-gbeth 15c30000.ethernet eth0: No Safety Features sup=
port found
[   34.572232] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008 Advance=
d Timestamp supported
[   34.572232] renesas-gbeth 15c30000.ethernet eth0: configuring for phy/rg=
mii-id link mode
[   34.572232] OOM killer enabled.
[   34.572232] Restarting tasks ... done.
[   34.572232] random: crng reseeded on system resumption
[   34.572232] PM: suspend exit

root@smarc-rzg3e:~#
root@smarc-rzg3e:~# ls
[   34.572232] renesas-gbeth 15c30000.ethernet eth0: Link is Up - 1Gbps/Ful=
l - flow control rx/tx
root@smarc-rzg3e:~# [   34.572232] mmc2: Skipping voltage switch

root@smarc-rzg3e:~#
root@smarc-rzg3e:~#
root@smarc-rzg3e:~# ping 192.168.10.1

[   34.572232] nfs: server 192.168.10.1 not responding, still trying


Cheers,
Biju

