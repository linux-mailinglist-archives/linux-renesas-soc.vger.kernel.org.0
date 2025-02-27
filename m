Return-Path: <linux-renesas-soc+bounces-13789-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56288A48877
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 20:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E41D3B3C1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 19:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEDB1DE3BA;
	Thu, 27 Feb 2025 19:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="eqentDAZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC6E17A313;
	Thu, 27 Feb 2025 19:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740682937; cv=fail; b=B2DuHjhttXMDhwRCuuioEKnF6/7AeaCUPn4fECBd82sk1mhf6UhLZ8GJ1mHiBDi6q74PnAqjITGepInLa77/JMGK3Pcsn5xiTTWFOWM55F5cHMvewf6zaDd+jUQACcQcfjfHEHT72aLtMnwXVbzaY6o52iZsSN5DfP+t4o8CyXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740682937; c=relaxed/simple;
	bh=ICLcR9/5XbtaAH8C25AcgZHjPZOlkSiRnWQPOGTxib8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GHUIELvyd2b18lINh2t2CF7DBU/vmKfm7CaQ7xs3dJVKwgFbuzvvTZIKv18iupsjRukDuZ8ADlAzix0AoHGLKeirfhfAEa30jGlfFj6by0vv7bSXE1NHgehyP2+p/vJq1PXoakB8wTYrgetRbl4HBgg/OjsOW6GQ8xKqs/d8GGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eqentDAZ; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwFoPt3e2Cb+OouSbFeBBXrB60Uc8+4o/gcwq7W3OaZ50ZQfZheiQo5Cnk0Jz8etWQJ9EE/p6/UCSRBf5KZGV+f97omF15nQMVhUlh/9k/4uHndWOG1+LzvKAC+koixk2QdcyQ/gJ2YXTJfHeVPrvAcUEM2PETfsKGBfACC41gL/tn4bCm5CrRduW/M/ZG/wXFySGjNX8cJqW1bI7RfSGa+Dmi0JB6yxQxJrgur7XQSqU0r1iUysIx3k8LRie7dB8sk4oPNqgCjfu9FB9LPFV6pkit7/AbMoD/WKJbUfVz7DQzyqJ9jGyQwAk5pzdjFQP/AtNq9x9E/aYBAtW0SgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCe1thMV/5jPVcr6tDGKjx5g1QzcKv85Oagh11EMfcI=;
 b=nMR6aFcey7/pt+p4zoSTrzeJ2/7UHgmmvDHFbHrqf1y8MbK0HZCajoXkF4cGnu5n0DIxlD9fEcLwR2E1Z3WDUkNO3j6BNqsLj08YDH0zTSuNm1RiYiDujYpyTTY9hmwOJEvrjceoupNpSJ73c3hDBFo/UHBRDELXtoNes7oh69uYSqe013JdVXNVOBOclpkqXL8JY/TNKJ5Ms5q+qta/oqKS1STupt6SZddRVREkrs+2PvnWdjp5Y+FRfkhyOMgdRAh8xybpj+TnD8ntL/XZ9YP/RZWFzU/oJfGAsNdYkorWIb+74yQ6LQZFaUD6OI6xQ2ScJqvoiWqW+AbeCXfn/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCe1thMV/5jPVcr6tDGKjx5g1QzcKv85Oagh11EMfcI=;
 b=eqentDAZmVlqqCClSNlXXkrt9ILxs3HKTPV/s2EGrPuSaQ6d7KGLmrpmnTLPpfB4nS+KurMqou0pTmwgxfeWQb21l5riT40Jd2HVnarUxX6LNK3tPCnkrmIdPnRQd9ofqu2JbICz4LpG1L8+i/EOVTD19ItNF2+QIMutOrc8HS0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8887.jpnprd01.prod.outlook.com (2603:1096:400:168::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 19:02:10 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 19:02:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Topic: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Index: AQHbeJzJXGThVn8cpEWsdB3fagweKLNbY8wAgAAAqKCAAA8aUIAAKeEQ
Date: Thu, 27 Feb 2025 19:02:06 +0000
Message-ID:
 <TY3PR01MB113466473C17683221BF21C6086CD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
 <20250206134047.67866-4-biju.das.jz@bp.renesas.com>
 <Z8CBsrD2gKL-V-UG@shikoro>
 <TY3PR01MB113467C0A5623F4446B88038786CD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TYCPR01MB11332A1479400BA79FC4BDF0F86CD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB11332A1479400BA79FC4BDF0F86CD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8887:EE_
x-ms-office365-filtering-correlation-id: 0bfd2330-57bf-443a-6e43-08dd57613ab5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ajd8kbxz7NvXnZYxOpcijPs9O4flxQnAb/EOeLqfw5WTOgd2cNMXdKu0HxEW?=
 =?us-ascii?Q?SsXN3Uj9FlRXEHtWW1EJPe/F9kji8DlYxj0c3I/IFj8HpcDRnObdvOxFXcoA?=
 =?us-ascii?Q?CzD5eGIwKf+tjFeYkZ8+r+UdRQaFINhRJbMpDLZOrPOhiw4DZwo/SNSmRHfY?=
 =?us-ascii?Q?4ipqUdKTcmFlURjSD7WxEtE+/RitEeCoj4poHcH+3rkQq8+102g0Vov0Q3i/?=
 =?us-ascii?Q?tKkmfdLxQJpoQtQAfFCGpdZZZIIUgRgs+iompPlQuoHpYzPnu9fQ08lpqMzW?=
 =?us-ascii?Q?qBZBPQItaEsSh0emYnzbGae8VNnEdkuuksssdNm2WmEvYkWwFpATBIopLy8i?=
 =?us-ascii?Q?/3q4Ey9JnMFXZemCd2VCW1QcNJRoHMFRCOr0mgpMPZJmAERh9RSpndAyoyDq?=
 =?us-ascii?Q?vWVAISXEKydpzJiacgYCHk4vA1twv7V3GACxUh+isbDAq3ArMsM58iLKo0k5?=
 =?us-ascii?Q?VLpybLzjPOenNt9CPkmFhYyXeuUUjLHlB+jTtLyFszmqLUoOnPhV/afuNKln?=
 =?us-ascii?Q?1/wDnaQZEzbA4yCLCoYrUTc6yZPB7OqE7l6Gihsv+JqH/jmTX/745Wh84cYR?=
 =?us-ascii?Q?ZDVCFi7Z8SLtKvcAHYp37VN3MDDfP9vZGA9E5/5fesCCNruwWe3u64+u2K3g?=
 =?us-ascii?Q?Tcg4RZgkQ29j3vMaELsdFU5rFiXnERAfsASNTGRimvK46BZtqF+G0dqt1DeQ?=
 =?us-ascii?Q?EanR/24P+ckB2pCFEySTUMA7Dh+1oMQLtWZF6m3RGFAjhK1crGtyr60lmOsa?=
 =?us-ascii?Q?lf2EdRxVnGU9UuavenSlm/A+n75xAcpVb9PgdRHDpZDO5V8kGtn2ji9gNbo+?=
 =?us-ascii?Q?40rmLBCV1QtbJUp7y4hCXwkQGyOTB/XWSaO79lcToL2GcsCfeK9eujGhVG5m?=
 =?us-ascii?Q?kiBUummX4gBwD6ia+LDgVjbobKc9uCN4njUq8VfvkSkEmgfuo8Ls6IhAVVtQ?=
 =?us-ascii?Q?BHWLPzC6N4Te3CCox8+m4TAPa3mL3mcJ38TXkkVxVK8jPY4efpeERar6+Zav?=
 =?us-ascii?Q?kD3N6K5zr5nMYxP5zXc3Es6yZ0m/9QIivgWIjXK6o2d1hVMYctqs57wm0r9f?=
 =?us-ascii?Q?LiPUnAdjzVcazhUNLdzLP15lpQOqADgq2TDinL6ByJkdL5s/3RU110PGh4RC?=
 =?us-ascii?Q?dM7E3L3ZEn9gMlYihlZF/2NdE9+5VvHPNVBIVpFShXBixC6IFfRChkhgRXZE?=
 =?us-ascii?Q?2EAEMB9oHRt/OVnCJ1evM6KugN4Ec/dr0V1ccF6/BpLmw3oAC9Mb3QlmzMVc?=
 =?us-ascii?Q?0AWKe3bWxqgupKC14/yR7iiaStHauwKG+q7gIBrZHbdy8HFyapf1STMOKGFK?=
 =?us-ascii?Q?E5JAroVuM5B4hOYkwt4Zgx9EQgU5iGngFYPuklHzlNqQaeBUa/GBYrerwRWL?=
 =?us-ascii?Q?IIq4VBVWNXOSPYAuqjfuZudivk8QmmNUbLs45hjKllMQSPQDS+5wZZ6ALb5B?=
 =?us-ascii?Q?Du9Y+7Hi5IQUboBd+epd+0h2HZuoaNM2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2zENjytp9bYTUWqTAWtS4xv57EqgEdlZFo/BknR/zq8F+hMH1zjiF7X89Ypp?=
 =?us-ascii?Q?PFcsHegAfzBt2/OKn6/BmI5cuClgfN5ZWv26NPaWrAp6AvZnaWc+5KgEHyWt?=
 =?us-ascii?Q?dUYjhENUBnH6IvDODGOpNxJFcfOAD2zVqfqwJbb4Qgn0oqo96NobUbRzdAn7?=
 =?us-ascii?Q?Bz1sR40oZh5MPDhT891lshBETNnn7pHZJpAauqj7Q5JPHDJ1l7IjNIKso4Da?=
 =?us-ascii?Q?vlvouD7fLsd+4XFWwEb81Jqpg8gCn/uMNLwln8+TUie5SDlmzcvLrtO7YdCB?=
 =?us-ascii?Q?/Zn4p67JgLUs/TwpZjmAA6q5WWNp/o7b7Pmx0HV4Mqm+2Ku1EnU7TSQRh9vK?=
 =?us-ascii?Q?ZAOQIFoocipz3lKUfwJNsdz+scne4n/kiiH2q9xmGT9Rum4BLeykJRh+C8Gc?=
 =?us-ascii?Q?O4bYHu9K0L0poKWRo0zSuMpFAgMdNRU/a5nQPCphzCmq5Ff96w76pDz8SNPN?=
 =?us-ascii?Q?Sw+6bEvuiWbY1xlvQBMx8yLHOofUhGXhkdQ81xTjeifz3/NFDHKhnsCdob98?=
 =?us-ascii?Q?DNo80LMcRJZWeZcvN3xEXt41pr3lBgql907dYhWUxNgTf/kz7ifpqaP0ZPPR?=
 =?us-ascii?Q?yX5Pzt/E6NE0naIT3p1RVChY5H4f80ckMlLbJ4Dq3X8d6aq3FBzvatij48hJ?=
 =?us-ascii?Q?Cmtge8yuxKwTuca+i47G16xOXlYPeuk797ZoRT9Czcu3yFQMhNXGRDhDfS6j?=
 =?us-ascii?Q?KzN0lokSXKsjPYPZV4nyv+yxNyataiWK0uCei7Fhg441929y4TtB17qhohsG?=
 =?us-ascii?Q?m+N5IK08L+GxFMVVSVypZZiJ8fJe7RGkueQXT+AbysGUr/U5WTcrnviXArHt?=
 =?us-ascii?Q?wz0C2nYFYCG3xaKYMicEyMqL/zMqoNLF7n7Ptl+UDxNTHjNHfCvSLF7u0gxT?=
 =?us-ascii?Q?9dtHJDYWvngM1uIvvTiPChi7UZgz7mXuUz9Y4XnZcwbLRX8MDDcxofANG4U2?=
 =?us-ascii?Q?T8kXti8wk61j/TFrlRrkAzrRMDEp3utX8JKc/wMk+zn8cKtKSLdN+t2KGYpa?=
 =?us-ascii?Q?jgljh1KguxzbVnt5S5uxvzdFMyXx7iZRTtDn4LPAcpUaO+KkueCKdnuVmVDd?=
 =?us-ascii?Q?4CSsgNfkv2qxmpedq/B5uQ5v5+h9nc/QQzvQkMn/S9mtPBftZTSsDLfg+22I?=
 =?us-ascii?Q?1R/BWUkUWMZZ+65U5ljcfQH8PXWU2kr2VL+PHnV0/LV780ujQqi29ByRsDsu?=
 =?us-ascii?Q?y1+NaqmqXxjj1uy5bccDk48J89CZd0dBBrp7wjy0v/2rmWGz24MPKft4hOc/?=
 =?us-ascii?Q?sL5XeDNtXwix/iFiuLGjaLvFA8pHt7TDtjsmA7qcyzuVDs0mSzZ1Jwd2D1q0?=
 =?us-ascii?Q?3NQoZY02ZzMqB630Q6gIC60Xw/hdIy6TLpK+vbmbSFPfEY9utH1gMeMk8kaR?=
 =?us-ascii?Q?tVOvSi8NIRCIVwXGGpO1SRFIj2gokysBLypJ3mhxSGeixLXC8DiwNV7JdwWD?=
 =?us-ascii?Q?TrbPR9136fskkLedn9b+W5O3opvzVpI2ykheiVOQ3Z9JoA9WXGvG/ieQYWGf?=
 =?us-ascii?Q?QOWiHElkSYKahxVDFs46wyvnScDwEd+EEpXbyvXtwMJ/xwdaisVw8OfSa3BB?=
 =?us-ascii?Q?yn9rQ9uz5p9WYZoXRmWez1KCWzVPuRXuhVqTvjUiUSQM2BYoUREQ7pxi9/ST?=
 =?us-ascii?Q?yQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfd2330-57bf-443a-6e43-08dd57613ab5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 19:02:06.4404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: igCbWmJOj1Qizz/V8rJyVWL577Y5SO1vlhAL+2z2h94KTAyoNcrJS9PABMKpjY4T6GckkETfBdpPkY5C0AQ40CYqfkjQsIaQY4rbk03MvH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8887

Hi Wolfram,

> -----Original Message-----
> From: Biju Das
> Sent: 27 February 2025 16:27
> Subject: RE: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
>=20
> Hi Wolfram,
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: 27 February 2025 15:30
> > Subject: RE: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E
> > SoC
> >
> > Hi Wolfram,
> >
> > Thanks for the feedback.
> >
> > > -----Original Message-----
> > > From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > Sent: 27 February 2025 15:16
> > > Subject: Re: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for
> > > RZ/G3E SoC
> > >
> > >
> > > > +			/*
> > > > +			 * HW reset might have toggled the regulator state in
> > > > +			 * HW which regulator core might be unaware of so save
> > > > +			 * and restore the regulator state during HW reset.
> > > > +			 */
> > >
> > > Since this is a hard reset, can't we just reset the regulator to an
> > > initial state? It seems strange to preserve a value when the 'preserv=
e' flag is explicitly not
> set.
> >
> > Assume, this happens after the card is switched to UHS state and then
> > the command won't work in UHS state if we bring the regulator initial
> > state of 3.3V ,
> >
> > In external regulator case, we don't toggle the regulator to initial st=
ate of 3.3V.
> > That is the reason it is still working even when hard reset is applied =
in UHS state.
> >
> > Am I missing anything please let me know? I can debug further.
>=20
> Previously I got an issue, where the card was unable to detect after hot =
removal and plug.
> Now it is working without this change.
>=20
> Not sure the previous issue related to delay associated with hard reset.
> I am doing more testing without this change.

I have added some debug code[1], with SDHI1 using internal regulator as it =
is easy to do insert/removal of SD cards:

Without the regulator register restore code hot removal/plug:
-------------------------------------------------------------

root@smarc-rzg3e:~# [   31.400277] mmc1: card aaaa removed
[   31.450751] renesas_sdhi_internal_dmac 15c10000.mmc: #####renesas_sdhi_r=
eset 595 sd_status before reset=3D10000
[   31.460812] renesas_sdhi_internal_dmac 15c10000.mmc: #####renesas_sdhi_r=
eset 607 sd_status after reset=3D1
[   35.811808] SDHI1-VQMMC: disabling
[   36.526838] renesas_sdhi_internal_dmac 15c10000.mmc: #####renesas_sdhi_r=
eset 595 sd_status before reset=3D0
[   36.536642] renesas_sdhi_internal_dmac 15c10000.mmc: #####renesas_sdhi_r=
eset 607 sd_status after reset=3D1
[   39.322682] renesas_sdhi_internal_dmac 15c10000.mmc: #####renesas_sdhi_r=
eset 607 sd_status after reset=3D1
[   39.361826] mmc1: Skipping voltage switch
[   39.610915] mmc1: new high speed SDHC card at address aaaa
[   39.618237] mmcblk1: mmc1:aaaa SE32G 29.7 GiB
[   39.629668]  mmcblk1: p1

With the regulator register restore code hot removal/plug:
--------------------------------------------------------

root@smarc-rzg3e:~# [   23.886933] mmc1: card aaaa removed
[   23.937416] renesas_sdhi_internal_dmac 15c10000.mmc: #####renesas_sdhi_r=
eset 595 sd_status before reset=3D10000
[   25.581984] mmc1: new UHS-I speed SDR104 SDHC card at address aaaa
[   25.589989] mmcblk1: mmc1:aaaa SE32G 29.7 GiB
[   25.600507]  mmcblk1: p1

root@smarc-rzg3e:~#


Please share your thoughts.


[1]

+                       dev_err(&host->pdev->dev,"#####%s %d sd_status befo=
re reset=3D%x",__func__,__LINE__, sd_status);

                        reset_control_reset(priv->rstc);
                        /* Unknown why but without polling reset status, it=
 will hang */
                        read_poll_timeout(reset_control_status, ret, ret =
=3D=3D 0, 1, 100,
@@ -599,8 +602,13 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *h=
ost, bool preserve)
                        /* At least SDHI_VER_GEN2_SDR50 needs manual releas=
e of reset */
                        sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
                        if (priv->rdev)
-                               sd_ctrl_write32(host, CTL_SD_STATUS, sd_sta=
tus);
+                               sd_ctrl_read32_rep(host, CTL_SD_STATUS, &sd=
_status, 1);
+
+                       dev_err(&host->pdev->dev,"#####%s %d sd_status afte=
r reset=3D%x",__func__,__LINE__, sd_status);



Cheers,
Biju

