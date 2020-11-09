Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167EF2AB48D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Nov 2020 11:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbgKIKNu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Nov 2020 05:13:50 -0500
Received: from mail-eopbgr1410105.outbound.protection.outlook.com ([40.107.141.105]:23344
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726176AbgKIKNu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 05:13:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNruBlBu9nRYQ/gxz7fbDzsdC2qFiqV8hzN+OD8JPpRSzUwo8r8yEG5dvai+eM13JHz6mZZjfB6MFZOpGZeakmXOh19ieXwCgPpKj5bWYgjRWgAH0dSVp6YXJ5iJq+Fhj9pjQ8VU+NGQzAlIWbIdIbLFvsf1H3fhuTwxBhdVb+yq+MGzS/rYST3hBTWTuUMmOM5dYmn/UHIQIwb1G7H4lmBpue7CqiOUaA177T0OUk4dnYsli3DjKI2ZTFPGFuqdsdLwbuJFxw3c0eKbdPsyfBkMnWu3jQb90BhmnId25UHartcha0+ktF+1D14vPrXK97mbHG+wXvopxv9nOJSW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bzLaG+Jwk8ouwDdAUYbFbWTHmJGU3QIr4S+an0iH94=;
 b=nwPl8WIS/j6qOer5P8mDWHBjMDOBh9Gv8lSoxPNYyxRRe4atCPXP1al5pRdgPFxwNzBmaYoBn6SAdlHVMKXpN4F+7OPNVixou+lPo6deh9VzW41raq63gnSj/XfhTmIBgv6lJAUHO092FGy8jgorqLCJel6Phgo2XA92kyI32IWo+4qvz2MlT4ep3omvtedvBQ3IbyiE8FKTKuPn4+5OWNONtB2UtCDTdOvv9esBPE63DTRTNbPYnUArJ0Rq9OW++ecG8WZMpW9C9iqhDQ9tQdghFTlPL5zMhmUvKiLjdCtVCADg4Pxdb+SRsn7XykpgynY0/h1Q8zw4MWnjT1gfdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bzLaG+Jwk8ouwDdAUYbFbWTHmJGU3QIr4S+an0iH94=;
 b=XqPuSnucJibhPjZewT/AHcmovg2M1NblCN17iRGB2YQRlCVMTTQ/BEnVLs8BDDCgJa9W6K1UY/HpZgPpzLdO7/XmQ1Dt2f3N+q6qaS5TxSKQ+Z8ZzGTFKTUdNPsVVqr6QltxEMDfPGcSX+dTJgrjzd090VBwZnxpAuoVjgKO70E=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSYPR01MB5558.jpnprd01.prod.outlook.com (2603:1096:604:80::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Mon, 9 Nov
 2020 10:13:47 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70%3]) with mapi id 15.20.3541.023; Mon, 9 Nov 2020
 10:13:47 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: hihope-rev4: Add a comment
 explaining switch SW2404 required for audio_clk_b
Thread-Topic: [PATCH] arm64: dts: renesas: hihope-rev4: Add a comment
 explaining switch SW2404 required for audio_clk_b
