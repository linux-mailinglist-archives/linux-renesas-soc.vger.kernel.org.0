Return-Path: <linux-renesas-soc+bounces-32968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA0WCLhIEGrzVgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:14:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D32FD5B3AE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0610F3002319
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097E3368D5A;
	Fri, 22 May 2026 12:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VnY1+Lnz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010063.outbound.protection.outlook.com [52.101.228.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A543644C2;
	Fri, 22 May 2026 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451816; cv=fail; b=d80jmmFl25dmQMhDSn4nOFjpetTpC438w726e55jX4w7LTxchnLc0mJC7OpjIECIPRR4vprmMR2l2P5r1h2lE8FktkPPbAWoeBU4YaOOvkS6w+DNGMGPnwVwabI5O/nZ+RGT87ETZMKwtcc08aAk2Cf4+MsPCfjEXjpraPjP/tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451816; c=relaxed/simple;
	bh=F263kRoE1VmlQMyYEf/Xpab457xCs46qa2X4B05HOPA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ovsfZRrxk+H1SujcQkZOR+uMd6qz/M043casyAB+fBRtABbGml9WHRmZtgUXm+LacyngNpIGKpjJNk7mmpk1ZK/CdF7p8epCcgsyW4sTofhqz66AxsfHEKlMXhW0Z+Ifr8WEnDBYtDQsWcBinHbetcXAb7utLNIDTrB33ds2d7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VnY1+Lnz; arc=fail smtp.client-ip=52.101.228.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6aW6Zrdv9q1oqRGDxr+tOyZT2pNzCWaVpbFoxS6+CcC44WXfCijxVryFiLjlOrTr+utlYFZGSvgUrdX3oRZEfHvm+mDe/jfhtMOTkE8GA4lawfWSKa2KIoEI47pEZqf505J1SG9yFNhY9+Hh3PxaODTwHjy3Cjdcq2yIqzPw94As/6SPmNKOG3Y43MqCGJidEuB77K0sX4mmlhcYxWn85xNHk4wfq4/j5aP752ZsuHPe4XDZXN8crDOGOErvw6nttdCmGXquGSIF2IsWxS2/w+afs7d9BKkKB82vp4oKC8p1+KB1gL0fTV8ECbNnTNSt+OR9s1LxjlEiX/+9hKkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KI5ZCuzcSeGnN1i4YQCgPKO0Kr5T9T10h+K01s40Xts=;
 b=i6ygG/C7AIdSKl9NSvfvV7Rda5XQVo3si2Nxj1TnvTQ8zb63hu3srEUkCVIovpmAedtQAOekWFkropsgysLHb0euIHTjZ9JG/SLkXiNIs4+d/5FsXqzX2HH9c8G0lscRONJxGXcnSNys1pH60W6UnjzrO9ABf1QkYY89KfMXACDfATFtZzfdWK62FoL06UJd0RP7JzUSgqhsIv9rJCA35fTgsBuO112eKSggscQfzw/NmNz+SA1Rpcc5iQhsaiWlVxwplc3fRZEvid5jdIQnYFK9iiHU4xVq2Syh9OIvVN2a+U2u1jqK5S2nSCR692SEzTPITIEuhn5QyhMvxi4KGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KI5ZCuzcSeGnN1i4YQCgPKO0Kr5T9T10h+K01s40Xts=;
 b=VnY1+LnzWk8avOlJSYUik2wzhIQIC/zBBEm825Ml9fRgsQfo0bku4VAVk22BaCYMZzd8Q0Bs45phVeLMutsdAKizJiiM3U209C05KGSx6JR8JclBuY7NlE1LvGLlVRTA/VXBuzqkSEHaYfEeBnspEa7UmWKc+cHxnb7Uhktnt3A=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TYWPR01MB10612.jpnprd01.prod.outlook.com (2603:1096:400:2a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:10:10 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 12:10:10 +0000
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
Subject: RE: [PATCH net-next v4 02/13] net: renesas: rswitch: use device
 instead of net_device
Thread-Topic: [PATCH net-next v4 02/13] net: renesas: rswitch: use device
 instead of net_device
Thread-Index: AQHc4SOF1rs2PlWueUqJfdBhAVRetrYLL2CAgA7VtJA=
Date: Fri, 22 May 2026 12:10:10 +0000
Message-ID:
 <TY4PR01MB14282912CBD7E88071B1FBE26820F2@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260511-rswitch_add_vlans-v4-2-a5a225f8faae@renesas.com>
 <20260513013549.1408370-1-kuba@kernel.org>
In-Reply-To: <20260513013549.1408370-1-kuba@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TYWPR01MB10612:EE_
x-ms-office365-filtering-correlation-id: d5bd5f5f-2912-49fb-9d30-08deb7fb123e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|11063799006|5023799004|4143699003|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 7P/b/3ufuvj3OXS660j/M61yW/7FVTuPF8jqvVdLGuopV1R/MwTctipVVpxnzhQmTzzBLwddIAI6Y6v/u4Cvg2d1maKAQ8sybLMgX2gMBnGPpS6qz2bY5qWL7ee0d6Vm8Afl1ae86WiuQM5kqY6bzt1IrSOb6Pt7OJse7R9/WYuWT1YBMMx1ZOheMpf/o+JB0v/Pm/URKECGMi1VpyYW17fvH/ScNHyvc12MdYjgRrf3VO6oGplLcjnhb6DIFloHmqfHaU0w399dIyIHGmN73voAnWdNBt+1eOZeSUDd4rEUzJ9NudX4MZ6snWwIvzkjA3ALe1bDw6rtcb9VfEvUMsM1+D1rqW9+fl9K+/QPhy9W3wXWkRZj07dI12rm3+oFvjDw13qCFuyAHvObbbs+Fok5dpcqOeFbodnw2iMyium59Z7S3NIy44mA2Nsv/0K84RMlMtafcJWUBQzrC7zSaFPZmHdiLgfz/OxktKcqZr/7/uTWuzDaZL+YRhvWOUq9Aj3yfeHSZ8r4yS4ld+kJFz5W3Jee21Puk5/vySd22GtU7iOKznGr7sSLWtwipB0xZ30+aeC6SdTjDqRMBr9n98C2Fh8KEDPvXopeCLIgrsX9I+9Rs95VODE+9jSEH/9+cifdA9mtjpi6Xvq2SU4QPxesnapdcRRnQPa52FJrjsSdF8Xxe7od3ddFEyBBhqd1VR5yzVKbjn8EXEcsSxsmOJ7xJz1/XPb0U2APGkng2mvV+8hA95DTTEoPoTx2pmZS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(11063799006)(5023799004)(4143699003)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?P/7essQu/RMQAYdQcJcjfe9VDm9Pi+TQi+crDomvrP2Oxm+KvvaLhzBUkhl+?=
 =?us-ascii?Q?5Hk/ldE+B3NJNqKqgaBuBpScKVcD9gKQnntgcsULjMgRS2Bwp8/4xoumfu7F?=
 =?us-ascii?Q?Sm1Rnx4w5SXvnB8+fYfqYmhY+1FZ6XTLnsXqACWqItstQp1MEt2ANkSUjnAq?=
 =?us-ascii?Q?3WAYVBCt2Ze18gP2F8aSyg59oxgKjVD0U8uq+7hsGyLg69M0fHE2jtj2+lJb?=
 =?us-ascii?Q?vrlHhPWHcT24SlATlK3UzBcLLxJAMr3t65B/uqId2PF0n8EAsSojJ0XCFJRu?=
 =?us-ascii?Q?JlA1R7TP/PdnDds1Bw/OJ7D7aqsw0U6PXIszPTeQmYyT40IaxQCpM+raEytW?=
 =?us-ascii?Q?aSqb74T5f58ploX0wDKd0E3Phtt7gz3BTRq5BXhacUqiTe6UpAxyAM8B4xKp?=
 =?us-ascii?Q?hH0ElDopQF98wPsjN9syzlBkIoA34iw0w5GNEzMemcOtcECE6rNGAm9Qw3dp?=
 =?us-ascii?Q?GSaCqItItqhZLTfsHAJRi8RsGbYGjxQSV9nCQeC9Ivuakyq9KOXivXuxzcSy?=
 =?us-ascii?Q?iH6id1EQhDDo3dBaVfrX4+QMj/wBYgeOlprSLB5eUJDpCUtD+gej6ehOp4YN?=
 =?us-ascii?Q?JzRtS0QnvC5X18MmVLahJCXLrRX9/YOYjWaFdmsUok7c9F9l55PxvQxuUtRo?=
 =?us-ascii?Q?k+86Ex5v15iNbFVUT+jIUDLNaEyNipH6L2O1USRBEWH0+vLBA/+3GL/Fb+N1?=
 =?us-ascii?Q?UrAe2BwXM1jHGrelB2YNSJ0mTID2LU7nE5lAytpuXkqmGzXlgvEwT2hmDpn2?=
 =?us-ascii?Q?6+kTPEb6JvSngdJmgAGgsqRVm5F6CIZ9or4FHWoJiEhOEo2UyBm1aytIVaC+?=
 =?us-ascii?Q?Dzj9y7KD3qhK6G+63IY5/kFCNTywZ5ghfz73MIS9Pw51A7VmC5OE9BwyiioY?=
 =?us-ascii?Q?sVmn+A8istvWiM60UbmL15TSsDij4NA77l6WBvc4VMfoTJtJxHV+3Evksyam?=
 =?us-ascii?Q?Gfu3n53O9avlkGgSUT6uAo6rOnldjYZGo32yUqjM1NA4Cxq5xFI4lPZVgLPA?=
 =?us-ascii?Q?hPQNOjYguY3t+EifO1ntKloTwoNSUxJwnOPfUIbJPOF5JCB/lMlhAHOnOvDQ?=
 =?us-ascii?Q?5Wy9JK5tcHPgzc44IN7BysMvJraTupt/TFsacMZ+pyTE+wfDGd84Ro6LIe3l?=
 =?us-ascii?Q?MDed5Ixsz5L03Cf+9WDEQTYld1YDtwAkdbbCPsYlPQ/r6dCSiFbh/DVt6MFc?=
 =?us-ascii?Q?q+UsaClBGPKf39TVh9qj74LAkOe/nrSxnNf3GJaaDwQzmDb1GVtS/JxiO3yH?=
 =?us-ascii?Q?5IMotnZjuvGzLmElzM+xGJP+pDXJgYS1pOWZRa4yDCG3liQs5exdfL2t7oGW?=
 =?us-ascii?Q?eiFv8OeTPan1lY0uiCX3H+j3pFpsO/a0OVK1w/088iMmKWD8xJ13AKMxF5ec?=
 =?us-ascii?Q?XIR7SiKVnznt6ChiR+8/+uVnqnoLXBX3ao4i6U3mf93rxVJansXxla32RDCg?=
 =?us-ascii?Q?8Wsib1NuW7V8P1l9kP84pxz3A3k0CKQBGe1usPT9kzCA+xW/Nur7AJVVHLUP?=
 =?us-ascii?Q?wDbRO4efqLkmGEXewUt4iyWTnAJentBOW/q2IsNYSazW1rbtxch9JIzGhoAP?=
 =?us-ascii?Q?1CgBxq6ppi0rOBSGUGuip35MTgyTmZokBA12GJdcBIfTZxrc8fEjD9f250dZ?=
 =?us-ascii?Q?LiLErjwNiwIkUb7336VjI5g4LApX0QvgmKjsH++R13y5NOF6Q1w9xHs8xjW/?=
 =?us-ascii?Q?Xnmx70oIOJ7oDKoA1/yzkQADlPBEeiahgQRJjIFYzzJWDzOAD2C/CkvMaZyY?=
 =?us-ascii?Q?lGM26ekxPg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bd5f5f-2912-49fb-9d30-08deb7fb123e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 12:10:10.3469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U5tQO2LxNpj5vZlrcueg+lzhlbmjZJjMk0cGjNR5EYWIqhqO2W3W8MQYrFiy0F4TeRsl8Iu+tQjLGL+vYxzZVBRCSvrLoKLVC4xfq7KNPhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10612
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32968-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY4PR01MB14282.jpnprd01.prod.outlook.com:mid,ragnatech.se:email,pbarker.dev:email,renesas.com:email,renesas.com:dkim,lunn.ch:email,davemloft.net:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D32FD5B3AE1
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
> Subject: Re: [PATCH net-next v4 02/13] net: renesas: rswitch: use device =
instead of net_device
>=20
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
> ---
> net: renesas: rswitch: use device instead of net_device
>=20
> This commit updates the driver to use struct device instead of struct net=
_device for queue allocation
> and freeing. This prepares the code for upcoming VLAN support where the n=
et_device might not always be
> available.
>=20
> > diff --git a/drivers/net/ethernet/renesas/rswitch_main.c
> > b/drivers/net/ethernet/renesas/rswitch_main.c
> > --- a/drivers/net/ethernet/renesas/rswitch_main.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> > @@ -304,13 +304,13 @@ static int rswitch_gwca_queue_alloc_rx_buf(struct=
 rswitch_gwca_queue *gq,
> >  	return -ENOMEM;
> >  }
> >
> > -static void rswitch_gwca_queue_free(struct net_device *ndev,
> > +static void rswitch_gwca_queue_free(struct device *dev,
> >  				    struct rswitch_gwca_queue *gq)  {
> >  	unsigned int i;
> >
> >  	if (!gq->dir_tx) {
> > -		dma_free_coherent(ndev->dev.parent,
> > +		dma_free_coherent(dev,
> >  				  sizeof(struct rswitch_ext_ts_desc) *
> >  				  (gq->ring_size + 1), gq->rx_ring, gq->ring_dma);
>=20
> This wasn't introduced by this patch, but if rswitch_gwca_queue_alloc() f=
ails during or before the
> dma_alloc_coherent() step, gq->rx_ring will remain NULL.
>=20
> Since dma_free_coherent() is not guaranteed to handle NULL virtual addres=
ses safely across all
> architectures, could this pass a NULL pointer and cause a crash? Does it =
make sense to conditionalize
> the frees here and in the tx path?
>=20
> >  		gq->rx_ring =3D NULL;
>=20
> I notice another pre-existing issue in the unquoted context just below th=
is. When
> rswitch_gwca_queue_alloc() fails, gq->rx_bufs can contain NULL pointers.
>=20
> Since the loop calls skb_free_frag(gq->rx_bufs[i]), and skb_free_frag() w=
raps page_frag_free() which
> does not check for NULL, would this result in an out-of-bounds page struc=
t dereference and a kernel
> panic?
>=20
> Would it be safer to add a NULL check before calling skb_free_frag()?
>=20
> [ ... ]
>=20
> > @@ -508,7 +506,7 @@ static int rswitch_gwca_queue_ext_ts_fill(struct ne=
t_device *ndev,
> >  			index =3D (i + start_index) % gq->ring_size;
> >  			desc =3D &gq->rx_ring[index];
> >  			dma_addr =3D rswitch_desc_get_dptr(&desc->desc);
> > -			dma_unmap_single(ndev->dev.parent, dma_addr,
> > +			dma_unmap_single(dev, dma_addr,
> >  					 RSWITCH_MAP_BUF_SIZE, DMA_FROM_DEVICE);
> >  		}
> >  	}
>=20
> I noticed a concurrency issue in this pre-existing error path. Earlier in=
 this function, the driver
> transfers ownership of each descriptor to the hardware by setting desc->d=
esc.die_dt and executing a
> dma_wmb().
>=20
> If a subsequent dma_map_single() fails, this error path unmaps the previo=
usly mapped buffers but does
> not revoke hardware ownership by clearing desc->desc.die_dt.
>=20
> Because the hardware was already granted ownership, could it actively DMA=
 incoming packets into the
> unmapped memory before the device is finally halted? Would it be safer to=
 clear the
?
> --
> pw-bot: cr

I reworked the whole function. Now this should not be the case anymore. I a=
lso added clearing of the=20
ownership flag and issue a memory barrier before unmapping the buffers.

Best regards,

Michael

