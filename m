Return-Path: <linux-renesas-soc+bounces-30851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH0MFU2/z2kM0QYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 15:23:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ECB394667
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 15:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E2C23028814
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 13:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1D63B47F0;
	Fri,  3 Apr 2026 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q80sCUxB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD90296BCB;
	Fri,  3 Apr 2026 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775222574; cv=fail; b=k78GkfVBv9prqItEiaGMEsMzikpmbSLeZhJ+Cxj7JKrQWYalQa7xFz/Ea5e/tOfXLzjs8X5QY0emCHX0RwY4xWme7Frgg2wjtKcCgpy7SYMgdDqkQEJzhFxD2KuETEwhTpZPXaVhBOWFlgwldgXp07ZfE97IOC7LFY+wOcB/+6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775222574; c=relaxed/simple;
	bh=lQWpzOX009NYmsLAD+OhKapQFmx0zV6iGbg/+Ks1xD8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MDZwQPrhIfZ4YbPsiEGVgZOm3gmgbSf/ZLxhfel0E1T96bst4f3zgee33wN6+Dr1ATRwEwVGo0p3uejhw31Xc0hLb3shSFOU19kGkVVP6hCSqU6E4rTpgPxAp0rGxB03J6AtuSjf1iZoVd9dyas8GHc4q76WmOiz+w5126eIb6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q80sCUxB; arc=fail smtp.client-ip=52.101.228.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qhj8DXsILFEr3LZ35ztQ4gxYY6LKlL5ZXOKf+soEM9xD2bJeaXY77WqXaBiPZLpckya6fVsPyDWMYTQC9oULtMmNzFYkR6SR0r/cU9d23txw8Xuol/3T37JxrhH7onAx1Foh8WDTCny7t1uyH8hVYW9INbmCunv6lykDNYdRQzn7YLn7ETNy0TzzMxk3zySb3le7CDeonkCdYN4w91cGx53+Z2hb6XMT5J1Cb/BDRp5br6+nKXrwMW0cVoa73dVyOM5QTh3eeSsh0gPStD/PAzY1C+zfX10GorxjolRoKmjERbO/BD2GDt0lBq/aCMRYVk5N6Fl9AsO9r2H0C0ybbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D379iSWRmXjpo/oI13choTpta29qbujc7i5jH3jUiOg=;
 b=CWzHvqiND79QXRA9jjOWn78I4WmzFN+3DOZ2z8r1/9RnsazYMYrXk0MS6mWxhMzjg/W8+RHm/cZtRFTVBehVhQDyAQW+XfokOJSEYCfYPVjb71JP3qd0z3gd+ClawSUIT5mI6ebwN9V4Xw+lV9RivfxAypKGyGRbkADRaOm0yEUd55n8Dhw5Qi7Bm9Iz+c3HOTvC7aoEu/tS1Z/iAzUltogoBT7C1CPZTVR1Sm5a3H7LRvEunuwh55bK7qKV5VTN3s4+Mh5WwzuE9dCF8oNhUomK+Yo1YRAEyCrxpj15FuLbNnIp0tkpq11ZP5HBgN4ptropgw4WhHcczTzbSQ9Lcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D379iSWRmXjpo/oI13choTpta29qbujc7i5jH3jUiOg=;
 b=Q80sCUxB0AF4gZVTUsJ13cZDum/WvL/1MP15LKqxgm/p7o8i0ddn4Dn+1K6gSzosJzr2gmM/jhil8SDaNn7+vr73v3S0zo1GEhfQSmqFrHQrxseDTwhDikRUOzqKIgl34ZSqCOiO4hza0/Rr99hXuEexFBDLciIrXtajOn8vshg=
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:38d::6)
 by TYWP301MB0275.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:2be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 3 Apr
 2026 13:22:49 +0000
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911]) by TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911%5]) with mapi id 15.20.9769.015; Fri, 3 Apr 2026
 13:22:45 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, "andrew@lunn.ch" <andrew@lunn.ch>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
Thread-Topic: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
Thread-Index: AQHcw1uO2X7KYPO6jU26NrM/2Ym+OrXNSVkAgAAFtHA=
Date: Fri, 3 Apr 2026 13:22:44 +0000
Message-ID:
 <TY7P301MB198462DF309670467625AD40D35EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
References: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
 <TYCPR01MB11332623A3F7FF4601FE8C35C865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB11332623A3F7FF4601FE8C35C865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7P301MB1984:EE_|TYWP301MB0275:EE_
