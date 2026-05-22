Return-Path: <linux-renesas-soc+bounces-32960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD2lDVA2EGorVAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:56:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6005B2901
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFCD8301600F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1983D348F;
	Fri, 22 May 2026 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Izmnxo+z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EDA3CE4A2;
	Fri, 22 May 2026 10:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446842; cv=fail; b=jlQ3v/G2wV+y9se9j8XDjwP/PUmkn57xQqQH7cyC66luxy+RhU3plIakWWHwjSgxEZYFf4HCXTKc9wTdFmXkK8xExh/KnxJlxnuBXM5/D5RDccNhwoW5ADl5k4gN9xyERhwtAzL0aBxYpu/vN//oXkGob9pz4tMnowA23KRR68k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446842; c=relaxed/simple;
	bh=EmHJhBIiOYQMlKHkhDnSRcPvr+kQigj2uuSVqJaw6Ro=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kSJ+lpUGZsDS+2vWoX67zaJu3L8hONoJ71qYPEjpH38FSi2r8XYpG9fMg6+pP0U5EvdvBWk+CYNYTSXwNefGxvZaHt0qCUF63xqulIL51CNb7p9UNTfWMgGaJCnTRW4Rmg6HQZ+jlnTt2f44pxBDYr31Bs4xQ3HmlENrZp8TPAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Izmnxo+z; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYxtFmnxE0kgmpr/cq+6C/wZWhXypM3cZaFBG/FV2ldn0T9PqCtjgnYZVegf/XNK4CU51tx0+RabZ6f0lWVliucFOhLNavilk55lhxZKuVeX0IU9GRm9qNCGUYpdPnJYnRMeokIYkwko/vEYLa6ZCb2fWkjR06d1o2OQsRtx7yXwGyIphi4GBRQWxiAvckmX/uYgRXCJVtrRILxli+0YL5dMwn/Uwgi1DLQM1JSx71YZ6NdMO/tql132/9GoONXJgWE0c3Yp0ezVBtJgjQrN78s57SqJKKIErpGI28y/yMFNyupi6UmDnOkQ1P6Om8cASAwwfCwXbQMC1UjYJHSDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmHJhBIiOYQMlKHkhDnSRcPvr+kQigj2uuSVqJaw6Ro=;
 b=g+3Qtum5SgIFJqw9q+UXQqyvFpFtcbtiA3+wYoE2cxqkYXEONOQWrpk7dBIFA9vsosAynM7nHK2DpwOIyfpL44+HhgTVtTwaAKkQcYdn7/D/xn3U5f2I0DWFLJ+jJwnIBFsIp/u0eOHCuPJrtc8dF0tzORYRwQ9QRvmiqEcVK/2upjI7XoWT58lChiB2o3iPRkRseKuGn/zrfC0RllXCZC6Aa79Gzk5xMnChNOSri4RGMZFOo/iDMYI37V1u8/VE6GOI0jJ8xRPrA8meL5JaWt6xE2/PPvij1PowvGbWW/eDekWTlEg0Uv++uDVHWNUI5y1cHnYcyu+rrF095KF/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmHJhBIiOYQMlKHkhDnSRcPvr+kQigj2uuSVqJaw6Ro=;
 b=Izmnxo+z6ff/kD3b3gFJadJVjM99ERUbDXotjeHOboJNjvAriWfJHyl+y4cJtqtv2R3FpsNLAxGkb1/scMJ1JHmEz764MMO/FmW7g3X8kbMYXr9VOBxssq8roHQ8Qbd/pVTlMngmlzrXkzIrUanE8rQ8hbRx1lg8Y2wLHt0ok04=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TYWPR01MB7234.jpnprd01.prod.outlook.com (2603:1096:400:c7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Fri, 22 May
 2026 10:47:14 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 10:47:14 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	niklas.soderlund <niklas.soderlund@ragnatech.se>, Paul Barker
	<paul@pbarker.dev>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net-next v4 05/13] net: renesas: rswitch: add exception
 path for packets with unknown dst MAC
Thread-Topic: [PATCH net-next v4 05/13] net: renesas: rswitch: add exception
 path for packets with unknown dst MAC
Thread-Index: AQHc4SOMjiP2EZKQr0qNzD7alKPrUrYLL8gAgA6+JIA=
Date: Fri, 22 May 2026 10:47:14 +0000
Message-ID:
 <TY4PR01MB14282ABE2BE7EF7114DCCDDB5820F2@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260511-rswitch_add_vlans-v4-0-a5a225f8faae@renesas.com>
	<20260511-rswitch_add_vlans-v4-5-a5a225f8faae@renesas.com>
 <20260512183716.482f3f90@kernel.org>
