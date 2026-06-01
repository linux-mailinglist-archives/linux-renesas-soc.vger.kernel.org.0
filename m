Return-Path: <linux-renesas-soc+bounces-33394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI3FHQSCHWpwbQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33394-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 14:58:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F7361FAC3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 14:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B64F3052B61
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jun 2026 12:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFEE375AC3;
	Mon,  1 Jun 2026 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZRxKyxq2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8692641754;
	Mon,  1 Jun 2026 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318255; cv=fail; b=aQpZD+u9pA8TKuotpgOi1fhLu0oQxeNu/nj6SMktkmM7hXdElBn5Y45H5rIPXcipqONWrcIgfTKOE1jGrn186EquuYCX6hSWCtRMz2VKi6Z+7lm9cnukXYI2i2d7gpjqfAyKruThIumsBun2u+wq0KCmQu6F2kgnpuRKJlg1BgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318255; c=relaxed/simple;
	bh=e3LszCPIH9kruPVl+Ps9XH43pqt6aCZJxqOHNM1bEOQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OUviItOv3B0rME7WKR5jxq3wo2vGa/7H90grl2zaH7uLLPB8oe4adffBKRZi/N2k0fmzTl+VlCcLpQGgZXO0cNdmFw6GfHdO/V2b90//N/2YXELzLmU7UQyov56OgNdRN2fJS/hJS92Zf+jMulSAnIrMShmwbGNeZj15+3p/Yo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZRxKyxq2; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZ7edE92eUDxeSsGdG8UqBD+o7wvs/ItapClcL/ZEKAuv1S5WhNOftCKgzhRvLgAm2RQC260loMGYHwkTFvl5x0xVudC7pU1/tm5n0xTvug7frD/tb0hk43iiQ/OpYuv2p12oyHCLkvrvsRyuR40i5gjB5pp6jRGQYsUFk0RVnb1bIiFeE9qWakVrobJ+N0f5x7O0opC3fw3r9E+L+czIo3zpybnLFEIpwgNgrIIralIr9A+i7hVUzPZvI6V86uUT7fR2RGX1vmU/YbCLIgDFDSAnt3I0FBm3h9F0zHEmBdogcaci36TTzrii3JKTcVy3j8XKakuU+xFaqhwf8rvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POCTPcg3aFpOnjSxUiMkw4tA+IUanazGEovZtSQVf90=;
 b=GMH3V3IDfUGIFKMhkRgejgoIyE9CpsiKjYUDXU8CGwAI3JNJ7dFeJ88SUPz7hqitfOxHKA4/tAJ6oFOqIEDq/lF/nU2/bpeRwwQ9FlezFAgACH+Dz91rL++5j1fJs8cXSHJcU57T5vs23KdC6fypdgG0atMq1S+LJm1ML0Mog82zzh1u23Ht/n2CFcdkIZ5Qs2AVd03lzHLJCarKv72djaRJ5kS/X3k1Q1E2+fHJy0kjojiuoAc9eOXLY8epXbBph8ogYWtdhSd/8RouEuowEA410f0Y0fYIvtrnaDr6LclgAnC8+BNT7N9P2TsVsg++y11haF5HbrqDr+zoxqT0pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POCTPcg3aFpOnjSxUiMkw4tA+IUanazGEovZtSQVf90=;
 b=ZRxKyxq2JlP2np5wFpjZ0iZdPO9qXfgEygAXWG7z8YWvrL5j0RXZpVJzE4g+I1vz5ULGIsWsBsm087RYVh1jnYlhs9QZHaoPQf+r4d6PnL3XxQATpxUFkKi/s+y2eFkZEkxAunowI15zxu2Lfk1MQf9+Y4c1/Zbe7lSg36jvtn8=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OSCPR01MB14741.jpnprd01.prod.outlook.com (2603:1096:604:3ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 12:50:50 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 12:50:47 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, niklas.soderlund
	<niklas.soderlund@ragnatech.se>, "paul@pbarker.dev" <paul@pbarker.dev>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net-next v5 10/14] net: renesas: rswitch: update port HW
 init
Thread-Topic: [PATCH net-next v5 10/14] net: renesas: rswitch: update port HW
 init
Thread-Index: AQHc6eRp88alpkXT3kmj5ryU9NnG77YfOeEAgAp7D5A=
Date: Mon, 1 Jun 2026 12:50:47 +0000
Message-ID:
 <TY4PR01MB14282FBD44C15FF66D09D1C9882152@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260522-rswitch_add_vlans-v5-10-53589d944a9f@renesas.com>
 <20260525204116.2471424-1-kuba@kernel.org>
