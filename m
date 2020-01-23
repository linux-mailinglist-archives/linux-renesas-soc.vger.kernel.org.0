Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABA9B14678B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2020 13:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgAWMG7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jan 2020 07:06:59 -0500
Received: from mail-eopbgr1410125.outbound.protection.outlook.com ([40.107.141.125]:19245
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726026AbgAWMG6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 07:06:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzNcft0952Cg5h/SPXtnd7uk8FYoPQXHmAaPyJKI+9c2X3CQARlWnO4StmojxBBGXwaUkt2UDxKwdaCyCtXQxbjthJR8xFr6wqr76c3jQxIIbve3rMg+ygeLklV9l1M5dKNnu1FWX+aIjJ2SoTKT0Lu9SyBMUYC4XjoLkq5VMC+Vj7Gjdu9OxBww0TL1E3gn1gPnLkhGYWSb6uDpMr1Sm3nxd0Dw+bccz8ynikrGpZdsa1N3jH/XmOPbf5jCxd7Bnp3FxrnL53pHdzfsS6eibH2sPBFBhxCZrmrX1/uVBIfxm73VvtoFRQmhd4P06MvL9ZhUJfcH/hdY275KiJgTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuU+55XAeHv5ROWmcwIHs1qPvWl2kEQwZvJhZ8HzCcQ=;
 b=HyTtsRWDZfSvTJuWecOUBXmS+dcqko3omO558xvQYcO2KiW4Hw9WURC1hUhv8/WemxmAxWR3AxvurGRkBk5/VyMM6gWWKhw90GrJ8ZQavthzoRhm4G5jpHJPuWKau/zBbkC6HY235ozVpnLqdX3Qn0MuMaW3qfZbBA3ZQt6J+ue7fNhHdmh5YE6Q1FPMQ/SYLYGuvKNkcAVTF7d1yas9e/ARplCYJ1Dfex/2nknbzQXUT777UfkTKMQp/FqD0uM/8dMg6dz/2hZmyVsGJt6834tZ8yZSEv9lo9U1Ok5ArDh1vBxBATRsM2N2NF3bmParGwEbOKC8mn5YPfc4QhFKCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuU+55XAeHv5ROWmcwIHs1qPvWl2kEQwZvJhZ8HzCcQ=;
 b=ZjSXBMADH4/EjDl9R3tVcyHsZAUp1zf9KqkrO1bw1gQ/o9fSZ+kQ4MZBLv9XOtr3ipjNsu5wIOJCwMwf3lCb7q7r74caZlEjrisRoUlvCHJogn/E9NPOP6Q24ViJN0jFD4oaVDr9axPPQ35nwWTgqRgaixKisECBGAY59RAcA6I=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2127.jpnprd01.prod.outlook.com (52.133.176.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.19; Thu, 23 Jan 2020 12:06:43 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49%7]) with mapi id 15.20.2644.028; Thu, 23 Jan 2020
 12:06:43 +0000
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
Thread-Index: AQHVzSRyHZmHtv9mykKL/8PCpdGX1KfvBPyAgAP1juCABPF50IAAD9kAgAA0v4A=
Date:   Thu, 23 Jan 2020 12:06:43 +0000
Message-ID: <TYAPR01MB45443A86488C4F5D7F1EC963D80F0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1579258447-28135-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1579258447-28135-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU3SyOTSt2E1JkZsTbqfRgCOSOWrugd4uhmJ05p+azwYw@mail.gmail.com>
 <TYAPR01MB4544EF1219B2670289410772D8320@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <TYAPR01MB4544596E4415FBD3101934D8D80F0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <CAMuHMdU8yepTTE6FmBToeOXGWK9SQOQ-hjJBjPX-z3NAPYr7EA@mail.gmail.com>
