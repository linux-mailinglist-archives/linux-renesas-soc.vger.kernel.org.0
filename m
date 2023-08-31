Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6AAC78F1AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 19:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242954AbjHaRGs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 13:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237542AbjHaRGr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 13:06:47 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2118.outbound.protection.outlook.com [40.107.113.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B927170C;
        Thu, 31 Aug 2023 10:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q57g1ev6TE/l/aNtehJGq4BI0INWUyIq7T5vyh5ELdlLAYU9cAa+bBGV7Zdn2wTGhCIMlN0LqqVdeBk7dR8oRrtn7qXGt/5qd2Kyp0bZr5IroTF1EPhcJuC5zkPh9MhOfCe3s9migTVzDob/zUSZREicpEbze81oL264vqXruqHcEstLYVhvZv9luY75vXoBy7j49PJwRgt3A48lWYxLffxz4bxWwt2ZJLWT//NQz7AFO/MRDweFF16dEsExoATOHCzdrlgvufrYRu8KIpehTDgHzvuRR4tWI2RLzt+efgNE2XbBJBPdHgGs5cMYrkkYEgYxNDsrXqXWxU/BYEYvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmV9rlLkesKSFTtTiWWGp3xtzPz46QHXMKJ0gRb/3iw=;
 b=KD2B7ukFYKaAkRJZPZPO2yPoz6wfhhnq3XEbUX1rJPcUhXc+Vw2az2w2cCW/a9vIbULKv2o5OLg6miJnV8M2yXw69oFSBoz/93iwk7cz7HXfbseq5CIFGkLg5ngKsjOkvwbLVDyM4s+7h4bCihPI6ug33cyDoLPmTGbPoVaDaa42wTt9HvpcXuvu0GypgaqJHo/F3dCqhZcun5dSzJkLqRNoOgpwO8ylf+WKCATA/0ri6uHhwvk624yQ204nxDLjd/oPhWrCYQVFbIjMN6kb6WjyMJd9mmYmJUU1IIhFtM7Nrvc8UyhKyfw1AgohM8AFYO0VT2BZdt5KMNCHnbrSLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmV9rlLkesKSFTtTiWWGp3xtzPz46QHXMKJ0gRb/3iw=;
 b=LUmTIr0DDiGe28+A1HtiaF/3zh6S/01qIP//ZBg/HWD10O54SIQBWC4/DTbUocWistyDf7OcagyMElJVbyyLXrLawQOnkQZ02j45pF4UFgkhoIxi0LcMwtvhNNXRttUX5S2GMUMkIdnC8eczIFvOsAqopZTEGoQ4n8NwJqsdjDE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9382.jpnprd01.prod.outlook.com (2603:1096:604:1ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Thu, 31 Aug
 2023 17:05:44 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.022; Thu, 31 Aug 2023
 17:05:44 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4] arm64: dts: renesas: rz-smarc-common: Use versa3 clk
 for audio mclk
Thread-Topic: [PATCH v4] arm64: dts: renesas: rz-smarc-common: Use versa3 clk
 for audio mclk