In-Reply-To: <20260512183716.482f3f90@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TYWPR01MB7234:EE_
x-ms-office365-filtering-correlation-id: 2d62b97d-ff1f-459e-6c5a-08deb7ef7c66
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|18002099003|22082099003|11063799006|56012099003|38070700021|4143699003;
x-microsoft-antispam-message-info:
 AFGhMbyr3pxkKT0VKPIZoAW4pqXgubRJjY8xpzFSSHH7r6AfKLmAeBNNZo1s9dll18PHR6Ji5Ugy0ldR8vm8eo+WgfWScQcak/yCJMenutXclmlLJfHdSRZLDqahxbpbXbW5tT2AjJdef53WOBhLzZYPr+PYqAancRBqpLRmL1XVnFg5qinj8m+3rKaloKUA9WU0LK1pIdQ4wSz7I1AFn/QyWv/9KfXtbVq80SFR8kSpA4MvhWgaUrfZxhRmYABhKOpCbSRfczTmyXgVQlbYBxfjKcF+uQvz0/UA5awWZEDAXlEgBnyulS7LNcucU2pDEIK9jLobfsf/pGABqSq/3E/vlCbbIEpNmRGOvnJLUtiErgUWgXEUE/jbhiqnKyy2zXTwCMuakHIpHTeopBfQBqfb9tAxeDuld+Fh2zJhH2WX2AusjhgVXZUX254+7D3Se+fZ9uBDaROCu3tdDinwi47RVWyNAy4/KZPkM29sAnxIxUJJe2lp2UnhU2A2AVxmvOL78s72dT22GBB5NphfqkDB5C60QBG4O2kOX6LniN0D7FpSFwcA9DU7BpDl6TR6Rk9AO/HYkvWlwsYNB3/plOQXhdDvQpg338e2cHRBRpqBJrmp2nLLLEM3xc+qwfepSt+3+PE6D9Mncr76J7xHrYtxtw42eeengTAOJDpAcacV92X6udmvhmZSWfTq53cB4ZhNiBq4jFNyYtWXaQcBH6dcH2a9zKhrJFKvQKWt8kwHAASmHbtXHnIl1Brervfd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(11063799006)(56012099003)(38070700021)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NYwqzMW/x4ou65CkRDfsxzw+bbmwuS19fDupYJ7DdaQWF/2Dr3Y3JwIcrnCQ?=
 =?us-ascii?Q?3WsjZk9ZIiDh/8KBOCYnebKtTKuz5cXYGV6fm3wzTW2dk2HWpRBWpyBne0U+?=
 =?us-ascii?Q?DFsvwiTLAMyfW4Nv9FLw1YAj7zQz8lZ5VblnXitTLkbGmFZ6+8JtyUpPWIfd?=
 =?us-ascii?Q?iwLwJ4Uc8WN1tDbTpjThw2YkshXcXyQm6niFOfnbQDcI9Siw6BdRmcIovrM6?=
 =?us-ascii?Q?TPlsxcUiA5rgO4UZVl9z2UfYKrbUDydGWL014fmXwWCTGSTXx8MxPjz630pV?=
 =?us-ascii?Q?KSfV9OHBPK2RybC8P4JEFP0Eu94kUz8kfYd7gtavGUnLCjil6QY0sPvRBiKf?=
 =?us-ascii?Q?sHIbqgXnX5cB5V0qt1XlBQEPa+9z8ZfqaGGk85ti3XuCSshbwdkaAcTl2yz8?=
 =?us-ascii?Q?2mllh5nxhynQWzHlH8UL4l22APjwqQlpgmTdZ1R19qxjwA/oqjt2rIT3MkdP?=
 =?us-ascii?Q?yMo//B2FrGwopLh399DlQZW8bp+F1NhEHKmCqXHWguO6JT+M7D6eMlE6eE1o?=
 =?us-ascii?Q?C2szLlv33ZIVAo0IlVx9n7S3amdFfeQHinoOY/n7xHWwVVkOzvBEshwwFOQu?=
 =?us-ascii?Q?3Ggb9sYasvjGlZQuA8l2P/y8a03TmCoyz5PX6FePsVJoiigy262p2tMZCIVe?=
 =?us-ascii?Q?8mu7OV5ZJ6KstnXMCSIMKHVOh4ileF6nNz3zVpqL5TmTlXAZrw/vAvaQZxq6?=
 =?us-ascii?Q?SyvMIGOvDEZDhhZaL+vbul9BRZVOlf0KNMSqztdJZe4p35Lt4YUGaumR2uEm?=
 =?us-ascii?Q?FyyyLSPLt9eo6t8sO1M/muPkmPsu/VpRDc1wIFVfoDJ6yZGnZW2BPVEVRojW?=
 =?us-ascii?Q?nnT5B3QotDkTerJkneziOmF5Z7E/Vde8NkZ2q/Wt1SJd1ubgDyHnuRQQUqv7?=
 =?us-ascii?Q?2F40HVLxQFrkckuvbdAKXgPfGSGIJJSewUsCsTDjf30oDEDPdVOQU+Wh8Dqj?=
 =?us-ascii?Q?K2jP5+vWVBsECocn15sccvfukvSoontJn+aburrJaZucu2HeaqgEBtoWbuiO?=
 =?us-ascii?Q?ZmCVcmToN2nxWEySWo2JV//ovTKjHVq/PG/Lt9khKvzhLCEwrVII4o3a6UBo?=
 =?us-ascii?Q?h6putRaKj4Q3f5s+g8lkCF9LCayHMvc5pFhST9kCC+kqBoGpcaNnwseIiNPY?=
 =?us-ascii?Q?WkQJbBR2OqplSpFxu3euC6xwtPstl3KuxekvEpXiG3C7MCa6rH27sC6ZXhPD?=
 =?us-ascii?Q?4QQP2v0+jUjGmm7CNUCFxY5FeJhP7QQhOTAgKWK7gEfPtO6yV5+cOKOUYsCn?=
 =?us-ascii?Q?MFOWVFyLraHm7SVNf3Pu/Ka/cmHcRG3Plku9V7Xqq5k6HR+V2khnxCVEDPU7?=
 =?us-ascii?Q?u/JF0cP2gzBJ4/dcIOkNXBPBPDQNKqMSXZrlTqNEhZPzqSx+bdFEi1YJBfSX?=
 =?us-ascii?Q?5OWO4mkmL3t8X0bqONZ/Ctc92pezZZyPd351mOdIuYFe1eGZEnPbrn3clkxb?=
 =?us-ascii?Q?0WbiOhms3P24OWo4sx+A8VRconQEDwGkX8569ABLhBXDg++hfW+7GQajLo+f?=
 =?us-ascii?Q?O/ScBf4SvZxNR8Ky8/pzxq6dSZ++ZssT4Bo/xNsjg6ugnganVSR7VOFekAgG?=
 =?us-ascii?Q?PB8rWdX0X8x4P35CUE+UacB0FqRmCx7T/zpuCaiGWyOtxAHYAkRT/2OTDTC3?=
 =?us-ascii?Q?Xue9sN22iuust/ix7uEB9orS6jMY7aGVjf+s5ucJHqyZkw/MVmfy66Tco8mR?=
 =?us-ascii?Q?k+1oGcU44JEo5aKaf690dkveBqsp2tkRAploeG7zrL7IE78vrKHrL+wl/Qca?=
 =?us-ascii?Q?Df0IgPgk9Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d62b97d-ff1f-459e-6c5a-08deb7ef7c66
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 10:47:14.4743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16ug69gs9gVflHOHFI9aFuZcqPov49XIq6vg1yxrCK77SI7UiSxnhp9x4quVVsNMjUqVJFPViclnz/xWzbEQ+C22sHbUgmhkKyJLHzmMscM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7234
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32960-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pbarker.dev:email,renesas.com:email,renesas.com:dkim,lunn.ch:email]
X-Rspamd-Queue-Id: AF6005B2901
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Jakub,

