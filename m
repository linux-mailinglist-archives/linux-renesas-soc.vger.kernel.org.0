Return-Path: <linux-renesas-soc+bounces-32964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AeDO5w8EGrUVAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:23:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 465C95B2EF6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F19D3300F121
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 11:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2C23D5C0E;
	Fri, 22 May 2026 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="P+gF1h88"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717C73D0BFC;
	Fri, 22 May 2026 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448592; cv=fail; b=n/ez+s802a4fjZ5/2NsJpzMYnsbJNz/GXL9EvuM959SF6MvlMy1URruHlZJ5S4BMRuchTKN+1enXwKT11rXZh47309dH3RnGfk/YdRiIGA2U7tHfQIjB0wjrPT92lWQcIsC91KbVU1xpJfcxz/ESS4O4/The2FnqTEMC2+Mnq/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448592; c=relaxed/simple;
	bh=AfM8FhYuD5Ux8er6lCe72GaGfCsKNEaElRvJWR4KzhA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hidmzccoj+stedrRlYNwd62GhN9yAqHGXF1ozMRWb66Smb2n93HRjBKV8kvp9fnoI19zN15Ejc2VbPNNjfbjeChYnxnkNoOaq8OFp8uNmTK5uORUVx+hFFPoV/HglqNVxIjbXt1EBaExwRNs9N6jHOuEbf5919IRiXZF8zfGUWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=P+gF1h88; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4TF1vnTalcBC50h0JlZRue/4NmZDTbb9sFR6GuZVDTzBwx14GT1V1oOj7t2j1lqagvUv8qSXat2o/OEMVAZen9pfTJEYnGHRmN4dcGoNEN0VR2x9Qc6oEfazIgQcHCkBTCTcCIeVIw/QYmxRl2sZ8mv7b3PPu9uw0AHpzd2IxnXk2uE9TY3MZfafo2qX1onDWSQBDn794o6HY1r7KqnWGwL7kKeYaI7w8G/zdQzUEW7TeNt33r6k55ZiDx3ZnjJilhgcZuKJtqVi8yIOCyGQhSNgVnaHV4RaI3gRpzC6Nv2beBxiE6gKFY94Emhyz4Ii+xqRRrUBmn5JqN4Gy6Xqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAUqxHA6SE088xuzfbtZ6rIwteNxei+rq2cfW8wjgSE=;
 b=eQuC3653ujCW/KzwvUTJfo500Q3kpGr234XBcubIdayQya0HbPevFrZzDMrk97XbCGZQztiUlUtO8qg5gOK1eLGT3i+GZP0ec2IgU5aRGNesJFayb8FWESVUxQyUIB/pWAF7xVNIs3wWdYWfGJZS+07vRkuouz8pyScH1Cr6upru0O5vQho8L1zSgQ2PWN8760fa4VcMa5sP5RmYZz//VD7hSv5anBpui5SJl0UffvelnmWIm+l1w+eOm0yJ2NuqZIuqNWzZzwsyNAtFkjYqu68tcJeceQx28ifT1iS364MG+0VD6weV2Y35/3TvG92BCFbSNNzjx7hSnbAbLYceKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAUqxHA6SE088xuzfbtZ6rIwteNxei+rq2cfW8wjgSE=;
 b=P+gF1h88rLHcNDRHOn5Y11q26SuFcSIz6TdYBCTO1/2JNCjKFqZXXSlro3jgYHigCgjiv+TGG1/pNqrWqafL/zabLE8gjoiKP0orFCON7vYjtySTPzWPc4d7Bgas8OvmTmEqPk0p2N2qrjA+BxcO4jiHZOas4z0rUM5Znxy07Y0=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TYCPR01MB7992.jpnprd01.prod.outlook.com (2603:1096:400:11d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Fri, 22 May
 2026 11:16:28 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 11:16:28 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, "paul@pbarker.dev" <paul@pbarker.dev>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net-next v4 11/13] net: renesas: rswitch: add passing of
 rswitch_private into notifiers
Thread-Topic: [PATCH net-next v4 11/13] net: renesas: rswitch: add passing of
 rswitch_private into notifiers
Thread-Index: AQHc4SOYlooz4ihvrECJQQWMdbicOrYLL2mAgA7Gp7A=
Date: Fri, 22 May 2026 11:16:27 +0000
Message-ID:
 <TY4PR01MB142829BAC6D61087232EE3C72820F2@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260511-rswitch_add_vlans-v4-11-a5a225f8faae@renesas.com>
 <20260513013558.1408479-1-kuba@kernel.org>
