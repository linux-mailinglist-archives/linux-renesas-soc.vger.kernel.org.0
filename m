Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7DE264517
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 13:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730403AbgIJLHP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 07:07:15 -0400
Received: from mail-eopbgr1400128.outbound.protection.outlook.com ([40.107.140.128]:60672
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729005AbgIJLFL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 07:05:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QG44r4VmZ3fWJ/RexDxAw6OogMYyiVoY3VkFg8AI58u6CWNq44A3OqvALQL+DionZTz7vAQbTi8w+nCbdW7nCD8sp0kqAP+XmhLUpMwdHnoI+/8cErkTTX2VUoi2jEO73HuHZvDeABWZ5nWudKqp//YmaueS1JJmCrfcgauWoZVXOrQRHCboSGfBj7RDR5EfZTG7gZ1n4XcnGEgzMLgm6VvdwOCo6v1udEDAAEdMetgRNl9ZMC+H6ydeKXgR4hgUwXDScv9GGj1I+Obhn3gQbrH/j7F49xEL1nQz/gksMLqZ8+ZCVPFky/tFRV7hf2/NXS34Kzax21yqYEppKZX5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+OmZi5jbn1WifqLRcalaUV8GoQUw1BNewhMnX+4m3E=;
 b=E7cTTSu1f44Gyp89GPM2pAJcweJz+37ZXhyRFlubkTglXd8i7SkQ8rNoBMMNmWt4vaSpCV5Y3FSZyFU57ny0HjJy4AU4dGr/RsvMaYbNP7V/PTHiVLZMGTVolYKZzmHb2pCZaVGUB0oZvW199QCtl1SdDx6rxE7qNvWHw/53L833D4rIckGwaRFa0Kym90caha62MUulweNl63+IbgQeRxGAdMxzH90w8LeQ3g7V3oYJyvus57HbCeGblAmzGnCrvd/lVrK1san33iCiDtwaNe8ccKAGGjLitpe7c9GehhbFsiP2x/jeijl81lvbE6o29+zb626qCPm/VH5R/0VJpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+OmZi5jbn1WifqLRcalaUV8GoQUw1BNewhMnX+4m3E=;
 b=bV8G7yUAUuetmmwU4dVlQDtcLe76dRXdY/9OWsll7LaUVSlK1sohLgI4qxzweFk+YApEdrqtalu1iaWJiKiU0giNrF8xcsCucz9qFm92jk29SjDzNmywIzRTyawJVJ0SnQ0JMqogsSEnvo0wGIs+0XlZ6hfemp4k7QTssmWBNTg=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1872.jpnprd01.prod.outlook.com (2603:1096:403:12::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 11:04:44 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9055:525d:2d64:b625%5]) with mapi id 15.20.3348.019; Thu, 10 Sep 2020
 11:04:44 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 14/14] arm64: dts: renesas: Add Renesas Falcon boards
 support
Thread-Topic: [PATCH 14/14] arm64: dts: renesas: Add Renesas Falcon boards
 support
