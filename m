Return-Path: <linux-renesas-soc+bounces-32965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL/eBRRFEGpyVgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:59:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C01175B35F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DE72302C910
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 11:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928123EF646;
	Fri, 22 May 2026 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Idar7jpz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4831B3CEBBD;
	Fri, 22 May 2026 11:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450702; cv=fail; b=rMn5oYRxXZ2YII2zMZu7JjcW4huD7Y+M3Emqx+aEbkpW2yMdMPOiTW6OoQI+Iq+xwz5m0VG4Kaf8aQ1pYR/gdDEZjkkOQIyxYpLxf00m7e3CZHzZaIE+aOslDs3Cb6VIquyeHSraBiFjJgx7D7XqbjxU8n4ALBGxlTwGcwStJt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450702; c=relaxed/simple;
	bh=bPUHYVFj8OKnVV70lUCTN1OkjqsroMGLb8GmK3cAWi8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NHCrhkA9Jb5laieeTNFyC0VJw1X9aJj11CA1Qmc4ggc9PKiFwSe+QCc7dDp251GePq4p9SeRxe8bNw2awb0MW5hY4fUqyf+t3MN55navr9kovonKytQFCV/td+CGxnmuxPdWkMOJc51LliHp5tWuMxE2OtV5oxJF4x5AEPQdOlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Idar7jpz; arc=fail smtp.client-ip=52.101.125.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwSUBC0gJX0YLJWZOLrL1W8Jf594co6TUlly4xfoqdPACPIK80W5jIFxcMbSgXdGlL7lv6hV9uNCndPLGHZuV9XYDVURqwLIfZNaoT7YKIOTA7HX/pVVAlmZ7A2Rc1hggMhMSA9tQqNpsnaET7exEsMoiLGks6Rki1//FFfUpl/E5tU2W7Pa1+/A9BPYCLsPQmImviLqJjwHNrlztyy4Q5hrSAH6/Ajrisp97a6ZWWxo9iXPKwYHnkwIxtBPdPrjPLYDoz+EoAXjN0bi316+KQIEoUIFPTTUT9yM9pG1vcKoDa1F2BAoOfLi4LLCofxkNjHG2mSu2YLi8jwL6kFAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jt74t+MrEaOC318Bt/DeNAfDO3WNWqteZcqngfR7QEY=;
 b=G6pih4cCCzrXeyMUGqGugyer3BgZTXVZmpuvSDAs16aYcwjSE7cBobYxL6quB0jXMI3w4t7A7pTf9bKQJPBsADr1ZROxAZ1eMvJsyi5b3Br9NdQTp6dztH1/4v/FUxBStNCBI260MAaMmAZBllWfbs5VmZcgT/Ng29F7vi9rlxnr44t7+F2bx4c9L+I7hszc5NAx5Y3IamIRuEhlCgkIjsdCHgW5i3Y1dNvX9WIwlzd6PtQZT63o4St/yKk+NaAwql6qSBrIWWBnYhT5xO5jO3m+JhcyL6WZfDkMvtTbqKGh6rgR7ecEUDgkXIEMPs+LXpjo+AaRBzA84VTNQgobZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jt74t+MrEaOC318Bt/DeNAfDO3WNWqteZcqngfR7QEY=;
 b=Idar7jpzTJWDJXzFaEmDc/7JGW0s73dkcJHusL+PxZk8AKzsZx093bT6QTA9x7J0AaOcHZv3c6psW+3bWBS+AX3WO97K6lsBa9BSguoBHcwScXanw8vaCXcflI5hknoQNFYvjQeUn4n6q5sGlDi4a/jL55ghEvx9/SvPWHUbloQ=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OS7PR01MB17321.jpnprd01.prod.outlook.com (2603:1096:604:439::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 11:51:34 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 11:51:34 +0000
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
Subject: RE: [PATCH net-next v4 09/13] net: renesas: rswitch: update port HW
 init
Thread-Topic: [PATCH net-next v4 09/13] net: renesas: rswitch: update port HW
 init
Thread-Index: AQHc4SOTyxkxJl6S90iKmAgIzx1d3rYLL2YAgA7HpDA=
Date: Fri, 22 May 2026 11:51:34 +0000
Message-ID:
 <TY4PR01MB14282B14FFFBD96B1897E8374820F2@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260511-rswitch_add_vlans-v4-9-a5a225f8faae@renesas.com>
 <20260513013554.1408426-1-kuba@kernel.org>
In-Reply-To: <20260513013554.1408426-1-kuba@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OS7PR01MB17321:EE_
x-ms-office365-filtering-correlation-id: dec38194-091b-4b52-eb31-08deb7f8790d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|11063799006|6133799003|5023799004|4143699003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 7SQsqrGpcKEVecyuCpxBa+gYpGmENKu4F37snWL7NWe/BMhsCTUAnyWQQDwGgMD9cWW3T70cqezCNw9XoZD0Bbf2PKubYlJNhTP15lJxqlNyorVYW45judp5prMFiQC5oozNMxhE1+uIudzURREvpw7USkIlsyIfR/AhKdul1sWKetqqtoQYFkahw3NPux4QH5Dphvd0jV6ZHXLnQAZNgsw4AwmOfeDqAQZwmWKbmRoLIw+tp/Bvw/DFfwpBUylXezDfoEccY2ag+D8LK664EPs+uhko15lLgWZmoEHQTJ09Vv+w4ZGPuVie8GYFuDT6AnHaMPrFJvZwTO1hEWpTAnZ4VQqAAJsNdzzZGMSNhfDPREC16gRMsgbkY5QcOZryhNn87H8s9kPH7EC/7yRcojVv/FivoR0iLcOxNyLsje9ZQn7AhZKHI+YFHnYi4WBTGxpD2nBrykPKBxGdS06sBjvG1lRYXOFFNBVOpgW5PnLIUhpETVxj+gCxf88akb+v3AEE3+fOOM8jyiq+sNawOQz2CEd//tCWAQzmNB+fitdrTrC3AVBmj36V7I8f7f2Hxv+sljY3QzEZbCrsCCbOtI2UIOMnXAMDPDj2R2uIR+DletbyaA9BrhAQ4u0PivTRKigH/7zlIJf5JeGk8euVi8gi/ivoFwlkVzlnYDyHlZQgIJ8VCGeh+I0KUl+DqAgVqz3vMo7rFOZh5RL9UVOoVN+98ZZlxVQfhPxm5YYMSat+jyxE1JVEPNPFVxowXtrt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(11063799006)(6133799003)(5023799004)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1rbfZWtCdE1aTnv1KGpW1JDB9vaW+p/kRK39IyigDLrdPSnYdtbNDrfTKHph?=
 =?us-ascii?Q?MZLEUQ5mGbJNoWyC5Oq+i/AKoDL0Esz0blKgRPB57CvJvXxMzVulc1/KUvXz?=
 =?us-ascii?Q?QsyesQYPablOEsllIEe9jgY7JUR6WnI/ICn7lJD3PgGpVtjbVjcWMEhT/It1?=
 =?us-ascii?Q?tN30v398d344vYfiUt8q1fy151F6OIRG8jlxSEM0Hb7fprz5fvteBKpFpXHP?=
 =?us-ascii?Q?CAFGaI/o8lpgH5Ok42qsHaY1Lf0kYyY1B5ANDhntFDKsWicJXjyAYI3WWF41?=
 =?us-ascii?Q?814ULj/6qUEr0aUJhD6cuOiHXQX1PzbvOKbDoWG8W7/nC76H3egZJ5r2qxVC?=
 =?us-ascii?Q?GjV+NFftQiMIVdih/keMVUa9S1hdwMyL9IQVx6EWqqIARqa6fJHqoWWMvdoO?=
 =?us-ascii?Q?lnhZ3j625E2xoEzMIitYrsfLPHov+RCWiCzEyQD+cF40OlJa6RtOzFsuygtS?=
 =?us-ascii?Q?iLeYn9IntIVh2VADbio2luc0S0rHrivXh5afcVZpZ7Fs0xUoj/6J31u82YMZ?=
 =?us-ascii?Q?26KSByY/Ye3zAhz5qJeCVOW3vT1GAucIinnFLPZvx9WiG910rS5umAHP0iIw?=
 =?us-ascii?Q?VrW8utGX7bHd/fM4t2Fybd/zW4jE3LROA1jUqL/KfXDfLKyb5jPrhu8fsnna?=
 =?us-ascii?Q?78uVhpCNaUKKA+L+G7Nl/awlppWI0lp5PJzxtsQh+GgYAFdxaTF9+Aa7jxTq?=
 =?us-ascii?Q?tnmWFsz1HHOHB97nWb/ba8T4rVlfTj/WBz0JRFSY/pzByFcxCSx1WWcfUHzW?=
 =?us-ascii?Q?AK69pqVp838VNEsPDVz6OVkV1xyP5PPwIZDih3c2bAMcY+zbaljkx58offtY?=
 =?us-ascii?Q?3snYJUF4b4ACyGk4mUSfdqTpoNoqns+AyCOmNNovSQ5LhbteXUATnVtLmpYK?=
 =?us-ascii?Q?pG1QO4G/eRSb7aLs8uNL8THH8vqIm5VwunKvSlrl4mJl1d9rqqHL/yPrV+vA?=
 =?us-ascii?Q?GjXO4oCzvUtXTKWdj+SGyXQxO77LkOkpSZeCpa/gX9O9P6RqbEljL/SfpaY7?=
 =?us-ascii?Q?pWAlKBrRcna/j6m83eo1B6xUCmSgBkRsPNrkTN3xnbywpC8NGTFj6OC9XWV/?=
 =?us-ascii?Q?kyUIoLwTETvz7akeJ7zO3eRUnMha5kI4CzX6/UuyqvN+MAWaFamtHd5Q9Xfk?=
 =?us-ascii?Q?IvvA5uWAXIHs+Qcq+MRBofMXPpUBXU6QSkQx/HdYzQREIc/1oazr9TDh95Xj?=
 =?us-ascii?Q?d72j97AxSEkbmIBI+aM1W2uDj3P1djhXgWOq2UCv/8LFHR7kPLrwhgxW2xFm?=
 =?us-ascii?Q?pSIlmKZY7rpA5ps46t9YBH9EhzqfRgqbx7Kr97CDOiF095XeYliASYGXZo9b?=
 =?us-ascii?Q?WoeDYGcf3sB/s6WXeQMQJ0hBg6acHBXhqjzCd5qaDkfZQ0PF1spEDDGlkQqU?=
 =?us-ascii?Q?guDOWw9QvRx8stcsmxoytO484RI4B+RbuAWfU/+2R4+n9QzbUw+ZHhPIKiVn?=
 =?us-ascii?Q?md3MZfmRN+gxxNB0QZXV7cpggsS9QjkiauP8Vr1XRTelF3A6GxWGjLrOqSjP?=
 =?us-ascii?Q?JPrCMC4IF5VPfUlTUZhQK/rUb+FkrmPpnOrkcUyKDZYt3wqaj14AgQP1bgUq?=
 =?us-ascii?Q?QRUj/TK0cS6yCxtoQgA5ilXSHP1/vUVHvJS3y+MzVIYCSi8qv5YXcNIgOPmN?=
 =?us-ascii?Q?NGbgB/6oKyuC2Jl57GzVi4OeTEg1TxaCl2wLh70vScmtNhlXVpvHhwuecrLQ?=
 =?us-ascii?Q?n+14I3JTJIjXmiuy+9csJtIRPmg0vaIQIHH9bmfHLX94VS/UCPh1bUevxjNC?=
 =?us-ascii?Q?lUuKz7+B6g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dec38194-091b-4b52-eb31-08deb7f8790d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 11:51:34.3632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ncp0zBbmv5FsorMf29dbC4OVzWqiFBAqcAMEEK/vjoI77PPKkG7Ijy0NRC+zKsh/+T+k8xeInNes2BYSfUjZk7r2VEOgOr7AhcgjpAVcOzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17321
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32965-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,TY4PR01MB14282.jpnprd01.prod.outlook.com:mid,davemloft.net:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lunn.ch:email,renesas.com:email,renesas.com:dkim,pbarker.dev:email]
X-Rspamd-Queue-Id: C01175B35F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Jakub,

