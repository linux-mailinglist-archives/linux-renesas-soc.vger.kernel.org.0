Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 531C53B4373
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 14:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhFYMjQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 08:39:16 -0400
Received: from mail-eopbgr1310130.outbound.protection.outlook.com ([40.107.131.130]:36096
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231468AbhFYMjG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 08:39:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n89G9oRAr5IFc3KYqMPEsdtvlKw4UECxzC5iqfkZrKXM9HKsAKLPtmR8gjf+A1/H6/RsNo2YUIihUN5gzPx6LQefrvEtc52M//tF1P3T1R5dEz5Dxt0HrUg063WAHrWrspV5d8+dJBmcTE3k61HqotH5wV/BQCMsLv3jNkWcCRaqtxkaFJSqUOsOpvfG2BbzMK+jt6+MJrwmJYyUgB//QULSv9hQaM84qY+45WwGSHJEX36yGdzwrOs3FbU5j4uxhplmG3j86qKBC241torJ2xj+MoiKxecdIHdD14lMABxqMqpD87gv/nyHnAsb5rW+24Azm/I6Ou1tiFU/pk+zgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7PGndvd1IEgfE7NiGfdYwPu7cmGEES644Yj3DpFP2M=;
 b=j+GfJqaxuaO3sTK2hqc7TubM5xqFBq/gmhymZazgTznMDWIlTiKtghCi44Dy6h1w2Djfnp92uH5GFAGdxtu8tCyHJrpykFPnVXx0QzyxrQfAi9o1nzXMAPzjtvC0Df8cl9ngdXUwmYYuWs+v1A6LSSsDULNsyueJ0xqhm2DuRy+EscY8uUIQ6I/LGXyXF8F0dec+EjdNDaUEp2xl8L4NOz9NEoSOaMqt4BvcMYwvrjPVVk2VGCuw2eikR2/an8n+TT/AActV1QRdJ29hHJ43R/PJ9/ZuCPYA2Fv+4Cgtc4gIe/DYnkXj+/T5Wg4RCYOz0nNfMUS6hRfIm/ymBCt3AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7PGndvd1IEgfE7NiGfdYwPu7cmGEES644Yj3DpFP2M=;
 b=CHtJKmg8+fDrYWPwgH68ZQLNSUCWGvKn+zamtwisv7PYlaRM+6erJwn2GMMvrYyc7QNGsN7cPeKnxvJz1AEubs08SE5lcDC1VbnOncu3hDyMnbCblbbNHW7lnK/F61zq3atyj5GFJePOFh0d4Wo4+gxy54e1X7OxvL7HC3Q+XW4=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB1977.jpnprd01.prod.outlook.com (2603:1096:404:c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 12:36:40 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Fri, 25 Jun 2021
 12:36:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC] mmc: host: renesas_sdhi: Refactor of_device_id.data
Thread-Topic: [PATCH/RFC] mmc: host: renesas_sdhi: Refactor of_device_id.data
Thread-Index: AQHXaZd5jr3zz7SVJkuCLUlHvyiT9KsklSmAgAAU6OA=
Date:   Fri, 25 Jun 2021 12:36:40 +0000
Message-ID: <TY2PR01MB36925942A2FFCA2077CEEC2ED8069@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210625075508.664674-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWmM+d2V7miepoptmaP7mmbtaWNBkJp3LqbhaiQ+18JwA@mail.gmail.com>
In-Reply-To: <CAMuHMdWmM+d2V7miepoptmaP7mmbtaWNBkJp3LqbhaiQ+18JwA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02e9bb26-9799-433e-1432-08d937d5e1f6
x-ms-traffictypediagnostic: TY2PR01MB1977:
x-microsoft-antispam-prvs: <TY2PR01MB1977E07C65702A2D99E702E8D8069@TY2PR01MB1977.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /Uuo9HDJwGZLBCqFdp0AQDS2HpKtWMaFXrunW91iBWUG9jnwYYnxtnlpHog3iBHp2roV9Xp8bX2qSABxEHILCox0eDTFlT9zYHeSqnhDOdvl3V/6pMC724ItCQxnrMM65B+sTmvrBNXafSDQbAUWzBEWlEV/gldk+9vUAJJdBSvlchVzZSmJm1mi2oJ+bghu0IKFTR2eundabQjqMLgVMh2O7daAoxR7yssiyR/34kVmjIAPgKYeC+d3gSGTBTrPv9eU/Kpq1CKwaV8j1wvoM21N4h7eiZgb4tN76njRvtH89Ix1gqm9M/GWapnqD40dK9vCskoPNictW23u6SWVdYrvaydMzbqkvdt7v/QB9P+t2u2JfYLcbEkE4Z/TeGio7L5y7JWRqM/+jGQ7YXD4hGqz/iTzYgy/ScZcaPzre9WmGlToDNDmjhXLwtNY/mPNbePV74hmkzzAYmTg66Wu76d1oaYwejyykAFbr7Vddcbr/Z39t9WWIiI9LpdGeE25nI0zcoh68B5aXod6Wa7U0T2G3/A1a3PSYrv1KkIaWrO4c3SGDTIfB6OioC2etEzTT7usWMnnOnTUVWan3C3DPEOY9prF/N9qHbIdUYY8+JIe+Di2WODXNXOYsVCjV/dGJXdIbc5JCnEYJDfFMQknRA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39840400004)(26005)(186003)(76116006)(54906003)(66556008)(66476007)(52536014)(55236004)(66946007)(7696005)(86362001)(33656002)(53546011)(6506007)(66446008)(316002)(64756008)(4326008)(5660300002)(122000001)(38100700002)(478600001)(8676002)(8936002)(55016002)(9686003)(6916009)(71200400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWJvYWFZSXZ1Zmp6bkp2TS9BdnQwbTFhSjNLMjZyZFNERTZoVnlsT1ZwcEpp?=
 =?utf-8?B?RkVqeGZSZHpZbVdZb1FiR1RjaFdTbDdXZlhsTFpMY1orU2JQZjV6SEFVS21E?=
 =?utf-8?B?dDJPK1hrSHlNQmY0YkFBc0hrdjFuQTVOZi94cDNKWEJJanRuNHB4dXB1bFp6?=
 =?utf-8?B?OEtxRTlRbkJGYXVYejBRcXFRVzJxMmdSRHlmbVBrbWtzZGZZdlhleGg4dkJ1?=
 =?utf-8?B?aXBFam9tL3loT3VIZVJZY3JITnZOelRNeWJmSytvOVRwYmRUaTlQRHdzOG03?=
 =?utf-8?B?NnJ3Tkt5OW5rclVKa2g2ZndsMXJldDR2Q3FWYVcrbExNYUpmOFp2QW5IVTdZ?=
 =?utf-8?B?QmY0VHBWNURiYkhpUkZibG9Ub1J0WW9qUnc5dFpFQkVOUHhOSG1JSTVwNDA1?=
 =?utf-8?B?T0R2OWVOK1VWN3dBQlpVL21JTDh3dTR6d1hNTFR2dWZJU3ZhWXA2SURMTE9z?=
 =?utf-8?B?UUp3WEd5N2kxMGE1VFdrQW5kbnJLYTRyaHRZRVBEbVBScHgyeHI3aDVQazNK?=
 =?utf-8?B?OTVaajVGYUJFaVVtQ1Brd2lyTnhOTGNUMFpzRjJBd2U5UFJjMWU1YzdZQVhu?=
 =?utf-8?B?ZlV5aW5PMll6Z2hQcHlNYzN3MkpjQ3N3K3d4bllnV3JjM0l4T2VOcEVFS1JP?=
 =?utf-8?B?dEF1N1N0MzBCTjg1MkNMaTNtZ1VpT0N2ZnFVT256TzBsendGcXhNMzllZUhi?=
 =?utf-8?B?YWVFQzRvbEpKb3Y0ZVd3dGlIM24zK3hZR1dTT3JKMkdrbjduL3ZxS3FUS0hN?=
 =?utf-8?B?ODg1SW9qeXlqRExpczgwWkp0Y1QwOUprNFp4SzZ1Zlhkd0lucmx1N1EvbGZt?=
 =?utf-8?B?OWdhK3JibmJoUVNwdkZISnllTnVYclhaWGFCcC9XMjczWENCR29NRUVwNEZa?=
 =?utf-8?B?dzNsQUQvRUg5TXZnd3N5T0hoa1B2RjJ0V3Y4ZldZN3YvWmVuM1R5MlVpa2dW?=
 =?utf-8?B?Zkp0N3pxMGtzK3V6ajBNK1FFa3BmMFdQUGlMSGFuQU51N2U2b1I3U1FmK3pU?=
 =?utf-8?B?WmpobHU3QkxyOWtpVEVDYWdBVkFGU2ZDclhWclJVaUNEY3gvL2pKR2lEc1BE?=
 =?utf-8?B?Z3ExY1BXUk5XY0lqenhUZFQ2c3A4K3QzUk1TZUZZQzNKTDZINmpPYXFUU2NI?=
 =?utf-8?B?R0s1VmM5UzFKRUZPbWtHZDhuckdlTEdZWVI4Nmw0ZVNORUFCWS8wb1UwdWoy?=
 =?utf-8?B?VVpzc0NuNVV5QU12Nzkza2tMMnVGWGIxRU1FQ1RyNXBkV01HUmRlQlhVeENX?=
 =?utf-8?B?VVRQcWFKRVJaK2kzWkcrK20yTVpSY1k1QUQyNDl2bVZ6STVnNmZoQUxFNHkz?=
 =?utf-8?B?YVM4KzVwQWllZWVmeTlyeFQzYUNxTEFnTWk5bEJUQ0w4UTRqc25UaUNpL3FV?=
 =?utf-8?B?bEpPZTFIRmZ3cStJUE4rakZsSFpRWmVCSlh0REZobDlSV1M2T3hmUDdteHJk?=
 =?utf-8?B?ajB6UC9BeUhuMVZPWjBkKy8vZzIrYUJLNTAwZmNiNTZxL3pyQ0pNOVFOY1NR?=
 =?utf-8?B?OUtsbDBUY244a2RqbDFMbWtKdUFPL2NUcFJ1UFlsYmgySzNweElaaUpDbXNn?=
 =?utf-8?B?SXhPODd2akdQZjhKSCtDWGY2Q1lDK0VVS2hyWjVsOUxINlVUYWF6T1dpZkww?=
 =?utf-8?B?LzIwVHN1VlF5dzlQYldUYnBxellMY2NVQVlkRUovb1FGRUtIam1XZFlySTFW?=
 =?utf-8?B?RFBJblJTR1NSRnhpV1RVdnF4MFNva3U1MzY4NnJDLzBtZzRJaWx4bEZQdWs0?=
 =?utf-8?Q?Qpu+IahzcrMbhXUenAVsNh4wxC5GikvPGKczrsm?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e9bb26-9799-433e-1432-08d937d5e1f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 12:36:40.6908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IS4pCxZxARrsgJ92pe1LVhcsHABithEhve/Sc4RC15ie2Y5yQXCW+orLhfdE8ymf2xpNusGMv4ANeEVPYyw+5RqnEhEckqlyVA+kuq9EUL8phgLGbm+ffIdKrV05/QKJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB1977
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBKdW5lIDI1LCAyMDIxIDg6MjEgUE0NCj4gDQo+IE9uIEZyaSwgSnVuIDI1LCAyMDIxIGF0IDk6
NTYgQU0gWW9zaGloaXJvIFNoaW1vZGEgd3JvdGU6DQo+ID4gUmVmYWN0b3Igb2ZfZGV2aWNlX2lk
LmRhdGEgdG8gYXZvaWQgaW5jcmVhc2luZyBudW1iZXJzIG9mDQo+ID4gc2RoaV9xdWlya3NfbWF0
Y2hbXSBlbnRyeSB3aGVuIHdlIGFkZCBvdGhlciBzdGFibGUgU29DcyBsaWtlDQo+ID4gcjhhNzc5
bSouDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJv
LnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+
IA0KPiA+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYw0KPiA+IEBAIC05NDEsMTMg
KzkxMCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc29jX2RldmljZV9hdHRyaWJ1dGUgc2RoaV9x
dWlya3NfbWF0Y2hbXSAgPSB7DQo+ID4gICAgICAgICB7IC5zb2NfaWQgPSAicjhhNzc0YTEiLCAu
cmV2aXNpb24gPSAiRVMxLlswMTJdIiwgLmRhdGEgPSAmc2RoaV9xdWlya3NfNHRhcF9ub2hzNDAw
IH0sDQo+ID4gICAgICAgICB7IC5zb2NfaWQgPSAicjhhNzc5NSIsIC5yZXZpc2lvbiA9ICJFUzEu
KiIsIC5kYXRhID0gJnNkaGlfcXVpcmtzXzR0YXBfbm9oczQwMCB9LA0KPiA+ICAgICAgICAgeyAu
c29jX2lkID0gInI4YTc3OTUiLCAucmV2aXNpb24gPSAiRVMyLjAiLCAuZGF0YSA9ICZzZGhpX3F1
aXJrc180dGFwIH0sDQo+ID4gLSAgICAgICB7IC5zb2NfaWQgPSAicjhhNzc5NSIsIC5yZXZpc2lv
biA9ICJFUzMuKiIsIC5kYXRhID0gJnNkaGlfcXVpcmtzX2JhZF90YXBzMjM2NyB9LA0KPiA+ICAg
ICAgICAgeyAuc29jX2lkID0gInI4YTc3OTYiLCAucmV2aXNpb24gPSAiRVMxLlswMTJdIiwgLmRh
dGEgPSAmc2RoaV9xdWlya3NfNHRhcF9ub2hzNDAwIH0sDQo+ID4gICAgICAgICB7IC5zb2NfaWQg
PSAicjhhNzc5NiIsIC5yZXZpc2lvbiA9ICJFUzEuKiIsIC5kYXRhID0gJnNkaGlfcXVpcmtzX3I4
YTc3OTZfZXMxMyB9LA0KPiA+IC0gICAgICAgeyAuc29jX2lkID0gInI4YTc3OTYxIiwgLmRhdGEg
PSAmc2RoaV9xdWlya3NfYmFkX3RhcHMxMzU3IH0sDQo+ID4gLSAgICAgICB7IC5zb2NfaWQgPSAi
cjhhNzc5NjUiLCAuZGF0YSA9ICZzZGhpX3F1aXJrc19yOGE3Nzk2NSB9LA0KPiA+IC0gICAgICAg
eyAuc29jX2lkID0gInI4YTc3OTgwIiwgLmRhdGEgPSAmc2RoaV9xdWlya3Nfbm9oczQwMCB9LA0K
PiA+IC0gICAgICAgeyAuc29jX2lkID0gInI4YTc3OTkwIiwgLmRhdGEgPSAmc2RoaV9xdWlya3Nf
cjhhNzc5OTAgfSwNCj4gPiAgICAgICAgIHsgLyogU2VudGluZWwuICovIH0sDQo+ID4gIH07DQo+
ID4NCj4gPiBAQCAtOTU3LDYgKzkyMSw3IEBAIGludCByZW5lc2FzX3NkaGlfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCj4gPiAgICAgICAgIHN0cnVjdCB0bWlvX21tY19kYXRh
ICptbWQgPSBwZGV2LT5kZXYucGxhdGZvcm1fZGF0YTsNCj4gPiAgICAgICAgIGNvbnN0IHN0cnVj
dCByZW5lc2FzX3NkaGlfcXVpcmtzICpxdWlya3MgPSBOVUxMOw0KPiA+ICAgICAgICAgY29uc3Qg
c3RydWN0IHJlbmVzYXNfc2RoaV9vZl9kYXRhICpvZl9kYXRhOw0KPiA+ICsgICAgICAgY29uc3Qg
c3RydWN0IHJlbmVzYXNfc2RoaV9vZl9kYXRhX3dpdGhfcXVpcmtzICpvZl9kYXRhX3F1aXJrczsN
Cj4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCBzb2NfZGV2aWNlX2F0dHJpYnV0ZSAqYXR0cjsNCj4g
PiAgICAgICAgIHN0cnVjdCB0bWlvX21tY19kYXRhICptbWNfZGF0YTsNCj4gPiAgICAgICAgIHN0
cnVjdCB0bWlvX21tY19kbWEgKmRtYV9wcml2Ow0KPiA+IEBAIC05NjYsMTEgKzkzMSwxNCBAQCBp
bnQgcmVuZXNhc19zZGhpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+ID4g
ICAgICAgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gPiAgICAgICAgIHUxNiB2ZXI7DQo+ID4N
Cj4gPiAtICAgICAgIG9mX2RhdGEgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRl
dik7DQo+ID4gKyAgICAgICBvZl9kYXRhX3F1aXJrcyA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0
YSgmcGRldi0+ZGV2KTsNCj4gPiArICAgICAgIG9mX2RhdGEgPSBvZl9kYXRhX3F1aXJrcy0+b2Zf
ZGF0YTsNCj4gPg0KPiA+ICAgICAgICAgYXR0ciA9IHNvY19kZXZpY2VfbWF0Y2goc2RoaV9xdWly
a3NfbWF0Y2gpOw0KPiA+ICAgICAgICAgaWYgKGF0dHIpDQo+ID4gICAgICAgICAgICAgICAgIHF1
aXJrcyA9IGF0dHItPmRhdGE7DQo+ID4gKyAgICAgICBlbHNlDQo+ID4gKyAgICAgICAgICAgICAg
IHF1aXJrcyA9IG9mX2RhdGFfcXVpcmtzLT5xdWlya3M7DQo+IA0KPiBQbGVhc2UgZG8gbm90IHVz
ZSAiZWxzZSIgc3RhdGVtZW50cyBpbiBzb2NfZGV2aWNlX21hdGNoKCktYmFzZWQNCj4gcXVpcmsg
aGFuZGxpbmcsIGFzIHRoYXQgbWFrZXMgaXQgbGVzcyB0cml2aWFsIHRvIHJlbW92ZSB0aGUgcXVp
cmsNCj4gaGFuZGxpbmcgbGF0ZXIuDQo+IA0KPiBJLmUuIG1vdmUgInF1aXJrcyA9IG9mX2RhdGFf
cXVpcmtzLT5xdWlya3M7IiB1cCwgYmVmb3JlIHRoZSBjYWxsDQo+IHRvIHNvY19kZXZpY2VfbWF0
Y2goKS4NCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyBhbmQgc3VnZ2VzdGlvbiEgSSdsbCBm
aXggdGhpcy4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
