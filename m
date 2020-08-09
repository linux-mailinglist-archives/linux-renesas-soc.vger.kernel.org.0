Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E162023FD88
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Aug 2020 11:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgHIJRs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 9 Aug 2020 05:17:48 -0400
Received: from mail-eopbgr1410119.outbound.protection.outlook.com ([40.107.141.119]:6065
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725710AbgHIJRr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Aug 2020 05:17:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvYixwKkMCOV9I+NQ3F4Gg6c0myRk9ZzyE6Lw3svVjEGKda295oUonvN5FMe0rwOxrA7zlNrCiIPysG3V5Dft6oDSA72AkUQsaSdTBvByOPlzC3IqjMv54SRLFi9H3ZNsAGpTL0AkuCZSdoQFoMupO0br48EfAE8Wd1XOCj2TLrrtDSSNQI8fb7HMXjtKAlFcU2mj3NIOHyxwS4JzNtG+ikVDjfpJUgdmq8C2sPMZrOeZpFA0HrqnhnUiWQmEJ1d+z6QmvuyLSIn6/jjv+nK0E47z62dt5OASa0DqOdFX+G9WRao3zaU4x0zS+SdWOVNKWVqk3BYhJjvn2DP/E4/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1Dqgd39SfsJmxZzYVdSB9T+c+aOC91GTGCF2A4pwQw=;
 b=RMeNWZkn+mw9pmJS8LnumwWzhPak6JHht+cSCpzVT5zsjzeo2PK8ZmOFAtMKelOFYChdveKW/UCPVuBpwLq30hytsgZuBFjCsHCwhhosFiqyNWs0vyx2yv6B5tUinlexDZ3TBHqzpMRprIoNUq9q40JrrmId2R0+0rSVPd8xEhrfQaBhjl3wMamHB1HhE2dm9I0jKJrhoK5fpo+dUzSJcvoZ82q4h0oBpm7UINlKnb/k4A49nOGRiKevthxdODZMPbJT0a0A0rC/VYNYJdlYbokKHlm7oU4M6gUK1hOYbBUhYSJTLDLTGvTiz/CavkpU48YhGeUEAS4PSCL5FrGqEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1Dqgd39SfsJmxZzYVdSB9T+c+aOC91GTGCF2A4pwQw=;
 b=FbXdt3Wey5Tu0+5Yo/c8xdS6XCXwA6BkCs+SiCLRR7Sj5bAk5i47LfnQ9o7cIVufFK6NyZ7JHfDphosAgZ/ivaPbA5ojZ1ihsl+NB8S1xwyG3jlb3KO4PcqdZHVmiC8ipVyiq8PMsGT5qtDlBenaisJAr6jJWe56T/lmu7xlU60=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TYAPR01MB4462.jpnprd01.prod.outlook.com
 (2603:1096:404:130::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Sun, 9 Aug
 2020 09:17:42 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee%7]) with mapi id 15.20.3261.022; Sun, 9 Aug 2020
 09:17:42 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] ARM: dts: iwg20d-q7-common: Fix touch controller probe
 failure
Thread-Topic: [PATCH] ARM: dts: iwg20d-q7-common: Fix touch controller probe
 failure
Thread-Index: AQHWbM5TaP5tPT/1OUeJ7cdRyuQpQ6kuvD0AgADCF9A=
Date:   Sun, 9 Aug 2020 09:17:42 +0000
Message-ID: <TYBPR01MB530999E8AB697CB016E433D586470@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200807152039.10961-1-biju.das.jz@bp.renesas.com>
 <20200808212858.GV6186@pendragon.ideasonboard.com>