x-ms-office365-filtering-correlation-id: ecc0fc47-776c-42ad-d88e-08de91841780
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 o4uheW5SoCxzmbYKp2hls9kFViBfQGcvYTLGSi/Sg0Xc8UE7QYKxJ5T+pcbGCjQ0nL8fmQErsE45+n4+/D2qG09bWDuF2B2NnvWZd55VHcF7SICG6WB047OMTL6PHncLPeokAYUCxwhGe+/HHvJbeCB4jXrcruJ4+s7H82gSbUtG/MWZUSTo/kWOvEGHTJjMv4eaff1jJ2d3+7iEfA7m2cP4sGG54RWjLHuTVthVmBtoDI6z57R0K7wniYjPiFkZDn4TjPCoyFS/DkqyGmrFqEP/nUp71SAEGQzsut3Y5BD6c+m3xnDNxASapy3ptK/UkV6SVxYoSA/nRJmqZDqqfN+fQyU+2GX/7IqtaFc2YcQDrsr/zocs74Kt6Sktp+3gF4HeZQctVFVgWcsDz2vftjED7NvOpOLhfcUdo57hoqZ0jfWjJCe4mf4QpKOQxBK1EBDzfpIL0hN2bI+05j1w+Ov/JPkD4LkqovTpZwdl7kf/rb23I6cOYewpVDhG7DkNb1YMQfJGdUKZo8mC4tHmG2zCtGMX16jkn6d8RRb2R9u64+rirGu9uZ+rvID1Lph6nhsQlDp0jcuTNAweaShx8cfXiaTIaSXLOnDSZ7ybGHmThE0mSHsnvGE64HZmTHhkx5eg6lOUZtW7gAsIDxDeLlJhWpchOYbCDjJJEA8L4eruUnJuDn8BZP0S2SM2mZn6XMwkPi3J/vSHPCnmUvJ3oilIW4gjyytR+jv5gWUIpkUkfc2nv7lVWjPCLMPLnFoCT5nKOnBlrjkXEcWa9rNMc4uOajQAHNsZV1JrjxhBlPo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SHH86x0Di6u8UE2O+SGBUDSOFqFiDWIPE2mdcQrye0n+ST/alFD6x+fKoKWC?=
 =?us-ascii?Q?Br4QpvwgbJ/4hWE1j0wOlrdUYSMr7TL1iTST+05QXY6eojYF/tjgqS9RXuWn?=
 =?us-ascii?Q?cxNTvy1sgO0kb8xzcjYjjy1pU6KdgpdC5yt0Thuz5+6UxpZC1Kzn1m1ayFWA?=
 =?us-ascii?Q?R5aD//K1z9m1cO/v9YNT7QC14u+38q/L8lGXQhoPDpwdywfksbEGrMdUs5Sg?=
 =?us-ascii?Q?BgJ+sGhk2/P8ukIW1is8ciuk6HR1VRZFiZzLJyKD9bdO8HKUSzNnWLADxjAp?=
 =?us-ascii?Q?OtIyJFM09d+eaQ8p0zQta1aFH4lXlWKBZ+0RGQaAaQ7qoMG3lrRde+n0uIWt?=
 =?us-ascii?Q?CY0iIXtr9DGC8RPb2RER/JgqntjSG6M7qlPyhHhQJ09IJyLkdVhxS40/Put9?=
 =?us-ascii?Q?FwWw/xaCjJNagpul8zUJe8CNl9iqsvjs7RzRmVOfIxLsuoc0lC4nsvbxZHSW?=
 =?us-ascii?Q?2XMQYUhHoDY3iYTEEmX2dSQ6fYdO7P+cXWfbswiyQvE70OXr6LeXG+iUJ6Kb?=
 =?us-ascii?Q?HGSWEHVTLbNKfVJx1nuweWsoCkPovQnBKix8VeUT9YkEIWVXqXXi0Mr8h672?=
 =?us-ascii?Q?0fVp5H7j2hHcT8j88+eQAZeLIXyyNHefTh3prsva8/1A3DcfxRoj+mCGlCKR?=
 =?us-ascii?Q?+f+aEsrsY3zjGGT4B3fHOZkinW7+g8RefHsaX9zO8olzXL322LX0p8FlgH+a?=
 =?us-ascii?Q?D6hn5XlxPyHMKao0ny2ewaQizH9Ze5k0BdZVyGkUdd8caIe/ujrCCg7XhI4K?=
 =?us-ascii?Q?aB0If4SvMzIY2e1+wa/HbERD76bJ7qj2Ia+xnMARcLZZIj3V+HDaKVHco9aW?=
 =?us-ascii?Q?q31KskjZ6PWsyuTpppu2E8MqRVz7JJZCMfLtIXx3mwU4uVGcnXG/x/nCGhsE?=
 =?us-ascii?Q?YvZg2KWd9NawfOymZFfA258w9jOiVybYh4WDHMnUG/QB4ZSBd3vVdSQ81iXX?=
 =?us-ascii?Q?GxuLa4ynDLbgdMU4d6Xy5bfKwUzM2cKIjoDBuicfBcR2y9aFcW1u1wBv+jMj?=
 =?us-ascii?Q?S3cqNGo9H+ZOO/RbRTEN91s6rJVdaHP1ADY0PQjWeDkOdrwips1TN716lUmb?=
 =?us-ascii?Q?ESiDm3/dWSRISWuaTx/GrWpeC5dLX77wXAZTIq1lbqjkJEzERNLSyteMzzcA?=
 =?us-ascii?Q?Agi+dUtxBUiF7fyQcS69f5WCbGlcygPB4VxLIBtjgDu4jWiFlg0WAVlo+AV5?=
 =?us-ascii?Q?r84TlMQt1wOjjH7kEais+8c8nhVDy569TlcMtr5i2DSy1uZK+d1dQraEJg8V?=
 =?us-ascii?Q?j+0HOAfMe2VoIkr5XTrYnYshOlNyfEu4yuoTvPzjdcB3C8ocn+5iG3te9m4Q?=
 =?us-ascii?Q?irOyw8lRh1OnolgD0efZhrlZPBuXCJTFfNgrzE9N3+juBiK4mYI71Ea3CqYC?=
 =?us-ascii?Q?l/i+edeY1aWwP1Lo5G+f1ktdv1OF5ZXn12G24Zd+w7YP7j1Feuo+qqdng6b8?=
 =?us-ascii?Q?FO6uW4SF91JBdaqNRf6fB/4jv48yncXP4AbJeC7Sg6kLYxrm0kUZFZ8PJ1p9?=
 =?us-ascii?Q?3U9XFmJpH31BiwFunEz29jT/oGKyPNj7gKx026shI72O22K/EvwylOmCp72W?=
 =?us-ascii?Q?nzqpe6YgjDfv1F2ZXTduw/onqA6jwZo7miLTWaS7nEmO93+WHuZpLJy528Qs?=
 =?us-ascii?Q?Qk7olChyj62zpk8oSXQGxQURhDG4P5T+zAyGsVnL7TcxyECXP7z7zu7jYLYs?=
 =?us-ascii?Q?1ZxVIPRcbjE1KD1u7uRa+ZVPX4tbqtoJFzINRYuytb9LZ6FEtpigcZ6RT0H6?=
 =?us-ascii?Q?ESDXsUrsOZd2zZs5EOpd9Clh0PvuT+8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc0fc47-776c-42ad-d88e-08de91841780
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 13:22:44.5814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yjDwt80fU+f1fDUhnl0Adiaei6IqGmuExOSzi7U9zO5PYy/uit+P+XGxjXXyTGsd63E9Wv9BsUaCzQJx8aGn0md4oVVB6+0Ibp9TsShjr38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP301MB0275
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30851-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: E9ECB394667
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

