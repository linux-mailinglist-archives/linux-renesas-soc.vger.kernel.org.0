Return-Path: <linux-renesas-soc+bounces-34837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VA0DJqkHTmrKBwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 10:17:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EE1723103
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 10:17:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="I/ImvMJ1";
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C9DB3028CB6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 08:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863B43DDDDB;
	Wed,  8 Jul 2026 08:10:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2C13D6662;
	Wed,  8 Jul 2026 08:10:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498216; cv=fail; b=VWxT5FM9mrtKTIqoRITB8NewSecV1M7fS8Zf4aeAhmjzyAaVtR8DZx/yy3Y4zM3Mk+H0LcucQcPEaravI1mfoEF038XX1K7igHy+3s+NHS1Y0VgwKxUlu4MQf9dsnPcZW5t0RN1mKmgbBFXWqykkg0Oobl9XefnnKmh0XLpYbEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498216; c=relaxed/simple;
	bh=7nYGOP1qX1f03ZfClPfq6cOoltr4aKXAyhi0qkV9vv8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m3OS1twL3bAzXOprN0ZIiHRdi3c49V1K+15vhqUCd48kNsVoGtNL7BZIgLuhuWrRNDjq3vygAzoeMtqWvU8GPJZ9mUCuyXCzUAriacqtuyZR4D+qC2Agx/Y/JZmqEM9CrVsXoCbCeBLrN5DkjfVBCSru3kqcxp9aUz7dH7/GtQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=I/ImvMJ1; arc=fail smtp.client-ip=52.101.125.26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhUjfANKg+zI3NeFPzMQeyGq25J3Cn1jeP8FAd/VOP9XZOtksNpWBiFgUozrr6AGZyzVYESrG9QEcO6U4Z1ZGrgIQ91oQkhL5YW9fhKUOiAIeUS2tKwN5RQwibhYtYejiNyClFigjcrsTCRNHDAvHsAuN+v/+MdVoHioNzbHjexxWu5N/GeYuAgfFjinH5vpbGLCwaXrsPrRy1jkNr4rGghE4VWnCyI8Wu/XgbEc0KShNYbmgfwNKsESVJqnPgA4YdtQQtZuQXBv7rXBt53v0Wd5nEj6iSogMq7CjsGa0/dEv3Pl+o/mUUW0Jh9jAv1uBaM2ZjUdFXTtV/+C9NhnNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nYGOP1qX1f03ZfClPfq6cOoltr4aKXAyhi0qkV9vv8=;
 b=sbSp2GUSvlRNlEGCo7tHNzXZjlwTTwgsexSQJe0TValoHt798Y+ZVaEmeJ/oEH3XYeNSmSqI0JAbB7PCySW96Sq49FOwVj5S5eG4pA7nTyKNw2DrqFqztVuL2kgZxcT0SzuOplR/KF+EJA/dlRhXmBi4ILkfFiuLr3Mpm4NTgyc4AQFuWovf5Qxlz4laIsAkaXyLoRSvUUmNXZZDjTODsf2xePNYBi2naVkQgI3cB+/Gi27JWTBNu0mb4GPzLSr4VkVz6dN+n75zjlasMFCNpmESfuCmkCHVeLAzGgTxqOuKnQVaj/01KxHb3NiCzUc1nppWeepp+d000+aP0vFX1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nYGOP1qX1f03ZfClPfq6cOoltr4aKXAyhi0qkV9vv8=;
 b=I/ImvMJ1DCUccpvzz7ZUPJZ1pfiBEAF2KdHlydcMARZFZMWG+i4MAW0MMj0uSCUkAmiW7P7D6Y/Zq1fGJR8Nu+GEdEHIQk8vJ/ZwhsK2/7qxSUwm3BSfJpb921VzDUHCUaO8pYW7kIAP3lTbZN4opgBmTjxP9fmlksJMy9VqkO8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14845.jpnprd01.prod.outlook.com (2603:1096:405:262::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 08:10:09 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 08:10:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, biju.das.au <biju.das.au@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 5/9] regulator: renesas-usb-vbus-regulator: Add RZ/G3L
 VBUS regulator support
Thread-Topic: [PATCH v3 5/9] regulator: renesas-usb-vbus-regulator: Add RZ/G3L
 VBUS regulator support
