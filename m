Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A45F182CB9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2020 10:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgCLJvd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Mar 2020 05:51:33 -0400
Received: from esa16.fujitsucc.c3s2.iphmx.com ([216.71.158.33]:40737 "EHLO
        esa16.fujitsucc.c3s2.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726044AbgCLJvd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 05:51:33 -0400
X-Greylist: delayed 430 seconds by postgrey-1.27 at vger.kernel.org; Thu, 12 Mar 2020 05:51:31 EDT
IronPort-SDR: QfSaMD4eux8L3GTlweLgGA6wQmYiyKnxEmgYOY+pYK9oBBPe6FYmkIRtIHKqtOeJsoWCNOh5qX
 13rQCfbAwn40B4e7gZbaKA9EPv8XRPiWP7ywOpCRtKiltqqpHnoiAWqwY/X3bXEbOC/qujVDgh
 rTS1+mNEYefFmqzd0NaFuhFFagwL4/3KkbY2ODq8AyRE7UAAhibdb3gv8p6hr0n+BjoYfRPiX4
 iwzg/WV7XScd3Rdoy0fNiMmJxuIRSSA3H7RhYo1s6Dkx+yywZw8sz7Sm1ShooYLRWjfDxjLkgD
 Stk=
X-IronPort-AV: E=McAfee;i="6000,8403,9557"; a="11268597"
X-IronPort-AV: E=Sophos;i="5.70,544,1574089200"; 
   d="scan'208";a="11268597"
Received: from mail-os2jpn01lp2050.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.50])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 18:44:16 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCsMakTthR+0eFd91/qreUQCFvCk12B9t33Y/OxpHh4b3z80oImSxtJ8nhoP4n3DnVvEofA/AXdG97U+K4e9YG3lWrw+FNLoSnT/11Xc3Is4HXmxyY2m7WgkbLANVeDUQhwpoYvLe0bSicAAosrhqur8qfgf28UuDAnQwE0iutcN5eUQ3Fr3ns/FhwXcrd89rO7NOASyt+d8zdBuGLfmfz0tIB23E6MufA82JT6AXipHoAw2DdnVPjD7rQw4C4FgOBF61s0I7O+/JJJpDjKpqGM5ZoMkXy24Hf/KzX2Q2ep9m0n5wzJ840TAtUrdiHJ+p1fayFhuKh5GwluGESLL1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaICZNj83NWwB1fn5x5k4hKAdMqdIUHCOces1acyrcc=;
 b=AJ07drscm0LpkCsCgSeY3EjVVnA4zWZwoQitLQ2aQ+ZBUBPDzJX84yUb1jL/5vG8IeqzCU88a0WS00qWSxkCX3aacXENBwYYDqUCELNtQMa+GJQWyMFzxbLVJw9ZI2EGeEtUG47fD5HAejeLqaSt8Zc+DHh794KEPC5dmT9jCtXsLQImmaQTqmdxiVXS6Cfr59fRr5+DuDIu69xOdLSGtdf3CtXYWGBC1ECQyIlgWnEhZRaiAAh17yLw8ShE3CENAnjhfGrgTCCpeYOWS5tKO4LU3ra35YODSnYhGBG7u3wRn90AfpVs7sPDCO1ocWp5D7BIVd6I1ff9bawzYpU1Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaICZNj83NWwB1fn5x5k4hKAdMqdIUHCOces1acyrcc=;
 b=JfWkfcqruZTFTUAvk3RMzhZsowWV/MaGWgpwdED8sfgqDAeoFD7por4WdN5V8G+yk3jkBcQ0YyplsP2X9sTx0hIebYH847HwDC64zuhgCvK0mbyiMhpDdXU5inRd7DHuu6NLM361/LfYUwNhTNTfbDqcGv5EvFd57hojsG1TA/w=
