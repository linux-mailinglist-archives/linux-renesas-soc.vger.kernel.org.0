Return-Path: <linux-renesas-soc+bounces-30855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAvZFrTGz2lH0QYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 15:55:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA24394BBD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 15:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39AE430C32E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 13:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B64316199;
	Fri,  3 Apr 2026 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="a9vyhkXj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010054.outbound.protection.outlook.com [52.101.229.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D5F283CBF;
	Fri,  3 Apr 2026 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224249; cv=fail; b=pGbogRJj65A3L0d3QOARL6FtLbkvptyLUGub3moX8+raRcYqaZfKdaGwtn56lRZW5DeAonf1DMqWIgIw/4w7kTAy3qU5531lVfhWHAgs7z5WCTz5Sx0FIzzWGiDIOor0tVJ4rTmio8N7gBiORFYNLw+ivRD1uVk9bJEA/HxYKfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224249; c=relaxed/simple;
	bh=Q4MCNTFp7hKKDiPxcyY9EGpIjGk0hFW1mXBsZy9Ch+E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hwvZu84LTNQN1IhKoteGdd48HM+vQDwuyqePaPOPIn1vL6bUUXOu2CPO524zntscRBIsRSfd/2kN2ZzEAHfo7lE2+BtDUKnE5ZaOaYvx6Z2liq+j39a5um0KL6z7jeVMwUFVGyUWEblk1kPitH8srkabAxk2RNdK1vwTOPpF/5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=a9vyhkXj; arc=fail smtp.client-ip=52.101.229.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqTT/e7GyqUJL7GfeWbabfHxTTMayxpilOYtUGX7oz7J5JUApDYJfS6wlGy2GqpsXLfbIO2MFoEc9J/hmIYP62KzWh1FlAuq4PJcovpdVqUoFMc/46Hb7Rgp4bCCK9IZF7bHyOkXRai0TLsVFHtIV8b004UGKhNGElgZCK1WrMdKgfjSqkGwU/OJFDHWx8ztyqV86VdCBUWQCPctcB+TllWy80FgdvWFimQl5jrpQKif1H4rZ0kVRz1og0EJfNYsQfT64peM6N/OPFq9YUpmEhe1eieL6/WBPY42ueF7SU8z5Afhg8jDaUhcgTXEZVriIdKMPHzClFVXzGGxOlhGOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fo4wE9bBG2yFf8qyrrIIwNy7lkcXolzcWP1J0iXKFNE=;
 b=NyLvY4XPgeG7WXGCLMgaXA92z71/EhHWo+qmrkRA72U2+q30fYulzIE8+8KK+0RTzgvvXaDWLHtGqSLd4uBakUigoa3IqOO2FjJaypjmVEINVfwfpW9O34FFdSvKdHghnS7CSGNV53NB8lMBCo4oswrn64aH+82wNNTwd07PeCg5wuWfNN5A4kHJXyCH3Cb5PhLIUNsV8sPA+p/5sZkWJ4j8vFsfLarOZmZcZVSggrFlA9T0aYFNZdAc9oM1ZU7NXuVNyLKZQhoXHcK4GR+MNE/50wJt33AHOBmBG8QRRnLbmZsJkrUaIwluCSbA0+mDeps1fotdNYIPuD8bISY35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fo4wE9bBG2yFf8qyrrIIwNy7lkcXolzcWP1J0iXKFNE=;
 b=a9vyhkXjr/+GXzbhxgWJlYl5nvISNYBRK9ea+0ZYDkvSVihlTNFYHk1Tf/sSi5AWe0eYIdmdFx7J1KaG5qf5X86XMH1K5V14wPsSxduVh4Dh1vOLToZRuTgJD2JD5ytqltNRdcGEGp9wnnI2g2/9uDK54bbclIkYn7MyzsAdHKk=
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:38d::6)
 by TYYP301MB1126.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:10a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Fri, 3 Apr
 2026 13:50:33 +0000
