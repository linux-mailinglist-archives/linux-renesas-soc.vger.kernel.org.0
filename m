Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6FE94BD37
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 17:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729554AbfFSPrU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 11:47:20 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:60784 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbfFSPrT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 11:47:19 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Tudor.Ambarus@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="Tudor.Ambarus@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; 
   d="scan'208";a="38238273"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jun 2019 08:47:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Jun 2019 08:47:16 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 19 Jun 2019 08:47:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DG+5zvZ34mn24jD49CkdDFdIjKvgTfrAodPxU4EeaIY=;
 b=YyOH4QloXVBvdCHPAA/d7jGfHfWjjI4NP2XvnWSG2DLzZ8i466fqx9S/ZkAxQFh7s6Oqmzke5BxO6AyphKg9+ORStIqnKYENCrplPkd1EVeAX4LU0x5qmBPzSod4O36yAk5D+EEuOpnIz/KxatgMcXJEaNKh1xUINYE2TqDwETs=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1666.namprd11.prod.outlook.com (10.172.18.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Wed, 19 Jun 2019 15:47:13 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 15:47:13 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <geert@linux-m68k.org>
CC:     <marek.vasut+renesas@gmail.com>, <marek.vasut@gmail.com>,
        <vigneshr@ti.com>, <jonas@norrbonn.se>, <dwmw2@infradead.org>,
        <computersforpeace@gmail.com>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: use 16-bit WRR command when QE is set on
 spansion flashes
Thread-Topic: [PATCH] mtd: spi-nor: use 16-bit WRR command when QE is set on
 spansion flashes
Thread-Index: AQHVH1UacBq0FintGkWJpZVpCwLZ0KaWIrmAgA0LGgA=
Date:   Wed, 19 Jun 2019 15:47:13 +0000
Message-ID: <02babf5a-2a50-848c-27d9-9f810078cbcf@microchip.com>
References: <c57fe97b-ad4a-874e-663f-7f3a737824c9@microchip.com>
 <20190610062351.24405-1-tudor.ambarus@microchip.com>
 <CAMuHMdW3=fzFvt+ZmC2B6qf0zEwfvV--HVEoxa06Tk=a=Q1cWA@mail.gmail.com>
In-Reply-To: <CAMuHMdW3=fzFvt+ZmC2B6qf0zEwfvV--HVEoxa06Tk=a=Q1cWA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0308.eurprd07.prod.outlook.com
 (2603:10a6:800:130::36) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b824cbc4-294c-423a-8a55-08d6f4cd65b8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN6PR11MB1666;
x-ms-traffictypediagnostic: BN6PR11MB1666:
x-microsoft-antispam-prvs: <BN6PR11MB1666066CAFDF361E4E4711F4F0E50@BN6PR11MB1666.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:238;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(346002)(366004)(39860400002)(376002)(199004)(189003)(31686004)(66946007)(73956011)(6116002)(3846002)(66066001)(486006)(14454004)(66476007)(64756008)(66446008)(66556008)(81166006)(81156014)(68736007)(36756003)(476003)(8676002)(2616005)(446003)(305945005)(8936002)(7736002)(11346002)(2906002)(186003)(26005)(53936002)(6436002)(5660300002)(25786009)(386003)(53546011)(71190400001)(6506007)(6916009)(71200400001)(102836004)(14444005)(256004)(86362001)(7416002)(4326008)(99286004)(6486002)(478600001)(316002)(54906003)(72206003)(31696002)(76176011)(6512007)(52116002)(6246003)(229853002);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR11MB1666;H:BN6PR11MB1842.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I1e78FJNFKV4ZY2dNGHT3kBFvhb0A0hbYqmaP60LJ1wK33RT06MPDGAZYWw05FJELxE5Hxss72iFRugNVvfs1Q5U4M/xI1vQjPjlk32sGGCKQu0GmFeLfR4Y3xbB/FJVbhlGSLO5yA0b27QltmOllLv/6gQs4jDVXKRp6VtE+foT+xj9aJzvxo5xWz/v8sWWTgPicf5CgQ7wam62SXACAGnxx6SToTchifc2kG0R5X8If/qNBtxVODcIXjK8U6L3Ew8/dFGxvyS9yP5T3K3nPxZ7IF4JdnSLoC4x+Wz5aRo6WBXl+vjv6LNxuRGvVs2B+h/wlWto/RkBalOeDv/3WjsJzYITVYPigFRNnhNzLsl7lBzb9CPmdIbQm2iwO0WAyYOPxzqotZk8IG8pg17X6ts/2d/Ij29Sp0aFa+QWbcs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6F23B43FA1BA24EBDE89ED9FC6645B3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b824cbc4-294c-423a-8a55-08d6f4cd65b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 15:47:13.6343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1666
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGksIEdlZXJ0LA0KDQpPbiAwNi8xMS8yMDE5IDExOjM1IEFNLCBHZWVydCBVeXR0ZXJob2V2ZW4g
d3JvdGU6DQo+IEhpIFR1ZG9yLA0KPiANCj4gT24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgODoyNCBB
TSA8VHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tPiB3cm90ZToNCj4+IEZyb206IFR1ZG9yIEFt
YmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBTUEkgbWVtb3J5IGRl
dmljZXMgZnJvbSBkaWZmZXJlbnQgbWFudWZhY3R1cmVycyBoYXZlIHdpZGVseQ0KPj4gZGlmZmVy
ZW50IGNvbmZpZ3VyYXRpb25zIGZvciBTdGF0dXMsIENvbnRyb2wgYW5kIENvbmZpZ3VyYXRpb24N
Cj4+IHJlZ2lzdGVycy4gSkVERUMgMjE2QyBkZWZpbmVzIGEgbmV3IG1hcCBmb3IgdGhlc2UgY29t
bW9uIHJlZ2lzdGVyDQo+PiBiaXRzIGFuZCB0aGVpciBmdW5jdGlvbnMsIGFuZCBkZXNjcmliZXMg
aG93IHRoZSBpbmRpdmlkdWFsIGJpdHMgbWF5DQo+PiBiZSBhY2Nlc3NlZCBmb3IgYSBzcGVjaWZp
YyBkZXZpY2UuIEZvciB0aGUgSkVERUMgMjE2QiBjb21wbGlhbnQNCj4+IGZsYXNoZXMsIHdlIGNh
biBwYXJ0aWFsbHkgZGVkdWNlIFN0YXR1cyBhbmQgQ29uZmlndXJhdGlvbiByZWdpc3RlcnMNCj4+
IGZ1bmN0aW9ucyBieSBpbnNwZWN0aW5nIHRoZSAxNnRoIERXT1JEIG9mIEJGUFQuIE9sZGVyIGZs
YXNoZXMgdGhhdA0KPj4gZG9uJ3QgZGVjbGFyZSB0aGUgU0ZEUCB0YWJsZXMgKFNQQU5TSU9OIEZM
NTEyU0FJRkcxIDMxMVFRMDYzIEEgwqkxMQ0KPj4gU1BBTlNJT04pIGxldCB0aGUgc29mdHdhcmUg
ZGVjaWRlIGhvdyB0byBpbnRlcmFjdCB3aXRoIHRoZXNlIHJlZ2lzdGVycy4NCj4+DQo+PiBUaGUg
Y29tbWl0IGRjYjRiMjJlZWFmNCAoInNwaS1ub3I6IHMyNWZsNTEycyBzdXBwb3J0cyByZWdpb24g
bG9ja2luZyIpDQo+PiB1bmNvdmVyZWQgYSBwcm9iZSBlcnJvciBmb3IgczI1Zmw1MTJzLCB3aGVu
IHRoZSBRVUFEIGJpdCBDUlsxXSB3YXMgc2V0DQo+PiBpbiB0aGUgYm9vdGxvYWRlci4gV2hlbiB0
aGlzIGJpdCBpcyBzZXQsIG9ubHkgdGhlIFdyaXRlIFJlZ2lzdGVyDQo+PiBXUlIgY29tbWFuZCBm
b3JtYXQgd2l0aCAxNiBkYXRhIGJpdHMgbWF5IGJlIHVzZWQsIFdSUiB3aXRoIDggYml0cw0KPj4g
aXMgbm90IHJlY29nbml6ZWQgYW5kIGhlbmNlIHRoZSBlcnJvciB3aGVuIHRyeWluZyB0byBjbGVh
ciB0aGUgYmxvY2sNCj4+IHByb3RlY3Rpb24gYml0cy4NCj4+DQo+PiBGaXggdGhlIGFib3ZlIGJ5
IHVzaW5nIDE2LWJpdHMgV1JSIGNvbW1hbmQgd2hlbiBRdWFkIGJpdCBpcyBzZXQuDQo+Pg0KPj4g
QmFja3dhcmQgY29tcGF0aWJpbGl0eSBzaG91bGQgYmUgZmluZS4gVGhlIG5ld2x5IGludHJvZHVj
ZWQNCj4+IHNwaV9ub3Jfc3BhbnNpb25fY2xlYXJfc3JfYnAoKSBpcyB0aWdodGx5IGNvdXBsZWQg
d2l0aCB0aGUNCj4+IHNwYW5zaW9uX3F1YWRfZW5hYmxlKCkgZnVuY3Rpb24uIEJvdGggYXNzdW1l
IHRoYXQgdGhlIFdyaXRlIFJlZ2lzdGVyDQo+PiB3aXRoIDE2IGJpdHMsIHRvZ2V0aGVyIHdpdGgg
dGhlIFJlYWQgQ29uZmlndXJhdGlvbiBSZWdpc3RlciAoMzVoKQ0KPj4gaW5zdHJ1Y3Rpb25zIGFy
ZSBzdXBwb3J0ZWQuDQo+Pg0KPj4gUmVwb3J0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRv
ci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+IEdlZXJ0LCBKb25hcywNCj4+DQo+
PiBUaGlzIHBhdGNoIGlzIGNvbXBpbGUtdGVzdGVkIG9ubHkuIEkgZG9uJ3QgaGF2ZSB0aGUgZmxh
c2gsIEkgbmVlZCB5b3VyDQo+PiBoZWxwIGZvciB0ZXN0aW5nIHRoaXMuDQo+IA0KPiBUaGFua3Ms
IHRoaXMgcmV2aXZlcyBhY2Nlc3MgdG8gdGhlIHMyNWZsNTEycyBvbiBLb2Vsc2NoLg0KPiANCj4g
Rml4ZXM6IGRjYjRiMjJlZWFmNDRmOTEgKCJzcGktbm9yOiBzMjVmbDUxMnMgc3VwcG9ydHMgcmVn
aW9uIGxvY2tpbmciKQ0KDQpJIGRpZG4ndCBhZGQgdGhlIEZpeGVzIHRhZyBiZWNhdXNlIHRoaXMg
Y29tbWl0IGhlbHBlZCB1cyBkaXNjb3ZlciBhIGNhc2UgdGhhdA0KaGFzIG5vdCBiZWVuIHRha2Vu
IGludG8gY29uc2lkZXJhdGlvbiBiZWZvcmUuIEl0IGRpZG4ndCBpbnRyb2R1Y2UgYSBidWcsIGJ1
dA0KcmF0aGVyIHJldmVhbGVkIG9uZS4gSG93ZXZlciwgaXQncyBub3QgdGhlIHRpbWUgdG8gd2Fs
ayBvdmVyIHRoaXMgdGhpbiBsaW5lLCBzbw0KSSdsbCBhZGQgaXQsIHRoYW5rcyENCg0KPiBUZXN0
ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+SGkgVHVk
b3IsDQo+IA0KPiBUd28gcXVlc3Rpb25zIGJlbG93Li4uDQo+IA0KPj4gLS0tIGEvZHJpdmVycy9t
dGQvc3BpLW5vci9zcGktbm9yLmMNCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5v
ci5jDQo+IA0KPj4gK3N0YXRpYyBpbnQgc3BpX25vcl9zcGFuc2lvbl9jbGVhcl9zcl9icChzdHJ1
Y3Qgc3BpX25vciAqbm9yKQ0KPj4gK3sNCj4gDQo+IFsuLi5dDQo+IA0KPj4gKyAgICAgICAgKiBX
aGVuIHRoZSBjb25maWd1cmF0aW9uIHJlZ2lzdGVyIFFVQUQgYml0IENSWzFdIGlzIDEsIG9ubHkN
Cj4+ICsgICAgICAgICogdGhlIFdSUiBjb21tYW5kIGZvcm1hdCB3aXRoIDE2IGRhdGEgYml0cyBt
YXkgYmUgdXNlZC4NCj4gDQo+IHMvV1JSL1dSU1IvPw0KDQpTMjVGTDUxMlMgbmFtZWQgaXQgIldy
aXRlIFJlZ2lzdGVycyIgY29tbWFuZCBhbmQgY2hvc2UgdGhlICJXUlIiIGFjcm9ueW0uDQpKRVNE
MjE2RCBuYW1lcyBpdCAiV3JpdGUgUmVnaXN0ZXIiIGNvbW1hbmQgYW5kIGRvZXNuJ3Qgc3VnZ2Vz
dCBhbiBhY3JvbnltLiBJJ2xsDQpzLyJXUlIiLyJXcml0ZSBSZWdpc3RlciBjb21tYW5kIiwgdG8g
dXNlIHRoZSBKRVNEMjE2RCBuYW1pbmcgYW5kIGF2b2lkIGNvbmZ1c2lvbi4NCg0KSSBhbHNvIGZv
cmdvdCB0byBkZXNjcmliZSBpbnQgKCpjbGVhcl9zcl9icCksIHYyIHdpbGwgZm9sbG93LiBXaWxs
IGtlZXAgdGhlIFItYg0KYW5kIFQtYiB0YWdzIHNpbmNlIEknbGwganVzdCB1cGRhdGUgY29tbWVu
dHMuDQoNCnRhDQo=
