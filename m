Return-Path: <linux-renesas-soc+bounces-3374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8086E39F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 15:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64A0B285C37
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 14:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF0F2B9B5;
	Fri,  1 Mar 2024 14:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="v/Z4ub/I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2044.outbound.protection.outlook.com [40.107.114.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B2041E4E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Mar 2024 14:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709304239; cv=fail; b=MMGI3ZsMDhXJtt2RBjOSlv+n2LGV7Lrsv+2wZ+LWVBStsgv3PXPfzc0+yP8cluc90PUcAdAa572Y6IibzJRyq26QciQUTa8HbDbxYdKxZJO41m3M4wQQyWLz+q++IvgrXRr/rVR1PRkzeC2mmMWh5nmh0ah4qZbzFeQOvr8Na6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709304239; c=relaxed/simple;
	bh=LDQaKSf/g6OUj/OF8eJ3YFNc/hJ1VrKBNfA4LICIeQI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nncbipINVt5hlwXS9Qbj/iqLr3+ckCP4AUQe2vm0T0Iu7J7SoxeqPA7opzYXV5Iu2ODiQkitGIbA1njTEmD+GtnfCr1/wr3aVxmE0hDQoF2V8IEkPMngevJEO7CXtI9b31BdULob4SZe/YKJJ7P4cjFR+gtMyGWHuI9CB9qjcxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=v/Z4ub/I; arc=fail smtp.client-ip=40.107.114.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOD4Pe8fqB/wTXhCdmQYFFh/4kfMctZemIYphXJb728Q05u2+sTHTrXWwfl+k+94OAQrxoH/RQESDhRphR5f7cA0JpdCUSQDsoZhtYjqcDBUB3UYcfiTj8EYVS2JzJ42jibzVonSR1lw75SPPusUnTxnFOdQWW/UImMTeLIr0n7I6arj+bRDz6kcKcLuUibc+PdpHFTI3KV7ZNzQf1RhobNRFGV5kDBpYhN0oHoSj3DVk+rF/UK98tlfOn75Yrt5SYyxyL7lEIMbQhbQM3JbNBJSMJUVMzEUKhk7CfAobELztBM8oOQ7EhP40VcPhRYYWhw+wijLFWcd65PSK5IzsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDQaKSf/g6OUj/OF8eJ3YFNc/hJ1VrKBNfA4LICIeQI=;
 b=lvRw8LvOleb0xVqbjzp+SUTcstqjrYfrWdl/6qT7GFaOe1TAfQ5MaSE0oYF3Q35hV0O4OoLCgLCSjtBBvUIAX0h1E4p3nMoLjIJtKX3BjTedpBDm8FuIYleed/IfjX1Mo3Vn/7REUwrZIxaFIkNsDqc4VxLPpphDswLBf7yb9pCvglCpWH1uQ5vtqf7arb3aefNyqKMoLCOovm8C0NFBdXkMDU1lKchbVF/2nhlnqwAq1p9SzqRYejnbD9ouZtSmywJfTeWzAB5yBtbvNN+byOWXe0YPPeKkFb079fYYgnJ1TxyLOmpjVmW208tXXEmcnR2hznwjmkkfNqufAF32kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDQaKSf/g6OUj/OF8eJ3YFNc/hJ1VrKBNfA4LICIeQI=;
 b=v/Z4ub/IhcbXI+NDnN4XmgQzcqQi/0fjFahtHJUAAS9m2tGDhZbQhQg39QdkSYgT4PLj3cM023jGLNndrX4NVDA+OmFqSWVEBD545GiJMEVvZ33b/pUPJiEGvuaUmb67cJtyDrjJAdbJmleV1UgoE0u0iTgyM83FvlpNCQAJrDw=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB10428.jpnprd01.prod.outlook.com
 (2603:1096:400:244::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32; Fri, 1 Mar
 2024 14:43:52 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7316.039; Fri, 1 Mar 2024
 14:43:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Marc
 Zyngier <maz@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	biju.das.au <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/5] irqchip/renesas-rzg2l: Use TIEN for enable/disable