In-Reply-To: <CAMuHMdU8yepTTE6FmBToeOXGWK9SQOQ-hjJBjPX-z3NAPYr7EA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1c15932f-b751-4853-5c8e-08d79ffcb612
x-ms-traffictypediagnostic: TYAPR01MB2127:
x-microsoft-antispam-prvs: <TYAPR01MB2127E6AA28964B44408C9F7AD80F0@TYAPR01MB2127.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 029174C036
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(199004)(189003)(66476007)(64756008)(66556008)(66946007)(66446008)(71200400001)(7696005)(2906002)(55016002)(5660300002)(6506007)(76116006)(6916009)(52536014)(26005)(478600001)(186003)(33656002)(8676002)(54906003)(86362001)(316002)(8936002)(81156014)(81166006)(4326008)(9686003)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2127;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pfpXJKvWgt1WOFu1pJmhhfQxyIBkJLHHrzj3u89f6UcAmyu7cUkouL2t4m9iEMLUiSUZYVzZAN+ZLWC2B9RiVMablTq4NjrHSBHRI8Y3RIca+xTDya/mQuszhlIuqnHh3oe8gUwCiUyz3dSWqGr4Ptv9LwJ4HXtouWPZbqY3Q8yAy5LuuTIfCAj+CSyxb2guAZ20c1Zr05mTp7P64ec8ncFkXDxIsoOV0usbMFXB2GZ/RJp7+BAqIEy+N70B9jxnTtgLHnSn6WMNTh7zf3D4EwafxNQcqlFX09fI+QS1Ne3xkmu4BL0cAx8a3VemXwCvy3NNmj8mjkaa4gHE0F2IVLYixPXeod4P8y33d16ItiajMob/PIgE7hHPn55SuFUgRzFSAyXPcavDxkN0HlMNccrayds1Vt1HEDk/EciQX7jZobeAID0nUXZKwdud11FsspKWyQXigK/njU8lHGlk7UvqbaIQFqR4hY63sVkuncdOM958iU5abogbZkYT0W+l
x-ms-exchange-antispam-messagedata: H+DBG2oSvBs1wt5i4ZdSpKgRwE56Ghjksz3Ko7n0emOHASgub8Oci2rrNyNI2NdwOEp39lUYVTAgFIMM0BZi3bqat+lLRtB29PY5uUFRDdRImOH2fBQjN2zQWBQWulCmX/D2tp8zrLNcIWVTGpj65w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c15932f-b751-4853-5c8e-08d79ffcb612
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2020 12:06:43.0366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NzQ9+PdEYMhUKBD9bKWn+D0r8/BQp1VFK/0aJfc+QaPz/AY11TWuyLv1x09fupIpRP5a7DhLMYDEnmK4IFe9LPLzRKYFEFGS9uQsIAF/FNpXUqjmEX3MWLZNWoF5LSLN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2127
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIEphbnVhcnkgMjMsIDIwMjAgNTo1NyBQTQ0KPHNuaXA+DQo+ID4gSSdtIHRyeWluZyB0byBh
ZGQgc29tZSB1bmRvY3VtZW50ZWQgY29tcGF0aWJsZSB2YWx1ZXMsIGJ1dCBpdCBzZWVtcyBoYXJk
DQo+ID4gdG8gYWRkIGJlY2F1c2U6DQo+ID4gLSBTb21lIGR0c1tpXSBmaWxlcyBoYXZlIHVuZG9j
dW1lbnRlZCBjb21wYXRpYmxlIHN0cmluZ3MuDQo+ID4gICMgV2UgY2FuIGZpbmQgaXQgYnkgdXNp
bmcgdGhlIGZvbGxvd2luZyBjb21tYW5kOg0KPiA+ICAjICQgZ3JlcCAiZ2VuZXJpYy1laGNpIiBg
ZmluZCAtbmFtZSAiKi5kdHMqImAgfCBncmVwICIsIg0KPiA+DQo+ID4gLSBJIHRyaWVkIHRvIHVz
ZSAib25lT2Y6IiBhbmQgImNvbnRhaW5zOiIgY29tYmluYXRpb24sIGJ1dCBpdCBmYWlsZWQuDQo+
ID4NCj4gPiAtIFRoaXMgZ2VuZXJpYy1laGNpLnlhbWwgdXNlcyAiY29udGFpbnM6IiBmb3IgdGhl
IGNvbXBhdGlibGUgbm93Lg0KPiA+ICAgU28sIGV2ZW4gaWYgY29tcGF0aWJsZSBwcm9wZXJ0eSBo
YXMgdW5kb2N1bWVudGVkIGNvbXBhdGlibGUgc3RyaW5nLA0KPiA+ICAgbWFrZSBkdGJzX2NoZWNr
IGNvbW1hbmQgc3VjY2VlZGVkIChleGNlcHQgbm9kZSBuYW1lcykuDQo+IA0KPiBQcm9iYWJseSB5
b3UnbGwgaGF2ZSB0byB3cml0ZSBhIHNlcGFyYXRlIERUIGJpbmRpbmcgZG9jIGZpbGUgZm9yIFIt
Q2FyIEdlbjMsDQo+IHJlZmVycmluZyB0byBnZW5lcmljLWVoY2kueWFtbCB1c2luZyAkcmVmLg0K
DQpJIHNlZS4NCg0KPiA+IC0gSW4gbXkgb3BpbmlvbiwgYWxtb3N0IGFsbCB1c2VyIChleGNlY3Qg
Ui1DYXIgU29DcykgZG9lc24ndCBuZWVkcw0KPiA+ICAgc3BlY2lmaWMgY29tcGF0aWJsZSB2YWx1
ZXMsIHNvIHRoYXQgYWRkaW5nIHN1Y2ggY29tcGF0aWJsZSB2YWx1ZXMNCj4gPiAgIGNhdXNlcyBs
ZXNzIHVzYWJpbGl0eSBpbiB0aGUgZnV0dXJlLg0KPiA+DQo+ID4gU28sIEkgc3VzcGVuZGVkIGFk
ZGluZyBzcGVjaWZpYyBjb21wYXRpYmxlIHZhbHVlcyBhbmQgSSdsbCB1c2UNCj4gPiBzb2NfZGV2
aWNlX21hdGNoKCkgZm9yIHRoaXMgd29ya2Fyb3VuZCBmb3Igbm93Li4uDQo+IA0KPiBXaGljaCBo
YXMgdGhlIGFkdmFudGFnZSB0aGF0IGl0IHdpbGwgZW5hYmxlIHRoZSBxdWlyayB3aXRoIG9sZCBE
VEJzLCB0b28gOy0pDQoNCkkgdGhpbmsgc28gOikNCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJv
IFNoaW1vZGENCg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBs
b3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJ
biBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15
c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
