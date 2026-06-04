Return-Path: <linux-renesas-soc+bounces-33596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id skozEt2FIWorIAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 16:04:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D343E640A62
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 16:04:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=UGO4z1ib;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D67731AE537
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 13:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE61E47ECFB;
	Thu,  4 Jun 2026 13:53:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3383C0A1D;
	Thu,  4 Jun 2026 13:53:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581201; cv=fail; b=CCRY+9gjlR3CDYp8miCxhBSjt/r791VkGALmapOugvg6t9mkYYpLwvnU7AVhYoV6etJoP+ym5Ro13sisZkQmhCq9e4TTaDYXznGO2avO928APDCp6QGy1U7A9xHhUJBOhmv3Zn6NxSblyZ3CqyqHa+SxTkiYxGduj4xhbSxyorI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581201; c=relaxed/simple;
	bh=oG63uDtxXmSZ+TPun7MNiUVmvph6CboHY/jDR+FXnek=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pX80Eho6GjA3pT0REGOQXO/gBewMmQMI7TzoY9gHlW1+tM3MdUHVaxbGY3sV4Y6csTHpc2jsnQAlLgt424Xjzu2RlAITphpx5ZfUvUKVJZ/jpnTdw9KUX6PgNHmjo0M9o65zIVW3eKvcCM7LtM7H/nqzcj4WaNWvw9uXmgspupM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UGO4z1ib; arc=fail smtp.client-ip=52.101.125.19
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/aX95WtRL/CNypm2zOTN1Flk8q8MBdXqxbn2zDe9J4a5cbYM/SCfotgabZ80j9n9RddvEy32vtt3m9HnqLci/MYi+oRtYns9OQWn+rV6/GRucjlx2XoCFfN6z4uEL/DWxGkW6VJ9advrgeO/+TESgh81d+2+11YxnAS0bT+fjSWFrZlO9GF9cUA3z1nzQfKzUl+LRQfkFBn9J16adzPDhcX/0pRjPnoOXhhxvwPeVIVllKlZk+kvLZ8OiEt8rGJAXglGVlMcdPXqeaWo9X+QMOtAhZD5H5WARGR4ZW9OMtV9rOw6eH/FC9iVNZxpPQBLQhToyfIw3qH0F3b4E6Kyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oG63uDtxXmSZ+TPun7MNiUVmvph6CboHY/jDR+FXnek=;
 b=ThjELTMYdAy6T7C4WHRTcKX+HQEJhS2l3VTs94aGPE+JeRL67VpeWZjNdJZi2g0N8XHEyMCBBZ7JKplqz2Gj5O1XrcXiLytnzxx31Lw5yYxo4Fi63T0yN5MgBmj9RSyPA9xKg7vbEFlTC+9nrGyOmdlqvgcW5m8iwD7FFKJt1yzAku9Yfwhd7WRlYEYCBxaVJW79Lx7Ecp/BFQhlWW2kCqCXjfFaDCGCzy8AYPx8YToM869gf1StvXSqihIOWP4+PpCoHE+KwNgoJNiZtNViSR+ZYSaNKcKeLCUOO8P+7p6OEq2zVZyG8BJzwkt18ikJoIFPXmYdUoEaGDLhBGgm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oG63uDtxXmSZ+TPun7MNiUVmvph6CboHY/jDR+FXnek=;
 b=UGO4z1ib1PmU4RNW2eGZdc4n+5sTqQkuI5WXaGXdQR0ldwm4X/JD2V4KM35TUmjMP+6X/XK8ReA/qrP0LhwsDyA3W0/Of3HRw0lnDxKVbnNJTA8cwgCjfLgtU0H52pMwLsmQuvdA9egUfGt+Ziapfev4Rp0V4m4j1QpRFpnpG2I=
