Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80C20146334
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2020 09:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgAWISb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jan 2020 03:18:31 -0500
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:5207
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725785AbgAWISb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 03:18:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npkJNQcEdSCaCj3OIfqVgKaWdxrSanvQ21sXL0U6JHnW/bzs8PwRNULaxR2LX6Z14HICaXjwmj+5V68oDmr6qcWJBrn4bDvWETcteJY0NwRMRY7WWrj51IeTUiwG/3yvhottItA29WBUq2CH5fZgqJAv8j9h/eD1kxoQ4DoyjIOvoF0cRJD9ODdTuqUGJRTbCjEs8cA3K5EJwUmbb/T5oJMIBsvpg2+44iFc3p4HwFuSxYtNcel19CgaXUcL/cigjKz3JO6nDzVCMoAlO9mnAAXXjXBSnpPBI0xrdGnSjhW551tWPMYu4EWenBpImdH9wyeGQTNS6q8FX6l9H19P1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+UIbsk8lSJjwvIoKospMIguDLuCQgxDNNg5ykbwIh0=;
 b=XYJKgjf/xeVWMOS7ZiDs2xtK7pJHj0hs+Lxwjzh8enDy3ZmdgyB8QD8OowtTiaegJ3Srzm+v/Xm76A7jeKDBx+VBahTJUesj1kWqRO979AXkbLe/ywk9rswRN5ArpyXC4Pdi/nL2wbfb51KeSdu1KmMCyVp2LTRGG+Z1zRr2R+fAPURvjdaDhKxoIfcRkWHs/SoTVKMfKiSSEm8pa+cDvJG6crZ+yH7pxmKMCrj9PYNN5HIZfdr2GFxt7ZEZ91+0ygD8uO/48oouVQc8sQUx+vhEfFE5i4Wc0Hqi4kcmoSpuLmO7FE5Lq4rY7M1fG0sNwUuv7YB7S/uuLqB3H7juwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+UIbsk8lSJjwvIoKospMIguDLuCQgxDNNg5ykbwIh0=;
 b=p8o/JnfGsPo8iIrr1CVNWPy4TG2XwodtReM3gC3PnI0CDEGYtEKnlChWyAyPyLhNeAABCJE5IQtajSqWrkSn9v9GfWzw4l0JODr/nCSIWGH+0AZNjS2Vkemr8Lm4K6fx0ieoYXDpJI1byQ7YKEVcwzj2wL7+CZNsPlON/2wUBv0=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2669.jpnprd01.prod.outlook.com (20.177.102.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.21; Thu, 23 Jan 2020 08:17:48 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49%7]) with mapi id 15.20.2644.028; Thu, 23 Jan 2020
 08:17:47 +0000
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
Thread-Index: AQHVzSRyHZmHtv9mykKL/8PCpdGX1KfvBPyAgAP1juCABPF50A==
Date:   Thu, 23 Jan 2020 08:17:47 +0000
Message-ID: <TYAPR01MB4544596E4415FBD3101934D8D80F0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1579258447-28135-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1579258447-28135-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU3SyOTSt2E1JkZsTbqfRgCOSOWrugd4uhmJ05p+azwYw@mail.gmail.com>
 <TYAPR01MB4544EF1219B2670289410772D8320@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB4544EF1219B2670289410772D8320@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3c95327b-b727-4f56-a254-08d79fdcbb43
