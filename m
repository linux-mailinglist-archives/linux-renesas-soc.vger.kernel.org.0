Return-Path: <linux-renesas-soc+bounces-28430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFkIJMWsnWmgQwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 14:51:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FE018801E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 14:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 563F4300F117
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 13:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9006399021;
	Tue, 24 Feb 2026 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Xq1+1BPA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED69395DBF;
	Tue, 24 Feb 2026 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771941057; cv=fail; b=GLOQxe1frjOMj4FLO86j0H/VSp9MMeomA/+TJcq7WeyCI5Y1LaVnSV0KxUb4LxvasK1xMgryiLuefat2kiGeurYm3qVoVKnxZfqjpLHjjG7+uUG9tF5OU33Qh5cpp2RdUyIC+wNkmd68m8ahWo0bi29CtGuFYPZ0K0k2T8uicm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771941057; c=relaxed/simple;
	bh=gJoYWVD50GgTcgJg8WwXAqcEaFa1jdRI35X4G6YItN8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JHnOJsl65zG/T0HNTrd1fiJNr4HCE1I0DFU3o0XnYySY5IlXB0mmX2pB8AbqzCap0YxyYrLbyowqNSFRShkvWt7sd5kJ2CX4tw6S4R2EbD4QBOx8a8qPR/4E/tjZy3+gzNbu0Uqx33hrDrYneHLWYlnanAwQLgxFYZxAmvBO3LY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Xq1+1BPA; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScVaQbxrjltzzgJkTlsN3hLu9X4eTX1Rq3l/HfrLWdaadY88xN2gcEcqMZjciPS0hZiNIF1AbcQMA5Q08UpcaG5Ok9n2rr4E3M9WLyyNQ9EPqaTL0dAVe3j5vouhY9aGe/dlGb64kpsIQovMpH4zCvldqbJQv9y9EqloS5iDm/lUHwZ0vLGwYrv9woka78H3v1PV177YpfACt9n1/y8+HSn1JtmUUSUVC9vsGwIWnc26D0NbIPXDLulwiSy3A97WI9nfZWOtVOj1zYa7njicuhgHNLSd+e4xh4Uf2w37d93YvyvnEBgVHR+U/mVRV70GZ+cFFM1eInUuILqMr+mx+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmAQWGfgSNM98D4k2f8DRlkYAs98hGqXQpTRGOFVRDw=;
 b=HTOhhrWR/DwTDDnmy10piwoeBTDPfwFQz4Y/KXK7ZeIyBY/APW3TeG9cO6LMpiXQ1Lk2J7cXHDSvj/F+w8n/UBr3ZsO59bHE8KQZdqraRftR2QWevSCofSaRFegSnkHa0Rfxpo6aS1okCiacM5kY43JV9CHZplcAwgGn2DavBFV+3omlHqJ0Uhx7Bt7hzlJ3AiF+PXQpnE5ulgpNooTjJkM4uHfNj5ma7Lqs049wk/O3ZXQ5a6mVC3meUB3ncjPvJwt1syPrTdBHdLvhUYNpp/tMcEI5TemLRjHluZMpCnxlhhQn0THZhNAVVz/j1rwsNRxQvFuqWGul+fBFZLGLdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmAQWGfgSNM98D4k2f8DRlkYAs98hGqXQpTRGOFVRDw=;
 b=Xq1+1BPAsVRtsyqk4Yi9o2xUCPXwtPw2ZOtI+t98+IlYz0H8ZBgUza2n/kHLlfu3dNG22bwU+DQsILUGKEdqbc1llhIu5RDEjdIhUP7BZvl2MnUfRzNRV0GdFe09UQS7NYyf3GM4+gw3hhClz0sdnFSNka7gCU79PMhsvQyjJlA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB7949.jpnprd01.prod.outlook.com (2603:1096:400:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:50:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 13:50:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 7/9] irqchip/renesas-rzg2l: Add RZ/G3L support
Thread-Topic: [PATCH v3 7/9] irqchip/renesas-rzg2l: Add RZ/G3L support
Thread-Index: AQHcl1oipZXj26NAI0qdYNcUzl+5XLV1kR0AgBxpCFA=
Date: Tue, 24 Feb 2026 13:50:51 +0000
Message-ID:
 <TY3PR01MB113469916056190B8B7A9B00A8674A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
 <20260206111658.231934-8-biju.das.jz@bp.renesas.com> <874inu13tl.ffs@tglx>
