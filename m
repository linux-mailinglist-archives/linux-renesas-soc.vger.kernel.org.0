Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6FF5264109
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 11:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729913AbgIJJNC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 05:13:02 -0400
Received: from mail-eopbgr1310091.outbound.protection.outlook.com ([40.107.131.91]:24235
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728207AbgIJJM0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 05:12:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOvRu9ekznVFjwZ249fXNlR+gUVDNV7FIsQ2LiONKyDdUvgUBasuKNKCbnIkagOOYaXoTgoIQOJIxe+Zh8mZ/IsbIVdiafoTp3Qil3f3u6ixlz6VJxL8g1WdgKh9pipgffmFoq9g611zOF3mLykJ9t02XJw5AJH0kQNpl7/Gu4bb6FQ8G4V3QUfRx5nPPePKAmAuSXoxbQwbrzStaIxdlXgwBkziMatHbypY3NKd8ZAas23UV1hoohBeSvPfbqwhp8scgs5fmHeohMlXOJH7vLz4sxojwbq70L+zpZHEncVG+CORNqfk0XvpS6QOmJxmGAdFU9a0RYeF/sk7ikFoGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWN068OtU7w45YgaHHQnbfIX4kO48kF8GWtRlXvtRDg=;
 b=XpGLU5U4ZE3hpfxTXjbWA+c51nQObcAK2ZLKT76pkeMgysKw6dqhkwnzHmFqp5oJ8eDnd9IaXpYdMvJi7WCMgZ/ra4Ve+T1BDuByuccbg6TlO07wc4VGfoFuQ6VXyl1N0KI4pxdrIyVEobeN48mvteD8bPOLHReT+K1LFuTHwSEC0ZTZyJ+CCK2VDWYQl+Y/7HqKbMTVOUzmaS7cwBUhODsdoloWHjq7VQYyZubE2a24CbXCCW+Z0XJbn5uu/d6CmUVIc/SQwYEe+1DwGdGqb5Ws+k9oScs4BVuNE2e60xY5sLsym2Kw7mFhUv+oCpVCheI7Ol0tG2PPqVgbkJRZsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWN068OtU7w45YgaHHQnbfIX4kO48kF8GWtRlXvtRDg=;
 b=se6dHhFQvf1iMISEQjUi8v4+JKgtqqEB+jXFW1FGspKRpcXDrS4Q+qJMzYiTPMgXM5OR7FaTvtoWyLsxbt4zoKz8LHXeMyekaD2z9EhRirDHcgmrn7RX1pMccJv8ltPlsh51jy1D8xXjdJlbVsiDPz5mr7vNm+w4cfg5iFV/mAE=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2172.jpnprd01.prod.outlook.com (2603:1096:404:11::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 09:12:18 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3348.019; Thu, 10 Sep 2020
 09:12:18 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas Falcon
 boards
Thread-Topic: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas Falcon
 boards
Thread-Index: AQHWhPgVqH2AcydHXEixjAxMOPZFmaldTeAAgACLPhCAAHuZgIAAEYQggAM0RICAAABFQA==
Date:   Thu, 10 Sep 2020 09:12:18 +0000
Message-ID: <TY2PR01MB36929160C131DE4D971A033ED8270@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX_be=+3soDGQBxPGvjF5Ty40wDEPaki3Z=SwbDToPA3g@mail.gmail.com>
 <TY2PR01MB3692F7496EE91E633E9EF68AD8290@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdUUqdqf0unaT5efUL-VmSD8Vh1PH69qOqiWZZFLmTGGDg@mail.gmail.com>
 <TY2PR01MB36920EF68291EF53EE91D2E7D8290@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdU4s_yBDCfxZtsYSa1m_CGWKtXDjNL+OHni3XoPJfKrJg@mail.gmail.com>
In-Reply-To: <CAMuHMdU4s_yBDCfxZtsYSa1m_CGWKtXDjNL+OHni3XoPJfKrJg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:29e4:1562:227f:bbc3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 21244476-8683-438f-f110-08d855699de7
x-ms-traffictypediagnostic: TY2PR01MB2172:
x-microsoft-antispam-prvs: <TY2PR01MB21729533436A19E4C2731C0BD8270@TY2PR01MB2172.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /ppStZecytD+lENYgM88vxDCHrooNVzrT7PvOeHrz3jxgUd5wq4nFZ09R2KYfdSTVzU/hJwTPUSN4C0SQicts7av9z0XaemY5J/4IO7MAfgy8vTnUkTz/iRl0W1dukDsLd4QDsUjthDQ1QSISOp76MbezcBEgUL5Mu5PAhA+k8AvvNrvsfAeav4mf8fRFf6ZAjU7Xnr0Yi92tDRRfFh4WN43tX5EFTA9xRdmGcMuPp0zj9nZpVCoGhcC0hnriwzrAu5NKpFXTMZw4RZGugBs7zW+ohWIUcOSZzLYgTzW6jEpPxrWbXkuwgUBB2bInyxKI397GFrKn7M/Zv7ilLpjQg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(9686003)(8676002)(316002)(52536014)(55016002)(54906003)(5660300002)(71200400001)(7696005)(6916009)(76116006)(8936002)(66446008)(4326008)(53546011)(86362001)(6506007)(33656002)(64756008)(66556008)(186003)(478600001)(66946007)(66476007)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: bKg/y2yDEYwxTilOwRaeeWj51ACyLa+ht0XnVWgH9rdE/vLg0AmGohwkGPcjMueCOn/cuOl47G9exD2a70LbwjKiQhwgROAE3qeP4EY80K/9iYlUWpNiqgvIpiWHWyq8xTAgqYusl/1T4LMxLZ8GU7EIgKmAAJNLjMmc1Yxsj8ob8xv7ExhoyUjowPBipDgtmctSDnK1+w9RQ9pvk00Eck27EWLEhygiL0asVdcvviw6aE/lUJPI2noFKyyZvgWRiWQtLV5F/MAfiYE/VT8xAMjc2NDc+vPvkw7VEWrmaO9HvhUu+igwXveuWeZK9nh7escYiTiDZQf3KbJywqj+gbrpjWVWgVpPGJ2b3Oz8Qr+Vcaf79X4gq/LvnJmIMy0S22xRZlS54TWLJXaCoBtqpqIz4inqdhc4cCNw3660vEtZTHUni2HmZpCk/Jpo//vZy/qVsGMzCko1twOaHygnFzZwjDkE51HZlYaoT0Nv3V6yvjmp5q8QhcyLSfvWINg3EUxPQ96n+hAvz2yWdSjqKBesveXRXyjETwH6Yd4DHy+fzjF28cUfMI7Q0sAi/ckHC4I5PjdBdYbzHy+HSrBR1JMh5iBU7lZq+Pse7q0krD871ABnR4xlLhfuCaFTYw19+QhQakmsSu1EiWaf53pT6ex7sKsTrk0sjym5c6vXcr+ASTbP5kTFto4qRG6v8eH0PWQPR0Ams//gf0vGXDAQUA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21244476-8683-438f-f110-08d855699de7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 09:12:18.0336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DhRQKJXXuWfiSaDBJqvbb0ev3mrsh5E+sdL/rMBTBac9UwvoRvQoHpJQZEevn16aHiXJOO72SUT63jUm1UxBDS/mYifwafQB93+NKrMjw29eMy5EngVI6SYGCPR6+XSm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2172
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIFNlcHRlbWJlciAxMCwgMjAyMCA2OjEwIFBNDQo+IE9uIFR1ZSwgU2VwIDgsIDIwMjAgYXQg
MTA6NDUgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVz
YXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVl
c2RheSwgU2VwdGVtYmVyIDgsIDIwMjAgNDoxMiBQTQ0KPiA+ID4gT24gVHVlLCBTZXAgOCwgMjAy
MCBhdCAzOjAxIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+ID4gPiA8eW9zaGloaXJvLnNoaW1vZGEu
dWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZl
biwgU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDgsIDIwMjAgMTI6MzEgQU0NCj4gPiA+ID4gPiBP
biBNb24sIFNlcCA3LCAyMDIwIGF0IDExOjIwIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+ID4gPiA+
ID4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+
IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBkb2N1bWVudGF0aW9uIGZvciBSZW5lc2FzIFItQ2Fy
IFYzVQ0KPiA+ID4gPiA+ID4gRmFsY29uIENQVSBhbmQgQnJlYWtPdXQgYm9hcmRzLg0KPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3No
aWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCENCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9yZW5lc2FzLnlhbWwNCj4gPiA+ID4gPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcmVuZXNhcy55YW1sDQo+
ID4gPiA+ID4gPiBAQCAtMjgzLDYgKzI4Myw5IEBAIHByb3BlcnRpZXM6DQo+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gICAgICAgIC0gZGVzY3JpcHRpb246IFItQ2FyIFYzVSAoUjhBNzc5QTApDQo+
ID4gPiA+ID4gPiAgICAgICAgICBpdGVtczoNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgLSBlbnVt
Og0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLGZhbGNvbi1jcHUgIyBGYWxj
b24gQ1BVIGJvYXJkIChSVFAwUkM3NzlBMENQQjAwMTBTKQ0KPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgLSByZW5lc2FzLGZhbGNvbi1icmVha291dCAjIEZhbGNvbiBCcmVha091dCBib2FyZCAo
UlRQMFJDNzc5QTBCT0IwMDEwUykNCj4gPiA+ID4gPiA+ICAgICAgICAgICAgLSBjb25zdDogcmVu
ZXNhcyxyOGE3NzlhMA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSG93IGlzIHRoaXMgaW50ZW5kZWQg
dG8gYmUgdXNlZD8NCj4gPiA+ID4NCj4gPiA+ID4gSSBpbnRlbmRlZCB0byB1c2UgInJlbmVzYXMs
ZmFsY29uLWJyZWFrb3V0IiwgInJlbmVzYXMsZmFsY29uLWNwdSIsICJyZW5lc2FzLHI4YTc3OWEw
Ig0KPiA+ID4gPiBpbiB0aGUgZnV0dXJlLiBIb3dldmVyLCBpZiBzbywgSSBzaG91bGQgZml4IHRo
ZSBkZXNjcmlwdGlvbiBsaWtlIEtpbmdmaXNoZXIuDQo+ID4gPiA+DQo+ID4gPiA+ID4gVGhlIGFi
b3ZlIG1lYW5zIGl0cyB1c2VycyBzaG91bGQgZGVjbGFyZSBlaXRoZXINCj4gPiA+ID4gPg0KPiA+
ID4gPiA+ICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMsZmFsY29uLWNwdSIsICJyZW5lc2FzLHI4
YTc3OWEwIjsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IG9yDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAg
ICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLGZhbGNvbi1icmVha291dCIsICJyZW5lc2FzLHI4YTc3
OWEwIjsNCj4gPiA+ID4NCj4gPiA+ID4gSSB1bmRlcnN0b29kIGl0LiBJIG1pc3Rvb2sgdGhlIGRl
c2NyaXB0aW9uLi4uDQo+ID4gPiA+DQo+ID4gPiA+ID4gSG93ZXZlciwgZmFsY29uLWNwdS5kdHNp
IGhhcyBqdXN0DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2Fz
LGZhbGNvbi1jcHUiOw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gV2hvIHdpbGwgdXNlICJyZW5lc2Fz
LGZhbGNvbi1icmVha291dCI/DQo+ID4gPiA+DQo+ID4gPiA+IEkgaW50ZW5kZWQgdG8gYWRkIGZh
bGNvbi1icmVha291dC5kdHNpIGFuZCB0aGUgZmlsZSBpbnRlbmRlZCB0byB1c2UNCj4gPiA+ID4g
InJlbmVzYXMsZmFsY29uLWJyZWFrb3V0IiBsaWtlIEtpbmdmaXNoZXIgKyBVTENCIGluIHRoZSBm
dXR1cmUuDQo+ID4gPiA+DQo+ID4gPiA+IEhvd2V2ZXIsIEkgcmVhbGl6ZWQgYSBjb21iaW5hdGlv
biBiZXR3ZWVuIHRoZSBjcHUgYm9hcmQgYW5kDQo+ID4gPiA+IHRoZSBicmVha291dCBib2FyZCBk
aWZmZXJzIHRoYW4gVUxDQiArIEtpbmdmaXNoZXIgbGlrZSBiZWxvdzoNCj4gPiA+ID4NCj4gPiA+
ID4gLSBUaGUgVUxDQiB3aXRob3V0IHRoZSBLaW5nZmlzaGVyIGNhbiB3b3JrLg0KPiA+ID4gPiAt
LSBTbywgc29tZSAuZHRzIGZpbGVzIGV4aXN0IGxpa2UgcjhhNzc5NTEtdWxjYi5kdHMuDQo+ID4g
PiA+IC0tIEFuZCwgcjhhNzc5NTEtdWxjYi1rZi5kdHMgaW5jbHVkZXMgcjhhNzc5NTEtdWxjYi5k
dHMgZm9yIFVMQ0IgKyBLaW5nZmlzaGVyLg0KPiA+ID4gPg0KPiA+ID4gPiAtIFRoZSBGYWxjb24g
Q1BVIGJvYXJkIHdpdGhvdXQgdGhlIGJyZWFrb3V0IGJvYXJkIGNhbm5vdCB3b3JrIGFjdHVhbGx5
Lg0KPiA+ID4gPiAtLSBCdXQsIG9uIHRoaXMgaW5pdGlhbCBwYXRjaCBzZXJpZXMgZW5hYmxlcyB0
aGUgQ1BVIGJvYXJkIGhhcmR3YXJlIChtZW1vcnkgbm9kZXMgJiBTQ0lGMCkgb25seS4NCj4gPiA+
ID4gLS0gVGhlIGJyZWFrb3V0IGJvYXJkIGhhcyBzb21lIGhhcmR3YXJlIGxpa2UgRXRoZXJuZXQg
YW5kIENBTi4NCj4gPiA+ID4gLS0gVGhlIGJyZWFrb3V0IGJvYXJkIGFsc28gaGFzIHNvbWUgY29u
bmVjdG9ycyBmb3Igc3ViIGJvYXJkcy4NCj4gPiA+ID4gLS0gU28sIEkgaW50ZW5kZWQgdG8gYWRk
IGZhbGNvbi1icmVha291dC5kdHNpIHRvIHN1cHBvcnQgRXRoZXJuZXQgaW4gdGhlIGZ1dHVyZS4N
Cj4gPiA+ID4NCj4gPiA+ID4gSW4gdGhpcyBjYXNlLCBJIHdvbmRlciBpZiB3ZSBzaG91bGQgZGVz
Y3JpYmUganVzdCAicmVuZXNhcyxmYWxjb24iIG9ubHkNCj4gPiA+ID4gYmVjYXVzZSB3ZSB3aWxs
IG5vdCBoYXZlIHI4YTc3OWEwLWZhbGNvbi17Y3B1LGJyZWFrb3V0fS5kdHMgZmlsZXMuDQo+ID4g
PiA+IEJ1dCwgd2hhdCBkbyB5b3UgdGhpbms/DQo+ID4gPg0KPiA+ID4gV2hhdCBraW5kIG9mIGNv
bm5lY3RvciBkb2VzIHRoZSBGYWxjb24gQ1BVIGJvYXJkIGhhdmU/DQo+ID4gPiBQZXJoYXBzIGl0
IGNhbiBiZSBwbHVnZ2VkIGludG8gYW5vdGhlciBiYXNlIGJvYXJkLCB0b28/DQo+ID4NCj4gPiBU
aGUgRmFsY29uIENQVSBib2FyZCBoYXMgMiBFWElPIGNvbm5lY3RvcnMuIFRoZSBFWElPIGNvbm5l
Y3Rvcg0KPiA+IGhhcyA0MDAgcGlucy4gU28sIEkgdGhpbmsgaXQgY2FuIGJlIHBsdWdnZWQgaW50
byBhbm90aGVyIGJhc2UgYm9hcmQuDQo+ID4NCj4gPiA+IFdoYXQgYWJvdXQgbW9kZWxsaW5nIGl0
IGxpa2UgdGhlIGl3YXZlLGcyMm0gU29NLCBhbmQgdGhlIGl3YXZlLGcyMmQNCj4gPiA+IFNPRElN
TSBib2FyZD8NCj4gPiA+IGFyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDUtaXdnKg0KPiA+DQo+ID4g
VGhhbmsgeW91IGZvciB0aGUgc3VnZ2VzdGlvbi4gU28sIEknbGwgZml4IHRoZSBwYXRjaCBsaWtl
IGJlbG93Lg0KPiA+IC0tLQ0KPiA+DQo+ID4gICAgICAgIC0gZGVzY3JpcHRpb246IFItQ2FyIFYz
VSAoUjhBNzc5QTApDQo+ID4gICAgICAgICAgaXRlbXM6DQo+ID4gKyAgICAgICAgICAtIGVudW06
DQo+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLHI4YTc3OWEwLWNwdSAjIEZhbGNvbiBDUFUg
Ym9hcmQgKFJUUDBSQzc3OUEwQ1BCMDAxMFMNCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHJlbmVz
YXMscjhhNzc5YTANCj4gPiArDQo+ID4gKyAgICAgIC0gaXRlbXM6DQo+ID4gKyAgICAgICAgICAt
IGVudW06DQo+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLHI4YTc3OWEwLWJyZWFrb3V0ICMg
RmFsY29uIEJyZWFrT3V0IGJvYXJkIChSVFAwUkM3NzlBMEJPQjAwMTBTKQ0KPiA+ICsgICAgICAg
ICAgLSBjb25zdDogcmVuZXNhcyxyOGE3NzlhMC1jcHUNCj4gPiAgICAgICAgICAgIC0gY29uc3Q6
IHJlbmVzYXMscjhhNzc5YTANCj4gPg0KPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBSWi9OMUQg
KFI5QTA2RzAzMikNCj4gPiAtLS0NCj4gPg0KPiA+IEFuZCwgSSB3aWxsIGZpeCB0aGUgY29tcGF0
aWJsZSBvZiByOGE3NzlhMC1mYWxjb24uZHRzIGluIHRoZSBwYXRjaCAxNC8xNCBsaWtlIGJlbG93
Lg0KPiA+IC0tLQ0KPiA+ICsgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLGZhbGNvbi1icmVh
a291dCIsICJyZW5lc2FzLGZhbGNvbi1jcHUiLCAicmVuZXNhcyxyOGE3NzlhMCI7DQo+ID4gLS0t
DQo+ID4NCj4gPiBCdXQsIHdoYXQgZG8geW91IHRoaW5rPw0KPiANCj4gVGhhbmtzLCBsb29rcyBn
b29kIHRvIG1lLg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkhIEknbGwgZml4IGl0Lg0KDQpC
ZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
