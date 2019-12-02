Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9480310E6D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 09:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfLBITs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 03:19:48 -0500
Received: from mail-eopbgr1410128.outbound.protection.outlook.com ([40.107.141.128]:22112
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725977AbfLBITs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 03:19:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lL39tyP2Z8cIAlPVPzCG6Zl5lpJeVNCvgXw0p7nu6iqahzjR19inzLMAkNUKf6RoR0M7iDx4N08LwUjpnY/PSsKcSEfQCmdX7+pa+bJVtDIDzE6Qk6+0k1Mt/O4a/h9A8M1T2cZj+wspr1L0fJ4e4rsB65K01Z4nJa1qyfr/hzCrooOvWo8EU37j99ir+7MIqLnqorowXX1+C2Ce4FjFsM2xFVxfYJ11bh3jdqr1d+LM4pWb36NRpOu71ty+ZpLZ5sD0qozAqvMcEsKOhk0bTVMocU1Xfb+sdMN43Bt/N1Zt0FQoeb/jjrCSlbi2wsUb0OqKeoHOF4Sg0WswL/DBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0LqilUDUOpUJXZw6yVfnWeuMfnEQfhOVFJ2Ffy66n8=;
 b=FbWFmGW9r4TKnsfbQfHGkmrIZ/118FTTmxyx7NjKk/hR+PVi8Nr5BbcVFYNimf6DETRsv/kqM41QGr15bkhAUNqEmQ4f100F15M7O7ebVzVYOH+tJ2811s3ke1p3rgr4noH6277PPicU2w0T4g3iMv+wabcDhfkqMupstXgKAujlAc/WINlUBpfcgshUDPzaYt7JT4Ja8uuWEIdyEerusY0MSMxIfLPt5aTDPhf4dQCaz3bcFXq9IgNuMP9o7RBXPUXYTFyfsT5GBRWgPnrQMr3NaxmewqQTF1qU4sDHEHxqHeuT7qXtygeuYWmfs3F6/HTRslxsOXAEvVSLrN/hQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0LqilUDUOpUJXZw6yVfnWeuMfnEQfhOVFJ2Ffy66n8=;
 b=ia4BPySJAeoM4xN3peA1VEICPKyeC5ARjTRHAX5NxBF7INHwZgC8j6PxnIQ8IgIDbGvu7kOMn3+gdWXs6cgV9PIm8rHcYwC61ZGIzPwasZttCGjtryf+eofV1+IpniqLbr+88ViIZhRDq+F5pwsoW6HAwVal3uIpRM4pRLuBtW8=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2911.jpnprd01.prod.outlook.com (20.177.105.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Mon, 2 Dec 2019 08:19:45 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6998:f6cf:8cf1:2528]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::6998:f6cf:8cf1:2528%5]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 08:19:44 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Ulrich Hecht <uli@fpond.eu>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 3/4] mmc: host: renesas_sdhi_sys_dmac: add DMACR
 setting
Thread-Topic: [PATCH RFC 3/4] mmc: host: renesas_sdhi_sys_dmac: add DMACR
 setting
