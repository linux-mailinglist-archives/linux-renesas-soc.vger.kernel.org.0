Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDE64A6F22
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 11:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237743AbiBBKsO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 05:48:14 -0500
Received: from mail-os0jpn01on2095.outbound.protection.outlook.com ([40.107.113.95]:2631
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229750AbiBBKsN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 05:48:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9uIltytoKe/6Lh0sOWC8lj+Mu4NwThuX8vQESl7vKWtl9wUXLU/CaNjl3eqrTnKdFV65zjiW9PLBC/KdjVidHM+FbME0OK27AjPGQY364B8v/C++9lEBUPEyh6zb/vEQiVoUlZPLepO/VgKeY8Rro05WYfhLsB26QTD6fyxOtUKoJvRCUOo6EJHyh0Rd7j45u6G9+tefr/AU7/281x9fc0L/1W16aRa6PzLSbnGqHwIGQoLWI5isFM8FniDCapEuom3Pf3xnSXTS5HPW+hqUfSoMKcnKLMXWL5H6VAC4BRlgOiwTmlTkHiojJAg/1xMCIqvEzRKt9YtdOlN/yQHqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EK0GCDMUkCbrq3Zbf5zB1ohWsX2vEUl7ZBF/2F/XWFg=;
 b=Vvr1CiAzQMMwrGQj5NqGp8AXzottFh/GoapNgDQI8Tk4Ogg+47f3gYBiRo8chYce6yLhuy5jg6ENxjs02BxXSsXgvVx3SkeI2mO5O/rnR26LTW4IZ+kpKy+8e4NbJmP6DSHwi9+yXZ5PoOqkCP2sCd34D+xSXRVumOTifjElOzbsXRWvAXjQ9DImmvI4pGeEPCHA0V2hvwhoujf5glGJXc2FFJB1hLtfrA5Q2ipFp2TcZ7Q1k8ih8YKSst4JjZL5FsKAxfKNM11ccNLmB1Rh9tIttGBmOmIIvywWralBhsN6DW+ufQzWGwmSwnJpATLzS0VBHM3DHDBkTx7PIC3gjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK0GCDMUkCbrq3Zbf5zB1ohWsX2vEUl7ZBF/2F/XWFg=;
 b=px22hqQBmY/eNog6uR7ew0De7ehr8yskM6TYYU0HK1tQlHHK6b1iF7Y68MHyqwL3ralK4JPdtqCrBNOqI1eJVKoPR9ieozea2WY8xFh34X+pJIcbGLoDXFrpSyqk5nPRt29Cm0yPYLmDnSDLQvcRReti3vs4GM0ZIFiAQfYMJEI=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB6344.jpnprd01.prod.outlook.com
 (2603:1096:604:102::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Wed, 2 Feb
 2022 10:48:12 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::b8a7:7600:2af0:eea7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::b8a7:7600:2af0:eea7%5]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 10:48:11 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] iommu/ipmmu-vmsa: Add support for R-Car Gen4
Thread-Topic: [PATCH 2/2] iommu/ipmmu-vmsa: Add support for R-Car Gen4
Thread-Index: AQHYEerv765yfwyF10SBICWVWsSd2KyACUgAgAAXFSA=
Date:   Wed, 2 Feb 2022 10:48:11 +0000
Message-ID: <TYBPR01MB5341422A4238B937BFEBD0D6D8279@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com>
 <20220125125602.4144793-3-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXmievc1U0PXfv01wsibUs+B+5U6kPbcE8=v2GKTvFbTA@mail.gmail.com>
