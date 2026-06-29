Return-Path: <linux-renesas-soc+bounces-34496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nGT3LxsoQmpF1AkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 10:08:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF256D74D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 10:08:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=shposDPR;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5D0E301DD86
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 08:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7843B52F4;
	Mon, 29 Jun 2026 08:01:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC511E2614;
	Mon, 29 Jun 2026 08:01:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782720090; cv=fail; b=orBcwAENm5g2rPUMfml7CE4r67JjcyRcIO3rjnUxe3wZZn0PsfFfDzvOTDHabRKUjeORCoXbJIxpaRb4/YtROhyVreSooG/pTLbABXhnhLmwT3z3uAPqyBIoWgd4cbAREEVuxCmNwyh+w88IUtub4TrlKuKhYPOGtCTM1GiiMa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782720090; c=relaxed/simple;
	bh=1PHGbB1/8HYkSyfDa9S20g2aEkGFtWf0/1h7iDmnsDY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=indh/+0KUt9/l7o486yzGwjV1AiO4s7rRWx/F2UTrp61NDdT9MO+tVrwAGX77kQgfv652AE78l+bQthuoQEXdwkoUA8vOLdfi+35elrcD0IPTQCAABM+B8RsRsDKlHvafbTf/i/DehIulZyIuOM2QYqqz7Mi/IesViVR2FzbUnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=shposDPR; arc=fail smtp.client-ip=52.101.125.26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAH+7aJA+wNdwIXijWTjvO0IBZvqKkcTpuwbOON1aEctroChAd6YV/7bKtxnLZdUXc3TECVQbdYeLL4nWdlO8jS7Op4fW2O4EZ26bnqXNba1fu9+B6Mo6GkliuWW3wYz4/ibxAagdivHI/H8xeqeU6a/+zcThyvDE00oGQLCLiwnSRJVg/7F5R2yl5XMcn9CKENg6p5YAYVsaAoZWV+3PIOUHAZ6qurgR9uyuXZnOvE/1zJcS8S1MRhOD1BlUp5EzloDZz34XSn1cJM7Giqc1O/pZmJ8yrik9lHCzNRxj5tBlw0T7MmC8bP++RXzxSpPLIDH/BM6E74SN16JAE4osA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fy5iKZwbNIU1su3GXxKFSIkadkiJKPayWEL18UZ7sEU=;
 b=cBsQpw9/qKKLFBRr82lbGZgPzunpVAik8f+SctdBfxmojcgBS1cFH+wGdKnLPy3mm8dVwwEUeoV08T+DdPwQMgiM84fJ8NmYbRNEcDzY8n4z2QkWKqnI7tRhKhKzAk7WIk79+sfy5zeStP3kEzwOAXHj8PvkQQg0c0IKBF9ALl5hZaB1Ml0CHAJEDjaFzIIyvnaIJYB+O1+FDPWwSAe8zDokbIRkwOLgFl8Qt6C0xRzKWP8J71PkBJHMLdEpreGgLhO++76JUfWfB4evCoM/248L3ZutORcZJ7hyMwtirgnQH7K5r1tongqz2mMw0h15UBXTMc6P8Boe9S7TZ1uVfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fy5iKZwbNIU1su3GXxKFSIkadkiJKPayWEL18UZ7sEU=;
 b=shposDPRMlwqVNN1Q3ieKVNqEMrhPD/1UxPGOujbBVk91CERzU3OMt2vtXwuVmAu8w1lU7B6byIHR/ZwIgLBhwdiJjHOkdriAE5aRhZ4/Zlk0WHa6TKIp+JhPiudxh3C7XD6phDel6/FY4og1TygPsQ9zahuRyMIFJ+qvesfRzA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8787.jpnprd01.prod.outlook.com (2603:1096:400:18b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 08:01:26 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 08:01:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Ulf Hansson <ulfh@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>, magnus.damm <magnus.damm@gmail.com>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v18 00/12] Add Renesas RZ/G3L SD/eMMC support
Thread-Topic: [PATCH v18 00/12] Add Renesas RZ/G3L SD/eMMC support
Thread-Index: AQHdAl+r4yj1HERfHk6QPePkoaHOOLZVNPhQ
Date: Mon, 29 Jun 2026 08:01:16 +0000
Message-ID:
 <TY3PR01MB1134652261EF120BB5B8027DB86E82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8787:EE_
