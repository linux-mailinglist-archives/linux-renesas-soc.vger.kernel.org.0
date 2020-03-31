Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28321199EA5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2020 21:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgCaTHZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Mar 2020 15:07:25 -0400
Received: from mail-eopbgr1400132.outbound.protection.outlook.com ([40.107.140.132]:29728
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726315AbgCaTHZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Mar 2020 15:07:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtulbrudrUi3EZxWeMcJLKH0bMACuM3j52T52G2UHBXSE+2+/aXZpv8CRgjeLMo6C+hbben7T57FQxhp18rQnepfwZYECKCSeFVFi/1L2rOxVT4K+0vYCoQ5BeXOqnvnCRlfOAizu93kIeDnEwP/CHhu+/y7qGl8YrQtVrf68Z6p2UQtBLu8n4zqD+AtxW4go3s8xCbmB1ObiANok55dRPmbxIVKxNOh42veBhPVxct9dG1uH7g5KyEZRtzONjmzRfclyEA6muzSVwKCWg4ZcnzohLxXMab2S7y1qlJxlv3s+Bf4PeMMQt9mwrrWFKnhJQGU8xceRi7FIm5LzJOkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kEbQqCt4aTiNCEMnkH910syExpNJ1sXT584F6+R858=;
 b=J7qiKS0xiDj6wctN6mRvMss9CmNbEMVDMlZBcO3REma82blkyI9/LV+AxAcCnC6OMafpQEGZMx1ENwXSGmD+9eHJrxpt92iAbBDuH9GC9ej45qgr4p0/ZcxYHeZZ2z9vOKlkJo6iE+9hAqBP1NO8bK/LyGZE5q9zmrZRolP/YUlcQ1CoVyo/VrSksoHa5m3klG0f96MOZqDCtdSVXSc770GehQ+0sZ4vU6h1YcCHNAzr+dUiKQ2uwmZySBiOvOgZGcdCBTBNX50dPyj95iWGdPOMIkzHniUudrpCTe8ExEOx9vaJQAqjnzFtDx1Qct5svInNq5SUUrtSuhWIsDBcFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kEbQqCt4aTiNCEMnkH910syExpNJ1sXT584F6+R858=;
 b=TZZ9tlKuw65FNtAhs1lyNr4SncqnkbjJvr4puApiZ9nNG2nqgOirYm6mbTor7vcHjV0iNztRUrpBwNF+1rhu3ZPHy/4oTbT9ZgkIcJ8shU2nXgbibpy0S82ADzLUAzGmDIOJB/pqK5waEMXDNa9e1Wh/as3yPv6tQhYvQD55WIY=
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com (52.133.166.145) by
 TYXPR01MB1613.jpnprd01.prod.outlook.com (52.133.166.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15; Tue, 31 Mar 2020 19:07:18 +0000
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::e9ac:8933:9767:9c69]) by TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::e9ac:8933:9767:9c69%2]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 19:07:18 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kazuhiro Fujita <kazuhiro.fujita.jg@renesas.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hao Bui <hao.bui.yg@renesas.com>,
        KAZUMI HARADA <kazumi.harada.rh@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sasha Levin <sashal@kernel.org>
Subject: RE: [PATCH] serial: sh-sci: Make sure status register SCxSR is read
 in correct sequence
Thread-Topic: [PATCH] serial: sh-sci: Make sure status register SCxSR is read
 in correct sequence
Thread-Index: AQHWBGQGJbDUemPUNEWeRBL+Vpn8T6hi1j+AgAA+RsA=
Date:   Tue, 31 Mar 2020 19:07:18 +0000
Message-ID: <TYXPR01MB15688F7D17F54C908C562AE38AC80@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <1585333048-31828-1-git-send-email-kazuhiro.fujita.jg@renesas.com>
 <CAMuHMdW+u5r6zyxFJsVzj21BYDrKCr=Q6Ojk5VeN+mkhvXX9Jw@mail.gmail.com>