Thread-Index: AQHVoPwDN82p8csywkenFkB4uEQGzqedS3MAgAlCamA=
Date:   Mon, 2 Dec 2019 08:19:44 +0000
Message-ID: <TYAPR01MB454428AA3B0D7538EF98A6F2D8430@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1574403231-18512-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <837048895.1354220.1574765168549@webmail.strato.com>
In-Reply-To: <837048895.1354220.1574765168549@webmail.strato.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bbf89928-528e-40bd-eb01-08d777006388
x-ms-traffictypediagnostic: TYAPR01MB2911:
x-microsoft-antispam-prvs: <TYAPR01MB29110EB120DF62EF88FCB91AD8430@TYAPR01MB2911.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(189003)(199004)(66066001)(64756008)(66556008)(55016002)(66476007)(66446008)(8676002)(3846002)(6116002)(81166006)(14444005)(76116006)(9686003)(256004)(71200400001)(2906002)(8936002)(52536014)(71190400001)(99286004)(102836004)(478600001)(5660300002)(229853002)(81156014)(66946007)(4326008)(7696005)(186003)(11346002)(26005)(446003)(33656002)(6506007)(76176011)(7736002)(305945005)(316002)(25786009)(14454004)(74316002)(6916009)(86362001)(6436002)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2911;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LMO0xOaIxNIDO/iSK+OPG4wiLGFkA53iraOAdNi/mVmZSUJGqpF2i2wP1rgAZJz3N0zbDvZ/4xr37dcGasYFUhXydjEBnfwe1oq3QA0M09KLArAafm9HMFVDDGGxDswEnWZUopCduyPgxYBResBIrUKqjkvxYvCu8dyf/aB3fHUVvsdo1J9QrWQ3/vLJxnuv3d7in3z4t3TgYOMqUFWld92wgYSqjei+Xd7O7Eq1ALns046uqnDtBqX/l5+ArpR2Mmi8/2N26xi4rDUeeaZqqrAxKgs7OsjedFl0RHdaImTxZ8JrU/yvID6DLbMPpu4WoZcCp8GnLDfjjclpsuMoUWMf5R1IJjR1P9w2CxDbH2N9A7FuSuji9DBW3Lk+JovnSw2pREAT7evAGGJ0kdt3GkYzpmnOTEOC8WxY9Or5btZErRzFMwzKZdt9X3Rj0QEx
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf89928-528e-40bd-eb01-08d777006388
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 08:19:44.6219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E8DyRPkWNIwYnH6w29MUD9B3YRHbtxF4+uAmKjHAJ3bcXr3v+k/pA7yTzojvxoGtSHLv10ztjG5OYBRmEiBd4NBYJTs06/OqNoLE0sCSW3EHJuk+anUPUEjuKGwLBmcw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2911
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgVWxyaWNoLXNhbiwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyENCg0KPiBGcm9tOiBV
bHJpY2ggSGVjaHQsIFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDI2LCAyMDE5IDc6NDYgUE0NCjxz
bmlwPg0KPiA+ICsjZGVmaW5lIERNQUNSX1NEUjEwNAkJMHgxOTINCj4gPiArI2RlZmluZSBETUFD
Ul9TRFIxMDRfMzJCWVRFCTB4MDAwNA0KPiA+ICsjZGVmaW5lIERNQUNSX1NEUjUwCQkweGU0DQo+
ID4gKyNkZWZpbmUgRE1BQ1JfU0RSNTBfMzJCWVRFCTB4MDAwYQ0KPiA+ICsjZGVmaW5lIERNQUNS
XzJfT1JfNEJZVEUJMHgwMDAwDQo+ID4gKw0KPiANCj4gQ291bGQgeW91IGdpdmUgbWUgYSBwb2lu
dGVyIHRvIHdoZXJlIHRoZXNlIG1hZ2ljIG51bWJlcnMgYXJlIGRvY3VtZW50ZWQ/IEluIG15IChy
YXRoZXIgb2xkKSBTREhJIGRvY3MgdGhlIHJlZ2lzdGVyIGFkZHJlc3Nlcw0KPiBkb24ndCBtYXRj
aC4NCg0KUi1DYXIgR2VuMiBoYXMgMiB0eXBlcyBvZiBTREhJIGNvbnRyb2xsZXIgZnJvbSByZW5l
c2FzX3NkaGlfY29yZS5jOg0KLS0tDQojZGVmaW5lIFNESElfVkVSX0dFTjJfU0RSNTAJMHg0OTBj
DQo8c25pcD4NCiNkZWZpbmUgU0RISV9WRVJfR0VOMl9TRFIxMDQJMHhjYjBkDQotLS0NCg0KLSBT
RFI1MC8xMDQgc3VwcG9ydGVkIGNvbnRyb2xsZXIncyBidXNfc2hpZnQgd2lsbCBiZSAxLCBzbyB0
aGF0IERNQUNSX1NEUjEwNCBpcyAweDE5MiAoYWN0dWFsIGFkZHJlc3MgaXMgMHgzMjQpLg0KLSBT
RFI1MCBzdXBwb3J0ZWQgY29udHJvbGxlcidzIGJ1c19zaGlmdCB3aWxsIGJlIDAsIHNvIHRoYXQg
RE1BQ1JfU0RSNTAgaXMgMHhlNiAoYWN0dWFsIGFkZHJlc3MgaXMgMHhlNikuDQoNClNvLCBJIHNo
b3VsZCBmaXggdGhlICIjZGVmaW5lIERNQUNSX1NEUjUwIiB2YWx1ZSB0byAweGU2LCBub3QgMHhl
NCA6KQ0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+ID4gIHN0cnVjdCBy
ZW5lc2FzX3NkaGlfcXVpcmtzIHsNCj4gPiAgCWJvb2wgaHM0MDBfZGlzYWJsZWQ7DQo+ID4gIAli
b29sIGhzNDAwXzR0YXBzOw0KPiA+IEBAIC02MDQsNiArNjExLDMyIEBAIHN0YXRpYyBpbnQgcmVu
ZXNhc19zZGhpX211bHRpX2lvX3F1aXJrKHN0cnVjdCBtbWNfY2FyZCAqY2FyZCwNCj4gPiAgCXJl
dHVybiBibGtfc2l6ZTsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkIHJlbmVzYXNfc2Ro
aV9zZXRfZG1hY3Ioc3RydWN0IHRtaW9fbW1jX2hvc3QgKmhvc3QpDQo+ID4gK3sNCj4gPiArCXN0
cnVjdCByZW5lc2FzX3NkaGkgKnByaXYgPSBob3N0X3RvX3ByaXYoaG9zdCk7DQo+ID4gKwl1MTYg
dmFsID0gRE1BQ1JfMl9PUl80QllURTsNCj4gPiArCXUxNiByZWc7DQo+ID4gKwllbnVtIGRtYV9z
bGF2ZV9idXN3aWR0aCB3aWR0aCA9IHByaXYtPmRtYV9wcml2LmRtYV9idXN3aWR0aDsNCj4gPiAr
DQo+ID4gKwlzd2l0Y2ggKHNkX2N0cmxfcmVhZDE2KGhvc3QsIENUTF9WRVJTSU9OKSkgew0KPiA+
ICsJY2FzZSBTREhJX1ZFUl9HRU4yX1NEUjUwOg0KPiA+ICsJCWlmICh3aWR0aCA9PSBETUFfU0xB
VkVfQlVTV0lEVEhfMzJfQllURVMpDQo+ID4gKwkJCXZhbCA9IERNQUNSX1NEUjUwXzMyQllURTsN
Cj4gPiArCQlyZWcgPSBETUFDUl9TRFI1MDsNCj4gPiArCQlicmVhazsNCj4gPiArCWNhc2UgU0RI
SV9WRVJfR0VOMl9TRFIxMDQ6DQo+ID4gKwkJaWYgKHdpZHRoID09IERNQV9TTEFWRV9CVVNXSURU
SF8zMl9CWVRFUykNCj4gPiArCQkJdmFsID0gRE1BQ1JfU0RSMTA0XzMyQllURTsNCj4gPiArCQly
ZWcgPSBETUFDUl9TRFIxMDQ7DQo+ID4gKwkJYnJlYWs7DQo+ID4gKwlkZWZhdWx0Og0KPiA+ICsJ
CS8qIG5vdGhpbmcgdG8gZG8gKi8NCj4gPiArCQlyZXR1cm47DQo+ID4gKwl9DQo+ID4gKw0KPiA+
ICsJc2RfY3RybF93cml0ZTE2KGhvc3QsIHJlZywgdmFsKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAg
c3RhdGljIHZvaWQgcmVuZXNhc19zZGhpX2VuYWJsZV9kbWEoc3RydWN0IHRtaW9fbW1jX2hvc3Qg
Kmhvc3QsIGJvb2wgZW5hYmxlKQ0KPiA+ICB7DQo+ID4gIAkvKiBJZmYgcmVncyBhcmUgOCBieXRl
IGFwYXJ0LCBzZGJ1ZiBpcyA2NCBiaXQuIE90aGVyd2lzZSBhbHdheXMgMzIuICovDQo+ID4gQEAg
LTYxMSw2ICs2NDQsOCBAQCBzdGF0aWMgdm9pZCByZW5lc2FzX3NkaGlfZW5hYmxlX2RtYShzdHJ1
Y3QgdG1pb19tbWNfaG9zdCAqaG9zdCwgYm9vbCBlbmFibGUpDQo+ID4NCj4gPiAgCXNkX2N0cmxf
d3JpdGUxNihob3N0LCBDVExfRE1BX0VOQUJMRSwgZW5hYmxlID8gRE1BX0VOQUJMRV9ETUFTRFJX
IDogMCk7DQo+ID4gIAlyZW5lc2FzX3NkaGlfc2RidWZfd2lkdGgoaG9zdCwgZW5hYmxlID8gd2lk
dGggOiAxNik7DQo+ID4gKw0KPiA+ICsJcmVuZXNhc19zZGhpX3NldF9kbWFjcihob3N0KTsNCj4g
PiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVuZXNhc19zZGhpX3F1aXJrcyBz
ZGhpX3F1aXJrc180dGFwX25vaHM0MDAgPSB7DQo+ID4gLS0NCj4gPiAyLjcuNA0KPiA+DQo+IA0K
PiBBc3N1bWluZyB0aGF0IHRoZSByZWdpc3RlciBhZGRyZXNzZXMgYXJlIGNvcnJlY3QsDQo+IFJl
dmlld2VkLWJ5OiBVbHJpY2ggSGVjaHQgPHVsaStyZW5lc2FzQGZwb25kLmV1Pg0KPiANCj4gQ1UN
Cj4gVWxpDQo=
