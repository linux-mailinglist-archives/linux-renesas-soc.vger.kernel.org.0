Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD842D178C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Dec 2020 18:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725918AbgLGR2R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Dec 2020 12:28:17 -0500
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:45504 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgLGR2Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Dec 2020 12:28:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1607362095; x=1638898095;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GaPjgrrhvr9VO2logPYb2TtfMFqtQc4wc2xmo5xzGXw=;
  b=SbDcaOvSTab+u6sKeyuSz/Qqc+8UiVM1YMzwa5L8tNqXxaVc/Usew1Mx
   t+/l6YXnSaCy3MqTKtJMB8EjjaYdtJR4HSkGXSZYSSiv9p7tnCmWO6Zyi
   X6P0KbsoDdOXby+tBiFzefV7P3+iDxOvqbB0yXYtFLP0co7LHkSglbEOy
   gNTn8RFynu6EdDRXia2Zj0wxBJs6RkDM+2GYkrLGC3wihEQ5q/w60M1yK
   oWcZo7ZG3kCfZX2rVZRPIr3iguXXXmlQajRD4Isy2xqIKJK2p4xihacVy
   j6y6AMwLAEDBbp2Nkcqhx+cIMQKOwy+YwUsNBNIdT9q82VdULfrVL1oi1
   w==;
