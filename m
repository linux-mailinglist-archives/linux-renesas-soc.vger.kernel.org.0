Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6910E2099DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jun 2020 08:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389903AbgFYGbh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jun 2020 02:31:37 -0400
Received: from mail-eopbgr1400118.outbound.protection.outlook.com ([40.107.140.118]:57088
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726742AbgFYGbh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jun 2020 02:31:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgeeMXfqr/vLEOk+BX4h1jtFgt2sVNASolOqAsOfPnpbR7siAmaBF5BmaTsXZBlDEXvW5REfLr1tW2xq5GYCq4Mix6JXkyn4RYpEu7RxcQ+3fiFuOuVVBPVWpPLM5cR2MXaBssySVYiC0J/ag49378ble2DkvVFcGGpoNADnIDkk02awzb20XfL3dhCGSnK1GVn8IemWZ1UXYVPOh1Fs6wBPzQltm8S8y24mDHh07jNX/Lfs+ukUTSOtDF73mvTFN+CFojP5VP1J91CTT7XElH+kqxU2MqEAGYDlVKagE2rhK40BWlTmswC7jQjShYhjkkZZM+z/8C+rir1hLZBP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NahcgyBsqwUFGX5oZnK0SooyoEL6gAjGBxxwYGeZ+hU=;
 b=IRzC68Lnqs1JvghDz13GTI/98f8H+nLPVQ63ZtE6D+Bk/PlrB5xt3xvLr/PhP6ARlrlmho5Us851J+QCasI5mEswHxNSwXmHA+trWaIXM6F3U06ijcz0dc+w1syQBI8vXSbRsrMyKdOzDq00ene3CyxfLUucX1RmP+7my4gBGc2tKe/fLncf8sg7LaXIZ6w/uDTfwVRD6BXudpcpWOiuWRLPstXBrxlLn+nsCeSb2I+b8tgKmvoNyjruHAcgHTbvv9ijzSz5SiA3uUcGfvXg+0oUNSLPzG7ZoYf3CNLALGfDq5qshMKh2+hfVwO27MWCWswRcfddFep0Cxtkqibv+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NahcgyBsqwUFGX5oZnK0SooyoEL6gAjGBxxwYGeZ+hU=;
 b=Max7LbOZEZOqvpQkaeCIQjAUPmvTDRtHaTFHE/TI++ziIwH9WSBbFKpd0C07h+4m1a4ro887zy1mDoJpeoO+cELBI2XAR8jj3ONZQMd9yigklUUZ+YrRzafWonM7qP/+NDkxs3zj0iwwYlOYN7PEjrbeM2P+tSInZVjFtlHsUfQ=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4304.jpnprd01.prod.outlook.com (2603:1096:404:130::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 25 Jun
 2020 06:31:33 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3131.020; Thu, 25 Jun 2020
 06:31:33 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 2/2] mmc: core: Call mmc_poweroff_nofity() if
 pm_suspend_via_firmware()
Thread-Topic: [PATCH v3 2/2] mmc: core: Call mmc_poweroff_nofity() if
 pm_suspend_via_firmware()
Thread-Index: AQHWSDxc4WkWJe7NmU+vEp59xfJ7+ajnjXWAgAATDICAATp98A==
Date:   Thu, 25 Jun 2020 06:31:33 +0000
Message-ID: <TY2PR01MB36921A71A493ABD624A28C42D8920@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1592792699-24638-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1592792699-24638-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAPDyKFq-dEPaU094hrk2xg18VpJAsbnf8enieFmcMhKiB1bW1A@mail.gmail.com>
 <CAMuHMdXjU7N4oG89YsozGijMpjgKGN6ezw2qm6FeGX=JyRhsvg@mail.gmail.com>
In-Reply-To: <CAMuHMdXjU7N4oG89YsozGijMpjgKGN6ezw2qm6FeGX=JyRhsvg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3bd530b0-b10f-4c70-c364-08d818d1675f
x-ms-traffictypediagnostic: TYAPR01MB4304:
x-microsoft-antispam-prvs: <TYAPR01MB4304B80CDC2B34E7A2372DA1D8920@TYAPR01MB4304.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0445A82F82
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6NnOCC60UZfMYpDZLIsg1lZtkQmPYKFdh55I3IQN4MyLKbi0Ct3X2fv+AX9S41RA+CU9WMqLuLNczeFazWPJHJzDVq7QujBqSiVTYtNWq5IxmMAimkZPUZ7BXo0nA9aoItjVruEUJgCQDb+AwzI17eLX0VHawqarGWNRQzhRnYMC5ZvMmg5As22l352hRRFwIODyeDFW37P9uasmjxGpRIb+FSoRxksL88yoMeR3DKW/x/+eBljsMZlabKNQKSyjC5JiMji+kwytbiyEPgiBUPygqlknOSF9JQ2Tr9EQ87f2s6QeJaq306gBfEosc221kInaNBzxWmm6raRCLXNWvA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(53546011)(6506007)(55236004)(8936002)(478600001)(7696005)(4326008)(8676002)(55016002)(52536014)(316002)(54906003)(83380400001)(110136005)(66476007)(26005)(33656002)(66556008)(186003)(66446008)(76116006)(66946007)(2906002)(5660300002)(71200400001)(9686003)(86362001)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: aSSIR2BrRlxFi+CfYrs6fDTaTxtbrr6uXVZBWDifZwlVVhfcud7fogfs/oTrq2P+Piw9gFaHPmRXUTWw7EESer8FbZGaS4FivQF+/FaFe0WaIdZBosddONeLdp+Ru99S5Pq8LGCl2PQEfipuZzNaffPRTR6iw0YA66yEvMBdpCdVzi3n5s5cdf045YEo6DUVxIe5k1Zh7WL/XxLflXNvpW8IGblYQQhvV0yv3Zm1OEpJ7Ban1dQ8iZ+YrwXn3OdRNNaYPNDmuVlxXqZyrgXA8Azvll/66WSgeI4pHUCi2AIUVxOzODhD0a7sezs3MjYsABC4cI1VRfohrrM+lC2ifuaIfKogYr3V2D9BRjleHQcJTrPkMXNvkvxCqKxwJGGCGXD6jDSrl83JSdRiyRKOuXHUkH9OUzUrf/HH2+heQ2vA5UwEIAKKzzdTNSUicm5PXe1Pg4sTxeHqhw63oi4ahwL0iq+Dpfu+lpZ7t5jW+wjitEsGfb14Gyhh+xs9vMlK
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd530b0-b10f-4c70-c364-08d818d1675f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2020 06:31:33.3276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z+qB/7gneh/15kHtjLTy1cqd4IvUFm0HVoXwmBP3XTScWv/JCuFjUGXAXNgZHMjnywPp6M10XcMlUhUWujC8B+559GDhgMxSYuw8tBEA9sX5dB+8GbwzL9dmQlveCx5s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4304
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgVWxmLCBHZWVydCwNCg0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4sIFNlbnQ6IFdlZG5l
c2RheSwgSnVuZSAyNCwgMjAyMCA4OjEzIFBNDQo+IA0KPiBIaSBVbGYsDQo+IA0KPiBPbiBXZWQs
IEp1biAyNCwgMjAyMCBhdCAxMjowNiBQTSBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJv
Lm9yZz4gd3JvdGU6DQo+ID4gT24gTW9uLCAyMiBKdW4gMjAyMCBhdCAwNDoyNSwgWW9zaGloaXJv
IFNoaW1vZGENCj4gPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0K
PiA+ID4gSWYgcG1fc3VzcGVuZF92aWFfZmlybXdhcmUoKSByZXR1cm5zIHRydWUsIHRoZSBzeXN0
ZW0gd2lsbCBiZSBhYmxlDQo+ID4gPiB0byBjdXQgYm90aCB2Y2MgYW5kIHZjY3EgaW4gdGhlIHN1
c3BlbmQuIFNvLCBjYWxsDQo+ID4gPiBtbWNfcG93ZXJvZmZfbm9maXR5KCkgaWYgcG1fc3VzcGVu
ZF92aWFfZmlybXdhcmUoKSByZXR1cm5zIHRydWUuDQo+ID4gPg0KPiA+ID4gTm90ZSB0aGF0IHdl
IHNob3VsZCBub3QgdXBkYXRlIHRoZSBNTUNfQ0FQMl9GVUxMX1BXUl9DWUNMRSBjYXBzDQo+ID4g
PiBiZWNhdXNlIHRoZSBtbWNfc2VsZWN0X3ZvbHRhZ2UoKSBjaGVja3MgdGhlIGNhcHMgd2hlbiBh
dHRhY2hlcw0KPiA+ID4gYSBtbWMvc2QuDQo+IA0KPiA+ID4gLS0tIGEvZHJpdmVycy9tbWMvY29y
ZS9tbWMuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9tbWMvY29yZS9tbWMuYw0KPiA+ID4gQEAgLTIw
MzgsNyArMjAzOSw4IEBAIHN0YXRpYyBpbnQgX21tY19zdXNwZW5kKHN0cnVjdCBtbWNfaG9zdCAq
aG9zdCwgYm9vbCBpc19zdXNwZW5kKQ0KPiA+ID4gICAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0K
PiA+ID4NCj4gPiA+ICAgICAgICAgaWYgKG1tY19jYW5fcG93ZXJvZmZfbm90aWZ5KGhvc3QtPmNh
cmQpICYmDQo+ID4gPiAtICAgICAgICAgICAgICAgKChob3N0LT5jYXBzMiAmIE1NQ19DQVAyX0ZV
TExfUFdSX0NZQ0xFKSB8fCAhaXNfc3VzcGVuZCkpDQo+ID4gPiArICAgICAgICAgICAoKGhvc3Qt
PmNhcHMyICYgTU1DX0NBUDJfRlVMTF9QV1JfQ1lDTEUpIHx8ICFpc19zdXNwZW5kIHx8DQo+ID4g
PiArICAgICAgICAgICAgcG1fc3VzcGVuZF92aWFfZmlybXdhcmUoKSkpDQo+ID4NCj4gPiBTb3Jy
eSwgYnV0IHRoaXMgZG9lc24ndCB3b3JrLg0KPiA+DQo+ID4gRXZlbiBpZiBQU0NJIGlzIGEgZ2Vu
ZXJpYyBGVyBpbnRlcmZhY2UsIGl0IGRvZXNuJ3QgbWVhbiB0aGF0IGFsbCBQU0NJDQo+ID4gaW1w
bGVtZW50YXRpb25zIHdpbGwgY3V0IHRoZSB2Y2MgYW5kIHZjY3EgZm9yIHRoZSBNTUMgY2FyZCBh
dCBzeXN0ZW0NCj4gPiBzdXNwZW5kLg0KPiANCj4gSW5kZWVkLCB0aGVyZSdzIG5vdGhpbmcgZ3Vh
cmFudGVlZCBoZXJlLiAgTm9yIGRvY3VtZW50ZWQgaG93IGl0IHNob3VsZA0KPiBiZWhhdmUuICBC
YXNpY2FsbHkgdGhlIGZpcm13YXJlIGlzIGZyZWUgdG8gcG93ZXIgb2ZmIHRoZSBTb0MuIE9yIG5v
dCBkbyB0aGF0Lg0KPiAiSWYgZmlybXdhcmUgaXMgaW52b2x2ZWQsIGFsbCBvZGRzIGFyZSBvZmYi
Lg0KDQpJIHRob3VnaHQgd2UgY291bGQgYmUgZ3VhcmFudGVlZC4gQnV0LCBJIHVuZGVyc3Rvb2Qg
d2UgY291bGQgbm90IGJlIGd1YXJhbnRlZWQuLi4NCg0KPiA+IEluc3RlYWQsIHlvdSBuZWVkIHRv
IGRlY2lkZSB0aGlzIGJhc2VkIG9uIHNvbWUgc3BlY2lmaWMgRFQgcHJvcGVydHkuDQo+ID4gUGVy
aGFwcyBpbiBjb25qdW5jdGlvbiB3aXRoIHVzaW5nIHBtX3N1c3BlbmRfdmlhX2Zpcm13YXJlKCku
DQo+IA0KPiBMYXN0IHRpbWUgSSB3YXMgaW52b2x2ZWQgaW4gYSBkaXNjdXNzaW9uIGFib3V0IHRo
aXMsIHRoZSBQU0NJIHBlb3BsZQ0KPiBkaWRuJ3Qgd2FudCB0byBhZGQgYW55IHByb3BlcnRpZXMg
ZGVzY3JpYmluZyBwYXJ0aWN1bGFyIFBTQ0kgYmVoYXZpb3IuLi4NCj4gIklmIGZpcm13YXJlIGlz
IGludm9sdmVkLCBhbGwgb2RkcyBhcmUgb2ZmIi4NCj4gDQo+IFNvIHRoZSBvbmx5IHNhZmUgdGhp
bmcgdG8gZG8gaXMgdG8gZXhwZWN0IHRoZSB3b3JzdCwgYW5kIHByZXBhcmUgZm9yIGl0Li4uDQoN
CkEgaGVhZGFjaGUgcG9pbnQgaXMgYW4gZU1NQyBkZXZpY2UgY29uc3VtZXMgbXVjaCBwb3dlciBp
ZiB0aGF0IHRoZSBzeXN0ZW0NCmRvZXNuJ3QgY3V0IHRoZSB2Y2MgYW5kIHZjY3EgYW5kIGRvZXNu
4oCZdCBlbnRlciB0aGUgc2xlZXAgbW9kZS4NCkluIG90aGVyIHdvcmRzLCBpbiBwb3dlciBjb25z
dW1wdGlvbiBwb2ludCBvZiB2aWV3LCB0aGlzIHBhdGNoIHdpbGwNCmNhdXNlIGEgcmVncmVzc2lv
biBpbiBzdWNoIGEgY2FzZS4uLg0KDQpCeSB0aGUgd2F5LCBhYm91dCBhZGRpbmcgc3BlY2lmaWMg
RFQgcHJvcGVydHksIHRoZSByZWd1bGF0b3IgY2FuIGhhdmUNCnJlZ3VsYXRvci1vZmYtaW4tc3Vz
cGVuZCBwcm9wZXJ0eSBpbiByZWd1bGF0b3Itc3RhdGUtbWVtIHN1Ym5vZGUuDQpGb3Igbm93LCB3
ZSBkb2Vzbid0IHNlZW0gdG8gZ2V0IHRoZSBwcm9wZXJ0eSBmcm9tIGEgcmVndWxhdG9yIGNvbnN1
bWVyIHRob3VnaC4NClNvLCBJJ2xsIHRyeSB0byBhZGQgYW4gQVBJIG9mIHJlZ3VsYXRvciBmb3Ig
aXQuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gR3J7b2V0amUsZWV0
aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4g
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMNCg==
