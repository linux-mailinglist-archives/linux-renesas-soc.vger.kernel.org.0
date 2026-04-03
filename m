Return-Path: <linux-renesas-soc+bounces-30850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJXFNBq3z2l1zgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 14:48:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7278939435F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 14:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C9393008324
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 12:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4533A961B;
	Fri,  3 Apr 2026 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NcwpiD7u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011048.outbound.protection.outlook.com [52.101.125.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036493A7836;
	Fri,  3 Apr 2026 12:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775220456; cv=fail; b=u0oNCXoNTnkimU6cWyo+GfY2MveqWP8szPUfrOMNBlgnwM8ciBqg9k6GrQF/AaWFqVgrzDYRyq0mbeZo+XEowbrE0Gm1T58pzYo+qaHrCyIY771XkO7KPkbnLcfn3rVnZFZ0TLuSGewULInyYGKo7KFzHl2k8QSt327m0Q+NKnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775220456; c=relaxed/simple;
	bh=bHhFt5m1n2U3v8dV2MgrOcarDCbvrvZuPBwR0CUp8ZM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KlDMjKqBhxadpQBmONK2AZcYKxsRRxnrI5Q+/mDysohbIDhvwjcoM4fnGYN9FMzWZkMZHM11mamSetQe89s59k7AlaogMzOwxQTbLI3IWwwDhX4aXolvwzHP8KwKhhg4UF2muZhbwF10Fc8iyKgy9spnGff5WJSPT/71WzwymD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NcwpiD7u; arc=fail smtp.client-ip=52.101.125.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQbaG+R910nltKrc0qsvga8FkcdrYpF5M7dJsIL3UBGd1lsXwikbNTP5cYHifPPC5hcLyJ9412HiUkUBm78i7jzJ8cbESZwvXcIH9D/iYhsJFEYJEWKDnwNwX4w0c+TO+dFOtYtIFIPFbchm4XI3fKCKhcYGV7XwaZekRmhywxyk/LnEgg++vdeJ761bNKb+GWS+l71sstB+3szIPWYbwJRzzmEET37QSqXq85TlSwJUrLChnYdRIOp1ENkQONSVM7jr43EiNX9DjbPlJRKzaZz8AR7GBRdHs1SZKU97d5KSrstIrOCWvZlCBC9bW4Z+BDB+7os/OMbP0erHRNKUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3vXeyMZEip46V4dvD0M14Wyysxd5ygUJDy5wZ+quJA=;
 b=Yd6EVkyj9W0b2G07zqFOLQIEhY1fQIjiOFMMZqUfC4fRuXkJGP8EfQV9f+1zlNwvCM4we9BDi9ti5DBWw5b4JAaK7UkmwD9n2KMnVN6973xIUK9TAKFvr8FNMv9LU/ZWy5m/ChFKIyM8v2zLlSMOsE6cBx7FG77Qg4yyJwGZuVTSNe2oBPdki1mV3nzzr99sv8MQNR5x/QYkcFwck6oKgFSP2sK7/855tJ6Q47/P1gCNMpsaYpHHqpC6uqGG1/lNHwjg8cRnqgtacgU+uCglQy4jqx+tSK0r0qIvzBpVV09xx+lVjo+XGfGeJW7SlFQgiziEG3m9dZ4nF4BJMJ0FTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3vXeyMZEip46V4dvD0M14Wyysxd5ygUJDy5wZ+quJA=;
 b=NcwpiD7uedLx4qOnFgVdA2QvjNVVg2NPRG4kE1wh+6ZPT7RvfjDmUsWeE240i1Ftlu5SatqWtYcrc+QX4iZQQ0dJaJ7P2/kvM0MtLuSMvU+9fZ8C/baa7GpLb0V1GKKBM2qXhfDMvmRIS2VrMLZvHekKM4NoifGZdf8uLoFOavI=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY4PR01MB17886.jpnprd01.prod.outlook.com (2603:1096:405:34a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Fri, 3 Apr
 2026 12:47:31 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Fri, 3 Apr 2026
 12:47:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, "andrew@lunn.ch"
	<andrew@lunn.ch>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: RE: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
Thread-Topic: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
Thread-Index: AQHcw1uOXzjJ5f4us0+uUd80lAj1i7XNRYKg
Date: Fri, 3 Apr 2026 12:47:30 +0000
Message-ID:
 <TYCPR01MB11332623A3F7FF4601FE8C35C865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY4PR01MB17886:EE_
x-ms-office365-filtering-correlation-id: 4ed9cbe8-5c5a-468d-03ac-08de917f2b5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 CLWekKLTnwsNSS0wjEUbKAdEA7YkMTtJNntjbaRk2eBwWqAJLGxcerJhYeHStwJwoueoWmMF1+sgQYh40xlcC4ekh+8k54+acImXE6cqmpnGp5RtSKQacuBpqYJoYGhJ8DW9hJXnQt1iCpwqVWi4cW2doVRK/Ux3rc9JyLglc+BYox0plNT+rB4WIHRmC7JuwO324ZnQNoK9e2MphSM1y/OYq+zvGVwuI0Y7/0oNy81cqxU/tPhPImx/uCLc6v31qda3mPELK6gXWNIt1FFkXXzo0980Kr1fwtU0ptMxlHPyCHrrz79dZVyqcz6L/rmIyOT9lLqG0d20eZFMLSrZOB//TfvC2w/hfO5dozzwDRCbXSX3NiiwyHymj8RXZ4qs/vtKSn6/yihSjeCSon3LgKZ8IPGoXHdXPh1uweJ7ayDPkW6mZUPiPZX+UVD2ctNt/oPpxmBohBbKaIxmlpQTH4bfQtsAWEqiEif9eIKg9SNnHckmkgEqlQRXCMD/QhtCRQDjL76BqcYthuTLYBmuhnOrbdqdfttbkL5YjusxAfJPbbIGTqLS9Ih6M7vgZykZnDIKgKsoXwAK/nzHgqH71HX2c+EfQrbgZ4g7bDUj+oFp0hq2AMe8RstbgS1O7MxspaFKNAGDf6fp4n+zAlZ+A1LEF2Sra24d4ejAvTzaDku4lsLDfM2i+aha4fdgLw1tcWJUnRRCSAiwPZEN0nSUQUeb1ToimdTW9kaDS/7Q3l5eg3RhJ1fjK4+frmYh+WBPXFWQuRAqB4Sgn7X9QTVNZC8k/0uz9BSa2DAwbVFZHrA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ucOS8Sd3gjcIWB+QbsVAd8DXrj+cBUdRHZixNIhm2s8kETtFPdBU25BCJLG7?=
 =?us-ascii?Q?mpTQt1R+aoxvRhK0O02W+c3cuq1oDsYvLgmHB5kSNNjbv+saSl6rPAZo414p?=
 =?us-ascii?Q?4Kw4pTNBXF70r2CLzzZNKqvBZeoUKiL4emisvANQERa5dPSoId+HVDGsMHXF?=
 =?us-ascii?Q?Cop5JscoD7s9qX0tF9xl7u8ZlLwx+fibEeDSRj3hpWwT9FJbOp/KSxGUSBJE?=
 =?us-ascii?Q?KBx+LundI1m2JsGsKqAC9pC6x/xS05pjzr0SBTg2Faxs8mwJCEsQH7k2K969?=
 =?us-ascii?Q?uUUOx666dCVZDgALh7CLn0SmCs9NiUbOgg3Yn1KLxNwAeqo3eoNTaBhk5LtM?=
 =?us-ascii?Q?1BETKeDOehxrIXm4CTtEUEqYg236FomrXt55Xjv5lPWzF9VmrnWw/snJyFX1?=
 =?us-ascii?Q?D01umFmTlkd2P0I1rkT4wIaJs5yNdTWYSfa1OrQus/Ff67WeNFeG6N+YCl8f?=
 =?us-ascii?Q?hM0ZwDTyNsy+2O8/fEjlEM7RxdfxMD/0tP1Du5/y9PQmu45hIl/dDESaz7Ae?=
 =?us-ascii?Q?CAQgbBAGB+lMI+gs8bx77uhqOjvQ1Ydkh24OFSUf9PXYSlbRTGF0Wf0vXHl8?=
 =?us-ascii?Q?AuKyHFRAFCJMVGR2TgoxhLjTsOBRPfOpAWR/hq5HD7GD9i/Hzc05n7V8CPlr?=
 =?us-ascii?Q?TKLAoFaoUG1JTJqJ2lqNzjdWjctV0U/YmHO+O/p1xG4DtRVBUylxYhydRlix?=
 =?us-ascii?Q?3Qqhq9GTcc4HIhR8QENd9GTnpoiHZkoMbBFPbmbzMqeoFyjumQR8HVqb6oH/?=
 =?us-ascii?Q?Npg1FGk0RsTbyOgmiqgF5IFrNigqnJj82BfsrGY3jIxkGBzvIZai1cyCHoDj?=
 =?us-ascii?Q?WrK6+Wb4XeqBSOCdB9W3OdHCZeN73RBajFUjaAHuWqnWBvPtLHF55xMfZ8ba?=
 =?us-ascii?Q?71xAZ1Yi2gIVXiE6jAe7FE0zTZATrNuF9MuY+cdPLhNbo8McEbfMIKFZc4Nr?=
 =?us-ascii?Q?qAStp7KQYr0k0JNW7d2oceC+80xJnWpw2bbSYp7IxeT8PZkR39ueeF0kTNmG?=
 =?us-ascii?Q?PbM1lx3R+76ByYqV6Nceqss6hUXdU+S55Rx6jhZgYuXSAe1SZ5ltT/mGd9NZ?=
 =?us-ascii?Q?BSt26zTc2npooitVbfM1fJ7jdQd6y28fTABUtqpIvbBaVpGpKTLxjyYAKoej?=
 =?us-ascii?Q?5jbbiP3Fm94rZ/VQ+QAPmS3fG65Nca12g8biKQKh7NmCGKtffxNKFdSJXYGJ?=
 =?us-ascii?Q?V+bf4BwnLcp1zROT8JGAxZvHAFAAkYx7voyc8PAu1A3BodYyZzVf94/RouYr?=
 =?us-ascii?Q?znQyr7e1U95v4DJOBVlJJhOunyiQPubRkZqnDOPzvEAVLKpFjZ737qDo2y+Y?=
 =?us-ascii?Q?O79T2O7trvjuu4EUXQ+65spV2PG30MIttTaK1KHHvtUkdvVTcNxurzTiMdJJ?=
 =?us-ascii?Q?60HlghE8oIQrX7L9B+Td9uE00Qnkq0yYmJN6fbXEVX7ZtJ5X9FdbBO6dIWvs?=
 =?us-ascii?Q?NYBbyhFtduK1rObkOfL/aB82+FNn4qaTf0F7VjKqtIyLNB388//fORbIoUth?=
 =?us-ascii?Q?2PkO+BebS3eVjfEc6/fsB4vO1KEB/4LWIe1d39qUzrNga70BOlS9rxPVXcgi?=
 =?us-ascii?Q?VydHwinG0Qe4fENpk+Gwm/pG7ubMdUb8e7x5GBelu7pouRfRZ6TYUjm78vHd?=
 =?us-ascii?Q?D3l4FtYaT6i64bxGvUXVNOM/ZWiFcYe4BFB5J1YODaCdViHSHToXFb/V65bp?=
 =?us-ascii?Q?LVaREt8aZuvMQyAL87laOWdAdZLwwNxDJsxAfsmI8EE75Wcorw/Ry2j+SrcF?=
 =?us-ascii?Q?d8HYo3vD8tM967NDVntmA1fnNF46HdI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed9cbe8-5c5a-468d-03ac-08de917f2b5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 12:47:30.6095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eo3cBA0cYDhDX4ttg1j3JJG5kXs53Er6AZANUJC0JDdzXYmWEqIeruk0/LrQJ1qnbxO85eHaQDV7+Nnr22+534JLVTxPNZ9aR7xaBnrCBfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17886
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30850-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 7278939435F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ovidiu Panait,

Thanks for the patch.

> -----Original Message-----
> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Sent: 03 April 2026 12:18
> Subject: [PATCH net] net: phy: micrel: Fix MMD register access during SPD=
 in ksz9131_resume()
>=20
> During system suspend, phy_suspend() puts the PHY into Software Power-Dow=
n
> (SPD) by setting the BMCR_PDOWN bit in MII_BMCR. According to the KSZ9131=
 datasheet, MMD register
> access is restricted during SPD:
>=20
>   - Only access to the standard registers (0 through 31) is supported.
>   - Access to MMD address spaces other than MMD address space 1 is
>     possible if the spd_clock_gate_override bit is set.
>   - Access to MMD address space 1 is not possible.
>=20
> However, ksz9131_resume() calls ksz9131_config_rgmii_delay() before
> kszphy_resume() clears BMCR_PDOWN. This means MMD registers are accessed =
while the PHY is still in SPD,
> contrary to the datasheet.

SPD mode: This mode is used to power down the device when it is not in use =
after power-up.
          Previous register settings are maintained during and following th=
e removal of SPD.

Suspend to Idle case, it is in SPD mode and the MMD register values are ret=
ained.

But in Suspend to RAM, PHY loses power and the reset value of Power Down bi=
t 0 (ie normal mode),=20
there is no restriction for accessing MMD registers in this mode.

Am I missing anything here??


Cheers,
Biju

