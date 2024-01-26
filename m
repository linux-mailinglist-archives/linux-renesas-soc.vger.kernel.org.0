Return-Path: <linux-renesas-soc+bounces-1892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 636BE83DE1D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 16:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 854EA1C221D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 15:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4DB1D530;
	Fri, 26 Jan 2024 15:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tcqTtEOX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54BC1D6A7;
	Fri, 26 Jan 2024 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706284657; cv=fail; b=rTZIQ6RdB1HD79TzAVtCen81oOx4sPc3z7GKVDl0c3fIWn8Y9YDAkV9CIUyFWAgBpRbGgDQcny8Hi78MdrSiR7G3nIEPm2FBj26kR4VY2kjI86M6IjM+0U2/LMIA98fJX39w4Q79hwef7KpIk5sH4wbE8wyiHO5+pBJbkHXpzGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706284657; c=relaxed/simple;
	bh=tQixYtyAMa/9/J48014HJH0RxrPtve40uTdKgEB6PpY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L8ueQtGaSf6+/MdCElewmwiq2JBv0PDF1de3ucF4OuMV8WBaaamu69AdAavoUzhW+ovXOecNkHxRgjqOARRJcGwdvKxPNSEaLUvFSK2x5wV16c9hngfa/Y3G9S9+QkUo5Vh0LGZClN8+N/7JkOPe9meMoeQSN8vSXQg2AvIFxDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tcqTtEOX; arc=fail smtp.client-ip=40.107.114.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8Qyu18zRlzYwZp+l7v2c6edla230fv4ftaREEPz3PbOUIbwT5mQ3BQlqVnU4b8Aa45ZzeuWvyzzIQgXdvGLmQYo1ObhbZPObU3poeO/+v6Z0cwr/GAfWF6d3d/6j278kLAcc1rH57IDY7iyQ9fAMfKOpqIvv9RPGXBtpSeyuKXJkUsacxe2zEToqIFjvSFtcRNDzpmybV7vhq0O+f3RJFDcflYnfrlpacSR2BJzy4ofPhOK7lBe23hYmScMdVJhkALYJ93Yb0aKUyTwzo0NpVtlCXW/u7P3mPUnCmp04b9G/iIZmdYBc4/ZToCaR+D/6OrSmUDzdZtFKQZ/5xNBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQixYtyAMa/9/J48014HJH0RxrPtve40uTdKgEB6PpY=;
 b=JxgnQsHM6q4lE8oqbn0iZ7hZTC/W2MzbLn4TerJE9ZmjbZEe4v3spNFXmrISLSrFFFac3Xy/1v9pqBqShp7JoL8nTYuYcPDGeSgbHhcnzpSmtpJEOjfgtKOM5PzPqoYlOusX7543VoE7z+PBXzdi2m1ho+VM0XVUTdxdb1rRrb9Hh4EljtVucEQJ+UnO3Qlwa8SklZ0PBW1tkXErW9YMhqTz509pD3GeMYHJphDpIr2hoV3VE72I1TyjxCC8N/4YTnHRQOFFqBDcZH4gG2wyO6Ob69lojQPnGf8ziRaNIhRG/tyYVQ/A4L8ZVvxQbPrsNhXH/NLXkjHgm9XcYZ0cgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQixYtyAMa/9/J48014HJH0RxrPtve40uTdKgEB6PpY=;
 b=tcqTtEOX2OuHNTzs9aFR6Twmg3IuqUeG/+DOXKaagKVIfze35WyOF8a4AnKBYLIiFzzFdT407VoraDEkAChI8EBczYFv6p9I7PZIBEYX34IjcGf7gw8xMS1ws2zO3Pwat9pCZirzW1ITB4/bDuFD68z7X/aQi285agTOfrc6omY=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB9892.jpnprd01.prod.outlook.com
 (2603:1096:400:20e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.14; Fri, 26 Jan
 2024 15:57:30 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7249.016; Fri, 26 Jan 2024
 15:57:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 5/5] arm64: dts: renesas:
 r9a07g043u11-smarc-cru-csi-ov5645: Reduce I2C frequency
Thread-Topic: [PATCH v2 5/5] arm64: dts: renesas:
 r9a07g043u11-smarc-cru-csi-ov5645: Reduce I2C frequency