Thread-Index: AQHZ1zNJev0w86Si4029NtWlwKG1ULAEklwAgAAZyoA=
Date:   Thu, 31 Aug 2023 17:05:43 +0000
Message-ID: <OS0PR01MB592246E77539C513C1A7FCD686E5A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230825090518.87394-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVEBREj_Y-wQ=fRQu9mnYyCF6Ut7ZhvRkM0N6eWFXp0Qw@mail.gmail.com>
In-Reply-To: <CAMuHMdVEBREj_Y-wQ=fRQu9mnYyCF6Ut7ZhvRkM0N6eWFXp0Qw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9382:EE_
x-ms-office365-filtering-correlation-id: 7646d250-9434-4258-7f9f-08dbaa44833c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5Mrt1VktcVC31BBnm1nV7IZB/2al105OLtSkL5W82OgNbMumddTLQ5RizhSaEC3iOBH9d7DLT8u6ph9Z4EHV1qpoFdpNkEE+VzI4hpKft8pcSYaOf7/yjRLstO0JrDe4XjsSECR80qHhPsfH6kcOp8++bHpkbJqF6wvaPw/gcLttuESBSfipMRqXFZD+rFCPdR0j+7wNIZw1hSHB3TqPCamHrB6xYdsuBrgLl7Y6d+Nai4lyzBcryWii2yIPCdXbaBXJIvySkmQbscFPRHlnrH+J9MSA1yDR2SpujmataI+sK0mBxOeXORU5O1Xm+Pvg7Bkl/PALcpx7Vgm25zYex5XTkXfNvaTf0GAv9yULsUP3OgN65w09BsZFh/ff5Np3Zldwxl1nId8UUpayB3piMMe0Ii6tlw5saTS38LzZHAatLy4DX7DGUiLyxUl0sx9N+sNWwZ30qhVc2tqQwxVpzqn6PQf8Itp5P3JOSYB/oG2qAXjNAfoTJR2yDm7qEwAzH5G/CE+i4uMTuQdu+K3J1EyEuttAtahubaPtW2BYoNcI/WwaXodNdwoF2cHi09icyKPU3K07PHzZn/a7eKmLDFJr2KydduLR5TBAZBVMWJ1Etg3LhSTT/o92b9nni33W
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199024)(1800799009)(186009)(2906002)(8676002)(8936002)(478600001)(71200400001)(53546011)(9686003)(64756008)(66476007)(66556008)(38100700002)(38070700005)(54906003)(52536014)(316002)(66946007)(55016003)(6916009)(66446008)(122000001)(83380400001)(33656002)(7696005)(6506007)(76116006)(107886003)(5660300002)(4326008)(41300700001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWRhVDkxSXNCNUxtdFJKNXJ0dEhNelJLVk5kclk4d1N4eGxPbUcxTkVqVkFJ?=
 =?utf-8?B?elloYWpJNTI5aXFvVDZUS25abzQ4ZGRJdW1Falh6eFZ3UXduUkhXSE52RnNx?=
 =?utf-8?B?MWV0YzhweGY3UitVQWdGMkhEeVdUUnZ5d3p4ZFJlMDREdVNZWEFTSy9penMr?=
 =?utf-8?B?RVlMRWF2ck5iYy96TTNwTXFTS3RrNUFQU0FrVVlOd3Q1UUg4cUYyOUkwTnFD?=
 =?utf-8?B?cmRNT0x3NEZiRnhENHZQTnEvZHF0dENtcDF3amhtWG5UUm00UUlxUUM3SXFE?=
 =?utf-8?B?amE2WFM0d2FCbnhxbyt5Y0lqQjlnbkxENmo4TFlRR000Y05HV2NYUjhHbkNN?=
 =?utf-8?B?QjBHaFJSa2xpUGVXV0YvdnUvV1hwVU5HSUlzUU9IR3E1Mkx4UEJrRFFkaDVq?=
 =?utf-8?B?bFM0OGhaU2ttY3VONElLTDdVNllYSkJZcXY0VWc0SkEyQ2ZKcGtsRHN0Y2Fq?=
 =?utf-8?B?WjhRcm55TTFLczFab2oxdlg4QlZ2TUs2Q3l0dm9kRDZzY2taM05ZL0E3UzNK?=
 =?utf-8?B?KzhkSVo1N1doVHR5a0p4SWJTZ0JVMVdSS3IxRW5kZ0xXRmhUKzdhRVNMSFJa?=
 =?utf-8?B?R1J3cTZJeVJMbjE0U1JtL3dnMVUxVTdYejdyVHdTK0wxUjJKOE9ucXAyVndH?=
 =?utf-8?B?WUFTamVJekFNOExDU2ROTU9oTmVsR0lTQlFoMy9LZGgwU0tFYStKZk5Sa1M5?=
 =?utf-8?B?bjdjcTNHM2NMMXhmNFg0SVBXN2U5YnFMeGhRUGtIYmNYY0l2aTRrUVA5ZTJH?=
 =?utf-8?B?WldhK3VjeVFMd1laMUJPNmdQdW0yMzJzMWdzaXl5dXh1NzJMZWR1dDFBQ2NQ?=
 =?utf-8?B?N295K1VXWDllKzNvT3d2N2UwTkcwelQ5NGYyak1BU2NJVk1melYyUXFXMEtY?=
 =?utf-8?B?SGJ0TG9Nc2UvazZZd2xXREU2V3p0VVBHUG9WTlBLc1JndDdFUDltNVpLeFB3?=
 =?utf-8?B?TDczeUhDVGJ2Y01UUklwNVlkK2RQZi9NMXp1ckVPWm9FSHB3SjJRbHBnaDUv?=
 =?utf-8?B?QzVCcE5FaDZRcnFZY0FuWS96Nk9xRGIxTU0vMjIxajdIM2xZUVIvWHF6MmpI?=
 =?utf-8?B?bEovS3J3bzVZbjc0Z2RjdTFyWkRKZk9oRGZrcWkyTjU0UC8ySnB6TGZrZG13?=
 =?utf-8?B?LzRPejlBaldQSWEvNy9PTnVSeVZjdS9INGk1OG5jMmtBcDZWNFRMb1QraFFn?=
 =?utf-8?B?SVhGazV1N2pPRW9od0J2NWV6UWUrVW1SVVpuYk1kTWhwV0o2emVBNVhjWElj?=
 =?utf-8?B?M0pNNzVabkV2LzhvWWNURGR4TUFuT1c0OUtpUXNTR09rY1JCUjE4VFVSaFFJ?=
 =?utf-8?B?L0JsaGNlQTY2N1h1SFNyVm1DOU5pWnBUdW9aNXZrOGdNajViTUprdThUcTF1?=
 =?utf-8?B?cm9yVlUrWXVyYVc2czU2RmhiSkI0VjczbElTdmpqTkNkMGJ6MjFnV3VqTEZY?=
 =?utf-8?B?L1pWc255VzJvTXIxTkJXcTZVb01YUHRMMlEvTmdiSFVBS20wbGVXRkJ3QitV?=
 =?utf-8?B?d1NYV21VTUZWbFVrdy8rc0hSNnMzYkFCeEpUbzRpaUg2QlM4aFpVNmdWYmR2?=
 =?utf-8?B?M0dtVHBpb1BWemYxUUNQZXRrb2Fkbkh5SUhPU2lIMU8wR09pWjdJSUo2M2Ft?=
 =?utf-8?B?ZzgvOEVPMHg2T2hidXIvV2dIQkIzd1d4Sys5eHp5ZGhyZFhzSW1GcmJTdjdm?=
 =?utf-8?B?N3RNWlhOdGkzMm5QTW4zbEJxcWRlVHUybVhBR0x0TTgrRCs2akZCUVJvY2h4?=
 =?utf-8?B?RW5na0V1RWhBcmNydjN0S2wzeU5PcWYyREJlbDZVWXJTVGtEK1dwcXZHRS9Z?=
 =?utf-8?B?eGwxWFhrL1dWZUFxU2xsc25UTUc5c0huOUo0WER2MXZvRzE1b2JrWXlka0FM?=
 =?utf-8?B?OWJSZ2Y1RjM5WmdyYW5Cayt3Q2dYSDM1Tm5XTDVWRjhWY3NLL0I4clJoaFRI?=
 =?utf-8?B?d3dNTlh0d3kvN3FvRnQyNlE0RGxqRlJxeWNXUGhkWmNjdXRLenpmdkx0VXJB?=
 =?utf-8?B?Z3BycFEyZUxDb3NOZ3pXdlk3RWlwOEtXYXIvNDJPVGlzWWY2Vlh1b25ia1Rq?=
 =?utf-8?B?TkxjMmJUQXZSa3pEN0pXdldKOUNtWEpodDBpMVFtYjNIS25ybHYwTUYvcEdW?=
 =?utf-8?Q?O/JA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7646d250-9434-4258-7f9f-08dbaa44833c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 17:05:43.9126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nVOb9LgaTb1QnZSavx16XuR0KaML7SjfUjD28wj5prTqX4xyMgaGUVm8j8GfVOx6czocXc7/lDWkQbSvG9vJgWZ5JhoEU+42GGWrCMJQJC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9382
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NF0gYXJtNjQ6IGR0czogcmVuZXNh
czogcnotc21hcmMtY29tbW9uOiBVc2UgdmVyc2EzDQo+IGNsayBmb3IgYXVkaW8gbWNsaw0KPiAN
Cj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwgQXVnIDI1LCAyMDIzIGF0IDExOjA14oCvQU0gQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBDdXJyZW50
bHkgYXVkaW8gbWNsayB1c2VzIGEgZml4ZWQgY2xrIG9mIDExLjI4OTZNSHogKG11bHRpcGxlIG9m
DQo+IDQ0LjFrSHopLg0KPiA+IFJlcGxhY2UgdGhpcyBmaXhlZCBjbGsgd2l0aCB0aGUgcHJvZ3Jh
bW1hYmxlIHZlcnNhMyBjbGsgdGhhdCBjYW4NCj4gPiBwcm92aWRlIHRoZSBjbG9ja2luZyB0byBz
dXBwb3J0IGJvdGggNDQuMWtIeiAod2l0aCBhIGNsb2NrIG9mDQo+ID4gMTEuMjg5Nk1IeikgYW5k
IDQ4a0h6ICh3aXRoIGEgY2xvY2sgb2YgMTIuMjg4ME1IeiksIGJhc2VkIG9uIGF1ZGlvDQo+ID4g
c2FtcGxpbmcgcmF0ZSBmb3IgcGxheWJhY2sgYW5kIHJlY29yZC4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4g
PiB2My0+djQ6DQo+ID4gICogRHJvcHBlZCBjbG9jay1vdXRwdXQtbmFtZXMgZnJvbSBkdHNpIGZp
bGVzLg0KPiA+ICAqIFVwZGF0ZWQgZXhhbXBsZSB3aXRoIGRyb3BwaW5nIGNsb2NrLW91dHB1dC1u
YW1lcy4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLXNtYXJjLmR0c2kNCj4gPiArKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc21hcmMuZHRzaQ0KPiA+IEBAIC0xMDUsNiArMTA1
LDI2IEBAICZpMmMzIHsNCj4gPg0KPiA+ICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+DQo+
ID4gKyAgICAgICB2ZXJzYTM6IHZlcnNhM0A2OCB7DQo+IA0KPiBjbG9jay1nZW5lcmF0b3JAIChl
dmVyeXdoZXJlKQ0KT0suDQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
cmVuZXNhcyw1cDM1MDIzIjsNCj4gPiArICAgICAgICAgICAgICAgcmVnID0gPDB4Njg+Ow0KPiA+
ICsgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICAg
IGNsb2NrcyA9IDwmeDE+Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgcmVuZXNhcyxzZXR0
aW5ncyA9IFsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICA4MCAwMCAxMSAxOSA0YyAwMiAy
MyA3ZiA4MyAxOSAwOCBhOSA1ZiAyNSAyNCBiZg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IDAwIDE0IDdhIGUxIDAwIDAwIDAwIDAwIDAxIDU1IDU5IGJiIDNmIDMwIDkwIGI2DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgODAgYjAgNDUgYzQgOTUNCj4gPiArICAgICAgICAgICAgICAg
XTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGFzc2lnbmVkLWNsb2NrcyA9IDwmdmVyc2Ez
IDA+LCA8JnZlcnNhMyAxPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
PCZ2ZXJzYTMgMj4sIDwmdmVyc2EzIDM+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8JnZlcnNhMyA0PiwgPCZ2ZXJzYTMgNT47DQo+ID4gKyAgICAgICAgICAgICAgIGFz
c2lnbmVkLWNsb2NrLXJhdGVzID0gPDI0MDAwMDAwPiwgPDExMjg5NjAwPiwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MTEyODk2MDA+LCA8MTIwMDAwMDA+LA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwyNTAwMDAwMD4sIDwx
MjI4ODAwMD47DQo+ID4gKyAgICAgICB9Ow0KPiANCj4gUGxlYXNlIG1vdmUgdGhpcyBub2RlIGRv
d24sIHRvIHByZXNlcnZlIHNvcnQgb3JkZXIgKGJ5IHVuaXQtYWRkcmVzcykuDQo+IA0KPiBTYW1l
IGNvbW1lbnRzIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybGMtc21hcmMuZHRzaQ0K
PiANCj4gVW5sZXNzIHdlJ3JlIGdvbm5hIG5lZWQgYSBuZXcgaXRlcmF0aW9uIGZvciBzb21lIG90
aGVyIHJlYXNvbiAodGhlDQo+IGNvcnJlc3BvbmRpbmcgZml4ZXMgZm9yIHRoZSBjbG9jayBpbmRl
eCBvcmRlciBhcmUgbm90IHlldCBpbiBsaW51eC1uZXh0KSwgSQ0KPiBjYW4gZml4IHRoZSBhYm92
ZSB3aGlsZSBhcHBseWluZy4uLg0KDQpUaGFuayB5b3UNCg0KQ2hlZXJzLA0KQmlqdQ0K
