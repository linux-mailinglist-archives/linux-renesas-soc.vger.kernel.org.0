Return-Path: <linux-renesas-soc+bounces-31276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H5rLyeM3mnZFgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 20:49:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F388F3FDD07
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 20:49:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07FEB3011F25
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2026 18:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6C41A0BF3;
	Tue, 14 Apr 2026 18:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qzLjqbLN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518A717A586;
	Tue, 14 Apr 2026 18:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192323; cv=fail; b=FrDUQk87Hgx6eBL3JMvdeJpezy5IefbslyQR6OcxuQEBLUH3Of2FIqIXnt9sBVMaQML/scebLIDhi96IhQaLxw1PYZtMQvG/MP1zW5XH6UdQsF6kIavnaNQIuBBpHrd2WB1NRf1ZRGSVNj3N7hmoz8vhCCey7TyK9HQO0oqyUi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192323; c=relaxed/simple;
	bh=hpvSq8EBd35VV12sHzRJy+GVHwfMsvChol+ZFq5xAlM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nr3+iTqxYRdh3H2hNOAvWIl8U/rZ81sSDFT5Qi0juCVecaHS46gC9wLHHND85fVJasW7KQlY4IxTUGn3LMa/1QYyDpqg3MzVxrDKhYv25TZcoCJDbUJVnykYPtIYGJaOky4FT4OqgocwhHGQYfUbL3pRgMvUTzDBlUbxPHgNP2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qzLjqbLN; arc=fail smtp.client-ip=52.101.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LunC76MDz6vQuNp4WHfc0UCRYN4tb/rDdOhcUh9utfKtaYKRxuzEnIslykvf6KgqV1BiHbpJWtR8GMGJqEkG/Nw6L43rCjPxSrtK6gRuFULWJRR3I9nzPtkhTQ4q3tuPTOWrQIkow+j8hPv9cNzP9YnNtpni1M5VypQAe+VWRuqX6mHrV2wo/05vceFeFcakZ01A34st0ERujZCZTRDzN93hvtAfwbg4mdzmnccrKAceLEvictsRgVm5OkIQp/QmKChSwnV7TcSUFWEx6mCY1dDQm8OfceHfuS2jiPgh8rQ+rmMf5A6mDmULZEwVk4zvYOJ/+lBhHcHCECSEl7MqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6+JkgR99FopAq64NRlijl4vKEq5/eExECOE9vYp0/U=;
 b=EeAJw3ZiFgNr0KO1nZZ8sgiDIVWITmdrxppGCOJwXLmVlBeW3t82cHDy+J/kgD9FKBMYnnvoggpXx29UQgjj5f7VyzhBw9jDLGT6NH4pe4WS0hhFhX5Tfjsk+rseI2QCrzPJpiBdjqf2ifmCHSUc/kTmXJmx6LM66sqWX6yXc/2c528jB/6ngCbRnJWNp7eN6t9HhdZURaEqNpnEMBjiW9j+POQCzvvrsiKCotLmNBKJvUMdocgeKB//xC966uHz+SZIxPPBScEapOuM+7duTbxqvjrVdXFc91eTB+2uFWhHxjCglAC4XYnGEiJXDgEyiA7FBym622qlieF+fgQ/jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6+JkgR99FopAq64NRlijl4vKEq5/eExECOE9vYp0/U=;
 b=qzLjqbLNoGymXQjkrLkC3292DR7fxoi++KLo8bSd8VxzmPU6uklp4gCG4oEPtS/sifyj+XzJx1+XtfYk6h8619GoczH+NSQzu/0VPM790oQMdzceqh68xCl8ICK/PkkxCO1+vv/rv5rpv6fSGE6Yr6lBiO8DgNiHTTss2UfwuZI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12348.jpnprd01.prod.outlook.com (2603:1096:405:fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 18:45:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 18:45:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>, biju.das.au <biju.das.au@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next v3 3/5] net: phy: mscc: Drop unnecessary
 phydev->lock
Thread-Topic: [PATCH net-next v3 3/5] net: phy: mscc: Drop unnecessary
 phydev->lock
Thread-Index: AQHcyoTB6Qzy3AZenkW4KT4fOxSr+rXe2JuAgAAPv7A=
Date: Tue, 14 Apr 2026 18:45:17 +0000
Message-ID:
 <TY3PR01MB113461AEEB0280D6332BCC99186252@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260412140032.122841-1-biju.das.jz@bp.renesas.com>
 <20260412140032.122841-4-biju.das.jz@bp.renesas.com>
 <ad59y5ZfJDKFo3eU@shell.armlinux.org.uk>
