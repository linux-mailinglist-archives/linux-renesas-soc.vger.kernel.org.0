Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B07B4147776
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2020 05:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729827AbgAXEMg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jan 2020 23:12:36 -0500
Received: from mail-eopbgr1410125.outbound.protection.outlook.com ([40.107.141.125]:6931
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729641AbgAXEMf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 23:12:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1Rhf6rDqxTo3CRY0e3G+Uy/Jql8fMt2ZtWiMUIsaRvJr8kLPHyRIgCPLZ5AzAQXNJpEnlYxX7uSsIxVak2L7gX3Yv9Uih81YXOTUrcARQxOgHKoAKBFjhPd1tu9kBCT0KPZNBK7XMqMaz9JpaknagJ5p5oOdFzrF83Y7PtUQu3ek0jLHv7jW4yfSoBo8IVh4J9gi+WRKCqkdzts9U/HEgf1HaYuUfSs5YMJj7SR+qSlojP0odGhxBVlEGLvL1JVULS1x9f/wBfZ8cnJMMnu/MP5ddfCakqqkIM97xz2T7boaTIx03V05xO9ZReV9jBdRAxlaWxb4IiqZ0R3NSjQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qclDkUi//48yzdK81mQY4Z9xEogzn/P6lW6B0dkR4c=;
 b=ZiH2Cw2gFGUsDda8Ga5AD/apaRqLvR08KQA01dStgn8Yu1egiIZkhZgTPudgDnJEMAwqnfgoFvdBQPkLo14mbndKJ7pW/yeyXLDQUvEqPDFlYSaB5D9nN8PNQ0FDZPgUXshKY121jpfhJiFHceoZLNuK8mHYZ86KyFp97BO04b4PM4Bc+y9vB9PIsXLvE7QGc+eP/H6qmIniaAZoE1Fs/XrOnLG5eclANMq7KbNt5VxGCvzFXGW9Vji5q+kOdBLyXyiPtuwrkfsAZg5LVbsd14aPQEyIUssSVc/qrWBAtSiA9XWowwvpDg8MT8e+xl4zJB3A34AOMn901M5pSj+0RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qclDkUi//48yzdK81mQY4Z9xEogzn/P6lW6B0dkR4c=;
 b=o9kKJTeWjfleQw0R7a3HBfqRVyKhnphLAbdoSq3WBeAczPjFBhNSpQBKttOKO0RuVBPkTFolq56sTTF0cgEuIsbnsTRPxeb6HGJ43w1LuuRWRhaxI7bk1dO92jzdQxHg6QYtl+dl8WdSne9p0ZTA67mXXJHaFOXKVFWyGG8nWIU=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4846.jpnprd01.prod.outlook.com (20.179.186.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.21; Fri, 24 Jan 2020 04:12:32 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::318b:31aa:4212:bd49%7]) with mapi id 15.20.2665.017; Fri, 24 Jan 2020
 04:12:32 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Tony Prisk <linux@prisktech.co.nz>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] usb: host: ehci-platform: add a quirk to avoid stuck
