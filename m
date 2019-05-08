Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B058917B73
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 16:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfEHOXp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 10:23:45 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:7859 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbfEHOXp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 10:23:45 -0400
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
  Tudor.Ambarus@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="Tudor.Ambarus@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com; spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,446,1549954800"; 
   d="scan'208";a="29641609"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 08 May 2019 07:23:40 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.105) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Wed, 8 May 2019 07:23:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHYb5k5906uC+A0DNc+YWJBVyi4v3wzZCu5sQL35eKo=;
 b=cYmGWPbrP+p0st8wfdyd0ULAt8Hv6fQNylMAFODxGsw/WtfvlT90MUX/F+joCWctY9hUxNOVtq9JonYGR0QcQG24dsI2OSEfNDBjDkUGb2iMt/SVw26nAeLoboskI3QjyCWxfJnutjCowYCPsSWioPfmtv4iqycHgqjkBHMWTm4=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1412.namprd11.prod.outlook.com (10.173.32.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Wed, 8 May 2019 14:23:13 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 14:23:13 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <geert@linux-m68k.org>
CC:     <linux-renesas-soc@vger.kernel.org>, <jonas@norrbonn.se>,
        <linux-mtd@lists.infradead.org>, <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKZft50AgAANmoCAAAIxgIAABqiAgAAbqwCAAAZdgIAAApsAgAATIoCAAVI2gIAAKTcAgAAUAIA=
Date:   Wed, 8 May 2019 14:23:12 +0000
Message-ID: <8b004a57-0fd9-04fe-d031-1d98d890f826@microchip.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
 <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
 <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
 <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com>
 <CAMuHMdXFwFAPzYPKqj+FZgSq01VAD0izS3ELyOg1YBwTAQ_QkQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXFwFAPzYPKqj+FZgSq01VAD0izS3ELyOg1YBwTAQ_QkQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0101CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:1f::52) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e73f0d3-7634-4a3b-db15-08d6d3c0b3fa
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:BN6PR11MB1412;
x-ms-traffictypediagnostic: BN6PR11MB1412:
x-microsoft-antispam-prvs: <BN6PR11MB1412369079ED681F2B876F17F0320@BN6PR11MB1412.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39860400002)(396003)(346002)(136003)(366004)(189003)(199004)(81156014)(54906003)(446003)(2906002)(486006)(8936002)(11346002)(68736007)(31686004)(476003)(2616005)(66066001)(81166006)(8676002)(7736002)(305945005)(36756003)(6246003)(6916009)(53936002)(4326008)(25786009)(86362001)(31696002)(478600001)(5660300002)(316002)(52116002)(386003)(99286004)(102836004)(76176011)(53546011)(6506007)(3846002)(6116002)(256004)(14444005)(71190400001)(6512007)(71200400001)(14454004)(6486002)(72206003)(6436002)(73956011)(66446008)(66946007)(186003)(229853002)(26005)(64756008)(66476007)(66556008);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR11MB1412;H:BN6PR11MB1842.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WpKlbIq2rvGv8GPSYb/vkZZ1g14J//gaXVA5yihQWIJX/+NXgaE/VpV8Zbwq+We45q63vApTnvgtqBqmLc+Gle8+Qx4pIuNLRXTwO9/3qVxqiEw31Ixw65LuAjMV940lIYtviNBYOhYT053uy0Qnvdh2I0yaKhOAkfV1LEfBycANTLL7QuTGEdiq8xgJo3xEKpBQi+BD8gq42W+NN8uNHXPxoO0mA1HxCHJ7WiRNdiwymVwu9eSkeGqTHf3RkG9nd4ZDuVJugfulWSf6ZjbmmbprzOjyBSmZI1DDmCuL0yx7sU3SunHBbxhgc8cqZEe63imQ5o9jRjfQ14q2U04BJpG/h5D7UsgNuUyoViRuiGAms+6UnVbkbFcd9Xy1ae/R61gjjDlxg91SJ8lCsMIdHgrlUC6UnbP3rkTmVLkW10w=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC5799178372444FBD8D96AFB544F645@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e73f0d3-7634-4a3b-db15-08d6d3c0b3fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 14:23:13.0500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1412
X-OriginatorOrg: microchip.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGksIEdlZXJ0LA0KDQpPbiAwNS8wOC8yMDE5IDA0OjExIFBNLCBHZWVydCBVeXR0ZXJob2V2ZW4g
d3JvdGU6DQo+IEV4dGVybmFsIEUtTWFpbA0KPiANCj4gDQo+IEhpIFR1ZG9yLA0KPiANCj4gT24g
V2VkLCBNYXkgOCwgMjAxOSBhdCAxMjo0NCBQTSA8VHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29t
PiB3cm90ZToNCj4+IFdvdWxkIHlvdSBydW4gdGhpcyBkZWJ1ZyBwYXRjaCBvbiB0b3Agb2YgbXRk
L25leHQ/IEkgZHVtcGVkIHRoZSBTUiBhbmQgQ1IgYmVmb3JlDQo+PiBhbmQgYWZ0ZXIgdGhlIG9w
ZXJhdGlvbnMgaW4gY2F1c2UuDQo+IA0KPiBUaGFua3MsIGdpdmluZyBpdCBhIHRyeS4uLg0KPiAN
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyBiL2RyaXZlcnMv
bXRkL3NwaS1ub3Ivc3BpLW5vci5jDQo+PiBpbmRleCA3MzE3MmQ3ZjUxMmIuLjIwZDBmZGIxZGM5
MiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jDQo+PiArKysg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPj4gQEAgLTIyLDYgKzIyLDggQEANCj4+
ICAjaW5jbHVkZSA8bGludXgvc3BpL2ZsYXNoLmg+DQo+PiAgI2luY2x1ZGUgPGxpbnV4L210ZC9z
cGktbm9yLmg+DQo+Pg0KPj4gKyNkZWZpbmUgREVCVUcNCj4gDQo+IFNob3VsZCBiZSBtb3ZlZCB0
byB0aGUgdG9wIG9mIHRoZSBmaWxlLCBiZWZvcmUgZGV2X2RiZygpIGlzIGRlZmluZWQuDQo+IA0K
PiBSZXN1bHQgaXM6DQo+IA0KPiBtMjVwODAgc3BpMC4wOiBiZnB0LmR3b3Jkc1sxXSA9IGZmZmZm
ZmZmDQo+IG0yNXA4MCBzcGkwLjA6IGJmcHQuZHdvcmRzWzJdID0gZmZmZmZmZmYNCj4gbTI1cDgw
IHNwaTAuMDogYmZwdC5kd29yZHNbM10gPSBmZmZmZmZmZg0KPiBtMjVwODAgc3BpMC4wOiBiZnB0
LmR3b3Jkc1s0XSA9IGZmZmZmZmZmDQo+IG0yNXA4MCBzcGkwLjA6IGJmcHQuZHdvcmRzWzVdID0g
ZmZmZmZmZmYNCj4gbTI1cDgwIHNwaTAuMDogYmZwdC5kd29yZHNbNl0gPSBmZmZmZmZmZg0KPiBt
MjVwODAgc3BpMC4wOiBiZnB0LmR3b3Jkc1s3XSA9IGZmZmZmZmZmDQo+IG0yNXA4MCBzcGkwLjA6
IGJmcHQuZHdvcmRzWzhdID0gZmZmZmZmZmYNCj4gbTI1cDgwIHNwaTAuMDogYmZwdC5kd29yZHNb
OV0gPSBmZmZmZmZmZg0KPiBtMjVwODAgc3BpMC4wOiBiZnB0LmR3b3Jkc1sxMF0gPSAwMDAwMDAw
MA0KPiBtMjVwODAgc3BpMC4wOiBiZnB0LmR3b3Jkc1sxMV0gPSAwMDAwMDAwMA0KPiBtMjVwODAg
c3BpMC4wOiBiZnB0LmR3b3Jkc1sxMl0gPSAwMDAwMDAwMA0KPiBtMjVwODAgc3BpMC4wOiBiZnB0
LmR3b3Jkc1sxM10gPSAwMDAwMDAwMA0KPiBtMjVwODAgc3BpMC4wOiBiZnB0LmR3b3Jkc1sxNF0g
PSAwMDAwMDAwMA0KPiBtMjVwODAgc3BpMC4wOiBiZnB0LmR3b3Jkc1sxNV0gPSAwMDAwMDAwMA0K
PiBtMjVwODAgc3BpMC4wOiBiZnB0LmR3b3Jkc1sxNl0gPSAwMDAwMDAwMA0KPiBtMjVwODAgc3Bp
MC4wOiBmYWlsZWQgdG8gcGFyc2UgQkZQVDogZXJyID0gLTIyDQo+IG0yNXA4MCBzcGkwLjA6IHNw
aV9ub3JfaW5pdF9wYXJhbXMgc2ZkcCBwYXJzZSBmYWlsZWQsIHJldCA9LTIyDQo+IG0yNXA4MCBz
cGkwLjA6IFNSID0gMDAwMDAwMDANCj4gbTI1cDgwIHNwaTAuMDogQ1IgPSAwMDAwMDAwMg0KPiBt
MjVwODAgc3BpMC4wOiBFcmFzZSBFcnJvciBvY2N1cnJlZA0KPiBtMjVwODAgc3BpMC4wOiB0aW1l
b3V0IHdoaWxlIHdyaXRpbmcgU1IsIHJldCA9IC01DQo+IG0yNXA4MCBzcGkwLjA6IFNSID0gMDAw
MDAwZmYNCj4gbTI1cDgwIHNwaTAuMDogQ1IgPSAwMDAwMDBmZg0KDQpmZiBjYW4gbWVhbiB0aGF0
IHRoZSBsaW5lcyBhcmUgImluIGFpciIsIG1heWJlIHRoZSBmbGFzaCByZXNldHMgd2hlbiB3ZQ0K
d3JpdGVfc3Iobm9yLCAwKT8gSG93IGFib3V0IGFkZGluZyBhIGRlbGF5IGhlcmUgdG8gbGV0IHRo
ZSBmbGFzaCByZXNldD8NCg0KU1I9MCBhbmQgQ1I9MiBhZnRlciByZXNldCwgYm90aCB3cml0ZV9z
cihub3IsIDApIGFuZCBxdWFkX2VuYWJsZSBjYW4gYmUgYXZvaWRlZA0KLT4gcmVhZCBTUiwgY2xl
YXIgQlAgYml0cyBvbmx5IGlmIHRoZXkgYXJlIHNldCB0byAxLCByZWFkIENSIC0+IHNldCBRdWFk
IEVuYWJsZQ0KYml0IG9ubHkgd2hlbiBpdCdzIHplcm8uDQoNCkNoZWVycywNCnRhDQoNCj4gbTI1
cDgwIHNwaTAuMDogU1IgYW5kIENSIGJlZm9yZSBxdWFkX2VuYWJsZToNCj4gbTI1cDgwIHNwaTAu
MDogU1IgPSAwMDAwMDBmZg0KPiBtMjVwODAgc3BpMC4wOiBDUiA9IDAwMDAwMGZmDQo+IG0yNXA4
MCBzcGkwLjA6IEVyYXNlIEVycm9yIG9jY3VycmVkDQo+IG0yNXA4MCBzcGkwLjA6IHRpbWVvdXQg
d2hpbGUgd3JpdGluZyBjb25maWd1cmF0aW9uIHJlZ2lzdGVyDQo+IG0yNXA4MCBzcGkwLjA6IFNS
IGFuZCBDUiBhZnRlciBxdWFkX2VuYWJsZToNCj4gbTI1cDgwIHNwaTAuMDogU1IgPSAwMDAwMDBm
Zg0KPiBtMjVwODAgc3BpMC4wOiBDUiA9IDAwMDAwMGZmDQo+IG0yNXA4MCBzcGkwLjA6IHF1YWQg
bW9kZSBub3Qgc3VwcG9ydGVkLCBlcnIgPSAtNQ0KPiBtMjVwODA6IHByb2JlIG9mIHNwaTAuMCBm
YWlsZWQgd2l0aCBlcnJvciAtNQ0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCg==
