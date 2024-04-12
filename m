Return-Path: <linux-renesas-soc+bounces-4538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C4A8A287E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 09:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 091C71F21D0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 07:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFB64CDF9;
	Fri, 12 Apr 2024 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="M4y08Bgb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2060.outbound.protection.outlook.com [40.107.113.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A1B4BAA6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Apr 2024 07:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908248; cv=fail; b=YJLPFn1kVhVmhUZkdlNjnq2TrddGSyLcaKHqtfTYuzuPuUFYA5j6KfBgpJoPBhL6Fpngnj7oNfEtM/IN0Fo6m1BTQeD9n4yLmxUgEif+lZvebDEr8nbD28uC6ETKTyZ22sjWCTRjrQxPRtaV1Bvx+w7qwSkyhQ/uGFEH4CzboSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908248; c=relaxed/simple;
	bh=2GpWP9gumuztX2BuSasZqY0wRUWUROAouKKV05MNAZw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XuEaM2cPjnYLHVjtQBKSiuTakw6FGMbTtnkbXKE5cYWP6ljzxWL0odRLn9d1/xiKa8xvmYVgQVmrqyfHmYPPD905ROkr1ADPEs4SziklbUFmTqWtRZ5UOuGqBsSk8f0Vn9unq3C8dy2dIZSAoKqiIEuCRzL2t+ySHgwntUhdTio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=M4y08Bgb; arc=fail smtp.client-ip=40.107.113.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgM9r7QmP8P3lqFUa9G3FQJ1s6MZ90EXSFBOAZl0bmCjY59KwyF50wFbIGl5CUKrUOcMF8Rjh96tYbyICnOlzYA7EloARwdO/3Oxl5o6U4QIaXev+dbou/7SZKjWfqSgXK3JzN7+g3ktGv0Puog8CbuX+pYsFQCETXjPItyMm4VFtgrXEFq7TQymQhrKaInRFUxmTCO2hg5N7n98H8rrvLabcMoEn4OyMSrgipnzlKiDNRtgwnxHoc2lI9dYWF9xY2yJEJm+nAmzMLULUrYqruHG07fLeUngqw+BmeQdNpyzS6bxV0j40w80BaxzBefZXlhyGwJw9v9vYdh+bRO5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GpWP9gumuztX2BuSasZqY0wRUWUROAouKKV05MNAZw=;
 b=QtQEPV00l9jbGc6xmHwUe2EIENImnelKWDcLbEUgrpqb8/TfXYRevrL5VJR3b8zlA6AiD7s7GqwRHoI4uRFYsHUiac2YYjiZI2W9jOsMDd73fx1ztfiSldi6QoJG3zVF2vrbv57cXFziGEAo2Kk5ddWJDM4/yrXa5v8byfT3KeDN3DqpTntn64z9mYyIgWz3VwDXHZ5SYF24esAPUelQJ5eHON3PpX03sIHnuEuFekO+MwvOZzWvcQ2/FHNhWmOMid5lg0xD/xhYwPNDbjTmAnElv1LuUnWZCuLJ1yQAFMo5wDrWvYCEESuCfMbONe4GvnqEo/yUzo6ZLNOAjxffCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GpWP9gumuztX2BuSasZqY0wRUWUROAouKKV05MNAZw=;
 b=M4y08Bgb7pUF2jRyJjgmPOERJU+dEb4vyMlohIXoIlbwo4vLgClMlPwTXVD41BGt3UVvrhlHH3aWoe6vTlAUqCU3QytvrTg6s6uYlk+yzXkgQ4mtOmYoohjjSdty06008QsOPLk06dmu9aQZzmSqfugl03bxN4dk5+vCRpaazk4=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by TYVPR01MB10861.jpnprd01.prod.outlook.com (2603:1096:400:2ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 07:50:39 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::fda5:45f9:f1b2:cbce]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::fda5:45f9:f1b2:cbce%3]) with mapi id 15.20.7409.042; Fri, 12 Apr 2024
 07:50:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, "REE
 dirk.behme@de.bosch.com" <dirk.behme@de.bosch.com>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>
Subject: RE: tty: serial: sh-sci: hrtimer not properly canceled on chan_rx
 invalidation?
Thread-Topic: tty: serial: sh-sci: hrtimer not properly canceled on chan_rx
 invalidation?
