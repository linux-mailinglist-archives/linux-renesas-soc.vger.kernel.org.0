Return-Path: <linux-renesas-soc+bounces-31284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNNlDVhi32mKSQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 12:03:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A8640313C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 12:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFB2430B2166
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 10:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D8933CE8A;
	Wed, 15 Apr 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wJXA9rvm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C452848BE;
	Wed, 15 Apr 2026 10:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776247226; cv=fail; b=UgzKaMxN07O5VDAu8KizPgCgyP/i0IfOfG43UXnpMpflL2T8lLKkny5Swstze5bUqJeUZ+kdFM4/UOH65szb6cBkdu68kAalYDylghRLVvKCl2z8nX0p/keHTqUUhPr5Z7gQ5SLGLlS0Vz52rf+8JKTua1F29xs1n3UmHK0gX6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776247226; c=relaxed/simple;
	bh=ZTUwDDFBMv4dixy28RRVFb6mT3TmUkOxGlhrGBmAix8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RDZrEcHMm0a8Q6bhT7segoQi7LBIknXII1VI/5BRhAziqK3MAdX4jsNlyKq3V/bh5XErt4E8xL6A9DTW9gYwe11qKvId9SHk9Ua65HhrvRqSSDF9B4F5RsgAaxH7iYTbqoirkCAqyOJ9ND6wn4dlIATrKuUNmnwz3Rh0kZtjkeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wJXA9rvm; arc=fail smtp.client-ip=52.101.125.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMG51OdkZD4U9usxi1bylYfjQm+zaurdxusxa1hLZ1R0LBxk6suC8IlzOvZfruc2pvN9auNCsZBRr2wenAs3wvvnXMq/HZSPuFEbMtB4DMqhZgPP65UPJnJfm6j8+g6enae7aTWYIJ+wHLT/7I+GB5cNZscgLC3i4+IxwZkq3v99GkZvuATee02WZ+1heo9UGYUDIwegj+SZ0ZJyFcHT98hd/E7RAMlRob0Jk306HkE3ORCUqbrBf+SNa+zJkF72kpmCiuKqqJIL/cF2srrJElHz9QHGSerVg/XetoMLLXsvRhG/oCtb6QMTYUUMTYiveklnV13BRTBRCO4Hh+6Omg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTUwDDFBMv4dixy28RRVFb6mT3TmUkOxGlhrGBmAix8=;
 b=iDRGlj2uQtwh7Xbc6WKnvmuPPdRnupkOIxFseY/2F6ZZh8r9ru5o7IhAJNuTVdg6wBZluMm5GVY/THcIaQJjzD197M4cZ7EKb+Z8DK7c+sD9m1mipMcaDnhISJqfKORaVk2HbRdY5VORSnKwZNZ2uED2SA4gCvnF3YHTVeXM9tiHhqyknOGDbJjRLEmED3kTPeYIPXZfAWMHd+4sFJNFngxoiE+yKKWdOd7A/9Mc/sPb5byPFCeCvZo9oRwNkcDZSBYrPV2ktJ6ulE/m9bnm8UYDDbCqL1NLLQao5GicDqvCRKbkNZ3G9jYFi5oV5e3proC3sXodPz1BU3kFBKiQ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTUwDDFBMv4dixy28RRVFb6mT3TmUkOxGlhrGBmAix8=;
 b=wJXA9rvmtMmkjxvgzZ340b2Mpb+9Ez3gwEIVbMTsmsoJW+h9o7/gPgb/RS0HFkfl7Z0nSJa9R3IXdYzgKJLC0+O1Ttm14Qk3X0ZPaTh5gU51Yiusr7TqF+6oQUOFOUE01NNlqVL1xk0F24itbHY6aQBcjEbVypiBTV+a2TtVjUc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6918.jpnprd01.prod.outlook.com (2603:1096:604:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 10:00:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 10:00:22 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>
CC: Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Russell King
	<linux@armlinux.org.uk>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH net-next v3 5/5] net: phy: Move phy_init_hw() from
 phy_resume() to __phy_resume()
Thread-Topic: [PATCH net-next v3 5/5] net: phy: Move phy_init_hw() from
 phy_resume() to __phy_resume()
Thread-Index: AQHcyoTCwk/y+FOuVk2TB1SqOfN5wrXeu0yAgAAsRFCAAP1L0A==
Date: Wed, 15 Apr 2026 10:00:21 +0000
Message-ID:
 <TY3PR01MB113463FB20FC50C03F10A6FD186222@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260412140032.122841-1-biju.das.jz@bp.renesas.com>
 <20260412140032.122841-6-biju.das.jz@bp.renesas.com>
 <b3521be0-c5da-45ef-b6bd-64e4a7b97966@lunn.ch>
 <TY3PR01MB113462DBCD0E25184E2B1630186252@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113462DBCD0E25184E2B1630186252@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6918:EE_
