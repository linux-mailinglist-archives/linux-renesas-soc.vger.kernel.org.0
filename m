Return-Path: <linux-renesas-soc+bounces-31095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJr+C62q12kMRQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 15:33:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F003CB45F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 15:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 980193013031
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 13:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DD02749DC;
	Thu,  9 Apr 2026 13:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SZj5OfUr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E9A40DFA4;
	Thu,  9 Apr 2026 13:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741119; cv=fail; b=IG86vfkcHNtz/Ix6ZgdTGJALKdkIWaE0dOomgl2tZpAv2D5nbvfCEIL7aUtRQtIKvcPToNjp16DXxzE+Nr/QRX+vm8pswP/DDTfY1ivBr6P3cFyndsvxhCNqW4NJk8ElBj7A/d2cGOdsUQsUKa1DJnmE0+WfvOtUzBCGZUX4EPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741119; c=relaxed/simple;
	bh=vN4RF6g2e+JqkneOL1b7l3toBKV6i6KjBmd7GDLY24o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ubcjBb+Ed53NkZAMAfBf4IwCknD5Dtdb+3mxKx05w3GSFHEAsCAfidQ2apf09U5HxfMZ9UYYoYlgOrnaK8SYodj8rST3D2OVjJ0KKZdrMU+mFPk9pViVVceVJ/LdQvbap/ejxJOjj11cw10PpJUKKB1ZF+NQqX7TnomBEskYGBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SZj5OfUr; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naFN3sTPpR3CR6IuN6UKzL9iAx+gVJrlR1JKkmF9bi81UM7dsuV/zgzDazdGfdndmqcwQB3PzNMCQHUb6SVq2gIOxIpBgL7O+lIM3EyeRdMWITNU+qyNXd3qblEDg/u9IBO+/I6S34qPVoLpxx2gGyJaBG9PlvkIf3oltCM51H2osNeQVjOqQOdDx881AtGb3NGB0h2MyIwdlynjrZ5/FM68J61JHysQU8OlXVSJteAh4P52wVLJ71iOE6fEFIIYCzi6iMI+ekhzPMEzpP4vHCqF5LTRsAiqariHChjIXAvzL9uLngDKEau5RhYiAlDFRFvLUfm7Qj0D7JLThD18oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vN4RF6g2e+JqkneOL1b7l3toBKV6i6KjBmd7GDLY24o=;
 b=J53iAl2Kj9rue3WAZmZfc4Vwh0JX2HRoPqj/GOz+MJRKxD3uecVRz4lvD0VchziVAGqUz4Ia64HV9SRL3ulrv4Bjz3LbH5Ku3FT6Zq5ou2K66zGqwrrHDgW74T2cCi1rVsIPMNRrEw1aqg0qwB+4htRnDxvJyRxL0VF2EkeTFErAueR+7RnNKtla95MC1Kci1yRkLLoXEtVZpywFVehP7FN5Tz3fMFrVr21nn2MoHa429NqCukxbt8gk6sOwnriGG968JhRqjW981BcFqDbaNF5luc/8MTwHvZ6OXEsYugvKkFtibg2i54JfgGTVQ48PcCOZU1CQaEt2BkX+B/Atug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vN4RF6g2e+JqkneOL1b7l3toBKV6i6KjBmd7GDLY24o=;
 b=SZj5OfUrrhj8USLogntVH8lsOmiybRFBDHWZXZO3hSha6usyrjbe+unX+WvYhETgSNjbCILzgPCjrkeA3cZB0sYndmKUsYklLE0bOe+5jhumY/auzqLBh5eS4J5WKWDFs88ZRr44fwSrNLV4fOSY9IgyuHEZ/7wDjbavj8MulQQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB15448.jpnprd01.prod.outlook.com (2603:1096:604:3b2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 9 Apr
 2026 13:25:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.041; Thu, 9 Apr 2026
 13:25:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>, "Russell King (Oracle)"
	<linux@armlinux.org.uk>
CC: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, "hkallweit1@gmail.com"
	<hkallweit1@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Thread-Topic: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Thread-Index:
 AQHcyAc7ZyEBHUmX/kuuIfqJuejTO7XWgYEQgAAF+QCAAAVdkIAABJKAgAAAOdCAAAbQAIAABkPwgAALR4CAAAMdgIAACztw
Date: Thu, 9 Apr 2026 13:25:15 +0000
Message-ID:
 <TY3PR01MB11346E194A149A4737535AE1F86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
 <31b1e474-4b87-4a75-93fa-1bcf3a41221a@lunn.ch>
In-Reply-To: <31b1e474-4b87-4a75-93fa-1bcf3a41221a@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB15448:EE_
x-ms-office365-filtering-correlation-id: 6001d953-9d89-4bf3-c293-08de963b6fa8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Y66vC0G1Pd5+n4eBPWfJfSjv+OfgVsY98DqTN7IiOUr0v5lHvFma651k2jxkelKyzQpCJd7RL0yKDGjXtH3CHWCxtt8x5Rai/QhHIuh5oiPBJ419BRt8NQi+U/otI6cYOr4r630qZXi+FSmrauU7kTw5jv4zi8Xzqljl8bZH7ZGOBnxhMCa0YtMBSTPVOHfmxPNQiZfurlIt37knEcve3WxFctsjBpQw5Ob9qFXjUpj8VNQ5p1RUlA0xjWzt39lhe9Luw9SRoaLadhLKq8k0Y60/2SMPieZsG76RSNdRPq6MpRv0ifuYNGCIeFbP+qkwZ4kwSNH7DYpWLp/0Pw6+fzjaxfc3fUKBPgN7wiYnX093HnAL0aa9v4xMMYZuEjQJI/1vCMU26G4pFHcK26ejeG7c2HFdHBnyqafW/M7Q/k6TrUFkKG5kexBGpRIK1xTXZkuqXVTBVnb4cnYesgZD/+oxzSXDhwxs5UAO51sMQYQEy4pUoI+dHw9scTnTzSh84M0iSO29dFXcmjfzw3qfBe9dsB3te6pS4ufe8cxH95VbRm1+3DhQYwuQF/x53AbMrNx9i2f55Tb+zotKktHQ/jBGLyIjFd7c0NAv3PYkgDDbxhL9M1XwHl2Py1rsrUyb01b9Uc1JJLT72z1FdM32ttVBXRNsD4nEynMvt5CfqL5iJ7HQ+K1+lUYDTlMRHyUqImlyNV8hvKtewXQkX4uO2WjZb6m6ecnq1j7NHw3GnI1Ee989G8gYcncV1sw4vbaKC6JqNqFc1d06GkBb5BE+M542hKONOAfMKDlUKRIOmpk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aFI/IWU9OY6U1KyA4Q/Oaq/Zf6oyfyTBambDHcdS0zjlZtj5PLniFO3Cjn0G?=
 =?us-ascii?Q?yqoAAFEiaPyIYKtIIv7HH4RO2FZHseCdZDnXqlo+oXXDTd19w11HJ7v02u9K?=
 =?us-ascii?Q?SOenUnAm/Z82ZTTIO9BZ/W7hUPa2JWjnbBPXH8/ubWTqqJHRN7rz9iREZ1A7?=
 =?us-ascii?Q?rj9YLxLXa+ikLDweHNgKBxzbPhM0EwfQ5dEBMkTgBpt13DW228F8hAiWt+Pm?=
 =?us-ascii?Q?7QKDpWUeZGNU9djcj0Qy8YmIVnetNZ9JNDEQKd3c50WMFOmwGy7alem2wmeX?=
 =?us-ascii?Q?QdDEe6VsbM/zEx+HeD/yVOnUuo/3HoBpewgMszvWohpWQu4mS239OGayVoWl?=
 =?us-ascii?Q?m79EcFO8RpG04LOzqDfEwzDApamr7v1zBxSVJ/N/PGt+SmuC8v+2vCei5KNN?=
 =?us-ascii?Q?tkPWTvRNWTpuBv3NuYTBWWFPGNnVBjOH31BP6v2X8tuSiD/68No30ErmQPX7?=
 =?us-ascii?Q?dryoGvlY1iDbGHecUpAyeaCbHx1fyxMe6zt9jYsKQPg1CAnK0GNiehUk/0ob?=
 =?us-ascii?Q?zH7KoZzuE+YYUV3p/CNw9VkFGLf5RHIU5XamItLujdZya1eVM/8NGmJrDXgk?=
 =?us-ascii?Q?vwZ6/2NM7HXCKOVV9UOABB1Yzf016RMCx/udc/aDC5WN4ZtJTxr3o4IskyvE?=
 =?us-ascii?Q?NvmsyA7jDhJzrs6Yt/oad0p19NlAVcinWeIZw80KVRZciPcxAcjHuA4+fqsB?=
 =?us-ascii?Q?DQU1bwc17M9kdiOqC3/oOyCigXHtR46cjQWUVfJlKxz/mWrQ44EbYAxJSG1a?=
 =?us-ascii?Q?Qg9vahnWJuUuh1grhKY+U0r8g3NmoI7vEQFREVxVXaCZmJ44hpAZb1Nl1i/D?=
 =?us-ascii?Q?wIGAvG9YG+i5X2lme2sfgClktdmm9za6HUsMhgICfVLWHTt4Xa5A3dYbqybx?=
 =?us-ascii?Q?qxHFikMpsIAeR0jLXy82wJ0xDqTjleSHYgMSaLwFUZOCJGOekofKc7sq32I6?=
 =?us-ascii?Q?lN6/HvgKaA2T7cKfuUuVREFoup6Ef1j8A2dX1QGQsj30zzShVAwKDey4Vm3m?=
 =?us-ascii?Q?TmxXoe3+Mb9F/smqIUACIobeVv5FkHkDacdPc3+8/pl/fLsilvV6b97a5UNB?=
 =?us-ascii?Q?xCZ0oWU6FjMX9SC/xPqOZTfL3EkcZdIA8QuA31/xlK5S1NGXIciOvLV3TfNY?=
 =?us-ascii?Q?3GJvE59a1mbux4Iw3jBI9QpkJoNUHwv/VV/+Nv6cpwkfD07HAfkBm78zbj+n?=
 =?us-ascii?Q?KR/x8jkW0RMY1m7gMwLZPbs4Wh8SxmvfG6MQClEBEuWP1po5vVgfdFVrooti?=
 =?us-ascii?Q?ocILL54Yuj92LJIFRzOQy9yus4g4gCqW2HBpVhvFpdaED7tRcO7xR2ZQ9T9S?=
 =?us-ascii?Q?4nzcZMqGAIOlC0YBHMt7r88jIfrhjhW5NM5zmZ/5LMYLAO6bFLm/5iNEYH4F?=
 =?us-ascii?Q?pyeRTF3cEcEm6q6bdzKo9OoTlJslGoxQUUwaVRzqZ/LkHdbM2Dx+5ZLt6seF?=
 =?us-ascii?Q?xrofpbCJbZQkRkUi1rVg7TzLKBrvRSFIpMJKXayHg/mZ0NHEjGO0bqNS3/YW?=
 =?us-ascii?Q?4HfSQAxKb+0QKZC/3q+YqKxpHXjZ33B70NAS9Vi80BeD6nrRqMSDbTj1EZ3q?=
 =?us-ascii?Q?BEjNPe1ZlVBsH/xvLy2Onu5zyCWsrJKQHvrZs59SeKX2tbpVlkkKpoF8gKf6?=
 =?us-ascii?Q?LJcBN5DMOsiVWFkWWJoP/c2AATaz59qiDH6KHR/XpAHYnMj5jFgTS8nWuuv7?=
 =?us-ascii?Q?0lef+ybGoLpT/jWBRJYymGwH49C9uAbA6KcfZN++yNdHAJvc0CypzoApoe9X?=
 =?us-ascii?Q?VIqW2+SKCw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6001d953-9d89-4bf3-c293-08de963b6fa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 13:25:15.3720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bFGikIhZ6EUmlkypeQOYmgQ3mGybVRCqaZGZtCNg16LcG19VZo08IkvNL8D6epcgoNb+rYkxZFTSqcytYNC0cZoDjyugnhtmZcuSItgP6Es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15448
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31095-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim,lunn.ch:email]
X-Rspamd-Queue-Id: 61F003CB45F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew/Russell,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: 09 April 2026 13:44
> Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
>=20
> > I think we need a simple solution for 7.0, but subject to Andrew's
> > agreement, I think we should consider having phy_init_hw() inside
> > phy_resume(), and a series of cleanup patches that result from that
> > change, including getting rid of unnecessary code in micrel.c for the
> > next kernel cycle. As I say, subject to Andrew's agreement, please can
> > you look into this. Thanks.
>=20
> It does seem reasonable, and it would impose some uniformity on drivers.

Yes sure, we can send cleanup patches for the next kernel cycle.

Cheers,
Biju