IronPort-SDR: XXKrXxYd5wglcYCU2IYxYibMUHf48nDhIdePJUjzkOT0JsG9nBwr7K1eT1j0VdmNLbFxhVIMou
 uZij6D2k03D77kk9Ia1RsxIBqaVT+nQG2DnLU+hI3nL3bzBlrWdocSlm0MHUsi9KONHUiUyqL1
 rZx47bat4ww2qjSNO6QEREZ+KHI5FRwyMKm2lhUyQIVXjQFELHSD5ziDbj+jUTZ+PiZKgoc9V7
 bDUJMishvPKm2DPK2Ohv5AtG7XrxcWfxJsCp8+wnXDvlBcspGHwKd8+YiZEM1yhMVpRl4Fib6e
 pmo=
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="96160887"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Dec 2020 10:27:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 7 Dec 2020 10:27:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 7 Dec 2020 10:27:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8FZ2gtKN3UmUiz4bRu4QyAz8PbYBkr2qF5baqSa3ur5KLyNdheGx/IMoG8YggMfpX0gvvTIdP3/8bQNUBlVjEkMhvdM8dXYs1VmFRQJFhMArXVmcbq2i048SQIYSVUWifWk9AGYlGjzXe626pF0ePVkwDeHUHW+BmB4bfPKREjRavkPFt9Dni61udfvdkGswv4kf8O5NkE8vJCO9KPT5Bo/Ejg06i4oD3jW5hWEQ6bJ15+sfb04dzlpjTLCzKeNLipZQaUf4b0K3FSUJfIsOmMUl5wo2L4ZWNRxj9YtSTm3MobkFhSyHHK6xjmxJRyV8rvS3bK6GCNTfOXmP6ZE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaPjgrrhvr9VO2logPYb2TtfMFqtQc4wc2xmo5xzGXw=;
 b=RaZOVR+qfOe5GBOYYR4bpTcqOdVffKUvgqiRiOQpqpwF30BPI27uUQiDXyLziBWAhOV03+4i6GVSsqS7WNiRH8x6joWuFuK3a/qGI4cmKMVChA5INIhsJQSg9oOGjNV8zYQUuZd8Psuh7FACWT/Tg9Ko8jJD82tqJUyy7PMXjcXjPkISbkvyg1j4inHcxMMKt7kzhRZ70KbkmdNfGz66ZOIIAGnyK4Jfp2QHLTbfrE+yXoi+xWth1InEe4M+qWIIrnavPV41nPinarfzcyGlgyY/yNQciQN1E04wjOtaOmX6krbYbWfVevx3MQtP4dJm3MLIIZg0X9eOhKqENx7xAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaPjgrrhvr9VO2logPYb2TtfMFqtQc4wc2xmo5xzGXw=;
 b=njWgfDoUZy0++JVH2fCER6pa5mtdEiLEEaofKATVG9aG0mrY97oVFO3dO77yE1ZY1uBnS3y/QtfruO/zNc2H+7+BNKMJW2HO3PI750z3OxLCW9RfcaMV4Pb67nr+dnQo1DmesNev8dm7MpV1wav3uLVj+a676NP0HJnnradtRwQ=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3295.namprd11.prod.outlook.com (2603:10b6:805:c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Mon, 7 Dec
 2020 17:26:57 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 17:26:57 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <prabhakar.csengg@gmail.com>,
        <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: Add support for w25m512jw
Thread-Topic: [PATCH] mtd: spi-nor: winbond: Add support for w25m512jw
Thread-Index: AQHWzL4p6Et9E/t4BEqmXYdEaAmrdw==
Date:   Mon, 7 Dec 2020 17:26:57 +0000
Message-ID: <482d020e-bb1a-cf00-3f05-2bf26694ec16@microchip.com>
References: <20201016115549.31369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201016115549.31369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [5.13.1.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b91dfc0-dd7e-4e84-9286-08d89ad54c9d
x-ms-traffictypediagnostic: SN6PR11MB3295:
x-microsoft-antispam-prvs: <SN6PR11MB3295A6A07047886DB8ED41C7F0CE0@SN6PR11MB3295.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JqxAJJzsCTiGHiSj97JhWCqP00f1BbMFFKTLWNVznUZlJ/Ax6R10ed49+fOfrWj8IABQ1PJW7asgA507EmO/gqw15wsyXBpHgXtxXE7/AmyClUpHL7G0gl7/er7Pg+/p3b7aZI3REA1ovki6HomqEypn+fE21m5Bj2teVJIxCezCMdu2xFWpz7S4hgsW1j/IfALJeuZoPuIy0G53dfd/tVf50ya32NuUlO3q+SNhxW2RfHtxQu5v3kVsKzH2IQuQpjuR2NPa/JgEehspTecpsdsaPOXFpiIsGimZxunz5CYRiIqUFoL0GCr0EydOQDOa3h8Wtqn57hvfaarzBdmKlOX3iF1byQHaSMnYjgkqfJVYVWECHsO3DnttVAq5twK+6IpS5lBOuNzNnP0wqp2ndVVMsy7e2wiJu6BK/010gcxSgb230rYzmXFNXyudTytD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4874.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(39860400002)(366004)(346002)(396003)(5660300002)(4744005)(6506007)(66446008)(64756008)(36756003)(71200400001)(186003)(6512007)(53546011)(66476007)(31686004)(4326008)(66946007)(478600001)(6486002)(66556008)(2616005)(76116006)(316002)(54906003)(26005)(8676002)(8936002)(110136005)(31696002)(86362001)(83380400001)(2906002)(138113003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bEFLTmo0dlJlYkJ2NWpzVjhjZzhPSGpGNDhMRGw1ZUx3Z09kMFlSbUNTN205?=
 =?utf-8?B?Y2dSb2FNbC9JNnlVY3VVTTZJYVplblRLSEg1Z3JrTXZZSzVkOU90bVhOYWFY?=
 =?utf-8?B?a1oyK3RqSDJKaC90UVFCSWI5T3ZHRzdDR2k0MUUrZE9GMStLRGZZUnJ5R1c3?=
 =?utf-8?B?UmhCN0pZVUZpYnkxWXVRSTNNQXVBV2hBKzlnNGxpRFQxSGlwNndFS25xRWZE?=
 =?utf-8?B?dVZaV1F3Snl0bWNYWHduQ2R3bXZFL2hyMXgvckJtWmxETUw0M2UwRDkwZDdo?=
 =?utf-8?B?VTFiTCtZeFBWa2UrcXAwM25VSXlCYlRHd1E1OEVaYXFCQkI5V0IvTFNEQ2pm?=
 =?utf-8?B?VGRRSTJQVzVZOXVBYmF3Zi9PRUxlUGF5YWRwR3FKZlltbDVKMjdaSUJsQUVK?=
 =?utf-8?B?b0d6VHA3UFR4aUk3UXdKVUJwRGVJVW8xWTZSQjg0aEsyc2xJWW8vTnVNWm5E?=
 =?utf-8?B?Q041aENkRUZxWjdHbzlnbU9iS00xUjBnY2JwVzFZM3YyVzRMZlJZZzV3amEy?=
 =?utf-8?B?RHp1ZEdCR2lvT3FtUS9hZ1dWNHZBdzJ5S3JaT3VmRWRWZEJxaUcrdE1tQSti?=
 =?utf-8?B?c0c1d1c1NzdPejRVNCt3SVgyZGszQ3loM2hxbGlYenE4VFBOT2ZJV1g4dkRH?=
 =?utf-8?B?cFQ5RW1JTXhtT2NXTzJqaCtHb3puK3ZWaEtuWDdqc0piWnl1ZmF2cnZISVMy?=
 =?utf-8?B?ZXIxZXBkN2I0cTZHYmQxM09hNi9jQ2VFblNjUUlPeUV2YTdaU0VwbXZ6Rjd5?=
 =?utf-8?B?blhCb09aa2syK3lGRnMxU0NVM2VJRFpkME5IVDdjZlIvd3h3cE4zbTU5REQ3?=
 =?utf-8?B?djNDOVhYY25xZGlLRDNxQjJsWkw1TFVqNWVxV3IwQm92ZGZtNnVFQ0hsWEx6?=
 =?utf-8?B?UG9NMG1hVjB4TzZFS1creSt2R2ZMQmVSME8rQ2VBRGRCYVlYbTNTTTNlT2wx?=
 =?utf-8?B?RkhrUC92ZG5rK1lHTnVHUzhlNkVvWTI4WUpobEt6NVFVNEFxdmc2UmJBbkhG?=
 =?utf-8?B?OGZ3OVhXSG0yUEQ1RFBCL1lvYzJRZmlFd3UvTEV3ODBTTWxKTjhnYnVvbDRh?=
 =?utf-8?B?U243ZmFXUEpwd1N5bUl4YWljY0FqZkJhL1kwczl3aHAwKzVHZFJwZGVhWXVl?=
 =?utf-8?B?VG9iYTdHWW5BTjVJZ0JnS2YzUFdlWVB4emttekZLcmtHaGZrY0xOQ1pJbDAx?=
 =?utf-8?B?TW1nRktINUlsa2ExWXFnNFBPZEtyYW9nRWtjQWpTSGUzK0NXaWYxQWtLNWlF?=
 =?utf-8?B?Yi9vbGdNZGt1SkRFYS9Cd2FtUUJ0NWtyUWpMaGdLSk9hRTNsZS9LMU9QS1c5?=
 =?utf-8?Q?Ybl3scsriNf/8=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <60C2EFA5AB54674FA43D90F084F73861@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b91dfc0-dd7e-4e84-9286-08d89ad54c9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 17:26:57.5926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LdAn2o64iz0AZprNpFnIhFVMGUCoylETVaPLTlBu8Q7//d34MFgzuqKwieDP6o7q+WvNy9QTfMZyGCT8cEIePpDOaB+ydRrIi/LwFNLGsDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3295
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGksIExhZCwNCg0KT24gMTAvMTYvMjAgMjo1NSBQTSwgTGFkIFByYWJoYWthciB3cm90ZToNCj4g
RVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVu
bGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBUaGlzIGNoaXAgaXMgKG5l
YXJseSkgaWRlbnRpY2FsIHRvIHRoZSBXaW5ib25kIHcyNW01MTJqdiB3aGljaCBpcw0KPiBhbHJl
YWR5IHN1cHBvcnRlZCBieSBMaW51eC4gQ29tcGFyZWQgdG8gdGhlIHcyNW01MTJqdiwgdGhlICdq
dycNCj4gaGFzIGEgZGlmZmVyZW50IEpFREVDIElELg0KDQpXMjVNNTEySlctSVEgKDIgeCAyNTZN
LWJpdCkgU2VyaWFsIE1DUCAoTXVsdGkgQ2hpcCBQYWNrYWdlKSBGbGFzaCBtZW1vcnksDQppbnRy
b2R1Y2VzIGEgbmV3IOKAnFNvZnR3YXJlIERpZSBTZWxlY3QgKEMyaCnigJ0gaW5zdHJ1Y3Rpb24s
IHdoaWNoIHdlIGRvbid0DQpzdXBwb3J0LiBJIGd1ZXNzIHlvdSBjYW4ndCBhY2Nlc3MgdGhlIHNl
Y29uZCBkaWUgd2l0aCB3aGF0IHdlIGhhdmUgaW4NCm1haW5saW5lLiBPciBhbSBJIHdyb25nPyBX
ZSdsbCBuZWVkIHRvIGFkZCBzdXBwb3J0IGZvciBtdWx0aS1kaWUgc3VwcG9ydA0KaWYgd2Ugd2Fu
dCB0byBhZGQgbmV3IG11bHRpLWRpZSBmbGFzaGVzLg0KDQp0YQ0K
