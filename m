Return-Path: <linux-renesas-soc+bounces-27261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP3pJsvecWk+MgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 09:24:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9276304F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 09:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B09CE4EECE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 08:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC523366540;
	Thu, 22 Jan 2026 08:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="E3Pqs21d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA1D329C60;
	Thu, 22 Jan 2026 08:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769070039; cv=fail; b=jq8jAClxXDK8eDaRHhPB52uMT2vov8nuwvYTt0E1iVf9wiCZ10Zg2lGWlGALSJOr002kevf+9yr2466VLbzRr8XyaLtV1x7MXqo+bvKOuv+lSwaZOkaqOppBqrjq/JAAuv4M74yBoxWSPfmuHYWjKrPCAHuATfUjBhGrvDRk6pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769070039; c=relaxed/simple;
	bh=91Jl89I4kG9ZUvISeEpCSi+Z++dsPqYPYA7qV7R+H9g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U2Tan1rD1QdKYXIsNzuQ5zG99c6tqE11zEakTButg7nD3blUj+L65mqvUMgCN5HMO/DsM2gAlR7EV9rmlYDnGam/pdJWTeALRCmG2aWUNLaL0ilYLudeCVida9SProul/g0LL0U2EBnLrP5PBG87QWy7uVIV9Q2JVFUjfCAYFlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=E3Pqs21d; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBUOD6y1PSFIZ7wEPxA6mOF1Jtzuj9pF41H+1dIIrZqQ3iZaxGzp5zWFkGnvykuPW1DlHVHbqtwD15SQsys/JqR5xy5omFcj+LfyWhQqZ93f1lwHVT4Ob2fsvEGf+6aGdqKSaDp/EHbxhDFv0jnysWZvru/hv4JBKlr+74ba7ZXvU442xNOAFBpQmCaNK2V7mL4JVUZM7c7LGSGUgDWt5H33cLm7kYEiPFbIo6xnT5jr4KaCK7IIimTet1dXawlRs0ykBM6lOqWEke+7cB99wDEZImG7I+NDK8mjKbMHWp/00eS+9Fy/ra6iI0pjnI6TO0UcKnzDmwDZIuZZzF8bQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qm56hDP8T9HyIgvJOPplcSDUxqM8tk7IJKmoMrhWYb4=;
 b=qNPID64wSXx01k9w5bDhiPrR2aKKeXKAp+I3Xk/Bb1V3xDUT3PpASRHewXRda+Svrnu6MShH6SKwk8m3CsTvwdY45o52wBbi5W8Qxk0lSYMfTnkLjMEhaPhHOLvSQkW3Cy4moOk+2sIMbnC7LuT3CnJF2jn/QeKjFy1DuC/91aiVnGNskXd0PY+T4JJ68cf4ndnuz/yn+/WvfZ6eFn9fmDWsWsjpi1XD2sZPrZjWqRBa1Gd2iPw449X2TnZ1/wSACHqJlSSL/KgD5P01qy36btDA0fa8Xig+/t2yhC63uTX5xvPBwXTDt03/rj4hAd4xDOj9td1BukM5CdPf16CpCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm56hDP8T9HyIgvJOPplcSDUxqM8tk7IJKmoMrhWYb4=;
 b=E3Pqs21dqhcgE9g7dQA2NJOV630CAQm+s3zWBUH1RDtnloaGd+/ISYFoG6vzasD5kGj7tA8uvo/kaMQPgPMTtu846nphKj1IVZgI8HgzYUyA/AfvmSLr9I8AaDP0G//pwuMxliVYkjhuqjbWobvCxjqgSTtL9ISfi11HxiccUk0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB14287.jpnprd01.prod.outlook.com (2603:1096:405:21d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 08:20:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 08:20:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 5/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and add
 SWPE trigger
