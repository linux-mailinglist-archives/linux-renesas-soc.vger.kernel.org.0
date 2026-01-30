Return-Path: <linux-renesas-soc+bounces-27676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOymAsyrfGkaOQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:02:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA51BAD69
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4B28300D606
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 13:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1619F29DB86;
	Fri, 30 Jan 2026 13:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wG71aRyW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A464134CF;
	Fri, 30 Jan 2026 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769778111; cv=fail; b=db2VGKDZy+MVILUcodJGFzuwBE2VbkaNxnetV/ObyWUPlWL5si0R+pwb52v+/uGsYl1EemF/gFBfTdLCVOGFVOEXSZ5TeaSM+OqyPqGaldGWtXsbnaD6HHQx0aWuNL5RuYJ8M54dbE8vY00fv2ldwhjK1EmO7EJnQpnfbLIgbNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769778111; c=relaxed/simple;
	bh=0aCQ29P2sjF6ln6maCzzY/w13N2vmgjn6cwIE98eReg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EVX/yfoWeVPeTvf8rKXcY5Yp0hLAUgqXAWiB6kdNKBnbDOW6UN+FSZ1hg1l3A1Rbv2REXNFuSaIMjHrbVZdDTb7HLBb8J5LpB1uuyBPkacH0r8IqlXhgwbUAcxX41zuh3t7p6eQ8tEFq+1aSCfhdWwivSWeeAPqif9NQP09qOi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wG71aRyW; arc=fail smtp.client-ip=40.107.74.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yx99am6cZaiQYha18Q8/N2AX3CVOBehHLyRLy3mwNNU54xQ4NmbAmpl9ty+U/bxgaAN+84DALXxGA/C3yXsLWj4gUiA1AxFu2t3jVfuwbnCW7+ZXlzcbs7UqiveAGHCRx2g2z8oyTTGQD5vLso4uRqRykRxeB4KjjKGWccLiNBQyiJy0u1Q+XizAVRpCnJ4gqHhtuo8Bp04sZfmIgOrcvpC+6esw9RUCIOGhi3jY/QIjHlIEMR6fWxqo3FbtELUjIgkbwUNEGywe2B5vMSHeoLWTBUoiiOwUIuYW7ibiTciys7W0BOTsad1j1DWurlHPpaHaWdrK52+mArRPpT0jwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aCQ29P2sjF6ln6maCzzY/w13N2vmgjn6cwIE98eReg=;
 b=MAbtVjTHFOeyVWHMe8oyyKS3UVgfMRzxyWY+KVMITR6LohZ6vK0lSOrF1ME15BPIMiDYE/AGvdRh8oP9lTkX0QEYXmwCKI+ElMlm+oMvzMgNO8hd2+/oNEyemVfQJAZJfY0FHmHmE0ipqyHXRjnCfYRXMKKGNI45e6MxwiNi0ks1ERts0wWpI2oOIkIe4PGY8WqMBcZxpYGeyZfjMNt/ZQ6xKj69WqzuXynEiD239EUkIRaK6a1LQv5IXhhQ/xwJdP+5QYSBkXOa1FgXC11DsCHQbdQEM7iDwHclKH+X/XsemzaZnAfFv2YlPD/d79qbV9gg8rfbmy7uTn9/Q2Lgog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aCQ29P2sjF6ln6maCzzY/w13N2vmgjn6cwIE98eReg=;
 b=wG71aRyWCQik1jKrIBlpyWF/y+WX9WXgUp/9KQWh0Yz/K2upmFRHcJUGu7IWqI8U/mL42A0ggOiD7qmaWQE2/Y032jBLmDqwQQ/HtScWPoE/2DZk60tFvKddrv+MVJ+ehl5LXrj2X4lN5HxB3dyuTRw78jJEZT+JQkKaynkQ8PQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB12734.jpnprd01.prod.outlook.com (2603:1096:405:1e9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 13:01:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 13:01:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>, biju.das.au <biju.das.au@gmail.com>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
	<richardcochran@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net-next v2 2/2] net: stmmac: dwmac-renesas-gbeth: Add
 support for RZ/G3L SoC
Thread-Topic: [PATCH net-next v2 2/2] net: stmmac: dwmac-renesas-gbeth: Add
 support for RZ/G3L SoC
