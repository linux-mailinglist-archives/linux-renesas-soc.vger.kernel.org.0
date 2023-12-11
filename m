Return-Path: <linux-renesas-soc+bounces-882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 088D780C349
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 09:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6B801F20EE5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 08:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C92220DC9;
	Mon, 11 Dec 2023 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OMbUPNTg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5429BA0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 00:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCKioXh9vPTgtFn36R9POQnCI5/q2lPTj02XneTUn37LN3EwvQzV9Rk6mvQSoxYPSUWP/wNHsVuT7AcGvV1vAxrgCy9MDaEdvFLXzZoZQ/CTYqvOHz48Qk/vBcrx3kipXBessKWLj1103C6DW7lMCtOSu6Ier5BbjI3vUuix2T13cpUG86ou0uDv0MjzQgk/u9T0s8IcwUMxDS3fT9I2vbI0Zx9vegTrkvc8IZOARwMu3eD6Y3TumqyO3Qvp9UeOwVbMytPydmiPjAkJ9nhoPtE1/iLVXSD/OYr9e5Bu+oU7K9r+UrvrqGTe7Y7Z5e6xx2UPmSraWmpVl8PeZlVQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smTV999OMPOKMMYXZsj+KCPSvOOHvBfXJqNgqskljMI=;
 b=likbhkCZPl9uD85UQSWDpTyxfsdfS3Idto9laNKwjaM2YQqWPtsRVe4WB6YkSDuTK2mnYtWlFpJ9Vj/2sOY4pj58Y4LDagJEbWeZSeg5hl/iW8z3JYcU9UZTXeQtiOaXtyHFbj0koD0gPccamej9R64ukCddyvx4SeZBGUxCQaPmMfRiEUdhQWxsUH1ZDl//TZlnUIaXC9bU4C/6waQUZIa/vlHMn5ydHm1K4l8ZHlJ+1xh4hx/+BJke4Oeu93se0gjhti05lRI3lx2EKdMJSXGGHcU6UhFxXKQVVbhHrviNLsY+/2HrJLu2CA2Xn8wK8Sr4c9JzvvjFYEiEEH2e1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smTV999OMPOKMMYXZsj+KCPSvOOHvBfXJqNgqskljMI=;
 b=OMbUPNTgHoS0z+Jd2t45W83VYQNK3K1pEpSiNQqfm6OdM2fJMkJOgwEgFce/6afmZDOuf8AShTmjYxE03ZVVntS2ez5W4HBfidV+3DQG285WVDYTRE8cgJ0hz9bunGg2MBvdroAuk56SRK3bvxGgtEd7UpijvbfRQWAbJog5nis=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB11068.jpnprd01.prod.outlook.com
 (2603:1096:400:3ac::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.18; Mon, 11 Dec
 2023 08:32:32 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7091.020; Mon, 11 Dec 2023
 08:32:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>, Konrad Dybcio
	<konrad.dybcio@linaro.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Neil
 Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
	<nfraprado@collabora.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Udit
 Kumar <u-kumar1@ti.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 6/6] arm64: defconfig: Enable Renesas DA9062 defconfig
Thread-Topic: [PATCH 6/6] arm64: defconfig: Enable Renesas DA9062 defconfig
Thread-Index:
 AQHaJEbR2tmw26FlxU+RAXf4dl1/ebCUb5gAgAAWQGCAAAtwAIANwRXggAF60YCAAAClkA==
Date: Mon, 11 Dec 2023 08:32:32 +0000
Message-ID:
 <TYCPR01MB1126926DCFDB193E669C9CF8C868FA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-7-biju.das.jz@bp.renesas.com>
 <CAMuHMdWh3fTzQP5+mGF3u8LACg-5tQDZcyExvgREpxKd6iee4Q@mail.gmail.com>
 <TYCPR01MB112696C301D750A915F2661688681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <CAMuHMdXHpE079eLAJjcdsbz6=Y6hux267AhqJow6HESCaf7EXQ@mail.gmail.com>
 <TYCPR01MB112693C2B72B6AA28766FF8EA8688A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <CAMuHMdU2pdAYbXdyfpysPR0k7fjh31KrD9Xk05EHWeayzVDz5g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU2pdAYbXdyfpysPR0k7fjh31KrD9Xk05EHWeayzVDz5g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB11068:EE_
