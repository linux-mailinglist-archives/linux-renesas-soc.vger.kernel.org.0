Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1C332D74C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 12:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395023AbgLKLgD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 06:36:03 -0500
Received: from mail-eopbgr1410124.outbound.protection.outlook.com ([40.107.141.124]:41510
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391879AbgLKLgB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 06:36:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKJzkKUugiItIB3EthrbydCJZxPTdlk++THwhH4ffWLGamSF3aIBCJfgLOhw0J71sx9iKRbA/1wALQ1AZl6VnKsVNv2S1CE8HjYkhKQTFaUplnsJ0E4ECaVNzw5zA/ts9GNytvq66+Dq1u/xp4AhrxSuvnt2RNJvGEd37lVcfgLzLA+xTzd8qDMea0rbTRADxkPyPJJ/hHd9jTb0NORSCTygnF7AY1HolgzOOhft5Id0hGcTKCcF7mUwQ8EsXk+dP98/s4rjfdjRtoaUjxrqjL22TFIVNMkEgtqTbkoXX9DEAUA29uy5vJ8CnHrx9havdGn0gg6t8LWZOcZaed86Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/Dg2A5ZPwLlO++czMtg6VrYpjyoWo5PKeQDw82rpfc=;
 b=OQn41thK9OZglEPZV1ZrNBB++kcsSgzW65+yxlVkq1h5sHRwfDsIeV4HAHEeZ1S/fiH7PGKVeAZkrC2KI6PeoCeaKk/1ajcQGaoZNqFhKpCCgzomTNoS0gpGLJBG30CtmJgTWo7mjWjE4vuompbix9qxmqQavNbSVp0vxw+i2lSf98yjo4MS3aE1Scpt7qLh9U1E49w0OL19CIH+BWgI+urfapXTIhoCGm58zE2Nhu9RF+ZtYMdWfbu1qwUhBKlieoXddVIqVYeA2mg5A40ca1iaSxXjR4DMPiBJOTVlpukU8/rDOw1gjahdE/yUa89Y2cJgKLFW8u9Ej5QW4iIhaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/Dg2A5ZPwLlO++czMtg6VrYpjyoWo5PKeQDw82rpfc=;
 b=sMvMjPGL5N+/CCtFql523CQK/TPeqYQIw/xOaDxftIbgcP5PKeHO4qEZ009sHbTn6LlvS1eJ0SjbDB368Fix/pFivQ1XFBPHYMD2pQsbnKaZQXKGgetpQ3+fRRih1uQtUQIBCBc2agL4AEbG/CoUQRDcd/3qi3KbwrAeVjA5JSY=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5386.jpnprd01.prod.outlook.com (2603:1096:404:803f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 11:35:11 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.015; Fri, 11 Dec 2020
 11:35:11 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
CC:     "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHWzTi2AvmFiRi710Seq6CPF4SJ96nwAm0AgAAjrsCAABZigIAA1GvAgAC3auA=
Date:   Fri, 11 Dec 2020 11:35:11 +0000
Message-ID: <TY2PR01MB369280691E2EC3CA81E8A68BD8CA0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607414643-25498-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <2916e43d33fd13c88d983d7e8451a41ec3bf9e31.camel@fi.rohmeurope.com>
         <TY2PR01MB369226B2FCFB1E6C91E2EFD5D8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <f7ba498de609623bf2df9e43cfddb7b92d699238.camel@fi.rohmeurope.com>
 <TY2PR01MB3692AE9149111BDD1A36F712D8CA0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692AE9149111BDD1A36F712D8CA0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none;fi.rohmeurope.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:3194:a3e8:9b43:51cc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 27883e43-6b83-4cbf-d91b-08d89dc8d1fb
x-ms-traffictypediagnostic: TYAPR01MB5386:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB53862C91360229E32013671BD8CA0@TYAPR01MB5386.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BW73nNyDK+a0q2fJiOt04PZ5VzoZdKnLRV189knNwZYz4nBeTsk5tju5R2Y6u0VtZDoly24E7ASEmp9ANd1qias4e2OWPi/ufM5XvytTkt4GrCdAx4qjCnSXKo2reDd38Faaj3Uo18RWLOvr787P5CRzeBX/cJmfM+sQzc2v2mx0SD2rrk/b3YqpBBVle2XSzihCZTOaoJWYJsXEkZSmRj/JzINZ2nhVXak4ylT3nXfFN8xilSgIKrmYDqsLQfCyjVtLAXgNARqLKECWg/rsDW9U+SBk1JptV9Fsx4qU2JXBd88SmFVBKZU7DKC/sZrV6bD8p/2nlr7Hw9JEKQLxRg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(52536014)(6506007)(66476007)(86362001)(71200400001)(186003)(4326008)(66446008)(7696005)(64756008)(5660300002)(66556008)(2906002)(4744005)(33656002)(316002)(2940100002)(478600001)(9686003)(54906003)(8676002)(6916009)(55016002)(76116006)(8936002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RmN4QjR3MkxlWU9QRGRlSFExWmVZQWc3dDI2ZjMzeU41OWxHUktYTUp2R1dE?=
 =?utf-8?B?bEJhcWxYTnNqYzRNTlR5amZ2dkFOditZSmh0a0liRHNRUUVKUzFOclhZZm12?=
 =?utf-8?B?N3FtQ05oOHpNWGVvSWZrQUNKNFlzR1JlSmtRQUMrc2djK2JhWWF5aTNyVnd0?=
 =?utf-8?B?OGx1MFFXUTZtUWxVZTRKSjVHNTFWUndBdXlacXVMLzF2eE9HeDJwR3hseDFQ?=
 =?utf-8?B?d1NDVStYTWlHNEtlNWZySVMzaFIrMHJxa2JVbUJBalhOSmVYOHUrTUhtUHl1?=
 =?utf-8?B?T3ZqcTE4bFB0Q2ZSNWxjelg2ZisxSmxsdytacFBaL0xnclptdEt6YzQvU01z?=
 =?utf-8?B?QVRNc2c1Z0p2a2xQMFBvN09URE9EZWFlMWY3SFMzVjRxVWF6QjdpYXhvZVlF?=
 =?utf-8?B?ZTR3QlFyQ1Nub0MzZ1U2UTRsUnY5cTJ2RlR6R3BTK2FZclJyWk1ZRXcyLy9r?=
 =?utf-8?B?VGJYWHBSdDRyUTlDTTJUc1Brb3k0SURZL1NBYjZCSnF3RkRmQU9BOXl3MHlj?=
 =?utf-8?B?TjJ4WDRscHRkaFAzTnV3c3M2TzVmRklKWWZoNm54Y3BSb2VJTDQwQ1g0YlM1?=
 =?utf-8?B?Mysvc2JoVjhUdWdHRDZSU285bkdPNDlZMk5yT2NIQnBSdU95eStHZllpTUdn?=
 =?utf-8?B?TFJRYmFBc2tjNVdCL1E0N05vM3ZJZVhhQVhjSi9RWVltdjAyRXNxdWYyUmVv?=
 =?utf-8?B?a2RFWk1BbU1uSyttNklINVR6bjMvYmxpZGFNaGpHQjhsM3VzV0kyRURmaU52?=
 =?utf-8?B?aWV2M3JZMVFwU0VRZFFoRDMvTjZ2blFVU1hVOXRhUDYyWVBTWDZGdHhmOWFK?=
 =?utf-8?B?UTR5ZFFKYTBBKzEzUXY0RGh3eHNlY1F0ZFg4akVHMjQvbHQ1eFBWd2xockJQ?=
 =?utf-8?B?YW8wV3ArZm9iUVB5bXBjU0lNZ3E5QThLVUFOdXllRDNJRnI2SjVxU1JUaXM3?=
 =?utf-8?B?YWxNQUNCQkRQSHBGa29tck5xN0xFWXI4RGxpQms5UVNMYUxPdnFPQk50bnY3?=
 =?utf-8?B?Q01hQXFQR0E2bjJ0K3oyWitvZWJ0OUJCdXdkWTkxVE9DM1l1VDBjOGVlaE5y?=
 =?utf-8?B?b2pIU0svdmVLTk9rRE15YUg0cEJTVTc4ZVFjL1NxNjVabTZBNHozNDlMYkJt?=
 =?utf-8?B?Sjhkb01PR0ZSbzJXb01ObGVVeTVTVXgvVXFJbGswdWVKVzU0dWh6cWt0U1BM?=
 =?utf-8?B?eXFlUkpOUjhzKzFwT0QzWjhQR3JaZERaZURzY1hqM21rclhEK0w4dXVGRlZG?=
 =?utf-8?B?bEZGZWNIK3RzVk9MZFcycEl1aWZEQUh3OUNoMjlRanFDemdxcjFFcEVwSU1o?=
 =?utf-8?B?bXF0Y2dMQzdnS0p4UE94bEloelN3NDFiaGlqQ09WSE1aSGhwbE1lc2tUR3Zm?=
 =?utf-8?Q?d/nclmcxRYGeiWvFawpUE8qEljE3mdAk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27883e43-6b83-4cbf-d91b-08d89dc8d1fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 11:35:11.4158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QrHPA9Xe0Jg4O1Qos3PY/6afo98FlKxqLmkY94hsus4rOc7mxtuCMkz3UhxUeaGReAudEMX75QCzmNRa8e9x3rf0YwTYGsIONnSSY8vMBW6VlCCE+jNwvXESCBpYkshN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5386
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgYWdhaW4sDQoNCj4gRnJvbTogWW9zaGloaXJvIFNoaW1vZGEsIFNlbnQ6IEZyaWRheSwgRGVj
ZW1iZXIgMTEsIDIwMjAgOTo0OSBBTQ0KPiA8c25pcD4NCj4gPiBidXQgYXMgSSBzYWlkIC0gdGhl
c2UgYXJlIG9ubHkgJ25pdCcgY29tbWVudHMgYW5kIEkgYW0gbm90IGluc2lzdGluZyBvbg0KPiA+
IGNoYW5naW5nIHRoZXNlLiBFc3BlY2lhbGx5IHNpbmNlIHNvbWUgb2YgdGhlIGNvbW1lbnRzIGFy
ZSBtb3JlIHJlbGF0ZWQNCj4gPiB0byBjaGFuZ2luZyB0aGUgb3JpZ2luYWwgYmQ5NTcxbXd2IHRo
YW4gYWRkaW5nIHN1cHBvcnQgZm9yIHRoaXMgbmV3IElDLg0KPiA+IEkganVzdCB0aGluayBvbmUg
bWlnaHQgYmUgYWJsZSB0byBtYWtlIHRoaXMgYSBsaXR0bGUgYml0IHNpbXBsZXIgOikNCj4gDQo+
IEkgZ290IGl0IDopIEZvciBub3csIEkgd291bGQgbGlrZSB0byBmb2N1cyBhZGRpbmcgQkQ5NTc0
TVdGIHN1cHBvcnQgYXQgZmlyc3QuDQo+IEFmdGVyIHRoYXQsIEknbGwgdHJ5IHRvIGNsZWFuLXVw
IHRoZXNlIGRyaXZlcnMgbGF0ZXIuDQoNCkpGWUkuDQpJIHN1Ym1pdHRlZCB2MiBwYXRjaCBzZXJp
ZXMgd2l0aCB0aGlzIGNsZWFuIHVwIGJlY2F1c2UgdGhpcyBpcyBuZWVkZWQNCnRvIGF2b2lkICJz
dHJ1Y3QgYmQ5NTd4X2RhdGEiIGluIHRoZSBpbmNsdWRlL2xpbnV4L21mZC9iZDk1NzFtd3YuaC4N
Cg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