Received: from OSBPR01MB5061.jpnprd01.prod.outlook.com (20.179.181.80) by
 OSBPR01MB3448.jpnprd01.prod.outlook.com (20.178.96.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Thu, 12 Mar 2020 09:44:13 +0000
Received: from OSBPR01MB5061.jpnprd01.prod.outlook.com
 ([fe80::6915:f08:131c:c5bb]) by OSBPR01MB5061.jpnprd01.prod.outlook.com
 ([fe80::6915:f08:131c:c5bb%4]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 09:44:13 +0000
From:   "ashiduka@fujitsu.com" <ashiduka@fujitsu.com>
To:     'Geert Uytterhoeven' <geert@linux-m68k.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "erosca@de.adit-jv.com" <erosca@de.adit-jv.com>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "uli+renesas@fpond.eu" <uli+renesas@fpond.eu>,
        "george_davis@mentor.com" <george_davis@mentor.com>,
        "andrew_gabbasov@mentor.com" <andrew_gabbasov@mentor.com>,
        "jiada_wang@mentor.com" <jiada_wang@mentor.com>,
        "yuichi.kusakabe@denso-ten.com" <yuichi.kusakabe@denso-ten.com>,
        "yasano@jp.adit-jv.com" <yasano@jp.adit-jv.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jslaby@suse.com" <jslaby@suse.com>,
        "yohhei.fukui@denso-ten.com" <yohhei.fukui@denso-ten.com>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "torii.ken1@fujitsu.com" <torii.ken1@fujitsu.com>
Subject: RE: [PATCH] serial: sh-sci: Support custom speed setting
Thread-Topic: [PATCH] serial: sh-sci: Support custom speed setting
Thread-Index: AQHV1sAgPlnOtMWuIkKRz6OcOs9dRKgDJUQAgBHWrICAL6+KAIAAQSSAgAAIqJA=
Date:   Thu, 12 Mar 2020 09:44:13 +0000
Message-ID: <OSBPR01MB50612C6EF774733B3496AECADFFD0@OSBPR01MB5061.jpnprd01.prod.outlook.com>
References: <20200129161955.30562-1-erosca@de.adit-jv.com>
 <CAMuHMdWV0kkKq6sKOHsdz+FFGNHphzq_q7rvmYAL=U4fH2H3wQ@mail.gmail.com>
 <20200210205735.GB1347752@kroah.com>
 <OSBPR01MB29496E76BE5FD0C5BC56D0F0C1FD0@OSBPR01MB2949.jpnprd01.prod.outlook.com>
 <CAMuHMdXYPG8t=vBn6c2B=8TwbWJfFCjW8peDLgHBwW_AxpH5Hw@mail.gmail.com>
In-Reply-To: <CAMuHMdXYPG8t=vBn6c2B=8TwbWJfFCjW8peDLgHBwW_AxpH5Hw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-securitypolicycheck: OK by SHieldMailChecker v2.6.2
x-shieldmailcheckerpolicyversion: FJ-ISEC-20181130-VDI-enc
x-shieldmailcheckermailid: dc6c490150be476bb047cee32aaea342
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ashiduka@fujitsu.com; 
x-originating-ip: [210.170.118.168]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5eb28cd0-9319-4c95-b279-08d7c669ec51
x-ms-traffictypediagnostic: OSBPR01MB3448:|OSBPR01MB3448:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB34486B1131036CFF29E50493DFFD0@OSBPR01MB3448.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(199004)(110136005)(85182001)(66946007)(54906003)(316002)(66556008)(64756008)(7696005)(66476007)(76116006)(66446008)(966005)(33656002)(4326008)(186003)(26005)(107886003)(53546011)(71200400001)(2906002)(6506007)(9686003)(81166006)(81156014)(7416002)(5660300002)(478600001)(52536014)(8936002)(55016002)(8676002)(86362001)(777600001);DIR:OUT;SFP:1101;SCL:1;SRVR:OSBPR01MB3448;H:OSBPR01MB5061.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6gmxsz1uBFAxwosNXJau+LxqWfCe2FrHFqqmV3ygJEHBsykqlGEzRMtDMKUANMovpHXuqyHrhZK/tXSRRZnnKhgJHfMiVN4Dn54tFX7q3P2Ih4tPzio82R3aXWgWQZNS4TtdyVw8HzNLZts9hPprvAM6ld3Sk3v3qdLwY15h9bH4S0lBamp8NIFRp66++RNT1Ycfy1y4aWKEIfcgnXeq/SPqwjqBXZhDkYszHWQm3g+sU902a5fJTKnzDACmv3gnMOEYp7XhL+pKgWeLrBXQJJoumAZga0HtUjFi7a/OzV/+zRvqSFvsRfJzd7k66trrO7miVR4afwWlDnJ1c+iK3zV0nxukYJL1B9edg1qer9rsWWfFEXU2y4hsyP1fiG+slqm5FmVUZBy+8XIvHFoIpLEUbt4JC1UR9SUWQBc3RCObl7ZNC1v26WBNz7Oo9IarrpsqzujhaWwTqhwpvgZoBvmzjcw/o0x5jGYaL+hStT2AeY3IDwnf7v26NeF5qmULxqzTBqZAe1RLPIrOlMKKgmsGRAsixtPb77hXM2dIXWomYE8+/ZskZIuFR/D6R1Qu
x-ms-exchange-antispam-messagedata: jBH9f8+xdBpsj8SyOXNQtuXX3BWY5wAOvz2KQHGdK+Tzi5Dh53DOTH3qWKRfmIjKri3F5XDtSj4WHaGYxeSVa1ofH3yQwdQCn2r9/N+0ggNSxdCzA/JVo03IqEYT5riFe+3WJY1W73anoelk4l5lPg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb28cd0-9319-4c95-b279-08d7c669ec51
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 09:44:13.3658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0RprNcP5ho5Sx9xqs/R/AwKjIHph6W2ZBhTBwDU7/JAoy24hHc6I9+AVdE6S2k9JJ7vHZuZ88mowPGqb6BsfEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3448
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RGVhciBHcmVnLCBHZWVydCwNCg0KPiBJIGd1ZXNzIHlvdSBtZWFuIHRoZSBmb3J3YXJkIGRlY2xh
cmF0aW9uIG9mIGlvY3RybCgpPw0KPiBObywgdGhleSBzaG91bGQgaW5jbHVkZSA8c3lzL2lvY3Rs
Lmg+IGluc3RlYWQuDQoNClJpZ2h0Lg0KQWRkaW5nICIjaW5jbHVkZSA8c3lzL2lvY3RsLmg+IiB0
byBHcmVnJ3Mgc2FtcGxlIGNvZGUgY2F1c2VzIGEgDQpjb21waWxhdGlvbiBlcnJvci4NCg0KPiA+
IEkgc2F3IHRoZSBjb2RlIGFib3ZlLCBJIHRob3VnaHQgSSB3b3VsZG4ndCB3cml0ZSBzdWNoIGNv
ZGUgbm9ybWFsbHkuDQo+IFdoeSBub3Q/DQoNCklzIGl0IG5vcm1hbCB0byBkZWNsYXJlIGlvY3Rs
KCkgd2l0aG91dCAiI2luY2x1ZGUgPHN5cy9pb2N0bC5oPiIgPw0KDQpUaGFua3MgJiBCZXN0IFJl
Z2FyZHMsDQpZdXVzdWtlIEFzaGlkdWthIDxhc2hpZHVrYUBmdWppdHN1LmNvbT4NCkVtYmVkZGVk
IFN5c3RlbSBEZXZlbG9wbWVudCBEZXB0LiBFbWJlZGRlZCBTeXN0ZW0gRGV2ZWxvcG1lbnQgRGl2
Lg0KRlVKSVRTVSBDT01QVVRFUiBURUNITk9MT0dJRVMgTHRkLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAxMiwgMjAyMCA2OjAzIFBNDQo+IFRvOiBU
b3JpaSwgS2VuaWNoaS/ps6XlsYUg5YGl5LiAIDx0b3JpaS5rZW4xQGZ1aml0c3UuY29tPg0KPiBD
YzogZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGVyb3NjYUBkZS5hZGl0LWp2LmNvbTsNCj4g
bGludXgtc2VyaWFsQHZnZXIua2VybmVsLm9yZzsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJu
ZWwub3JnOw0KPiB3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbTsNCj4geW9zaGloaXJv
LnNoaW1vZGEudWhAcmVuZXNhcy5jb207IHVsaStyZW5lc2FzQGZwb25kLmV1Ow0KPiBnZW9yZ2Vf
ZGF2aXNAbWVudG9yLmNvbTsgYW5kcmV3X2dhYmJhc292QG1lbnRvci5jb207DQo+IGppYWRhX3dh
bmdAbWVudG9yLmNvbTsgeXVpY2hpLmt1c2FrYWJlQGRlbnNvLXRlbi5jb207DQo+IHlhc2Fub0Bq
cC5hZGl0LWp2LmNvbTsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4ganNsYWJ5QHN1
c2UuY29tOyB5b2hoZWkuZnVrdWlAZGVuc28tdGVuLmNvbTsgQXNoaXp1a2EsIFl1dXN1a2UvDQo+
IOiKpuWhmiDpm4Tku4sgPGFzaGlkdWthQGZ1aml0c3UuY29tPjsgbWFnbnVzLmRhbW1AZ21haWwu
Y29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHNlcmlhbDogc2gtc2NpOiBTdXBwb3J0IGN1c3Rv
bSBzcGVlZCBzZXR0aW5nDQo+IA0KPiBIaSBUb3JpaS1zYW4sDQo+IA0KPiBPbiBUaHUsIE1hciAx
MiwgMjAyMCBhdCA2OjEwIEFNIHRvcmlpLmtlbjFAZnVqaXRzdS5jb20NCj4gPHRvcmlpLmtlbjFA
ZnVqaXRzdS5jb20+IHdyb3RlOg0KPiA+IE9uIFR1ZSwgMTEgRmViIDIwMjAgMDU6NTc6MzUgKzA5
MDAsDQo+ID4gR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiA+ID4gT24gVGh1LCBKYW4gMzAs
IDIwMjAgYXQgMDE6MzI6NTBQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9ldmVuDQo+IHdyb3RlOg0K
PiA+ID4gPiBPbiBXZWQsIEphbiAyOSwgMjAyMCBhdCA1OjIwIFBNIEV1Z2VuaXUgUm9zY2ENCj4g
PGVyb3NjYUBkZS5hZGl0LWp2LmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gRnJvbTogVG9yaWkgS2Vu
aWNoaSA8dG9yaWkua2VuMUBqcC5mdWppdHN1LmNvbT4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRo
aXMgcGF0Y2ggaXMgbmVjZXNzYXJ5IHRvIHVzZSBCVCBtb2R1bGUgYW5kIFhNIG1vZHVsZSB3aXRo
DQo+IERFTlNPIFRFTg0KPiA+ID4gPiA+IGRldmVsb3BtZW50IGJvYXJkLg0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gVGhpcyBwYXRjaCBzdXBwb3J0cyBBU1lOQ19TUERfQ1VTVCBmbGFnIGJ5IGlvY3Rs
KFRJT0NTU0VSSUFMKSwNCj4gZW5hYmxlcw0KPiA+ID4gPiA+IGN1c3RvbSBzcGVlZCBzZXR0aW5n
IHdpdGggc2V0c2VyaWFsKDEpLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhlIGN1c3RvbSBzcGVl
ZCBpcyBjYWxjdWxhdGVkIGZyb20gdWFydGNsayBhbmQNCj4gY3VzdG9tX2Rpdmlzb3IuDQo+ID4g
PiA+ID4gSWYgY3VzdG9tX2Rpdmlzb3IgaXMgemVybywgY3VzdG9tIHNwZWVkIHNldHRpbmcgaXMg
aW52YWxpZC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFRvcmlpIEtlbmlj
aGkgPHRvcmlpLmtlbjFAanAuZnVqaXRzdS5jb20+DQo+ID4gPiA+ID4gW2Vyb3NjYTogcmViYXNl
IGFnYWluc3QgdjUuNV0NCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBFdWdlbml1IFJvc2NhIDxl
cm9zY2FAZGUuYWRpdC1qdi5jb20+DQo+ID4gPiA+DQo+ID4gPiA+IFRoYW5rcyBmb3IgeW91ciBw
YXRjaCENCj4gPiA+ID4NCj4gPiA+ID4gV2hpbGUgdGhpcyBzZWVtcyB0byB3b3JrIGZpbmVbKl0s
IEkgaGF2ZSBhIGZldw0KPiBjb21tZW50cy9xdWVzdGlvbnM6DQo+ID4gPiA+ICAgMS4gVGhpcyBm
ZWF0dXJlIHNlZW1zIHRvIGJlIGRlcHJlY2F0ZWQ6DQo+ID4gPiA+DQo+ID4gPiA+ICAgICAgICAg
IHNoLXNjaSBlNmU2ODAwMC5zZXJpYWw6IHNldHNlcmlhbCBzZXRzIGN1c3RvbSBzcGVlZA0KPiBv
bg0KPiA+ID4gPiB0dHlTQzEuIFRoaXMgaXMgZGVwcmVjYXRlZC4NCj4gPiA+ID4NCj4gPiA+ID4g
ICAyLiBBcyB0aGUgd2FudGVkIHNwZWVkIGlzIHNwZWNpZmllZCBhcyBhIGRpdmlkZXIsIHRoZSBy
ZXN1bHRpbmcNCj4gc3BlZWQNCj4gPiA+ID4gICAgICBtYXkgYmUgb2ZmLCBjZnIuIHRoZSBleGFt
cGxlIGZvciA1NzYwMCBiZWxvdy4NCj4gPiA+ID4gICAgICBOb3RlIHRoYXQgdGhlIFNDSUYgZGV2
aWNlIGhhcyBtdWx0aXBsZSBjbG9jayBpbnB1dHMsIGFuZA0KPiBjYW4gZG8NCj4gPiA+ID4gICAg
ICA1NzYwMCBwZXJmZWN0bHkgaWYgdGhlIHJpZ2h0IGNyeXN0YWwgaGFzIGJlZW4gZml0dGVkLg0K
PiA+ID4gPg0KPiA+ID4gPiAgMy4gV2hhdCB0byBkbyB3aXRoICJbUEFUQ0gvUkZDXSBzZXJpYWw6
IHNoLXNjaTogVXBkYXRlIHVhcnRjbGsNCj4gYmFzZWQNCj4gPiA+ID4gICAgICBvbiBzZWxlY3Rl
ZCBjbG9jayINCj4gKGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExMDM3MDMv
KT8NCj4gPiA+ID4gICAgICBDb21iaW5lZCB3aXRoIHRoaXMsIHRoaW5ncyBiZWNvbWUgcHJldHR5
IGNvbXBsaWNhdGVkIGFuZA0KPiA+ID4gPiAgICAgIHVucHJlZGljdGFibGUsIGFzIHVhcnRjbGsg
bm93IGFsd2F5cyByZWZsZWN0IHRoZSBmcmVxdWVuY3kNCj4gb2YgdGhlDQo+ID4gPiA+ICAgICAg
bGFzdCB1c2VkIGJhc2UgY2xvY2ssIHdoaWNoIHdhcyB0aGUgb3B0aW1hbCBvbmUgZm9yIHRoZQ0K
PiBwcmV2aW91c2x5DQo+ID4gPiA+ICAgICAgdXNlZCBzcGVlZC4uLi4NCj4gPiA+ID4NCj4gPiA+
ID4gSSB0aGluayBpdCB3b3VsZCBiZSBlYXNpZXIgaWYgd2UganVzdCBoYWQgYW4gQVBJIHRvIHNw
ZWNpZnkNCj4gYSByYXcgc3BlZWQuDQo+ID4gPiA+IFBlcmhhcHMgdGhhdCBhbHJlYWR5IGV4aXN0
cz8NCj4gPiA+DQo+ID4gPiBZZXMsIHNlZToNCj4gPiA+ICAgICAgIGh0dHA6Ly93d3cucGFuaXgu
Y29tL35ncmFudGUvYXJiaXRyYXJ5LWJhdWQuYw0KPiA+DQo+ID4gSSBzYXcgdGhlIGNvZGUgYWJv
dmUsIEkgdGhvdWdodCBJIHdvdWxkbid0IHdyaXRlIHN1Y2ggY29kZSBub3JtYWxseS4NCj4gPg0K
PiA+ID4jaW5jbHVkZSA8bGludXgvdGVybWlvcy5oPg0KPiA+ID4NCj4gPiA+aW50IGlvY3RsKGlu
dCBkLCBpbnQgcmVxdWVzdCwgLi4uKTsNCj4gPg0KPiA+IERvIGFwcGxpY2F0aW9uIHByb2dyYW1t
ZXJzIGhhdmUgdG8gYWNjZXB0IHRoaXMgYmFkIGNvZGU/DQo+IA0KPiBJIGd1ZXNzIHlvdSBtZWFu
IHRoZSBmb3J3YXJkIGRlY2xhcmF0aW9uIG9mIGlvY3RybCgpPw0KPiBObywgdGhleSBzaG91bGQg
aW5jbHVkZSA8c3lzL2lvY3RsLmg+IGluc3RlYWQuDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywN
Cj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tDQo+IGdl
ZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhDQo+IGhhY2tlci4gQnV0DQo+IHdoZW4g
SSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29t
ZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
LSBMaW51cyBUb3J2YWxkcw0K
