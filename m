Return-Path: <linux-renesas-soc+bounces-31087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD/8EZai12kUQQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 14:59:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EEA3CAAC3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 14:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9AF3301F990
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 12:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1478C3CEB9F;
	Thu,  9 Apr 2026 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kQ0df8vK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010062.outbound.protection.outlook.com [52.101.229.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9EF2749EA;
	Thu,  9 Apr 2026 12:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775739504; cv=fail; b=jwBlENeyeC/t612WZC9IHz2sMD5SAXRxoYE1VfK0qtSBRIFBavXu6Hmjnm2icVeVNeL91epTxiUJb1GxKOFDaarKcyNXNN5V+7V69eTyRhuWV1IQys3rWsVPcoAVJoOieSrjbDaVLBjrGNtg2sY8YaBKaqckL2BbT0+O38yHhDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775739504; c=relaxed/simple;
	bh=dp/eF4aPC7FQrT4AWaQ3PwmTmD2V3RDGmXvfL+KeeDI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EJYGILJjH6laD0aakpj+N7EijYRzN/aVOJzOvhoPxsttC6paWIq+0j1gHm7DKDmhejHRmlTiGlkT15pY5EejMvLub5E4QpS5lM/OuCJRrXXA1bY4z87o/suvau7jP6cUCNJjsGL0JvUNzcs6PVOStu55J+0mecw4alm+I/4Fors=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kQ0df8vK; arc=fail smtp.client-ip=52.101.229.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLAawz5et5DtOaM8XJSV/vhc4LwJ50YtVxZIue2oBpzizYduipN9aOVD/AOuc2hXdl+A/PhqPvOq2eQUNNaZrsCY9JDKGfXbBon22oCLuJ+idRt6IMwVCzSwojRdYIVHLaAcUrlN7e1hDRVImiBHho3GHJbNZZ4TRoAbfsy6tGOjSMy+9cyyd7F1W7H1IbViwA7TAoizvoSUV6yj+ezpH11yJtO7PRRGAszg8QMlkYvU20kJ5puI8YfJPCmUXz8lFcIqN6C+QF/+99s9ZE8amcuWQk0JTSZFxmXwZziN9AIDK7FCdksFIhgvbOBzcJSmc1gcDTD193v4maSHZv84Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dp/eF4aPC7FQrT4AWaQ3PwmTmD2V3RDGmXvfL+KeeDI=;
 b=Rl7Y9yVW3kY6EBodNWEqfpggjHLummOpmdmFMo1jKPy1nklZRTPCcHKDp1wq5xU2PlP4dk2Sdv1laAc9UHzi9/uSsw4pMWxehMarNzPzoHGlwtmYaSJKiSIpQw4/SUw3DPex6F3qVZVx/jTTWZNEmTozkaR1OED0n1NzAk+U9rFMR12o/m06HQra+bvjDaK+obgoWFkdog4lTUpoYo1PC+YZjKlD7hVEnM6Gf7/dgMBlsK7yc0ORWJioUmb6i184JxcNvjmyePfw1+8EFLRbOMsM+IU0IYIpRQ5dU+cHx1OVrX/CWRbjmhPZ8oa2+Y5+ymWTDsbchb3M044tdcPkjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp/eF4aPC7FQrT4AWaQ3PwmTmD2V3RDGmXvfL+KeeDI=;
 b=kQ0df8vKiLOl1Suvi+L87P7LUAAyXvoWUhETKUR2CNzfRO8+fy0TyPtOOd+qmXmO7Wzh+0ZErIm/13rDKSX+eV3yu6okFlI080imMPbQuKOWoZa3K+vlK0aDoXowUD0yx5PFjMCq8aofjDD/i9dRY8BBAFqzhrXQFk0jPOynfQE=
Received: from OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM (2603:1096:604:465::6)
 by TY7P301MB1908.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:38f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 9 Apr
 2026 12:58:19 +0000
Received: from OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM
 ([fe80::888:6ace:31a0:180]) by OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM
 ([fe80::888:6ace:31a0:180%4]) with mapi id 15.20.9769.015; Thu, 9 Apr 2026
 12:58:19 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: Russell King <linux@armlinux.org.uk>, Biju Das
	<biju.das.jz@bp.renesas.com>
CC: "andrew@lunn.ch" <andrew@lunn.ch>, "hkallweit1@gmail.com"
	<hkallweit1@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Thread-Topic: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Thread-Index:
 AQHcyAc8nRjGvx/Q6EiU8UtfsBhe6bXWguAAgAAEmgCAAAZpgIAAA4aAgAAED4CAAAL6AIAAB70AgAAJzYCAAAPJcA==
Date: Thu, 9 Apr 2026 12:58:19 +0000
Message-ID:
 <OSOP301MB1976EEC94EB340EB890DD120D3582@OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM>
References: <20260409095633.70973-1-ovidiu.panait.rb@renesas.com>
 <20260409095633.70973-3-ovidiu.panait.rb@renesas.com>
 <TY3PR01MB11346A0F047F1F7296B8F4FCA86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <add_krK3MC1-SSsV@shell.armlinux.org.uk>
 <TY3PR01MB113465B215559404D0FBD04AE86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <adeH5y5TiZdaK94d@shell.armlinux.org.uk>
 <TY3PR01MB11346732465160FFE9DCAADD686582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <adeNzh3eu9PSdEas@shell.armlinux.org.uk>
 <TY3PR01MB11346DC74FBC1043C9C0A27D186582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <adechY4Y6zUQkFwq@shell.armlinux.org.uk>
In-Reply-To: <adechY4Y6zUQkFwq@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSOP301MB1976:EE_|TY7P301MB1908:EE_
x-ms-office365-filtering-correlation-id: 676d0790-125e-4c5e-b975-08de9637ac89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 0E1zXSnFUsh5paqVgOc+wsAjK1sEg1okW8dJ+1cMu6NcwZ30R7eCraSKIxj/K3LMWFHVKN7O5UaG1siYlynsRnDipTkBPlBgLCpwNt+cb7bj4K43igN8iWUvMQV1U5QE1eBqUwsrGDyCR5P8qB+FYdPkM2OI8CEPPlz37ccM0KUjk5k+LpYaS75YgffOgzNv1Jnc2ARg6PcwBWVTyUzU/FNbUxks0xUeezZvoEjHZpEBgNvcUQWyA69e979DDElFuX1gz3I/alvdylftd5u8ZHmpKrCFXUdJILLVyL/KqKYojFAYbEC4AlquE2bPUkhgDa4I0/CpYtM9t8iKrsWVMshzKabd8God1oIEbg9+90LYUOX0/HaTOrCw2nS7m3lT2fEQgIAmCpJbV9/B2r784/r8KcD7oQiKRU5QvHOCuTHsbOg56FDgJzR3jQspqIVj4PYEFaP4Hza4qmDsTzpU2YHBFRI/fZRcsjFCbjqVHP38wdc6sbwO3rqYB+4yAgoCSheoIqqMoLeaY9oo39ZQdvYUt4IoVY3+PWfxzWKEbRgG/JkWds4FnSNmP0QjXABg3vcGWt4N8HzbTKY1ewiqdC+by8njTckEWLCG5nPR+aMxiD/GYF8NdRy7TECNr9nP3XcIMKkMJmGAd6KfNM2GACgasVocjBNkG55kPtD8k4M+aT3eO6KJyMDSooMQLfJetV0/riuCrr88iAICXLCSuqnugc1C9u/oQ+Ze21ZzOpk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SyMtkEZnRfzdvlHebdv/AyrADlyDx36DqwWsFdJCGlk0HCDXodmvz4JDipbw?=
 =?us-ascii?Q?1DsrqgxSYpmszip+u0+PO7I8XR8Cr3y2lLNzEN+ZSv5H3/fcp6nYBDVsVJSg?=
 =?us-ascii?Q?mupiO6R5EerU1Q37dAQSxFNZJAbwfpvzq8BgKdMghhM4i4OR2LkTgEdkfypq?=
 =?us-ascii?Q?BjrD4tqVSiYPccy2diHGojB5OjIAxqs3ap950BEHK9nOBUTtGRrph1GTeJHU?=
 =?us-ascii?Q?naS1aRpgHbodFHmnjM5z3FQ3z2TKwrCDmQMe47RYKjDLCiTk0B7r74UlV5xl?=
 =?us-ascii?Q?KOJCXlH/PKiuevvq9vAOXC4bMzRKc/2ddS6zqIV3GWC+auIU4RxOHnb91dww?=
 =?us-ascii?Q?2SuMugIpRk5SEH9fCqBKtuIl5RKo5OI260TEVQn3GRVly4Vtm3GO9gDZbaXx?=
 =?us-ascii?Q?AJu+iutjuHhrBiTnFoJn7lwZIMvzbpc60imW76jtemk0hmNBIdMm3En8uqq1?=
 =?us-ascii?Q?DMSGpa3OOW7MyB6XDzbWT497u8B0fJ2JgrBCoYjdhTMj7ftqtWIxZjJNUdVC?=
 =?us-ascii?Q?RfE4RGA8Yd9sePsv+mJHQsY9XZfHSplj+g/BK6/I2hI1+SBPrQMGKQBq9TEO?=
 =?us-ascii?Q?GUVFn28D3eBW/o7y+OpuFsL8Qqv6Tur3gduiNILSGsqlYhn9QGeRxGif0vpl?=
 =?us-ascii?Q?+/B84LyBpT9GLCXYUYliryzTFiKw/XbYEnfifpvL9yTkmPQkWRQBne+Nkojy?=
 =?us-ascii?Q?gng8898mMGKIZrUnDdh/sRj8OVC9hRsfDr182K4ub6VWkBeryJIYwfCtUaY4?=
 =?us-ascii?Q?V/usBjDHnkvw1O9R353aqRGhRgWZmqVZOg3wghHwDnOO132p1PAIbGz8MxAO?=
 =?us-ascii?Q?XfjrH2PZwy94EV2CB42Urd/bMcicp/ZZlwDC44CxdW1aPPooKydUND0ID1HG?=
 =?us-ascii?Q?8ygBA02xEOspo8cbc9ocpdPl0RDbN3R2KwIo8QdXSQcY4J3GKa51PN6BxUN1?=
 =?us-ascii?Q?0WJBeHXRK+VE21qtYaM+lmMV/qvnn3Vfgd3zGSIsft3/BqcerqHivcLofsag?=
 =?us-ascii?Q?EE2fPl2vryCOzn9u0DbDr8ZV7v3BujOWMMcTjQEMntTtZPMfmajlWuGCVUM7?=
 =?us-ascii?Q?fUG8oXCArgTBGDlGx2zOJdUkenD7E1X9ty2ztSMzAPJ9tj4nTqSvqwpolVGp?=
 =?us-ascii?Q?1ccNhMCw7x02QI2ARHsyZSEk7ZPUPibgYxESNkaSWQx/Pdt1L3zqsirzqOm3?=
 =?us-ascii?Q?LbSKjR62r0c8fiLFFw2gdDCsXS2pM+aFZaACelHlh0x0BjJK6vmMQK0ttITN?=
 =?us-ascii?Q?fhBBsjII3SIGK+Ay3jxtWhKsRvtn7o01hJ3DS27NzKUhvCyITlUMsdS3o1Xc?=
 =?us-ascii?Q?QK3ZJCEK15ZDE/7Iy5w/iyUenNfVEvehN3T8llTVW4u3ujToMCGue2WpWkle?=
 =?us-ascii?Q?yjNZZiFeqbdJIDW3NV1CtwnSePkpGRJy8duAFSGlQJV7MLaAXuhq6+ktqedg?=
 =?us-ascii?Q?M1FpGkcgsK1SvrVelQwtuJeDpd7ed6n/qAZtvG9GjvDS/gCNxVZMv+3BQ2JY?=
 =?us-ascii?Q?mUizhOYwBErABtT/SGGQPSWO0n2Aeyvp8hBjSaqdXSoSCvN8kjk55rtw1qno?=
 =?us-ascii?Q?2ESKXw65IyR785njedpOuz1h6RChUlPFOqNWdQQUbzRPe2CGRxgChfONwade?=
 =?us-ascii?Q?ceHR9wy3Kasbqz0tYKUKsC40/HP2XSnbLrJTZR3DWL3ZEp+8PwfFOJB+w7RL?=
 =?us-ascii?Q?lYmxfCqKr3nkT7N874VyJzR5Be/Koe+xOkvTFKaKNVMsp8i3nvkj1NkblWfz?=
 =?us-ascii?Q?D/4bIzXI1XeOrR78B2DaLhy5E9Hnn1o=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 676d0790-125e-4c5e-b975-08de9637ac89
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 12:58:19.5017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wva+mPkrJvpL7YHwCRUHHWHy2xUeEGB2KOgUUaHR9Kfxp92Tz7QSrszNUE/TydPkNRMXVleM6gJU+edOVkbl6Klt4izI3pO3mCYcUJSjGeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P301MB1908
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31087-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:url,OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM:mid,renesas.com:dkim]
X-Rspamd-Queue-Id: E3EEA3CAAC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell,

>=20
> I think we need a simple solution for 7.0, but subject to Andrew's
> agreement, I think we should consider having phy_init_hw() inside
> phy_resume(), and a series of cleanup patches that result from that
> change, including getting rid of unnecessary code in micrel.c for
> the next kernel cycle. As I say, subject to Andrew's agreement, please
> can you look into this. Thanks.
>=20

I think the phy_init_hw() should be inside __phy_resume(), as some drivers
call phy_start()/phylink_start() directly in their resume paths, without
calling into phy_resume() first.=20

Some drivers also call phylink_resume() in their resume paths, which goes
through phylink_start() -> phy_start().

I think this will cover all the cases.

Ovidiu


> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

