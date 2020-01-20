Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 791B21424C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2020 09:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgATIFH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Jan 2020 03:05:07 -0500
Received: from mail-eopbgr1410114.outbound.protection.outlook.com ([40.107.141.114]:8736
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726075AbgATIFH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jan 2020 03:05:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxKqmOXun0ToCYTxka3ZcFy6Fqj8NxBXsVwmYcffDF6t3Ew2wE/sKZiROT5m9JV6HvCWv47n0M7+RRkL4O041lpsjDcmYP/wONf1BUvTtPOirPi0fUJ/LHvkdBYUbz2DJR+le9Ax4VDlpkHHMeDT2ybAOjcWcklOVnrsdm7G5BZXpMClkGJf7UrEBu3HHdEPkzBfrOgh+qVLWJM8c1mfvfNCFceV1w+qEnmvvB8whvNEVVSIgIpd1Qe9b+nlXrfWV5t8Iic7KGbSL/k7LBueaCRTIWiFJlzhfL3DoiVFEie3YJiTvLPXrq5os1i0HcUR8cQ/58fhRdH40ufiyl19ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNKcqlbuHR/OkwGMp0rRkilS96yC3M2rojgsRvMOK3g=;
 b=GuBp8GvIMe+ANPvhwKI1WElxU6mUyDRUYteAvSxX9j3xlSV1CW2g4a+A/BW6fRYPm79I3/AX1FhnNyj3MD9sFDhD0OZ0mCefN7ujiR5BMAysvLGTglW9F9IE1czWj4If5njhBmxqEvgn5N+onva9mSH8H7qjaKt+LtWs05luuUSMWrYh6TmR1HzNdWm3AERQYU3Lu1sfoau0lMHcQfSiq8lmz4dra0cP0t2cjilB7jrFqEVkaLSfsTpkxZPcuaIM9a2R3UMehYZI+mSe0ujBzXqKffAzlhWjIRmoXZasXBiW1rOM0eAaZxp8anX8pjKbagNdsHiimcDCXKtn9542TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNKcqlbuHR/OkwGMp0rRkilS96yC3M2rojgsRvMOK3g=;
 b=QffVXC6Zjf2nsBm+B1Rk81cuEC2LzdBWh0B1zeTXKsauQYwAo/oCZM/fEdyzhBFZhIZKuwMaEgJcusrLG3uDOjiZGt3SqdaEVVrzQGyMK8FzaCMdWvgBokr15l7+3NlL5IZ+nnN6kIsIWC09UBsI1xFIeIXBbD8eEDw+YJlRIQM=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4048.jpnprd01.prod.outlook.com (20.178.139.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Mon, 20 Jan 2020 08:05:04 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49%7]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 08:05:04 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Tony Prisk <linux@prisktech.co.nz>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: usb: generic-ehci: add a quirk property
 to avoid stuck
Thread-Topic: [PATCH 1/2] dt-bindings: usb: generic-ehci: add a quirk property
 to avoid stuck
Thread-Index: AQHVzSRyHZmHtv9mykKL/8PCpdGX1KfvBPyAgAP1juA=
Date:   Mon, 20 Jan 2020 08:05:03 +0000
Message-ID: <TYAPR01MB4544EF1219B2670289410772D8320@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1579258447-28135-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1579258447-28135-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU3SyOTSt2E1JkZsTbqfRgCOSOWrugd4uhmJ05p+azwYw@mail.gmail.com>
In-Reply-To: <CAMuHMdU3SyOTSt2E1JkZsTbqfRgCOSOWrugd4uhmJ05p+azwYw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 43953d82-55ef-413b-17db-08d79d7f74b7
x-ms-traffictypediagnostic: TYAPR01MB4048:
x-microsoft-antispam-prvs: <TYAPR01MB40489986FD9A27E0F151BF70D8320@TYAPR01MB4048.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(199004)(189003)(6916009)(71200400001)(33656002)(2906002)(7696005)(86362001)(316002)(54906003)(8676002)(66476007)(76116006)(66446008)(64756008)(81156014)(81166006)(186003)(66556008)(66946007)(26005)(52536014)(5660300002)(8936002)(53546011)(478600001)(9686003)(6506007)(55016002)(4326008)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4048;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DXD3lAJmvbQ5CHDzQ3zMmMY2ITeBTb5Ufscdzrm8qNgZQKzfP49XCsGmQY50cyKK/7YpA3GUpx9iv22X2w3spYtFZ4aulqh9zZjCbIITbw4izIhP3pG6w1bRFi91XGovtM/E6yU1H6v1Hx03QFABIR3gf8a7bYzjNO0+b97fAFXr1OBDXvXIwwjJX9b42l+cyjO0qX/BHSTfaQomxLFSGY1/T546kftrt/eD2mArtDhThEvM7M2fim8fdL2JhvgeLmFDk4ciP7QswiFmVOrb4w6AF5Tj6ztX3iC0668X6KWkTGd/B6nem2g2xH7/b0plsH53xfpCxwCMLFA+1kB0czxIcHiivxVSZLy4LEnKkPgFjUhKJ4bW0cs6ebR259lGn+t8ImB3/FDBonyjnx7MEztSjiqmHU2Z3rGffdE6mEPrY/cw8udA2Ux1w5zNO8RHma3qC0ULqGLHxzB0AAfjH/2P8ifC9y8ehkcTE5YviU4wI0f2vxj8nSU8brTtybrm
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43953d82-55ef-413b-17db-08d79d7f74b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 08:05:03.9558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PiPHU3AKxc8HRS54oxDSP31Mfu+QQwgn2YIXavWnJ3CM3uBOOWtUdLIfq+zBBoNQ8qox1R+5v+M+HJo29+xep2A7cqltzRNhPNcaUVGKS2OIdBTM7qhw9o3iFOvlFyf7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4048
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogU2F0dXJkYXksIEphbnVhcnkgMTgsIDIwMjAgMTowMyBB
TQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+
IA0KPiBPbiBGcmksIEphbiAxNywgMjAyMCBhdCAxMTo1NCBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0K
PiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFNpbmNlIEVI
Q0kvT0hDSSBjb250cm9sbGVycyBvbiBSLUNhciBHZW4zIFNvQ3MgYXJlIHBvc3NpYmxlIHRvDQo+
ID4gYmUgZ2V0dGluZyBzdHVjayB2ZXJ5IHJhcmVseSBhZnRlciBhIGZ1bGwvbG93IHVzYiBkZXZp
Y2Ugd2FzDQo+ID4gZGlzY29ubmVjdGVkLiBUbyBkZXRlY3QvcmVjb3ZlciBmcm9tIHN1Y2ggYSBz
aXR1YXRpb24sIHRoZSBjb250cm9sbGVycw0KPiA+IHJlcXVpcmUgYSBzcGVjaWFsIHdheSB3aGlj
aCBwb2xsIHRoZSBFSENJIFBPUlRTQyByZWdpc3RlciBhbmQgY2hhbmdlcw0KPiA+IHRoZSBPSENJ
IGZ1bmN0aW9uYWwgc3RhdGUuDQo+IA0KPiBPb3BzLi4uIElzIHRoaXMgbGltaXRlZCB0byB0aGUg
RUhDSS9PSENJIGltcGxlbWVudGF0aW9uIG9uIFItQ2FyIEdlbjM/DQo+IE9yIGNhbiBpdCBoYXBw
ZW4gb24gYW55IEVIQ0kvT0hDSSBjb250cm9sbGVyPw0KDQpUaGlzIGlzIGxpbWl0ZWQgb24gUi1D
YXIgR2VuMyAoYW5kIHBlcmhhcHMgUlovQTIgYW5kIFJaL0cyKS4NCkJ1dCwgUi1Nb2JpbGUgQTEg
YW5kIFItQ2FyIEdlbjEvMiBkb24ndCBoYXZlIHRoaXMgaXNzdWUuDQpBbmQgSSBkb24ndCBrbm93
IGFueSBvdGhlciBFSENJL09IQ0kgY29udHJvbGxlciBoYXMgdGhpcyBpc3N1ZS4NCg0KPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZ2VuZXJpYy1laGNpLnlh
bWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2dlbmVy
aWMtZWhjaS55YW1sDQo+ID4gQEAgLTYzLDYgKzYzLDExIEBAIHByb3BlcnRpZXM6DQo+ID4gICAg
ICBkZXNjcmlwdGlvbjoNCj4gPiAgICAgICAgU2V0IHRoaXMgZmxhZyB0byBmb3JjZSBFSENJIHJl
c2V0IGFmdGVyIHJlc3VtZS4NCj4gPg0KPiA+ICsgIG5lZWRzLXBvbGxpbmctdG8tYXZvaWQtc3R1
Y2s6DQo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9mbGFn
DQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgU2V0IHRoaXMgZmxhZyB0byBhdm9p
ZCBnZXR0aW5nIEVIQ0kgc3R1Y2suDQo+ID4gKw0KPiA+ICAgIGNvbXBhbmlvbjoNCj4gPiAgICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUNCj4gPiAgICAg
IGRlc2NyaXB0aW9uOg0KPiANCj4gSWYgdGhpcyBpc3N1ZSBpcyBzcGVjaWZpYyB0byB0aGUgRUhD
SS9PSENJIGltcGxlbWVudGF0aW9uIG9uIFItQ2FyIEdlbjMsDQo+IEkgZG9uJ3QgdGhpbmsgdGhp
cyBpcyB0aGUgYmVzdCBzb2x1dGlvbiB0byBoYW5kbGUgaXQuDQo+IEl0IG1pZ2h0IGJlIGJldHRl
ciB0byBhZGQgZmFtaWx5L1NvQy1zcGVjaWZpYyBjb21wYXRpYmxlIHZhbHVlcyBmb3IgdGhlDQo+
IEVIQ0kvT0hDSSBjb250cm9sbGVycyBpbiBSLUNhciBHZW4zIFNvQ3MsIGNmci4gdGhlICh1bmRv
Y3VtZW50ZWQpDQo+ICJpYm0sdXNiLWVoY2ktNDQwZXB4IiBhbmQgImFsbHdpbm5lcixzdW40aS1h
MTAtZWhjaSIgY29tcGF0aWJsZSB2YWx1ZXMNCj4gaW4gdGhlIGV4YW1wbGUgaW4gdGhlIERUIGJp
bmRpbmdzIGZpbGUgKHByb2JhYmx5IHdlIHNob3VsZCBoYXZlIGRvbmUgc28NCj4gZnJvbSB0aGUg
c3RhcnQsIGxpa2UgZm9yIGFsbCBvdGhlciBkZXZpY2VzKS4NCj4gVGhlbiB0aGUgZHJpdmVyIGNh
biBoYW5kbGUgdGhlIGlzc3VlIGJhc2VkIG9uIHRoZSBjb21wYXRpYmxlIHZhbHVlLg0KDQpJIHVu
ZGVyc3Rvb2QgaXQuIEFuZCBJJ20gYWxzbyB0aGluayBhZGRpbmcgZmFtaWx5L1NvQy1zcGVjaWZp
YyBjb21wYXRpYmxlDQp2YWx1ZXMgYXJlIGJldHRlci4NCg0KPiBCZXNpZGVzLCB3aGF0IGFib3V0
IERUIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5Pw0KPiBUbyBlbmFibGUgdGhpcyBxdWlyayBoYW5k
bGluZywgdGhlIERUIG11c3QgYmUgdXBkYXRlZCBmaXJzdC4NCj4gVGhpcyBpcyB0cnVlIGZvciBz
b2x1dGlvbnMgYmFzZWQgb24gZWl0aGVyIGEgRFQgcHJvcGVydHkgb3Igb24gYQ0KPiBkaWZmZXJl
bnQgY29tcGF0aWJsZSB2YWx1ZS4NCj4gT2YgY291cnNlLCB5b3UgY2FuIGFsd2F5cyB1c2Ugc29j
X2RldmljZV9tYXRjaCgpLi4uDQoNCkluIHRoaXMgY2FzZSwgSSBzaG91bGQgYXBwbHkgdGhpcyBx
dWlyayB0byBzb21lIFNvQ3MsDQpJIHRoaW5rIHVzaW5nIERUIGlzIGJldHRlciB0aGFuIHNvY19k
ZXZpY2VfbWF0Y2goKS4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiBH
cntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+
IA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwg
Y29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNr
ZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInBy
b2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
