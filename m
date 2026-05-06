Return-Path: <linux-renesas-soc+bounces-32141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGC1FEJf+2kuaQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:33:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A173A4DD4B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 854353043FDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1513F9F26;
	Wed,  6 May 2026 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MrXjg6Hq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8AC3EF675;
	Wed,  6 May 2026 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081504; cv=fail; b=QGPyD/Cdzef/wRny1oxprTgmylqvH7MrfC0It2z4uRRUYWswPfaKrEbYiIHIb2e+/8N1CgpHE99oQybXWIluGm3pHGCj2L5L1HPVkT+elzB7Iwc/htctR7/i/OTRQ6BBnlJbr7iYeUx0JNcsO/IKZRYdwLGVClYzs2vLYNsUK30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081504; c=relaxed/simple;
	bh=lV+J7LFxuMbkVwW40Xij3zOEVunPVJk962lHyJSlof0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ImDrUIl+AL6i0d/ZRjTk2XPNBEtTwV8tERKUn0iygcA7amqwbwwo77+cXY52MxFXrzMtJXhNghNB8SwxwtSS7F7OysNlz4KP/UPwa5ScMrE6an3GJgQRmtRrh7Jpp3CMvuT0j5Qq+NKVBVbx/x8TAJ3quOOHBco9etuQhP3VLgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=MrXjg6Hq; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oV87Tv+xF7tcR0QZ9W0PIsT1iOAUyjFMY5qVf7HB86gzYyuCY+yaMMpLNiYGuGF0VFTlxtzCQ/P9nqlQ0119zxED3NJQJh9adTthzDnDDdrEx7Sd6kWRCljKLRbRF3aBdUFcxAq3VQAqe4WkwFkWxqOkUKWxEn1lnqmO4NNetY0SStgXNeRyjGIJN0ASwCXqmFjcnSmEL8kmCUuglLQwU9cQJ6Cj9IpycvbhkXH+JsEeFGZcV0moaSJwjkLJmUhX8Jz98XOjjZLW2ik5VsTPOjr+lapYm/yOARcfhvQtSwuBRp56GqOAYNbjFsluZdiluAonJ0Prn+wsYUqVD3aW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMIaYbNWaiHrDF5cYUmGixCW9jzdZLJhobzh6LB/yUU=;
 b=tiRxg3IgtFjRy4Uxs2gPRpGhXy9XUFmov6hq9+h6kVsEJXKN2g/+H/tvsALyeZ4MpC9+SrIXjVx8kFdZBZqXiFNFpfFRVAuwgTEsi99sNDY6geIyDC2plDwSC77GJirlqPnfu6LWwCLpx0eVVcXHjDx+BZWDhRcA5MkUYmP4ku3WZWSd1xndRTSpmV6Gab6EhM4EfHiRptwoAmAOb1bJVPMD1RX7G1SHz7lL/vzOVgZZdhyc0mezcALla1M6vv5Cq0242yIWKF7qCzp5URHxpsyGusKnesLQg/iYihoeT6ZxDd9+RjW28CDWutq4pUNjaKiHPQyWS22OI9A5k4mMTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMIaYbNWaiHrDF5cYUmGixCW9jzdZLJhobzh6LB/yUU=;
 b=MrXjg6HqIAKG9JMVGJYBtVekatAHosq6g07piTgo/X32tkAappmPc0xIot4BP8NAuAGvzKK0sauUBncAp8TScO2k0tIcW/HhIRJ4AvNEFtFUUosyLiiuDfb3xpM6tSdm75ahETXVGtcO8tfyY/X6oTaYSLCIpLVB6SG/IxUShsc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB8218.jpnprd01.prod.outlook.com (2603:1096:604:1a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Wed, 6 May
 2026 15:31:28 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 15:31:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hans Zhang <18255117159@163.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>, "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>, "pali@kernel.org" <pali@kernel.org>,
	"ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
	"jianjun.wang@mediatek.com" <jianjun.wang@mediatek.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "mpillai@cadence.com"
	<mpillai@cadence.com>
CC: "robh@kernel.org" <robh@kernel.org>, "s-vadapalli@ti.com"
	<s-vadapalli@ti.com>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and
 100 ms delay after link training
Thread-Topic: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and
 100 ms delay after link training
Thread-Index: AQHc3WyHWuzP4HYMG0eDqePELVP1gbYBH4gw
Date: Wed, 6 May 2026 15:31:28 +0000
Message-ID:
 <TY3PR01MB11346620B7637A16120FDED26863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-3-18255117159@163.com>
In-Reply-To: <20260506152346.166056-3-18255117159@163.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB8218:EE_
x-ms-office365-filtering-correlation-id: cd116b98-141d-4462-c520-08deab848aba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 NEoZArqVqP55DDw4ULz0fXGVmQcsDYTILwHTrGaCrTqST+dlkDo2sXsatJ6GzcqxYWV7nJB4Jt4NgQ6IBCTWEpB6fxS9YqGrZhendema0r4EDbGoFmZhh4e8YSSrGRH52WlyM8rjVFXGt5/YQ+tigySBnjtTb15zeigiT6pz4kgNQiL3q6h4J43qBax+v32D9dx51kQdvIHl5fV1jR46DWojDYx7UaFmuve4Du9B5PE98UQixplOcxV7K6Jde8xmpIM6Ne3odG0/HVZFcfEodjr52ypiQCatFtufGXee8N3tD9kRLYLlqftPQyIflMrQC5lQqSZKei0qktH93wzk8eriakX4thfPjT7LWdUqaB/NfI4sjkB8mHB1dicmW46Ot/ZT182hB0GY0tnQZIOO8u8RQ/FsNY13pDP1+mZklUrcJTmG/FBiqFIDbEczmKkREQ1Iwud7gKRRBiRxYpHgMN5vN9jLcTbFe4QpQnojlywLZwCrATpx5QURRNFDS7/FRVBdLwxVbahyjI3tcuXQQAjoya/Ca3/1051s8PPWq0BWSPPIT98phbhDPgI9lPc9MaUB/pgGcIKQrfN9U8YIXEehEVwWOfdmQEHn1xwtKW7d/cDKGwpRAkLsw1/NKtq7+dlllUYfohpQazX8/NndqJ2itqSXbHAZGANByErgD2OdKju+0/oDuyzGIZz8B3Xw2UHNhBV0lPi5NSDlCznnn/lE9GsD2+9N0Ds0a65FhCL42L6uc5B1Rxt//Sf6JIVm80kmvpmYzAmepHaHBYU/qw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?G8Yb+/PNMlxzl4m/PDzkSamPrZ6wlerzZDu+nHezGyPLnr35K18DMImwaAp1?=
 =?us-ascii?Q?4y3MIIm3yRvaV/I/LJaA/JfL6W6XVVgAbfbXAVx1lSsqU0sbfD27MeO1HWNz?=
 =?us-ascii?Q?ZpbiJaguLSM/VdEkTNqpzNqYMHW5DkP6KGyOCK1ZZ1XfNtpDE0PeYRMkUSH6?=
 =?us-ascii?Q?I3Vp6G3u/4Cjr25YeFznOTpFXJAzKOPjwSybeJLUWVK6iGSZBzZ6h0JC62rg?=
 =?us-ascii?Q?Li/ngFcsRcpqYwZWjTH23yBZ5yEnUGaPRIfSxLM6aHYJ3bs7O7Zp5geC7uQ7?=
 =?us-ascii?Q?bCxgucht6Rld5Ju7eR3FuS9GAFnh3UcpL/N7MQgVIpAJTM5reM7XMkF79Xzf?=
 =?us-ascii?Q?wCdNzGleBfPnwKUejpdqFMc9lRdHnerji5yRwLZY0SFdlxygBg2CIeSjv7fC?=
 =?us-ascii?Q?XPDkWVF3z5kyIglI9V6BP7pQOxpXInGdsbNdsMJKvdd+WZAuMbbhkxolVwv8?=
 =?us-ascii?Q?XEliZhRwgwLZR58nntAsf4qKyy5UcwfLJr5A28QfTi/LXXNzVZJwmUHsIvIh?=
 =?us-ascii?Q?oqj9i8pbcndajsMwp313T7qUDjtD4PKH3VDnKRp9uckG7pFqgR4T2iztvDwl?=
 =?us-ascii?Q?COjv26gt+oJ4+2WMY07+TvjjFpOaZNELnkwrHy9RGxg9KvkTm6lkpuXDHpFx?=
 =?us-ascii?Q?iq6RNNIUKNYhD2uYlptJZb1ic6NMBbj1ynB/cacLh5BIOGhPIuWAzbwSAmHJ?=
 =?us-ascii?Q?V01lOtZVvG7pk2WMG0uW0VJRFK4y6KDVS7BTmOfj9okUyB19oOFTDqCXWfce?=
 =?us-ascii?Q?mf2jI2uw9+A3WlBrs/Db3kZAnx2jMn7RdIKPU1VPRWCVJcooRJttTUIywoHu?=
 =?us-ascii?Q?tpzokxHWOvtC31mBN3RoyzzFjuWogLR/O38N3WE+XOrZ2rewH1ilL/bdwxWv?=
 =?us-ascii?Q?eEBWfT1h50E5dZiQKh4Zde9vXmUAze//fUlRm1qEUBPoUxBHCtfdMPQI0KDh?=
 =?us-ascii?Q?33bRCBmylwZPq+tHfjiiLzvSg2f9ZZmisC7eqMwR4SdIUa3L69UMCC/g5JD9?=
 =?us-ascii?Q?sRSTQpzgmgxrakCVhlHvPQZl+WGrTY0SFyYv52kBVeQHVmvhTTPMtmRIQTgg?=
 =?us-ascii?Q?YIEw08EheEe54pkmVkK30DtPZfM2w8X8+2FDmrfua7zq0J51wV2kOSefkAc4?=
 =?us-ascii?Q?P+ZuLUsrF95WgCeFzVaClAS75H4zT1VQYv+AyIgFizJD1+Q5w05+TfzLVI8i?=
 =?us-ascii?Q?iZtP3kzQhx0SWQ2SDBmR1N5nklAg/IKSorDmPkC1h46ZMTXN7A9F4NcJMhf/?=
 =?us-ascii?Q?/S0IUQyAZ9ZPicKqAUOuJq04M8VQaB5maL+QL5K1Bea4SgDn1zSiPFxh6vW0?=
 =?us-ascii?Q?R1lwHrXKcGZ0dk3UeUGkKPAMrElxUH4ruP66zRdwPIFVI2m60oWqLXkXff8J?=
 =?us-ascii?Q?TU/FT/SUT7kBPBkOuNDxr0GdwNrCzWQjM6RM8BnCpilf71hfAaY1QrH4o9+F?=
 =?us-ascii?Q?o9GH2nQJvkmfTOqtRtvU8UENKo17OEkr9QC79By6Zxp6Zwp+tEHgkP430IoW?=
 =?us-ascii?Q?AJptv5y7ma/JIk4gUGJMXhmQ15Uw9DS24hB95kTYb2uW2krbFtOGjgfe2mLR?=
 =?us-ascii?Q?2LNpFl2svJdZF6lEIjygM5uL1GA2qMlyFBwYxmNlrr2bRhQwMurM/JBPnB1n?=
 =?us-ascii?Q?Av6tghnfsPmVjkyg7U4/UmENTImJgyx+phuwwCubhG9c8cqaE8O6EXoKrfGi?=
 =?us-ascii?Q?p6fgVqm1EIKK4cIu2QgxmO/pVulJtTrMieYRwGl3r7S9c9BGvozu7R27mWDi?=
 =?us-ascii?Q?qIAQ4mAloA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cd116b98-141d-4462-c520-08deab848aba
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 15:31:28.4395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yBW9PjudmoBN7sMIcByi2IIKtvzTTupRVV+lFcY0eABU7l0b6Q7EqGLLtPQFf4owJf3VlwApRiiEOEeZZdrhk53buapL2gM0bbGDr0WEyQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8218
X-Rspamd-Queue-Id: A173A4DD4B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32141-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[163.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]



> -----Original Message-----
> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On =
Behalf Of Hans Zhang
> Sent: 06 May 2026 16:24
> Subject: [PATCH v2 2/8] PCI: cadence: LGA: Add max_link_speed field and 1=
00 ms delay after link
> training
>=20
> The Cadence LGA (Legacy Architecture IP) PCIe host controller currently l=
acks the mandatory 100 ms
> delay after link training completes for speeds
> > 5.0 GT/s, as required by PCIe r6.0 sec 6.6.1.
>=20
> Add a 'max_link_speed' field to struct cdns_pcie to record the maximum su=
pported link speed (or the
> currently configured speed). In the common host layer function cdns_pcie_=
host_start_link(), after the
> link has been successfully established, call pcie_wait_after_link_train()=
 to insert the required delay
> if max_link_speed > 2.
>=20
> Glue drivers must set max_link_speed appropriately (e.g., from the device=
 tree property "max-link-
> speed") to enable the delay.
>=20
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>  drivers/pci/controller/cadence/pcie-cadence-host-common.c | 4 ++++
>  drivers/pci/controller/cadence/pcie-cadence.h             | 2 ++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
> b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
> index 2b0211870f02..51376f69d007 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
> @@ -14,6 +14,7 @@
>=20
>  #include "pcie-cadence.h"
>  #include "pcie-cadence-host-common.h"
> +#include "../../pci.h"
>=20
>  #define LINK_RETRAIN_TIMEOUT HZ
>=20
> @@ -115,6 +116,9 @@ int cdns_pcie_host_start_link(struct cdns_pcie_rc *rc=
,
>  	if (!ret && rc->quirk_retrain_flag)
>  		ret =3D cdns_pcie_retrain(pcie, pcie_link_up);
>=20
> +	if (!ret)
> +		pcie_wait_after_link_train(pcie->max_link_speed);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(cdns_pcie_host_start_link);
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/=
controller/cadence/pcie-
> cadence.h
> index 574e9cf4d003..e222b095d2b6 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.h
> +++ b/drivers/pci/controller/cadence/pcie-cadence.h
> @@ -86,6 +86,7 @@ struct cdns_plat_pcie_of_data {
>   * @ops: Platform-specific ops to control various inputs from Cadence PC=
Ie
>   *       wrapper
>   * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
> + * @max_link_speed: maximum supported link speed

Maximum to make consistent with other comments?


>   */
>  struct cdns_pcie {
>  	void __iomem		             *reg_base;
> @@ -98,6 +99,7 @@ struct cdns_pcie {
>  	struct device_link	             **link;
>  	const  struct cdns_pcie_ops          *ops;
>  	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
> +	int				     max_link_speed;

unsigned int as speed cannot be negative??

Cheers,
Biju

>  };
>=20
>  /**
> --
> 2.34.1
>=20


