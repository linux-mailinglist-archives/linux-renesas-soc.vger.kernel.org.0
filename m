Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A37BC213920
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jul 2020 13:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgGCLKO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Jul 2020 07:10:14 -0400
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:41766
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725984AbgGCLKN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Jul 2020 07:10:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQRgjYC/SjS+35FdRCNBTMRPXQSLcsTtxtpXz2SeOKkogKn/gKk0rX1EtQoX1WPlUaJYTV/3kDAvnZHXUD1dT2e0Zfo7dS29z8jvkZHTHxBnQu4EVlpEE/D2OZvQYUkgcxgDkSxZCLtoaeKfHj1artiLQQVq7NFXPGcHuoyMFcaOdUFPTXfkh7vMc70XnGBJ/sJ2ywis1uvt/GqxsaQ522FG2jQFl76BCShO3/vrDrizan3tEFqL0o8/SXrXjBWz20cr1DJOiP5X916epBtC6eiYtRBFA7cd9yyNaFDINR/85LqU7i3JAsjfiufcnzmrqkfKi+SaZ26r0MbfJ12c4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxhPvI9JvE4eBnZncxGHdNMgZUootVfzp/9i8qmGL68=;
 b=LJjMMdOHx4nujYEfYCFD8X5cLmW3ngApZXpIxvDemJDPxkXr/90cO4LZPP0gEJj6Rmi0kelUiGU0Z+4fTtwEXVfMLj17hbijAC6JYCmwwRcFNrAjQ6xtcU3ZCx2EBn+9ziQdKICEA2Q55/aSF9D5TvykxAhFN7WxrnKMGJnN0s1OV3sRWSRuXDIVA1meK2+MBLVgoita/34FNTy3avcemjYjacqTBzkvj11xoCLnw+WRnebfcTO7AF9U/tsqUzROCyH6MFKg0cj3uYMNsmSWiZq2UzoceAs58xu319ScOhioqUX0gdnBGVhNdjOr3sMyDaf/IAdJ33P5NdArE0XwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxhPvI9JvE4eBnZncxGHdNMgZUootVfzp/9i8qmGL68=;
 b=q807hQjPDTtSmXui23N8O4L54RhblSUYz2G3NIznhJr52YQqQnE/CH/QwQBwKW8KmWE4tzniFTiygv0xn1GcbwEQBQsDczWp5PHPWHN63NXOHhZ1HIb4uyvtDR5OD+utZWadT88grx/0lq97TTT7xZlzwyLNXZVgZaYdClALAVU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB2958.jpnprd01.prod.outlook.com (2603:1096:404:85::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Fri, 3 Jul
 2020 11:10:10 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3153.021; Fri, 3 Jul 2020
 11:10:10 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>
Subject: RE: [PATCH/RFC v4 0/4] treewide: add regulator condition on
 _mmc_suspend()
Thread-Topic: [PATCH/RFC v4 0/4] treewide: add regulator condition on
 _mmc_suspend()
Thread-Index: AQHWS5y19quM5ast4UGUv60ketqPj6jqraUAgASyOtCAAB+QAIABq2kAgASPd0A=
Date:   Fri, 3 Jul 2020 11:10:09 +0000
Message-ID: <TY2PR01MB36922D383DD83EB2DE22F84FD86A0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU0OEA7seCDadrSsNYXHQJOuSRrm8O439PK_pf3NoLxsg@mail.gmail.com>
 <TY2PR01MB3692FBE296EC373130842219D86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdXh1Hh6H35Mp8hBJBykUucRNwxTmW+U9SHM+xhrcwasDA@mail.gmail.com>
 <CAMuHMdX93Q9WhKLqv_wNPzArbc68NcbVN8jJ9MDKxAcicpBQ5Q@mail.gmail.com>
In-Reply-To: <CAMuHMdX93Q9WhKLqv_wNPzArbc68NcbVN8jJ9MDKxAcicpBQ5Q@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6010dfe0-bfc5-413f-4b67-08d81f41a690
x-ms-traffictypediagnostic: TYAPR01MB2958:
x-microsoft-antispam-prvs: <TYAPR01MB2958D3FE2B50B2E3DD51B801D86A0@TYAPR01MB2958.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:449;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: awnY333zQxw+2p4mwa83lo6MXPcLzbrin7xGT43mTVAgNi2THn43oFkD5nZYeCaCqug6ylhTxRggkv68DODqPVkblwO9N6EpGzRWHZY2Sul/6ukYPmKvDcf1zjGfUsACpH4sQTrSLxNwOiM5t7Y6TAvhsFCxH74uFAPbV2n6XBzlKQLCdrDu0yBm1H3azfqz1xF5b6djJx8nQHUjKbt3kk8ZCuZTcHXeoCvBSl/8QFu8SrG/Xhr3GsEWz6FCEw3uSCsFETXKWrWPHDtLxPeGGWPKfubMGNPRjg274ImXfHlB1Lp2EDvW+UjWHanjzjSY7F+to+fQBVP4BfxdgB4gsirjb7zTmoiQc4uQFVKX4upJPb1Wrrl93eoOjAHGowpM/hJnRnpzGwx2HAPPLV9ZwQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(53546011)(186003)(66556008)(66946007)(966005)(55236004)(316002)(76116006)(6916009)(64756008)(4326008)(33656002)(9686003)(8676002)(66446008)(26005)(66476007)(71200400001)(8936002)(55016002)(478600001)(6506007)(83380400001)(5660300002)(2906002)(54906003)(86362001)(52536014)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: zbZriIX5bsViXhCPHHNZY38CrjHdomvU66+QK7NCNn5ff7YrYLata8Yznl1LWJfapbPuP1eV66aBlK0zRWH4aMtkHgDcvcN8am8s3Ec/YPerVcPjAfug+1/e3GgI9PnjC3PX+0LoENBTLwv6eEP9Gr8OlYMHvRPdl6GT7i1IBYZmCJ3BspVgyAsak7jemf3IcL62kRFhCnC2d+i32bqPr+tQ4ANB/wmfvw38o4fQVLlX+AzsRUhekk95mhrZRhabrDjefYBA6KQPTQshELaHNAc2XLwC+ZbNXjc9iVpjPVwhYp9H/vmmnI8urzAqKcu0Dtcdboa8cP/44J/njzbDxjskvfHJMdFxjpjY82jUhZae6IwuHqHpjHkO/H0thw7RAinfxDAs8ryuR9G8qrlPXOgPSJHmzgVsdgUGYzjqCsEy/OOoy+L/oklWpcrSGoCWXVnie23tYYD+tGeKsdGMhlM6mWhGdoYc7viIzey8xauT8L+l0WkqbNFUl2JZOWNP
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6010dfe0-bfc5-413f-4b67-08d81f41a690
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 11:10:09.8026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rZA0mO0UiDP3sNSUd0OhtCGgNVIWNcUoWAEtPMlNvFSkhEDnrBf7DoOQb4sLes+EaHOOaOe4MC2Z7F6zjqGmol0MLVFdaUDENzS6MfzynHwRcp1uFaRYHaLZFlnYve+/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2958
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgSnVuZSAzMCwgMjAyMCAxMDoxOSBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0KPiBP
biBNb24sIEp1biAyOSwgMjAyMCBhdCAxOjQ5IFBNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRA
bGludXgtbTY4ay5vcmc+IHdyb3RlOg0KPiA+IE9uIE1vbiwgSnVuIDI5LCAyMDIwIGF0IDEyOjA0
IFBNIFlvc2hpaGlybyBTaGltb2RhDQo+ID4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuLCBTZW50OiBGcmlk
YXksIEp1bmUgMjYsIDIwMjAgNzoxMyBQTQ0KPiA+ID4gPiBPbiBGcmksIEp1biAyNiwgMjAyMCBh
dCAxMTozMiBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA+ID4gPiA8eW9zaGloaXJvLnNoaW1vZGEu
dWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+IE5vdGUgdGhhdCB2NS44LXJjMiB3aXRo
IHI4YTc3OTUxLXNhbHZhdG9yLXhzIHNlZW1zIHRvIGNhdXNlIHBhbmljIGZyb20NCj4gPiA+ID4g
PiBQQ0kgZHJpdmVyIHdoZW4gdGhlIHN5c3RlbSBpcyBzdXNwZW5kZWQuIFNvLCBJIGRpc2FibGVk
IHRoZSBQQ0kNCj4gPiA+ID4gPiBkZXZpY2VzIHdoZW4gSSB0ZXN0ZWQgdGhpcyBwYXRjaCBzZXJp
ZXMuDQo+ID4gPiA+DQo+ID4gPiA+IERvZXMgdGhpcyBoYXBwZW4gd2l0aCBjdXJyZW50IHJlbmVz
YXMtZGV2ZWwgYW5kIHJlbmVzYXNfZGVmY29uZmlnPw0KPiA+ID4gPiAoaXQgZG9lc24ndCBmb3Ig
bWUpDQo+ID4gPg0KPiA+ID4gWWVzLiBJIGVuYWJsZWQgUE1fREVCVUcgYW5kIEUxMDAwRSB0aG91
Z2guDQo+ID4gPg0KPiA+ID4gPiBEbyB5b3UgaGF2ZSBhbnkgUENJZSBkZXZpY2VzIGF0dGFjaGVk
PyAoSSBoYXZlbid0KQ0KPiA+ID4NCj4gPiA+IFllcy4gKEludGVsIEV0aGVybmV0IGNhcmQgaXMg
Y29ubmVjdGVkIHRvIHRoZSBQQ0kgc2xvdC4pDQo+ID4gPg0KPiA+ID4gPCBteSBlbnZpcm9ubWVu
dCA+DQo+ID4gPiAtIHI4YTc3OTYxLXNhbHZhdG9yLXhzDQo+ID4gPiAtIHJlbmVzYXMtZGV2ZWwt
MjAyMC0wNi0yNi12NS44LXJjMg0KPiA+ID4gICsgcmVuZXNhc19kZWZjb25maWcgKyBQTV9ERUJV
RyArIEUxMDAwRQ0KPiA+ID4gLSBpbml0cmFtZnMNCj4gPg0KPiA+IERvZXNuJ3QgZmFpbCBmb3Ig
bWUgb24gUi1DYXIgSDMgRVMyLjAsIHNvIGl0IG5lZWRzIHRoZSBwcmVzZW5jZSBvZiBhDQo+ID4g
UENJZSBjYXJkLiAgVW5mb3J0dW5hdGVseSBJIGhhdmVuJ3QgYW55IChhZGRlZCB0byBzaG9wcGlu
ZyB3aXNobGlzdCkuDQo+IA0KPiBbLi4uXQ0KPiANCj4gPiBUaGUgZmFpbHVyZSBtb2RlIGxvb2tz
IGxpa2UgdGhlIFBDSSBjYXJkIGlzIGFjY2Vzc2VkIHdoaWxlIHRoZSBQQ0kgaG9zdA0KPiA+IGJy
aWRnZSBoYXMgYmVlbiBzdXNwZW5kZWQuDQo+IA0KPiBEb2VzICJbUEFUQ0ggdjFdIGRyaXZlciBj
b3JlOiBGaXggc3VzcGVuZC9yZXN1bWUgb3JkZXIgaXNzdWUgd2l0aA0KPiBkZWZlcnJlZCBwcm9i
ZSJbMV0gaGVscD8NCj4gDQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjAw
NjI1MDMyNDMwLjE1MjQ0Ny0xLXNhcmF2YW5ha0Bnb29nbGUuY29tLw0KDQpFdmVuIGlmIEkgYXBw
bGllZCB0aGlzIHBhdGNoLCB0aGUgaXNzdWUgc3RpbGwgaGFwcGVuZWQgdW5mb3J0dW5hdGVseS4N
Cg0KDQpCeSB0aGUgd2F5LCBJJ20gZ3Vlc3NpbmcgdGhlIGlzc3VlIGlzIHJlbGF0ZWQgdG8gbXkg
ZW52aXJvbm1lbnQgd2hpY2ggdXNlcyBCU1AncyBBVEYuDQpBY2NvcmRpbmcgdG8gdGhlIGNvbW1p
dCBsb2cgb2YgdXBzdHJlYW0gQVRGIFsxXSwgUENJZSBoYXJkd2FyZSBpcyBwb3NzaWJsZSB0byBj
YXVzZXMgU0Vycm9yLg0KVW5mb3J0dW5hdGVseSwgSSBjYW5ub3QgdHJ5IHRvIHVwZGF0ZSB0aGUg
ZmlybXdhcmUgZm9yIHNvbWUgcmVhc29ucyBub3cuLi4gSSdsbCBwcmVwYXJlDQp1cGRhdGVkIGZp
cm13YXJlIHNvbWVob3cuLi4NCg0KWzFdDQpodHRwczovL2dpdGh1Yi5jb20vQVJNLXNvZnR3YXJl
L2FybS10cnVzdGVkLWZpcm13YXJlL2NvbW1pdC8wOTY5Mzk3ZjI5NTYyMWFhMjZiM2QxNGI3NmRk
Mzk3ZDIyYmU1OGJmDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gR3J7
b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiAN
Cj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlv
bmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
