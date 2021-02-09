Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3733147CA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Feb 2021 06:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhBIFDg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Feb 2021 00:03:36 -0500
Received: from mail-eopbgr1400112.outbound.protection.outlook.com ([40.107.140.112]:65533
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229742AbhBIFDY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Feb 2021 00:03:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnISP8MHZjetmP8tg52UrFiDlOu93tGs0wYnWgTCd9U1bynCrZUd2yT8HOtVE09cBLmKe40Nd1+D0XuQHWolHPKZJYiV50w5fc01m1m45T3zg89iVNtDnS6Ikp21PE7GjG024fQ/PUTapAQciXIP9pLRwNMqsivyU9vnu1oY5MYKKjv2RrGoJA2PPiUBEs0VOHcx2JaJxM5Jz9yeKOi8eUIRGJrgCsuct75hw5xG25XQr5iwH/2u4TWRU9l6hTxh99WOqg0TLYT5QDTDHYOzlfrxgH14RCAYqHd3V+R5tSuQQhcY4Hh6l4nQQl3SOWnJCh6TzuMy26Gbk91hjvfbxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCIJdmd7o8QlNJGqhsIs6P9dsqos6OUhRNWH8355cI0=;
 b=IljhNf/9YRznLpwrAfEJLtcZcZ1xT1454yGXXYLoLHO78/jP5YJsJISKJ0dJepam6Auc/yLYPM6OkXauVPqZOMdJb611qFctnnlXVBOs+hmkZ1iUCKDgKVODWnB/aw2ZRBCsKAuzFRrHY7vuzXltJcrscF70KTiOlg8/bbe/FKvuFxB3LJefqeFaEuSYh/Bn+qSprLJMMLEugSoLdCVZO1f+JFLbXFuysuZw58jhJz9RI9ihnKw5WAy7WKo2tgNNLWhuixSsSqD+FNp5HywU1jTdQVA+oOM4ztKuTd5RrOtJtfN5/Pv8SlF/GTXibKC+w0pZ/LuvxyI8DZPieJNfbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCIJdmd7o8QlNJGqhsIs6P9dsqos6OUhRNWH8355cI0=;
 b=N3xHwYdJ0FxTI/tilOhzY5v9DV22oUklEmKe6pb1wy+ounfPzONk205ykxBPnRubWZGkFk7vUblMoBTrdlRRdN2wlrHiw+vLrI6zlYIfY23RYtq+lFvbdgeWFoxutSc6cfPqA5uotk6D95mQYPyx4bheftieHyPwm1PdejpNbfQ=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB3934.jpnprd01.prod.outlook.com (2603:1096:404:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.25; Tue, 9 Feb
 2021 05:02:34 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3825.029; Tue, 9 Feb 2021
 05:02:34 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [PATCH v2] arm64: dts: renesas: add sdhi/mmc aliases
Thread-Topic: [PATCH v2] arm64: dts: renesas: add sdhi/mmc aliases
Thread-Index: AQHW/cTOUtO6F3MdPUy+cDEbUjgMHqpOAuOAgAAOObCAABLqgIAACaDQgAALlACAAQtF0A==
Date:   Tue, 9 Feb 2021 05:02:33 +0000
Message-ID: <TY2PR01MB369215A1E5832585BB15B306D88E9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1612752464-27838-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVBAy7wtB-_uOsTg5NiEorCwyHgENrwUQBxtcqRChvp1Q@mail.gmail.com>
 <TY2PR01MB3692141F9F2AD0E1CCD0D10ED88F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdXrgDG2AaDQO0cS_-G8-WDHGx2HFha6Nva8zhL8QLnnCQ@mail.gmail.com>
 <TY2PR01MB36923DB45B66F0EABA1256E2D88F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdVgTfp5-q08VvUEEtLOE+LeeEPCY5wsfvhCyuHGa9Xung@mail.gmail.com>
In-Reply-To: <CAMuHMdVgTfp5-q08VvUEEtLOE+LeeEPCY5wsfvhCyuHGa9Xung@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:459f:78fe:88b:75f5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2c754e3b-cff7-43f4-aacf-08d8ccb7e99a
x-ms-traffictypediagnostic: TYAPR01MB3934:
x-microsoft-antispam-prvs: <TYAPR01MB39342178734A7A6DAD3E88D8D88E9@TYAPR01MB3934.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ehJVKzCifbCAZT+b99CTwxi3lgMMfGsbXNueEnOFn7UHEdEsOAaH/CS7HpyeLRGLalHZuSgOaLNtou6lI1HIFcZxw3vv9PoinO+TGNa/5qwQelR7YP5mqSiqB+t9uLVlhNvJEu8cKkka/tkj6L5GdPA3IhtEkDvBTgxzHzm4QnyzHVJ5dOZUXCpq1XPUKExD7QsD3ZWErXWqKPQxThVcJr9O1ZQh/SBW6abyOSOONWYHWNfwocCsnLMRJUVnmABth83fLYYNFBRMTdNSEnmsZRy+EGvSdmzMlplughavHIRd53Oe0sJBZCm9z6GWP/S3pS1MqPo8U0tShlWXZQ5fYA95hQOnUqhqvMVhctwZnnbHxQQmQ8Y0AWxjEgTgdQvpc6x5dqH8mY2cJFVlssk5+Gb5kWH9VCWbe5eeoaaOmfWcyjBO/WSGJV+t+zkMzrkHm+pAyLEhozSGZbGPPI+Olp74d5L+L7vsxWSlKuySEcyGLV80oce5G5wxiIHBTn3hvMojBI23PT3vchhs3bg+kw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(76116006)(55016002)(54906003)(66476007)(66556008)(64756008)(66446008)(66946007)(52536014)(8936002)(53546011)(4326008)(5660300002)(86362001)(9686003)(33656002)(7696005)(6916009)(8676002)(2906002)(71200400001)(6506007)(478600001)(186003)(316002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TE1WNnBTMFQzcTdheFkvN296NGFFb3ZlRWh0RGdrOWNKdko0MmluRk1KR0kr?=
 =?utf-8?B?SkFhZVdZVmdiNTFWQVZPbFFyV0M5NlIzSE40UWEveVVTNmNCd3RnSEU4dm90?=
 =?utf-8?B?STVHY01lZzFlWkV4OGs4OTRmby9GbzhRWWJnUlM3aEE5Tm1rNGRScW5YTHFP?=
 =?utf-8?B?MjM5S3dIYnlqRUxsUWZQNkRJOXNycXhEb2VSbVZDeG9KQVl4Ti9WZ1dZMG1v?=
 =?utf-8?B?Z3NLNGRTa1FPMnFCWm5BdXcyNjc3dzBXdy9JVWJES0VxNVB6Tll3QWQwanhL?=
 =?utf-8?B?M2dteGx0SEMxWXRITXE5SmRoOUtJc2VUR2tZbmU5cFVha2JicEtjTTlVN3Zk?=
 =?utf-8?B?dDdBUUM2OXQ0V2RoRTlMUkMwdmlMdnN0UjhqTWlpWnlNbDNrcGhkZDgrd3dx?=
 =?utf-8?B?MnVmdXU5bytEdnQ4aytGR0k3M0pjTWNuaXZlMzc5ajRqcW9mZnFqQU83OExt?=
 =?utf-8?B?RWNhOWszUnM2VDIvL3hhVklqQXN1ZGJCU3VQKzE4YVFRekJpYnBJcHIzMmhh?=
 =?utf-8?B?dm84US9STGM1R0ZZTDdjby9DYmRiWXl6NS9KZXBmTTZtSDIwTmIwdGJObnZJ?=
 =?utf-8?B?dFZCUlhhU2VzdmJZRGoxcW1LanNWN2ZzTzlqOS9ySmErWGlLbXBJT3R2cERp?=
 =?utf-8?B?NkFTdHlCVytQekZ5S2tPa3o3KzdXNDJLNkFZSFl2VE0reGRCeTlIcnV3akhC?=
 =?utf-8?B?NHVrZWlkTVhGeFppYzZVYWRyUkZ4UndjZGh2S2pLSFdQZFVNcGFOWUZYYTBR?=
 =?utf-8?B?Wk96ZjA5U2VHcUg5RzJ3M0IrYURuVWJoT09ZOXVwampFcE1YSUJqUGJmMndx?=
 =?utf-8?B?Y0QxN2JweXlISEIvelo2TnN0R3loVzZhaXZWTlQxOGFPUGRZVWR3Z05sd1dL?=
 =?utf-8?B?cmxROXZJSDdRN2I3eFoxN29JR0c0a2NJblMvMG53NVNtM3FHN0VudHFyMzFC?=
 =?utf-8?B?YmFGbitrY1E3ZXFXdi9uQ1ZHaGt0N2IwVEpFejQrL2U0Q0tPVnF6SWlwRDBT?=
 =?utf-8?B?by9uZGdDMkQ3aGVTOXAvaUY4RkJBRnFYdFhPZ3hsNzdsMnIrRkN1UjZmZ3M4?=
 =?utf-8?B?T2FTaW0rajFvOFhyRzh3R3cyQ2hzdnRLdDMvK00vemppMGRKbkltb0xIOHZv?=
 =?utf-8?B?d1VyTHozU3pvd0NIYmFiYWh1ZzVZUTd1dWNMb2gwckpFdmR2Z0R2RnJYTVdx?=
 =?utf-8?B?WXZuTnlPWUs2Z00yMXkyM2VqU1BvRTFwckYwM3UyUGZ2TS9kdFNZQThnRURY?=
 =?utf-8?B?MjVSYWVBeUxsY1pFWTQzRGQwNEJNNFdMNmlMd0V3OTZnUDBKcm03c25QNDM0?=
 =?utf-8?B?L3VLbTNtYkx4MmZXcUlzQ0EyTDBlQ1d0aW5mQ3FYdG1DR2NXTHY1Z2J2eWtP?=
 =?utf-8?B?Z1k0WXBUdDhVd2NJakZXTHRHZ3BvVVU1bWFlRTQxdFIwcGZPRFpGTzVsV01D?=
 =?utf-8?B?V0NVRlRYY29ZUnhZSGdCUzZielVxQ0E4bVgwbjNJVmpXR2ZZUXBSMEZmNTBE?=
 =?utf-8?B?T1gvNU53NjF1NDVZejk0WDFYbHd5RSthVEY4UVpGN0FvZktlUm85SFp2MlpP?=
 =?utf-8?B?WDdKTlk1OHJXVnFyTFdkalprMWhCQlp4cU4zb0lFeWI3ZjZrdFRveXdTWGJC?=
 =?utf-8?B?Q2lVTGsyVURDdmVPRUJwalVpUWF0dEc2dXI3eExYWWdTUUsvZVdsamZyZ0ZT?=
 =?utf-8?B?VVZYSmVMWlhEN1loM1FmNEsrV0J4RnM4aGhPQnVIcTNuT0VSSGRqWlc2eXN5?=
 =?utf-8?B?bzd6cC80Zjk4amh6MllRN2hTeXM4aHdUbktJNnV5dnVreit0d0U1VkxRbUls?=
 =?utf-8?Q?FAPRt4f/cQSpW9TMppB4yimjx7lXMMVD3vKBc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c754e3b-cff7-43f4-aacf-08d8ccb7e99a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 05:02:34.1565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3apxarM1TtZDEP9ywOxFKdmPoW02OkTVM20BfXplLWc6+vd+v/z5j8ML0ijTXzuSCuUXUEIEQBSbHxSSLV0Y49vfCDn1PY9LQmbVn/NQS2LbcS8U6c2X5jybhXh2PQWg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3934
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogTW9uZGF5
LCBGZWJydWFyeSA4LCAyMDIxIDEwOjAxIFBNDQo+IE9uIE1vbiwgRmViIDgsIDIwMjEgYXQgMToz
MSBQTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5j
b20+IHdyb3RlOg0KPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuLCBTZW50OiBNb25kYXks
IEZlYnJ1YXJ5IDgsIDIwMjEgODo0NSBQTQ0KPiA+ID4gT24gTW9uLCBGZWIgOCwgMjAyMSBhdCAx
MTo1MyBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA+ID4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJl
bmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4sIFNl
bnQ6IE1vbmRheSwgRmVicnVhcnkgOCwgMjAyMSA2OjQ2IFBNDQo+ID4gPiA+ID4gT24gTW9uLCBG
ZWIgOCwgMjAyMSBhdCAzOjQ4IEFNIFlvc2hpaGlybyBTaGltb2RhDQo+ID4gPiA+ID4gPHlvc2hp
aGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+IC0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRjMC5kdHNpDQo+ID4gPiA+ID4gPiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0YzAuZHRzaQ0KPiA+ID4gPiA+ID4g
QEAgLTE0LDYgKzE0LDEyIEBADQo+ID4gPiA+ID4gPiAgICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDI+Ow0KPiA+ID4gPiA+ID4gICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiArICAgICAgIGFsaWFzZXMgew0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgIG1tYzAgPSAmc2RoaTA7DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgbW1jMSA9ICZz
ZGhpMTsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBtbWMzID0gJnNkaGkzOw0KPiA+ID4g
PiA+ID4gKyAgICAgICB9Ow0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQlRXLCB0aGlzIGlzIG9uZSBv
ZiB0aGUgb3RoZXIgaXNzdWVzIHdpdGggYWxpYXNlczogd2hlcmUgaXMgbW1jMj8NCj4gPiA+ID4g
PiBZZXMsIEkga25vdyB3aHkgaXQncyBkb25lIHRoaXMgd2F5IDstKQ0KPiA+ID4gPg0KPiA+ID4g
PiBBaCwgSSBpbnRlbmRlZCB0byBhc3NpZ24gdGhlIGFsaWFzZXMgMToxIGJldHdlZW4gIm1tY04i
IGFuZCAic2RoaU4iLg0KPiA+ID4gPiBCdXQsIHNob3VsZCB3ZSB1c2UgIm1tYzIgPSAmc2RoaTM7
IiBpbnN0ZWFkIG9uIHI4YTc3NGMwIGFuZCByOGE3Nzk5MD8NCj4gPiA+DQo+ID4gPiBJJ20gZmlu
ZSB3aXRoIHRoZSBudW1iZXJpbmcgeW91IHVzZWQsIGFzIHRoZSBhbGlhc2VzIG1hdGNoIHRoZSBl
eGlzdGluZw0KPiA+ID4gbGFiZWxzLg0KPiA+ID4NCj4gPiA+IEhvd2V2ZXIsIG9uIFItQ2FyIEdl
bjIgd2UgZGlkIHVzZSBjb250aWd1b3VzIG51bWJlcmluZyBvZiB0aGUgbGFiZWxzLA0KPiA+ID4g
YXMgZWFybHkgcmV2aXNpb25zIG9mIHRoZSBkYXRhc2hlZXQgdXNlZCBjb250aWd1b3VzIG51bWJl
cmluZyBmb3IgdGhlDQo+ID4gPiBpbnRlcmZhY2VzLCB3aGlsZSBsYXRlciByZXZpc2lvbnMgY2hh
bmdlZCB0aGlzLg0KPiA+ID4gSSB0aGluayB0aGUgc2Vuc2libGUgdGhpbmcgdG8gZG8gaXMgdG8g
bWFrZSB0aGUgYWxpYXNlcyBtYXRjaCB0aGUgZXhpc3RpbmcNCj4gPiA+IGxhYmVscywgdG9vLg0K
PiA+DQo+ID4gVGhhbmsgeW91IGZvciB0aGUgY29tbWVudCBhYm91dCBSLUNhciBHZW4yLiBJIGRp
ZG4ndCByZWFsaXplZCB0aGF0Lg0KPiA+IE9uIFItQ2FyIEdlbjIgU29DcywgdGhleSBhbHNvIGhh
dmUgbW1jaWYgY29udHJvbGxlcnMuIFNvLCBJJ20gdGhpbmtpbmcNCj4gPiB0aGUgbW1jIGFsaWFz
ZXMgc2hvdWxkIHVzZSBjb250aWd1b3VzIG51bWJlcmluZyBmb3IgR2VuMiBtbWNpZiBhbmQgc2Ro
aQ0KPiA+IGF0IGxlYXN0LiBBbmQsIHBlcmhhcHMsIEkgZmVlbCB1c2luZyBzYW1lIHRoaXMgcnVs
ZSAoY29udGlndW91cyBudW1iZXJpbmcpIG9uDQo+ID4gR2VuMyBpcyBiZXR0ZXIuIEJ1dCwgd2hh
dCBkbyB5b3UgdGhpbms/DQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBjb21tZW50IGFib3V0IE1N
Q0lGLCAgSSBoYWQgZm9yZ290dGVuIGFib3V0IHRoYXQuDQo+IFItQ2FyIEdlbjIgaXMgZXZlbiBt
b3JlIGNvbXBsaWNhdGVkLCBhcyB5b3UgaGF2ZSAxLCAzLCBvciA0IFNESEkNCj4gaW5zdGFuY2Vz
LCBhbmQgbWF5IGhhdmUgMSBvciAyIE1NQyBpbnN0YW5jZXMuICBTbyBpcyBtbWMwIHRoZSBmaXJz
dA0KPiBTREhJIGludGVyZmFjZSwgb3IgdGhlIGZpcnN0IE1NQyBpbnRlcmZhY2U/DQoNCkkgaW50
ZW5kZWQgdGhhdCBtbWMwIGlzIHRoZSBmaXJzdCBNTUMgaW50ZXJmYWNlIGFzIGFscGhhYmV0IG9y
ZGVyaW5nDQpvZiB0aGUgbGFiZWxzIChtbWNpZk4gdnMgc2RoaU4pLg0KDQo+IFdvcnNlLCB0aGV5
IHNoYXJlIHBpbnMuIFNvIHRoZSB1c2VyIGNhbiBhY3R1YWxseSBjaG9vc2UgdG8gdXNlIGFuIFNE
SEkgb3INCj4gTU1DSUYgaW5zdGFuY2Ugb24gc29tZSBvZiB0aGUgcGluIGdyb3VwcyAoZm9yIG5v
dyBpZ25vcmluZyB0aGF0IE1NQ0lGDQo+IHN1cHBvcnRzIDEvNC84IGJpdCwgYW5kIFNESEkgb25s
eSAxLzQpLg0KPiANCj4gSGVuY2UgSSB0aGluayBvbiBSLUNhciBHZW4yIHlvdSBoYXZlIHRvIGFk
ZCB0aGUgYWxpYXNlcyB0byB0aGUgYm9hcmQgRFRTDQo+IGZpbGVzLCBiYXNlZCBvbiB0aGUgY29u
bmVjdG9yIGxhYmVscyBvbiB0aGUgcGh5c2ljYWwgYm9hcmRzLCB3aGljaA0KPiBicmluZ3MgdXMg
YmFjayB0byB0aGUgb3JpZ2luYWwgaWRlYSBiZWhpbmQgdGhlIGFsaWFzZXMuLi4NCg0KSSBnb3Qg
aXQuIEknbGwgYWRkIHN1Y2ggYWxpYXNlcyBvbiBSLUNhciBHZW4yLg0KDQpCZXN0IHJlZ2FyZHMs
DQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