In-Reply-To: <874inu13tl.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB7949:EE_
x-ms-office365-filtering-correlation-id: 80c70120-e811-4bce-2090-08de73abb8e1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?V7rbSH5pnlXYoItkCjIXLGHOnear5B7Z8Nq8A6iyvK7JRxGN+ty8lg9QthDp?=
 =?us-ascii?Q?Y44a+Sjbl0u0tRNKr9vEFv0tfwEOU2j7vGyzsyS2Incyh0h0U336ir9CP8tk?=
 =?us-ascii?Q?iiXMzclcNEois7suQmb7QlcUf6O5k5+TlhVqYHP75kNiHx88Aa7Rln9S1cBw?=
 =?us-ascii?Q?4BkzhEZ43KM3Uh7+WociLPcHq1CR+U4FiU682EKoCntJIXQSLJSL3hk3LsaT?=
 =?us-ascii?Q?2FUqU11sjLOVeGJ7X5IeFrtjkTLQg4GuCEnCJscl+3RZY/JyhoFkBjjvbeSB?=
 =?us-ascii?Q?Znfzb113lpwk27S1BAERmQL7JHR9pKHrTj2s9mzLg7ySToWrpafDByuOa1BF?=
 =?us-ascii?Q?BYw2jYyZdXESw3cSm79RCbIyyBCrn9jr0RLBwZklYPTA1ezPkDRwo54G6Xh1?=
 =?us-ascii?Q?gW+zdzzi9O8BJ8pN3WAuJCj1hY762iAqCJV/ZkRESSWJSdgziSE2ddbesrcy?=
 =?us-ascii?Q?Iz13Nt0onshaMzC9Hgam/Gmrly1/SOgx5A5kTuaVjAAVUTIIuree7lz5srQU?=
 =?us-ascii?Q?AJ65qMQqEeN3/DQRuCeofixKoATkLv0pZf7MYKvwe5AzfyfuBBIqkzsiSx/H?=
 =?us-ascii?Q?oAeSjDUeBtJwFoO+2Gqg7HluCfELxEuegBQ5G3cHrvGnNivKZtEBazh9IOF3?=
 =?us-ascii?Q?+QTyylOjx/68xq82crbUes4YPhfbAa4TuB1vpUch6wx/NN52QLKI4snXLLMV?=
 =?us-ascii?Q?FU8LkWvwtwRgqsaEc1GcsjXTfKhLmAZm19NK8Rr5VyMKE62OafbBxpkVCey4?=
 =?us-ascii?Q?c1hehGqINfoHH9DJaIvXVb2kLmI0aKp0stto40KBHh2dt+iO0bnfpLHnFE/Q?=
 =?us-ascii?Q?hU+0JUMVh84EiR8QJCvJ2Aese7llWi5fgAhcqy24LVOEftC+E9xugCCnnArt?=
 =?us-ascii?Q?2jQOxYzBy1YvoeLTkfHt6GclzoM4w00XSZOTdPiILTd1fbgZ1OjLjml/m2WP?=
 =?us-ascii?Q?rhkA1B7u1wZIr2ffxlqsF8XOsl4dYqIxhwWp2hgw4uNhJZccxL0Kh9byV5kL?=
 =?us-ascii?Q?lxo5ZMDoZyahVW88mCGYZxtRRMwE0TDQWwKcCUE2Ye04Fm1rvcq4nDuv1PkD?=
 =?us-ascii?Q?JcWUuo8XNlhNvkxha0IhLghSTbhA9/E+Y8uAaDOCLWYOcSi1fmZmbi/lB4U2?=
 =?us-ascii?Q?/KOzdedue/4ri5MawQyeWIzsRBXgohfTZoJDp+92kCxUOqVdD+t/LNYGky56?=
 =?us-ascii?Q?z1l+hq7DSSmXhZ2iaooW0i0HMsCVGcFRKCKgjlSUbeO3CF00EOKdUa6iNPSr?=
 =?us-ascii?Q?Ki203dZL/Y1mRVIudVmdqDHXWBZ0ILxdGQWe6DTd7WO6lD1GRYHH+rzeJdl8?=
 =?us-ascii?Q?P0e57cbfEZBjdYv3xT6beulXgWxaRnP5vO+2IW8KpnjxyuJ2a+5w1a/6YURk?=
 =?us-ascii?Q?l657X62VkFJqRxNjr+1/9n8sbjHAdiNMU7YHsmQS3KxLBaboM08YRj1bM1GA?=
 =?us-ascii?Q?KlXI6ZegNLwCVAH9AUTekKpNCerPQarxXql25Cr3/V63WxsqB0aX16BEzylr?=
 =?us-ascii?Q?kYMduOcU3TG2MPJUaSY9k8vPLg7XCshH3yy9liC95FMTNWSzyHwx4yxJenWn?=
 =?us-ascii?Q?L6fj0wMZKwXOnCdV3LwxYGc/75vX9htAEDUFM8XcGK6W+4CPWCcSl3eDjZ8N?=
 =?us-ascii?Q?PjNkD/v4z70I1hrkNm0bh/U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?64f1sKnWZMm9gVKlwr5uLIN79k1CUGvyRqs3vRSZ1QY40cnWJ5BZ/WBlMvi0?=
 =?us-ascii?Q?Lqljja01n4aFnB5Eu7fudlPWOL7oQAe19jzw6Kb5MO0gSyJ+3HQG6dV7cods?=
 =?us-ascii?Q?WsxiSyOEfm91CYnLLzVt9LTooRLFSpsKySzbxwg5oCwLDhw7eBVb5u5peqHM?=
 =?us-ascii?Q?wEZE0+6WTIEfGvmk4r9nxm4TPshWo5H4w7u8948tb1WbhyuAMGVwD0ai3jRH?=
 =?us-ascii?Q?BPi2gzmSxlQBlzK+o6CpR/pM/Re3bS9uBDmggyGZh/c0qexUzL6d1qkUX35X?=
 =?us-ascii?Q?jah21IFFZ/05Z2BPw3BeyPH0v/59PT3b9vJ4eXLK6HucnnYGIesNONcgYaki?=
 =?us-ascii?Q?PL9kx5aP9k3m6XprT0udc4LqBoJfhwvggvfoIAPSVo9O6qzb485FfjK4eckk?=
 =?us-ascii?Q?MGqx8h6elbrOs/MUtslacJaaRjQyK167Iarn7qMjckdBLpe06fR/PSH2gmjs?=
 =?us-ascii?Q?sgNheVIKrRjUsXNS2ZcNscpTCePj7nRddseFjaSYd5bvprii2X0Tpc6kSShF?=
 =?us-ascii?Q?1Yi3nHzIiRlBjsiP2wg24bf0reCaigHACCnYDz+zXRubMXM8UeBcpRnZ0e7C?=
 =?us-ascii?Q?BRF76i6uhAfg5lu6gspG9o7jRs1S2Lp8+8FZErAbIPIbGkDX9UO/D5IE+JRp?=
 =?us-ascii?Q?E9zjVVgPVib7we6SiobRXLk6IzdSmK6JAI7R69ZB0bQc1xYDlVGoKhokp1Ff?=
 =?us-ascii?Q?i9NJP//AW5McnOt5lNtEgY8swi+uM3eDDkwivfFLeJ3MjI+HdQlLaVchdAhK?=
 =?us-ascii?Q?+3DsiYtwC5TFRPTEVnpCgy0ngJ3ldtIR05h6Kruf4nVJMmuDLd+QerCBr3At?=
 =?us-ascii?Q?YT0mi0oL96KrY+ZBtB4Xcc3PtXefzDy6zDGTGBZ9Fw2fU0ZSpp+Uwb3qCDU4?=
 =?us-ascii?Q?+NNlmpwLk1rha6z4HgigUQ8Qy8f2Wedsxf/yzxtUA1rKnWt73FsA+U2a2IrS?=
 =?us-ascii?Q?pXAvQ6vPZHtsMPYkj8mpjYwbCd/u6dg4DG2/Me8ZNNI+xCvq/di7Grtq5BdJ?=
 =?us-ascii?Q?kXnZDVRndYtAJlA/nC3jp1YopmggJ16kKOsxsHxxgGSIvt4BH5JTQUAXe4tD?=
 =?us-ascii?Q?9S59wiHBRxcoONuCcnZB3RxPYPsBLaIlHvSxopQnly27WmHsu9skjWsjvtO3?=
 =?us-ascii?Q?DutwNvc9ydK7S+YnqCJ+ZWP2WZBayk9Hsj+tli6UCwHWNDJOucwg6RVVOZ5W?=
 =?us-ascii?Q?JNvFKOO6k/0dw8t0wA9bQqSptLuSiJNnDW1m59p3yWd0eB3enkgi/7HdJPPW?=
 =?us-ascii?Q?XOWaBJ4CogzXT1yh3sSFPh0wD7USbKcWhkUDE3HVlqYkMvarbl3K68mILTeD?=
 =?us-ascii?Q?eLUFp/Bn2aKDLPop+TRCz1TwgLk2PcNnyd2iSwA5SinmLTR+AhRYmIbfEQnn?=
 =?us-ascii?Q?dWgJRpf9YwyeXTjDS3YHCFNlYF0wlBBWB9ZERkFZMWp6UVodI1UEoOWq8NwP?=
 =?us-ascii?Q?BZKXkzQrxqjlGnaFKiv2d0q3f4iHnaNgjgBMyfJwTo6qZZv+RMfUAXfteIee?=
 =?us-ascii?Q?xIhbsDWjX7Pl0kdL+w+0j78NjQREqNEqUXdc+n15ruTQaEA49GGp6+Y6aRfJ?=
 =?us-ascii?Q?O9GsNiLChhvjgch8J39cV1JnG1mbNJcz9RvyN2vil1g+oc2++D03yevPwwuq?=
 =?us-ascii?Q?CcmHXWpFA5d5OhLNxFL3C+D4BBVGCHBPmzkUtQY+DoxR6L17Id6gc1+4FNDX?=
 =?us-ascii?Q?h6Y2qp2up1Dw0CxQVke2z7+souLebX3mSnTipq5Tlyp8Qlm9c1WhF2GEp/AF?=
 =?us-ascii?Q?XyBp8gtshw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c70120-e811-4bce-2090-08de73abb8e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 13:50:51.1198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ao3DTKDD0m7FZUgyt/yzrSkV5El3klNNdsQSNxyPFwjIrD5vcuq/DsHDOuOrC5Gb/iAt3xg2hJz9Sfo5hCcfDMs5+TylfTwX0gNUgObhs8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7949
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28430-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 24FE018801E
X-Rspamd-Action: no action

