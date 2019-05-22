Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0E326737
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2019 17:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbfEVPtK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 May 2019 11:49:10 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:25675 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729375AbfEVPtK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 May 2019 11:49:10 -0400
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Tudor.Ambarus@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="Tudor.Ambarus@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,499,1549954800"; 
   d="scan'208";a="35738324"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 22 May 2019 08:49:09 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Wed, 22 May 2019 08:49:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXLok7OLeBekE5+jfpi6DXMEkhHl0IvhDcNZIqI4THM=;
 b=VSnt2oroCYGfwDfJciSLb7ACM7TUEmNGwByWJi3J16Fnp1N3YP3F9pm11NSseEBU7fNgu+bKY4m67rBAaOC5Z50xl0oXsmEbObh0bXJEANsTLyADb/qfrVxFvD9xg5hgPvxhyI/zajh9MseDYgOYGu8I0kvYSwv9fcLowogbZ2M=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1299.namprd11.prod.outlook.com (10.173.32.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Wed, 22 May 2019 15:49:04 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1922.017; Wed, 22 May 2019
 15:49:04 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <geert@linux-m68k.org>
CC:     <linux-renesas-soc@vger.kernel.org>, <jonas@norrbonn.se>,
        <linux-mtd@lists.infradead.org>, <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKZft50AgAANmoCAAAIxgIAABqiAgAAbqwCAAAZdgIAAApsAgAATIoCAAVI2gIAAKTcAgAAUAICAACvcAIAA6X4AgAAl0YCAABZ5gIAAC36AgBS7dwA=
Date:   Wed, 22 May 2019 15:49:03 +0000
Message-ID: <c57fe97b-ad4a-874e-663f-7f3a737824c9@microchip.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
 <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
 <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
 <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com>
 <CAMuHMdXFwFAPzYPKqj+FZgSq01VAD0izS3ELyOg1YBwTAQ_QkQ@mail.gmail.com>
 <8b004a57-0fd9-04fe-d031-1d98d890f826@microchip.com>
 <CAMuHMdXghAWmNJLUq_uOUVPrrNTAcFq=QqCGjLU51FchvOu3=g@mail.gmail.com>
 <6a8d9a6c-5281-88d2-51ae-e2afad847a8f@microchip.com>
 <CAMuHMdVBguF4ZQHTqwr6GAJKuUcvBGu-5p0GeYRmZ3dG8tXa2g@mail.gmail.com>
 <7649e84f-debb-cec8-d6d6-d33d9dce4259@microchip.com>
 <CAMuHMdVPrR=58_+P+D9Gos89n4Yv7wYzLORXmY=JKxZZ2ydKPg@mail.gmail.com>
In-Reply-To: <CAMuHMdVPrR=58_+P+D9Gos89n4Yv7wYzLORXmY=JKxZZ2ydKPg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0398.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::26) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2a06a82-cc73-431e-aace-08d6decd0414
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:BN6PR11MB1299;
x-ms-traffictypediagnostic: BN6PR11MB1299:
x-microsoft-antispam-prvs: <BN6PR11MB129911643FB02073898253FAF0000@BN6PR11MB1299.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(366004)(396003)(39860400002)(346002)(189003)(199004)(61684003)(51914003)(86362001)(6246003)(31696002)(316002)(305945005)(2906002)(54906003)(478600001)(7736002)(25786009)(6512007)(4326008)(6486002)(72206003)(53936002)(256004)(14444005)(5660300002)(71200400001)(71190400001)(8676002)(14454004)(8936002)(81166006)(6116002)(99286004)(3846002)(81156014)(66446008)(64756008)(66556008)(53546011)(6506007)(386003)(26005)(66476007)(229853002)(486006)(36756003)(186003)(68736007)(2616005)(476003)(102836004)(11346002)(52116002)(76176011)(31686004)(446003)(6436002)(6916009)(73956011)(66946007)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR11MB1299;H:BN6PR11MB1842.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4Wr71RuYsuyhh+t7oY8NWECJVwYN/18KcKD5md1Z/06RnLmQCiOE/ylPXrXtnUA9c+JEM4IrcO4F1YEi3VM+V7ZCWpgry5vgJgug+gP2GSMQ1JcnNScSh35z+QoRi+gaJowW0r/sXf7z1sWwsAZaX7aWjZ8AxwWz1q2Li7G9Vk5bslkD7erXrtacPBuFlDF6xWfKtbq0iDH4AmEUNnO93cvUeG8O71TN7oMrKFL6AdEc4Y9iooJr81OH+cO02vbH0HqwhQ/AlIvcQ5Ttt+9YfdI+bgozpT7TR4c9j32/kT0XfmM+FS+BTyePn4oqJDSDR7mmUva+39M3hdX4sQeApahHCloZecanWMoDtu0gJsxupsErWMQLq/FZU6n427lQtSrYkqzBjTy0bj/TpJUw2IUIyjpFamLAHQLtOWVRPWg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F512B49FAE7A14794DE8E4B8B969F0B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a06a82-cc73-431e-aace-08d6decd0414
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 15:49:03.9770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1299
X-OriginatorOrg: microchip.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGksIEdlZXJ0LA0KDQpPbiAwNS8wOS8yMDE5IDAyOjEyIFBNLCBHZWVydCBVeXR0ZXJob2V2ZW4g
d3JvdGU6DQo+IEV4dGVybmFsIEUtTWFpbA0KPiANCj4gDQo+IEhpIFR1ZG9yLA0KPiANCj4gT24g
VGh1LCBNYXkgOSwgMjAxOSBhdCAxMjozMSBQTSA8VHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29t
PiB3cm90ZToNCj4+IE9uIDA1LzA5LzIwMTkgMTI6MTEgUE0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3
cm90ZToNCj4+PiBPbiBUaHUsIE1heSA5LCAyMDE5IGF0IDg6NTYgQU0gPFR1ZG9yLkFtYmFydXNA
bWljcm9jaGlwLmNvbT4gd3JvdGU6DQo+Pj4+IFdoZW4gdGhlIGNvbmZpZ3VyYXRpb24gcmVnaXN0
ZXIgUVVBRCBiaXQgQ1JbMV0gaXMgMSwgb25seSB0aGUgV1JSIGNvbW1hbmQgZm9ybWF0DQo+Pj4+
IHdpdGggMTYgZGF0YSBiaXRzIG1heSBiZSB1c2VkLCBXUlIgd2l0aCA4IGJpdHMgaXMgbm90IHJl
Y29nbml6ZWQgYW5kIGhlbmNlIHRoZQ0KPj4+PiBGRnMuIFlvdSBwcm9iYWJseSBzZXQgcXVhZCBi
aXQgaW4gdS1ib290LCB3aGlsZSBvdGhlcnMgZG9uJ3QuIFdlIGNhbiB2ZXJpZnkgdGhpcw0KPj4+
PiBhc3N1bXB0aW9uIHdpdGggdGhlIHBhdGNoIGZvcm0gYmVsb3cuIENhbiB5b3UgdHJ5IGl0Pw0K
Pj4+DQo+Pj4gQW5kIC9kZXYvbXRkMCByZWFkaW5nIHdvcmtzIGZpbmUuDQo+Pj4gVGhhbmtzIQ0K
Pj4+DQo+Pg0KPj4gSSdtIGdsYWQgdGhhdCBpdCB3b3JrZWQsIHRoYW5rcyBmb3IgdGhlIGhlbHAu
IEknbGwgZG8gYSBwYXRjaCB0byBmaXggdGhpcyBjYXNlLA0KPj4gYnV0IHByb2JhYmx5IGl0IHdp
bGwgcXVhbGlmeSBmb3IgLW5leHQuIElzIC1uZXh0IG9rIGZvciB5b3U/DQo+IA0KPiBHaXZlbiB0
aGUgaXNzdWUgaXMgcHJlc2VudCBvbmx5IGluIC1uZXh0LCBmaXhpbmcgaXQgaW4gLW5leHQgaXMg
ZmluZSBmb3IgbWUuDQo+IFRoYW5rcyENCj4gDQoNCkkndmUgc3RhcnRlZCB3b3JraW5nIHRvIHNx
dWFzaCB0aGUgYnVnIGRpc2NvdmVyZWQgYnkgdGhpcyBwYXRjaC4gc3BpLW5vciBmbGFzaGVzDQpm
cm9tIGRpZmZlcmVudCBtYW51ZmFjdHVyZXJzIGhhdmUgd2lkZWx5IGRpZmZlcmVudCBjb25maWd1
cmF0aW9ucyBmb3Igc3RhdHVzIGFuZA0KY29uZmlndXJhdGlvbiByZWdpc3RlcnMuIEkgaGF2ZSBh
IHdvcmsgaW4gcHJvZ3Jlc3MgcGF0Y2gsIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkNCnJlcXVpcmVt
ZW50cyBpbmNyZWFzZWQgY29kZSBjb21wbGV4aXR5LiBJJ2xsIGJlIG91dCBvZiBvZmZpY2UgYW5k
IHdpbGwgcmV0dXJuIG9uDQozcmQgb2YgSnVuZS4gUHJvYmFibHkgSSB3aWxsIG5vdCBmaW5pc2gg
aXQgdG9kYXksIHRoaXMgaXMgdG8gaW5mb3JtIHlvdSAoYW5kDQpvdGhlcnMpIHRoYXQgSSdsbCBi
ZSBpbmFjdGl2ZSBuZXh0IHdlZWsuDQoNCkNoZWVycywNCnRhDQoNCg==
