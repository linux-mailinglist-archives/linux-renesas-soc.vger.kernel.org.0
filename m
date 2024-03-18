Return-Path: <linux-renesas-soc+bounces-3843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7A887E630
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 10:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE3521F2102D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 09:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDDD2C6A7;
	Mon, 18 Mar 2024 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Qn1pZX3e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2046.outbound.protection.outlook.com [40.107.114.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034C2C690;
	Mon, 18 Mar 2024 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710755178; cv=fail; b=QRx5WRbTas/ljusLbRLp8ozADe9eP4/4WlnlzG4YjKeX8XnCLt1MMa/pJz8BVobBnf83I5qg38L2x1bmOrViTMoeBPF9Y0iFLzYvvbzHJ/33bKQA/RCCE24dvuj5HRFbZcwGoGBC+B0Kw0udiqDCMlqSjD+hSNTuTZixHtM9ESY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710755178; c=relaxed/simple;
	bh=HaCWTi2lDitOyjEwdY2th1dEQ/lgfVKd6l3YztXprws=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p9xUIZfxmYl9e82ebUdiaCfI+pn1ZdEpoLiMuLwvhCMDtX95SzB3sanF9IGQUoBsSM1bF/FXl4FPVkjbIrJ58oeY1KCNZw0uMgsNCIirnd2bL72fpFRUEIhAj9Jquf596585AD3Dnsk4R/u2mPIx1V7WZek5xdWpmgiF0lUVrVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Qn1pZX3e; arc=fail smtp.client-ip=40.107.114.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hi1VwlOyVaymhSi8Shxm+41c0WSPY9l2HpJem1313DsleuQHgJ+9MQtbXoQciRhfukTpC07SoKAZ8miBuHT3TyPRlsuNNdNoG0rE6BF3ctEXYohDm09IG4BK3nTwRMKQWLXJgGfodzNtTgAIwfdGtnOLQtiaR1J4N6XhKnx1tU6WwHoH/yelAMnXbTLocGUA2kbghNVECj/zPMYfS4NXF5+pfnr0nvDEonYWeOxlc369GxbOKeip5tWCESG6bMBwZj85gsW8sgWnPQlgIpNcvDV6JnAUXO3/PE8OaxbTVQSzGucTuOH4fiJSxvoY0ridQZgkfoCtBDo4a06DAmIMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaCWTi2lDitOyjEwdY2th1dEQ/lgfVKd6l3YztXprws=;
 b=VnJ4XtdHsHF+6AZN4F2wd9emPQfpS5QHE6vvjZxLvEsFnS1Jbp+qVaQoiksha0FMRrKlM1EY5oCGJGsODaiJ3Zh6zmdNMT3uy9hI5TBJLsNi2dmgEF/TSBnB2PKsNo/4UXARLOYZRPpJg6XSG0rYhj6u1Ct+Np3QRtPCEA8C8RYJU9IqCvs/t8JswPPe9wH373PGU6L9s7IC1AIoig2ZPhjTVice7xlnGm3VyNpSVz2EOiRinL5+yLFh97PrL2s+nz0v/STKCV2tSGjCgWpWTOH4mOqzwpSOQNpc7cbkPfBUs20MyBnZwe9O1JydNGxJoETJQbqwp6ubA07AaE4t7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaCWTi2lDitOyjEwdY2th1dEQ/lgfVKd6l3YztXprws=;
 b=Qn1pZX3enjnshCdFwPTptiu6wO/i86WyOadRwyT7hLA3nUJXC6T7KwaSiZNkEjpwDHdtyWxGlJLmLjHNXmYmcIiXzrmy1gIBxju/IKJytIq+7fEg4ecnkHkUGolfhVvJBd0zjMo1tY4Lc81Y5fNGFSiUgCXpoA7/If8EqEV8Uag=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by OSZPR01MB8420.jpnprd01.prod.outlook.com (2603:1096:604:18c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 09:46:10 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f%5]) with mapi id 15.20.7386.023; Mon, 18 Mar 2024
 09:46:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm
	<magnus.damm@gmail.com>, Huy Nguyen <huy.nguyen.wh@renesas.com>, Rob Herring
	<robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 5/7] usb: renesas_usbhs: Update usbhs pipe
 configuration for RZ/G2L family