Thread-Index: AQHWhPgXPxjJ48KvYUmh4Lgcbyf/male/suAgAK7PuA=
Date:   Thu, 10 Sep 2020 11:04:44 +0000
Message-ID: <TY2PR01MB36929138C1723ABE87358597D8270@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-15-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUXUvU5dPkBFdW_ZVhnBKpFEPVLD3mdOkhrmakZjCHErg@mail.gmail.com>
In-Reply-To: <CAMuHMdUXUvU5dPkBFdW_ZVhnBKpFEPVLD3mdOkhrmakZjCHErg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:29e4:1562:227f:bbc3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 433182c9-c974-437e-2326-08d85579533a
x-ms-traffictypediagnostic: TYXPR01MB1872:
x-microsoft-antispam-prvs: <TYXPR01MB1872579E2A87ED06A4712AF6D8270@TYXPR01MB1872.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NcB7oN0+qNVGnZfcyinSG6DkpGmbZ/9k0tfwv8PeTJxKHt0kujnTBi/Bimn49BRMcaASKjF1E8i9YED0wL/wQMVQcjVXEGWDLuZ24mqW+RWk3S+8JqdNWhLhZ7yer2ZFH3JaE09GGHALUo/dDlY/a2LJVASRw50Gfuvu/mUzG0P8662YRG4xl1lGuz8IWrL3Pn6+gKeoEdf73OVQ2e+b78wh3q8+dux9tn4fzv1SEJB3CssV9GqzDIbfObls2rsUiGGD/qZAMwRTgNhvB6IuehAs+LRldY2tJY/uReI+HJC/C3ydmXenREViaypzYJxxo6/AHcQO/5+e/+5CF9kc5g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(54906003)(4744005)(4326008)(71200400001)(5660300002)(6916009)(9686003)(55016002)(478600001)(8936002)(8676002)(86362001)(316002)(7696005)(76116006)(66446008)(6506007)(33656002)(53546011)(64756008)(186003)(2906002)(66476007)(66946007)(52536014)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Cy0k1Cl1R1DC9lkg8s9umsdGdB8dWKqMWkQaHPxCC2CiRU/lUmjHnuAIIzb6lRXrd5e5zMX0t4ogovMqjPeshCJfoYdntHoWI39f1Os/Td2vuX1N1s0g9h8Mrt5FsD02UNH6rygguwu0VLoWBD0hnkA1PFPRX+zxCDG4dBcWVm7FMkkg3LW5wXL5F9BH5Dg/BngyUwlsG9UKPKofpxAmtgJvDfzlMVyjd5HS5QjpZg+hF1jB20rLGeG3AIc2aC1JwYUJyzM2U9IXsf0JIRLASyJS9bArNq8qf1BbK5SEAjaWEnP6t8X0aoFzsdx6bFHJsUctFlhJRuZZp3hegG6Yl6bMyUbVHk3ZcKAz8E/IRJlxYTIrqFfEilsx/RDX6HnutyLC8dUikSUOVih5KUhUzk4TMWJ9r03KdchV+FMOPRoPfHTWC0PELlswO+KSZbUeClzIzFmsom42hyPFG/K20QZVL4Jm2jMYPg/tOwDcQsYlORvJ8H8WX98IVwu2bj0xA3vi7qdGv7b321bWizUiEOw5cTLQ9MAsFBeKcfDVsK9+54e8Oqf4bf1OE0YIbCW0cJFlveX2SxRBy/+xHz3PYfgsE4BACexywkudSZxhb3OhYs1mJvBfIbKlTZCc8O7WjK/B/VJtV+AxPUWI7FDgwGrN+zGSjb/TA86MLmoxS9E1JYJPAA66MVR9XS0q5OsMsUtJBdOziibjkoOBu51Z8A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 433182c9-c974-437e-2326-08d85579533a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 11:04:44.7758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oC5IJVr86BH99g3E5LkbVfvYFjEqGDTorAy3Zr1oAggfxdqA3vFn9DdoF6BVeWdu77SObPHC9faNtQloX6KYYlSJVVVB8VMkPCxE20M/ctMlsI7MJq+35MS/JQCIpKbS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1872
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgOSwgMjAyMCAyOjIx
IEFNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+IE9uIE1vbiwgU2VwIDcsIDIwMjAgYXQg
MTE6MjAgQU0gWW9zaGloaXJvIFNoaW1vZGENCj4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVz
YXMuY29tPiB3cm90ZToNCj4gPiBJbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBSZW5lc2FzIEZhbGNv
biBDUFUgYW5kIEJyZWFrT3V0IGJvYXJkcw0KPiA+IHN1cHBvcnQuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5j
b20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSAvZGV2L251bGwN
Cj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvZmFsY29uLWNwdS5kdHNpDQo+
ID4gQEAgLTAsMCArMSw0NCBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMA0KPiA+ICsvKg0KPiA+ICsgKiBEZXZpY2UgVHJlZSBTb3VyY2UgZm9yIHRoZSBGYWxjb24g
Q1BVIGJvYXJkDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyMCBSZW5lc2FzIEVs
ZWN0cm9uaWNzIENvcnAuDQo+ID4gKyAqLw0KPiANCj4gQXMgdGhpcyBib2FyZCBjb250YWlucyB0
aGUgQ1BVLCBJIGhhZCBleHBlY3RlZA0KPiANCj4gICAgICNpbmNsdWRlICJyOGE3NzlhMC5kdHNp
Ig0KPiANCj4gaGVyZS4NCg0KSSBnb3QgaXQuIEknbGwgYWRkIGl0Lg0KDQo+ID4gKw0KPiA+ICsv
IHsNCj4gPiArICAgICAgIG1vZGVsID0gIlJlbmVzYXMgRmFsY29uIENQVSBib2FyZCI7DQo+ID4g
KyAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMsZmFsY29uLWNwdSI7DQo+IA0KPiArIHJlbmVz
YXMscjhhNzc5YTAuDQoNCk9vcHMuIEknbGwgYWRkIGl0Lg0KDQpBbHNvLCBJJ2xsIGZpeCBhIGNv
bXBhdGlibGUgaW4gdGhlIHI4YTc3OWEwLWZhbGNvbi5kdHMuDQoNCkJlc3QgcmVnYXJkcywNCllv
c2hpaGlybyBTaGltb2RhDQoNCg==
