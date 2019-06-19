Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 666804BF97
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 19:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730195AbfFSR0H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 13:26:07 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:24211 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbfFSR0G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 13:26:06 -0400
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Tudor.Ambarus@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="Tudor.Ambarus@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,393,1557212400"; 
   d="scan'208";a="38069922"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jun 2019 10:26:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Jun 2019 10:26:05 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 19 Jun 2019 10:26:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQYIJolw/Eb7yXG9KVlLziOZ/pU21HoMUS5SXf36krs=;
 b=CEUm/U0ED2sKHg1EURjPabTD9QtcAuVsoQNpSZ1PM4NbJZQX0Jiw1hl9wCdWnne+e1ZJ+jOJ+b897sA/TqRjbiIcT9D8+yeAPkvGjSh6M0nyziK0eZJwObRifwY+m8bGaFZMmyIKC4iJ6Wh1uYuDaW9LdVwt37iUSESmYpzqVV0=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB2049.namprd11.prod.outlook.com (10.173.31.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Wed, 19 Jun 2019 17:26:03 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 17:26:03 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <geert@linux-m68k.org>, <marek.vasut+renesas@gmail.com>,
        <marek.vasut@gmail.com>, <vigneshr@ti.com>, <jonas@norrbonn.se>,
        <miquel.raynal@bootlin.com>
CC:     <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
        <richard@nod.at>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 2/2] mtd: spi-nor: fix description for int
 (*flash_is_locked)()
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: fix description for int
 (*flash_is_locked)()
Thread-Index: AQHVJsQS9DgOntkRFki3IzozNsJqYw==
Date:   Wed, 19 Jun 2019 17:26:03 +0000
Message-ID: <20190619172530.27159-2-tudor.ambarus@microchip.com>
References: <02babf5a-2a50-848c-27d9-9f810078cbcf@microchip.com>
 <20190619172530.27159-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190619172530.27159-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0049.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::38) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 856c398f-0a66-450b-9159-08d6f4db345c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN6PR11MB2049;
x-ms-traffictypediagnostic: BN6PR11MB2049:
x-microsoft-antispam-prvs: <BN6PR11MB2049A4C30C5ECDD76142BBA3F0E50@BN6PR11MB2049.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(396003)(39860400002)(376002)(346002)(189003)(199004)(72206003)(71190400001)(66066001)(76176011)(486006)(6512007)(66556008)(66476007)(66946007)(36756003)(5660300002)(64756008)(99286004)(446003)(26005)(73956011)(386003)(2616005)(476003)(11346002)(6506007)(102836004)(71200400001)(66446008)(50226002)(81166006)(6116002)(25786009)(7416002)(54906003)(478600001)(305945005)(1076003)(4744005)(52116002)(14454004)(8676002)(7736002)(4326008)(107886003)(256004)(2906002)(81156014)(8936002)(14444005)(53936002)(68736007)(86362001)(6486002)(2201001)(2501003)(316002)(6436002)(186003)(110136005)(3846002);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR11MB2049;H:BN6PR11MB1842.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8+R+mgW46Xs0FxkPZmei1QJ1Cz8ZmNGm75P4g84uMboEftqjJb91bPHnN36Z84VbkM3AsRU+ujydVlDt4t/2hXcPJVxThfkIxFoBjImDqnpEo5QYxwKM0lFZdbPIEI19CI5E3zMW/yK1nrspV1WxNIwP5KyexUwXrJn3QHIa2o1+n7wz+ICtTOXgwOyJAxLB+IXyshnRvlE8s41J64n/iQHO1KOPVZYIfzJJb+I/flVwPW87P38bjUZL0ueqNFo9Efqxkl9TNJbTyyjPymiW+esDolwL/usbJiNzZ9Vu+2o+elS9WIgcfaxs3ZPDnyJH8NrkCTq7UcTOMUwbtPyl4cLOA2nARnd/iHnKW53lPHbly5KKSJ1tNVj8TV3ZhdzX6omSwlglODT63+0xuSWZgGMOlfZhoWV//6bvoa9todk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 856c398f-0a66-450b-9159-08d6f4db345c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 17:26:03.9226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2049
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RnJvbTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPg0KDQpUaGUg
ZGVzY3JpcHRpb24gd2FzIGludGVybGVhdmVkLg0KDQpTaWduZWQtb2ZmLWJ5OiBUdWRvciBBbWJh
cnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+DQotLS0NCnYyOiBuZXcgcGF0Y2gNCg0K
IGluY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaCB8IDIgKy0NCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
bXRkL3NwaS1ub3IuaCBiL2luY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaA0KaW5kZXggOWY1N2Nk
ZmNjOTNkLi5jNGMyYzU5NzEyODQgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9zcGkt
bm9yLmgNCisrKyBiL2luY2x1ZGUvbGludXgvbXRkL3NwaS1ub3IuaA0KQEAgLTM3MiwxMCArMzcy
LDEwIEBAIHN0cnVjdCBmbGFzaF9pbmZvOw0KICAqIEBmbGFzaF9sb2NrOgkJW0ZMQVNILVNQRUNJ
RklDXSBsb2NrIGEgcmVnaW9uIG9mIHRoZSBTUEkgTk9SDQogICogQGZsYXNoX3VubG9jazoJW0ZM
QVNILVNQRUNJRklDXSB1bmxvY2sgYSByZWdpb24gb2YgdGhlIFNQSSBOT1INCiAgKiBAZmxhc2hf
aXNfbG9ja2VkOglbRkxBU0gtU1BFQ0lGSUNdIGNoZWNrIGlmIGEgcmVnaW9uIG9mIHRoZSBTUEkg
Tk9SIGlzDQorICoJCQljb21wbGV0ZWx5IGxvY2tlZA0KICAqIEBxdWFkX2VuYWJsZToJW0ZMQVNI
LVNQRUNJRklDXSBlbmFibGVzIFNQSSBOT1IgcXVhZCBtb2RlDQogICogQGNsZWFyX3NyX2JwOglb
RkxBU0gtU1BFQ0lGSUNdIGNsZWFycyB0aGUgQmxvY2sgUHJvdGVjdGlvbiBCaXRzIGZyb20NCiAg
KgkJCXRoZSBTUEkgTk9SIFN0YXR1cyBSZWdpc3Rlci4NCi0gKgkJCWNvbXBsZXRlbHkgbG9ja2Vk
DQogICogQHByaXY6CQl0aGUgcHJpdmF0ZSBkYXRhDQogICovDQogc3RydWN0IHNwaV9ub3Igew0K
LS0gDQoyLjkuNQ0KDQo=