Thread-Topic: [PATCH v3 5/7] usb: renesas_usbhs: Update usbhs pipe
 configuration for RZ/G2L family
Thread-Index: AQHadwgpA/ltppJhDkmsfFDbDai3T7E9PkgAgAACaoA=
Date: Mon, 18 Mar 2024 09:46:10 +0000
Message-ID:
 <OSAPR01MB1587E4455F259156CE371F04862D2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240315183921.375751-1-biju.das.jz@bp.renesas.com>
 <20240315183921.375751-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdW5ZWOXuWc+thDTJ6+h7mcH7o+N6tVLhhkH=TKG2BZC6A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW5ZWOXuWc+thDTJ6+h7mcH7o+N6tVLhhkH=TKG2BZC6A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|OSZPR01MB8420:EE_
x-ms-office365-filtering-correlation-id: 8421bc56-e366-4a79-f568-08dc47303e2b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jh2YJqq7rh3wKWu1tTvawsxtQ0ecsInzG4oO11lFH1usK/rZZH6k/gvS2nULf+f8pjuUPoT0/Xy18BFlv8lD8f5Su+CNTznF9urODTMRpwNvcSah/dbzBLOnftytRdpGWktccwzPQEIG8aZyvY9RbSycf1YVllwYgltnbpyDFhRuYdMgpAJ2xyMDfhVRMZUA3ocXX7RGSJLDSurHJU2G/D5s3YYNgwmUW+yNj0Dduq9TbPkM3FrnDlvtaNW2xKx/LPqd5U1G3lT8Th6/+uAehZXOPFzIVufqT86V9uydZkdXCOmeYYTn4hEzoPp/2HrtTdNMtjHwfoqZukzwKqTFx4SdokpeyQYCck6sGjUIbJhIM9vEIYOBXMwSdIAwVgGrB7kAMbnJcz6qTInqI52w2V2Fu0FBXVJIJdIkBhSW9rhherzqHQJZydXl9zcMHH9u1pkpE58U5+RuHGaxTE9o9K/cJlO+WCE6knNThJAEWmuAT6g3rBMBcONNoMV2hcCrAdf2PhXRiFgJvYt8XynK/5ePFuzWndtVtKA3mJxNCnHwfIfemo6rdN9vGav3ep5pNAxfnzCT0z1WnV1yjhYamrZ8LiYgbOOHq6ppRKZUKqFQFPKsaoQDWHINRrY29pmmcPuLpwPv/Z1nt5aSv8AtAWh8zC5A1bbiyG6t3ZIVLfX9sW1d5Tp2IfBRgGUGsddpM/p1jImzZdrZ75N0Sq+nOS2fc2/cDLl4jDUgxpR0fAg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3FXYnpwc3F3aXpib3YrN0l3VFJ0UFUwUjNRQm1rRWNZZXVQYnpqdi96Qzhw?=
 =?utf-8?B?NkZhb2JJZ2ZGRlo1eUR5Vm56WS9zSThKVktBdy8vTnIrMlRsNnUxaWJFTDVY?=
 =?utf-8?B?c2VZSHA5c0tRZ0hCQlVQSkhRUllFMnpjQk51S1MwcnlMd201ZFFNUGtDcjVJ?=
 =?utf-8?B?Zk9LdUVXNndiU3ZMQ01VYXk0dEkrVnRMdHpITVJKUktTSmpYVXNCcW1zUTNX?=
 =?utf-8?B?VTZEaWtlZllONU1HT2pMTWRnc0JIblJWdVQzNStVdDRNVlhnaTdoZ0RYRUdr?=
 =?utf-8?B?dEMrNC9HR1luTnJGYjBESGtDcFVNL1JtWExGYmFOSCtKNzRDcWRva0NBK21o?=
 =?utf-8?B?anMxT2hBUmdVT3lpTjg5c3JGMXUyTzFrWlhINjJ2dWpNYzMvZGh4eVE5bzFC?=
 =?utf-8?B?ZGxOSFZsdGVQN3VKc2FTRUZWNzdrOGYrbmFnMjNHdVZ4WmtUTURoWkxEYnBr?=
 =?utf-8?B?WEVuRDdZR1NEMk5ndWlZSTFtM3hYSm8rYjk2eWxFbUZMdHpmdlhodDhXYk0x?=
 =?utf-8?B?WnpodVBNWFkySk83OEZ6Z2FYOEwrS1pEM2hLSzBZQ245YXBIN1NEdVBIb3hD?=
 =?utf-8?B?ZEw4WlBEa3p4cFB6QUpKdW1mWWVRMjVKeDVySWo2WU1keWdKT1E0UnIxRUlE?=
 =?utf-8?B?TTI1OHFjUC9mTk15R2tMRUk4Y2VQRDRYQXlFUi9IUUVkdFF6UTRIVDhaUCsv?=
 =?utf-8?B?VXZvRDRsQ2xGcEFlOFJ3VlBoTE10ZnpSaUJSWW16M3BseW03NW81TEVJYkp0?=
 =?utf-8?B?SjFHcStuMWFGRlJPa0FXVGxYa0QzVUVHS3hZaTc0UkQxU3pzVC9URUJ6K2tX?=
 =?utf-8?B?RXNPenQxZHVqZ2lacittZXI3U0sxVFlYMkxVbHYyTFllSlA1c2ZsbzV2S3dV?=
 =?utf-8?B?QjRSc3JWU3lQUE5BSkJlWDZrUWdYTjdsQkhlNzc4dWRhZFhMNUMzNzc3YWpM?=
 =?utf-8?B?ZmlyM09Zak1FYm9NeTBvOTF0bUVoZHVSbkhRY1lpWGpmajRLNFFRc0JVMjhh?=
 =?utf-8?B?TlJCWENRQTlnL0JBZmJCYzJjOUV6N0JzR1VaRzlDRFRWMFp3Yk0zT2I3THhh?=
 =?utf-8?B?N3RQamUzS3hsUFJhOWlZN3V2dDRGSDZKMDFnaUwwZVUrRGthY2xGdWZnZ2Ri?=
 =?utf-8?B?MHR6SE9xanlWcFMzajJkb2h5WUxDSVZGczNnaGJiWUhrcW5xVnhUZmFEVU5u?=
 =?utf-8?B?c0FHaEM0QTJrUGpEbDA4Vkw2TkhCSUQ4RDR1OEt3WmtuOFRxUnliYW96V1lp?=
 =?utf-8?B?QTFWWEF6dHlweHg3ZWluOFFVVkhGR0k1eCtMUVZueWswYVRhdUlBTXpFZDho?=
 =?utf-8?B?U3dHeGNvSUdwTTlsM0hORk1rYlZ3d0xQK0RmWmUwV3pFb1BwTzhDTHlXR3Uv?=
 =?utf-8?B?U0dCVTRRYmFwUHVxY0NTS216eVBKQUlBWVVLTXdXemFUN1o0NUplSG1yVTht?=
 =?utf-8?B?VXpsTVNaSjlGZ1RRVzV5QzlvYUFHaDJvWUU4dGFZaWpPUms2T2VnWEFtenNR?=
 =?utf-8?B?dEpPdDNVaVB0NVpOclU5T3AyWGtCZUJuUERnbjNYaFYzSDNnVGdVaEQyeDNx?=
 =?utf-8?B?M004VXM3aTFRZUl3TWpPZm5sdlRWTmNmUzBaZ05iaVNLZzByNjZlZzV2TGVS?=
 =?utf-8?B?aUVlTktKNC9WeG9tcHl5aG42VDFKSVljd3J6MmJnMHU5dDJIWXBGb2NYNWJy?=
 =?utf-8?B?TXZpVU9JeW81NDZKdGpYVWJKZFFNd1BYZ0dJa1NHY3VlOTZjcHc5SC9MZE5s?=
 =?utf-8?B?aHlFSXc1RS9KTlBvNloxT2FMZktRTzJkeW9TTXpZOUx3MlBOamlpSCtxNUVH?=
 =?utf-8?B?QVVBWlBOTTI2UC9kZlY4bjVzbStld2oxR3ZOQzRwYXNsYjZHNVk1SnhCM2ZF?=
 =?utf-8?B?b080TXFGZ216UmVNdjZKTVJMN3p4WFFuRTViRmJ0L1dFYUJKYWlsd1lyQ1FH?=
 =?utf-8?B?Kzg0SDRYRUhCODBtOGVqelpJaTU2VE1SN2YzVWx0QnhDRENKYUY3L1hyZ3Bq?=
 =?utf-8?B?cHVWSXdNeklNVldrdExiMkNmVVpEZzZtTWJ4MHZWaDEvNW51YURva21HN0c4?=
 =?utf-8?B?elFjeGhkZTUwdDJxYllIZWJxMUo2NkJUa0pGQndpZ0o4UUxzeGdCZVliSVFn?=
 =?utf-8?B?ajRvaW1UREhBeG1WNkhLUTJkR0EvSGlSZXJlaGtJVDVOSkp4d2lEMDFnUGEx?=
 =?utf-8?B?ZGc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8421bc56-e366-4a79-f568-08dc47303e2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 09:46:10.6479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JovDeOXPNju9azmE3sfzujTIdPC87k9pH6awkZbhcOKBqjw6hUke3Kpx2HUIA6ylXnElqZfndcsZqXDaaR3o/ZZeJsA2GU5K2bZOnAB50TE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8420

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMTgsIDIwMjQgOToyNSBBTQ0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYzIDUvN10gdXNiOiByZW5lc2FzX3VzYmhzOiBVcGRhdGUgdXNiaHMgcGlw
ZSBjb25maWd1cmF0aW9uIGZvciBSWi9HMkwgZmFtaWx5DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4g
T24gRnJpLCBNYXIgMTUsIDIwMjQgYXQgNzozOeKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gVGhlIFJaL0cyTCBmYW1pbHkgU29DcyBoYXMgMTAg
UElQRSBidWZmZXJzIGNvbXBhcmVkIHRvIDE2IHBpcGUgYnVmZmVycw0KPiA+IG9uIFJaL0EyTS4g
VXBkYXRlIHRoZSBwaXBlIGNvbmZpZ3VyYXRpb24gZm9yIFJaL0cyTCBmYW1pbHkgU29DcyBhbmQN
Cj4gPiB1c2UgZmFtaWx5IFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlIHRvIGhhbmRsZSB0aGlzIGRp
ZmZlcmVuY2UuDQo+ID4NCj4gPiBBZGRlZCBTb0Mgc3BlY2lmaWMgY29tcGF0aWJsZSB0byBPRiB0
YWJsZSB0byBhdm9pZCBBQkkgYnJlYWthZ2Ugd2l0aA0KPiA+IG9sZCBEVEIuIFRvIG9wdGltaXpl
IG1lbW9yeSB1c2FnZSB0aGUgU29DIHNwZWNpZmljIGNvbXBhdGlibGUgd2lsbCBiZQ0KPiA+IHJl
bW92ZWQgbGF0ZXIuDQo+ID4NCj4gPiBUaGUgcGlwZSBjb25maWd1cmF0aW9uIG9mIFJaL0cyTCBp
cyBzYW1lIGFzIHRoZSBkZWZhdWx0IG9uZSwgc28gcmV1c2UNCj4gPiB0aGUgY29tbW9uIHRhYmxl
IGJ5IHJlbmFtaW5nDQo+ID4gdXNiaHNfZGVmYXVsdF9waXBlW10tPnVzYmhzX3JjYXJfZGVmYXVs
dF9waXBlW10NCj4gPiBhbmQgY2hhbmdpbmcgc3RhdGljIHF1YWxpZmllciB0byBnbG9iYWwgdG8g
ZmlsbCB0aGUgcGlwZSBjb25maWd1cmF0aW9uDQo+ID4gZGF0YS4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEh1eSBOZ3V5ZW4gPGh1eS5uZ3V5ZW4ud2hAcmVuZXNhcy5jb20+DQo+ID4gU2lnbmVk
LW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0K
PiA+IHYyLT52MzoNCj4gPiAgKiBVcGRhdGVkIGNvbW1pdCBkZXNjcmlwdGlvbg0KPiA+ICAqIERy
b3BwZWQgdXNiaHNjX3J6ZzJsX3BpcGVbXSBhbmQgcmV1c2luZyB0aGUgZGVmYXVsdF9waXBlW10u
DQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNi
L3JlbmVzYXNfdXNiaHMvY29tbW9uLmMNCj4gPiArKysgYi9kcml2ZXJzL3VzYi9yZW5lc2FzX3Vz
YmhzL2NvbW1vbi5jDQo+ID4gQEAgLTM2Myw4ICszNjMsOCBAQCBzdGF0aWMgdm9pZCB1c2Joc2Nf
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKHN0cnVjdCB1c2Joc19wcml2ICpwcml2KQ0KPiA+ICAgKiAg
ICAgICAgICAgICBwbGF0Zm9ybSBkZWZhdWx0IHBhcmFtDQo+ID4gICAqLw0KPiA+DQo+ID4gLS8q
IGNvbW1vbmx5IHVzZWQgb24gb2xkIFNILU1vYmlsZSBTb0NzICovIC1zdGF0aWMgc3RydWN0DQo+
ID4gcmVuZXNhc191c2Joc19kcml2ZXJfcGlwZV9jb25maWcgdXNiaHNjX2RlZmF1bHRfcGlwZVtd
ID0gew0KPiA+ICsvKiBjb21tb25seSB1c2VkIG9uIG9sZCBTSC1Nb2JpbGUgYW5kIFJaL0cyTCBm
YW1pbHkgU29DcyAqLyBzdHJ1Y3QNCj4gPiArcmVuZXNhc191c2Joc19kcml2ZXJfcGlwZV9jb25m
aWcgdXNiaHNjX3JjYXJfZGVmYXVsdF9waXBlW10gPSB7DQo+IA0KPiBTbyB3aHkgcmVuYW1lIHRo
aXMgdG8gaGF2ZSAicmNhciIgaW4gdGhlIG5hbWU/DQoNCk9vcHMsIGl0IGlzIG5vdCB1c2VkIGJ5
IFItQ2FyLCBidXQgdXNlZCBieSBvbGQgU0ggU29DcyBhbmQgUlovRzJMDQpBcyB0aGlzIHN0cnVj
dHVyZSBiZWNvbWVzIGdsb2JhbCBub3csIFdpbGwgdXNlIHVzYmhzY19yemcybF9kZWZhdWx0X3Bp
cGVbXSBpbnN0ZWFkPz8NCg0KT3INCg0KV2lsbCBtYWtlIHRoaXMgYXMgc3RhdGljIGxpa2UgY3Vy
cmVudCBkcml2ZXIgYW5kIGRyb3AgZmlsbGluZyBwaXBlIGNvbmZpZ3MgaW4gaW5mbyBhbmQNCnVz
ZSAuaGFzX25ld19waXBlX2NvbmZpZ3MgdG8gemVybyBmb3IgZGV2aWNlcyB1c2luZyB1c2Joc2Nf
ZGVmYXVsdF9waXBlW10/Pw0KDQpDaGVlcnMsDQpCaWp1DQo=

