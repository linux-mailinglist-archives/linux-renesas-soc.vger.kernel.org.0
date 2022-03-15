Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2292D4D9A4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Mar 2022 12:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347774AbiCOL0R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Mar 2022 07:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233729AbiCOL0Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Mar 2022 07:26:16 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF8849936;
        Tue, 15 Mar 2022 04:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlVeRqwcUJ/3YeNMbpsjGm0WUclb8uTh86W2wJMjw4h6ZvNDBvs/EQZO4Rp6RXugYgVrXuL09efnIQzxqbV6ovn3kwqsm3Ffd28q0+cAtrWgoZlNzCMCREHac7R4reOhk8Rav2Wu/LtmxId8EhWlJeY9pXCiKq6URl6iyltoknvuxM1cbqQtiiBxTNs1cbrl+OGvFJOPSIMLQapasR6j4KY+STwBzjgTV6J0g7DSCTXDCzl1AvnlKUNemDBrsrNqVTsaW1a7Aqt7FmlsFF674oD8JvSVxb67Wz/rnJyABwZLPtNBQGxCNm0fdb5qpmtsY92wWI2gzOUjEsVwQ3riLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qx1B9ktsiCUKHe7AIZ0KioAeMEqGcj/tf8AW/jk5BIw=;
 b=nWqAzKQc8wVZoPaMTUprFOKDRPl4weToI18vpf+zGTQdSZ3RwcphWoPjLkYmDlBk7GgPZYpgfD4GV72ARQ+BsWmETOMFdzc1D12PFZYoILCnh8ZJXpMp1t2C3m0uo9T2EoIPTnJ3mFsc+KXAMxzrcL/t99Woe9MzobKEBybxQ9GATo0CJD8NXHVe2+YWGifbV2J0a5u2ln3uEtQWA0wgdYoQwTHj6uZzKjos8jR3OKlxx2NoYy3Qkk9gka4pfBfMb115uV5RfF3DC9BRQUvKqk0sbsqBT56/cyL3j/T8zp0cWtJ5L04qto0e9S8Em7PX37diM77FJPyA/SRiUohzaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qx1B9ktsiCUKHe7AIZ0KioAeMEqGcj/tf8AW/jk5BIw=;
 b=MXJ9gBNOKZebwQ1AQxJ2EKL/kYpuHRh+v/gegFOxXHjoz5vGhdS6VBQY0rECNByuDdmpXaCxyRDULnDbvk9dItLKOAHqq7Rn58hKGzkD52/lB0XnX96h7XCtEY3WOQ862DqyXfLdx/qG3VMJzIQp5F7RYOpC9DpsxPfKY9nQQdo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB2496.jpnprd01.prod.outlook.com (2603:1096:404:86::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Tue, 15 Mar
 2022 11:25:01 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b%5]) with mapi id 15.20.5061.028; Tue, 15 Mar 2022
 11:25:00 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH V2 3/7] dt-bindings: clock: Add R9A07G043U CPG Clock and
 Reset Definitions
Thread-Topic: [PATCH V2 3/7] dt-bindings: clock: Add R9A07G043U CPG Clock and
 Reset Definitions
Thread-Index: AQHYLxt7/s1is49BmkKkwKyTE8pPKKyvQkKAgBEdFIA=
Date:   Tue, 15 Mar 2022 11:25:00 +0000
Message-ID: <OS0PR01MB5922D0340FF182F0DB9305DB86109@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220303162634.6572-1-biju.das.jz@bp.renesas.com>
 <20220303162634.6572-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUzziRk1UHLyCHBpD6abpHP2dBBZQqnOY-C5H8TZreoOg@mail.gmail.com>
