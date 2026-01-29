Return-Path: <linux-renesas-soc+bounces-27635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LC4OPCfe2nOGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 18:59:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60939B3512
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 18:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A55EE3003ECB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35AF03563DA;
	Thu, 29 Jan 2026 17:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IIgIGiG8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6E63559E3;
	Thu, 29 Jan 2026 17:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769709328; cv=fail; b=US5p3cFcrnrX0WSLTG6fFFy61fbxajdKUNAtCQ4TMMEa50j6Gfj981r0tUD7Gy3hih+nhK/5Q6fs3YRwrSCTfrkla+r9KJmOB/PvWzspy7XZy3qywbxj1k7xFHVq2ui2V1h09UvIK+QE8tsxmVUdzsJw7GzWPpeLcXEE60p7NVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769709328; c=relaxed/simple;
	bh=trxXBqWTvITzqtzsY5sU1R4h7P7JpXbYIucb0x7x3Rs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pknJw/NNcTJpAyvBYZENOebRTj5WG3pYIPMtvujG/pwtKQOHkTXe7lZsGZ65AlakJ/9G3a6k/3R6qmi80ZcquJlc1jGB6T/uZdx3uq7XJVR0agCZKYI3CMavNg9zYfnS/rhSGrVAzToJ2hakqn3/Eq4eyW6Djs94jiUYLgDr/3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IIgIGiG8; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwGsjzQWKnITI9vaFvSN52rm074TlrtMCSvhFvkZM+1QzmLWfsxroO3hPNugrtKP7FYCcAy1uQ9dv5LhuuerQGuqeIPikOf+mwtE9rn3nTZyVoMNVFYXE1s3TNWLsyiODnaNEgyCn30r5gfgtDOOddbxjmdHR/W7GmP9StRnByDYea9MRsQacf28kcuZudi1RQrICRGpfG/oap9htbwZKw+PHupWROs5ZPBsUz26UyyEJvzhY67dYo9ot7r+/G9fg5IMBMJR4t6FPl/P+tKnqyy+XtfvJqeGUH9Ad1xoLKcZWHfOf5mSlhhxLxpVsIKclv8yrsD2VuqkXVwhzA0Wnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=td+GOn/bDlDGmLeGHpvmoIpyPSmd7C+GzWV8Y0kx1aM=;
 b=E7A9QFU+/xUK37rmqNKpbw/YW1ZjVlXzIQRI94hyqdTyTao+Rbh/z++wETKquPUStrlRu8L1kU3hS9Ba2O7iU0lj2BfLwhnsbRt9KUBySfyvn5Jj4kEw98CBOZOM8zSeFvOjy0K7RP4hlL0wNWzHhbTm5/6z2m8lumaB6IJd3LbaHSV0LBk/YSVYNa+Pi9/2mXzx0Sgc/Z3m6kUra0Opb3erW5JZRQwc9AVYfjxYgH7X9nSEYzyKDcSM7mjAwiLrQdd0KM6RhKLA19GVQKCzvvTzv4Iy9ztKWqGwXYgB/OmJxz2i4HbQ7ALPoK3SJoEp8d3wuBXkHHHsDcWjzn7FhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=td+GOn/bDlDGmLeGHpvmoIpyPSmd7C+GzWV8Y0kx1aM=;
 b=IIgIGiG8yoVl2cKKDvZWNlokxPGmpzHKfnh2GkpanA4NR+Tl9RBPX2lbZ6FneV/WqJtAR0SSbhiWpLaeDVNji0xaZkl0LVs8HGQvDsgjGLLtBGJVUpopsofq3i8zbIwLEckVQ/2ttyV0HhoikfdbclZ/C3BhFBrBEd8fJo3h9W8=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by OSZPR01MB7099.jpnprd01.prod.outlook.com
 (2603:1096:604:119::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 17:55:21 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::606d:1c5a:2899:5ea6]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::606d:1c5a:2899:5ea6%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 17:55:21 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown
	<broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow
 multiple DMAs