In-Reply-To: <CAMuHMdW+u5r6zyxFJsVzj21BYDrKCr=Q6Ojk5VeN+mkhvXX9Jw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcY2JyYW5kdDAxXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctZDU1MGM4MjEtNzM4Mi0xMWVhLWFhNjAtOTRlNmY3Njc5M2FlXGFtZS10ZXN0XGQ1NTBjODIzLTczODItMTFlYS1hYTYwLTk0ZTZmNzY3OTNhZWJvZHkudHh0IiBzej0iMTQzOSIgdD0iMTMyMzAxNTUyMzYwNDk4NjQwIiBoPSJrVmVmZkVBSEdMOHI3MllIVXdGT01sUDRDbXc9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1e05e618-7049-4b1c-e836-08d7d5a6bbcf
x-ms-traffictypediagnostic: TYXPR01MB1613:|TYXPR01MB1613:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYXPR01MB16133D716B16EA07257FD4278AC80@TYXPR01MB1613.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYXPR01MB1568.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(110136005)(54906003)(76116006)(8676002)(4326008)(66556008)(64756008)(66446008)(478600001)(7696005)(86362001)(9686003)(2906002)(55016002)(33656002)(81156014)(81166006)(8936002)(6506007)(26005)(316002)(186003)(66946007)(6636002)(52536014)(71200400001)(66476007)(5660300002);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rqKvvyHwMgiti5deadlVXGpOvoB3fGfWuwENQ8Vr0RHYOI4J/vy34/SBEGFb4BCv7e89iA3B7YHDTdpAXbLw2YnTwouXu2qcN3CPXx5Pi9TdO3r120zimBUAKr0LtsuKG4H3pi41PdW4GgcCQN9ToPujp6hB/KJM6c8VkoJtIvmMrvTK9xuvQLJp6rnM05xIzcLz9z1v8VtVekI32S/BYH4l0Cr1ghar2VIT8dHQpZNjhxnR9YN6HVu9MSfgNH4erS6d8cISPwABAvb0J022RUeRNw8kl2boe42ytnTgXJepMXbLzKi+Flaxc+bYqSwDaKGw5PG5BV57oOkhYUzmEYpvL11GMLjX4ofCnpMWa1YykARIDWrz7u26dyrptYgK0zMiftimwqSBEISdtHAr0mNvKkYVxsuZGav2Mn8fz4Eyy2NsOUlX4kVWYdVljjuL
x-ms-exchange-antispam-messagedata: Tp2mdY5wSFZkpPxqHdbLI7SnbT8mxZL5gqVDDQIIWryuwBQXKYaEEowC81r+a4qoj5tDHCa1yYAEEX5LMbT2LwTMn3OWVbM/U+A/Wh86H/rWdISTj72tgNZtitufhaYKxzzjSuWHDHJbjWRO3X4+Rg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e05e618-7049-4b1c-e836-08d7d5a6bbcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 19:07:18.6397
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZGBgoSMXeqqx8HxqSt1ZCcedyu3Ip5fkXgU5+Lo/qF8FqOXHbP9LqxzwKhh+OAkxFpOIdB8NpWYs6ZaJZCQsFUMwT1hVSQBVLjSTcSETKrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1613
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFR1ZSwgTWFyIDMxLCAyMDIwIDEsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3
cm90ZToNCj4gSG93ZXZlciwgdGhlIGRvY3VtZW50YXRpb24gZm9yICJTQ0lGQSIgb24gUlovQTIg
KGZvciB3aGljaCB3ZSB1c2UNCj4gUE9SVF9TQ0lGLCBub3QgUE9SVF9TQ0lGQSwgaW4gdGhlIGRy
aXZlcikgaGFzIGNvbmZsaWN0aW5nIGluZm9ybWF0aW9uOg0KPiAgIDEuIFNlY3Rpb24gMTcuMi43
ICJTZXJpYWwgU3RhdHVzIFJlZ2lzdGVyIChGU1IpIiBzYXlzOg0KPiAgICAgICAgLSBBIHJlY2Vp
dmUgZnJhbWluZy9wYXJpdHkgZXJyb3Igb2NjdXJyZWQgaW4gdGhlICJuZXh0IHJlY2VpdmUNCj4g
ICAgICAgICAgZGF0YSByZWFkIiBmcm9tIHRoZSBGSUZPLA0KPiAgICAgICAgLSBJbmRpY2F0ZXMg
d2hldGhlciB0aGVyZSBpcyBhIGZyYW1pbmcvcGFyaXR5IGVycm9yIGluIHRoZSBkYXRhDQo+ICAg
ICAgICAgICJyZWFkIiBmcm9tIHRoZSBGSUZPLg0KPiAgIDIuIEZpZ3VyZSAxNy44ICJTYW1wbGUg
Rmxvd2NoYXJ0IGZvciBSZWNlaXZpbmcgU2VyaWFsIERhdGEgaW4NCj4gICAgICBBc3luY2hyb25v
dXMgTW9kZSAoMikiLg0KPiAgICAgICAgLSBXaGV0aGVyIGEgZnJhbWluZyBlcnJvciBvciBwYXJp
dHkgZXJyb3IgaGFzIG9jY3VycmVkIGluIHRoZQ0KPiAgICAgICAgICByZWNlaXZlZCBkYXRhIHRo
YXQgaXMgInJlYWQiIGZyb20gdGhlIEZJRk8uDQo+IA0KPiBTbyB3aGlsZSB0aGUgY2hhbmdlIGxv
b2tzIE9LIGZvciBtb3N0IFJlbmVzYXMgQVJNIFNvQ3MsIHRoZSBzaXR1YXRpb24NCj4gZm9yIFJa
L0EyIGlzIHVuY2xlYXIuDQo+IE5vdGUgdGhhdCB0aGUgYWJvdmUgZG9lcyBub3QgdGFrZSBpbnRv
IGFjY291bnQgdmFyaWFudHMgdXNlZCBvbiBTdXBlckgNCj4gU29Dcy4NCg0KRm9yIHRoZSBSWi9B
Mk0sIGl0IGlzIE5PVCBhICJTQ0lGQSIuLi5ldmVuIHRob3VnaCBpdCBzYXlzIHRoYXQgaW4gdGhl
IA0KaGFyZHdhcmUgbWFudWFsLg0KDQpBbmQgaG9uZXN0bHksIEkgY291bGQgbm90IHRyYWNlIGJh
Y2sgd2hlcmUgdGhhdCBJUCBjYW1lIGZyb20uIEl0IHdhcyANCmZyb20gc29tZXdoZXJlIGluIHRo
ZSBNQ1UgZGVzaWduIHNlY3Rpb24gKG5vdCB0aGUgU29DIGRlc2lnbiBzZWN0aW9uKS4gDQpTb21l
b25lIG1vZGlmaWVkIHRoZSBJUCBzbyB0aGV5IHB1dCBhbiAiQSIgYXQgdGhlIGVuZCB0byBzaG93
IGl0IHdhcyANCmRpZmZlcmVudC4gUmVnYXJkbGVzcywgaXQgaGFzIGEgZGlmZmVyZW50IGhpc3Rv
cnkgdGhhbiBhbGwgdGhlIG90aGVyIElQIA0Kc3VwcG9ydGVkIGJ5IHRoZSBTQ0kgZHJpdmVyLg0K
DQpDaHJpcw0KDQo=
