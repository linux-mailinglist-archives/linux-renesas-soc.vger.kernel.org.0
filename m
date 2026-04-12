Return-Path: <linux-renesas-soc+bounces-31205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PsvAFXqK22mmDAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31205-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 14:05:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA253E3B32
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 14:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2858A30041F9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 12:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B0533F38A;
	Sun, 12 Apr 2026 12:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kYadY/IS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7A02877F7;
	Sun, 12 Apr 2026 12:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775995511; cv=fail; b=AUUHpvAE1B6dIXRmIRx5aHzX+jlX/dYi3iyMUnwa6bxMqpgbcPPAdOQBrxeR3OohVPeV+VJzctfDFQDLqxm5Sg12gPrDZ7uCge9UG+ZUxb4/fOBtCc8f8vee+o+x31J9u+7WoUgc4hQ9CvVAh4939WfnjfdlWzi3MzTbtQwZwXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775995511; c=relaxed/simple;
	bh=q6cLorcHoXVBm0/hc/p1AFf76AZ7A499Xko3An9cFOQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CImhpskKACzqhQU/KEGqmfpoErFnMx9i/tdj7xi56Iy1V8t43fOalldVVvQbYudoQ6CddrG0ixQfoUWDFpC3UVeWfCYamGT4am+D4mO7/XYc1gcV9HGQdf+riod6Qj5xRu4OwDVUMrVybGe/lrF6+C+53BLre0mj3D8H2Ea3NN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kYadY/IS; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSzz3yzEn6X1/fN1BmoBUl52oAlD+wnJJf2N506PCOhPEnuqSrzeSprxbfATfo5+T0F0SgYZ/B/PXi1CRy5nCWT8ZX/+n5ECKXpAnOJEn/ROyLk+hMh0znLpZ6TvR2xImDuTKxrz8f9amh8Dc/m3T6cDe/3fiyyZKtE9rx3lykgdou11H0+zszRZQ7WUMH1am6FaxvLKrZlnSvtPFBB1bCabR4qL4s1jG1NpSOBIoxoGoL4Eezjb4F7SHBvrr2v/8dVeui1RG/gjIIcB5wjbzWP1Jh9G5koWxsb535RmkPJgczurUZleKvfa3IbCVmCTD61UePBVodDebatcccFZwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6cLorcHoXVBm0/hc/p1AFf76AZ7A499Xko3An9cFOQ=;
 b=TNmJCA+lBonaXOBwxQz08KnLERNJ+B0WqWbuLcgozgc0AJuKrzfEL8rlmhXMXI9rl5+FkyQINJIOgJwfI9p1tf6OoaAhactoqNu8EvJtMzjCJk/AHIk684o+Dh79JdI4ahJfvsCK4oLrpvAh3EIZ95NwKMAXZFJaTRD7Mn2A69n1nJlaJA+mllisbX3Sd31qhBj3S6bd0KrxfyX4s2uYyMIWsYyCg+8C/hiJHEjSteXJ7gbHuswJHfqTST1pIZ7LOabuO+CWauCY5UmH3k+qSsLkSCrsHkk91BnZoXDhpaL+o9REwz/4KDXGRli1j3Cv2f9s07Z6UpFXZZh1N1rLBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6cLorcHoXVBm0/hc/p1AFf76AZ7A499Xko3An9cFOQ=;
 b=kYadY/ISeefefO2IHpRevjvcwhNnK+eoWWoLj7r7y8A2EBAknb4KQk1veG3QGEuXAF28k4vGOyfvBhb4H8X6CYXlr+F0enVbdVqGmBMWzN0v7YxFquEmhlOMQ0OdNYzMkopO0+YdL/mVYaZf9pctIsNKB1YJpk+wfpjX3t34l7U=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11783.jpnprd01.prod.outlook.com (2603:1096:400:403::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Sun, 12 Apr
 2026 12:05:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.044; Sun, 12 Apr 2026
 12:05:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>
CC: biju.das.au <biju.das.au@gmail.com>, Heiner Kallweit
	<hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
Thread-Topic: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
Thread-Index:
 AQHcyPZnBK/SG6spWkirTeqviN9wXLXYYQwAgAAGuICAAADOgIAAjsYAgADq+ICAADFagIABQ2Qg
Date: Sun, 12 Apr 2026 12:05:06 +0000
Message-ID:
 <TY3PR01MB11346F78B929EA7F377BB5B4A86272@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
 <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
 <839fec66-5ec0-4cc0-a0c4-ae2de6902188@lunn.ch>
 <TY3PR01MB11346B6680E5952BD7B7078CA86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <admMethCSjOQhu8g@shell.armlinux.org.uk>
 <dedab35c-39f4-469b-9227-cb8925d83b8e@lunn.ch>
 <adp6-wElGOOijZRG@shell.armlinux.org.uk>
In-Reply-To: <adp6-wElGOOijZRG@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11783:EE_
x-ms-office365-filtering-correlation-id: df42394c-9691-4240-bdda-08de988bbc99
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 NBfDWOHXu8Wv3DuoA2t31EKsCvhCFZyQEqu0v9MpxFGVmhFAKhq/g8VWfJIkqJz7W2lspDEPSjBeydBbGG1ltf+HeBoaA6w+6T2aalTlGOPYtRb1hVrjfItQ8kEQPuhtX8zzFhZVHmxGY7tBxI8CMKCnn+UBoELTO/umj2hOgEwsvMbOK2YyE69gaBevnmHdAc4Hve53COfzvxWW/ibganjajySjumbfqQ+fk6p102XK8rx3JjM3g1IEwL3wOV5Oqs3ju7lhbPdQ/XDpwxx6EWL6WKe3sxOCxkFjgMY2q3pTGBuJQdOK8/VH5oK/4C4Nm0PmZYWniny6L6inKI9tUNtwk2L7/0zpDwWzPtOPmu5auXy+jv+Y+Ae5SXMHAWWC1q5z05miZ2vpoVgIYmkXfEYFG5lWS1gW1UHswozcWYaiyzBRtujVgs5OdLK9FXW8EbIvi+fAK7INW/dAoIn/LbuS19R1i7pktvJQ8z9D7pYa0bUGNA+c9CguhqDQ/JubumlrL93/fNUx9EQn30m1SWjYPwo8vnfX2rYmzzKNaLSDMzZ+o0fk+O0JgGYsXPO9oMdVPlGbAsfZWg6NAfq+YSpkkZ1ZDuBGTKVkrxgvmwrIw7b0GQmHkkkTErHTyjg8P2LcDsPH4B1xdut/xlADqmyOI1/cdk2JqxAT5qp2i7JUfw8kibnK2Ot8WVVYbmq4boJqpCBY6qnNTziR80PDhuaNeTASJCMS3SgrRJEZUhWOCn1VAfBRR7R/1bJlWQwuIpzcM5hQtMUlYziKBdGdM5lTmzem8sOLASv1oIFycGc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Hi54dGHFGoacBJ2becCe0F7U+gDNIQLP47o7SdwkZqmAE1p0/hnfIQ/yRN7H?=
 =?us-ascii?Q?tBr+nT8zWa7xQcJ1UKuA/+e/g6Nfb0dfUNvctNkWkZk9+8a0BbUKfqFIwbD1?=
 =?us-ascii?Q?EsvKPdozRQbv521Aqg11xbIMEODaaOADZxQDzJgI+6sdpV2H++rnj6Jq2RjA?=
 =?us-ascii?Q?CCXD0xc5Kj8DPqfWpMeXvl6F5aJMe5mKBCZeU3dG68FcVO5424/ZkZZF7EY9?=
 =?us-ascii?Q?DbsD5C7VrUmbeyGcyk7XEoML+O9TGyx7ksl8FDXvANGhq5PPbE8+pdMX+fgH?=
 =?us-ascii?Q?4THe8OjW/GumPX851lld0nC+CqlWWvrX78Fox4qOdDXfBcsPasWtzvxItxo7?=
 =?us-ascii?Q?/MIHCOMQi0rNcDqSCjOjk8zuH54P8QKH0zzH8qWL6TBow53rx6nczXahMHiA?=
 =?us-ascii?Q?OIo6pLf6cEu8f9BmerHkg+Zn9ngNcJtVw7vxlizdI+ydvzz19u9SrobLKna3?=
 =?us-ascii?Q?vnvThzHXTBL2dwmaEPasT+KTO4bTKRUn1lcCv43qX5vB1zc2YsjaKI8wWcI1?=
 =?us-ascii?Q?KTmi0Rdt2xblhOGq5PjcVE3sr5cnaFRfZv00Zbq+nkg8H+PeJgy83YGi02eF?=
 =?us-ascii?Q?yUSliMSfUWvcj0J30gO9FIfA4Qc7A/HUCpTyMQnxNfgxlcDobJtjN3tsGOyi?=
 =?us-ascii?Q?HWlP0FP0mXPFxaFeKBB1YkbgVRIIxwmOYT3lo3rog7IE2mA9qYIWMzCo1BWr?=
 =?us-ascii?Q?xfUbgqUGNGiNLktH0kkbPhes8ijOxJipEqbjKbLw9V+kb9huTJ5oBzIX6Vhr?=
 =?us-ascii?Q?648BnfB+V+ciYysdtV57pByJjeKZmUD6KdOua82GoPpnqXMW0aYWLfK44/CB?=
 =?us-ascii?Q?d6qbKb04mYHPbi4roo6BzOFZPmi8MCtxAInY17s13pCSWeUjeRw6EAWRIvK9?=
 =?us-ascii?Q?0A4EaEg7fIMK/3K1Z2XI0rMydzagpe35E3DrNqpQLD9V1RIzB7P6GuuKQk/b?=
 =?us-ascii?Q?lNeqKwqA3gvaW0wDxY7gJcHfx/sHoAG0PxeFezSzcf9xXmVxRS59jyBXc8vv?=
 =?us-ascii?Q?z9JGg+SASR/97m2uhUtCXVnFoFl9SzxAQAzyUVSY8rnqI0hDvajjRZjOgxBV?=
 =?us-ascii?Q?NkYWPUZKAqsWAKDJsgld3oOMV2lf1LtuHBOgA1VsgdFzG5AQpfCidZgQSzlZ?=
 =?us-ascii?Q?Pjknl+GA0L0MUL5jtarrnnsWvx7u9nEbOoBK3jm561xmczhf9+vky97YwG3z?=
 =?us-ascii?Q?d+0e8EJK8vlDHKlilC430sohX/1zdOj6hQ9jO5mnJhBdX55pZxqgTo8ACZT0?=
 =?us-ascii?Q?kDPPiWcQkXgvsMbUJpjepwD6SmJYgr+BNylEjrjxa245Kyv+uHG8njllMvjX?=
 =?us-ascii?Q?MUKlpHyUuHF4kOZO5PUy+fQMZAN3TMYf9/28oTB7RxIW00oSfTH6oDCBLARU?=
 =?us-ascii?Q?Ud/oZg/fTmKgtvF5P6INjgH2vAwKkL8DisxjMhPKcxal3wXnQ1g+cMSdXyqO?=
 =?us-ascii?Q?2Deb7HX4ZgI2B5uAlaOH18u4WXJeXb/9jVqiYzcqAGl/5IBl5TFACCqclGW/?=
 =?us-ascii?Q?V18C02OgXywlVSn4wT5V5jyoOe1RV6G0UnTD/t6Ger7Do3i6tpHETdODZGQZ?=
 =?us-ascii?Q?XIxcPaWP4OfM7/dqV/fdIRQAs+In142r7FWX4aloV0RctrZ+PyvDhn/cMcUm?=
 =?us-ascii?Q?X2uO+sHkdg83NtufZZVksd7U6re4MXBebVFEf235STMJH8/3+QUx9r0XFYS6?=
 =?us-ascii?Q?FJ9kpngVQlWCKHEKSAuFSejkkKfRb2IDN9IXQ3+Tsks3mZtbN6y6l8xHU4d9?=
 =?us-ascii?Q?dQQbN6qQaw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: df42394c-9691-4240-bdda-08de988bbc99
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2026 12:05:06.4660
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ut7AFh9Hkbcmsi83AU1ZqPGHNDq0nkUV1jwnbIIXd2KeCN5PRykuzqe7cMdrqdFMMja90tM1BvPQnr/96EphbBwyntef4Eq31vKWhDmJINw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11783
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31205-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,renesas.com,vger.kernel.org,glider.be,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,armlinux.org.uk:email]
X-Rspamd-Queue-Id: DEA253E3B32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell King,

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: 11 April 2026 17:47
> Subject: Re: [PATCH net-next] net: phy: call phy_init_hw() in phy resume =
path
>=20
> On Sat, Apr 11, 2026 at 03:50:13PM +0200, Andrew Lunn wrote:
> > > So, I question whether any of the functions in this driver actually
> > > have a valid reason to take phydev->lock - looks to me like a not
> > > very well written driver.
> > >
> > > In cases like this, I don't think we should make things more
> > > difficult in the core just because we have a lockdep splat when that
> > > can be avoided by killing off unnecessary locking.
> >
> > Agreed. This patchset should cleanup these locks.
> >
> > We also need to look at lan937x_dsp_workaround(). I also don't see
> > what that mutex lock/unlock is protecting. Accessing bank registers
> > need to be protected, so doing one additional access within that
> > should not need additional protection.
>=20
> Looking at access_ereg(), shouldn't it be taking the MDIO bus lock and us=
ing the __phy_* accessors
> anyway because it's writing various registers which determine what is bei=
ng read via the
> LAN87XX_EXT_REG_RD_DATA register or the value written via the LAN87XX_EXT=
_REG_WR_DATA register.
>=20
> Also, as it has access_ereg_modify_changed(), that entire sequence needs =
to take the MDIO bus lock to
> safely do the read-modify-write.
>=20
> Then there's lan87xx_config_rgmii_delay() which is a large open coded rea=
d-modify-write for the
> PHYACC_ATTR_BANK_MISC, LAN87XX_CTRL_1 register.
>=20
> To me, this looks like a racy driver, and it also looks like it's using t=
he wrong lock to try and
> protect hardware accesses.

OK, will replace it with MDIO bus lock.

Cheers,
Biju