Received: from TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911]) by TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM
 ([fe80::5b4b:dd0c:b302:7911%5]) with mapi id 15.20.9769.015; Fri, 3 Apr 2026
 13:50:33 +0000
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
Thread-Index: AQHcw1uO2X7KYPO6jU26NrM/2Ym+OrXNSVkAgAAFtHCAAAgHAIAAAMXw
Date: Fri, 3 Apr 2026 13:50:33 +0000
Message-ID:
 <TY7P301MB198479332A7A0C00451120EDD35EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
References: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
 <TYCPR01MB11332623A3F7FF4601FE8C35C865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY7P301MB198462DF309670467625AD40D35EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
 <TYCPR01MB113320392754A3B42F78A9FC5865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB113320392754A3B42F78A9FC5865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7P301MB1984:EE_|TYYP301MB1126:EE_
x-ms-office365-filtering-correlation-id: e53686af-e0f0-4863-6778-08de9187fa17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 s0vU9LBjg7P/TuJXK+pI3Pe1coGlWQWIzPEHtV2AVeDCsjoDLJHUPcgHUfK8QKWlALIfSDITknNVjtZ+dIpNjODxm8O/JROVFqWhCL/EJAQ3cMp4LXJAtq2oVb8pNZdnUAgfFirW1TcS1HKp2qMJ4+w2CW0I5/tikwB0U1KtNIC7f4LUFQVio7gkqcfM5pZNCOq/9mEGfTaErzqbP/MO3T+FSdPyoEZ2X7cKRLTOSNCrC+sJTIglUt/eQMMK0nOBCnCyX026zGHHsHt6jeTxDKm0v8Ddi4pPyt1o4pRVdWMluv2nUrqSGY17WSBcKwfxoCO4jmoFH6gJX3OOat3jPEkbDvBCw0qj4uUmAq/u6I6NXxT/3WegTEFE5ZzENhUi5kfEt2wknQ/OdHlIeNFuF5q82F2OyYdlP5I1s28jB0zZyWdKgLg+s6LE8eE3Mi+PQTCaZdtYnfsrCEPQJs9W4cNrvY4f1UfIslJIeByrd23I8RTkMznqmcWPGP6mG+Ya+FBc/rsqv1dQbN0D/L9XLXpBQM8hfDqjQVgYfxlKXiNwqFh6fiRqdeLrPwkMT/8dWQOEJ+veQQkELP1tJCLXhf1f8tQDoVJDmDHnGQUUvCevNt/vtubDMvBP7Exj2IMsInrteYwglUxhLKneowqHV1GrmvHFzoO35qY9TlWm/93ZM/Vf5pxZn/CZF0OJKyNsszd5P5VnECRXibY9imHQ264E461+TqwX0/3HsiuuZH2aTUlEq8hnZjDdgJAhEbtg
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4EeArEn/kDjvSnXyRWYKJNkzhsgdIDzv9z6XxN2774g9GnCdwbZBeODmzsrh?=
 =?us-ascii?Q?DzsS3akHrQ1Nxb4cd9jKn0dzt3YQCgY4uKY3egyhZkNACyX2VTUCgx6bDwnu?=
 =?us-ascii?Q?DuE91IaIR5gt0i5g9QssgvGYMgd9LnsqCiy9bhCiuodpt12FvlesSYkbcIDE?=
 =?us-ascii?Q?fsLX5X29WQxCaofMHVLXemzTWDG6ltLrjxJ/lUuPe3cxWF4ml2dzDNLVkzgM?=
 =?us-ascii?Q?lEnNRmgWynpXIFFJZahg4PU8aEBGcE4SBeVu8IexljfGI6KnPIEFHwGu6e1b?=
 =?us-ascii?Q?mXiEWbo8X9iii0A9AjBd8bfomHmKe60qaUa9viRnF+DbKfhjbtbZ5CgFWeiZ?=
 =?us-ascii?Q?0LeHnIevfMx3/3T3kB1PBNyh8KCopHUyJUXysDIt3nfZmaZrAHTv+2n/an+j?=
 =?us-ascii?Q?nKe/wuE6Tinkj5O1gexuTBE/sQ/RTNB0fIvPTQd5xUBQ79pvvRN5wQ51FKSB?=
 =?us-ascii?Q?VaB5EmtYFD/Gg8v7qYLTZvoVCIDbT/wSZBKVBF6LlXEMSMQ/54T72W14kzni?=
 =?us-ascii?Q?GIQfGbE9S/3c/rf3LdFmZ3Ds1d17G3k3zPokjbKLbwkZBtiN6O/ZqKsBxCFd?=
 =?us-ascii?Q?vPYa09ZSEtVu3O5pOy2Vec4JTx9/jHLU7Lk4vpN4S3WSxzIH8Wlfav+GdKvt?=
 =?us-ascii?Q?QWVrEkqo1b5zwqGFFJ4g0WGS+fKzZvM6VxDvwILDoHm7wKPZeXJthH9y4gmj?=
 =?us-ascii?Q?xKBAjrIthlMy/cU4/z52/dKaJr+ZS8WRg/U4dXq+9nMJKIMgvsnaMjmkReVt?=
 =?us-ascii?Q?AnhBEw0BlUTGlveneth2eW/4ve0LguAx2PjshVsR5OYx75x7B2pJLTvAFGhG?=
 =?us-ascii?Q?3U/xFIWib6eMkeyTJNPuWqqsJcwApo86a9uQzA5apCR050giyRKoy4FDZzJj?=
 =?us-ascii?Q?UvFh8IbPFcYvG3XbXY1V9lejYmdkihPn9u94PuIVW+2OOnJEFYlu9dVunuIA?=
 =?us-ascii?Q?EN5mSQePJ5oc7Uo7YJlbNFzrEv5kRh8xzWgfCsnwmOqLQQ8JKTe8qWa7rhIa?=
 =?us-ascii?Q?dtXPlEH9lgbTuiNXkmFdMzVlla5Mz5LOxyshSEyDENIoqMOSeTnKVwKvkpWa?=
 =?us-ascii?Q?clozodbThSfBxrWZjRtG7ylP05Ljzbx475yYSkMbCq/R8Z5vjHojKKf+fRN/?=
 =?us-ascii?Q?+uiSrdXXp83Ka1azUiFTnTVU3PcQggAa7KadP90yKWSWDL2tMyfSg4HvORgc?=
 =?us-ascii?Q?OobpA9Akw5Z7eN7P/8b1eqWdi2pjAdh5RzeE+d9Pv05YEG8XjpbrXM1UeHU2?=
 =?us-ascii?Q?PMwKNEvE/mjISoaY9ShfqdUfbro6XFbRD8fMpC9uIS1gCnhz7kblwvuxJkDo?=
 =?us-ascii?Q?V4exfsUNQTKB1QR/kOCMTvKyBE3sGrTUJSQzZjM+/CjpD129qi5+KZTsLrJ4?=
 =?us-ascii?Q?oaUwS0RuKVQkcRK0l9uXW3M4zojmPh1/tml6hnFbhnALylqyIvG8iiDN1D3B?=
 =?us-ascii?Q?0ZVAfHQColWgCg8clhjE3hzLDl0684qm27+EbmGpUz/dRmOlZrrHqzI9OQAa?=
 =?us-ascii?Q?r35As6Rz4S9fkQBfm611CXFUhH0jUiD9HKoWKrbLs36ecGzn0i5iKjZdM8k+?=
 =?us-ascii?Q?/PU/CczWCu7vFYg1yLTKa7y/uXgG6HrlxOix02xI5NSvuqlO0/HPHl45uPhW?=
 =?us-ascii?Q?E1+tdB5ZOdioSjn35M7zEmq5AvSStGoO4dO/Tt1AaGBRi90S4uzqQ6dW2kuL?=
 =?us-ascii?Q?IGMQ6ORgavHxHGquYzjmYFSNRyfs9Z61NuOfmsUwrutpv4Ybd60NX3US9ofq?=
 =?us-ascii?Q?CbSPRzk5U/B1zYN/k7UEkn2zbiXRGwk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e53686af-e0f0-4863-6778-08de9187fa17
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 13:50:33.5602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yod3Y5netbUIMt/maFeiU8WnNUCHuY4Xzt3WnaaAHlZgYSHYsaLT3xFI1lVAhuLfoMXD9TxjU/xXwmmzP7vzDpbXcrcj9SzJGFzB0SzSpYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP301MB1126
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30855-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM:mid,microchip.com:url,renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: DBA24394BBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