Received: from OSCPR01MB14315.jpnprd01.prod.outlook.com (2603:1096:604:39f::5)
 by TYWPR01MB11144.jpnprd01.prod.outlook.com (2603:1096:400:3f3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 13:53:16 +0000
Received: from OSCPR01MB14315.jpnprd01.prod.outlook.com
 ([fe80::66f:fac9:2ef6:9796]) by OSCPR01MB14315.jpnprd01.prod.outlook.com
 ([fe80::66f:fac9:2ef6:9796%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 13:53:15 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Prabhakar <prabhakar.csengg@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH 2/3] arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH
 pins
Thread-Topic: [PATCH 2/3] arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH
 pins
Thread-Index: AQHc7qickAEWvexaPUSuoyHxz3EW67YucKeAgAAEUJA=
Date: Thu, 4 Jun 2026 13:53:15 +0000
Message-ID:
 <OSCPR01MB143156A15297B932175E0A7B6AA102@OSCPR01MB14315.jpnprd01.prod.outlook.com>
References: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260528134752.79813-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWjdRLmnXduVv6uu8oxB6orxqxrANKDDm8xGjU7C0qQGw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWjdRLmnXduVv6uu8oxB6orxqxrANKDDm8xGjU7C0qQGw@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14315:EE_|TYWPR01MB11144:EE_
x-ms-office365-filtering-correlation-id: cb360ec3-a6ce-4bc0-135c-08dec240a076
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 BzrEHh0xknkgVJQ82uo66CxNBzEatQfy2CmuH8fLvgWx4KE2fO3SdYzHGOQc6AF2xLScobJ3PXuFb7c+QyHDgbnYB5CXxTrESQlF95oBo3hCqlmtbgWr2w9sBjWxJ5lx3Df3tM05VmR/NlQbHE1TRIWxr/o4sUUS58npP87iuyzugEZ6lb9ejfethM18QpIIiY/k1vyJr/UhKl/dISDsyUjZziQLf3Ek5ZwNXUFONU9CiK5ARciIPN9h9b8uSBEI0B2N8/BURE+rW+BGcKgluAqCQwY063h8AQ3uvbligWHysBjbxZXK9AVFkFuadoMSMJ1xLFmwsyjOjhcMOSY9qENtPx4lQ1kWM8DEhyhdeTm6/GDUgqCgOjLvF0ZI6eXlZDCWp1U82EG3sRNda+GtflrXUSOg21lPt304zZ9LENAACiULYODJHeQnUwBp59PS2mx8kBgS9pG4PAIAmelISk5GF1KKy+ackHeoy76oituXDsYFPDgU1+IajGKhim9W2jl9p577neCXV+0g5CvBvL2Ng2bYfP7Gz53EIvEfTUuer1FVXFhp0J+Mkls/4Hl5+qy5SyRdAzed+HH55auZ3svq9Q7rlMqN2/aVvmveZnbIep4zGLkRq11nxESddyAIAE2zrhBNXJTBihqEpc/ntUn6ClOF/xyCbYOyq4GSM0rR0ZIVUmFzy929XcS62265xzaHyv8uKm+OY/CA17jPnrz68fFVbF0acorvWAhhBPiwbaJ8m0VZh/tNqzt+G6Ys
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14315.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MDNieHJjZWZmckwwdnA5OGVkTlBHeXM3eWtyTE0wQXlnd2dZWU5RVS84dzBK?=
 =?utf-8?B?VEFQd05WV3Jyc1VaSUJ3MHBuQ1ZRN0U4M09mVDF2cnQvWlBnWXk3bXd4dkpj?=
 =?utf-8?B?TDliTEd5S1J4QjBPSkl4N09PaWhVbmZyM2lUdXRibkpBa3ZNTW9aV0FlZm5J?=
 =?utf-8?B?MXhCNTRGWjFNOUFRVHZnZnUyNWFlVEpvc1FSK1lDOUpMc2FCVU5vOHJjb1Jn?=
 =?utf-8?B?ZHRkaUNZamt1bXFNQkY4anhRQmNzbjZNUGUxd2ZhTk52RnUrb0ZZY0xocXJT?=
 =?utf-8?B?dzRJVWhiTU9VRDl2L2FBY1FMYlRZQ0tvTGo1OTN3K2s4dy9yeXdjc0lZa21Z?=
 =?utf-8?B?NlJSMEtVem5nRUhSUDNJMGFqamV6UDV2VCt0ZFhGdDRZZWVKaDFjellLenU3?=
 =?utf-8?B?dkw2SDlPeTIzOWRpU3pMQm8zeFk4RjhJQnA5KzcwMnpFejJOdHVFZjZlV3da?=
 =?utf-8?B?R0l6VnBTRE9lVWVwYlA5YmI0cGR0cWUxU1A0a0RVSkdLdVVMRDI0NG8vWUtT?=
 =?utf-8?B?czZMK2wvYWgvaVBBazN5N2x1UDNUdWRrYVZIL2VqM2VabjVFZVZqckRhb0M4?=
 =?utf-8?B?azloaXd2Mm85bW5vM3JkMEExQlhtTzc2eTNNdHhxS25TT2hnQXdjOUdVa3JJ?=
 =?utf-8?B?Z1ZTVHhMY1A0UlY2VnpnMjF1cGpPWjhRaEEzUC9NN3ZCdmUxYzNZNTlxUVM0?=
 =?utf-8?B?aC9ZZFlVRXRBN1ZHRThSVjVOM05zVkdWTm1IMW4xMWo0WjEwbkpFejh5THNW?=
 =?utf-8?B?YXlLbjRTWFAyY3V1bVNsT2R0ZGlBRlFQOXY5NHRTL04xbXV0QS81ZzJaaTc5?=
 =?utf-8?B?cEU4QlFXSVNnbkRmL3FEaHdwRTZobGUydTVKNnJlbzQvUStNMmdRWWQxbzVs?=
 =?utf-8?B?dTdmYXFzNDlncUVtSkVJcWp1NEVBcldUSWtsS3R3bUZaSzJGOVY4eWhuU0VK?=
 =?utf-8?B?K0NPVGpQd1h0c2d6eXowN0ovTnE4OWlpTnY4L3NFaVJlVWI3SS9oaEdxandU?=
 =?utf-8?B?NXhBSURwL2VXeFgxQ2syWTBMcVAvZnJNR2l5K2hsRHFJbnIyQUh4eUVPdFR2?=
 =?utf-8?B?MHpROXo0Vm9NVDVZQTJxQ2dQYUNhQ1ZuckczQmIyOEtVZHI5QitZRTlNbkhs?=
 =?utf-8?B?dHpWV1ZsNzZZenFjUVZFbWVaSDdjSjhJdjlPalZWY0ZneTVYV09TSUZCQjI1?=
 =?utf-8?B?RWJoWXJId1dGZVdpMW1jNW9HbzlSTldBdDhGWGh5ekJuTjRpeUxnUWtZTHR6?=
 =?utf-8?B?TE5BNGhVd1FJdUx0U1N6dkRvREtHbUxwSHR0cWxvZVBzNG5ISnRlK3VQYzk2?=
 =?utf-8?B?MGlJd0RpdTV5QkxJMGpVWE84Sm13WUpnOEJiT2pzSUNKV1RuZzUydncyV3pH?=
 =?utf-8?B?bmowNmdBMzFBYXFOSG41UDl5bTVFblZ5MTVES1owbWRUTnhWM0l2bmFhMEZF?=
 =?utf-8?B?U3ZtY1psVHNGN2JIMG8vaVNseTRwMElKMDVpaFdjd2RTYmVNSzBuTDg2aUpR?=
 =?utf-8?B?R1ZlVUVYK0JaSkZqUFZjeWZwL3kxOURuRmNKZURrek9ycktMRUJqdE9BSUJC?=
 =?utf-8?B?UHZqQzR4UWdBRSszTVU3V040Zk96UFY0TEFuZGYvWEhWNzZlcU1sSnVqcksr?=
 =?utf-8?B?QjJGYVZEUFhiU2pPQmxMdXMrY2NXZ2FnNjVXSzE5ZE1VRytkeWM4RmZoZVZl?=
 =?utf-8?B?QjlPRXQ5MkMxOWZFSDFzcXUzdzJYbVJvQytLaE1UaHRMamZHVEhyQ2xCdCtJ?=
 =?utf-8?B?d2xPVE1lSW1PSG42LzlUTDI0TFZmOGQydFNMR0Qram9QeDBDNEVCQ253cXEr?=
 =?utf-8?B?Q05vblVxMGRINFMrRVhEL1gxRTQvQklCREZGbHZPTldhd0d6blVjWHUvU0Ru?=
 =?utf-8?B?cE10Nks5c2hKYjVoTEdDditoMTcwNXFLNGRtZ1k0cW8rYzVzdVdnemE2ZlYz?=
 =?utf-8?B?NFN1ZnM4YnhRcS9TRzNybmNTTSt5OVlHRnhOZm5SdVhMQVZGVGFvWHVZREZO?=
 =?utf-8?B?aElHT0JCaHQwUTNOckcvK3ptaGZnWFpQcDhPUDljanNGRFBUNzZad2pDZWY5?=
 =?utf-8?B?NDBKcWRpWGczQTNGeFYrUlNyQ3dXdVJ1dkk3c1A5ZlBrdm9nd0JXNHNRVWNz?=
 =?utf-8?B?dFRxTitNL2txY1h1ODYrakVCY3BSNk05MS9EMmtLbWYvSXlQR2RZaVY4bVBW?=
 =?utf-8?B?eXVkdWwrTE9KL09iTGtGM2RBRU5US2k0MURFVkxOcFhPQnFkMGxEZTBUV1Nq?=
 =?utf-8?B?RzJzUmN3T3o1cmwwYlY2NUFvcXM1V1RJdFNvUGNiQzA0Y1R4SlJZRkUwVmsw?=
 =?utf-8?B?aEZ3TTd3NnYyQWc5dFIwcnlRd3pKL0tsS1ROeHRHRjltR2dscStxYW5MR0h2?=
 =?utf-8?Q?KNMHMrLfkb7w0MHhhwUubkkaScqQQZNz9mLLh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14315.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb360ec3-a6ce-4bc0-135c-08dec240a076
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 13:53:15.8626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LK43sJCcUTQyZeU6Zwy2YuRpA2sFD+uRJAOxOuYeGn7JTGOTlF1RW0P/BSrcaS2qlN3fsmiZ9V3FjJD3lGpT4e59fb33FsKDCCA/ns5Amf6KieZ8HzNFjNrrL5pfunwf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11144
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33596-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[prabhakar.mahadev-lad.rj@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:prabhakar.csengg@gmail.com,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakarcsengg@gmail.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakar.mahadev-lad.rj@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com,renesas.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,OSCPR01MB14315.jpnprd01.prod.outlook.com:mid,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D343E640A62

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCg0KPiBGcm9tOiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAwNCBKdW5lIDIwMjYg
MTQ6MzUNCj4gVG86IFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+IENj
OiBtYWdudXMuZGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsgUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz47DQo+IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47
IENvbm9yIERvb2xleQ0KPiA8Y29ub3IrZHRAa2VybmVsLm9yZz47IGxpbnV4LXJlbmVzYXMtc29j
QHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEJpanUgRGFzDQo+IDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT47IEZhYnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29t
PjsgUHJhYmhha2FyIE1haGFkZXYgTGFkDQo+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAu
cmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8zXSBhcm02NDogZHRzOiByZW5l
c2FzOiByenQyaC1uMmgtZXZrOiBDb25maWd1cmUgRVRIDQo+IHBpbnMNCj4gDQo+IEhpIFByYWJo
YWthciwNCj4gDQo+IE9uIFRodSwgMjggTWF5IDIwMjYgYXQgMTU6NDgsIFByYWJoYWthciA8cHJh
Ymhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+IHdyb3RlOg0KPiA+IEZyb206IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFVw
ZGF0ZSB0aGUgZ21hYzEgKEVUSDMpIGFuZCBnbWFjMiAoRVRIMikgcGluIGNvbmZpZ3VyYXRpb25z
IG9uIHRoZQ0KPiA+IFJaL1QySCBhbmQgUlovTjJIIEVWSyBib2FyZHMgdG8gY29tcGx5IHdpdGgg
dGhlIGVsZWN0cmljYWwNCj4gPiBzcGVjaWZpY2F0aW9ucyBkZWZpbmVkIGluIFRhYmxlIDU4LjEx
IG9mIHRoZSBoYXJkd2FyZSB1c2VyIG1hbnVhbC4NCj4gPg0KPiA+IFdoaWxlIHJlc3RydWN0dXJp
bmcgdGhlIG5vZGVzIGludG8gcGluIGdyb3VwcywgZml4IGEgY29weS1wYXN0ZQ0KPiA+IGNvbW1l
bnQgdHlwbyBpbiB0aGUgUlovTjJIIGRldmljZSB0cmVlIHdoZXJlIHRoZSBFVEgzX1RYRDEgcGlu
IG11eA0KPiA+IGNvbmZpZ3VyYXRpb24gd2FzIG1pc3Rha2VubHkgbGFiZWxlZCBhcyBFVEgzX1RY
RDAuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gh
DQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGds
aWRlci5iZT4gaS5lLiB3aWxsIHF1ZXVlDQo+IGluIHJlbmVzYXMtZGV2ZWwgZm9yIHY3LjMuDQo+
IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNzdtNDQtcnp0
MmgtZXZrLmR0cw0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcw
NzdtNDQtcnp0MmgtZXZrLmR0cw0KPiA+IEBAIC0yNTgsMjMgKzI1OCw1NCBAQCBjYW4wX3BpbnM6
IGNhbjAtcGlucyB7DQo+ID4gICAgICAgICAgKg0KPiA+ICAgICAgICAgICogU1cyWzhdIE9OIC0g
dXNlIHBpbnMgUDMzXzItUDMzXzcgYW5kIFAzNF8wLVAzNF81IGZvciBFdGhlcm5ldA0KPiBwb3J0
IDMNCj4gPiAgICAgICAgICAqLw0KPiA+IC0gICAgICAgZ21hYzFfcGluczogZ21hYzEtcGlucyB7
DQo+ID4gLSAgICAgICAgICAgICAgIHBpbm11eCA9IDxSWlQySF9QT1JUX1BJTk1VWCgzMywgMiwg
MHhmKT4sIC8qIEVUSDNfVFhDTEsNCj4gKi8NCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
PFJaVDJIX1BPUlRfUElOTVVYKDMzLCAzLCAweGYpPiwgLyogRVRIM19UWEQwDQo+ICovDQo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgIDxSWlQySF9QT1JUX1BJTk1VWCgzMywgNCwgMHhmKT4s
IC8qIEVUSDNfVFhEMQ0KPiAqLw0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICA8UlpUMkhf
UE9SVF9QSU5NVVgoMzMsIDUsIDB4Zik+LCAvKiBFVEgzX1RYRDINCj4gKi8NCj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgPFJaVDJIX1BPUlRfUElOTVVYKDMzLCA2LCAweGYpPiwgLyogRVRI
M19UWEQzDQo+ICovDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgIDxSWlQySF9QT1JUX1BJ
Tk1VWCgzMywgNywgMHhmKT4sIC8qIEVUSDNfVFhFTg0KPiAqLw0KPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICA8UlpUMkhfUE9SVF9QSU5NVVgoMzQsIDAsIDB4Zik+LCAvKiBFVEgzX1JYQ0xL
DQo+ICovDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgIDxSWlQySF9QT1JUX1BJTk1VWCgz
NCwgMSwgMHhmKT4sIC8qIEVUSDNfUlhEMA0KPiAqLw0KPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICA8UlpUMkhfUE9SVF9QSU5NVVgoMzQsIDIsIDB4Zik+LCAvKiBFVEgzX1JYRDENCj4gKi8N
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgPFJaVDJIX1BPUlRfUElOTVVYKDM0LCAzLCAw
eGYpPiwgLyogRVRIM19SWEQyDQo+ICovDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgIDxS
WlQySF9QT1JUX1BJTk1VWCgzNCwgNCwgMHhmKT4sIC8qIEVUSDNfUlhEMw0KPiAqLw0KPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICA8UlpUMkhfUE9SVF9QSU5NVVgoMzQsIDUsIDB4Zik+LCAv
KiBFVEgzX1JYRFYNCj4gKi8NCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgPFJaVDJIX1BP
UlRfUElOTVVYKDI2LCAxLCAweDEwKT4sIC8qIEdNQUMxX01EQw0KPiAqLw0KPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgICA8UlpUMkhfUE9SVF9QSU5NVVgoMjYsIDIsIDB4MTApPiwgLyogR01B
QzFfTURJTw0KPiAqLw0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICA8UlpUMkhfUE9SVF9Q
SU5NVVgoMzQsIDYsIDB4Mik+LCAvKiBFVEgzX1JFRkNMSw0KPiAqLw0KPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICA8UlpUMkhfUE9SVF9QSU5NVVgoMjcsIDIsIDB4MCk+OyAvKiBJUlEzICov
DQo+ID4gKyAgICAgICBnbWFjMV9waW5zOiBnbWFjMS1ncm91cCB7DQo+ID4gKyAgICAgICAgICAg
ICAgIHR4Y2xrLXBpbnMgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBpbm11eCA9IDxS
WlQySF9QT1JUX1BJTk1VWCgzMywgMiwgMHhmKT47IC8qDQo+IEVUSDNfVFhDTEsgKi8NCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBkcml2ZS1zdHJlbmd0aC1taWNyb2FtcCA9IDwxMTgwMD47
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc2xldy1yYXRlID0gPDE+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGlucHV0LXNjaG1pdHQtZGlzYWJsZTsNCj4gPiArICAgICAgICAg
ICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIHR4ZC1lbi1waW5zIHsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBwaW5tdXggPSA8UlpUMkhfUE9SVF9QSU5NVVgoMzMsIDMs
IDB4Zik+LCAvKg0KPiBFVEgzX1RYRDAgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8UlpUMkhfUE9SVF9QSU5NVVgoMzMsIDQsIDB4Zik+LCAvKg0KPiBFVEgzX1RYRDEg
Ki8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpUMkhfUE9SVF9QSU5N
VVgoMzMsIDUsIDB4Zik+LCAvKg0KPiBFVEgzX1RYRDIgKi8NCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8UlpUMkhfUE9SVF9QSU5NVVgoMzMsIDYsIDB4Zik+LCAvKg0KPiBF
VEgzX1RYRDMgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpUMkhf
UE9SVF9QSU5NVVgoMzMsIDcsIDB4Zik+OyAvKg0KPiBFVEgzX1RYRU4gKi8NCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBkcml2ZS1zdHJlbmd0aC1taWNyb2FtcCA9IDwxMTgwMD47DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgc2xldy1yYXRlID0gPDE+Ow0KPiA+ICsgICAgICAgICAg
ICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgcngtcGlucyB7DQo+IA0KPiBJIGd1
ZXNzIHlvdSB3YW50IG1lIHRvIHNvcnQgYWxsIHN1Ym5vZGVzIHdoaWxlIGFwcGx5aW5nPyA7LSkN
Cj4gDQpZZXMgcGxlYXNlLiBNeSBiYWQsIEkgc29ydGVkIHRoZW0gYmFzZWQgb24gcGluIG51bWJl
cnMgaW5zdGVhZCBvZiBub2RlIG5hbWVzIChJJ2xsIG1ha2UgYSBub3RlIG9mIGl0IGZvciBmdXR1
cmUpLg0KDQpDaGVlcnMsDQpQcmFiaGFrYXINCg==

