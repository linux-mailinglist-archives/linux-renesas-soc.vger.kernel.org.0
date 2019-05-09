Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 704F71885A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 12:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbfEIKbq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 06:31:46 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:57279 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfEIKbq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 06:31:46 -0400
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
X-IronPort-AV: E=Sophos;i="5.60,449,1549954800"; 
   d="scan'208";a="30759862"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 09 May 2019 03:31:45 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.108) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Thu, 9 May 2019 03:31:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8HpuWk0tNGFXNt38eIE/8gRwdJJKf1X2SLf162Q03E=;
 b=xBxX3o2GmveoefhlVv26B2AXpoW/owhGbQJpQH8aVyjzvjNuZjd9cSp9naaQoz2EA5HkUVCIh0P5KN4aoTClMKLWJIudrHLBnRXPF5S0zieJR6sAi/BWxSfu7btBE1JK/Qqmz3/trMbjK7pBt+ubsLc01PYa5i1Hm/I9V+9zOEI=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1459.namprd11.prod.outlook.com (10.172.21.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Thu, 9 May 2019 10:31:41 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1878.022; Thu, 9 May 2019
 10:31:41 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <geert@linux-m68k.org>
CC:     <linux-renesas-soc@vger.kernel.org>, <jonas@norrbonn.se>,
        <linux-mtd@lists.infradead.org>, <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKZft50AgAANmoCAAAIxgIAABqiAgAAbqwCAAAZdgIAAApsAgAATIoCAAVI2gIAAKTcAgAAUAICAACvcAIAA6X4AgAAl0YCAABZ5gA==
Date:   Thu, 9 May 2019 10:31:41 +0000
Message-ID: <7649e84f-debb-cec8-d6d6-d33d9dce4259@microchip.com>
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
 <8b004a57-0fd9-04fe-d031-1d98d890f826@microchip.com>
 <CAMuHMdXghAWmNJLUq_uOUVPrrNTAcFq=QqCGjLU51FchvOu3=g@mail.gmail.com>
 <6a8d9a6c-5281-88d2-51ae-e2afad847a8f@microchip.com>
 <CAMuHMdVBguF4ZQHTqwr6GAJKuUcvBGu-5p0GeYRmZ3dG8tXa2g@mail.gmail.com>
In-Reply-To: <CAMuHMdVBguF4ZQHTqwr6GAJKuUcvBGu-5p0GeYRmZ3dG8tXa2g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P189CA0032.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::45) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34ab72bc-b8be-412b-861d-08d6d469865c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:BN6PR11MB1459;
x-ms-traffictypediagnostic: BN6PR11MB1459:
x-microsoft-antispam-prvs: <BN6PR11MB1459E8346E1940772A50ED16F0330@BN6PR11MB1459.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(366004)(51914003)(199004)(189003)(316002)(73956011)(14444005)(256004)(66946007)(6916009)(5660300002)(72206003)(54906003)(6436002)(66476007)(53936002)(66446008)(64756008)(66556008)(2906002)(68736007)(31686004)(76176011)(478600001)(99286004)(31696002)(86362001)(52116002)(6116002)(8936002)(446003)(11346002)(3846002)(2616005)(476003)(486006)(6246003)(186003)(71200400001)(8676002)(305945005)(71190400001)(6506007)(386003)(81166006)(4326008)(26005)(6512007)(53546011)(102836004)(7736002)(66066001)(6486002)(36756003)(14454004)(229853002)(81156014)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR11MB1459;H:BN6PR11MB1842.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LnSn1S7ksA9FGYRGhHIUOY7rEnJ3sxlGRRHMCoNy1/MgdWIOXkhfxLYilEDcZKjtpOJNqBMjXRoBWniB4nkc3jN0nhGPgZYmIqxrwmMzb6VwsnR89E7ZR4OUN2Pzm7nCv1c69MWYyHv5jeku3gQRcBwLjtSmi7DZ+R0om11Ul5jORHG17gfL/9tDAsDh2fhR02h2Sg7pqKqpcTqxVSxqdNqlC6tfMhGWGGDXrlBw8UFn9LvjixLC9QycMwoFY5TqpuCKmlR7E9/JuPta8pvZx7s4x8E9nzqJBBSW/rErgXMndXmcMHSININayaBIV9Z6bd6sJeOqBFP115eIZYFRylVw6n0JH3T+yCv3VKYBx3SpoFwJaSdGuHw7YLHWGKCr2ZgW8qp3Vxvr/RCHWxd2GzQ0x9+u2wOcu5AduUh+md8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10A2E6B549FB8E46BCE5CD44D1D59F4E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ab72bc-b8be-412b-861d-08d6d469865c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 10:31:41.2500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1459
X-OriginatorOrg: microchip.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGksIEdlZXJ0LA0KDQpPbiAwNS8wOS8yMDE5IDEyOjExIFBNLCBHZWVydCBVeXR0ZXJob2V2ZW4g
d3JvdGU6DQo+IEV4dGVybmFsIEUtTWFpbA0KPiANCj4gDQo+IEhpIFR1ZG9yLA0KPiANCj4gT24g
VGh1LCBNYXkgOSwgMjAxOSBhdCA4OjU2IEFNIDxUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20+
IHdyb3RlOg0KPj4gV2hlbiB0aGUgY29uZmlndXJhdGlvbiByZWdpc3RlciBRVUFEIGJpdCBDUlsx
XSBpcyAxLCBvbmx5IHRoZSBXUlIgY29tbWFuZCBmb3JtYXQNCj4+IHdpdGggMTYgZGF0YSBiaXRz
IG1heSBiZSB1c2VkLCBXUlIgd2l0aCA4IGJpdHMgaXMgbm90IHJlY29nbml6ZWQgYW5kIGhlbmNl
IHRoZQ0KPj4gRkZzLiBZb3UgcHJvYmFibHkgc2V0IHF1YWQgYml0IGluIHUtYm9vdCwgd2hpbGUg
b3RoZXJzIGRvbid0LiBXZSBjYW4gdmVyaWZ5IHRoaXMNCj4+IGFzc3VtcHRpb24gd2l0aCB0aGUg
cGF0Y2ggZm9ybSBiZWxvdy4gQ2FuIHlvdSB0cnkgaXQ/DQo+IA0KPiBUaGFua3MhDQo+IA0KPj4g
LS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCj4+ICsrKyBiL2RyaXZlcnMvbXRk
L3NwaS1ub3Ivc3BpLW5vci5jDQo+IA0KPj4gK3N0YXRpYyBpbnQgc3BpX25vcl9jbGVhcl9ibG9j
a19wcm90ZWN0aW9uKHN0cnVjdCBzcGlfbm9yICpub3IpDQo+PiArew0KPj4gKyAgICAgICBpbnQg
cmV0Ow0KPj4gKyAgICAgICB1OCBzciwgY3IsIHNyX2NyWzJdID0gezB9Ow0KPj4gKyAgICAgICB1
OCBtYXNrID0gU1JfQlAyIHwgU1JfQlAxIHwgU1JfQlAwOw0KPj4gKw0KPj4gKyAgICAgICByZXQg
PSByZWFkX2NyKG5vcik7DQo+PiArICAgICAgIGRldl9kYmcobm9yLT5kZXYsICJDUiA9ICUwOHhc
biIsIHJldCk7DQo+PiArICAgICAgICBpZiAocmV0IDwgMCkgew0KPj4gKyAgICAgICAgICAgICAg
ICBkZXZfZXJyKG5vci0+ZGV2LCAiZXJyb3Igd2hpbGUgcmVhZGluZyBDUlxuIik7DQo+PiArICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4+ICsgICAgICAgfQ0KPj4gKyAgICAgICBjciA9IHJl
dDsNCj4+ICsNCj4+ICsgICAgICAgaWYgKGNyICYgQ1JfUVVBRF9FTl9TUEFOKSB7DQo+PiArICAg
ICAgICAgICAgICAgLyogZGlzYWJsZSBxdWFkIGlmIGFscmVhZHkgc2V0LCBtdXN0IGRvIGl0IHdp
dGggMTYtYml0IFdSUiAqLw0KPj4gKyAgICAgICAgICAgICAgIHJldCA9IHdyaXRlX3NyX2NyKG5v
ciwgc3JfY3IpOw0KPj4gKyAgICAgICAgICAgICAgIGlmIChyZXQpIHsNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGRldl9lcnIobm9yLT5kZXYsICJlcnJvciBkaWFzYmxpbmcgcXVhZCBtb2Rl
XG4iKTsNCj4gDQo+IGRpc2FibGluZw0KPiANCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiByZXQ7DQo+PiArICAgICAgICAgICAgICAgfQ0KPiANCj4gcmVuZXNhc19zcGkgZTZiMTAw
MDAuc3BpOiBETUEgYXZhaWxhYmxlDQo+IHJlbmVzYXNfc3BpIGU2YjEwMDAwLnNwaTogcmVnaXN0
ZXJlZCBtYXN0ZXIgc3BpMA0KPiBzcGkgc3BpMC4wOiBzZXR1cCBtb2RlIDMsIDggYml0cy93LCAz
MDAwMDAwMCBIeiBtYXggLS0+IDANCj4gbTI1cDgwIHNwaTAuMDogYmZwdC5kd29yZHNbMV0gPSBm
ZmZmZmZmZg0KPiBtMjVwODAgc3BpMC4wOiBiZnB0LmR3b3Jkc1syXSA9IGZmZmZmZmZmDQo+IG0y
NXA4MCBzcGkwLjA6IGJmcHQuZHdvcmRzWzNdID0gZmZmZmZmZmYNCj4gbTI1cDgwIHNwaTAuMDog
YmZwdC5kd29yZHNbNF0gPSBmZmZmZmZmZg0KPiBtMjVwODAgc3BpMC4wOiBiZnB0LmR3b3Jkc1s1
XSA9IGZmZmZmZmZmDQo+IG0yNXA4MCBzcGkwLjA6IGJmcHQuZHdvcmRzWzZdID0gZmZmZmZmZmYN
Cj4gbTI1cDgwIHNwaTAuMDogYmZwdC5kd29yZHNbN10gPSBmZmZmZmZmZg0KPiBtMjVwODAgc3Bp
MC4wOiBiZnB0LmR3b3Jkc1s4XSA9IGZmZmZmZmZmDQo+IG0yNXA4MCBzcGkwLjA6IGJmcHQuZHdv
cmRzWzldID0gZmZmZmZmZmYNCj4gbTI1cDgwIHNwaTAuMDogYmZwdC5kd29yZHNbMTBdID0gMDAw
MDAwMDANCj4gbTI1cDgwIHNwaTAuMDogYmZwdC5kd29yZHNbMTFdID0gMDAwMDAwMDANCj4gbTI1
cDgwIHNwaTAuMDogYmZwdC5kd29yZHNbMTJdID0gMDAwMDAwMDANCj4gbTI1cDgwIHNwaTAuMDog
YmZwdC5kd29yZHNbMTNdID0gMDAwMDAwMDANCj4gbTI1cDgwIHNwaTAuMDogYmZwdC5kd29yZHNb
MTRdID0gMDAwMDAwMDANCj4gbTI1cDgwIHNwaTAuMDogYmZwdC5kd29yZHNbMTVdID0gMDAwMDAw
MDANCj4gbTI1cDgwIHNwaTAuMDogYmZwdC5kd29yZHNbMTZdID0gMDAwMDAwMDANCj4gbTI1cDgw
IHNwaTAuMDogZmFpbGVkIHRvIHBhcnNlIEJGUFQ6IGVyciA9IC0yMg0KPiBtMjVwODAgc3BpMC4w
OiBzcGlfbm9yX2luaXRfcGFyYW1zIHNmZHAgcGFyc2UgZmFpbGVkLCByZXQgPS0yMg0KPiBtMjVw
ODAgc3BpMC4wOiBTUiBhbmQgQ1IgYmVmb3JlIHF1YWRfZW5hYmxlOg0KPiBtMjVwODAgc3BpMC4w
OiBTUiA9IDAwMDAwMDAwDQo+IG0yNXA4MCBzcGkwLjA6IENSID0gMDAwMDAwMDINCj4gbTI1cDgw
IHNwaTAuMDogU1IgYW5kIENSIGFmdGVyIHF1YWRfZW5hYmxlOg0KPiBtMjVwODAgc3BpMC4wOiBT
UiA9IDAwMDAwMDAwDQo+IG0yNXA4MCBzcGkwLjA6IENSID0gMDAwMDAwMDINCj4gbTI1cDgwIHNw
aTAuMDogczI1Zmw1MTJzICg2NTUzNiBLYnl0ZXMpDQo+IG0yNXA4MCBzcGkwLjA6IG10ZCAubmFt
ZSA9IHNwaTAuMCwgLnNpemUgPSAweDQwMDAwMDAgKDY0TWlCKSwNCj4gLmVyYXNlc2l6ZSA9IDB4
MDAwNDAwMDAgKDI1NktpQikgLm51bWVyYXNlcmVnaW9ucyA9IDANCj4gMyBmaXhlZC1wYXJ0aXRp
b25zIHBhcnRpdGlvbnMgZm91bmQgb24gTVREIGRldmljZSBzcGkwLjANCj4gQ3JlYXRpbmcgMyBN
VEQgcGFydGl0aW9ucyBvbiAic3BpMC4wIjoNCj4gMHgwMDAwMDAwMDAwMDAtMHgwMDAwMDAwODAw
MDAgOiAibG9hZGVyIg0KPiAweDAwMDAwMDA4MDAwMC0weDAwMDAwMDYwMDAwMCA6ICJ1c2VyIg0K
PiAweDAwMDAwMDYwMDAwMC0weDAwMDAwNDAwMDAwMCA6ICJmbGFzaCINCj4gcmVuZXNhc19zcGkg
ZTZiMTAwMDAuc3BpOiByZWdpc3RlcmVkIGNoaWxkIHNwaTAuMA0KPiByZW5lc2FzX3NwaSBlNmIx
MDAwMC5zcGk6IHByb2JlZA0KPiANCj4gQW5kIC9kZXYvbXRkMCByZWFkaW5nIHdvcmtzIGZpbmUu
DQo+IFRoYW5rcyENCj4gDQoNCkknbSBnbGFkIHRoYXQgaXQgd29ya2VkLCB0aGFua3MgZm9yIHRo
ZSBoZWxwLiBJJ2xsIGRvIGEgcGF0Y2ggdG8gZml4IHRoaXMgY2FzZSwNCmJ1dCBwcm9iYWJseSBp
dCB3aWxsIHF1YWxpZnkgZm9yIC1uZXh0LiBJcyAtbmV4dCBvayBmb3IgeW91Pw0KDQpDaGVlcnMs
DQp0YQ0K
