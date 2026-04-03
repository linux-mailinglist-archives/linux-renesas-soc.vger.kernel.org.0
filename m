Return-Path: <linux-renesas-soc+bounces-30864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNinOJzjz2mD1gYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30864-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 17:58:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDA439606C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 17:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EB1C307CD80
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 15:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983B83C9432;
	Fri,  3 Apr 2026 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="X2iYrLGh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3355382F1C;
	Fri,  3 Apr 2026 15:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775231772; cv=fail; b=ozIYVTlFXQBq5fdNJkz1aP9XC9cdptYDOSE3vybe+nbeTIUcKjX4AWe0s1h4RiSkilXppGFDmfpuYmfib6Zesyg6xe7YS30OxmpqF5bP51ppV5gbcJUzWHuKxTG4vYJBXG873WRQ4nStXxNa0P14OoqEvDslv50mBCjJryS0Tm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775231772; c=relaxed/simple;
	bh=0n0V8m644jO4gZx7Y/36rFxILwAeizXXGSxWWmfkiRs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KLEZzkf9T30zOiRFO/G/U9ySrpSKPP+AguxeichOKqJQ3ekYeC/26Z+34NbPBGdI7OVXfy0RgeRptLgw0Gj7q8LQz88tPEizBTZL1JdoEjVMliuw9ovKv6YvFNM8ezmfm6RlEL+hB0AKkcnwHCAoeiLx3aJk4+A41Ymw7zcs9NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=X2iYrLGh; arc=fail smtp.client-ip=52.101.229.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAdE3M5Lr17HVPqiwaZH0fBjbXX0ab07/uvCotX75+OWuO6+A8GzqnGnpp+idjieMko2oukzu6e/S496K1kdWSCqKC40Anf5mnoOw+68RKvcsvNogEcoZYt5qZBv39elLL1pWF1n6+kLofvtS7aIvOvI0ZYGRGxw7Rx6TnRnx9o7A7atLcMlMTum+NgeJtmNZjAaafqxfUey3JsFXP4dkR0Mk/GRkjpbuGbNMfSjs1hyv6v+B9EJxIpIouVbw92Y8oNOCuJfxNSLwv1IyOz1nV+QY12sx5FxAFI6emlu0HZ0Nw5XzmGJ3yvLMae9Xt2Y9+X3rdwWQiTrDhPKSmXRoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk3ALrCkmySEBLe0MQM5LpGdLl22A7vPOODHPkYbi0U=;
 b=H8S9DRzrdh7YZo41i/G6eAmlFP8vgCU52Kj/EgLM3pJ+RBt8CWo3TpkvmlPotUwKWUuG5MKYoyz1N8TNpg/JKY6zPEV8qxL4OeJz46pX1BSydLXqG0vAZtcgz9K+AvPpAwZ8Tr/WUu02NYpcBLsN/HZ11xMwYNYcP+9/i7uoh3YWOzAxPeTQIJcVq+pj45SKdSk1OaVlrRTgiX25pCHj8eUWTg1EiKLPwrTIAjVR5Ez/G8MBQEoGJ5rVnzEjDw25Lf/Ij9kROhXtryFtrS1nXlQ6NYiiBuMBPbehbHT9VqDHUwJq9HtJRWye08crRrunX0ndcLiCb5SNBZ44a8xWQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk3ALrCkmySEBLe0MQM5LpGdLl22A7vPOODHPkYbi0U=;
 b=X2iYrLGhmJfTKtnWqA5xcvVjkun0YZmsabf0u/Vp9We+WouisIwBvEkA2TGFSnpALtKxRD1ZpXG5RZxBcAlavjeTwUBt98x0Eo+FDRQh88PucM8e1hI8qcBcDQfczmhZlQi72jqx033Nk9jw0QtwqaQIb/UYcu2Ly2UCgPD7+ko=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS9PR01MB15828.jpnprd01.prod.outlook.com (2603:1096:604:3cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 3 Apr
 2026 15:56:07 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Fri, 3 Apr 2026
 15:56:07 +0000
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
Thread-Index: AQHcw1uOXzjJ5f4us0+uUd80lAj1i7XNRYKggAANrwCAAAEosIAABp6AgAAfibA=
Date: Fri, 3 Apr 2026 15:56:07 +0000
Message-ID:
 <TYCPR01MB1133228575528380F6F8D1CFF865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
 <TYCPR01MB11332623A3F7FF4601FE8C35C865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY7P301MB198462DF309670467625AD40D35EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
 <TYCPR01MB113320392754A3B42F78A9FC5865EA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY7P301MB198479332A7A0C00451120EDD35EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
In-Reply-To:
 <TY7P301MB198479332A7A0C00451120EDD35EA@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS9PR01MB15828:EE_
x-ms-office365-filtering-correlation-id: fe5b1cdc-b252-4f4c-8969-08de919984b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 UbdOQd7UpoI4JgjfP7+pWGNxRTgIsz92C1RT4ikKs8bmvjCQnL+b5W6fJoMjaHwa/r7ZoMrozE5JFaG+XjmRpe2Zv3xGKIbt42xnsFAcqthQA3z9x3FL+6HDks0nSB4Fa/80E29T+15PP/V+zgzAm8633vkxM0JG1E9GBDZc9wglbZPmFeYHZLgF8jCxf+5i9Guphqbgvx0k51Dd2Z0//1+EFqWF6zjDeoTYriSpEAsV9MOJXtpryr1wPlpJPkZmpl5KLXSE8Yr6J8tpUSi6Al8sB6k0cQhSpUHOz9yqOPdji6aalIe370exT4cbVaGiIC0L8jSkmY9+p79lP21YTmjUE02aXqwmn3nlE7nErK07gpiMYLLXSM6mSywvKUlQgZ4HSEVD98NVV/2vZJxReFfFaZ5acSU+jEaux5pkH80s0gGfzIoQskJsFcuUCVTJShPLosK0BhahEsO27go34eOYTfsogTKtX/+uggxGFmp8cTlG6g/n5e8C3IQYDlyIMOTGOQE4hFLSEqAuHPZHBCt0IohFIuSHOFlTCz79C5Enr8+d3RuB5boBkXg7IfoZPhtVa+E6Rb0gu+SXQTefkW1gZ+5trxWFMyay+HHBA62yM2DStHvmiTps4B+gjyDzc3WfAxNy70hyljmCYCnbgzJjgA+RUdIqX81nv6i1U7jjRzD5xsvEPJrQQF59goR46KivdZgWzds5XleqvWCb47SXc6qZtXI8yxIX2XRgQ/0dLfFK8D9za1bh6Spz5x77C1Dd5d0QfYM2zwDVDCn3DgNXVJJIBFcbbG1XRufeKbs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UdnR6H8rlmRZqBsOeQm90gyGnzBFWL8DAEMEeq/r3T/ssNIzacY03iHAnv9H?=
 =?us-ascii?Q?heDOl7ocvdFUvKEsXlobshL0b1xl36m0399mS9a9bWuMSqjGaXPX//mITK0f?=
 =?us-ascii?Q?ZPF8pf7Xz+Ll14H5WQtCl3gZhf7mFY/gzgyLIJ2HHQsWo9FUHIMv7np18JBw?=
 =?us-ascii?Q?PsT2YGI9Xsi9SoTblt73QMlPSZRnrLnSVKRUM0NCTW1B19WEGdxzJGhxjhtO?=
 =?us-ascii?Q?sGuDmqQQtoxor/FB1EPRDhE70x+Z4cfoT82TxEhtOoy+1wJHza4YqzvmV+zi?=
 =?us-ascii?Q?SEZZMEdXQRfXF4pj04Ohek3aNrSRPQ5FWDqGKcF/JVqtbEUSXZyhHVoVdZIO?=
 =?us-ascii?Q?MHprFSzWGYGzfLBCzXwo+f68oMieUo/2RlitH2Qkbup36TYT7lGHtBwtXXmu?=
 =?us-ascii?Q?O5Hgzq1bMXtahQAJ/EKjdAilPUhyUUm2N40E4CS0OEM0sEBw5rx6ZbWDFxH/?=
 =?us-ascii?Q?YdLDrQJvU+HbEjuvqEvpcTi7TuimIUj8u9xgQbJB711JPsSFNWcbSpviOqYT?=
 =?us-ascii?Q?btNGllkVCrqm8OrMG1Oo35L3lQwE3K6IT9dzVoxn8gXOEiVfkb4qi0bEpF4F?=
 =?us-ascii?Q?QzHjF4FoaA0H4y5g2R81D1xe9eiUXZ+nnebZaXqd2RzLnzrr155SRpaJdZNa?=
 =?us-ascii?Q?iP4bv99DScqykPwtGBICu9iUMXW20HMI/m3oaMVe2EqVaPn94qQ5uzc72Gsg?=
 =?us-ascii?Q?51A/5cLB3hqdcvGsXdhWODYYjKQj4M0+5vaPzpOABCpsSCt17gajNBUmNTm/?=
 =?us-ascii?Q?jVVRlWZ6SfJqK3XQDwVifOcaze7OXUBJy0ZVJMCivDWNVoK9tcHnbdlD22NZ?=
 =?us-ascii?Q?Rbjw2EtcWYDwWvN5uZGI5JyT+Dlc7igj0ZJZHcsYjlVzGIijJuWKgcf4fjm7?=
 =?us-ascii?Q?pJSxKBP86qr++WHUpe/ufRJE/2M0khm8BAIBYqU3ICdRmeY5HKteoXqDg28M?=
 =?us-ascii?Q?CB4YfXAYr62oPohNZxcCIuCdPasj5GfTbQ2Jy6jEV/39fJ6KMWSPMkKxbPL/?=
 =?us-ascii?Q?a3gFJhDZe51qsWG/UKkDJ8NK8BNJsf5pY+427WBiQ0xgMoBkO6hnb+ROBeJH?=
 =?us-ascii?Q?pu9lrL4JsJP1RKUph40k+EnonY9A0MCVqb8j23mbIR3ya0i9wjS3I/hqgVV0?=
 =?us-ascii?Q?RquXIR0QAzdbxBoBNRK9NSv83xpL1st8AtWop5w74hKVc0jSYOqNonQWvA16?=
 =?us-ascii?Q?057Y0VygMtny5CEyenEMYLvHzcSD3JDvOXToDbCGzUI5tlX86jhzCyPWSmOF?=
 =?us-ascii?Q?GsfKsrGYCd5R7037ScnIGgh5emDJKsjjucXNdNYt6a8ZZcOEusNzQ2Px7zbc?=
 =?us-ascii?Q?GPaNFxzzgNEKOWwSheUPwxs2Hqb76E4QyDzp2qOLnCAIsej6KkEpYKYdDL9N?=
 =?us-ascii?Q?Vn53HYNDTyF6eLkshG9KcYssbR+6wqUs+7p2Cfe/kjlEwMvQLODo+l8qTyhi?=
 =?us-ascii?Q?yjNFm9ZQTEpASR4eFgz/meMplFQ6EIwGKR8hxihDwobBe8xG9viyplZ3hgyT?=
 =?us-ascii?Q?2M6JDcq76qpni161G9ZlnfPpsWa+blarHkPn6s6cnAzXFVQhw+kuVXylE+mV?=
 =?us-ascii?Q?t7gkmxn844SBu0mJBsBksmjL0y6ZjmR3yeWi5hlEwWDQi6Vgu2dX0fbM2KwI?=
 =?us-ascii?Q?zsBfjvwoTL/RRM0/MhH45Ia6dsutGhPV7ZNwrmzpw1ABpC+1OB5h9bl6VGJ7?=
 =?us-ascii?Q?df0ErrmO+Z1dphJ6cDjImuHfMdqOJ+gFpVwlI9CAJIKA/Db/sL/z4u5XPm4Q?=
 =?us-ascii?Q?iLiRWOc+IQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5b1cdc-b252-4f4c-8969-08de919984b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 15:56:07.5407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WNToQNnVMxaUjWeM5nnfh1/bHMYB0gzdrP/f3WFwz0xgicosvd2I3rVTXzLNBx7m9cnAyiW9csTfLfaLsBx+hqGiP5BGkp/ZBxFXLWtzaEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15828
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30864-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,davemloft.net:email,armlinux.org.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lunn.ch:email,bp.renesas.com:dkim,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 2DDA439606C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> -----Original Message-----
> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Sent: 03 April 2026 14:51
> To: Biju Das <biju.das.jz@bp.renesas.com>; andrew@lunn.ch; hkallweit1@gma=
il.com; linux@armlinux.org.uk;
> davem@davemloft.net; edumazet@google.com; kuba@kernel.org; pabeni@redhat.=
com
> Cc: netdev@vger.kernel.org; linux-kernel@vger.kernel.org; linux-renesas-s=
oc@vger.kernel.org
> Subject: RE: [PATCH net] net: phy: micrel: Fix MMD register access during=
 SPD in ksz9131_resume()
>=20
>=20
> > >
> > > Hi,
> > >
> > > >
> > > > Hi Ovidiu Panait,
> > > >
> > > > Thanks for the patch.
> > > >
> > > > > -----Original Message-----
> > > > > From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> > > > > Sent: 03 April 2026 12:18
> > > > > Subject: [PATCH net] net: phy: micrel: Fix MMD register access
> > > > > during
> > > > SPD in ksz9131_resume()
> > > > >
> > > > > During system suspend, phy_suspend() puts the PHY into Software
> > > > > Power-
> > > > Down
> > > > > (SPD) by setting the BMCR_PDOWN bit in MII_BMCR. According to
> > > > > the
> > > > KSZ9131 datasheet, MMD register
> > > > > access is restricted during SPD:
> > > > >
> > > > >   - Only access to the standard registers (0 through 31) is
> > supported.
> > > > >   - Access to MMD address spaces other than MMD address space 1 i=
s
> > > > >     possible if the spd_clock_gate_override bit is set.
> > > > >   - Access to MMD address space 1 is not possible.
> > > > >
> > > > > However, ksz9131_resume() calls ksz9131_config_rgmii_delay()
> > > > > before
> > > > > kszphy_resume() clears BMCR_PDOWN. This means MMD registers are
> > > > > accessed
> > > > while the PHY is still in SPD,
> > > > > contrary to the datasheet.
> > > >
> > > > SPD mode: This mode is used to power down the device when it is
> > > > not in use after power-up.
> > > >           Previous register settings are maintained during and
> > > > following the removal of SPD.
> > > >
> > > > Suspend to Idle case, it is in SPD mode and the MMD register
> > > > values are retained.
> > > >
> > >
> > > On resume from s2idle, ksz9131_resume() calls
> > ksz9131_config_rgmii_delay() which does MMD accesses,
> > > while the PHY is in SPD. According to the datasheet, it shouldn't
> > happen. See commit e398822c4751
> > > ("net: phy: micrel: populate .soft_reset for KSZ9131") which fixes
> > > the
> > same issue.
> >
> > On my board, while s2idle in SPD mode, it does not hang. The datasheet
> > does not explain the behaviour when it is SPD mode. But it states that
> > it retains all previous register values when it is out of SPD mode.
> >
>=20
> According to the KSZ9131 datasheet ([1]):
>=20
> 4.17.3 SOFTWARE POWER-DOWN MODE (SPD)
> ...
> The following remain operational during SPD:
> MII Management Interface
> - Only access to the standard registers (0 through 31) is supported.
> - Access to MMD address spaces other than MMD address space 1 is
>   possible if the spd_clock_gate_override bit is set.
> - Access to MMD address space 1 is not possible.
>=20
>=20
> The spd_clock_gate_override bit is not used in the KSZ9131 driver.
>=20
> While the datasheet does not specify exactly what happens if registers fr=
om an unsupported address
> space are accessed while the PHY is in SPD, I think it is correct for the=
 driver to not do it in the
> first place.
>=20
> [1]
> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDoc=
uments/DataSheets/00002841D.pd
> f

For s2idlecase: ie, PHY is in software power down state you don't need to r=
estore
MMD register, as exiting software power down will restore those registers.

You need only restore MMD registers, when PHY loses power ie, suspend to RA=
M case.

Cheers,
Biju

