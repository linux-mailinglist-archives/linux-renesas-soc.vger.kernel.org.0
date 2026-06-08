Return-Path: <linux-renesas-soc+bounces-33663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7k7HBKyuJmp7bAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 13:59:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90880655EBA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 13:59:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=IoaQ1uCN;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C8F3300CE86
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 11:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7E0372662;
	Mon,  8 Jun 2026 11:59:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2132372673;
	Mon,  8 Jun 2026 11:59:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919977; cv=fail; b=V6gI5xrx+WyywscU5Df4BjAo/8J3dOLtKQs/qvOTX1jdgutv41YswTna3mXJFJ2DGgw7zxMJeCkdmh7nvMu91KBz4a/ZU/22mVJFj2Z0S0kkXE2qIvorGrx/9jc9/U5F54MVQNGilnSfkFj04iTLSM+ZfQbnO0pewQIlmkF6bdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919977; c=relaxed/simple;
	bh=jqvMjS5+lH1PPgJ5OIhlGhAAo2By5CiUS4FEayTcMug=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AsW6c/702rts2SkwRNYlfNjS0xP3k5WvkAsrMriEJ1S9zO9nOnahFMBpnWTeLDyip1sYnT5z0aURafnfBGqzkq+5kUVtjdHINfDXESS/6wJSilhhV4EIB/R7kUDN3sRrjmqMaJtQ31+JvdEcafaY64rpe7+zMygPPl44QBus9IA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IoaQ1uCN; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/sQriY2WHI5aIkSfpjwIE+v30udISBHv3vNt7WEXMsR8CKoqSCs6uwRxnAoaS+/qfrpjJu3UHWuzFnUTcUhy1lxPEt6IyjCCVPuE6ozdt/sR9YN0lTKq/fOmaDa2kn47bcMQNYt5ikqSWXY+hAqlRgO9wZbmr7gEEyO3SGINj/6sasFozn2gJ8sjy48LTi9XTRj8YlQg/iyuBE3h4YWSFaCVSYUJyapxNq1afr0xX6gkFytbSuGc42unZDkSYXx6gtvPcXmcfVIJlQZpMYizu4ncdMfHYOjCAEWkuQ+jDa6VKyLAHhWefwAib6qW/5THCC+bUZAy4XrgAPwgA8BsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHN+/miv0t+1SNzUENiok7/PUSWoH0nVG0RbgQvUXf8=;
 b=J0pRPBtKdP1h28RiOBLYM6zDwSO2ISsdzqQwJy779XuADLB0p28h8ZAsMLS6Xf8KYrbJW6AtEemrXZ+Kx4m78Th+STzbEFjX9/4QNIAT1Gl3yLEfz0607fEm+N1u/vox88xt2vdwNUlBKc44/bGOhu02ceHKKe3EfUdXi4kbmfEpR6d0+p1tXDzjfK1qOXyY0no/vZRz9h2WX4otyBqytd3zzWJeqpX9DFKwJACL1wVoEIaJYJPpoxlj6hJqOII1NLqNq0Ohns55fzQH4IJUrCf1dbpLyDOjjUP4anfwTvWIuaLr76KfkMPjBifuOfL4q8E375TkXpD/xC/CpfyMaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHN+/miv0t+1SNzUENiok7/PUSWoH0nVG0RbgQvUXf8=;
 b=IoaQ1uCNS+zW27Aweu7x3yEDCUXRKPeYQREXVqghUQqCL9D9MP6k/NTd4MCg7FqdY7KmqZDx1xt3JuOTwvcBcRvqwtsmBZ4q3EXik0jt96lonmdDfE543YBaanfIOcbDnOjo7VjYUxRSPHqFnfXXkhfEkEbsIPdk2EgpQnX3PV0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12528.jpnprd01.prod.outlook.com (2603:1096:405:197::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 11:59:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:59:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Lee Jones
	<lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Tommaso
 Merciai <tommaso.merciai.xr@bp.renesas.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: mfd: syscon: Revert
 renesas,r9a08g046-lvds-cmn
Thread-Topic: [PATCH] dt-bindings: mfd: syscon: Revert
 renesas,r9a08g046-lvds-cmn
Thread-Index: AQHc9z2t0rzHysclGU226VvULbQLWLY0jbug
Date: Mon, 8 Jun 2026 11:59:32 +0000
Message-ID:
 <TY3PR01MB113460B7F122E23FAC4D35502861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260608115507.134969-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260608115507.134969-2-krzysztof.kozlowski@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12528:EE_
x-ms-office365-filtering-correlation-id: 4e74b17d-fc5e-4041-2245-08dec55566dd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|11063799006|56012099006|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 ZGIzjH3l+6XbGrbj3wMp08Z9bP4oXXzisTBgMmRakxVvjZh1SPEtFpw54iFdOb7aN9AxCLG+TZOV0u7af2sFPcTORMPBKjRIn2jKBAGMIKyfHU1tULdtGJJXba60wC88JX1fNOjdSzNwTlbFjP0wlWKW686bCG6awCnB0d1DFnziRJFjHbjOxTFEGWqBzVHqx7Tdlgrw2UZ8dnwUiT5T5A3RWbmjkXXZUZ+3Y5Cg/lBOIFQLNf3GEzlVeQ8fbSBTOOArej5Wshl5LtoPaQ8x8txG1ieZpmuov3ejVfyQNIEtKp4VU+vwYOEOPymPgiKdjX/byDp0fZXWL6frMj7GJR3XC6qhquED45Y/Qzt8I+pj2IciQlrhe9YbZ2icDFsnhbx7+1UBhF277J97Vg54+HV9RXlvRisAelZSJ0Y319vt9I1Y+xmLgb/xbjWJnaSkLIknHJlhuvEzFu+hc7YR33mOztdyAWYAS4TcVMZj33TXq89j8mNJAbWAhFkJtzf6DEGwgFPGu4Q6eXggrw2kTR0ypxm3X0sgrxiPHleY8ibC5DulmCvY+e8T2NSL9f7MyHrSLA/+dFy6w1YO/OFelOvZwGtdKJTXC/wa2EBPqU95T3LWxHfhiUtsQ64FOkgmkDqHcCPikETA+3r6ohM+L4THzlfZpbM2QUtPq6Igl3Gk7AvzZuwMmpuK1iUBnK6EgOS+rwn4dZ9hxvj2DSYCwXzomuz0ZCFfXt38H3EhhFvqZKBH8ZS+0j/HB81jlF6trWA0FZ5H1LWXeNGE3xFNeg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(11063799006)(56012099006)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YEumUSoWGjoAUFDfcKUt/Lg1x5ucT5LhT5fRP/sYQEft90/TdcZMZ3ea4lwc?=
 =?us-ascii?Q?K+QPvTmDS4dzEyzbcpuMwsXpFrbfC5rnvEk0hlq0bbaBgv/QF0/Fgsuzlp98?=
 =?us-ascii?Q?9XpAKkIo4hQwaWDu/1fGGlnc4dnANOqsDOq2aTXQsWpwCN8rC4ZAtG2p3OiU?=
 =?us-ascii?Q?pH4H0QdKqpi3/Dbi9N6vkWOIT6M6s99Th10+sh7cJOV9nrhoYbrUw2GupcTa?=
 =?us-ascii?Q?fdn2qoWtEL2Prbuyk+7ZYAYFmWr/7y+X4dYl1q73cHgbQpw4cVMWxbdiz7oK?=
 =?us-ascii?Q?4pdB1Uz+iQC48CKrvVK1MttN/2TuyxMUCCd7jN9do4OligfPoY8STt7nwxwC?=
 =?us-ascii?Q?F16mMnfFEZuN9+hTCCLy58+xhF0rkh2+v29JuKesX11TpN5AmOUBqjId2YCz?=
 =?us-ascii?Q?QMKCMV2zqx3rBivSud9nXlxAWig1klv9rmtEowGMZSZYGoISuL2/W7ceq49l?=
 =?us-ascii?Q?CLnZ64FNQUDPPvI7L3iHpXfJYt5RWcfoKj2N+t3xRmLROJ31/3dtL+uwCoil?=
 =?us-ascii?Q?npaLQgSSXZr11DS0dadA0f7rLwGBdLMFU+XAuubXhU8oOOhSRfgGv+/zsba4?=
 =?us-ascii?Q?i8cDQiJvpmb3Gs65oX6sKGFFXsCFov1RqYGpraHD2Oa5gomD7x4YejF3+/6K?=
 =?us-ascii?Q?RW4Yp/MpvzEyCmI0UYeaKHTy9443Zh/5qIkj6vX8xfq3cSvI+MLm6/3EjAmz?=
 =?us-ascii?Q?q2n6xtc0Pmad2LTRSAhPJ+oU2N/sKzgrl7RVRnBfh8deIKsgibtOg0ujTr3r?=
 =?us-ascii?Q?YdJ2zmFC1sh5Fl6B16jaMIYy0oChdHsg8G0vMXTE/exlas2KfTREtXPVCLJS?=
 =?us-ascii?Q?Tb7EApF8IiD2JYcCvu5BSMhTZisilF8bygXcT42u3kbaHxgtRoSRqrCcA4JU?=
 =?us-ascii?Q?9Rxa+ORYNEKVkJhuIB+Jy421sF0sY2XIS2ezwXOAbrQq0eN0QkrXS0cLG1MP?=
 =?us-ascii?Q?wpLTh5YCVq1m57y4/AFqYii91lY7rYp+K0HqjvGObuOIOGFxvsLX5jAPR1dm?=
 =?us-ascii?Q?ZO4mIuGiiJg1ywiTzwY7NuxNBCvYix6MhgpDZV1XpKf72QjUKVXLlH5M+c50?=
 =?us-ascii?Q?fxWFI1gVsbNuiJbf2srrMe0QG7HQk2O0Ts6tWtR+0K9sj22/utYz9LjczeZI?=
 =?us-ascii?Q?S0Xe/yDenCUuzPN3SM23v5SdvXTaZJm9SP6ejv6KyIUhynnx+1BtkUJVPkMJ?=
 =?us-ascii?Q?R3BpumYLH0oPTrgYk3NRjNcu5REjKCJx+3S3UpsXTAEsTkQ20hpEqWdZSRKV?=
 =?us-ascii?Q?gqjC4+OM8mYuVKCY4FuiVY3KeWnkmXm0x/WQ5sbQdvHVleCC11Yh/7kveKwB?=
 =?us-ascii?Q?vZUXRXvcQBZgaKY0RzIswzXNOvdtONin4m1wytlP9/1ib4kQjlLf2b7QpkC9?=
 =?us-ascii?Q?Nt+7Z993i/scIBi787hUHiiADKS/MU8HaKO8HlWViElKoj2KKTPXlhdCLJ8z?=
 =?us-ascii?Q?gspy0kpRhSFqXtF8HxdV/dtebjP3a8ipsY02asrdkqtv8AThelMDPurVit8M?=
 =?us-ascii?Q?Ppnd/Nps0Jk0EkbRk187zKWS01qyHhwfdN1rSTMR6pSNj+kUzvwECtnLEDKe?=
 =?us-ascii?Q?pZ6/OeSbuJLB75efwzw+y57Y9B0RGPiX9fuzH8K2wbGI5s0TBMD8I3Zz/abB?=
 =?us-ascii?Q?7KC/pWRCv3e9KWJcC9eKpyI9o90lRX80w5EdlB7ChoPKxj9D6I2+kk9T8jAd?=
 =?us-ascii?Q?xlaux94V44wX19iViMTFZubiQK9FAYCIe815D9Ati7uYDLknrz2DMednFgvH?=
 =?us-ascii?Q?IFgtDtd7Mw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e74b17d-fc5e-4041-2245-08dec55566dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 11:59:32.1700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OdGSzC2ZfjZIn1mka+3B/ukBWGyTS5TbVRxtzXNVh2eDcel70ot/e5o49NEV7oDQNinEa9suvy5SVWwVNwlxTltGNbvXjuYoCfJfQw4RvmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12528
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33663-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:tommaso.merciai.xr@bp.renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,bp.renesas.com:from_mime,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90880655EBA

Hi Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Sent: 08 June 2026 12:55
> Subject: [PATCH] dt-bindings: mfd: syscon: Revert renesas,r9a08g046-lvds-=
cmn
>=20
> Revert commit 51284d8b1dbc ("dt-bindings: mfd: syscon: Document the LVDS_=
CMN syscon for the RZ/G3L")
> because it is completely not matching reality and clearly incorrect in re=
spect of renesas,r9a08g046-
> lvds-cmn.
>=20
> It wasn't ever build-tested by author on their DTS, either.

You are wrong here.

It is tested with below DTS,

		lvds: lvds-cmn@108a0000 {
			compatible =3D "renesas,r9a08g046-lvds-cmn",
				     "simple-mfd", "syscon";
			reg =3D <0 0x108a0000 0 0x10000>;
			#address-cells =3D <2>;
			#size-cells =3D <2>;
			ranges;

			lvds0: lvds@10 {
				compatible =3D "renesas,r9a08g046-lvds";
				reg =3D <0 0x10 0 0x8>;
				clocks =3D <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
					 <&cpg CPG_MOD R9A08G046_LVDS_PLLCLK>,
					 <&cpg CPG_MOD R9A08G046_LVDS_CLK_DOT0>;
				clock-names =3D "pclk", "phyclk", "dotclk";
				resets =3D <&cpg R9A08G046_LVDS_RESET_N>,
				 	 <&cpg R9A08G046_MIPI_DSI_PRESET_N>,
				 	 <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
				 	 <&cpg R9A08G046_MIPI_DSI_ARESET_N>;
				reset-names =3D "lvdrst", "prst", "rst", "arst";
				power-domains =3D <&cpg>;
				status =3D "disabled";

				ports {
					#address-cells =3D <1>;
					#size-cells =3D <0>;

					port@0 {
						reg =3D <0>;
						lvds0_in: endpoint {
							remote-endpoint =3D <&du_out_lvds0>;
						};
					};

					port@1 {
						reg =3D <1>;
						lvds_ch0: endpoint {
						};
					};
				};
			};
		};

Cheers,
Biju