Thread-Index: AQHdDh4R5wregCljJ02T5VlOWgMXYrZiKNAAgAEbSiA=
Date: Wed, 8 Jul 2026 08:10:09 +0000
Message-ID:
 <TY3PR01MB113468F9FB9AF3DEB1598462086FF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
 <20260707143646.245177-6-biju.das.jz@bp.renesas.com>
 <02831bf6-cb05-427d-8592-b3fff31b6913@sirena.org.uk>
In-Reply-To: <02831bf6-cb05-427d-8592-b3fff31b6913@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14845:EE_
x-ms-office365-filtering-correlation-id: f7256c3d-c189-4553-6c81-08dedcc8541f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|22082099003|18002099003|38070700021|56012099006|11063799006;
x-microsoft-antispam-message-info:
 U7m8XeSxzyiQAzssVaBp4fZQ+ptVf0ARZDnW8sjsehMVEZiEd4LZQ3h+rS6RTFYx59mjf/+7fyzv0Vow2Ie9g9tz6zPyK1SkI2YPFJUqxH74wheZk9bI+d/OgTaQljRscAqsSu7U6iinzE7/9d3zUcwdhMlyo6os/rfsdS8UMqFHX06m+cBKM6wEt2hfSc3/HfmeHl+9dsPMylvgOG62c197qNDzkbtWLwDZhJ/W0TA166kSuYl67MkR4X+q9jvuu6oiaqL0Fbv2UmLaBs/RpESSqoeqxkt5tWIYzCYhT9NXnY/XNPb8Zwf/XLuGpAIU0AuLPb6qVzPfGRj9pgkEZsrmB+tGPuosScXN1UZVgZPCbHlzmFkS54p0kuwuk+QhyjDC6IAukbgpm6Q73Jhn2yMe+2PMLxuYByQJJkNxzaypFbjXH+IQABiD03LsqyznDOCSYbo3zJQ3IIDqpthLemALn/3qeHAvRSaClFvIm3h0MByrPbvIbzb1ArMU4kSRVV45EvRt022P9XuaE3bXcoichyV2Y39eah3vnY4eQKquYwP7gPUdRyA1n+hiXHOb8D2+SOp1Fe4XSuEB3OuiR+Sn5O9i+5/M/qwlnEIlrnnkvNZ5hLiSZTr6csjg32LcfNbPyhwWZBo3ezt6G3PFzY8ayOIWtbfVKwPbqkH98fw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kJ6ODubHVq+D9eP+c/BUsNuJ1G1q0jDyOTZosGTd6OSnybv+1BleyRcMoFvW?=
 =?us-ascii?Q?9Ep6UE8n7MhuW9UVSZ6bjDkQBjfrKouAPyyWfSs3Cn3v+kpVK79mc7Xi1yv7?=
 =?us-ascii?Q?AECRVhkGQp4zzTnv7pshx9CtkwiUix/6c2zZ8Aoxub3OD3g0TU9IeTk4ZCYb?=
 =?us-ascii?Q?xq+aYDBqgW4Q23a+BgQ2b3mFLW7EiM2I4FnX5Pg/D+WR4VPyEjYUg8OWDG+o?=
 =?us-ascii?Q?52CVqbqmn7HcwFjWQ42ng+KT1qjAsKW6HgprIsEGEMbJs1wg92gMf4TH3/BB?=
 =?us-ascii?Q?ztZCUFUvhnhE2Z28HKMxGJtakIANJaQOKQ/OarZeFNFhAaJpOHkVXOiAODvO?=
 =?us-ascii?Q?EzXm8sORzhCvoL/CosxmZUQ9f2RVStJ+GhFJVP3xVLnuHA2VK9fC1VuNlqR2?=
 =?us-ascii?Q?THCB9A71aKFSItR78pALKnVgvG32V4zyg2eTHLpk3ps1MWIACUElwBXtPzTY?=
 =?us-ascii?Q?+Z+j8nCGaaVmCAx1v/+HnAFKeCo4cpl9X1NXC50P03Z0DTg4ieTKiH4aVZqC?=
 =?us-ascii?Q?4scuUWojbdknNmhMXfUzbIov4hDLsSCtN+/kdM2nMuCJcki7xEZFYSEErCpE?=
 =?us-ascii?Q?lDE9Fq7sEpRi0/M7tsflGzZ4eZ4g/kVPmtHiRa6oHav529NMa/Jiq4J43pk0?=
 =?us-ascii?Q?UscsgxTP0c5rMMZBpwYzUtnAA39xG4PMt4WhdsGlCI7iL4899GFy4ELc3TfC?=
 =?us-ascii?Q?DF9bDWFJn55bEVvAQ51MJrbLJhqV4a3HWlkHQTlf5m9e9eUEgksXlb9gfqht?=
 =?us-ascii?Q?gUHOMCqRNsxb1l/hjQjkumVzsnZ+kpDzWB9ptHBIYTe0LXPmqoS25YX5+plT?=
 =?us-ascii?Q?PBQ67KdVrv2UoKyg1X0wifFM6t2eOu8uaONifCdV96Nic0b9nIwv/FHuAUYB?=
 =?us-ascii?Q?KwWW4ay8viePHljbOW6tnBHdkRIEokPId20tU0ILjQ6RGE5OP9p/kXMhdsSe?=
 =?us-ascii?Q?ffiiHI8GfWIRdXooAfKDU6fEaIacW1SaG4lSR4bms/nfUwtz52IqkaNglnwG?=
 =?us-ascii?Q?oJUkSYpS85qUwtCOecNZXmDBWTQ0+3CmFelPSE1A4XcL0gU0NmNHXoaKDVzL?=
 =?us-ascii?Q?2OsPF8lyfgt7i+M1joF8+Io0r4UxfU9LvoTyL87XaKbO9kub7NEEIP/4zh0D?=
 =?us-ascii?Q?8R8we1nywoqbD094JRESZInvv+qM+FeH2Y9MMC4aCF7xOimYIoj0rkOTVosS?=
 =?us-ascii?Q?iuMZwRhSIga1cZ/IZElyLc1+jwpE5DtGxg1Cu4SzygZ46vZExHpeVVMWSN0X?=
 =?us-ascii?Q?/57h3FedqRSN/raX5fuTwT294DQzfsruzhjB5mk4f4OK272ztU6SxwB+Wsu1?=
 =?us-ascii?Q?UPNyGZF0BTqiKwpgk8lTmP4HK6XbpEYmh+olrqULr0pHfPtfX92Yrwv2mG+0?=
 =?us-ascii?Q?i85q5VyIGmlxBcmJufSPGjirjfYkpZwNdzxkfggu4AjRTVqugzYEzpejoz1n?=
 =?us-ascii?Q?MCNdXmwqbV3mok2A6RGSZvjOocAfgu5R431XxVUydDqIJM27rjtWFFno5TZp?=
 =?us-ascii?Q?6bL0ovdyv2mVKy5xVUkI5eQh62wdMxcTVdRPZ3im0hy4szGR5CW4590Xx3WH?=
 =?us-ascii?Q?Zux0yJo+1oDKhjotVgDrmnSveoMjNOmyfAgtVEH93RFXq0xxOyFUMKqv1q2S?=
 =?us-ascii?Q?GMXSYi+8nViTqXbiMryAy47uYdnAw/N2vAOcVfC8CJwQUliDLXgCvWaOtEWW?=
 =?us-ascii?Q?zmr0sgSpmoEiGCcAp7G5Zt3J8iL/mxS3VpCKZoPqmiWVR75eiMRFSO2p4zlA?=
 =?us-ascii?Q?DznTMkEtwQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f7256c3d-c189-4553-6c81-08dedcc8541f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 08:10:09.5573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tYl5TEBhIafX8ztKT+ie7E1NzdiZ+TuBtTpdjawAQRMcpVF/d0Oj+emBcflP86AJWniPxQcL622exY98qUJ/Hew6B6oOkThQJMTBHAQ/eIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14845
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34837-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,pengutronix.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:biju.das.au@gmail.com,m:p.zabel@pengutronix.de,m:lgirdwood@gmail.com,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,glider.be,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim,vger.kernel.org:from_smtp,bootlin.com:url,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1EE1723103

Hi Mark,

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: 07 July 2026 16:09
> Subject: Re: [PATCH v3 5/9] regulator: renesas-usb-vbus-regulator: Add RZ=
/G3L VBUS regulator support
>=20
> On Tue, Jul 07, 2026 at 03:36:37PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add dual USB VBUS regulator support for the RZ/G3L (r9a08g046) SoC,
> > which has two OTG controllers (one per port), unlike RZ/G3S which has o=
nly one.
>=20
> Reviewed-by: Mark Brown <broonie@kernel.org>

I have encountered compilation issue on x86 with compile_test,
that build this driver as module.

Looks like I cannot use two module_platform_driver definitions
in a C file.

I will switch to single init explicitly registering 2 drivers like [1]

[1] https://elixir.bootlin.com/linux/v7.2-rc1/source/arch/sparc/kernel/cent=
ral.c#L264

Cheers,
Biju