Thread-Topic: [PATCH 4/5] irqchip/renesas-rzg2l: Use TIEN for enable/disable
Thread-Index: AQHaXafcVtn5NGfqp0mxiEFZEhfgQrEjCpKAgAAF0DA=
Date: Fri, 1 Mar 2024 14:43:52 +0000
Message-ID:
 <TYCPR01MB112697B6CD54632D7CEB15359865E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240212113712.71878-1-biju.das.jz@bp.renesas.com>
 <20240212113712.71878-5-biju.das.jz@bp.renesas.com> <87cysexcky.ffs@tglx>
In-Reply-To: <87cysexcky.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB10428:EE_
x-ms-office365-filtering-correlation-id: 669dbe70-438a-456f-aae7-08dc39fe03c9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mT0DbSmHdW9dgBORk/gVrVFUFM2BSIhZqux0eMZiVsAiiAuLKm0KXfmA0pvzvpvjJjIbjlMW6zS8O41ocWUWnDaRlAyJBby74eO2+AormMS/Wj0xtGTEc4zO32kTlZOcOcmwSyh0YrH9XRG4a4t1Rav5Rh9sywh+I+YCiqj31SIyZOpmfJ5+K23Gf2HA27zMwIM7aKgSWwDbhwr1lLddjYA4Bg1BSIFsfRrbIevg1NoVN23sRIMICdfcGL0JTfO5Ix0yRnsIpI3RvZfApOmnsO36SIBqU+TqHWdRLaePY9Nh8w4WPE2LbSnYuuf9h/ma4WWYfDTR7/z+Moxlx3437KDt4icje9b7Rrg5jB5T+0EYy31FzL0fFlVZDZrPvEmngOHzjmqPSAbe+uKOhPNvV0fTQVjo397l/4rHrEyUm85wiZx61MCqVcEiZDVJ1rHTYhLUM2EbWr6azlsGATfl3Qnw3Zgtw53WfILvMkp9071UCW9n3TgLd+OAU5H5eqRj7QfWE/CKvDAmVPxRcMOuYttHIi9jrGAMoxZPAAlaeB/u5tvTBEIj24lcd9LoZzNutCHpps+UAZaM2PX+YRKSfaZ5BpowX+sRwmSDVCmdZyc8nxLToVFoN/trHslbZPFXYG6FvxUdrj0rgu+LfkGwL3YpAEBHHHgeRnybp8pXAr0kJ3bsNij2aBUIrZzSb8KY+qg/MyVuDy9K+HNI+TQL5w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6pAWxy1jK/tk2xSsVyUHbHjwZHvZWbuqAxnIbZw62aDeoMHFJnJ9NZ9Ke09L?=
 =?us-ascii?Q?Ffr+oPbrwkK3RHk74wbIC5b/cWir1f+j8XuEOoJ80YlgmdVsWSNO+UbthZZG?=
 =?us-ascii?Q?0/1jhdjd74QcYxqwKRBGDqR83XPqkzz6dTroEHSyd0yzZWYL3Et+s9YU9au/?=
 =?us-ascii?Q?rvUTjOVFdlp3hGVrj1vOznTPqDsIhCA0vlHS8r3NM8DwQX3PVj8B9b2nEdGy?=
 =?us-ascii?Q?/YRLV56N15TGVIJpguTBKP6whjqR6XDzoZsgA1GKRR/O9IuRBGLgKQy9xfDg?=
 =?us-ascii?Q?0P8owY4/2zRDAKZ2pig5iFI21BMhOZ3n7CA7LbbK39JExAKhukELvkZvMrPA?=
 =?us-ascii?Q?OE5JTF+Y30p1HGwd2r0JZRfBghY1sROVKqhqS2UWHrbikySunSgGNq+BY694?=
 =?us-ascii?Q?aMSMOTAAr5/jWU3OsMVoJlBGbIiMIhQMvSJdKDddtH8C6uKOaTIHRIRY90PJ?=
 =?us-ascii?Q?LTioUjGy3fV8r36ePE6s1Q1nlaDqVrkL9ODrwl9zSpKGdlPSLE4SZT2vUA12?=
 =?us-ascii?Q?TKK/xW5vXxUpn81k1G8kDxxLSi2YYtjS3HYiqIfBxYxHI2KUo8+qC+3m0lCX?=
 =?us-ascii?Q?/KOU73Sv+LEbbH3whZ2aRZN2EEno2ZMs++cf8ka6eia5AQ3vMmb5IePohHvu?=
 =?us-ascii?Q?Vk2mlCOxWMjIXZZXTJ5H/Wag7BoG/xL8GyiyhZtIjngqkvLkgYf7bCKPmzlW?=
 =?us-ascii?Q?3QFTbVaBuy6yFhV8pL0SKdBHFZdL3kN4cVAT09Q1+gGrlu6vsJ+xfWsPnZNt?=
 =?us-ascii?Q?rUXjLvIYrTl3he9G1bf8Xv6SqJvgWpXKxC+CPrOsU1ZU7KJZpZHYaNJy44fA?=
 =?us-ascii?Q?XpmWoo3fyCo5E3BoJpRysS4M97RytwyJXNYBnyAhQO43sn+oR1+6fwZzYm0k?=
 =?us-ascii?Q?Hj9mO35fOIuU0/oqGc/u59xG0R4g0Kl3jeDWUtoMxif94/wbvTbrziM0eY1Q?=
 =?us-ascii?Q?RKPLmSvIs4Q+30cW3Ra3eLkxKfTP/bnRbbPHlceQGPOAHRtIriSrVdab2M75?=
 =?us-ascii?Q?bWLd6hp7CqFM3RJF5gdLYDFynO33K6cJeCPP4WHYnWgJsrISsUPxbBp6RjH9?=
 =?us-ascii?Q?/3MYpkKP3Q2DLkk8mMO3dWb6juJ+EssxyNqpuJjoM9ZtBguC1M1I9/tJrDN7?=
 =?us-ascii?Q?Vsm5n4G7C5BciP5G8sH9vIhOGqAy7ohi4RfXGEKbHVk/0xrX9AgA0EzKvAgx?=
 =?us-ascii?Q?/1KxceFgmrEcoqow9g/aRzuiaQfFvP9AVPXk3TCPWw6ehzoqaJqvyAs6PGkq?=
 =?us-ascii?Q?oU/IaHl2ju+LO5vkdykSGGqnUjExui8JC6WKbBg8lWX8aw568BVN4+Lj2nnb?=
 =?us-ascii?Q?P/qTWqOYz9ajW2jnJT+kdKvxPcOWnk+CyrRoANU3uvJRegSQcOXkJEllyabV?=
 =?us-ascii?Q?RMMBt0YRqO/WTXePTkruhot3ZYX+HNdGzUq4cLDoMOsPYtru9ifXg+DX2WwG?=
 =?us-ascii?Q?zJFgq5H44uWGeaoXQOcanSROAHlIi0uW0MvhYJD7sUFhBOK7RzDimjilLa9w?=
 =?us-ascii?Q?lCU0kMlq9U9/78i59XQsrsYSTAe3NUK4PAXEP3UaIFjuocfTqDiX1Ye0p+Da?=
 =?us-ascii?Q?FzQqMUYJ+WvgaJObU40c2Q39XdcMpw5Fr/yOg6JsOx2pI0lR3jwowD5U7XUh?=
 =?us-ascii?Q?7A=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669dbe70-438a-456f-aae7-08dc39fe03c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2024 14:43:52.7755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JYZ3Qkjv5w1YTVYWP2EL3Hea3bg2gW+F+hn8twlEAvL0KxqfFhlK6sv/bRpc1FL80bIxKFMCUZLDeDzin8bUtERxPzZEdvHwNvT4n5x6sI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10428

Hi Thomas Gleixner,

> -----Original Message-----
> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: Friday, March 1, 2024 2:16 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Prabhakar Mahadev Lad <prabhak=
ar.mahadev-
> lad.rj@bp.renesas.com>; Marc Zyngier <maz@kernel.org>; Geert Uytterhoeven=
 <geert+renesas@glider.be>;
> biju.das.au <biju.das.au@gmail.com>; linux-renesas-soc@vger.kernel.org
> Subject: Re: [PATCH 4/5] irqchip/renesas-rzg2l: Use TIEN for enable/disab=
le
>=20
> On Mon, Feb 12 2024 at 11:37, Biju Das wrote:
> > Use TIEN for enable/disable and avoid modifying TINT source selection
> > register.
>=20
> Why?

This will lead to conflict in TINT detection register and TINT source
as we are modifying the source. This can also lead to spurious IRQ.

>=20
> Changelogs are supposed to explain the WHY and not just decribe the WHAT.

OK, will do it in the next version.

Cheers,
Biju

