Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 706011DDF91
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2020 07:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgEVF5v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 May 2020 01:57:51 -0400
Received: from mail-eopbgr1410105.outbound.protection.outlook.com ([40.107.141.105]:57520
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725894AbgEVF5u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 May 2020 01:57:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zc6oyrrRMtQ2xy99rd6QC/GB9YXaxA4fCIDvbp5xdUAjFIK7WFI2fmXsg0GejjLrrGzhyvhpJFv9AWACmIS5RO1XEZ8TBUGMyjjSF9pS5tNr9ptK6k7+4tGH4XY8hyVye0J26ottjdsJWNuy6o7LPPTdGaARoR61DBC3eYKi2LOUAiAR0IwZZD29X1lMYV2hbwWMEwmaeVdFY8WMk0DLRgnyEVW/UHjA37cMSc/N8FunDoz1kd6+jDHqqcwIYc0dJj+3WQtWoVRbeSNaz/f1jN6xL8QTPrrlCVX7bU824VTJFzNrLAnYb1eWhCrVYhNFB4zqZD/nKslBPL9vb9i8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcbaMyO82SIAD8kYxvNNEsViFkOr8y8GnG9eYkfDPmw=;
 b=AwoKkTZvq6FynO357QyfJ5ympdQUVk9SKuyQ+d9YKXxbRgs9Tv4i/vikwtWtWC9qOmr7B/MBmyQ1j+w87qL5B3UbUgD5oi1wTQE51j0Fxn3G7dHnY9up6/vx5KddouqbIGJoVox+7BT1Jhwvrpk7dj2SH3Q9DSWLwcQxDzy9H81WkGJ3aAxc18v+7UOoFy/6V/cepgPtzUmFvngj8SRgxwr3SgZO1r2gKjxlol62qjEiO7NLaX6XzPz4CcuoFkVohYCmfgSlwD2e3jvcIhBAFgvizehfiWqQA8EZ+nkQCi1UZMCDzHAvWw22M877dDFW3SoZO8UvzQW6o+hJq+LhEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcbaMyO82SIAD8kYxvNNEsViFkOr8y8GnG9eYkfDPmw=;
 b=ZWlMXfjZCCIuh/g/oaDe7WlCkizU5AiBfMEwyDY4SE1Y7g8FBt6SrtU2V0uB98NFBxO5rt8nWRvYff5T6/9X0ymBnUn9eONcvnL5pATTtCnVnFb+pJg8Gyma2906LJr4gKPWbvty2d7mUaPTrIQJglII0s2eJW+HOaeNgDFiliM=
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com (2603:1096:604:33::12)
 by OSAPR01MB5171.jpnprd01.prod.outlook.com (2603:1096:604:6e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Fri, 22 May
 2020 05:57:45 +0000
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::815c:7fcf:a240:7054]) by OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::815c:7fcf:a240:7054%6]) with mapi id 15.20.3021.020; Fri, 22 May 2020
 05:57:44 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "REE dirk.behme@de.bosch.com" <dirk.behme@de.bosch.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     "Shashikant.Suguni@in.bosch.com" <Shashikant.Suguni@in.bosch.com>
Subject: RE: [PATCH v2] ravb: On timeout disable IRQs to stop processing
Thread-Topic: [PATCH v2] ravb: On timeout disable IRQs to stop processing
Thread-Index: AQHWLNCCMO5ceqzAh0qZ614nN0icbqith5GAgAYRLtA=
Date:   Fri, 22 May 2020 05:57:44 +0000
Message-ID: <OSAPR01MB36831809AD6F3D66F1F39670D8B40@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <20200518045452.2390-1-dirk.behme@de.bosch.com>
 <41c79682-c707-d393-57d8-954586f81ab3@cogentembedded.com>
In-Reply-To: <41c79682-c707-d393-57d8-954586f81ab3@cogentembedded.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cogentembedded.com; dkim=none (message not signed)
 header.d=none;cogentembedded.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a895f10b-c96a-41de-7bd4-08d7fe150c31
