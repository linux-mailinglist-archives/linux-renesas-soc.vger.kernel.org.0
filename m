Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675F3212379
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2020 14:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729044AbgGBMhK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Jul 2020 08:37:10 -0400
Received: from mail-eopbgr1410100.outbound.protection.outlook.com ([40.107.141.100]:52960
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728961AbgGBMhJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Jul 2020 08:37:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrqVGWWlTOTk3qvvj9nYUZ4yZ3U/BUvTrT/juzr8wwlkW+PKIjDDc551aTs+dw9rcdQLAJGo7yxBfaGKSEHWWcxUbe6tLuI/QAiIIr1lpYCSmw69aUX7S/NSuIr2t+C9Jjw/DJ9ecARktO9txZU/h/su1ZBh2CTpzOpmhCEZFV1Sm8RAmzDLRkuiFhx3x+KfwO8i+bif9sWsuxRZlk/qFpxEene+ybSCBUTIky1UTQwREImydvXuJSykZqAckfyVeD/9iQlc3ccof4Sdhtx26LZB53f7SfrEiOQVLoliwTyrx8JkHEhtxNlCiuBU22v5ymVB1E0FYyR6cJz0QmfGqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/x00ktEtMRUle/CBnA4JHiBpcHWs8Q2AB2TGWQCMziU=;
 b=kRho/5KpmWsSyTv24vYJ9SUVQYwFiJiOmBO1O7dElomf2DishoPMou59hIBVUPIybW9gu5jE+9sMQHCb/kvzfyD2Ls2aLmrCoZORu/pBrfqn0uOwBtnQ1Th8sWGEDk2rtEGys4UOvKLsN+eWauxlaP7SX0uHmdBumTGD5EV3CzId1IgN8pv4j4Gyz6uBkci4XmkOofeF86EIu7AuQYQKb4/XQRLaOsrfJumoUxcbYGrxacQcpXcJ/DRGOc+9VEzlPP0/jWJWo8HDxZGrpOq91bQ83VQK10/v1HLeW0ArwdatNRJjEXjXoCLsyRQahkIjkbZUwovkEsQrAY7mgAG13g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/x00ktEtMRUle/CBnA4JHiBpcHWs8Q2AB2TGWQCMziU=;
 b=boXt1uot7nywn+x4WBrk+dIiPYsHnbWWe9YTXFtfprzx+SSbN1ITVeqCFYYH1TDMsiECviIRHYEmU90CO4u2m/PIEmqJTm3Xi+v4cW2vUgHPEQ7CXo8F3EUQklliOU4JiIWsIZKhd1y5OW7xo5VGTMlMden6dxkQ3ZhuvF0QFBE=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB2960.jpnprd01.prod.outlook.com (2603:1096:404:82::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Thu, 2 Jul
 2020 12:37:05 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3153.021; Thu, 2 Jul 2020
 12:37:05 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v3 2/2] mmc: core: Call mmc_poweroff_nofity() if
 pm_suspend_via_firmware()
Thread-Topic: [PATCH v3 2/2] mmc: core: Call mmc_poweroff_nofity() if
 pm_suspend_via_firmware()
Thread-Index: AQHWSDxc4WkWJe7NmU+vEp59xfJ7+ajnjXWAgAATDICAATp98IAAOeAAgAGtdYCACXWQoA==
Date:   Thu, 2 Jul 2020 12:37:05 +0000
Message-ID: <TY2PR01MB36927A37B98684B6C62E3473D86D0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1592792699-24638-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1592792699-24638-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAPDyKFq-dEPaU094hrk2xg18VpJAsbnf8enieFmcMhKiB1bW1A@mail.gmail.com>
 <CAMuHMdXjU7N4oG89YsozGijMpjgKGN6ezw2qm6FeGX=JyRhsvg@mail.gmail.com>
 <TY2PR01MB36921A71A493ABD624A28C42D8920@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdWLWBvZmHNqPFk2GW6XLnBx-sqfCo6d=B4iei88ONWX=w@mail.gmail.com>
 <CAPDyKFpiBU1D+a7zb+Ggm0_HZ+YR4=LXJZ5MPytXtT=uBEdjPA@mail.gmail.com>
In-Reply-To: <CAPDyKFpiBU1D+a7zb+Ggm0_HZ+YR4=LXJZ5MPytXtT=uBEdjPA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:a83c:8321:5fa3:d8c8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e65d235b-3cf1-4f7e-b72c-08d81e84a0e7
x-ms-traffictypediagnostic: TYAPR01MB2960:
x-microsoft-antispam-prvs: <TYAPR01MB29605D81953064657A770E39D86D0@TYAPR01MB2960.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E/jpit7L8f3PtsvlS7T6j9spNnlMPlM+DhNVonycrz/SX/rDvE7t0le52o5JhL2PSaKRvBSwLJ5rx0BCqlbAu6KpRSFoS+bzh7d6oaNAUtDbnMM+kB+XHRc3j71V6ti5Rc1YUXOcdcDvO1m11CVBwsm+TLhRDBaBQPCbaK6X4C1QAc4kTTjm65HIwBkvSeS+8GkqJslhIjqvjqqlG1vih14MOtXBmuuY3tvSD/cjSfF7bi2akhsYFSz/+wMtnuQcQgToJxL1Ld6+f3MzszRoF3JPHIv8cBc4DUhJnID76cwer88QOEIfZqrO8apZ2AaZPP2zIjvLsNorwhVIGyvlL8pnVH7aNWnEDFSQy9EX8Xhwylxp1ZdsLInN8AurMvmM0Yhy4AdO7qDLI3MvCBu9Rg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(6916009)(83380400001)(5660300002)(4326008)(86362001)(71200400001)(186003)(55016002)(52536014)(33656002)(54906003)(66946007)(66476007)(316002)(8676002)(478600001)(8936002)(53546011)(966005)(66556008)(9686003)(64756008)(7696005)(6506007)(66446008)(2906002)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: bUD3hpRG2efBp/UX3KHHmiDE+9PkwFCfunLOJ99O3PY+V/QTA78Pip0xk+UHJYtDnsP30Bw2yllQDXGEqgUP2hlyXuX1G0uCEJkk8pGg2cE5tQnBYPjF/NnQGHzS4QyNSPCQzHz5LDU+6B49bO/Gpog50HBtdkNat8B4XVRuohurssyavWiRqhvbMzOq/MbvIZtSSCQDzg4vxiWFdT4t7jRbmAIdHx17OxW+Np3uxE0U6Pzjwsbxc5Y8hdUlKc33k+5584Wx7ZiAs5Li6CGQXtsAyO18B8qspubcWmK5zLQgC8yWcljkB+Nfrrajhvk+iwME6GrD01eBE58lImD8mdWBt7z00w1mYGnWlreAy6cTsKA7L/TjVaZu6orfrKw6IonoCECbpgs2+IWzXNde6W6m4tNm4D5VH7eIxXVOM4og3MJblzHiU5ENq1OKKWhjfwE7ICGlezfLk9lAZ13CbD3J85MSi4HYUe1fNDXHsIiWXBnH5eID0vGZOarz3k3iTTHcWmnHboBO7oImWqXRytAjZCnuaWEZdU7kdLbx8oI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e65d235b-3cf1-4f7e-b72c-08d81e84a0e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 12:37:05.5482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LaHUQq83M+3/zlb2s2lmhXreSGZaazXXff1zlV9nH6DyhruEebf8wmtUJX3gR0kRqfq6ZQuezpcLFWODoQICMW5dQtklVMdJVrY+tp5ep7OnIRkw9feGruJpISNvm07Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2960
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgVWxmLA0KDQo+IEZyb206IFVsZiBIYW5zc29uLCBTZW50OiBGcmlkYXksIEp1bmUgMjYsIDIw
MjAgODowMyBQTQ0KPiANCj4gKyBSb2INCj4gDQo+IE9uIFRodSwgMjUgSnVuIDIwMjAgYXQgMTE6
MjYsIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOg0KPiA+
DQo+ID4gSGkgU2hpbW9kYS1zYW4sDQo+ID4NCj4gPiBDQyBicm9vbmllDQo+ID4NCj4gPiBPbiBU
aHUsIEp1biAyNSwgMjAyMCBhdCA4OjMxIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+ID4gPHlvc2hp
aGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuLCBTZW50OiBXZWRuZXNkYXksIEp1bmUgMjQsIDIwMjAgODoxMyBQTQ0KPiA+
ID4gPiBPbiBXZWQsIEp1biAyNCwgMjAyMCBhdCAxMjowNiBQTSBVbGYgSGFuc3NvbiA8dWxmLmhh
bnNzb25AbGluYXJvLm9yZz4gd3JvdGU6DQo+ID4gPiA+ID4gT24gTW9uLCAyMiBKdW4gMjAyMCBh
dCAwNDoyNSwgWW9zaGloaXJvIFNoaW1vZGENCj4gPiA+ID4gPiA8eW9zaGloaXJvLnNoaW1vZGEu
dWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gSWYgcG1fc3VzcGVuZF92aWFfZmly
bXdhcmUoKSByZXR1cm5zIHRydWUsIHRoZSBzeXN0ZW0gd2lsbCBiZSBhYmxlDQo+ID4gPiA+ID4g
PiB0byBjdXQgYm90aCB2Y2MgYW5kIHZjY3EgaW4gdGhlIHN1c3BlbmQuIFNvLCBjYWxsDQo+ID4g
PiA+ID4gPiBtbWNfcG93ZXJvZmZfbm9maXR5KCkgaWYgcG1fc3VzcGVuZF92aWFfZmlybXdhcmUo
KSByZXR1cm5zIHRydWUuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gTm90ZSB0aGF0IHdlIHNo
b3VsZCBub3QgdXBkYXRlIHRoZSBNTUNfQ0FQMl9GVUxMX1BXUl9DWUNMRSBjYXBzDQo+ID4gPiA+
ID4gPiBiZWNhdXNlIHRoZSBtbWNfc2VsZWN0X3ZvbHRhZ2UoKSBjaGVja3MgdGhlIGNhcHMgd2hl
biBhdHRhY2hlcw0KPiA+ID4gPiA+ID4gYSBtbWMvc2QuDQo+ID4gPiA+DQo+ID4gPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL21tYy9jb3JlL21tYy5jDQo+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL21t
Yy9jb3JlL21tYy5jDQo+ID4gPiA+ID4gPiBAQCAtMjAzOCw3ICsyMDM5LDggQEAgc3RhdGljIGlu
dCBfbW1jX3N1c3BlbmQoc3RydWN0IG1tY19ob3N0ICpob3N0LCBib29sIGlzX3N1c3BlbmQpDQo+
ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgZ290byBvdXQ7DQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gICAgICAgICBpZiAobW1jX2Nhbl9wb3dlcm9mZl9ub3RpZnkoaG9zdC0+Y2FyZCkgJiYN
Cj4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAoKGhvc3QtPmNhcHMyICYgTU1DX0NBUDJfRlVM
TF9QV1JfQ1lDTEUpIHx8ICFpc19zdXNwZW5kKSkNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICgo
aG9zdC0+Y2FwczIgJiBNTUNfQ0FQMl9GVUxMX1BXUl9DWUNMRSkgfHwgIWlzX3N1c3BlbmQgfHwN
Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgICBwbV9zdXNwZW5kX3ZpYV9maXJtd2FyZSgpKSkNCj4g
PiA+ID4gPg0KPiA+ID4gPiA+IFNvcnJ5LCBidXQgdGhpcyBkb2Vzbid0IHdvcmsuDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBFdmVuIGlmIFBTQ0kgaXMgYSBnZW5lcmljIEZXIGludGVyZmFjZSwgaXQg
ZG9lc24ndCBtZWFuIHRoYXQgYWxsIFBTQ0kNCj4gPiA+ID4gPiBpbXBsZW1lbnRhdGlvbnMgd2ls
bCBjdXQgdGhlIHZjYyBhbmQgdmNjcSBmb3IgdGhlIE1NQyBjYXJkIGF0IHN5c3RlbQ0KPiA+ID4g
PiA+IHN1c3BlbmQuDQo+ID4gPiA+DQo+ID4gPiA+IEluZGVlZCwgdGhlcmUncyBub3RoaW5nIGd1
YXJhbnRlZWQgaGVyZS4gIE5vciBkb2N1bWVudGVkIGhvdyBpdCBzaG91bGQNCj4gPiA+ID4gYmVo
YXZlLiAgQmFzaWNhbGx5IHRoZSBmaXJtd2FyZSBpcyBmcmVlIHRvIHBvd2VyIG9mZiB0aGUgU29D
LiBPciBub3QgZG8gdGhhdC4NCj4gPiA+ID4gIklmIGZpcm13YXJlIGlzIGludm9sdmVkLCBhbGwg
b2RkcyBhcmUgb2ZmIi4NCj4gPiA+DQo+ID4gPiBJIHRob3VnaHQgd2UgY291bGQgYmUgZ3VhcmFu
dGVlZC4gQnV0LCBJIHVuZGVyc3Rvb2Qgd2UgY291bGQgbm90IGJlIGd1YXJhbnRlZWQuLi4NCj4g
PiA+DQo+ID4gPiA+ID4gSW5zdGVhZCwgeW91IG5lZWQgdG8gZGVjaWRlIHRoaXMgYmFzZWQgb24g
c29tZSBzcGVjaWZpYyBEVCBwcm9wZXJ0eS4NCj4gPiA+ID4gPiBQZXJoYXBzIGluIGNvbmp1bmN0
aW9uIHdpdGggdXNpbmcgcG1fc3VzcGVuZF92aWFfZmlybXdhcmUoKS4NCj4gPiA+ID4NCj4gPiA+
ID4gTGFzdCB0aW1lIEkgd2FzIGludm9sdmVkIGluIGEgZGlzY3Vzc2lvbiBhYm91dCB0aGlzLCB0
aGUgUFNDSSBwZW9wbGUNCj4gPiA+ID4gZGlkbid0IHdhbnQgdG8gYWRkIGFueSBwcm9wZXJ0aWVz
IGRlc2NyaWJpbmcgcGFydGljdWxhciBQU0NJIGJlaGF2aW9yLi4uDQo+ID4gPiA+ICJJZiBmaXJt
d2FyZSBpcyBpbnZvbHZlZCwgYWxsIG9kZHMgYXJlIG9mZiIuDQo+ID4gPiA+DQo+ID4gPiA+IFNv
IHRoZSBvbmx5IHNhZmUgdGhpbmcgdG8gZG8gaXMgdG8gZXhwZWN0IHRoZSB3b3JzdCwgYW5kIHBy
ZXBhcmUgZm9yIGl0Li4uDQo+ID4gPg0KPiA+ID4gQSBoZWFkYWNoZSBwb2ludCBpcyBhbiBlTU1D
IGRldmljZSBjb25zdW1lcyBtdWNoIHBvd2VyIGlmIHRoYXQgdGhlIHN5c3RlbQ0KPiA+ID4gZG9l
c24ndCBjdXQgdGhlIHZjYyBhbmQgdmNjcSBhbmQgZG9lc27igJl0IGVudGVyIHRoZSBzbGVlcCBt
b2RlLg0KPiA+ID4gSW4gb3RoZXIgd29yZHMsIGluIHBvd2VyIGNvbnN1bXB0aW9uIHBvaW50IG9m
IHZpZXcsIHRoaXMgcGF0Y2ggd2lsbA0KPiA+ID4gY2F1c2UgYSByZWdyZXNzaW9uIGluIHN1Y2gg
YSBjYXNlLi4uDQo+ID4NCj4gPiBJbmRlZWQuDQo+ID4NCj4gPiA+IEJ5IHRoZSB3YXksIGFib3V0
IGFkZGluZyBzcGVjaWZpYyBEVCBwcm9wZXJ0eSwgdGhlIHJlZ3VsYXRvciBjYW4gaGF2ZQ0KPiA+
ID4gcmVndWxhdG9yLW9mZi1pbi1zdXNwZW5kIHByb3BlcnR5IGluIHJlZ3VsYXRvci1zdGF0ZS1t
ZW0gc3Vibm9kZS4NCj4gPiA+IEZvciBub3csIHdlIGRvZXNuJ3Qgc2VlbSB0byBnZXQgdGhlIHBy
b3BlcnR5IGZyb20gYSByZWd1bGF0b3IgY29uc3VtZXIgdGhvdWdoLg0KPiA+ID4gU28sIEknbGwg
dHJ5IHRvIGFkZCBhbiBBUEkgb2YgcmVndWxhdG9yIGZvciBpdC4NCj4gPg0KPiA+IE9oIHJpZ2h0
LCB0aGUgZU1NQyBpcyBkZXNjcmliZWQgaW4gRFQgYXMgYmVpbmcgY29ubmVjdGVkIHRvIHR3bw0K
PiA+IHJlZ3VsYXRvcnMuDQo+ID4gTm90ZSB0aGF0IHRoZSBzZW1hbnRpY3Mgb2YgcmVndWxhdG9y
LW9mZi1pbi1zdXNwZW5kIGFyZSB0aGF0IHRoZQ0KPiA+IHJlZ3VsYXRvciBzaG91bGQgYmUgZGlz
YWJsZWQgKGJ5IHRoZSByZWd1bGF0b3IgY29yZSkgZHVyaW5nIHN1c3BlbmQsIG5vdA0KPiA+IHRo
YXQgdGhlIHJlZ3VsYXRvciBpcyBkaXNhYmxlZCBkdXJpbmcgc3VzcGVuZCBieSBhIHRoaXJkIHBh
cnR5Lg0KPiA+IE5vIGlkZWEgaWYgdGhhdCB3aWxsIHdvcmsgd2l0aCBhIGZpeGVkLXJlZ3VsYXRv
ciB3aXRob3V0IEdQSU8gY29udHJvbCwNCj4gPiBidXQgb2YgY291cnNlIHlvdSBjYW4gdHJ5Lg0K
DQpBcyBvdGhlciBlbWFpbCB0aHJlYWQgb2YgdGhpcyB0cmlhbCBhcyB2NCwgSSBjb3VsZCBub3Qg
Z2V0IGFwcHJvdmFsIFsxXS4NCg0KWzFdDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
ZW5lc2FzLXNvYy9DQU11SE1kWDkzUTlXaEtMcXZfd05QekFyYmM2OE5jYlZOOGpKOU1ES3hBY2lj
cEJRNVFAbWFpbC5nbWFpbC5jb20vVC8jbTcwODgzY2M1ZGU0ZmE3ZmNhNTAxMThkYWQ3NDNjODM2
ZDVlM2I0NTENCg0KPiBGb3IgbW1jIHdlIGFscmVhZHkgaGF2ZSBhIERUIHByb3BlcnR5LCAiZnVs
bC1wd3ItY3ljbGUiLiBXaGljaCB0ZWxscw0KPiB3aGV0aGVyIHRoZSBob3N0IGlzIGFibGUgdG8g
Y29tcGxldGVseSBwb3dlci1jeWNsZSB0aGUgY2FyZCAoc29tZQ0KPiBob3N0J3MgbWFuYWdlIHBv
d2VyIGludGVybmFsbHkpLg0KPiANCj4gSG93ZXZlciwgbWF5YmUgdGhlIHByb3BlciB0aGluZyBo
ZXJlIHdvdWxkIGJlIHRvIGFkZCBhIHByb3BlcnR5IG9mDQo+IHJlZ3VsYXRvciBpbnN0ZWFkLg0K
DQpNeSB2NCBwYXRjaCB3YXMgdXNpbmcgYSByZWd1bGF0b3IgcHJvcGVydHkuIEJ1dCBzaW5jZSBJ
IGNvdWxkIG5vdCBnZXQNCmFwcHJvdmFsLCB3ZSBjb3VsZCBub3QgdXNlIHRoaXMgd2F5LCBJIHRo
aW5rLg0KDQo+IElmIHRoYXQgZG9lc24ndCBtYWtlIHNlbnNlLCBJIGFtIGFsc28gb3BlbiB0byBh
ZGQgYQ0KPiBuZXcgTU1DIHByb3BlcnR5LCAiZnVsbC1wd3ItY3ljbGUtaW4tc3VzcGVuZCIuDQoN
CkkgdGhvdWdodCB0aGlzIHdheSB3YXMgYmV0dGVyLiBIb3dldmVyLCBJJ20gd29uZGVyaW5nIGlm
IGFkZGluZyBzdWNoIGEgbmV3IE1NQw0KcHJvcGVydHkgdG8gaXNzdWUgUG93ZXIgT2ZmIE5vdGlm
aWNhdGlvbiBpbiBtbWNfc3VzcGVuZCgpIGlzIHJlYWxseSBiZXR0ZXINCnRoYW4gdGhlIGN1cnJl
bnQgaW1wbGVtZW50YXRpb24uIFRoaXMgaXMgYmVjYXVzZSB3ZSBkb24ndCBoYXZlIGFueSBjb21w
bGV0ZWx5DQpzb2x1dGlvbnMgbm93Og0KIC0gRGVwZW5kIG9uIGJvYXJkIGNvbmZpZ3VyYXRpb24g
KFRoZSBib2FyZCBkb2Vzbid0IGhhdmUgImZ1bGwtcHdyLWN5Y2xlIikuDQogLSBEZXBlbmQgb24g
ZmlybXdhcmUgb24gYm9hcmQgWzJdLiBTbywgZXZlbiBpZiBhZGRpbmcgYSBuZXcgTU1DIHByb3Bl
cnR5LA0KICAgaXQgY2Fubm90IHN5bmMgdGhlIGZpcm13YXJlIGNvbmRpdGlvbi4gSW4gZmFjdCwg
dGhpcyBpcyBwb3NzaWJsZSB0bw0KICAgY2F1c2UgcmVncmVzc2lvbiBpbiBwb3dlciBjb25zdW1w
dGlvbiBwb2ludCBvZiB2aWV3IFszXS4NCiAtIE15IGVudmlyb25tZW50IChQU0NJIHdoaWNoIGlz
IG9uZSBvZiBmaXJtd2FyZSkgZG9lc24ndCBzdXBwb3J0DQogICBhbnkgYWJpbGl0eSB0byBzeW5j
IGJldHdlZW4gdGhlIGZpcm13YXJlIGFuZCBPUyBmb3Igbm93IFs0XS4NCg0KQnV0LCB3aGF0IGRv
IHlvdSB0aGluaz8NCg0KWzJdDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yZW5lc2Fz
LXNvYy8xNTkyNzkyNjk5LTI0NjM4LTEtZ2l0LXNlbmQtZW1haWwteW9zaGloaXJvLnNoaW1vZGEu
dWhAcmVuZXNhcy5jb20vVC8jbWRlMzhkNTg2NmI3ZjNlZGM5YTJlZDEwNWFjMDZiNGZkYTRjM2U5
OWUNCg0KWzNdDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yZW5lc2FzLXNvYy8xNTky
NzkyNjk5LTI0NjM4LTEtZ2l0LXNlbmQtZW1haWwteW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNh
cy5jb20vVC8jbWY4ZTdhYmRmMTM1NTg2YmEwYjcwYTFjMjM1NDEwYTZmOTRjNjAwN2QNCg0KWzRd
DQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yZW5lc2FzLXNvYy9DQU11SE1kWDkzUTlX
aEtMcXZfd05QekFyYmM2OE5jYlZOOGpKOU1ES3hBY2ljcEJRNVFAbWFpbC5nbWFpbC5jb20vVC8j
bTQ0MmEyY2U5NzJjZmRiM2ZmMzM2MzdjMTIwYzhkMDk2ZTRkMDdhZjgNCg0KQmVzdCByZWdhcmRz
LA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiBLaW5kIHJlZ2FyZHMNCj4gVWZmZQ0K
