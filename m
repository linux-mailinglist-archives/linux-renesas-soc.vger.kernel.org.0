Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCE917910
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 14:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbfEHMH3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 08:07:29 -0400
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:51568
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727586AbfEHMH3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 08:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwfRWk3UX77pCwbEyaGtUbRu31xdA6dg7JIyEQaMkt8=;
 b=ZMHfBGue4dlg+7ZiEroru1KtRWbQyfYEOdZSckOunbQHWSYSG2jfPsWRMAHprJkVUxwylfE01zVLhc65J5G6kS/wIH5SwDE2uFl4SjL/92IYkHcBfqQC+SZ1hpaD1oX3A4gIZ0NOKEex1cmOAETa7KZwCCDWH32/xYqGG0T7qxc=
Received: from OSAPR01MB2177.jpnprd01.prod.outlook.com (52.134.236.16) by
 OSAPR01MB3265.jpnprd01.prod.outlook.com (52.134.249.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Wed, 8 May 2019 12:07:20 +0000
Received: from OSAPR01MB2177.jpnprd01.prod.outlook.com
 ([fe80::f1be:4f5b:e19e:6ba9]) by OSAPR01MB2177.jpnprd01.prod.outlook.com
 ([fe80::f1be:4f5b:e19e:6ba9%4]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 12:07:20 +0000
From:   Michael Dege <michael.dege@renesas.com>
To:     Marek Vasut <marek.vasut@gmail.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>
CC:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Gotthard Voellmeke <gotthard.voellmeke@renesas.com>,
        Adam Bass <Adam.Bass@renesas.com>,
        Bastian Farkas <bfarkas@de.adit-jv.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        "REE pahmann@de.adit-jv.com" <pahmann@de.adit-jv.com>,
        Simon Maleyka <smaleyka@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: RE: Automated/remote flashing of R-Car3
Thread-Topic: Automated/remote flashing of R-Car3
Thread-Index: AQHVBMFuEsbFu++OHkCHEOQt2/UfG6ZfpocAgAAp5ACAAAR6AIABS9uA
Date:   Wed, 8 May 2019 12:07:19 +0000
Message-ID: <OSAPR01MB217784EB4EED5552C1B7B68482320@OSAPR01MB2177.jpnprd01.prod.outlook.com>
References: <20190507104115.GA27355@vmlxhi-102.adit-jv.com>
 <79ae01fb-6945-05c5-a08d-92aaffeaa6f0@gmail.com>
 <20190507155308.GA1600@vmlxhi-102.adit-jv.com>
 <48af9a12-57d9-0279-581f-e81698b18adb@gmail.com>
In-Reply-To: <48af9a12-57d9-0279-581f-e81698b18adb@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=michael.dege@renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdbe2d25-a817-4a18-eb08-08d6d3adb8a8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB3265;
x-ms-traffictypediagnostic: OSAPR01MB3265:
x-ms-exchange-purlcount: 5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <OSAPR01MB3265A5072B658FF57FB6009182320@OSAPR01MB3265.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(366004)(376002)(396003)(346002)(136003)(189003)(51914003)(199004)(13464003)(71200400001)(53546011)(71190400001)(7416002)(33656002)(4326008)(14444005)(256004)(81166006)(7696005)(8676002)(81156014)(8936002)(99286004)(64756008)(6246003)(66476007)(66556008)(66446008)(73956011)(86362001)(76116006)(66946007)(74316002)(305945005)(7736002)(186003)(102836004)(6306002)(9686003)(55016002)(316002)(110136005)(54906003)(6436002)(3846002)(52536014)(6116002)(478600001)(2906002)(19627235002)(446003)(11346002)(476003)(229853002)(486006)(44832011)(5660300002)(76176011)(66066001)(68736007)(25786009)(966005)(14454004)(6506007)(53936002)(26005)(460985005)(16193025007);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3265;H:OSAPR01MB2177.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dBcrHmKW05PmG4/v6w7OW/yUnK9mAyWyCqxOmirTc+IrzcFpKt+pDG7DFSKbTBhR2fuFGiw/Pr1vowcjk22nqrDf1YOtVib9U5IHcKHlghxQbxYY2+w1Yj0Tl2UR7UY+ACSvPX5/mR1I1JM6hC1MqHS2EclTbrUSRvbHPDpb8VmPpNJo/pLnVVKahetvYvjAD1lJMEHZN2lzVZtusfpmQTm3UacDPpAP0DQb8qJwamc/+el0EJMTfgXeJLv1pIWhisMYz1G7PXk5W/3SSKbGRQaf8MLLLnc38Hykohkz6SeXDvCwhsYiZ8wNwpDzPlJnJp/TRmhkP1W9BnPPM846U79Qq12+m7IRAdCy1w4ZtHiAV5O1jl5rXdQ9WMHWN/cjXEOZSQ4pu3oVGO6+6mVDbirp6fTJ+Shi6YWq3OysNJM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbe2d25-a817-4a18-eb08-08d6d3adb8a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 12:07:19.8535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3265
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gTWFyZWsgYW5kIEV1Z2VuaXUsDQoNClJlZ2FyZGluZyB0aGUgSDNfTTNfU3RhcnRlcktp
dF9Db25maWd1cmF0b3IuZXhlDQoNCkkgYW0gbm90IGF3YXJlIGlmIHdlIGhhdmUgYW4gTkRBIHdp
dGggTWFyZWsuIEkga25vdyB5b3UgZG8gYSBsb3Qgb2Ygd29yayBmb3Igb3VyIHByb2R1Y3RzLCBi
dXQgSSBkb24ndCBrbm93IHVuZGVyIHdoaWNoIGNvbmRpdGlvbnMuIEkgbmVlZCB0byBiZSBzdXJl
LCB0aGF0IHRoZSBsZWdhbCBwcmVyZXF1aXNpdGVzIGFyZSBtZXQgYmVmb3JlIEkgY2FuIGdpdmUg
eW91IHRoZSB0b29sLg0KDQpSZWdhcmRpbmcgdGhlIHNvdXJjZXMgb2YgdGhlIEJpdHN0cmVhbTog
VGhlIHNvdXJjZXMgaGF2ZSBub3QgYmVlbiBzaGFyZWQgd2l0aCBhbnkgb2Ygb3VyIGN1c3RvbWVy
cyB0byBteSBrbm93bGVkZ2UuIFdlIGhhdmUgbWFkZSBzb21lIHNwZWNpYWwgdmVyc2lvbnMgKE1E
IHBpbiBjb25maWd1cmF0aW9ucykgb24gcmVxdWVzdC4NCg0KQmVzdCByZWdhcmRzLA0KDQpNaWNo
YWVsDQoNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTWFyZWsgVmFzdXQg
PG1hcmVrLnZhc3V0QGdtYWlsLmNvbT4NClNlbnQ6IERpZW5zdGFnLCA3LiBNYWkgMjAxOSAxODow
OQ0KVG86IFJFRSBlcm9zY2FAREUuQURJVC1KVi5DT00gPGVyb3NjYUBERS5BRElULUpWLkNPTT4N
CkNjOiBNYXJlayBWYXN1dCA8bWFyZWsudmFzdXQrcmVuZXNhc0BnbWFpbC5jb20+OyBLaWVyYW4g
QmluZ2hhbSA8a2llcmFuLmJpbmdoYW1AaWRlYXNvbmJvYXJkLmNvbT47IEtpZXJhbiBCaW5naGFt
IDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+OyB1LWJvb3RAbGlzdHMu
ZGVueC5kZTsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBNaWNoYWVsIERlZ2Ug
PG1pY2hhZWwuZGVnZUByZW5lc2FzLmNvbT47IEdvdHRoYXJkIFZvZWxsbWVrZSA8Z290dGhhcmQu
dm9lbGxtZWtlQHJlbmVzYXMuY29tPjsgQWRhbSBCYXNzIDxBZGFtLkJhc3NAcmVuZXNhcy5jb20+
OyBCYXN0aWFuIEZhcmthcyA8YmZhcmthc0BkZS5hZGl0LWp2LmNvbT47IFRvYmlhcyBGcmFuemVu
IDx0ZnJhbnplbkBkZS5hZGl0LWp2LmNvbT47IFJFRSBwYWhtYW5uQGRlLmFkaXQtanYuY29tIDxw
YWhtYW5uQGRlLmFkaXQtanYuY29tPjsgU2ltb24gTWFsZXlrYSA8c21hbGV5a2FAZGUuYWRpdC1q
di5jb20+OyBFdWdlbml1IFJvc2NhIDxyb3NjYWV1Z2VuaXVAZ21haWwuY29tPg0KU3ViamVjdDog
UmU6IEF1dG9tYXRlZC9yZW1vdGUgZmxhc2hpbmcgb2YgUi1DYXIzDQoNCk9uIDUvNy8xOSA1OjUz
IFBNLCBFdWdlbml1IFJvc2NhIHdyb3RlOg0KPiBIaSBNYXJlaywNCg0KSGksDQoNCj4gVGhhbmtz
IGZvciB0aGUgc3dpZnQgcmVwbHkgYW5kIGZvciB0aGUgdXNlZnVsIHJlZmVyZW5jZXMvbGlua3Mu
DQo+DQo+IE9uIFR1ZSwgTWF5IDA3LCAyMDE5IGF0IDAzOjIzOjEyUE0gKzAyMDAsIE1hcmVrIFZh
c3V0IHdyb3RlOg0KPj4gT24gNS83LzE5IDEyOjQxIFBNLCBFdWdlbml1IFJvc2NhIHdyb3RlOg0K
Pj4+IERlYXIgTWFyZWssIGRlYXIgS2llcmFuLA0KPj4NCj4+IEhpLA0KPj4NCj4+IFsuLi5dDQo+
Pg0KPj4+IDEuYyBVc2UgT3Blbk9DRA0KPj4+ICsgUHJlc3VtYWJseSBzYW1lIGFkdmFudGFnZXMg
YXMgdXNpbmcgYSBMYXV0ZXJiYWNoIEJhc2VkIG9uIEtpZXJhbidzDQo+Pj4gKyBodHRwczovL2dp
dGh1Yi5jb20va2JpbmdoYW0vcmVuZXNhcy1qdGFnDQo+Pj4gICBhbmQgb24gQWRhbSdzIGh0dHBz
Oi8vZ2l0aHViLmNvbS9udGZyZWFrL29wZW5vY2QvY29tbWl0LzFhZmVjNGY1NjEzOTINCj4+PiAg
IHRoZSBzb2x1dGlvbiBpcyBjdXJyZW50bHkgaW4gdXNlLg0KPj4+ID8gQW55IGlkZWFzIG9uIHRo
ZSBtb2RlbC9wcmljZSBvZiB0aGUgSlRBRyBhZGFwdGVyPw0KPj4NCj4+IEFueSBGVDIyMzJIICh0
aGUgSCBpcyBpbXBvcnRhbnQsIGR1ZSB0byBNUFNTRSkgd29ya3MuDQo+PiBJIGxpa2UgRmx5c3dh
dHRlcjIgZnJvbSBUaW5DYW5Ub29scy4NCj4+DQo+Pj4gPyBOb3QgdGVzdGVkLiBBbnkgcGF0Y2hl
cyBuZWVkZWQgb24gdG9wIG9mIHZhbmlsbGEgT3Blbk9DRD8NCj4+DQo+PiBodHRwOi8vb3Blbm9j
ZC56eWxpbi5jb20vNTE0OSBhbmQgcmVsYXRlZCBvbmVzLCBpdCBhZGRzIFJQQyBIRiBzdXBwb3J0
Lg0KPj4gSG93ZXZlciwgdGhlcmUgYXJlIHR3byBwcm9ibGVtcyB3aXRoIHRoaXM6DQo+PiAxKSBF
dmVuIHdpdGggYnVmZmVyZWQgd3JpdGUsIHRoZSBwcm9ncmFtbWluZyBpcyBzbG93DQo+PiAgICAt
IFRoaXMgY291bGQgYmUgaW1wcm92ZWQgYnkgcnVubmluZyBjb2RlIG9uIG9uZSBvZiB0aGUgR2Vu
MyBDUFVzDQo+PiAgICAgIGluc3RlYWQgb2Ygd2hhY2tpbmcgcmVnaXN0ZXJzIHZpYSBKVEFHIGFk
YXB0ZXIuIEkgYmVsaWV2ZSB0aGF0J3MNCj4+ICAgICAgd2hhdCBsYXV0ZXJiYWNoIGFuZCBldmVy
eW9uZSBlbHNlIGRvZXMgdG9vLiBUaGUgZGF0YSB1cGxvYWQgdG8NCj4+ICAgICAgU1JBTS9EUkFN
IGlzIGZhc3QgdmlhIEpUQUcsIHJlZ2lzdGVyIElPIGlzIG5vdCBncmVhdC4NCj4+IDIpIExpZmVD
IGxvY2tzIHRoZSBSUEMgSEYgYWNjZXNzDQo+PiAgICAtIFRoaXMgaXMgYSBwcm9ibGVtLCBzaW5j
ZSB0aGUgSlRBRyBwcm9iZSBjYW5ub3QgYWNjZXNzIGl0IG9uY2UNCj4+ICAgICAgaXQncyBsb2Nr
ZWQuIFRoZXJlIG1pZ2h0IGJlIGEgd2F5IGFyb3VuZCBpdCwgYnV0IGl0J3MgcmF0aGVyDQo+PiAg
ICAgIG5hc3R5IC0tIHVzZSBib3VuZGFyeSBzY2FuIHRlc3QgbW9kZSB0byBlaXRoZXIgZmxpcCBN
RCBwaW5zIG9yDQo+PiAgICAgIGFjY2VzcyB0aGUgSEYgYnVzIGRpcmVjdGx5IGFuZCBiaXRiYW5n
IGF0IGxlYXN0IGVyYXNlIGNvbW1hbmQNCj4+ICAgICAgdG8gd2lwZSB0aGUgZmlyc3QgZmV3IHNl
Y3RvcnMsIHRoZW4gcmVzZXQgdGhlIENQVSBhbmQgaGF2ZSBpdA0KPj4gICAgICBkcm9wIHRvIFND
SUYgbG9hZGVyIG1vZGUsIHRoZW4gc3RvcCB0aGUgQ1BVIGFuZCByZXByb2dyYW0gdGhlDQo+PiAg
ICAgIEhGIChzaW5jZSB0aGUgU0NJRiBsb2FkZXIgcnVucyBpbiBFTDMgYW5kIGRvZXMgbm90IHRv
dWNoIHRoZQ0KPj4gICAgICBsaWZlYyBzZXR0aW5ncy4NCj4+DQo+PiBOZWl0aGVyIG9mIDEpIGFu
ZCAyKSBpcyBpbXBsZW1lbnRlZCwgYnV0IGNhbiBiZSBpbXBsZW1lbnRlZCBpZiB0aGVyZQ0KPj4g
aXMgaW50ZXJlc3QuDQo+DQo+IDEpIGxvb2tzIGxpa2UgYSBwZXJmb3JtYW5jZSBpc3N1ZSB0byBt
ZSAoc3Vib3B0aW1hbCBmbGFzaGluZyB0aW1lKS4NCj4gVG8gYmUgaG9uZXN0LCBJIGRvbid0IHRo
aW5rIHRoaXMgaXMgYSBkZWFsLWJyZWFrZXIsIGFzc3VtaW5nIHRoYXQNCj4gZXJhc2luZy9yZS13
cml0aW5nIHRoZSB3aG9sZSA2NE1pQiBIRiBkb2Vzbid0IGV4Y2VlZCB+MTAtMTVtaW4uDQo+IEl0
IGlzIGFsc28gbXkgdW5kZXJzdGFuZGluZyB0aGlzIGlzIHN1YmplY3Qgb2YgZnV0dXJlIG9wdGlt
aXphdGlvbi4NCg0KSXQgd2lsbCBoYXZlIHRvIGJlIG9wdGltaXplZCBmdXJ0aGVyLg0KDQo+IDIp
IGxvb2tzIGxpa2UgYSBmdW5jdGlvbmFsIGlzc3VlIChpbnN1ZmZpY2llbnQgcGVybWlzc2lvbiB0
bw0KPiB3cml0ZS1hY2Nlc3MgSEYpLiBUbyBtYWtlIHRoaW5ncyBjbGVhciwgY291bGQgeW91IHBs
ZWFzZSBzdHJlc3MgaWYNCj4gaHR0cDovL29wZW5vY2QuenlsaW4uY29tLzUxNDkgYWxyZWFkeSBh
bGxvd3MgdXBkYXRpbmcgQVRGL1UtQm9vdC9PUFRFRQ0KPiBvbiBIRiBvZiBSLUNhciBHZW4zIG9y
IGlzIGl0IHN0aWxsIGF3YWl0aW5nIHNvbWUgZml4ZXM/DQoNCllvdSBjYW4gcmVhZC93cml0ZS9l
cmFzZSB0aGUgSEYgd2l0aCBpdC4gSnVzdCBrZWVwIGluIG1pbmQgdGhlIEhGIGhhcyB0byBiZSB1
bmxvY2tlZC4NCg0KTWF5YmUgdGhlcmUgaXMgc29tZSBtYWdpYy9zZWN0cmV0IHdheSB0byB1bmxv
Y2sgdGhlIExpZmVDIFJQQyBhY2Nlc3MgcmVzdHJpY3Rpb24gdmlhIEpUQUcsIGJ1dCB3ZSBkb24n
dCBrbm93IGFib3V0IGl0Lg0KDQo+Pj4gMS5kLiBVc2UgQ1BMRCBDb25maWd1cmF0b3INCj4+PiAr
IEgzX00zX1N0YXJ0ZXJLaXRfQ29uZmlndXJhdG9yLmV4ZSBpcyBhIFdpbmRvd3MgdG9vbCBzaGlw
cGVkIGJ5DQo+Pj4gICBSZW5lc2FzLCBoZW5jZSByZWFkaWx5IGF2YWlsYWJsZSwgd2hpY2ggYWxs
b3dzIHRvIG1vZGlmeSB0aGUgTUQNCj4+PiAgIHBpbnMsIHRvIGNvbnZlbmllbnRseSBzd2l0Y2gg
YmV0d2VlbiBRU1BJL0h5cGVyZmxhc2gvU0NJRg0KPj4+ICAgYm9vdCBtb2RlIGZyb20gYSBHVUkN
Cj4+PiArIE1vc3Qgb2YgdGhlIGFkdmFudGFnZXMgcG9pbnRlZCBvdXQgYWJvdmUNCj4+PiAtIFVM
Q0Itb25seSBzb2x1dGlvbiAoaS5lLiBkb2VzIG5vdCBhcHBseSB0byBTYWx2YXRvci1YKQ0KPj4+
IC0gUmVxdWlyZXMgYSBXaW5kb3dzIGhvc3QNCj4+DQo+PiBXaGVyZSBjYW4gSSBvYnRhaW4gdGhp
cyBhbmQgYXJlIHRoZXJlIHNvdXJjZXMgLyBkb2N1bWVudGF0aW9uIGF2YWlsYWJsZT8NCj4NCj4g
SSBhbSBhYmxlIHRvIGZpbmQgYmVsb3cgcmVsYXRlZCBwYWNrYWdlIGZyZWVseSBhdmFpbGFibGU6
DQo+IGh0dHBzOi8vZWxpbnV4Lm9yZy9GaWxlOkgzX1N0YXJ0ZXJLaXRfQ1BMRF9VcGRhdGVfMjAx
OTA0MDguemlwDQo+DQo+IFVuZm9ydHVuYXRlbHksIGl0IGRvZXNuJ3QgaW5jbHVkZSBIM19NM19T
dGFydGVyS2l0X0NvbmZpZ3VyYXRvci5leGUuDQo+IFRoZSB1c2VyIHdobyB1cGxvYWRlZCB0aGUg
ZmlsZSBpcyBodHRwczovL2VsaW51eC5vcmcvVXNlcjpSZW5lc2FzSmEuDQo+IEFyZSB5b3UgYXdh
cmUgb2YgYW55IG1lc3NhZ2luZy9jb21tZW50aW5nIGZlYXR1cmUgb24gZWxpbnV4Lm9yZz8NCj4g
SWYgbm90LCBJIGhvcGUgTWljaGFlbCAoQ0MtZWQpIGNhbiBhbnN3ZXIgeW91ciBxdWVzdGlvbi4g
SG9wZWZ1bGx5IGhlDQo+IHNlZXMgdGhpcyBtZXNzYWdlLiBJZiBub3QsIEkgY2FuIGZvcndhcmQg
eW91ciBxdWVzdGlvbiB0byBoaW0gdmlhDQo+IG1hbnRpcy4NCg0KSXQgd291bGQgYmUgYWxzbyBp
bnRlcmVzdGluZyB0byBvYnRhaW4gdGhlIENQTEQgc291cmNlcyBhbmQgYmUgYWJsZSB0byBzeW50
aGVzaXNlIGN1c3RvbSBDUExEIGJpdHN0cmVhbXMgZm9yIGF1dG9tYXRlZCB0ZXN0aW5nLg0KDQot
LQ0KQmVzdCByZWdhcmRzLA0KTWFyZWsgVmFzdXQNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1
cm9wZSBHbWJILEdlc2NoYWVmdHNmdWVocmVyL1ByZXNpZGVudCA6IE9sYXYgU2NodWx0ZSwgU2l0
eiBkZXIgR2VzZWxsc2NoYWZ0L1JlZ2lzdGVyZWQgb2ZmaWNlOiBEdWVzc2VsZG9yZiwgQXJjYWRp
YXN0cmFzc2UgMTAsIDQwNDcyIER1ZXNzZWxkb3JmLCBHZXJtYW55LEhhbmRlbHNyZWdpc3Rlci9D
b21tZXJjaWFsIFJlZ2lzdGVyOiBEdWVzc2VsZG9yZiwgSFJCIDM3MDggVVN0LUlETnIuL1RheCBp
ZGVudGlmaWNhdGlvbiBuby46IERFIDExOTM1MzQwNiBXRUVFLVJlZy4tTnIuL1dFRUUgcmVnLiBu
by46IERFIDE0OTc4NjQ3DQo=
