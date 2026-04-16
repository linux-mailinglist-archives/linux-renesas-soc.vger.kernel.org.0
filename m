Return-Path: <linux-renesas-soc+bounces-31321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKm8G2qw4GkRkwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 11:48:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FDA40C994
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 11:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D8403005AE1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2026 09:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA9138C433;
	Thu, 16 Apr 2026 09:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="izDBzrcg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03551FECCD;
	Thu, 16 Apr 2026 09:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332902; cv=fail; b=JQkvk8a4ACoGsCebuyrmSKbAG7SUqr/C+GHYWz2bvcLMMmuv2OLLEGLeAGs5uH7H/4c9LW8Jb1PQbsW5iKJB491/c8AWMkpYWsLg3mI18JEIPCCtIzZUMdCrjGjsCmG3T58Czfex70yVGV1L03e5wJJLW73qmCKziqmThxAZunA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332902; c=relaxed/simple;
	bh=2OlXAK0kxTxsX+NSv8js+WaxrTlUhLOQrHnVB5Dm7hA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FTXQEidN+rQgDd6NzuuJDj90ZXAkFI7SLfbMj7Q4ydeRgEt2lYVSg+ERl7cUOoMDR34WkHpR8XJ7k4TfM3qNpo/nDM9VXCQFjOnvnLq+ThE4j3sYw5u3tar8rQiCXBzcv2rRgMVyOXQgKnKBjmKpDgSYeRwDBhwBAE0PkOGOVHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=izDBzrcg; arc=fail smtp.client-ip=52.101.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+quCerC5sRgiT99YFkHifZfd2pKHzLlpB3e/WHlCyunwypIsU4WJvigJhXiZ+KikKHAVYa86RCd6vZJggLPo3nz3Uiiz49wos5Jv9ei3zOzaz0G3SxfT3lC1xndcmNCJBLH6/qzsVorTjdX6ZM7FoVNqqGzK5GTIU4ox7RChX0vdZJ/PV0xLCFY+tU5RabvzUzzNbyjQYwmveSXmWzU6gES5sHrP2cDrdUQ1SZ2pDhaTaYod2z4n9cELW5qE69e9rQBI7AQf0Cd/044ceOmzd/RUOCGy9mmhZUbAznEXHqAep5rPc/NLH728EBz4WDNDkIZSKB3x0UU7UuU2MsT3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqjaAMxqa5ITcG4MBfT1gUnuIwckHHDL8NP3r0DmJ1o=;
 b=Tk3KT7jbgx7PIe2JW5hbmKoRsldggETUiuUtQMUVYgZPdFitC1YvaCkQrvEMR6IkXzHkSrNFifXViXUA18v1Q4rmLkC10U39uCA/zzP0gyXOWhGMUJPSeaO7lWBL9+NuIJLFjXXMlabHfC6zugKndsdhRg/SSeiiu3/BOTqf16nKzv8wHnvb52zgOXZm18XZ+rQ0BpPPRatU4ni/la4OkR0uqYS+QKrGO/xj7OOSCbdYK0Sb9B50yx+QHW23qE9be/c1uDC46w5RqtOtP8GsuXmGoytNkZe8stWIKmYstd0JFAbe9ys1aNPUMTf86U5Jq1YY6pG2lCe8Ps2RuYkJTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqjaAMxqa5ITcG4MBfT1gUnuIwckHHDL8NP3r0DmJ1o=;
 b=izDBzrcghoswXs/0SPsZ0PVintHMZUaNLsQAG7B5AL7c0/klL6EFXQaWGCpEBs4B47hGME7AApnzi7p9KROFx/4Vnld+w3cyj7Ak11BT1qegHAKjuiP5ds/5Y0cdQcT6FYNHsV6YvoTXHGXQDCMupFH56hDZjyq+iO8ce2jJBXI=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OS7PR01MB17071.jpnprd01.prod.outlook.com (2603:1096:604:423::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 09:48:17 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c%4]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 09:48:17 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI
 pins
Thread-Topic: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI
 pins
Thread-Index: AQHcwR4EFWEDt2xdQkmzwPdsZFWRsLXhhnSg
Date: Thu, 16 Apr 2026 09:48:17 +0000
Message-ID:
 <TYCPR01MB12093CF474A844357ACB39BA0C2232@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260331145221.7974-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260331145221.7974-1-fabrizio.castro.jz@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OS7PR01MB17071:EE_