In-Reply-To: <20200808212858.GV6186@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [31.49.74.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bc81a0d8-28e4-4c55-1615-08d83c4511e0
x-ms-traffictypediagnostic: TYAPR01MB4462:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB44626554BB4CFF94D27AFAE786470@TYAPR01MB4462.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 64koCr0c2C89Mz37LWBZcwe6mra5s7sIT37eF+ZIpO4rwvXUSsoDFMiHQO2sYyhBedqhttQ2ljVmIHS76ZXqVn9/7V6n85DkfTm5/BFbcMuXShL5+/d5gpo/05qUgoCWgOQnqEgIGucB+zJw5NdXfE9JScVHVvN8Vl7+OE7fFtOHV8a8uY6g4Sbld7jEJdvv0SQEZ79Vg56Boe/29URPujUHWDgKTnH6VNIpdeYkHWd+ADGIkLR1tIc3ohWVza5eLD9mhWrYqpOe8l8i3QKTWa9X1HsMWyP6EiPplg8Ub1hfUup2kKWV/hI2GdTgeKPJ5t27qYRlcMa28AeGr4Xd6Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(136003)(346002)(366004)(39850400004)(66946007)(186003)(55016002)(8676002)(83380400001)(54906003)(66476007)(66446008)(9686003)(66556008)(26005)(316002)(64756008)(6506007)(5660300002)(6916009)(8936002)(107886003)(86362001)(2906002)(478600001)(71200400001)(7696005)(33656002)(4326008)(52536014)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ODAtfcIXx2WMQtM77UeeDIxPA8rhu29Ngp9/+CbEUF4Xxd/KJoRIqk6+xkk1UgwlftLf9oWNHsmI+UKnvbtvsFi/+3lUGRWIMwHJeZUchVeGi6Cq89d2cR3ZJuxoUWegoXAAaYYo+XpaYq9vaQoCX/Zk1gew/u07+GyQ29An/gzu195U+Fm3J0KiPLyB7vLco83YD+qnGy9w3AYwv7NqZ3psJAL93HGHtxZFnZYpbqbXdtmRQylbJWijHXubYRqXyAifGBONCYQwrykxLgHwB33hR6kM7B5ySI9gBJSwBk/dKNW/wGPmYb19y93C5FTzIO4km8pGldOxiJiPhY5lgcha68KnvLsFIxJ8Prp9NRZBKCBlRr0B5ys6g5SPZBKJ6QuvHD+ZFzsLyMknBCpuoRWCg3fDY/rt0fMGvZOcEaOuA4UWS01NPuXTSX62vkLnWdCOo6MOJv6xPclxpZjJ+MDKac1gjMBvK6y/b9qsVZBs4IZMK9F05caALIKwMDL9i/iC7EzVPGP/3F21/01aZYePpbhZt3pFE5ix0Y561Hl+2u/WyxmzjTpmepDvARH9FDo0nlnviebwZajX7nMHwCALkp5ZfXoow2JjIsp0b/jqzNoqVFmD3ptxBRkKhQul5JGSYO3mnjD0ZzAta7NG/A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc81a0d8-28e4-4c55-1615-08d83c4511e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2020 09:17:42.2018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DymTbYJHvZT2wb26jM2k9jy3WxFx1/9utY62WUTOMo7Vu/SzkAfreXszvXzPBTg0TpvB1i3cvxOFbLsgz7772oouAe8y7L52wPsvAzfNJZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4462
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gQVJNOiBkdHM6IGl3ZzIwZC1xNy1jb21tb246IEZpeCB0b3VjaCBjb250cm9sbGVy
DQo+IHByb2JlIGZhaWx1cmUNCj4NCj4gSGkgQmlqdSwNCj4NCj4gVGhhbmsgeW91IGZvciB0aGUg
cGF0Y2guDQo+DQo+IE9uIEZyaSwgQXVnIDA3LCAyMDIwIGF0IDA0OjIwOjM4UE0gKzAxMDAsIEJp
anUgRGFzIHdyb3RlOg0KPiA+IFJlbW92ZSBwb3dlcmRvd24tZ3Bpb3MgcHJvcGVydHkgZnJvbSBs
dmRzLXJlY2VpdmVyIG5vZGUgYXMgaXQgcmVzdWx0cw0KPiA+IGluIHRvdWNoIGNvbnRyb2xsZXIg
ZHJpdmVyIHByb2JlIGZhaWx1cmUuDQo+ID4gQXMgcGVyIHRoZSBpV2F2ZSBSWi9HMU0gc2NoZW1h
dGljLCB0aGUgc2lnbmFsIExWRFNfUFBFTiBjb250cm9scw0KPiA+IHN1cHBseSB2b2x0YWdlIGZv
ciB0b3VjaCBwYW5lbCwgTFZEUyByZWNlaXZlciBhbmQgUkdCIExDRCBwYW5lbC4NCj4NCj4gSWYg
aXQgY29udHJvbHMgdGhlIHN1cHBseSB2b2x0YWdlLCBzaG91bGRuJ3QgaXQgYmUgbW9kZWxsZWQg
YXMgYSByZWd1bGF0b3IgPw0KPiBEcm9wcGluZyBpdCBjb21wbGV0ZWx5IHdvdWxkIHJlbHkgb24g
dGhlIGJvb3QgbG9hZGVyIHBvd2VyaW5nIHRoZSBkaXNwbGF5DQo+IG9uIGFuZCBrZWVwaW5nIGl0
IHBvd2VyZWQsIHdoaWNoIGlzbid0IHZlcnkgbmljZS4NCg0KT24gdGhlIHNjaGVtYXRpYyBMVkRT
X1BQRU4sIGNvbnRyb2xzIHRoZSB2b2x0YWdlIFZDQ18zVjNfVEZUMSwgd2hpY2ggc3VwcGxpZXMg
dm9sdGFnZSB0bw0KTFZEUyByZWNlaXZlciwgVG91Y2ggY29udHJvbGxlciBhbmQgUkdCIExDRCBQ
YW5lbC4NCg0KSSBhZ3JlZSwgaXQgc2hvdWxkIGJlIG1vZGVsbGVkIGFzIGEgcmVndWxhdG9yIGFu
ZCB0aGlzIHJlZ3VsYXRvciBzaG91bGQgcHJlc2VudCBpbg0KYWxsIHRoZXNlIGRldmljZXMgbm9k
ZXMgcmlnaHQoTFZEUyByZWNlaXZlciwgVG91Y2ggY29udHJvbGxlciBhbmQgUkdCIExDRCBQYW5l
bCksDQpub3QganVzdCBvbiBMVkRTIHJlY2VpdmVyIG5vZGU/IFBsZWFzZSBzaGFyZSB5b3VyIHZp
ZXdzIG9uIHRoaXMuDQoNCkNoZWVycywNCkJpanUNCj4NCj4gPiBGaXhlczogNmY4OWRkOWU5MzI1
ICgiQVJNOiBkdHM6IGl3ZzIwZC1xNy1jb21tb246IEFkZCBMQ0Qgc3VwcG9ydCIpDQo+ID4gU2ln
bmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJl
dmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi0NCj4gbGFkLnJqQGJw
LnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTct
Y29tbW9uLmR0c2kgfCAxIC0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pd2cyMGQtcTctY29tbW9uLmR0
c2kNCj4gPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRzaQ0KPiA+IGlu
ZGV4IGViYmUxNTE4ZWY4YS4uNGM4YjlhNmIwMTI1IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2l3ZzIwZC1xNy1jb21tb24uZHRzaQ0KPiA+IEBAIC01Nyw3ICs1Nyw2IEBADQo+ID4NCj4g
PiAgbHZkcy1yZWNlaXZlciB7DQo+ID4gIGNvbXBhdGlibGUgPSAidGksZHM5MGNmMzg0YSIsICJs
dmRzLWRlY29kZXIiOw0KPiA+IC1wb3dlcmRvd24tZ3Bpb3MgPSA8JmdwaW83IDI1IEdQSU9fQUNU
SVZFX0xPVz47DQo+ID4NCj4gPiAgcG9ydHMgew0KPiA+ICAjYWRkcmVzcy1jZWxscyA9IDwxPjsN
Cj4NCj4gLS0NCj4gUmVnYXJkcywNCj4NCj4gTGF1cmVudCBQaW5jaGFydA0KDQoNClJlbmVzYXMg
RWxlY3Ryb25pY3MgRXVyb3BlIEdtYkgsIEdlc2NoYWVmdHNmdWVocmVyL1ByZXNpZGVudDogQ2Fy
c3RlbiBKYXVjaCwgU2l0eiBkZXIgR2VzZWxsc2NoYWZ0L1JlZ2lzdGVyZWQgb2ZmaWNlOiBEdWVz
c2VsZG9yZiwgQXJjYWRpYXN0cmFzc2UgMTAsIDQwNDcyIER1ZXNzZWxkb3JmLCBHZXJtYW55LCBI
YW5kZWxzcmVnaXN0ZXIvQ29tbWVyY2lhbCBSZWdpc3RlcjogRHVlc3NlbGRvcmYsIEhSQiAzNzA4
IFVTdC1JRE5yLi9UYXggaWRlbnRpZmljYXRpb24gbm8uOiBERSAxMTkzNTM0MDYgV0VFRS1SZWcu
LU5yLi9XRUVFIHJlZy4gbm8uOiBERSAxNDk3ODY0Nw0K
