Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 105E1278D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2019 11:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbfEWJIC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 May 2019 05:08:02 -0400
Received: from mail-eopbgr1400138.outbound.protection.outlook.com ([40.107.140.138]:57081
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726913AbfEWJH7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 May 2019 05:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKlZX0NW+Mpk7xn/91gSke3ikCObMEoYmqB8hkK1mdM=;
 b=r8KD3LFrB5UKwZkiqz/FsaRzUWjvCUjbWTgn7kX7ywkyroyL1UG7ycgZbdtMUiuRxXZS0fh6eH2E0D9FL2Vg01Dp89a/YmJvZHTM11Va53HqZYbFeX0dRndtiEZ6XEBTgelMqwd0/p9uj6S5FaR4pw2CnvWAzuNz2CHoDK8W6jI=
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com (52.133.177.145) by
 TYAPR01MB3151.jpnprd01.prod.outlook.com (20.177.104.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.17; Thu, 23 May 2019 09:07:52 +0000
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::3ccf:1aef:8f88:693d]) by TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::3ccf:1aef:8f88:693d%2]) with mapi id 15.20.1922.017; Thu, 23 May 2019
 09:07:52 +0000
From:   Chris Paterson <Chris.Paterson2@renesas.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] scripts/spelling.txt: Add spelling fix for prohibited
Thread-Topic: [PATCH] scripts/spelling.txt: Add spelling fix for prohibited
Thread-Index: AQHVCmp0joBlvnu+SEWH+n+koSlr5qZrIJwAgACrVgCAAoL7gIAHAqMAgACYEQCAAo7IgA==
Date:   Thu, 23 May 2019 09:07:51 +0000
Message-ID: <TYAPR01MB2285F1CD8540CBC4795D8708B7010@TYAPR01MB2285.jpnprd01.prod.outlook.com>
References: <20190514153341.22540-1-chris.paterson2@renesas.com>
 <155786877257.14659.6751252865489860937@swboyd.mtv.corp.google.com>
 <CAMuHMdWPSyrhYx5Z5mgmKrR68cHL6owcRT=B3+DD3GhhxuG4zw@mail.gmail.com>
 <20190516215406.75E5D2082E@mail.kernel.org>
 <CAMuHMdVOKDRYjzmyRq-KXW8d+dYmAxnM+=y2yOh85YDcCEDMuw@mail.gmail.com>
 <20190521180137.A7A30217D7@mail.kernel.org>
