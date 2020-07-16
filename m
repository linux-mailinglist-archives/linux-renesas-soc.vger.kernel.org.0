Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229CC222890
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jul 2020 18:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbgGPQue (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jul 2020 12:50:34 -0400
Received: from mail-eopbgr1400110.outbound.protection.outlook.com ([40.107.140.110]:59424
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728415AbgGPQuc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jul 2020 12:50:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4ebYTp7s2Psau3pppV8KWB/+TGd8hhWl0POpaLu1pcUSM5X8tsxEk1GLLIh/mdEZw+FoGRspth8qBVoL/OqulUujREIVelh8ch7VyiqG9i3HMeoaEmASF1AAKNlbZ9f1Mf+2UBbanvc2PFcdiihGhF4hEPh4sxYMQUcTbTGISnjif43C5XWRlm0K+SLlZu02P7rqSK405NYlmfb0XcdH9+NdsDlhKvKmJWb7FHG/BT6iZAyBef2bpQQAYH+8Cr3z90xkwuoEJ3ESC6iqALlVgeyQYYqgZy/CMozsuHmQOe6NXKf9RFFqUEAiKeZ3io8QwK0x1wa0wR0AdOo0cgolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taykd8y8jMBO41xXFE+NWR/Yzx+KYl6gOuMxvy+fdK8=;
 b=NlAuyZpqv0yZN5AWU0degJHT/XyPNWp2CGubsMaUGukuGd8anJvQFEynOEePJsz9Ts9JqmjoMGbElpvny0uRl/dLtEGt7Lg7bMCPU/o3v5EWf2oodddVMJrpwiaH8uUhGSKopeNiMQDZ1NEtFw4XkMV7GeRVd6RSXLmG1LMBFzROv9R/40QXhQrL+CEIICrLMbQisGjL5NrfSd6O0f4iqJEXN8zWPXg5UNOSU1INdqwSafGw+clQkpKhR4SoMGYyr4Sw0J54ALyleQLM7QpVup8iNjt2NZh3PtnDFNAdrfpQm18r51I06yKkYzoDyjFuv/dwF4/tJq7EpELF25rYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taykd8y8jMBO41xXFE+NWR/Yzx+KYl6gOuMxvy+fdK8=;
 b=oI9QDurPsT2RYveu7yO3FbSpbnC11zGYgU3ALxgOcMgYsg29GkBfkKfI1l5g24xEozwoOQPvp8Q1q2SciiqzL4O3eX0xwCw7jic5x22aPRKKZb254f5WhQrpeHKrTNcyLvMN703oMbvrP/FbUh0lApBkAlyl/QPwjCGfuikzfXA=
Received: from OSAPR01MB1748.jpnprd01.prod.outlook.com (2603:1096:603:32::19)
 by OSAPR01MB3041.jpnprd01.prod.outlook.com (2603:1096:603:3e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Thu, 16 Jul
 2020 16:50:24 +0000
Received: from OSAPR01MB1748.jpnprd01.prod.outlook.com
 ([fe80::8902:d50b:a2a:9f0a]) by OSAPR01MB1748.jpnprd01.prod.outlook.com
 ([fe80::8902:d50b:a2a:9f0a%2]) with mapi id 15.20.3195.019; Thu, 16 Jul 2020
 16:50:23 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH 6/8] arm64: dts: renesas: Initial r8a774e1 SoC device tree
Thread-Topic: [PATCH 6/8] arm64: dts: renesas: Initial r8a774e1 SoC device
 tree
Thread-Index: AQHWVVARu8MnMherwUCzbazhwdeoQKkKVlkAgAAhO0A=
Date:   Thu, 16 Jul 2020 16:50:23 +0000
Message-ID: <OSAPR01MB1748AAB4C372427D67D02981AA7F0@OSAPR01MB1748.jpnprd01.prod.outlook.com>
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVy4O9vbyO-j1eJbjQGon-3MEng42EOYJ2PoRmRY5ttKQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVy4O9vbyO-j1eJbjQGon-3MEng42EOYJ2PoRmRY5ttKQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 88708588-ddd5-4300-4e32-08d829a85590
x-ms-traffictypediagnostic: OSAPR01MB3041:
x-microsoft-antispam-prvs: <OSAPR01MB30414FE78102035090E1DE25AA7F0@OSAPR01MB3041.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3A4IJtM7VJ3xIWKSoxIC02lRZ40bcFEkTDpm65OVEwaVJyLA64/q+4wCbe3930hUDwDQPN3G3U5sCIl4ErGF0O6dIjgWpIJAWxg9BBVsOiZjnybIIj65IQTSr07hfuspd21eBIvhWCAVJ7TwJ7gIeekk++k4PbUiKypAL/pcu1LTsacpaVTZTaa4f2A8ovUShViC9O4MUb7lsRJT8EwDhOF+YV2alz8677yyZ8yuiczRHDtdUJmzhNxnPZl4AgIhSFoxRJ3o+Ju52U+y+jcM0lKQsmA4wASh7xUhe5RDDUuChRa2TSTMbDtH/NhaUHhTUFhn1bMS4OGA2znRbEsMOw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1748.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(64756008)(66556008)(66476007)(52536014)(66946007)(53546011)(83380400001)(76116006)(6506007)(66446008)(4326008)(186003)(33656002)(26005)(7696005)(5660300002)(86362001)(2906002)(316002)(9686003)(8676002)(7416002)(8936002)(6916009)(71200400001)(54906003)(55016002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: OCmQ+QZ3+kfFAtqoouhY+RQN4/qhQs1i1wLEAM9ZNEgHIu/5zMcpA960S21kiGS6PQZFtp6TkWBNutCFPL+2Aw6uUCLUZUrOT6iotZdRq4IteLu35t871rI7GXBPv06D4/GyhhZifPbFfKmyFGMWXHuEh2KF/PFGTP3z6eL85AtNYz60Y6i3deyENHCT0+EU44tFDibTREXQiWa/zCZQwKu08nFljg1LGC/oSy3IaOIFfOJLQwGDDL7Tnu6dUVAMgRJaAz5FfQ73JEmEHmLKXskaLDH2QNQGdGrRIPmqW6xiQIlDKBhrkeR3PlCIsjmU8TCdR7EUKy4Okk5yHt8O2S5xQKxaAIkDeTEeI72MBiZKTMaICC6yQ6DYQrjGOwniP2O4zZIxqnX5V4zrAREmj+oVyRoCayMoWxYlFn+xt+pG42s1jjliVox/EECkISywJi5UTlem/6ox9MvjBp5CQUwpF6aB8zecUdln/eEcaTEwhCGBKiziN2GT8HcFQd2C
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1748.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88708588-ddd5-4300-4e32-08d829a85590
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2020 16:50:23.8750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Aorx6wLGTwI5STeSQk4+39ctyVBBg+T6mg0yaM4dPa+GhZ0yqiVXoF8wmK5quPA76QE7JFjdRrrG7yrS+BW2OcGhMOqPfUW1/7GMPjgSC3d90seigsyDpY9cWxNMKX2M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3041
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTYgSnVseSAyMDIw
IDE1OjUxDQo+IFRvOiBQcmFiaGFrYXIgTWFoYWRldiBMYWQgPHByYWJoYWthci5tYWhhZGV2LWxh
ZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gQ2M6IE1hZ251cyBEYW1tIDxtYWdudXMuZGFtbUBnbWFp
bC5jb20+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgVGhvbWFzIEdsZWl4bmVy
IDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBKYXNvbg0KPiBDb29wZXIgPGphc29uQGxha2VkYWVtb24u
bmV0PjsgTWFyYyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz47IFVsZiBIYW5zc29uIDx1bGYuaGFu
c3NvbkBsaW5hcm8ub3JnPjsgR3JlZyBLcm9haC1IYXJ0bWFuDQo+IDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz47IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+OyBX
aWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPjsgTGludXgtUmVuZXNhcyA8bGludXgtDQo+IHJl
bmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz47IG9wZW4gbGlzdDpPUEVOIEZJUk1XQVJFIEFORCBG
TEFUVEVORUQgREVWSUNFIFRSRUUgQklORElOR1MgPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
PjsgTGludXgNCj4gTU1DIExpc3QgPGxpbnV4LW1tY0B2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuIGxp
c3Q6U0VSSUFMIERSSVZFUlMgPGxpbnV4LXNlcmlhbEB2Z2VyLmtlcm5lbC5vcmc+OyBMaW51eCBB
Uk0gPGxpbnV4LWFybS0NCj4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+OyBMaW51eCBLZXJu
ZWwgTWFpbGluZyBMaXN0IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgUHJhYmhha2Fy
IDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCA2Lzhd
IGFybTY0OiBkdHM6IHJlbmVzYXM6IEluaXRpYWwgcjhhNzc0ZTEgU29DIGRldmljZSB0cmVlDQo+
DQo+IEhpIFByYWJoYWthciwNCj4NCj4gT24gV2VkLCBKdWwgOCwgMjAyMCBhdCA3OjQ5IFBNIExh
ZCBQcmFiaGFrYXINCj4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4g
d3JvdGU6DQo+ID4gRnJvbTogTWFyaWFuLUNyaXN0aWFuIFJvdGFyaXUgPG1hcmlhbi1jcmlzdGlh
bi5yb3Rhcml1LnJiQGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gQmFzaWMgc3VwcG9ydCBmb3Ig
dGhlIFJaL0cySCBTb0MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJpYW4tQ3Jpc3RpYW4g
Um90YXJpdSA8bWFyaWFuLWNyaXN0aWFuLnJvdGFyaXUucmJAYnAucmVuZXNhcy5jb20+DQo+ID4g
U2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJw
LnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
cjhhNzc0ZTEuZHRzaSB8IDY1MiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA2NTIgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGUxLmR0c2kNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0ZTEuZHRzaSBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9yOGE3NzRlMS5kdHNpDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjY2MzdlMTU3ZmZjZA0KPiA+IC0tLSAvZGV2L251bGwN
Cj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc0ZTEuZHRzaQ0KPg0K
PiA+ICsgICAgICAgICAgICAgICBpbnRjX2V4OiBpbnRlcnJ1cHQtY29udHJvbGxlckBlNjFjMDAw
MCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLGlu
dGMtZXgtcjhhNzc0YjEiLCAicmVuZXNhcyxpcnFjIjsNCj4NCj4gV29vcHMsICc0ZTEsIG9mIGNv
dXJzZS4NCj4NCj4gQXMgSSBoYXZlbid0IHNlbnQgYSBQUiBmb3IgYXJtLXNvYyB5ZXQsIEknbGwg
Zml4IGl0IHVwIGluIHJlbmVzYXMtZGV2ZWwuDQo+DQpBcmdoLCB0aGFua3MgZm9yIHRoZSBjYXRj
aC4NCg0KQ2hlZXJzLA0KLS1QcmFiaGFrYXINCg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4NCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9l
dmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1t
NjhrLm9yZw0KPg0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
DQoNClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIEdtYkgsIEdlc2NoYWVmdHNmdWVocmVyL1By
ZXNpZGVudDogQ2Fyc3RlbiBKYXVjaCwgU2l0eiBkZXIgR2VzZWxsc2NoYWZ0L1JlZ2lzdGVyZWQg
b2ZmaWNlOiBEdWVzc2VsZG9yZiwgQXJjYWRpYXN0cmFzc2UgMTAsIDQwNDcyIER1ZXNzZWxkb3Jm
LCBHZXJtYW55LCBIYW5kZWxzcmVnaXN0ZXIvQ29tbWVyY2lhbCBSZWdpc3RlcjogRHVlc3NlbGRv
cmYsIEhSQiAzNzA4IFVTdC1JRE5yLi9UYXggaWRlbnRpZmljYXRpb24gbm8uOiBERSAxMTkzNTM0
MDYgV0VFRS1SZWcuLU5yLi9XRUVFIHJlZy4gbm8uOiBERSAxNDk3ODY0Nw0K
