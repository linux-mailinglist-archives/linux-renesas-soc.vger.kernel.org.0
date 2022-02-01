Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617284A6348
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 19:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235278AbiBASL4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 13:11:56 -0500
Received: from mail-tycjpn01on2105.outbound.protection.outlook.com ([40.107.114.105]:44011
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234654AbiBASJz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 13:09:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuWlg7SMBLWCvRzZ5AFaHGKZEYRG1PvcpSUV0XChYocLhm5ceRT/6u9ew3tYou4cuUroZaFVmGa2vwiMke44GXLJUot9D+6XxFU7lbrgA79IdHJ6AuoaBJzyIV6MN/o/7hJ3Um0WpqxqOPpSdKNpyv+lOlMI1EcjhoYGfVIf78oFIGCLBKH4EvUr3iWJmL6Ujp/lUJwhtXu2jwkPqzN5ETLuM0UxY8jiQwQscvKWU56oqTfTPJ3bXmR8AUGAG55X8fyeyzSAZfT0bNjeeI3kjqSstgg3YlpYNaHKYHTo5PmJWOxjDcy+KpEOAoXQkSfHa9bP8TAWDp2bEWWP9jL/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzR3lXGsYrpTL2PWkuQmeuA2ekJpnTK0FS1YGFppIVs=;
 b=XXeaqpwm51BA60TfpBtZyZ1h89YvZgAOWse1OAryFMB6OuEtUeI6fDKorOJH7tMaqVegRCpGWaA+TuHZDAX7+vKtpj+LSCki7hRFFh8s347BChuxNljIf28C9PIXwW239MOiRN3/ol96W59TUVbU476+8MScAQBmgJIh9HN3z6mfK0GvIcJfW+aTzmg0dtdAOi4yWcWLrc0UuRJqzk/wCbB0Gvw332rH6gul+NKKWgDCJkUGgRSm83cuFrA4wlz7H3WbqXUvM1g0CjkYdm1wdjZPl251FNGIKFHFBwqVXhF1GZJCkSZoskLWmA2qIZB9pgAK9VlwSiaJ4uvXCVeqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzR3lXGsYrpTL2PWkuQmeuA2ekJpnTK0FS1YGFppIVs=;
 b=HDx+Dy2s03TzM2Un89f10CTIPvmIAG6OYl104yjeGWfxuTZLQ7+GcUsEzycolXqddEL6yUdok8M/rMLi9NzCr04oPW7A0As6OOSg9JRxaHpqa6XeQkUIPiQe4c1D0bEo1CuBs1esCCN03mtR73QmZx2n5rd/bi65uBQbq3fsQMM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4792.jpnprd01.prod.outlook.com (2603:1096:604:38::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Tue, 1 Feb
 2022 18:09:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%8]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 18:09:50 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi
 file
Thread-Topic: [PATCH 1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi
 file
Thread-Index: AQHYDRpSlFIp4AdAR0uRKoUk+NJD3ax+/GsAgAAFilCAABD6gIAAAGvQ
Date:   Tue, 1 Feb 2022 18:09:50 +0000
Message-ID: <OS0PR01MB592283E32E9E21C5E1F16C0E86269@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220119095245.5611-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVJD8FFy2aXRpsfvhHL4zTGG8nyGp==q2VzT5k-eNh2pw@mail.gmail.com>
 <OS0PR01MB59220FC4B38C5C66CE6876EF86269@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUjPi-h_S=ZbvPe5X5pJ7NqqfN+Rr=cziyfhqi=PCzn9g@mail.gmail.com>
In-Reply-To: <CAMuHMdUjPi-h_S=ZbvPe5X5pJ7NqqfN+Rr=cziyfhqi=PCzn9g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86262714-d5e1-42de-a223-08d9e5ae0a45
x-ms-traffictypediagnostic: OSBPR01MB4792:EE_
x-microsoft-antispam-prvs: <OSBPR01MB47926AEF4996405B119845A686269@OSBPR01MB4792.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YzbgZ+lMwkvu8ZKMIsfonNt1v0zYSH+dALAqC0Qx60oiWlgsPBu5j/vpJluoEl7RZ9W2Q4jzWd1GL60RpNC0q1IqFtldBCgUiia12gLJqNvqMWMXSmTIoKS5QNiuP7jbaufBDHgPdSgI9Tsaoivtw8NP3wr9ykOrUUESpY8GJsDqr+ePEh3ZTt8rQSIpr/UKhfI/2FDKVDshuQgUB4+uB+PyqZRYyCuQySvBa11+eRJXN1VFP1wQ8Ug+DERl7+YaCKLYHTALPSgQlNhpvOwElTmjoWkuclzicPX7iiNgv1pl1i64F8KmeLx1bVbgGM/JekQUMYN7k48zd5eVCb/r6QP9tlzu5INobd3N5MILYpDwvrbEXPTcQUohKVKptNAzSQLc7fHtuccMjvtFMnPMNLldOI+xju/ctQBNLSnThO/uGei14darRrtrYzD84wKk5dsp/HCJXuVUx4U3qqVLe+oI8+M1Uw2RitGtooMP8xZHoaJ9PXqTlD1VrEjIUjqdaPLzSN3PGf/yiT1Gu5ytuG3PUw9k9yKpKAxw6k7fUGvvvzg5F9uMtfBDGPOb6qJjUmCWVj0vT8fZ28MVou1XRySCP1FwDWgkhmhdJFcqmdP4IA/l6XCDgr9aTZSMbpxcFG+V5M97CjNf9Th0xKRJ/y5Z1u02cxollUTNuSoYmuu+9bkqx5qajx8dqcClOOq1nFqmFe7xr/uu7RFEfXbBPQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(2906002)(52536014)(26005)(186003)(5660300002)(107886003)(55016003)(38100700002)(76116006)(316002)(122000001)(54906003)(83380400001)(9686003)(71200400001)(33656002)(66946007)(86362001)(53546011)(6506007)(66556008)(7696005)(508600001)(64756008)(66476007)(4326008)(8936002)(8676002)(6916009)(66446008)(20210929001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXZVTk1JMEFvVHFVcnczbmNKbUpRT2RQdm1rV0Noem5XOVF4V0I3Sm1XaXYr?=
 =?utf-8?B?UTV0N25uNTRMdUNxL0hkUGtTZFFmaXRLcm80NXV3eTlaOUQ3YUVabXdTa2lE?=
 =?utf-8?B?VWliNTFpQ2Y3WVFwVk52eUprM0o0ci9lcGRxbHpkejBwRWJUcWZVMEFjdGNM?=
 =?utf-8?B?U1dmMlhvbUtrTGJjd1JteHBWcDRwbCtEWkpVWmt2aE0xTFJpM01MbFlCOE9Q?=
 =?utf-8?B?eGU0cXdiWnY0Nm5seTBoU0ZVdmtCNFBXWGlDS1lYZzM5NWs0QUluOVRUdmw5?=
 =?utf-8?B?MGxJTUJrUFQ5cnNLVmF3SFJxcG9WR0ZNK1dtTmtZK0YzSlR1ZTRNSWxNVDVl?=
 =?utf-8?B?M2RJSXVzTGJ0bS84SkYwUTlQZUVxcUhValAzTTVUMjZIL1ovb0lCZk9YK0N5?=
 =?utf-8?B?R1FGTU9TVnlsTDdWM3Z3ZzVQcnMvOVF4djBKVndSN0xtTi9RdkQzOEVWZVZH?=
 =?utf-8?B?RjJVbGtHakVLeEU2UTZYOUgxL2dCUEdiYXZ0cDJ2aWwzTEFhMjliQ2FNMXVv?=
 =?utf-8?B?TVBBWkRONGsvQngwYVRocDhVRy9aRXRDd3FuQitJY3JzTk9QYStjS3hTUFpy?=
 =?utf-8?B?ZDNtMzNzaUl4ZnNLVGtBRzZDMEhhaFhNMlFDb1d2UHJlL29BazVPZERabXBY?=
 =?utf-8?B?UzU1elBDdjJlaU1Ic1VpcFBNL3k4UlE4ZGhuMytvUUl5S1hkZlQ3Y0lBN1Nj?=
 =?utf-8?B?MFdEeGhiZm05alBaNVlnVnlYRnR4QlM0d3A5dkhsL2dMTURpWDdiNHFkNER0?=
 =?utf-8?B?K3lWMDFRdFpmMkNuZzBxb2tLVkFZaEFCd1ViMURIdFlQTW1qRy82a2svVkpB?=
 =?utf-8?B?R0JEUzQyZEhMVUl3dzhBdU1TUkJGRGJhQXpiWk85WFh1VUhibFZINXd5ek9t?=
 =?utf-8?B?SW5PbVNhdStydDdVWE5yUkdXazhHL2FmLzQ2MUNlUitQQ0hhWGFMSVEzVHl6?=
 =?utf-8?B?R0JlWUhJY21CemJpVXpNYXhRRmplYlhsdGlxTlZzeEo0M1psbXBPdDNNOTJa?=
 =?utf-8?B?TWZITWd0MjF3eVdJUVh1MVpuZ3FnenZyRHFrZmhVZkZvL3VzZm5zNFF1bGFG?=
 =?utf-8?B?elhNM1dMNUsxVnhJSVlYYVRvZkkxaGpvcjZnaTN5QUZZSTFWK3VMeVg3clRa?=
 =?utf-8?B?eGNpYS95ZFZCa0x1WEhTeVc2QzJ1aFRZM2FmbGFjZ24valZvNmkwT3FnSUlZ?=
 =?utf-8?B?d0FoZ1M3eXhrOGhCcUs2Z1B4aFQyQWxHUVJBcVBERHI1Lzd4ZWdlQS9HbEM1?=
 =?utf-8?B?YlBXcnQ0OHZ0anl6aFhycmJiTCtMdmF3R1RDK2JDRXJJdUlhRWhLeS9DSTdS?=
 =?utf-8?B?S3lUQlBRRDA1Rnk2dmVPeWlBRGdtUGtIcXhSaFJWRzFlVTNjdlFYUU5ubDkx?=
 =?utf-8?B?MGcxTmR6K3NNbW5sUFF5Ujh6b0ZhcjhmcFBtcjdNRm5LV01CWDkyaWJNM05U?=
 =?utf-8?B?S1N5RURMNTdNazdoS2hHL1Rld0lMZkxJdDAwZm9ROHBhUThyMFlwTnJmT2dJ?=
 =?utf-8?B?Z3pRVm1JSENXS0UxY2hzSEE1aXhRYUJtbmI1ZmlVMHNuYnhiMGNyc2RXWFBB?=
 =?utf-8?B?dVZ5dUtnSlVCV0plc2I5b1JCd3JSdnN4Wm9MWmFSVzQyTDBINCtzbDhnbEln?=
 =?utf-8?B?bzI4eUprU2U5QmozK1hnR2wyMkNNTWszK3FkVnAza2w2SWd0K1kzTEJ4L2Qz?=
 =?utf-8?B?YWROQWRZRzFsVERhcXpScGhFZ3Q1WXFVMkVXTkcwQ3RiWkY4MnM0cFB2eXFj?=
 =?utf-8?B?NmdlU2NZZFpGQzMrTVA0ckhrRW5KQyt0WGs0dmsra1IzSUJkQmdLZW9jeTNr?=
 =?utf-8?B?UFE0UWJRcDAyYnRPMENpTURZaDJUK3l2WFNtZk9xdTRaMHpQV1NFMHFyNUoz?=
 =?utf-8?B?bURVQzJOMkRaMDNyWXBFelkvcGJwYXQ4bDU1eEFNclVXNmNhNjc2QTRRWllI?=
 =?utf-8?B?dm9UdjhkOGZaMmhEcnpUM2xkUFFCRDJyZ1hUTHAvWU9tWG9FTWhmeS83Yll5?=
 =?utf-8?B?SURWOW13bkl2eTRkSzZMWUlHR2M5eXp0bkVXSjJsZHcvUE1mOHVKNjIxOXV6?=
 =?utf-8?B?aUpXK2lFb1B1M1JGRGRacnh3Sm5Za093QXRjRUtVSUtRdW5FSC9jcGlIL3dq?=
 =?utf-8?B?NEkrLzNHUjE0eXN2YUtGNm5PYkRqTXlGMVprVVhEdEhCK01ZaUh1RVY1TWZS?=
 =?utf-8?B?YlM4UlBiYmh4V0RpblBuS3F5Y1psY04yZFFoSm1ySUdyaVQ5YkNpR3VqSWpK?=
 =?utf-8?B?bHpvdG1CTGxCalF4cEdDaDRlekdBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86262714-d5e1-42de-a223-08d9e5ae0a45
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 18:09:50.7948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XWQtNVc6BRDmr1cowqpQq6ZcSFMZ/L0a5n3KYMktprlVnAmPrmEXkl7sVzls8sYD2vAMOOTZoO3Zq+23UIiTkEIhd/kH0VMzCS8u6UmnUWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4792
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzRdIGFybTY0OiBkdHM6IHJlbmVz
YXM6IHJ6ZzJsLXNtYXJjOiBBZGQgY29tbW9uIGR0c2kNCj4gZmlsZQ0KPiANCj4gSGkgQmlqdSwN
Cj4gDQo+IE9uIFR1ZSwgRmViIDEsIDIwMjIgYXQgNjoxMCBQTSBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAx
LzRdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzJsLXNtYXJjOiBBZGQNCj4gPiA+IGNvbW1vbiBk
dHNpIGZpbGUgT24gV2VkLCBKYW4gMTksIDIwMjIgYXQgMTA6NTIgQU0gQmlqdSBEYXMNCj4gPiA+
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiBSWi9H
MkwgYW5kIFJaL0cyTEMgU29DIHVzZSB0aGUgc2FtZSBjYXJyaWVyIGJvYXJkLCBidXQgdGhlIFNv
TSBpcw0KPiA+ID4gPiBkaWZmZXJlbnQuDQo+ID4gPiA+DQo+ID4gPiA+IERpZmZlcmVudCBwaW4g
bWFwcGluZyBpcyBwb3NzaWJsZSBvbiBTb00uIEZvciBlZzotIFJaL0cyTCBTTUFSQw0KPiA+ID4g
PiBFVksgdXNlcyBTQ0lGMiwgd2hlcmVhcyBSWi9HMkxDIHVzZXMgU0NJRjEgZm9yIHRoZSBzZXJp
YWwNCj4gPiA+ID4gaW50ZXJmYWNlIGF2YWlsYWJsZSBvbiBQTU9EMS4NCj4gPiA+ID4NCj4gPiA+
ID4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIGhhbmRsaW5nIHRoZSBwaW4gbWFwcGluZyBk
aWZmZXJlbmNlcw0KPiA+ID4gPiBieSBtb3ZpbmcgZGVmaW5pdGlvbnMgY29tbW9uIHRvIFJaL0cy
TCBhbmQgUlovRzJMQyB0byBhIGNvbW1vbiBkdHNpDQo+IGZpbGUuDQo+ID4gPiA+DQo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
PiA+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXINCj4gPiA+ID4gPHByYWJoYWthci5tYWhh
ZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gPiA+IC0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9yemcybC1zbWFyYy5kdHNpDQo+ID4gPiA+ICsrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1zbWFyYy5kdHNpDQo+ID4gPiA+IEBAIC0xLDYgKzEs
NiBAQA0KPiA+ID4gPiAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkg
T1IgQlNELTItQ2xhdXNlKQ0KPiA+ID4gPiAgLyoNCj4gPiA+ID4gLSAqIERldmljZSBUcmVlIFNv
dXJjZSBmb3IgdGhlIFJaL0cyTCBTTUFSQyBFVksgY29tbW9uIHBhcnRzDQo+ID4gPiA+ICsgKiBE
ZXZpY2UgVHJlZSBTb3VyY2UgZm9yIHRoZSBSWi9HMkwgU01BUkMgRVZLIHBhcnRzDQo+ID4gPiA+
ICAgKg0KPiA+ID4gPiAgICogQ29weXJpZ2h0IChDKSAyMDIxIFJlbmVzYXMgRWxlY3Ryb25pY3Mg
Q29ycC4NCj4gPiA+ID4gICAqLw0KPiA+ID4NCj4gPiA+IE5vdGUgdGhhdCB0aGUgYWJvdmUgY29u
ZmxpY3RzIHdpdGggIltQQVRDSCB2MiAxMS8xMl0gYXJtNjQ6IGR0czoNCj4gPiA+IHJlbmVzYXM6
IEFkZCBpbml0aWFsIGRldmljZSB0cmVlIGZvciBSWi9WMkwgU01BUkMgRVZLIlsxXSwgd2hpY2gg
SQ0KPiA+ID4gaGFkIHF1ZXVlZCBpbiByZW5lc2FzLWRldmVsLCBidXQgZHJvcHBlZCBhZ2FpbiBk
dWUgdG8gYSBtaXNzaW5nDQo+ID4gPiBkZXBlbmRlbmN5IG9uIHRoZSBjbG9jayBiaW5kaW5ncyBp
bmNsdWRlIGZpbGUuICBJbiB0aGUgbWVhbnRpbWUsIHRoZQ0KPiA+ID4gdXBkYXRlZCBjbG9jayBi
aW5kaW5ncyBpbmNsdWRlIGZpbGUgaXMgcmVhZHkuDQo+ID4gPg0KPiA+ID4gU28sIHdoaWNoIG9u
ZSBoYXMgdGhlIGhpZ2hlc3QgcHJpb3JpdHk6IHRoaXMgc2VyaWVzLCBvciBSWi9WMkw/DQo+ID4N
Cj4gPiBWMkwgaXMgaGlnaGVyIHByaW9yaXR5LiBJIHdpbGwgcmViYXNlIGFuZCBzZW5kIFYyLg0K
PiANCj4gT0ssIEkgd2lsbCBtYWtlIGEgcmVuZXNhcy1kZXZlbCByZWxlYXNlIHRvbW9ycm93IG1v
cm5pbmcsIHNvIHlvdSdsbCBoYXZlIGENCj4gZnJlc2ggYmFzZS4NCg0KVGhhbmtzLg0KDQo+IA0K
PiBOb3RlIHRoYXQgdGhlIFJaL1YyTCBjbG9jayBkcml2ZXIgaXMgc3RpbGwgbWlzc2luZywgYnV0
IHRoYXQgZHJpdmVyIHdpbGwNCj4gZm9sbG93IGEgZGlmZmVyZW50IHVwc3RyZWFtIHBhdGggYW55
d2F5LCBzbyBpdCBjYW4gYmUgZG9uZSBpbiBwYXJhbGxlbC4NCg0KV2lsbCBkby4NCg0KQ2hlZXJz
LA0KQmlqdQ0K
