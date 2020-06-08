Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCD191F16D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 12:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgFHKjH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 06:39:07 -0400
Received: from mail-eopbgr1320139.outbound.protection.outlook.com ([40.107.132.139]:36671
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729300AbgFHKjH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 06:39:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJVAAsEsEB8T2tVB+N/oG2I863Fcv/AMHcUxK/WsN/JrYOm9jzU21/1iMGF5F4OzLkjqmy5tsmEPI2To50RTH3d8iiGbv8/4q3kAlibLDzH+uoaQkpjbkJgOnDxSpF0/s2Bf+0PmBSuSl8Tbbc7TBlRiDitzGxe9gmWnh1IIjhEPZSdcmBWNYx9+6GRZ1T9kF+ktoafjDnDTRaynJqfLA+1OwIOjVemPs59mCxOziKl9bjNiepdKaddxcVMkf0aj2fqpio4YS355NrN3YS57ba1GRFHnCtkXNbcRPXPD/XkAb+02wmpKe05JNo4JRyCKCBsxybcBNVu54cCqKrm42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9+jSzeHfyHIpLQ/a3YawSI6+oRufdvhdnkpdlJyGjg=;
 b=kSHOQwzWvgOOTBSd7rTHLYEFrE4bK+UN7MSx/t7fhkm2IpNU9IUs/9e1zM/qBOQiHFGntl4XrLczMtms49A7umSl81YMR9CaNZrIK6Fb6y87rhg0KCY4bpL6Qz2SBFosjtYu5f9oGqSlrGurB6JESojTt0asIKRlKyfKI3PBbhe9DW+HKDTnzOxzQgDkUyv5pXoVy1s2cl+tI4PwtjD1o7ZErwFk3H3+z5nDKcCKMyc//6f6kVQi1TtweFZrokGcPqM+ldAU63x4nAd5mryjEKa52EPkyeLGPlNpDZ7OVTJ40CJBCU3yDLwAnYxHZ5TvEp5E48sy5jpGO9RXQLuoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9+jSzeHfyHIpLQ/a3YawSI6+oRufdvhdnkpdlJyGjg=;
 b=ZQxjxCLBOLTCoZhR8+oPLvCtfWdZJnIkpWURXX5UgKMRVabCvg/HxQVP4ZA2SuwpvLbeiforHl2CuNlq762p7s5FCAMzuCryQBS3pj3M5SqOwJqa22HGK/4QnYhIiy+glRG/6H0Fd2ADWCXrjaPUu7yRmBRvYbx/dOErZa7mo5k=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3339.jpnprd01.prod.outlook.com (2603:1096:404:d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 10:39:03 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 10:39:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC] mmc: core: Issue power_off_notify for eMMC
 Suspend-to-RAM
Thread-Topic: [PATCH/RFC] mmc: core: Issue power_off_notify for eMMC
 Suspend-to-RAM
Thread-Index: AQHWLdFW4LWb0SXvbUyfh/OMYFhgGajIc4JwgAYKZYCAAB5UIA==
Date:   Mon, 8 Jun 2020 10:39:03 +0000
Message-ID: <TY2PR01MB3692FAFE6FCA89538FA3AC4DD8850@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1589887988-7362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB3692FD4D8058D5EEFC761D47D8890@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAPDyKFptcUJj3u2LChz+tk61u8WcOrpaZLmDcj5Xb3HNuJv_qw@mail.gmail.com>
In-Reply-To: <CAPDyKFptcUJj3u2LChz+tk61u8WcOrpaZLmDcj5Xb3HNuJv_qw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 754aed84-1af7-4b6b-29c5-08d80b9829a3
x-ms-traffictypediagnostic: TY2PR01MB3339:
x-microsoft-antispam-prvs: <TY2PR01MB3339A77263CF6C1CE167FF79D8850@TY2PR01MB3339.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 042857DBB5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cx7Kg16IUEcRj6TKlJwfyfHTfjTauhCyGdBkQWaxQI7zs/FkJy0KopQwRc8+djk5P0iY7XmdIpsRY3adho3mK6QhDqKY3aoXDvDTgbztXxs+LR/jexdeNPKEIBxRV0eRFHyxaACx54LsFUu/d7mfpa/m98TPF/yuHYBgkpcoQ0NxvQ1uYbe8ytuLpGrSML8gkkGojQVpF8Sh9Dd7pGA64QcZ7brKu34a7h6TZnGnfgwgXzvXucpvk2VT2PHG7QlSfDM0VxTkD1dayLl/LJGk44P0VBmmbb1TZt4YEo7pJkY6wkO99DsoreB/yT4GOCkf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(54906003)(316002)(4326008)(8936002)(6916009)(9686003)(8676002)(7696005)(186003)(86362001)(26005)(83380400001)(52536014)(33656002)(2906002)(5660300002)(15650500001)(64756008)(66446008)(478600001)(66556008)(66946007)(55236004)(71200400001)(76116006)(55016002)(66476007)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: sfNjxA1A7k8IXk1uG0caPE/DTRp5WbB0c1T1y6C69cUaYev4pf5MlZlrzG5D68+4SgAyinh2wGmlVP9sBI9e2Y/MRJhSr3EwJGZWyPGgDiSaThUKpOxe+Mw7uDWOxISWZXp1tE3e15jxSF7NBGWQYsX2C1cl0SlvqntAupGdDdRLV+vNnEfksbAWBCuuMm2E19NjMzyWh0in4gW19h1AN66cm34Ozo8+mlNj1AXtnbVzISwmSTfM+XfTAVFL9Z4ySJRy0FNnVSuJsOBNEQluuelCeXxHUQaKTuVNxLvp4nPChkJBzufml4bHzvyfdtWgJEWjp8twK3e/bXUONzWmw28g+K3REBbu5L1NIzj1J/md5cIBCvszZVH5aAauyy2jwn5yhA96baO3h/Bupz1cLZO1F8yw/KKU77eiS3Y9kYy8PJACt4EgOjVs3Mv2tmmR8W/Mh44F4zy6srcKA62ZU6WZeGax7EkZ+CW1nnN0/04F16QaYcV1F/NlJoHnel+5
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754aed84-1af7-4b6b-29c5-08d80b9829a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2020 10:39:03.3349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zrCj96DvcTJUWkLoizAAaxoJ6mpzrnlo2UrUroT+4t9PRiYx08fwWHwolzZPBIWN/scFrHWPHzUl0CK2f0DShxj5AqSJMaoXDboQOI5rsUWElQkVQVb9a+mlGoR/uhxY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3339
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiBGcm9tOiBVbGYgSGFuc3NvbiwgU2VudDogTW9uZGF5LCBKdW5lIDgsIDIwMjAgNToxNCBQTQ0K
PiBPbiBUaHUsIDQgSnVuIDIwMjAgYXQgMTQ6MTcsIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5b3No
aWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBhZ2FpbiwN
Cj4gPg0KPiA+ID4gRnJvbTogWW9zaGloaXJvIFNoaW1vZGEsIFNlbnQ6IFR1ZXNkYXksIE1heSAx
OSwgMjAyMCA4OjMzIFBNDQo+ID4gPg0KPiA+ID4gVGhlIGNvbW1pdCA0MzIzNTY3OTM0MTUgKCJt
bWM6IGNvcmU6IEVuYWJsZSBwb3dlcl9vZmZfbm90aWZ5IGZvcg0KPiA+ID4gZU1NQyBzaHV0ZG93
biBzZXF1ZW5jZSIpIGVuYWJsZWQgdGhlIHBvd2VyIG9mZiBub3RpZmljYXRpb24NCj4gPiA+IGV2
ZW4gaWYgTU1DX0NBUDJfUE9XRVJPRkZfTk9USUZZIChNTUNfQ0FQMl9GVUxMX1BXUl9DWUNMRSBu
b3cpIGlzDQo+ID4gPiBub3Qgc2V0LiBIb3dldmVyLCB0aGUgbW1jIGNvcmUgbGFja3MgdG8gaXNz
dWUgdGhlIHBvd2VyIG9mZg0KPiA+ID4gbm90aWZpY2FpdG9uIHdoZW4gU3VzcGVuZC10by17UkFN
LERpc2t9IGhhcHBlbnMgb24gdGhlIHN5c3RlbS4NCj4gPiA+DQo+ID4gPiBTbywgYWRkIFN1c3Bl
bmQtdG8tUkFNIHN1cHBvcnQgYXQgZmlyc3QgYmVjYXVzZSB0aGlzIGlzIGVhc3kgdG8NCj4gPiA+
IGNoZWNrIGJ5IHVzaW5nIHBtX3N1c3BlbmRfdGFyZ2V0X3N0YXRlIGNvbmRpdGlvbiBvbiBfbW1j
X3N1c3BlbmQoKS4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9k
YSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ID4NCj4gPiBJJ2QgbGlrZSB0
byBhZGQgbW9yZSBkZXRhaWwgd2h5IHRoaXMgcGF0Y2ggaXMgbmVlZGVkLg0KPiA+IEkgdGhpbmsg
d2Ugc2hvdWxkIHRoaW5rIHNvbWUgZXZlbnRzICh3aGljaCBhcmUgU2h1dGRvd24sIFN1c3BlbmQt
dG8taWRsZSwNCj4gPiBTdXNwZW5kLXRvLVJBTSkgZm9yIHRoZSBQb3dlciBvZmYgTm90aWZpY2F0
aW9uIGNvbnRyb2wuDQo+ID4gSSBkZXNjcmliZWQgdGhlc2UgZXZlbnRzIGxpa2UgYmVsb3cuDQo+
ID4NCj4gPiBBc3N1bXB0aW9uIG9mIHRoZSBob3N0IDogTU1DX0NBUDJfRlVMTF9QV1JfQ1lDTEU9
ZmFsc2UNCj4gPiBBc3N1bXB0aW9uIG9mIHRoZSBlTU1DIDogaW4gUE9XRVJFRF9PTg0KPiA+DQo+
ID4gMSkgRXZlbnQgIDogU2h1dGRvd24NCj4gPiAtIHBvd2VyICAgOiBnb2luZyB0byBWQ0M9T0ZG
ICYgVkNDUT1PRkYNCj4gPiAtIGlkZWFsICAgOiBFaXRoZXIgUE9XRVJfT0ZGX0xPTkcgb3IgUE9X
RVJfT0ZGX1NIT1JUDQo+ID4gLSBjdXJyZW50IDogUE9XRVJfT0ZGX0xPTkcgLS0+IFBlcmZlY3QN
Cj4gPiAtIFJlbWFya3MgOiB0aGUgY29tbWl0IDQzMjM1Njc5MzQxNQ0KPiA+DQo+ID4gMikgRXZl
bnQgIDogU3VzcGVuZC10by1JZGxlDQo+ID4gLSBwb3dlciAgIDogS2VlcCBWQ0M9T04gJiBWQ0NR
PU9ODQo+ID4gLSBpZGVhbCAgIDogaXNzdWUgTU1DX1NMRUVQX0FXQUtFIGFuZCBrZWVwIHRoZSBw
b3dlciAoYmVjYXVzZSB0aGUgaG9zdCBjb3VsZCBub3QgY2hhbmdlIFZDQz1PRkYpDQo+ID4gLSBj
dXJyZW50IDogaXNzdWUgTU1DX1NMRUVQX0FXQUtFIGFuZCBrZWVwIHRoZSBwb3dlciAtLT4gUGVy
ZmVjdA0KPiA+IC0gUmVtYXJrcyA6IElJVUMsIGV2ZW4gaWYgdGhlIGVNTUMgaXMgaW4gUE9XRVJF
RF9PTiwgYSBob3N0IGNhbiBpc3N1ZSBDTUQ1IChzbGVlcCkuDQo+IA0KPiBBcyBhIG1hdHRlciBv
ZiBmYWN0LCBWQ0NRICptdXN0KiByZW1haW4gb24gaW4gc2xlZXAgc3RhdGUsIHdoaWxlIFZDQw0K
PiBjYW4gYmUgcG93ZXJlZCBvZmYuDQoNCkkgZ290IGl0Lg0KDQo+ID4NCj4gPiAzKSBFdmVudCAg
OiBTdXNwZW5kLXRvLVJBTQ0KPiA+IC0gcG93ZXIgICA6IGdvaW5nIHRvIFZDQz1PRkYgJiBWQ0NR
PU9GRg0KPiANCj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB5b3UgdGhpbmsgUzJSIHNob3VsZCBi
ZSB0cmVhdGVkIGRpZmZlcmVudGx5DQo+IGZyb20gUzJJPyBBdCBsZWFzdCBmcm9tIHRoZSBNTUMg
c3Vic3lzdGVtIHBvaW50IG9mIHZpZXcsIHRoZXJlIGlzIG5vDQo+IGRpZmZlcmVuY2UuIE5vPw0K
DQpPbiBteSBlbnZpcm9ubWVudCwgVkNDICYgVkNDUSBjb25kaXRpb24gZGlmZmVycyBsaWtlIGJl
bG93Lg0KIFMySTogVkNDPU9OICYgVkNDUT1PTg0KIFMyUjogVkNDPU9GRiAmIFZDQ1E9T0ZGDQoN
ClNvLCBJIHRoaW5rIHRoZSBNTUMgc3Vic3lzdGVtIHNob3VsZCBub3QgZW50ZXIgc2xlZXAgbW9k
ZQ0Kb24gc3VjaCBlbnZpcm9ubWVudC4gSWYgdGhpcyBpcyBib2FyZC1zcGVjaWZpYywgSSdtIHRo
aW5raW5nDQpJIHNob3VsZCBhZGQgYSBuZXcgZmxhZyB0byBmaXggdGhlIGlzc3VlIHdoaWNoIGlz
IGVudGVyaW5nDQpzbGVlcCBtb2RlIGV2ZW4gaWYgVkNDUT1PRkYuDQoNCj4gPiAtIGlkZWFsICAg
OiBFaXRoZXIgUE9XRVJfT0ZGX0xPTkcgb3IgUE9XRVJfT0ZGX1NIT1JUIChiZWNhdXNlIHRoZSBz
YW1lIGFzIHRoZSAiU2h1dGRvd24iIGV2ZW50KQ0KPiA+IC0gY3VycmVudCA6IGlzc3VlIE1NQ19T
TEVFUF9BV0FLRSAtLT4gTkcNCj4gPiAtIFJlbWFya3MgOiBTbywgSSB0cmllZCB0byBmaXggdGhp
cyBieSB0aGUgcGF0Y2guDQo+ID4NCj4gPiBJbiBhZGRpdGlvbiwgd2Ugc2hvdWxkIGFsc28gdGhp
bmsgYWJvdXQgdGhlIGV2ZW50IG9mIHVuYmluZC4NCj4gDQo+IFllcywgdmVyeSBnb29kIHBvaW50
Lg0KPiANCj4gPg0KPiA+IDQpIEV2ZW50ICA6IFVuYmluZA0KPiA+IC0gcG93ZXIgICA6IEtlZXAg
VkNDPU9OICYgVkNDUT1PTg0KPiA+IC0gaWRlYWwgICA6IE5PX1BPV0VSX05PVElGSUNBVElPTiBi
ZWNhdXNlIHVzZXIgaXMgcG9zc2libGUgdG8gdHVybiB0aGUgcG93ZXIgb2ZmDQo+ID4gLSBjdXJy
ZW50IDogS2VlcCBQT1dFUkVEX09OIC0tPiBORw0KPiA+IC0gUmVtYXJrcyA6IEJ1dCwgSSBkaWRu
J3QgdHJ5IHRvIGZpeCB0aGlzIHlldC4NCj4gDQo+IEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB3
aHkgd2Ugc2hvdWxkIGtlZXAgVkNDIGFuZCBWQ0NRIG9uPw0KDQpPb3BzLiBJIHNob3VsZCBoYXZl
IGRlc2NyaWJlZCBhIHVzZSBjYXNlLiBJIHRob3VnaHQgb25lIG9mIHVzZSBjYXNlcyB3YXMNCnVz
aW5nIG1tY190ZXN0IGRyaXZlci4gU28sIEkgdGhvdWdodCB3ZSBzaG91bGQga2VlcCBWQ0MgYW5k
IFZDQ1Egb24gdG8NCnVzZSBtbWNfdGVzdCBkcml2ZXIuDQoNCj4gSW4gcHJpbmNpcGxlIEkgdGhp
bmsgd2Ugc2hvdWxkIHRyZWF0ICJ1bmJpbmQiIGluIHRoZSBzaW1pbGFyIHdheSBhcyB3ZQ0KPiB0
cmVhdCBTMlIvUzJJLiBXaGljaCBtZWFucyBzZW5kaW5nIHBvd2VyLW9mZi1ub3RpZmljYXRpb24g
aWYgdGhlIGhvc3QNCj4gc3VwcG9ydHMgTU1DX0NBUDJfRlVMTF9QV1JfQ1lDTEUsIG90aGVyd2lz
ZSB3ZSBzaG91bGQgc2VuZCBzbGVlcC4NCg0KSWYgd2UgZGlkbid0IHRha2UgY2FyZSBvZiBtbWNf
dGVzdCBkcml2ZXIgYWZ0ZXIgdW5iaW5kLCBJIHRoaW5rIHNvLg0KDQpCZXN0IHJlZ2FyZHMsDQpZ
b3NoaWhpcm8gU2hpbW9kYQ0KDQo+IEtpbmQgcmVnYXJkcw0KPiBVZmZlDQo=
