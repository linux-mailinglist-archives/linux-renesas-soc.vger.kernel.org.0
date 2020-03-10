Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C204517EE57
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2020 03:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgCJCEB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Mar 2020 22:04:01 -0400
Received: from mail-eopbgr1400105.outbound.protection.outlook.com ([40.107.140.105]:61616
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726134AbgCJCEB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 22:04:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PT3PmI4EhiSXYiCMKZ/q5UmdCMjjFmmOytFIejK01DhyJIcSA0UCVHZQYKQOa5grZRFkXPyTIDoS+7IOax4Bp55ZLpVc0cPzjUEUVTKfpehkqQPN6553pyqp4wWzeonXCzgHvqmfi4VIbfh4SCq/8riFkoM19FxQ+UllFx4Syj5hCMVzdXlP7t02AS6i+5eCLiay80JtpfNwdI7Bys51aafWMEpznFGPmCYgvbwSroVdu1T7+6+SGvv6TH41xtF/hhTFJXr6b/XT1aKH5KUwAM6JKcyXcnRjhTodrTCLWBvXGhdY9cRoUTRmAFvYL/ebp0VoSqHhilvj4bWvTWMRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsysLVFpXzRzQwTmpFENVkCUd4ymD/BYmShxBv7OfAY=;
 b=iSg+hJ7krkAuqG5SPUPkvOdoWG6TgX9osRKfrPXD2s7ji+H5UUONOTQBhVjBPyaJC/+9GYXj0lqxNUEyahTeLIjKbmfsJmV58F049ypwPO3hZkN39TJ6mbfy5pITw7zOg5uIqmksgi1CVlTra0Ur6qH41AWqhfSWSXdnNcisAlSeodKg424HXfHyRnwM5vNhuEWZ/JCt9q6y5YXBnQlfryD4TP6j7aPBiCbtaFoxUKJ+ldumli4cJ5xJt4Lp10N0BhoWqWSny51wxnSJquQhZ5R1R5Vqx2TiE9mOqWLG49zGeEcUdIoz+5A+bed8XmWKQI3TSLVJ+eiysdSCK7wG7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsysLVFpXzRzQwTmpFENVkCUd4ymD/BYmShxBv7OfAY=;
 b=CON5LtlCFmB3f8zsSvlof9hF0FRXZC6tC7Zj1A0qQAzzXUNAmajELMA6w61UoHcnGYT6UP0niIS1FaU1HJY4ZOxwlyHstqi++P5cW5QoM3ASUaFiwK70q68WNw7UM7ZGLQcPqjXVzh7IhcSumZ3IX7D2aIMcHb3CjeEqN8E/Us8=
Received: from TYAPR01MB4799.jpnprd01.prod.outlook.com (20.179.175.143) by
 TYAPR01MB5088.jpnprd01.prod.outlook.com (20.179.174.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Tue, 10 Mar 2020 02:03:56 +0000
Received: from TYAPR01MB4799.jpnprd01.prod.outlook.com
 ([fe80::6531:c3bc:8602:8596]) by TYAPR01MB4799.jpnprd01.prod.outlook.com
 ([fe80::6531:c3bc:8602:8596%7]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 02:03:56 +0000
From:   YUYA HAMAMACHI <yuya.hamamachi.sx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] arm64: dts: renesas: Add support for M3ULCB with
 R-Car M3-W+
Thread-Topic: [PATCH 2/2] arm64: dts: renesas: Add support for M3ULCB with
 R-Car M3-W+
Thread-Index: AQHV9d7n7E/WftGCYEuaKrMhpVvB/KhAHFmAgADw2pA=
Date:   Tue, 10 Mar 2020 02:03:56 +0000
Message-ID: <TYAPR01MB47990F7228EA48455159F2F0BCFF0@TYAPR01MB4799.jpnprd01.prod.outlook.com>
References: <20200309064425.25437-1-yuya.hamamachi.sx@renesas.com>
 <20200309064425.25437-3-yuya.hamamachi.sx@renesas.com>
 <CAMuHMdVxAzHA1s0v7X=ne1ExAa54ef_iwVTcP=GgJgi98FOrpQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVxAzHA1s0v7X=ne1ExAa54ef_iwVTcP=GgJgi98FOrpQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yuya.hamamachi.sx@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3128cb08-7968-48f6-3e44-08d7c4974a56
x-ms-traffictypediagnostic: TYAPR01MB5088:
x-microsoft-antispam-prvs: <TYAPR01MB5088F24168507A6C965B85EFBCFF0@TYAPR01MB5088.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(199004)(189003)(186003)(4326008)(86362001)(76116006)(110136005)(71200400001)(66446008)(66476007)(55016002)(66556008)(478600001)(66946007)(64756008)(9686003)(8676002)(8936002)(316002)(26005)(7696005)(33656002)(6506007)(5660300002)(966005)(52536014)(81156014)(81166006)(53546011)(2906002)(32563001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB5088;H:TYAPR01MB4799.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OrwQ92S2ZYuFDd6124GCMSU8/G9avdJSoNr7uANGLS4U+xqkBMBL6QJg2aexwDY/Vu+VvQlZvRHEBzIlBqgaDhEMgwYuMlfoBvCKeoHtnUTI/fdji/ieOz7jzMlUPdhweKP/U8EIebpFPCQ7S8IhwclO3luJvehQOoirdqhINJQ9RrVrsqL+KDvk+4WKoCYAMc3DBzLnYt4vCDupdQ5UePRK51vhUELZq0kce17Q54SHs5/HR7FLXmdQHtFaS297rtEsZyo3IYHXOz0SYgPxLUeVnUzU4ZPj+VM+W/x2AMJqZlNtIX3vTSDwX9WelGHvPWK6I+R9JmjozIIcUOMcsu/AMLRPUyu95SJJq5MgqupFQDala1wlCsq93hH1WS0imFnM7Juz+A74YteDf7+1/uvf+ohEhqiiDkazsntqxvWq/6OatpbPLZ2UMGotd5FWJpT6eiV6O521gDx47tHtAqfhw2NbzPLuVuuEDbSiLB5gUI4s8lfcMh1Aq9UKScMMf+kDZyJ4pXCXbYRqzjM/WnK/7WPvVOLlb5IZsEHtyLzHSTnKaZQ5o9DzWRD0u7AB
x-ms-exchange-antispam-messagedata: bDoZsTku1wA1A86IbjyafTX52ZWXLoQ2LrB/Ck0xk/eSyvvCi71hUnKF9cqdZQI800CRd6kj7xb4OsYVB9nPrWmJYREldafysSYKmiFVjC4GfnZnHgCpwQiBYw3iCXrIv4G7I1uHxle1k/MMhM0LWQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3128cb08-7968-48f6-3e44-08d7c4974a56
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 02:03:56.0597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YLv5k8dtn1dTd+6tyZ5E3s4fvG1f7Che3XVhnooEo9tM+PQkQ6nze9NCcHiE8NyETkzC0FOvViXl2GcZo5q5sKLs92fsCY7GLjbtkM3RUmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5088
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8sDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4NCj4gU2VudDogTW9uZGF5LCBNYXJjaCA5LCAyMDIwIDg6MTYgUE0NCj4gVG86IFlVWUEgSEFN
QU1BQ0hJIDx5dXlhLmhhbWFtYWNoaS5zeEByZW5lc2FzLmNvbT4NCj4gQ2M6IExpbnV4LVJlbmVz
YXMgPGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAyLzJdIGFybTY0OiBkdHM6IHJlbmVzYXM6IEFkZCBzdXBwb3J0IGZvciBNM1VMQ0Igd2l0
aA0KPiBSLUNhciBNMy1XKw0KPiANCj4gSGkgSGFtYW1hY2hpLXNhbiwNCj4gDQo+IE9uIE1vbiwg
TWFyIDksIDIwMjAgYXQgNzo0OSBBTSBZdXlhIEhhbWFtYWNoaQ0KPiA8eXV5YS5oYW1hbWFjaGku
c3hAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBS
ZW5lc2FzIE0zVUxDQiBib2FyZCBlcXVpcHBlZCB3aXRoIGFuDQo+ID4gUi1DYXINCj4gPiBNMy1X
KyBTaVAgd2l0aCA4ICgyIHggNCkgR2lCIG9mIFJBTS4NCj4gPiBUbyBhdm9pZCBidWlsZCBlcnJv
ciBvbiAndWxjYi5kdHNpJywgc3NpMiBpcyBhZGRlZCBpbnRvICdyOGE3Nzk2MS5kdHNpJy4NCj4g
Pg0KPiA+IEJhc2VkIG9uIGNvbW1pdCA5Mjk4MDc1OWMxNjk5YTNjMTBiZWIwMGY0MTEyNzAxOTdh
Yzg5NTQ0DQo+ID4gKCJhcm02NDogZHRzOiByZW5lc2FzOiBBZGQgc3VwcG9ydCBmb3IgU2FsdmF0
b3ItWFMgd2l0aCBSLUNhciBNMy1XKyIpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWXV5YSBI
YW1hbWFjaGkgPHl1eWEuaGFtYW1hY2hpLnN4QHJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTYxLXVsY2IuZHRzDQo+ID4gQEAgLTAsMCArMSwzMSBA
QA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICsvKg0KPiA+
ICsgKiBEZXZpY2UgVHJlZSBTb3VyY2UgZm9yIHRoZSBNM1VMQ0IgKFItQ2FyIFN0YXJ0ZXIgS2l0
IFBybykgYm9hcmQNCj4gPiArd2l0aCBSLUNhciBNMy1XKw0KPiANCj4gVGhlIGFib3ZlIGxvbmcg
bGluZSBuZWVkcyB0byBiZSBzcGxpdC4NCj4gDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAo
QykgMjAyMCBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAuDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiAr
L2R0cy12MS87DQo+ID4gKyNpbmNsdWRlICJyOGE3Nzk2MS5kdHNpIg0KPiA+ICsjaW5jbHVkZSAi
dWxjYi5kdHNpIg0KPiA+ICsNCj4gPiArLyB7DQo+ID4gKyAgICAgICBtb2RlbCA9ICJSZW5lc2Fz
IE0zVUxDQiBib2FyZCBiYXNlZCBvbiByOGE3Nzk2MSI7DQo+ID4gKyAgICAgICBjb21wYXRpYmxl
ID0gInJlbmVzYXMsbTN1bGNiIiwgInJlbmVzYXMscjhhNzc5NjEiOw0KPiA+ICsNCj4gPiArICAg
ICAgIG1lbW9yeUA0ODAwMDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgIGRldmljZV90eXBlID0g
Im1lbW9yeSI7DQo+ID4gKyAgICAgICAgICAgICAgIC8qIGZpcnN0IDEyOE1CIGlzIHJlc2VydmVk
IGZvciBzZWN1cmUgYXJlYS4gKi8NCj4gPiArICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDQ4
MDAwMDAwIDB4MCAweDc4MDAwMDAwPjsNCj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAg
ICAgbWVtb3J5QDQwMDAwMDAwMCB7DQo+IA0KPiBBcyBTZXJnZWkgcG9pbnRlZCBvdXQsIHRoZSB1
bml0LWFkZHJlc3MgaXMgd3JvbmcuDQo+IEludGVyZXN0aW5nbHksIHI4YTc3OTYxLXNhbHZhdG9y
LXhzLmR0cyBoYXMgdGhlIHNhbWUgaXNzdWUuDQo+IFdpbGwgc2VuZCBhIHBhdGNoLg0KDQpJIGNv
bmZpcm1lZCB0aGF0IHBhdGNoIGluIHRoZSBCU1AgaGFzIHNhbWUgaXNzdWUgdG9vLg0KIyBNYXli
ZSB0aGlzIHBhdGNoOg0KIyAgIGh0dHBzOi8vZ2l0aHViLmNvbS9yZW5lc2FzLXJjYXIvbGludXgt
YnNwL2NvbW1pdC8zMGFhMmY3OWU0YWZkOTBlMTA1NjRiOGVmODE2OTY4ZTYxZDkzYzEyDQpTbywg
SSB0aGluayB0aGF0IHI4YTc3OTYxLXNhbHZhdG9yLXhzLmR0cyBhbmQgdGhpcyBwYXRjaCBoYXZl
IHNhbWUgaXNzdWUuDQoNCj4gPiArICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5
IjsNCj4gPiArICAgICAgICAgICAgICAgcmVnID0gPDB4NCAweDgwMDAwMDAwIDB4MCAweDgwMDAw
MDAwPjsNCj4gPiArICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgbWVtb3J5QDYwMDAwMDAw
MCB7DQo+ID4gKyAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gIm1lbW9yeSI7DQo+ID4gKyAg
ICAgICAgICAgICAgIHJlZyA9IDwweDYgMHgwMDAwMDAwMCAweDEgMHgwMDAwMDAwMD47DQo+ID4g
KyAgICAgICB9Ow0KPiA+ICt9Ow0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IGkuZS4gd2lsbCBxdWV1ZQ0KPiBpbiByZW5lc2Fz
LWRldmVsIGZvciB2NS43LCB3aXRoIHRoZSBhYm92ZSBmaXhlZC4NCg0KVGhhbmsgeW91IGZvciB5
b3VyIFJldmlld2VkLWJ5ICENCg0KVGhhbmsgeW91IGZvciB5b3VyIGhlbHAuDQpCZXN0IHJlZ2Fy
ZHMsDQpZdXlhIEhhbWFtYWNoaQ0KDQo=