In-Reply-To: <20260513013558.1408479-1-kuba@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TYCPR01MB7992:EE_
x-ms-office365-filtering-correlation-id: aa86f614-9aa9-4ca0-38ba-08deb7f3918d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|11063799006|18002099003|5023799004|6133799003|38070700021|3023799007|22082099003|56012099003|4143699003;
x-microsoft-antispam-message-info:
 HtnJ6kMoasDf3EAPha3m3/lF+MhD64STHpaArYHebwtTFRJ1MEzbZ0riLjyfslWamft19aY6FTVquOKu0r38vOFxilSwNzkcK8aPbRbpkk/P7iRO6OWdChtAPm8fgWwIBAk2+JufDUYTbNSwyjZY8KBxKwsv+mggcX6AH4qjUThsHENtiriP6A98gWXhMhATblqiqKUvBWQzesHspAQ8YOb2BJUQD95lDIts874pkgxxv5LOxioBWwplXNCtuhrl7Ay+/fJlJKf4H9navaF1p0+r0ouhBTnxAWeJLh9VNjaAbWcWRxQYgliFW4L/rV3Y+H7BKV8A3OxjA6ZJSMWY3MuczHhGxiEle8PR5H+2/E+znJnVn0suFbOoZIS9sTsYNJCkPpmVUQI0ZUrg/HdMdXRJvKg+Cp3lkRtPauXr8feEQAwMSpC/N/HoV3Dm0gTqYXUqGipF5r45Nelz0wJ370IGbMHl/H08zXWQiIv3pJeSZMaKoMP9hnASOHkU1Lm7t8vTUxt91xjNA1PffDGpPNK9DbLwhr+T9GnHfsJk2cDUONBgEaMsYwhT3p+EGxv5jm7lRRIQ1dAz8bzweLMzZTGWfD6VG/Iwkn0cIwvxkn1vDw+rBTl84B2jEyN6qYHQOBNL2Fuvzu1yiSoJC8hCMGrknewpkmvT8cjbC9WZYRrJpOf0+cGzGs7Z7YEkuFhbfTQJFExqUJXvsbspuRNoMcZmzpizxzrBHWMfauWocQUR5AWzTenr1gZZfFlrYnx4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(11063799006)(18002099003)(5023799004)(6133799003)(38070700021)(3023799007)(22082099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4OV3wjrhA6+m7r25nR72Id/bve2uJjCPeIHsriS6OFQzriGg0G8XHZE9vhfX?=
 =?us-ascii?Q?yorFJBJCrHnW24S47l+VnmkNxQYCsqFArs65nwG8xUR5tgx/dog7sfT2IaPm?=
 =?us-ascii?Q?tXQHFjXLgbE2t4x3WfGubm9hIu007wplVFOXzwaPyV9yh9R7qGwnEZuSsIdu?=
 =?us-ascii?Q?7M10P9IbWoF24iiUvMQsmOow7wicwkVdVI5r05xol5h9Wm1hoNHa9VdK8SfP?=
 =?us-ascii?Q?8o2vFXKJzHdBJmaOGQdvsGtuFbXX2HolFdlQi627Q/Y0eFo0TSVjjT/S/Zhr?=
 =?us-ascii?Q?J/kBtM9hYKyS1hPHSR4FbWX/DY6gZSw9yQNxeBMbhbBQNUywNBCh9WYKOFYs?=
 =?us-ascii?Q?EM3m/wmtLS821X/ydQ5P3uHpg0bEUbyz8QU4+6FAC8U0gbddhAQbz3o/YDK9?=
 =?us-ascii?Q?zH+m4grBi/X/hpX0iUKcWj/yOewnK+r+m+xuCTxm74dPT2tbv9jd2nHthvip?=
 =?us-ascii?Q?LewDRsTaDs6XASMoIiSvRtCwLZkat9wHuf7+j7QFrXayE/XzbbaE4LVCltTD?=
 =?us-ascii?Q?5Xg1in8T0CMN3+119aVD2bDqMnBUZv9sD89dRNfTbH7D1rmP++ZtFTgmfc6u?=
 =?us-ascii?Q?9FjjRcmNctL3higJ3JdKx0hSY+SHJ92C7PBgnzL1CITlHtKBVp7AMtCT/uDj?=
 =?us-ascii?Q?EYQcb47esf84z7wsVZBYW6IgbzRAvVLJ533hlW/9yY9r5mN1xzBAGsG1jMKd?=
 =?us-ascii?Q?h61Hx+48FZIrgDeQCCxaUht+UnocmK/6SJVrtKlDukuwZ5DCv+woHc2SFvG0?=
 =?us-ascii?Q?baNjwkY5VeBN3IVMfWyRVssOA0GkxQBo5ZB/iXHEAeXDkhllfi6NxF/efQAW?=
 =?us-ascii?Q?MQZxZw4OA9FS8dSKVd4V36FpX0Tl3R0cfqL/icGOKaE+JoMUzgJjsZ/R/jPp?=
 =?us-ascii?Q?7ac3KZFC5PwlNE0w7xHNC9WsyzKunubzMm2yi8OLz7WL2i+auycElfA5GHi9?=
 =?us-ascii?Q?2QP/XuGm6C7eoaNJJf347/chyBMn8kYzuvVvfNez0w3YF0XUa00Ni2glt/Xq?=
 =?us-ascii?Q?WbOhyHsNtDSofLvBzSfCgHCA0mgT8aUkGzLYZbGIeNDOFPCNNjEpTrd2ATDG?=
 =?us-ascii?Q?O+Hgo/4uBDR+mp1hmzceEAl06SBw3bFBjDiKN4LYIf3c61aOgspLEb9HtvWH?=
 =?us-ascii?Q?LXK1j1sFnc4Z4tmaSjnYr+kx3a73yY5D+FjOBDRAffMxNniegrFF2ab0qz5M?=
 =?us-ascii?Q?q1oQJroFWeE2DS1VDhxJFLkVz0AUsZIDJR6t4j/l5XR6uzLSBtLLG7Ut1hoa?=
 =?us-ascii?Q?ueMahIqxar74Eo5pyDjcs2cp/jgA0fjC8KVf5o+9L7H6nVD6Dt+nAXAwUlUx?=
 =?us-ascii?Q?4T7YUFp29DPWDIZKMRz3rZQ0pKbLKYQoaVQJBnepmWCJN2l2q4s937Mz1Gxc?=
 =?us-ascii?Q?FCft3GsgNHY4Cw4AYX0X9L9G1etX/rq8MVbrlP3/sijebd+bcEv//ly53RC6?=
 =?us-ascii?Q?GMGyjJNmdC9cK6Dfzw7h6s57ZQ7gzS5LbxsBgZphbcSU5mO8HuJ5cm+NmOm7?=
 =?us-ascii?Q?/yw8o1JkEWAR0hPqkX6Lgq/JZSKziyZiynXv0mV6LeJII7VkCGzYT/dZnUws?=
 =?us-ascii?Q?BNS+ULhRVKDQAT0/BkaE9WdPTTkhY3OoNKvBhG9AxQjovvuucLKtbmhhL6m9?=
 =?us-ascii?Q?vswv0SPEtEBvi+OF3FxZO/OB7QYaOr5mHaYYmbzlUsFO9lbAzN4f8ho52MHO?=
 =?us-ascii?Q?MxEmyzYYbieiS6kpj1hz2D3LvyB2nYRLxEW/yT3BfTK8dBaSsQKSYvi6r1sX?=
 =?us-ascii?Q?jgVweFws2w=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa86f614-9aa9-4ca0-38ba-08deb7f3918d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 11:16:28.0020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ehPhjCqtu4JWBMjV/3icOy71wzrCNxwRmkEaR5xqx7xFLzE1KqVZJcZuZNIhOxVjVU143h0XEo/5HuokS6jVT6auhfrf4Aog3018skvWIfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7992
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32964-lists,linux-renesas-soc=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,TY4PR01MB14282.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pbarker.dev:email,renesas.com:email,renesas.com:dkim,davemloft.net:email,lunn.ch:email]
X-Rspamd-Queue-Id: 465C95B2EF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Jakub,

