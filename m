Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECC833AEF3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2019 08:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387587AbfFJGYO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jun 2019 02:24:14 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:2600 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387431AbfFJGYN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jun 2019 02:24:13 -0400
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Tudor.Ambarus@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="Tudor.Ambarus@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,573,1557212400"; 
   d="scan'208";a="35048209"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jun 2019 23:24:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 9 Jun 2019 23:24:11 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 9 Jun 2019 23:24:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aL2tpdUKHw05u+ZkffpJ7O9v7ev7PFJCnIIlysFHIP4=;
 b=rab16fPFgSaUcsxFFngUfLSF8abcOi7LdwsA0as4J2fEYbV9zYYoifws5FsC+h/PYxhswyBD47p9/3f7s5DQxp1Qrkkd6KIVV9evIJ/X9O/iSmd0kxJzgF8FhEMmP7Pc5xsoHaVfIAIkMgj2AsVmVPyZ9PcVB9rNPta6dJqnqaA=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1556.namprd11.prod.outlook.com (10.172.22.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.13; Mon, 10 Jun 2019 06:24:05 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 06:24:05 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <geert@linux-m68k.org>, <marek.vasut+renesas@gmail.com>,
        <marek.vasut@gmail.com>, <vigneshr@ti.com>, <jonas@norrbonn.se>
CC:     <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <Tudor.Ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: use 16-bit WRR command when QE is set on
 spansion flashes
Thread-Topic: [PATCH] mtd: spi-nor: use 16-bit WRR command when QE is set on
 spansion flashes
Thread-Index: AQHVH1UacBq0FintGkWJpZVpCwLZ0A==
Date:   Mon, 10 Jun 2019 06:24:04 +0000
Message-ID: <20190610062351.24405-1-tudor.ambarus@microchip.com>
References: <c57fe97b-ad4a-874e-663f-7f3a737824c9@microchip.com>
In-Reply-To: <c57fe97b-ad4a-874e-663f-7f3a737824c9@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0801CA0082.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::26) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 596e57fc-8ac0-4fd4-b087-08d6ed6c3c3b
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN6PR11MB1556;
x-ms-traffictypediagnostic: BN6PR11MB1556:
x-microsoft-antispam-prvs: <BN6PR11MB155686C2B1C0D06CEF89F078F0130@BN6PR11MB1556.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(346002)(366004)(396003)(376002)(39860400002)(199004)(189003)(6486002)(2201001)(6512007)(14444005)(256004)(86362001)(36756003)(2501003)(1076003)(53936002)(4326008)(107886003)(6116002)(3846002)(2906002)(25786009)(5660300002)(8676002)(81156014)(81166006)(71190400001)(71200400001)(99286004)(14454004)(66066001)(8936002)(316002)(7416002)(54906003)(26005)(110136005)(50226002)(66476007)(64756008)(72206003)(486006)(66446008)(66556008)(6436002)(446003)(476003)(2616005)(186003)(478600001)(76176011)(11346002)(7736002)(6506007)(102836004)(305945005)(386003)(52116002)(66946007)(73956011)(68736007);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR11MB1556;H:BN6PR11MB1842.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dYfEWYf3SMQef9sEV7G5JDgvehoZx1uVxuAQoyJoRIIPZz9Terla7dFsjtIgyyigs1fyIyPKF0vo9OhQ8HjZKwiEfRFrHhnEWxCyoW0v94IZMbxIQPq/5dN/lvqN4Bdu4Lxild1hB4ytFw2HxfmzRRbxJIRfLSi0OxqqC/UN5K/QDqsoT8a3y7D16+U2MKA7U4mtq0fVuZ7QhvTQxDCyeWB8PHIOj+LWOkmmdrzc5P9j6VTEJkXusUuh8y7BjT3Gy0oao0jJX0FD13xYV+YXnpSKTVvholRdTNYZhKAJM55bXVw4LEY6jtSC9TZi2h1U/7YfKsoP5aoRXYT7dewuCsSPJMLboZ7T7+SqdEIDLlCwFifhdI0A2K+GiAPigrAHpRbxr4fdPPnZaMYdXXq9e+vWmEVoT+xkU15fnG1Lph0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BD403A693F3B64CA9B42896918ABA1C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 596e57fc-8ac0-4fd4-b087-08d6ed6c3c3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 06:24:04.9925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1556
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RnJvbTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPg0KDQpTUEkg
bWVtb3J5IGRldmljZXMgZnJvbSBkaWZmZXJlbnQgbWFudWZhY3R1cmVycyBoYXZlIHdpZGVseQ0K
ZGlmZmVyZW50IGNvbmZpZ3VyYXRpb25zIGZvciBTdGF0dXMsIENvbnRyb2wgYW5kIENvbmZpZ3Vy
YXRpb24NCnJlZ2lzdGVycy4gSkVERUMgMjE2QyBkZWZpbmVzIGEgbmV3IG1hcCBmb3IgdGhlc2Ug
Y29tbW9uIHJlZ2lzdGVyDQpiaXRzIGFuZCB0aGVpciBmdW5jdGlvbnMsIGFuZCBkZXNjcmliZXMg
aG93IHRoZSBpbmRpdmlkdWFsIGJpdHMgbWF5DQpiZSBhY2Nlc3NlZCBmb3IgYSBzcGVjaWZpYyBk
ZXZpY2UuIEZvciB0aGUgSkVERUMgMjE2QiBjb21wbGlhbnQNCmZsYXNoZXMsIHdlIGNhbiBwYXJ0
aWFsbHkgZGVkdWNlIFN0YXR1cyBhbmQgQ29uZmlndXJhdGlvbiByZWdpc3RlcnMNCmZ1bmN0aW9u
cyBieSBpbnNwZWN0aW5nIHRoZSAxNnRoIERXT1JEIG9mIEJGUFQuIE9sZGVyIGZsYXNoZXMgdGhh
dA0KZG9uJ3QgZGVjbGFyZSB0aGUgU0ZEUCB0YWJsZXMgKFNQQU5TSU9OIEZMNTEyU0FJRkcxIDMx
MVFRMDYzIEEgwqkxMQ0KU1BBTlNJT04pIGxldCB0aGUgc29mdHdhcmUgZGVjaWRlIGhvdyB0byBp
bnRlcmFjdCB3aXRoIHRoZXNlIHJlZ2lzdGVycy4NCg0KVGhlIGNvbW1pdCBkY2I0YjIyZWVhZjQg
KCJzcGktbm9yOiBzMjVmbDUxMnMgc3VwcG9ydHMgcmVnaW9uIGxvY2tpbmciKQ0KdW5jb3ZlcmVk
IGEgcHJvYmUgZXJyb3IgZm9yIHMyNWZsNTEycywgd2hlbiB0aGUgUVVBRCBiaXQgQ1JbMV0gd2Fz
IHNldA0KaW4gdGhlIGJvb3Rsb2FkZXIuIFdoZW4gdGhpcyBiaXQgaXMgc2V0LCBvbmx5IHRoZSBX
cml0ZSBSZWdpc3Rlcg0KV1JSIGNvbW1hbmQgZm9ybWF0IHdpdGggMTYgZGF0YSBiaXRzIG1heSBi
ZSB1c2VkLCBXUlIgd2l0aCA4IGJpdHMNCmlzIG5vdCByZWNvZ25pemVkIGFuZCBoZW5jZSB0aGUg
ZXJyb3Igd2hlbiB0cnlpbmcgdG8gY2xlYXIgdGhlIGJsb2NrDQpwcm90ZWN0aW9uIGJpdHMuDQoN
CkZpeCB0aGUgYWJvdmUgYnkgdXNpbmcgMTYtYml0cyBXUlIgY29tbWFuZCB3aGVuIFF1YWQgYml0
IGlzIHNldC4NCg0KQmFja3dhcmQgY29tcGF0aWJpbGl0eSBzaG91bGQgYmUgZmluZS4gVGhlIG5l
d2x5IGludHJvZHVjZWQNCnNwaV9ub3Jfc3BhbnNpb25fY2xlYXJfc3JfYnAoKSBpcyB0aWdodGx5
IGNvdXBsZWQgd2l0aCB0aGUNCnNwYW5zaW9uX3F1YWRfZW5hYmxlKCkgZnVuY3Rpb24uIEJvdGgg
YXNzdW1lIHRoYXQgdGhlIFdyaXRlIFJlZ2lzdGVyDQp3aXRoIDE2IGJpdHMsIHRvZ2V0aGVyIHdp
dGggdGhlIFJlYWQgQ29uZmlndXJhdGlvbiBSZWdpc3RlciAoMzVoKQ0KaW5zdHJ1Y3Rpb25zIGFy
ZSBzdXBwb3J0ZWQuDQoNClJlcG9ydGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPg0KU2lnbmVkLW9mZi1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1
c0BtaWNyb2NoaXAuY29tPg0KLS0tDQpHZWVydCwgSm9uYXMsDQoNClRoaXMgcGF0Y2ggaXMgY29t
cGlsZS10ZXN0ZWQgb25seS4gSSBkb24ndCBoYXZlIHRoZSBmbGFzaCwgSSBuZWVkIHlvdXINCmhl
bHAgZm9yIHRlc3RpbmcgdGhpcy4NCg0KVGhhbmtzLA0KdGENCg0KIGRyaXZlcnMvbXRkL3NwaS1u
b3Ivc3BpLW5vci5jIHwgMTE2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLQ0KIGluY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaCAgIHwgICAxICsNCiAyIGZpbGVzIGNo
YW5nZWQsIDEwNiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGkt
bm9yLmMNCmluZGV4IGMwYTg4MzdjMDU3NS4uYWY5YWM3ZjA5Y2MyIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3Bp
LW5vci5jDQpAQCAtMTYzNiw2ICsxNjM2LDkyIEBAIHN0YXRpYyBpbnQgc3IyX2JpdDdfcXVhZF9l
bmFibGUoc3RydWN0IHNwaV9ub3IgKm5vcikNCiAJcmV0dXJuIDA7DQogfQ0KIA0KKy8qKg0KKyAq
IHNwaV9ub3JfY2xlYXJfc3JfYnAoKSAtIGNsZWFyIHRoZSBTdGF0dXMgUmVnaXN0ZXIgQmxvY2sg
UHJvdGVjdGlvbiBiaXRzLg0KKyAqIEBub3I6ICAgICAgICBwb2ludGVyIHRvIGEgJ3N0cnVjdCBz
cGlfbm9yJw0KKyAqDQorICogUmVhZC1tb2RpZnktd3JpdGUgZnVuY3Rpb24gdGhhdCBjbGVhcnMg
dGhlIEJsb2NrIFByb3RlY3Rpb24gYml0cyBmcm9tIHRoZQ0KKyAqIFN0YXR1cyBSZWdpc3RlciB3
aXRob3V0IGFmZmVjdGluZyBvdGhlciBiaXRzLg0KKyAqDQorICogUmV0dXJuOiAwIG9uIHN1Y2Nl
c3MsIC1lcnJubyBvdGhlcndpc2UuDQorICovDQorc3RhdGljIGludCBzcGlfbm9yX2NsZWFyX3Ny
X2JwKHN0cnVjdCBzcGlfbm9yICpub3IpDQorew0KKwlpbnQgcmV0Ow0KKwl1OCBtYXNrID0gU1Jf
QlAyIHwgU1JfQlAxIHwgU1JfQlAwOw0KKw0KKwlyZXQgPSByZWFkX3NyKG5vcik7DQorCWlmIChy
ZXQgPCAwKSB7DQorCQlkZXZfZXJyKG5vci0+ZGV2LCAiZXJyb3Igd2hpbGUgcmVhZGluZyBzdGF0
dXMgcmVnaXN0ZXJcbiIpOw0KKwkJcmV0dXJuIHJldDsNCisJfQ0KKw0KKwl3cml0ZV9lbmFibGUo
bm9yKTsNCisNCisJcmV0ID0gd3JpdGVfc3Iobm9yLCByZXQgJiB+bWFzayk7DQorCWlmIChyZXQp
IHsNCisJCWRldl9lcnIobm9yLT5kZXYsICJ3cml0ZSB0byBzdGF0dXMgcmVnaXN0ZXIgZmFpbGVk
XG4iKTsNCisJCXJldHVybiByZXQ7DQorCX0NCisNCisJcmV0ID0gc3BpX25vcl93YWl0X3RpbGxf
cmVhZHkobm9yKTsNCisJaWYgKHJldCkNCisJCWRldl9lcnIobm9yLT5kZXYsICJ0aW1lb3V0IHdo
aWxlIHdyaXRpbmcgc3RhdHVzIHJlZ2lzdGVyXG4iKTsNCisJcmV0dXJuIHJldDsNCit9DQorDQor
LyoqDQorICogc3BpX25vcl9zcGFuc2lvbl9jbGVhcl9zcl9icCgpIC0gY2xlYXIgdGhlIFN0YXR1
cyBSZWdpc3RlciBCbG9jayBQcm90ZWN0aW9uDQorICogYml0cyBvbiBzcGFuc2lvbiBmbGFzaGVz
Lg0KKyAqIEBub3I6ICAgICAgICBwb2ludGVyIHRvIGEgJ3N0cnVjdCBzcGlfbm9yJw0KKyAqDQor
ICogUmVhZC1tb2RpZnktd3JpdGUgZnVuY3Rpb24gdGhhdCBjbGVhcnMgdGhlIEJsb2NrIFByb3Rl
Y3Rpb24gYml0cyBmcm9tIHRoZQ0KKyAqIFN0YXR1cyBSZWdpc3RlciB3aXRob3V0IGFmZmVjdGlu
ZyBvdGhlciBiaXRzLiBUaGUgZnVuY3Rpb24gaXMgdGlnaHRseQ0KKyAqIGNvdXBsZWQgd2l0aCB0
aGUgc3BhbnNpb25fcXVhZF9lbmFibGUoKSBmdW5jdGlvbi4gQm90aCBhc3N1bWUgdGhhdCB0aGUg
V3JpdGUNCisgKiBSZWdpc3RlciB3aXRoIDE2IGJpdHMsIHRvZ2V0aGVyIHdpdGggdGhlIFJlYWQg
Q29uZmlndXJhdGlvbiBSZWdpc3RlciAoMzVoKQ0KKyAqIGluc3RydWN0aW9ucyBhcmUgc3VwcG9y
dGVkDQorICoNCisgKiBSZXR1cm46IDAgb24gc3VjY2VzcywgLWVycm5vIG90aGVyd2lzZS4NCisg
Ki8NCitzdGF0aWMgaW50IHNwaV9ub3Jfc3BhbnNpb25fY2xlYXJfc3JfYnAoc3RydWN0IHNwaV9u
b3IgKm5vcikNCit7DQorCWludCByZXQ7DQorCXU4IG1hc2sgPSBTUl9CUDIgfCBTUl9CUDEgfCBT
Ul9CUDA7DQorCXU4IHNyX2NyWzJdID0gezB9Ow0KKw0KKwkvKiBDaGVjayBjdXJyZW50IFF1YWQg
RW5hYmxlIGJpdCB2YWx1ZS4gKi8NCisJcmV0ID0gcmVhZF9jcihub3IpOw0KKwlpZiAocmV0IDwg
MCkgew0KKwkJZGV2X2Vycihub3ItPmRldiwNCisJCQkiZXJyb3Igd2hpbGUgcmVhZGluZyBjb25m
aWd1cmF0aW9uIHJlZ2lzdGVyXG4iKTsNCisJCXJldHVybiByZXQ7DQorCX0NCisNCisJLyoNCisJ
ICogV2hlbiB0aGUgY29uZmlndXJhdGlvbiByZWdpc3RlciBRVUFEIGJpdCBDUlsxXSBpcyAxLCBv
bmx5DQorCSAqIHRoZSBXUlIgY29tbWFuZCBmb3JtYXQgd2l0aCAxNiBkYXRhIGJpdHMgbWF5IGJl
IHVzZWQuDQorCSAqLw0KKwlpZiAocmV0ICYgQ1JfUVVBRF9FTl9TUEFOKSB7DQorCQlzcl9jclsx
XSA9IHJldDsNCisNCisJCXJldCA9IHJlYWRfc3Iobm9yKTsNCisJCWlmIChyZXQgPCAwKSB7DQor
CQkJZGV2X2Vycihub3ItPmRldiwNCisJCQkJImVycm9yIHdoaWxlIHJlYWRpbmcgc3RhdHVzIHJl
Z2lzdGVyXG4iKTsNCisJCQlyZXR1cm4gcmV0Ow0KKwkJfQ0KKwkJc3JfY3JbMF0gPSByZXQgJiB+
bWFzazsNCisNCisJCXJldCA9IHdyaXRlX3NyX2NyKG5vciwgc3JfY3IpOw0KKwkJaWYgKHJldCkN
CisJCQlkZXZfZXJyKG5vci0+ZGV2LCAiMTYtYml0IHdyaXRlIHJlZ2lzdGVyIGZhaWxlZFxuIik7
DQorCQlyZXR1cm4gcmV0Ow0KKwl9DQorDQorCS8qIElmIHF1YWQgYml0IGlzIG5vdCBzZXQsIHVz
ZSA4LWJpdCBXUlIgY29tbWFuZC4gKi8NCisJcmV0dXJuIHNwaV9ub3JfY2xlYXJfc3JfYnAobm9y
KTsNCit9DQorDQogLyogVXNlZCB3aGVuIHRoZSAiX2V4dF9pZCIgaXMgdHdvIGJ5dGVzIGF0IG1v
c3QgKi8NCiAjZGVmaW5lIElORk8oX2plZGVjX2lkLCBfZXh0X2lkLCBfc2VjdG9yX3NpemUsIF9u
X3NlY3RvcnMsIF9mbGFncykJXA0KIAkJLmlkID0gewkJCQkJCQlcDQpAQCAtMzY2Myw2ICszNzQ5
LDggQEAgc3RhdGljIGludCBzcGlfbm9yX2luaXRfcGFyYW1zKHN0cnVjdCBzcGlfbm9yICpub3Is
DQogCQlkZWZhdWx0Og0KIAkJCS8qIEtlcHQgb25seSBmb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0
eSBwdXJwb3NlLiAqLw0KIAkJCXBhcmFtcy0+cXVhZF9lbmFibGUgPSBzcGFuc2lvbl9xdWFkX2Vu
YWJsZTsNCisJCQlpZiAobm9yLT5jbGVhcl9zcl9icCkNCisJCQkJbm9yLT5jbGVhcl9zcl9icCA9
IHNwaV9ub3Jfc3BhbnNpb25fY2xlYXJfc3JfYnA7DQogCQkJYnJlYWs7DQogCQl9DQogDQpAQCAt
MzkxNSwxNyArNDAwMywxMyBAQCBzdGF0aWMgaW50IHNwaV9ub3JfaW5pdChzdHJ1Y3Qgc3BpX25v
ciAqbm9yKQ0KIHsNCiAJaW50IGVycjsNCiANCi0JLyoNCi0JICogQXRtZWwsIFNTVCwgSW50ZWwv
TnVtb255eCwgYW5kIG90aGVycyBzZXJpYWwgTk9SIHRlbmQgdG8gcG93ZXIgdXANCi0JICogd2l0
aCB0aGUgc29mdHdhcmUgcHJvdGVjdGlvbiBiaXRzIHNldA0KLQkgKi8NCi0JaWYgKEpFREVDX01G
Uihub3ItPmluZm8pID09IFNOT1JfTUZSX0FUTUVMIHx8DQotCSAgICBKRURFQ19NRlIobm9yLT5p
bmZvKSA9PSBTTk9SX01GUl9JTlRFTCB8fA0KLQkgICAgSkVERUNfTUZSKG5vci0+aW5mbykgPT0g
U05PUl9NRlJfU1NUIHx8DQotCSAgICBub3ItPmluZm8tPmZsYWdzICYgU1BJX05PUl9IQVNfTE9D
Sykgew0KLQkJd3JpdGVfZW5hYmxlKG5vcik7DQotCQl3cml0ZV9zcihub3IsIDApOw0KLQkJc3Bp
X25vcl93YWl0X3RpbGxfcmVhZHkobm9yKTsNCisJaWYgKG5vci0+Y2xlYXJfc3JfYnApIHsNCisJ
CWVyciA9IG5vci0+Y2xlYXJfc3JfYnAobm9yKTsNCisJCWlmIChlcnIpIHsNCisJCQlkZXZfZXJy
KG5vci0+ZGV2LA0KKwkJCQkiZmFpbCB0byBjbGVhciBibG9jayBwcm90ZWN0aW9uIGJpdHNcbiIp
Ow0KKwkJCXJldHVybiBlcnI7DQorCQl9DQogCX0NCiANCiAJaWYgKG5vci0+cXVhZF9lbmFibGUp
IHsNCkBAIC00MDUwLDYgKzQxMzQsMTYgQEAgaW50IHNwaV9ub3Jfc2NhbihzdHJ1Y3Qgc3BpX25v
ciAqbm9yLCBjb25zdCBjaGFyICpuYW1lLA0KIAlpZiAoaW5mby0+ZmxhZ3MgJiBTUElfUzNBTikN
CiAJCW5vci0+ZmxhZ3MgfD0gIFNOT1JfRl9SRUFEWV9YU1JfUkRZOw0KIA0KKwkvKg0KKwkgKiBB
dG1lbCwgU1NULCBJbnRlbC9OdW1vbnl4LCBhbmQgb3RoZXJzIHNlcmlhbCBOT1IgdGVuZCB0byBw
b3dlciB1cA0KKwkgKiB3aXRoIHRoZSBzb2Z0d2FyZSBwcm90ZWN0aW9uIGJpdHMgc2V0Lg0KKwkg
Ki8NCisJaWYgKEpFREVDX01GUihub3ItPmluZm8pID09IFNOT1JfTUZSX0FUTUVMIHx8DQorCSAg
ICBKRURFQ19NRlIobm9yLT5pbmZvKSA9PSBTTk9SX01GUl9JTlRFTCB8fA0KKwkgICAgSkVERUNf
TUZSKG5vci0+aW5mbykgPT0gU05PUl9NRlJfU1NUIHx8DQorCSAgICBub3ItPmluZm8tPmZsYWdz
ICYgU1BJX05PUl9IQVNfTE9DSykNCisJCW5vci0+Y2xlYXJfc3JfYnAgPSBzcGlfbm9yX2NsZWFy
X3NyX2JwOw0KKw0KIAkvKiBQYXJzZSB0aGUgU2VyaWFsIEZsYXNoIERpc2NvdmVyYWJsZSBQYXJh
bWV0ZXJzIHRhYmxlLiAqLw0KIAlyZXQgPSBzcGlfbm9yX2luaXRfcGFyYW1zKG5vciwgJnBhcmFt
cyk7DQogCWlmIChyZXQpDQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5o
IGIvaW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5oDQppbmRleCBiM2QzNjBiMGVlM2QuLjU2NmJk
NTAxMGJjOCAxMDA2NDQNCi0tLSBhL2luY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaA0KKysrIGIv
aW5jbHVkZS9saW51eC9tdGQvc3BpLW5vci5oDQpAQCAtNDEwLDYgKzQxMCw3IEBAIHN0cnVjdCBz
cGlfbm9yIHsNCiAJaW50ICgqZmxhc2hfdW5sb2NrKShzdHJ1Y3Qgc3BpX25vciAqbm9yLCBsb2Zm
X3Qgb2ZzLCB1aW50NjRfdCBsZW4pOw0KIAlpbnQgKCpmbGFzaF9pc19sb2NrZWQpKHN0cnVjdCBz
cGlfbm9yICpub3IsIGxvZmZfdCBvZnMsIHVpbnQ2NF90IGxlbik7DQogCWludCAoKnF1YWRfZW5h
YmxlKShzdHJ1Y3Qgc3BpX25vciAqbm9yKTsNCisJaW50ICgqY2xlYXJfc3JfYnApKHN0cnVjdCBz
cGlfbm9yICpub3IpOw0KIA0KIAl2b2lkICpwcml2Ow0KIH07DQotLSANCjIuOS41DQoNCg==