In-Reply-To: <20260525204116.2471424-1-kuba@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OSCPR01MB14741:EE_
x-ms-office365-filtering-correlation-id: b2b07d87-f48a-4153-2720-08debfdc66f0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|6133799003|22082099003|18002099003|56012099006|5023799004|4143699003|11063799006;
x-microsoft-antispam-message-info:
 N5Jpacx+PTRzzxE+FeaENhYVg4E4obbQ6NQ9PPBjrW9U6l7jwBxxygi4oIKB9mTJrCZta0AMVMQvmBSz3Bg0AqVkO6O3wnncLmoG4z5OkLNjisceqOzPnyGqEmZeEJPamVwAvSzDzpZtLmOaCdSQempGpJW7EPhosANTzqjBbY0d4iWV+5lVYIVtvOIfH3iYQ5LJF1ImeNtq1T2ticBGOhr8Y8QmLq+6Mpe0OCOitDQt8O+oSv5ycPbdwhBSYmv8BtfakIRF6bYTrc5w5LW1XvrX/58a/h/PM0YJ7Ipt8b5EE+8y1Oeizb3/tkS5q+o97G8dqkhDCFpI1HXw2um2IoOHG6CZZ1qArQ3UGkVtwUcZc54bpFudLvKjcmmcnUd/AFXFf6nOfsRlDDTzoSSWHvVGyFwgMdoXcCo6W4XhtyvmXzcIPdSqUWuFceaVMzgoNY6ggjB2NAcGiR32sc5A78aZ6AvbgF7gYFcFe6JHxf3t1agBeFvLk9Hc/v86jz3hsSGepiCtVuTC1kCCUkL5ho7VWziNW7QlwvmQLi84st4SZhXnpRbIdXS1hy5FPg5xYPcdyEFiD4m2tmlqPZkEHjpa1/TMwu3ygt+BfYq3B8y/esM3T3hrHQq/P4sGTEtrsl/JboINrY4pRKdAf9UMxJgBE1w70AcwPKbpGroW9+tWPz7gEg4E5Vtpy8t6BzQihan/oiPKjqut/v905zLNSKFd2LLklBUgo8KCUmZjhcemfrjW/NDcEOA7H8PkPkD+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(6133799003)(22082099003)(18002099003)(56012099006)(5023799004)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xn+AVd2xlVgkjp3WUXKfiYylOiJ5NGEu9jlVxQeHlfyvrNd99iioSGbhpcfs?=
 =?us-ascii?Q?PJt8CDb7ec/nmAs4VYtvkG/FxK/UlM0K7ji68P0EERMUyjGI6QSrujlvy/ce?=
 =?us-ascii?Q?yPTxmMik3dGy5+msqo1ftBunvZS3vRVyzxqplO2qYsQpmF+25BjOod4ohewN?=
 =?us-ascii?Q?+jR/1ri9VAZhuZM5ZjO2yiavGLqd1Lw1zymlsYQhLSgBcvHAuGvws2/ldLJV?=
 =?us-ascii?Q?PH4jBWP+eoXTn/yh0d4vV7nLHtVE98o4Z0+0bpTSYC/t+20RgajomGpKmE3G?=
 =?us-ascii?Q?PM85C+uDNSIB0qcppIrrQBeMiYhQ4J9HydAasQP7tds8IllOyJ3dBoCMHndY?=
 =?us-ascii?Q?ocIWQ9Hqbc5/KbUf68lDg0iJmxYA1t9YgRCXSGS33Ixa1VdPv9m3HouwqZhw?=
 =?us-ascii?Q?i8ShXHfI3ExZd4ey08+fbttA9Fhd75G01o1zdcyr/zstpmIuxmrMhmSj4C7g?=
 =?us-ascii?Q?+6OzYs2NRbGIFLw2Ka5lbR4ln7eBb2tq/Z3Nz8Y90HTwdiy6GF06bLruM5QO?=
 =?us-ascii?Q?+xRUHPGvkyra53gdodPdM/pSnCb+xFKOsWPlgE0wrbBzx9T9RmY0JnKSodSb?=
 =?us-ascii?Q?R7bE8o+Tuev+QQ7W/DdwsxMKnn8Ncx4fHA6HSguuk0e6wnCROc9WEbUT8FOe?=
 =?us-ascii?Q?9Pny203zd3aGgbKdb6tp9PtpE4dV8/NekHhC2FMF0tFC3afXaNLS7WrxTkFQ?=
 =?us-ascii?Q?VTMB61XXRrJIzf+Klgu3Pfvv4FzZTkCCst86GnEowc040yM+NsJgcyXaTdff?=
 =?us-ascii?Q?9UdcDOozvYfEuItUdyK/759IB9RBBoLgjfRhYFdI4ZnOcFXvY+KIYEpJjatN?=
 =?us-ascii?Q?25qAyZLAhbERh0DMxcNZMll5qvmJZ2GR8iJ/Zf4y46dbCxPvbEajdQd2uVWk?=
 =?us-ascii?Q?ovwgaOeoxz/oI4M7QgA8YFHShO5pslrjX9c04gjLExvQOsDP3YStdVA9GRU9?=
 =?us-ascii?Q?lo9OCrE78zqOiNBtZyQdYTItx4Bgct+7jizxF03z1n9zD/ZTYFQXr16neHjK?=
 =?us-ascii?Q?82X+ZWW3bkh6F9GVILU7SEOIPGY6GLbQSdaq24KP+qr8m2wogAaBLrrf108R?=
 =?us-ascii?Q?IpEb0pVbmE0MsTvt2QOqaAGB1M2cb3kYjbxhw9uRJcZuZUCWIL6SYD3/3Diy?=
 =?us-ascii?Q?w2G1lHly+kvlR6n3D0BKY9CYXMJwZ34xVMPATLmNWKPaiZrlbh0EbzeWvMic?=
 =?us-ascii?Q?2OZPbNrWRHMvamZNViqXCFoo6QZU+/ajjlsBZuqplrwWMO+NnKGX9om8LgPU?=
 =?us-ascii?Q?0FZ+gB3rUYT9mO6yHtKqjvRt0t4VPU7nW2VU62rBd+ZvvmMUgtod7Gm/3jLm?=
 =?us-ascii?Q?fMN1hY+J2K65VdfAPCyV9c9pNIKuDICMbPcOca+nl/zCHy9AMgeqCEN00bSR?=
 =?us-ascii?Q?DlquFsw6JDvtaHN0o0qLVXqaX1/9ateJMXV+uHJkpahjZ8kgELouvDSWIr5+?=
 =?us-ascii?Q?JmmSGoPxDb8MskwrhfaexuXqyUsqFsX2iMRf2lZnufXPHkZPNgt0CmJP3uQt?=
 =?us-ascii?Q?5BGbfpPet+nUdvC8qVU/rIujrl7jRZRGkbmhhSOVWeR53uGCAugYFNUkxfVc?=
 =?us-ascii?Q?ot5On35njiltESCvy96RgEGFz8TJVm8VuHBtVtwcw5LzFuHBupH20wZpwDZV?=
 =?us-ascii?Q?GxVrSZh4wcYnn02SlMXZ1hPafhLRu873BtVa4a6tILKOns8JBD2cr95OVQU6?=
 =?us-ascii?Q?LO+207ILLhMKg1h+El13fts3u8vkT13sSuTCXIzg1TgkLfdBeVqhQFdxeFfs?=
 =?us-ascii?Q?9kR/Z1g4tA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b07d87-f48a-4153-2720-08debfdc66f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 12:50:47.3583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IgX04FlD86MvGMJiFZr6M3W4a3rYuVI4pIOAQthxYoz1roA3hJ4zZ1iSTyUi0L5zxQRp69JVAkPkFxbp3rilrrdF5NGU9MJkRq6TJrnrnBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14741
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33394-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,redhat.com,ragnatech.se,pbarker.dev,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:email,pbarker.dev:email,davemloft.net:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ragnatech.se:email]
X-Rspamd-Queue-Id: C9F7361FAC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Jakub,