Thank you for reviewing my patches.

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
> Subject: Re: [PATCH net-next v4 09/13] net: renesas: rswitch: update port=
 HW init
>=20
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
> ---
> net: renesas: rswitch: update port HW init
>=20
> Certain Ethernet and cpu port settings need to be updated to prepare for =
vlan support.
>=20
> > diff --git a/drivers/net/ethernet/renesas/rswitch_main.c
> > b/drivers/net/ethernet/renesas/rswitch_main.c
> > index 90c44dcfd1691..d00af333fcce5 100644
> > --- a/drivers/net/ethernet/renesas/rswitch_main.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> > @@ -737,8 +737,11 @@ static int rswitch_gwca_hw_init(struct rswitch_pri=
vate *priv)
> >  	if (err < 0)
> >  		return err;
> >
> > -	iowrite32(GWVCC_VEM_SC_TAG, priv->addr + GWVCC);
> > -	iowrite32(0, priv->addr + GWTTFC);
> > +	iowrite32(0, priv->addr + GWIRC);
>=20
> Is it safe to completely remove the initialization of GWVCC here rather t=
han explicitly clearing it
> with iowrite32(0, priv->addr + GWVCC)?
>=20
> If a bootloader, firmware, or a prior kernel (e.g., across a kexec warm
> reboot) previously configured the switch to use Switch Control Tags, this=
 register might retain a