x-ms-office365-filtering-correlation-id: 97f37e9a-23af-4dec-f364-08ded5b49864
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|56012099006|22082099003|11063799006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 o+cpMlHfdJmvlBD7KRzBUa6/XdpczF6SRuHfACVpU1t71pveJvTxUwtnWreCP/N5bYHnPH/zWEXODp3y4Iou8iqRRkwFnicxHJI/rCkG9hEGK1+oH5ilPPcalDB7vw/gWGe80fR9ySLJIfou02kUpWjlCNjIx9QMFXTYOcnwiomq4rGbwTo69sKpwBi9oRfdQmJO0AlcwrMpgi5uGkzojxSPgdiqx5ZUPv+xvr1LiYAQq/DKRt6UGiYj0LWKGLCTwkS74ejfsRLh77RKPkNCvICUfpTWNOnhptgMGBGhjuzi/Hh0LsjRzHcsV3BF7GdwcEeA+v+MkgUqvz3wTgxknaL9jDts84m1QNZDZjZlsMGSSMdIqEj5/I3zJfKadkpDbi5o+kPZNzgb9tCG/qIA9A99je17pHEtVWkg1evUeYEKzOpuVGgiIzgZ4UR6W8h414VCWQudtcrTeZcuPHYpT1V09P7uG04Irw9yNExdj95uiJlFvjeajmpIJAW9kZsmJvlPotL10tCsWXQNIGqYb3JrqdCkBjfgd/qElmWwzze0XFbIqYNewxHbPT9iii8tazvv+nQ4mAYdmUt2bAQrTDzEydOWiRLRuR34dtAXKeKNmDrIKLl7Te26fvY4Sm9873kmpBrmSLCPubOet583+IuwwT4GdPMBEy5Z/877Zhk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(56012099006)(22082099003)(11063799006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tce2dP2iTzrV+YeLIy3CJ1+8sno0qYDneLNgPCIeq7uFg/2Cy3WxFW4zURrX?=
 =?us-ascii?Q?ikTkxFxN6ehgVpwE0wvpuDJwWdo6vRjN/uk9wM2JGG4jRH8ULk/BIoTTZUv9?=
 =?us-ascii?Q?nt0yk/sOIYSVM6db6sKHMuD5LNfGc5bz9u+GBwsnu3uSqoHLAM8pZHXAAwz+?=
 =?us-ascii?Q?kFwiXp0zkW/tMPG9Xc1Ku56rZzLBOMk1ymyqHXNqH4HB3Pn9eXoznXZ4epe7?=
 =?us-ascii?Q?H8keZtubrRxzRZ0tiCyS2keGvEG2VWGWcbIMLfDKJHmRIlwgJeEtXxDHk+m1?=
 =?us-ascii?Q?xsR6UZGOsudMCkEaOZtCd/C0Ayni6XSQavrXGdqWWmYpwlLSQH+RFenDjCSz?=
 =?us-ascii?Q?AmM5HqOPdWB2tfe8RxeNRIpuY5dAMn3U3fexXRHtaBjnwBostINwdhXJBSio?=
 =?us-ascii?Q?ruE7TVe0iktXMhKNXcl25ru16llOjSnDVUIV8erIgZ4VZh6uJDWDYXWyanS6?=
 =?us-ascii?Q?Qf/Ik1ikplJEa+m/aR4EoTgxAySYqYyevJp2fCMk3aIif7VUDe0QmKntgEuj?=
 =?us-ascii?Q?AiGK/i7eDCoTUhe+eSltIlLmLmHaLYZV0Ud1Mu/f4zcPtE2BBbjCRw90FpKj?=
 =?us-ascii?Q?fCGP2ZVTDefjx6P0YA1iq4snxAVY+q3aK7fdESaagEpHlIiiu/ehAe83vfNr?=
 =?us-ascii?Q?F6bnFusvstqdYzIjjUrMbnvIgyTjfQS2R0BHWmJHKFdq2N9b6lSlmtpAdsfl?=
 =?us-ascii?Q?rFVwaCaQRZo+C/Qu7X8FvvExVxwoGMEL+Unkxa3IKzkHZpSgt9NYPWEmDWcI?=
 =?us-ascii?Q?n/N14QkUTLrULtzfqLhWHUl0dtfd6bD0nmymtgT0/WDhQqrbMARvY0kjlfjH?=
 =?us-ascii?Q?DrXDZLGXOLRrDn1JegK1y3/kZ07NdAySb8fO4NTlULfEhXgkqMiBIJfjbZUg?=
 =?us-ascii?Q?8uXPsl4Vl4fzG0qgLaHVEUorzwehO5uqMxdCt6hhph42SWyw0QxXF4B+1Msz?=
 =?us-ascii?Q?Yb0NhomKMhb/lzOXNaWYs53YBh6wJ5mDW672/cU77OZUwSzeRHwL1Ws/FlKc?=
 =?us-ascii?Q?e61sPsKMpMHrNXElNYRRa0kRlSHlpmUs0D2HLm1bl9XMEzeJnaWcxi3xEJXd?=
 =?us-ascii?Q?3tTBKES1QH1JyLqIlnSQ8iQZ+T9hSDX6AJmHZA2QXSejDjxO6qNzUQa3OvmW?=
 =?us-ascii?Q?WOt4g8qs79K1csZxn8gB/O5EAYXbimyjuESBL/AyB8aRJkzvuu6ALUDxY95L?=
 =?us-ascii?Q?LGwJPQrnxXSKoOqZXc30bgDzxprPHgvN4yK6P2ndC2heW44QkpBeS6XxrGI6?=
 =?us-ascii?Q?ot8ROL8Ot0DW4I4BjJXlx+QWLsszLmGMwfT74CHFlYeGdqkuYiKtSeCTH5d1?=
 =?us-ascii?Q?UeoBXDYQPk65NgUiPZkjvo+FGGcJ0sY985Nk9ciWPJCRYNM1da39ArUUru+3?=
 =?us-ascii?Q?4Ns/z3nl+LqdHJdM8MbjYQR9Bhk5seZH9seEz2ICtcsNQxsV+Cz5QGA8ErRz?=
 =?us-ascii?Q?Gy8RaQSDR6uFibDZwzJAQ7cBapcZwu7r/kcy3LVRwRlhHuj5e9LkHDqydCJa?=
 =?us-ascii?Q?FPAwk9ljOIgYp+sxwtMxaXdvurgJE4TevgYNx6YeEi+iUy7xuk09PZ+uJdX5?=
 =?us-ascii?Q?itZGraDCipc+0qLjvTVVFQvFYIgcAXas/NiAPH3UH5W5+0QkMvEjb+aXupTe?=
 =?us-ascii?Q?aXkd7vRy4uWCHKon4lAbMMvSUjwpkfqrKHFDe8e9Loncx6AcIglF2EdQCwcO?=
 =?us-ascii?Q?efROB76isXUKzDvAlFOUu4D9eLA339RreWRVg8uaO1wCbtcznQAn6ZYdLTxY?=
 =?us-ascii?Q?qXehDjS1vw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f37e9a-23af-4dec-f364-08ded5b49864
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 08:01:16.0614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N66MNUwCwAxpIaeBSVthZ9WCyLZWFQeCz6jzILmYR4g725UM/8gVeeR89rquPHiTnfZcSm6B7Bj+viHu/ag8iUIjxHreKGHZ1bTwVbhqqzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8787
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34496-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:p.zabel@pengutronix.de,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,glider.be,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[sang-engineering.com,vger.kernel.org,bp.renesas.com,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sashiko.dev:url,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DF256D74D8

Hi Wolfram,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 22 June 2026 16:56
> Subject: [PATCH v18 00/12] Add Renesas RZ/G3L SD/eMMC support
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> RZ/G3L SoC has:
>=20
> Channel 0 supports SD and eMMC (including HS400/HS400ES).
> Channel 1 supports SD and eMMC (except for HS400).
> Channel 2 supports SD.
>=20
> The SoC supports a maximum frequency of 150 MHz. The SD0 interface does n=
ot support IOVS and PWEN in the
> SDHI register (no internal regulator), unlike SD1 and SD2. It has an inte=
rnal divider for all modes
> except HS400.
> It also has a 2048-bit divider compared to 512 on others. Moreover RZ/G3L=
 supports HS400 enhanced strobe
> mode.

Sashiko pointed out some issues with this patch series[1], Should I start i=
nvestigating these issues=20
or you have any additional comments for me to look at? Please let me know.

[1] https://sashiko.dev/#/patchset/20260622155610.184271-1-biju.das.jz%40bp=
.renesas.com

Cheers,
Biju


>=20
> v17->v18:
>  * Collected tag
>  * Merged patch #4 and #5 and updated commit description
>  * Annotated the empty sentinel entries in the OF match tables with a
>    "Sentinel." comment for clarity.
>  * Retained the tag as it is a trivial cleanup.
>  * New patches drop struct renesas_sdhi_hw_info, instead using
>    renesas_sdhi_of_data and tmio_mmc_data.
>  * Dropped clk, pinctrl, SoC, and board dtsi from this patch series;
>    will send later.
> v1->v17:
>  * Collected tag for binding patch.
>  * Resending the series as there is an issue with patch threading from
>    patch #14.
>=20
> Biju Das (12):
>   dt-bindings: mmc: renesas,sdhi: Document RZ/G3L (r9a08g046) SoC
>   mmc: renesas_sdhi: Fix whitespace alignment in struct
>     renesas_sdhi_of_data
>   mmc: renesas_sdhi: Add clk_mask field to support SoC-specific clock
>     divider widths
>   mmc: renesas_sdhi: Add max_divider field to support SoC-specific clock
>     divider ranges
>   mmc: renesas_sdhi: Add tuning delay support for RZ/G2L
>   mmc: renesas_sdhi: Add TMIO_MMC_INTERNAL_DIVIDER flag
>   mmc: renesas_sdhi: Add optional axis/axim reset controls
>   mmc: renesas_sdhi: Add RZ/G3L SDHI support
>   mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
>   mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
>   mmc: renesas_sdhi: Add RZ/G3L HS400 support
>   mmc: renesas_sdhi: Add HS400 enhanced strobe support for RZ/G3L
>=20
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 101 ++++++--
>  drivers/mmc/host/renesas_sdhi.h               |  12 +-
>  drivers/mmc/host/renesas_sdhi_core.c          | 239 ++++++++++++++----
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  73 +++++-
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  12 +-
>  include/linux/platform_data/tmio.h            |  18 ++
>  6 files changed, 370 insertions(+), 85 deletions(-)
>=20
> --
> 2.43.0


