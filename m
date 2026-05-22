Return-Path: <linux-renesas-soc+bounces-32966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCboLaNDEGrpVQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:53:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A16A5B3459
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9EEA300CB13
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 11:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67743F164F;
	Fri, 22 May 2026 11:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="O4V7DQQa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010041.outbound.protection.outlook.com [52.101.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5798F3EDE6D;
	Fri, 22 May 2026 11:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450785; cv=fail; b=YgHUGFzMXaW8hr6sf45yWwBu++OB3CdmFUbca1Qe4YTzAJn2L9UEHsP2QoHNPgocC3IK8TcTlRLNxAuhbolrAT+EZ8hmPZ6Jn8AQW8ha9Z5TLQeHWqksTAe42t0OmlGZ1LGdZDHCe2tU2DC7UISBuLNUIjOpzvIUtx2tNQC+YSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450785; c=relaxed/simple;
	bh=jzo4je3bj5603QL82E4/6ZfvNDu57nWYCIHnh2calHo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dlgC9zCQAj5hYr9QN74zerMVl4aTFUw5lOIRXj8R2TGUPBxcqDC8MIDvAjrf1kEVKfDtqNZKFSqtjzgHx38mqOrWytC60SCSqk6KweUuvrS27jz/PkGNY8UvXm6si9Ip/rikg9RnRjSaowRTCnnEceCH/YDCng06c0iNGtW4d3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=O4V7DQQa; arc=fail smtp.client-ip=52.101.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeGgMgIYSK8rPwmddE3cOjNceJtWa5PiUOtPWzwNBS+UVxLgNQ5hITlTTTryqYnycbakHaOwAlFdEupIf6opUfKacn+m9x3rflFPecLMQT8nr2VKjgiQnSRQxYjKiHKZqLOm2NH0yFnYyVvrMg8/V0r0N2De77GQRlgWpgbup12ez7oZ0srE+EM52cLyhMgMQ3eOnasoI6fgsQ4clG2LRxwIMuM9FHSRmtfYTj34Lhz0mL9exiPo98BBjlFKLFHQD5TserZuCBhkJvhfQre75lddrj8Kqsj8Da7irO1sfhmcsSoN9vav7SSUcKtqZhV0zXgsdWf6sMqerPgtK3mSGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o++njX/5OV+agAhyJ06C7xfFPsGcanazM/SaxfGuDDU=;
 b=IzYd2azkJJRcCIu3zwoHu11RONLNSOUArv92VqM3J8IkNvvaDIVK4NhJy2WNeC5Lc/y3iGiquDCMLf6EzWaf9rSLCSBdKKrytYmqcqrz4KklPeVK2virZNY9IT3gajceKPyk4yFsQaLND30LoC5tBPUf1IbA3bQzuJy/znlN+Yo3Eyu+Zb7miDefvY2zsyghHb5GoiZG0pm8sWIzh7A4jtt/hbZQUgQqiVKuZT7GWg9MM9YDng3EPSFjzrx/eJ6RNlln+6jug7s7Y+WBmOlDoCzdumiDmUdC+Tc0jkhP7bVtN94wz8deK2VJRlwb9wBX2ofH9mBQebL1IgbrJPN52Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o++njX/5OV+agAhyJ06C7xfFPsGcanazM/SaxfGuDDU=;
 b=O4V7DQQaXlWKFxK8VL50uHHvAAUk6z8Jkj/hTVhE9DlENcdqN54s06uK2htPxSIAxMaYewXjw2moGDnD1SrewpwT1weJdF8UOs+mmHFDgcOkkPtmA043hV+nFp8c7Bb4b0nvQfQh5ybw4juvUW5EqfOqx5MHnIIuj+O7krIPR5Q=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OS7PR01MB17321.jpnprd01.prod.outlook.com (2603:1096:604:439::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 11:53:01 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 11:53:01 +0000
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
Subject: RE: [PATCH net-next v4 07/13] net: renesas: rswitch: make helper
 functions available to whole driver
Thread-Topic: [PATCH net-next v4 07/13] net: renesas: rswitch: make helper
 functions available to whole driver
Thread-Index: AQHc4SOQhe1lzttQlEC3XU8av1won7YLL2WAgA7RGqA=
Date: Fri, 22 May 2026 11:53:00 +0000
Message-ID:
 <TY4PR01MB14282A14782955EBE45CF308E820F2@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260511-rswitch_add_vlans-v4-7-a5a225f8faae@renesas.com>
 <20260513013553.1408408-1-kuba@kernel.org>
In-Reply-To: <20260513013553.1408408-1-kuba@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OS7PR01MB17321:EE_
x-ms-office365-filtering-correlation-id: 79dafddb-c6a2-47dc-361e-08deb7f8acaf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|11063799006|6133799003|5023799004|3023799007|4143699003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 jAirv67BOpAPb1qOctTusvr6JHC6RpCnIHJSEOrBrL3aIhAkcyTfCQzk3pGzho/AGDM+8ViILwdXKKtgdb/uerlM09OBfP8U8OV6SwDLH6tVI5qFI+rdkHuByrzcDClPbHEZj04fqpUUTd0MoZIwC9SgtpLkru7Dhwgfu7SHNitd2N4JO20KWEEzgLk4cKS7fwKd1tu/KkdPoGMoueEeYOwBRkFtPc9TsgctiGg6hjtYi8LcvGvtfCT3nSbNfuFJSnzXIIwY9Fww9BE09PXKRwpgEbzYgpBZl8DfWNRbQArzvOYqWi3jnpGJ9KmF31MdNMvxT7Q+OsoHNZuhqWFtgseRK3JbCW5AQuiJMRfiEsvsURBrL4MdHgYs+K7/XntyDwSNrqBWn5MDI2uV/1apmggVMHUOw7uIIwoi3pWURTz4LXw7AnIS+D+JmoiAWDYLwwcCmZlK4IfKX1WpUc6V/SAGFOLxmlT1Q30o5pnTzoYXHACKcJzI+m8JNpPq/3dUCn0pRfwG9KRBEfE9isJElKoqTWof8Dh+Bj/gKvLJFLvSoTozEH4yNdWsUhvVnPkdq8MEp4QISFwvbr1kjUx3WHFy4H1lRYiSnh+HOAex2LL/RV2vQWzUiYVP/j1Ge7a+ZRzOeyI2QowTGcN3W39iaHaQYqw5P0pIFcp4+b4oG22FS76ewmcZwdGcUooTog+ec9xkQwjtH1kp+EU0t76tw2eoV15519mdNGFt3qPDRlG/ys1uTX7HK8HBr8oX1jjh
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(11063799006)(6133799003)(5023799004)(3023799007)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8PNh/9yaIY21HPKQArY5FvDa9IMFXZdCxVKoXPio8XqJEVhKy2m4xXQxCcTD?=
 =?us-ascii?Q?UqYpM3Ou6s66WyFh2Qle6RmmzpvwFrFkXdxA3OVAJ8CEhkZD8/0uRiJ4Lg0T?=
 =?us-ascii?Q?NSPsSTfAEhiFR0qjKts6nhsiCkn7oBm44+ju4JuvG9oMj85EYiMRNjfp3KxA?=
 =?us-ascii?Q?lBYBHavlGhO4tBwjp68xq0r7a0LF3PTMYAzFxp4EOUUP1lhkUOLsmjCulZ+j?=
 =?us-ascii?Q?W4WBPscy3DZRWoip+xI98yDQOnepHkluQUjnqB/5M1Bm1nx2GmQtKPu1uVFz?=
 =?us-ascii?Q?NLRRKuQj9s+XpvJOOInMx1jmyGkUvj/F9SZ7bIjnL9ui8arN/Dgfr+pL32fq?=
 =?us-ascii?Q?Q9YeR9kb4Z0YpqjmAv5ajB+vrbyXHxiDq9QWWtVsOyEWGu4xxwtQ3f8fniCC?=
 =?us-ascii?Q?UrYZPGl6WeX31L2yqRVTNz/SRPmTIpmoiYbe0I5CnO3LxAoOmRtylGddPe9U?=
 =?us-ascii?Q?fTlCcrJOoF+mmYncldsXmfCK9y5EJCyEX+IjFbR+9EbIeAlYr4zZnmF0sCTs?=
 =?us-ascii?Q?ihg3YY3XKl/woQ+cPp/S9Yd8Kk4ngXWEa80bDyg/g7RJkqF/gOUaw+nczdqr?=
 =?us-ascii?Q?l3aSMRaFm+CDz0j5glD69r0HYbmmUYg3nfN6nEgAt8nA5R6gt9FeQBBSjYOg?=
 =?us-ascii?Q?LZqPSXMFIDT8gOCXyUICjZsw0V5xpT3SGoP0swjvjZdBLnTNJ6j5wMJtKJAG?=
 =?us-ascii?Q?AMurhzO3DkG+YsablHmROLTPXEuicCa4nNFyLsGU0usfhmMfG6evTUXlIw5Z?=
 =?us-ascii?Q?A+W/mjk04mH8QSVSMSwRWYHO/rS4P1aOk4UwTmMjT7XLSugVWE60C6JbyDG1?=
 =?us-ascii?Q?g6QAVW7tvHyDavTn6GKLGHFD40Gjcm4V7TaAOSjOaGq2UPbE9YHjZ3Q19mrz?=
 =?us-ascii?Q?SC2YYZ+MZ3N46aehTHMf4ZK2hhDjW95f2ptK1IN/tOaykPhul50H4wAZqKRh?=
 =?us-ascii?Q?xuFXeChlnxfBqfVn68sNtt0J+OF6F5rTzbC0Vz/QyEfiUgbC04tpv9US//zH?=
 =?us-ascii?Q?7hL/kPD4OcTGXNSivUQ1+ESN8uc0kYpi4MITAvI/4RTFli45iy4J16Srmtse?=
 =?us-ascii?Q?4R8Y18qpl9xfsoTH6VftgnTdNCOmprA08IJxSKSVIx4uzhPppdDmXV6TGeZ9?=
 =?us-ascii?Q?+805dsapJs3UEL+T7xeQQTJier2yJaTP3d0EPpiyRb6IeHqB/KROZ32tObtH?=
 =?us-ascii?Q?OTgnnYjt82zC5FtEb/DrSB2ADuBE4rrtFoz3GjYUOWZeKiAxk3+6obuxgWC/?=
 =?us-ascii?Q?Q3tuGhe8kwUvRGbHRBHvHpfN5PVc8Dri7+XwM0uVouNX7KnAL0gzjqMPnFvv?=
 =?us-ascii?Q?PAe8tdoeT0ByDVBzmKOfPpVISSpChsASxSQGyzsN4HmopWKYQEowhPygCw9f?=
 =?us-ascii?Q?7K0ZKZMbYHq7c1eg9j3l9A4u6IcnSg2807m+Btp1okbLzCFk8EOJtUd6xCvE?=
 =?us-ascii?Q?zzodrhx9+GwLr3WaIASvzPyXc70VaWFN+F2yUkNxLql0QIxr/mzkyuwss5D4?=
 =?us-ascii?Q?jeH3s4UH3q2U/ruNWJvkurGKuQto7S+Rps/qAaDjpxQgwRfb33ulO1tSVmZN?=
 =?us-ascii?Q?QxChmqrcU90esHAMV54c32Qf2TWqmn3LWowJWVkh8wTU7iijhISMThLd0hWm?=
 =?us-ascii?Q?TweayH5V9ulmidIX9cDgGiDhQ7Ada3uRLjOTIS0YHSx8jfuxvIOPwKqO8ioc?=
 =?us-ascii?Q?9hMgxkIoC3A4IZFSP4t0V5zyo5xHl7W8Pd0JRcGnUltwLBWsrclFneI5w+wx?=
 =?us-ascii?Q?GWwytjEO6A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 79dafddb-c6a2-47dc-361e-08deb7f8acaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 11:53:00.9648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0PLTMSeBTvXGzQuEyg0h8tERdmcbeG+RO7oP4dBEdm5fTfbpo3lFP6+Ojop5HirY7LDvXCthm+q6ew/UQXF6AzOS+eNmK6i9YzpppUrR6nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17321
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32966-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,TY4PR01MB14282.jpnprd01.prod.outlook.com:mid,lunn.ch:email]
X-Rspamd-Queue-Id: 5A16A5B3459
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Jakub,

