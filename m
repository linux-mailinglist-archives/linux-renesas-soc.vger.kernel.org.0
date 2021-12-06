Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71380469579
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Dec 2021 13:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242823AbhLFMRQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 07:17:16 -0500
Received: from mail-os0jpn01on2106.outbound.protection.outlook.com ([40.107.113.106]:59384
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242106AbhLFMRQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 07:17:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dp0FWKlIbi3NhshF5fUKF1JBFotSH3rm3GQR5qKEStLTlqIfzrgOD30yQMyoUNY7bQ/oYYnzpuCQcuMZDPMxXOWXa5gKRxU9tG8IPFj8J3D66ZzB5/8y6Ab07tmrL4HvaGjKWN+34gIF/oSqZsGC0AGuXyTKEfrIuvGrcDUQ+z2jrSIG/s2YvAhbHGrFfIXqiXgM3DgbpziTLA7CXVvhIbbdI1at24lHQMF5Du1+50717zJcQw9Bs5lIjZZoa9GX2Sbje3zY2aM26diL8SgcyXBkAnUfk8S3Ro1Mr/fkY+f2ZePY3gA+Uku0QC253B9WEvSwP/t0He5tbrGDHgbK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbsSpJULhdlTx3qtRPGN9TmZmZpf0atoZr//PNlJkvk=;
 b=Y44pl3moTAtuEmo9IwPto+j1jjLwi1ZXtGnRYL9Uj7sdpBoKcyK8VoD59hcVBB7zE26KJbqZUdCSXDocBj8rTzUgBg6At7B1s+qAsq2BbGG3Mc3i//ILv9AlAyftQna4IOKzARdBV5PJlQIhP3zQHifEFbBexP4XWeLYmpbw/ZHcOkWE6y69TkbZupO5QkdKosendK1Rgmu+tIsvUS4qne4wwIiqq1M1A33ta+rLZwJpQBK5fbKPVcX1bjsPCDSQs7Fzp//4xviJ1GmDwoI/TnA9k5QgAXN3583sTd89mlQ3kJSD/pGeb1HvZIt2n24+T2Rje+EuHjIrvt6cGLme6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbsSpJULhdlTx3qtRPGN9TmZmZpf0atoZr//PNlJkvk=;
 b=VQV4s3dZn9u3oePUNtcQwG7BIXULFWOjhNw432DM3JM7sHLL0fIYp6/moampEJbF7GpLCmEXqpObXs7HmPRE636k/sUtDLQJDJhPLyfV/jBx5lhOxkp+ZVOt3Xf8MrceXgeFh4jEHkL4mhT17SbPHK6gWQDOwvGuDoI871VrzZ0=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYYPR01MB7005.jpnprd01.prod.outlook.com (2603:1096:400:d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 6 Dec
 2021 12:13:44 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 12:13:44 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH v2 01/14] dt-bindings: arm: renesas: Document Renesas
 Spider boards
Thread-Topic: [PATCH v2 01/14] dt-bindings: arm: renesas: Document Renesas
 Spider boards
Thread-Index: AQHX5oW2JWqNeNLS50CyU45ArWRY5awg9FOAgARPIlA=
Date:   Mon, 6 Dec 2021 12:13:44 +0000
Message-ID: <TY2PR01MB3692D6C55A9B7B453FC49848D86D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
 <20211201073308.1003945-2-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdV1Ri-yCeJSp6Gdw5ocAgXj4Yyc57ucN2DY=muj+dQV9A@mail.gmail.com>
In-Reply-To: <CAMuHMdV1Ri-yCeJSp6Gdw5ocAgXj4Yyc57ucN2DY=muj+dQV9A@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7427488-16ad-4ab3-1b6f-08d9b8b1d974
x-ms-traffictypediagnostic: TYYPR01MB7005:EE_
x-microsoft-antispam-prvs: <TYYPR01MB7005B8281C87CCE0F581E823D86D9@TYYPR01MB7005.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6UWhWa71tWVaaDdVZBguwFh+KUpXcPMOAf0h85BDJuD6x2R/ZSvqxV8NmhkbwmvL2YpZqGtDdbHyNz1s5rvCh62hXVdF9Pe72ZpfF5zhp38wTfDA0vp8K8tPIt6k7/OVzLv7cIVi1JuE0qZDPp9eQBPgTkNd3iWp1+5k9vvyY5XiOLq+385g16BjNOYLEpjAmQUEghfXIPprmvTVhWbSWnJGtOkl4vyEQYR7XWL6Xu+owKJ8TicQIX6QKK8psgpLbryGxZVftD6uvIEgOdoMaGrAkEsFDAryMClUnGObQjkIyJJAQa/vZryfEh/n1EmRnNo3fOC5uhcxyvsKYQK+GMXDjqGt+sp4hlVL8slI0YA9+vQwOGr/jSqBfFq6bwni/gwlmDJzxsSwBFe+e9vJuAs3Tme2REZITRzUuWkMSiWqsGfTYlz192OwhnxJUXi4A6S7/fqJmrpSGtjydn9v48DbQopsHcd0NEGGtr8Lg/ddhM+mAeyet46AkGcpyICmfYNYpgjO5ljqgHd8sk2shhrjuD7xELlUwiRrWQtT4xjTVnKalFEmu1XVdAP1AIMZdlGUcwo/WLNinh+iIOInWQJ+pA5tBP0/yty8UItSrPcHXoyJt/KTTFVZ3WMV1W/oV6KtpZCBqjonKYQLoumemLQXvvRiLYrlBwIDAEWVDE1afXwriE2UgNtc/43Ov3LbRhf4eZfpGgBtytsitbdrbw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(4326008)(86362001)(8676002)(38070700005)(66476007)(2906002)(316002)(52536014)(66556008)(6916009)(64756008)(66446008)(9686003)(55016003)(186003)(71200400001)(122000001)(508600001)(8936002)(7696005)(33656002)(26005)(53546011)(6506007)(5660300002)(76116006)(38100700002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnpRc01vWE1BUWFicjRLb1R6Umo2T3dibVU3eDd4czdZS09WWFZNZjFNOExr?=
 =?utf-8?B?NEFVa1lBSFU4V3cvVU5RVU5pbGkxMldhdUFGYWdZemtEVTVvUzZQbG5SMXpJ?=
 =?utf-8?B?UThPY0tYNTVDZ3NzcDZFd2pmZnMrU2tRckM3ZThzbkNVQzdILzBpTmI5UHA0?=
 =?utf-8?B?LzV4cUtoWFkvV0N5ZmRHcTV0c25Tc2NVbkQ3QUcvTENEc0VNWW9CS3JQL0xn?=
 =?utf-8?B?eWFEMTRRdzRoQ1BadUJkcjVNc0FRbE5xazhmUnFHUklJaG82R0dna0xHM1B6?=
 =?utf-8?B?c1JkTGhzTGwvZWprSHpGWlBEZ0dBSUdBcUk5d21ZcVBSdHBOT1lLVFR1d2Iz?=
 =?utf-8?B?c1hqYkFWN09FV1lMcWJkekxyQzBWaWJic2pMeGlSRFBXOFZzOWJseVBLaUlF?=
 =?utf-8?B?azZNcE9DQnFZelVuT0ptSFJ6dUwwQW1lMkNwV00ralJDWjhjaDRvYW9MV2Rq?=
 =?utf-8?B?RDRDOEhhZHdVZjdtSnpxTlV0WTRNMlRLMytJU3gzQ3IwaEhMamdwd1NhRnNK?=
 =?utf-8?B?QndFNDM1UVRoSEppUEJReWNKN3RuQWFVSE5Ma3NkaFRwdno2aWthb001UjVP?=
 =?utf-8?B?S2t2dzRWRnFQWHZ4amsyckYvVnlHeFBUWEdWcUdld0thczlQZHdYWGRhak84?=
 =?utf-8?B?MnJTT1c1SU4xWU9UZXI1bFllcVNNdFk2d1UxZkt1SVY1K0ZrZGRHd0Z1Qk12?=
 =?utf-8?B?WExvcThaK3RKbmRKL3JUdGgvaVR6WkpaZGYrUE1IVk1ZQktEdndIT2ladW13?=
 =?utf-8?B?cWhxeFJua242aTAwRlFkaDJNbm1hTTRmbWsvZVFXYkRrQm9XMWNIbUo0Mkpv?=
 =?utf-8?B?bndjRmJ5S1RPN3FuMm04Qi9laHFPWlFMWXpyWjlIWEtKVXpjYnp6eGFrR0tS?=
 =?utf-8?B?QktOYjhMTVFuVnlnRGJIVmFyckNqdVA5eEpGK0pNdFZ2Wm55eGEyN1V6b2Uw?=
 =?utf-8?B?SHlHdGNJaUZSYXFVTDM0ZHRrR0J2Nk04N0FTcjZCK2Mzd0ZZcURwYlo3M3lH?=
 =?utf-8?B?cVprdVpqbC9LT2pFWFg0bzJZNWdZYWVPWUt4ci9PbnZkZnhjV09LTUVvenYy?=
 =?utf-8?B?YlluNGlPbEY1T0pLNlpXNmJrR3FINFBmR0VuVGZENTRmN3V3L1FBZkpmZnlF?=
 =?utf-8?B?U2VVWlRmMG5mMUUxejA4aExDSW1WcDduSk9qMkEyYUZYQ3BYTlpyMkFGaE5r?=
 =?utf-8?B?cC9lTHRYV2NUdEdLbjNESDQvb1ZjMjJ1c1ZOOEgzMHMyWGJ5cXIwaXJFNENI?=
 =?utf-8?B?SUkycTl5R3hmWkVLajl2WEJvejBaQzREYVFlMzBpUlZJdzVLckU1dlRlcHpB?=
 =?utf-8?B?UVE3dnNpdVVWYzdkV2ZHS0plZmU0TnBib2d1R0ZuRzJBc2ZTaHBxckRDWisx?=
 =?utf-8?B?NW9LOWhaK2ZtYnNad1dJWGlsa1VjWmlNcW1VY3Nmd3FLT2ZEZy9EZmNPc3pG?=
 =?utf-8?B?SWF0Mm85M0xaeWM5RU9QSzNSVVhVMVQyQkJhUGhjRG5qcXllc0lvVlE4TTRj?=
 =?utf-8?B?QzNoWkRKRlc3U1pVR2J4WXV5S2VZaDRoOXhjd1hnSlVJV2JBMi9yTm5qVlA4?=
 =?utf-8?B?anZpUFFvQ052Q3ROR2RvUGZ0TVJDMTZHaEFjeWhKQkxTM2daNHdWaXRONUpw?=
 =?utf-8?B?L01sczc0Rlh5QkZmaWNwTEw5VVNla0ZRam1Tbmo2UjBqZFFFMjdKK2NVMEkr?=
 =?utf-8?B?UjdWSWtMck5ReVVVZ3oyUmUrSkRvZFF0QlZnakZDejZiWEVRQm5aajZZQ0pI?=
 =?utf-8?B?OGZKRjYzWWlwTjlSWnVnUndyYk1ydVp0a1F3RDMxL1BQQ1J6bHllc1dwaDJs?=
 =?utf-8?B?MktPQ0c4MEtJKzFjbzhxZDNWV1krSGY4by9od1dNTGk0WUJDZ25LV0xneTQ0?=
 =?utf-8?B?TG1IbDZpMEJqaUhDNEhBUHQzUi8vbnBzNWxCWnBvVDZjYmhBRUtEcncwZmRZ?=
 =?utf-8?B?OHNCMXB2ellWSk5sMnFhTDdKZG9Bd1piWUk5MDBrNjRKNG02SU0rbFhTZHZI?=
 =?utf-8?B?eE5lMFlCTkRVNmVvMldGMUVyRGtUdzB5bWdqRXR3NVBvanJKaVZSK1pSeDNG?=
 =?utf-8?B?ZEpyMDRpM1lQOGlmTVBMQnpaQ1JhZ0dxRVoxelhIVkxCcHQwKytHVEpVYUlt?=
 =?utf-8?B?STg2UTBJZXdlWVJtalU5Q3ZrZjVXUjh3S2ZDQ0NzOWFqNlZTL2ZTZ2pjWG8w?=
 =?utf-8?B?bVRVVTJ5SWpZWUFLNmsxRUZuTER5Q05ZbFJ4cDJxa2ZzT1hZLzkxTUhIeTVa?=
 =?utf-8?B?YUFCNHZEaCtkVDE4ZTAxckFkUDhickNhNytXQ2VNN0x3bTlHMWpNUVVSTEZh?=
 =?utf-8?B?TW41MHpIdmxWZkNTTlQvYzBQUjdyYUdKNFV4bnhTVHpGMVd2MmtLZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7427488-16ad-4ab3-1b6f-08d9b8b1d974
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 12:13:44.4744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ab7rmQzl9wfKtqgANJ/VK0gZ2u2HqtQo055LzoHk93fSrHrzIY82mdNti8WfCNqhr+V6xS8H0qMF8VElv5s2HhT//fm33mHz0F3H6SCXhMGE/4s0xu07sgkR/DKFt9lU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7005
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogU2F0dXJk
YXksIERlY2VtYmVyIDQsIDIwMjEgMToxMyBBTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0K
PiBPbiBXZWQsIERlYyAxLCAyMDIxIGF0IDg6MzMgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlv
c2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgZGV2aWNlIHRy
ZWUgYmluZGluZ3MgZG9jdW1lbnRhdGlvbiBmb3IgUmVuZXNhcyBSLUNhciBTNC04DQo+ID4gU3Bp
ZGVyIENQVSBhbmQgQnJlYWtPdXQgYm9hcmRzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9z
aGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiANCj4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL3JlbmVzYXMueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcmVuZXNhcy55YW1sDQo+ID4gQEAgLTMxNyw2ICszMTcs
MTQgQEAgcHJvcGVydGllczoNCj4gPg0KPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBSLUNhciBT
NC04IChSOEE3NzlGMCkNCj4gPiAgICAgICAgICBpdGVtczoNCj4gPiArICAgICAgICAgIC0gZW51
bToNCj4gPiArICAgICAgICAgICAgICAtIHJlbmVzYXMsc3BpZGVyLWNwdSAjIFNwaWRlciBDUFUg
Ym9hcmQgKFJUUDhBNzc5RkFTS0IwU0MyUykNCj4gDQo+IEluIHlvdXIgcmVwbHkgdG8gdjEsIHlv
dSBzYWlkIHRoYXQgdGhlIHBhcnQgbnVtYmVyIHNob3VsZCBiZQ0KPiBSVFA4QTc3OUYwQVNLQjBT
QzJTPw0KDQpPb3BzISBJJ20gc29ycnkgSSBmb3Jnb3QgdG8gZml4IHRoaXMuDQoNCj4gPiArICAg
ICAgICAgIC0gY29uc3Q6IHJlbmVzYXMscjhhNzc5ZjANCj4gPiArDQo+ID4gKyAgICAgIC0gaXRl
bXM6DQo+ID4gKyAgICAgICAgICAtIGVudW06DQo+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2Fz
LHNwaWRlci1icmVha291dCAjIFNwaWRlciBCcmVha091dCBib2FyZCAoUlRQOEE3NzlGMEFTS0Iw
U0IwUykNCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHJlbmVzYXMsc3BpZGVyLWNwdQ0KPiA+ICAg
ICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxyOGE3NzlmMA0KPiA+DQo+ID4gICAgICAgIC0gZGVz
Y3JpcHRpb246IFItQ2FyIEgzZSAoUjhBNzc5TTApDQo+IA0KPiBJIGNhbiBmaXh1cCB0aGUgYWJv
dmUgd2hpbGUgYXBwbHlpbmcsIHNvDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiBpLmUuIHdpbGwgcXVldWUgaW4gcmVuZXNhcy1k
ZXZlbCBmb3IgdjUuMTcuDQoNCkknbSBoYXBweSBpZiB5b3UgZml4dXAgdGhlIGFib3ZlIHdoaWxl
IGFwcGx5aW5nLg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBoZWxwIQ0KDQpCZXN0IHJl
Z2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
