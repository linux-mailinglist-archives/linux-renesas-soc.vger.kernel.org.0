Return-Path: <linux-renesas-soc+bounces-19005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32491AF0AC5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 07:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EB551BC1295
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 05:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5E860B8A;
	Wed,  2 Jul 2025 05:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TOGbgGuY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010026.outbound.protection.outlook.com [52.101.229.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7809C4C62
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Jul 2025 05:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751434586; cv=fail; b=JG3vp5/a740hliUVk9AeWGItuxODkB+5zgZbtkNH7lrrHWKfr5tOGsE65RMyllm/hR765BgCJSogdjDtJwkQn3O572nIPRm1stYqSOjMK2LWXWamTLW0c/n3y+8XYNT2eVonRe87owNCB19AXctKaZ3A6rddtU3QSkR9HMB65j8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751434586; c=relaxed/simple;
	bh=WQhjBs6vy0LySW7I2SQzbFbrPwgmGreqJs9UNdvt5jM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JO9np8O0CjNmwL8XDaW2vGZWKAJxtCN6ARW75D5qT8w0NY/jliRBnhLI3lo2tI2A5T95roMMULdRGRIs4HsiI/dwIOr0iitQrdaTZwWAWxLyKm722soPot4f4m8oUWgDY4ejKhOSB5o9OtY07zAyTqgIv8t6geOQcRDVLA9K6hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TOGbgGuY; arc=fail smtp.client-ip=52.101.229.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWigkFpM8/L18pR+N3cF/6hBqvybMH9xoXhvWdpe+lha/QGruG6lJpoIyorxTKMVPWihzR4YFL3ELlGtpLDRchjpjU6WcE9hUoNEJdqRfxNMYPjaKj5Qyzb8CCwNtQ87UyJJT02LDR/2E5oO1ftj9h+2nrCX36DTDj9/2rfD8OEJ98HSeK/+B0axQviHYuH2BG/46G/LVla+FgxaSzSzjingjw9onPzoPEZ3GEc1jnkk3Or8rqVkmLHOswAJPDSqU9B3qXQYfe4u6xwnvlLcYXs8o4r/HFSkeP7eVFOfm4BYK+AlqIxX9hbnccITyUk8LLhR/XjwkDiFiAeN48S3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQhjBs6vy0LySW7I2SQzbFbrPwgmGreqJs9UNdvt5jM=;
 b=RLj9mmtbV4+tMbbcvv7feL1R+kCA4FYSwjMcBgYi5+NVvqUfWiy9x2hmrh5tYg/ISeRmrNhgGyDp7kMoeB9OPYxOox450me9mlgCkK1xi8TZ/U6XOh0AL73lv56ugg7xcQZa7FFVsyKiCRJP7eXAJv0o7K7DnWbdeAwo3rk84hNFoCUYez9mBudwiUPYZ9zYrHqJ99ebP3MmBgXylulBwXTxcl9qBxSORNV39nJzIpMfp7sv1pq+HmqnMDy2kKMRXrHYHjni2oNy6m2IfdEwo1SO92/0JKZHpi6Xtn9Jm6nAf2eBMG9LsDgb2nqd5xJvHD7Lf0XrkdVg3Gwgoq0NVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQhjBs6vy0LySW7I2SQzbFbrPwgmGreqJs9UNdvt5jM=;
 b=TOGbgGuYWsTbv+8MTkkj6YwnoQq+9DdPc8I2V4jX8RKfR03KkIv/bFK+QjdIk2x8Csx+RauYMudViF3elnJpRuWNIa8M/XuM3xaeE7vMpyCojZoLc0hMJV9rDUqMcl7X6v+OYacQgMj4YTs+dSVygecmRTfY3iXX9b+yFUPo/1s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB8058.jpnprd01.prod.outlook.com (2603:1096:604:167::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Wed, 2 Jul
 2025 05:36:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 05:36:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, biju.das.au <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] irqchip/renesas-rzv2h: Enable SKIP_SET_WAKE and
 MASK_ON_SUSPEND
Thread-Topic: [PATCH] irqchip/renesas-rzv2h: Enable SKIP_SET_WAKE and
 MASK_ON_SUSPEND
Thread-Index: AQHb6nc4GoXyynlWI0KlXyMSa1SelrQds0qAgACc+gA=
Date: Wed, 2 Jul 2025 05:36:18 +0000
Message-ID:
 <TY3PR01MB11346A8CD0F056540086E27B88640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250701105923.52151-1-biju.das.jz@bp.renesas.com>
 <87ldp7llkc.ffs@tglx>
In-Reply-To: <87ldp7llkc.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB8058:EE_
x-ms-office365-filtering-correlation-id: 57e8f6b7-257c-4c38-2b76-08ddb92a5efe
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?h/RFjxuvru+wLmhIOYY2RZlgPm2exfqnlNqBxajvjqHxESHX5wgAE46/yiMs?=
 =?us-ascii?Q?Dsf291UjGtVVGYqRMBGSLv54YFD3BrwKXt/EeGnCJ5LmgWgeWatWf2KxwA2l?=
 =?us-ascii?Q?FVhj0iskKgaCfZOEQBfvHOPyK4nVCgKpRgJCsrCAp+9S0IBqVkxIXTx+gKFo?=
 =?us-ascii?Q?1Ap5hQKenvV4z39685J1YwpmIpUXbOlRYjhiJM4a808+OxYRTBuMrseDXUdZ?=
 =?us-ascii?Q?GNMvzu5KOj90xSrycCp/Rb6JHm+s/mpIszGFTsJgKg6rCUp3uQB8IybDeB0B?=
 =?us-ascii?Q?IlUBcQ3Z+0Q1W1eJZgd2Whl9ccTV+MboJhv8BZtFtUDlIpUuu59ZKCjxgLjW?=
 =?us-ascii?Q?meVkpZJUKfTCYWIbH9ckZULTMNeHzRlsOHz8zaxAlNgpR7wyIA9ojrYG6Q/X?=
 =?us-ascii?Q?yWeo6BSspnKOLlSz4kuKycz8AHx+R+aaAgO9EzlCSLrEqeyPkGVBu1hp8bc9?=
 =?us-ascii?Q?uOuINaUAM8J5TWqDaRea8LFMOwJ6M4AD+55MRhn8OMbzUgvvaRYI21tXUx85?=
 =?us-ascii?Q?oXJZU3g++TpHnAMAplbFbTEp7oewponXxFVZgVBOyMdrchqFT6EZ28Ih7vZ7?=
 =?us-ascii?Q?rjaWRHPFyX/Vzz7uWVkGortNlJG9CuGLY8zOJmwCnuCRtj5yG9lHCYCIEHXY?=
 =?us-ascii?Q?jH+BmKDbNMuF8C4h2++zxDqFOg/QV9uEpDEH5B5WvpCUh9dz2DDIPUwQY0Cr?=
 =?us-ascii?Q?ULNNhZzCpVUo5CpTHgke2k04kKyUxlxzNdO//vGVpnCp/R76Hr+ugwFZVMnL?=
 =?us-ascii?Q?q6tHYFzGFqXr2sqKVJlvF4/7kofBHPTpjBNNcSlpSLslPhiry24Lv039eFUn?=
 =?us-ascii?Q?mhcBlv6Jxq5f9FdZ8jfqp90PZL0yxlgkStCyGHyJs/A1w0v2ZsnoXEqsqLgb?=
 =?us-ascii?Q?n5fc6tXoHujtLh3xw8h8hFR7KQ2ZVROUYWunomnRlQWYcBCxUqW/ObhYUtgV?=
 =?us-ascii?Q?IZKtq6+raW+zjEDJCDZzwBQOZjYQcM0AieXgvTtMjypKXzmPXfZo9+ngsZ+9?=
 =?us-ascii?Q?u9taCaaAEg9/lsMt+hIczxbVvAjsMhgUcTu+vOnukSF9Mzxotvp+YUQ60pif?=
 =?us-ascii?Q?et4QGfs9XCvVRhcoJ4xMb5DdANvZkKOvrgjHnNYYbDlUnfbrDMErijx4w4ly?=
 =?us-ascii?Q?mDn8dFoaRWCnsmxDZRPaQMtnANJYYFlw6Cken6y//cpWiy0rbpLqECbDcvzU?=
 =?us-ascii?Q?7zyzvwcbXUR8gz0EpCCBQtqNI3VBSsa2o1gDI289kHdchwbQzU0m4fBwqf/P?=
 =?us-ascii?Q?CUDMNsPgXCshgseG54yh5TGOkbXD+iL/UcIDFJdrcQ5LoksoAtasRVbcnabN?=
 =?us-ascii?Q?7RP60BBIA5Gy/Hr6Zdr0u2lHHk6USnwjrPPmg62Vpe7xJcL7ba4cqDISmUg2?=
 =?us-ascii?Q?WYNr6EevnjMMVJx5LzT1NcaaqB5bzaQ88GJ46QQuQrmTXxsT25xmSNfMxsGI?=
 =?us-ascii?Q?HtTXdUrtTWK0Vm6oQHNM3xDLC0TjqZAeDtXu4cGmYqt3sy7xYvEeiTePYz+H?=
 =?us-ascii?Q?+ln2t1GV+sEmTWA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pnN9YYS3inta+ZrpS7Ar6tkW4CDUr6r9+VnUjwnfa4KuqDc1gMGWrGCXr0cX?=
 =?us-ascii?Q?NHmhiD/3sVrixkUdaIDQ3eOj5R3vcxI002fMbrPXnfrxX0Rz+OwHcMYL0Zjv?=
 =?us-ascii?Q?i+Fq+TkwOvV7w6D94HMUH+Ir+bzsNbvrNiNMSjqAnIhJ4Wkk0x8CxWremrB6?=
 =?us-ascii?Q?cnQYTxOKuv1pt6zKM1Xi0TINHfxB9cdwN+8HV8NU7a7IHZeQKg2b1gInLz6u?=
 =?us-ascii?Q?b+CiSnt6Zmren1vt2SGQXcSGSl7bJvflWb57jUmRyjlWcqajNC1SY+ovEkrf?=
 =?us-ascii?Q?7LX4rVsXExWIymquzfyCPoTIydm8eHBWxsN4z1LrORZ8IEutLcB6d3DTWH9M?=
 =?us-ascii?Q?BQL1CH+nt0gJyHPlKuewpJxyOO5kRndY1xXyUgDet2VvRh+BC2GnTTKNfyH8?=
 =?us-ascii?Q?S1mk/eDXvanTKCWGIUWU+ZQEi/VD1GmzbLyRYIkYnFUtabGUBoWS/a4XjzzS?=
 =?us-ascii?Q?F1TSg//0ZkRWkLzhv3SFINn9AARLdHrjmDnoK9nC6Ep4DCuX6x1ovsySFvNa?=
 =?us-ascii?Q?GZCUGcVHqFttGSw5cHwHeKtYct7fDMj9NzKCrsYdLZMZ5Dwr+ASSSKJJQSJ0?=
 =?us-ascii?Q?dbCNNdkHZcAufU3M4JujYg0MbeiBcj69sCcEOMfjVEbiSvKw6CUGfqwCAPLs?=
 =?us-ascii?Q?StJerLq3LErMwzPzQVVTXYaQliGgp3j7dSDEXCVUo1T6IQjRDAnHlZpMRKWs?=
 =?us-ascii?Q?jshSeww16D7CLc0xoNiMyEmUKdZO8fMutEfg+2aUi2+Be9jocA1JbUX05ZRH?=
 =?us-ascii?Q?9OWO30nY6hhWq2sYRSJM4rjqTSqi/+y5Qd5PZajfT42vnkh17JywHJ7yM9gp?=
 =?us-ascii?Q?fyE14qFHa1mWhgrw/eK9JCUFOMRV8N+qyCl9W1sIqBW5dSv0i4lJybeoiQJ3?=
 =?us-ascii?Q?5BLvXhRj5H3S7J/vF/SVbAbJaYaXZ9Wm3dD/swB46calvOPRgGRyX4UBIxl5?=
 =?us-ascii?Q?XnFDXHEymWnsvLTEvLyl0GNR6D9AtK+D1OXJ63SvQ42QARiz21gOBEM5/6zF?=
 =?us-ascii?Q?zHvPDGTVDGYVjN3WImy6m4RaAxJUO/e66u7oC5aYaoAIq/LA5FhgZFviPSC1?=
 =?us-ascii?Q?mkPqxP1i9mPUUnWyVX+yDPE7eDh7IBIFCnzmmDpYoMlSPBmA3H6a0krIp+hk?=
 =?us-ascii?Q?0i/2Bbjd923C2tOhyfiVGjc0h6cgIVHa7hS/q9nKU2U8LLx64rFOX3D0YIAx?=
 =?us-ascii?Q?WGyC/DoF5y+v06d3JVIWsDsQHWUONp5sILiu4y2HQQPsseI7ELzV6HkmZUZh?=
 =?us-ascii?Q?Fa3ohVwTstYevLPBY8HckaWItKBQYpWaOFboVmr7QaCdMFWdm/+Y56w+BKPd?=
 =?us-ascii?Q?uevDjgj/zsJnvZftoM98SymhlsDewUQSHKqyEy3BBfzeSDIyWj3c97jfT4kG?=
 =?us-ascii?Q?yN948eJt5/ESRXZVXuartgnwO0JjEdhV6kK4BZnw8NkYU7eb2B6iNNIqPyxL?=
 =?us-ascii?Q?7reVqGjeWAQf5pvYHvIeR3wNLF/3K5kISRgzRIWTVvKhx9zobLlR9JcbCVmh?=
 =?us-ascii?Q?QZSRjhDHbSMxrlJsPQ82xnjxxbwXKkLKsUzYSCv/3RNqyokLQQlhc/mJOOOP?=
 =?us-ascii?Q?vVNMLDdEQGhwPWEy4wThmCWYSaAeNZ7hqnVKrberRcVKjhu2Si5hIyL47eCN?=
 =?us-ascii?Q?zA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e8f6b7-257c-4c38-2b76-08ddb92a5efe
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 05:36:18.9627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QWbfw1UIObFI1NHqx6BODh2viLjUg+9QXgoVcXIY26r0BBJAaQQHSJeQXOOL64KUTcoHVh5QJxfChLL/t98v+6noasU+6pmGnsG8cagH3wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8058

Hi Thomas,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: 01 July 2025 21:10
> Subject: Re: [PATCH] irqchip/renesas-rzv2h: Enable SKIP_SET_WAKE and MASK=
_ON_SUSPEND
>=20
> On Tue, Jul 01 2025 at 11:59, Biju Das wrote:
>=20
> Can you please cc: lkml as required by the MAINTAINER file entry on futur=
e submissions?
>=20
> Why can't people just follow documentation and thereby make the life of p=
eople they want to deal with
> their submissions easier?

It is my mistake. I am using a script which specifically filters out some a=
ddress to
avoid noise. I will fix my script.

Cheers,
Biju=20