Thank you very much for your comment.

> -----Original Message-----
> From: Jakub Kicinski <kuba@kernel.org>
> Sent: Monday, May 25, 2026 10:41 PM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Jakub Kicinski <kuba@kernel.org>; Yoshihiro Shimoda <yoshihiro.shimod=
a.uh@renesas.com>;
> andrew+netdev@lunn.ch; davem@davemloft.net; edumazet@google.com; pabeni@r=
edhat.com; niklas.soderlund
> <niklas.soderlund@ragnatech.se>; paul@pbarker.dev; richardcochran@gmail.c=
om; netdev@vger.kernel.org;
> linux-renesas-soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH net-next v5 10/14] net: renesas: rswitch: update port=
 HW init
>=20
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
> ---
> net: renesas: rswitch: update port HW init
>=20
> Certain Ethernet and cpu port settings need to be updated for vlan suppor=
t.
>=20
> > diff --git a/drivers/net/ethernet/renesas/rswitch_main.c
> > b/drivers/net/ethernet/renesas/rswitch_main.c
> > index a445d9a8505d8..13e59d2d08282 100644
> > --- a/drivers/net/ethernet/renesas/rswitch_main.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_main.c
>=20
> [ ... ]
>=20
> > @@ -895,6 +899,7 @@ static bool rswitch_rx(struct net_device *ndev, int=
 *quota)
> >  	limit =3D boguscnt;
> >
> >  	desc =3D &gq->rx_ring[gq->cur];
> > +
> >  	while ((desc->desc.die_dt & DT_MASK) !=3D DT_FEMPTY) {
> >  		dma_rmb();
> >  		skb =3D rswitch_rx_handle_desc(ndev, gq, desc);
>=20
> [Severity: High]
> This is a pre-existing issue, but does this code leak receive buffer frag=
ments allocated via
> netdev_alloc_frag() when packet assembly fails?
>=20
> In rswitch_rx_handle_desc(), if build_skb() fails for a start fragment, o=
r if a middle/end fragment
> arrives without a preceding start fragment, the function returns NULL.
>=20
> The caller rswitch_rx() then jumps to the out label:
>=20
> 	skb =3D rswitch_rx_handle_desc(ndev, gq, desc);
> 	if (!skb)
> 		goto out;
> 	...
> out:

I added skb_free_frag() here.

Best regards,

Michael
> 	gq->rx_bufs[gq->cur] =3D NULL;
>=20
> This executes gq->rx_bufs[gq->cur] =3D NULL, discarding the pointer to th=
e memory previously allocated
> by netdev_alloc_frag(). Because the fragment is neither attached to an SK=
B nor explicitly freed before
> the pointer is zeroed, this appears to cause an unrecoverable memory leak=
.