Thread-Index: AQHWs2zYgBKs0Ocs7Uu+aDCp+rRqXam/mcIAgAABAbA=
Date:   Mon, 9 Nov 2020 10:13:46 +0000
Message-ID: <OSBPR01MB504877E7BCF6D876C10B821AAAEA0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
References: <20201105121127.11830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhUGBiPf6nvTtVC05eEk6oH=cwEO9ZdH9QftA3BZG=_g@mail.gmail.com>
In-Reply-To: <CAMuHMdUhUGBiPf6nvTtVC05eEk6oH=cwEO9ZdH9QftA3BZG=_g@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 722053a8-32c5-413a-81ef-08d884982570
x-ms-traffictypediagnostic: OSYPR01MB5558:
x-microsoft-antispam-prvs: <OSYPR01MB5558615C6B8015DB078B0052AAEA0@OSYPR01MB5558.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YQDTf7wcnm1olZEJ3Afhel1aw7eY2M9OknYyyaeKy9txOLiBmQsoC5M+XzreJY1h0ysmHW5FvNONebs/ZTZ/T/tkLyOpb4cgxwNQAiPv4J/UbfVFSWlRh+PNNpRKhEV2mHN9dNJpxD/7jNBrMFg6hO0oYAIWRB+uGYnoNLrw+W1hiKlIWbJxSf12SJNmBiJmmCsghbukQHTVvunFvi0WPQsbsm1rP9o93kuVFX/X6Rjw3rloGMLP6xv0pZlZnLGsAcy0mHXkE0uptt6D0Kmk1WmP6StuRd8dKsOqblsxW8KniA60GQ8M0OoaioSpTPgrH0I7BwuA3XxFZxQJFMXrew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5048.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(55016002)(9686003)(478600001)(316002)(54906003)(76116006)(66946007)(33656002)(66556008)(71200400001)(66476007)(52536014)(64756008)(5660300002)(8676002)(66446008)(8936002)(6916009)(2906002)(86362001)(4326008)(7696005)(83380400001)(26005)(186003)(6506007)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: JNcbp+Bs8odSUB5P2m4RAfia+RZw3+9G+JEcVtvBVZgVXRB+Uo7C39Ef7yrDMe9btWBpaGMAkiRSVA/p1mIMOujD08iqhj9337nNYIxmNDe3Qy9/SxNL0Eq+xhIPJDMVUkvxLj5BqqZBGwsntdfLfQnxLyySevBYojOBcEsa3rTc6v3idNhoNFMXrfM8rpoul8Xswpsej8Dgmh6yVwfdl7yUp0CH/QyOwUrN+x+pT11tVZlljYE2c0SIVKGVZOh2NCnGW70BW1flIMNZGssu3qXrhiYgHKM+s2/u1r2hk1/5UTMXP0Oj17NmNa9V3v6S4etcV79eegVTBdx93SEMJQz8Tgcq7wojJyh6V9ykYQ2joUvHDygyF803U/07sJ8hJGes14LeNy92kUf1JPm2LeRdUuXNQnAkUcYqCiZSmZMaWE4Y3vKWax+M1p7J4FYwTF1f4Ei5fkQ8hRWKNZWK7tgQCu3z5XPnxOnrzzTfajrvKBc6GufUg/QYdTywC0o7WG74juwAJC9DSh0sB5hPd3Y+OuJCMUmz4LYadtsaq7s00yEKUsYOOfLkgZ7wxdWQ4Dnxz8Q9y2a+V7M8OYhwsFkLC8J/NtafG+ISETTwYOaL7dhkD3Pxa+Ps+zoMVSE4o6Npf00ga0CXGs/vdTE4Vw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 722053a8-32c5-413a-81ef-08d884982570
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2020 10:13:46.9311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vYjzWFPS3vnGoqN03MAOZ78YJlAgh74zQwBBntWm/PNHw9dqXNlLenrXLfDg6O4kMb6TXnxPGI2OqSQ2IvrXf/M/V5tZ7SAW70n8kJnOC5Oz96z7C5NW8YwXZ/x9qcpW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5558
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPg0KPiBTZW50OiAwOSBOb3ZlbWJlciAyMDIwIDEwOjA5DQo+IFRvOiBQcmFiaGFrYXIg
TWFoYWRldiBMYWQgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4g
Q2M6IE1hZ251cyBEYW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBSb2IgSGVycmluZyA8cm9i
aCtkdEBrZXJuZWwub3JnPjsgTGludXgtUmVuZXNhcyA8bGludXgtDQo+IHJlbmVzYXMtc29jQHZn
ZXIua2VybmVsLm9yZz47IG9wZW4gbGlzdDpPUEVOIEZJUk1XQVJFIEFORCBGTEFUVEVORUQgREVW
SUNFIFRSRUUgQklORElOR1MNCj4gPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgTGludXgg
S2VybmVsIE1haWxpbmcgTGlzdCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IFByYWJo
YWthcg0KPiA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIGFybTY0OiBkdHM6IHJlbmVzYXM6IGhpaG9wZS1yZXY0OiBBZGQgYSBjb21tZW50IGV4cGxh
aW5pbmcgc3dpdGNoIFNXMjQwNCByZXF1aXJlZA0KPiBmb3IgYXVkaW9fY2xrX2INCj4gDQo+IE9u
IFRodSwgTm92IDUsIDIwMjAgYXQgMToxMSBQTSBMYWQgUHJhYmhha2FyDQo+IDxwcmFiaGFrYXIu
bWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFN3aXRjaCBTVzI0MDQg
c2hvdWxkIGJlIGF0IHBvaXN0aW9uIDEgc28gdGhhdCBjbG9jayBvdXRwdXQgZnJvbSBDUzIwMDAN
Cj4gDQo+IHBvc2l0aW9uICh3aWxsIGZpeCB3aGlsZSBhcHBseWluZykuDQo+IA0KQXJnaCwgdGhh
bmsgeW91IGZvciB0YWtpbmcgY2FyZSBvZiBpdC4NCg0KQ2hlZXJzLA0KUHJhYmhha2FyDQoNCj4g
PiBpcyBjb25uZWN0ZWQgdG8gQVVESU9fQ0xLQl9BLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
TGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0K
PiA+IFJldmlld2VkLWJ5OiBDaHJpcyBQYXRlcnNvbiA8Q2hyaXMuUGF0ZXJzb24yQHJlbmVzYXMu
Y29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+DQo+IGkuZS4gd2lsbCBxdWV1ZSBpbiByZW5lc2FzLWRldmVsIGZvciB2NS4x
MS4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
