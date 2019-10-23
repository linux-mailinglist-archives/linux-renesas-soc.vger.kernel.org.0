Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04ED4E1552
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 11:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390380AbfJWJIm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 05:08:42 -0400
Received: from mail-eopbgr1410127.outbound.protection.outlook.com ([40.107.141.127]:42816
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732361AbfJWJIm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 05:08:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZ9G/phpGvaVVURm2c11yD4VJWPpdt7AwWoyjd0mPEb6/iMiibn9SVDXmWcGH3oUZ9e48dYb3kr+Fu6FI5btOcLOW8YITm3BPT7Cw2BHtPH6kAYHNnbtid13z63UobAVef+rCHZ+LgpPFB5BsZ8xvrvnAj9NyeSFmNPUQ83VP2w3JsILtBY4WFLWmPFzL1OeR07bOUmaWoxT2Lkk68SN7HZU5H1d/St+hZMXei6ZhA8fImz8UCyk3YoBVVA8DrD4FcFASnfZNFmRgig638hZPBmKCuuU+p/kcZJ+0dA/q6iSFcdWY1k+iivnOSYjl344sPZt3c4Wj+B1+Rl1ilIhmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=al5K/n55m+Ws6l5eJ/WuBMVj4c50PM0ry1AXUGrei0I=;
 b=jBAU09RnS0HosvN6FXO+yK5YnFhimtpPN68g9r22FCSt0Uy7w+5pLlfWkLy/0yvIbnVYrhJzC98bf5rkeYNdxclXcT6KS1Gj+UvzUwkmqTEcer0byiyRsiGmlm1V0HQVezp9dwbjNqxiUaK+2hVy/Xp1/lBy302n+dlIZ1X/qjRHG+x0fOpx3hCNuiEyEtW6c320tkwQeIRnei6QAM+xoLkcJbGdRYeFTUU93t230tm7Sb9t4lOyx7VrWGdOofxXez2rjUdyaAZ+Z3jnG1n4EVRJz6SXNwdjjObAIlSkqnnqriEiyaycm5lq4cMD7HYeu1lNm00sHMFe5UWQN0pzWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=al5K/n55m+Ws6l5eJ/WuBMVj4c50PM0ry1AXUGrei0I=;
 b=ffzA9wrNJIRyyOBx5ov8vo4Nl1Rq6boiT3U78EVTUHU6y2ac1iepvWrgBOPa8OQQxXQgz68Fv1O5pkAzfMoieIt+e5S39QKOsbA+7sn5fTrTnKzdIFRkXVhIIc8EyU9TucXzmTPGtr75Hu65u6zaaHZH7yH1UqxodFY0B41r5O8=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1884.jpnprd01.prod.outlook.com (52.133.161.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 23 Oct 2019 09:08:37 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::18df:cd2b:3b80:f287]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::18df:cd2b:3b80:f287%7]) with mapi id 15.20.2387.019; Wed, 23 Oct 2019
 09:08:37 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: RE: [PATCH 1/2] ata: sata_rcar: Add r8a774b1 support
Thread-Topic: [PATCH 1/2] ata: sata_rcar: Add r8a774b1 support
Thread-Index: AQHViPTHTKrJp1MwG0yyW1gvVALjSadn0okAgAAeN/A=
Date:   Wed, 23 Oct 2019 09:08:37 +0000
Message-ID: <TY1PR01MB177027159CE21F3C07790712C06B0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1571761279-17347-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1571761279-17347-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVggP40u8_+9yZFAO5_E0_qbnDM5hy1k+n6RWkYKOssYw@mail.gmail.com>
In-Reply-To: <CAMuHMdVggP40u8_+9yZFAO5_E0_qbnDM5hy1k+n6RWkYKOssYw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 46df5d73-d789-4d0e-9721-08d75798971f
x-ms-traffictypediagnostic: TY1PR01MB1884:|TY1PR01MB1884:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1884C61119042F4B5A156122C06B0@TY1PR01MB1884.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(189003)(199004)(7736002)(55016002)(66476007)(86362001)(66066001)(4326008)(256004)(14454004)(316002)(2906002)(74316002)(66556008)(81156014)(54906003)(9686003)(71190400001)(64756008)(8936002)(5660300002)(71200400001)(76116006)(66946007)(305945005)(6246003)(66446008)(81166006)(7696005)(6506007)(186003)(6916009)(6116002)(76176011)(53546011)(446003)(33656002)(25786009)(3846002)(486006)(476003)(44832011)(8676002)(478600001)(7416002)(4744005)(6436002)(102836004)(99286004)(52536014)(229853002)(11346002)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1884;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zHL4GNZjq5P/c3EPaxK5GvSSYNTx4wgAw2Pe3x2gNdt9JegiXYOkvXgMDTOa5vSWFAt84JN3HnugRWxaEMi9LXvP6+URNjb+0dqKvg2C+ek8VitVCD1+UFhMEHFtjjwH/F7RhAt5UA4W3t1phHZaaf62M2G/5lX9i8+jRHkUX/6gZVDC7ujZuM96EH+OdIS2l8DOGrMyEHVA5OaWcKwGzTzeD6CQjSffQRK75GAowpZf+0HsXFWoIRYLf9T+5YVgaRyVeEnldFsgGH96d/S0dEcSTIO1Q4h9u0ulToJQVNS7+ZH+PE3eq79jE88jBW3JrY5PC3eJenUYReBYRvyNHgYghu8pXaB7RYHpQxfaPCBFTD/k0jHLPFipIHIIIp18NI27h5VbGUW5S43OVEHpX0FSoRG4/25/lGUPR1rIUzRdW8gztb+0kemqcIDyYipJ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46df5d73-d789-4d0e-9721-08d75798971f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 09:08:37.6141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Isl97LubXAGt7fRzw26Zdb/b5KQ/cdQXp7w/9O+BBcWJIq4Zf45lckljH2LSbzyvpOfQH2Z2ebjmWgcS5D6ag5OXKYN+DOcsZ30Ms7cwBKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1884
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjay4NCg0KPiBGcm9tOiBs
aW51eC1yZW5lc2FzLXNvYy1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LXJlbmVzYXMtc29j
LW93bmVyQHZnZXIua2VybmVsLm9yZz4gT24gQmVoYWxmIE9mIEdlZXJ0IFV5dHRlcmhvZXZlbg0K
PiBTZW50OiAyMyBPY3RvYmVyIDIwMTkgMDg6MjANCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJd
IGF0YTogc2F0YV9yY2FyOiBBZGQgcjhhNzc0YjEgc3VwcG9ydA0KPiANCj4gZHQtYmluZGluZ3M6
ID8NCg0KQ2FuIGRvLCB3aWxsIHNlbmQgYSB2MiBmb3IgdGhpcy4NCg0KVGhhbmtzLA0KRmFiDQoN
Cj4gDQo+IE9uIFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDY6MjEgUE0gRmFicml6aW8gQ2FzdHJvDQo+
IDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IERvY3VtZW50IFNB
VEEgc3VwcG9ydCBmb3IgdGhlIFJaL0cyTiwgbm8gZHJpdmVyIGNoYW5nZSByZXF1aXJlZC4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJw
LnJlbmVzYXMuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02
OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
