Return-Path: <linux-renesas-soc+bounces-31081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLr/KFaL12k3PggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 13:19:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B7A3C9965
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 13:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C7C4300833C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 11:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466E93B2FF2;
	Thu,  9 Apr 2026 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="beazelp6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011033.outbound.protection.outlook.com [52.101.125.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74BF2D7817;
	Thu,  9 Apr 2026 11:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733588; cv=fail; b=qSERiyDkoV/+yS8F6wgX8aflDWkpqsV+bNtSF9MpDAhfDATNK2a2c0ZWxLEtuKqMVhtImdgiMU9ccs8muPN82O6OHVn5Fwvh3znLV1BNpD68HWFsmzHVxVVODRGLFzKEY/7k6Bl+Azcsy784J6GNe4VlNrZ2GgaJw4iXIyW04aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733588; c=relaxed/simple;
	bh=Jox3yqwnw0EZQIZDR/PesNgOcbd4WE5s5tGOime4lsM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GG1XHl40lyUksEg3UAv9u4QWAZlSeV27yc7YNx4SjdRHekbAGsPtxS4lOlPD7lIzjW0oAewM9ZuK17sVL93ycbM8nr/lo2eXa9vNe5UqSUvx1Tk3AscjmBsr+Z+gSYj75MGDHaCiW6eXrhua4V2sNbg+J9pzrJpYSeL62jIBfg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=beazelp6; arc=fail smtp.client-ip=52.101.125.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChfIlL468INSwgqbddB48KkkDNV2Liynoi/PkbvtYrtr689ImWBC6Co8Z84gBL6Dw6wQmlQGws1FJmj7+o30Ega25rybvQWdrf5lRiwYceYuQbDIUf1QCdi6p5gE7/18Exrkq2dATngO6A33T/9i3jLxVtdT3NGtlsFnHxNPo+QzWeUbH89DoCr/A5foDJPL+oYnxp2O9XAQqY5AyJvd0AjXz4sikPkoul7kAnh+pppBD0D4RHuBYSTw8+GaZKh3XvmXgmxHrDySY35w+8NHs2czPn5RDODef5WtvnK1OAAkgiySdeylxJHc5QrRnM5rP8v2p8Ey3biMH1xZ0yW/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMW4JLCvT+ckuXHu/E6Y6J6a7odZCtLP58K3JECljvQ=;
 b=iSG9lggaLrJN9hFkhJpswxvM3PKazaww11ZHzz+1a/ozaDQrcwYTccTGjWKqUrzKZhl5v3hs7jHVExGRSiSP7/7BpBCBbGHVPl0bBfyPZjCmybwsintZtlFkdiXYFiehxAKPAS+5KisyeFMwAAtulu8sAWEuqgPSa2svip4N1ZHEdErWykKTEhJIgrZl2UUVNdmOKmCPfdlugu2JDYOHsMwuC7JINIMnlLMtLAv1emtauT+zvBD9DHi1IS/uZfYsrPVsCCLg28t51IxrIzmK3v/ZBP5n8JHIz1rp4Uh2BNgIo10AeW0YJU/BHOB7uQX0T0RQ+5isvVEvx0812NQung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMW4JLCvT+ckuXHu/E6Y6J6a7odZCtLP58K3JECljvQ=;
 b=beazelp6oe6NpkQKoWSlUh8Hy9Ts6Rs35Kszd0mgOj4CxDNzcc4yRoMPn3W6dkvqSA9iBeetBOZrNLY5XOWKaRYG0TtdPV62HktnNGi8oF7/QX/FWXss1ymWsjBgbLoOlur2sn+R8BJEilZCpofIuYVKDYrg2H/QEKttj2WFWIw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB16477.jpnprd01.prod.outlook.com (2603:1096:604:434::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 9 Apr
 2026 11:19:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.041; Thu, 9 Apr 2026
 11:19:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>
CC: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, "andrew@lunn.ch"
	<andrew@lunn.ch>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Thread-Topic: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Thread-Index: AQHcyAc7ZyEBHUmX/kuuIfqJuejTO7XWgYEQgAAF+QCAAAVdkIAABJKAgAAAOdA=
Date: Thu, 9 Apr 2026 11:19:43 +0000
Message-ID:
 <TY3PR01MB11346732465160FFE9DCAADD686582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260409095633.70973-1-ovidiu.panait.rb@renesas.com>
 <20260409095633.70973-3-ovidiu.panait.rb@renesas.com>
 <TY3PR01MB11346A0F047F1F7296B8F4FCA86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <add_krK3MC1-SSsV@shell.armlinux.org.uk>
 <TY3PR01MB113465B215559404D0FBD04AE86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <adeH5y5TiZdaK94d@shell.armlinux.org.uk>
In-Reply-To: <adeH5y5TiZdaK94d@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB16477:EE_
x-ms-office365-filtering-correlation-id: ba5e5e34-f354-4de1-6050-08de9629e68a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 xnyMc9xRGrRVJuxawv9qhB4ZRcxTtlPHDvw7BfeVt6SPIreAJ7lcvhJrnr0xEluBsb/eMlabRPeAArF209TFkdvPDE88HvBqMzn6psOhymCiBosJ+OyTz+v48BAatOTsfN0O6dlKoqe+RfhBSdRYKfXnBm11kStzlFpUG8djNpDiUyJh/g8QTyMyo1wwOCtbxJEW2D1n8neKQNyRZ0qSaVWKqsEsExGloz0G/p+LGnsyZ7jic6cl25ArJ1iR1VUpGljZY925Tziri8YLv1APXhPxcs0cOR+BWdYs5ciPhjb6FnHygWfQDgpgmkUU41uMXyN6za5+xRIrcOx65BQh46XY4h1QcP77yGChFhV8UTr1+KXtTih4YEqkH6I+jxHHOlFoBYsw/d9RQQ5d4XTDT/cW9EBQFvmrtvkRHRnjtxFCM5nIz+Ot+8v25XbvMoDyLIAWhopun/FaGzdicgAhixt3FFt7GQq8T4CmsiYzHa2by/cSHny7rEJ6kLH0d4n3Z+gLD2+ASYaJgSPI9NLIWNAwjjieoQzERZpIDM6M5jwd1dpsAOLF3zbmVqyK9AlLGcCV+Va5HqWnzvsdfw1FQdjQQUaDC0Em2tqSBC2YLvg0Bb2E01UEIQTWONoTsbYXgKS61pScBeu0AwrwiZjswLSCRxqbOdOSpbYVplwpG3ni8Bg0MXsfnB1neGyPt3421AkIqLH+7WChfrY3nvy8laId40eMXVm1ZyFgKndoF7fXjd+h7IESK4D+WFW0NoYdzfA0k+5mYExlTsrE9mXfEvSFPg+VCv0x0+Tz6gc8fN4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?02L6YtQjZXGbW7bENlD1RznExlN1vfOXGMo1i4WvOd9g8gfYljUvMJbvb4Q4?=
 =?us-ascii?Q?w7NqLI/fOkY/ZMud9hqFHTYTxEyVSW6ln5Eq7tgxXTkNQj0W4vbm5AdZebqB?=
 =?us-ascii?Q?u+HGRmB1xi2319Dv+E4g3uiyVgjdJ8E4PfRQ4KoLsQL6L1Oom4MnjrlHJez2?=
 =?us-ascii?Q?ILiBoyJ4YC7Fst3ndFIifqYrn2S23354+IRNxkXfDJXgKSE4bs/9GT/KV3Ld?=
 =?us-ascii?Q?fPthzxENm3unqK4StsL0a/ZRyT9/xpkVBAmAIvbCfWsOeNXdnFyMP9dGtKwq?=
 =?us-ascii?Q?uzQ14RQUz82ERz7eGO3V6vvya5X96s29gBhaJY1yWiGpIYuO1EO9csVeuq5I?=
 =?us-ascii?Q?0+mR8hALmNMtcy6WYS1zYEoMj2X7yqX3gHwNApI3XESiDXwDzjmKn0LWUYqM?=
 =?us-ascii?Q?zwe5CasSrt66CNpyZxoZtkpvVXBEuC89l8bUFgxvs+zVgOt6XBkmaK2l3yq0?=
 =?us-ascii?Q?kaD76qJCRVB4LLimURSOMg/E7X/O9WRokaCKq72wUZEYR5JA9cc+FDuOnkyl?=
 =?us-ascii?Q?VbakZe3eKNcpMArWXcOib9fhGkGSkGddCjVPe2NGEmovXfCbK8HXZms1Q9jR?=
 =?us-ascii?Q?L8aiGCgr+DP9fWqita/n3aBTu4ncvCHDvoSU6FpjVDMtbRD9rRk3ayu5+cLH?=
 =?us-ascii?Q?6PT0v6z+eaPEGq/CiWl6DoEQAjGdHfLMznG6XNsSNdPHwolSW5JE5TG7TVhJ?=
 =?us-ascii?Q?zSiMut7dc+4prpHpPWzx0OtpmVKECK4sllOL+t8x1RXNbdbmK8oaMQItn0AU?=
 =?us-ascii?Q?woflrgMxinzTG+nXfuzBB5653BzwtInmWLnQD8XCX/wW/X3HQS6Hzc/ry9HK?=
 =?us-ascii?Q?6OlRHP5xuvG7dLwhnxFH7mGWGj7qwt7zmiFsHV5WuQLhNHbI/KbmHIiO9IqP?=
 =?us-ascii?Q?ibOkVMwQvUwS95EuZIRq26c6wiqDUoN/C5K9cI8AncskwonaOv58Xv3sA0Zd?=
 =?us-ascii?Q?L0GMVnMsVLS+B6rqft+dJ3FSDUL9FTaqV/arp7KHORIcc5NO5kUGP/cOLTGl?=
 =?us-ascii?Q?bFHTgm8ALfCy+Lxj21wd5JiPd0qZFitjpThq6VIYfCnsi38/OXSEyjGpaHKU?=
 =?us-ascii?Q?GfIsdPf4TJhdO9GpHh8oEuHbV7+FjERhTe6GxyhE6KYbXCeGCrBDA95dMpR8?=
 =?us-ascii?Q?9H10Z60XqPyTfu/xqpj7HNcU+8GtGLS8LW9B1duZxaCaGwYDXxG2ZJu/pjNB?=
 =?us-ascii?Q?XJ8iBRzsBpgn+4wHFQ8/p6lopaIjlPfcmSd7HTjCGtAS2dQh2z32gF4c5uvj?=
 =?us-ascii?Q?0rZbTlOSKOJRUigJFjBJMh+FVzH3XcNQxYUcYGexLfGr0pvRzm99LV0r4u7o?=
 =?us-ascii?Q?4aLBa3Vdcj8AmF6eRoY1n59xcPc32gBOGzOxMGrbU0DY82fi4OmS7Jzg81fJ?=
 =?us-ascii?Q?nMyzDIGS/X+rgzVrJyPkrxEokjwLbnxY9gO4z3LogOXLWdp1mgXoqOH2Pbzm?=
 =?us-ascii?Q?TLdaIXa5qQuNX+y/CbsTPe+l7YQiLxUBnoFdJSjL4xPKsKYsWpOw5VLXuZow?=
 =?us-ascii?Q?dh6dDbCRK99mErniAgM/IddTPumAPSk+uU9IKxvboy4t8cOpgIlXcqusyRY3?=
 =?us-ascii?Q?iKOaakCpyYmHdTjD1Z/5J+TOHDEs6BFnsEFZkNN5jjezLCO1OqfmBRe528is?=
 =?us-ascii?Q?NxGEGLFzUbkgpUKNxd3jX7Ec94QMy+EYvkzxhD/pGmZJU1yvske0VShOUUap?=
 =?us-ascii?Q?o9G2CYmLiUUKKjL7Ks/foMEDetsU9wJ3fKM0OpFrRUw6V5vTu9loI0tdVzZI?=
 =?us-ascii?Q?d3fC2PGspg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5e5e34-f354-4de1-6050-08de9629e68a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 11:19:43.8759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MuTbiqbeRPZHYlO5fp3ysiNK4SqGtyab4tbcOUzgAiP2gGMaV/hTOAs0zKgb2KIc02YRRyN+3f+3tx0YslJ/ZHtDiE5C5rsMqOTDZqRVbSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16477
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31081-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,smarc-rzg3l:email,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 45B7A3C9965
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell King,

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: 09 April 2026 12:05
> Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
>=20
> On Thu, Apr 09, 2026 at 10:52:35AM +0000, Biju Das wrote:
> > Hi Russell King,
> >
> > Thanks for the feedback.
> >
> > > -----Original Message-----
> > > From: Russell King <linux@armlinux.org.uk>
> > > Sent: 09 April 2026 11:30
> > > Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove
> > > ksz9131_resume()
> > >
> > > phy_init_hw() will also call drv->config_intr(), so that doesn't need=
 to be done either.
> > >
> > > It will also call drv->config_init(), which will call kszphy_config_r=
eset().
> > >
> > > So most of kszphy_resume() becomes unnecessary. I think the only
> > > thing that remains would be the call to kszphy_enable_clk() - and is =
it fine to call that after
> phy_init_hw() ?
> >
> > It just needs kszphy_enable_clk() and phydev->drv->config_intr() to
> > enable PHY interrupts for suspend-to-RAM to work on RZ/G3E SMARC EVK.
>=20
> I think you mean WoL rather than suspend-to-RAM, although I don't see any=
thing in micrel.c that hints
> that WoL is supported, so please explain why and how the PHY interrupt im=
pacts suspend-to-RAM.

This is not WoL. During Suspend-to-RAM, the DDR goes into retention mode wh=
ile
the CPU, SoC, and PHY power is cut off.

During resume, TF-A detects WARM_RESET, brings DDR out of retention, and ju=
mps to
the PSCI resume path.

>=20
> Note that a particular interrupt should not wake the system unless
> enable_irq_wake() has been called for that specific interrupt.

If PHY interrupts are not configured during resume, no link interrupt is re=
ceived and the message:
"renesas-gbeth 11c30000.ethernet end0: Link is Up - 1Gbps/Full - flow contr=
ol rx/tx"
is not seen, as shown in [1].

Cheers,
Biju

[1]
root@smarc-rzg3l:~# echo mem > /sys/power/state
[  184.611719] PM: suspend entry (deep)
[  184.616854] Filesystems sync: 0.000 seconds
[  184.629390] Freezing user space processes
[  184.637539] Freezing user space processes completed (elapsed 0.003 secon=
ds)
[  184.644541] OOM killer disabled.
[  184.647758] Freezing remaining freezable tasks
[  184.653520] Freezing remaining freezable tasks completed (elapsed 0.001 =
seconds)
[  184.660941] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-383-g15a06c881
NOTICE:  BL2: Built : 12:13:18, Apr  2 2026
INFO:    BL2: Doing platform setup
INFO:    Configuring TrustZone Controller
INFO:    Total 3 regions set.
INFO:    Configuring TrustZone Controller
INFO:    Total 1 regions set.
INFO:    Configuring TrustZone Controller
INFO:    Total 1 regions set.
INFO:    eMMC boot from partition 1
INFO:    Loading image id=3D39 at address 0x44428
INFO:    emmcdrv_block_len: len: 0x00001000
INFO:    Load dst=3D0x44428 src=3D(p:1)0x260000(4864) len=3D0x1000(8)
INFO:    Image id=3D39 loaded: 0x44428 - 0x45428
INFO:    DDR: Retention Exit (Rev. 02.05)
NOTICE:  BL2: SYS_LSI_MODE: 0x12051
NOTICE:  BL2: SYS_LSI_DEVID: 0x87d9447
INFO:    BL2: Skip loading image id 3
INFO:    BL2: Skip loading image id 5
NOTICE:  BL2: Booting BL31
INFO:    Entry point address =3D 0x44000000
INFO:    SPSR =3D 0x3cd
[  184.670380] renesas-gbeth 11c30000.ethernet end0: Link is Down
[  184.674006] Disabling non-boot CPUs ...
[  184.675870] psci: CPU3 killed (polled 4 ms)
[  184.679357] psci: CPU2 killed (polled 0 ms)
[  184.683525] psci: CPU1 killed (polled 0 ms)
[  184.685755] Enabling non-boot CPUs ...
[  184.686014] Detected VIPT I-cache on CPU1
[  184.686070] GICv3: CPU1: found redistributor 100 region 0:0x000000001246=
0000
[  184.686119] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[  184.687190] CPU1 is up
[  184.687348] Detected VIPT I-cache on CPU2
[  184.687384] GICv3: CPU2: found redistributor 200 region 0:0x000000001248=
0000
[  184.687419] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[  184.688357] CPU2 is up
[  184.688534] Detected VIPT I-cache on CPU3
[  184.688573] GICv3: CPU3: found redistributor 300 region 0:0x00000000124a=
0000
[  184.688615] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[  184.689702] CPU3 is up
[  184.692965] da7213 3-001a: Unable to sync registers 0x23-0x23. -6
[  184.767008] dwmac4: Master AXI performs fixed burst length
[  184.767049] renesas-gbeth 11c30000.ethernet end0: No Safety Features sup=
port found
[  184.767090] renesas-gbeth 11c30000.ethernet end0: IEEE 1588-2008 Advance=
d Timestamp supported
[  184.769791] renesas-gbeth 11c30000.ethernet end0: configuring for phy/rg=
mii-id link mode
[  184.839754] dwmac4: Master AXI performs fixed burst length
[  184.839784] renesas-gbeth 11c40000.ethernet end1: No Safety Features sup=
port found
[  184.839814] renesas-gbeth 11c40000.ethernet end1: IEEE 1588-2008 Advance=
d Timestamp supported
[  184.840892] renesas-gbeth 11c40000.ethernet end1: configuring for phy/rg=
mii-id link mode
[  184.994774] OOM killer enabled.
[  184.997922] Restarting tasks: Starting
[  185.002227] Restarting tasks: Done
[  185.005781] random: crng reseeded on system resumption
[  185.011124] PM: suspend exit
root@smarc-rzg3l:~#
root@smarc-rzg3l:~# [  187.356951] renesas-gbeth 11c30000.ethernet end0: Li=
nk is Up - 1Gbps/Full - flow control rx/tx



