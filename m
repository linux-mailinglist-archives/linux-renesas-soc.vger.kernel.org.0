Return-Path: <linux-renesas-soc+bounces-29916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF4cFpAavGlEsQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 16:47:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9922CDF40
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 16:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE53930A57DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 15:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE2C3E8C6E;
	Thu, 19 Mar 2026 15:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jHtbOX0J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C8C3E8699;
	Thu, 19 Mar 2026 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934939; cv=fail; b=iz4OGTNce5N3YkkXdnZo5O98dZ/9m+8ktuyoCKkp7Ay3F01l3PqS4UFKQIeM5HLQ50wpbTJrXm7uc+snAhXPL1KSped1Q+5phqR2FcKRBVpVpnFifNoynAEK4/MNjD1p/A9WcTVqt9qlObu5E2jSh9VzVczV2KpdUq5ljYup6g8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934939; c=relaxed/simple;
	bh=NIUWdEq6Zo4IkhKBjPJ7gFibJQpohk3cYCqprznf6lA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dZQVg3+++KCcYf37XP5okzSLEEuJGd+5N4CoF2U2ZwxMVW0tSWa9sqwGRqxzcVpgnq5H0sq0alwONyrVH9MyzzfeJ90F4VNLhe9l3gs9ajE5FDHiZFQ6nBIrK8XRBeC7r7RoN5KtGah/r6HIgMwpPOLZNo5gFHjr2rODj+uccdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jHtbOX0J; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d30dDlCfuuMDQcetQlFRSZ3RGGBqGn096TzqJNZ4e4WOJKjdZaxuYHWif/2pBtUYTVNyoKTn7BBxif85sPpZR7wPFhO/k8rr/Z1PR8kbTKxNgXzjJ8LLaJX43+NwT2MRrJeIUiDjuTBO35BS5akFLrgN56ZEvojcy8u1xCJuvy0IzJ/GrP91+puIEK3GlLm3rqtJ/llN1oZQDbgJGVb2c2Z8oMQ7Ivo8Q9GcM5KJ/HG3J8s3oQjMn6UgSBH+6TRczUvILoE36+pR77aT0WNZVS5YTx84it94tlkrMJzV316Cj/RUcFgUSjT60dwsShnMK2yWT0dMsFs/dx7ijCNduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIUWdEq6Zo4IkhKBjPJ7gFibJQpohk3cYCqprznf6lA=;
 b=QVc3Ny4WCPcrqnzPGWdh8RPFLHX3kR3yZdeynU+Hd7GldmBBGzSMFqZFH+shKmHMj2Seyu5ScWZOcQk0xciI34nYf1dI+C+mGOACd96caNAvy1J9rHxil1UV6X0Ny7983UrDBgQzt2AFNmSHKCtGFiHXRAskgVgNlPa0s0ylmHNp0WvjedMXlWRn6qexxdjfx9Xm85zOpbkib7iO2FsLqNybUdcb49OjojSqr7bqkletkUXA1x8Y7WPKhOtbC2gMsV2xRIBevGt1T3ovKTt7fuUDYLPqGAFdReLWAdI+qJnKSVLnwiVb1mZU9UPu7mG/3wXLez5X18vumg1PfRa+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIUWdEq6Zo4IkhKBjPJ7gFibJQpohk3cYCqprznf6lA=;
 b=jHtbOX0J/UY+8aD2oXGzukipaMcjOurS4niFDdrX819+mMKxbTh2LEhP/E29HEWYUHErFf0mwv6nSDd/n6eHqPDrDoUDbinFvZOaVYstRRkpurCjyTVMVc1ket84P5iumMhqZyfJ4D/0ONApMHW+aHqzfTNabZ5pi7tk75CVAk4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9655.jpnprd01.prod.outlook.com (2603:1096:400:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 15:42:10 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 15:42:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v6 05/10] clk: renesas: rzg2l-cpg: Re-enable critical
 module clocks during resume
