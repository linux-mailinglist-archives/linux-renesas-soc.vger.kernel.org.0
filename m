Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38239202E22
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 03:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgFVBqN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Jun 2020 21:46:13 -0400
Received: from mail-eopbgr1320092.outbound.protection.outlook.com ([40.107.132.92]:25266
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726456AbgFVBqM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Jun 2020 21:46:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaY9Y8ZOkXwOSn1Wrvziii6wbHZ9hBtWxmAfjBPf6/0+NZuvup69VRkXU/xlHtxODjZhAoWZubLHa91OSm8L7CUYvQp3hY6c2TH6J4gjE+aLo3Ongyd1sM3vM4x1WNU4mouAji89U4D2TwD/CJreubviIIeRUoRcuXRreO1YuAeCTFMxtsy6VBho4GcoVB9yVXm2WEuSBnjaVzxhsgLXn+QtCMgCR7juGVr8KBQIgv/enGq4E3pkGD8VlJFvBzt08wFWz8pydFJW1c7n3riLs9WCMjCtrHWsKzHQ4JCnAV8ACWfL4Q5p4MjSJgp0wAzPc5fbwGTMVgvRqPZDxq4KEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GA1RWiNVxr+Vix+9T0wEQaILiGCwY3770uV8vu5fRB0=;
 b=fklnzNoPN86DU8JdOWclkqQ204gBbNd9PBMgsKpyheugBJ8IzO2mTmRTGPxAk1dKWiGiCSzx5T0EYfP4QWdn9li/kBI2w1py8C+kOZNY1tOTPLkincHIpw1/+zNkmvICNR2krdqqY8BsN3A9UJF1OMhlCQyjjHnI1ETgbyQSNg4ornBwViB7Hpp/KzsZKqFQwNf7C12LDyCAptYjyYcn7XwwF3aNXibp7Bglh3grlMGEdTN5+M7N/aPZyN1FbMf/gwTL+zESd1bfRp12PKdtrzJAUS/b2dVfGo6/PM1rBVUEB8KonMqB2Xk+F7STBPBnE46nsymZMUBFy3Ig8nSJtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GA1RWiNVxr+Vix+9T0wEQaILiGCwY3770uV8vu5fRB0=;
 b=MA2jU8X+LSvHewoiNRgSSr/RWK9vTn4wnl2KlWpaxODo+SVouIOw3SVA4nu9FMRZNkmv+4Bffx7uO8GWSlYIDmBBE88OtcBEZmCItcsDt12Tn/wnOhy1xvcM3B+gFO4oEr0isgv+U9Hm5zm1CQEc6qt7G5L68bLRUwevD4hW0r8=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3292.jpnprd01.prod.outlook.com (2603:1096:404:7a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 01:46:07 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 01:46:07 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC v2 2/2] mmc: core: Call mmc_power_off_nofity() if
 pm_suspend_via_firmware()
Thread-Topic: [PATCH/RFC v2 2/2] mmc: core: Call mmc_power_off_nofity() if
 pm_suspend_via_firmware()
Thread-Index: AQHWRizdPOTXu2qan0+U/BpYBaNZSKjf8kGAgAPu9aA=
Date:   Mon, 22 Jun 2020 01:46:06 +0000
Message-ID: <TY2PR01MB3692733A31C6DD8FBDBB8AFCD8970@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1592566143-4546-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1592566143-4546-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <3d91f688-d79a-7d50-a9ac-e08ea2d0cd31@cogentembedded.com>
In-Reply-To: <3d91f688-d79a-7d50-a9ac-e08ea2d0cd31@cogentembedded.com>
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
x-ms-office365-filtering-correlation-id: 51c2c444-812a-4763-d86f-08d8164e085c
x-ms-traffictypediagnostic: TY2PR01MB3292:
x-microsoft-antispam-prvs: <TY2PR01MB32929A938D40ED252133F34ED8970@TY2PR01MB3292.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0442E569BC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g5aGvIr8u/g6OR1d6K0TLABTj8/ZiV3H+2toPpaNRfu4rK9VmgXzRXhXdou72BSjlaRcR57H9d8IYnWP+YgrKFu2wP+I9tcXwfVvD4Q0MQ67f32PrH0rtUrVJRPmEPoBvd/aBNRuBh7FugkCL1mI2HxwXcfK/hlxO1t2Y99lvSouXKwdoZz3LoMQFFtIPnRV3B0Xvb/bvd1junY2h5CMdfvQVCxc05FCk/zZXi2T8tprok8pyG9GAZGIazyhY3lAXKfJ6MLSDt1vOB5Mo2COGlWkICMYVTdz/b6nEw9TZ+PSoKrMGgzfRN/5Xa24j3vREL3qyhspogLdtGvEy7UwIw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(71200400001)(316002)(5660300002)(52536014)(26005)(110136005)(6506007)(54906003)(53546011)(186003)(7696005)(4326008)(55236004)(2906002)(64756008)(66556008)(9686003)(66446008)(83380400001)(66476007)(55016002)(8936002)(33656002)(86362001)(66946007)(478600001)(8676002)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: V+ZIbWpuZaG0SwOrWXk+ZYE2Sj+gOvlAL+J2VXQ/tNTalKKQnFpnz8rVi4Y+JOTUsc0hp6UO1dqD4BHJ6Q4eZDHpovV5BwtQSRxbQiTUTTBL8DeQQQrjiI5JraNKwQccn0alv5Dq+c2Mn3v3IaUx9SHkLkShq/GnqKd4UHEkKSJWYp/K5XeLVaY/NL7JwKnA+DKSCuePbWjxHB26BLtlDSOzbrtVv79rZ2EjLVIJa12aYLs/u/m/2knD2HMhuSfglQ5k/YGoIsuYFP42AMQuNs6tRXW7oTGG1Vsr7Dnh07Lmr8nue/EC/jCCg7nFM56kMey3XNKWYZ85Si7T8Lfhiot6reaLxruVtX9zpf7aCv2j3eDRyo11ZgG2SYqXJkcK8A2Y5n67audfdSySCy2t2JB2NTUkNLqKLL5N42B9977LuzZNcgFSH9BpnP/GGJE8VWvpXU8Q/BqOFdDt//Z5KF0OcKvJlYx4SeE3JhVx0EAF1+lJBK3keBDP8jXRoXtB
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c2c444-812a-4763-d86f-08d8164e085c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2020 01:46:07.5508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7YvmfuaTQR5Ec8OfInziPYA6jZ4Q6O04mXIvugbOX8NtSx/VvghWGAnEvCzwZSxrebi6ndRqzmozVlAzrTjs6Lhsla5Krlq71uSxxTVMN9WonhW41e/L2/a3WfVSgh+d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3292
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8hDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQoNCj4gRnJvbTogU2VyZ2VpIFNo
dHlseW92LCBTZW50OiBGcmlkYXksIEp1bmUgMTksIDIwMjAgMTA6NDEgUE0NCj4gDQo+IEhlbGxv
IQ0KPiANCj4gT24gMTkuMDYuMjAyMCAxNDoyOSwgWW9zaGloaXJvIFNoaW1vZGEgd3JvdGU6DQo+
IA0KPiA+IElmIHBtX3N1c3BlbmRfdmlhX2Zpcm13YXJlKCkgcmV0dXJucyB0cnVlLCB0aGUgc3lz
dGVtIHdpbGwgYmUgYWJsZQ0KPiA+IHRvIGN1dCBib3RoIHZjYyBhbmQgdmNjcSBpbiB0aGUgc3Vz
cGVuZC4gU28sIGNhbGwNCj4gPiBtbWNfcG93ZXJfb2ZmX25vZml0eSgpIGlmIHBtX3N1c3BlbmRf
dmlhX2Zpcm13YXJlKCkgcmV0dXJucyB0cnVlLg0KPiANCj4gICAgIG1tY19wb3dlcm9mZl9ub3Rp
ZnkoKT8gOi0pDQoNCk9vcHMhIEknbGwgZml4IGl0Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhp
cm8gU2hpbW9kYQ0KDQo+ID4gTm90ZSB0aGF0IHdlIHNob3VsZCBub3QgdXBkYXRlIHRoZSBNTUNf
Q0FQMl9GVUxMX1BXUl9DWUNMRSBjYXBzDQo+ID4gYmVjYXVzZSB0aGUgbW1jX3NlbGVjdF92b2x0
YWdlKCkgY2hlY2tzIHRoZSBjYXBzIHdoZW4gYXR0YWNoZXMNCj4gPiBhIG1tYy9zZC4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51
aEByZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvbW1jL2NvcmUvbW1jLmMgfCA0
ICsrKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9jb3JlL21tYy5jIGIvZHJpdmVy
cy9tbWMvY29yZS9tbWMuYw0KPiA+IGluZGV4IDQyMDMzMDMuLjgxOTQxZmQgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9tbWMvY29yZS9tbWMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbW1jL2NvcmUv
bW1jLmMNCj4gWy4uLl0NCj4gPiBAQCAtMjAzOCw3ICsyMDM5LDggQEAgc3RhdGljIGludCBfbW1j
X3N1c3BlbmQoc3RydWN0IG1tY19ob3N0ICpob3N0LCBib29sIGlzX3N1c3BlbmQpDQo+ID4gICAJ
CWdvdG8gb3V0Ow0KPiA+DQo+ID4gICAJaWYgKG1tY19jYW5fcG93ZXJvZmZfbm90aWZ5KGhvc3Qt
PmNhcmQpICYmDQo+ID4gLQkJKChob3N0LT5jYXBzMiAmIE1NQ19DQVAyX0ZVTExfUFdSX0NZQ0xF
KSB8fCAhaXNfc3VzcGVuZCkpDQo+ID4gKwkgICAgKChob3N0LT5jYXBzMiAmIE1NQ19DQVAyX0ZV
TExfUFdSX0NZQ0xFKSB8fCAhaXNfc3VzcGVuZCB8fA0KPiA+ICsJICAgICBwbV9zdXNwZW5kX3Zp
YV9maXJtd2FyZSgpKSkNCj4gPiAgIAkJZXJyID0gbW1jX3Bvd2Vyb2ZmX25vdGlmeShob3N0LT5j
YXJkLCBub3RpZnlfdHlwZSk7DQo+ID4gICAJZWxzZSBpZiAobW1jX2Nhbl9zbGVlcChob3N0LT5j
YXJkKSkNCj4gPiAgIAkJZXJyID0gbW1jX3NsZWVwKGhvc3QpOw0KPiA+DQo+IA0KPiBNQlIsIFNl
cmdlaQ0K