> >
> > Hi,
> >
> > >
> > > Hi Ovidiu Panait,
> > >
> > > Thanks for the patch.
> > >
> > > > -----Original Message-----
> > > > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > > Sent: 03 April 2026 12:18
> > > > Subject: [PATCH net] net: phy: micrel: Fix MMD register access
> > > > during
> > > SPD in ksz9131_resume()
> > > >
> > > > During system suspend, phy_suspend() puts the PHY into Software
> > > > Power-
> > > Down
> > > > (SPD) by setting the BMCR_PDOWN bit in MII_BMCR. According to the
> > > KSZ9131 datasheet, MMD register
> > > > access is restricted during SPD:
> > > >
> > > >   - Only access to the standard registers (0 through 31) is
> supported.
> > > >   - Access to MMD address spaces other than MMD address space 1 is
> > > >     possible if the spd_clock_gate_override bit is set.
> > > >   - Access to MMD address space 1 is not possible.
> > > >
> > > > However, ksz9131_resume() calls ksz9131_config_rgmii_delay() before
> > > > kszphy_resume() clears BMCR_PDOWN. This means MMD registers are
> > > > accessed
> > > while the PHY is still in SPD,
> > > > contrary to the datasheet.
> > >
> > > SPD mode: This mode is used to power down the device when it is not i=
n
> > > use after power-up.
> > >           Previous register settings are maintained during and
> > > following the removal of SPD.
> > >
> > > Suspend to Idle case, it is in SPD mode and the MMD register values
> > > are retained.
> > >
> >
> > On resume from s2idle, ksz9131_resume() calls
> ksz9131_config_rgmii_delay() which does MMD accesses,
> > while the PHY is in SPD. According to the datasheet, it shouldn't
> happen. See commit e398822c4751
> > ("net: phy: micrel: populate .soft_reset for KSZ9131") which fixes the
> same issue.
>=20
> On my board, while s2idle in SPD mode, it does not hang. The datasheet
> does not explain
> the behaviour when it is SPD mode. But it states that it retains all
> previous register values
> when it is out of SPD mode.
>=20