Thank you for reviewing this.

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
> Subject: Re: [PATCH net-next v4 07/13] net: renesas: rswitch: make helper=
 functions available to whole
> driver
>=20
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
> ---
> net: renesas: rswitch: make helper functions available to whole driver
>=20
> This commit removes the static declaration from several helper functions =
and adds their prototypes to
> rswitch.h. This makes the functions available for upcoming L2 and VLAN ha=
ndling features.
>=20
> > diff --git a/drivers/net/ethernet/renesas/rswitch_main.c
> > b/drivers/net/ethernet/renesas/rswitch_main.c
> > --- a/drivers/net/ethernet/renesas/rswitch_main.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> [ ... ]
> >  /* Gateway CPU agent block (GWCA) */
> > -static int rswitch_gwca_change_mode(struct rswitch_private *priv,
> > -				    enum rswitch_gwca_mode mode)
> > +int rswitch_gwca_change_mode(struct rswitch_private *priv,
> > +			     enum rswitch_gwca_mode mode)
> >  {
> >  	int ret;
> [ ... ]
> >  /* Ethernet TSN Agent block (ETHA) and Ethernet MAC IP block (RMAC)
> > */ -static int rswitch_etha_change_mode(struct rswitch_etha *etha,
> > -				    enum rswitch_etha_mode mode)
> > +int rswitch_etha_change_mode(struct rswitch_etha *etha,
> > +			     enum rswitch_etha_mode mode)
> >  {
> >  	int ret;
>=20
> Does exporting these functions expose unprotected read-modify-write opera=
tions on shared hardware
> clock registers to concurrent execution?
>=20
> These functions modify the shared RCEC and RCDC clock registers via rswit=
ch_agent_clock_ctrl(). Since
> all switch ports (ETHAs) and the GWCA share the exact same coma_addr spac=
e, could concurrent
> invocations for different ports cause a race condition?
>=20
> For example, if multiple ports are configured concurrently via netlink, o=
r if parallel PHY adjust_link
> worker threads call these functions:
>=20
> Thread 1 (Port A)
> rswitch_etha_change_mode()
>     rswitch_agent_clock_ctrl() reads RCEC
>=20
> Thread 2 (Port B)
> rswitch_etha_change_mode()
>     rswitch_agent_clock_ctrl() reads RCEC
>     rswitch_agent_clock_ctrl() writes RCEC
>=20
> Thread 1 (Port A)
>     rswitch_agent_clock_ctrl() writes stale RCEC
>=20
> If RCEC and RCDC are Set/Clear command registers, reading the current sta=
te and writing it back with a
> new bit could accidentally re-apply stale state, reverting concurrent clo=
ck disable commands on other
> ports.
>=20
> If they are standard configuration registers, could this result in classi=
c lost updates?
>=20
> Can this lead to unpredictable port lockups or MAC failures by corrupting=
 hardware clocks for
> unrelated ports?

I have added locking for these register accesses.

Best regards,

Michael

