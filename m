Return-Path: <linux-renesas-soc+bounces-21578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D786B492D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 17:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 438553A776B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 15:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427583054FE;
	Mon,  8 Sep 2025 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Y4Uy5nSt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE522110;
	Mon,  8 Sep 2025 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757344684; cv=fail; b=flJWxaW6/Ayr7u9JLGTPMb6qw4/m5r62YTqbNDjzyVeSFNHve2jt6EugBpW4acnSELFFs8bPbIFpQP+Uk3MCq6v8AYydp5cDg/iYMDo/6YDuLghQcsV4/AEUwFJWPfj0xfx2vMpjrqBkTDtVLSRbMlyzVmuDfQ0j2YbRquHuN5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757344684; c=relaxed/simple;
	bh=tHAt3cyHikzE/41ExlBQZox4ZADG7tu3bAgoODb5gyQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uXJQJSE9mpgEc6Aew7DRKcR7UdIIofueuOrLQMxys6SoJnQ7JDn+mCx6IZtJkYEQ1Z0HBvi41yCg2Q50+Ii+b8CJYZ2FM0lODpVy56yvmLc0lNi53xZUucJDWw4fBsHueDfEga7z4lPQxD5J20OJ0Br8BJHxYblwMQxd8Uzc38o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Y4Uy5nSt; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3DZMBCItp/jmo4eL09G7ihocJqiXaQ3zfS0DATYiirNcXWKaiixEYIAi/rIRLUEx4kVoIDMmZjA/G0vT1H/8/qgMAVWDYPGVTlrz0gkczRBXnRtdsTWQrEaHMTQTHzx108Qsmk9KeQ6O35Sofv3ZTUMPogKZ5+H5M/wRLTV18/SKXEY2TKb0AiVGGR6+1h6+1Kc0F7nLQZ4d2SJ8xhVupB0H6jffnZffr1e0H6vkT6HPpOFNlyLkUgR53ertdGm4BZF4iEJpyWFkByxbyf8teAQTsNx+szv+zZV+2tUcTgrZ14GIpeEbE685wd/VMjboQJyuKBhLK7Nn384MLQI2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHAt3cyHikzE/41ExlBQZox4ZADG7tu3bAgoODb5gyQ=;
 b=bvJJgC0VS+e0mdvRnZzNh3eENA4cgc40eFyq0UOjNkiqGR37UrnCiJq1MU6MwwjzZ6CvdnxCGuN/DY+pR+epexe1ieH5tFqZov8TVjOL95AoIkxMEdLJ8lWZBFr4FCnJvrrkqoUzcio1YHqOvMk6Fyt9jvwXXuRspX1+O1nAWlrMuUWpqfFE9K5SSE4hBd+E915ho8LbW623+IlSNBEY5df473NhYdWQG0jw5kOasBHt9Z4jbfSJNHNICYZ1TKkqhXYN7/gRn/MwdfwbRz7IQh3pZARcaLwEjqgX85YHqeq1jDKjMvy2U3XRsMtqALdmzX4tsygwC/5wiQ8XBk36lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHAt3cyHikzE/41ExlBQZox4ZADG7tu3bAgoODb5gyQ=;
 b=Y4Uy5nStCjroOeGEm9YJM/M+iKqqb8yJ+pYyzvnzkvILeUq60tHwCRO6UI+EN96nr4S/h1yMUcWkjzW+HXK8J87I9CV+xi8rPnAWxuTCRVG6qksPI8Nq4RBFjm1wXsFDhP+mauC4VKNa0Th6DBEpPeQR8MftuoPyXasQznab2cU=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY3PR01MB12018.jpnprd01.prod.outlook.com (2603:1096:400:40b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 15:17:55 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%3]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 15:17:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>, geert
	<geert@linux-m68k.org>
CC: biju.das.au <biju.das.au@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 0/2] Enable 64-bit polling mode for R-Car Gen3 and
 RZ/G2+ family