Thread-Topic: [PATCH v3 1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow
 multiple DMAs
Thread-Index: AQHckKBoiIlnO1RsKkWa2BfvQw7G5rVpbLiAgAAAOLA=
Date: Thu, 29 Jan 2026 17:55:21 +0000
Message-ID:
 <TYRPR01MB156199346D508EFE1F0F94349859EA@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260128215132.1353381-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260128215132.1353381-2-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260129-thigh-yoyo-b1e6cf9d455d@spud>
In-Reply-To: <20260129-thigh-yoyo-b1e6cf9d455d@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|OSZPR01MB7099:EE_
x-ms-office365-filtering-correlation-id: aad7c0a7-243d-41fa-bba7-08de5f5f922a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?35og3wmZG0BfM3EN1nCCQ1FWsrxCuelNrYaHc4/2XE48PVTZGyZhd2tQwX7t?=
 =?us-ascii?Q?ZsAHhpT1IJpdXP/P73aKdGOk0kosV9k4vVtovzv7tsUg8XLZEkfUMqB1ZSkK?=
 =?us-ascii?Q?qQRLIErCkDHnaju/lOA+VSfBWuzevfHGy9fI1l+cu+ZBL/zdg47xWVfxz42A?=
 =?us-ascii?Q?ra5dNUUsJVttXMvXGWFrJax7bDGs2x8e1ipYF1AzKLQbHx6TDIv/3GaAxMqo?=
 =?us-ascii?Q?VdrMiIZAh7GPEST54B8hkMvC3XuzauiG1AtuzBWWqyo2553LTNl5/hPVkx47?=
 =?us-ascii?Q?O2vhdK6oJmZBaApI0+td4sSHjvc2ZDdeHjB2RKyyu6JJa2p4/SoUE442vsYE?=
 =?us-ascii?Q?ho6MRAXwvZ8/WGS9Bgugej+ZDR3cRFCps8tB8b8JGK/LImfD2YtrdSAlFLG1?=
 =?us-ascii?Q?of29ELuElkW3joNzROUX1OyISAfGHMiyx/w4+o3njqLCPRtQoZQ4w9Zrgox0?=
 =?us-ascii?Q?LjdMy+qAHOmz3Dcy2FtStV+AsqwJkHRpVGpRTWsVRisUEaBdJ6EAmLMXrozy?=
 =?us-ascii?Q?9m9op4Ok4FhEovHqX1KHDNGMFO5Bvhs/doggyy+XoY9NPxLrRBE7ocPkryjz?=
 =?us-ascii?Q?VYFAJkpDwKlkky1Pz6IrAwzfW9aCQDenn5wvRhX9ywYxmrZ1I5BT3NgYn+Gs?=
 =?us-ascii?Q?YooUtBCSjddfoj/mKOEbTLa0dMDXMb/gAXY//s09/LNb9o+Jokcigyrpdpvn?=
 =?us-ascii?Q?Qt3t0b9NvC8J99ifmd2P9q5608iIzsxKHM8j2S3SR6vZj2IfU/JGAYo7Yloq?=
 =?us-ascii?Q?YhUW9e5Cw4+E9wb5eKtTG3XOu2nIjxtkvAiHkAHpB5LpDd4T/UtPNIuLpaYw?=
 =?us-ascii?Q?OhFw/yorJy8+mCEK1lvd4pftUGl6jm/UaX0zvhETrZS20NeBKA0hIRXgbX1t?=
 =?us-ascii?Q?9w22Uc7PshXQ6HUn+WbJpuHEiWz7E/z+zQ8mKRMZZNeaS5SO6kUkANdnC7BO?=
 =?us-ascii?Q?yd5CWUqAY0ixQhjj7A4L2FSlhb/xhnnTQc6BDeppWJzv7hzAiSZGUdluFryh?=
 =?us-ascii?Q?2tK/FkuvrrYpHaws+Lbtij8huNLQsKvpBn6bB5QDK015Co6t/WAyA7sAAbDA?=
 =?us-ascii?Q?KiId2aujRZwAMDLnRSDZi5YjMcnfreHiHNxRGoWdwTcxKtuXFbIIAbohI0kT?=
 =?us-ascii?Q?Fg6GUvtXdqqRO5HrFI4A6vzUCDFTOyQS+lxWTzDMZW7oDXQAKa1SkX2X/Ech?=
 =?us-ascii?Q?zEwE+HJdjkBTih905F7nowpCoCr1y8lOMrJg6o9KjNJyGlbJPwlrbvvXEptu?=
 =?us-ascii?Q?ARESKIbjLfH270/3NUzxrCx6ZLkhVGBEflj/iQmp279JbAOzjPRpSzl49FQo?=
 =?us-ascii?Q?J9VK3WaYikanc1QLZB7dVbCT/Zf37wzmf/WTZWdTfbB/1hqrwL2Zjk/rc5nb?=
 =?us-ascii?Q?l0bPso52D+jfnbyr/fW6C3tWSm+9k/6fKtC2kaUFQtfSerbFP9n+LPSo7iV9?=
 =?us-ascii?Q?pzbutJ5PuOPsF3KxrCxqaxH/JNfX5OetVSkPeGhHK2hbFf4rdbgzvn2zZuyC?=
 =?us-ascii?Q?tQO0rx5EW0hlT/ykjRh1+dHGPgzUAHfLP6q3EDSt+axEeM0FxVHuYC1Erwny?=
 =?us-ascii?Q?0YZyLEln4izC/sZqOc6Hh5a1+HOYnUWyULnk5rxiN5NHi5MBDgyVk1Tm8qaf?=
 =?us-ascii?Q?E5Sxis5s+G3TEZVKNmUALzw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OwKT8lk6bCZiIyhsKVaeasJA3paiH5J/KRbqtZ/zgz1njwiTZMIPhEMAOOE7?=
 =?us-ascii?Q?5uiXIvNFZM7CoSUptHykc4r/pseg2FP+vAAhhdJ8RSHi1Bv5UiNRqa74GhTv?=
 =?us-ascii?Q?0g9J/4ZrfKKdIATuPd12RITLeSrScRCvRyCMDQiQ+Qk9wE5OxlU43RfxQk8t?=
 =?us-ascii?Q?YqbsoVkMvOBUiLPDgv0IyFavjcEHimtGZgSq5fnXmIha4YcOF4H7DEXqR4wx?=
 =?us-ascii?Q?naQx1GLgtXvRcTQJh8ChiwHkRD5+AWpVeU5ZwmvGG1w2KX7HYi2+G0MHEqYB?=
 =?us-ascii?Q?g7gJEcsgjSalf86qZI3pUzw5wgHWW5A3R/PL0f1ILfNQZsDkevzf7XrMLo9U?=
 =?us-ascii?Q?MGEUFFgO4XfIJtBG8t7qmriKZBxTNKsb9JjcNk2fAcnX7EeY1i5ZeWD7C/lR?=
 =?us-ascii?Q?jcj/Y8zndgc7RQ9wk3IzfKNtwm8xGvx+6a47g+olsXh5dWn9Rpny3UsECPPq?=
 =?us-ascii?Q?tfoykuCvrGRb5Gx4iwLs1lEZc63T/ykG4CIX3sF2unlv6LhkiDekUbPwKLpe?=
 =?us-ascii?Q?u1gs7C6E/RXfSez0iLtndcrHivZSZnADSjoMjMrXDEtXFHgcHRR1Z29j8y3t?=
 =?us-ascii?Q?Et5SwRC8zPqfMRBRS+TGYSGbkeVsirqe0YQJO7eaPvhGRmuc7XhU6ByP+HO2?=
 =?us-ascii?Q?9BVnQe+EqvIunpz+9KX4yaaiB4cgL9Ihbia+gUQUqo9pbTbnc3rMDEzQvU/x?=
 =?us-ascii?Q?9qlkw09Vw0s0FfN0Q71EJBJ9QQ86gBILW/xySzsbpdj2yOlDXU9G9z8InueZ?=
 =?us-ascii?Q?zpaa9pVn7a6a7xe/F2jp/mOkxoDk1ACeOd3S7KRU9/df4/j8y33K7Fj5On9P?=
 =?us-ascii?Q?UJVehVK67wJIrUdYBlsBh3ace0C0kMQz3h0sILGN6mMYZFNgL9aorkdaszIb?=
 =?us-ascii?Q?vznbLLeNzY4x6oB8+pFOmbFarudqUHR+fVlyi2Pxk/0kr7TnyjNW9fK8jwd1?=
 =?us-ascii?Q?EZEEd7mLwhmeu86AxI2mLfA65Tickc2DC0Cl7GDzFhBDY70tMtmg1y8/91nV?=
 =?us-ascii?Q?dzkHONP5BqPVAHKllyRh+bqpWIYlSTcjlHpBtMQdLpLSIfVmxyr/maQWSw1h?=
 =?us-ascii?Q?nFoZLKiKY+EH9/eLBNZNdF9/+jX713KMcQdBw6J4vrJj2CZCJD9oxmRqLFaC?=
 =?us-ascii?Q?R8myWRe8OVzOj8ZmzR0P/YPydPFQtTPzD9J6mhTgkPqaqJ6DjaudTrkqNJ2s?=
 =?us-ascii?Q?YAu6PU1XDILW9YJfJ8b1o6HSNn/BGIyLn3paoO9uosIm0Xuw2WX/6IIBYP+y?=
 =?us-ascii?Q?VlaY9Qix06RbOOKL4BYaZQVox4m+3rzrybOKxC9Hpee9ysTiq+dnvVjSQeHr?=
 =?us-ascii?Q?py2q+CLYNxLjqskJIHE3uola8V5yd2whXlN5FdNaLWpgJAbBurWUW2rn/eIy?=
 =?us-ascii?Q?LVvfKwO5V7eYVoNV1kbWbZ0GVhO8rr5f1N+7zB3yWyzVBgWInLPHHxz1FAz0?=
 =?us-ascii?Q?EKY1N9sEcv7hYCP+rg12XiPXa3Rbc23jtT9o80zvubR7wnPGLuCggw/6KPoa?=
 =?us-ascii?Q?4KcoLYT/5DqQmxpaVNqIPG+aM6ZPInf6U0ALtD9eGpymWMrDUCTNmLnJ9e2U?=
 =?us-ascii?Q?2P6GVqFSoFjvAGqZeHCgs81Bk1UM7TS2r6yvx4gwb5UkCl/i6fbWYi/eP3w4?=
 =?us-ascii?Q?bkwfgxfEn28FAnk3zGmZ26AxpXossQPFkQdrxcsTikVRkGuhnNAzLgiPgqKV?=
 =?us-ascii?Q?zjyQ4gE3uIChSSS7aF27pJh4BITZX/8WAY6VnOs6cnL+dNXXCZ2a5IzNmBO+?=
 =?us-ascii?Q?D32CZKlGvxiLg+PsuHRp5PPVRkxP0ks61gPGRQG62mQMKsFjR4ud?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad7c0a7-243d-41fa-bba7-08de5f5f922a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 17:55:21.1599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GtBLaTJ1pBf83irDkqTeCglC8khY26bDlRCWX6odr0b1lyONlzjC4IJ7bHg8Y1Ixxgdn3QN1O1u/zCigvkme7BkJTQHYf+VIHVHRiig5DHfxQ/RAW49JZFrJeGWMAq2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27635-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:dkim,TYRPR01MB15619.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60939B3512
X-Rspamd-Action: no action

> From: Conor Dooley <conor@kernel.org>
> Sent: Thursday, January 29, 2026 7:45 PM
>=20
> On Wed, Jan 28, 2026 at 11:51:30PM +0200, Cosmin Tanislav wrote:
> > All supported SoCs have multiple DMA controllers that can be used with
> > the RSPI peripheral. The current bindings only allow a single pair of R=
X
> > and TX DMAs.
> >
> > The DMA core allows specifying multiple DMAs with the same name, and it
> > will pick the first available one.
> >
> > There is an exception in the base dt-schema rules specifically for
> > allowing this behavior (dtschema/schemas/dma/dma.yaml).
> >
> > dma-names:
> >   anyOf:
> >     - uniqueItems: true
> >     - items:
> >         # Hack around Renesas bindings which repeat entries to support
> >         # multiple possible DMA providers
> >         enum: [rx, tx]
> >
> > Allow multiple DMAs to have the same name and only restrict the possibl=
e
> > names of the DMA channels, not their count.
> >
> > For RZ/T2H and RZ/N2H SoCs, limit the number of DMA channels to 6, as
> > they have 3 DMA controllers.
>=20
> What's the rationale behind not setting minItems to 6 here
>=20
> >
> > For RZ/V2H and RZ/V2N SoCs, limit the number of DMA channels to 10, as
> > they have 5 DMA controllers.
>=20
> and to 10 here? Do any of the spi controllers on these SoCs not have the
> ability to use all of the available dma controllers?
>=20

I left minItems to 2 in case it is necessary to wire up SPI to only a
subset of the DMA controllers, maybe for performance reasons in a
board-specific dts?

I know that dts is only supposed to describe the hardware itself, but for
now this would be the only way to pre-select which DMA controller is used
for a specific IP.

Let me know your thoughts.

> >
> > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> > ---
> >
> > V3:
> >  * impose proper maxItems for each device
> >  * impose maxItems for dmas property
> >
> > V2:
> >  * new patch
> >
> >  .../bindings/spi/renesas,rzv2h-rspi.yaml         | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.y=
aml
> b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > index a588b112e11e..cf8b733b766d 100644
> > --- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > @@ -58,12 +58,16 @@ properties:
> >        - const: tresetn
> >
> >    dmas:
> > -    maxItems: 2
> > +    minItems: 2
> > +    maxItems: 10
> >
> >    dma-names:
> > +    minItems: 2
> > +    maxItems: 10
> >      items:
> > -      - const: rx
> > -      - const: tx
> > +      enum:
> > +        - rx
> > +        - tx
> >
> >    power-domains:
> >      maxItems: 1
> > @@ -121,6 +125,12 @@ allOf:
> >          resets: false
> >          reset-names: false
> >
> > +        dmas:
> > +          maxItems: 6
> > +
> > +        dma-names:
> > +          maxItems: 6
> > +
> >  unevaluatedProperties: false
> >
> >  examples:
> > --
> > 2.52.0

