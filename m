Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A68235BDE3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Apr 2021 10:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237386AbhDLI4A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Apr 2021 04:56:00 -0400
Received: from mail-eopbgr1300125.outbound.protection.outlook.com ([40.107.130.125]:2848
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238105AbhDLIwz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Apr 2021 04:52:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKFzBdAScmn04k6Imw3YNDhmAKyqrBhK4BbrghuZJJO3PffbAsO8XbQlTcXimaDSeRhEG7ldgPucKJy7w/R5jYPOhmMHRyRvS3UDMCIU+62D9DI7dlJU3vOZik9XNP+KWbyIoyi8DCKM5eOeKlMzyyPER1Dw3rKQkeJFaYLxywrI15PAkNIZq0GTyNs4iBSLJvgvb2Ts48JnwMhXedNk8DTIhbiIq3djQccpLuedTtywJQir5vxG6YAKwAZBKzHR8JZVIjpGhoRSzRBWEeIGG0YFmSwm/0T6NvCb5Iai7R1Fe639d9R+JXHIdtvTUT2afOcwNlDj/KTe1dsEk5FPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8JCdA1lETvHFsMOqp2hAvfQZh7VzL1Utn6pnIZI56w=;
 b=BXJBtQCiU6mWtNEqZ8rvzAtbSiheEQ1qtANFRVeybo4OFpyvdGJmPSorHdBrMHhp3ha0Cwz2iL0b4BHHb59Olg3JAwRx63DM0WxtunNdoY52n2rA+ljT8qMcpUuXqeZgG0QhJ4cAbFZCEnyGdhs+SmxlO2TOp5cNMT+HyHIOyaAmCaFQE8cKpswVNMwwq+sP7auyYugpHyZBUPSp4Jj8FmNb4tRmHeHtmf+cxPTeLjkF2YSnsQwQ/hTvx+YxKqAyr2l/WaX/hoDjsCjqpGjV6MrLQC2JpBP53cBUXoG912y28snEdvWIRUPlTnveyBuBEyBcq7kk6vOcvwqXiCtl3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8JCdA1lETvHFsMOqp2hAvfQZh7VzL1Utn6pnIZI56w=;
 b=bVu7FbWSQfnSD3NUGU8BUJ5ffHG/L88eMgafbVK9fYf3OgSYp5v8F2uaDlFpKpyTRWAi3XgTPI6mvZtZa2D+tfEM9aAJ5gJ/N3kvCLundbhmkoxKSINMPs0GMKYImqHCX27VRFMA756BeQ662G5M5htDh8DKtSqwcw/i7uN29bk=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2346.jpnprd01.prod.outlook.com (2603:1096:404:6e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Mon, 12 Apr
 2021 08:52:34 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349%4]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 08:52:34 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Ulrich Hecht <uli@fpond.eu>
CC:     "wsa@kernel.org" <wsa@kernel.org>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH] serial: sh-sci: correct units in comment about DMA
 timeout
Thread-Topic: [PATCH] serial: sh-sci: correct units in comment about DMA
 timeout
Thread-Index: AQHXLRntrh8Gv0OgbkS+n0L/AKIa2KqsF3DQgABCcICABA7DgIAAIggAgAAM3LA=
Date:   Mon, 12 Apr 2021 08:52:34 +0000
Message-ID: <TY2PR01MB3692F83AC9CADFD4641B1E66D8709@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210409082524.3480-1-uli+renesas@fpond.eu>
 <OSAPR01MB3683F5855937833872F4FE23D8739@OSAPR01MB3683.jpnprd01.prod.outlook.com>
 <785709679.143677.1617984277200@webmail.strato.com>
 <OSAPR01MB3683AE83C298C792F4DA3344D8709@OSAPR01MB3683.jpnprd01.prod.outlook.com>
 <1395082345.239625.1618214658794@webmail.strato.com>
In-Reply-To: <1395082345.239625.1618214658794@webmail.strato.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fpond.eu; dkim=none (message not signed)
 header.d=none;fpond.eu; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2231066e-b48b-4379-8d76-08d8fd9050c9