>=20
> Hi Ovidiu Panait,
>=20
> Thanks for the patch.
>=20
> > -----Original Message-----
> > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > Sent: 03 April 2026 12:18
> > Subject: [PATCH net] net: phy: micrel: Fix MMD register access during
> SPD in ksz9131_resume()
> >
> > During system suspend, phy_suspend() puts the PHY into Software Power-
> Down
> > (SPD) by setting the BMCR_PDOWN bit in MII_BMCR. According to the
> KSZ9131 datasheet, MMD register
> > access is restricted during SPD:
> >
> >   - Only access to the standard registers (0 through 31) is supported.
> >   - Access to MMD address spaces other than MMD address space 1 is
> >     possible if the spd_clock_gate_override bit is set.
> >   - Access to MMD address space 1 is not possible.
> >
> > However, ksz9131_resume() calls ksz9131_config_rgmii_delay() before
> > kszphy_resume() clears BMCR_PDOWN. This means MMD registers are accesse=
d
> while the PHY is still in SPD,
> > contrary to the datasheet.
>=20
> SPD mode: This mode is used to power down the device when it is not in us=
e
> after power-up.
>           Previous register settings are maintained during and following
> the removal of SPD.
>=20
> Suspend to Idle case, it is in SPD mode and the MMD register values are
> retained.
>=20

On resume from s2idle, ksz9131_resume() calls ksz9131_config_rgmii_delay()
which does MMD accesses, while the PHY is in SPD. According to the datashee=
t,
it shouldn't happen. See commit e398822c4751 ("net: phy: micrel: populate
.soft_reset for KSZ9131") which fixes the same issue.

> But in Suspend to RAM, PHY loses power and the reset value of Power Down
> bit 0 (ie normal mode),
> there is no restriction for accessing MMD registers in this mode.
>=20

If the PHY loses power, it loses all the configuration that was done by
ksz9131_config_init(). Right now, only the RGMII delays are restored, which
is a subset of the configurations done by ksz9131_config_init().

Calling phy_init_hw() fixes both of these issues.

Ovidiu


> Am I missing anything here??
>=20
>=20
> Cheers,
> Biju

