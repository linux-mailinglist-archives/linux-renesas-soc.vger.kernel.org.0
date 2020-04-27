Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE74A1BB0B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2020 23:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgD0Vni (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Apr 2020 17:43:38 -0400
Received: from mail-eopbgr1400110.outbound.protection.outlook.com ([40.107.140.110]:28064
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726030AbgD0Vni (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Apr 2020 17:43:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftSLy/Ceiy/XUMN15/KStoufX09Aed8RF98XzCsLrenBIwopFUYdYge2AqdQm/VMJW3Fk7YU0bY3OmlPuUHDRefMyk5mTU52FZKPQl6zjGWk0/H2/AXBrURZsPgtJ/wrs9QvHw+FHFl81ieN0BsAipTkHYrr8sjGj1NtAyLLT672R8L5KDoJLVuAqY1/qDEGMPkMEQUhHhhAplRu3VMmw2u5D81q0gI6Xpi/o2bHNjCrqtELl1jz551+HqZh3r8AWu9WAKJPkUkv65NdMBhoWoPEPs2Yrv1vuu/Do8EwhqoJbGzEhjBx3t8juMOThfYB3xb/tofhOx97/5ukYRE15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eICSCz317Zmp6z9Ofv1kekiE32jgSg7nUKiaGGxhDyA=;
 b=jI6sDrX9dhMTjSAOWckPZsPMQmGegjsK4NHNpbJ/Po8JU65+nVaVcc+TFp68E0pvbYtXO09W/NQu86R7mo8xGJCAjd4+HvpJ96LumwmYUKV4S5Z2j942J7LrUdaTAaKe4v9cZ55BaMuEY8+mvzNrRELpkWV14F4cHiAcXHtHMxsLgbz8SPIMXWg0YMA0D7QJjMPZkUL/O+qCcgsi11xNMOQvZNXnt4kn97aykSQGx+PUJmZF18T3jckyQlErR+XBZhu0IQkhp/+QKe8ps7u+RFwhGJnRwqImkY4LtuNw/DYVhoN8zQlw/FVPRTUmqRpUQp5QOpL5n6e6jnUfBdxEOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eICSCz317Zmp6z9Ofv1kekiE32jgSg7nUKiaGGxhDyA=;
 b=jwTU6lnnWCTatZhS++8qX5GGyL4gUsTE+6ZXisWkJ4xkHYGuJivk7S9ygIWVMHE01Tr0rj/DyDiu/T2HAWJnRzD/aueaeHneiNg6rFN6AUE/DRxV3+Xbnm+k33yVIunKxPy/XjppafjDE5GZATqqa105WUd+uk2neCBLCa3hIkU=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB1493.jpnprd01.prod.outlook.com (52.134.226.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.13; Mon, 27 Apr 2020 21:43:34 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::383a:9fc3:aaa4:d3b]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::383a:9fc3:aaa4:d3b%7]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 21:43:34 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] ARM: dts: r8a7743: Add missing compatible strings for
 iic3 node
Thread-Topic: [PATCH] ARM: dts: r8a7743: Add missing compatible strings for
 iic3 node
Thread-Index: AQHWHK+1m9VPteLoIEeShiDQLDt3XaiNY1uAgAAakFA=
Date:   Mon, 27 Apr 2020 21:43:33 +0000
Message-ID: <OSBPR01MB35901F08080A85F7EEE84E81AAAF0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1588004391-8461-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXG_hpb==xY88vCEguc-n8kg_4vjv_Xmmh5jEGr37BPKA@mail.gmail.com>
In-Reply-To: <CAMuHMdXG_hpb==xY88vCEguc-n8kg_4vjv_Xmmh5jEGr37BPKA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6ac8fe1c-8427-4a00-2d01-08d7eaf40925
x-ms-traffictypediagnostic: OSBPR01MB1493:
x-microsoft-antispam-prvs: <OSBPR01MB1493D622BE80EB226FCA3A3CAAAF0@OSBPR01MB1493.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0386B406AA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(366004)(9686003)(7696005)(66556008)(4326008)(81156014)(33656002)(8936002)(6506007)(52536014)(53546011)(66946007)(66476007)(6916009)(66446008)(64756008)(8676002)(76116006)(2906002)(186003)(316002)(86362001)(26005)(5660300002)(55016002)(71200400001)(54906003)(478600001);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FkB+qOnQsYuBOVlPtX2gBrsWOcDYj927xi2O1Q7PyTCA/BdldL+vKvZBovOn3/NTC/u2aWbNyXOQlJ/HJB9/FI7DcbeQDIYou85l6REDA9UoRSmQg3xua2Q4/pyBvVc9kPNGswsHbUj8/3cVeIYoe0LMb2BBh9sJ9zRwxF5D4xmCQugifsaGPh86RE8HER6pcEJs3f8UJhCnV5I6ymlqnDKUoPHojoDPYawuyTXIfSG/HDpGKGHuuRec3vrMtlACJIrpCFriK32igc7/Q+/ZZ6nl0+G4O83adBrMdQ1Blu/FCUQ5P3oj6MPm0BP1+5u4Lesd63b44Kl+tOAGPHrFpVKMzBcaXYSAlxUnUxqRwDi4hpv/mRnSnUwm8uz5U0+1DCNkgyPneukFAv0PV4m0iYPo8RZjX+4PRep8vRD3RNBvMO+zuxA9LQWFNbPsqvn/J0DMK9+I2VhUXZI1vGJPaJsnkh/7J9DEL5IsN1NjqV9GV5jU3C66feobskNmE9EGYVwfKr1pi8aXedcxA796OA==
x-ms-exchange-antispam-messagedata: o7dF0ANGqZghu8Rh7Whnre6iUVpwHM7y32r7cAvkcQyofkIzBqo79cRuWwdS6tBdPLoNX4APC9o2ba81/PDfMDV/joNedSERFoibylkSJe5do02UxDlemBvvANFjNZva39mpVx0g/oIe7I3mbGHUz9RWYEOcRTpvA2KbswuJOO6amRU5UY6YZxykjKURTBLd+vXArrh+IeDsFK7gMZWxpkMjplqPei/vzV3LwMd5R+qNLG8aLPNtBZEYDg5gkpcK8ZUE5TbZ7WfkBHR8sJgGxXw/32a+nBY+cUB6w00rLNF5toE9gJMGiQ2+60h+1rCHj8hVtti7NlN/5gx8SCp9OSX/Xgt6c5V3hjZ4QVE6UOY8DyDbMj6SzXgMxrslqyZzizQgz+kbLrlUTYnHggwjUHhqslKiTO0GTpjpN83SwwAwk/Ur2OWLDyRnVjbaQBVplLo3YFjI3Wcnv4r7OJRghbEgKKMRtRGFzhk6V8ceN1mrfK5S89P9MOhWTnSQQK9+3VkBfm1uSUve86sgPBK9NGIIwFFnrtBMgG3p5fzRvhKuwdB+thf1ykGljDMNj7ZVfs+Pfcl6zmNuRIczWzygRx1uqLdBPqrAY+slUYieV8JfH/uiTDP93aL83Nokxe+MwP3std++Qg5muGw9oM0dYgW4Qs8FEM2BSEbcBdw3SpkglmtgmW5OIWt9gzBh+PWIdy8sGU+uQljA4IuH24V5R42spOU1S2JgQoCs2GNgYUDJjMMxwRDQDIaoPZGCrsyAvyc3TdknIXYMO+hBmryGbB2/Pefj7C62MWZJxclvw7A=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac8fe1c-8427-4a00-2d01-08d7eaf40925
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2020 21:43:33.9977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Vp8JdcqSkoS3Y7C+Af5t6/2sKvN21Bm5TgJ3JIaOq7/312fZqALC8FXT9uhcjo4nr/vzD62AXARSX8r8ITmzAo1ooZ0Pe3XOACk26usn35ewsKmc7UOsMdARncFOB6M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1493
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjcgQXByaWwgMjAy
MCAyMTowMA0KPiBUbzogUHJhYmhha2FyIE1haGFkZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi1s
YWQucmpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPjsgTWFnbnVzIERhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IFJv
YiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Ow0KPiBMYWQgUHJhYmhha2FyIDxwcmFiaGFr
YXIuY3NlbmdnQGdtYWlsLmNvbT47IG9wZW4gbGlzdDpPUEVOIEZJUk1XQVJFIEFORCBGTEFUVEVO
RUQgREVWSUNFIFRSRUUgQklORElOR1MNCj4gPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsg
TGludXgtUmVuZXNhcyA8bGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnPjsgTGludXgg
S2VybmVsIE1haWxpbmcgTGlzdCA8bGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIEFSTTogZHRzOiByOGE3NzQzOiBBZGQgbWlzc2luZyBjb21w
YXRpYmxlIHN0cmluZ3MgZm9yIGlpYzMgbm9kZQ0KPg0KPiBIaSBQcmFiaGFrYXIsDQo+DQo+IE9u
IE1vbiwgQXByIDI3LCAyMDIwIGF0IDY6MjAgUE0gTGFkIFByYWJoYWthcg0KPiA8cHJhYmhha2Fy
Lm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgbWlzc2luZyBj
b21wYXRpYmxlIHN0cmluZ3MgInJlbmVzYXMscmNhci1nZW4yLWlpYyIgYW5kDQo+ID4gInJlbmVz
YXMscm1vYmlsZS1paWMiIHRvIGlpYzMgbm9kZSBvZiByOGE3NzQzIFNvQy4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5y
ZW5lc2FzLmNvbT4NCj4NCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPg0KPiA+IC0tLSBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDMuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3I4YTc3NDMuZHRzaQ0KPiA+IEBAIC01NTEsNyArNTUxLDkgQEANCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAvKiBkb2Vzbid0IG5lZWQgcGlubXV4ICovDQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJyZW5lc2FzLGlpYy1yOGE3NzQzIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gInJlbmVzYXMsaWljLXI4YTc3NDMiLA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAicmVuZXNhcyxyY2FyLWdlbjItaWljIiwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInJlbmVzYXMscm1vYmlsZS1paWMiOw0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4ZTYwYjAwMDAgMCAweDQyNT47
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE3MyBJ
UlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3Mg
PSA8JmNwZyBDUEdfTU9EIDkyNj47DQo+DQo+IFRoaXMgd2FzIGludGVudGlvbmFsLCBjZnIuIGNv
bW1pdCAwNzJiODE3NTg5YjE3NjYwICgiQVJNOiBkdHM6IHI4YTc3NDM6DQo+IFJlbW92ZSBnZW5l
cmljIGNvbXBhdGlibGUgc3RyaW5nIGZyb20gaWljMyIpLCBhbmQgbXkgcmV2aWV3IGNvbW1lbnRz
IG9uDQo+ICJbUEFUQ0ggMDIvMjJdIEFSTTogZHRzOiByOGE3NzQ0OiBBZGQgSTJDIGFuZCBJSUMg
c3VwcG9ydCINCj4gKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWRldmljZXRyZWUvQ0FN
dUhNZFZ0MkREUUo5VWQ2aT1HV0FlV1cwVGRwRjV4aUN4dFJpdjBkWlRHQ1BFdDhBQG1haWwuZ21h
aWwuY29tLykuDQo+DQo+IFRoZSBub3RlIGF0IHRoZSBib3R0b20gb2YgU2VjdGlvbiA0NS4xIG9m
IHRoZSBSWi9HMSBIYXJkd2FyZSBVc2VyJ3MNCj4gTWFudWFsIHNheXM6ICJBdXRvbWF0aWMgdHJh
bnNtaXNzaW9uIGZvciBQTUlDIGNvbnRyb2wgKERWRlMpIGlzIG5vdA0KPiBhdmFpbGFibGUgLi4u
Ii4NCj4NCkNvbXBsZXRlbHkgbWlzc2VkIHRoYXQsIHRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgaXQg
b3V0Lg0KDQpDaGVlcnMsDQotLVByYWJoYWthcg0KDQo+IEdye29ldGplLGVldGluZ31zLA0KPg0K
PiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPg0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4
LW02OGsub3JnDQo+DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwg
cGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
DQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgR21iSCwgR2VzY2hhZWZ0c2Z1ZWhyZXIv
UHJlc2lkZW50OiBDYXJzdGVuIEphdWNoLCBTaXR6IGRlciBHZXNlbGxzY2hhZnQvUmVnaXN0ZXJl
ZCBvZmZpY2U6IER1ZXNzZWxkb3JmLCBBcmNhZGlhc3RyYXNzZSAxMCwgNDA0NzIgRHVlc3NlbGRv
cmYsIEdlcm1hbnksIEhhbmRlbHNyZWdpc3Rlci9Db21tZXJjaWFsIFJlZ2lzdGVyOiBEdWVzc2Vs
ZG9yZiwgSFJCIDM3MDggVVN0LUlETnIuL1RheCBpZGVudGlmaWNhdGlvbiBuby46IERFIDExOTM1
MzQwNiBXRUVFLVJlZy4tTnIuL1dFRUUgcmVnLiBuby46IERFIDE0OTc4NjQ3DQo=
