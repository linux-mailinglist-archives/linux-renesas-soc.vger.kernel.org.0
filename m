Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBDE2657EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 06:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725355AbgIKEQW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 00:16:22 -0400
Received: from mail-eopbgr1400101.outbound.protection.outlook.com ([40.107.140.101]:44280
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725283AbgIKEQU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 00:16:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnzM3Igy/xgP4sGG3oSYKsicpGKdQwMcMshEKZHvbPHagj0VD8tNFloFbJf7QnNllLqzhndiKIJCBJ8/7e8OWGSTBuMs72blyO3g97rQ/KU00kTObdUufThmjOKKQCX203okFIa0F01okVb958o+tviRi9IyzzVhQI/DA9R2vWBvGc8A22I1yG3ZRCWSoRLKdvAJmN6Lks22m59EpcYfg7IoHl/P70qRaWgdVMWGnOdQhLEhC5Y7NJB+X+ew+Zh69sZ0HUyBNrdPwoXHOBPyXABDZNiK66tOgRCsOollD/LpQd3S9ktokkj+xzGt1ccryTlZvIH7bkDLYjeMB92OTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fd0tyIL62d2sIdXh0cHxN1BBqyjP37gJuT7HiAmzMFg=;
 b=KzaE5H5STTy/zc09S7fbw3/uawjOLijK+t0aOS88v2gKzY2VYafhSi4Q8JbYQLF4yr9BJFwg08x9PLkt0lr1yyrJ9CLsbSNAXjh7PHImmGFWFFG9PvW1OyDD+DXB1cY4vOBAdRahEhdSyh8bgrdDsKTuabgI5GR169UekZ4xqKhzFfAJzMetZUPXuokZ5/HpfDh1UkaewaDniupN6oOHd4SLwoe5eiq/6SHMkpZKcOHo3wvdgn5aNY/FiikpBcXfaTOURF5QoJ+8F6SV3WjM0a2zjwfEQwwXii5yh5zJgj8iHrJLH4byRr7yo6ZIdjV3eoSc3e53ULWeLbTozedeSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fd0tyIL62d2sIdXh0cHxN1BBqyjP37gJuT7HiAmzMFg=;
 b=EmkwTmYa9Ci0KWORLHpp33634k9Ve/aJznktVMjwxUjP0y2RvF5866adDBm+0iG8C9FEINw/bxrQwIRSW2pOnKW+HSkcqvFumfRFgCmrbQbGjJ+b+1oQ12/cMZr8+VjBP5AWfu5uiB/oa/WcRT0YylWRTpL8VDdpqzKxtoqwSO0=
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com (2603:1096:604:33::12)
 by OSYPR01MB5543.jpnprd01.prod.outlook.com (2603:1096:604:84::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 04:16:17 +0000
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::1d16:3e99:8fb2:84e1]) by OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::1d16:3e99:8fb2:84e1%7]) with mapi id 15.20.3370.016; Fri, 11 Sep 2020
 04:16:17 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 3/4] clk: renesas: cpg-mssr: add register pointers into
 struct cpg_mssr_priv
Thread-Topic: [PATCH v2 3/4] clk: renesas: cpg-mssr: add register pointers
 into struct cpg_mssr_priv