In-Reply-To: <CAMuHMdXmievc1U0PXfv01wsibUs+B+5U6kPbcE8=v2GKTvFbTA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63b53291-f0ba-4163-3abc-08d9e6398210
x-ms-traffictypediagnostic: OS3PR01MB6344:EE_
x-microsoft-antispam-prvs: <OS3PR01MB6344C58A14B48FEF469E77D3D8279@OS3PR01MB6344.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h//Kirimh8+Y4pG1k/VLQ946MIk0QDlJHIut1OWylXnIn/s0J+F1V0LbU17fotapZzYumB70XrfTNRnk5u1+i7w1Jstwqe78Oy0GXF8+AJXMrdYUPbtTiS1Dvt5da2pvn1Y9NKp1FG4JALKU8dAyMIvLRpCLj0v+2yA5XkT0HXB8+lmj/vIJ/qxmRM/G5nTRE7iYsjNYdkzGvZV13JBEB21jxl9oI6F4lR6ybcWYQFp2TOAwgwswWS3EeTtfxCIZPNLQqKT61M7sW9L04wPe+9OENsvPei5NDPcWLnKhDz7YpZCXTRnFtozPcQQEWghSB8/uYbblAcp2cjQl5Lg8iytR8IVJ921K3i4rn1I1ZBF0/59/gcLj942l7wCVmE65XbhaSa8LQmwE3KzssCZCxFyYCzkWqS/N42akFHcnzcmS81Y4ya4uw/km3WM0Ohf/HrCaF8WxlsPhUrNKX2r+VRYbV3BZxF+uu5Ost4YIdFjI7DXjT7jEMbrv6UnCYqgBnH1BsYk7n7tf/30rmieVq1sL+BL96e3N3BICfDovpFfFDUBL+0hiC0x9L9GTv6pO8CehylKmxz9eZ88M9q195FK0CGMdEqKZs347zID9c0wzYDo0loY35gXe3qXkWlmTi8osz/4W3as2RgQThnyhsyDChXR08q7/0ZbkRrQ7xxVs8IAPo8abydNd9fydIZioeMFfQyiM7ZLqAkigrQMnNw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(54906003)(71200400001)(33656002)(316002)(122000001)(6916009)(508600001)(38100700002)(52536014)(6506007)(55016003)(2906002)(9686003)(8676002)(8936002)(5660300002)(53546011)(186003)(66476007)(7696005)(4326008)(86362001)(76116006)(66556008)(66446008)(64756008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWhPcGJCRUFENmtXWjdyTHd4ZnVBT0lZbjhreEQ4dk9ISFVIZkYvYWtlOXZV?=
 =?utf-8?B?eFhSbkwrVDNSR2tyNFVBTlMyNUI4dFJzWFR4eGs2YUJVVUVjY29iL2JERmox?=
 =?utf-8?B?WHJMU0VpYUQ0bEcvVEJ3MXl3ajhTYS9kdjJDR0I5V0tNWjFvd0hjUWdSVUM5?=
 =?utf-8?B?eTVxbzVnWDREREhJZzVaZkFnWWwrbG12NS9BNjJuanB5MmsrNStvcHFiTlZp?=
 =?utf-8?B?em9TQVNIK1llSEpnNnNyN2ZJR25RRkcxdG83Rk91WktSME1YSHNpcnFiMkpQ?=
 =?utf-8?B?ZUNoU2M2QTQxRkkxakJnTHgrdTIwOWFYdTBsOWhSU2tpNjJ2Mll4b3Q3UFNU?=
 =?utf-8?B?aGZUWDdLeSt2T2wyMlFyN213Q2g5LzV4eHo2ZndZQ0lHeXFOM1JGSU1BaG5O?=
 =?utf-8?B?dXdWUjFSamg2ZUVWclc3WHhydDdPVHB1VE5KQVplc01mWW1wRFd6VFhIc1VW?=
 =?utf-8?B?WXFoemI1Ny9XZkplODJuWkFSa3RtY2pzMjlpQ1BJUld4ejlFYU9kMlNCUE5y?=
 =?utf-8?B?cWpOZy9Ddm1NVTFDNytmaEt2T0VITlZob1MrQ0MwdlcvQjFmWktFYTFSOHVT?=
 =?utf-8?B?ejdzY1RCTHFmQTJJSkxhV1crcXVFSVJHazFxOGpYdjFybnNrOXBKVVIrekN3?=
 =?utf-8?B?SWg4SVFHL09sQkFhQlQ0eWZoRTdZc1NVM3VnU0lnbXpkOG1QTGRNa00yeE1x?=
 =?utf-8?B?NEpqaSs1MUM5YkZtaExES29hOW1LZjQ5S1U4UC9Gc1JlSDBjU0ZOTnlhZHRH?=
 =?utf-8?B?TzdYVTE0aXFMampoQjdQanplTGVBazEwNjFjQ3M0a2ZBWk0rd2VEb1JYZHdX?=
 =?utf-8?B?OWJ3NzlkbGpYUWJXSHNVMHE1QUYyS01QRXJ1K3ZqTHg4bW9ZVUZiZENuOG44?=
 =?utf-8?B?clRwenZOeFpZOXlNaXFja2Jhb3BLelgzcG10STI2UDFvQTRLZHNSWVZXa08z?=
 =?utf-8?B?Y2dQVUcwL0tVQkMyN3E4ZGpTaVFZWUwxcUdLR3BTT2xtNGZnaDVpdUFMNnFT?=
 =?utf-8?B?ZGhlTnVmOTZnQkJCVXF3OWZUM3RvdCt1eklzNDFoYXZzWFdGdGhhQlpLdm9j?=
 =?utf-8?B?OXpHV0txZkpqcmtVTnY5UGR5WGVEbDhQSi8ycGYwQzFXQkhoQ3FCdkdYRzBW?=
 =?utf-8?B?cmZxcEV2aEMvME9SNC9sQ2JoelZNY2dPQkhxM0NZMnFXTDZwV2lySHh5SDdK?=
 =?utf-8?B?NFZkU3NZcjllK1hPOUkzSkZLSTNTYWp1QW5HcGVzUkNQWEpjVTdiMFp4QVpk?=
 =?utf-8?B?SzdCZFVya1liQ0E2OGFOZDFJQ0NiUGR5VWhvZXdYZ1hYWmVSZWorZklTejQr?=
 =?utf-8?B?NmsrRmZHdUhPeEVISnhoVHpEUk9hWEx5UTJueFJOYzloQnczbWdIeUVJdFZE?=
 =?utf-8?B?dHRuR0IvelRaajBiQjc2NmdHeTRaRWdsQWxES2RXVVJzR2x0azNTMDFiaVkz?=
 =?utf-8?B?eU5ZYlIxamxNcXB4eUkrSyswWW1udEkrWDZmdkN1RG5uSGJMWWU1bDJiSXZK?=
 =?utf-8?B?cDlpKzdnd3M4YUtBVFdVdC81eEtZNkd4UXBFdGtMOGpCMEtabGlNZEFmTk84?=
 =?utf-8?B?RHhNUEFOT2ZKMThUNkx1T0xuMCtZTmMzTnI0cEtoSHUxR25GbG5YbElMMkJs?=
 =?utf-8?B?V3lVc01aZkptdUNsODBuWmxWQ05GSXdOWmNwVm1nWlBOM2gySEp5VFpMVWNZ?=
 =?utf-8?B?bjlsRTJiS3B2QndRNi9CQXlpdCs3ZS9JVVFRdTRBVWVoY09aNllmNkpLUElD?=
 =?utf-8?B?anhEKzdiUmZqb3B4TUo3RXFXQTkveEJDd0l1RkRDVWN0cGQ5disyZGZyYTRx?=
 =?utf-8?B?TWo0N0ExaHEvWkM5WmRUWkxpaUI2Z1RRZjJWTVFDSUV0bi9paHZ3T05acTBx?=
 =?utf-8?B?bWdZajlkWTZzREJGcEk4bjV1bC9BNjA5NWpRQTgyMjZwcGxGT1NYZ2FXaU90?=
 =?utf-8?B?cWFTTXdIbmRDbWpZb2FjYkREQjdOblpIVVloSzVTWUFFc0ZMbys0WCtsV3BX?=
 =?utf-8?B?QTV1WlF5V24wQXMvVmxrazRKTTNmOUtMOTRoSlB1OVBycUE2ckMySElxUVJ2?=
 =?utf-8?B?MUxZQVJZcmlUSGpwa0pERjkvckdVVDhhZmZUNzNQajZGY3Npd1VxRzJLUEdn?=
 =?utf-8?B?eWlWWmFIOHZra0V6SkRrS0Yvc2NJRHhFZVc3dVM0bkxxY00zbzZwZmsrclJw?=
 =?utf-8?B?N2hBUWFqakYxSURVL1RoQWdnNEVaRjdHWU5hTFZGQ01LZTdCQWszL3BRTFlG?=
 =?utf-8?B?NjQ1ejlUcDFGWk0wWm1yOElHdU9jUTczaTdiaUZEOEJyUnhmZGNBcEtpVkdS?=
 =?utf-8?B?UmlMYXB4VENjc2lCVzRKR2hEbVNOazYzUWQ0ZTJuT295VHBtdjZUNWg2M243?=
 =?utf-8?Q?1IRG66KUMz2N0CuSapvUy39+m00pkO8eIjg6r?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b53291-f0ba-4163-3abc-08d9e6398210
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 10:48:11.8324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l+2SvKEcNbQEAoSTf7cUSVXN+rAhC8oGMFgIBdoVSIUMuYBRVAQezmkXEV7zke219PlgIYoawAWsyOdTX/HZztUxSAymX7wRjywtX09qS2L8BACU+LEHDscuWO1MD8ul
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6344
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyLCAyMDIyIDY6MjQg
UE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4gT24gVHVlLCBKYW4gMjUsIDIwMjIgYXQg
NjozNiBQTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNh
cy5jb20+IHdyb3RlOg0KPiA+IEFkZCBzdXBwb3J0IGZvciBSLUNhciBHZW40IGxpa2UgcjhhNzc5
ZjAgKFItQ2FyIFM0LTgpLiBUaGUgSVBNTVUNCj4gPiBoYXJkd2FyZSBkZXNpZ24gb2YgcjhhNzc5
ZjAgaXMgdGhlIHNhbWUgYXMgcjhhNzc5YTAuIFNvLCByZW5hbWUNCj4gPiAicjhhNzc5YTAiIHRv
ICJyY2FyX2dlbjQiLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEg
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3Vy
IHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2lvbW11L2lwbW11LXZtc2EuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvaW9tbXUvaXBtbXUtdm1zYS5jDQo+IA0KPiA+IEBAIC03NDMsNyArNzQ0LDcg
QEAgc3RhdGljIGJvb2wgaXBtbXVfZGV2aWNlX2lzX2FsbG93ZWQoc3RydWN0IGRldmljZSAqZGV2
KQ0KPiA+ICAgICAgICAgdW5zaWduZWQgaW50IGk7DQo+ID4NCj4gPiAgICAgICAgIC8qDQo+ID4g
LSAgICAgICAgKiBSLUNhciBHZW4zIGFuZCBSWi9HMiB1c2UgdGhlIGFsbG93IGxpc3QgdG8gb3B0
LWluIGRldmljZXMuDQo+ID4gKyAgICAgICAgKiBSLUNhciBHZW4zLCBHZW40IGFuZCBSWi9HMiB1
c2UgdGhlIGFsbG93IGxpc3QgdG8gb3B0LWluIGRldmljZXMuDQo+ID4gICAgICAgICAgKiBGb3Ig
T3RoZXIgU29DcywgdGhpcyByZXR1cm5zIHRydWUgYW55d2F5Lg0KPiA+ICAgICAgICAgICovDQo+
ID4gICAgICAgICBpZiAoIXNvY19kZXZpY2VfbWF0Y2goc29jX25lZWRzX29wdF9pbikpDQo+IA0K
PiBUaGVyZSBhcmUgYSBmZXcgbW9yZSByZWZlcmVuY2VzIHRvICJHZW4zIiB0aGF0IGNhbiBiZSBl
eHRlbmRlZC4NCg0KSSdtIGFmcmFpZCwgYnV0IEkgY291bGQgbm90IHVuZGVyc3RhbmQgdGhpcyBt
ZWFuLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IEdye29ldGplLGVl
dGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+
IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0t
IExpbnVzIFRvcnZhbGRzDQo=