> stale VEM_SC_TAG value.

I have added setting GWVCC to 0. I any case the correct value will be writt=
en in case VLANs are=20
Enabled in the HW. Otherwise, this setting is ignored.

>=20
> > +	iowrite32(FIELD_PREP(DQD, DES_RAM_DP), priv->addr + GWRDQDC0);
> > +	/* Drop frames with unknown tags */
> > +	iowrite32(UT, priv->addr + GWTTFC);
> > +
> >  	iowrite32(lower_32_bits(priv->gwca.linkfix_table_dma), priv->addr +
> > GWDCBAC1);
>=20
> [ ... ]
>=20
> > @@ -1284,7 +1288,12 @@ static int rswitch_etha_hw_init(struct rswitch_e=
tha *etha, const u8 *mac)
> >  	if (err < 0)
> >  		return err;
> >
> > -	iowrite32(EAVCC_VEM_SC_TAG, etha->addr + EAVCC);
> > +	iowrite32(0, etha->addr + EAIRC);
>=20
> Similarly, should EAVCC be explicitly cleared to 0 here?
>=20
> Other registers like EAIRC and GWIRC are being explicitly set to 0 in thi=
s patch, which suggests the
> driver cannot always rely on the hardware reset state to zero out configu=
rations.
>=20
> If a stale value is retained in EAVCC, could it cause issues for subseque=
nt checks that might rely on
> reading EAVCC to determine if a default VLAN is already set?

It is not possible to clear EAVCC in the init function since this is also c=
alled when the interface=20
state is updated. None the less the register is written when VLANs are conf=
igured and the setting
is ignored when VLANs are disabled.

>=20
> > +	iowrite32(FIELD_PREP(DQD, DES_RAM_DP), etha->addr + EATDQDC0);
> > +
> > +	/* Drop frames with unknown tags */
> > +	iowrite32(UT, etha->addr + EARTFC);
> > +
> >  	rswitch_rmac_setting(etha, mac);

Best regards,

Michael

