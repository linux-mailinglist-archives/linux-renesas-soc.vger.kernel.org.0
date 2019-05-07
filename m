Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9EE1670E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 17:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfEGPnl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 11:43:41 -0400
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:24255
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726197AbfEGPnk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 11:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKMtoATgtUcoCWs1l/eRd/Zu8c9ZUUvOIhhYQocvYCM=;
 b=nxyfQQ7EiZmfFDhi4pU0o//gw8bDY0yqr81HpdfR/SYCfg1EEysTGGeD3Mutr55Uo9rgz8Wwca44A1DDE0racP4hGeT9WGHu9N3dSi41pANzt/rPhrFRCjnlhtmUsfW995QjJp6QsPLXuq8cia+6XLzi2FNp241zOLpPe0yYLVI=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1625.jpnprd01.prod.outlook.com (52.133.162.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 15:43:32 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 15:43:32 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 01/10] phy: renesas: rcar-gen3-usb2: Add uses_usb_x1
 option
Thread-Topic: [PATCH 01/10] phy: renesas: rcar-gen3-usb2: Add uses_usb_x1
 option
Thread-Index: AQHVBGYQ+cfCaNX+ik+H7Wxy1mef+qZfTXmAgAB2sVA=
Date:   Tue, 7 May 2019 15:43:32 +0000
Message-ID: <TY1PR01MB15621F21D3A3F1F550D85CD68A310@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-2-chris.brandt@renesas.com>
 <CAMuHMdV3yW44Y1D2Vn1mNJK8pNF3db20An9Sde8=18r8y7m9LQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV3yW44Y1D2Vn1mNJK8pNF3db20An9Sde8=18r8y7m9LQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [24.206.39.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 893746e1-148b-43cf-bc97-08d6d302c276
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1625;
x-ms-traffictypediagnostic: TY1PR01MB1625:
x-microsoft-antispam-prvs: <TY1PR01MB16250015BBCFAF9335E54EA18A310@TY1PR01MB1625.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(366004)(376002)(346002)(39860400002)(199004)(189003)(5660300002)(76116006)(52536014)(8676002)(81156014)(81166006)(55016002)(9686003)(6436002)(73956011)(229853002)(54906003)(71200400001)(71190400001)(25786009)(66946007)(8936002)(11346002)(102836004)(6506007)(68736007)(53936002)(486006)(66476007)(66556008)(64756008)(4326008)(66446008)(6246003)(446003)(476003)(26005)(186003)(478600001)(3846002)(6116002)(72206003)(66066001)(4744005)(316002)(256004)(7736002)(14454004)(2906002)(7696005)(6916009)(74316002)(305945005)(33656002)(99286004)(76176011)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1625;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JVQSi1TO9szOJE09e7dY7jQJ+6p7wuacx6/tzAbtUzLMH3oRY5FGwLcQyxCyzXbWmvitT8dNKmsfP7nj9iuaXplUP4wveOToPvNQd2YjWnCVmLHUx7y+c1ysF9GfJFOlGjFABpn+Uhu/8pbliUDveKpgKUR3tVgmUloA8TSH3F/hFpvLkAm4hdsyEnYmeGKm6GYspvawTCuRJHhJB8eWRyWufnDqiHl3KJ0QaVZtEZMs+vaQaEpiFULJxENngfzlNq+wfvU+VdRGPDKaIVeJrtnGNLLvJD8XgZvDQGMOulVZWugIytGfsRqWCa/J8WMqAnRi+zY01hSwxfGLLgonBnjLSZS9fEY7xQ8+UzkHZqGsTo+LNM4bPpiMZTV/cEjPvmiI/OYzb9EGQSXe/FkHHZ9/nopM78xPTLoLps2hopY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893746e1-148b-43cf-bc97-08d6d302c276
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 15:43:32.3349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1625
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFR1ZSwgTWF5IDA3LCAyMDE5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+ID4gKyAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKGRldi0+b2Zfbm9kZSwg
InJlbmVzYXMsdXNlc191c2JfeDEiKSkNCj4gPiArICAgICAgICAgICAgICAgY2hhbm5lbC0+dXNl
c191c2JfeDEgPSB0cnVlOw0KPiA+ICsNCj4gDQo+IFBlcmhhcHMgdGhpcyBjYW4gYmUgY2hlY2tl
ZCBzb21lIG90aGVyIHdheSAoZS5nLiBieSBjaGVja2luZyBmb3IgYSBub24tDQo+IHplcm8NCj4g
Y2xvY2sgcmF0ZSBvZiB0aGUgVVNCX1gxIGNsb2NrIHJlZmVyZW5jZWQgZnJvbSBEVCksIHRodXMg
cmVtb3ZpbmcgdGhlIG5lZWQNCj4gZm9yDQo+IGFkZGluZyBhIGN1c3RvbSBwcm9wZXJ0eT8NCg0K
Q3VycmVudGx5LCB0aGVyZSBpcyBubyBVU0JfWDEgaW4gRFQgbGlrZSB0aGVyZSBpcyBmb3IgUlov
QTEuDQoNCkZvciBSWi9BMiwgdGhvc2UgYXJlIGRlZGljYXRlZCBwaW5zIHRoYXQgYmVsb25nIHRv
IHRoZSBVU0IgSFcgYmxvY2sgDQppdHNlbGYuIFRoZXkgZG8gbm90IGZlZWQgaW50byB0aGUgc3lz
dGVtIENQRyBvciBhbnkgZGl2aWRlcnMsIHNvIEkNCm5ldmVyIGluY2x1ZGVkIGl0IGluIHRoZSAu
ZHRzaS4NCg0KU28gd2l0aCB0aGF0IHNhaWQsIGRvZXMgYSB1c2VzLXVzYi14MSBwcm9wZXJ0eSBt
YWtlIG1vcmUgc2Vuc2U/DQoNCg0KQ2hyaXMNCg==
