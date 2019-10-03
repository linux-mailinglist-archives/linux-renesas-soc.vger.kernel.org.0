Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57247C9857
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 08:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbfJCGil (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 02:38:41 -0400
Received: from mail-eopbgr1410109.outbound.protection.outlook.com ([40.107.141.109]:55578
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725770AbfJCGil (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 02:38:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oimy/+Enkj25EDicf63w77W15OvlKiThDFywXC280uEzCcT2gX+JPo3mhOcTSu2IMCCHb1FZc2Z/+8s1lJudvt6b/q1buEScHGXgwXD3VE+JvPNakz/byF13lb3RGm4PB7XO4TB04sDTzoOmFDIoL1KlpujAANUzZ/DD87xA4Cjk7hXV3jytvFCNi2RqT7JfdaXX5nYbdgNoRPzp3GlkgStMjUNbRyqWK1XY0xPGF8Qzq5Wf42U0mVfSihjNAxkMqi8mxr7udYjOHZEmlmle40jaaM6adPNGlbhpDjqH5bw+66UyAvdqWjWFK22Vx9fCpsE6HWsg7HLKvt06OLL4ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PF9uE1cJHCaFQjsb3k0ETlf+OSe3+gHXlXi3JzVTpzc=;
 b=cJ60L8lo9FmBrXNHMRDYqZGYtzisbCotyoubFpkGEelp1Jw8MmryGMLvnA2oT/7aTYFKiEI3VJ3Xb01kitNwcH/QGKQxyUO1WguDxeY3xTwDzbMBYoQsrHzQ7sQVvEcN+fyVtxvp0rlMbUzyyuqzH0P4axQo5R1kzG+8PDXsagvXml7/O2GAVwWjk4wvgw3eihAc0oOAyvaFayLM6dJzE0K8HfrXpAlAiacZBN1B4uiBr7jtSesF6Z61mcvvQCoqI8PjMsZJ3YC8m3GbxGOujjXfxAiLf7cuqEEgE3OdCpv3kStTnDelbSvRk0ckW6sAetXdItEKNwsIGFrUfA8h4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PF9uE1cJHCaFQjsb3k0ETlf+OSe3+gHXlXi3JzVTpzc=;
 b=F6DJWv5AqpbuiffbcIeId/T6iDJjlGIB9PNJaceONmIisoJBkD5ZRmhGWxtg3r9E6Z7z+bKMUH2Lu636VsDbr6ecSEuDoVNQAPWSoBhruR40FM20YXYdbY5fOi9k2qD1rH+BTQDo7hZGsD7yV0ayYypB8CbUJ4IS9Ml4MFvVoFo=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4198.jpnprd01.prod.outlook.com (20.178.98.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.18; Thu, 3 Oct 2019 06:38:38 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2305.022; Thu, 3 Oct 2019
 06:38:38 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: timer: renesas: tmu: Document r8a774b1
 bindings
Thread-Topic: [PATCH] dt-bindings: timer: renesas: tmu: Document r8a774b1
 bindings
Thread-Index: AQHVchuIQNHun2Bo106a/51G2vHeg6dIXISAgAApRhA=
Date:   Thu, 3 Oct 2019 06:38:37 +0000
Message-ID: <OSBPR01MB2103998BE3B934973FFE3D4AB89F0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1569249052-1037-1-git-send-email-biju.das@bp.renesas.com>
 <dd752192-8caf-39bf-5a91-27adb6a5f84b@linaro.org>
In-Reply-To: <dd752192-8caf-39bf-5a91-27adb6a5f84b@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7da362c0-164a-4716-0ba6-08d747cc52ae
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB4198:|OSBPR01MB4198:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB419886170F809E580870D7CCB89F0@OSBPR01MB4198.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(376002)(39850400004)(366004)(136003)(396003)(189003)(51914003)(199004)(66066001)(9686003)(6246003)(71200400001)(6436002)(81166006)(81156014)(3846002)(8676002)(6116002)(229853002)(71190400001)(2906002)(478600001)(8936002)(76116006)(66446008)(99286004)(256004)(55016002)(66476007)(64756008)(66556008)(66946007)(14454004)(86362001)(52536014)(446003)(25786009)(33656002)(11346002)(305945005)(4326008)(110136005)(54906003)(316002)(102836004)(74316002)(486006)(476003)(76176011)(53546011)(6506007)(7736002)(186003)(7696005)(26005)(5660300002)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4198;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ErDdKWfsQwwEzC1gD5J6YedwDUL4KiXN9vusik5VMfjhDgPicmR9OE2MbmwhbAQg692o1dUMRhzIjzR5FWwHRzSfXexVrMcQ+ZM/Cn4iHUX36REoOHp05b/h30jyEP/FA3s27d5Ow3jZFcZjzqcwvCmaLQYPfMlM68InQnY6P4ukoiAWhvPBu7M+2pbG5UzVWvRWtvri2+MgYEEkROm5PmVwe+eUEAQHHm9LqzB5XQRfHIlsfzU3I7Zz8oDI/mstPTUeCp8Ob7N+ldi3AaOub82SlvDwGrUNVjEkFzdHCHxxlIQKzDkpN2mcu5SM+c5+ZWP6ik3E3MILQrTjvklS3b/uyuCWl9mbNHWjrxZ9JuU9DHiSNqlb7It29D21mwK/9yEf0MWQqVDIuAaadFNsnwOmmyDbNbZwT8LY53yvhBE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da362c0-164a-4716-0ba6-08d747cc52ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 06:38:38.0374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y+IfJWx8H0jU/8dYKJIKoSeH7B5R2uZfRz4u7XUSw9FdOkamzdSLDnPUoSu/enVGqOQCh/Gx5hhj5sdGzrcI7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4198
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgRGFuaWVsLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4gDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gZHQtYmluZGluZ3M6IHRpbWVyOiByZW5lc2FzOiB0bXU6IERvY3VtZW50IHI4YTc3
NGIxDQo+IGJpbmRpbmdzDQo+IA0KPiBPbiAyMy8wOS8yMDE5IDE2OjMwLCBCaWp1IERhcyB3cm90
ZToNCj4gPiBEb2N1bWVudCBSWi9HMk4gKFI4QTc3NEIxKSBTb0MgaW4gdGhlIFJlbmVzYXMgVE1V
IGJpbmRpbmdzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJw
LnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdGltZXIvcmVuZXNhcyx0bXUudHh0IHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy90aW1lci9yZW5lc2FzLHRtdS50eHQNCj4gPiBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yZW5lc2FzLHRtdS50eHQNCj4gPiBpbmRleCA5ZGZm
N2U1Li4yOTE1OWY0IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy90aW1lci9yZW5lc2FzLHRtdS50eHQNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdGltZXIvcmVuZXNhcyx0bXUudHh0DQo+ID4gQEAgLTExLDYgKzEx
LDcgQEAgUmVxdWlyZWQgUHJvcGVydGllczoNCj4gPiAgICAtIGNvbXBhdGlibGU6IG11c3QgY29u
dGFpbiBvbmUgb3IgbW9yZSBvZiB0aGUgZm9sbG93aW5nOg0KPiA+ICAgICAgLSAicmVuZXNhcyx0
bXUtcjhhNzc0MCIgZm9yIHRoZSByOGE3NzQwIFRNVQ0KPiA+ICAgICAgLSAicmVuZXNhcyx0bXUt
cjhhNzc0YTEiIGZvciB0aGUgcjhhNzc0QTEgVE1VDQo+ID4gKyAgICAtICJyZW5lc2FzLHRtdS1y
OGE3NzRiMSIgZm9yIHRoZSByOGE3NzRCMSBUTVUNCj4gPiAgICAgIC0gInJlbmVzYXMsdG11LXI4
YTc3NGMwIiBmb3IgdGhlIHI4YTc3NEMwIFRNVQ0KPiA+ICAgICAgLSAicmVuZXNhcyx0bXUtcjhh
Nzc3OCIgZm9yIHRoZSByOGE3Nzc4IFRNVQ0KPiA+ICAgICAgLSAicmVuZXNhcyx0bXUtcjhhNzc3
OSIgZm9yIHRoZSByOGE3Nzc5IFRNVQ0KPiA+DQo+IA0KPiBUaGUgcGF0Y2ggZG9lcyBub3QgYXBw
bHkgb24gdGlwL3RpbWVycw0KDQpPSy4gSSB3aWxsIHJlYmFzZSBvbiB0b3Agb2YgdGlwL3RpbWVy
cyBhbmQgd2lsbCBzZW5kIFYyLg0KDQpSZWdhcmRzLA0KQmlqdQ0K