Thank you very much for your review.

> -----Original Message-----
> From: Jakub Kicinski <kuba@kernel.org>
> Sent: Wednesday, May 13, 2026 3:37 AM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Andrew Lunn <an=
drew+netdev@lunn.ch>; David
> S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Paol=
o Abeni <pabeni@redhat.com>;
> niklas.soderlund <niklas.soderlund@ragnatech.se>; Paul Barker <paul@pbark=
er.dev>;
> netdev@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-kernel@v=
ger.kernel.org
> Subject: Re: [PATCH net-next v4 05/13] net: renesas: rswitch: add excepti=
on path for packets with
> unknown dst MAC
>=20
> On Mon, 11 May 2026 10:52:08 +0200 Michael Dege wrote:
> > Packets with unknown MAC address cannot be handled by the HW forwarding=
.
> > These need to be forwarded, via an exception path, to the network drive=
r.
> >
> > Creates a queue for the exeption path. Packets received with unknown
> > src/dst address need to be passed to the CPU. The received packet does
> > not have the correct source port information, this is derived from the
> > descriptor and added to the new queue. The received packet is added to
> > the new queue and sent to the CPU for MAC learning. The CPU will
> > broadcast the received packet, to all ports. This is how the HW learns
> > the new MAC address.
>=20
> I sent the AI reviews out just in case, main reason I'm dropping this fro=
m pw is the new sparse build
> warning here:

The AI reviews have been very helpful for the most part.
>=20
> drivers/net/ethernet/renesas/rswitch_main.c:1015:23: warning: cast to res=
tricted __le64
> drivers/net/ethernet/renesas/rswitch_main.c:1015:23: warning: restricted =
__le64 degrades to integer
> drivers/net/ethernet/renesas/rswitch_main.c:1015:23: warning: restricted =
__le64 degrades to integer

This is now fixed.

Best regards,

Michael