Thread-Topic: [PATCH 5/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and add
 SWPE trigger
Thread-Index: AQHciubnS/5c+t9510mREMj1ku8eh7Vd2TCw
Date: Thu, 22 Jan 2026 08:20:30 +0000
Message-ID:
 <TY3PR01MB11346DB069193A06BB45DC62A8697A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260121150137.3364865-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To:
 <20260121150137.3364865-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB14287:EE_
x-ms-office365-filtering-correlation-id: a9549f68-4d8d-4f92-b26d-08de598f1b21
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vVRBYsJ2pzAQZSkfS56RgG4ejItEu545J0OJ8ZaNFFLuqbmqf5vRxL6IZgB3?=
 =?us-ascii?Q?/LP0XXo9EuL+598skuk1mbu5BodC+4hQOTVXf7oMGdz8Oq2de/nApm2gg/ks?=
 =?us-ascii?Q?ZuZSSj8cWNuT1NC+xKrCuSCpFQzlvT+MaXWzVoaMZkvpKqBt+OdUxIS74YGu?=
 =?us-ascii?Q?sb6b+/zCD/WxXUDBrD1xx8W0iVi/cqG8R2GIVuM+BCOg2jVQ9k3k0AC9RLvO?=
 =?us-ascii?Q?dgvuDDn0+YykU5jgTtp+Ihx7I7YyYywrEaZIoFRFfNthD0LYs6/mBlzD7N7z?=
 =?us-ascii?Q?AR7gxma+VROik2tDs9pcIsZrfS4/1dGLdcUaodKXYtb6mpQtVh5fijeEIMBO?=
 =?us-ascii?Q?vUrAJYXZLK0ZT/R6sTFNQzWXNDrVtoibQllzj2q4dWlb1oR9pzHCBc2N+y/G?=
 =?us-ascii?Q?radV/4QKkO49B9RYKOtreWIEhVi+TZyF+VV/PdIPM6O1AWnEl5qIH2ROgtzh?=
 =?us-ascii?Q?Xt20JpEqgsoGIGVSvOJrN8JdIV6++JatgR25FC1ubv1hDo+dwxQ8vwkui7yB?=
 =?us-ascii?Q?Ht/CAZPh6x5B+u7A8K15BpUNr6Hhlh1hNo2odDgl438Y/82TzY4z2YIshvnV?=
 =?us-ascii?Q?Mav4BzHr6jDdwhihSXwN1TawqOnSLt/Phz9qJbEOE/WtV3p/ZAX2OKxWO3wH?=
 =?us-ascii?Q?/zgjRqe03RJuzCfYQ7MwB5ouKU+cIggJbcD7yWHiTDcoZSpEQgA+8PqMseai?=
 =?us-ascii?Q?QI0tZcaTccN7nyYTY3ZCTetkbKJMjCQudSM246bD80K2rcD1kKQLjDWNpq/0?=
 =?us-ascii?Q?ao3kQTV3fbxdDto7JnOcS0XqldH1QNQ3AqO2k7skcJMaKynWLf5pONpguF6+?=
 =?us-ascii?Q?+1a2a/llfvPoPW/JdTTVx6vQYpDVZXURtH90m1dtNXkRswdUyQUg6LSRee6l?=
 =?us-ascii?Q?UaJV9SFBvjBGs7zkz/paNBH3NGSLL8VA+caYqP8pKNCuI4urGeUh3I15YVB3?=
 =?us-ascii?Q?7kuILSAqSk9idkKcKCj7ZNWaEEIG86XhnpEW1k4xm6r94I/o7qEbHzVhB5Q3?=
 =?us-ascii?Q?JUh1z6pRUlJ0MyQiQNTeaJI5iu51cv+TIoOfmjhFoTjiXZnECV4a6ted3xh9?=
 =?us-ascii?Q?4c84m/GvH7XgtVeZGtMy9UOZnvluhz5D52mA+J4yv+8rWfRe/MkM9PxhrA9Y?=
 =?us-ascii?Q?/PxqBTAM93N6SlGtFEhtyHaiTGDwuY1oi2JVDl5tbPU2MM8nmH++A/ZSUTvD?=
 =?us-ascii?Q?8xvdqV7ULnSnwx1FrT6kJMCt80bFV+KIZtDcfy3DeBnFEYXk5Zlhg16abdVj?=
 =?us-ascii?Q?V1H7HZmuPSMXK7IPdq2aoEZzI3SFILsSF/lyTHtWqvB0zs3JPOjxhM8YQdZF?=
 =?us-ascii?Q?MrV9SK0o/Qancggl/7KLyX20D3EetVOq1e67Caiy2iuW8S+Tza5yDqPxkGjP?=
 =?us-ascii?Q?FYahszUZT8aSx0IzBVTl2Z5YYcQ++sOblChVAtxzWrFnig7XdV8ZzovB/viC?=
 =?us-ascii?Q?gYYyFtKQHe0XF17VVUrURAeijNMEi5LptH0jo1FQWUD4kr41AasCqQn+UTLS?=
 =?us-ascii?Q?zxI18d26GdROvX7v5LiUw2cPUKU+Y39IgQYJ+WyJJ1iXqTm2VGNwOiuEG0bo?=
 =?us-ascii?Q?VHX62A4TTpwVvv8v02fHFncz6sJutopWghXaUqWIluB3Emhm4iubfFz7lgcl?=
 =?us-ascii?Q?DZ199O3d8cgrl6CaHv9UVqw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NFIRo0xPnztkud5q3Pu1vjQXChuKdvtuMcAIyWy0NQyacDvYsAMgAaIvgRiG?=
 =?us-ascii?Q?cjdBW7huZf/yBYac/CHHKU6tf8uc+OjcKbGNvYm4SzAnXeA0OMR1S248GC4q?=
 =?us-ascii?Q?/pOk3s8T4mGKkLYk7JkpaqyOkzUX3FGZFcBNe8PRKM4AOPf3tZsAGFU6lw6d?=
 =?us-ascii?Q?5QNfwX/QHJMjU+uqAg5USX4DjFQt55c9Vf0xekXL8gmzA2eDy4vH9XmDCC6b?=
 =?us-ascii?Q?L00JPipGnrcYgBssP1cZiWdL0C3NKyK8mNCXOtk/qSmtGLNhjZiXKRLZXdZN?=
 =?us-ascii?Q?2I54N2BrCQJWtm7xrwLtA20h9fQtOPkoRYxLN9gR1BCfc+fiGzcMc6gdIfyb?=
 =?us-ascii?Q?1NwjiJfWIPtUcyg8l/EdjlZimes5osy8WK7KQxlys1ifcpr9ivbK6jMQ2gBv?=
 =?us-ascii?Q?0qO/BkEljS9KDV56ssZAebDQGvjcAHmnjlzy96BM1ZOBNjvbC+I03fwHPBTs?=
 =?us-ascii?Q?7PWXojyuN38mWs620CLHFIMmNHCMll2HcNKPw3WrOcdwnQaLUTZ3N2vkN9eH?=
 =?us-ascii?Q?8y0cJFe4YuUB3bG5juDIVyWLDDRGouSW3Qk5rZqD3B9l6NcJYHCw/z9PvpjL?=
 =?us-ascii?Q?m7AOFw+Es9xtxptAnyBlazfce+XCwTw5ueoHa3+k25UnMQczLj9AXFNNby/a?=
 =?us-ascii?Q?xcdFIfa/rQq+shBTv5Xx2xQaP72GLyzKhqQ89Apn5wauwxJD2n1c3xEFo07W?=
 =?us-ascii?Q?atXNu2pH93HKYoMxdQzozxynxTLQnpFNpGSLfnibbqQp+LRayQEqnLRIwXm5?=
 =?us-ascii?Q?KTLTx6HoZNlRfP5kB0I9/pMgXkjAzs98TLQt1f570SevxdJgFv9abNr6HlyT?=
 =?us-ascii?Q?e3wXl0vOfE5TEDJGD2tS9JIxa/tJwXpP72lNNXji5FQeaAf5/DD7gXTXc4KQ?=
 =?us-ascii?Q?o2xQKyTJpu0yJZxJxpVqq2BuTZJqEoTSAZN4hWnuAtAsIZa0v74Wkkx10Qwk?=
 =?us-ascii?Q?iYmjJnw7QzvdhUTt/LGRhvwcF6ySsTBbZVuDUqJ3UBf6bWzwftk8LL/1e9Or?=
 =?us-ascii?Q?TepqrPZ+I1kYCrcdyjsCU2VVQTMVasJyN9lGnQ9hPici9kJc5KWUUAEeddZe?=
 =?us-ascii?Q?XjB8vHhTDiW7SN1aByHEiy7ICvQuTz30bq8RBOL3tMTQtZb/sPLBN2YFc+AE?=
 =?us-ascii?Q?wDh9AzW0T/ibZpaSaBhj5OFP9yK9BUJ8csSdlbwzjRlbfMnfQsAiaTs+9BOD?=
 =?us-ascii?Q?MlZT27YXM2BUg5JzipksCOww6Sl3OW/j4H7bHKpjEva2EnjCIQ0Q0NNoQswV?=
 =?us-ascii?Q?qpymtVnrC/fr0Q2Ygqf70tUCQvKXrWmazC2PtD9nfhK0Bq/y9JyAWb+ecqMT?=
 =?us-ascii?Q?ENB6sHRdtxelo+hXTAVjiNaOrTFZPnVhy3A3NQ+KcSZxckO5pfhpfKIfbfjE?=
 =?us-ascii?Q?3nSKPM66KiLTPTPObGN3gpd0Mr7TnFCTDWLZxXl+ZeSbmdpynspkeX9HxAE9?=
 =?us-ascii?Q?Feh5EyfXJzoX3pKJT1LmN8EFz3PfMGxLk+0jzYeIOkIDv8qqylnZFZLaIXQ2?=
 =?us-ascii?Q?B7pR8yAG7TFEtu6JFtdytAIPgWQci52d0l/DBGS/HaUMN/ksQvKhMTzv/UwW?=
 =?us-ascii?Q?bMFIKKJnuuXXuc1xturn6HdsLKSZoKTw8xHdzavgJZvpDPhLDHmnhSElrh7W?=
 =?us-ascii?Q?1IYi7XkqFF9cye+0wfwF8MAqs2ht61/C+QLiQc+AE4oqXLCvHWXVuAtrMk2t?=
 =?us-ascii?Q?BCrd28WxMxVaojFM0z4Wik8rKWyBJshcz2wpTc0l8fDUqUrvLo6195QHEhWt?=
 =?us-ascii?Q?cCD8lPVGhA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a9549f68-4d8d-4f92-b26d-08de598f1b21
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 08:20:30.3134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hTtzuSw4u2kjWske6wpDPMk/bskXaEkkdsyc5TybpinV0U6eKKaf++aOxJxswQWtrV5HYkyVUKFaN6oaziCfzCnT/sdPDngEA7lcY8WAGkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14287
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27261-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de,glider.be];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: BD9276304F
X-Rspamd-Action: no action

