Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9603326586D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 06:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbgIKElW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 00:41:22 -0400
Received: from mail-eopbgr1410122.outbound.protection.outlook.com ([40.107.141.122]:59696
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725468AbgIKElS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 00:41:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjbrLTxbPVZoiYw5jd7062TNoUezuEQaEbv4X/DO/zIuNjSGjddyBYXi/IDZkZKuDoPIuykvNxOrMayU07DDITAPDY6KVRSolpicMbSYB0JS88gSYgXP/G5r2GllX8tWcJkxqTy5qcmEFdZTv31ATK9MDcMNcphqmer4LJAH21hnPlgwL0QZsKKnlAfCpp6aYgWI22iXinEklDV+gCBSx5Ybt8+bdFnSYg1RH30sfHwbA43eXQ7fRtL6NkH/oDwsou2IUd7ZZHPk7s7kCjScvNcuHfcZVxJyW2nTmQim1x36dnVnWFhD9WdISxD1t4NqnFW3K0u71A5BlntCs3AmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q3HelD9KjO+G7zLIo88Jl23Bx4ZOlB2Hkc9XM2DRHo=;
 b=mMtrpv05qua05de3u1dbMXkHoazytwxJx2GIgJfpExqjWIMrgvU0gQbpavjR543t9etV9DCUyAQT67FpGSwY29pU7NXS5HoK+7kDqWHUbODXa8lesox6NPvlfghNMLWdrSs5qJ4fuSfPNKJXoEqQmU3Zhp+9Xf0M09IeFXx1PqvUK0E2MhufAuobmaV8GhVYg77Ir0IqOKJqOI4Sg4nad6BoZCbV7iL+FVCQfwdel6SOQOux6dS5/f6BzCBGHm07VgNOJFeON8HfmgQH00LInRL9SnaIHq2JiqYkzi2Je9Sfi0Smr84jvCcTkdM1VeSN3SXPEcPK4bnu2eldwKzw6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q3HelD9KjO+G7zLIo88Jl23Bx4ZOlB2Hkc9XM2DRHo=;
 b=n+D4cfEFBkl0M9NamOBcycI0U/JgCE9uePptK40Zq5GcOIGvewthU6/a1a3Em0rqugBn10UNtyJqdnC8K4DjW5bdivEG9s/XbgkZLh5Xo4fkQA3ZszGhTkzTXqQR9NnZ38Ez0OyX6DBn0YoslKDmW7vwZj/P+3lTebDPh4ueRiU=
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com (2603:1096:604:33::12)
 by OSAPR01MB4195.jpnprd01.prod.outlook.com (2603:1096:604:30::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 04:41:15 +0000
Received: from OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::1d16:3e99:8fb2:84e1]) by OSAPR01MB3683.jpnprd01.prod.outlook.com
 ([fe80::1d16:3e99:8fb2:84e1%7]) with mapi id 15.20.3370.016; Fri, 11 Sep 2020
 04:41:15 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 4/4] clk: renesas: cpg-mssr: Add support for R-Car V3U
