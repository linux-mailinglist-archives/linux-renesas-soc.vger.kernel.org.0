Return-Path: <linux-renesas-soc+bounces-31096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAtAMtGu12kMRQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 15:51:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 235313CB92B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 15:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 913593050234
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 13:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D631C3B9DAB;
	Thu,  9 Apr 2026 13:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pgt1KZ9b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E5339DBC0;
	Thu,  9 Apr 2026 13:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742227; cv=fail; b=eeETStwKhE4ERJqlT5rSz2tNm8G/dt3fmJa4fqgje6MJNrRlaE5cF/bPimHzOPYh+RIJ5C1ExatfxR+r38IYUFWkt9wDIXuJ9oVBBpWJbmSXKF2P/VvTwWHWxCFFbPhyt9GNZzf+jTkmSYjwsgDRWJPiCzs4T9e5J2wpYjcPBm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742227; c=relaxed/simple;
	bh=WOBmIQZfo5OyA+/S+lwEy7Iajsbf8snYwgY3bLMquL0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DzhXOeGDzrm8GzfAqoYoOM1dgb0nGFPR049KgN+w50PhTF/jUp+RB6wIP8rPEohmbzJFRZoSplZDAFjy92ERG/vOtLOaXctzdqmJWBGWwh88bi+Aw5JiwosHsZEQE+Qu+M/E3OSatuiYW/HeJC+giFMMHIuAdpWwE6YXddawLeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pgt1KZ9b; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQEyTa0YkF+/T8ZIdSUzKKT+IrCph4KfRX4MaHIY0blc3AXFP0EY5NShF2uRelQg44hiiJeYjU1UDAu5F4zX8bugb+ZpeRMIFuOMmX50/wxJ58rDQRR0QYxvjjl4bSm3VBl3AyhryxomLOUP0PYiYOGVRGWjO3erXOCch9WYbwBotes6CrbY0UjLbIkXMtd2qxAyzo6Lqm+fAMb1/AEqvSHwfJQtWOMyH7wiEsf54H19CDBzBxBsRaXqXywVVutD8sCty/s39vJpDcKi6xrQQ3uM2VzsOxwLY0fu+t9ORfQAPK4yYBRE7s3/y0yEP1t2vwxrb2QPL1C42dBvX01Ppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2v9SqCll8FDBmEdqCmGa5svvQGZzWdh+OBfnZObKVNE=;
 b=eUQU2xn8JezgFki/UpGrM3aodtgjLdZhy0ezLfPO0vRMX9VFNU9uohbkvykA5Vtjodl7F/vRoZ70DPUwM3OmOY23PDpbe3rN5SmVbIF3VEQ0HLj8Z0/GdXe2LEkyhgIWLzmVqFIrukALX/nu6iwqGJXIIzE2uh8jPeP/6RK42GJkugcCX12ltqggmZ2/59X8+vZXbo27MfQd2P47EaSETlr4thlttR5wmCkGUXtUun9WCy2ZpVpDdYhlurcMKxFQ07AQNTbYcUwXEGuVhuBxh84VhG+OvNOtvzP9lgztzNAE54PLfewhpaI+GvHsrtXjCewmo7ltOKhzcwxCs51CIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2v9SqCll8FDBmEdqCmGa5svvQGZzWdh+OBfnZObKVNE=;
 b=pgt1KZ9blDiJKaZJoXrbRh/jmYWTB6yCMSngvQ8fJft0eBzspxpnHLjx7MHTmCOcg7ndhOpkZzx9GF1IMhDbs6ERk1LKX2LfA6knpKI29jHL2f/e/enu4oLiPuoyip6A0tIWdrj9E8BwAkJHEA/L8LPb5fQEMszp1kUr4HyxwB4=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TY3PR01MB11840.jpnprd01.prod.outlook.com (2603:1096:400:407::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 13:43:42 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.20.9769.041; Thu, 9 Apr 2026
 13:43:41 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Paolo Abeni <pabeni@redhat.com>
CC: "paul@pbarker.dev" <paul@pbarker.dev>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, "kuba@kernel.org" <kuba@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>
Subject: RE: [net-next,v3,04/13] net: renesas: rswitch: add register
 definitions for vlan support
Thread-Topic: [net-next,v3,04/13] net: renesas: rswitch: add register
 definitions for vlan support
Thread-Index: AQHcwqCPHg/o4QpEGk++l3HLfVuIO7XWyCkA
Date: Thu, 9 Apr 2026 13:43:41 +0000
Message-ID:
 <TY4PR01MB14282C1DD6A8CCCC6CDAF21C682582@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260331-rswitch_add_vlans-v3-4-c37f41b1c556@renesas.com>
 <20260402125919.234448-1-pabeni@redhat.com>
In-Reply-To: <20260402125919.234448-1-pabeni@redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TY3PR01MB11840:EE_
x-ms-office365-filtering-correlation-id: ef6ad6fd-174b-4a0f-1b69-08de963e032e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 M3jzSYLshtqG7LRS88hPZRvjhexfNFxhqF3TAnCP+h8aM9Pyn0qb/rZpre530ldcJanddP4DPGhSr1GKfyGfImLOAjIbCk5Y/QibFyMdrefqFFa25xXUhB2ZdDWG00kR6hMn8Nq4TAOr5Cf+aV59bd7deZ6hyyIyy4u96C9P5sw/Y+fJ0T5yFZQ3Wd0pi7JWtuX0G/xRnSuLXHwWbPMSKpREfTW3qNnTW81N939n7A/+txia5VYw2rIjpiB8UHDv+5tbJnLdgtds+kwxRKF09M4/iAA+lCc/aubM7QKoW2HTNRt4UmlcTe+0tIOkpKStix6ELNf/JTFwAUP53zO+SM62mJUL2R0L4ePuKjpG20TR6DC+Y5rbIUzGYy4M1dlfRRpwj6nqBrqVsKJy4IDttrSK1H7gXzB1VCOX/0zJE0sf0qf9ySz3qMgjDyA0nQ2JFNWQqlAHoL7ZLsrTTx/eBkPhDMp8MmtIUGI5zZ0sKMkFjoBfp7wldqpx9vvozqaoPdo04YN0JqbN3p1AjIMfJ1FQjxFc9jjo04XamqpzTB4Z+DuEYzQwmJ3aKAe2VOtHtuqLRsmlNN34rvCg11F0tHtTA7s0hkhz7N5gd5rvlqZHpSvITWSdoglMAF0u8nkobZ9aL6M7kqDNKjWnHCJ+Oc+Uv8Zpr2P2M+7ePrkSzZm3U8b2lYfREdQDM+Q9qz/0mm6fCzYKbJpUhgwy3mqwqZ9CqpINEGBanIz+uL8U3Jg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1OXy35b6jobTEiEzDPh3LXxcmvbF5KWR2xZbPhfK1Fth499vRsgaq1CJT0Ti?=
 =?us-ascii?Q?wjufeAkOOde8eAlwoUIKJWkc8v7ERKBQx5tYQtQb6Cnhc8TtB+NftzxZrczs?=
 =?us-ascii?Q?eaURoCVzEg4ZGyYSH8xuR6SnQdn9d5j/tUKUZXnExrwS+dQkPxuG/aunDjmO?=
 =?us-ascii?Q?59/9QG0vwguNZuGHD9VTJRflEDSivxZ51CtmnKCZeoBMfksbnRAVSpu04Vb8?=
 =?us-ascii?Q?LX7rBorNOXRTEy0Xi1JiPFMF8oPauzRSiypqqN81HVpPef/8tNwFLQP0vCSZ?=
 =?us-ascii?Q?cXmEG7JPh7MektcLsKsoOlgeogGUJeznemJQ388m5l2Ll9kaBZP/zYbFO1QY?=
 =?us-ascii?Q?S5UgWIW2cLP1iIxrfdwNqT6P+SPTCQrVTqoGrbUL4mq9E3iE8Npfw1TO3IEo?=
 =?us-ascii?Q?UFV14VeqhDk1LFxEwG+Db/2hT8gbT1KFeGDKCBEE5KGtKxAhtxuFia65FRYK?=
 =?us-ascii?Q?k2/BFhCGJjgXnxBThrwU5xVS9ySk9UW+PuSr5zvXdMiTfAzkeQIF52Ob1qHg?=
 =?us-ascii?Q?WaNe0a7+miV0Mzwoz3T2EX63flSRTn5mh7nSiqHHcJlcmowZtveMbnE0O9LV?=
 =?us-ascii?Q?hh8XIENO7c09dYnaoIy9+87cqe8izldyJduzziwYltI4gbaqi7XwJzTxtTln?=
 =?us-ascii?Q?1ZCaYg6YNGujK59gahZSzKcBJlDs8DUByBr0PcrX9CIZ/4aHfY6Ta0tlYG4p?=
 =?us-ascii?Q?3tGa53Fo09XSxJJyKMdCGj6EAfObhHKXf98STe9tJsmqp91DhIUZ6lfHJter?=
 =?us-ascii?Q?Y5ogp8iRgW3wCAjB3NYp2Duuf12EVa4dhvHFkwxkxf0/GgtFGkdDgijGhYV7?=
 =?us-ascii?Q?M0L6IcDT9V8Lxy3Pr2KDVJjNfcr5n/Y2vy2wNryOHwFI1s306SSH/2GUQdzn?=
 =?us-ascii?Q?UhQr2dUClJU5NS8p7DPwDvq3nyAI7fBGms12IrJcJCHQO1ETNfAPmTwrOUjC?=
 =?us-ascii?Q?vU6MnaDQXVhTvlDzFJigo9Ka8nhjas1bPZMQzWsBkfFCV2DOC+0+7kt32+mr?=
 =?us-ascii?Q?2+tUjFLkhtsKpvohgGCaE9gO6HV9c3ssIb7SEoKQAH4xIQgDSh3CaXWHngt5?=
 =?us-ascii?Q?Tl4nC9dBpMsR22my8BM1mlf+KqT078D7ZFma4dGqwqsw1PM+ohBKjhp0Vb8f?=
 =?us-ascii?Q?2NFBymgln/Kw81Ojp81cnhTTI79fOAx9yTm7M1/AFqmnERL6txLncqBAcTXa?=
 =?us-ascii?Q?S2kzCyxURAUE3HRKs9jslv+KSS+dddDl6/6/ACUeAIUE0RgM30yJeW9kTfWu?=
 =?us-ascii?Q?Zb0hSw0Eyzo7U7zqrqXzOhodq5xGxY9bN8GDA/cHJiU/Nv1aH9wY+RzU72Og?=
 =?us-ascii?Q?QVJoLnbmiJHuO2meMSmFWuCqOuVx+HCAos48B4uDlS3MWDr0Aqn9/pfWLwp1?=
 =?us-ascii?Q?mPPfBw4lpMWwj+gyQZMMuZQW8oZVJPEZckC42bgZEaJurcZDzgouP8WvS3PA?=
 =?us-ascii?Q?n4FvjxBPsakaI3ALTM1NI8IsN6+txDPYI5OwJbTPKDaeQZcQ4MSZru2UaoS3?=
 =?us-ascii?Q?gIlM8jkuBVWz6nHgzNeAd3Gj5NurEaFzmdorQl25VVOLk+0Ks8GaQ0yjGSoN?=
 =?us-ascii?Q?SLFo7TM5shHgJJVT9uOvf3boy5xINQgJL1GQNAEMKKXTni/rb6rzvr1qlnyw?=
 =?us-ascii?Q?7uG2Fovfjhr9P4GYUyROh+8c2zHHk10MSFFYYXO7mOI6b2DBaKLIjfJddNaN?=
 =?us-ascii?Q?ePtuv7NMH8hNpuLS06z1ol+0fhL2L3N6vrBjJ8iiHGP9Bjy9pSaOgfXxZ878?=
 =?us-ascii?Q?tXqdWqEiFQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6ad6fd-174b-4a0f-1b69-08de963e032e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 13:43:41.8164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lj5vCU3cZV10VxK8RD2JHF+mgVNUVhTDGMOPPppm7fdDRkjCHS/REd/4fHqlW8OrklBAtXDxh2JSdWKp7TWc2z1tzzdfFRTAY2tC1xr6pD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11840
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31096-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[davemloft.net:email,TY4PR01MB14282.jpnprd01.prod.outlook.com:mid,pbarker.dev:email,lunn.ch:email,renesas.com:dkim,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ragnatech.se:email]
X-Rspamd-Queue-Id: 235313CB92B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Paolo,

Thank you for the review comments.

> -----Original Message-----
> From: Paolo Abeni <pabeni@redhat.com>
> Sent: Thursday, April 2, 2026 2:59 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: paul@pbarker.dev; niklas.soderlund <niklas.soderlund@ragnatech.se>; k=
uba@kernel.org; Yoshihiro
> Shimoda <yoshihiro.shimoda.uh@renesas.com>; netdev@vger.kernel.org; linux=
-kernel@vger.kernel.org;
> edumazet@google.com; pabeni@redhat.com; linux-renesas-soc@vger.kernel.org=
; andrew+netdev@lunn.ch;
> davem@davemloft.net
> Subject: Re: [net-next,v3,04/13] net: renesas: rswitch: add register defi=
nitions for vlan support
>
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
>
> For local reproduction steps see
> https://netdev-ai.bots.linux.dev/ai-
> local.html&data=3D05%7C02%7Cmichael.dege%40renesas.com%7Caf9485ccd5524c5f=
84e908de90b7afa0%7C53d82571da19
> 47e49cb4625a166a4a2a%7C0%7C0%7C639107315768063102%7CUnknown%7CTWFpbGZsb3d=
8eyJFbXB0eU1hcGkiOnRydWUsIlYi
> OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7=
C%7C&sdata=3DK9VAYytiJjTcdyrv98
> jVvkUrYLDTdRFL3HPzVLwEm1s%3D&reserved=3D0
> ---
> net: renesas: rswitch: add register definitions for vlan support
>
> This commit adds missing register and bit definitions for vlan support in=
 the Renesas R-Switch driver.
>
> > diff --git a/drivers/net/ethernet/renesas/rswitch.h
> > b/drivers/net/ethernet/renesas/rswitch.h
> > index 340524d995ac..15d3fa48b0e3 100644
> > --- a/drivers/net/ethernet/renesas/rswitch.h
> > +++ b/drivers/net/ethernet/renesas/rswitch.h
>
> [ ... ]
>
> > @@ -847,6 +903,98 @@ enum rswitch_gwca_mode {
> >  #define FWMACAGC_MACAGOG   BIT(28)
> >  #define FWMACAGC_MACDESOG  BIT(29)
> >
> > +//FWMACTL0
>
> [ ... ]
>
> > +// FWVLANTEM
> > +#define VLANTUEN           GENMASK(28, 16)
> > +#define VLANTEN                    GENAMSK(12, 0)
>                                 ^^^^^^^^
>
> Is GENAMSK a typo? The correct macro is GENMASK, as used on the line imme=
diately above for VLANTUEN.
> GENAMSK is not defined in the kernel and will cause compilation errors if=
 VLANTEN is used.

Yes, this was a typo. Will be fixed in the next version

Best regards,

Michael
>
> > +
> > +// FWVLANTS
>
> [ ... ]


