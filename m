Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18D6623A1CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Aug 2020 11:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgHCJda (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Aug 2020 05:33:30 -0400
Received: from mail-eopbgr1300109.outbound.protection.outlook.com ([40.107.130.109]:23328
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725948AbgHCJd3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Aug 2020 05:33:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUIIwIJMfC5Oe7xjUNUMIF0gJ+Xm8vs25EyczhyDw+gDTu+yyQklBOaGwsuNEDcW9b6ZK2Wn2rZUhLLIhyDoieQE1ZKTiX2BWFO/gfHzB0rnyuSpCM3Hr0XY2Ny5hJJ3Qwd9g/PQsjv2n68/LhlAISS7dhjbkLdwN+zX8jz4isSXEv3qVOOGwSVgkx+hjXeT56xnrouOlJnk7Yb7O7FrIX6sZipEjo+hpX4/O9zKAXNcByUpm4IKJ9HdPq69hAjZnLIA157r5Z3VPseGEfe5f3dIXtHSWskggM6Ko0S2vbOCWQwd5/DLWcc9AWmsHqxVmimMgQnxoK5VVZARJ7nLpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZ0z1O5+at2Kza3ckAVM3birlLCuRmLuqCj0n4u75fc=;
 b=DyApS45QlmOk6pqJ/fM9keTnjEIU5C3eQDkFolFw4mm9M8wMhLEEwjW/y9K3BIpECBHtwCaIQUKmJ2yoDtPJQ22hfOaC/Y6MY7CG9RMoOKHmJwPk6RrrEAcbC5IHbXHjyrsCtGEs9BFU7AqgcPY/TRmcKSVySkMENfXcj8Jm2fF0jBDlcTrN4MdJMApXjpI7qh4jhH6+YUiDTkfSrs/sOS6A9lgwZQoky2En9W/6ER5n9OODyPvZt4wrVvNAgFq0sdCj/rSUG+gRXzdAJK+QlIYou4euAjOeXWLutO4tLySg+VDeXqmh2e/Es/9++68Q14HiWJ1NXjYe1vPmyWpaSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZ0z1O5+at2Kza3ckAVM3birlLCuRmLuqCj0n4u75fc=;
 b=gpVyEx4m7nVCgfACuq3ajk85I6PbpOaGMTl8VMb6aQRc8ixoNf/E7vR6TE6wXNWjBcv0KdnPCeaVpXwbsFZYr8ehXmqGffeqM3DwPSgOqNmcGiJr1Zshkzt1Qidd2aYD0k+R8aBPoMuwK8SCzH7Pf5JKEpmQYhSfGj0HKn6yPqQ=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB3324.jpnprd01.prod.outlook.com
 (2603:1096:404:db::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Mon, 3 Aug
 2020 09:33:22 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee%7]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 09:33:22 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Prashant Malani <pmalani@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: update usb-c-connector required property
Thread-Topic: [PATCH 1/2] dt-bindings: update usb-c-connector required
 property
Thread-Index: AQHWXA1B01B9KGsloUa+j9zNs/1Vr6kLZwAAgAACdYCAAAeQAIAaxJcw
Date:   Mon, 3 Aug 2020 09:33:22 +0000
Message-ID: <TYBPR01MB5309001571B692F1A042DFCF864D0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <1594971274-48027-1-git-send-email-biju.das.jz@bp.renesas.com>
 <20200717075452.GD68629@google.com>
 <TYBPR01MB5309AED7152585BD238DD013867C0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <CAMuHMdVvOa6GhVi8CZ6QNdY02KU6sOL4s0BS=vDM+u3a+7CaQw@mail.gmail.com>
In-Reply-To: <CAMuHMdVvOa6GhVi8CZ6QNdY02KU6sOL4s0BS=vDM+u3a+7CaQw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0075aae7-ca8e-485a-8249-08d8379043c4
x-ms-traffictypediagnostic: TY2PR01MB3324:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB3324F2C644390DE38E3580F7864D0@TY2PR01MB3324.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qh+Z4n5dqcHcyG4DrmBhzaG8SdG7BtOiNxmU55uWYMMk/ZkGA6NauAqJObwLN1C3ZazTUwPmjLk2gzfVimt4j/0Z7XyAjGbf6u+U6Wyo3kX6GnD6y5q/AaN5WTzOn47y/Qy7K7XtYdn+wzvM2suAfH62mDEPn+b+W25QmCUKjeiDx2XkXmvpPhE9OYLuZPrasQ3KpzFCZlzPs8cB24fwQc7KrEt2BR9KhDn8WH1Kqp6Vp6E3nTw2LGrsn/itj5g+HxNZ7p2qYgOaynZrP9oL2PSBMnbfISif7imhAzpPDp02ZLUkSrqFVA53/VspNSLsQO1FXU+FNlXgwCUCr5m005PTE7nW7tCUxCbbRxLFuXRMZNhMqK92pFtn76AhSNH1TUTYlFlFtBvR+zBwjgSKiw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(186003)(55016002)(33656002)(6506007)(4326008)(86362001)(71200400001)(54906003)(53546011)(7696005)(316002)(15650500001)(26005)(6916009)(478600001)(8676002)(2906002)(7416002)(64756008)(66556008)(66446008)(66476007)(9686003)(8936002)(5660300002)(52536014)(966005)(66946007)(83380400001)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Qo0TmUxY8XMIyeBIq4ILc5EkdjyswIzo/Y692Ilzo2C0eJQuD9thQhh261FTHriSRrq4FhCEMmIyacfztXimZaCrJ7GrPXbtLaIDeVuPo/rltqhVYXQFCi0go653qT5n9CZJyuWwgp57CrgGXLBiXcV6MEL49EYRhNAuzLv0nc5V3JAdPDXFrz0jT5jHTXrOtr9UDSS1fqP9neDY1Oy6/18+6CE4alYPDpV5lxlZQF92AJC/lM+TZWbZV4sORnAVT51SWIJ37EMTIbMJd68/yYAklluD1VDcRmlny2R35cyjWURymYktGH/BsabDzDnDvgo93lFuedYmWIa5i9sME2XirSsbltT/JwRIq9DRWERIYxHB7K63TRYN4ERxwgT1+Lai6R6tHbvpSBP1A+fuDcQdFnjVpHStFIda5u6jSmQ176FcKCcZIX/I4ZOdL2VMnOcbtXfofmOdOpLydAIo6Ftw/jNxputKp2vZKtE4UYz038iaMQQGXh/yOjMKB8lqCR3n+J0MlJTCbYnBZ3ZWNV7FWMorkXugY+0wB6Dl8ei8Ou3Y8RQX61qaWbX3AeqLw/G8UxPxSeHU0xGFmTOjcJu6PLhEGx/gHt/mZQfB3upG2UbQ57efWih92nvho1GzHlooCVHJ9P5H7MEmJGJYmg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0075aae7-ca8e-485a-8249-08d8379043c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2020 09:33:22.3391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GxoR9qULbRLvji2oAwGRSf5E0XqR5U7kf376bksPQNmumcq4MUoSUzpu9iylAXKS6Pp3kYPSR0mRVRtNRLqQafTdvq41uBw3orZ587k66y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3324
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS8yXSBkdC1iaW5kaW5nczogdXBkYXRlIHVzYi1jLWNvbm5lY3RvciByZXF1aXJlZA0K
PiBwcm9wZXJ0eQ0KPg0KPiBIaSBCaWp1LA0KPg0KPiBPbiBGcmksIEp1bCAxNywgMjAyMCBhdCAx
MDowOSBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0K
PiA+ID4gT24gRnJpLCBKdWwgMTcsIDIwMjAgYXQgMDg6MzQ6MzNBTSArMDEwMCwgQmlqdSBEYXMg
d3JvdGU6DQo+ID4gPiA+IFNvbWUgYm9hcmRzIGhhdmUgYSBzaW5nbGUgU1MgY2FwYWJsZSBjb25u
ZWN0b3IuIFVwZGF0ZQ0KPiA+ID4gPiB1c2ItYy1jb25uZWN0b3IgYmluZGluZ3MgdG8gbGlzdCBw
b3J0QDEgYXMgYXQgbGVhc3Qgb25lIG9mIHRoZSByZXF1aXJlZA0KPiBwcm9wZXJ0eS4NCj4gPiA+
ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIu
bWFoYWRldi0NCj4gPiA+IGxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4g
PiA+ICBSZWY6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTExMjk1NjcvDQo+
ID4gPiA+IC0tLQ0KPiA+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nv
bm5lY3Rvci91c2ItY29ubmVjdG9yLnlhbWwgfA0KPiA+ID4gPiA3DQo+ID4gPiA+ICsrKysrLS0N
Cj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbA0KPiA+ID4gPiBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rv
ci55YW1sDQo+ID4gPiA+IGluZGV4IDliZDUyZTYuLjQxZTA2ODUgMTAwNjQ0DQo+ID4gPiA+IC0t
LQ0KPiA+ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3Iv
dXNiLWNvbm5lY3Rvci55YW1sDQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLQ0KPiA+ID4gY29ubmVjdG9yLnlhbWwNCj4gPiA+ID4g
QEAgLTEzOSw4ICsxMzksMTEgQEAgcHJvcGVydGllczoNCj4gPiA+ID4gICAgICAgICAgZGVzY3Jp
cHRpb246IFNpZGViYW5kIFVzZSAoU0JVKSwgcHJlc2VudCBpbiBVU0ItQy4gVGhpcyBkZXNjcmli
ZXMNCj4gdGhlDQo+ID4gPiA+ICAgICAgICAgICAgYWx0ZXJuYXRlIG1vZGUgY29ubmVjdGlvbiBv
ZiB3aGljaCBTQlUgaXMgYSBwYXJ0Lg0KPiA+ID4gPg0KPiA+ID4gPiAtICAgIHJlcXVpcmVkOg0K
PiA+ID4gPiAtICAgICAgLSBwb3J0QDANCj4gPiA+ID4gKyAgICBhbnlPZjoNCj4gPiA+ID4gKyAg
ICAgIC0gcmVxdWlyZWQ6DQo+ID4gPiA+ICsgICAgICAgIC0gcG9ydEAwDQo+ID4gPiA+ICsgICAg
ICAtIHJlcXVpcmVkOg0KPiA+ID4gPiArICAgICAgICAtIHBvcnRAMQ0KPiA+ID4NCj4gPiA+IFNv
IHRoZSBjb25uZWN0b3JbMV0gZG9lc24ndCBoYXZlIGFueSBIaWdoIFNwZWVkIChEKy9ELSkgbGFu
ZXM/IFRob3NlDQo+ID4gPiBhcmUgc3VwcG9zZWQgdG8gYmUgcHJlc2VudCBvbiBhbGwgVHlwZSBD
IGNvbm5lY3RvcnMuDQo+ID4NCj4gPiBZZXMgLCBVU0ItVHlwZUMgY29ubmVjdG9yIGhhcyAgVVNC
M0hTMF9EUCBhbmQgVVNCM0hTMF9ETSBzaWduYWxzDQo+IGFwYXJ0DQo+ID4gZnJvbSBVU0IzUzBf
Q0xLX1AsDQo+ID4NCj4gVVNCM1MwX0NMS19NLFVTQjNTMF9SWF9QLFVTQjNTMF9SWF9NLFVTQjNT
MF9UWF9QLFVTQjNTMF9UWF9NLA0KPiA+IFVTQjNIUzBfRFAsVVNCM0hTMF9ETSwgVVNCMzBfUFdF
TiBhbmQgVVNCMzBfT1ZDLg0KPiA+DQo+ID4gQnV0IHRoZSBDb25uZWN0b3IgaXMgYSBTUyBDYXBh
YmxlIGNvbm5lY3RvciB3aGljaCBzdXBwb3J0cyBVRlAvREZQIGFuZA0KPiBEUlAuDQo+DQo+IFRo
ZSBTUyBsYW5lcyBvZiB0aGUgY29ubmVjdG9yIGFyZSB0aWVkIHRvIHRoZSBIRDNTUzMyMjAuDQo+
IFRoZSBEKy9ELSBsYW5lcyBvZiB0aGUgY29ubmVjdG9yIGFyZSB0aWVkIHRvIHRoZSBSLUNhciBT
b0MgZGlyZWN0bHkuDQo+DQo+IFBlcmhhcHMgbW9kZWxsaW5nIHRoZSBDIGNvbm5lY3RvciBhcyBh
IGNoaWxkIG9mIHRoZSBIRDNTUzMyMjAgaXMgdGhlIGlzc3VlPw0KPiBJZiB0aGUgQyBjb25uZWN0
b3Igd2FzIGEgc2VwYXJhdGUgbm9kZSwgaXQgY291bGQgaGF2ZSBwb3J0QDEgcG9pbnQgdG8gdGhl
DQo+IEhEM1NTMzIyMCwgYW5kIHBvcnRAMCB0byB0aGUgU29DPw0KPiBUaGF0IG1lYW5zIHRoZXJl
IG5lZWRzIHRvIGJlIGEgZGlmZmVyZW50IHdheSB0byBsaW5rIHRoZSBIRDNTUzMyMjAgYW5kIHRo
ZQ0KPiBvbi1Tb0MgdXNiM19wZXJpMC4gIFRoZSBjdXJyZW50IGxpbmsgYmV0d2VlbiB1c2IzX3Bl
cmkwIGFuZCBoZDNzczMyMjBfZXANCj4gbG9va3MgYSBiaXQgc3RyYW5nZSB0byBtZSwgYXMgdGhl
IGxhdHRlciBsYWJlbCBwb2ludHMgdG8gdGhlIEMgY29ubmVjdG9yLCBub3QgdG8NCj4gdGhlIEhE
M1NTMzIyMCBpdHNlbGZbMl0uDQo+DQo+ID4gPiBbMV0gOiBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3BhdGNoLzExMTI5NTY3Lw0KPg0KPiBbMl0NCj4gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvYXJjaC8N
Cj4gYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRjMC1jYXQ4NzQuZHRzDQoNClllcyBhcyB5
b3Ugc3VnZ2VzdGVkLCB3ZSBjb3VsZCByZW1vZGVsIHRoaXMgYXMgcGVyIHNjaGVtYXRpYy4NCg0K
MSkgQ29ubmVjdG9yLS0+U29DKEhTIGxpbmUpDQoyKSBDb25uZWN0b3IgLS0+IEhEM1NTMzIyMC0t
PlNvQyAoU1MgbGluZSkNCg0KU28gdGhlIEdyYXBoIHdpbGwgbG9vayBsaWtlDQotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KMSkgQ29ubmVjdG9yDQogIC0tcG9ydDAgKGhzX2VwIC0t
PiB1c2IzX2hzX2VwKFNvQykNCiAgLS0gcG9ydDEgKHNzX2VwLS0+aGQzc3MzMjIwX2luX2VwKQ0K
DQoyKSBIRDNTUzMyMA0KLS0gcG9ydDAgKGhkM3NzMzIyMF9pbl9lcCAtLT4gc3NfZXAgKGNvbm5l
Y3RvcikNCi0tIHBvcnQxIChoZDNzczMyMjBfb3V0X2VwIC0tPiB1c2IzX3JvbGVfc3dpdGNoIChT
b0MpDQoNCjMpIFNvQw0KLS0gcG9ydDAgKHVzYjNfaHNfZXAgLS0+IGhzX2VwIChjb25uZWN0b3Ip
DQotLSBwb3J0MSAodXNiM19yb2xlX3N3aXRjaCAtLT4gaGQzc3MzMjIwX291dF9lcA0KDQogSSB3
aWxsIHNlbmQgcGF0Y2ggYXMgcGVyIHRoZSBhYm92ZSBtb2RlbC4gUGxlYXNlIGNvcnJlY3QgbWUg
aWYgYW55IHRoaW5nIHdyb25nLg0KDQpSZWdhcmRzLA0KQmlqdQ0KDQoNCg0KUmVuZXNhcyBFbGVj
dHJvbmljcyBFdXJvcGUgR21iSCwgR2VzY2hhZWZ0c2Z1ZWhyZXIvUHJlc2lkZW50OiBDYXJzdGVu
IEphdWNoLCBTaXR6IGRlciBHZXNlbGxzY2hhZnQvUmVnaXN0ZXJlZCBvZmZpY2U6IER1ZXNzZWxk
b3JmLCBBcmNhZGlhc3RyYXNzZSAxMCwgNDA0NzIgRHVlc3NlbGRvcmYsIEdlcm1hbnksIEhhbmRl
bHNyZWdpc3Rlci9Db21tZXJjaWFsIFJlZ2lzdGVyOiBEdWVzc2VsZG9yZiwgSFJCIDM3MDggVVN0
LUlETnIuL1RheCBpZGVudGlmaWNhdGlvbiBuby46IERFIDExOTM1MzQwNiBXRUVFLVJlZy4tTnIu
L1dFRUUgcmVnLiBuby46IERFIDE0OTc4NjQ3DQo=
