Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345EC313272
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Feb 2021 13:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbhBHMec (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Feb 2021 07:34:32 -0500
Received: from mail-eopbgr1400120.outbound.protection.outlook.com ([40.107.140.120]:5182
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231565AbhBHMcl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 07:32:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbO1kn79BRDj784AGP2YJyoiT1xyihUHLZls9CYTWQbMXJw2i7IWoa5va4nVnudNTUFHjhmO6PR3Aqt/6p8ND+0ojwSibM90HFtKibqaZKeK2zhwYfALIZTDFiD8ev80KUCPwI2gbb/qwtkb5hOhaSqiPMFEws1tpatu/eyuzMgxsqtneAW+E2vik/ngBjvHvuKaeZGgXEW232QyMJ5LoNiLxH6NiSILy8MyJOc8R13TWvAnu32cvXirmIvBIUO7PjEO3KQ5boXrElHK2mfDMs6er2EPLFHBFTjYvlL6frm2+z71W710tnMYPSwn23tcBRHgjdzUcdZQfZNQH19RIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VWStYJtzVSpW1qEvQI8K3W7UlnLhBvvZtypex5HqNk=;
 b=d8UmnfezIc19Sp7/3tn7wcUtCOivr9dM6RnRrnc+Fs5L5TS678iTzOitpidLGpeZeObtscI4bzgv4E4x1MZ7quf7ga6g7Sf5zh5OtKE5/0pNSPY5D37f4NRFgCa9wOOOmzZF6XmX6FVOTZWFDLzsDrRjB/rPbg+S7QHC6L6LJUmgSwCu7RnHB/MTdY4kzCBgKR0I2tDQbPgLyVKhscXjpbkekk93T2QKrTMvFqmzn709fXQvAHz0h5MAx7eg77jIZGPsWs3LhzAg6yYok+9fPVKoy98gENI+phYNOpEEAHuyszpXPOmXoRsftSg0dr2mrNMEFqqKimHuYQRA/yDeng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VWStYJtzVSpW1qEvQI8K3W7UlnLhBvvZtypex5HqNk=;
 b=nHE1tA2zvGb89+TUk9ZkNV2yZ4E4AKCq6J1B2eab8ZvdlaH23MX7/iHZUmxSpBYxIPL3BvuqZXko6cOfqn9Ht8wKnvWP0LZsMI5LfQITjPwh1EMG85vmMGcnPVZbLgEWNPt+4vHE7PrpwI5zFPqElt9nkfDFh3z2HUgUE3CNCqw=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1551.jpnprd01.prod.outlook.com (2603:1096:403:d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Mon, 8 Feb
 2021 12:31:51 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3825.029; Mon, 8 Feb 2021
 12:31:51 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [PATCH v2] arm64: dts: renesas: add sdhi/mmc aliases
Thread-Topic: [PATCH v2] arm64: dts: renesas: add sdhi/mmc aliases
Thread-Index: AQHW/cTOUtO6F3MdPUy+cDEbUjgMHqpOAuOAgAAOObCAABLqgIAACaDQ
Date:   Mon, 8 Feb 2021 12:31:51 +0000
Message-ID: <TY2PR01MB36923DB45B66F0EABA1256E2D88F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1612752464-27838-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVBAy7wtB-_uOsTg5NiEorCwyHgENrwUQBxtcqRChvp1Q@mail.gmail.com>
 <TY2PR01MB3692141F9F2AD0E1CCD0D10ED88F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdXrgDG2AaDQO0cS_-G8-WDHGx2HFha6Nva8zhL8QLnnCQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXrgDG2AaDQO0cS_-G8-WDHGx2HFha6Nva8zhL8QLnnCQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:98ea:2273:b01a:3c41]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f9624c96-33b0-4580-23a5-08d8cc2d82d7
x-ms-traffictypediagnostic: TYXPR01MB1551:
x-microsoft-antispam-prvs: <TYXPR01MB1551843E3F5A5AA325719503D88F9@TYXPR01MB1551.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HQuVO/gLXbvVXg89f6k6jtstCaRaOu6KmyLwWELNnBz6wvKenP/FVAt4C9Yh7tfA3N3joSKqSoTbH7d7KgRe7fXYZcSGGq9WgCk0Umgs9OHeWXoYe1wUXjZnoZYQjxKgNkAh9v6mvayNm5x9Tz30PmHQFM9JqFJCLcffpkZwnSBGWTQA23N66Snhjj5x7WBlyYx8urWKbtkCWQ0csKCGgTzNdDBx28UNoT78LNvaaAMUM4+vOsd2fK61ebYtmdP+d3/Evsf9WqpAXbdf1bsHXcpSgnr36cZ6piIbzW1qYaeN9j1Gs1RbfQhEjylhBtmUFBieShnKrZXoZy2IL8ALoo3XhW0ZKrzVL2Qu/WW2bOX8czCnwAdsQBleN6/nzQdMHiN1BVDWohGASp6NmIhQ2Zus9eM/p5xDtZKLfnCVDU+u2poOSXxRxGN0kJD+YlmcqQVkk12EFaQ3mHotTSvxOSEOpunVreA/HXh34Rqt66Ej6ZGoJzLZ1Ci72K06kkC/tG0Y2ndvn7+9iMWSUMjxeg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(86362001)(55016002)(6916009)(8676002)(2906002)(33656002)(9686003)(7696005)(6506007)(66446008)(53546011)(64756008)(66476007)(5660300002)(66556008)(66946007)(478600001)(52536014)(54906003)(316002)(76116006)(8936002)(186003)(4326008)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UlNTQ05tREE3TGNMaUVUQ1pIVE04djkvbUNpelBEbmdoZkRBT1VOcy9PaDNa?=
 =?utf-8?B?M2RuODZNU3NlT2J4d2dGNkRiVE15ZmNSakpnVHdzSGRyZUgrWXNWc1N4V09P?=
 =?utf-8?B?TUtTOXNacHM1QTZ3N0FtaE9sRGZrOWc3S0NRVGNicXNFTDl3VVNaRXhzMEx0?=
 =?utf-8?B?d1VvdnhOYllSWE1qSWE4dy9nQkU3SkxDT25BNGRGVFM1MmN3LzJwcUpCOXJs?=
 =?utf-8?B?OHhOUWFpLzI2UnZKQytZQmQzcklqQlFydEtHa3E1T0xmOGg1ZHZjdXMvRFla?=
 =?utf-8?B?WnVmM3QvS0c0Q1JzS2poUS9peG5QSVdSQlNYRWVMRy9GSXVsS2dlblQ1NjBS?=
 =?utf-8?B?dzRIUmVkSDI4QmJKUUJyeXZuMDdmQjBvbXcrbE5TL2tUb3JBZXFlMkZZWnJ4?=
 =?utf-8?B?ZE1MbHYzQVNhNS9XMlVHRXVPeEIxRkJJWU5xRXNrL2JhWklISHp2VElFOTUx?=
 =?utf-8?B?VDZ6Wkd0RFltcENEZ2lLbitKVGtSaDEzeFl5bEhOVUdSOEI0Y0pKRCt6WWFR?=
 =?utf-8?B?bXhWZi9FaGlDOEVrZEpvSm9kMUFEVFMrTmtMZmtkN2lXbmFhTVlEOEhYVmRW?=
 =?utf-8?B?c1JzN3ZNR0FIM3BLYUJYcmY0eDVSYkpPMFM2ajJmb0VjeGpPa1RuVmtUZmlw?=
 =?utf-8?B?clJPenJrM0FqVS8wVUVCbFpIcEc4YXg2L3hpMWpKM2RZZHpIem1qQUZQcGNh?=
 =?utf-8?B?dGZLRXRwRC9TbWo4aW5SUWc3R0tvaGRFa2orY0JqWDN3WHRja3RBTCs4Vlp6?=
 =?utf-8?B?eXlrdmFVeFJuRTJOeTZOTi9vRUN0QkRsUHc1U3RCc05ZMXV6cjVvbkE1TjQ5?=
 =?utf-8?B?TE5DTHA5L2FEcWQ5QkhXM0NUWHRmb2xEZDFEYnczZXByajZpZGZad3dJSUlK?=
 =?utf-8?B?dndqQVRxR3RmNG9Mb3FjTFV5dzM3L25uS2JZYUlRc29NWGo0RzBONUpyb25R?=
 =?utf-8?B?L1Z3SU5jVXZxYlFxd2xzMSt4SVAyZERLcGFoaTFWend4S3dPU2wyMjFLaG9T?=
 =?utf-8?B?cmxhVnY4TFFwYWFWRWZacldHTzB5akxCWm56bTVaQWw0dkI1cUE1RmdHbHBj?=
 =?utf-8?B?OTZRS3JxeGdNSnZiSVVkeXFDREpZZ2lFLzVzY3ZVeTFRL0RRUFBBUmFNeXk2?=
 =?utf-8?B?T2d2RDZESUw0NDArQkk1SEtaYjhoeUdYNExmTEtaNVJkTlI0NG5yTWhQT0pS?=
 =?utf-8?B?NVliNkJQanVObGluZEd6M1JCU1FvejNES0dwcU0wWlhuVFlFTnRwd3lRTzNK?=
 =?utf-8?B?MFNsU01qWnMvZ1Z0YzZUT1Z4Y1d5YmtjdnFRdnZjTlhlc3R2VmFUSU1uWkpE?=
 =?utf-8?B?MFFyc0M5V29vczJ4aVo5OERMS2lmcEJmV3FrTW8wakpyK2xiSWIzc0Vrbmp1?=
 =?utf-8?B?YUlsOFUyMFh1enFqMzBaQnZVUkRBVHZ4YlRXSXplRDJ2MjhEdTU3YmJpc3pz?=
 =?utf-8?B?d2EvMzhRUHlhNHhoUFNZcmZGQk5lVmd2UUs0N1pheGVmWFJSM0pxSU92WDNs?=
 =?utf-8?B?RkNaejkvVSsrY2R0a1kzWkZQUk1EUmxtMU42VUl3Rncyc085OU1FZFdCWmRo?=
 =?utf-8?B?cE0rRFRCc0t6NWZvN0MxaGx0T1F3Y0lmUHlnM2RsSkNGRVNLSGZoT1pxTzlV?=
 =?utf-8?B?WHRkdFM4cUdxK0ZhOGVEK3RPaHl2OWpuRTlMVk5PMjNVUmpjakpQR1hwL0hq?=
 =?utf-8?B?N05CNHIxYWkvYmc1UFFMbm5vbXd1UTVITjEvME1mSGtlY3lRZXRJdmNCL25N?=
 =?utf-8?B?RWs5SUtjZXdzWnBvRWR1NU5VcVVsWXBPamcrYW5vVnpjamVBekpYaklyM3g3?=
 =?utf-8?Q?4Eub0uqsVVifYZgqbTgXqq+uk5qIfH7bQJlTc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9624c96-33b0-4580-23a5-08d8cc2d82d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 12:31:51.2308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CsVSdX/ujdZVrQpGG2EZLJs33M3Gj5Q8F4IRve8QbgWl+Y/TSIi3eisjIhC77PcgY8F6uryrxLpdyU1R4QTXpmxBMbm4Hm7wjUUP9zmelt9wnz1sfR/C2sc3h5mj/RbW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1551
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogTW9uZGF5
LCBGZWJydWFyeSA4LCAyMDIxIDg6NDUgUE0NCj4gT24gTW9uLCBGZWIgOCwgMjAyMSBhdCAxMTo1
MyBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5j
b20+IHdyb3RlOg0KPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuLCBTZW50OiBNb25kYXks
IEZlYnJ1YXJ5IDgsIDIwMjEgNjo0NiBQTQ0KPiA+ID4gT24gTW9uLCBGZWIgOCwgMjAyMSBhdCAz
OjQ4IEFNIFlvc2hpaGlybyBTaGltb2RhDQo+ID4gPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVu
ZXNhcy5jb20+IHdyb3RlOg0KPHNuaXA+DQo+ID4gaWYgcG9zc2libGUsIEknZCBsaWtlIHRvIGFw
cGx5IHRoaXMgcGF0Y2ggdjUuMTAueHggdG9vLg0KPiA+IFNvLCBzaG91bGQvbWF5IEkgYWRkIHRo
ZSBmb2xsb3dpbmcgRml4ZXMgdGFnIGZvciBpdD8NCj4gPg0KPiA+IEZpeGVzOiA3MzIwOTE1Yzg4
NjEgKCJtbWM6IFNldCBQUk9CRV9QUkVGRVJfQVNZTkNIUk9OT1VTIGZvciBkcml2ZXJzIHRoYXQg
ZXhpc3RlZCBpbiB2NC4xNCIpDQo+IA0KPiBJIGNhbiBhZGQgdGhlIHRhZyB3aGlsZSBhcHBseWlu
Zy4NCg0KVGhhbmtzIQ0KDQo8c25pcD4NCj4gPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I4YTc3NGMwLmR0c2kNCj4gPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3I4YTc3NGMwLmR0c2kNCj4gPiA+ID4gQEAgLTE0LDYgKzE0LDEyIEBADQo+ID4g
PiA+ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+ID4gPiA+ICAgICAgICAgI3NpemUt
Y2VsbHMgPSA8Mj47DQo+ID4gPiA+DQo+ID4gPiA+ICsgICAgICAgYWxpYXNlcyB7DQo+ID4gPiA+
ICsgICAgICAgICAgICAgICBtbWMwID0gJnNkaGkwOw0KPiA+ID4gPiArICAgICAgICAgICAgICAg
bW1jMSA9ICZzZGhpMTsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIG1tYzMgPSAmc2RoaTM7DQo+
ID4gPiA+ICsgICAgICAgfTsNCj4gPiA+DQo+ID4gPiBCVFcsIHRoaXMgaXMgb25lIG9mIHRoZSBv
dGhlciBpc3N1ZXMgd2l0aCBhbGlhc2VzOiB3aGVyZSBpcyBtbWMyPw0KPiA+ID4gWWVzLCBJIGtu
b3cgd2h5IGl0J3MgZG9uZSB0aGlzIHdheSA7LSkNCj4gPg0KPiA+IEFoLCBJIGludGVuZGVkIHRv
IGFzc2lnbiB0aGUgYWxpYXNlcyAxOjEgYmV0d2VlbiAibW1jTiIgYW5kICJzZGhpTiIuDQo+ID4g
QnV0LCBzaG91bGQgd2UgdXNlICJtbWMyID0gJnNkaGkzOyIgaW5zdGVhZCBvbiByOGE3NzRjMCBh
bmQgcjhhNzc5OTA/DQo+IA0KPiBJJ20gZmluZSB3aXRoIHRoZSBudW1iZXJpbmcgeW91IHVzZWQs
IGFzIHRoZSBhbGlhc2VzIG1hdGNoIHRoZSBleGlzdGluZw0KPiBsYWJlbHMuDQo+IA0KPiBIb3dl
dmVyLCBvbiBSLUNhciBHZW4yIHdlIGRpZCB1c2UgY29udGlndW91cyBudW1iZXJpbmcgb2YgdGhl
IGxhYmVscywNCj4gYXMgZWFybHkgcmV2aXNpb25zIG9mIHRoZSBkYXRhc2hlZXQgdXNlZCBjb250
aWd1b3VzIG51bWJlcmluZyBmb3IgdGhlDQo+IGludGVyZmFjZXMsIHdoaWxlIGxhdGVyIHJldmlz
aW9ucyBjaGFuZ2VkIHRoaXMuDQo+IEkgdGhpbmsgdGhlIHNlbnNpYmxlIHRoaW5nIHRvIGRvIGlz
IHRvIG1ha2UgdGhlIGFsaWFzZXMgbWF0Y2ggdGhlIGV4aXN0aW5nDQo+IGxhYmVscywgdG9vLg0K
DQpUaGFuayB5b3UgZm9yIHRoZSBjb21tZW50IGFib3V0IFItQ2FyIEdlbjIuIEkgZGlkbid0IHJl
YWxpemVkIHRoYXQuDQpPbiBSLUNhciBHZW4yIFNvQ3MsIHRoZXkgYWxzbyBoYXZlIG1tY2lmIGNv
bnRyb2xsZXJzLiBTbywgSSdtIHRoaW5raW5nDQp0aGUgbW1jIGFsaWFzZXMgc2hvdWxkIHVzZSBj
b250aWd1b3VzIG51bWJlcmluZyBmb3IgR2VuMiBtbWNpZiBhbmQgc2RoaQ0KYXQgbGVhc3QuIEFu
ZCwgcGVyaGFwcywgSSBmZWVsIHVzaW5nIHNhbWUgdGhpcyBydWxlIChjb250aWd1b3VzIG51bWJl
cmluZykgb24NCkdlbjMgaXMgYmV0dGVyLiBCdXQsIHdoYXQgZG8geW91IHRoaW5rPw0KDQpCZXN0
IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
