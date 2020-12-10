Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1063D2D53D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 07:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgLJGc5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 01:32:57 -0500
Received: from mail-eopbgr60083.outbound.protection.outlook.com ([40.107.6.83]:33920
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726345AbgLJGc5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 01:32:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOfc9DlNvPPrvBSc+LRCJv3yh4LKmsQMPfyFLC/UofWhZZ7Z4jPQJG17EJkUfwzV/+tLBb2bvLZxhzpm0MyJ55ZQtVBvzNYKSG+n3bpOrwlxBOBwL5YRAIaZh1xnpFSXFAhvL14hOtd7OgGzDWrfxNF/b+q9PFoDduxOGL43AtaELhzY9lgPSBnS19+7wwy2/74rBI8HylTKuFk30qerLPJKWR+pmM/BNMyfl8ImrF6Q9ADJYsKNzxNt53klLHXg2v9CgnyXAE2wF3hBeVWR6aD1TQKZ5ftfLSC6AQO1WbvZbsNoOLSnKmLc0YwlvqiDnNa2lHwz1WnVDJ85aR3mZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxszIZUrapfh8QHk0k3KIO1DTKkyrCL24dGlZ0lYPeo=;
 b=YzTLtvByw3Yw0j401Gro4GTqFDiCKZ+XYvRdkq97jL0uc01SVs9Jjo3lPhymB9PWCY2WvFPjHiKMeqCRc+OW3NX44rNp21y7B6HARr0y0gT4AiziSFAvSocaTKDpg6MorOP4nZtD+dN66Ibq6AcKzlmZCooqeB5ligLPqoKLoqm6aFmbRe460QTekguuYon4chn8Uqn0zDmr48srstvkfl6lMHVIGE58UiUFgqgQzolAfalcMIsEWOnSwdExGQwT34Zzi7dHG0tGkNUp53/C+0BYBCig53VFhqlvK3Zh0ezoT/h3TCF/Y5iOJkdNqf6rS31LJ3plyh5/6rFSpfiS2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxszIZUrapfh8QHk0k3KIO1DTKkyrCL24dGlZ0lYPeo=;
 b=WY1JWqey4eccvMrdCZsq+Ls61xBd3a542SUmUVa6dR/PyJm4kNDowG7LoZWIjJ7O9LdsHkR7BbMKdkSHrAifWjfsgsemCHPNaLPB9VflmlDsx15I7WAaN4f6It9JZESybO0h7QcXwR8J/K3BFJDtqVSf6qqD8X/QLBMxIO+a+5c=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2283.eurprd03.prod.outlook.com (2603:10a6:3:23::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17; Thu, 10 Dec 2020 06:32:08 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%6]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 06:32:08 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
CC:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH 3/3] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHWzi93D4ghTujm1EOpsE3lf7qGwqnv3/UA
Date:   Thu, 10 Dec 2020 06:32:07 +0000
Message-ID: <91a786ccf2aed9597d6125152b3dc3db21be1397.camel@fi.rohmeurope.com>
References: <1607414643-25498-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1607414643-25498-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <CAMuHMdWY_M=XZF4FtP0E0vU3u=S1Gj7ynQVLyn1KA9iRDgvvOQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWY_M=XZF4FtP0E0vU3u=S1Gj7ynQVLyn1KA9iRDgvvOQ@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e8fd4b7-10e5-48e9-68bd-08d89cd55173
x-ms-traffictypediagnostic: HE1PR0301MB2283:
x-microsoft-antispam-prvs: <HE1PR0301MB22836B38883FF7B5E15254A7ADCB0@HE1PR0301MB2283.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zTtLhwz1CCU823IhA0voPlTyrInSTZy09LsGMAmbw1rk1Ya8yPZgIh+mCDQ8st51CvGLCuX2QSdfOVS3PGvAoLN2DJ7mcGSL2OJll8MZaRQ/0tqPQk6lLLo5F8nD2eOxyayALD9UPoGIC6t5HHLd9QNQpo2/KLy8OB4UgQnimCQD7hpGMrAVgid6USUOssyupqA9wPQL0fgVS5gWw1WEbF7fEA/JHuXjLbiKBW0k1KCmfiHtwfPt/6ZPd4N/EAu45788NMUWJLc/WHRG3PJOSQMktYMZyKzIht397SNPAZ0iidvVrOWetME3Fam86iJiTK6hpsl5ZFp2/Q0dXn/wO84PuZdxqz5jWcL1ozuXx0Xz6Q9pglAjNE2Pog3M4DG4KY2MpglARmPTpSPS5QUqnA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(83380400001)(26005)(66446008)(64756008)(2616005)(71200400001)(66556008)(6512007)(966005)(66946007)(86362001)(54906003)(66476007)(6506007)(3450700001)(53546011)(508600001)(76116006)(8936002)(2906002)(186003)(4326008)(8676002)(5660300002)(110136005)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?YmRZckZVUTNaTmF5NThIV2ZOd1dSRGFJazc5bDV5TWMxbWxTS0ljT0h2Zlg3?=
 =?utf-8?B?Z1Rtc3dQU1Q3VzhQSW8vVEk0Q21DeGNUUVBGT0c3ME9waFBPNlBnb1hsOHZK?=
 =?utf-8?B?WEhDUTZJQ0thdngrU3luMWtoaEUwQ05FSkZNZHYyRjB1Ty9wdFk3TFFxcy9N?=
 =?utf-8?B?c2xsV1dpOHdJL0s1VC9ZQjRJM3NqTGpXbk9GMzBLVFBUS0k2WkJiZHdLTHRx?=
 =?utf-8?B?NlpKR0NpSXRRYWtFa0dBTkc2L3pXU01jM1hXTmp5MDF0dXp1RmRSWWs2N00y?=
 =?utf-8?B?bHU4bExwWE8wRVhOc09lSDhpb2FhaExrOFkvY3NVWmFQa3YwczYwS1lHRnFW?=
 =?utf-8?B?ams2TzJKVGJuOThmSzFiY3FHY2NYYTFOc203ZlBiWXVTSU8xOURoWXZxMW4r?=
 =?utf-8?B?eVNFSG9mTTRKRDY2MnBvNFFuTzlBYzQzVHBFSE9jOVFUWXFxcGt3SS9reGtp?=
 =?utf-8?B?SzFYaU9jaU1YYnBSck9tcnIwbU0vL05HNTVDOXBKcHphb2N1Vmpsd08vT3hD?=
 =?utf-8?B?enNvbmdjN3hsdERnWS9ucjFYQTROb3d1K1E4RkFYZmdOMVVBZStJZUk3YXN1?=
 =?utf-8?B?V0VwTVgyZjBLb0ppWi82U2dMSlJrd0FkNHZYR21hOGFSdTdMendwQTB0TXdJ?=
 =?utf-8?B?U2dGa2lENTkwZExuQi9ObUZFYWovNlMwczl3cmlzU2E3MG82TlBMQUJ4SGRY?=
 =?utf-8?B?cnVyL1BWZ1F2QXJwTm1BMnZVSTRkYTRtM29yVHhnOFpaME01Ky9aZE5zS0Rl?=
 =?utf-8?B?by8yMXo2ZkkrUjF3T1V6NEdkMjBoTkFVckh0aHpEbnZPeTl3alJSVkdBbXdS?=
 =?utf-8?B?VmxCWDZlcngxT2JaUWR4NDNIeTdFeVY0eDJURUZTTE05MDFFM0dPTXd4TVk5?=
 =?utf-8?B?ZnNlQ0NRSllMbmQzYzVBT0lEc3hUYllrVHhCdU1FdmJzM2tySFFVZXY4Rzlk?=
 =?utf-8?B?Sno1VS8vWWVPV3RFSmdPYUtEZEhEamZsYlBBMjJpOVhUWDVCaUNBWjZrbC9Z?=
 =?utf-8?B?eWFHam42bDg0Sm5WdGU0RXpHOFp4eWxIQnJxNG9YOEx5TThDbTV3N2pkbXd6?=
 =?utf-8?B?dmM1dWRpa3gwT2xyTVVnMWhnNzJxZmRXdDZLaW82STBwOEd1ZGkrNk9oTTB4?=
 =?utf-8?B?NmhmbDA0Qzc4a3NzM0FxWkpmUHRGSFBzSStWMVlrVGhoTlhvVHNyNUJ0dTFR?=
 =?utf-8?B?enR6N3d0VElaeGRSSFgxdkRtT0RDWmk4S1dscnBLaXBGcisxU2ZCUjdDbGRa?=
 =?utf-8?B?dFFlc0RiaVh4YjlZdEQwSkhibmlGZGE4VGRQYVVpOEVwWGFtT09qWmF3alNT?=
 =?utf-8?Q?dswnn3pRVqX82SfJ6riD8QhN33H2J4ZPO4?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <91CC5F3AF0A9924C98FCDCE2E4152AD6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8fd4b7-10e5-48e9-68bd-08d89cd55173
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 06:32:08.1020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FdjDkHv3xPcTdr6M2nI+XXZdfXP84xURYRiScjWiAMoyTLLmmuSZBB2MHH2wknKDbhZJnKc1voQnPFdGmLoEG96mBQio/FnYJe47x6TTdHstefouNYFFT9PnJUeXpAsY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2283
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgZGVlZSBIbyBZb3NoaWhpcm8tc2FuLCBHZWVydCwgQWxsLA0KDQpPbiBXZWQsIDIwMjAtMTIt
MDkgYXQgMTQ6MzAgKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gSGkgU2hpbW9k
YS1zYW4sDQo+IA0KPiBDQyBNYXR0aSAoQkQ5NTczLzYgZHJpdmVyIGZvciBSLUNhciBwbGF0Zm9y
bXMpDQoNClRoYW5rIEdlZXJ0ISBJIHdvdWxkbid0IGhhdmUgbm90aWNlZCB0aGlzIDopDQoNCj4g
DQo+IChJIGRvbid0IGhhdmUgdGhlIEJEOTU3NCBkYXRhc2hlZXQsIHNvIEkgaGF2ZSB0byBiYXNl
IG15IHJldmlldyBvbg0KPiAgaHR0cHM6Ly93d3cucm9obS5jb20vci1jYXItcG1pYykNCj4gDQo+
IE9uIFR1ZSwgRGVjIDgsIDIwMjAgYXQgOTowNiBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEZyb206IEtoaWVtIE5n
dXllbiA8a2hpZW0ubmd1eWVuLnh0QHJlbmVzYXMuY29tPg0KPiA+IA0KPiA+IFRoZSBuZXcgUE1J
QyBCRDk1NzRNV0YgaW5oZXJpdHMgZmVhdHVyZXMgZnJvbSBCRDk1NzFNV1YuDQo+ID4gQWRkIHRo
ZSBzdXBwb3J0IG9mIG5ldyBQTUlDIHRvIGV4aXN0aW5nIGJkOTU3MW13diBkcml2ZXIuDQo+ID4g
DQo+ID4gU2lnbmVkLW9mZi1ieTogS2hpZW0gTmd1eWVuIDxraGllbS5uZ3V5ZW4ueHRAcmVuZXNh
cy5jb20+DQo+ID4gW3NoaW1vZGE6IHJlYmFzZSBhbmQgcmVmYWN0b3JdDQo+ID4gU2lnbmVkLW9m
Zi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29t
Pg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCg0KSW5kZWVkISBJdCdzIHJlYWxs
eSBuaWNlIHRvIHNlZSBvdGhlciBwZW9wbGUgd29ya2luZyBvbiB1cHN0cmVhbWluZw0KZHJpdmVy
cyBmb3IgUk9ITSBQTUlDcyEgVGhhbmtzIGZvciBhbGwgdGhlIGdvb2Qgd29yayENCg0KQ2FuIHlv
dSBwbGVhc2UgYWRkIG1lIHRvIENDIGlmIHlvdSBldmVyIHJlc2VuZCB0aGUgc2VyaWVzPyBJIGxp
a2UgdG8NCmtub3cgd2hhdCBraW5kIG9mIHN1cHBvcnQgdGhlcmUgaXMgYWRkZWQgaW4tdHJlZSBm
b3IgUk9ITSBQTUlDcyA6KQ0KDQpCZXN0IFJlZ2FyZHMNCiAgTWF0dGkNCg0KLS0NCk1hdHRpIFZh
aXR0aW5lbiwgTGludXggZGV2aWNlIGRyaXZlcnMNClJPSE0gU2VtaWNvbmR1Y3RvcnMsIEZpbmxh
bmQgU1dEQw0KS2l2aWhhcmp1bmxlbmtraSAxRQ0KOTAyMjAgT1VMVQ0KRklOTEFORA0KDQp+fn4g
IkkgZG9uJ3QgdGhpbmsgc28sIiBzYWlkIFJlbmUgRGVzY2FydGVzLiBKdXN0IHRoZW4gaGUgdmFu
aXNoZWQgfn5+DQoNClNpbW9uIHNheXMgLSBpbiBMYXRpbiBwbGVhc2UuDQoibm9uIGNvZ2l0byBt
ZSIgZGl4aXQgUmVuZSBEZXNjYXJ0ZSwgZGVpbmRlIGV2YW5lc2Nhdml0DQoNCihUaGFua3MgZm9y
IHRoZSB0cmFuc2xhdGlvbiBTaW1vbikNCg0KDQo=
