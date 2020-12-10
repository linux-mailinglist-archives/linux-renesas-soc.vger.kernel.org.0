Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FEBA2D557F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 09:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730907AbgLJIbV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 03:31:21 -0500
Received: from mail-eopbgr1310112.outbound.protection.outlook.com ([40.107.131.112]:35273
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726439AbgLJIbU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 03:31:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXB6RMYMFQ043FvTHdfPHAkyTDv9JsmWgLSbkjembOq9PHDZ7zzB/LDyeBuPWHVIkwHGXHrfALuNDkf/FOlE5IeOfS7Wdr9LMp45nvulc1SorFnTY5WqdbSgzAaP9E9L3hLa/xmpPRNIWz6nqSiiErgb8vC5brfIEYBXmGWzKHgIxTlQPwP3NPQJLX05MDlXJexdCRPowGreeoLDg81dwNGEVKAFqV4olijn5mAs9X09w8S2S8NexzxLHA9sbOZlViPW41F6SFWdKa+uKyh2VU3CeMoM5G+/BVZCMrMNX+Q+T1qFM/KRqf2Tt6be6u9HhtABn7A9DEhjWEsMAEgiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qC8UY+ohCLLPaJSUpcbT0HDSvr3Jo1PzplCY5P2oX3c=;
 b=Kl1ngEnlnRKVJbTajI6KiD8I8fIhNmiNSoPsle5+FDsEexZlvFlBc+OVRF62kx198OUFW+IMIyUj93d7a8XsKMQdOdO+mKFF9/2c/GcZn0svMv995aTinWK7YIWMpIpHK3FqCQ7Y7OSqTPo8pR2InIfwOTFveEJxPtLslhhiOVGx/RFAC+WS1OyC7qyL6+8Jc9mcC0uUUW7KTucYYnbUYFU2vgOfXSjgi3wpXrsnAxU0x7ZsXDc/B7rBC4XeCjv9OwnF0+RzPa+qEbFM05nijJNRNlQLpvgtAaXAsLvv19VJpaYw4pgNJcccry0WBPdhkSsyK5Cevewpq2sg6Ua6rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qC8UY+ohCLLPaJSUpcbT0HDSvr3Jo1PzplCY5P2oX3c=;
 b=XXszB+mjGwVP/rvWpxm6qLF5sjQX5JwZhhjybToVhphVRd3NLJXF0kGklCZH3+lTKUlyXHw/saUS4McYLQzimCPh1al7zdO7XNiwlEYVuuP4CqUiokV/t9yyodg06H+zI+CXU2cn0t2YvIcoBKytX55HF/Xca2akxP7aNuon51A=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB5004.jpnprd01.prod.outlook.com (2603:1096:404:118::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 08:29:15 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.015; Thu, 10 Dec 2020
 08:29:15 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] mfd: bd9571mwv: Make the driver more generic
Thread-Topic: [PATCH 2/3] mfd: bd9571mwv: Make the driver more generic
Thread-Index: AQHWzTi2+Q7ca7X5Rkq3LYc4whtPtKnuwzQAgAD0SbCAAEmGgIAAAWmA
Date:   Thu, 10 Dec 2020 08:29:14 +0000
Message-ID: <TY2PR01MB3692DE297F43405DC0CFDE59D8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1607414643-25498-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXr1kDaXF7FFowq5CSVHzyima2fbF1fJUOowUEb88dOTA@mail.gmail.com>
 <TY2PR01MB3692C55C6CDEFC83D6F8F90DD8CB0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdXHMHaXPDaUfLmfREi92FKK0z_+eSyuOLRuXW1TDRPxOw@mail.gmail.com>
In-Reply-To: <CAMuHMdXHMHaXPDaUfLmfREi92FKK0z_+eSyuOLRuXW1TDRPxOw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:70b3:188b:a9ac:357d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b60d2af6-e00b-41ec-2d2d-08d89ce5addb
x-ms-traffictypediagnostic: TY2PR01MB5004:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB5004760FFD2D13E4D73D3075D8CB0@TY2PR01MB5004.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8z9esRLOrMFk4Tt11B8gv8wjog1HtHbVJD8ChoznI1Y/yxzDzdNriLsgR5EXxjTZLp0pIpNVjj7yscvNpBoopBbm7ErqwjvENwTUWcFWQBBP2hAr+EorXo5HCGdrayEQwKyDgchMpu+RCh2XaMSYJU8Sxa2Smq7DCWib2W4QyTcfu2+fpcMXkRAdRYu8wSMqbVXfQOjPgamY35C8CBjipXTqrA9unnJ9cjPxKTN/D9UfiEvJgS1+dvloLJuiKM2vHbfXRSGuHzxSrYetmZ7YJHpNqlD75cN8sqMXqw4q31J8iIyGp7zTORuNvVMw49D5mb/KtpcwWkTBHe0PaO3a3MXZY3Sngk2XCs3Xu904JxbAZX92VXVslpBEPSgJslPR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(9686003)(83380400001)(71200400001)(508600001)(4326008)(6506007)(64756008)(66476007)(76116006)(66946007)(66446008)(6916009)(186003)(54906003)(7696005)(66556008)(5660300002)(55016002)(33656002)(52536014)(86362001)(4744005)(8936002)(2906002)(8676002)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VUttYVVZeWF5Q3pSZUtOUFY4KzJqNjlZUkN3bTJNaDR4VGh4aGt2anQzaHl4?=
 =?utf-8?B?RWpuM3dHNVN4R1ZwOFNDcnh4ZWRrUEh0eDRxbVIxTW84NElNYUgyMEhrcnhy?=
 =?utf-8?B?TGRqUDUwU2dSOFZOU21ndERTaVNudG5IVlVadktyNmczTU1BeStHVXZwandK?=
 =?utf-8?B?cWtteVdVeVVwbTRZWlZvRkFYak94Vml6QmgxQTgvYWdieGZDR3JQYkY0ZW96?=
 =?utf-8?B?WjBxZUNZMHJ4UzVlNXVpemxaOFRtSmFLKy8vZmFwRFFTQ2ZtWWhjeUFEVmpG?=
 =?utf-8?B?NXpRV2lCd3BIdVE1VEt5YzJPZkRNSUVZY25Cb24yRldPcG0wYjhOZWxGeGhT?=
 =?utf-8?B?ZUk1Z3RyaWNmWVo0cFh5Yk9vMHNLTmlPQWU2QjVUdUJ0d1lqQWFvc3I1VWhL?=
 =?utf-8?B?KzlEbmhwc3ZIZCtrT05Sb0ZyMk56cThaQnNUL3BUMys0eUNSb2lmR0F0L2Zx?=
 =?utf-8?B?RlVDWUlVWWFUcmwyYm50WFJxMG5xdXl6bXNyV3NXZzR5WUozYzl0bUZLZ1M2?=
 =?utf-8?B?TldIR0xxSWplbGxSU3F3YTlpSEFMKzNwZGpMSmJUOVFqSDhudUI0OHVWdkNP?=
 =?utf-8?B?T0hZWS82M1R4SlJzcUROV0VTWFhkaDAvbnBXR1B5ME9FbzZDb2FXWnVqQTl6?=
 =?utf-8?B?aXdML0o2bkdYZmhrK1lYdHNGelRXU21HN3owQ3JnakVOdGRWbWRJaXA3YW1I?=
 =?utf-8?B?K2hMcnVQVWpLb0l1WjhWUVVTZnlaSGF1RzZhcUlkZGRwbTFEU0YvQTk5bXlM?=
 =?utf-8?B?Tm9jallRbkI1N3ZSQ0VlbTkyUGdQOG9rYWp0dHN1N1hFUnJkSkN0UkZ5dG8x?=
 =?utf-8?B?YnJIdjVGUDdmbFplZXQvZjA1WFMyYVJKeTFnNnVVVldjQVpDbHlmbFJQVDA5?=
 =?utf-8?B?L0JqWWFYYk5CWkNEek43bGtSNDlKeWx5STBFTWtCeTFheCtER1B5ejVvREhX?=
 =?utf-8?B?NTNQSU5SNWRVaTdpdnMvODF0bURuc3VlMEpTUUYzZERGdEFGUlFuM0Q1TzVS?=
 =?utf-8?B?M1lSMmU1VCtpYzJWREgva0hBOVVHdDNHQ2hycjV4V0dCRXV4MmJadXlUSjFi?=
 =?utf-8?B?RmhNaVUveElRV0hZUTg1d1o1d1VTSmRrOFlNMWIwWGg4L3k0OWFkS1RJTVBL?=
 =?utf-8?B?NWlORjJpcldRa3F4a2N3T2JNbGNwNkVIc1NLYnk5RzRnVm1hTG13U1lWb3Yv?=
 =?utf-8?B?eWR2QTZza0RWUEZQS0g5SlRaLzExYndSK2h3U2pqcjJUNnJXMWhxbHBZWGRo?=
 =?utf-8?B?SDJPcDhMbFBTUnJVaGdsTzlpLys5bkc1eWxUYlQ4OHRuR2Ixc05NVG82M2RI?=
 =?utf-8?B?R3p5bnJzODVZa1hoa29GZVZtdDl3Y21nNFUxaUNSMGhEOFN6WmY2MWxXZlR4?=
 =?utf-8?Q?kLQlNtsszwlYWhCdhYJoTMOc4fVudQrg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60d2af6-e00b-41ec-2d2d-08d89ce5addb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 08:29:15.0101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EKtvjj/BcHQnrJqNFhVAP9JzQvj+aAlO5xMOLxpszfv11uHRJOPVZIcrAmbBXfERLtDCoDwyxVAdm3b0Aggk2gywi25F+Id5I+pzEb7U5VU0x+4502mpbIYM6dM5mDlP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB5004
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIERlY2VtYmVyIDEwLCAyMDIwIDU6MjMgUE0NCjxzbmlwPg0KPiA+IE9yLCBrZWVwaW5nIHRo
aXMgbWVtYmVyIGFuZCB0aGVuIHdlIGNoZWNrIHRoZSBwcm9kdWN0IGNvZGUgYnkgdGhpcyBtZW1i
ZXINCj4gPiBpbnN0ZWFkIG9mIHN3aXRjaCgpIGxpa2UgYmVsb3c/DQo+ID4NCj4gPiAvKiBObyBi
dWlsZCB0ZXN0LCBKRllJICovDQo+ID4gc3RydWN0IGJkOTU3eF9kYXRhICpkYXRhX2FycmF5W10g
PSB7DQo+ID4gICAgICAgICAmYmQ5NTcxbXd2X2RhdGEsDQo+ID4gICAgICAgICAmYmQ5NTc0bXdm
X2RhdGEsDQo+ID4gfTsNCj4gPg0KPiA+IGZvciAoaSA9IDA7IEkgPCBBUlJBWV9TSVpFKGRhdGFf
YXJyYXkpOyBpKyspIHsNCj4gPiAgICAgICAgIGlmICh2YWwgPT0gZGF0YV9hcnJheVtpXS5wcm9k
dWN0X2NvZGVfdmFsKSB7DQo+ID4gICAgICAgICAgICAgICAgIGJkLT5kYXRhID0gZGF0YV9hcnJh
eVtpXTsNCj4gPiAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gICAgICAgICB9DQo+ID4gfQ0K
PiANCj4gR2l2ZW4gd2UgcHJvYmFibHkgd29uJ3QgaGF2ZSBtb3JlIHRoYW4gYSBoYW5kZnVsIHZh
cmlhbnRzLCBJJ20NCj4gbGVhbmluZyB0b3dhcmRzIHRoZSBzd2l0Y2goKSBhcHByb2FjaC4NCg0K
T0suIEkgZ290IGl0LiBJJ2xsIHVzZSBzd2l0Y2goKS4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGlo
aXJvIFNoaW1vZGENCg0K