x-ms-office365-filtering-correlation-id: cd0c47b0-9e89-4711-dbaa-08de9ad5ceb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 OhNVTxG79JX6HNP6mPnMQFi9rIejEZaEWxxEZ1pZtCE9EmRVW2n84xOEEfSUcN/gUI2SfFcqADrjNbwEcln97QpCA8aX92brYyK1vaiaVoPVVubs5veImmFIGVy/jFnBPGAem3DWouZGTIr7pYi+SK2X9jcE/THI2V2xXo44mKrWFNR7YB084glxOyIrUJU8UsJQrq+ZcgZlVUaYJQnyc51c41hIF24mU43yimAdXyXkeTpIXGG6em1tup+ZJ0LvvoQe3O0o4dgdXQhqY6AbczU3i3kQsnpG63xOZ4rRhVrAWN2tkyHB4ydEIXjyU34EnB2Z5qV31ESAijhH3w+D1++2N5z0pTZdhcX1uffvmpSX+a5+okHlbX5uxAriwbz1tXOtAQuS0Ywln3hVg6GLjq0bn6dz5x5O16GTDIPeICTZDG3TuVH1BSZHV2r/jZgQ7UFa1t/GCyb6yEab7VrscChwWS/5AFVza3Zg5BVjFqybpZz55rdQ9VvjQIQjSVxIR9gnzmBvNhmH/lXBEgHqK14srUy22Qc6aJHqGVoAq+i3o4RZw8BhFyO1QH0FpqaLtB3fF6XKb4bTw4BPQ6W6iBHyaZXQMI5ZJ2/i/y1NCVLflTzdg/IUgdL5xbXXlhjUiGFRz0zxFpPeHsM2FsIPMUwKHqrFBDH0+dX7QTMgVqV1uH4l/TGnFXHz5GwoeTu/ZlnYvx3h8S4HezJmAjSyzJGwEpeXrpLbzzvLhfi4IwCNey9Jf2O7EBEc6gcCQWgS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?d1JtfUM6CmSXEVuEWwBJTQZuhpha/6HNNRXaEFG9i48rlRkLhJyVlihsjP8T?=
 =?us-ascii?Q?7lwdbXWxclSzr+Jf75F5Z9kkSWyTAI5SyZ14hpjpGHgrmn+QfSGsA0/WSk5X?=
 =?us-ascii?Q?lb1HS4lro2Ci67GNkDONgMAX5iECFOMwJdNUxni7Ou3Ds1Pyeoe2pOePDAUs?=
 =?us-ascii?Q?g9aube8Zvz6beXZdqrN1L6is/xl+QsP+mEzZ+jUk6Ithl9MbnhBoXJug5i4z?=
 =?us-ascii?Q?HPEvQ3ndPG4J5cepEHTUJSR34P+91XaB5MGIChipd+6oMyaMObsx+UUpht3N?=
 =?us-ascii?Q?iSJoap3Wx2bOHVuLasYgnqQKR5nqAscFdi5HtE0yuG0mF8EHk0srFunez+tw?=
 =?us-ascii?Q?xEXAFAus4ZKCFny233yayzEmuVSwRe+sQ+0zDGgEP/pMbgWbO/bWI94ZbmF6?=
 =?us-ascii?Q?g4r80ERIMpu4fNgaskOroOuf0bCRjlX1I8pxbYvDGbBiYF5M6pCAaMRYL7BF?=
 =?us-ascii?Q?wokl5mHAzuwOuEE+7HcQPbmvNFngheSGv0Xg2GrEMZBYyohFUjXYNzX0CK/9?=
 =?us-ascii?Q?HvdGw0In0JRhqgAkJHS8S0G7xOv2w3RlsOjdVA3dnG372yOHWk7vl7VIiAkG?=
 =?us-ascii?Q?qbI63E3g5JeZUIrYlf8qJ2WvbIWeiCQBaNJupCtP5waGSgdpSZci0HJrIX5T?=
 =?us-ascii?Q?aDyDggutCB/Y5Cw4BIifQNkxvyAZSTD14zEX17Yp2rJi4iLJUccOMmDiAjuw?=
 =?us-ascii?Q?ddzhJqqPA+NqPZhwVYAqKVaMj3Q47DsZrnMRDTZxx5bhJbyqusCZTSkALmf/?=
 =?us-ascii?Q?+gFb8fsbqWaI4xv6P1cDDYy9dLIpdgcpKsqxvvG4/8MSOae5TASjGbDPYUmD?=
 =?us-ascii?Q?sFtAKV0c0itVS5GryPztd+qOcadJ3wcfjaHDjzVP8uUGzvUA69oiswmk1w1b?=
 =?us-ascii?Q?lMY5SANv/plETgDjw2Z0id3DD78LhZJmLO94Dj3W6ODL63Cwy4ib/sFcVESO?=
 =?us-ascii?Q?OKqonLotuGBH+FVRO36rJ41GYyncX1sSF9SbnEMVQtNqU5338UbC2RoSRAy+?=
 =?us-ascii?Q?ufrMqXyoi9LPi5yVq9511bzDBrRMKsyENOt77iBl1BhHSsb9RREchdqXhL5V?=
 =?us-ascii?Q?UJnqQ7RDIlkiSku8Bsst2zBwXSd5PL/F00yFX/w8bsxLJgHmIbQvkxsgkuQL?=
 =?us-ascii?Q?WFb6zc8KAj0Un7zGmPWN2O/8j2PTNGjMF3jTd5hcFbllbtDMOvNC85G/Bs2F?=
 =?us-ascii?Q?GZrPjTVxpBKGXYsYx0vpzijpJHm7SVk1wR1JGxm5JJW9QZC1CZ34en+eswW+?=
 =?us-ascii?Q?PEKBwd1CZulLPX4JDjOaofVbUAZgguPkrHOFtfSlfI11kXhq6MGKxLNExx82?=
 =?us-ascii?Q?PFiDqZT46Jv9l+Uebzk3/mHkvAojrTrNrR45ACyuXsH0yuQQbeA3b7JeSmA2?=
 =?us-ascii?Q?oJsRcMoKDnJ0HhQ3wwoiwFew/Dp/X4HR9SV0IBRV9AFlrpD2KkD3ne684ppU?=
 =?us-ascii?Q?gh7AFghFidFKrHl/X5o3Z9dLpX36ewfqgskmvc7rmifilnKViSPJU+QWVNs4?=
 =?us-ascii?Q?RWiSmW1vrGcJqRniFut/Os2F7EXwJtSe6oNW8QeZJk8g0Yd1LL83dmQ5Sd18?=
 =?us-ascii?Q?bTWRrswyEJymdH66KLWpvkIKXNPFvcsDSdmQWQi435AVWK+yGLCHq0VX5Ahh?=
 =?us-ascii?Q?/Xpy4cyC/opTOcI6on7yuGx3AALRSdqJxMa0urHUYyp9lzt+Z4PtH5aIwYRU?=
 =?us-ascii?Q?cMHeqhQxiCfspLVH9b66vj63Ro1fGNKMUmI9HkMyA0pUNgWRmyvbDQKtOB+A?=
 =?us-ascii?Q?/LboxdIH5g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0c47b0-9e89-4711-dbaa-08de9ad5ceb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 10:00:21.9108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uf2eudekVOXHDk2cHO5puSKWxM0fwd96vUGLPI7oMOiXMP+3xFhQIjB7rwE6gSuNIt9YKt179vGzqLKDeipB12ptozHUAVPDJ3Dh1wWYpCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6918
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31284-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,armlinux.org.uk,vger.kernel.org,glider.be,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:url,lunn.ch:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 99A8640313C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew/Russell,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 14 April 2026 19:43
> Subject: RE: [PATCH net-next v3 5/5] net: phy: Move phy_init_hw() from ph=
y_resume() to __phy_resume()
>=20
> Hi Andrew,
>=20
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: 14 April 2026 17:03
> > Subject: Re: [PATCH net-next v3 5/5] net: phy: Move phy_init_hw() from
> > phy_resume() to __phy_resume()
> >
> > On Sun, Apr 12, 2026 at 03:00:27PM +0100, Biju wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Now that redundant locking has been removed from PHY driver
> > > callbacks,
> > > phy_init_hw() can be called with phydev->lock held.
> > >
> > > Many MAC drivers and the phylink framework resume the PHY via
> > > phy_start(), which invokes __phy_resume() directly without going
> > > through phy_resume(). Keeping phy_init_hw() in phy_resume() means it
> > > is not called in this path.
> > >
> > > Move phy_init_hw() into __phy_resume() so that PHY soft reset and
> > > re-initialisation happen unconditionally on every resume, regardless
> > > of which code path triggers it.
> >
> > I would change the order of these patches. First remove the redundant
> > locks. You can then put
> > phy_init_hw() into __phy_resume(), rather than first moving it into
> > phy_resume() and then __phy_resume().
>=20
> Agreed.

One of my colleague pointed out that this patch may break[1], but we don't =
have the hardware to
test this IP. According to him

 "It does a phy_init_hw(), resetting the PHY, it applies some ethtool setti=
ngs and then it calls
phy_start(). Since we are calling phy_init_hw() again during phy_start(),we=
 might be undoing the
ethtool settings"

This kind of cleanup/fixing will be in 7.2 cycle, right?

[1] https://elixir.bootlin.com/linux/v7.0/source/drivers/net/ethernet/marve=
ll/mv643xx_eth.c#L2327

Cheers,
Biju