x-ms-traffictypediagnostic: OSAPR01MB5171:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <OSAPR01MB5171FF114DB44983E84F10E4D8B40@OSAPR01MB5171.jpnprd01.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DkPcD5hh55Sbon5RKIwrFSSoeSGm+rIw7iIjoGUKit0jPAZB2VEToyl7fqd0mkQtDM+Ho1LvHTcHe49dJ2fKW1OgS7Ws7q0I+IUZ05VSxpd+YhDyGq584/wkgBJ/xEmfUA+A+BCIDDWS1/IUhQRBu3XVWIvKIy1oa9b3H4xpyfsCeRn1NSQLZeDwAOrw8UH+SFJZF9J5PSplEvqhCkSVBftKjvwno3ue1sKV1HRaPO1iAVNSVEyC0VdiAOxzJXwMdQnWkSQwxhoHAKIPS8vG9dlLSZn0tH8sf9Gym1fHGazR4OC6dEDBrGgTu5KWp+UxCLyZ/PzLLDMq4hfOb08SBg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3683.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(55236004)(66556008)(6506007)(66476007)(33656002)(64756008)(66946007)(8936002)(76116006)(316002)(66446008)(8676002)(110136005)(4326008)(7696005)(107886003)(9686003)(52536014)(2906002)(53546011)(26005)(86362001)(55016002)(478600001)(186003)(5660300002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: qUHpZ+p2Pv43sjhVo7/tfk4ISoo+Ep5+njNKDv2mb05f5/rT3CMTEFZAxlGEVjutTanMDv1Ow+BTTLTleMlD26EyWB/8wlULd/WXLrV3Tyykz7eqkJvIe6DSLqswG0p4iTR4xRo8bZtg6II9ijf30vK1CyLjyR4yCPhTZtVx9xeoFXnvZCFSFjciZuzNO+az+GgqYGxlHXsi9Kcd9B3YEAyQFlwEfCS1ikVTOceqPrPKeVd1D063txzYMzXjb+wnwaZdBOdrgMu8J9Mr4ZyIHhWoptWnIlpkhXOu1X4jUjWeG7VCNvK/vhs72i2n0cV+YX+NEEerJp2UjrKXIDOgUWF087laKhBXTvXPpr7B+YLSvLk4KVNYQ5vUeZxaAhoM547JoFwNJWV+uphbpKfvsDzC+cAbEQe5vJ6oCwoweyMg4y9GJmYHOhjepjcLuEktYjtKtqF4w3PtNk5nuDqFBwxSLXxhQLR+fVXi4MNUTKhU5HbNcFnBRGw/3FCUQ7Ed
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a895f10b-c96a-41de-7bd4-08d7fe150c31
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 05:57:44.7273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LWD5N3pyXFNEfqpiLZIIj/bvFZVK5y1yZM7zJTCCaOpYkqWkKz0nB5o1RgMYgKkwLz//N6bIdSbJhWbjK79ZuCHW9qCxinw/dXYPzWg5yGc+JDgSexyif+/YAS8ue/H5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB5171
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gU2VyZ2VpLXNhbiwNCg0KPiBGcm9tOiBTZXJnZWkgU2h0eWx5b3YsIFNlbnQ6IE1vbmRh
eSwgTWF5IDE4LCAyMDIwIDU6NDUgUE0NCj4gDQo+IE9uIDE4LjA1LjIwMjAgNzo1NCwgRGlyayBC
ZWhtZSB3cm90ZToNCj4gDQo+ID4gQW5hbHl6aW5nIFsxXSBpdCBzZWVtcyB0aGVyZSBpcyBhIHJh
Y2UgY29uZGl0aW9uIHdoZXJlIHJhdmJfc3RhcnRfeG1pdCgpDQo+ICA+IGNhbiBiZSBjYWxsZWQg
ZnJvbSBpbnRlcnJ1cHQgd2hpbGUgdHggc2tidWZmcyBhcmUgYmVpbmcgdG9ybiBkb3duIGluDQo+
ICA+IHRoZSBzY2hlZHVsZWQgdGltZW91dCBoYW5kbGluZy4gVGhlIGFjdHVhbCB0aW1lb3V0IHdv
cmsgaXMgZG9uZSBpbg0KPiAgPiByYXZiX3R4X3RpbWVvdXRfd29yaygpIGR1cmluZyB3aGljaCB0
aGUgdHggc2tidWZmcyBhcmUgdG9ybiBkb3duIHZpYQ0KPiAgPiBpbnZvY2F0aW9ucyBvZiByYXZi
X3JpbmdfZnJlZSgpLiBCdXQgdGhlcmUgc2VlbXMgdG8gYmUgbm8gZmxhZyB0byB0ZWxsDQo+ICA+
IHRoZSBkcml2ZXIgaXQgaXMgc2h1dHRpbmcgZG93biBzbyBpdCBjb250aW51ZXMgdG8gdXNlIHRo
ZSByaW5nIGJ1ZmZlcg0KPiAgPiB3aGVuIGl0IHNob3VsZCBub3QuDQo+ICA+DQo+ICA+IEZpeCB0
aGlzIGJ5IGRpc2FibGluZyB0aGUgaW50ZXJydXB0cyBpbiB0aGUgdGltZW91dCBoYW5kbGVyLg0K
PiANCj4gICAgIEhtLCBnaXZlbiB0aGF0IHdlIHN0b3AgYWxsIFRYIHF1ZXVlcyBwcmlvciB0byB0
ZWFyaW5nIGRvd24gdGhlIGJ1ZmZlcnMsDQo+IGl0IGlzIHNvbWV3aGF0IHN0cmFuZ2UgdGhhdCB5
b3Ugc2VlIHRoZSBkcml2ZXIncyBzZW5kIHBhdGggY2FsbGVkLi4uDQo+ICAgICBCdXQgZGlzYWJs
aW5nIHRoZSBpbnRlcnJ1cHRzIHNlZW1zIHRoZSBSaWdodCBUaGluZyBhbnl3YXlzLi4uDQoNCkkg
ZGlkbid0IHJlcHJvZHVjZSB0aGlzIGlzc3VlIGFuZCBJIGRpZG4ndCBrbm93IHRoZSByb290IGNh
dXNlIHlldC4NCkJ1dCwgSSdtIGZlZWxpbmcgdG8gc3RyYW5nZS4gRXNwZWNpYWxseSwgInJhdmJf
c3RhcnRfeG1pdCgpIGNhbiBiZSBjYWxsZWQgZnJvbSBpbnRlcnJ1cHQiLg0KSSBkaWRuJ3QgZmlu
ZCB3aGVyZSByYXZiX3N0YXJ0X3htaXQoKSBjYW4gYmUgY2FsbGVkIGZyb20gaW50ZXJydXB0IGZv
ciBub3cuDQoNCkJ5IHRoZSB3YXksIEknbSB0aGlua2luZyB0aGUgZm9sbG93aW5nIG1lc3NhZ2Ug
aXMgcmVsYXRlZCB0byB0aGUgaXNzdWUuDQo+ID4gcmF2YiBlNjgwMDAwMC5ldGhlcm5ldCBldGhl
cm5ldDogZmFpbGVkIHRvIHN3aXRjaCBkZXZpY2UgdG8gY29uZmlnIG1vZGUNCg0KVGhlIHJhdmJf
Y29uZmlnKCkgb3V0cHV0IHRoZSBtZXNzYWdlIGlmIGZhaWxlZC4gQW5kLCByYXZiX3R4X3RpbWVv
dXRfd29yaygpDQpjYWxscyByYXZiX2NvbmZpZygpIHZpYSByYXZiX3N0b3BfZG1hKCkgYW5kIHJh
dmJfZG1hY19pbml0KCkuDQotLS0NCnJhdmJfdHhfdGltZW91dF93b3JrKCkgew0KCXJhdmJfc3Rv
cF9kbWEoKQkJLy8gY2FsbCByYXZiX2NvbmZpZygpDQoNCglyYXZiX3JpbmdfZnJlZSgpCS8vICox
DQo8c25pcD4NCglyYXZiX2RtYWNfaW5pdCgpCS8vIGNhbGwgcmF2Yl9jb25maWcoKQ0KPHNuaXA+
DQp9DQoNCnJhdmJfZG1hY19pbml0KCkNCnsNCjxzbmlwPg0KCWVycm9yID0gcmF2Yl9jb25maWco
KQkvLyAiZmFpbGVkIHRvIHN3aXRjaCBkZXZpY2UgdG8gY29uZmlnIG1vZGVzIiBoZXJlIGFuZCAt
RVRJTUVET1VUDQoJaWYgKGVycm9yKQ0KCQlyZXR1cm4gZXJyb3IJLy8gKjINCglyYXZiX3Jpbmdf
aW5pdCgpCS8vICozDQo8c25pcD4NCn0NCi0tDQoNCklmIHJhdmJfY29uZmlnKCkgZmFpbGVkIGF0
IHRoZSAqMiwgc2luY2UgcmF2Yl9yaW5nX2luaXQoKSB3YXMgbm90IGNhbGxlZCwNCmFueSBkZXNj
cmlwdG9ycyB3ZXJlIG5vdCBhbGxvY2F0ZWQgYW5kIHRoZW4gdGhlIGlzc3VlIHNob3VsZCBoYXBw
ZW4uDQpOb3RlIHRoYXQgYWNjb3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQsIHRoZSBjb250cm9sbGVy
IGNhbm5vdCBjaGFuZ2UgdGhlDQptb2RlIGZyb20gIk9wZXJhdGlvbiIgdG8gQ29uZmlndXJhdGlv
biIgd2hlbiB0aGUgY29udHJvbGxlciBpcyBkb2luZw0KVFggb3IgUlguDQoNCkkgZG9uJ3Qga25v
dyB3aHkgdGhlIGZpcnN0IHJhdmJfY29uZmlnKCkgZG9lc24ndCBmYWlsIGZvciBub3cuDQpCdXQs
IG15IHNjZW5hcmlvIGlzIG9uZSBvZiBmdW5jdGlvbnMgYmVsb3cgZW5hYmxlcyB0aGUgVFggYW5k
IFJYDQpieSBjYWxsaW5nIHJhdmJfcmN2X3NuZF9lbmFibGUoKToNCiAtIHJhdmJfZW1hY19pbnRl
cnJ1cHRfdW5sb2NrZWQoKSAuLi4gaWYgRVNDUl9MQ0hORyAmJiAhbm9fYXZiX2xpbmsgJiYgUFNS
X0xNT04NCiAtIHJhdmJfYWRqdXN0X2xpbmsoKSAuLi4gaWYgbm9fYXZiX2xpbmsgJiYgcGh5ZGV2
LT5saW5rDQogLSByYXZiX3NldF9yeF9jc3VtKCkgLi4uIGlmIGVuYWJsaW5nIE5FVElGX0ZfUlhD
U1VNDQoNCnJhdmJfdHhfdGltZW91dF93b3JrKCkgY2FsbHMgcmF2Yl9zdG9wX2RtYSgpLiBBbmQs
IHJhdmJfc3RvcF9kbWEoKSBjYWxscw0KcmF2Yl9yY3Zfc25kX2Rpc2FibGUoKS4gU28sIHdlIGFz
c3VtZWQgcmF2Yl90eF90aW1lb3V0X3dvcmsoKSBkaWRuJ3QgdHJhbnNmZXINCmFueW1vcmUuIEhv
d2V2ZXIsIGlmIG9uZSBvZiB0aGUgYWJvdmUgZnVuY3Rpb25zIHdhcyBjYWxsZWQsIHRoaXMgaXMg
cG9zc2libGUNCnRvIGVuYWJsZSBUWCBhbmQgUlguDQoNCklmIHRoaXMgc2NlbmFyaW8gaXMgdHJ1
ZSwgSSdtIHRoaW5raW5nIHdlIGNhbiBmaXggdGhlIGlzc3VlIGJ5IHVzaW5nDQpzcGluX3t1bn1s
b2NrX2lycXtyZXN0b3JlLHNhdmV9KCkgYmV0d2VlbiByYXZiX3N0b3BfZG1hKCkgdG8gcmF2Yl9k
bWFjX2luaXQoKS4NCiMgcmF2Yl9wdHBfaW5pdCgpIGNhbGxzIHNwaW5fbG9jayBBUEkgc28gdGhh
dCB3ZSBzaG91bGQgbm90IHNwaW4gbG9jayByYXZiX3B0cF97aW5pdCxzdG9wfSgpLg0KDQpXaGF0
IGRvIHlvdSB0aGluaz8NCg0KSSdsbCB0cnkgdG8gcmVwcm9kdWNlIHRoaXMgaXNzdWUgb24gbXkg
ZW52aXJvbm1lbnQgYWdhaW4uLi4NCiMgSSdtIHRoaW5raW5nIHJhdmJfYWRqdXN0X2xpbmsoKSBp
cyBwb3NzaWJsZSB0byBjYXVzZSB0aGlzIGlzc3VlLg0KIyBCdXQsIFNhbHZhdG9yLVggZG9lc24n
dCBoYXZlIHJlbmVzYXMsbm8tZXRoZXItbGluayBzbyB0aGF0IEknbGwgdHJ5IHRvIGFkZCBpdC4N
Cg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