In-Reply-To: <20190521180137.A7A30217D7@mail.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Paterson2@renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8337eaf-8308-46c3-7ad6-08d6df5e22ab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3151;
x-ms-traffictypediagnostic: TYAPR01MB3151:
x-microsoft-antispam-prvs: <TYAPR01MB3151C64E8056E6366A796929B7010@TYAPR01MB3151.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(396003)(136003)(366004)(376002)(199004)(189003)(5660300002)(256004)(7736002)(14444005)(110136005)(4326008)(52536014)(99286004)(54906003)(33656002)(25786009)(26005)(2906002)(305945005)(81166006)(8936002)(53936002)(8676002)(316002)(76176011)(81156014)(68736007)(3846002)(6116002)(186003)(74316002)(7696005)(76116006)(73956011)(66946007)(66066001)(66476007)(66556008)(66446008)(64756008)(6246003)(102836004)(9686003)(478600001)(71200400001)(71190400001)(229853002)(11346002)(55016002)(6436002)(6506007)(86362001)(486006)(53546011)(14454004)(446003)(476003)(72206003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3151;H:TYAPR01MB2285.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XykWFxLjdyFDsow7Sg3vuAqLiDJ5QRjSB19rKXQi4VJqB6UxvZE236t8ITwmMv4RzEr3lLtyjVUjtrPDIU1rRMi1xk4KaAQU+w4Z6fSk1I58eAWnkh/ToThmga5Okc0rA8vrxtSCIFEAN6JB4iQYu/vGQToSPvnd3ZnQ3PG4blVW0L6zMHUk6QP0bx1pMX1Iu8jRaYfv0cJbf6UXQRxEissabGAEY7e1nz7HOOWWwAceZwkw0+UGv9JE91LG7ZPpbUzxOW3KwwU5vHQLcK5RN5cNBFfMM/TRybWsB/NOXEAh4dC0njprWcjfi0NQGd9B20HxKzMBEXjZdgC4nsF+nsyavEsAaaiNY4Ay6N5KUPvRBRtZIhUHKMLHn91NJ1vzaR6QxuuD0OwGJMhGw+tRwP3vbRZLxSfTfRSkTqN8qJE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8337eaf-8308-46c3-7ad6-08d6df5e22ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 09:07:51.9668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Chris.Paterson2@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3151
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gU3RlcGhlbiwNCg0KPiBGcm9tOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+
DQo+IFNlbnQ6IDIxIE1heSAyMDE5IDE5OjAyDQo+IA0KPiBRdW90aW5nIEdlZXJ0IFV5dHRlcmhv
ZXZlbiAoMjAxOS0wNS0yMSAwMTo1NzoyMCkNCj4gPiBIaSBTdGVwaGVuLCBBbmRyZXcsDQo+ID4N
Cj4gPiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAxMTo1NCBQTSBTdGVwaGVuIEJveWQgPHNib3lk
QGtlcm5lbC5vcmc+DQo+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IEd1ZXNzIHNvISBPciBBbmRyZXcg
ZG9lcyBpdC4NCj4gPg0KPiA+IEdpdmVuIHRoZSBjaGFuZ2UgdG8gc2NyaXB0cy9zcGVsbGluZy50
eHQgY29uZmxpY3RzIHdpdGggYjkzNzg1NmE1ZGIyY2I3YQ0KPiA+ICgic2NyaXB0cy9zcGVsbGlu
Zy50eHQ6IGFkZCBtb3JlIHR5cG9zIHRvIHNwZWxsaW5nLnR4dCBhbmQgc29ydCIpIGluDQo+ID4g
bGludXgtbmV4dCwgYW5kIHRoZSByaXNrIG9mIGNvbmZsaWN0IHdpdGggZnV0dXJlIGNoYW5nZXMg
dG8NCj4gPiBkcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3NDcwLWNwZy1tc3NyLmMgaXMgc2xpbSwg
SSdkIGxpa2UgdG8gZGVmZXIgdGhpcw0KPiA+IHRvIEFuZHJldy4NCj4gPg0KPiA+IEFja2VkLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gT2su
IE9yIENocmlzIGNhbiBzcGxpdCB0aGUgcGF0Y2ggaW50byB0aGUgY2xrIHBhcnQgYW5kIHRoZSBz
Y3JpcHRzLw0KPiBwYXJ0PyAgVGhleSdyZSBvbmx5IGxvb3NlbHkgcmVsYXRlZCB0byBlYWNoIG90
aGVyLCBzbyBJJ20gbm90IHN1cmUgd2h5DQo+IHRoZXkgd2VyZSBzZW50IGluIG9uZSBwYXRjaCBi
ZXNpZGVzIGZvciBlYXNlIG9mIHRyYW5zcG9ydC4NCg0KSGFwcHkgdG8gc3BsaXQgdGhlIHBhdGNo
IGlmIHlvdSB3YW50LiBJIGNvbWJpbmVkIHRoZSBwYXRjaCBhcyBJIHNhdyB0aGF0IGRvbmUgaW4g
YSBjb3VwbGUgb2YgZXhhbXBsZXMgaW4gdGhlIGdpdCBsb2cuDQoNCkhvd2V2ZXIsIEkgZ290IGFu
IGF1dG9tYXRlZCBlbWFpbCBmcm9tIGFrcG0gc2F5aW5nIHRoYXQgdGhpcyBwYXRjaCB3YXMgYWRk
ZWQgdG8gdGhlIC1tbSB0cmVlOyBzbyBJIGRvbid0IGtub3cgaWYgeW91IHN0aWxsIHdhbnQgbWUg
dG8gc3BsaXQgdXAgdGhpcyBwYXRjaCBvciBub3QuDQpMZXQgbWUga25vdy4NCg0KS2luZCByZWdh
cmRzLCBDaHJpcw0K
