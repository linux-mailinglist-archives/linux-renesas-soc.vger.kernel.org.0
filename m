Return-Path: <linux-renesas-soc+bounces-30885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGbCCHcq0GkH4QYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 23:00:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3573984EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 23:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8A43300D55C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 21:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8E03D5662;
	Fri,  3 Apr 2026 21:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lFgYKSJe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010035.outbound.protection.outlook.com [52.101.228.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D7D359A6D;
	Fri,  3 Apr 2026 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775250033; cv=fail; b=nOTs3gWMisM8m6e5wDB31COOqTAqw5R+8JnmAf8IZknm8ypEygnegRZudxepOWva+sJjvKJnT7oYK11ESKuX6BY1f/v56p2EmQtlwtFs/nGLWPjT20YPbta3MclQRRLabd9PJ8y9+s5oNeY1NIY9DYXLHAYoPcn+ViVqa6+e/G8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775250033; c=relaxed/simple;
	bh=uMQaIuwHkGarhM7cv91e3MLnEU61MAu4hy+DdXsI84M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ki9MriJ36wa9jo1Doajuxcn9Z9COghEc0cfN+eTum3hhGzo1GHeB5E5i4qx97s2vKEUIb/EzKZkJeF6/9R4GxDuf47PRKDsEELOIYKV+EZyJNiiq14nDPmNmuzHvyogSdD7jULCWcpfb43iXZvzNU+o0Up194l5TtPJFQe7fT4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lFgYKSJe; arc=fail smtp.client-ip=52.101.228.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvsG9wOJDhlcMAbdmoShkBU11BrrcsVOgOxbacISqECv8o4HkgQtZzr9AZMhhhu0nFUI6HVPSVFp3pqzmJivay7EpNHIN9bUPWqCt/yfMkhs0Cjc7i2cMLGGqs+sLDaWJgeMtUc6CpfikV1c8cAFoKu6IXVFiwGwvBW5E/bx2Udg2iNoFc/c/pfV33GOLAm4E6tKZSKMuZP2biEPA5iGW5oA351C299A8iqC0TMNyGrlnMDvM9foV0Bg3HN8nbh0bKKv7phfjGOptNVLsy9fvRw5rZlhKCuEnlsNm0Me+wrAUCPnGADr0Y57oFKbHElU/a/DF3xpYbUn0+pgydzMcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aBLITy5vPusWYFnj2lTWssVGRTZUJ/IcPxwcu3miJo=;
 b=x9ghLC4D01FW6NRNMENH/WGWgSA7ELqxV2n+I+sQVkz1FW15UFJ6P4pgYPsn76ZKFeFGWwF8UVkZ7/6S7VoZzGP/fU9YLPreDbW+qUEhh3jbYPL9AQJtQ2otzXLjYOZHaxUQXnx+moIgqDaeeFqCECGs8F3fhYVzt3awdqtQiboR+Olglf6rLQ0o5H2b3RI1B0xpL4vhT6dCasK+9yLaAb4GyMudJaYzTGQOWTSfUisIjGvdrGLSxksq7Pg2/JYAr9mD6FQ2VOR13T48oQotwkr5WDFw8en8dQDDNITA+P+P4DEvMQ4od9Td84YE/bCM9A8xwRISiyUiuZ2bKpujPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aBLITy5vPusWYFnj2lTWssVGRTZUJ/IcPxwcu3miJo=;
 b=lFgYKSJeoG0XSPtcW3FNTd0QVZHv9Ye8BV5h7ydTEAlHFDRwYV4I+KMu7o0xKpP+kj5QxUMuf6C9F0QDKY59Hvdddn5I24PjAPYPOO68MhRcHvv2P9AA7IKuHj36aaTyCDdKfmYy5kieRffO/hha/6BQuQUi+iTFxcCCxzdKSg0=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYYPR01MB15191.jpnprd01.prod.outlook.com (2603:1096:405:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 21:00:29 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 21:00:29 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, magnus.damm
	<magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCh v3 11/14] ASoC: rsnd: src: Add SRC reset and clock support
 for RZ/G3E
Thread-Topic: [PATCh v3 11/14] ASoC: rsnd: src: Add SRC reset and clock
 support for RZ/G3E
Thread-Index: AQHcwr1sDLpsPp+pPkewtIY4PdshBrXMj6sAgAFDyWA=
Date: Fri, 3 Apr 2026 21:00:29 +0000
Message-ID:
 <TY6PR01MB173772234146C4A8970EE404EFF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-12-john.madieu.xa@bp.renesas.com>
 <87h5psg6w9.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h5psg6w9.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYYPR01MB15191:EE_
x-ms-office365-filtering-correlation-id: 75606d93-c232-4430-4369-08de91c40980
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 nZ7q1qeziVJksACdUkZm+S8oVYIdJtFiv9ETE5fDErAzSlxM5UGHkiFTznvWGXjnc7pPt6J0EXQ4Gx0PxatpkkxDQH77M/Pz7dJxOigIrKuZkUEHAFIuQQri+Jl8vdWg54E+xnjNEOckOXuRdAgF9/deyML16CxpeauOx6h1pGRCOv6X4c2tVtYTt35VuFCpbzPAAh6QwTykG6ShwTRFivVVy7oKcB42qINx8smiW2V8eTaZ9KYyW/ji53ZJUySADp65I0PNhMiQB5F4mHg65YgRjCxJzqk6uXkq48JlSMVDCN1JUrsWFTKNZdrE2wGs9Eh0PXW3wGpc3hoBQj/Q5LzUPj+Wx08xekcQENCk14TYsmgTkYPouniix5GdWWIsz6O7DAJQBUwDkmPEtfzsA+Wgw+Pt+vgI39BRTXfbFgN5DKHFFXdHIfFYZcCbgu6CRSpyyDdfeF3rcRD3NJRgEb+o5A+s/0HzQjD5jnNSqkT3bUyIK4xn9sXUxgZtqu9hXfqRzMr0tB3WXLEsZAUea2MFT6yeG4l3sCTIK5oMkT7CZZDiySh97Jkmk7dBHBknq5mA4Wk5DtZ4fW7e5+/6jKW5TT9iwHwWBcxyVBEDe+b1jRLYdvNfLMzFOW+Hbd1G9QQR7+BH7BJgD3xqE/WnP3VsfzPUQKjZNYsoyLDvqv8c8HXcFa3d0KlbFzraKhkKsV25gWrdQxdDAgnWlCpCKbgAQY8hcKCpkS5Y2+IrToLC/wjOcD+zf9TSwzs/Dupf8ETJCl2pr9MMNx32NpFSCN60O2SoCxo5s1+EJMTFlLs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xJWzfUCo0eKO0dwpANycWP1I1L8C2tn4xYeZWdmwI56tGxZQdjkKQRNhZG13?=
 =?us-ascii?Q?yz3IeK9lZDbLOwLp0EZBqgoFTacJEz7w5B8dhYZvxkrUmGSUIkQFlTZ5fzaS?=
 =?us-ascii?Q?tmpZeULG0gElI2K52gIy2bH98z7UAokuiOz5NP7NMbcLxQMXFAbwVQVxq4dh?=
 =?us-ascii?Q?60iRTctzBlDoyYtBsOKaNqRgOePeSu8gckTvRI9xYAAm/XcBKVEr8fhsp4lz?=
 =?us-ascii?Q?ffhnI/k8H3hec9BMfz9etUtxdBfLiS0gnWQs14u8xwSW9xeatE9HSGVBZ0Ku?=
 =?us-ascii?Q?5E0nyOVDOotgbMxpgtnbSED+SMEHBvh9Chy0/V9rXY9SqRgSU2Iec8ZbO9Lx?=
 =?us-ascii?Q?otKVW0Vo1cSgnUZVWjCZYGoYoy+qRDUvXP869Wfk4jAg/PD0n+iM46vXuU3c?=
 =?us-ascii?Q?GX2XUNbaxnu3LLTlvr1Fp/tIv0Su7RKXuh6+puTapbLuH9DwlLgBNs0eYtPx?=
 =?us-ascii?Q?hnD7tJfbFgl2eSGgKlhvH97XvsVTGG3+7NFkM2f3rFQmYzzQ+ve4v6ZsYBYp?=
 =?us-ascii?Q?ukf0JlY+AOp00XC5X3c0TzcWjB4WW4KwFthGXEy64fPgGUTBp5puyqu8bcza?=
 =?us-ascii?Q?zjB60QGrlQ8vGJHmAv6baqqvZAhFf+04QTPGMJL6leFMx+c67jtN0G91pBxg?=
 =?us-ascii?Q?mBvvMNoAdKr0H7CBTk0sgDmlHkqIzGSu2OtcGFpMWFOgFsj4VVqgquW9nhE2?=
 =?us-ascii?Q?VGWSUHxLOQpJ0g7I4Un6ZnfS9mOisC1hNCptQsgMAs1nmnhkhTTY5OZRAcn3?=
 =?us-ascii?Q?KvWWBKzH4rDxpO+9iBFHfuBkqkz4hjCFAdbmtoodsohbnhQSM7P9LiZbcOTe?=
 =?us-ascii?Q?Ps4CdeOeJIjkT6GeuXuNGh3KLO/2XbBZWdLq4MKmhcS0gUczdm/JZb9EatWH?=
 =?us-ascii?Q?KFYc805TAMTxG7m5cp4cqdL/WloAAtaYF01KH64GAo9dOMcy2L/gkjTZTOcp?=
 =?us-ascii?Q?TalG57JGBxEzeYYxYUgWcK+yLMFGgAIewns9Vq31oPsCCsEXAK6ZdWYz7nc4?=
 =?us-ascii?Q?DfnmZnTfsqN1lv/ZTpoGvTCdlLo5rSO0bMCvHYhH6k/Ihz/D3/ImRtjH998y?=
 =?us-ascii?Q?XXosJn1jJ4u/p194gQXBPWjjkxeMakjqpDW+ub9MeNDTF66qRdzKILLcE+Gd?=
 =?us-ascii?Q?S75ybKzSlTIMFao03B4HqVvTyXljPneEPBIzfBLmV8oC1D1uKfUsKkmh1HYv?=
 =?us-ascii?Q?n0bu2hosNUby30Rn6UsQ+y1tENLZ6x1Ii0yqE4sshUtxhhQasc21tYUMENpO?=
 =?us-ascii?Q?RnWXAjCMLjMfChJBk5fhffxAiGc30pDDC4uwQCFya1LgNkaW6M5cl/1pEM0M?=
 =?us-ascii?Q?P/0XVw05SGOZTHoe/ATElp5fT6YScZDerIYW1Ugu2eEjh6fS3ph6vpl/6TX3?=
 =?us-ascii?Q?GhbCZy+cGsAo0n4PNbQ6crB+EO7Tmw/RI+DM/WjfzvdeyEJSmKV5WTJlOFZA?=
 =?us-ascii?Q?L9Mo/wA5xiyjmpexEqW4b2wn1pxDEklo8VkyO7afOtvSQ7nXXpIvOtldWQQW?=
 =?us-ascii?Q?Aw7+AgL3PSvTPCKB7r9Oi2qlVqw7o4aArVPSpHhV3Ac9bWojp7A1FIQY4EKq?=
 =?us-ascii?Q?qXqNWVHR6Y3MoPZDiMPtfyNup+CDS8nzEcw/eQ7tkveqFYcCPxxrZolaI+qU?=
 =?us-ascii?Q?8Zsqp86/a4jAMwvZR7GGVm99HHeGE9BFCUeYuPBTjdvdu7tHWLPBFA6KBsv8?=
 =?us-ascii?Q?OdvJk9copK2GrHjDXBLkfI31gNyo17U3geZDF7iR9JifAMR/gmScDZEWtGW1?=
 =?us-ascii?Q?JNXCGiV8j5hxLlsEWq3TDeNer1IPDAI=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75606d93-c232-4430-4369-08de91c40980
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 21:00:29.1766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HRayLIShqs1+40nK9Bi4pxgyxOy5xcpf4j/LwRwrWeKcPc0cwQCtJaYrltlZf7Tm4dd1NDMPWMcNZqPl/JxKyBho5vL7lugy9D/gNe9ifNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15191
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30885-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 1A3573984EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kuninori,

Thanks for your review.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: Friday, April 3, 2026 3:39 AM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCh v3 11/14] ASoC: rsnd: src: Add SRC reset and clock
> support for RZ/G3E
>=20
>=20
> Hi John
>=20
> > The RZ/G3E SoC requires explicit SCU (Sampling Rate Converter Unit)
> > reset and clock management unlike previous R-Car generations:
> >
> > - scu_clk: SCU module clock
> > - scu_clkx2: SCU double-rate clock
> > - scu_supply_clk: SCU supply clock
> >
> > Without these clocks enabled, the SRC module cannot operate on RZ/G3E.
> > Add support for the shared SCU reset controller used by the SRC
> > modules on the Renesas RZ/G3E SoC. All SRC instances are gated by the
> same "scu"
> > reset line.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> (snip)
> > diff --git a/sound/soc/renesas/rcar/rsnd.h
> > b/sound/soc/renesas/rcar/rsnd.h index 2c5738926093..8700b39b535e
> > 100644
> > --- a/sound/soc/renesas/rcar/rsnd.h
> > +++ b/sound/soc/renesas/rcar/rsnd.h
> > @@ -632,6 +632,13 @@ struct rsnd_priv {
> >  	struct clk *audmapp_clk;
> >  	struct reset_control *audmapp_rstc;
> >
> > +	/*
> > +	 * Below values will be filled in rsnd_src_probe()
> > +	 */
> > +	struct clk *clk_scu;
> > +	struct clk *clk_scu_x2;
> > +	struct clk *clk_scu_supply;
>=20
> It is SRC specific.
> Please move it to rsnd_src instead of rsnd_priv.

Agreed. However, since rsnd_src is a per-SRC instance structure,
I'll rather have these variables static in src.c, as the clocks
are shared across all SRC instances but used only in that file.
I hope this is fine for you ?

>=20
> > @@ -711,8 +720,9 @@ struct rsnd_mod *rsnd_src_mod_get(struct rsnd_priv
> > *priv, int id)
> >
> >  int rsnd_src_probe(struct rsnd_priv *priv)  {
> > -	struct device_node *node;
> >  	struct device *dev =3D rsnd_priv_to_dev(priv);
> > +	struct reset_control *rstc;
> > +	struct device_node *node;
>=20
> Very nitpick. No need to move *node :)
>=20

Noted. I'll keep the original declaration.

Regards,
John

> Thank you for your help !!
>=20
> Best regards
> ---
> Kuninori Morimoto