Thank you for your review.

> -----Original Message-----
> From: Jakub Kicinski <kuba@kernel.org>
> Sent: Wednesday, May 13, 2026 3:36 AM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Jakub Kicinski <kuba@kernel.org>; Yoshihiro Shimoda <yoshihiro.shimod=
a.uh@renesas.com>;
> andrew+netdev@lunn.ch; davem@davemloft.net; edumazet@google.com; pabeni@r=
edhat.com; niklas.soderlund
> <niklas.soderlund@ragnatech.se>; paul@pbarker.dev; netdev@vger.kernel.org=
; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH net-next v4 11/13] net: renesas: rswitch: add passing=
 of rswitch_private into
> notifiers
>=20
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
> ---
> net: renesas: rswitch: add passing of rswitch_private into notifiers
>=20
> This commit updates the notifier registration functions to accept a point=
er to the rswitch_private
> structure, allowing the handlers to access the hardware.
>=20
> > diff --git a/drivers/net/ethernet/renesas/rswitch_main.c
> > b/drivers/net/ethernet/renesas/rswitch_main.c
> > --- a/drivers/net/ethernet/renesas/rswitch_main.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> [ ... ]
> > @@ -2290,7 +2290,7 @@ static int renesas_eth_sw_probe(struct platform_d=
evice *pdev)
> >  	if (list_empty(&priv->port_list))
> >  		dev_warn(&pdev->dev, "could not initialize any ports\n");
> >
> > -	ret =3D rswitch_register_notifiers();
> > +	ret =3D rswitch_register_notifiers(priv);
> >  	if (ret) {
> >  		dev_err(&pdev->dev, "could not register notifiers\n");
> >  		return ret;
>=20
> If rswitch_register_notifiers() fails here, does this error path skip cle=
aning up the initialization
> performed earlier by rswitch_init()?
>=20
> It looks like rswitch_init() registers network devices, but this error pa=
th returns directly without
> calling rswitch_deinit() or the runtime PM puts.
>=20
> Since priv is allocated using devm_kzalloc, the memory will be automatica=
lly freed when the probe
> fails. Could this result in a use-after-free if those dangling network in=
terfaces are subsequently
> brought up or receive packets?

I have reworked the error path, now rswitch_deinit is called and the runtim=
e PM puts are also called.

Best regards,

Michael