Thread-Topic: [PATCH v6 05/10] clk: renesas: rzg2l-cpg: Re-enable critical
 module clocks during resume
Thread-Index: AQHct58qeBruJi3gh0eHoAHvwGSFlLW1/J8AgAABsjA=
Date: Thu, 19 Mar 2026 15:42:10 +0000
Message-ID:
 <TY3PR01MB11346D1531CC0013D1FDB4144864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
 <20260319125143.230377-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdXGpMrWY1tbajxVmTns1-cBOujpRZkXJLn9L4aCB029ww@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXGpMrWY1tbajxVmTns1-cBOujpRZkXJLn9L4aCB029ww@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9655:EE_
x-ms-office365-filtering-correlation-id: 094bc12e-7769-4e6b-434e-08de85ce155f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 M2T1sqlGKYQHQjVs46eXVbEddG0xUpiDs4s4QI2opQudHOtI76yUQdj73p6Hj4DvejBaedXwxLh5UTeuK4qeJgHWgD3yv6RnnXN+ob35bBxRaP44O4lCvzYmh+yR6vlHCHihl2+pDEwUnZvaoUM0qb5YYbyv5EzZZ+ZYMTj1HxKuop4RPRAh+HvkNOMWgjkIOPq98lPXg+9zzc95MRKZZq289fw87fxYXSdT0eALRE+d55/ZX5enD37EXjNd+b57gRXqA2ADNeRYxZDqdw2/JK+STPOd81lS4QQ9yShLVGQDuIhj95PGe0AMC00CfPqhXYmfTWDtisRQ7GilQrQI3P7+VlfN48/xx5KdZKpkL8offGMiGscaF0+96tIWcLKY5tCiCcFDp7E190yI4KRRmzqXmM496tFmWf+CVsbGJKa8uCSBqukDZdiNgtefjp96FTO6SQG+qXHWZ6IjWvMDwWmpQTZhtqoGhctPjCIJ2bOy7xE73ejFkxDtCXTG4oOEv7SHg1LPFXBbiZLCmu8B/yG/gQSUT5s2aNKv8MzG39IeIxbGYj3E2GxaZI6lQHRTAN5D07Xy0kUQ7P9RE6y9DjT3j9W0kNGp2I0owOtyw+Fwi59kpYH5jcuhXGkvvhRzfuKedJJ77rKibyJ/CTv5TU/zci1ULMxEe/nGXmdsKf0UAy/W+5V+YRSioCpqw0R5zQFFcpMeOGpLy6FfxpWZg42+OM9t8qCp+GZa2Lpb9Gy8b5NBlpdKFYzUFEhWTk595VCWQzNwtUQ/n227MVZDraq9eAWxo8sIQ9zp0+6TvTY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WDd0U1N5Mzg4ZjRPSzN5TzdNNEUybFRFcjI3S1JIeVY3cE1tNHppSUUrU0M3?=
 =?utf-8?B?NC9pZDVId0pFSWFTSEZKcWIxeGU3QWVaVU9ydldCQUdxNWV6UHVqbHdaekZ4?=
 =?utf-8?B?aytwbWsyblBLbWtuTXM0VGdLMkxoVGFIc1lWTWVnZUtHN0czMUV0czhCKzFG?=
 =?utf-8?B?RkVsYVViYnZGWk84NEVCRUpxTXNUSlNYNEdGUU1Cb25iUlNVNGRpWUd5SkRH?=
 =?utf-8?B?eHAxakNmZG0zWC9Zc1hOd3A2bnJsS1FJQXVMVVV0c1BRbjJYQXF2c1RpbVQ3?=
 =?utf-8?B?Y01sNUR6RlRwc0hsVXgxN0krU1ljTnJqaStHWU00NEtkditoMTk4QTVkK2tR?=
 =?utf-8?B?aWNwS2NYWUhGZDVnMlBvTUZqNWpheWhHR240ZUtLVzZrY0RtNEJZMlZXTzdX?=
 =?utf-8?B?d2hrWjVrcTY3MGdaclVYV3Nma3o5V0hZcFVtTVR0Z01XMENoNEFPZ1NSMkFC?=
 =?utf-8?B?Zkl0eDNraVlOTkErbW02MC9ZbmtRUGV2QnZXdDFpWktHckk5NGZjS3J3OEIw?=
 =?utf-8?B?RUlaaExsVUxhaVNNWXpIZ3g2bDczUW4wL0hGV3FkS2dSOG9yaVpkWExwQ1k3?=
 =?utf-8?B?SHkyMFdqbzF1NENjTkpQMjVRK2p3RHBJbC9VZzlsa0E5NkpGNFljYVlFUnFr?=
 =?utf-8?B?TkVjREFpQTdGSTBCdXdEVU1wWlV1QXR2YVE5a3N0dmNNNlRPSGUwbExZaVpC?=
 =?utf-8?B?YWQzVkJNdmJrMUczZ1dPV1cvenIyWTh2RG13MjNYSTRjWUk1WHJBcGlmSE0y?=
 =?utf-8?B?eThza0VqS2JoOHRJa3AvMUhZM0VpL2V4VTZxMVZoMEp1Z08zL1k2cjJrT1hs?=
 =?utf-8?B?RjZLVnlaVVBWcStZTEF5QnVSQng5NmRsbG5aUVYxck01dmg5cnlET0Rpdk9V?=
 =?utf-8?B?cUp4Wkpoc1NDT0N5R2J2cURVWS9YTm8zYkhyT0wrOHBKOThKSnREeHVLVmJU?=
 =?utf-8?B?MVlSaEFrdSs3ajZTTXRGY3hmTCtScyt3SHZkakJVNkxTQ1BaYVRmY2pqU3pI?=
 =?utf-8?B?OUVQdWZuand6Z0hpcWxUTXUwcCt4RFlCQUxGMkdWNzI2OE9FNVd0bjgwVEFp?=
 =?utf-8?B?QWVhYTh4UXlkTmVhOElhNEJrSWpYTXBhMUg0N1cxbjNROCtWU2ptUHRJelFy?=
 =?utf-8?B?TkFZSTJGUEFITDF5TnBVanhWY3hQaHdSVk91cHNrakpmYTFaTFpvQmYwbFRt?=
 =?utf-8?B?dGpFL3czdmtGM0tSMTJLYk5ZbW1GN3kxdDdFRkY3dDcvYUhibXplajNHK3gz?=
 =?utf-8?B?VWd1TkJpMllROHlncmhkRGRoSkhhNnNzSVVXL1VTSC9QbmFUcEdyTXB6Umgx?=
 =?utf-8?B?OU1EWnpCNmY4dDJ3cEZ1czBGUEVoNTc5NzRGN29DT21XUWdHb3pLR2IvUTRu?=
 =?utf-8?B?YUNSVGcvMEtublMzMG1TREZBZ1hvYTU2cVpzaitoU2tkYnNhSHlINkhoZjgz?=
 =?utf-8?B?MGxlQUl2aUhIeGtuZHhaN1JwQ01mcVJWZ214VlBEdWM4c2JVa1RHZGNRWHRl?=
 =?utf-8?B?c3Rhdm5QZk9BUXFISzBMbjdmc0s3LzNXTE9VSWlSOE9NZ0xOTEFYQW10MWFH?=
 =?utf-8?B?L2JDSEFtRFpFaTJvTjJVNWNhMi9nYlI1MWxVVGtqNzNiQVhYTWx6QTBSMGhy?=
 =?utf-8?B?N1hqSmhrRzVYRWk4Zk9yRE92SHBEVTVYbTBqZHJJc3dUY0JvRmJqQXZkcWc3?=
 =?utf-8?B?bUNaOUt2c2VWSExIRjFUbGdHVjhES1h2dGdWTld2S3hKRzE4WTdaeG9vd0RN?=
 =?utf-8?B?cCt5dCtpRFdpcFlZQlFubWR3MXlFaUlzNDU5M1o3cHpXTkJwa29FVWtOdWpz?=
 =?utf-8?B?VmhEOFp2aFl3WFVFb21QUEhzcDdXbWIwbkRzOGN1VmtBTGYxbWJUdjh1NVBY?=
 =?utf-8?B?dEUweDlaK2ljRzBjZklKNWZPMmluTGd5Z052bUxlK2JvQiszaXF1R1dDNmFK?=
 =?utf-8?B?NFUyY2V5L1lXTldNRzVPN3cwRjlKbFJYMDNNTm1HQjRnZjMvcFRjK0cyQkJJ?=
 =?utf-8?B?eitnbUE4TC9wRXpqQWtuUE1RSFRlaGF5TGYzcURLdUVwQW5mOEYvaXZ3c0c3?=
 =?utf-8?B?R3VzWE1kbHBJaG9pT01BMkVsVDVTNlRJOEhDUE9kWm5NaXg5aTg4RmlIL0V6?=
 =?utf-8?B?ekp4WlNFQlZ6REhOWWxzeWlYdnVsaS85Q3NBVzY0b1FTYW04OXlYTHVudkx0?=
 =?utf-8?B?L01SdVg0cWlRTHh2ZE9FeEVtd1I0VUd4Q01Ocy9sTzNkZGUyUnFyRDhiUVBo?=
 =?utf-8?B?Uy9FSGhybTVCWDhPUDNHSU43bkczbk9XYTRGUFliK1RVV1ZJYkNrd3RzUmpM?=
 =?utf-8?B?bGp5L0xsWHBwYTRzUi9yZTArL2FYQUNZalJYSVBuYm5FZkRORnRlZz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 094bc12e-7769-4e6b-434e-08de85ce155f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 15:42:10.1280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zxq6dB7yn8P4F74WlRrc9ITW+RIgl4NVaC55/jwWTJow9zzbbpurb5drXA6ybg1+N323gT0YBxuAQVx4snRKIp2uNnROoi1iDxKx8PvmIcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9655
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29916-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 8F9922CDF40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTkgTWFyY2ggMjAy
NiAxNTozNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDA1LzEwXSBjbGs6IHJlbmVzYXM6IHJ6
ZzJsLWNwZzogUmUtZW5hYmxlIGNyaXRpY2FsIG1vZHVsZSBjbG9ja3MgZHVyaW5nIHJlc3VtZQ0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgMTkgTWFyIDIwMjYgYXQgMTM6NTEsIEJpanUg
PGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gQWZ0ZXIgYSBzdXNwZW5kL3Jlc3VtZSBj
eWNsZSwgY3JpdGljYWwgbW9kdWxlIGNsb2NrcyAoQ0xLX0lTX0NSSVRJQ0FMKQ0KPiA+IG1heSBi
ZSBsZWZ0IGRpc2FibGVkIGFzIHRoZXJlIGlzIG5vIG93bmluZyBkcml2ZXIgdG8gcmVzdG9yZSB0
aGVtLA0KPiA+IHVubGlrZSByZWd1bGFyIGNsb2Nrcy4gQWRkIHJ6ZzJsX21vZF9lbmFibGVfY3Jp
dF9jbG9ja19pbml0X21zdG9wKCkNCj4gPiB3aGljaCB3YWxrcyBhbGwgbW9kdWxlIGNsb2NrcyBv
biByZXN1bWUsIHJlLWVuYWJsZXMgYW55IGNyaXRpY2FsIGNsb2NrDQo+ID4gZm91bmQgZGlzYWJs
ZWQsIGFuZCB0aGVuIHJlc3RvcmVzIGl0cyBNU1RPUCBzdGF0ZSB2aWEgdGhlIGV4aXN0aW5nDQo+
ID4gaGVscGVyLiBUaGlzIHJlcGxhY2VzIHRoZSBkaXJlY3QgY2FsbCB0byByemcybF9tb2RfY2xv
Y2tfaW5pdF9tc3RvcCgpDQo+ID4gaW4gcnpnMmxfY3BnX3Jlc3VtZSgpLCBwcmVzZXJ2aW5nIHRo
ZSBjb3JyZWN0IGNsb2NrLWJlZm9yZS1NU1RPUCByZXN0b3JlIG9yZGVyaW5nLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+
IC0tLQ0KPiA+IHY1LT52NjoNCj4gPiAgKiBVcGRhdGVkIGNvbW1pdCBkZXNjcmlwdGlvbg0KPiA+
ICAqIERyb3BwZWQgdGhlIGxpc3QgaW1wbGVtZW50YXRpb24uDQo+ID4gICogUmVwbGFjZWQgIHJ6
ZzJsX21vZF9jbG9ja19pbml0X21zdG9wLT5yemcybF9tb2RfZW5hYmxlX2NyaXRfY2xvY2tfaW5p
dF9tc3RvcCgpDQo+ID4gICAgZm9yIGVuYWJsaW5nIGNyaXRpY2FsIGNsa3MgYW5kIHJlc3Rvcmlu
ZyBtc3RvcCBzdGF0ZSBkdXJpbmcgcmVzdW1lLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRl
IQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jDQo+ID4gKysr
IGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiA+IEBAIC0xNjAwLDYgKzE2MDAs
MjMgQEAgc3RhdGljIHZvaWQgcnpnMmxfbW9kX2Nsb2NrX2luaXRfbXN0b3BfaGVscGVyKHN0cnVj
dCByemcybF9jcGdfcHJpdiAqcHJpdiwNCj4gPiAgICAgICAgIH0NCj4gPiAgfQ0KPiA+DQo+ID4g
K3N0YXRpYyB2b2lkIHJ6ZzJsX21vZF9lbmFibGVfY3JpdF9jbG9ja19pbml0X21zdG9wKHN0cnVj
dA0KPiA+ICtyemcybF9jcGdfcHJpdiAqcHJpdikgew0KPiA+ICsgICAgICAgc3RydWN0IG1vZF9j
bG9jayAqY2xrOw0KPiA+ICsgICAgICAgc3RydWN0IGNsa19odyAqaHc7DQo+ID4gKw0KPiA+ICsg
ICAgICAgZm9yX2VhY2hfbW9kX2Nsb2NrKGNsaywgaHcsIHByaXYpIHsNCj4gPiArICAgICAgICAg
ICAgICAgaWYgKCFjbGstPm1zdG9wKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRp
bnVlOw0KPiANCj4gUlovVjJNIGhhcyBjcml0aWNhbCBjbG9ja3MsIGJ1dCBubyBtc3RvcCwgc28g
SSB0aGluayB0aGlzIGNoZWNrIHNob3VsZCBiZSBtb3ZlZCBiZWxvdyB0aGUgY2FsbCB0bw0KPiBy
emcybF9tb2RfY2xvY2tfZW5kaXNhYmxlKCkuLi4NCg0KQWdyZWVkLg0KDQo+IA0KPiA+ICsNCj4g
PiArICAgICAgICAgICAgICAgaWYgKChjbGtfaHdfZ2V0X2ZsYWdzKCZjbGstPmh3KSAmIENMS19J
U19DUklUSUNBTCkgJiYNCj4gPiArICAgICAgICAgICAgICAgICAgICghcnpnMmxfbW9kX2Nsb2Nr
X2lzX2VuYWJsZWQoJmNsay0+aHcpKSkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByemcy
bF9tb2RfY2xvY2tfZW5kaXNhYmxlKCZjbGstPmh3LCB0cnVlKTsNCj4gPiArDQo+IA0KPiAuLi4g
aS5lLg0KPiANCj4gICAgIGlmIChjbGstPm1zdG9wKQ0KDQpPSywgd2lsbCBmaXggdGhpcyBpbiB2
Ny4NCg0KQ2hlZXJzLA0KQmlqdQ0K

