Return-Path: <linux-renesas-soc+bounces-32962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LhuCIw8EGroVAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:22:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5045B2ED2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 62E2E303908A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 11:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9263905E6;
	Fri, 22 May 2026 11:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KjeOlmwN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451043CDBA5;
	Fri, 22 May 2026 11:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779447768; cv=fail; b=IdXm3NO4Ki267Y2oJQhA4wzuodlAwe+t0CsdGiwFCbtGJfc+hXINipnCBxRJSn2wjymRcyN+j+0fPLL5n6BcJjS4SJ7e7uQF205hl/LIs96jNe1qSV6Fa566DxRwlrbRh12f7FCedLVFj/bBTdGvSpGDKRsohiFDYQXwhvjqvxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779447768; c=relaxed/simple;
	bh=Et60aC/7qWmOEcSkMAUZddY9fqzv/ss6G51IKY4A+QM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r4FSxQoqCSASkXD3CKbk4bzDbDSeRjJauRidF+/ZedLIYVeaZO/Z14h17lDjBYKvib9qOu+yNAxy8F8U3sNNj73Sikw1t1bNqgPgevnsLK/PKjJINU9p5koRUnj+TfKouMKgEynBnamSI1/jrdzR+1+7IHa9JHmPGylRPGT4b8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KjeOlmwN; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVjp0v82UFxTf2O5dwON4GSzVMB6lR2xrZqDxwJnfEkJ/8uUbymafiwYyOrQLYAnPdbNJa8jVo7Sr4qJE+ob2hE3Y41YvthAgJ4Wq8dAQ/ThazXOLVyw620R3hq1IrsUvs/ihDeGQ7/wvKLRydado7fhnUhTaNdhuclJDSW8BNd3Tz8eqyhAyNxN8bL3Ti8jXqGivxsYTi/kH8rKdHSO/7RMYCnbNgrVBmE22R9SNm3qTnF84aTXDoDY0HcoCY2M6Ch2WtGS5Qm/8v5GX7y4K6Vsy4NsvUSrKZ8sh8Vedf8iZgnQ4ewqXbxayxaDvsZcdg6bfcFZdyVugCel25mRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80HgSrDg74f2/7+COQfFKK6NALlXEsS4kVxwjErhB+0=;
 b=SzIMXFqzOX6jZmqZNaHnfdCugJSLlnxvYkamkBbzp47HjK8FJXieEgDA0Ft3hinzfeUEVciLXs0ooZjM0OZ291vfaMrLYt2rOFbtUrCaLF3X82+d0dtErFxm9dhobFs2A3JZc4Rm3EmmALYBspiLvKhCmVcKMInC7DgdKu/hzgIrrjiab521L/NwhLAhQQQTO8CZEisFf3t1QpKV+I5HzEWPoHFr0wtABMzUBNluJKuh+jsJb7dQ8wrBXikmpMGpCRx85OMwOAcwdoDvZAEVvvor7IS0mk2NHYmrx37Np/HQvdJ02Nw7Hwss7EuNkSzAzBNLchYB999dEyh9exz++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80HgSrDg74f2/7+COQfFKK6NALlXEsS4kVxwjErhB+0=;
 b=KjeOlmwNP/qzzndvQ1Jeo3Y2ItnHbaLd8iR4iIQjvj9bf5BANyhy+8gjU4HBQPw2IH0pBA67aOBftdlh16c9izj3fjXmljvZluquhPAq7zP3eta6LZ37MGOUJg/8mIkPFTd1DC8+edpLZq3OpR2XrCRPPlxGcqTd/hcs2CNR6ns=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TYYPR01MB8264.jpnprd01.prod.outlook.com (2603:1096:400:fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 11:02:43 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 11:02:43 +0000
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
Subject: RE: [PATCH net-next v4 12/13] net: renesas: rswitch: add handler for
 FDB notification
Thread-Topic: [PATCH net-next v4 12/13] net: renesas: rswitch: add handler for
 FDB notification
Thread-Index: AQHc4SOaC4EteeXln0a+Ua6qEvW1bbYLL2yAgA6/Q1A=
Date: Fri, 22 May 2026 11:02:43 +0000
Message-ID:
 <TY4PR01MB142822AF74C6D980D60FC708C820F2@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260511-rswitch_add_vlans-v4-12-a5a225f8faae@renesas.com>
 <20260513013559.1408506-1-kuba@kernel.org>
In-Reply-To: <20260513013559.1408506-1-kuba@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TYYPR01MB8264:EE_
x-ms-office365-filtering-correlation-id: 690e7a43-c113-46cc-ea11-08deb7f1a5f9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|11063799006|6133799003|5023799004|4143699003|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 3W9eIVaqQ9TkQH61To9hm5gT51MImkd1UbEHQlAaLOc8wMxwMAoXrOB01opf0diBsPnufvNp3vAbJNYXclxTgtUQqdgHC7cxg8KpijodnkLTCzxe8H0oKbVxArtdgSxR8j4LV7McKyQ3V8lGL4piRzeTTe8nNLAWTjt0qOqEze1Qpnv1Ge8tTRSLao9m3lB1FVg9yQbdDFQx0ClFs81chIxirUTkiHbm0HSkwVI+5S6oWwVIhlCWTqNzBogEezdmlfdkaPTmA+Zst+XMR70vvBxxQXzLPbSPdMY3ZKtMnoZC0R72CxK/kB7nGGs5zhvLCfgaVlbv+mL5BwP0SpATFLZ4qBTP5qajZOQ03XGPoza2A7IA7xsfEE2O+UtzoSOgpFt5lMP3U0BB29sPUIKZ2wzusY4vzy3Gg0wviZd6ctBxjisAZPjf/MkFasOBMuuoyMu3OhOVAboT2ySZMTAgdxF0UrOAPuHg8BmUcRBSFMjd4+upRqbS0g7wolGDHjL+I+RtmYKpLTaQKn+iIWk5Mmc+4mOApLzwLFo1KuggA9ExdhiJqP85IGXC+7nHLVKWpz1DpBRhioDdmuYbbF9jNRvBPxbl5JJsMW637Slb+4rLQACce8QdwOvhgfW1711lzqGuKCbJmABCH4XRA5jrG3AyjDmk8j55ksZyfyQToxCkeMrW1hAUbqMATHbQiuPkFPnFCTydrl3lqzk/4r3cfTOsYEONKKcskBFkyA634AIxSq/z42OSLNXdHUFFeEFq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(11063799006)(6133799003)(5023799004)(4143699003)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IrRb2I2KIVsSvk+evZAfvbt/Nyyydm0xRpU6nAc1bRV8YhbHeqnWcXKgX1iw?=
 =?us-ascii?Q?jXJneQ9T/MXkn/waiWItGBxyM2BgWxjrCCWnb6vcufpRpc/Ku/YWHT5o+uft?=
 =?us-ascii?Q?sPRW9co0RK9//Yc02g1HCfav6T6NS0kU+p0sf5w/dOsg01ZEJIkcyvEqaXNp?=
 =?us-ascii?Q?mbIpZdX+kII8vQecYK3jnJdAZmveVQ+sSDNXwImVWMf4+VoxSxvdnEvmJEZO?=
 =?us-ascii?Q?3L0VhDZHq3sc8b/mkLNviOI1yleK9pPAAt2hLMmJIzfLFeESaXeC+vOJAozo?=
 =?us-ascii?Q?+JebQRzkHn8JwtypKaDn42T0Y8wHgf0f+JXPS+pAG9p7lHuMAB03B9PlBSgz?=
 =?us-ascii?Q?MiiiDFk51Z8jktnekrhlNVBlatlkW6pz8FTNuWKeaVFXn/tfUAHgtlBywd0v?=
 =?us-ascii?Q?JTyTVlNlY5XguzCdI/p57wtmBn8Y74Sgi1hYutiOpKpaRmhFazuhkheMf5Si?=
 =?us-ascii?Q?42ebazUpTg1ejpRd/nloJgFpAeUtyE+qSkveXltrfBCN6G/fTYPkl94McPsY?=
 =?us-ascii?Q?JFGTKT36r/wQsvgv1jQn4WSZ+hNFQ9509kJm8qrWTMN/SfMPWcYEZoYX9SyK?=
 =?us-ascii?Q?EGb+eHL/etHjK0CXeDPTPI/bzrEl2Ph5CRouCCEeBG1ZvY/iHFNcSCJnOV1B?=
 =?us-ascii?Q?nLLdDJFQJAFGpWY4iuKhNDBp6LanGEYwecrEqC47fLeNvcR9/7rI3DZjERHF?=
 =?us-ascii?Q?KfIxVeQbUMh4JWY6/pTzQXYDE3mUTiAbQNQ7QTnUAVlP97+d0HjogZh8TR+8?=
 =?us-ascii?Q?Oqsz/bZ3rk/CYbYqceuNY5aGOOOtrYgPxck/F4dOo3T+7Ss9pgIWr/Ap1JfZ?=
 =?us-ascii?Q?9JwS/dRMj+kE+2WLmWr8ocbTxQDiRwf1QCLEwbI/t98z3e3A9SwrWBlzZ3eu?=
 =?us-ascii?Q?dR1KSgMSZBwe714zAjjhf107hUsd9FfgOyqH8pKw4AF5ELE6xldCnxGtFtvu?=
 =?us-ascii?Q?GPjMa8eh5xZHcLiAQaPD469QTC7Bki7T2DAq9v18K4d3OnsogSowxoYcPCi3?=
 =?us-ascii?Q?AxRuAqFKmFkmDm4pZWba67oCd3hxciCk6likewYkGQgQciJ0aEFhVCkma8YG?=
 =?us-ascii?Q?8kg4MibDNqvpHddk0xWLZYakpFqJNUl5X9RlaL1KXnhOjJFu+IysZPDSJ6Yg?=
 =?us-ascii?Q?Lz7ejPFuEH1LX0GV+fMME/cxLWyfV+bhld7jfyeZa1j1dajhlWXS6ls3pfsL?=
 =?us-ascii?Q?/XTOocbvy49wzyMPFDJi1aIQnbH6lw6v67PT4eta2SCOcuX3C3UyKgu9vo9y?=
 =?us-ascii?Q?GKgTGFxVrbdJNTZbRO9o2vmsFmbhIHuXInreCTKX+BqUt5eZkF0/gZ50d+ZG?=
 =?us-ascii?Q?i3VwR0tV4YDPmxpVJi+Phg3YRN0pv53RYOgRSQec+vixIQ+ybCiL+kD/MEsR?=
 =?us-ascii?Q?eIsXqGwXv4cOku0ChiXHGmuFGXgWsUQioSCDSUhc5ZO1JHkBsGu+JdFsohvv?=
 =?us-ascii?Q?mxxjRH4W1Idh5yTwT8aQfqz8ewvVjkkRJjY9Sag7TDpDKoRPKnrhcw2i71p6?=
 =?us-ascii?Q?0uze3d9DoCL0De9bISUZc+gDPciPSjkn1cVLUb2AcHDNNtABDLtFYufj565z?=
 =?us-ascii?Q?afWSwnY6LrZ23gyQruF34gimrPjTDCooVQWS8Rt1wyfXrwzZtJ95QxFZz99I?=
 =?us-ascii?Q?NGPYWzLnoyD2BusH42ZVmLAtoYwNV7QYW/1OagD64go5UPTgfCzJBAEJbkdO?=
 =?us-ascii?Q?rB+JYeutsTbftGKThGdj+H9kuebTT3nksQiTQ4K07tVb7ZlJb0eG3ErYHnfP?=
 =?us-ascii?Q?rGzhoMZp2g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 690e7a43-c113-46cc-ea11-08deb7f1a5f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 11:02:43.2328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q9KsWQ2yg6YCI6pyvcxiz6l0u0zxbysPvDqm9JslN/uBoIp4kj/3rPqVtXvP31D74AcDzS4dGVlZcuXTsphx/fAtFmgl4rpHsH9EGjWPw4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8264
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32962-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,TY4PR01MB14282.jpnprd01.prod.outlook.com:mid,lunn.ch:email,pbarker.dev:email,renesas.com:email,renesas.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,davemloft.net:email]
X-Rspamd-Queue-Id: 6B5045B2ED2
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
> Subject: Re: [PATCH net-next v4 12/13] net: renesas: rswitch: add handler=
 for FDB notification
