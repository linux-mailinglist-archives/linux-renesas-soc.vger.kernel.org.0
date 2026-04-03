Return-Path: <linux-renesas-soc+bounces-30852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDy9HQbDz2lH0QYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 15:39:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB79E394993
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 15:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52D80301E7C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 13:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C553D3A9DAF;
	Fri,  3 Apr 2026 13:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DSZVY+Jm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E2B1A23A4;
	Fri,  3 Apr 2026 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775223403; cv=fail; b=sO9ki4Z2kHB6zdUYOM8bh5Drh0/0qSDkt0JFjjx0qn3wRCbx1TySbd5UuoHKazRXmpEIxddUSvlJhalR0jZ/Wx5AUwATmL3iqEq8u7s9SBLSsMAlA/c60wN/g1zelmxlNvB31wTJ+fSe+0gdzmhyBXuux6fVasa7bTOh/8s1fLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775223403; c=relaxed/simple;
	bh=oVG11PgvlP9nx1JYYYHK7bp3jPrrsXRvgQWyHDRttTM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FivHNtPhbQTTpU61qL+1EynSQAH6Ui295mD5JXKAn/8DYTItHfFuoEkkb4sZ67lhNn78v16rRcju6kpAy7fEZO7XVz8exGtcfEf1Ixtu8tDafEJsAQ4PAW+7p0ukSSj4IMOiDaPn4PeJfokaGJRMQDpxlfSScb3ekbfCYSRF5yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DSZVY+Jm; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Alg3C3XjK8JHhoKmA5E4VsXMn6ZkSOPA6vuGDU42IGAqjDTsGuCmpv5LCjFlX/m3O54P9eSZ+UMW0PdT2pDGEjNMWQKV1JysQYvOGeEAL5j5pMdFNih5cpZ7mRNGBV5vuZmAJiRR9Cy6E7kRJ4G5wJHrVzZr6BtcjA43wa8staTZhpGta2eapxvimS4s3S6uFZDP5+zmQAjuhkGvC0xEPZpLVQiea4kmACol7HP0osXCNpfMIFqGhIgK4kvHPKx83zWPd2d75YwAuJg6utJVNlXBeCgOkG4dxv/wFoo9WEnth25i42ikFG8GtUJGTEReIFRGw4sz9dVztv0LXK9ntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvQ4BlLlaNzYSZzkWOQmQxmbQRjS1EWMjMrmuVjETF8=;
 b=Qu3nF3M4kbv0HheTUkkRF+fBPWNkFLskJfuqLtKcBVYmozz/RysMiJ+WNL0YaLcwMOTjWsqsb+zIWsE3ZBD1Ag81yUKZvZddSM14VlpoZs9opkYwjVuKLzaCy6k8JbCjRXPDYtdbYlmpwIOhIb9UYD/MLxubFETWeX36FZtLrXA3FFDy0DLwwjnpEunwBnMRaTUxTt4AZC3SWZVS0DDhm2G9H0L+Md4j4oY1CqW+7RYMSYZiVNVwf3ZRDlrnZOOFBsRMnjwrwkMySIqfjQHllyOfYgd5HPZie9NvU5nEriPw+9vP+5/cf3zkSbT0UfVETmP3DIfI/f+uJ1VsgP2cYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvQ4BlLlaNzYSZzkWOQmQxmbQRjS1EWMjMrmuVjETF8=;
 b=DSZVY+JmFG6NairmYM8QCxfS9wlJSoFlQjagvf9vERtlsKdaDJGMMlXCn08QJXS/7l75gdwEnIBUO2no9ZuoIgxTV4gvDdZMsw201IWY2/xQ9dnyOfkqeYtjut1OV9fVFUIdbbPFe75zBAXGiUBnrhKRtevDnOryX2hwrKgkdHI=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS9PR01MB15215.jpnprd01.prod.outlook.com (2603:1096:604:3b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 3 Apr
 2026 13:36:38 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Fri, 3 Apr 2026
 13:36:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, "andrew@lunn.ch"
	<andrew@lunn.ch>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
Thread-Topic: [PATCH net] net: phy: micrel: Fix MMD register access during SPD
 in ksz9131_resume()
Thread-Index: AQHcw1uOXzjJ5f4us0+uUd80lAj1i7XNRYKggAANrwCAAAEosA==
Date: Fri, 3 Apr 2026 13:36:38 +0000
Message-ID:
 <TYCPR01MB113320392754A3B42F78A9FC5865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
 <TYCPR01MB11332623A3F7FF4601FE8C35C865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY7P301MB198462DF309670467625AD40D35EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
In-Reply-To:
 <TY7P301MB198462DF309670467625AD40D35EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS9PR01MB15215:EE_
x-ms-office365-filtering-correlation-id: 8037cf3c-79ba-4dbb-8a9f-08de9186082f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 scZL12Qv5sdFLvpv5FpL4DcdFFy9lsRuxbe9oBxDFNglWNjBpp53Rjdwz/z7I+0ityJ9RrvMIA+oiivjiihWMqr1Tm+VVl/NmbypjDtMrA0yrVZCS5kaBvtLJjnLhWED5DcZnOrMbifn5AU/mmqifwJKUvJ62/1B2cG6nU88LuaWaNX2yUTEqTLTWsIhwIjYDsatFVMH1dmujE6Fyjq/ptd49FXrnVmAjnxGoi/zihTFVy/3rUzveODqkAx/IDu2yMVhqxMRD8/rtmEY9g2VzFvGicu8+dtybtDLxjwFAB1yvoobnBFyY7Loquofxyr+6H94XfVeZ40FOehFWEgipAsGgOEMPgPgvKt8kaVeMJJOrQnj3TP2G0dBmwo/FhcIFbi1772sDKlOQHNf0oFXDc11BBplilfPub1AKn8CA/8UEf6JdSrVAuwl95UtoMrwK7chwV1yNBdGgjZe4esOYHEwRLjS1XfiAiQBrvvfaHMG0OwdboFtTFAUNXm90R2BKPwdxXFDuOTkvzfS/9qGfDe/aqxA/+wiIT+/43tfn9DB8mVXAG1rHf67CdwAkT1w1ceuD5hgpo11JjxgXYdlW/qCQj3KXZPsVuI64SE+tAWiffa1hIOlHpCZwn66iiGdpMM5ufejd3MssNFr0DwAXld0V3he+LSSWp4buoCwvaLUF7WO6ty9AQNsmJNbQCFW9Awjd9KrbQTY0s4S6rkolesM74Xta8P3l20+xOBopyrtRM/eQMoIYoQVX8Bd4xafBlRrR7ymbkClMRaWrtH7YfmlhmXX3r1NYzdP/rtHALU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eDhiSWiKmH1A0SCp/680Egagj/K17W4DLqw3xLNkomh318zxMkd279uMJ7mk?=
 =?us-ascii?Q?zYsFs047W1LFDqaCzrzjQdTpldG5wB7xneNifYxj9OW1NLBr2Sx+bSqSfd0m?=
 =?us-ascii?Q?sokN9SiTzrQZPMMshs6nZgVO8lwe8YE5inKNaIp9Q1WYPqDZNubY0U/XzJlV?=
 =?us-ascii?Q?pVxphtdd6soAjJkH2wDu7P9xc+Yu33ykzbXMM5VZHqL/eTB0EZqj/jvQxQAY?=
 =?us-ascii?Q?TKwrNdcYylVY9nhIpuYN2/t42ainMFtw5GTOg1ydOaKKs7YJxWhM0nmgjyEE?=
 =?us-ascii?Q?q2YqbHfuRlBX6Qu9ykQz7+CdExVSBdZXL6BqIM0VucLs36SreFZiV9ICyE9d?=
 =?us-ascii?Q?CirQsSOALSAgFV0AEiwfbzv0HRIyXuxp7Pk5pcSDASUX1fbCaft+Kw8Lo32X?=
 =?us-ascii?Q?fCHuC1wpPPmqVK4vAILFcUoo9MihSpjWWelvS/cVr0O3dYOxi4dWoY69vsNd?=
 =?us-ascii?Q?r94Lyl4s7fwtBjlP208UYgx0sQdnwo+DhtCTqGkwA4ALQbtJnGQthAxS4obx?=
 =?us-ascii?Q?MpdoCVvrKZr2+6dbnyMI2DVUkKC2/UvYdBOmHG88O6ip3EjwYotVLkq1yuYa?=
 =?us-ascii?Q?k6CHU8jJcA8E0TUexK9bIct0MvVvXejVv1GyqKvmdbZejf4igrksG3TgmHtm?=
 =?us-ascii?Q?+3lYovw0XWuqZHQtNzR9uu83lAriIk4K1JzLRuVaarLUuW+00ai8ZgoE5grT?=
 =?us-ascii?Q?20ri18XgBMKYlQ0P1BkYLTZWZTNG93a7U4MUyXluw0UKp1CZQskfjb9MmRoL?=
 =?us-ascii?Q?ATAIn7XhjZjEXzE2sTdgGC3SK532TJmd8DjaRK69jOAA2PAwKjt07SeEn9/0?=
 =?us-ascii?Q?5BRbuCUCc42HTQoG+ExyCJNOErtuqq53Q94qEmp9MPFvJShkGmExEM/XY+2M?=
 =?us-ascii?Q?ZD4xpx5lmpXmuqXEQf5QwSffKM4YG3qxyGn6XF46pEx0Kfaaq6WiBdiV+nE3?=
 =?us-ascii?Q?M1LWybcNIy3LfpHMLyvdQBv55/LrszBrW+mn1qgQqUl00ZHKkp9s8ESMm0Wh?=
 =?us-ascii?Q?yhbU0HEMivqdozO79HrnBTNrqyuPYaDZFwezRihVlS1fzGeXslT5bomY6e35?=
 =?us-ascii?Q?zDUyGZhwVeiH7KpxdE7TilJTLyoUy+NcUBVPTykecPJXoTnLI1BXQDPEnXX3?=
 =?us-ascii?Q?r9oXFq9BzEhqVjP6gq23EEvRg+Tw/OuWxa3cozMeD73+sYnPvDVxnT4fyYPo?=
 =?us-ascii?Q?Ob2LpGpF7qVIZ43FMGkC8uctItBXm86OU6c2ZK+Ad4gkAQHYQk/18n7Z+3KR?=
 =?us-ascii?Q?ILqrhOudwKfIOT6Eg1RwFhWljyjsRLtqsp87tqW5HCP1dw3rLfaOnYxSQe/Y?=
 =?us-ascii?Q?ONClD2HeCl28xK66VSjeq2z2NSeJfg20CEXbeFn04c/uCaS14cJmIS5hDoHP?=
 =?us-ascii?Q?9ZD0FoUpfp+7WNX0vjZxXPDLVWP5Li+ZaQV9zE6F/tAXpbLKOwWVWvp2TCgc?=
 =?us-ascii?Q?AuFlYCZk+HHkYVneiKbohuRVIDfv5Apt/gFLaCWrvVHGT5CzQYgosEVhpCV+?=
 =?us-ascii?Q?169cajAC5YhRroo+QPM1RxJv2MKrq3sdOuD0wS1L9NUrAsP+fFozGeZN2exy?=
 =?us-ascii?Q?lMXpIeK7lIO1xxJU5FCVtcJeh1Qq0nUtJXidLIvSRmCScCqHLFyq0NSrqBS+?=
 =?us-ascii?Q?IqjbNxvfR3Kl0tpf7kyIz6c/FFAMJG3HOBTMQjoBpP+GXbv0HSveds32K24/?=
 =?us-ascii?Q?1hTE5EJuaK/CEIGQt46CxRbA0t8OahQXJroW5i7+b/UtBRx1xVeApznFATFi?=
 =?us-ascii?Q?jD1WZPIlZA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8037cf3c-79ba-4dbb-8a9f-08de9186082f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 13:36:38.2101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ffLTGoIjpNLpavD3VbaNAGdSU7L2IHzyZmsyeXzgiPUGLZoRGezLA10DsHpPBL6mLzTP/Rg/hpqqKk7iCgWcFSPeyIuwEBuAouhBnGQKswQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15215
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30852-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,lunn.ch:email,armlinux.org.uk:email,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: DB79E394993
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> -----Original Message-----
> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Sent: 03 April 2026 14:23
> To: Biju Das <biju.das.jz@bp.renesas.com>; andrew@lunn.ch; hkallweit1@gma=
il.com; linux@armlinux.org.uk;
> davem@davemloft.net; edumazet@google.com; kuba@kernel.org; pabeni@redhat.=
com
> Cc: netdev@vger.kernel.org; linux-kernel@vger.kernel.org; linux-renesas-s=
oc@vger.kernel.org
> Subject: RE: [PATCH net] net: phy: micrel: Fix MMD register access during=
 SPD in ksz9131_resume()
>=20
> Hi,
>=20
> >
> > Hi Ovidiu Panait,
> >
> > Thanks for the patch.
> >
> > > -----Original Message-----
> > > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > Sent: 03 April 2026 12:18
> > > Subject: [PATCH net] net: phy: micrel: Fix MMD register access
> > > during
> > SPD in ksz9131_resume()
> > >
> > > During system suspend, phy_suspend() puts the PHY into Software
> > > Power-
> > Down
> > > (SPD) by setting the BMCR_PDOWN bit in MII_BMCR. According to the
> > KSZ9131 datasheet, MMD register
> > > access is restricted during SPD:
> > >
> > >   - Only access to the standard registers (0 through 31) is supported=
.
> > >   - Access to MMD address spaces other than MMD address space 1 is
> > >     possible if the spd_clock_gate_override bit is set.
> > >   - Access to MMD address space 1 is not possible.
> > >
> > > However, ksz9131_resume() calls ksz9131_config_rgmii_delay() before
> > > kszphy_resume() clears BMCR_PDOWN. This means MMD registers are
> > > accessed
> > while the PHY is still in SPD,
> > > contrary to the datasheet.
> >
> > SPD mode: This mode is used to power down the device when it is not in
> > use after power-up.
> >           Previous register settings are maintained during and
> > following the removal of SPD.
> >
> > Suspend to Idle case, it is in SPD mode and the MMD register values
> > are retained.
> >
>=20
> On resume from s2idle, ksz9131_resume() calls ksz9131_config_rgmii_delay(=
) which does MMD accesses,
> while the PHY is in SPD. According to the datasheet, it shouldn't happen.=
 See commit e398822c4751
> ("net: phy: micrel: populate .soft_reset for KSZ9131") which fixes the sa=
me issue.

On my board, while s2idle in SPD mode, it does not hang. The datasheet does=
 not explain
the behaviour when it is SPD mode. But it states that it retains all previo=
us register values
when it is out of SPD mode.

>=20
> > But in Suspend to RAM, PHY loses power and the reset value of Power
> > Down bit 0 (ie normal mode), there is no restriction for accessing MMD
> > registers in this mode.
> >
>=20
> If the PHY loses power, it loses all the configuration that was done by k=
sz9131_config_init(). Right
> now, only the RGMII delays are restored, which is a subset of the configu=
rations done by
> ksz9131_config_init().

I agree, Only RZ/G3E reported this issue and with configuring only delays, =
it worked.

Calling ksz9131_config_init() restores more MMD registers or call phy_init(=
) like this patch.

Cheers,
Biju