In-Reply-To: <ad59y5ZfJDKFo3eU@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12348:EE_
x-ms-office365-filtering-correlation-id: 6a8627c2-99ba-4a7c-f688-08de9a55f8da
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 /0qoQ6ysc2rr0GLM9T6V2h/b+L+MUaw53XIe7AzyV5pzuIDQJtYhLLGL2vVBfY533oF1bnWI3zsW/8Dhn8BLCrYCHrKmqjZtpiqXSN6jUc5bOO2WOF1tI1I0EPkKVeYjcZpa6P6ePn+MPlDkcvN9JbWzDWQSixViUy6n6QhFQl6ZtWeBcECuD73qe4QGerghA3hU6LRctcy1TOCVwHmKo387TdTr4do56wgvzqSrnTQ3wt7tZXATiyzX14S0joFrbX4oD4tZKMynhAuv58/6kxiG0rT+FQeq6EDxyVWUCUL3h/zzotgnWCQd2i2zEobZrJR+HfV2aeVKqy6bVl9rPLSSWiKD/KeqwVvG+mf7+c2YSasA5H2buuP2wUbmGrlHOos6QnCDKlyora9vT4u9cCd+e7ZNM/Mymdx2T3Rw7K6SV+bAu1WoNadgzKsN7SyTn+5hAechCXAbXET9lAUlu8vbYuIclt0deTZWNrki6rJQi2QLTsUAoyJ2NzJ2qkE0Wq8UM15sLRVOLD/XPRfrn9tyu3iKXp5J4BXSFwtd0P0qoY40H8Yh6yLp5lncEEhbV9OLDACyNSL78hpi9V81qkaisbgvlAJZFXnGgJM8vupl+bUn/X7tKL8+71nfQr6NGcVvtoL/RC6aEmQcMM9XWSrd24b0UVUJo3WkN1UVNGbczh07KbTA2xAe+9scltVKfhT3WnjrFac7aqHQG6c/zQjP7syuFqTN5q8+7ZNdXV/vqOkppOv5tNYHyaBAnimfO7hkAHR1NUaNz8bOZpiDBAXP1nEGkMRAzQICWfMp6Q4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5NoL91BqBYb6ivsqWDsTC04HMIFUICxhJeR0RS0SMGVUoNup3+8nL2/SyZrz?=
 =?us-ascii?Q?Mw1dyL0X1McoeKnkUDl5XoHRl1vFeZ8FtnXu77yiqKyRNHZj9wJVLBV1tWhE?=
 =?us-ascii?Q?mg6Q83IwDLUIp+vYIQIalyNaPofmP4304t0qEHmy4MI37LeMFLsARB6nz18f?=
 =?us-ascii?Q?S895sHmcllkRHEuVyWPMaBXtqmdImx9n/O7ZcdZfzA8DXI3EEMhGyQz73GjU?=
 =?us-ascii?Q?0NFoTdikciOPl+Aj1iZmfCFmporLFmCts9JJFoc7a76scpRqPjnWhHiAE++t?=
 =?us-ascii?Q?TRRQbXrF8tyvMkzQUfebUtx75JX3MRXTY9Ztvyzhnyi4xvvctM1k5SEkKwFd?=
 =?us-ascii?Q?7wMET8Q8dv4V5z3xxPoZe/D5Ao6syed5c3AwspE+mZJHICqX/wJCgNP4iJ+P?=
 =?us-ascii?Q?/6i5eN7ZZ5eaJZN3f+4Ae+eWiif3uVvGZ0QoFjXrgMs+AymriEH6QkBL2Hke?=
 =?us-ascii?Q?MQsd0j03xfEznvz9qyJD/vT6HeaGCfvodm3VXOwyc8hqlHbfOvL7xKZy4UNK?=
 =?us-ascii?Q?jdk6zhvNuV7WTREd1+BsAWhhpJYBo45eQcUl47xv4hDUNKu5CckF3O56gb4q?=
 =?us-ascii?Q?bG5SFTPpfBOi7Hwbvxm9vuO7ij8OiqQYJFhluPOodVVHbzYkV3W6rkLBSVku?=
 =?us-ascii?Q?gz10ha+4aEncNxfmTW7TTFMOJvoxwgZGRbKE+1QEe2L1xYoL8XBsx3P16/SJ?=
 =?us-ascii?Q?GGZzPdifO0R+4vP1t4cIuupwSRJBxsDrxQ+4ENp7hynBA2Qpv+YxH5sy83nV?=
 =?us-ascii?Q?DjkFlMOGLv58586dQfHWkFnqNJ2SY4fmZroBfB++7629KFIlnHcqBlgPetQD?=
 =?us-ascii?Q?RtiR4+bwCUAAoVOMzi8v3+kp2UYvQebGNPkP89V8YwowLhl4KZVacaahbwL9?=
 =?us-ascii?Q?flJNY+T4HCZe2tCgEtT/UYkFhCw3qAkWGxBCC/sdAgifybhaArNtuPlbKsHm?=
 =?us-ascii?Q?LKmKpBz6glCtmXI0yWSalocF3K9YclmScjhjjW4627V0iYoDc3w9RlSPwB05?=
 =?us-ascii?Q?hWcbFQ0EG2N3zq0wjz/IjCiZc5JM2GYqTZoK90eqNbqkVXFNkjG7bRhicLMK?=
 =?us-ascii?Q?/COo55od/48vzHtG1kGUC3Sa9Ghbfab8SBafUXVYh77sTtZz21bFIpFO1aww?=
 =?us-ascii?Q?qsdgkmt4rG4w+ySs4ujMh5AHOgsGRg6Fb0khIZ50Ow0+fRgbxxeC8W8qI6np?=
 =?us-ascii?Q?4KgzOdjJbchu7cHaSDRT0JYV2Xu+d01+UbTFrgbdHF0oNxrbQ/DnBHmluyxV?=
 =?us-ascii?Q?VK0BRJBFbMnC/VfT+D83tEDnO56+yIjfE1NXNtVctdnOdlF5xket0dBmx6aP?=
 =?us-ascii?Q?A4d5jgRwKp55wROcpAzUnRFOwIhBMutFLz79Hdo3SKx8ROEEWRtdOEXgcIUW?=
 =?us-ascii?Q?fvhw4nElp63D+7llkUK0F6yh6HZpaqfWJM5jCM35AjHH8oaehhmoHrW1LkVh?=
 =?us-ascii?Q?YvFzd/tP2ICssH9jPP3Ah2HjTU6glwB4fi8M7kZgRYyzvV8AYl+IsTOamp8c?=
 =?us-ascii?Q?axpN40RW1hdovTWjPyTBW+P30Z9ccR7Stpcbz6C6TbIRKDT8VVawLWin+siu?=
 =?us-ascii?Q?7Ct1T1iNytSoGp98D7/AsfQqNrvF43LYG2Lqo9FB+fw38gR5TycMfQLg7dYk?=
 =?us-ascii?Q?DrFSjHJ3azlwhQ0Kknrj3VnEvDKa1w2W/6RPWH74cuclTkfLagnH1PUYXD8/?=
 =?us-ascii?Q?bSAXbqjXY+PG2+T3fJ7WPw7oMFa+zo71VHtXJIsMdGtcIr5cnOdf0loIKsOF?=
 =?us-ascii?Q?UocZa8jkzQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8627c2-99ba-4a7c-f688-08de9a55f8da
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 18:45:17.1145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZaTVYaS6DT4CE+eoe4+U7FgCx7cloCBBXBDmmAtE7NlMZ2kDubURWGSnDK3MKcYUevrUXGdCwl7WE+zXeUK4gBOb5Kn3w/o9pO7hhqgEUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12348
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31276-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[armlinux.org.uk,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,bp.renesas.com,microchip.com,nxp.com,vger.kernel.org,glider.be];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F388F3FDD07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell King,

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: 14 April 2026 18:48
> Subject: Re: [PATCH net-next v3 3/5] net: phy: mscc: Drop unnecessary phy=
dev->lock
>=20
> On Sun, Apr 12, 2026 at 03:00:25PM +0100, Biju wrote:
> > @@ -486,15 +486,9 @@ static int vsc85xx_dt_led_modes_get(struct
> > phy_device *phydev,
> >
> >  static int vsc85xx_edge_rate_cntl_set(struct phy_device *phydev, u8
> > edge_rate)  {
> > -	int rc;
> > -
> > -	mutex_lock(&phydev->lock);
> > -	rc =3D phy_modify_paged(phydev, MSCC_PHY_PAGE_EXTENDED_2,
> > -			      MSCC_PHY_WOL_MAC_CONTROL, EDGE_RATE_CNTL_MASK,
> > -			      edge_rate << EDGE_RATE_CNTL_POS);
> > -	mutex_unlock(&phydev->lock);
> > -
> > -	return rc;
> > +	return phy_modify_paged(phydev, MSCC_PHY_PAGE_EXTENDED_2,
> > +				MSCC_PHY_WOL_MAC_CONTROL, EDGE_RATE_CNTL_MASK,
> > +				edge_rate << EDGE_RATE_CNTL_POS);
>=20
> This one is fine.
>=20
> > @@ -503,7 +497,6 @@ static int vsc85xx_mac_if_set(struct phy_device *ph=
ydev,
> >  	int rc;
> >  	u16 reg_val;
> >
> > -	mutex_lock(&phydev->lock);
> >  	reg_val =3D phy_read(phydev, MSCC_PHY_EXT_PHY_CNTL_1);
> >  	reg_val &=3D ~(MAC_IF_SELECTION_MASK);
> >  	switch (interface) {
> > @@ -522,17 +515,15 @@ static int vsc85xx_mac_if_set(struct phy_device *=
phydev,
> >  		break;
> >  	default:
> >  		rc =3D -EINVAL;
> > -		goto out_unlock;
> > +		goto err;
> >  	}
> >  	rc =3D phy_write(phydev, MSCC_PHY_EXT_PHY_CNTL_1, reg_val);
>=20
> I would much rather this was converted to use phy_modify() as well so tha=
t we ensure that the update is
> atomic.
>=20
> 	rc =3D phy_modify(phydev, MSCC_PHY_EXT_PHY_CNTL_1,
> 			MAC_IF_SELECTION_MASK, reg_val);

Agreed, will use phy_modify()

Cheers,
Biju