Thread-Topic: [PATCH v3 0/2] Enable 64-bit polling mode for R-Car Gen3 and
 RZ/G2+ family
Thread-Index: AQHcAXF9szS0mLvi3UuOHSntT9dq0rR5kjWAgAAJwQCAAAqDgIAABZ0AgA/zUsA=
Date: Mon, 8 Sep 2025 15:17:51 +0000
Message-ID:
 <TYCPR01MB11332990CA8D7FA5FD964C0AD860CA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250730164618.233117-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWOMpZo0fVASyDV+XTLmh-o0ozqfF4Za_sPiydsh6LOfw@mail.gmail.com>
 <aLGAaKYucaW1vPCg@shikoro>
 <CAMuHMdX9HjP09R2p-PS4KgHKB6UcAQB+zKqN6QYwsboxtJCkPg@mail.gmail.com>
 <aLGN7ohswQ5FYdk1@shikoro>
In-Reply-To: <aLGN7ohswQ5FYdk1@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY3PR01MB12018:EE_
x-ms-office365-filtering-correlation-id: 6233bc48-7f29-4dd5-abb7-08ddeeeae072
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?b05imnvXY5xJnhg9Qj+nUHxM17lMPYiQIFlZ6GAiIr0zsNwluLc4QWgtOIBZ?=
 =?us-ascii?Q?oWNEhQInfl+CDqUJpN0+Z7IG25CgIx6Z2r3b5Jr0WRn1O5bE1iJ2LeaadjwO?=
 =?us-ascii?Q?HtLcMA838vmvtLiiBvUJlDGGkx8c+eNscnp5mCYFGrqCohZHYtW19IOEQI+4?=
 =?us-ascii?Q?h4wMDYBKpMZ2ReR49JC07owhf7AEx2OFWEu9lmlPeeAz0npltd1GVwtoOfAm?=
 =?us-ascii?Q?yWKWGSAOhSfFI+pUz54ClEc7CCHxBUalTemN86MwC8/L2whStA2y7acNvQpZ?=
 =?us-ascii?Q?iATIDbovK3Wsu4qSDsPZCINERtZY42cVlWUzNsVzy8ZmMl9nTc7oMO2fyN4w?=
 =?us-ascii?Q?846QxyaCnsECkhwFEH61x+6n4HWlkdHK1RXEevTg86xqK81i0ir7jSi6l28z?=
 =?us-ascii?Q?ogb7QxIl8Z3a8/Yq/Yg/8wIBcAevmGXbkIGov4z0C/HI6A9mIkYjs2BDlJwZ?=
 =?us-ascii?Q?O5wuC8VYdiV0BsatumDj6rN+1BiLRxlZSDb8BvAem3ywMW+SIxZlx4XSpU6Y?=
 =?us-ascii?Q?LsOxR5kuDd8Ypj3JdmDd2EiER0BQI+NIK3tMVoFyKPI0ey23g3hn8Xgi7PsZ?=
 =?us-ascii?Q?vOa8iLfsgWAAvWd/T2VE4q+0mKvloQLycE/V9MRoSKkBcv9so1kFZiLBX9UF?=
 =?us-ascii?Q?TIlw6+cHucSgEYDqBqy4Pl4oKv0ZWfHH9W0VNcykUobuwJj5DjLPmYPeek+G?=
 =?us-ascii?Q?9j8oOmn35nV4H+QUMU1RkT45qYp5VUzqmQwP2PGlO2m8Qfa6qf9SzEaKbE+P?=
 =?us-ascii?Q?Wq5WcCqoLa4IrsZT7ME4inlrWFqM6DJ2Y+dXRDximDMqTJtriCa2liHD6lMP?=
 =?us-ascii?Q?D5L6ciHPY2rGWh9Ly1pzv5Itq1cDczOBp1E6AzreKoU3vbhFPYVH4xGvt7AJ?=
 =?us-ascii?Q?Lb/zG6cY7k5YwhPkB2liI6n1CHKBYmYKkYcaf4JMzcbVymyHz/7/4Bm/HDjz?=
 =?us-ascii?Q?CPWvvAMxGvumXIZmPwwOh4I3uzhRJIEEOqNBgCVkMlbP4uSq9bImHlP1z6Ae?=
 =?us-ascii?Q?1khXJeLd2FLTClrE62OHldFGueBFcDUIpv9g1pEuh6uK7Gfz5lCXArerJpMn?=
 =?us-ascii?Q?2tEkTerPzvMHU6wHK5qSp+0Nbf7xL6tuQHhzq9bci7K49uGiGZTjLlPTC1Oj?=
 =?us-ascii?Q?YB34Qb5sDUdlunaZVOqNcXB6DgY3zj7z07dlNBHE8WdImeiMrGJrzCXVwSZd?=
 =?us-ascii?Q?Pp0ADYahH1S3s4mhMRMYz6vwXXU5Xeoo2fLDJd+riYSN1N2ms6c0fum3jhJq?=
 =?us-ascii?Q?bExFbOyA86+Js7QcYbdT1kHKKe+JVazvZck641j3c5yskC8GmCuOVcZI7BQ4?=
 =?us-ascii?Q?GOgZ4uOIJd5ri0dtEeA602J7tMa6QvykyQrmTVqdXUoArXWmrzZXpcZea7Yf?=
 =?us-ascii?Q?UKp1IX4afnPUW3SPwYzqkceoR6oSjHe+Pfsdv/uemysMOw2ZfgKpBl8NttW+?=
 =?us-ascii?Q?NdJHddPKTJPtYdIYQgU8pSZhPQmcTgyzAlRffTjy5z/T/So6Yv4w/w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Knaf6MMyoeGCCoW+wX2ytqsDhukK6/VsNM98tNaqa4fDvrBvrdK58AJUIP/M?=
 =?us-ascii?Q?w4G76CxJ4h3imjWBQ0o5/yx+a3mTtMj1LbsIOMKaSGvtPK1P+RC7qJyN/fFT?=
 =?us-ascii?Q?++9zRU0f4fWM3WW8vM8pOB3lri7nsyCgyxpraWTl6qRrFNZLpK0HT2QivSgc?=
 =?us-ascii?Q?h7KTKmVLFSXsAYkjEtmYY1b6VJp7hjyZKD8Vs5P4wNzzS1x/Agcclmb3NzUo?=
 =?us-ascii?Q?5PizQFVdnrI5PAPkkBYyQuljnb+9YTadsnuLCETV6bfVl7xgN/Ry8nqYeG0s?=
 =?us-ascii?Q?uaM7Pa9NJ6D9BfMDSMBSjzziUZtA9GMAVsvYMz4a3uiEbXyDWTl+ftZEUWnQ?=
 =?us-ascii?Q?DMIRczKaxU5lBD0vpNyVvqU8J9pna91QGDufwmwqtO3KDZRhubIE6rf2mY2d?=
 =?us-ascii?Q?qmNFkVioKPJGhGncqN8NNRpuHfgjPAy49Mq3ZSYbaygSSp2jmQK41nu2OuT/?=
 =?us-ascii?Q?x+pAikYEDN9gyyrxd0IMVwPjcOfalZp1t/EvehRqGVcl/mo0bAynqORW7OZ3?=
 =?us-ascii?Q?t+ynorimUKE9VlILgJSjxe4WH0Wy+DCjcUl1XL6q2bwF1aA281sxdrZXaKGe?=
 =?us-ascii?Q?gsgAE8OChf30HqRDOOMMFpMF6AOfRr2nkcA17E4cjOzBBxFwrMqbpPdrqxdE?=
 =?us-ascii?Q?35RGi4p4ZTZbDhuLz3cSM8UF27MZs/6dRiSVHqEl6iJ2KaD7p+FGZGeboA7X?=
 =?us-ascii?Q?OHkFQk9NPVEE6LYQYj4gkQFLd9gu5JOQLjBez9oYbeRhShuakuG75f4Y/LoL?=
 =?us-ascii?Q?MiVlptDwcwJA1rgckcKEozpNyCeFbgLjP1vnlLPajlHmURZCpfTsQ+NL7iSJ?=
 =?us-ascii?Q?6PNqML76/ycZodc2hF6OP2mPC5CuH5wap52pjazvTdWFZoPAhYpy4dWJAzZz?=
 =?us-ascii?Q?bd9W6x2kTSCwv/Hs1+XCr1griysuHzWNxw4KSwqTUMVtBZ8FUil3v+Nug5CE?=
 =?us-ascii?Q?UGxnVYwVEh7kzFrzT/8923hEDy+zcaUfXA3kf67u6NISlU5WHjyLOu9PD+j9?=
 =?us-ascii?Q?AKBQtparz5vXjJrsXDmWU4C9LhnDPCkzIDJyaksJFLO40OPxAfk/n2hpyTXC?=
 =?us-ascii?Q?jN+yJ5zVkU/v6CcQ/f511vix6mi0mlVX0mRWAci4vrwpWSMvrMvHOj5S7Gow?=
 =?us-ascii?Q?8ynVJhh5oJ6YsV3P/FcLDymSvDAXNH2FsGvJn5DnfU8NGA40lMWGOoGAv7J6?=
 =?us-ascii?Q?LDf0wtw9iRal1IgRPdswlkoh/xdtJ2Q1JteBzYm3OaFKaCeu7uduIHytMpA2?=
 =?us-ascii?Q?oZSrT0ZxzScVb1orD4BEY6/fuPn02meEMXKgArVRZ1U4zesUJHX2RlVASUCU?=
 =?us-ascii?Q?5N4t/2vyUlYnwZ4TR0LYIhdi8IKVU4o7o99bkO6DduIiLViFRKbAV0LVVRgE?=
 =?us-ascii?Q?jZ/ax6WUhSMw2oSy6oiyBQQFYvROeVegb8BiB7cdvdRLnTb0ZFja6PSlu9Ze?=
 =?us-ascii?Q?tNrHL87gM3uWp2dOhMLxhTyw4fUW9sAXTFXp+I4jsidX+ZkElguKrT3fWzme?=
 =?us-ascii?Q?aNTohdH0sl7HWFNAlbsRgFnzih9perBWKWMaoF4TkDE4EvZnncyPq0GsRGAw?=
 =?us-ascii?Q?SKh7RWSvLY0X/LB0u2Lazn8MfYwcJLYFiQAl7N1bQ0Ey8cDgQZNImLQ6WKO0?=
 =?us-ascii?Q?eQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6233bc48-7f29-4dd5-abb7-08ddeeeae072
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2025 15:17:51.1761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U00azer7u1OLHyQ50c6xr8ZpB1UuNGMJDS7LpIQoaFkX6VvFjcQHF8vRzuhBQTbe66wPUVe2LqB54kYGL+lkJR8AIWphnWzhmrp39eeSg2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12018

Hi Geert and Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 29 August 2025 12:25
> Subject: Re: [PATCH v3 0/2] Enable 64-bit polling mode for R-Car Gen3 and=
 RZ/G2+ family
>=20
>=20
> > But this is set only on RZ/A1, so my question should be: are there any
> > other SoCs where TMIO_MMC_32BIT_DATA_PORT should be set?
>=20
> I can check if it makes a difference on R-Car boards I have.

I guess we need to add support for 64-bit polling for r8a77970(R-Car V3M) a=
nd RZ/A2
and 32-bit polling for RZ/A1.

These ae the SoCs left out.

Cheers,
Biju


