Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D569D177380
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2020 11:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgCCKJt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Mar 2020 05:09:49 -0500
Received: from mail-eopbgr1410123.outbound.protection.outlook.com ([40.107.141.123]:64116
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727121AbgCCKJt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Mar 2020 05:09:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfchxaRjml0nLfuOClR+1634fUa3TNl++WHZm4f+LhIZ5e9bicZQEVE7KimlfXArQANtX1yjouYSOKLE2CAIL+fXgYpVaoX/xYH4opqfP5gepRAnJoYKnV4jS+iAxVBNvTAMqCxts38NxREvoPAfMjV/xRncVOX9+haP0BHXSOksUa6CodqPr/bVMhpWKs7z2Kbogg39G4xnSrjpuj45WrH0Fgrl4qn4nfhCwaYMXmzAzWoII1ZhZxmGwvlMj2jTigx4MzzMjgTzAKq8LhGZQUCGwL/FzSC10WM/xAC7yp9dWFudqkJ89sY3mmOtkFG5WiELRMH1jnSqjxMZC/7e9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I33vN3Lmnvp2LlBXqrWkkWihXOmlJLxIkjKqgcENmMc=;
 b=GZW/CnRYtdjQu0Vmg9TjwOd3duy6YNmStfeBiHCppc8FXvQ9D6tJiY+Gr0Q0Efo7Es0RqUsU3RNxhe416ypMA1sfyUih2KG24RUChlG3TTS25ocOFADoJ/Z8i3g1b2YlF5PWbSyPKeqpsMmXi3+L8ZT2bId9Nhk9NRMoDB5yAqnNrw4j5ikK/LOb92oPfMbSnPM8AB5ifI9J4tiE7cmt58U6iOH76GEqdU/Qqawn5HGveI2B8V9dOcnpqoHvJUwyL3fwXwkE9D1JMTsXEFyrHN/o8Rl+7Sp+MJOYpEWXv6bZtojXkmRLPT6G8jwRRlqSbKy5vsutlcfPqBG723HXkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I33vN3Lmnvp2LlBXqrWkkWihXOmlJLxIkjKqgcENmMc=;
 b=CSb9qnC36hbGA/IqG4KJGOwGgp+AcYlkGmC8LNNeu+0jsvlWMrdTawyHnoc5zZY5bjIfRg1+UyY1dknxk0J3aj2FpaLJkncBHgEjXX4Ey2UfOj5PpE56i3RHlGxceeWBEDrpZzrYLFgZFmR0GkrSRfcHgPh/eOCa0my99YfyVyc=
Received: from OSAPR01MB5028.jpnprd01.prod.outlook.com (20.179.179.149) by
 OSAPR01MB2466.jpnprd01.prod.outlook.com (52.134.245.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Tue, 3 Mar 2020 10:09:46 +0000
Received: from OSAPR01MB5028.jpnprd01.prod.outlook.com
 ([fe80::50c1:d043:233d:2092]) by OSAPR01MB5028.jpnprd01.prod.outlook.com
 ([fe80::50c1:d043:233d:2092%7]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 10:09:46 +0000
From:   Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/2] ARM: dts: iwg22d-sodimm: disable lcd for extension
 board
Thread-Topic: [PATCH 2/2] ARM: dts: iwg22d-sodimm: disable lcd for extension
 board
Thread-Index: AQHV8Jl4Fo6G1APSnkq4IelK/bpYvKg2pj+g
Date:   Tue, 3 Mar 2020 10:09:45 +0000
Message-ID: <OSAPR01MB50287DB38AF6CBCC7EBBFF96AEE40@OSAPR01MB5028.jpnprd01.prod.outlook.com>
References: <1580323253-3281-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
 <1580323253-3281-3-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
 <CAMuHMdV0aOF30FpEzekq65CA6=_UTQA56WOCCv=WymuHapVjaw@mail.gmail.com>
In-Reply-To: <CAMuHMdV0aOF30FpEzekq65CA6=_UTQA56WOCCv=WymuHapVjaw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marian-cristian.rotariu.rb@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3b856700-82d3-49c2-3a1e-08d7bf5b0024
x-ms-traffictypediagnostic: OSAPR01MB2466:|OSAPR01MB2466:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB24668BD6D03EC0C3DEE73022AEE40@OSAPR01MB2466.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 03319F6FEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(26005)(186003)(9686003)(66946007)(66556008)(86362001)(107886003)(52536014)(478600001)(66476007)(76116006)(4326008)(64756008)(66446008)(55016002)(81156014)(81166006)(8676002)(71200400001)(6916009)(2906002)(316002)(5660300002)(53546011)(6506007)(33656002)(4744005)(7696005)(54906003)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB2466;H:OSAPR01MB5028.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7Szru/kKSxmVO53hsHdMWnegpcWTDoTE2tol+b1BgLatWElMozhPMeAkKz0JSE1Vw+D2KxRtGi64vBF5P6DPjzpZx2E/qYkE0uSfwwsF+XUevGUK4ne9bzutAAUBb8r/5wGbkqhfs9ko9iYTbZcRTPbGWKvHCtVl9lzM63Tma2C5pmfkHZQzDnivz8/3OcEoQyyMXSDO9Lbj4OAQIp7xw6tstp3ut/OZzGLAnYqHDy7c37YH8qkMhCqdJ1q9RasMHUJ/9rfic/t6oAJ+etstJjE6YcSvvgoWqSrmrcxz3UCkXtRMaqQRhWDocXjDDsEi8XQkwSCOcD0+9cN0eTP/yMmRG8O8VmB9ctQYTTvkNiOXUFtjQe8OR1WkZgarSy8Nlu53PO29QvH5LWS8iQRYCRknZ1oZlhvoLYfOdk8kcSqfs4ClAKEIay0bJ4gyo+Oo
x-ms-exchange-antispam-messagedata: RTHV8gddfOqRC4lABbcNNDqMIDn0htzayfwMXSMQGS8TPxV2ArdLkH/1Lig+brW5pjqi1yho9QYCkUSGPnu2+tPDKZW8gwxZHrFBjUDY9iOYligKDUmbPUrS0S4KGxt1RVPy+W8Rh+w6zBySSDUXcA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b856700-82d3-49c2-3a1e-08d7bf5b0024
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2020 10:09:45.9548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eyKZZBsMxxl+/AvsoxPobLVkmpjQNJ3J/K0bTdzvMnY9gYxLB7ndT+sN20BapAlqj49iRooMw74W8RXqpwnWreDBrqajy+jtECF3k87G+QWFrKvN0IsCYVphzaxHeBcN4nHMzCrxddwqoOuqeUwThQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2466
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogbGludXgt
cmVuZXNhcy1zb2Mtb3duZXJAdmdlci5rZXJuZWwub3JnIDxsaW51eC1yZW5lc2FzLXNvYy0NCj4g
b3duZXJAdmdlci5rZXJuZWwub3JnPiBPbiBCZWhhbGYgT2YgR2VlcnQgVXl0dGVyaG9ldmVuDQo+
IFNlbnQ6IDAyIE1hcmNoIDIwMjAgMTM6NTANCj4gVG86IE1hcmlhbi1DcmlzdGlhbiBSb3Rhcml1
IDxtYXJpYW4tY3Jpc3RpYW4ucm90YXJpdS5yYkBicC5yZW5lc2FzLmNvbT4NCj4gQ2M6IExpbnV4
LVJlbmVzYXMgPGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz47IENocmlzIFBhdGVy
c29uDQo+IDxDaHJpcy5QYXRlcnNvbjJAcmVuZXNhcy5jb20+OyBQcmFiaGFrYXIgTWFoYWRldiBM
YWQNCj4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCAyLzJdIEFSTTogZHRzOiBpd2cyMmQtc29kaW1tOiBkaXNhYmxlIGxjZCBm
b3IgZXh0ZW5zaW9uDQo+IGJvYXJkDQo+IA0KPiBIaSBNYXJpYW4tQ3Jpc3RpYW4sDQo+IA0KPiBP
biBXZWQsIEphbiAyOSwgMjAyMCBhdCA3OjU4IFBNIE1hcmlhbi1DcmlzdGlhbiBSb3Rhcml1IDxt
YXJpYW4tDQo+IGNyaXN0aWFuLnJvdGFyaXUucmJAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+
IFRoZSB0d28gdmFyaWFudHMgb2YgdGhlIGlXLUcyMkQgc2hvdWxkIGJlIG11dHVhbGx5IGV4Y2x1
c2l2ZSwNCj4gPiB0aGVyZWZvcmUgdGhpcyBwYXRjaCBkaXNhYmxlcyB0aGUgUkdCIExDRCBkaXNw
bGF5IHdoZW4gdGhlIEhETUkNCj4gPiBleHRlbnNpb24gYm9hcmQgaXMgdXNlZC4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IE1hcmlhbi1DcmlzdGlhbiBSb3Rhcml1DQo+ID4gPG1hcmlhbi1jcmlz
dGlhbi5yb3Rhcml1LnJiQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gU2hvdWxkbid0IHRoaXMgYmUg
bWVyZ2VkIHdpdGggdGhlIHByZXZpb3VzIHBhdGNoLCB0byBhdm9pZCBiaXNlY3Rpb24gZmFpbHVy
ZXM/DQoNCk9rLCBJIHdpbGwgZG8gdGhhdC4gDQoNCkJlc3QgcmVnYXJkcywNCk1hcmlhbg0K
