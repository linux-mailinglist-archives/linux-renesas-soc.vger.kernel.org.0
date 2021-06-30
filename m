Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A668E3B80DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 12:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233959AbhF3KbJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 06:31:09 -0400
Received: from mail-eopbgr1400111.outbound.protection.outlook.com ([40.107.140.111]:51055
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229882AbhF3KbI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 06:31:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTsfei+55jD0AgHEOaGGlouu69tEBMUN0ChwhctTfQEnuNG/7GmSCz2Uhj6sb57DbzvzaYZ/IORHPdrwV63DmjHCv3Gm5+CNWrFYFWG9aP7NSzIJMqRKUbkfmJYg8ovQJ2bIIZCL2HzDQFyyVHnq4S42yBMXuIXzzyyU1N07CEJdZxjOdD9E5eT42Caz1UMbA7EIjsDCQM3phoVBvOl8fvGrtkGdmESTxg/PtwaZoep2IhSgf9yVRbDd7G2uZdG0/glTLKU2QQI/Pl3uR5KlLQvcpDKIRpeienc/uj+CPWQSr1B3qNexkFbaq6xgZnnzOvrFC9/S/j51GJbrAmSOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4RyJW5+1vCthKGehdcydDAGj34sMVycbgf1G2T51EU=;
 b=WaTceywhFOosgXwrcQQUcfuRZjp0noYf2vUfHiufD7SJcPN8ZTEdhTJZzeWvil3Mja9G3LdBPGwicJZhqdW5DGiqW4z5aTGknHrfp3QldtXS4fksHuaN1dTMEuQnJfG/NMLR3uy2DR4+MW0jcBNAHDhruP+p8YL9nkGyY9jA4WmKQenkLKQiplKgUgBHuspI0uai0XoNdt14ftrdxHoTthSoLBYJ9jDW1hKMG2oDAW6lRNhhxA2LHQt/JNlDOwGUdXZI+3iIeCuZuzYbXuiqUK/xaibIHoqx+op0BqCehFFxo0AhftY8GeA8M7dJTbcnhuwu+amAMwMwxy9F5gwmPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4RyJW5+1vCthKGehdcydDAGj34sMVycbgf1G2T51EU=;
 b=Mixh7iDrpU1Tz2sMGE4L0jumflMuGB5jZ9LC1ER1OnP1eFWW9lD/9VisvQRlZAei9XXonaBwP1PppXqtc3mqkfIqDN7H69bnFBJKmdTOEVMMg4XNWzPRu4muGBNdpjueUPFGAs4C0C3p1iiEECyjTC9jol+61ubwOobGtUwl+8A=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3891.jpnprd01.prod.outlook.com (2603:1096:604:5e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.22; Wed, 30 Jun
 2021 10:28:21 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4264.026; Wed, 30 Jun 2021
 10:28:21 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 07/11] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G2L phy bindings
Thread-Topic: [PATCH v3 07/11] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G2L phy bindings
Thread-Index: AQHXbYHhglWpoTGXsUeqWuHX3BdNeassSd4AgAAJk9A=
Date:   Wed, 30 Jun 2021 10:28:21 +0000
Message-ID: <OS0PR01MB59221A03F825931B778C9E1586019@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
 <20210630073013.22415-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdWbhY9i+WvV77LVNYhLBLQBVCojgEwM93A-pvFf9Eab1g@mail.gmail.com>
In-Reply-To: <CAMuHMdWbhY9i+WvV77LVNYhLBLQBVCojgEwM93A-pvFf9Eab1g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [86.139.31.53]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 122d3f0b-b7ac-471c-ed73-08d93bb1c8ba
x-ms-traffictypediagnostic: OSAPR01MB3891:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB3891AD7CDCD1E00C6DF2BD7886019@OSAPR01MB3891.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BAcwlgl+pL4yKNgn5f7sUIUyoYHSqsZBkTxEZe+EYYijR/XZc6GrzzykER0SogqQT8FhADbyg/jislxF8bP/ksd/EFGhNWbhHw/c3fXnjyfNuRG+jeUBqXVEDf2NG1KXKKg1krmiPyhr9w7nL4SjgTTIAnQQbnIpZx+PRmWE5ODBppUr4u1Qs4n/teAHN4cltPUgHHizLoFsNUE+9AI9uqwHLWlvKhjEs6edtyBGrPi+2ofB6wYKd55exfibYm6OuHwOJDNbE0sPxywENprduZui2QI2i4G9kSjKXrOcqCGBByZDuTDt3AqBwzaHFa5qfrmnqeBM5J3/0/FUaE6ycB0dHAmV5/O8ySbr0fpol0Qg4k0sSakne3vckOtux27dXXmmYdrZYu3Qf2Cf3Nl9Vx2Y89J6tWeadzVoC4irCCs6e0Bxq8aG0QL/MpAQWuJduIHxKxEIq13TRznPKwSbTPxBbe42ZhY5KKK/dUNRTr/wChYO4BNcPm6b2IlyYxwhc02KiDrw3fxdZtm6qLV559uirWNcuecfAAHwjpO9Jo5ycCH5qWjjmHCVT5gqqWZuLRi5XkcNAJii9r4+PTubUvccaL+ToC1uy/7Xj28ccqmnPzobAhG1Oiz6z+PgoDTf/mCSOvtH6zbih2So18sSxA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(71200400001)(478600001)(66556008)(66946007)(64756008)(66476007)(66446008)(52536014)(76116006)(5660300002)(33656002)(122000001)(6916009)(38100700002)(86362001)(54906003)(316002)(8676002)(4326008)(6506007)(53546011)(8936002)(55016002)(9686003)(186003)(2906002)(26005)(7696005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjhDdHdOTFNJMmZzaUl0Yy9rWWxDVnc1MFIrTWkyaDJ1NXh3Z0t3eHgxSUky?=
 =?utf-8?B?OGNrV2ZrYzBJR1N4SkQvQjcwM1F4RW1xeTYxTEZQNTVFL2pQRnQyNFZXVHNF?=
 =?utf-8?B?ZWZPRFRBeHJjZUNFRlRLVENHZ0g4MEZibnJzRE9pNVlHTFRNV0VQd1c5VTlm?=
 =?utf-8?B?Ui82SkV4c2VwYjdtRDA2d1lmMDlsZWNhN3JGbFhSWTJHbkpUbjd5RStRVk1F?=
 =?utf-8?B?bUsvOFVxcmg1d1RmcVNtc3ZUMWZXV0htZjZDZ0hsWlg0RWpvTFRKRHlMNUhz?=
 =?utf-8?B?cGxpeExkdUNtSFdwSis2Rk1LUllEUzV4SXZNNHFpYi9iYWUrdmZUQ2JVREVL?=
 =?utf-8?B?NlZhc05RK1c5c0hydSthR0xFNFlybElIdUN2QnhlSUIwTzJDTlQ4RnFPRGFD?=
 =?utf-8?B?VmV2NHZqSWJoLzQ1dlZQMS9RWEZKUlJPVUZGNWJ3b090TGJ2V3M4TGkzcmo5?=
 =?utf-8?B?RkxzcFhUNjFUYmxJd0NmNytCRVhYdFYyNDc4QVRuZHV4emJqaGFlZlBMeW4y?=
 =?utf-8?B?SW4rNE5wby8rSGNxNVpIR0xwOUU3RFE2NkU5UkdTQTJ3UW9IK2RyQnFpSC9m?=
 =?utf-8?B?ZS9WcHZwYWJGL0pHUHd1c3FiRythSy9DcWRoY3NuQnBRSkFqdHFCcmFNcHVG?=
 =?utf-8?B?NmVJNGhWaWZrZEhRVW9VWStVd2laUkUzK2Vkcmd3ZGgvcEpoSVJMcWFmaE5C?=
 =?utf-8?B?a1prcWtwZUtia2M2VW9ETHdqKzdvQmc3R0pLbnBSTE1CVFlTV0pBUWVYck1Z?=
 =?utf-8?B?cGwrSUgvU3h6L0pyQkpZZXgxckFQU2UrNGRvbXJ6MUQxU0FOQW5TUGs2NUd5?=
 =?utf-8?B?SWtOM0lESEpXVlR3aFFVUkEvUEVqWjdOcEJieGNzeWcwL2FKVXBBN052Z3Yw?=
 =?utf-8?B?YXJWQlZudVFJeVZVRDNabFduM0VLZmZBdktzNWt3bXdtUk9lc09RTGVJMnox?=
 =?utf-8?B?QjRMN2lGNVVKMG5MVFZpL0lGN3JxblFqSmtBWEVqZHA4QlJLcFNYaHZackZ6?=
 =?utf-8?B?cmlrbjd2VlozOVppQUFZZjBNakJxa28yS1RTRWdrRUFvYjRKZVhzVE1CdkQ4?=
 =?utf-8?B?eThuaVZxcHJ6Y2ZDLzllck1FS1I1blpjTy9WL3NsV0lOSkFydEt6WHVRSW5l?=
 =?utf-8?B?c3YxQ2VwYjRMeGdnSUtQKzhBU2ljUnFDdmMrZkNKU1U3V3VxWHEwZThvbXNm?=
 =?utf-8?B?SmVhSXJhS1FuSUYza3BPVS9jUWd5TTN1bkNadTVLUDB2ZVNsUWplWlBJclU4?=
 =?utf-8?B?ckFDM1NYWGdlak45OW5jVU1jT0dQTTdzQzQ1Y05zLytKOTZjanNuSjNYT2lt?=
 =?utf-8?B?ZFNXR0F3MFllYzYvN3FrMys1T0YxTzc0MTcwYWt5M3VVczFxcXRIWCs3LzJx?=
 =?utf-8?B?Snl2eTVDK2s3Yms1eHJOOXhYTVpOQnR3dUllaFVYVGIwV0FZR011R3U5c1Q1?=
 =?utf-8?B?emdUTkVONmVzSUtxYWtCeUdja3BEcTEvTFkyai93MG5FdW52aFVwalV5YjJ1?=
 =?utf-8?B?WTFUZkxIcWQzTVYxRlcrMXVmZmkwZzJpV3VjSG14MXZsUjFBcU82dnQ0Y3Br?=
 =?utf-8?B?OXdvMTZ5dktRMkVubGR2YldabVdPSUpISmhXeGZBZnFrMEZoMU9BTnR5RTcr?=
 =?utf-8?B?T0drSHA5Q3cyWTh5K0txMDBSSnU1bTlWd2lhTzVpd3VQTDZLczF0UGZHcEpy?=
 =?utf-8?B?Z1JkT3RmVTcxNnljU1JydkNSbE5NR0UxZVlwYmtsN1YxNmlUUmM3UGVFQ0dO?=
 =?utf-8?Q?Vh9s35U/cdXhi/KGcw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122d3f0b-b7ac-471c-ed73-08d93bb1c8ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2021 10:28:21.1355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VNDmQSxDGjIoox2IDmRHoRxA0j63M+7W91gAhUK2DdlXK2WERY6MUlXduEjubmhvFY30jswHUYDyMQA8pl7WnESWlsw/H4C8+4+o8M/dlKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3891
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMDcvMTFdIGR0LWJpbmRpbmdzOiBwaHk6IHJlbmVzYXMsdXNiMi1waHk6IERvY3Vt
ZW50DQo+IFJaL0cyTCBwaHkgYmluZGluZ3MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiBPbiBXZWQsIEp1biAzMCwgMjAyMSBhdCA5OjMxIEFNIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gRG9jdW1l
bnQgVVNCIHBoeSBiaW5kaW5ncyBmb3IgUlovRzJMIFNvQy4NCj4gPg0KPiA+IFJaL0cyTCBVU0Iy
LjAgcGh5IHVzZXMgbGluZSBjdHJsIHJlZ2lzdGVyIGZvciBPVEdfSUQgcGluIGNoYW5nZXMuDQo+
ID4gQXBhcnQgZnJvbSB0aGlzIGl0IHVzZXMgYSBkaWZmZXJlbnQgT1RHLUJDIGludGVycnVwdCBi
aXQgZm9yIGRldmljZQ0KPiByZWNvZ25pdGlvbi4NCj4gDQo+IE5vdGhpbmcgYWJvdXQgcmVzZXRz
PyBCdXQgc2VlIGJlbG93Li4uDQoNCkluaXRpYWxseSB0aGUgcmVzZXQgb2YgVVNCL1BIWSBwb3J0
IGlzIGluIGFzc2VydGVkIHN0YXRlLiBTbyB3ZSBuZWVkDQp0byBwZXJmb3JtIGEgcmVsZWFzZSBy
ZXNldCB1c2luZyBVU0JQSFkgY29udHJvbCBJUC4gDQoNCk9LLCB3aWxsIGFkZCB0aGlzIGluIFY0
Lg0KDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIu
bWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjItPnYzDQo+ID4g
ICogQ3JlYXRlZCBhIG5ldyBjb21wYXRpYmxlIGZvciBSWi9HMkwgYXMgcGVyIEdlZXJ0J3Mgc3Vn
Z2VzdGlvbi4NCj4gPiAgKiBBZGRlZCByZXNldHMgcmVxdWlyZWQgcHJvcGVydGllcyBmb3IgUlov
RzJMIFNvQy4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3BoeS9yZW5lc2FzLHVzYjItcGh5
LnlhbWwgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTggaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9yZW5lc2FzLHVzYjItcGh5LnlhbWwNCj4gPiBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcmVuZXNhcyx1c2IyLXBoeS55
YW1sDQo+ID4gaW5kZXggZDVkYzVhM2NkY2ViLi5hN2U1ODVmZjI4ZGMgMTAwNjQ0DQo+ID4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9yZW5lc2FzLHVzYjItcGh5
LnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3Jl
bmVzYXMsdXNiMi1waHkueWFtbA0KPiA+IEBAIC0zMCw2ICszMCw5IEBAIHByb3BlcnRpZXM6DQo+
ID4gICAgICAgICAgICAgICAgLSByZW5lc2FzLHVzYjItcGh5LXI4YTc3OTk1ICMgUi1DYXIgRDMN
Cj4gPiAgICAgICAgICAgIC0gY29uc3Q6IHJlbmVzYXMscmNhci1nZW4zLXVzYjItcGh5DQo+ID4N
Cj4gPiArICAgICAgLSBpdGVtczoNCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHJlbmVzYXMsdXNi
Mi1waHktcjlhMDdnMDQ0ICMgUlovRzJ7TCxMQ30NCj4gPiArDQo+ID4gICAgcmVnOg0KPiA+ICAg
ICAgbWF4SXRlbXM6IDENCj4gPg0KPiA+IEBAIC05MSw2ICs5NCwyMSBAQCByZXF1aXJlZDoNCj4g
PiAgICAtIGNsb2Nrcw0KPiA+ICAgIC0gJyNwaHktY2VsbHMnDQo+ID4NCj4gPiArYWxsT2Y6DQo+
ID4gKyAgLSBpZjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjb21wYXRp
YmxlOg0KPiA+ICsgICAgICAgICAgY29udGFpbnM6DQo+ID4gKyAgICAgICAgICAgIGNvbnN0OiBy
ZW5lc2FzLHVzYjItcGh5LXI5YTA3ZzA0NA0KPiA+ICsgICAgdGhlbjoNCj4gPiArICAgICAgcHJv
cGVydGllczoNCj4gPiArICAgICAgICByZXNldHM6DQo+ID4gKyAgICAgICAgICBpdGVtczoNCj4g
PiArICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjogVVNCIHBoeSByZXNldA0KPiA+ICsgICAgICAg
ICAgICAtIGRlc2NyaXB0aW9uOiByZXNldCBvZiBVU0IgMi4wIGhvc3Qgc2lkZQ0KPiANCj4gRG8g
eW91IG5lZWQgdGhlIHNlY29uZCByZXNldD8NCj4gTG9va2luZyBhdCB5b3VyIC5kdHNpIHBhdGNo
LCB0aGUgc2Vjb25kIHJlc2V0IGlzIHNoYXJlZCB3aXRoIGVoY2kvb2hjaSwgc28NCj4gcGVyaGFw
cyBpdCBtYWtlcyBzZW5zZSB0byBkcm9wIGl0IGZyb20gdGhlIHBoeSBub2RlPw0KDQpPSy4gQWdy
ZWVkIHdpbGwgZHJvcCB0aGUgc2Vjb25kIHJlc2V0IGZyb20gcGh5IG5vZGUuDQoNCkNoZWVycywN
CkJpanUNCg0KPiANCj4gPiArICAgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgICAgLSByZXNldHMN
Cj4gPiArDQo+ID4gIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+DQo+ID4gIGV4YW1w
bGVzOg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+
IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwg
bXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