In-Reply-To: <CAMuHMdUzziRk1UHLyCHBpD6abpHP2dBBZQqnOY-C5H8TZreoOg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41d23b73-bba4-490e-0f31-08da06767182
x-ms-traffictypediagnostic: TYAPR01MB2496:EE_
x-microsoft-antispam-prvs: <TYAPR01MB2496373DA0E143C29B0F6A3586109@TYAPR01MB2496.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eJ+vqCtwZo2mzEwauSIXLzxav6ruPgt0B1BIi7sRQpiOJ5bmJ4JaGPeQWEd1MVyiVT7WAC8FStam8tNNLlPpbzzLYprvYaPXey/pTtgKz0cyUpJS16nhHuSgGq48075YkhzU6HqUsSuaGnHeY/qgEe3Gbk07nt9tRVxZ1xPKsQ2yT8rM5q6ggL3BYcm3f0yt+cLwmbfqQcFdqDaZcBtahXUbgNOGCqHe9sY054pkrKAvhKT9uwLl3nc8luflcQ7w0+VVnfGkyudDfK9BIbq8x1yKyGYigqI1UZA15xjMXNkfoxVYFrlozgHqBunl7DXSKa/OmPtTgEqPkqv0No+nph2uur+GspWX+7jJKW0X8tlDME0xOIfWy6v0owvQpuKegMEQ8H1INyzOIzeB96L4jEiR1dtDz5tAPtG+ebkYxyEHMCO2wVV8YiVT6TkbTERJQH2XB1fdV+rzBez8xIppCsAhI2c3NIYg4FL9ugiOiLyDVPR+Q+ywlklx0gTmCaeG6qyA+dl0U1X48XAJUUgqzrWVE2yL9ijpIdnCsDEr2sXCHv0jYy9orok9th5fIUFDvT4taA1pWi8bESZamaJlwcCJzdqWxv0WuwKK/nhmCh0myQbSZD91AjveNmclCbhdWomQocWHrbQ1gzQ/YsDbouo8/ZgCNF2SmYeUivZoPmiWnXQEOefSQmJh/VQbKXCIdJc+Sww0nc8V38uF4OadAw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(7696005)(83380400001)(71200400001)(26005)(53546011)(54906003)(5660300002)(8936002)(86362001)(186003)(6916009)(2906002)(9686003)(38070700005)(52536014)(55016003)(316002)(38100700002)(122000001)(76116006)(33656002)(508600001)(66946007)(66556008)(66476007)(64756008)(4326008)(66446008)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sk5pYjNURW1Land2WVQvRVFFRjV2K1lFcTRxdWFKaWppb0ppTW9FU3FpdG5E?=
 =?utf-8?B?cVdTUlNUelVjSEUwTnppVDhmWFZVd1c4UjhQYmN6dU8xNW00QmZ6NzBaUGRQ?=
 =?utf-8?B?YUJLZ1oxYksrWG9tMlJUbkFtSCtXbU5vRGQrSnZ1ZUQ4RzdhYW94djdXUkVl?=
 =?utf-8?B?bytJbWszQlp5TlZXMm5KL1JKZ1FXdEdnVGhpM0tFUi95TDVGeE4za3VENHNI?=
 =?utf-8?B?azVOOXlHSzRYaUI0NXM0RS8xYnZ4WGJUMVNla2JpdG1wSUVORGVSZFg1Wm5x?=
 =?utf-8?B?U3QxTlJtcHZSSFZZd3ZzT245RzhGOWZzOVNmS29hczU0NHRiaWtPR0wxNGg2?=
 =?utf-8?B?SEZtM1BCU1U5OENIQTl6NTR5VnUvZDIvM05FVitHUWdvMFVCV0x6dVdjejhm?=
 =?utf-8?B?SDhiN1kzcVRhVFJGa1owamRwWUs3b0tOMGdLMzJsTnBQVWcyUU42dHdtSGtY?=
 =?utf-8?B?S2RzWDNPUEx5a3VLSnkwUnk3dXlvOURPZVFmbXFaYWJ1OG1GbEloMUwvZzRu?=
 =?utf-8?B?amFneUFpTjhySllrK0Q2R21QTlVDTk5wWGkwNEhQSlQwaUJGZU55UE95WUox?=
 =?utf-8?B?VFErWHNSdGQyOFRpLys3RXR2TmdGRTd3VTBMSjFuYzc1clVsclRqR2htWHVC?=
 =?utf-8?B?OEdkRmhqSkNMaG5DSS8wNXJtNUtkMzNHT0N0L3YrNnFuY0diL3dxb0F6cGtB?=
 =?utf-8?B?REhGL2YwbGR4YUo2KzZEZFV2WEt1NUlxSXk1c0pDdHJvaWMreWM4SnlmZjNE?=
 =?utf-8?B?am5valBSUGpmSDllVWRrZG5XQUpmb2l4SlZMYnpyTEFLeGFMVDRLNnprK0Ey?=
 =?utf-8?B?R3puNkdFS2IvVVBSYTVUMCtHczYzbTBhZWtldnorL1pQZ3JGMWJReDJiVFNT?=
 =?utf-8?B?UFRKYzdxVXcyK2d5NUlMT3RPNmw3b1NUV3NKb0VYVStZVmlBTVN1TGVpYW1r?=
 =?utf-8?B?UU5JNElrMWRieHArWVZlNFMyUS9Cc01heHh6V1F6NWxFMnlMdDFESFJQM2FR?=
 =?utf-8?B?ZGhSY0dMT2I3TlBadjNVMXp0am0yUlU2R0YxT1Iyait0UXN0a2t2VXpxUEVQ?=
 =?utf-8?B?bmIyQkdnQ201dzIxNFU5YjVqVDNKVXBxT3F1NG9vN3Z4VVQ5VlJvb3FKL1Np?=
 =?utf-8?B?Qm5YbVh1K0ROdUV0TUNNeExqbEVhYXVVdjJRWFZXQzhqNTRYNi9rSjNBL2hI?=
 =?utf-8?B?QmJJaVY3aGdHWFd3dUllVzN0aFJkWFcxSnZpdERpcGxDRlZTVnByNjMxa2Jo?=
 =?utf-8?B?NmJZVHFSalNvdjNLekdyckdJb3lmYWhYYVo0QXZxNGhQSWN3dVJzbmNLVzAz?=
 =?utf-8?B?WmkyN0lzSVBWR2FoQ1d2UUg0Nnd2bUZoekJpVnFSOVhjSFJnOGIyWUl6bG01?=
 =?utf-8?B?V3hJZXJHZDU5L1RYSFBIQUZrZWQwMnJCaWdFMnBVYkgyQlo3SFdiQW9YT2lI?=
 =?utf-8?B?WTNjZmJrby9iSit3RGlQZW5KcVVVWGszZmQxZ3U0S3d2NStGOFhZZTVoZ0FR?=
 =?utf-8?B?V0RveEhpZHh3Y3RvZ0NYQUNQMktkeHIzZEJROXJCU3ZmT25SSVJFclgzZ2hY?=
 =?utf-8?B?a0FrVXNCTnk2b3hFZEtGWVdNWlZ0bjQ2Z3FMMzRGemFINmdLL3M0czhqbHhQ?=
 =?utf-8?B?M1pQZWczRXRrOG11WkxoOExHNWgyemhGZndkWWhQM0hsK3ZDbG4vMStrMnRE?=
 =?utf-8?B?WGg0Y0lmYWJ3Z0ZHUlJ5Qkc3OUU3eWVCK0c1dXFxWDZ6ckx2VTY0NVhVNGVy?=
 =?utf-8?B?ZXF1djFxRWVoT01ya1dPK2JGL01IWFQ0YnNhVjhDRVZmRk54cWJCSWFzU3pX?=
 =?utf-8?B?cW83N2tOSlhoWE9lcmI4ZStQWGVtZXNEOFlxeUlYU1RRZGFKWGJGQXRHbVYx?=
 =?utf-8?B?RFRQMjdUSitQWHBuVWhoa1pwVm94dGdqY2crZW8xZW8rUUd6UmY1UjAzbkc1?=
 =?utf-8?B?N1FKZDMvand2a3lrUjR2NVNCQzIvK1VBakdhUkVaYVRuTVhOdHJicWNHQUxD?=
 =?utf-8?B?UHI3dEcrL1d3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d23b73-bba4-490e-0f31-08da06767182
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2022 11:25:00.6134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zei9ix6AA4BZZPtyoPihCmyHuWxnHhROTHgHwbhVdjCtPJQnvzj/v5lxc1eP6LvA3mu7t7GOxJlWe5rOx/dyj4BHZ0V1jxQ0ngWPVZ06Y6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2496
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQpAYnAucmVuZXNhcy5jb20+
OyBMaW51eC0NCj4gUmVuZXNhcyA8bGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDMvN10gZHQtYmluZGluZ3M6IGNsb2NrOiBBZGQgUjlB
MDdHMDQzVSBDUEcgQ2xvY2sNCj4gYW5kIFJlc2V0IERlZmluaXRpb25zDQo+IA0KPiBIaSBCaWp1
LA0KPiANCj4gT24gVGh1LCBNYXIgMywgMjAyMiBhdCA1OjI2IFBNIEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gRGVmaW5lIFJaL0cyVUwgKFI5QTA3
RzA0M1UpIENsb2NrIFB1bHNlIEdlbmVyYXRvciBDb3JlIENsb2NrIGFuZA0KPiA+IG1vZHVsZSBj
bG9jayBvdXRwdXRzLCBhcyBsaXN0ZWQgaW4gVGFibGUgNy4xLjQuMiAoIkNsb2NrIExpc3QgcjAu
NTEiKQ0KPiA+IGFuZCBhbHNvIGFkZCBSZXNldCBkZWZpbml0aW9ucyByZWZlcnJpbmcgdG8gcmVn
aXN0ZXJzIENQR19SU1RfKiBpbg0KPiA+IFNlY3Rpb24gNy4yLjMgKCJSZWdpc3RlciBjb25maWd1
cmF0aW9uIikgb2YgdGhlIFJaL0cyVUwgSGFyZHdhcmUgVXNlcidzDQo+IE1hbnVhbCAoUmV2Lg0K
PiA+IDAuNTEsIE5vdi4gMjAyMSkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2luY2x1
ZGUvZHQtYmluZGluZ3MvY2xvY2svcjlhMDdnMDQzdS1jcGcuaA0KPiA+IEBAIC0wLDAgKzEsMTg2
IEBADQo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJT
RC0yLUNsYXVzZSkNCj4gPiArICoNCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIyIFJlbmVzYXMg
RWxlY3Ryb25pY3MgQ29ycC4NCj4gPiArICovDQo+ID4gKyNpZm5kZWYgX19EVF9CSU5ESU5HU19D
TE9DS19SOUEwN0cwNDNVX0NQR19IX18NCj4gPiArI2RlZmluZSBfX0RUX0JJTkRJTkdTX0NMT0NL
X1I5QTA3RzA0M1VfQ1BHX0hfXw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Ns
b2NrL3JlbmVzYXMtY3BnLW1zc3IuaD4NCj4gPiArDQo+ID4gKy8qIFI5QTA3RzA0M1UgQ1BHIENv
cmUgQ2xvY2tzICovDQo+ID4gKyNkZWZpbmUgUjlBMDdHMDQzVV9DTEtfSSAgICAgICAgICAgICAg
IDANCj4gDQo+IExpa2V3aXNlLCBwbGVhc2UgZHJvcCB0aGUgdHJhaWxpbmcgKHVwcGVyL2xvd2Vy
IGNhc2UpICJ1Ii4NCj4gDQpPSy4NCg0KPiBVbmZvcnR1bmF0ZWx5IEkgY2Fubm90IGNvbW1lbnQg
b24gdGhlIGxpc3Qgb2YgY2xvY2tzLCBhcyBJIGRvbid0IGhhdmUNCj4gYWNjZXNzIHRvIHRoYXQg
cGFydCBvZiB0aGUgZG9jdW1lbnRhdGlvbiB5ZXQuDQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxkIGJl
IGdvb2QgdG8gY29tcGFyZSB0aGUgUlovRzJVTCBhbmQgUlovRml2ZSBjbG9jayBsaXN0cywNCj4g
c28gd2Uga25vdyBpZiB3ZSBjYW4gaGFuZGxlIHRoZW0gaW4gYSBjb21tb24gZHJpdmVyLCBwb3Nz
aWJseSBldmVuIHNoYXJpbmcNCj4gYmluZGluZyBkZWZpbml0aW9ucywgb3IgbmVlZCB0byBkaWZm
ZXJlbnRpYXRlLg0KPiANCg0KT0ssIEkgd2lsbCBwcmVwYXJlIHRoZSBwYXRjaCB3aXRoIA0KDQox
KSBNb2R1bGUgQ2xvY2tzL3Jlc2V0cyBjb21tb24gdG8gUlovRzJVTCBhbmQgUlovRml2ZQ0KMikg
TW9kdWxlIENsb2Nrcy9yZXNldHMgc3BlY2lmaWNzIHRvIFJaL0cyVUwNCg0KTGF0ZXIgd2hlbiB3
ZSBhZGQgUlovRml2ZSwgd2lsbCBhZGQgTW9kdWxlIENsb2Nrcy9yZXNldHMgc3BlY2lmaWNzIHRv
IFJaL0ZpdmUuDQpJcyBpdCBvaz8NCg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCg0KDQo=
