Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4D926450C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 13:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgIJLFk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 07:05:40 -0400
Received: from mail-eopbgr1400128.outbound.protection.outlook.com ([40.107.140.128]:60672
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730408AbgIJLDR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 07:03:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IooRqdi1fB1SJiNzkmj/NMJVZ5IH3KtQJ+0xk9b9P/h52ap15bqr1jrqWUFxKaPUySgseuoRxqAKbnLhkQZUls90MMjWEfRWWSpplhoPWlMMEP5ZZCdTOWzFPTHhdAV8Us5ET0Oz93Erdro1f5QSVls6++6HUb/oyH9wMA64y641obql2g0o8MICGvYI+9vruphTqNv8cbaLXZbH29hyJSgL5gxJ44VCcMb86pvtII7qQcbhb+DUNIbuU7z/3y8e8moGwrZCGY+6CWOAC0Og19C3iXEndhv3L3CpblM9r0be8O8eXvYRvBrzLTnlO6dAwys9QEXblJOeQKrBfkgrdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeAyhd2r5Yc7KykOpb/2LOXRL6MnyqOlmTJ93/ec6aU=;
 b=kAZOeu7AjgGhobdZIGAnHJEkAiYQLzfyRiUYjmOE6FAEW1NBmcHcd8DmvzOx7+nu4g0tprpsFmc6hK9VJl8Sn5TWevzemYguZaY/+VmZX2bSPeK0uh3uKSy78po2qK6Kky6NmN4FUgNgErds6neON4x7VTxIlVTK26VV8v7yLfEaw2suBLQcbnH4GSK/PeISo39Xt6R1Sr0eG5lOX+YGx5JK7nEn3E48I02Q8FJhS/rh7MOfGNRLW1sI9h3B7aZRcTuHVvJfL2laQMBqdx1hecbzdyd3Elf12FYhRgBm8QBUrLirrVoG8Rp9P6Sq35DKo6Rdupv7FLB8N/N1p4lfyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeAyhd2r5Yc7KykOpb/2LOXRL6MnyqOlmTJ93/ec6aU=;
 b=CbvjcL3KVpetE3lLvtFhxnnyiiguiwPJYVdHWlrc5r8AVatrv3s6/RbaGlAk6SsCT3sYU1xMGXFd/OPnZckYIGbtCkT5jz6FETzvC6CICyMjcP8LkEYxLK8Ly28ND58NkttJkI/2IAm2QcxI+2/zYTln+IHRneboJsEWHdmMicg=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1872.jpnprd01.prod.outlook.com (2603:1096:403:12::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 11:03:13 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3348.019; Thu, 10 Sep 2020
 11:03:13 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 13/14] arm64: dts: renesas: Add Renesas R8A779A0 SoC
 support
Thread-Topic: [PATCH 13/14] arm64: dts: renesas: Add Renesas R8A779A0 SoC
 support
Thread-Index: AQHWhPgV8F1fOYuqn0yA17o50bWLTale/XSAgAK8F0A=
Date:   Thu, 10 Sep 2020 11:03:13 +0000
Message-ID: <TY2PR01MB369253E2B7779295B8D53055D8270@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-14-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXo2sTP7RmMvd0qquD7bmpPEE7suwvOc9QrnpckdYWm=w@mail.gmail.com>
In-Reply-To: <CAMuHMdXo2sTP7RmMvd0qquD7bmpPEE7suwvOc9QrnpckdYWm=w@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:29e4:1562:227f:bbc3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bac9db06-f42b-4e8b-7126-08d855791cbe
x-ms-traffictypediagnostic: TYXPR01MB1872:
x-microsoft-antispam-prvs: <TYXPR01MB1872CC9D9EC39A443200CBD3D8270@TYXPR01MB1872.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SXwEPx9nErSDYjFAK/EZ89xWLoxgIgVKwJVKjDNhLcwwllM+pcwl2beoeoqOommbXsBKl+6QFXfpP3Pq9q7nt6hxkfX+R2F2BSgh/LdvsSfxFmLAwLhN1Flzz67kpOoOoCiD0MWGoC5sP5DeHkO0WYKtrritxXEKLrNZ/jKIws2bC7xiCWCGjVKK2n82uJsV/CobMuwEptJRyNA3+jse6aN5YDsRY3Yh+4g8rFOgSqDEE+tSxgDZDlx9Wnb1gk4hfxLMkcnYVSRXlxU8PmX8TVA6zuokCHGNRXBxDqQmBB9+AQ7lKH6TUeBEtd3D7Min8bt5avqRbvK90gW6Hkp/jQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(54906003)(4326008)(71200400001)(5660300002)(6916009)(83380400001)(9686003)(55016002)(478600001)(8936002)(8676002)(86362001)(316002)(7696005)(76116006)(66446008)(6506007)(33656002)(53546011)(64756008)(186003)(2906002)(66476007)(66946007)(52536014)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: /QxckBGvEtkYUOEuLf+bsSnBgDtz6xuNQmNn6KpzIlotx5wJnRggXe2XNt2u+zqZs077QY3wL6WaytInWWeb2Erc+AEZLOiFOMHA1Fzu+NJmMYSvp1LkLmKft7EOIFKDrrszFNOUnQtx2NHApmoEivN/huoHfFj0NoRHS9EwkkfS2cv+kA8L1gLbvSv0oB6ggypwS9Ifpr03gZ7waU0Ktb+4aQAAelCR+0x32t03T6kVGR1VhjL1ssIs5MdxkEVBT4IftjjUWLOiPhKX1AxDccQVOxyrIeDqrHELU97ViLiNLJbE/VWVT5wkbgd56XZUiy+09OHHdFaxb8KR32NBbWsB+aOLp09HgbYPtWpduUImEajWXbPcClimkm3G0YEmvGUJr8dBLjSHmvRUHM0O2xncuTcUeg1cvyy1dUKS5Hr/iYlbU15lFVqGl25Z3VcwpGT+NZrxElPzhqKnUfnfRB/Pbb0dz1ZqeZAlXc44CCsDBtBbkWrcKmNifNbsCyEccC8U+nvUFI2BvAHSLHtv6Vz5zgIpoSQlinADl3Vo/BSWNeOL1CbpUai/kuMXSnET4TkTx9SwmVMkPPCoUbi7/bq3c0PK193NZtmaCo+7kJ6ziVaEj6g299tTn6mN9mliJL8dne/pvbdMmXpcCJjSBpsBAS6vmpkBCPKflJQqcmwc1A7YkewqreWsRiws8nMyYy5OgW/z0rwTVZiRtTRDFQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bac9db06-f42b-4e8b-7126-08d855791cbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 11:03:13.3632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1roObe4nkzEADLXe0mKzbwULciHsD7bsqNzOjB3FIve+tiU1rfN3OmZEVuhRfXHrZ8d3P3LW+cRg0Fc36/xgctNy0ksDA1ZqlP9Jj88z3Mw3M63TzMHEtGA296xMjc1X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1872
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgOSwgMjAyMCAyOjE2
IEFNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IE9uIE1vbiwgU2VwIDcsIDIwMjAgYXQg
MTE6MjAgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVz
YXMuY29tPiB3cm90ZToNCj4gPiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciB0aGUgUmVuZXNhcyBS
OEE3Nzk5MCAoUi1DYXIgVjNVKSBzdXBwb3J0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9z
aGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiANCj4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OWEwLmR0c2kNCj4gDQo+ID4gKyAgICAg
ICBzb2M6IHNvYyB7DQo+IA0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgc3lzYzogc3lzdGVt
LWNvbnRyb2xsZXJAZTYxODAwMDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAicmVuZXNhcyxyOGE3NzlhMC1zeXNjIjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MCAweGU2MTgwMDAwIDAgMHgzMDc4PjsNCj4gDQo+IExlbmd0aCAweDQwMDA/
DQoNClllcywgSSdsbCBmaXggaXQuDQoNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAjcG93
ZXItZG9tYWluLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4g
PiArICAgICAgICAgICAgICAgc2NpZjA6IHNlcmlhbEBlNmU2MDAwMCB7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHNjaWYtcjhhNzc5YTAiLA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicmVuZXNhcyxyY2FyLWdlbjMt
c2NpZiIsICJyZW5lc2FzLHNjaWYiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwwIDB4ZTZlNjAwMDAgMCA2ND47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDI1MSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDcwMj4sDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX0NPUkUgUjhBNzc5QTBfQ0xLX1MxRDI+
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmc2NpZl9jbGs+Ow0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImZjayIsICJicmdfaW50Iiwg
InNjaWZfY2xrIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0g
PCZzeXNjIFI4QTc3OUEwX1BEX0FMV0FZU19PTj47DQo+IA0KPiBNaXNzaW5nIHJlc2V0cyBwcm9w
ZXJ0eS4NCg0KT29wcy4gSSdsbCBhZGQgaXQuDQoNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4g
PiArICAgICAgICAgICAgICAgZ2ljOiBpbnRlcnJ1cHQtY29udHJvbGxlckBmMTAwMDAwMCB7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhcm0sZ2ljLXYzIjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDM+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDA+Ow0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwweDAgMHhmMTAwMDAwMCAwIDB4MjAwMDA+LA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwweDAgMHhmMTA2MDAwMCAwIDB4MTEwMDAwPjsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19QUEkgOQ0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKEdJQ19DUFVfTUFTS19TSU1QTEUoOCkg
fCBJUlFfVFlQRV9MRVZFTF9ISUdIKT47DQo+IA0KPiAiR0lDX0NQVV9NQVNLX1NJTVBMRSgxKSIs
IGFzIGN1cnJlbnRseSBvbmx5IG9uZSBDUFUgY29yZSBpcyB1c2VkLg0KDQpJIGdvdCBpdC4gSSds
bCBmaXggaXQuDQoNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0g
PCZzeXNjIFI4QTc3OUEwX1BEX0FMV0FZU19PTj47DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+
ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBwcnI6IGNoaXBpZEBmZmYwMDA0NCB7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHByciI7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHhmZmYwMDA0NCAwIDQ+Ow0KPiA+ICsgICAg
ICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICB0aW1lciB7
DQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXJtLGFybXY4LXRpbWVyIjsNCj4g
PiArICAgICAgICAgICAgICAgaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmZ2ljIEdJQ19QUEkgMTMg
KEdJQ19DUFVfTUFTS19TSU1QTEUoMikgfCBJUlFfVFlQRV9MRVZFTF9MT1cpPiwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmZ2ljIEdJQ19QUEkgMTQgKEdJQ19D
UFVfTUFTS19TSU1QTEUoMikgfCBJUlFfVFlQRV9MRVZFTF9MT1cpPiwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmZ2ljIEdJQ19QUEkgMTEgKEdJQ19DUFVfTUFT
S19TSU1QTEUoMikgfCBJUlFfVFlQRV9MRVZFTF9MT1cpPiwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwmZ2ljIEdJQ19QUEkgMTAgKEdJQ19DUFVfTUFTS19TSU1Q
TEUoMikgfCBJUlFfVFlQRV9MRVZFTF9MT1cpPjsNCj4gDQo+ICJHSUNfQ1BVX01BU0tfU0lNUExF
KDEpIiBmb3IgYWxsIDQgaW50ZXJydXB0cyAoYW5kIGluIHRoZSBmdXR1cmUgIjgiLA0KPiBub3Qg
IjIiKS4NCg0KT29wcy4gWW91J3JlIGNvcnJlY3QuIEknbGwgZml4IGl0Lg0KDQpCZXN0IHJlZ2Fy
ZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