Hi Thomas,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@kernel.org>
> Sent: 06 February 2026 11:59
> Subject: Re: [PATCH v3 7/9] irqchip/renesas-rzg2l: Add RZ/G3L support
>=20
> On Fri, Feb 06 2026 at 11:16, Biju wrote:
> >  /**
> >   * struct rzg2l_hw_info - Interrupt Control Unit controller hardware i=
nfo structure.
> > + * @tssel_lut:		TINT lookup table
> >   * @irq_count:		Number of IRQC interrupts
> >   * @tint_start:		Start of TINT interrupts
> >   * @num_irq:		Total Number of interrupts
> >   */
> >  struct rzg2l_hw_info {
> > -	u8	irq_count;
> > -	u8	tint_start;
> > -	u8	num_irq;
> > +	const u8	*tssel_lut;
>=20
> You can spare that churn by indenting this correctly from the beginning.

OK.

>=20
> > +	u8		irq_count;
> > +	u8		tint_start;
> > +	u8		num_irq;
> >  };
>=20
> > @@ -343,6 +345,9 @@ static u32 rzg2l_disable_tint_and_set_tint_source(s=
truct irq_data *d, struct rzg
> >  	u32 tint =3D (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
> >  	u32 tien =3D reg & (TIEN << TSSEL_SHIFT(tssr_offset));
> >
> > +	if (priv->info->tssel_lut)
> > +		tint =3D priv->info->tssel_lut[tint];
>=20
> I'd rather make it very clear in the code:
>=20
> 	if (priv->info->tssel_lut)
> 		tint =3D priv->info->tssel_lut[tint];
>         else
>         	tint =3D (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
>=20
> rather than read first and overwrite somewhere else.

Agreed.

>=20
> > +/* Mapping based on port index on Table 4.2-1 and GPIOINT on Table
> > +4.6-7 */ static const u8 rzg3l_tssel_lut[] =3D {
> > +	83, 84,					/* P20-P21 */
> > +	7, 8, 9, 10, 11, 12, 13,		/* P30-P36 */
> > +	85, 86, 87, 88, 89, 90, 91,		/* P50-P56 */
> > +	92, 93, 94, 95, 96, 97, 98,		/* P60-P66 */
> > +	99, 100, 101, 102, 103, 104, 105, 106,	/* P70-P77 */
>=20
> Please format it so it looks like a table:
>=20
> 	 83,  84,				/* P20-P21 */
> 	  7,   8,   9,  10,  11,  12,  13,	/* P30-P36 */
> 	 85,  86,  87,  88,  89,  90,  91,	/* P50-P56 */
> 	 92,  93,  94,  95,  96,  97,  98,	/* P60-P66 */
> 	 99, 100, 101, 102, 103, 104, 105, 106,	/* P70-P77 */
>=20
> That's makes it easy to read and to identify the number of entries for a =
particular port. The
> condensed format does not. No?

OK, will fix this in next version.

Cheers,
Biju

