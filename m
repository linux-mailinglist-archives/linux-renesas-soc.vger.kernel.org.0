Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06201E3AC5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 09:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387580AbgE0HkU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 03:40:20 -0400
Received: from mail-eopbgr1410098.outbound.protection.outlook.com ([40.107.141.98]:3489
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387444AbgE0HkS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 03:40:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGxkBzWVRIGpXu5xg60cZ5ZNxVR85J/pJpuxKrYMGKj+SNFBXCK3pav14N8ikakjN8MeshctnY3xdxZM9mWOoic/4BRqgob5DkyJx3m1wUwU/P1xdExACbh7KwnR539yIMxOFMN9eYRuC66Xb8+vVQtLKTCCebTnjGS5RtUto95QWu2W+Ul+al7cLycmlhG6aNjsPas9E6Akh0bzz4Y3Kl/cmNcvcRYWpiH9uVN425AuBJNa9IC1YHzc84Y48y0/w7ZV8avCmZX2HzOYPC8hBlDa+L7PyHcQe8A9AHj+qfuPr5CMbO3YXUTdB9dBYc0MX6JN0s1oIUVxHTPH7eHcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RlMt1IIV+0Tb9BN+ly15+dljxe6TeB6pfhFK52Nj8Y=;
 b=EjcTQhaG4nBFS6mL3loROMhOvv9QfWEfJ+0B+Hs/8m6mB/KOw4MaEIqJhdCfZ3PCieHqYKhAXAwc9t0ghocSDIjn0Ug97c1zCpEqlSKxPtvR+oBIN2fWUeWvRvIwzMXKRiuzW6K/BtX3FJYCZ0OeK54icAT0GtW6Dl6RH4bPXgV6UeSe8hqD7clrGEYPYv0q6y5I5ggFzUMIrz7e89D4+64oEgrmHNh47H4enzwzKRqyx2YET97dSP1EVV2B/J9br14a8NezAVxymrpg5YNUaDOXEPrIGZmlObAU52ov06/bP+UbQS7ZusKkOjHSoZyO0ancTaN47riIUqlRqCj/Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RlMt1IIV+0Tb9BN+ly15+dljxe6TeB6pfhFK52Nj8Y=;
 b=pqEbnn3GDLEfguyHo4PrU4E10TTy2fZefOa88iTwBvochodCRljBax2Wj2Q+U/Vy1i/g7syY04yKuGOdi59TbmyfC1RfNxc5bUH9D1JkMg9Vl26fHgS3GSCCsYpXo+soySfz4SXFRPtJBimtEovHBjaGipQdhazMKd2/qPaBkNw=
Received: from OSAPR01MB2114.jpnprd01.prod.outlook.com (2603:1096:603:1b::19)
 by OSAPR01MB2179.jpnprd01.prod.outlook.com (2603:1096:603:15::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.25; Wed, 27 May
 2020 07:40:14 +0000
Received: from OSAPR01MB2114.jpnprd01.prod.outlook.com
 ([fe80::2cc4:72d3:1ade:f467]) by OSAPR01MB2114.jpnprd01.prod.outlook.com
 ([fe80::2cc4:72d3:1ade:f467%3]) with mapi id 15.20.3021.029; Wed, 27 May 2020
 07:40:14 +0000
From:   Gotthard Voellmeke <gotthard.voellmeke@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>
CC:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        "VenkataRajesh.Kalakodima@in.bosch.com" 
        <VenkataRajesh.Kalakodima@in.bosch.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        KOJI MATSUOKA <koji.matsuoka.xm@renesas.com>,
        "muroya@ksk.co.jp" <muroya@ksk.co.jp>,
        "Harsha.ManjulaMallikarjun@in.bosch.com" 
        <Harsha.ManjulaMallikarjun@in.bosch.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Sean Paul <seanpaul@chromium.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        "REE efriedrich@DE.ADIT-JV.COM" <efriedrich@DE.ADIT-JV.COM>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        "ChaitanyaKumar.Borah@in.bosch.com" 
        <ChaitanyaKumar.Borah@in.bosch.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Hien Dang <hien.dang.eb@renesas.com>,
        Michael Klein <michael.klein@renesas.com>
Subject: RE: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Thread-Topic: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Thread-Index: AQHWM/az9Wj0IB2es0azt72Olaa0j6i7ipYAgAABNVA=
Date:   Wed, 27 May 2020 07:40:14 +0000
Message-ID: <OSAPR01MB2114E435BCF6B1F47F331F298BB10@OSAPR01MB2114.jpnprd01.prod.outlook.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <CAMuHMdVGcFGL6V6_zDCPQA66VFyqM9bQ6choWs8eYfOieFu1ZQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVGcFGL6V6_zDCPQA66VFyqM9bQ6choWs8eYfOieFu1ZQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 13638679-aa40-44ac-8ba5-08d8021131dc
x-ms-traffictypediagnostic: OSAPR01MB2179:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB2179312E6709C83FCF4D01F98BB10@OSAPR01MB2179.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04163EF38A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ridWxV1DJh4hWQaJz/QvB2smLZbzqRS+ZEnU2TDRtir07BYalPD7ig7zrfXlXWJYXDCp7RJaqjV10lU3uH71fWyygLNbErsebe6wARuNRrHSQFB9j4jyZS3tYhx6zPluP3MqtTZKm4Sov/7u4SrwewtBoXrqtH0Mh1iz/Vbkoxn46jEC+vJpBRUrk8f1a285COac7zsHWNLRTfyle4WlS8r5/B8ZfbR50A2o+ydjiw5HKPeIZaZRE0VeBLA+MXGtDq1tlxb+Sw0Zs5DhcYdDhGIdOdzdIe9WQXXGvPL5Vajw9/NgEGDuyfZzIuDlXavGnF00VFS+XTPjuiIr8Oplpw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2114.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(6506007)(64756008)(44832011)(66946007)(66446008)(66556008)(66476007)(33656002)(76116006)(8936002)(4326008)(54906003)(83380400001)(110136005)(7696005)(107886003)(316002)(52536014)(8676002)(478600001)(186003)(53546011)(7416002)(55016002)(86362001)(2906002)(9686003)(26005)(5660300002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 41w9GU2X+UqhIdldCAAmROuZHLJbqyD6LiVoE2IJir6/1Mf7SAYawBCmkRjvRTS2yO+CsaGJHpM0luWPAyqytIhf1AR/sJ9JdfSE1P4oaI80syX51067GwzbsAUfsWIj+tOLUGaWdydaDjGqw0vk5TvB9myTM94UmFoE9kAIqtFLR823ce9c24xS7NxZBCVgfVxLmq6UAyEziq42DpM7hmdzghHuaXih6uzTqSyNOuvPZYQEpjzXZuLL9DM9qvA8GiwdV4gI7G3hXoXxgO1C4mncxyb6y6pyY1MlaModBalDtpBYQJBlNaND2f0kHulUpa/QR9WBadRtWNz3lOpAYcGRRTH9j4SCZWVbjxtr8TiCOFGUjPF5TYCkw9OFbWMOTC/aZPCVfQdnKcvTbeZdi/VhnBP1Q6AtA9CxuassXZziSxW/0gsI57ZhQ8DrzFuH3CpBYYVmz47zS7sQ/17S4nNm39AhUexS8mJJiiNZ+IyyiO2PQkqd6Kfcz8DhiF2x
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13638679-aa40-44ac-8ba5-08d8021131dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2020 07:40:14.2294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UVB/JSFfC7rA5UoSbAVYbZKxkw5yB65xe6+bhopZMwkmqwueHlQ7srfs64WrVfGQdOJNEJfUpMQSamGSPlHio4iEJptUMdEkBih1EopLBaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2179
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

QWRkZWQgSGllbi1zYW4sIE1pY2hhZWwgSy4gZnJvbSBSZW5lc2FzLg0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NClNlbnQ6IE1pdHR3b2NoLCAyNy4gTWFpIDIwMjAgMDk6MzUNClRvOiBSRUUgZXJvc2Nh
QERFLkFESVQtSlYuQ09NIDxlcm9zY2FAREUuQURJVC1KVi5DT00+DQpDYzogSmFjb3BvIE1vbmRp
IDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPjsgTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPjsgS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFt
K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT47IFNpbW9uIEhvcm1hbiA8aG9ybXNAdmVyZ2UubmV0
LmF1PjsgVWxyaWNoIEhlY2h0IDx1bGkrcmVuZXNhc0BmcG9uZC5ldT47IFZlbmthdGFSYWplc2gu
S2FsYWtvZGltYUBpbi5ib3NjaC5jb207IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IEtPSkkgTUFUU1VPS0EgPGtvamkubWF0
c3Vva2EueG1AcmVuZXNhcy5jb20+OyBtdXJveWFAa3NrLmNvLmpwOyBIYXJzaGEuTWFuanVsYU1h
bGxpa2FyanVuQGluLmJvc2NoLmNvbTsgRXplcXVpZWwgR2FyY2lhIDxlemVxdWllbEBjb2xsYWJv
cmEuY29tPjsgU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+OyBMaW51eC1SZW5lc2Fz
IDxsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc+OyBEUkkgRGV2ZWxvcG1lbnQgPGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0
IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgTWljaGFlbCBEZWdlIDxtaWNoYWVsLmRl
Z2VAcmVuZXNhcy5jb20+OyBHb3R0aGFyZCBWb2VsbG1la2UgPGdvdHRoYXJkLnZvZWxsbWVrZUBy
ZW5lc2FzLmNvbT47IFJFRSBlZnJpZWRyaWNoQERFLkFESVQtSlYuQ09NIDxlZnJpZWRyaWNoQERF
LkFESVQtSlYuQ09NPjsgTWljaGFlbCBSb2RpbiA8bXJvZGluQGRlLmFkaXQtanYuY29tPjsgQ2hh
aXRhbnlhS3VtYXIuQm9yYWhAaW4uYm9zY2guY29tOyBFdWdlbml1IFJvc2NhIDxyb3NjYWV1Z2Vu
aXVAZ21haWwuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2NSAwLzhdIGRybTogcmNhci1kdTog
QWRkIENvbG9yIE1hbmFnZW1lbnQgTW9kdWxlIChDTU0pDQoNCkhpIEV1Z2VuaXUsDQoNCk9uIFdl
ZCwgTWF5IDI3LCAyMDIwIGF0IDk6MTYgQU0gRXVnZW5pdSBSb3NjYSA8ZXJvc2NhQGRlLmFkaXQt
anYuY29tPiB3cm90ZToNCj4gT24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMTI6NDY6MTNQTSArMDIw
MCwgSmFjb3BvIE1vbmRpIHdyb3RlOg0KPiA+IENNTSBmdW5jdGlvbmFsaXRpZXMgYXJlIHJldGFp
bmVkIGJldHdlZW4gc3VzcGVuZC9yZXN1bWUgY3ljbGVzICh0ZXN0ZWQgd2l0aA0KPiA+IHN1c3Bl
bmQtdG8taWRsZSkgd2l0aG91dCByZXF1aXJpbmcgYSByZS1wcm9ncmFtbWluZyBvZiB0aGUgTFVU
IHRhYmxlcy4NCj4NCj4gSG1tLiBJcyB0aGlzIGJhY2tlZCB1cCBieSBhbnkgc3RhdGVtZW50IGlu
IHRoZSBIVyBVc2VyJ3MgbWFudWFsPw0KPiBUaGlzIGNvbWVzIGluIGNvbnRyYXN0IHdpdGggdGhl
IG9yaWdpbmFsIFJlbmVzYXMgQ01NIGltcGxlbWVudGF0aW9uIFsqKl0NCj4gd2hpY2ggZG9lcyBt
YWtlIHVzZSBvZiBzdXNwZW5kICh3aGVyZSB0aGUgZnJlZXplIGFjdHVhbGx5IGhhcHBlbnMpLg0K
Pg0KPiBDYW4gd2UgaW5mZXIsIGJhc2VkIG9uIHlvdXIgc3RhdGVtZW50LCB0aGF0IHdlIGNvdWxk
IGFsc28gZ2V0IHJpZCBvZg0KPiB0aGUgc3VzcGVuZCBjYWxsYmFjayBpbiBbKipdPw0KDQpXaGls
ZSB0aGUgQ01NIHN0YXRlIHdpbGwgYmUgcmV0YWluZWQgYWNyb3NzIHN1c3BlbmQtdG8taWRsZSwg
SSdtIHF1aXRlDQpzdXJlIGl0IHdpbGwgYmUgbG9zdCBieSBzdXNwZW5kLXRvLVJBTSwgYXQgbGVh
c3Qgb24gdGhlIFNhbHZhdG9yLVgoUyksDQpVTENCLCBhbmQgRWJpc3UgZGV2ZWxvcG1lbnQgYm9h
cmRzLCBhcyBQU0NJIHdpbGwgYXNrIHRoZSBCRDk1NzFXTVYNCnJlZ3VsYXRvciB0byBwb3dlciBk
b3duIHRoZSBSLUNhciBTb0MuDQoNClNvIElNSE8gd2UgZG8gbmVlZCBzdXNwZW5kL3Jlc3VtZSBo
YW5kbGluZy4NCg0KR3J7b2V0amUsZWV0aW5nfXMsDQoNCiAgICAgICAgICAgICAgICAgICAgICAg
IEdlZXJ0DQoNCi0tDQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4
IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQoNCkluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBC
dXQNCndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBHbWJI
LCBHZXNjaGFlZnRzZnVlaHJlci9QcmVzaWRlbnQ6IENhcnN0ZW4gSmF1Y2gsIFNpdHogZGVyIEdl
c2VsbHNjaGFmdC9SZWdpc3RlcmVkIG9mZmljZTogRHVlc3NlbGRvcmYsIEFyY2FkaWFzdHJhc3Nl
IDEwLCA0MDQ3MiBEdWVzc2VsZG9yZiwgR2VybWFueSwgSGFuZGVsc3JlZ2lzdGVyL0NvbW1lcmNp
YWwgUmVnaXN0ZXI6IER1ZXNzZWxkb3JmLCBIUkIgMzcwOCBVU3QtSUROci4vVGF4IGlkZW50aWZp
Y2F0aW9uIG5vLjogREUgMTE5MzUzNDA2IFdFRUUtUmVnLi1Oci4vV0VFRSByZWcuIG5vLjogREUg
MTQ5Nzg2NDcNCg==