According to the KSZ9131 datasheet ([1]):

4.17.3 SOFTWARE POWER-DOWN MODE (SPD)
...
The following remain operational during SPD:
MII Management Interface
- Only access to the standard registers (0 through 31) is supported.
- Access to MMD address spaces other than MMD address space 1 is
  possible if the spd_clock_gate_override bit is set.
- Access to MMD address space 1 is not possible.


The spd_clock_gate_override bit is not used in the KSZ9131 driver.

While the datasheet does not specify exactly what happens if registers
from an unsupported address space are accessed while the PHY is in SPD,
I think it is correct for the driver to not do it in the first place.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductD=
ocuments/DataSheets/00002841D.pdf

Thanks,
Ovidiu


> >
> > > But in Suspend to RAM, PHY loses power and the reset value of Power
> > > Down bit 0 (ie normal mode), there is no restriction for accessing MM=
D
> > > registers in this mode.
> > >
> >
> > If the PHY loses power, it loses all the configuration that was done by
> ksz9131_config_init(). Right
> > now, only the RGMII delays are restored, which is a subset of the
> configurations done by
> > ksz9131_config_init().
>=20
> I agree, Only RZ/G3E reported this issue and with configuring only delays=
,
> it worked.
>=20
> Calling ksz9131_config_init() restores more MMD registers or call
> phy_init() like this patch.
>=20
> Cheers,
> Biju