x-ms-office365-filtering-correlation-id: 3a91a6fc-152a-42a0-aaba-08de9b9d4919
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 VPT6SRa8DhShIdor+cFwQUeGdV5EXjaddy6FEVcRdS6MqLOmUjf43UU3liEB3uXD/tq2IcuFzwFmpfb9762OgkVLQmKcSWWhjKo7TzyP1rJwekUmxj4sIeTHJhAFp0+wCwkhO3I76V7EO5B/Isz+tI0mvZDi2S2j4aSn+8bLBsDg133ggCW0EXc+yflwmGPm4TCQclDUkS45Sg83KKbGywXiiCLIEIo6v+M9NGUV8QsR9CvL6jySB/IsWEoIrbaV3mIWy1WmwTEcqpr2T0SXNIu0Un7mtD8JXumXO7Ux3J7WwKYbTzeem4Wtt13AUDqufioMz2u4LFiQ1JiziMZe4Eae2I8EnU8QPdUPcSe/fsDKMazHqzkAjIvY2TdFsLWfHzm2SeTV6RCYI1Vzh6GUYp47LtfmZjM9u7plWYGtpQh9f3l4RaabVUi5qiThgnfHwY0RZIA//HqAJelE5336Ebfy9S0gKfCLYUI1fQ/zMRe9byF94tbkVy8/qkh5Ua4s1aPV3EsaX/Ii2KFL/5tKjdHEGw9wUcYqiQ8qTK4/ZsiBRTzOO8TSM8TDqjvarYWieHs6Iya8xH2otr/s/UrP+M6GKR8WghMA6bkceT35KKkVnvI1QdxDsE0VrmgjoRGfAE5T9KezNgzC8SxUrJOk1hE0BEVdGAF52Yg5oMDkuJ4X1MP+FOeIhBhobDenGNa2VlPRTGQ6CeVOEZ9apSO6Q1CmJHRKUgZbWY5PVZVPUI7L+J7pC7h+/Jm2dvBfBka3z6DXKOCvFrbDJb6QOJ9lI917HW9KiGbtv7pCzrr+iFk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Y4EoexUfarEChH9A7mSINrgnRvPJ0GFqBn9T8t4sPkU7ePNIzyc0+41+FTrC?=
 =?us-ascii?Q?LoEksRo/4vpoO3eza9yA5RoivnCwSoY3dqpsABlpQq37/P3ee5WYE4oqwMfN?=
 =?us-ascii?Q?/qBDsiLz8issA7/xNI24IbJtmcXyXD2lr878+UA2Lp9q0biO4aRyXYtjOjSq?=
 =?us-ascii?Q?A3hr9FXI4irODy41A/jtMscHefoCmyRmwPE8tYLzGwFAU46hK2RzvRT7xX4H?=
 =?us-ascii?Q?ylnI76vwO0WLtIkGepH5sVfzjUocj4Es1spi0vNe2Nt9gutS2qDPQ20n8Gd6?=
 =?us-ascii?Q?C6yLE8fxhvMx6Xk0CXdvWaviMCgPEzHb0nvNBSKbGvTbgD1o9mWnMBlxJBpE?=
 =?us-ascii?Q?1toHQNiqwIMqybkpxovqHbpBQGjOB0gY87g5f3YR7qTxk5/u4DmoTyGjbMsf?=
 =?us-ascii?Q?y3Cf1jpyfTKjITr8hi5M3jUkwmjspF8uCHSLAZ8R09haM9wODa8qS0m1Uye6?=
 =?us-ascii?Q?CeKlxQ1oqXJjLavyaIlOzkd2WmxgNLWyDnAVcWLn4SvHgU6CQAeI3d2NzsAz?=
 =?us-ascii?Q?x4FWjCK6zbrIHHMLAH0/lmQ6S0rzC7Wq9KBQIDeeuEt0WFTZQY1CT1SDqSl/?=
 =?us-ascii?Q?3nYZelYuqu7P7+lw9QN5rdxeOUsB/h4IYBRKNL8q9GIelynol/Ze96aGJG34?=
 =?us-ascii?Q?i1yeRYXQwJf0t+pLVsivSqD58OteyVFgmGD/0WTWHLdC6QDUrOx6C93Nz9Kl?=
 =?us-ascii?Q?TaCc0KZL+2cu8PcACZM2sLFuWLd3G/RtTlEJQZK7uXNCieQrmOZIZp0wedEV?=
 =?us-ascii?Q?27lpil3zXQz84Kbw86aEx0RaKIigHQSo6zcQxrJFViTyGozdGMss+uwa9YjH?=
 =?us-ascii?Q?7Ao6QHXsmg++FsvjJcMosJgjnom7UzABel3j6cS1uBZZZrWmnxLHSdauke9U?=
 =?us-ascii?Q?QAdy5k7XyxzZyJUVOMGCqwaVls2Uuhh/rvS7r4c7YXD1XqKagcaOWlkxcxJi?=
 =?us-ascii?Q?W+czQDbVfNZw8ezhef0Vfz1wVkKKyGJrKTuJI4Pk3QPPnspO7z+yIg4GpUEO?=
 =?us-ascii?Q?oNLB8qRoy/IA97tPS4czngvP9LN5xIg5uZYUO9QFsEqgheC6LcPk5AFHFHWk?=
 =?us-ascii?Q?Z0T7rfRHLYg6R8uoxen7bVWvdpRErqmOctVK22MvQcL7//sUH9Es7pcJaET9?=
 =?us-ascii?Q?glxHPXm2zzl+dZMWyb8/58UDM7JFLlRwh5o9A77MqriXeDH41EQPxkKr/qFx?=
 =?us-ascii?Q?zsDZ3s2Bg4skriCzbatjpYKPl/IjGsB8Emjuh/DwlCFht689qq7YVFN5p7aM?=
 =?us-ascii?Q?zSrKq6HDYz1AewWf7KmkPI4WnnPlmhmrivIB0kRmMkM8ak1XHfUcNGg9lprG?=
 =?us-ascii?Q?Gwc2t29e4oRWIlPjMIWRu2rV/8C7V6Ok5RdLfb8EYxPICMdJyB6Bl1/iLkm4?=
 =?us-ascii?Q?nTQyNimxQpXlXpWQuBZ7Zbig3X8oNI1gA5VMWM4tO8X8S7y0f3m88dPYAQrL?=
 =?us-ascii?Q?8RrzTinV5XNneTtuFNVZUHiduoL6xX1moPvcYa6zSvINe5tBGZ6bTRovlyYR?=
 =?us-ascii?Q?spH0YSTNbbAZDKz5UmD0WhjOB+b8GW0NqXKJ11PdZoXR9nT01rS54ulvoLw8?=
 =?us-ascii?Q?R2E5RW1YAvme3kYTK5gDn+fODPn1PSMZ5GlKIQDQQ/gVUv4ISPKB8dA2FyNG?=
 =?us-ascii?Q?4AFTu0kWz30nNNCyJDFS3W+Z0JvRkdSSqKFncKnUy+IqkpWuJfOv/gmxLzCI?=
 =?us-ascii?Q?+1qQFuvAYbSPui2TSvU2h4SWt7GhEaSOa6w2EQ3OW8EQKJksBlkJ0uXR90Qe?=
 =?us-ascii?Q?sjjjSkaWnCouBlszGqUJI5h4owC5wqQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a91a6fc-152a-42a0-aaba-08de9b9d4919
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 09:48:17.1409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rncsw2okKJwGfSqqGg1+6rNBghSfvx3sjvsc04Jm8Is9WbM6bjrx78kFe0d8sbHuM4aDMFY7r4oWfSX3/9Vj8JK5A6StvemXWdeeEzum/54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17071
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31321-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,glider.be:email,TYCPR01MB12093.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: C9FDA40C994
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Are you happy with this patch?

