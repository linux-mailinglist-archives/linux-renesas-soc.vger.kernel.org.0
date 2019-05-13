Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6877F1BEF7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 23:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfEMVHL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 17:07:11 -0400
Received: from mail-eopbgr1410094.outbound.protection.outlook.com ([40.107.141.94]:47376
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726211AbfEMVHL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 17:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqyE72y/S3GJ5dPjDeMBAbx0xQSX0m7O0KtTpvwhZ5w=;
 b=RD1gSRk9lodD8zOq0tTfvkS79dyXR8HL75J806DTYLwOiDkvk7RwOJpa+Y/+7hdG9zmNXTvGs8Q/Pp/9bPsbMUrevSRHb0HIO8okLCxCSUlbdw9ZBNYEsd36NMkW1zQLUC6zHZX7ajmkjInd4NbGBVQjmef3dLc+etWZ0YDN20c=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1867.jpnprd01.prod.outlook.com (52.133.161.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Mon, 13 May 2019 21:07:04 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::99cf:c94c:d11f:c2f0%5]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 21:07:04 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use of
 usb_x1
Thread-Topic: [PATCH v2 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use
 of usb_x1
Thread-Index: AQHVBqOYsuCwxtDR8keHVZxRUSw6I6ZjxxkAgAAmQYCABaN70A==
Date:   Mon, 13 May 2019 21:07:04 +0000
Message-ID: <TY1PR01MB15620F606FDE4AF0C446213E8A0F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-5-chris.brandt@renesas.com>
 <OSBPR01MB3174A8008FF1E216893398E8D80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
 <CAMuHMdVVoYak4FGEOYK_dGLCLEQ7avVCv5AcY43BPkDnt7OZ4w@mail.gmail.com>
In-Reply-To: <CAMuHMdVVoYak4FGEOYK_dGLCLEQ7avVCv5AcY43BPkDnt7OZ4w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [24.206.39.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b64b57d-ca21-449d-1392-08d6d7e6f38d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1867;
x-ms-traffictypediagnostic: TY1PR01MB1867:
x-microsoft-antispam-prvs: <TY1PR01MB1867D3F86EACE5BAB56550218A0F0@TY1PR01MB1867.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39860400002)(376002)(346002)(136003)(366004)(189003)(199004)(9686003)(68736007)(26005)(55016002)(81156014)(76176011)(256004)(14444005)(86362001)(25786009)(81166006)(76116006)(8936002)(73956011)(66446008)(66946007)(64756008)(66476007)(66556008)(229853002)(72206003)(6436002)(186003)(478600001)(6506007)(74316002)(71200400001)(7736002)(486006)(52536014)(3846002)(6116002)(7696005)(305945005)(71190400001)(14454004)(6636002)(66066001)(110136005)(54906003)(11346002)(2906002)(102836004)(476003)(446003)(53936002)(6246003)(4326008)(8676002)(5660300002)(99286004)(316002)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1867;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LWqMtTqjabuZxJgN8VEASnjp6afRwHsGXKbvG/z/5BSyaHJsgYhjqedpzg9RNTbpHF/mdVFiM5uu1iu+xxulLF8KU89A3DhJNcUXR4BGfLFLjUS7P1fcFlN6Aq46u8py9dtYZFdNgH1sUld/CIWvSY/sl7QIXZhW3JwMaAyugy+69Zul6hhUYB5UX4N/z82+hLVRQUTmCtAyF7oxyKKa4s1k+tSRQbUHXuZGW1BU5JuSIXhQN40DbSheCglcks/NkgKFbOqmjVz6nqhFiyJ7zNllpNRHBl0/EfRdUQliiwheHI771xPXkW8FftW/fyX2LFEbvkdiXRRLcfhLHcl7WP2+gymwlRLDZuMD+q2SKWZOg+BUOFSXwML+3naSqlQNxKhCXZdaGtmlj1REllDMqa7MQAiGzY/fC2KPfPlTKBY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b64b57d-ca21-449d-1392-08d6d7e6f38d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 21:07:04.5130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1867
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgYW5kIFNoaW1vZGEtc2FuLA0KDQpPbiBGcmksIE1heSAxMCwgMjAxOSwgR2VlcnQg
VXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+IEkgdGhpbmsgd2UgY2FuIHJldXNlIGl0IGxpa2UgYmVs
b3c6DQo+ID4NCj4gPiAtIGNsb2NrLW5hbWVzOiBOYW1lIG9mIHRoZSBjbG9ja3MuIFRoaXMgcHJv
cGVydHkgaXMgbW9kZWwtZGVwZW5kZW50Lg0KPiA+ICAgLSBSLUNhciBHZW4zIFNvQ3MgdXNlIGEg
c2luZ2xlIGZ1bmN0aW9uYWwgY2xvY2suIFRoZSBjbG9jayBkb2Vzbid0DQo+IG5lZWQgdG8gYmUN
Cj4gPiAgICAgbmFtZWQuDQo+ID4gICAtIFJaL0EyIHVzZXMgYSBzaW5nbGUgZnVuY3Rpb25hbCBj
bG9jayBhcyBhIHNlcGFyYXRlIGRlZGljYXRlZCA0OE1Ieg0KPiANCj4gYW5kIGEgc2VwYXJhdGU/
DQo+IA0KPiA+ICAgICBVU0JfWDEgaW5wdXQuIFNvLCB0aGUgZnVuY3Rpb25hbCBjbG9jayBtdXN0
IGJlIG5hbWVkICI/Pz8iIGFuZA0KPiA+ICAgICB0aGUgVVNCX1gxIGlucHV0IG11c3QgYmUgbmFt
ZWQgYXMgInVzYl94MSIuDQo+ID4NCj4gPiBXaGF0IGRvIHlvdSB0aGluaz8gSSdtIG5vdCBzdXJl
IGhvdyB0byBiZSBuYW1lZCB0aGUgZnVuY3Rpb25hbCBjbG9jayBzbw0KPiB0aGF0DQo+ID4gdGhl
IHNhbXBsZSBpcyBuYW1lZCBhcyAiPz8/Ii4NCj4gDQo+IFdlIHR5cGljYWxseSB1c2UgImZjbGsi
IGZvciB0aGUgZnVuY3Rpb25hbCBjbG9jaydzIG5hbWUuDQoNCg0KSnVzdCB0byBtYWtlIHN1cmUg
SSdtIGZvbGxvd2luZyB0aGlzLCBoZXJlIGlzIHdoYXQgeW91IGFyZSBhc2tpbmcgZm9yOg0KDQpb
cjdzOTIxMC5kdHNpXQ0KDQoJdXNiMl9waHkxOiB1c2ItcGh5QGU4MjFhMjAwIHsNCgkJY29tcGF0
aWJsZSA9ICJyZW5lc2FzLHVzYjItcGh5LXI3czkyMTAiLCAicmVuZXNhcyxyY2FyLWdlbjMtdXNi
Mi1waHkiOw0KCQlyZWcgPSA8MHhlODIxYTIwMCAweDEwPjsNCgkJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDM2IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KKwkJY2xvY2tzID0gPCZjcGcgQ1BHX01PRCA2
MD4sIDwmdXNiX3gxX2Nsaz47DQorCQljbG9jay1uYW1lcyA9ICJmY2xrIiwgInVzYl94MSI7DQoJ
CXBvd2VyLWRvbWFpbnMgPSA8JmNwZz47DQoJCSNwaHktY2VsbHMgPSA8MD47DQoJCXN0YXR1cyA9
ICJkaXNhYmxlZCI7DQoNCg0KW3BoeS1yY2FyLWdlbjMtdXNiMi5jXQ0KCXVzYl94MV9jbGsgPSBk
ZXZtX2Nsa19nZXQoZGV2LCAidXNiX3gxIik7DQoJaWYgKCFJU19FUlIodXNiX3gxX2NsaykpDQoJ
CWlmIChjbGtfZ2V0X3JhdGUodXNiX3gxX2NsaykpDQoJCQljaGFubmVsLT51c2VzX3VzYl94MSA9
IHRydWU7DQoNCg0KQW5kIHRoZW4gZG9jdW1lbnQgdGhpcyBpbiB0aGUgYmluZGluZ3MsIHNheWlu
ZyB0aGF0IGNsb2NrLW5hbWVzIGlzIA0Kb3B0aW9uIGlmIHRoZXJlIGlzIG9ubHkgMSBjbG9jayAo
dG8gYmUgYmFja3dhcmQgY29tcGF0aWJsZSB3aXRoIGV4aXN0aW5nIA0KRGV2aWNlIFRyZWVzLg0K
DQpJcyB0aGlzIGNvcnJlY3Q/DQoNClRoYW5rcywNCkNocmlzDQoNCg==
