Return-Path: <linux-renesas-soc+bounces-33178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIScOhfcFWpzdQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 19:44:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4436D5DAE15
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 19:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0A4D300CBDE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 17:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D82D41B357;
	Tue, 26 May 2026 17:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aPcZnY0s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CE8403EB2;
	Tue, 26 May 2026 17:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817487; cv=fail; b=srw7OUkHh6dMBfCAS44zUYYR6YqzBxHsPXh1qmcyFw4zhfpEtDyUtrMUV3IeZPUScdHLRtnRQJ17glH/ROPqlaLaxPnJmsUyH9iKWqxpJlelO3khnaQfbl/XDfZCCsaYmS+ErMn77NsNhWdhn9OjRmTj+kpyx3KZqIRgDZNbVwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817487; c=relaxed/simple;
	bh=AyhSl+ZRCy7K7stpsAHD0+IF84GVPFuA3H1cFeDrlNw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A7OwIURyf/A9rjmg6HyKnYBUO6mxvOR0Tahv6ujBsTBHShfeEpGs8vlVFx45jn+gL1bfwylzSN11IQotbWm3ZbUwcvfuRAHMsgGXaVY79DVHoyNv/wWw0QufpsDTPD/VJNxgkgoCJwZ4ipW0TylxdBrujpXKntLfZJFVe1MtqQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aPcZnY0s; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5ivpCn5odzaS1rcwxwWe4QOmf7VqSDbEKFgAvDAQyQHHNoE+SMNvFxH+uHCYSddjcfn/+Mi8TYL9ZJd458Oi9sf16Xr3cFzzijo3VBeR0PHRAloYDN4uOeM9JYpfPK2tnccNhVBGwQL4dtDT73LyEmJVn2SfFVFRdMX2dPj3okghtusmhIZGs62mQk7aohgHeXpz9ESqCuwWX05EfuDr61E9fkjSs0++VFKro/FFmLfS1OM/Wgvv1lAyemWWwEvgLNBZJLwW5pRN/sGXFbtCPy8kuBGiJcZsRZR29aGfcKUDVd+i4jKi6611ptA3b07T5UblOk0oZtWR51AUIJPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YmZVoJEbJoh53NmiXyKtSLHN2sh8bpaD4ie7IOehTE=;
 b=ZaAzTqw6YQj5H4OA9d+dcT/qnHOgPEmczPopdpV6Bl/4L41lLubtenPgjUSFVSn0dgcOb2Eg8F9b0zZQDGeQp/6+8Qp2UM12L9VreWO0vX/BqcN937a8pQC5Ssio4NKc6cvY6JfY3+Olo0va1DZyD4Yr9nDzJH56+fKak34LNlsxcrchit8gd+iEuezEKJ+BNTjJBjmb1uK5I4EsEDPX6QoZsmbgR2/4eJpqFQMRKCTSxusdp+6EDSYoab+7rL3qV2yl13u77SWHGQ0KQ650DzsCKHcfe82CrJak8LvOWoJKx7YMwfM19NPUgVJ5j2DlGM3+vmiDijE7GvrVPDCo6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YmZVoJEbJoh53NmiXyKtSLHN2sh8bpaD4ie7IOehTE=;
 b=aPcZnY0sZjLpuphVo6aftMlI2sZLthhgcLTr1o+QfogmPgYkUHe9Ro81E6HTBkdALRpb6y6MjR1BML6lvzXtVSGMM8LypzwUdtqZEJ7co5TnghGUOvuDky3GuWfIUgjWoPvRbrXmc2L0pA/yyeMGzT7yHkWYk3D61x99U/7Yl5w=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OS9PR01MB16891.jpnprd01.prod.outlook.com (2603:1096:604:408::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 17:44:42 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 17:44:40 +0000
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
Subject: RE: [PATCH net-next v5 08/14] net: renesas: rswitch: add locking for
 agent clock control
Thread-Topic: [PATCH net-next v5 08/14] net: renesas: rswitch: add locking for
 agent clock control
Thread-Index: AQHc6eRi1pYOqHPL60CPnlV+4dd91rYfOd8AgAFgKQA=
Date: Tue, 26 May 2026 17:44:40 +0000
Message-ID:
 <TY4PR01MB1428279E78F8BF79FF1F40C39820B2@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260522-rswitch_add_vlans-v5-8-53589d944a9f@renesas.com>
 <20260525204114.2471390-1-kuba@kernel.org>
In-Reply-To: <20260525204114.2471390-1-kuba@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OS9PR01MB16891:EE_
x-ms-office365-filtering-correlation-id: 12f1eae0-4557-4255-33c3-08debb4e76ab
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|18002099003|22082099003|56012099006|38070700021|5023799004|11063799006|6133799003|4143699003;
x-microsoft-antispam-message-info:
 QcukeoLI1VJOg5SzCBo0Ysjbhum+vEmfvZywQ5JBBwqtOfk2dp1nV5SGhU2KVhmSUIHDlbcVX5CCXN7PYJplXDSXB42hwLWWEM/SF13ymAJckemzR0UrcY1QMBf8T6DX9CIyOk+I9YzAWYcDyWtaKSjRZNlWnwbkjmvMIh+vXBUWzZ2e1KjGjjyddae2JwXTcIfimS2OdNo29Aix3/06ts/adnLB/WgIy3btYqS/6R160wcxZCfH7aYSguW5yk9ATUy0ZGlTvJMeYbNo/K6riVOw/EXXIQwaZGiX+ENIaBCOfvAyjkCfwcnepqSC0ULUjyBfTnCqYT3Xxzmx69cU5c04drRzL37rQtwU9fcG0dHdoW16BXF5EmW8UroeIwPfN7ZO58Ut8x5T/oU8nPeDOzN9KfbgOAM3P/uxTBJvYTDt4A/KI8IHEGwp9xPgHk1U/5AmEnrDwyfFmH2MkVKwara9i7fpwWSuov+IlS25BNK33abGyeTxME6FsE/gRjR1I8PYAGxr+V/pewe9DtjT7xqx7rpaxPL5uNuIsL62osD02pJjExuSUYIN6fh9kpaNnfIvswhE6bKHtlbOVjeua7GSSi7lXgULpIID0Agl6kZv0xMApADrIBcQWWAl7XnP2ViiZb3a9BEaNQm2Mp7dPbql4KEdgzMorZRErTdh023if59080fOh3FAYpphWGE2gHF0ID6wCcwkWfqE9P1cbvKIxMrrT8BX+wSM2y9rGBoHCUVr1mc9sV5CnRvSILEX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(18002099003)(22082099003)(56012099006)(38070700021)(5023799004)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VEhjLXgZ62svhx3/E27nQ8hR6tp5/VS+pFN3mgfS/tooHV+Likz41hdnuJIr?=
 =?us-ascii?Q?03j6DJgpXtxtlGlNUbt6j9sMEiMUZfVem/fGg4TKhqCc/bhJK5lDRxVIzVU1?=
 =?us-ascii?Q?enKafly9D8B0pVeBcgVMmT5Op8KM6uaFbj3++r+R6R2qVnD1dhJuZ9wGAAxL?=
 =?us-ascii?Q?xgp+AEqXK80sgEG701DQVWIpRRAk3lXobF3XXtJPcdvPdYnROjvzK1pganTc?=
 =?us-ascii?Q?3qgpj2mV/Obya2Jsm6Km3mHvWaqOEJeph1tLnMC3/7euJfNuoGblkgrwvSgn?=
 =?us-ascii?Q?8E4ebMCg9iZtnQMMFLfw1H+SR5VDEPBEHOmQ4YMKAiIuccyB+PoeahTBlrTR?=
 =?us-ascii?Q?yNhjydt9Uql+nCmCNRAYh+aY0zcWKfPSbL1aibBEaf7qxd4GOJk1g+ipy9Vi?=
 =?us-ascii?Q?SlogpLLiUq8/gJE3h9M8+b3CWxqzQxDDoGEyhwNpUjeJqW+eBBmmT1XHw0ll?=
 =?us-ascii?Q?l/ZXM5uNADHpcVpXhJLKvbLFhrHzmuFFwfV5a0icMUJrr3I645/BtPoEOyeO?=
 =?us-ascii?Q?8zaXanMO+wXe5JrNL+1usd4k8PE3p+m78cggwTfN6AwuUc0MS5efxt1kupta?=
 =?us-ascii?Q?ZVrynWfh0cXJP3aD9KdxARwZwM+uEGg/zBl+LMgALwSHXIAR6bufIlki3NKF?=
 =?us-ascii?Q?OzB6BKqgVKQn4Z51u9NcB6/zna2ph78qVWF6i2MKVrOkw4+V3++XRCbAHHVw?=
 =?us-ascii?Q?yIAbu4GXx6Vsi7aJw+jbEx+L/9LnRihAYe2GcW5NnvH8gcj4a8ODbfPo0oOC?=
 =?us-ascii?Q?Iygcgfo62FRq8ycFVlJXH9mupsUDKMLtum7ihRwigDw9jMSbAaS6XLJavnu1?=
 =?us-ascii?Q?aTPD3NTO9Ex09SwQJG3a9E5uknJ8EDdnPU/ok2u/7Rw8YatGLgbJvJZD1Wok?=
 =?us-ascii?Q?u/QvHOAFZaUJwhnrWFTCrK9N7Ab5aBHe5CZefPN/kXRnRU91+3GbTXiZovGe?=
 =?us-ascii?Q?kODMx6dGP/hhj3F+IWRYQylnueho7g1ENPwEh/CONFmV9EtLrcYfrNRH0S0l?=
 =?us-ascii?Q?C9VjI95egN7vsaK3lZluG9sjyBMT99KZgmF71565EDIdRbhbqKAhzmGcqXpb?=
 =?us-ascii?Q?bI79a/+jizyMTPOMvBPfnoMpOZPfEC7P2uolwpmBpK/aXlENibYEGMisV+4y?=
 =?us-ascii?Q?FZv7GkVOQz8ITnMN0AyiGWLmu5t5HJsJ5R/uJFkUSslMRPpnP0PHc4adLp8l?=
 =?us-ascii?Q?JVcDepEh69vQ2sZLSwtz4v95VofGyHUG/Ax2g0pmYKB4IcrkZL9YuUf7W8ai?=
 =?us-ascii?Q?vhV1AKLHAKmwbmKaI+TIJvHDEMoo+qnDBnsgR/d6LmNcaC5+At0jZgze7Cwc?=
 =?us-ascii?Q?REo2W2G9Jj5k0xOSgOYB1xt+34qm9cqAUT0rIUg6zsAcwxmEM9mQLZ8u3z7G?=
 =?us-ascii?Q?v1yAIDQ4E0y3gsQyLarOR02HtMnr5YGvn1yPHhvJR6BsWUuBdpgDTCUgRtML?=
 =?us-ascii?Q?CbeqBnxnbuZ2mCZGeoVmOd9+reZkZCgf1S6tfvsstyRf1MhrDAPF3gU5bgNB?=
 =?us-ascii?Q?G/mGmCnKbJabAf/7Dmt9FheXETHPqH/DxrjRnQEX+skTY9PBJStbLpxGrgNN?=
 =?us-ascii?Q?K/YYqDuncOBkFuzBLRfS4kQuBl+bDpnpEpSQRJ5sQ1TJUb+n1x00ebDFNEBm?=
 =?us-ascii?Q?kmAgfF1cPOZD92gvSxZ5DlEX9SbufRIwDZOj1nBNZtZZjwoQ4ltlJOIoDXVu?=
 =?us-ascii?Q?fzwYjgTr9furYCdYYJtTi5jF4ZHeWEkRikw6zGMGHqY2PT4lI5bLhc/XPtir?=
 =?us-ascii?Q?otze3Eq0+g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f1eae0-4557-4255-33c3-08debb4e76ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 17:44:40.5365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LnQqvEY05s33ZTxzVz2gc5Pq4GXVdrjqc2GS3uT02jsVaIfJwc1Czd48llvFO/QvabLFgaoYnsBsTAeaWwftmw37e87o8ikCk7rYh4qysag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16891
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33178-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,lunn.ch:email]
X-Rspamd-Queue-Id: 4436D5DAE15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Jakub,