x-ms-traffictypediagnostic: TY2PR01MB2346:
x-microsoft-antispam-prvs: <TY2PR01MB23469D1D5C5748573C9375B1D8709@TY2PR01MB2346.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OKQdDA4d7yM8e2m9OEI6PUbKKwY3KELjRiJxA4sohvdOtSQpHzk+9bBRnyir21UEDjMsAgxy2uHf4MC3NWr3li39lhUgjEYH2GhhUZt28MOFnXivdf4ur1EkV9R//HxOTHaHJWU+/c+9HnMolryDYUS/sYVVD8aP9YDK7+68xN8fKUJjMqBaId9UAINXih65ypQA+BFK+nzcztzGqkihJ97W3dtNk3AqeXcmIXIk8TKS/YgZhR5fY8W9KBvRwcmGLA3JeSCwq02YYL/qB4hjQKKvPt0zAU8V7F6AcobWgpNGJSEq7AmhUk7eFHqPBa6M+zoTIvapofQtvA7Q7LATa+3c4KMKo5VqeXNUBV/He4xMJ/MxLX9ccBhiQKudrR78obJWdELds+P+m90Q897O/V6up1uQTQpfTffXoe3zEq49TAnW2nTL18fLI46Z6P/lzcluESEMf7cD3BEf2CpuEeZN/vOqjcBD3Zu2VvaJYLBzm2QX2QfE70WLKGP/PxWMY9B4EDorKq/205uxhKnUkd5vyuJ7usIjIRMvQj8PKCKGfIm3pwqDfbwbgNM3aMP+NA8cyH/W1gaAEVITlhkmLQGpnfgMyL9NEKk5UQ1l604=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(8936002)(316002)(33656002)(26005)(38100700002)(52536014)(8676002)(9686003)(54906003)(5660300002)(55016002)(4326008)(76116006)(83380400001)(86362001)(478600001)(66946007)(71200400001)(6916009)(64756008)(66446008)(66476007)(66556008)(53546011)(6506007)(55236004)(7696005)(2906002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Sm5XVWFYbC9PREFwQTZvN2FZVFB3bkVQN3grTlFGQktOTWZRUjRYSkdUMUNr?=
 =?utf-8?B?STR5UlUrclB2eTBvSDYwSStKd3BKUDBtL25ySjdpZmEvcm02RnBNcHZLSE1p?=
 =?utf-8?B?OG8zb2dLZnhOd0xXNkovMkg2SVZ5TzB1SS80WmtUZUlaRURsNzFZUEhKNDIv?=
 =?utf-8?B?REhmYk1iYVJERHdhUm8zbUlXWDVuRDlCZDVTZHhnZ1Iwck9FOGFMNGE3UHpW?=
 =?utf-8?B?czJCZUlNNy9wMytxcjZmTDlaMWxER1RBaWxBaWVpdldiRFBwV0YvZCtoM3Vm?=
 =?utf-8?B?TVluUGNBT1YzbVFiS1ZyaXdwekU5aWthb3RTWkk2eU13citIZmZoL2tneXBh?=
 =?utf-8?B?WnYvUngydlBKSVVySlRoRmZpMzc2alQvUGtKN0VBOC9oMXdJWFpRL3FZTGdB?=
 =?utf-8?B?Wjk1aVZUSm5lYlB6YllNMVRxOWFlMXFpSmhTd2lRbHFQZy94TU1tNUJjTDJt?=
 =?utf-8?B?TWtSZXNhSnRNZjFSUjAzYnNvTmk0V0dWYk9tcWpsVTk4WVhKai9JV2hwZWpj?=
 =?utf-8?B?SWYzQmpqL2ZtY0RWNTNLL0Q4ckdyQTl5SWNTSTI4R2tWK200YUo5OXlwUFFB?=
 =?utf-8?B?QVNlQ2hDNkhMQW5JR1ZoMlppbmhVNnlqUVA2anZxREZ6N1JQQ2FpVENnZVJ1?=
 =?utf-8?B?a0N0Y3U0dkZUYzhlNmkySkk3U1VBa1UraHA2eUFLTDJuZVA5bkR6V05VRU9Z?=
 =?utf-8?B?QWE2enVWbVBKekRmK2U5NGFsVHVLd2lPT1czT3Bad3duOU9rU1ZkMmE0NnV0?=
 =?utf-8?B?V21QU29IcW8zUWJsY0RUL1cweHEzeUxTNFVySVlrRWlLMThmdW9zN2RBVDQ2?=
 =?utf-8?B?Y2hvZVczTUh4QkZKMHNESzhQMHU4Q1JJZStpQkZCQnBvUkFNa3AycEhPZUd5?=
 =?utf-8?B?YUU1UlliQzM5Q2lyT1Exem9rRk9QN3hYdXRxdTFwUUplZ0pwdmpSMGJHaEZT?=
 =?utf-8?B?T1h4dkEvYXdNMlRCdUs3c1NSTUR4cjFXYXpFNEt2c0RTem50NmZFckRDOGc5?=
 =?utf-8?B?Mm8yQkZkSlZxVnZDUDRsZHR2VC9Lb1ZhQVVTOHdzeGhJOTdWZ2t2dENXUVpw?=
 =?utf-8?B?OHRScUszSkEyM3NtMDVPZ1JMczFJWnZEN3ZXRHQ3VGtDUGZ4Q0JUcHVObXZH?=
 =?utf-8?B?MnhBck5qZkIreUM2aVVRblJBVDdQdHF2VG03U2kvdjZWR2FzbFRHU0l0bXBu?=
 =?utf-8?B?N0dxWmU4c2N6MGdOWGZhTWdPOXR5TjFoamN0VmtscnUrL01odmhybGF0dC9Z?=
 =?utf-8?B?Q2ZNRENVOXFsakpNODdpRGpIdG50NFl0VXNCUWhMUklFNEg0K251T2ZpVndN?=
 =?utf-8?B?Sk42NExYUitPeDdranl4UXJ1Sm9Da0pGT2ZNOGZUNTFwSGQxRVdXbFJuUHhK?=
 =?utf-8?B?SnV5QldmRnJ1ZFVwNk9VU3RtZUJDRnd2VHBqbmtPWm8vc1lxTTZUVDVSanlm?=
 =?utf-8?B?YXZJTTY1ZnRlbFpWZWtKcnkwMEV0bmcxMDZtc3VXeS93NHVGekxZOGZmS1dn?=
 =?utf-8?B?MHhNWXpNd1ZoUTRNaGhvZlFOQXJmeFNEUmRhZXFXZGlnVkc5SXRnUUsvSVp4?=
 =?utf-8?B?NzFYdGtHNmRZWWVVbERDYXNOZGNhdkNtRTNINktHKzgvSEprM0JRS1p4SUxE?=
 =?utf-8?B?cFdhMjJTalhVajZsci8rM0c3OUVrdEJsM0U3K25IUjA3UDNnSGRPQ0ZRNHhP?=
 =?utf-8?B?aTJ6NDhTcFlrV2h6N29LdjRoVUdjbDZMWmppd3JKT1BiczVrWEFhT1ppTEpu?=
 =?utf-8?Q?gNh0nehu+8YlDpd1k78ekFHn2Q9bT2LAI9rQCkN?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2231066e-b48b-4379-8d76-08d8fd9050c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 08:52:34.2980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nlNXWHJyR9DC/u7DYpZLQs+0RMSW3Z8Pilzlke16uUPCz0x6gGaWeUa+wwBlgiDESS+hxy8KJHmk1cVxMjzVpF5aMSTCqi1THm9T3Z4hORmF38FXobk3Yk8oR2Iq+keC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2346
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgVWxyaWNoLXNhbiwNCg0KPiBGcm9tOiBVbHJpY2ggSGVjaHQsIFNlbnQ6IE1vbmRheSwgQXBy
aWwgMTIsIDIwMjEgNTowNCBQTQ0KPiANCj4gPiBPbiAwNC8xMi8yMDIxIDg6MjMgQU0gWW9zaGlo
aXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4g
PiBIbW0sIHdoZW4gd2UgdXNlIEhTQ0lGIHdpdGggMTAgYml0cywgMzAwMDAwMCBiYXVkIGFuZCAx
MjggYnl0ZXMgRklGTywNCj4gPiB0aGUgcnhfdGltZW91dCB2YWx1ZSB3aWxsIGJlIHNldCB0byAx
NTM2ICh1cykuIFNvLCBpZiB3ZSBzZXQgcnhfdGltZW91dA0KPiA+IHRvIDIwMDAwICh1cykgYXMg
YSBtaW5pbXVtIHZhbHVlLCB0aGUgc2gtc2NpJyBiZWhhdmlvciB3aWxsIGJlIGJhY2sgdG8NCj4g
PiBub24gaHJ0aW1lciBzdXBwb3J0LCBJSVVDLg0KPiA+DQo+ID4gUGVyaGFwcywgZGVzY3JpYmlu
ZyB1YXJ0X3VwZGF0ZV90aW1lb3V0KCkgYW5kIHRoZSBqaWZmaWVzIHZhbHVlIG9mDQo+ID4gdWFy
dF9wb3J0LT50aW1lb3V0IHdpdGggMTE1MjAwIGJhdWQgaGVyZSBtYXkgY2F1c2UgbWlzcmVhZGlu
Zz8/DQo+ID4gSSBkaWRuJ3QgdW5kZXJzdGFuZCB0aGUgcHVycG9zZSBvZiB1YXJ0X3BvcnQtPnRp
bWVvdXQgeWV0IHRob3VnaHQuDQo+ID4gQnV0LCBhdCBsZWFzdCwgdGhlIGN1cnJlbnQgZHJpdmVy
IHVzZXMgaHJ0aW1lciB0byBpbXByb3ZlIGxhdGVuY3kNCj4gPiBmb3IgSFNDSUYsIHRoZSBkcml2
ZXIgc2hvdWxkIG5vdCBzZXQgMjAwMDAgKHVzKSBhcyBhIG1pbmltdW0gdmFsdWUuDQo+IA0KPiBO
b3QgaGF2aW5nIGxvb2tlZCBhdCB0aGlzIHN0dWZmIGluIGEgd2hpbGUsIEkgd2FzIHVuZGVyIHRo
ZSBpbXByZXNzaW9uIHRoYXQgdGhlIHJ4IHRpbWVvdXQgaXMgYW4gZXJyb3IgY29uZGl0aW9uLCB3
aGVuDQo+IGl0IGlzIGluIGZhY3QgcGFydCBvZiBub3JtYWwgKERNQSkgb3BlcmF0aW9uLiBJIHRo
aW5rIGl0IHdhcyBpbmRlZWQgdGhlIHJlZmVyZW5jZSB0byB1YXJ0X3VwZGF0ZV90aW1lb3V0KCkg
dGhhdCB0aHJldw0KPiBtZSBvZmYuLi4NCg0KSSB0aGluayBzby4uLg0KDQo+IFNvIGlmIG15IHVu
ZGVyc3RhbmRpbmcgaXMgY29ycmVjdCBub3csIHdlIHNob3VsZCBzY3JhcCB0aGUgbWluaW11bSB0
aW1lb3V0IGNvZGUgZW50aXJlbHkgYmVjYXVzZSB0aGUgY29uZGl0aW9uIGl0IGlzIHN1cHBvc2Vk
DQo+IHRvIHByZXZlbnQgY2Fubm90IG9jY3VyIGFueSBsb25nZXIgZHVlIHRvIHRoZSBzd2l0Y2gg
dG8gaHJ0aW1lcnMuIERpZCBJIGdldCB0aGF0IHJpZ2h0Pw0KDQpZZXMsIHRoaXMgaXMgdGhlIHNh
bWUgYXMgbXkgdW5kZXJzdGFuZGluZy4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1v
ZGENCg0KPiBDVQ0KPiBVbGkNCg==