Thread-Index: AQHckd5GhP+8lb1qTUqz9vJg/snO/7VqqAkAgAAEucA=
Date: Fri, 30 Jan 2026 13:01:43 +0000
Message-ID:
 <TY3PR01MB11346593FF444932F2BF02841869FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260130114744.252533-1-biju.das.jz@bp.renesas.com>
 <20260130114744.252533-3-biju.das.jz@bp.renesas.com>
 <aXynMiZJJhikfIRM@shell.armlinux.org.uk>
In-Reply-To: <aXynMiZJJhikfIRM@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB12734:EE_
x-ms-office365-filtering-correlation-id: 6568aa88-82e2-494b-4c6b-08de5fffb7a2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?z4YS0fu+9SOQ9xjmMn4Gqw3hDil2IAqbd1zMxmNTegbFV0RGAKdVYp6su5Ef?=
 =?us-ascii?Q?0tzgy0ESXh0LvG3MToHuhdcLRWfIX9u9LV44xn5hDd/emdQitacEci9InYUH?=
 =?us-ascii?Q?O824onQVLgIGOGNrYx8Mm/6fR8CwyE1o0viTx0SLRIOBCRLhXRhg1iajIlDa?=
 =?us-ascii?Q?4JbBguvkb+QuaaeJ3djMddhgKCvRH4XElpkSWNoml4SJ9KtN3YkgHWE/+A+e?=
 =?us-ascii?Q?8mFtruYqvFCRzdUzAv1873MXyOutqZ4+S8n+RPBBjKDZGU9aePoKSssjlIXr?=
 =?us-ascii?Q?uazFoYhW7qNyC8VPjy+03DucDRR2Xay6ECJsRU1KiawB6h3iooAMiKYBcZOS?=
 =?us-ascii?Q?Y9HQelsF6KaaeavXdY0FO9A8IHyAIu0GP5a2Iw0N/aWUEPNWLnMKgXWEGirh?=
 =?us-ascii?Q?rA9+qizuP7uRsUoVe9DLEVLDk1f+NxvrNRh5ETFWOEJPm3u2G2+wxofKwyZr?=
 =?us-ascii?Q?0AMVkplGYcz21iq57ILOgSiTyTDsL6tTlxhuAZVnnVAqpXQPvbKLSoRvAf8c?=
 =?us-ascii?Q?Hc+2rFUHkmNUFR6xMS6K/QPKKVRc+M8CzXBRPesPZPPNANxAWro2KFV7PQ5N?=
 =?us-ascii?Q?k3Dh4z9M5UWE0qPb3lo7nwVet32K/o+UmVmftdYLprSUpZbOu+DizzL9sT+6?=
 =?us-ascii?Q?1l/Na0zHfiaGCf57oSdLjVLmxkwssbmDiSubV6tfxs7+G+TxM8IMfpQM9TTx?=
 =?us-ascii?Q?P6jCxG4+ytmEzYkvLLcGA3GcfmP+qWPpfPv8MRFoaoJ5HcDgAgs+uahUi7Py?=
 =?us-ascii?Q?L1fWuEwJ0YFsgKGaDqdWhTbWvTi6WFykjds+NocP8/yZZdxU8MfTjWmTAuKb?=
 =?us-ascii?Q?CtGfo4QXw8aOV32gowkdF3Y9is3PphSGA0zSei1w9cWoeo0eByAhEkWOEnnx?=
 =?us-ascii?Q?S9ijuugwJ9hd5bRziDY+6bQieo/ErjwGbD4JJzZmI8kjz7Q+n/jZHrFngC2r?=
 =?us-ascii?Q?peGui8mxujWKC1eDTmxGO2Ry0l9D302iV7NRjSxks8rZx7Bgafa4FIoNQmZn?=
 =?us-ascii?Q?zMX6tS6KoXWbuE/3vGslu49Uie7kTpiRXp04qzS2ISMqxOOVlO3v4unW4MwD?=
 =?us-ascii?Q?It5yOqwInxqcKyjEcvKSuu4x2jqQzW5kHHriHlJTVG/lrg//1P/TMtMCvD3C?=
 =?us-ascii?Q?F5mhbEO2RbBfA4DoW19AoWXTZlZl7WdmlVE8QjmyNvRAlBTvHnaaJFdH6Zn/?=
 =?us-ascii?Q?SuPwkpJGGcM5yRx7+T75OIhokZ7CB+jpmg7Aba0z8wpv+YIv/ktvB6BpPGoF?=
 =?us-ascii?Q?4nW1I4gzLDy7cRX8A7p6Ew7GKC6087eG5fRJQuXJDVCc6pVU1k5DrxooyhKw?=
 =?us-ascii?Q?12/gHC5G07niOXuIIRB9O9n/gnQHuGlGOUtJPGQnemfqu4J74ShzwPPDkotS?=
 =?us-ascii?Q?mTm0DOn8rlYKo8RTKxC7bmnt00lmAmEk3OBqmKN1RsvpFsIyffkU1YSdnszh?=
 =?us-ascii?Q?vC7gQJkkX9Xw9ynXrjYR38q+fJn35enZTFsXYgjk8O3rdVUqAv9+JxFn/ZeP?=
 =?us-ascii?Q?98Tnxhb5KK0qDBw3Qwqvb30uRXIHL28r8ViHf7YqqCUycBJlWYbOhAZpBFH3?=
 =?us-ascii?Q?qH9g/ZgyG5ZXBMb5fGIPeo8IQ1xsGicrEW3QVqvV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hIdnj2HYtOuXmJRbf5/jnkDz5ZrUewDFXbYc8aNBUbgIy/dxU6gVw3fnqvqf?=
 =?us-ascii?Q?xynpu4A0tTLLXAEN6pKsQQQA4KusVl+gx6pVSCs3UFAPU8GmFWpaGaB2xNY+?=
 =?us-ascii?Q?snx+Tjw7uBB/nJMBAGqPp9xJd7qWHifKqEcNGqWiuxTzrqOdH5VLy/AkVDpq?=
 =?us-ascii?Q?JBdhkIfvTqC06E569Z6AYiG3boZ1QmvBsU1T/HXGaC9SmjfJq7gkJfJ4vXik?=
 =?us-ascii?Q?rd2So6hioiFGnrGvfZFt34Z/fvXw+/Bglf0WOmNjpoBueNcYUWSoBZ/wwAAW?=
 =?us-ascii?Q?bC7NM6MR504UaHu0BCKlvF4enli9NhohQrFfjsByK3SPNOU1krs+66pUfk+3?=
 =?us-ascii?Q?VyTTHPiH+D54vF3ECJD3pUIS/rGJ1f2lcYe1fQfsYp8dAf9yc7v2TsrB4QFf?=
 =?us-ascii?Q?R5G5ai9W7fhD7e0mgLBVeSEwaJVI/NoZsX0rao6hE2CvxHcAch0ph7jnpoiB?=
 =?us-ascii?Q?FsohdWawEXN9qh99ozbVu/GMZZpl8ZTYpoTLjIjUJqxndbQUiGqp9R83ADuK?=
 =?us-ascii?Q?69b1bK2Hcz2fGaDWmkna2ySJW3V4b4fZ/p2t73sFhVNKBEGd6kGfiWe/ffwc?=
 =?us-ascii?Q?60U0JidWYLpsaORtC8P42PX8KbL8L/iU04a1ME3Rna8FTeI7DzRqQbRM0K1o?=
 =?us-ascii?Q?uEBywmwj6jvYg1+i174S0nHq/Y9hfc7Ht7fkELDU+fpv/ifm9imKOkfG571O?=
 =?us-ascii?Q?LbwsnqNDyXIYUiRMvlN73fvW18LryRkEgsihiWdV9TJqVQwv+E8sfjH1eZdY?=
 =?us-ascii?Q?Ne5/rPh5r6K5OQyIfeby/3NN1Jrj7TZTSpvs6dAAAhEQ+smRNOWJyS1/iA6O?=
 =?us-ascii?Q?WfKgEKXgy+XKMLmuCT4aAV2uls43rasiJFLnTR8PsePtpO0yO7rm4XFnXFwI?=
 =?us-ascii?Q?PpyR38EJTF5CVIXKZKV+bX+0+Vnuo8thwhRyJwzWQCWLur3iPJeBjri6cgdk?=
 =?us-ascii?Q?fWha5PDyQpQodDhQV8iWYUwkcBqOcdeI46pDT75U68lTguXyyKb0jbxPl4/A?=
 =?us-ascii?Q?ozeBtJfjhFSCqlwH8acjW1ogsnRMIGDQqmaFtCuFqktbfwMFDBnDRmg+2aHy?=
 =?us-ascii?Q?OjAPV7D2GHcqjdEYshCPLjWjVGRvrrgKvMJumNzHGiSPjKB5uaUyt9x9YM+7?=
 =?us-ascii?Q?CTBG/kRMydqsswI8ueg1gVHVCBHr1p5CDIR1BCwALyA2htE2mYMCnCRgDCYH?=
 =?us-ascii?Q?7OLqcjf4pe5BqLyw31JI/D7AJlap4tJvMbLOf7SpBKoTL9ro2e57aH3mqyNG?=
 =?us-ascii?Q?94HSO+yweeRkYPIlCGyUqZoM/lYG4oxIARLhVlrAMQuFogyK6IjrUXirJ+Ko?=
 =?us-ascii?Q?5kRq42EV10xyqoO/nkqE+xm23o4SgCkKa87GCLkuXgeIKXfKsH4lJxjRFL2A?=
 =?us-ascii?Q?orash1p5yMfUKIIFtxT12yw7VRYNAnVt8t5OjUNdS2EFajcRY/jrSePaebxx?=
 =?us-ascii?Q?dGsjg/nr6KdazWy/KwGVdjVyGHoMwb2N0BdVjih4UcbFtPXH9MXCDOuyR+yY?=
 =?us-ascii?Q?pM6l9S8WtTux5lXZD3oXvFyusdQY7oOn7J/SDCADoIUbB8ZTAkDPc0t27JCj?=
 =?us-ascii?Q?+bANLI20QW7pCQe8z6Jkz1HmGqIqNZ5dDku6UQactMJGE9g3oliKDlSjInbQ?=
 =?us-ascii?Q?c9UMNRiZEIV8LwzNm2CFPIRWWIbUFL0EcTw1eeozVJZfEQh6yrpbf0TWWh8O?=
 =?us-ascii?Q?n8JHQPe5+KbZ16Q9iqgJHtg7uypF6DZVO4XcL3mLwJcodzMTyAtOaBEcmx01?=
 =?us-ascii?Q?RJO7+asrZw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6568aa88-82e2-494b-4c6b-08de5fffb7a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 13:01:43.5009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OFzPdqPSVbOnrqlGE3WF923wZkf38ST2vlQHVprcsdZ0uGDOI3N4HaJeY/nWkhRp/zG7offB7pYVb+6ipwClD1DYwb15cL6418PkmAKJexQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12734
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27676-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[armlinux.org.uk,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,glider.be,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	RSPAMD_EMAILBL_FAIL(0.00)[linux.armlinux.org.uk:server fail];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,lore.org:url]
X-Rspamd-Queue-Id: CDA51BAD69
X-Rspamd-Action: no action


Hi Russell King,

Thanks for the feedback.

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: 30 January 2026 12:42
> Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-renesas-gbeth: Ad=
d support for RZ/G3L SoC
>=20
> On Fri, Jan 30, 2026 at 11:47:40AM +0000, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Compared to other Renesas GBETH stmmac glue drivers, RZ/G3L GBETH IP
> > use the version Synopsys DesignWare MAC (version 5.30). It has an
> > extra clock compared to RZ/V2H and has ptp_pps_o interrupts. Add
> > support for RZ/G3L GBETH by reusing device data of RZ/V2H and can be
> > extended to add other functionalities later.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> This seems to be patch 2 of 2, but there's no sign of patch 1 nor the cov=
er message. I'm guessing
> patch 1 was updating the DT binding docuentation.

I am seeing delay in delivering patch from gmail SMTP server since yesterda=
y. Now patch [1] is reached
in lore.org. Sorry for that

[1]
https://lore.kernel.org/all/20260130114744.252533-2-biju.das.jz@bp.renesas.=
com/

Cheers,
Biju

>=20
> For this patch:
>=20
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>=20
> Thanks!
>=20
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

