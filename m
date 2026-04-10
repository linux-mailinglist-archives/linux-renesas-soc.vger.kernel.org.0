Return-Path: <linux-renesas-soc+bounces-31161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I+cFTQq2WlumwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31161-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 18:49:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A966A3DAB40
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 18:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99D94302FA8A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 16:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2E43DDDD1;
	Fri, 10 Apr 2026 16:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dh+nW7cb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337553DE459;
	Fri, 10 Apr 2026 16:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839280; cv=fail; b=eP+TpgR1ha8T+458Dp3ICHYvdniioQC9SOEKcJbczC17uYAQsR7EQSQuk3Qa+68gTIcaaKC45mLjTT7Zxzm/ivFiPuTIgRz013iiuYsfgWBatn4PIJI50ZHJ/LbmfeCcuv8lOFnGfVCCgdYyW1ZexEA2qbqHEhiappJ3H0LcHuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839280; c=relaxed/simple;
	bh=j8pRbDMLJ2xfwfHIz1eXly0gaTQoWwYuiL1VT0HIoms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IFeu/JwCzvQmyh498KLP9ejz6i2rGmPjS+3ugMqBalnfYN6dmAz84AECU0V3GFL67JUH9dYdFx6Ualm5wIHGybMHdz06wh77HhxPqLRxU0JBoSnihvBhUoq2hieXO0BlwYPKP2hX/dnboTxq12epjMl8hZ0EvM3Z1NbjuiJtb5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dh+nW7cb; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ia8ajEcN5Kv76xIPPaq173DaiVLnJUZTIR0HHso5D88nP3wiZF/e2KxVlnO3mAQN4j0Op9rBMH7qDAtp96AASIGw348k/J3UGleR+iJuOZ+eYQde6zwXHK2rAJPJ2zDlJ2LgrRP6D7JxUiDBJmZeh4rHN236D4EC6XOIfzA7lc/hoRpjfwcViytKhBL9Lh4ZWRVOeZh9dsX0jDaj3uywoFFK250qmkpXVrGHRtnYBAeCTpqF+IU+l/v5SCcTnem2IlKyWcVPanDj2QwUElRCq6C5Prw1DX43lNr1+l/NnKGVs/tyjTvS89JqalnSHitgTpswRaareplOz7iuBAXhxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WxWBkhJ1U2QJdkCfxYC+C5BIW/Z5J+j6tWxdtsPDyk=;
 b=sa1bVvG1tcU9SsZ3kywn3ggaNyLAyoAg+B0AtoDOeFbsqeNbMFOVb5fawNzTuSyxFQc5qR+Vogv7IDLWP6wT0FP+SVPvJgZm2oXeY16RK+CjYvV1h7/pZR2P15pql5Sc8kro8HElj6xN9Xh54FhX/Jd8B1YvmiL9oVSPGKVwWZUpVWW+TNs6F0vWseuHWkHA3bYqRDld/iXKC16XFKS1HLS4U5WVA0zkEXVNXusWcaAkuxytC10+BKOWpxbO/ZJSbXYrF3TCRZLNrz/wHCfTO6kY4UQQDCQQzNMdY/E005+vJep2LFpvbxFgD6Kd0NMlJzneuWyTuBQhRtgJ6jn4uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WxWBkhJ1U2QJdkCfxYC+C5BIW/Z5J+j6tWxdtsPDyk=;
 b=dh+nW7cb3dBOE/NOf9NhQt5nAoS3a+91rUMsQ5rlouA07WvFT2m69wb0d2DtSoGS2bgDiACjBk+P28dDktp97Xb2NpzKtO0KS73TF5/ahl2wYLSvXhkLrBNAQ00DTlBE4WSiRHmglL74fjQQ4Vl0Dnc0NKSDlWNcrYYy+DRdWZ0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12431.jpnprd01.prod.outlook.com (2603:1096:405:103::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 16:41:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.043; Fri, 10 Apr 2026
 16:41:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>, "Russell King (Oracle)"
	<linux@armlinux.org.uk>
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
Thread-Index: AQHcyPZnBK/SG6spWkirTeqviN9wXLXYYQwAgAAGuICAAADOgA==
Date: Fri, 10 Apr 2026 16:41:08 +0000
Message-ID:
 <TY3PR01MB11346B6680E5952BD7B7078CA86592@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
 <adkOZl4gt5UoGv-0@shell.armlinux.org.uk>
 <839fec66-5ec0-4cc0-a0c4-ae2de6902188@lunn.ch>
In-Reply-To: <839fec66-5ec0-4cc0-a0c4-ae2de6902188@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12431:EE_
x-ms-office365-filtering-correlation-id: 89ad0d0e-4e8c-4a26-2b13-08de971ff75c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|18002099003|38070700021|56012099003;
x-microsoft-antispam-message-info:
 hr+UNl5MTQImCJpWkpuNDmDYIGOAzI4bJnYFd96sot35R4k1nZF0sLPiFd9Ge9Q+nfaZpwn1Sd066rfCzSZMj9ooIMOn9C0q7lySJcnZ54NtJlNM+R2eenCs9aVuVJg2SccET1Mr26NIQwVz6sc43RXegVQA90fsaa3TYo3jJfOFHu22ALyhBHr94QTUr/2JZBobh299yJOwIfX3nxZ+3n/KDf49n8kSuV+ZYGDwNdyUC20FcXNsGIHEwNO8EMacJ02tS/DwypucWa3Pn5gsmqnz9KThSnll+STGRj8uw3I62HMUnQA1tyusv02eAgEyBpsQZtBsp842rMNfWowEfWVV/7B897yPf9wGbCzIvRtbwNLkiEFaoZGdTUdjcv9I2sCnVIOZ7kevTefLtPav5EHjzitQetjwU9d8cY7G+qI6XBy2HJ4t7e8ybDcb/sSvbxnBSJGGLb58BgJNEszDo7b2PHdiOzwWyz+6QyfWYnBSa+9WnIKRE60imlrBnAV+zQwbjHVLJ3Bzxx+CAn7Fq+oMqBXj3XNnnIPwQJ+vpxwWh02K0b1HWBA52Mh4AHK2mEKZ4vRaNPMba13A9p+PtN+lEtQmfFTLI1aF6n1odS9SUfZuyHI7Gw2VhsguKmD90itn00bexRTuyYgJMPeSGC1vmptsdQxt4gGJ+HB+63pGgJW2pzr3MNBf8dcUtHMzru+39Q2mn4/F+WLdzqYSbT3mDprlKa2eKzU4vbHHy10Q3rZ1TeT133eKx8ceDCXWD9oVb45uvhKnvusvlnbRS7bUDeI+ZSGWjjozcVUnzic=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2sHrQ9uHNEpgWWR5rNGV//BBH1Zfj8/3ce8qpHlek0U39m7WHoWEhrChdTq9?=
 =?us-ascii?Q?/GgEPpSgCwopr7PHDc94vPEwt7L2Zcs5Rsu0RKT+suJJQ92R5Zroj6A68gRg?=
 =?us-ascii?Q?VpzxRFu4Gi0/5SxBY94RY+cmeMSHqhGYD72OLVRvoshNhsxFbn3NvXwLSn3E?=
 =?us-ascii?Q?3V0HyK1nMUIfMRTID1gcVQ6KgD2pDeHb+qFdBhJ8xQUkL8d39wLVpnXr+3h6?=
 =?us-ascii?Q?lx8xAYYuN4jEzFFZBaAc6xmqC3IB0+7oMtiiYOAwfIpjqzftU1F1XgJeb5BL?=
 =?us-ascii?Q?DjdynmwBmrsiZEkbsAVbUkXegXBQgxmOcdR4s8HFQccEy9G2YM+vcVmbpjuV?=
 =?us-ascii?Q?NL9o8VygWJBxwJItn5TWgIRlCAXhI9dPX+sZVUpw4MJa59xi8yf6jQYldkXk?=
 =?us-ascii?Q?+GZTXKlZmSgMlba4yelsbjWFV9BEcrRnD1sSGunRdKjfvVmuTwA55rlg9I21?=
 =?us-ascii?Q?8swfvmFd+4EaLjsQcbtta0BXGJbttcfr32qDB7KEKzTOjHw/xMksYxrOB5Yy?=
 =?us-ascii?Q?YJLxxyRUrGrdzWw0188ZDrUuG6iD8KChHp6o+NMFjO8Y1vUaR4+YGRdihEad?=
 =?us-ascii?Q?3/YgrspWStmG4Gx+5IEYQmaXWvelm/TxXwCi9dMTieDTd+2WbKmMU1T/9yiV?=
 =?us-ascii?Q?0tguDg4Cdf1Cgk8bbd1Izt4nF2sfI9b7zRfaHhW7dLOaNa+cvU2/ybUYbVnY?=
 =?us-ascii?Q?tGHJW1VrkEoNNYRFWtJ81OipBmd6lttMddmbkx7zjMomvoHztlR1tblz67TZ?=
 =?us-ascii?Q?M+8zZFvM0c/UhcS2sWzQ6kQQKEJvP0C6tZfOHTaA9kd1FXMIf+TEReur66y0?=
 =?us-ascii?Q?oUiN1rkV9T2c7R7ctHFSIudb+woxufcrPChc1l6iKQbPZQlTyVLC6jTsKq90?=
 =?us-ascii?Q?Nsyrmqhmzci1HnWtpRlL2UyOVIvGLnjde4bdf2A8zKzWoNgP2maOmzYvr2mU?=
 =?us-ascii?Q?GNwmQNrIewy2oluX2JljEQB19+EAoyWxQbSD6Yyrc9iPdRa5WzA/ddj5Yp9+?=
 =?us-ascii?Q?+6G3kOUnxzbfKZks3KU+F+HBMDmpfPThbIg+Fqg9XFg4DqrW0OnSiLJrhyST?=
 =?us-ascii?Q?Pffps0ZwNmitJx3LKJWjmzwOG/uy37ntFE5k0xyGS9jrv4zB9dHtT1yA58wz?=
 =?us-ascii?Q?6WYNU4H0eiIOHdcdZg8vszcZG6TdPR0/VUWlKwVQ4y7eARu7dJKgGDQEUS6k?=
 =?us-ascii?Q?M0NteC6wxI9Fw87MFCqLo7sbcvsp7oPT9dAy7I4imICryohDBinPjGjInuyS?=
 =?us-ascii?Q?E88x6z606VJp0C2do/kXVdO0J60Ch1hX6a1tBESEqnGY03K+F8x7g7xBlznj?=
 =?us-ascii?Q?Z8UEe3blfOBPAqxqzoUOmJkasWAm5J5NO7yVAx2gWiYh6c9pfHKUwWt6BFXB?=
 =?us-ascii?Q?mLahYumhOAtIanLxgOHfNs4TXzbf/FDK6o6Y6/5krHgy0dFIHZd24PWYJR8H?=
 =?us-ascii?Q?zvgLuv3kZ0fGaTGn/aFz88g8DtDNxAU0ap4Ukk7gbha3q4RWJIpvnR4pptiq?=
 =?us-ascii?Q?3DjskG62U/TBQ8yuObX2vD4jJ64EKKDCVcpbZeJOPE/ZhGKSBgiNeawGp9gF?=
 =?us-ascii?Q?FlmvsHPyZecmy3JotSZAgqigVNwlOB/Byz4MnWm4F2z/2D89vTKp1vxZBZ9W?=
 =?us-ascii?Q?zU8W8Jnr6nhCkH+SAMYqr1kqvcmYpSfl2gDa8YkwPtz9dyDr6/3KtvW/OEzV?=
 =?us-ascii?Q?KeWYN9VFchVd0x4ijnrk5ZN91KMKFo3PSLPk4Kmi5jT30tklKg4zIRYoxfYA?=
 =?us-ascii?Q?J+dMWbZPUQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ad0d0e-4e8c-4a26-2b13-08de971ff75c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 16:41:08.2696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HaBov/FsJLyw7d9OsSxqjLI8vLOcY2WRDzr27rjwI99tpnmUH0l8kNlnWqzz9gdbxhVWLH7x5q/sBUvOkVz1Z3HMrQio3jCtpbUGniwU1Wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12431
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31161-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,lunn.ch:email]
X-Rspamd-Queue-Id: A966A3DAB40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: 10 April 2026 16:15
> Subject: Re: [PATCH net-next] net: phy: call phy_init_hw() in phy resume =
path
>=20
> > Apart from that, looks fine to me - it seems some paths call
> > phy_init_hw() can be called with or without phydev->lock held, and
> > this one will call it with the lock held which seems to be okay.
>=20
> Haven't we had deadlocks in this area before?
>=20
> Please test with CONFIG_PROVE_LOCKING enabled.