x-ms-traffictypediagnostic: TYAPR01MB2669:
x-microsoft-antispam-prvs: <TYAPR01MB2669FC7FFCCF09AB0918E3CCD80F0@TYAPR01MB2669.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 029174C036
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(199004)(189003)(5660300002)(86362001)(4326008)(316002)(54906003)(81166006)(81156014)(8676002)(6506007)(55016002)(71200400001)(478600001)(186003)(7696005)(52536014)(9686003)(26005)(33656002)(64756008)(66446008)(2906002)(6916009)(66556008)(8936002)(76116006)(66946007)(66476007)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2669;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JcDfDcw0DWxb8zQHyMpz5Z96G4dq23p59QjfJ6mA2VfW8ji4igvvEjYVQ6LFmMhzUkyNhqlGXhRhEmhz7wjmpdu8/WAbs39trFCLDnVc5n+g4YwiORndJHdbhh4OL0fPjTe1edyOPg50yYAMR781b+rBEZugvAD2QMZyvjdplqRBcOZ8EsVditct2PerJWYXeX5RAIUVV2QhWoUTK80N8IHaBFgd0Oj19inA4BrQo/dNtghhGeC/4CdMy0ySyXXM3LjmvrfSPvqDiwUm0Nl0gnaxLnNcKPVXSIjo8aBK0DouEMjynYHmQVAC7TCGooIL6dwJKMFytJtq/rFP+2EkE0kmf3rMDDbSTXaRr18XOKXvFlrwG2AGgGBybqzD+2cA3Z30GEKFb9BsqQE5nl9vdF24CPle9/SEm2V1wxQiQPvcxPjQwSgceZ1ihoehUNERpCXqOTZcwIoDPGARoXp7CDhRLkQfkznehhpW1PyT+LvJouv0JnIp+ZVPkEUOXdQ2
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c95327b-b727-4f56-a254-08d79fdcbb43
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2020 08:17:47.8548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SaC3K79vxmELmFcWebAZV3NDRMAPFXnyrJPiNdgEMVRMxuv6O73NWtmvRkmPVGMW2tA5fUlFv36mx4fvHadjnYMHaWr+vZInggJ0RVeGjqR5F6Sr83RtsumdNgwsxbPI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2669
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuIGFnYWluLA0KDQo+IEZyb206IFlvc2hpaGlybyBTaGltb2RhLCBTZW50OiBN
b25kYXksIEphbnVhcnkgMjAsIDIwMjAgNTowNSBQTQ0KPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9nZW5lcmljLWVoY2kueWFtbA0KPiA+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9nZW5lcmljLWVoY2kueWFtbA0K
PiA+ID4gQEAgLTYzLDYgKzYzLDExIEBAIHByb3BlcnRpZXM6DQo+ID4gPiAgICAgIGRlc2NyaXB0
aW9uOg0KPiA+ID4gICAgICAgIFNldCB0aGlzIGZsYWcgdG8gZm9yY2UgRUhDSSByZXNldCBhZnRl
ciByZXN1bWUuDQo+ID4gPg0KPiA+ID4gKyAgbmVlZHMtcG9sbGluZy10by1hdm9pZC1zdHVjazoN
Cj4gPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvZmxhZw0K
PiA+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ICsgICAgICBTZXQgdGhpcyBmbGFnIHRvIGF2
b2lkIGdldHRpbmcgRUhDSSBzdHVjay4NCj4gPiA+ICsNCj4gPiA+ICAgIGNvbXBhbmlvbjoNCj4g
PiA+ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0K
PiA+ID4gICAgICBkZXNjcmlwdGlvbjoNCj4gPg0KPiA+IElmIHRoaXMgaXNzdWUgaXMgc3BlY2lm
aWMgdG8gdGhlIEVIQ0kvT0hDSSBpbXBsZW1lbnRhdGlvbiBvbiBSLUNhciBHZW4zLA0KPiA+IEkg
ZG9uJ3QgdGhpbmsgdGhpcyBpcyB0aGUgYmVzdCBzb2x1dGlvbiB0byBoYW5kbGUgaXQuDQo+ID4g
SXQgbWlnaHQgYmUgYmV0dGVyIHRvIGFkZCBmYW1pbHkvU29DLXNwZWNpZmljIGNvbXBhdGlibGUg
dmFsdWVzIGZvciB0aGUNCj4gPiBFSENJL09IQ0kgY29udHJvbGxlcnMgaW4gUi1DYXIgR2VuMyBT
b0NzLCBjZnIuIHRoZSAodW5kb2N1bWVudGVkKQ0KPiA+ICJpYm0sdXNiLWVoY2ktNDQwZXB4IiBh
bmQgImFsbHdpbm5lcixzdW40aS1hMTAtZWhjaSIgY29tcGF0aWJsZSB2YWx1ZXMNCj4gPiBpbiB0
aGUgZXhhbXBsZSBpbiB0aGUgRFQgYmluZGluZ3MgZmlsZSAocHJvYmFibHkgd2Ugc2hvdWxkIGhh
dmUgZG9uZSBzbw0KPiA+IGZyb20gdGhlIHN0YXJ0LCBsaWtlIGZvciBhbGwgb3RoZXIgZGV2aWNl
cykuDQo+ID4gVGhlbiB0aGUgZHJpdmVyIGNhbiBoYW5kbGUgdGhlIGlzc3VlIGJhc2VkIG9uIHRo
ZSBjb21wYXRpYmxlIHZhbHVlLg0KPiANCj4gSSB1bmRlcnN0b29kIGl0LiBBbmQgSSdtIGFsc28g
dGhpbmsgYWRkaW5nIGZhbWlseS9Tb0Mtc3BlY2lmaWMgY29tcGF0aWJsZQ0KPiB2YWx1ZXMgYXJl
IGJldHRlci4NCg0KSSdtIHRyeWluZyB0byBhZGQgc29tZSB1bmRvY3VtZW50ZWQgY29tcGF0aWJs
ZSB2YWx1ZXMsIGJ1dCBpdCBzZWVtcyBoYXJkDQp0byBhZGQgYmVjYXVzZToNCi0gU29tZSBkdHNb
aV0gZmlsZXMgaGF2ZSB1bmRvY3VtZW50ZWQgY29tcGF0aWJsZSBzdHJpbmdzLg0KICMgV2UgY2Fu
IGZpbmQgaXQgYnkgdXNpbmcgdGhlIGZvbGxvd2luZyBjb21tYW5kOg0KICMgJCBncmVwICJnZW5l
cmljLWVoY2kiIGBmaW5kIC1uYW1lICIqLmR0cyoiYCB8IGdyZXAgIiwiDQoNCi0gSSB0cmllZCB0
byB1c2UgIm9uZU9mOiIgYW5kICJjb250YWluczoiIGNvbWJpbmF0aW9uLCBidXQgaXQgZmFpbGVk
Lg0KDQotIFRoaXMgZ2VuZXJpYy1laGNpLnlhbWwgdXNlcyAiY29udGFpbnM6IiBmb3IgdGhlIGNv
bXBhdGlibGUgbm93Lg0KICBTbywgZXZlbiBpZiBjb21wYXRpYmxlIHByb3BlcnR5IGhhcyB1bmRv
Y3VtZW50ZWQgY29tcGF0aWJsZSBzdHJpbmcsDQogIG1ha2UgZHRic19jaGVjayBjb21tYW5kIHN1
Y2NlZWRlZCAoZXhjZXB0IG5vZGUgbmFtZXMpLg0KDQotIEluIG15IG9waW5pb24sIGFsbW9zdCBh
bGwgdXNlciAoZXhjZWN0IFItQ2FyIFNvQ3MpIGRvZXNuJ3QgbmVlZHMNCiAgc3BlY2lmaWMgY29t
cGF0aWJsZSB2YWx1ZXMsIHNvIHRoYXQgYWRkaW5nIHN1Y2ggY29tcGF0aWJsZSB2YWx1ZXMNCiAg
Y2F1c2VzIGxlc3MgdXNhYmlsaXR5IGluIHRoZSBmdXR1cmUuDQoNClNvLCBJIHN1c3BlbmRlZCBh
ZGRpbmcgc3BlY2lmaWMgY29tcGF0aWJsZSB2YWx1ZXMgYW5kIEknbGwgdXNlDQpzb2NfZGV2aWNl
X21hdGNoKCkgZm9yIHRoaXMgd29ya2Fyb3VuZCBmb3Igbm93Li4uDQoNCkJlc3QgcmVnYXJkcywN
Cllvc2hpaGlybyBTaGltb2RhDQoNCg==