Thread-Topic: [PATCH v2 4/4] clk: renesas: cpg-mssr: Add support for R-Car V3U
Thread-Index: AQHWhqsKhQBMOZQwskyAzJUHTjOCmqlh3MiAgAD9MuA=
Date:   Fri, 11 Sep 2020 04:41:15 +0000
Message-ID: <OSAPR01MB368323B8135ABB73C1866BEAD8240@OSAPR01MB3683.jpnprd01.prod.outlook.com>
References: <1599657211-17504-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599657211-17504-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVSCr4UK1SZORcmhN0xy-OFw4D3g=CvPLvD0+DNFCu7qQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVSCr4UK1SZORcmhN0xy-OFw4D3g=CvPLvD0+DNFCu7qQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:64a2:c8a4:9548:6c30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 21fa27c8-39a0-40af-080d-08d8560ceb26
x-ms-traffictypediagnostic: OSAPR01MB4195:
x-microsoft-antispam-prvs: <OSAPR01MB419543643B6813390295EB53D8240@OSAPR01MB4195.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rYFFPAUYYVRgyVYoTq4vR9rl3CNa1EGDGqd3yIOoY9DrVtqZmFW7M9xGUjrNG42cCCaadnwfWDZZozE/KhpQ633Wt/KbsjSrWsueNqwpMnvu4Gekj2HTSscHp4dcwJIwdBjUDNLK6R5uJvzv16zrrw+joelvKAs9S3RtAXMkioMxSdPLcvOunlnnEk8hLmztdapNbei/+jMN342J/hH7bTAbJTgvCKlYhKePRqKnu4h13qfLXCzH/p8yNXbol8shqTi05+ai30yr590SnEL8UV072pWzXwGjBBVvFz4xvWSWdL7ywnz41XK/Isb1dr0oqXqSjHE4v61p+YZncuOzHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3683.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(71200400001)(478600001)(316002)(54906003)(8676002)(86362001)(9686003)(5660300002)(8936002)(186003)(2906002)(6916009)(55016002)(76116006)(66446008)(64756008)(33656002)(66946007)(66476007)(53546011)(66556008)(52536014)(4326008)(7696005)(83380400001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: UWYRZzlp5CVazXJ1p065yMM4nA15AEXhy45FqrdhR5sPmCttM3ekqVIyd+FHZZenTfdoa0sBFkV3mzDMMSZt4W7RkH4uaRlpl2qpnLjJiOEPBHNVxBA7lfopKdQjAwtpKKx1EPydWvHClf2GrJtiQuyaFGp/spRjCdh6eyOKPcgXcm152obIqsoBg9MvqXmt13Sb9TGrJLH5pfuryrScuV1ZW1CYDMki5xD4cJIAS2gfUe3dsqSA0OtXt1DOKJI0VoQc7TpsgsFcH6hnUzonUMyoFV8zC4XXnJ95Eco1xfGwI+ELUjHH9sV9S/KgGAIJORZX8VnimjOOe5iua8Cn2k1Xf2kIkT+svfZ3LkSgp6+Go2tfqLBQpXmMYHGP0XNxGY9ndIttKzkPz4QSDAhaxjzLaC4yDIp3Z0RUsmq+vJT0+zWUtNyN16nLDJhuezYjnlLS5HV1jztBu/zyJwuyLtFh5IvgLpihlk0TuVJO/jViJdhmUfkt3XV/m3LQ/V20tkvfhDnWo6jKuU1vpkJQQ6WhGSJwnW3ebl9uKcIV3tpawRB0EnjtHcZxPwCEHuLXzj0jiNQZNZ3RZOkXjbpSYR3kefXVTxAO8DCgvvoSSlrLzfJOACaVIgkSelR0Qm99WvV2sHL2er8B+gh5N+tJJNT+E9NP1inBgKDt6Mk1QemKq4G1MdMUn1XY6DgWwSU/4m5wAZEs8lUGwecRezCDPw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3683.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21fa27c8-39a0-40af-080d-08d8560ceb26
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 04:41:15.6240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gKg+0IMdrIFforoIOSB7NCZVKUjKB6c+H0V9WPHjHXE09UXBm9tNrP5sS+zrv5R8Vr3kJ1SpH8nbdegWg3twOUe74Q/efc+3eYwJxCa9vkgJPHRLRv4qkFie5ImQJv7C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4195
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxMCwgMjAyMCAxMDoy
MCBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0KPiBPbiBXZWQsIFNlcCA5LCAyMDIwIGF0
IDM6MTMgUE0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVz
YXMuY29tPiB3cm90ZToNCj4gPiBJbml0aWFsIHN1cHBvcnQgZm9yIFItQ2FyIFYzVSAocjhhNzc5
YTApLCBpbmNsdWRpbmcgY29yZSwgbW9kdWxlDQo+ID4gY2xvY2tzIGFuZCByZWdpc3RlciBhY2Nl
c3MsIGJlY2F1c2UgcmVnaXN0ZXIgc3BlY2lmaWNhdGlvbiBkaWZmZXJzDQo+ID4gZnJvbSBSLUNh
ciBHZW4yLzMuDQo+ID4NCj4gPiBJbnNwaXJlZCBieSBwYXRjaGVzIGluIHRoZSBCU1AgYnkgTFVV
IEhPQUkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUh
DQo+IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I4
YTc3OWEwLWNwZy1tc3NyLmMNCj4gDQo+ID4gKyNkZWZpbmUgQ1BHX1BMTDIwQ1IgICAgICAgICAg
ICAweDA4MzQNCj4gPiArI2RlZmluZSBDUEdfUExMMjFDUiAgICAgICAgICAgIDB4MDgzOA0KPiA+
ICsjZGVmaW5lIENQR19QTEwzMENSICAgICAgICAgICAgMHgwODNjDQo+ID4gKyNkZWZpbmUgQ1BH
X1BMTDMxQ1IgICAgICAgICAgICAweDA4NDANCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgY3BnX2NvcmVfY2xrIHI4YTc3OWEwX2NvcmVfY2xrc1tdIF9faW5pdGNvbnN0ID0gew0KPiA+
ICsgICAgICAgLyogRXh0ZXJuYWwgQ2xvY2sgSW5wdXRzICovDQo+ID4gKyAgICAgICBERUZfSU5Q
VVQoImV4dGFsIiwgIENMS19FWFRBTCksDQo+ID4gKyAgICAgICBERUZfSU5QVVQoImV4dGFsciIs
IENMS19FWFRBTFIpLA0KPiA+ICsNCj4gPiArICAgICAgIC8qIEludGVybmFsIENvcmUgQ2xvY2tz
ICovDQo+ID4gKyAgICAgICBERUZfQkFTRSgiLm1haW4iLCBDTEtfTUFJTiwgICAgIENMS19UWVBF
X1I4QTc3OUEwX01BSU4sIENMS19FWFRBTCksDQo+ID4gKyAgICAgICBERUZfQkFTRSgiLnBsbDEi
LCBDTEtfUExMMSwgICAgIENMS19UWVBFX1I4QTc3OUEwX1BMTDEsIENMS19NQUlOKSwNCj4gPiAr
ICAgICAgIERFRl9CQVNFKCIucGxsNSIsIENMS19QTEw1LCAgICAgQ0xLX1RZUEVfUjhBNzc5QTBf
UExMNSwgQ0xLX01BSU4pLA0KPiA+ICsgICAgICAgREVGX1BMTCgiLnBsbDIwIiwgQ0xLX1BMTDIw
LCAgICBDUEdfUExMMjBDUiksDQo+ID4gKyAgICAgICBERUZfUExMKCIucGxsMjEiLCBDTEtfUExM
MjEsICAgIENQR19QTEwyMUNSKSwNCj4gPiArICAgICAgIERFRl9QTEwoIi5wbGwzMCIsIENMS19Q
TEwzMCwgICAgQ1BHX1BMTDMwQ1IpLA0KPiA+ICsgICAgICAgREVGX1BMTCgiLnBsbDMxIiwgQ0xL
X1BMTDMxLCAgICBDUEdfUExMMzFDUiksDQo+IA0KPiBHaXZlbiB0aGUgdXNlcnMgb2YgdGhlIERF
Rl9HRU4zX1NEKCkgYW5kIERFRl9ESVY2UDEoKSBqdXN0IGhhcmRjb2RlIHRoZQ0KPiByZWdpc3Rl
ciBvZmZzZXRzLCBhbmQgdGhlIENQR19QTEwqQ1IgYXJlIHVzZWQgaW4gYSBzaW5nbGUgcGxhY2Ug
b25seSwNCj4gcGVyaGFwcyBpdCBtYWtlcyBzZW5zZSB0byBoYXJkY29kZSB0aGUgb2Zmc2V0cyBo
ZXJlLCB0b28sIGFuZCBkcm9wIHRoZQ0KPiBkZWZpbmVzPw0KDQpJIHNlZS4gSSdsbCBmaXggaXQu
DQoNCj4gICAgWy4uLl0NCj4gDQo+ID4gKyAgICAgICBERUZfRElWNlAxKCJtc28iLCAgICAgICBS
OEE3NzlBMF9DTEtfTVNPLCAgICAgICBDTEtfUExMNV9ESVY0LCAgMHg4N2MpLA0KPiA+ICsgICAg
ICAgREVGX0RJVjZQMSgiY2FuZmQiLCAgICAgUjhBNzc5QTBfQ0xLX0NBTkZELCAgICAgQ0xLX1BM
TDVfRElWNCwgIDB4ODc4KSwNCj4gPiArICAgICAgIERFRl9ESVY2UDEoImNzaTAiLCAgICAgIFI4
QTc3OUEwX0NMS19DU0kwLCAgICAgIENMS19QTEw1X0RJVjQsICAweDg4MCksDQo+IA0KPiA+ICsv
Kg0KPiA+ICsgKiBDUEcgQ2xvY2sgRGF0YQ0KPiA+ICsgKi8NCj4gPiArLyoNCj4gPiArICogICBN
RCAgICAgICAgIEVYVEFMICAgICAgICAgIFBMTDEgICAgUExMMjAgICBQTEwzMCAgIFBMTDQgICAg
UExMNSAgICBQTEw2ICAgIE9TQw0KPiA+ICsgKiAxNCAxMyAoTUh6KSAgICAgICAgICAgICAgICAg
ICAgMjEgICAgICAzMQ0KPiA+ICsgKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICsgKiAwICAwICAgICAgICAgMTYuNjYgeCAxICAg
ICAgeDEyOCAgICB4MjE2ICAgIHgxMjggICAgeDE0NCAgICB4MTkyICAgIHgxMjggICAgLzE2DQo+
ID4gKyAqIDAgIDEgICAgICAgICAyMCAgICB4IDEgICAgICB4MTA2ICAgIHgxODAgICAgeDEwNiAg
ICB4MTIwICAgIHgxNjAgICAgeDEwNiAgICAvMTkNCj4gPiArICogMSAgMCAgICAgICAgIFByb2hp
Yml0ZWQgc2V0dGluZw0KPiA+ICsgKiAxICAxICAgICAgICAgMzMuMzMgLyAyICAgICAgeDEyOCAg
ICB4MjE2ICAgIHgxMjggICAgeDE0NCAgICB4MTkyICAgIHgxMjggICAgLzMyDQo+IA0KPiBQbGVh
c2UgZHJvcCB0aGUgUExMNiBjb2x1bW4sIGFzIFBMTDYgZG9lc24ndCByZWFsbHkgZXhpc3QuDQoN
Ck9vcHMuIEknbGwgZHJvcCBpdC4NCg0KPiA+ICsgKi8NCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9j
bGsvcmVuZXNhcy9yZW5lc2FzLWNwZy1tc3NyLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5l
c2FzL3JlbmVzYXMtY3BnLW1zc3IuYw0KPiA+IEBAIC01Nyw2ICs1NywxMSBAQCBzdGF0aWMgY29u
c3QgdTE2IG1zdHBzcltdID0gew0KPiA+ICAgICAgICAgMHg5QTAsIDB4OUE0LCAweDlBOCwgMHg5
QUMsDQo+ID4gIH07DQo+ID4NCj4gPiArc3RhdGljIGNvbnN0IHUxNiBtc3Rwc3JfZm9yX3YzdVtd
ID0gew0KPiA+ICsgICAgICAgMHgyRTAwLCAweDJFMDQsIDB4MkUwOCwgMHgyRTBDLCAweDJFMTAs
IDB4MkUxNCwgMHgyRTE4LCAweDJFMUMsDQo+ID4gKyAgICAgICAweDJFMjAsIDB4MkUyNCwgMHgy
RTI4LCAweDJFMkMsIDB4MkUzMCwgMHgyRTM0LCAweDJFMzgsDQo+ID4gK307DQo+ID4gKw0KPiA+
ICAvKg0KPiA+ICAgKiBTeXN0ZW0gTW9kdWxlIFN0b3AgQ29udHJvbCBSZWdpc3RlciBvZmZzZXRz
DQo+ID4gICAqLw0KPiA+IEBAIC02Niw2ICs3MSwxMSBAQCBzdGF0aWMgY29uc3QgdTE2IHNtc3Rw
Y3JbXSA9IHsNCj4gPiAgICAgICAgIDB4OTkwLCAweDk5NCwgMHg5OTgsIDB4OTlDLA0KPiA+ICB9
Ow0KPiA+DQo+ID4gK3N0YXRpYyBjb25zdCB1MTYgbXN0cGNyX2Zvcl92M3VbXSA9IHsNCj4gPiAr
ICAgICAgIDB4MkQwMCwgMHgyRDA0LCAweDJEMDgsIDB4MkQwQywgMHgyRDEwLCAweDJEMTQsIDB4
MkQxOCwgMHgyRDFDLA0KPiA+ICsgICAgICAgMHgyRDIwLCAweDJEMjQsIDB4MkQyOCwgMHgyRDJD
LCAweDJEMzAsIDB4MkQzNCwgMHgyRDM4LA0KPiA+ICt9Ow0KPiANCj4gPiBAQCAtOTM5LDYgKzk1
NSw5IEBAIHN0YXRpYyBpbnQgX19pbml0IGNwZ19tc3NyX2NvbW1vbl9pbml0KHN0cnVjdCBkZXZp
Y2UgKmRldiwNCj4gPiAgICAgICAgICAgICAgICAgcHJpdi0+Y29udHJvbF9yZWdzID0gc21zdHBj
cjsNCj4gPiAgICAgICAgIH0gZWxzZSBpZiAocHJpdi0+cmVnX2xheW91dCA9PSBDTEtfUkVHX0xB
WU9VVF9SWl9BKSB7DQo+ID4gICAgICAgICAgICAgICAgIHByaXYtPmNvbnRyb2xfcmVncyA9IHN0
YmNyOw0KPiA+ICsgICAgICAgfSBlbHNlIGlmIChwcml2LT5yZWdfbGF5b3V0ID09IENMS19SRUdf
TEFZT1VUX1JDQVJfVjNVKSB7DQo+ID4gKyAgICAgICAgICAgICAgIHByaXYtPnN0YXR1c19yZWdz
ID0gbXN0cHNyX2Zvcl92M3U7DQo+ID4gKyAgICAgICAgICAgICAgIHByaXYtPmNvbnRyb2xfcmVn
cyA9IG1zdHBjcl9mb3JfdjN1Ow0KPiANCj4gTWlzc2luZyBhcnJheXMgZm9yIFYzVS1zcGVjaWZp
YyBzcmNyIGFuZCBzcnN0Y2xyLg0KDQpJJ2xsIGFkZCB0aGVzZSByZWdpc3RlcnMuDQoNCj4gPiAg
ICAgICAgIH0gZWxzZSB7DQo+ID4gICAgICAgICAgICAgICAgIGVycm9yID0gLUVJTlZBTDsNCj4g
PiAgICAgICAgICAgICAgICAgZ290byBvdXRfZXJyOw0KPiANCj4gVGhlIHJlc3QgbG9va3MgZ29v
ZCB0byBtZSENCg0KVGhhbmtzIQ0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0K
DQo=