Thread-Index: AQHaUFwCasVyX+Z+l0SMEVmNhiL9xrDsHTmAgAAe0VA=
Date: Fri, 26 Jan 2024 15:57:28 +0000
Message-ID:
 <TYCPR01MB11269FEE3A8C6D695CBBACEE086792@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com>
 <20240126133116.121981-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdUa+wd36-ErDRgb91KpRbryNYzA2Mmhvzjx0-_47=zfdg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUa+wd36-ErDRgb91KpRbryNYzA2Mmhvzjx0-_47=zfdg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB9892:EE_
x-ms-office365-filtering-correlation-id: c2870f39-f362-4cd0-e28f-08dc1e877f78
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VyB36F4Fo6B8vKM+rYJ8VcbY+p+9aaUksus/t7IS08Enno+VBPqTQ8zR4GhtTE+4OnvCYJtD9v8Qh4YJlRnkOvK8HOxU1RmxddrPQuVerkyWDVNdM6va0tHLkOkg3KjTCG8B4A9sweIHYnmFLI+KjUHU+eHcK+crK2lJPezomY5/qYfjmvWVut8FiO+M4YULSC73DifVd3T9lc8kt5YmQ9WLqXiTwMEhphftEQmCiazGOVOn0wiOd6EdcEcdyXmHLjdEmaUrRDdvfCfgMRrzWpdxgaUtuF1eZOEtW33oUDmlM0VV9HY+R+AIwpxmyALTWKLQpu0gXNW2IcLxClPTI1hMcqyNuDExyIVg2G5jSwgUEJvZCc6y+HaPFQ7SzFNXWsKpT4LfpQzDtN+JY6aVvWMT3U7G0JCNethGor87VfNbZGpE1OvXaFuDimAvRAkNGuwDp5xC5n5am3dBTNcUfDY7YCKhdKxa69RlSna9Op21+f9JOoGRzBGez47aLLmdD/E+ZdoL64orwG6Sn3ARxQqvJB+Jw/n1CfSF9bnPCcUkQkYsfz2zYF2VFMBlgxnw6MRaTUaetc2By/cZ969HPLG8Iqtoh92fLGIFEFexvKovKlv8jZQOBhcd4Par1r01
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(366004)(346002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(41300700001)(86362001)(33656002)(2906002)(122000001)(5660300002)(38100700002)(55016003)(53546011)(9686003)(83380400001)(52536014)(26005)(7696005)(6506007)(71200400001)(76116006)(54906003)(66946007)(38070700009)(6916009)(66446008)(64756008)(66476007)(66556008)(478600001)(4326008)(8936002)(8676002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a3RweW0vYjdSY1BXQTFXZG00UkdoSUJGbjQwTTVqdVhOSE9MM1o3U0hKdTRi?=
 =?utf-8?B?UUllSkFHVjNnMDJxTmV1eVVrSWEzeWRxR2N3MnhSTXlGRkhFZlU0NzhPcmdy?=
 =?utf-8?B?YWltaWFhMU5QRFNZMFYvYkpiOFVOY291MDA4T0pZQjdUSlFYZHVhNGVSZ1Fl?=
 =?utf-8?B?TXZLQmw1ZXVCQ2YzU0lWaTRBZ0diQ0JHeEpsVllGY1I2bGp2Q2l6R0lZUjBD?=
 =?utf-8?B?aFFHQldGZlNYRkhheFZVYi9TOVVlL0xrMG9rT3ZUQkcxdndSSzBnalhWVnNI?=
 =?utf-8?B?MUl3U3hXSngzVGFZOVpSK3BSQTJYVnRvMjVvZUhhbDNQME91QkUrYkI5YWth?=
 =?utf-8?B?VDU5QVR0WElhSE5DNitIOUFyVmdXTTQ0VzJ5K0lmSnZhV2Y3RjJRQmtpYkp1?=
 =?utf-8?B?SjYrQ3ovRUVJbXBsVWZveGdZaWptRVM4Q3NWQWJUeUNZOW5OTnJXN3lORnB1?=
 =?utf-8?B?UjdyU01zbmt2SlNzUjdrcThFSjcxM1BFZzg1UkNDTjRKdzhxeG5zY2tyWEZL?=
 =?utf-8?B?VUxuMEJ2SkNOYzdEb3ZKdndzY0dRM1hlYkgweExpb1ZlcWZHaVV0Vlg5WXJM?=
 =?utf-8?B?WmNSNk0vWXZUVEZQUEs0R2NFQ3R3eEZNNmNweWlCZVBYSnNKQ3dSenNXU0lq?=
 =?utf-8?B?YnFUVWxleVN5T05HZkdIN2Fia2xKbnF6Ny9ySzBST2poM3NhVEJjTGVVSnZX?=
 =?utf-8?B?MC9MRFNUSCtISGFIWTRwVjdTQitVVStqdlREa2RObW9yYnB5NExCOTlBaFI3?=
 =?utf-8?B?Z3A2eExDL0hwZkljM2Vqb240cFpoOWdML3JXcjZkWk9zOTlVbTMzREFXK3pu?=
 =?utf-8?B?c1Y0UjFMTmQveFlKZ3AzeHYrZkY2RVFvQ01QQVM5SGpDekFodmc5VUlYQlpm?=
 =?utf-8?B?NEFaT1R3dEhHSDJxSWZCbGVXTUdBVko5ei9XMVVoWXRyaHh3UGp2eUVhUGEy?=
 =?utf-8?B?NnBvWHJBeVQzOVZzOS9IamlmK0RDYlB6UnBjUUpST1hlOEc1ZXh4Sm5ZUkpS?=
 =?utf-8?B?T3NacnpmMTczanhIdTFSTmZMdU9aSUd0ekVSZVF3R0JEL1g0c0JoSEZMT0Yy?=
 =?utf-8?B?OU1xRzJaTTkxYmpqVndDRjlaL3dWbXViRklIVEpaY2U2VS9jcnFTNzRya1o2?=
 =?utf-8?B?U1VOcmdOTkNSR2Uvd3dYci80MXNqMzUwM2E1VldYNnExdmJsTWRuZEpvQjNn?=
 =?utf-8?B?M3FaRWhmc2x1YUdEcW9MQkwrUXA2Y2ZSNFBocWFCS3BnZ1ZSN2hXMVI1c1hW?=
 =?utf-8?B?QU5ZUEk5aHVkRWFZRTZ5WHdBVko1UXkyemhSak90VVVnTHlnbjBCVU81RVg5?=
 =?utf-8?B?V3NMaEw2MEVZOUg2R2hoNmtLVDc0dVhSMHZnZFFZcmNhckhiRmFHY2hxZDBk?=
 =?utf-8?B?dldRQXVQNmJ4V3k1QmRySnBMNkltVjZMTzdwZkd6TzYxZkY3THpUUlVTZlA1?=
 =?utf-8?B?WXBBY3pJWW1rKzlDNEN0bm5VVFdzWWlCaEFvVkJNTmNsZEY2ZDA1aEVFMkpl?=
 =?utf-8?B?TTZZT29IbzV0VStaMjJlbFExOWI1bkI3V3FhVWZWcWIxY2djMXVxeklBWTNR?=
 =?utf-8?B?bUlqNHhBZ3NxWDhsWkU2ODJsb2RWSlh3ZmI0anVIQWFvOFE4MERwL3c1MEVL?=
 =?utf-8?B?M0VDRGV6R0FsZG1qcEpsTTgxWEhScWk5Nm56VWREZlkrYncrcXRCcWRwSUVl?=
 =?utf-8?B?dU14ZVJ1UUs4QlA0Q1NqTldmNUFwektDQlJSakxrRTlmdDc2WkV6U2NoZFEx?=
 =?utf-8?B?K29vUjlobHI2akF5SGJpYzRwbTlsejdoRURuZkpDcXBUMVBOU293V2V5bnNx?=
 =?utf-8?B?VGg3V09CNGVZQ09TaS9rcWdkVEpxSW5EUERTd3dVb0ZNbE1vdjlLT0VmZmd1?=
 =?utf-8?B?U0R4Rm5tcnJBOUFwQ3JCczh0cFZpUUdzbko0Sk1ZZmhjRUM1ZU5OMDRjdGhv?=
 =?utf-8?B?TkFBVjNTdmpoRUNLSyt3ZzBwUWcrVk5Xc00rVWtYTVZxT1R2UjhqTjJJRjVB?=
 =?utf-8?B?dnk0azBQZ3RjTXBIVzZvOWxHS3R5UUJUaldwSUZwT3NMRVA3clRVa1oxVCtT?=
 =?utf-8?B?Nll3UHp0YUlWU0crRnBIUlh4dDBmUS9YMDEyaHJjVVg4cXNmVDlQWUhXOHha?=
 =?utf-8?B?MHgyNVlBOVZwNHJza2x3Y0psR1lqTGRyUHl6OUsxMzVvVzgrR09jWUFLN1A4?=
 =?utf-8?B?UWc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2870f39-f362-4cd0-e28f-08dc1e877f78
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 15:57:28.7785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SvbOAQHiR+V0X/vNnDJQkwfdIe4DBEwv5CV9FyrjpRVGuu2+i51d64vPza814FfqyovWZff3JSFfQSiJGX9Ed8fTLjz1B4mTjaWaCicpX+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9892

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSAyNiwgMjAyNCAxOjUzIFBNDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgNS81XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwN2cwNDN1MTEt
c21hcmMtY3J1LQ0KPiBjc2ktb3Y1NjQ1OiBSZWR1Y2UgSTJDIGZyZXF1ZW5jeQ0KPiANCj4gSGkg
QmlqdSwNCj4gDQo+IE9uIEZyaSwgSmFuIDI2LCAyMDI0IGF0IDI6MzHigK9QTSBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFJlZHVjZSBpMmMgZnJl
cSBmcm9tIDQwMC0+MTAwIGtIeiBvbiBSWi9HMlVMIFNNQVJDIEVWSyBhcyB0aGUgY2FwdHVyZWQN
Cj4gPiBpbWFnZSBpcyBub3QgcHJvcGVyIHdpdGggdGhlIHNlbnNvciBjb25maWd1cmF0aW9uIG92
ZXIgSTJDLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0N
Cj4gPiBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDN1MTEtc21hcmMtY3J1
LWNzaS1vdjU2NDUuZHRzbw0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
OWEwN2cwNDN1MTEtc21hcmMtY3J1LWNzaS1vdjU2NDUuZHQNCj4gPiArKysgc28NCj4gPiBAQCAt
MTksMyArMTksNyBAQCAmb3Y1NjQ1IHsNCj4gPiAgICAgICAgIGVuYWJsZS1ncGlvcyA9IDwmcGlu
Y3RybCBSWkcyTF9HUElPKDQsIDQpIEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiA+ICAgICAgICAgcmVz
ZXQtZ3Bpb3MgPSA8JnBpbmN0cmwgUlpHMkxfR1BJTygwLCAxKSBHUElPX0FDVElWRV9MT1c+OyAg
fTsNCj4gPiArDQo+ID4gKyZpMmMwIHsNCj4gPiArICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwx
MDAwMDA+Ow0KPiA+ICt9Ow0KPiANCj4gSXMgdGhpcyBhIGxpbWl0YXRpb24gb2Ygb25lIG9mIHRo
ZSBJMkMgZGV2aWNlcyBvbiB0aGUgYnVzLCBvciBhIFBDQiBkZXNpZ24NCj4gaXNzdWU/DQoNCkN1
cnJlbnRseSB2ZXJzYTMgY2xvY2sgZ2VuZXJhdG9yIGNvbm5lY3RlZCB0byB0aGUgc2FtZSBidXMg
YW5kIGl0IHdvcmtzIG9rIHdpdGgNCjQwMGtIeiBjbG9jay4gTWF5YmUgaXQgaXMgc3RyZXNzZWQg
bm90IHRoYXQgbXVjaCBjb21wYXJlZCB0byBPVjU2NDUgc2Vuc29yIGNvbmZpZ3VyYXRpb24uDQoN
CkF0IHRoZSBtb21lbnQgd2l0aCA0MDBrSHogSTJDIGJ1cyBjbG9jaywgQ2FtZXJhIGNhcHR1cmUg
aXMgbm90IHdvcmtpbmcgcHJvcGVybHkNCm9uIFJaL0cyVUwsIGJ1dCB3aXRoIHNhbWUgYnVzIGZy
ZXF1ZW5jeSB0aGUgc2FtZSB3b3JrcyBmaW5lIG9uIFJaL3tHMkwsRzJMQyxWMkx9LiANClRoZXJl
IG1heSBiZSBzb21lIGhhcmR3YXJlIGRpZmZlcmVuY2VzIHdoaWNoIGlzIGNhdXNpbmcgdGhpcyBp
c3N1ZS4NCg0KPiANCj4gRG9lc24ndCB0aGlzIG5lZWQgYSBGaXhlcyB0YWc/DQoNCkkgY2FuIGNy
ZWF0ZSBhIG5ldyBwYXRjaCB1cGRhdGluZyBidXMgZnJlcXVlbmN5IGFzIDEwMGtIeiBhbmQgYWRk
IGZpeGVzIHRhZy4NCkFmdGVyIHRoaXMgSSB3aWxsIGRyb3AgdGhpcyBwYXRjaCBhcyBpdCBubyBs
b25nZXIgbmVlZGVkLg0KDQpQbGVhc2UgbGV0IG1lIGtub3cuDQoNCkNoZWVycywNCkJpanUNCg==