Thread-Topic: [PATCH v2] usb: host: ehci-platform: add a quirk to avoid stuck
Thread-Index: AQHV0eWnau2SnovLYkCRv0gNW3Qw46f4P9eAgAD0h0A=
Date:   Fri, 24 Jan 2020 04:12:31 +0000
Message-ID: <TYAPR01MB45443172A8C024BAA509F682D80E0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1579781234-2084-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXqVFOO=D6AgzBmfW3SPYfGa-sBdZ4a+4nJZD5tFNDcWA@mail.gmail.com>
In-Reply-To: <CAMuHMdXqVFOO=D6AgzBmfW3SPYfGa-sBdZ4a+4nJZD5tFNDcWA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b97f02e2-9296-43dc-36f8-08d7a083a250
x-ms-traffictypediagnostic: TYAPR01MB4846:
x-microsoft-antispam-prvs: <TYAPR01MB4846626E4E7205BB2E5F6FADD80E0@TYAPR01MB4846.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 02929ECF07
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(199004)(189003)(2906002)(5660300002)(7696005)(66556008)(66446008)(64756008)(66476007)(6916009)(76116006)(52536014)(66946007)(71200400001)(54906003)(26005)(186003)(316002)(478600001)(55016002)(6506007)(9686003)(33656002)(4326008)(86362001)(8936002)(8676002)(81166006)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4846;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G1Miro+bFtcbPLfRz+mZ/S+4qVad228bo8UzBTzSY+pg/TGar1qENofBiLQGQS/G+YW8DTHWYsitbBkFRhvIkUUEr/2mPn4Ozo6luVErVC4pChMgWMeE+61MVkczplvhu6G/HJN+AsGlqbIvqlhqbrY30gvJCOPq+tMQg9olX4qFsAz2y40wpdHZvIzpO0aq5nFxARZSYPKjVCAbz/WPlrR2YTeP05w7uerJ2xUxXhe1RIRiieJXTb9m2+3bIrw2HNAO8WNZ5GO4vLtht+10/4AQ/oeNzoqYoTMzouJsV4f5nc2ThthdUoQ9AxkxaqPmRwm94awkUgV4AkPw/LqrMNXAM4HDEW825ME7kDk3L2iVwY6Z7A7o/NUj4TFTSCkGNqfsPU5BRB3vwJXVCunvIdaEtgazGZJkL4VFIzHQPn0Asy/GDDA15pKH8Vnsf+D4
x-ms-exchange-antispam-messagedata: xz6pfhmrOOxnxNKdNxGdpozfv0eYiQIaZ1ICgZnCz/3Y1ZKa4fqa6sp7XeqUhQnHFghj1E9WbYc9g5f1vuO4PyEWjV90rXs5bdAH9unAixpNQyi0bWl8GA71T0cllUqUKkJC9kOpZzwMWc6TwkYASA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97f02e2-9296-43dc-36f8-08d7a083a250
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2020 04:12:31.9361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wztDv+66BduVnB/Dml7l4tYFkNtLBCel0w6fze4AFueFwjpngw7J+KpHd+FfF0ygFam55UFqCadQz1cvnkhKmn/11n5EXBP1qcN2RblELTOB6lJQuF3Ij+MfWQIkoQBu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4846
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNkYXksIEphbnVhcnkgMjMsIDIwMjAgMTA6MzQg
UE0NCjxzbmlwPg0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QvZWhjaS1wbGF0Zm9ybS5jDQo+
ID4gKysrIGIvZHJpdmVycy91c2IvaG9zdC9laGNpLXBsYXRmb3JtLmMNCj4gDQo+ID4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3Qgc29jX2RldmljZV9hdHRyaWJ1dGUgcXVpcmtfcG9sbF9tYXRjaFtdID0g
ew0KPiA+ICsgICAgICAgeyAuc29jX2lkID0gInI4YTc3OTUiIH0sDQo+ID4gKyAgICAgICB7IC5z
b2NfaWQgPSAicjhhNzc5NTEiIH0sDQo+IA0KPiBBcyAuc29jX2lkIGlzIGRlcml2ZWQgZnJvbSB0
aGUgbWFpbiBjb21wYXRpYmxlIHZhbHVlLCBpdCBpcyAicjhhNzc5NSIgZm9yIGJvdGgNCj4gUi1D
YXIgSDMgRVMxLnggKFI4QTc3OTUwKSBhbmQgRVMyLjArIChSOEE3Nzk1MSkuDQoNCk9oLCBJIGdv
dCBpdC4NCg0KPiA+ICsgICAgICAgeyAuc29jX2lkID0gInI4YTc3OTYiIH0sDQo+ID4gKyAgICAg
ICB7IC5zb2NfaWQgPSAicjhhNzc5NjEiIH0sDQo+ID4gKyAgICAgICB7IC5zb2NfaWQgPSAicjhh
Nzc5NjUiIH0sDQo+ID4gKyAgICAgICB7IC5zb2NfaWQgPSAicjhhNzc5OTAiIH0sDQo+ID4gKyAg
ICAgICB7IC5zb2NfaWQgPSAicjhhNzc5OTUiIH0sDQo+IA0KPiBJbnN0ZWFkIG9mIG1hdGNoaW5n
IG9uIC5zb2NfaWQsIHlvdSBjYW4gYWxzbyBtYXRjaCBvbiAuZmFtaWx5ID0gIlItQ2FyIEdlbjMi
DQo+ICh1bnRpbCB3ZSBkaXNjb3ZlciBhIGZ1dHVyZSBmYW1pbHkgbWVtYmVyIHRoYXQgaXMgbm90
IGFmZmVjdGVkPykuDQoNClRoYW5rIHlvdSBmb3IgdGhpcyBzdWdnZXN0aW9uLiBJJ2xsIHVzZSBz
dWNoIGEgLmZhbWlseSAodW50aWwgdGhlbikuDQoNCj4gSSBndWVzcyB0aGlzIGFmZmVjdHMgUlov
RzIsIHRvbz8gLmZhbWlseSA9ICJSWi9HMiIuDQoNCkkgdGhpbmsgc28uIFNvLCBJJ2xsIGFkZCAi
UlovRzIiIG9uIHYzIHBhdGNoLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0K
DQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2Vl
cnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGlu
dXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJw
cm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