Without this patch fast SD cards/eMMCs may fail on the RZ/T2H and RZ/N2H.

If it helps, we may also add a couple of fixes tags to the patch, to fast
track it:
Fixes: 4d7624fc85a2 ("arm64: dts: renesas: rzt2h-rzn2h-evk: Enable eMMC")
Fixes: dba8ee27c5de ("arm64: dts: renesas: rzt2h-rzn2h-evk: Enable MicroSD =
card slot")

I haven't added them to the patch because I wanted to avoid being selected
for stable, as it depends on the below series:
https://lore.kernel.org/linux-renesas-soc/20260319141515.2053556-1-prabhaka=
r.mahadev-lad.rj@bp.renesas.com/

Cheers,
Fab

> From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Sent: 31 March 2026 15:52
> To: Geert Uytterhoeven <geert+renesas@glider.be>; magnus.damm <magnus.dam=
m@gmail.com>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley=
 <conor+dt@kernel.org>
> Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>; linux-renesas-soc@v=
ger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Biju Das <biju.=
das.jz@bp.renesas.com>;
> Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI =
pins
>=20
> The HW user manual for the Renesas RZ/T2H and the RZ/N2H state
> that for SDR104, SDR50, and HS200 to work properly the eMMC/SDHI
> interface pins have to be configured as specified below:
> * SDn_CLK pin - drive strength: Ultra High, slew rate: fast
> * Other SDn_* pins: drive strength: High, slew rate: fast,
>   Schmitt trigger: disabled (not applicable to SDn_RST pins).
>=20
> Adjust the pin definitions accordingly.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>  .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 54 ++++++++++++++++---
>  1 file changed, 46 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch=
/arm64/boot/dts/renesas/rzt2h-
> n2h-evk-common.dtsi
> index f87c2492f414..3fae950db603 100644
> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -275,12 +275,28 @@ data-pins {
>  				 <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0_DATA5 */
>  				 <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0_DATA6 */
>  				 <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0_DATA7 */
> +			drive-strength-microamp =3D <9000>;
> +			slew-rate =3D <1>;
> +			input-schmitt-disable;
>  		};
>=20
> -		ctrl-pins {
> -			pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
> -				 <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
> -				 <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0_RST# */
> +		clk-pins {
> +			pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* SD0_CLK */
> +			drive-strength-microamp =3D <11800>;
> +			slew-rate =3D <1>;
> +		};
> +
> +		cmd-pins {
> +			pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* SD0_CMD */
> +			drive-strength-microamp =3D <9000>;
> +			slew-rate =3D <1>;
> +			input-schmitt-disable;
> +		};
> +
> +		rst-pins {
> +			pinmux =3D <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0_RST# */
> +			drive-strength-microamp =3D <9000>;
> +			slew-rate =3D <1>;
>  		};
>  	};
>=20
> @@ -299,12 +315,23 @@ data-pins {
>  				 <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0_DATA1 */
>  				 <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0_DATA2 */
>  				 <RZT2H_PORT_PINMUX(12, 5, 0x29)>; /* SD0_DATA3 */
> +			drive-strength-microamp =3D <9000>;
> +			slew-rate =3D <1>;
> +			input-schmitt-disable;
> +		};
> +
> +		clk-pins {
> +			pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* SD0_CLK */
> +			drive-strength-microamp =3D <11800>;
> +			slew-rate =3D <1>;
>  		};
>=20
>  		ctrl-pins {
> -			pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
> -				 <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
> +			pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
>  				 <RZT2H_PORT_PINMUX(22, 5, 0x29)>; /* SD0_CD */
> +			drive-strength-microamp =3D <9000>;
> +			slew-rate =3D <1>;
> +			input-schmitt-disable;
>  		};
>  	};
>=20
> @@ -323,12 +350,23 @@ data-pins {
>  				 <RZT2H_PORT_PINMUX(17, 0, 0x29)>, /* SD1_DATA1 */
>  				 <RZT2H_PORT_PINMUX(17, 1, 0x29)>, /* SD1_DATA2 */
>  				 <RZT2H_PORT_PINMUX(17, 2, 0x29)>; /* SD1_DATA3 */
> +			drive-strength-microamp =3D <9000>;
> +			slew-rate =3D <1>;
> +			input-schmitt-disable;
> +		};
> +
> +		clk-pins {
> +			pinmux =3D <RZT2H_PORT_PINMUX(16, 5, 0x29)>; /* SD1_CLK */
> +			drive-strength-microamp =3D <11800>;
> +			slew-rate =3D <1>;
>  		};
>=20
>  		ctrl-pins {
> -			pinmux =3D <RZT2H_PORT_PINMUX(16, 5, 0x29)>, /* SD1_CLK */
> -				 <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* SD1_CMD */
> +			pinmux =3D <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* SD1_CMD */
>  				 <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1_CD */
> +			drive-strength-microamp =3D <9000>;
> +			slew-rate =3D <1>;
> +			input-schmitt-disable;
>  		};
>  	};
>  };
> --
> 2.34.1