I have n't faced any issue with micrel phy. But my collegue
got the below issue with Microsemi phy. It doesn't finish the boot.

drivers/net/phy/mscc/mscc_main.c=20


[    5.125699] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    5.131849] WARNING: possible recursive locking detected
[    5.137996] 7.0.0-rc7-next-20260409+ #614 Not tainted
[    5.143847] --------------------------------------------
[    5.149991] swapper/0/1 is trying to acquire lock:
[    5.155333] ffff000182bbe7c0 (&dev->lock#2){+.+.}-{4:4}, at: vsc85xx_con=
fig_init+0x68/0x344
[    5.164771]=20
[    5.164771] but task is already holding lock:
[    5.171520] ffff000182bbe7c0 (&dev->lock#2){+.+.}-{4:4}, at: phy_attach_=
direct+0x19c/0x3d0
[    5.180984]=20
[    5.180984] other info that might help us debug this:
[    5.188237]  Possible unsafe locking scenario:
[    5.188237]=20
[    5.195089]        CPU0
[    5.197914]        ----
[    5.200670]   lock(&dev->lock#2);
[    5.204425]   lock(&dev->lock#2);
[    5.208273]=20
[    5.208273]  *** DEADLOCK ***
[    5.208273]=20
[    5.214920]  May be due to missing lock nesting notation
[    5.214920]=20
[    5.222677] 2 locks held by swapper/0/1:
[    5.227217]  #0: ffff800082f051f0 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_loc=
k+0x1c/0x28
[    5.236041]  #1: ffff000182bbe7c0 (&dev->lock#2){+.+.}-{4:4}, at: phy_at=
tach_direct+0x19c/0x3d0
[    5.245880]=20
[    5.245880] stack backtrace:
[    5.250824] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc7-n=
ext-20260409+ #614 PREEMPT=20
[    5.250840] Hardware name: Renesas RZ/T2H EVK Board based on r9a09g077m4=
4 (DT)
[    5.250847] Call trace:
[    5.250853]  show_stack+0x18/0x30 (C)
[    5.250876]  dump_stack_lvl+0x70/0x98
[    5.250894]  dump_stack+0x18/0x24
[    5.250910]  print_deadlock_bug+0x220/0x234
[    5.250931]  __lock_acquire+0xe10/0x1594
[    5.250950]  lock_acquire+0x284/0x400
[    5.250967]  __mutex_lock+0xa8/0x804
[    5.250983]  mutex_lock_nested+0x24/0x3c
[    5.250998]  vsc85xx_config_init+0x68/0x344
[    5.251013]  phy_init_hw+0x68/0xa8
[    5.251030]  __phy_resume+0x3c/0x98
[    5.251047]  phy_attach_direct+0x1a4/0x3d0
[    5.251064]  phylink_fwnode_phy_connect+0x98/0x140
[    5.251085]  stmmac_open+0x120/0x38c
[    5.251103]  __dev_open+0x13c/0x280
[    5.251117]  __dev_change_flags+0x19c/0x21c
[    5.251131]  netif_change_flags+0x24/0x6c
[    5.251144]  dev_change_flags+0x48/0x80
[    5.251159]  ip_auto_config+0x264/0xec0
[    5.251176]  do_one_initcall+0x7c/0x4d0
[    5.251194]  kernel_init_freeable+0x2b4/0x33c
[    5.251212]  kernel_init+0x24/0x140
[    5.251231]  ret_from_fork+0x10/0x20


Cheers,
Biju

