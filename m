Return-Path: <linux-renesas-soc+bounces-884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F6E80C3E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 10:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8280A1C20A1C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 09:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D3A210E3;
	Mon, 11 Dec 2023 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Y1BgDmf9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2124.outbound.protection.outlook.com [40.107.113.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACBD6D54
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 01:01:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyU27sFcDZqp7ezzSkETpOi50yG2YVYqa9S7eQE+D3WqfSMM2lJXTRc1/Z7JtYsNx6WZqDcDfRqEqAdUuQHFOZxkpyUw+HCwEF1bTKZJJ7lKb7F47ACWv10x+RaoCMs4ICP93jX6QzJIma5Kf/Ds35DqnK7u5Cu9LGBVP6uR4yUPUgWwxs1wjG+dLwKHhnrfwjQ1JZaKk5a7ywSLAoJ/P0N/BuEhI2EUJgnuGzjC7DIkFJjnL19/3TpY+jTcaxLMa0jJeyCmFS1CTE3qfyqLJLqyXI+I0w+vuqfvgNklIKYZ5M56wDkc0roY+EvCa29yRl29w01ruJzUErwXUbu+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obsXVG8l67RAiAr6MoR7lb8CJ22tQdqy7chqD3Who9U=;
 b=ir5Aqu+ErvnRmkPSUK96fTQwzgpnpvIaIG/KY/EcvpX/gmqQS1sE/NpU+H2KuVDpxyxsSeioMmT/sKvdFXW7zyYfZ7nzofh663AedwzTUG5CpwUQJgHHvWfjCT/wHBI+tt904BpW6xAXW/lYAHT65IFyii/XXlqrLk/rhcXLTsgfPBm/tg92x10pSBYNpiwgylKVAmUkgocy82vOQrboBSHhOYUdy2XQS/IEfYX1eTnqLE8tOO8KrI7pl9jIUNACD3B8YuhSuVhN8ICCvfuLSHa9BmZ2Buv7pt+dkERqxBMUnlzPFMMGraNKL3AJsidUqwIF6KE3DqLTog8S1kxMOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obsXVG8l67RAiAr6MoR7lb8CJ22tQdqy7chqD3Who9U=;
 b=Y1BgDmf9xrZEiaL1aPxJRzrviYNHcs52YYnYqQ1Ywo65WXcCeTLQBtInsrdXGjmEP6bAb51jFh4YXNlnvJMFD+Y7UPXLHHC2wDJX/Gs8l+cSWBSoe1xcs2pUoF6CmDY7cY64sLifs0IpBT5yr4CKLs1hJwzkzW6LQSbliubr+jc=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB10696.jpnprd01.prod.outlook.com
 (2603:1096:400:294::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.21; Mon, 11 Dec
 2023 09:00:57 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7091.020; Mon, 11 Dec 2023
 09:00:57 +0000
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
 AQHaJEbR2tmw26FlxU+RAXf4dl1/ebCUb5gAgAAWQGCAAAtwAIANwRXggAF60YCAAAClkIAACGcAgAAAaeA=
Date: Mon, 11 Dec 2023 09:00:57 +0000
Message-ID:
 <TYCPR01MB11269FF61142A63ED67F32647868FA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-7-biju.das.jz@bp.renesas.com>
 <CAMuHMdWh3fTzQP5+mGF3u8LACg-5tQDZcyExvgREpxKd6iee4Q@mail.gmail.com>
 <TYCPR01MB112696C301D750A915F2661688681A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <CAMuHMdXHpE079eLAJjcdsbz6=Y6hux267AhqJow6HESCaf7EXQ@mail.gmail.com>
 <TYCPR01MB112693C2B72B6AA28766FF8EA8688A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <CAMuHMdU2pdAYbXdyfpysPR0k7fjh31KrD9Xk05EHWeayzVDz5g@mail.gmail.com>
 <TYCPR01MB1126926DCFDB193E669C9CF8C868FA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <CAMuHMdUswKrzqgumyoJ3RYWEAUR9WOBzc12dVcCB1s79E-AMRw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUswKrzqgumyoJ3RYWEAUR9WOBzc12dVcCB1s79E-AMRw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB10696:EE_
x-ms-office365-filtering-correlation-id: 8345e155-209e-436a-2eab-08dbfa27b051
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 OT7lHNhqLQ8e6oPsiN91dkH/W9nvLiXMA2un8w2Vl1GBW/ywRSc50rPdJAeVqhG/tTXzloP+T+NY5e8f6x9vH+Y0xLoayw5VrgiusLnEUqa9ccqZTBmH1a49DfwswZrVGr+77idP7KPDWG3Qk/3KYkqeODsCr84aiE8OqIjPLjaMSPAH1fIKgKTyh1n8Yb3hTnkzjCabDDpLbZ+WPI1dWkb3wv6Z7zk4sGV7drC/6VuUbkLE7tUStDTjAAsSY8C/ToN3GWzf8SneYmqwto6nlPBbG2XOR5mtcfyxh83H6Z46chyEP17q9epfn4FHCrTjZiognxGVf0khD7zKYgLNrL8Q8r59rxcMWARtbNg8/e2pSaAr3RUGQrLWhFXXDEVoivU4M80eEcuyEKD7oDJi0j1TRuBcwRYJr8E48WaGh/rzF7KChs7OnaQe0lNOzOyj3XVLWWRKj/1WqFU6ZUckEEXwPJHsWji29b+iuEuGg8/ifqnt0mhEEgwcQNkCDLh0sy13XD9zG3LpnfKCXvVam7gqTNh+D4hr7XMYipzws7p0KVZSIjE6VJyR4KR7aKdwt4vChDS5ojQ7DEx2dcRnpsPokAwlJvUK8N6x1WNrdG89ia9+qwxDLrSke/5i/+Ni
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(396003)(366004)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(26005)(83380400001)(38070700009)(33656002)(86362001)(38100700002)(122000001)(5660300002)(316002)(8676002)(8936002)(4326008)(7416002)(2906002)(7696005)(6506007)(9686003)(71200400001)(53546011)(6916009)(52536014)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(76116006)(478600001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWVCRlZFT3dPY3Rld1Z2OWJuTkJGbVZjeC9KRjFJUm9oSmI0b292R3FMSExm?=
 =?utf-8?B?MHhrSTAwTWtLSm54SkdZQmZiVlBwSWdNVVdJWjBlK2VtMkI4KytLbCt1ak8x?=
 =?utf-8?B?bFNaSjBOZXBqSHhMeGxRL0dVaVZ3UjZ2N1J6WGs5Y0FnVzFEZC9JT2dNRXB2?=
 =?utf-8?B?N29maWRHUlo1UlB5VHNrYXlpQ253QUhUZ1NwaGIzL29nUnJ5b2EraW12NC9n?=
 =?utf-8?B?U0tVaGlIa2VzVERUTVY0VHJDNWNHd1R4d2x1V0lLL3RENHdZR2FsVUVSa2dE?=
 =?utf-8?B?WERMakJuZHZFVk52ZmpjVTlOMDlnSWdOUlAzVnRHemRXOHloYWRnbnZXajhu?=
 =?utf-8?B?TGRQOEtONytMc3hzdWUrczZGR0FuNEtBQk01c0xYc3dmZ0hIaXFvdTJZdEhJ?=
 =?utf-8?B?RDhVR2NyMldTRFNDdUJoOTV0U3Vzd0U2eE5rSk1xbktqeU56bjd4SldUcW1N?=
 =?utf-8?B?Y0VZZUlyTWZCR2xNZCtuSi9EL3orcEpRWnNId2lGb0xURDNRR1oxRFJoaEpy?=
 =?utf-8?B?cU55U1JxU09CbytPQUgwZWJWSVU5T2pIUCtJamlrRFo3eVJxVldmamovZEsv?=
 =?utf-8?B?ai9wL0lHRm95b3kvb1luTHczUVJRQlVCeEx5NGUvMm10bHdmWW0wc1M5YjZF?=
 =?utf-8?B?SFY1dHljbHBOcXVhN05uQzVPNnlKbGUwWFNMUGxyc3lTTjIwd0FkaCtlZnhF?=
 =?utf-8?B?OUNuTENFdEJEWVNnUkU1QkhZOTJPYUdUMVRoNTNIdkVPaG5KVVlianJVdmt4?=
 =?utf-8?B?ZmFkTEx0eDRUejVtbWZCcldCRVc3dXgyQVdmc1lRUURlOG1rS3F1QXRCelk0?=
 =?utf-8?B?eFRxQXVZTW8rVkZpV3ZYVCtPTjdRLytpbmdFTjBYZGZucWNLcVkyNEdPU21R?=
 =?utf-8?B?Wnc2S1NLYkNWU1gvV3FVREhNOFpxZ0F3WU5mbXBZZTlERS9sQ2FveC9odDNQ?=
 =?utf-8?B?TGMxUFQ3WGN5Ujd4Wm5raVltUURVdFVicW4zYm5kMC96RFJ6dEhKLy8zaUty?=
 =?utf-8?B?NHBlNXJtNzR5UHFZUVNUZ1lwTUhSZzB5OGloVlhxenZEN2xRbU4zdFUvNllq?=
 =?utf-8?B?c21sWXBPZ0NTOFIwWjlmU2IrY0w1NEFRcDhjeExhcmJrQVZ2eHEyMmF2Q2JW?=
 =?utf-8?B?Q1pzampNMlpPKzNneGRjYjBnakY1eWJSRURmUzY2STRrQ0xLQTR6MGtBQ3J1?=
 =?utf-8?B?UjFFNzNYT3V0NGdhZUlaMXgzRVpxbFVtWjVzOVo3NXptTitkOFVNRExqZzNj?=
 =?utf-8?B?MEhRSi9MU3YyT2tHQ1BrSFMrRTBLYnE5bi9KWk5oU2NXSXA0eHFUVkhRN2lF?=
 =?utf-8?B?MXhKTUQvYnA4ZGM4YUNWZlhUMjhFcHpxVGp2bmZDRnZCb3AzME1yYWVES3FZ?=
 =?utf-8?B?TTVsN2pkUVkzMmp6bzZ5R2lrQ25UcnhGcCt5UnpubFdSN2dYeDZ5dERlMU9F?=
 =?utf-8?B?Rkx0b0F6bjVrZTQvYU1WWWxLRjRvVUlzcDhnemJqTGVHNnprV0FlWlYzcStQ?=
 =?utf-8?B?V0QyMENDTnZUbUFmVUZyc21NM1E5YkJrcEJXbFRCNjBqQ3ZiUXBLRWVUR1V4?=
 =?utf-8?B?VFk0eDFIRU5nQ2UrT3paVTBUb1lFQUNjeGN6RlV2Y2JsMENEbVFIVThGQWxp?=
 =?utf-8?B?VXBnbXpPTEc0RWx4YW0zanZaWHcrNHBsWjViSmtSUHlCT1ZwdS9jZi9ZbThl?=
 =?utf-8?B?UHJZa0hpVVN1VE4yZHZPNGN1VEFZS3c0emtORGlHQTBMSEk0T2ZjQVRRUGw5?=
 =?utf-8?B?TjZCMmFrcENHWU96UlVSelFxbWVSbXNuUUtzcEVXTnZTSTlIbFMvVFVxdmZi?=
 =?utf-8?B?VFpnbm84Y1hnZnhGRGExWEVQOWpmdStRcUVTY0dQU2N5SWdMai9QVFZhSUtK?=
 =?utf-8?B?VzBlbnV4dk8vUE40cnp3VjBlMmNkcW1HR05ST3RicmRtNnpPWk5HWEt5Tmlw?=
 =?utf-8?B?WGlLcG9aaUFDZTRnYXpOTmM3ekM3dmsyRmErMm1RY3ljdGErTGFoYU1SZThC?=
 =?utf-8?B?anVnZXhsb2N3WnRjL1NTS3hjYW1KU0RzNU0yYUxjL0Rpc0k5V2VBaE5yOElH?=
 =?utf-8?B?MnpyaHVJWUpaRUxNeWhuQkMwaDM3VUtqSVM1L3pPZE1MdWpqRU1xdGtIUFVn?=
 =?utf-8?B?YTRERVAxRkp6M2RGL0V3OVZMZUFNTFVYVlhVdHorcTFzM0lWK0NjK2FZeks2?=
 =?utf-8?B?M3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8345e155-209e-436a-2eab-08dbfa27b051
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 09:00:57.1220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99GQgboM06/3gCtjf63VPYpKvaml4KFK5QnagnTOTYdhBmuCQvcBrdCZ4+qq5fREEs0PLS2BcYyo/n7P5rhpsnUX1rChsHqn92K1Vfhr7tM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10696

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogTW9uZGF5LCBEZWNl
bWJlciAxMSwgMjAyMyA4OjUzIEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNi82XSBhcm02NDog
ZGVmY29uZmlnOiBFbmFibGUgUmVuZXNhcyBEQTkwNjIgZGVmY29uZmlnDQo+IA0KPiBIaSBCaWp1
LA0KPiANCj4gT24gTW9uLCBEZWMgMTEsIDIwMjMgYXQgOTozMuKAr0FNIEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4NCj4gPiA+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMTEsIDIwMjMgODoyMCBBTQ0K
PiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCA2LzZdIGFybTY0OiBkZWZjb25maWc6IEVuYWJsZSBS
ZW5lc2FzIERBOTA2Mg0KPiA+ID4gZGVmY29uZmlnDQo+ID4gPg0KPiA+ID4gT24gU3VuLCBEZWMg
MTAsIDIwMjMgYXQgMTA6NTDigK9BTSBCaWp1IERhcw0KPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPiA+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPg0KPiA+ID4gPiA+IFNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgMSwgMjAyMyAzOjQyIFBN
DQo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCA2LzZdIGFybTY0OiBkZWZjb25maWc6IEVu
YWJsZSBSZW5lc2FzIERBOTA2Mg0KPiA+ID4gPiA+IGRlZmNvbmZpZw0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gT24gRnJpLCBEZWMgMSwgMjAyMyBhdCA0OjAy4oCvUE0gQmlqdSBEYXMNCj4gPiA+ID4g
PiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+
ID4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IE9u
IEZyaSwgRGVjDQo+ID4gPiA+ID4gPiA+IDEsDQo+ID4gPiA+ID4gPiA+IDIwMjMgYXQgMTI6MDni
gK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPiA+
IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+IEVuYWJsZSB0aGUgY29uZmlnIGZvciB0aGUgUmVuZXNh
cyBEQTkwNjIgUE1JQyBhbmQgUlRDLCBhcw0KPiA+ID4gPiA+ID4gPiA+IGl0IGlzIHBvcHVsYXRl
ZCBvbiBSWi9HMlVMIFNNQVJDIEVWSy4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBMR1RNLCBidXQgSSB3b3VsZCBoYXZlIGV4cGVjdGVkIChh
dCBsZWFzdCkNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gICAgIENPTkZJR19JTlBVVF9E
QTkwNjNfT05LRVk9bQ0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiB0b28sIGNmci4gbXkg
Y29tbWVudHMgb24gcGF0Y2ggNS82Lg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEkgaGF2ZSB0
ZXN0ZWQgdGhpcywgYnV0IEkgZ2V0ICJkYTkwNjMtb25rZXkgZGE5MDYyLW9ua2V5Og0KPiA+ID4g
PiA+ID4gZXJyb3IgLQ0KPiA+ID4gRU5YSU86DQo+ID4gPiA+ID4gSVJRIE9OS0VZIG5vdCBmb3Vu
ZCINCj4gPiA+ID4gPiA+IFNvLCBJIHdvbid0IGJlIGFibGUgdG8gdGVzdCBvbmtleSBldmVudHMu
IFNvIHBsYWFuaW5nIHRvDQo+ID4gPiA+ID4gPiBkaXNhYmxlIHRoaXMNCj4gPiA+ID4gPiBub2Rl
Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSW5kZWVkLCBjdXJyZW50bHkgZHJpdmVycy9pbnB1dC9t
aXNjL2RhOTA2M19vbmtleS5jIHJlcXVpcmVzIGFuDQo+ID4gPiA+ID4gaW50ZXJydXB0IHRvIGZ1
bmN0aW9uLiAgSSB3b25kZXIgaWYgaXQgY2FuIGJlIG1hZGUgdG8gd29yayB1c2luZw0KPiA+ID4g
PiA+IGEgdGltZXIgYW5kIHB1cmUgcG9sbGluZy4uLg0KPiA+ID4gPg0KPiA+ID4gPiBZZXMsIHRo
YXQgaXMgcG9zc2libGUgYnkgZWl0aGVyIGFkZGluZyBhIGRlYnVnZnMgdG8gZW5hYmxlIHBvbGxp
bmcNCj4gPiA+ID4gZm9yDQo+ID4gPiB0ZXN0aW5nLg0KPiA+ID4gPg0KPiA+ID4gPiBPcg0KPiA+
ID4gPg0KPiA+ID4gPiBhIGRldmljZSB0cmVlIHByb3BlcnR5IGZvciBhZGRpbmcgcG9sbCBkZWxh
eSwgc28gdGhhdCBvbmUgY2FuIGhhdmUNCj4gPiA+IHBvbGxpbmcgc3VwcG9ydCB0byB0ZXN0IG9u
a2V5IGRyaXZlci4NCj4gPiA+DQo+ID4gPiBJIHdvdWxkIGdvIGZvciB0aGUgbGF0dGVyLCBjZnIu
IHBvbGwtaW50ZXJ2YWwgaW4NCj4gPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pbnB1dC9ncGlvLWtleXMueWFtbC4NCj4gPiA+DQo+ID4gPiA+IEJhc2ljYWxseSwgb24gYSBw
cm9kdWN0aW9uIHN5c3RlbSB3ZSBzaG91bGQgYXZvaWQgcG9sbGluZyBhcyBpdA0KPiA+ID4gdW5u
ZWNlc3NhcmlseSB3YWtldXAgdGhlIHN5c3RlbS4NCj4gPiA+DQo+ID4gPiBXb3VsZG4ndCBwb2xs
aW5nIChieSBMaW51eCkgb25seSBoYXBwZW4gd2hlbiB0aGUgc3lzdGVtIGlzIGFscmVhZHkNCj4g
YXdha2U/DQo+ID4NCj4gPiBJSVVDLCBUaGF0IGlzIGFuIG92ZXJoZWFkLiBJZiB0aGVyZSBpcyBu
byBsb2FkLCBzeXN0ZW0gZ29lcyB0byBzdXNwZW5kDQo+ID4gbW9kZSBhbmQgdGhlIHRpbWVyIGZv
ciB0aGUgcG9sbGluZyAoU0NBTiBrZXlzKSB3aWxsIHdha2V1cCB0aGUgc3lzdGVtDQo+ID4gYW5k
IHNhbWUgcHJvY2VzcyByZXBlYXRzLiBJZiB3ZSBoYXZlIGEgUE1JQyBJUlEsIHRoaXMgd29uJ3Qg
aGFwcGVuLg0KPiANCj4gQWgsIHlvdSBtZWFuIGlkbGUuIFllcywgdGhhdCBkb2VzIGluY3VyIGEg
KHNtYWxsKSBvdmVyaGVhZCAoSSBndWVzcyB0aGVyZQ0KPiBhcmUgb3RoZXIgdGltZXJzIHJ1bm5p
bmcsIHRvbykuDQoNClllcy4NCg0KPiBJIGRvbid0IHRoaW5rIGFueSB0aW1lciBydW5zIHdoZW4g
dGhlIHN5c3RlbSBpcyBzdXNwZW5kZWQuDQoNCkkgZ3Vlc3MsIElmIHdlIGFyZSBjb250cm9sbGlu
ZyBQTSB0aHJvdWdoIENQVSBpZGxlIHN0YXRlcywgdGhpcyB3aWxsIGhhdmUgYW4gZWZmZWN0Lg0K
V2Ugc2NoZWR1bGUgdGltZXJzIGZvciBwb2xsIGludGVydmFscyBmcm9tIG9ua2V5IGRyaXZlciwg
d2hlbiBpdCBleHBpcmVzIGl0IHdpbGwgd2FrZXVwIHRoZSBzeXN0ZW0NCmFuZCBhZ2FpbiBiYXNl
ZCBvbiBpZGxlIHN0YXRlLCBpdCBlbnRlcnMgaW50byBzb21lIHJldGVudGlvbiBzdGF0ZSBhbmQg
Z29lcyBvbi4NCg0KDQpDaGVlcnMsDQpCSWp1DQoNCg0K