x-ms-office365-filtering-correlation-id: 40384143-993c-4398-08e1-08dbfa23b829
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2ILMLqFkrR+SVzKtQC8ayS5TghvAh6KImA6aS9xNsHPH+sxiQejyD+zalPZXY0JJcAG1W3kzgHqH2ByBnqnVIlNv+HIKqdT19OHgRdt2BOjX7xdB+Au0rLORW6o1hYat2z9HRhVjl58W3JI6VDJ1kdSkDzZxNm6xXRYNczYICUkSetdvyv+otYjjHDrHodregMBb+kYMOOhBwE2qgpNaz7hPhxcGl1WSYtS2NwezgLNAF2qOnky20JvXIrDq762V5D1Vq75tRMLx6NoN0q6P1YxwvwsGpw3IM8vCxb6Le2DggYL+D0FEttjdGa+q1ZMeLwnWgP9bY/wqW7i/aKwfrbiPAzwdZwB11hb1tEfMdaF1kq0Vuy92ORvyOeAiFg6NZDN5kFRw5gu3FLKtyOCffbJUzJbSoqzC0Q1bGlKjMox14TdyOgqjCAKjvylMyHTDn3l9KQxkzqHPqHKBF/e51DyFC3LeeGsWs6nqSIWTCKr+Az8gV9LhW+emd6mm/FVnEHPVca6Gfqpdrgaq25pr2BCt/jKvVHZaQ0G6W8djRKmnOIjGSIjqBjyRksk7NcpN37LNic0e16UXO9TYUJ7BK/EYRMBOb8llqlTCNNlj0Sb2wdWatk5nAlKHGUAmq7t+c0cReGGMQyu6p625x8dM8rq9bt3HCA5HJbzXsbzIULc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(7416002)(478600001)(33656002)(9686003)(38070700009)(41300700001)(38100700002)(122000001)(83380400001)(26005)(71200400001)(86362001)(2906002)(53546011)(7696005)(6506007)(66946007)(66446008)(54906003)(76116006)(66556008)(66476007)(55016003)(64756008)(52536014)(316002)(6916009)(8936002)(4326008)(8676002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YU9IVDcvL3pjNkd4S1UweWZDUmFMc2o1dXpSSDJCajZmbkZGTlFHZVlVZGJh?=
 =?utf-8?B?aU1CUkhrc0s1SmR3UnBoRnE4N09SVXpUaGRZS3B2cmtlYklyejdybHhuNVZW?=
 =?utf-8?B?T2JMZWpMaGJvU1pxVDk3ZHpod0VpOUM5ZVVzSXRNQUYyWTdhVWdKbUI0VFV3?=
 =?utf-8?B?dlNJcXZxMXdUNysydVpHczhqTEtFbFNUbW9yMGhSOXdzdEFsK2RTSkY4ZmVI?=
 =?utf-8?B?R2JKSXZwWXVwdG1YYnBxZ2Znc0ppdVlCcHM3VXZzVzJOeDRLSm5GdXRFSG0w?=
 =?utf-8?B?blQwZDZvVFVGQWtCVU5HVVQzTldOa3EvOHVMdk1iZXdMSmdhMG5LYklLQ1li?=
 =?utf-8?B?M1EwbHdYWDFUQlJzK0ZWdUh4R2xlLzR4K2VLRmJlcFNxRC8zQk1GNnZGUkZY?=
 =?utf-8?B?Ty81bHVtYzE4Ri95NmJwRHg2TUF4ZVh5Y2NYemhsRHVBNUIybTBSYkd1SHl5?=
 =?utf-8?B?dGVvUkJkWDE0a0p0NTN3WUlGZWdYRGYwaFBmVU1LNTBKemZuRmNsZEhQMTBr?=
 =?utf-8?B?NG5IUDlVUnFwQnl0U1BYNGlsdUNjMVZxRFMwTjRBaU1EZVhkbmtoRzF0NFJz?=
 =?utf-8?B?OVJVWER5R0dKQ0JFcEt5L3VXTHpnaWtUaEZlK0hzRGgvTWUzck91VlZMMncv?=
 =?utf-8?B?UVZxTy9KQUJwZEc2NnhuYUdDOWZsalJ0VnNoSXU5akkrQWxJWmJ6b2p6TTlz?=
 =?utf-8?B?TTR6eXZaUFgvVSttYkxDL3NPclUrSjZicDdhUGQxc2Z0ZnhxbUJDMmxLU3hF?=
 =?utf-8?B?dFVoM3FBSWRPYi9PdEVhamdmWUcrbGc0Q0dGRFY3bytNSHFaMlpRY2dETFdN?=
 =?utf-8?B?Y1BTVE1jTFlKcHp5V0tac0hEbXpFZHZOZ2tSN3BiZXE5aXkvc3NvVXU3RFdD?=
 =?utf-8?B?eE5XditvS1kzQ3JPSHltMmoxcjhmRUlCS1JMTjZ5aTNSRjNUSkUyRHlUMkh3?=
 =?utf-8?B?Zk5mT1Q0U0FCQ1RpWUdia0Y4Uy81MUNQU3czZFg0QnpTNjI3NEtKUnFGRTF2?=
 =?utf-8?B?RGIyZEU5Y1IwcWc0MDgxcFRnQzl6Z2x6ZGwwbG5HQUFTdHo3ZERxRWptdFVn?=
 =?utf-8?B?bTBUUnlHMkhsVFYwNDRMR3VtM2U1UGdOVTRBRWR2SkQzUjRNVWtIVlhUSDFK?=
 =?utf-8?B?Y1pDWVNTZ0xSUFltSCtaeEwyT0Uwbi9UWHVBU1dlcTZFQzJ0YWJBdWpTYkdr?=
 =?utf-8?B?TFpjemVaZ0lxY0pJYUxzVzE3dXpKNHQ1TTd3U2RzOVZpcWtjRmdVVE9NMXhY?=
 =?utf-8?B?K2NOTThFdGJBVXkrZGc1YVNEdHIwaVF1V1p2c1FmQjBLaU52R2JLcTZqT2Q2?=
 =?utf-8?B?aDZ5OTB0TlJYVnlrUWxIRVR4UW9rVEcrMG5uZjc2blNiMVpKUDFvclQ1dVFC?=
 =?utf-8?B?WENobzhGaFExMkJhdnAzZStZSk9TczFQcnBoQ0FESkhnUDRIT0wxb25BakRp?=
 =?utf-8?B?Z01hem0xdWJUVjdZT1pBZzJ1ZEltcnZsbnJ2Y1diNnJwdFZlN1g2eE1nbVNG?=
 =?utf-8?B?WUFyNWo0VUpObG96Z01rbE9rSDdvSnNNeUxmeEZoNldBc0ErWHhaVDhVeVRE?=
 =?utf-8?B?aTViT25aYUV0NHNzUm1aYjhiZm5RQVRvWlVwV0hhcFdZRlVQbytCZXY1MFRp?=
 =?utf-8?B?a0hnR3hYUG9IL2V6blVkMzNCcjJKOUMzNXRIMVlJMXVYOG80b2VaUk15VlhP?=
 =?utf-8?B?TUtNTm1RQXlvS2JWSENRMVYvTlBWMlNPamNMUzlVd3hrUTBKYTAwQVdEblpX?=
 =?utf-8?B?R09ydGxXNW1wZjdBc0NUYWsrS1VDSEpHdWVMQ3VOS0NrSXprY3hLTzlkWXpG?=
 =?utf-8?B?Q3lhUmQvZi9NcXhnQU15M0d6ZkZEbC81TENSRjkvRzcvaWNSYW02eDM5SHVE?=
 =?utf-8?B?UGZIdEhVUzlTKzAvOThrWm12SnRxQVhhdFFrbmVRTmdiWE5vOURMSml6dWxE?=
 =?utf-8?B?L3BWeGloWDlBZ2RKTHNaaU03TXBHekMvQmI3QWJRcWhZQXp2QWdoQVV2QlEr?=
 =?utf-8?B?cFlwakhYdkRaalJ4dTdNdkk3SytITGZjOFdad0dIYVdLWm5Ubk4zd1k2WHEr?=
 =?utf-8?B?dURNS3l2UXZCdjU3bDJMR0l2SXBlWlhCenBFNy8wZU44bmdVTUdKSS9PdlZh?=
 =?utf-8?B?UDNuaHVmNmNlamk4U3FhdldSUFdyajRLODlJOEdKUklvcVZmMzJWeVNBbW4r?=
 =?utf-8?B?R0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 40384143-993c-4398-08e1-08dbfa23b829
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 08:32:32.3178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3A62iYPzCZQKZ8HDKBdrM4EejRWiEgMOEJxlqq0jy7YeE7rETHoeyU1QlcZiSoMopa2qvEHxB9z6SykUjiceSvm/fWi/8sBrPjkMn54GaG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11068

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogTW9uZGF5LCBEZWNl
bWJlciAxMSwgMjAyMyA4OjIwIEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNi82XSBhcm02NDog
ZGVmY29uZmlnOiBFbmFibGUgUmVuZXNhcyBEQTkwNjIgZGVmY29uZmlnDQo+IA0KPiBIaSBCaWp1
LA0KPiANCj4gT24gU3VuLCBEZWMgMTAsIDIwMjMgYXQgMTA6NTDigK9BTSBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgt
bTY4ay5vcmc+DQo+ID4gPiBTZW50OiBGcmlkYXksIERlY2VtYmVyIDEsIDIwMjMgMzo0MiBQTQ0K
PiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCA2LzZdIGFybTY0OiBkZWZjb25maWc6IEVuYWJsZSBS
ZW5lc2FzIERBOTA2Mg0KPiA+ID4gZGVmY29uZmlnDQo+ID4gPg0KPiA+ID4gT24gRnJpLCBEZWMg
MSwgMjAyMyBhdCA0OjAy4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dEBsaW51eC1tNjhrLm9yZz4gT24gRnJpLCBEZWMgMSwNCj4gPiA+ID4gPiAyMDIzIGF0IDEyOjA5
4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+IHdy
b3RlOg0KPiA+ID4gPiA+ID4gRW5hYmxlIHRoZSBjb25maWcgZm9yIHRoZSBSZW5lc2FzIERBOTA2
MiBQTUlDIGFuZCBSVEMsIGFzIGl0DQo+ID4gPiA+ID4gPiBpcyBwb3B1bGF0ZWQgb24gUlovRzJV
TCBTTUFSQyBFVksuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gTEdUTSwgYnV0IEkg
d291bGQgaGF2ZSBleHBlY3RlZCAoYXQgbGVhc3QpDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAgICAg
Q09ORklHX0lOUFVUX0RBOTA2M19PTktFWT1tDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiB0b28sIGNm
ci4gbXkgY29tbWVudHMgb24gcGF0Y2ggNS82Lg0KPiA+ID4gPg0KPiA+ID4gPiBJIGhhdmUgdGVz
dGVkIHRoaXMsIGJ1dCBJIGdldCAiZGE5MDYzLW9ua2V5IGRhOTA2Mi1vbmtleTogZXJyb3IgLQ0K
PiBFTlhJTzoNCj4gPiA+IElSUSBPTktFWSBub3QgZm91bmQiDQo+ID4gPiA+IFNvLCBJIHdvbid0
IGJlIGFibGUgdG8gdGVzdCBvbmtleSBldmVudHMuIFNvIHBsYWFuaW5nIHRvIGRpc2FibGUNCj4g
PiA+ID4gdGhpcw0KPiA+ID4gbm9kZS4NCj4gPiA+DQo+ID4gPiBJbmRlZWQsIGN1cnJlbnRseSBk
cml2ZXJzL2lucHV0L21pc2MvZGE5MDYzX29ua2V5LmMgcmVxdWlyZXMgYW4NCj4gPiA+IGludGVy
cnVwdCB0byBmdW5jdGlvbi4gIEkgd29uZGVyIGlmIGl0IGNhbiBiZSBtYWRlIHRvIHdvcmsgdXNp
bmcgYQ0KPiA+ID4gdGltZXIgYW5kIHB1cmUgcG9sbGluZy4uLg0KPiA+DQo+ID4gWWVzLCB0aGF0
IGlzIHBvc3NpYmxlIGJ5IGVpdGhlciBhZGRpbmcgYSBkZWJ1Z2ZzIHRvIGVuYWJsZSBwb2xsaW5n
IGZvcg0KPiB0ZXN0aW5nLg0KPiA+DQo+ID4gT3INCj4gPg0KPiA+IGEgZGV2aWNlIHRyZWUgcHJv
cGVydHkgZm9yIGFkZGluZyBwb2xsIGRlbGF5LCBzbyB0aGF0IG9uZSBjYW4gaGF2ZQ0KPiBwb2xs
aW5nIHN1cHBvcnQgdG8gdGVzdCBvbmtleSBkcml2ZXIuDQo+IA0KPiBJIHdvdWxkIGdvIGZvciB0
aGUgbGF0dGVyLCBjZnIuIHBvbGwtaW50ZXJ2YWwgaW4NCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2lucHV0L2dwaW8ta2V5cy55YW1sLg0KPiANCj4gPiBCYXNpY2FsbHksIG9u
IGEgcHJvZHVjdGlvbiBzeXN0ZW0gd2Ugc2hvdWxkIGF2b2lkIHBvbGxpbmcgYXMgaXQNCj4gdW5u
ZWNlc3NhcmlseSB3YWtldXAgdGhlIHN5c3RlbS4NCj4gDQo+IFdvdWxkbid0IHBvbGxpbmcgKGJ5
IExpbnV4KSBvbmx5IGhhcHBlbiB3aGVuIHRoZSBzeXN0ZW0gaXMgYWxyZWFkeSBhd2FrZT8NCg0K
SUlVQywgVGhhdCBpcyBhbiBvdmVyaGVhZC4gSWYgdGhlcmUgaXMgbm8gbG9hZCwgc3lzdGVtIGdv
ZXMgdG8gc3VzcGVuZCBtb2RlIGFuZA0KdGhlIHRpbWVyIGZvciB0aGUgcG9sbGluZyAoU0NBTiBr
ZXlzKSB3aWxsIHdha2V1cCB0aGUgc3lzdGVtIGFuZCBzYW1lIA0KcHJvY2VzcyByZXBlYXRzLiBJ
ZiB3ZSBoYXZlIGEgUE1JQyBJUlEsIHRoaXMgd29uJ3QgaGFwcGVuLg0KDQo+IEkgdGhpbmsgdGhl
IERBOTA2MyBpdHNlbGYgaGFuZGxlcyB0aGUgb25rZXkgd2hlbiB0aGUgc3lzdGVtIGlzIGFzbGVl
cC4NCg0KSSB3aWxsIGFzayBIVyBwZXJzb24gdG8gd2lyZSBJUlEgb24gUE1JQywgc28gdGhhdCBJ
IGNhbiBjaGVjayB0aGUgYmVoYXZpb3VyLg0KDQpDaGVlcnMsDQpCaWp1DQoNCg0KDQo=

