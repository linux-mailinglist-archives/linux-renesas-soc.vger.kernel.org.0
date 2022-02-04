Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36EF54A9838
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 12:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351298AbiBDLKq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 06:10:46 -0500
Received: from mail-tycjpn01on2096.outbound.protection.outlook.com ([40.107.114.96]:8451
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346662AbiBDLKq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 06:10:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsD9Bul4cCjIlBgJoNltMNtsfkGsS/hqqkp0weG82uewf+mwuh7YGramC6o3Tw5dJiOt+LdWefRTLpusC5FQOTM+G38ZdC3d0vVRh+Exc+T6VYwbp26MmTFN5nlFGLAQAVm4RFGUASFJ+GyrLl6x7UEvh7dVBvjfiyZBtCybXlMDqcfyIGzsalKgIvm53ahnBP9W9KYs7OEOWeyx9D1lSBjvsWhHHvTkqW0/9ZgjM2t0Tw+cpmMcj757xfAcPJienscZij9RnTgkKsnlqfx+9LOjENirhLAZBy2V84G5iFAbbDbamnfcr2wR5q8O4T34Tjd2ROs0oddafVilyoZtJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y15MOwSQWKdD0/e71SE1WZQC8qHUJF5/eMwQr+SGi7A=;
 b=U1OSA749nB74mAmPtZcptVq5jR0nsLRr7zHURVD1Tf4LXRt86J+6Pn92QMYfMj6mpq6Ep45gYgNGXc90JDWSJN5+Dukdw0hwLHp0/X/HcTSiIi6/zIhla0MvntWgCuPMT3Do4AcXXmX1AvqxODNAHlqoa+v64K+cjQGXZPPloFDjlMyq1FdPAbjYh3TcC3a2l3k/j3CAKOlOVJUg1J11kX0v8PoO6WJgBUPwsGyLkh5KEfTk088E2bJ4Of7ZI1pBmcYGIwc/jG+0Pk0NTmzcR2h4E7fk77An/RoN5h8aCsEoXGlZXBChIXUsp1puVfQuWAmEQbxJMoEStHuT7+9QyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y15MOwSQWKdD0/e71SE1WZQC8qHUJF5/eMwQr+SGi7A=;
 b=m5BUXzFA3V0Hmg3/Gy7S18kIkPBoqegpOQkK9AV9dHYquYlhhLkz0dD2mqql9cKhcfWbHSPUJ9OubQDOHv6GWB/k15HByC2ZpaGY/+YnIC93yopyQcqmpCU1I92A56N1GKxcXLRwVPVt1sdQ7Ro5HbOw7UmXgpoCCC08c/whHDU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB2012.jpnprd01.prod.outlook.com (2603:1096:404:d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 11:10:43 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%8]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 11:10:43 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
Thread-Topic: [PATCH v3] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
Thread-Index: AQHYGR5PogGHqzKLYUK0CpovjKFmF6yDJE0AgAAY0tA=
Date:   Fri, 4 Feb 2022 11:10:43 +0000
Message-ID: <OS0PR01MB5922BACF003D7DA3B0C967C086299@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220203165130.7206-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWahedJivtbT3USgzgmiT-9+hkyvjAPsMNr8jGHt2quPw@mail.gmail.com>
In-Reply-To: <CAMuHMdWahedJivtbT3USgzgmiT-9+hkyvjAPsMNr8jGHt2quPw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01f84e75-f799-4817-705c-08d9e7cefc8f
x-ms-traffictypediagnostic: TY2PR01MB2012:EE_
x-microsoft-antispam-prvs: <TY2PR01MB20125C7DFFD4199CAA295A7E86299@TY2PR01MB2012.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jTUCNWcER9pLuanqPmR7lIjlohY8HrNgp5H53RcngMy3b6bTG1peIUZKcNYVlh3S/gglcqZxkFWdb5qxNsl8NGTohMLQVo3tdgIazr5VjRAOv6ZhPL/E14kG3V6DQjRULQhUwronq6EHFScgY6tJgicSPfufggnVjch4b/ShGtAY5xlqCEXWKIqMaH0sq/U6nlwMH+QpqMaWqBQ3TucEhsA+Eg8TrMHwH9anNrid9XXclJmjWuSDwO6Qp0cCU/GqDI9fNxpaCtw8eGoiiapqaoCOOkXnQO5iC04zZuwknV2M96Sp7aGrpTgShIAcfaIiC0ZrlerD6DbHmOGxUVCm82ybfG2auo57zLx7omn1ZP4xUOJgflXFFqjZzynJ4JrO7mORu5V9intD7FONGAEjU6L3otwRz/a+/PEie9m2qD5mOU3GM+RdfY7TsEJFonjdoWNQOF6WGv5K8Fv3HQ6sv8HxrxK3em1e3BX2cTVNhf5Wa7XhORnstfLl8PrCH/E0iwfGrNqt9KQsvZSOPldDsoduqbEf9+1hHpS6J3w9b78N+VLpAPL+n6do2ZW8zmdSXeFSJwAQ76bGyG2sH2rpPglGrtD7ZUaOin+3XUrqiiBPbytybMyi/ZobrXPTJAPokHCgAkA6/gVuFulEd4xQxAVvorLqOGbuj6tAd/K+Df53Yf/5xP0EGO6qXTtETl0FEMoY9PoyqK2TL4B5FeU8Wg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(38100700002)(76116006)(52536014)(122000001)(38070700005)(6916009)(66946007)(8676002)(4326008)(5660300002)(83380400001)(54906003)(2906002)(55016003)(8936002)(26005)(86362001)(66556008)(508600001)(9686003)(71200400001)(66446008)(66476007)(64756008)(6506007)(53546011)(7696005)(186003)(33656002)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHhSVDZidGFNQmN0VGp3SUlSNnlyTnZSSExacU1IbndmbnlmYm9YcGJwVVh6?=
 =?utf-8?B?TGJuaGZ6NHg4WmRsemhPVm82Ty9BQUpOSXdYYmlMNzAwb3lSWTZxWVBVS3E4?=
 =?utf-8?B?QVZQT0dQcDljWUZPRHFRMVp2Zk1DcEpXUzVLTExxZE90Qm10ZmU2NjV5eDlU?=
 =?utf-8?B?dGhJUWtUVTVXOGEvRU9EMHFMcVhTbFJiZWtPZTdoWGxBVzE1NEpIaGxkNjZX?=
 =?utf-8?B?WUNQeGtEK1dGTWg4eGFuMmtxc003NVdPNUhUMUR4YmxMMjRZM1d3QkR3Ni9r?=
 =?utf-8?B?RkEveVV3QnZjNEdkUk1uQU1XcmdUS3RXYms5SWVlUkNKMDM1R3pZc0ZWL21o?=
 =?utf-8?B?Ny9XOEZENk1IUXZGNkU2Mlc2TlYrNk9XOXhrOEVta1dIdDM3Y0hmMGYyTzZM?=
 =?utf-8?B?Q2FDMHR3WTQwMjQvVmc4YTZGRDlETFg0ZW5iT1NoZjh1WXdza2ltZ3E5blFY?=
 =?utf-8?B?bFY3Y1ZDTGdYWnhHTlNPbG1IMndQNFBpby8vTGtRM2s5a3JFMmxSbEFMVWtO?=
 =?utf-8?B?SmhDTnFBUVJtWGZWMGErcTVFZ04xdEsvNnpSSUxKVlpiWE9VbElFelRxVDl1?=
 =?utf-8?B?aXlhS2JWOWR1d2ptblE4dmh2VGNudVVJTkIwenRncjllUlh2cEVKVUQxWTBy?=
 =?utf-8?B?a2xtUUpmbmhTMVNQMGxBbDQ5RjZTT2pPbUdOYXFReHZyQ2FpSmNuVXBIeWR1?=
 =?utf-8?B?TW1KaDRDaEF6V1JPS3VUb0V4VDhzZERBcUZlU2JQZFY1NHA5cGYxY0hrRkxt?=
 =?utf-8?B?eHArTFdLZ0NESXAwY2IyNFlza1dBc1JpTzBaVlRzSncwUEJhejc1VXhkSHFv?=
 =?utf-8?B?SlZiYmQ3WERJZHgrZDR4OEo2a1lTcysrOTBaWlZGcDl5TTd4VUZIMjR1c1RJ?=
 =?utf-8?B?eStXdGo3SVU4S3BNR1daZ2oyWEhGM25mZnE2S2xkWFdKRkJ4cTZFamxuSnE3?=
 =?utf-8?B?UWdJd0w0dm9VMWdneEQ0QU5kUWxKalBpN1JPWWtSekFsN0dxRUNUTGN0NFRG?=
 =?utf-8?B?QTZXQlpCWi9RYStkbzlHVjhmdDVwQU1lVHZKc2NTbncwRGR0bnlxMDlKSWY4?=
 =?utf-8?B?Y3dsNlhoTG5nUFAzZjgxYmRzbTBGTi95dmlrbzFCR1BmbnRRank0UVN3VXFR?=
 =?utf-8?B?NVYzampDTFc2RzBaSy9rQStPVk9BNUNxTzdxU1lmNEJPYTg0cDZ6VEMwcUxQ?=
 =?utf-8?B?RHZYT2hxQmlDR3FNN2lhRE1xZnptUEoxU2l3QnVSbzVBVU5YTVVpUTN0WFVT?=
 =?utf-8?B?UkZVc1ozNjNsa0hOaVJvdTRQa2VUcTZmTHp1Y3JNdnpJRitzTEJycmhrb2Rv?=
 =?utf-8?B?RGZReFZLVVY2MC9zYTZiay9ya1M3L08xQUR2cmZmaFB4OXhWaElMTkhoTkpF?=
 =?utf-8?B?U2NsVUNBaFZnSEU3aDJIMFBlUmxwemliV2o3bmxCb3pxeVc4SVhLZFFmNDJq?=
 =?utf-8?B?eW5LWXpLSVhOQ3Jwa1VBM2h3SE5zMUkvZjZxMzVKcWU2V0dNTW9xRVNXRkRw?=
 =?utf-8?B?d2JpelQwWjFjWmQ2L1FzQzRhc3dZZXlaSzVxYk5pcUpHcUVXelRqa05uSEtK?=
 =?utf-8?B?Q2VLdWxodzBzUTRsNUsyNkZEVW1ERGwyUlBwdGtuaUFWZ1dVU29xVVh2NGxJ?=
 =?utf-8?B?M21uMWFNKzhiVnViUStjVmhTR0I0N240eVBxWU1uS0NCU3lqZTZrN1EvNnVs?=
 =?utf-8?B?MzhSbW9DdWViQjdQSkJraVcrTUw1RFd5UE5BcnlLaGZhdlQ2THluNEtScHhD?=
 =?utf-8?B?UUZRSE9ROUV3ZUI2dEpnS3p1S3VpMnVTbEwyait4dXg4SXUreWc2R3VoZkVK?=
 =?utf-8?B?QWdiN2VZM3ZiaUljcXpCamNrYktEdUtSRHg5b1VtczlJazYzdXFPYTd0ZHpn?=
 =?utf-8?B?cDFzZE95WlBLYWRXcktiWjBZQjl6a0JkaHZVb0VlZDVZZzE4UEVVdk9MRTl2?=
 =?utf-8?B?aG1qWFU4UkkrRnREa3dPSkx3YmMwV1pjQ0JRK0RBYURHQnFiMkY2dXJYWlFi?=
 =?utf-8?B?bFRFOVF3VW5LNDE2aFRyZnNRdTZRK2I1UGZWMXhWTE02MEZXMzZ6K2hZV1ds?=
 =?utf-8?B?YW1KcEZwaEw3NytJdjRlb2dESTJYazdRTzZJWDF4SjFqL3VkaUJvcHRCdysr?=
 =?utf-8?B?OFVVMTl4TEEzbjZqQWpXRCswSzZmeDU5NDFiVjNOSFd5bXR5MVhLUVBSZHZV?=
 =?utf-8?B?VFI0RWdFZUJLRWUrSFkydjRIcW92VHJuY1VySmpTdGRGV011czNyVk00MW5C?=
 =?utf-8?B?S2dLdzhqYXFWU3A1MHM0bmR6ODl3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f84e75-f799-4817-705c-08d9e7cefc8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 11:10:43.5079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rB02OamTf2F5Q3cV6HkxWlfGec6E0Bqpo4nI1vruCN4aoFm+YzomrpM5aXuRIGsZgGimnosu67x2t5I25gn2bLgenapEyccLE6dIM7eyL9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2012
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjNdIGNsazogcmVuZXNhczogcnpnMmwtY3BnOiBBZGQgc3VwcG9ydCBmb3IgUlovVjJM
DQo+IFNvQw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgRmViIDMsIDIwMjIgYXQgNTo1
MSBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+
IFRoZSBjbG9jayBzdHJ1Y3R1cmUgZm9yIFJaL1YyTCBpcyBhbG1vc3QgaWRlbnRpY2FsIHRvIFJa
L0cyTCBTb0MuIFRoZQ0KPiA+IG9ubHkgZGlmZmVyZW5jZSBiZWluZyBSWi9WMkwgaGFzIGFkZGl0
aW9uYWwgcmVnaXN0ZXJzIHRvIGNvbnRyb2wgdGhlDQo+ID4gY2xvY2sgYW5kIHJlc2V0IGZvciB0
aGUgRFJQLUFJIGJsb2NrLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCByZXVzZXMgcjlhMDdnMDQ0LWNw
Zy5jLCBhcyB0aGUgY29tbW9uIGNsb2NrIElEUyBhcmUgdGhlDQo+ID4gc2FtZSBiZXR3ZWVuIFJa
L0cyTCBhbmQgUlovVjJMIGFuZCBhZGRpbmcgYSBzZXBhcmF0ZQ0KPiA+IHI5YTA3ZzA1NF9jcGdf
aW5mbyB0byB0YWtlIGNhcmUgb2YgRFJQLUFJIGNsb2Nrcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5j
b20+DQo+ID4gLS0tDQo+ID4gdjItPnYzOg0KPiA+ICogcmV1c2UgcjlhMDdnMDQ0LWNwZy5jIGZv
ciBSWi9WMkwNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0tIGEvZHJp
dmVycy9jbGsvcmVuZXNhcy9yOWEwN2cwNDQtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9y
ZW5lc2FzL3I5YTA3ZzA0NC1jcGcuYw0KPiA+IEBAIC0xMSwxMiArMTEsMTMgQEANCj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KPiA+DQo+ID4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9j
bG9jay9yOWEwN2cwNDQtY3BnLmg+DQo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9y
OWEwN2cwNTQtY3BnLmg+DQo+ID4NCj4gPiAgI2luY2x1ZGUgInJ6ZzJsLWNwZy5oIg0KPiA+DQo+
ID4gIGVudW0gY2xrX2lkcyB7DQo+ID4gICAgICAgICAvKiBDb3JlIENsb2NrIE91dHB1dHMgZXhw
b3J0ZWQgdG8gRFQgKi8NCj4gPiAtICAgICAgIExBU1RfRFRfQ09SRV9DTEsgPSBSOUEwN0cwNDRf
Q0xLX1AwX0RJVjIsDQo+ID4gKyAgICAgICBMQVNUX0RUX0NPUkVfQ0xLID0gUjlBMDdHMDU0X0NM
S19EUlBfQSwNCj4gPg0KPiA+ICAgICAgICAgLyogRXh0ZXJuYWwgSW5wdXQgQ2xvY2tzICovDQo+
ID4gICAgICAgICBDTEtfRVhUQUwsDQo+ID4gQEAgLTE0OSwxMzEgKzE1MCwxNDIgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBjcGdfY29yZV9jbGsNCj4gcjlhMDdnMDQ0X2NvcmVfY2xrc1tdIF9faW5p
dGNvbnN0ID0gew0KPiA+ICAgICAgICAgICAgICAgICBDTEtfRElWSURFUl9ISVdPUkRfTUFTSyks
ICB9Ow0KPiA+DQo+ID4gLXN0YXRpYyBzdHJ1Y3QgcnpnMmxfbW9kX2NsayByOWEwN2cwNDRfbW9k
X2Nsa3NbXSA9IHsNCj4gDQo+IFsuLi5dDQo+IA0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHsN
Cj4gPiArICAgICAgIHN0cnVjdCByemcybF9tb2RfY2xrIGNvbW1vbls2Ml07ICNpZmRlZiBDT05G
SUdfQ0xLX1I5QTA3RzA1NA0KPiA+ICsgICAgICAgc3RydWN0IHJ6ZzJsX21vZF9jbGsgZHJwWzBd
Ow0KPiA+ICsjZW5kaWYNCj4gPiArfSBtb2RfY2xrcyA9IHsNCj4gDQo+IFsuLi5dDQo+IA0KPiA+
ICsgICAgICAgfSwNCj4gPiArI2lmZGVmIENPTkZJR19DTEtfUjlBMDdHMDU0DQo+ID4gKyAgICAg
ICAuZHJwID0gew0KPiA+ICsgICAgICAgfSwNCj4gPiArI2VuZGlmDQo+ID4gIH07DQo+IA0KPiBZ
b3Ugc2hvdWxkIGRvIHRoZSBjb21tb24vZHJwIHNwbGl0IGZvciBjb3JlIGNsb2NrcyBhbmQgcmVz
ZXRzLCB0b28uDQo+IEl0IGRvZXNuJ3QgbWF0dGVyIHRoYXQgbXVjaCBub3csIGFzIGN1cnJlbnRs
eSBubyBkcnAgY2xvY2tzIG9yIHJlc2V0cyBhcmUNCj4gaGFuZGxlZCB5ZXQsIGJ1dCBkb2luZyBp
dCBub3cgYXZvaWRzIGNvbmZ1c2lvbiwgYW5kIG1ha2VzIGl0IGNsZWFyIHdoYXQgaXMNCj4gdGhl
IGZ1dHVyZSBwbGFuLg0KDQpBZ3JlZWQuIFdpbGwgZG8gdGhpcyBjaGFuZ2VzIGluIHRoZSBuZXh0
IHZlcnNpb24uDQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gDQo+ID4gQEAgLTM0NiwxMSArMzU4LDM0
IEBAIGNvbnN0IHN0cnVjdCByemcybF9jcGdfaW5mbyByOWEwN2cwNDRfY3BnX2luZm8gPSB7DQo+
ID4gICAgICAgICAubnVtX2NyaXRfbW9kX2Nsa3MgPSBBUlJBWV9TSVpFKHI5YTA3ZzA0NF9jcml0
X21vZF9jbGtzKSwNCj4gPg0KPiA+ICAgICAgICAgLyogTW9kdWxlIENsb2NrcyAqLw0KPiA+IC0g
ICAgICAgLm1vZF9jbGtzID0gcjlhMDdnMDQ0X21vZF9jbGtzLA0KPiA+IC0gICAgICAgLm51bV9t
b2RfY2xrcyA9IEFSUkFZX1NJWkUocjlhMDdnMDQ0X21vZF9jbGtzKSwNCj4gPiArICAgICAgIC5t
b2RfY2xrcyA9IG1vZF9jbGtzLmNvbW1vbiwNCj4gPiArICAgICAgIC5udW1fbW9kX2Nsa3MgPSBB
UlJBWV9TSVpFKG1vZF9jbGtzLmNvbW1vbiksDQo+ID4gICAgICAgICAubnVtX2h3X21vZF9jbGtz
ID0gUjlBMDdHMDQ0X1RTVV9QQ0xLICsgMSwNCj4gPg0KPiA+ICAgICAgICAgLyogUmVzZXRzICov
DQo+ID4gICAgICAgICAucmVzZXRzID0gcjlhMDdnMDQ0X3Jlc2V0cywNCj4gPiAgICAgICAgIC5u
dW1fcmVzZXRzID0gQVJSQVlfU0laRShyOWEwN2cwNDRfcmVzZXRzKSwgIH07DQo+ID4gKw0KPiA+
ICsjaWZkZWYgQ09ORklHX0NMS19SOUEwN0cwNTQNCj4gPiArY29uc3Qgc3RydWN0IHJ6ZzJsX2Nw
Z19pbmZvIHI5YTA3ZzA1NF9jcGdfaW5mbyA9IHsNCj4gPiArICAgICAgIC8qIENvcmUgQ2xvY2tz
ICovDQo+ID4gKyAgICAgICAuY29yZV9jbGtzID0gcjlhMDdnMDQ0X2NvcmVfY2xrcywNCj4gPiAr
ICAgICAgIC5udW1fY29yZV9jbGtzID0gQVJSQVlfU0laRShyOWEwN2cwNDRfY29yZV9jbGtzKSwN
Cj4gPiArICAgICAgIC5sYXN0X2R0X2NvcmVfY2xrID0gTEFTVF9EVF9DT1JFX0NMSywNCj4gPiAr
ICAgICAgIC5udW1fdG90YWxfY29yZV9jbGtzID0gTU9EX0NMS19CQVNFLA0KPiA+ICsNCj4gPiAr
ICAgICAgIC8qIENyaXRpY2FsIE1vZHVsZSBDbG9ja3MgKi8NCj4gPiArICAgICAgIC5jcml0X21v
ZF9jbGtzID0gcjlhMDdnMDQ0X2NyaXRfbW9kX2Nsa3MsDQo+ID4gKyAgICAgICAubnVtX2NyaXRf
bW9kX2Nsa3MgPSBBUlJBWV9TSVpFKHI5YTA3ZzA0NF9jcml0X21vZF9jbGtzKSwNCj4gPiArDQo+
ID4gKyAgICAgICAvKiBNb2R1bGUgQ2xvY2tzICovDQo+ID4gKyAgICAgICAubW9kX2Nsa3MgPSBt
b2RfY2xrcy5jb21tb24sDQo+ID4gKyAgICAgICAubnVtX21vZF9jbGtzID0gQVJSQVlfU0laRSht
b2RfY2xrcy5jb21tb24pICsNCj4gQVJSQVlfU0laRShtb2RfY2xrcy5kcnApLA0KPiA+ICsgICAg
ICAgLm51bV9od19tb2RfY2xrcyA9IFI5QTA3RzA1NF9TVFBBSV9BQ0xLX0RSUCArIDEsDQo+ID4g
Kw0KPiA+ICsgICAgICAgLyogUmVzZXRzICovDQo+ID4gKyAgICAgICAucmVzZXRzID0gcjlhMDdn
MDQ0X3Jlc2V0cywNCj4gPiArICAgICAgIC5udW1fcmVzZXRzID0gQVJSQVlfU0laRShyOWEwN2cw
NDRfcmVzZXRzKSwgfTsgI2VuZGlmDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0K
PiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBs
aWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMNCg==