Thank you for your comment.

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
> Subject: Re: [PATCH net-next v5 08/14] net: renesas: rswitch: add locking=
 for agent clock control
>=20
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
> ---
> net: renesas: rswitch: add locking for agent clock control
>=20
> This commit introduces an agent_lock to serialize access to the shared RC=
EC and RCDC agent clock
> registers. This aims to prevent potential race conditions between ETHA an=
d GWCA ports when enabling or
> disabling clocks.
>=20
> > diff --git a/drivers/net/ethernet/renesas/rswitch.h
> > b/drivers/net/ethernet/renesas/rswitch.h
> > --- a/drivers/net/ethernet/renesas/rswitch.h
> > +++ b/drivers/net/ethernet/renesas/rswitch.h
> [ ... ]
> > @@ -1207,6 +1208,8 @@ struct rswitch_private {
> >  	struct list_head port_list;
> >
> >  	spinlock_t lock;	/* lock interrupt registers' control */
> > +	spinlock_t agent_lock;	/* rswitch agent clock control */
> > +
>=20
> [Severity: High]
> Is this lock initialized anywhere before it is used?
>=20
> It looks like agent_lock is added to the structure, but spin_lock_init() =
is missing from the driver
> probe path. Depending on kzalloc for zero-initialization is not valid for=
 spinlocks and can cause
> issues on architectures or kernel configurations that require explicit in=
itialization.
>=20

Good point fixed this.

> > diff --git a/drivers/net/ethernet/renesas/rswitch_main.c
> > b/drivers/net/ethernet/renesas/rswitch_main.c
> > --- a/drivers/net/ethernet/renesas/rswitch_main.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> > @@ -173,8 +173,12 @@ int rswitch_gwca_change_mode(struct
> > rswitch_private *priv,  {
> >  	int ret;
> >
> > -	if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index))
> > +	if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index)) {
> > +		spin_lock(&priv->agent_lock);
> >  		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 1);
> > +		spin_lock(&priv->agent_lock);
> > +	}
>=20
> [Severity: High]
> Does this code cause an immediate deadlock?
>=20
> Because spin_lock() is called twice consecutively without a spin_unlock()=
, it appears the CPU will
> spin indefinitely waiting for the lock it already holds.

This is a bug. I also fixed it.

Best regards,

Michael