Hi Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 21 January 2026 15:02
> Subject: [PATCH 5/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and add =
SWPE trigger
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Handle the RZ/V2H ICU error interrupt to help diagnose latched bus, ECC R=
AM, and CA55/IP error
> conditions during bring-up and debugging.


Just a question,
If the irq handler is meant for debugging/bring-up, can this irq handler ac=
tivated only for debug session
instead of unconditionally enabling it?

Cheers,
Biju
>=20
> When debug support is enabled, register the error IRQ handler and provide=
 a debugfs write interface to
> trigger pseudo error generation via ICU_SWPE for validation.
>=20
> Account for SoC differences in ECC RAM error register coverage so the han=
dler only iterates over valid
> ECC status/clear banks, and route the RZ/V2N compatible to a probe path w=
ith the correct ECC range
> while keeping the existing RZ/V2H and RZ/G3E handling.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/irqchip/irq-renesas-rzv2h.c | 141 +++++++++++++++++++++++++++-
>  1 file changed, 140 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-re=
nesas-rzv2h.c
> index 7d3ce1d762f0..6dc297220f05 100644
> --- a/drivers/irqchip/irq-renesas-rzv2h.c
> +++ b/drivers/irqchip/irq-renesas-rzv2h.c
> @@ -21,6 +21,7 @@
>  #include <linux/irqdomain.h>
>  #include <linux/kconfig.h>
>  #include <linux/kstrtox.h>
> +#include <linux/minmax.h>
>  #include <linux/moduleparam.h>
>  #include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
> @@ -47,7 +48,15 @@
>  #define ICU_TSCLR				0x24
>  #define ICU_TITSR(k)				(0x28 + (k) * 4)
>  #define ICU_TSSR(k)				(0x30 + (k) * 4)
> +#define ICU_BEISR(k)				(0x70  + (k) * 4)
> +#define ICU_BECLR(k)				(0x80  + (k) * 4)
> +#define ICU_EREISR(k)				(0x90  + (k) * 4)
> +#define ICU_ERCLR(k)				(0xE0  + (k) * 4)
>  #define ICU_SWINT				0x130
> +#define ICU_ERINTA55CTL(k)			(0x338 + (k) * 4)
> +#define ICU_ERINTA55CRL(k)			(0x348 + (k) * 4)
> +#define ICU_ERINTA55MSK(k)			(0x358 + (k) * 4)
> +#define ICU_SWPE				0x370
>  #define ICU_DMkSELy(k, y)			(0x420 + (k) * 0x20 + (y) * 4)
>  #define ICU_DMACKSELk(k)			(0x500 + (k) * 4)
>=20
> @@ -99,6 +108,9 @@
>  #define ICU_RZV2H_TSSEL_MAX_VAL			0x55
>=20
>  #define ICU_SWINT_NUM				4
> +#define ICU_SWPE_NUM				16
> +#define ICU_NUM_BE				4
> +#define ICU_NUM_A55ERR				4
>=20
>  static bool enable_icu_debug;
>  module_param_named(debug, enable_icu_debug, bool, 0644); @@ -123,12 +135=
,16 @@ struct
> rzv2h_irqc_reg_cache {
>   * @t_offs:		TINT offset
>   * @max_tssel:		TSSEL max value
>   * @field_width:	TSSR field width
> + * @ecc_start:		Start index of ECC RAM interrupts
> + * @ecc_end:		End index of ECC RAM interrupts
>   */
>  struct rzv2h_hw_info {
>  	const u8	*tssel_lut;
>  	u16		t_offs;
>  	u8		max_tssel;
>  	u8		field_width;
> +	u8		ecc_start;
> +	u8		ecc_end;
>  };
>=20
>  /* DMAC */
> @@ -565,6 +581,48 @@ static int rzv2h_icu_parse_interrupts(struct rzv2h_i=
cu_priv *priv, struct device
>  	return 0;
>  }
>=20
> +static irqreturn_t rzv2h_icu_error_irq(int irq, void *data) {
> +	struct rzv2h_icu_priv *priv =3D data;
> +	const struct rzv2h_hw_info *hw_info =3D priv->info;
> +	void __iomem *base =3D priv->base;
> +	unsigned int k;
> +	u32 st;
> +
> +	/* 1) Bus errors (BEISR0..3) */
> +	for (k =3D 0; k < ICU_NUM_BE; k++) {
> +		st =3D readl(base + ICU_BEISR(k));
> +		if (!st)
> +			continue;
> +
> +		writel(st, base + ICU_BECLR(k));
> +		pr_debug("rzv2h-icu: BUS error k=3D%u status=3D0x%08x\n", k, st);
> +	}
> +
> +	/* 2) ECC RAM errors (EREISR0..X) */
> +	for (k =3D hw_info->ecc_start; k <=3D hw_info->ecc_end; k++) {
> +		st =3D readl(base + ICU_EREISR(k));
> +		if (!st)
> +			continue;
> +
> +		writel(st, base + ICU_ERCLR(k));
> +		pr_debug("rzv2h-icu: ECC error k=3D%u status=3D0x%08x\n", k, st);
> +	}
> +
> +	/* 3) IP/CA55 error interrupt status (ERINTA55CTL0..3) */
> +	for (k =3D 0; k < ICU_NUM_A55ERR; k++) {
> +		st =3D readl(base + ICU_ERINTA55CTL(k));
> +		if (!st)
> +			continue;
> +
> +		/* there is no relation with status bits so clear all the interrupts *=
/
> +		writel(0xffffffff, base + ICU_ERINTA55CRL(k));
> +		pr_debug("rzv2h-icu: IP/CA55 error k=3D%u status=3D0x%08x\n", k, st);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static irqreturn_t rzv2h_icu_swint_irq(int irq, void *data)  {
>  	u8 cpu =3D *(u8 *)data;
> @@ -611,13 +669,47 @@ static const struct file_operations rzv2h_icu_swint=
_fops =3D {
>  	.llseek	=3D noop_llseek,
>  };
>=20
> +static ssize_t rzv2h_icu_swpe_write(struct file *file,
> +				    const char __user *ubuf,
> +				    size_t len, loff_t *ppos)
> +{
> +	struct rzv2h_icu_priv *priv =3D file->private_data;
> +	unsigned long swpe;
> +	char buf[32];
> +	int ret;
> +
> +	len =3D min(len, sizeof(buf) - 1);
> +	if (copy_from_user(buf, ubuf, len))
> +		return -EFAULT;
> +	buf[len] =3D '\0';
> +
> +	ret =3D kstrtoul(strim(buf), 0, &swpe);
> +	if (ret)
> +		return ret;
> +
> +	if (swpe >=3D ICU_SWPE_NUM)
> +		return -EINVAL;
> +
> +	writel(BIT(swpe), priv->base + ICU_SWPE);
> +	return len;
> +}
> +
> +static const struct file_operations rzv2h_icu_swpe_fops =3D {
> +	.open	=3D simple_open,
> +	.write	=3D rzv2h_icu_swpe_write,
> +	.llseek	=3D noop_llseek,
> +};
> +
>  static int rzv2h_icu_setup_debug_irqs(struct platform_device *pdev)  {
> +	const struct rzv2h_hw_info *hw_info =3D rzv2h_icu_data->info;
>  	static const u8 swint_idx[ICU_SWINT_NUM] =3D { 0, 1, 2, 3 };
>  	static const char * const rzv2h_swint_names[] =3D {
>  		"int-ca55-0", "int-ca55-1",
>  		"int-ca55-2", "int-ca55-3",
>  	};
> +	static const char *icu_err =3D "icu-error-ca55";
> +	void __iomem *base =3D rzv2h_icu_data->base;
>  	struct device *dev =3D &pdev->dev;
>  	struct dentry *dentry;
>  	struct dentry *dir;
> @@ -654,6 +746,36 @@ static int rzv2h_icu_setup_debug_irqs(struct platfor=
m_device *pdev)
>  	if (IS_ERR(dentry))
>  		return PTR_ERR(dentry);
>=20
> +	ret =3D devm_add_action_or_reset(dev, rzv2h_icu_remove_debugfs, dentry)=
;
> +	if (ret)
> +		return ret;
> +
> +	icu_irq =3D platform_get_irq_byname(pdev, icu_err);
> +	if (icu_irq < 0)
> +		return dev_err_probe(dev, icu_irq, "Failed to get %s IRQ\n",
> +icu_err);
> +
> +	/* Unmask and clear all IP/CA55 error interrupts */
> +	for (i =3D 0; i < ICU_NUM_A55ERR; i++) {
> +		writel(0xffffff, base + ICU_ERINTA55CRL(i));
> +		writel(0x0, base + ICU_ERINTA55MSK(i));
> +	}
> +
> +	/* Clear all Bus errors */
> +	for (i =3D 0; i < ICU_NUM_BE; i++)
> +		writel(0xffffffff, base + ICU_BECLR(i));
> +
> +	/* Clear all ECCRAM errors */
> +	for (i =3D hw_info->ecc_start; i <=3D hw_info->ecc_end; i++)
> +		writel(0xffffffff, base + ICU_ERCLR(i));
> +
> +	ret =3D devm_request_irq(dev, icu_irq, rzv2h_icu_error_irq, 0, dev_name=
(dev), rzv2h_icu_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request %s IRQ\n",
> +icu_err);
> +
> +	dentry =3D debugfs_create_file("swpe", 0200, dir, rzv2h_icu_data, &rzv2=
h_icu_swpe_fops);
> +	if (IS_ERR(dentry))
> +		return PTR_ERR(dentry);
> +
>  	return devm_add_action_or_reset(dev, rzv2h_icu_remove_debugfs, dentry);=
  }
>=20
> @@ -759,12 +881,24 @@ static const struct rzv2h_hw_info rzg3e_hw_params =
=3D {
>  	.t_offs		=3D ICU_RZG3E_TINT_OFFSET,
>  	.max_tssel	=3D ICU_RZG3E_TSSEL_MAX_VAL,
>  	.field_width	=3D 16,
> +	.ecc_start	=3D 1,
> +	.ecc_end	=3D 4,
> +};
> +
> +static const struct rzv2h_hw_info rzv2n_hw_params =3D {
> +	.t_offs		=3D 0,
> +	.max_tssel	=3D ICU_RZV2H_TSSEL_MAX_VAL,
> +	.field_width	=3D 8,
> +	.ecc_start	=3D 0,
> +	.ecc_end	=3D 2,
>  };
>=20
>  static const struct rzv2h_hw_info rzv2h_hw_params =3D {
>  	.t_offs		=3D 0,
>  	.max_tssel	=3D ICU_RZV2H_TSSEL_MAX_VAL,
>  	.field_width	=3D 8,
> +	.ecc_start	=3D 0,
> +	.ecc_end	=3D 11,
>  };
>=20
>  static int rzg3e_icu_probe(struct platform_device *pdev, struct device_n=
ode *parent) @@ -772,6
> +906,11 @@ static int rzg3e_icu_probe(struct platform_device *pdev, struc=
t device_node *par
>  	return rzv2h_icu_probe_common(pdev, parent, &rzg3e_hw_params);  }
>=20
> +static int rzv2n_icu_probe(struct platform_device *pdev, struct
> +device_node *parent) {
> +	return rzv2h_icu_probe_common(pdev, parent, &rzv2n_hw_params); }
> +
>  static int rzv2h_icu_probe(struct platform_device *pdev, struct device_n=
ode *parent)  {
>  	return rzv2h_icu_probe_common(pdev, parent, &rzv2h_hw_params); @@ -779,=
7 +918,7 @@ static int
> rzv2h_icu_probe(struct platform_device *pdev, struct device_node *par
>=20
>  IRQCHIP_PLATFORM_DRIVER_BEGIN(rzv2h_icu)
>  IRQCHIP_MATCH("renesas,r9a09g047-icu", rzg3e_icu_probe) -IRQCHIP_MATCH("=
renesas,r9a09g056-icu",
> rzv2h_icu_probe)
> +IRQCHIP_MATCH("renesas,r9a09g056-icu", rzv2n_icu_probe)
>  IRQCHIP_MATCH("renesas,r9a09g057-icu", rzv2h_icu_probe)
>  IRQCHIP_PLATFORM_DRIVER_END(rzv2h_icu)
>  MODULE_AUTHOR("Fabrizio Castro <fabrizio.castro.jz@renesas.com>");
> --
> 2.52.0