Thread-Index: AQHajA2cXGLOpxWRlUG3ZoVbcaKX57FkL2mAgAATvIA=
Date: Fri, 12 Apr 2024 07:50:30 +0000
Message-ID:
 <OSAPR01MB1587CD88A216128F964D876E86042@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <ee6c9e16-9f29-450e-81da-4a8dceaa8fc7@de.bosch.com>
 <w2poytt4lrbex2g73wjl7bww7fb6q365cj36x2fp6k2x4kx3v5@t3kwjy7n3zcx>
In-Reply-To: <w2poytt4lrbex2g73wjl7bww7fb6q365cj36x2fp6k2x4kx3v5@t3kwjy7n3zcx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|TYVPR01MB10861:EE_
x-ms-office365-filtering-correlation-id: 3853c500-5c0d-4515-ed59-08dc5ac5399d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vhw1k7dWObVF74eLJ6/25mqiWVzM6I+S7MOOAYYnDKVyDA7hh4YZnfhb4Lq5pfqloJt5i0C+wHzEVC/lIgcLoIhZ9RoAUqz65UNTcZxFWz/kMFwoVUou/oClat/eUkzcYWbSzt2AiDts0M2Ohx1YV93pPXEjThsOPYsZQIMK6M8A8fiHaGVMAzxbVhBXFmtgrFtMgeUXWwYyzh5Xa0p7fg/h4jroSvJo5xoOottbd0TN+eMP2GaZoujy9h0yBIi2V36pBmDjiemIoainfKJk32pkW9p5j1fjocR36SnsnJfRes3ulwTDxdhhgN890WeTcLTB3uIMGhh2O7+780jBNx2iwNdSGP6WNE3TlUAV/uzj22HUUx60P53wdCX1m6s/XNGTQMD/MxcWO6MIM6LAPJaI5cStUpWuid69QEcD4g21CidF5Y7FYl15/yzk0QDJi8BRgvSTwWl1fKQtLFBp7RiKJQbQTQYXeBQz0zQqZWXjYfyi6U3zlgx3orIRma553LpUZyx5FN2QpFjee6j3fv6aCRgBrvGGE2Ftq6yjtOTQO2uCOgy4NvoeXt/TDF2BQnualx0kShUszydqo6ECBWg6RxaJyRd0JBBCiyC9jFsy/EejHHEtMKTl1b7ZQiUc7D/QOxyf28ddWi0e10a3oc5h2GG/hyQM4CaWrwuQOm8z6OcI/cUD4n/kVvKIfXn23gQ2i96eDHkcbVT5MM6M+A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XM/AsJi+M3nwJ4GffQoaxlwsCKN5PZ+AweAvZu8sOMmZD5W7cQXPz1gpssrK?=
 =?us-ascii?Q?Rzxpen6FT6fd0XB7CwN0bF5kz5Xf6uJss06rN/TaDtQcwZe+etQHrTpecG6y?=
 =?us-ascii?Q?u9SZdWaWZl4Cq2msIg1eBmvbk07iek5LxGxvsHcQXOiRlwleeSaLN5LI7h9/?=
 =?us-ascii?Q?oEtAZ/TPVPCjRgSuDV8Tlq46siV4+U4PM9O3WxDVrxm0PG6vdFCWwZ45dWjy?=
 =?us-ascii?Q?L+hGNCDbf5nnjH2i9pvnzqWv37geEbh3dIwsE0b06831jq4us0c39s+ycUI8?=
 =?us-ascii?Q?PWuTEmAGpJBYXnRYoz44E+Bvwh/VD2ivLa/TnIebJ8sMukjud5yaAWCa49xu?=
 =?us-ascii?Q?lZelYhfdXk4bX+xNikI3xSkbvy7ejW7VG7/sx/T7Xo5u0DVma45TNCLgdx2K?=
 =?us-ascii?Q?NxvyvIVYLeklWyCNo7GymEYJSDxynZBAMnab5Wopl4LK2GlapkBDswfJzPW7?=
 =?us-ascii?Q?Wnm6FCdfNbC6n775X2wBzf+B+9XIaZH1cFkAFshiTIHFhgNQnYNDN54iRzJv?=
 =?us-ascii?Q?wnfVMXk0jeZbw3h1pnkidi0Hos208fxAx9qgH/4VQTPQYXw5AjUVPhbYOXWJ?=
 =?us-ascii?Q?ILZZuU7IHw+InTqRH5rXalr/k8wTQC96SbGSmt5h00FjSGyozal2ctcy/F7B?=
 =?us-ascii?Q?+ScctNg51ICWltZ/uxYdLHKMDYHidxmaHygYQbZcPJurulFAMRxeZsSK/l23?=
 =?us-ascii?Q?Nj4BdlhVADPtgDXkye8tLOiYQ1zJLM/8A2tmUqG2djv/sKEGTBkDqfUIK4ob?=
 =?us-ascii?Q?f+VVL/S/8CH9/PvunTSBiane+EY/xdzJh2hGOSbi1ihJT2zI+lRIhNDe7s5t?=
 =?us-ascii?Q?OKa6PRXVYZMR3nlHJJmvZEtMGeQ6eZJHSGwgtKvE///Jbgf7QKNuFGTesuCx?=
 =?us-ascii?Q?IfSX9QFbpIvgAMj42qHjtlPoeJdKaLzH14Qs9ikcPnQqsFLgkuhv0B8sVgPo?=
 =?us-ascii?Q?mimjjUp1XTUUmKj82SsApz43rj6wSOcOTG4XYI3aB+r2S7a1m3t7gDytGPFV?=
 =?us-ascii?Q?BMYK+ZLV5DsQo92Oh63Si/dGd46Frlagd8TyuW15r/ELky/PzzuO6vpnCVY+?=
 =?us-ascii?Q?rzT+1Yy30NtZIZOC6Sm8XrR7GLdnHaCuJeeea4+ljcDrNkE1OJ3wWFYV+9xZ?=
 =?us-ascii?Q?EIioy4KLUzVpsZ4GqAkf1Ym1cnf8NaYQiykTr7g90qf7iEtEYEwy8QZ1PJZH?=
 =?us-ascii?Q?np7yVgEc1KsHpp281Fw21LLQioTH6GRziFqTA3u57fFpM5J8yun2EGaMzHeZ?=
 =?us-ascii?Q?sAPNZwVjLb07SF1fJ7egeejuNXzYr2orbK3hZAMjn9X8fBUmbWGgtf1U+7Mg?=
 =?us-ascii?Q?+JUON+xFKdO/4xlPJHQEUeJ5lWC4il8Xp3OKcAjXEu+OWXDoqiB1rRMnjZKW?=
 =?us-ascii?Q?14ivoGhcI5sqeOHdgwBg0iTJNdY+DYBmY7Y4XGYTZrUjE3nVQX5pGrLNZzUa?=
 =?us-ascii?Q?rBli1iFeUtzmKupH9gd/DZRHJv05GBgJc6a4g/wJUUzUyXol3+ZB/80h3X8o?=
 =?us-ascii?Q?fBe6q8EmGyBwB+49JyZ+77T2v1ggjGPjMP5F4Mmz6UHgA1bVIe6WeenVf80/?=
 =?us-ascii?Q?uLnspFT7UWgP8bTjKqN7hpCd1M2cKQrgaOwDAUw8becg72VKmDu2Z4DIPoSU?=
 =?us-ascii?Q?SQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3853c500-5c0d-4515-ed59-08dc5ac5399d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 07:50:30.1424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DWz2oyIR0h1FskY4nqUjUneSdMQZYSwT4Yps9ZLNCDmna9qnOo5m7aKW7M5kJs+VcUiXj8+oY36k8edA6ifls2BA6OWIfuHzZAOQkVpWN2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10861

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Subject: Re: tty: serial: sh-sci: hrtimer not properly canceled on chan_r=
x invalidation?
>=20
> Hi Dirk,
>=20
> thanks for this report!
>=20
> > Is there any chance that there is a race condition where the timer
> > function
> > sci_dma_rx_timer_fn() is called while s->chan_rx is invalidated, alread=
y.
> > E.g. via sci_dma_rx_chan_invalidate()/sci_dma_rx_release()? Or
> > anything else?
>=20
> Sounds a bit like the TMIO race condition you recently reported and which=
 we luckily fixed
> meanwhile.
>=20
> I could have a look next week. Or do you want to handle it, Geert and / o=
r Biju?

FYI, Currently I am loaded with RZ future devices activity. So, I don't hav=
e time
to check. Geert/Wolfram, please support this issue.

Cheers,
Biju

