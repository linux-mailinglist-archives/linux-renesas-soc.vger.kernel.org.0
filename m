Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B673DEB9F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Aug 2021 13:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbhHCLRG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Aug 2021 07:17:06 -0400
Received: from mail-eopbgr1410137.outbound.protection.outlook.com ([40.107.141.137]:7632
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235289AbhHCLRF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Aug 2021 07:17:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnnOqnn1ts2avFFqnWYKLTHdc9nYBy84nWX0wLnUqG7SVj16JcTwNxzLmQkH+4ufjS37nOT38VQuy8dzRvkQHGpL1v2ViaeEn2RGFo2e4CTXFokfv5q/T2mTinEP9uJ8UxmW5AnjPabeZh9Od+J3I9Bhk6EEeOaTUbCTe1+oQswD8MBBEh0vVXPTgIlP3pZZ69lGNqIQWhD0mxwdyyyJtP0m6NvBFy8+4gy9f/1f7QNqswbPohwEZtKpG04FrVk4+cHTsTXQHRtw43RGdXTX0n3g3p7CFepOyP+B0BJsa3WoIVjkjBc6sWDuNmrIU1hswyznZFk8LOdeVp3FGBTcsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLG/ZUjyiMzP+Ec5f6cMkYksk1xTyOe4r/YDgth8/Sc=;
 b=m1P80YplLO2s7t+wal25a8F8LcSmERl6INI007RG0JeZDf4IHi3nlIPM4aA7IkCv3/wI27q+4apfFrbv1JVK4nttwDPpcPmjWphV2kojMSPWGgESIuexVUMyAzZnntj/NjlQfYEkPpkykYZyjPK4bld1xj0/JmmjE77QSF4tnpOco9iDRqPADWX+QZOU7Pc2EiYC1Lk6A298aH2I0R1FJAyk5vlu0wXCzzN0/b/xhx9O5iZIeT4ULo3YfcO/B/IzgotKWwJx3FqX7VNol/cwpJWxhKJVzUtKWFiGA2b7OcQL5aNLSS35hTvqIOzX7Hqg8pQXrEfQthC/DmSPfczVng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLG/ZUjyiMzP+Ec5f6cMkYksk1xTyOe4r/YDgth8/Sc=;
 b=UvFk4PYOHLuzV46TW/tSLleK/tMtrcVoiq/WfKbzyaVarsK1mXoMj1kP+VZr0p0vcIXQ4zNPzTqLcfHXxowprz/9CKbuj2CTVD+PfVwwlmrHaPs1TvhPyS6nhca4pSDGI/wYB+b0TtcrNoJtXQmWFu67DZOMhBQ4b5PVbeqdl70=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5340.jpnprd01.prod.outlook.com (2603:1096:404:803b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Tue, 3 Aug
 2021 11:16:54 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6%3]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 11:16:54 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Ulrich Hecht <uli@fpond.eu>, Wolfram Sang <wsa@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
Subject: RE: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Thread-Topic: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Thread-Index: AQHXSNlLLnK0MeXzxECYWiEeEguOWqtcHUuAgAQPPJCAAGH2AIABkOCw
Date:   Tue, 3 Aug 2021 11:16:53 +0000
Message-ID: <TY2PR01MB369245D958BD9EB77488CB43D8F09@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210514155318.16812-1-uli+renesas@fpond.eu>
 <YQQah2Q8qmQPEl7F@ninjato>
 <TY2PR01MB3692486033934E1C007EBF6AD8EF9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <821963380.577567.1627903098435@webmail.strato.com>
In-Reply-To: <821963380.577567.1627903098435@webmail.strato.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fpond.eu; dkim=none (message not signed)
 header.d=none;fpond.eu; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dcb01db-087e-4958-5b29-08d9567032f0
x-ms-traffictypediagnostic: TYAPR01MB5340:
x-microsoft-antispam-prvs: <TYAPR01MB534052FE6DF96FD0254F927CD8F09@TYAPR01MB5340.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XNMlkLne0up22A/ieXjsulfzRn25U7VkOHn35hL98JAyuHGRu64LGZj9Q0tXCMFgCNLBE+1Fly7vosM33jHKbCKGETTO0245LQp1ChndeOTOKM4fqRyuqFku1A9J/O+RPu7V9zdBBq/9M4paKe9bX+kSZigxtedeit0Ki9AT2XVOv+msZQ6JD/uU/TvPc0tXEw975B7kGTdIowsheZYyR6TBW6CSt5lMN2Ae838lflt4+u8gDJ4Vd8xoKFOIWovQZGk6w9Q/d89/YpcBJO1Ka++Yw6RR/R1O2ZlGLk/C72MVKSTU3PeHvnWJTNUv0JCAij8kOzaHwYQW0SM6rcgcUQGNDkrItKFsap59QsPP1g54JQWRa0vhqUr+c3RnXszcgc84JwslrPAhO6Y2ptqWRH/zuAnpMuFFqI4pruv960lcJLqqaFubhbJ4quUR0yrHtVm1k2PBcf69B+TSdJtxfO3spiuxpD4ORmkI1qM1Ao698JGl8UuHB9pVOlRSlPJDw8iu/jE6KbdHj653CQh7xcGcn9+8pxG8SfYtmCljC42pVbruY/GXE56oiMTYf4q9CIzOGP+y1jTYtMNBDqRv4gKzsUp41W/FeZSejyRRxt2h9zdFEDajY2yQAsL3g+hzbZjJqPAH8bnhzRz3kOpEqid4llXNSpvkMMIZ1+mCoCaTRnssAuxmiQyyKEaftZn6BbERjZpw042CBjooSpfi2Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(186003)(15650500001)(478600001)(5660300002)(9686003)(55016002)(71200400001)(52536014)(316002)(7696005)(86362001)(33656002)(110136005)(64756008)(66556008)(4326008)(2906002)(6506007)(122000001)(83380400001)(54906003)(8676002)(66946007)(38070700005)(8936002)(53546011)(76116006)(38100700002)(66446008)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkVLRjBnNW5xSW1vN2Y0TXZnM3hodnc2ZjFQdnJmTThkbDB5Q3lRb2dsKzI3?=
 =?utf-8?B?WmM4Z055VDJWaUdEbmJZdlpoZmRmbjZvc2FENitqQ0cvMGs4Mk13NDNFOXBs?=
 =?utf-8?B?ZFdva1k2dnNRMU1VeW5qMFdqSkpRMjhNbnFlMXRIcVhnQ25jQ0NEalhqRysv?=
 =?utf-8?B?ZTFGN2Nlck1yZnZXTjdjMjdwcmJ5ekpMa3NweUt3anZNdm5aNWRxZ1VUa2hV?=
 =?utf-8?B?OHlXNXdlZ0NIMFlOZTZZVm5PUngzTm5MVmdlenBuYkFrbnJOSWlMQlBvR1RG?=
 =?utf-8?B?OXhUMmswYkNKTGhSWlk1Ym44dE5Ud2tiaDViNEkwYU1XZ05KYjZOUnJnbSt5?=
 =?utf-8?B?emxLWGcyWlZkaWE5ZnRpaVEyOXZjVUFZN25mdjZaeWZEWDF0R09OK1JmU0sr?=
 =?utf-8?B?aTE3c1N1UmE0aXJPT1FLNUhhRVd3WmtGbGlDUUlrZWtrVnovQkJEUWNHY2Fk?=
 =?utf-8?B?d0YwM2VZQ01lRVJWRDc4MDh3VGJEaGxla2NYR2txbUNzT05YRi9zRWt3NUFG?=
 =?utf-8?B?WFp5Y0d4U2Y5VUFoUGZESDFvV3grM2M0NmJTbzRrNnhnZ0hERlVZcmZySFRD?=
 =?utf-8?B?ZEhZNjlxbWwyeXFBbUJ0aXM3NC9yeWU5czdraEFuUEhMelplTFFYNUFMbnly?=
 =?utf-8?B?Um5wOTJWOVN3Wm9qVFBFQ2dNY21hdjF3alY2M0VXRTVuZVZSVk5OU0h4YVRu?=
 =?utf-8?B?emdBazR4TVlkaHpxSE1lVWk1NWc1S3o1YURzUS9rU2hsaUlZT1VVTFQrZ3Zi?=
 =?utf-8?B?QUg3Zm8yd0FwYVNyb3psMDdOcUZENUkzUXNiTFVsNGxHNlFhTlg0WXU0WWJC?=
 =?utf-8?B?MlhZb0tDYWJEeEIwSWI2MGZPeXFZWW4xaHhCaDRHelpzL21zN3lvdEkvdEYx?=
 =?utf-8?B?YXg3ZDNxblM3TERhcElxaGo1TUtuVXpNaWVQSTB0dWRTa1owemhiTitMRVBL?=
 =?utf-8?B?NEt0WVVPSEhMZzB6YitUTS9MM3JmZGdzb1VXV2swSzdVeE5zVU1GOE1RNlJz?=
 =?utf-8?B?NkFMbWFIZ1FnVlFxWEhqRGxrUTZJTmlNYmg0WGNtOGdrSGNLZThLZnkzanAr?=
 =?utf-8?B?SU9NM0I0bURTQlF2R3ozV3RZakg2S05aSHQyclR3K01xblg5bnJ3clBGRS9y?=
 =?utf-8?B?eGNpVXpaeGF3N1N5UEtabURhMW1FaGowdWt2RzlUblhPVUJMdEQxR3hncUZE?=
 =?utf-8?B?Q3YwRTNFeGNqWldOVmdUZHcwT3k1Si9FU2JqeWZOZE1YQzdOd25UYkRYWXoz?=
 =?utf-8?B?cW95R0hXZHJuaDlEd3RlL1poZHdqK01uWE5kOTEwVERUYnVKbDhOYWFFQUk2?=
 =?utf-8?B?Q2pzck1vVU9QbjlsZDhEOXJ2eXNpMjZ4Q0lkVVhkLzYzTVRGQmtYR3RFcHQ1?=
 =?utf-8?B?WEtYS2FYTjR0Mld3MGVCWTR4Wkl4ZXk3UW9RdERDd0I0ZFNVTzRBZllRL3BU?=
 =?utf-8?B?STNXaUU5eXZHT1hkbTVTZzNPMTFzNi80eFdMWEI2YzEwcTdHamZNanY1dzIx?=
 =?utf-8?B?czhCOWxGbmdjdnNUdlBvR3ZuUmNmTmNVOUl0Z3lycGxpbVEybitnS3ViSWVo?=
 =?utf-8?B?eVlzd0FGdzN3SkpvYmxMT2NiKzNQRU9pbUtkVlhCM0hpZHhzTHVGWExHeVRL?=
 =?utf-8?B?Tm1FbzN0VTh5alFKWGswcTRsR2NqdmVpbTdYTGRDVFJkWDkyeDVTcnRnWjJG?=
 =?utf-8?B?c3ExVXlraStxNlhUY2hjRi9VSHhKS0ZlN0wzWGpTVWUrVHNlSENyR3pTckxk?=
 =?utf-8?B?eHdpVHJqZDJaZmt3Mk1pQVBucG90K3ZzRjZOUy9sNzZzWFVyVGNEdGFaN1pJ?=
 =?utf-8?Q?XeM0ST4z4C8jmA8q9sqS3g4jkgeased1G0DJk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcb01db-087e-4958-5b29-08d9567032f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2021 11:16:53.9175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AUnfLotmWefXnMZDWGVhxLN/1sXXtePKiPW++Tsh+TIxbwbakejzeIs+OZ9ouRFS+3z0IRmzlhB1eR2TD3l0CUIaY4UYDsI7NHhlx1f8GrKAcYx7dTnKt/q/KN1HG6tJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5340
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgVWxyaWNoLXNhbiwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzIQ0KDQo+IEZyb206
IFVscmljaCBIZWNodCwgU2VudDogTW9uZGF5LCBBdWd1c3QgMiwgMjAyMSA4OjE4IFBNDQo+IA0K
PiA+IE9uIDA4LzAyLzIwMjEgNzozNCBBTSBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNo
aW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBIaSBXb2xmcmFtLXNh
biwgVWxyaWNoLXNhbiwNCj4gPg0KPiA+ID4gRnJvbTogV29sZnJhbSBTYW5nLCBTZW50OiBTYXR1
cmRheSwgSnVseSAzMSwgMjAyMSAxMjoyOCBBTQ0KPiA+ID4NCj4gPiA+IE9uIEZyaSwgTWF5IDE0
LCAyMDIxIGF0IDA1OjUzOjE4UE0gKzAyMDAsIFVscmljaCBIZWNodCB3cm90ZToNCj4gPiA+ID4g
VGhlIFRNSU8gY29yZSBzZXRzIGEgdmVyeSBsb3cgbGF0ZW5jeSBsaW1pdCAoMTAwIHVzKSwgYnV0
IHdoZW4gdXNpbmcgUi1DYXINCj4gPiA+ID4gU0RISSBob3N0cyB3aXRoIFNEIGNhcmRzLCBJIGhh
dmUgb2JzZXJ2ZWQgdHlwaWNhbCBsYXRlbmNpZXMgb2YgYXJvdW5kIDIwLTMwDQo+ID4gPiA+IG1z
LiBUaGlzIHByZXZlbnRzIHJ1bnRpbWUgUE0gZnJvbSB3b3JraW5nIHByb3Blcmx5LCBhbmQgdGhl
IGRldmljZXMgcmVtYWluDQo+ID4gPiA+IG9uIGNvbnRpbnVvdXNseS4NCj4gPiA+ID4NCj4gPiA+
ID4gVGhpcyBwYXRjaCBzZXRzIHRoZSBkZWZhdWx0IGxhdGVuY3kgbGltaXQgdG8gMTAwIG1zIHRv
IGF2b2lkIHRoYXQuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFVscmljaCBIZWNo
dCA8dWxpK3JlbmVzYXNAZnBvbmQuZXU+DQo+ID4gPg0KPiA+ID4gQWRkaW5nIFNoaW1vZGEtc2Fu
IHRvIENDLg0KPiA+ID4NCj4gPiA+IFNoaW1vZGEtc2FuOiBjYW4geW91IGtpbmRseSBydW4geW91
ciBTREhJIHRlc3RzIHdpdGggdGhpcyBwYXRjaCBhcHBsaWVkPw0KPiA+DQo+ID4gU3VyZSENCj4g
Pg0KPiA+IEhvd2V2ZXIsIEkgaGF2ZSBhIHF1ZXN0aW9uIGFib3V0IHRoaXMgcGF0Y2guDQo+ID4g
V291bGQgeW91IGtub3cgaG93IHRvIG1lYXN1cmUgdGhlIGxhdGVuY2llcz8NCj4gDQo+IElJUkMg
SSBzaW1wbHkgcHV0IGEgcHJpbnRrKCkgaW4gZGVmYXVsdF9zdXNwZW5kX29rKCkgdGhhdCBkdW1w
cyB0ZC0+c3VzcGVuZF9sYXRlbmN5X25zIGFuZCB0ZC0+cmVzdW1lX2xhdGVuY3lfbnMuDQoNClRo
YW5rcyEgSSBjb3VsZCBnZXQgdGhlIGxhdGVuY2llcy4NCg0KPiA+IEkgZW5hYmxlZCBmdW5jdGlv
biB0cmFjZSBvZiBycG0gYW5kIGNoZWNrZWQgdGhlIGxvZywgYnV0IEkgY291bGQgbm90IG9ic2Vy
dmUNCj4gPiBhbnkgYmVoYXZpb3IgY2hhbmdlcyB3aXRoIGFuZCB3aXRob3V0IGFwcGx5aW5nIHRo
aXMgcGF0Y2guDQo+IA0KPiBTbyB5b3UgYXJlIHNheWluZyB0aGF0IGZvciB5b3UsIHRoZSBjbG9j
ayBpcyBzdXNwZW5kZWQgYXMgZXhwZWN0ZWQgd2hlbiByZW1vdmluZyB0aGUgY2FyZCwgZXZlbiB3
aXRob3V0IHRoaXMgcGF0Y2g/DQo+IElmIHNvLCBJIHdvbmRlciBpZiB0aGVyZSBhcmUgdmFyaWF0
aW9ucyBiZXR3ZWVuIGJvYXJkcy4uLg0KDQpJJ20gc29ycnksIEkgb25seSBvYnNlcnZlZCB0aGUg
dHJhY2UgbG9nLg0KQXMgV29sZnJhbS1zYW4gbWVudGlvbmVkIG9uIG90aGVyIGVtYWlsIHRocmVh
ZCwgSSBzaG91bGQgY2hlY2sgdGhlIGNsa19zdW1tYXJ5IHdoZXRoZXINCnRoZSBjbG9jayBpcyBl
bmFibGVkIG9yIG5vdC4NCg0KU28sIEknbGwgdGVzdCB0aGlzIHBhdGNoIHdpdGggbXkgdGVzdCBl
bnZpcm9ubWVudCB0b21vcnJvdy4NCg0KDQo+IENVDQo+IFVsaQ0K