>=20
> This is an AI-generated review of your patch. The human sending this emai=
l has considered the AI
> review valid, or at least plausible.
> ---
> net: renesas: rswitch: add handler for FDB notification
>=20
> The SWITCHDEV_FDB_ADD_TO_DEVICE notification writes the bridge MAC addres=
s to the GWCA and adds a
> static rule to the MAC table.
> The SWITCHDEV_FDB_DEL_TO_DEVICE removes the static rule from the MAC tabl=
e.
>=20
> > diff --git a/drivers/net/ethernet/renesas/rswitch.h
> > b/drivers/net/ethernet/renesas/rswitch.h
> > --- a/drivers/net/ethernet/renesas/rswitch.h
> > +++ b/drivers/net/ethernet/renesas/rswitch.h
> > @@ -1213,11 +1213,20 @@ struct rswitch_private {
> >  	bool etha_no_runtime_change;
> >  	bool gwca_halt;
> >  	struct net_device *offload_brdev;
> > +	netdevice_tracker dev_tracker;
>=20
> Is it safe to use a single shared dev_tracker for dynamically allocated a=
synchronous work items?
>=20
> Because system_long_wq queues works asynchronously, multiple FDB events m=
ight overwrite this single
> tracker state before they execute, leaking the previous ref_tracker alloc=
ations and potentially
> causing a double-free on netdev_put().
>=20

No, it was not safe and it actually threw warnings. Fortunately, I was able=
 to find an example how
this was solved in a different driver. Now it is fixed and working.

> [ ... ]
> > diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c
> > b/drivers/net/ethernet/renesas/rswitch_l2.c
> > --- a/drivers/net/ethernet/renesas/rswitch_l2.c
> > +++ b/drivers/net/ethernet/renesas/rswitch_l2.c
> > @@ -82,8 +83,9 @@ static void rswitch_update_l2_hw_forwarding(struct rs=
witch_private *priv)
> >  			 *
> >  			 * Do not allow L2 forwarding to self for hw port.
> >  			 */
> > -			iowrite32(FIELD_PREP(FWPC2_LTWFW, fwd_mask | BIT(rdev->port)),
> > -				  priv->addr + FWPC2(rdev->port));
> > +			rswitch_modify(priv->addr, FWPC2(rdev->port),
> > +				       FIELD_PREP(FWPC2_LTWFW, ~(fwd_mask | BIT(rdev->port))),
> > +				       0);
>=20
> Since rswitch_modify() performs (val & ~clear) | set, and set is passed a=
s 0, this operation can only
> clear bits. Can it ever set bits back to 1 to block a port again?

Since bridge ports are not overwritten, but need to be removed and rewritte=
n, the bits are set, when=20
the port is removed from the bridge.

>=20
> [ ... ]
> > +static int rswitch_gwca_write_mac_address(struct rswitch_private
> > +*priv, const u8 *mac) {
> > +	int err;
> > +
> > +	err =3D rswitch_gwca_change_mode(priv, GWMC_OPC_CONFIG);
>=20
> Since rswitch_gwca_change_mode() transitions to GWMC_OPC_DISABLE asynchro=
nously from a workqueue
> without stopping transmit queues or NAPI, can this race with the active d=
atapath and corrupt the DMA
> descriptor rings?
>=20
> [ ... ]
> > +static void rswitch_switchdev_bridge_fdb_event_work(struct
> > +work_struct *work) {
> > +	struct rswitch_switchdev_event_work *switchdev_work;
> > +	const unsigned char addr[] =3D {0, 0, 0, 0, 0, 0};
> > +	struct rswitch_device *rdev;
> > +	struct net_device *ndev;
> > +
> > +	switchdev_work =3D container_of(work, struct rswitch_switchdev_event_=
work, work);
> > +	ndev =3D switchdev_work->ndev;
> > +
> > +	rtnl_lock();
> > +
> > +	/* Unfortunately all net_device members point to br0, there is no sim=
ple way to check
> > +	 * if the event was triggered by a port device setting.
> > +	 */
> > +	rswitch_for_all_ports(switchdev_work->priv, rdev) {
> > +		if (ether_addr_equal(rdev->ndev->dev_addr, switchdev_work->fdb_info.=
addr))
> > +			goto out;
> > +	}
> > +
> > +	/* Handle only bridge device */
> > +	if (is_rdev(ndev))
> > +		goto out;
>=20
> If the event originates from a completely unrelated device in the system =
(for example, a different
> ethernet or wifi interface), will is_rdev() evaluate to false and cause t=
his unrelated MAC to be
> erroneously programmed into the rswitch hardware?

I changed the logic, now this should not happen anymore.
>=20
> > +
> > +	switch (switchdev_work->event) {
> > +	case SWITCHDEV_FDB_ADD_TO_DEVICE:
> > +		rswitch_gwca_write_mac_address(switchdev_work->priv, switchdev_work-=
>fdb_info.addr);
> > +		rswitch_add_addr_to_mactable(switchdev_work->priv, switchdev_work->f=
db_info.addr);
> > +		break;
> > +	case SWITCHDEV_FDB_DEL_TO_DEVICE:
> > +		rswitch_del_addr_from_mactable(switchdev_work->priv, switchdev_work-=
>fdb_info.addr);
> > +		rswitch_gwca_write_mac_address(switchdev_work->priv, addr);
>=20
> Does deleting any single FDB entry on the bridge wipe out the switch's CP=
U MAC address since
> rswitch_gwca_write_mac_address() is called with a zeroed MAC?

No, this does not happen. I tested this and the MAC is not deleted, when a =
single IF is removed=20
From the bridge.

>=20
> [ ... ]
> > +		INIT_WORK(&switchdev_work->work,
> > +rswitch_switchdev_bridge_fdb_event_work);
> > +
> > +		memcpy(&switchdev_work->fdb_info, ptr,
> > +sizeof(switchdev_work->fdb_info));
> > +
> > +		switchdev_work->fdb_info.addr =3D kzalloc(ETH_ALEN, GFP_ATOMIC);
> > +		if (!switchdev_work->fdb_info.addr)
> > +			goto err_addr_alloc;
> > +
> > +		ether_addr_copy((u8 *)switchdev_work->fdb_info.addr,
> > +				fdb_info->addr);
> > +		netdev_hold(ndev, &priv->dev_tracker, GFP_ATOMIC);
> > +		queue_work(system_long_wq, &switchdev_work->work);
>=20
> Is there a mechanism to flush or cancel these untracked work items on mod=
ule unload? If the driver
> unloads while work is pending on system_long_wq, could it cause a use-aft=
er-free when the worker
> eventually executes and accesses switchdev_work->priv?

I added flushing of the work item from the WQ when the driver is unloaded.

Best regards,

Michael

