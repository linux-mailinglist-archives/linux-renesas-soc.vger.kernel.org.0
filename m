Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E697B3B002D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 11:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbhFVJ27 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 05:28:59 -0400
Received: from mail-eopbgr1410135.outbound.protection.outlook.com ([40.107.141.135]:64384
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229490AbhFVJ27 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 05:28:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2BYIswGjctIfkTEk0MLOjLdhbbIyjOq4NI26AsyoUnrzZU0xIDRuozkZd8Whkr+rvZr54XnOayyT1mDyib6BJheW0b9xLWOBvi1hmw8AP4LTRzDe/uPL6KqcaVSeKRwmYI4hrjyTEOJhs9e3/qtRaQVMvsnxipUeCiLYxVLwUGCUXYzsgJi21isn7iQulyU8RpTAZ7A4DUpsSF3e+JsALkbkbnKNMhIX7FxN3pLcAI42LHvapBET5NcigKSw/B1ENseyxFLCzZs6I/rN6rlPjLNBdGm2DsIrqDcjSuTJlC2fEQ886fycCyK9SpOL/oectOEDinRS33okclk1LBJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbC7fyv81Gi0VnGZAyX+i6y2XBxG9vSrRTvkHPJmd9M=;
 b=XTzJ3FJPbU5jZlBtqI5/ZvJpcKQh7t1eotIEb+a/+nwbF5RW179sTHLdqwInkGIFQ7w84AhUWV5W+z/5+ePh+xTV2EAr521dbwW0muFULaF4PIeNO2Uy/+TvFo64+nXqMCrzssqNRsFJKxYM/NvRKJRpiMsyVcPrx8xxG3eV7NSqrV3Z1gL8ryteySeJ2IgWxa5nn/aEXnrN+jBUscTYIXENc5yK8T9MJdseUdVaQexj0qjXiAQGIhKeXH2ZZM6nyXArHxQoe4mQnfknXEWSYZFhmA0SPsmG9MuoGMqh+HVn3CRG23ihcVRcav3Gc0BM/748Q/A6yM1JZglK+ZsLxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbC7fyv81Gi0VnGZAyX+i6y2XBxG9vSrRTvkHPJmd9M=;
 b=qneWuRv1dazl4Yu8LGx5WBtWt0Yy1mMcgM9sBaVLRWUrpCccGFP1lprjHTmsBXuSG/bZEnir9pLzT/LBWunhOH1XT0fap5XR6cnQv9xBnBMad4gfSZZMEQMYM4DNrpFHT42wD/tH/ERiSRYCX6E78+/WLikmKZEK4EwwrZiLItc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2531.jpnprd01.prod.outlook.com (2603:1096:603:3c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 09:26:41 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 09:26:41 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/7] dt-bindings: clk: r9a07g044-cpg: Update clock
 definitions
Thread-Topic: [PATCH 1/7] dt-bindings: clk: r9a07g044-cpg: Update clock
 definitions
Thread-Index: AQHXZCh/26TZFnVapkasoStZW/+B+aseoZsAgAEjxUA=
Date:   Tue, 22 Jun 2021 09:26:41 +0000
Message-ID: <OS0PR01MB5922B821B3893BAD08D2573A86099@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
 <20210618095823.19885-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXLrfU99sQCbwLFifqrV4B94pzGi_DWbBvpS4-Y=Z09RA@mail.gmail.com>
In-Reply-To: <CAMuHMdXLrfU99sQCbwLFifqrV4B94pzGi_DWbBvpS4-Y=Z09RA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8aae96c6-965c-49f4-5ccd-08d9355fd83e
x-ms-traffictypediagnostic: OSAPR01MB2531:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB253176C34C172F711BD5532486099@OSAPR01MB2531.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZRucJ0Fgfj69v3og4QnStZJoGOG6g+nqIV/7jQqe3ianrrz1i41s8GCrgJVssaiiBBsEliBJwMpvabCJlWXmzT8qTedazewn44f8SB3FzeIGyplVrfT9kYZYP2bHDGHJY7ZAR7gZTp33qJKdoNTeq5jsbNiMqxGYt3fOiB2+pSSnEmgSXjBa7yHIt3NtutO1t6PtF44XxaSzf1Hn78KnxjWOj4FYEbhNRWXh31SPT78l2s5JMBWnDcaJ1WQHGc8dE8n1ZL4daIgcHGr2d+ZYEeqqrZSNg+rksTwkIGa5Z/MCYfN8PmQI3EFv7DjMnbgZ+Txw+nN0I1DK6flXi93I4kWqn5XiM39N77ARrQWtwnmTW/iUryUGOBnKXupisn3PhLQXadpUNmNv+J4BoHbxLAt4ObwT/ZdFRZ3l+xjX0C8x+RrRL+CMmEyhJNxhyas8vUJDJobdUxhIEj030ok9n+JNWfqm+Od1gaYpRhJB78EGPxQMAlZ1XQvXHICl5LwZ6QbZZRiC2CsqrgD3Is9ASWza1hP5o95rWlCMd6AbMLesVgWZncaS7MN1KTFrOWW9QYeugiS5U4sO/3VUVCCluAq/k9vC/vzbWJme/16vQgo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(9686003)(86362001)(55016002)(54906003)(33656002)(316002)(83380400001)(122000001)(7696005)(66946007)(53546011)(76116006)(6916009)(38100700002)(66476007)(186003)(8936002)(66556008)(66446008)(478600001)(6506007)(64756008)(52536014)(26005)(4326008)(5660300002)(2906002)(8676002)(15650500001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RThXUWxIZFBpSmlNY1JyanJhZzJqQUhiMzJ4VXVpL2trTUtBYVAzUStXaFI1?=
 =?utf-8?B?YzZqZ3o2bUJEZkkrNjBIcmI4bWwvcGxoaTQ4ZS9WNHpNNTdXY0ZjaFoxSjk2?=
 =?utf-8?B?K1dPTEdaVmMreW42N2hWTW15UU1yUGp3Nnk2Q2w0eUVkK0ZXUUtSYnNkSWtt?=
 =?utf-8?B?TytoRW1ES045cm1MNXQ0aFgwU0loT3JkTXQ5bzJqWjlxRjJKdUlNczNxVDU2?=
 =?utf-8?B?WVNnUnAyL0JsUGs2cGxRM081dE9SOHdiRHN6UHFiNENYeHZRVGw5RDFka3pv?=
 =?utf-8?B?c2dMQ1lFUHByZ25MZ1dkT3VWR210SFdnanF3TVpBTm9URG5TaGVyWk5DcDNC?=
 =?utf-8?B?QVVwdHZadmVLTDhjTnRLTGRFTlhTL3dyK0R4eE5mSWE5N3JHellQK21oNC9n?=
 =?utf-8?B?NzlFMDFLaWVMS0plYlVFVGNXaWd2WUVrbG9sS0hpcDRONWVCZGYva01rbi9P?=
 =?utf-8?B?VW9ZSG1haE9IYmRHaHFiN09tMDhwMDFYTFdWSkRNdmRQblVRY29NTVdMOEhZ?=
 =?utf-8?B?TVpFN0k5ZnFsUThoMWZIWjdIWGRZRENrVmZXeE5VY0FiS3RWcUwwUlZkVUtO?=
 =?utf-8?B?OUFERTc4cGdUZ1RMOFc5Y1B3MlB3RlFYYklXUkpFYnRMcE1LQ1RTZ2U2YTkz?=
 =?utf-8?B?ZG1hK254bjR2YXFrY2lDQ3I5MW5ZVnRvMkZJT2o4bEZTMysyb3NRTW5wa3ZK?=
 =?utf-8?B?MGY0SVJrUVdjbno2Sm9vblVUQWpQa3FYbVNqZlhoQ2JvRENtU0xWSnZGRWZL?=
 =?utf-8?B?KzRqbDVrbG9pMmlGWXI5NU0xcCs2bFRPTklCRkZhMGVMTndvNGgrM3gwZjE5?=
 =?utf-8?B?MEZaMGduYWJNelZUZ2dwbHI2WU9JMkFrNmJGMVNiMDA3T0FyTE81S2lMVFBO?=
 =?utf-8?B?alZqS3JuUUVORUxDWnpRc2diTWdPRFZ5Zm9rQjJLamIrZTBqYjliS3laeHRr?=
 =?utf-8?B?bW1MRVg5MDRHOFcyQkRuYkpOM3NyY1VIM0VZWTgzZUU5a0Nwd0lUMGhYd0xp?=
 =?utf-8?B?U2JIcmk0a2xHdjcwcVRNaUcwN0FWT2NGUEVvcWxUMmc3Um11b3VoczlOblpW?=
 =?utf-8?B?aHNMOElPdGN6clZGV3hyWUtMUytoWm5pY1RMUUhTSXRmMUE0bUZRVkEzWnlj?=
 =?utf-8?B?RkJmKzF3MTE0RjFrU0dkVkZtRXJSVWhodU0yTnFwZUwyRS8xemVHS0pwdGZS?=
 =?utf-8?B?U0NleHkxeWttaDJtVVcyZEUzcE0vdHVnMmkvaTAzSldQVkNOS2h1SFNsY0dL?=
 =?utf-8?B?cWltTDVNUHQ1OGdZSytTRzZwa3JsSlB3V2xxR3BtTmxMU3oxSWdBd1pGMjlD?=
 =?utf-8?B?VU9neURDSlI5S0hFKzh4dEhQL20wRHd3VlB0L3RLVmFGZGNjM0E1K096Unll?=
 =?utf-8?B?TkFXUHhYYjJRMlhmaEVRQXVNbDZlclJZYjBXTWNlRW5odVVtT2lZWVhxREoy?=
 =?utf-8?B?bDFWMzkxcGhwSDBYcUI3L0E1b0U3bGtnOVhIYXA1YUVLbGVicWYyNlBOYnZR?=
 =?utf-8?B?Q0FMa1BkcTB6UVpvRkVpS0VDV0JENU5FdUVUbDFnTkxYMTFYeVVhTUw0Y2k1?=
 =?utf-8?B?VHRSZFVBTDJ2SVlURGI2eEZySEZtakV2Tkl2Vm5VVUt5Z1lIQ1JITnBBK0ta?=
 =?utf-8?B?blloZmhoZUlyWHc5cWszS1lsUkIveWoxdGl3cGpNaEVreG1zdDJmZmtCNXVr?=
 =?utf-8?B?OHBxakNPQVBHckZjT3NFc3dpd25iaWZHVTFndTZwRUZHQlVySTR0Si9ORXVu?=
 =?utf-8?Q?Ih76qpTu6FF4Fqv1+Py0aGHQyDE5w+Q4dAeIw9p?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aae96c6-965c-49f4-5ccd-08d9355fd83e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2021 09:26:41.4492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7G3PJAbFMtZAG4FD1Ab3k6jbicdKX9gEaUrGE4ztTMmQdDNnYMdQ3x2eXr5yTb65y0NN5LPu8y+UXZlrXSmqsew9nC/8ePE7UP6+xSM1ZZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2531
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS83XSBkdC1iaW5kaW5nczogY2xrOiByOWEwN2cwNDQtY3BnOiBVcGRhdGUgY2xvY2sN
Cj4gZGVmaW5pdGlvbnMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIEp1biAxOCwgMjAy
MSBhdCAxMTo1OCBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdy
b3RlOg0KPiA+IFVwZGF0ZSBjbG9jayBkZWZpbml0aW9ucyBhcyBwZXIgdGhlIFJaRzJMX2Nsb2Nr
X2xpc3QoUmV2LjAyKSBtYW51YWwuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9j
ay9yOWEwN2cwNDQtY3BnLmgNCj4gPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3I5
YTA3ZzA0NC1jcGcuaA0KPiANCj4gPiArI2RlZmluZSBSOUEwN0cwNDRfVVNCX1NDTEsgICAgICAg
ICAgICAgNzMNCj4gDQo+IEl0IGxvb2tzIGxpa2UgVVNCX1NDTEsgY2Fubm90IGJlIGdhdGVkLCBi
dXQgaXMgZHJpdmVuIGRpcmVjdGx5IGZyb20NCj4gT1NDQ0xLLCBzbyBJIHRoaW5rIGl0IHNob3Vs
ZCBiZSBsZWZ0IG91dCwgYW5kIHRoZSBEVFMgc2hvdWxkIGp1c3QNCj4gcmVmZXJlbmNlIFI5QTA3
RzA0NF9PU0NDTEsNCg0KT0suIEFncmVlZCwgd2lsbCByZW1vdmUgdGhpcy4NCg0KPiANCj4gPiAr
I2RlZmluZSBSOUEwN0cwNDRfRVRIMF9DTEtfQVhJICAgICAgICAgNzQNCj4gPiArI2RlZmluZSBS
OUEwN0cwNDRfRVRIMF9DTEtfQ0hJICAgICAgICAgNzUNCj4gPiArI2RlZmluZSBSOUEwN0cwNDRf
RVRIMF9SRUZDTEsgICAgICAgICAgNzYNCj4gPiArI2RlZmluZSBSOUEwN0cwNDRfRVRIMV9DTEtf
QVhJICAgICAgICAgNzcNCj4gPiArI2RlZmluZSBSOUEwN0cwNDRfRVRIMV9DTEtfQ0hJICAgICAg
ICAgNzgNCj4gPiArI2RlZmluZSBSOUEwN0cwNDRfRVRIMV9SRUZDTEsgICAgICAgICAgNzkNCj4g
DQo+IEFjY29yZGluZyB0byB0aGUgSGFyZHdhcmUgVXNlcidzIE1hbnVhbCwgRVRIMF9SRUZDTEsg
YW5kICBFVEgxX1JFRkNMSw0KPiBjYW5ub3QgYmUgZ2F0ZWQgKHNlZSB0aGUgbm90ZSBmb3IgQ1BH
X0NMS01PTl9FVEgpLCBzbyBJIHRoaW5rIGl0IHNob3VsZCBiZQ0KPiBsZWZ0IG91dCwgYW5kIHRo
ZSBEVFMgc2hvdWxkIGp1c3QgcmVmZXJlbmNlIFI5QTA3RzA0NF9DTEtfSFAuDQoNCk9LLiBBZ3Jl
ZWQuIFdpbGwgcmVtb3ZlIHRoaXMuDQo+IA0KPiBUaGUgcmVzdCBvZiB0aGUgY2xvY2tzIGxvb2sg
Z29vZCB0byBtZS4gIFNvbWUgYXJlIHN0aWxsIG1pc3NpbmcsIGJ1dCB0aGV5DQo+IGNhbiBiZSBh
ZGRlZCBsYXRlci4NCj4gDQo+IEkgZG8gdGhpbmsgd2UgbmVlZCBhIHNlcGFyYXRlIGxpc3Qgb2Yg
ZGVmaW5pdGlvbnMgZm9yIHJlc2V0cy4gIFdoaWxlDQo+IHNpbXBsZSBtb2R1bGVzIGxpa2UgU0NJ
RiBhbmQgSTJDIGhhdmUgYSBvbmUtdG8tb25lIG1hcHBpbmcgZnJvbSBjbG9jayBiaXRzDQo+IHRv
IHJlc2V0IGJpdHMgZm9yLCB0aGlzIGlzIG5vdCB0aGUgY2FzZSBmb3IgYWxsIG1vZHVsZXMuDQo+
IEUuZy4gU0RISSBoYXMgNCBjbG9ja3MgcGVyIGluc3RhbmNlLCBidXQgb25seSBhIHNpbmdsZSBy
ZXNldCBzaWduYWwgcGVyDQo+IGluc3RhbmNlLCB3aGlsZSBDQU5GRCBoYXMgYSBzaW5nbGUgY2xv
Y2ssIGJ1dCB0d28gcmVzZXQgc2lnbmFscy4NCg0KDQpPSywgQWdyZWVkLiBXZSB3aWxsIGxpc3Qg
c2VwYXJhdGUgZGVmaW5pdGlvbnMgZm9yIHJlc2V0cyBsaWtlLA0KDQojZGVmaW5lIFI5QTA3RzA0
NF9SU1RfU0RISTAJCVgxDQojZGVmaW5lIFI5QTA3RzA0NF9SU1RfU0RISTEJCVgyDQojZGVmaW5l
IFI5QTA3RzA0NF9SU1RfQ0FOCQlYMw0KDQpDbGsgZGVmaW5pdGlvbnMNCg0KCURFRl9NT0QoInNk
aGkwX2ltY2xrIiwJUjlBMDdHMDQ0X1NESEkwX0lNQ0xLLA0KCQkJCUNMS19TRDBfRElWNCwNCgkJ
CQkweDU1NCwgQklUKDApKSwNCglERUZfTU9EKCJzZGhpMF9pbWNsazIiLAlSOUEwN0cwNDRfU0RI
STBfSU1DTEsyLA0KCQkJCUNMS19TRDBfRElWNCwNCgkJCQkweDU1NCwgQklUKDEpKSwNCglERUZf
TU9EKCJzZGhpMF9jbGtfaHMiLAlSOUEwN0cwNDRfU0RISTBfQ0xLX0hTLA0KCQkJCVI5QTA3RzA0
NF9DTEtfU0QwLA0KCQkJCTB4NTU0LCBCSVQoMiksDQoJREVGX01PRCgic2RoaTBfYWNsayIsCVI5
QTA3RzA0NF9TREhJMF9BQ0xLLA0KCQkJCVI5QTA3RzA0NF9DTEtfUDEsDQoJCQkJMHg1NTQsIEJJ
VCgzKSksDQoNCg0KUmVzZXQgZGVmaW5pdGlvbnMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tDQoJREVG
X1JTVCgic2RoaTBfUlNUIiwJUjlBMDdHMDQ0X1JTVF9TREhJMCwNCgkJCQkweDg1NCwgQklUKDAp
KSwNCg0KDQpBbmQgRFRTIGluc3RhbnRpYXRlIGJvdGggcmVzZXQgYW5kIGNsb2NrIGVudHJpZXMu
DQoNCklzIGl0IG9rIHRvIHlvdT8gV2hhdCBpcyB5b3VyIHRob3VnaHRzIG9uIHRoaXM/DQoNClJl
Z2FyZHMsDQpCaWp1DQoNCg0KDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4g
LS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBt
NjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBw
ZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtl
IHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFs
ZHMNCg==