Thread-Index: AQHWhqsMlqRmxt+1+kuxoYKKB3micKlh2mIAgAD8cbA=
Date:   Fri, 11 Sep 2020 04:16:17 +0000
Message-ID: <OSAPR01MB368368C89C7D39910EAA0E7CD8240@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <1599657211-17504-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599657211-17504-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdV=svSDGJu4HoaeiEdWT2nk4eQFARMZKn3x7kvJx2QBgQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV=svSDGJu4HoaeiEdWT2nk4eQFARMZKn3x7kvJx2QBgQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:64a2:c8a4:9548:6c30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ca5ea281-b740-40a0-039b-08d856096e59
x-ms-traffictypediagnostic: OSYPR01MB5543:
x-microsoft-antispam-prvs: <OSYPR01MB5543E65E10ECB517A1C9D766D8240@OSYPR01MB5543.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OaVSsgWl2L8cpPa+O8ChZQ1l9XNBGrRFF8z5zl60ay2wewMxhckRQvvJU3BjlfFvCMo2gVE612dNIPi3xaEI532/hHjPRMX0nZKwoyoWbLGTEx5R2r3r/KVVutifcpqFSZdSydpWv9z1XaRRoA0TgkJpmFmOgIMOxoC7PmYiBV1m7OmNnCcbA3BMM3FNakvYgzKyVICo5bbLFgh+SZD346fWR8hlmORcSL1hePaNHVfUfMFD3NYtXuRtHHvyZ50WcLqGtpGmcVGpfZdYhBFMlIsSpMQYKGSM6Ueu9F4gUlpiN/ghd8QD9VgWXLzEo3Q82lxo7uRvus2IFuNvYF5QbQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3683.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(6506007)(4326008)(71200400001)(66946007)(186003)(66556008)(316002)(8936002)(8676002)(66476007)(66446008)(76116006)(64756008)(54906003)(6916009)(2906002)(33656002)(7696005)(5660300002)(478600001)(55016002)(9686003)(86362001)(52536014)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: hOdV2gx+WLKyrjbAT0U54JjPJbgzbeQ2COvCgRPIZjzLiBjWE5TkEnLuexEYVmj1F/w+0BuPM6rACSBbdI8HwRCbRXDU2LAQ32AQMEzdtBWeMfaiojfuqAZ5Eb0xcYYBP9wY7yWmftKziRGPeVullC0KHJ0ujdWZHIqHpzcOtVqCc5nyhbtWASvW3pkARdN3neu9OuSXYiGpZcnnAGYBInHnLqUXX6U6T5CSrAY2EZBBZWk07IsdHQcVMYTwlnef8WhZfVuvkzuRr2vGoE6X3tHJF88uIeYdN19XZTlMJZpsDp/Rb3nRTx6CKQ63jtNu2GuPW7nXtgBUsJ+OPBekHJ10c3RCl98/rGLdpPEvZlT0iPWL8JFS/TiQE4r35Ni5iB3Ha5a8B6Injn67Ffp2mHCZStryXcl1BAXBlvZlKMr7ZJS01PugLsK8aWYJ19jGJGmKOMdmkpcsdMjHgH5OynP/xXlrhe6Ayy4OlBMqrs0Xqgg3bDoAHxUUOgxbxA2NdztzLMlkD+2MgX1BhWPCALwHhfp839XdmW2XEWD7ABBgbysCsaLxfrYv2j9BSOSdaLr/FuCrIsWuQZ89/s6IM40BNb0m2E0irYXQLEmVhLbXqtvMIv+JNNEzlpEkYe1G3WsnPsMBziuq4gp9fE3rla7CvIM1BNHnfaaTVlA1Oc7S0ST1LEt27VWCWSmJHG8Ln32kd7r+LjW/VqFJds6NYg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3683.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5ea281-b740-40a0-039b-08d856096e59
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 04:16:17.7237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l5N1MbNHNzNgwIHRhvYOGLAZGPeoVs0lnqru5GSup3l9lKvDJTRrh9cLD7NXvaAN9w6sFX5T90o4NC6HFM1fi+K2hLK7X9niTzqxo65UVx/nG+TT6BkmFcysLxVViALX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5543
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIFNlcHRlbWJlciAxMCwgMjAyMCAxMDoxMSBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+
IA0KPiBPbiBXZWQsIFNlcCA5LCAyMDIwIGF0IDM6MTMgUE0gWW9zaGloaXJvIFNoaW1vZGENCj4g
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBUbyBzdXBwb3J0
IG90aGVyIHJlZ2lzdGVyIGxheW91dCBpbiB0aGUgZnV0dXJlLCBhZGQgcmVnaXN0ZXIgcG9pbnRl
cnMNCj4gPiBvZiBjb250cm9sX3JlZ3MgYW5kIHN0YXR1c19yZWdzIGludG8gc3RydWN0IGNwZ19t
c3NyX3ByaXYuIEFmdGVyIHRoYXQsDQo+ID4gd2UgY2FuIHJlbW92ZSB1bnVzZWQgbWFjcm9zIGxp
a2UgTVNUUFNSKCkuIE5vIGJlaGF2aW9yIGNoYW5nZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+
IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3Jl
bmVzYXMvcmVuZXNhcy1jcGctbXNzci5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9y
ZW5lc2FzLWNwZy1tc3NyLmMNCj4gDQo+ID4gQEAgLTEzNyw2ICsxMzAsOCBAQCBzdHJ1Y3QgY3Bn
X21zc3JfcHJpdiB7DQo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgbGFzdF9kdF9jb3JlX2NsazsN
Cj4gPg0KPiA+ICAgICAgICAgc3RydWN0IHJhd19ub3RpZmllcl9oZWFkIG5vdGlmaWVyczsNCj4g
PiArICAgICAgIGNvbnN0IHUxNiAqc3RhdHVzX3JlZ3M7DQo+ID4gKyAgICAgICBjb25zdCB1MTYg
KmNvbnRyb2xfcmVnczsNCj4gDQo+IFBsZWFzZSBhZGQgbmV3IGZpZWxkcyB0byB0aGUgc3RydWN0
J3Mga2VybmVsZG9jIGNvbW1lbnRzIGFib3ZlLg0KDQpPb3BzLiBJJ2xsIGFkZCBzdWNoIGNvbW1l
bnRzLg0KDQo+IE5vdGUgdGhhdCB5b3UgbmVlZCB0byB1c2UgYSBzaW1pbGFyIGRpc3BhdGNoaW5n
IGZvciB0aGUgU29mdHdhcmUgUmVzZXQNCj4gYW5kIFNvZnR3YXJlIFJlc2V0IENsZWFyaW5nIFJl
Z2lzdGVycywgYXMgdGhlaXIgb2Zmc2V0cyBkaWZmZXIgZnJvbQ0KPiBwcmV2aW91cyBTb0NzLg0K
DQpJbmRlZWQuIEknbGwgYWRkIHRoZXNlIHBvaW50ZXJzLg0KDQo+IFRoZSByZXNldCBsb29rcyBn
b29kIHRvIG1lLCB0aGFua3MhDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQoNCkJlc3Qg
cmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
