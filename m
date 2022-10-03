Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 904935F2C49
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 10:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbiJCIqk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 04:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbiJCIqS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 04:46:18 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490EE1A07F;
        Mon,  3 Oct 2022 01:25:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zr3Hv58YHpFb8V5RjYl2uxDXAO98nsDNgb8DAxg95m1ZgVuKs11+CWiA/Bd4krq/TeKuh6hBI/gNfPfqxzTMfFdyKSXrmXZGdY3Q7swyNuYOJ2sEi0LryCm1wYF/f0t8a3FLqtuoA14FOcIe0dRwpfdypHMXaYkOmhblw62q4R055Zie4wuqKjG5FotzN5if7d9s3EpwZi5lNIFkjhLNCnXSmfRLSK9NaQ67Q0jIQWrnhdf4MMtb2ZZRcMIOh+0AGYtRzNaTMio/4Wkx8OHzRoiwwKSEt8uKgRWXKD4bQZiQvuFx3sK+3jT+2solq1D6ZSoUXQKvkWXine/qfZSANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTKyARaqCrwrGE7flFDUJD45iRYbULdw01QtyrEPIpI=;
 b=GAABhJc4jf6GXyCGZG/8OTKgbmTxY2Xshm9FMuVNNoa+emQaYjjTFdth6SyPWwsgvBcpZcMvWyk3bR9Guul8SmoDYDkXBG0sBt7mwqlVEmsI6KGS84NhUDK2HTqTa1KOZfQ9C5DM0FuQvtv6GxmrFQm5OL4uqD++TEOclVrrzFClPRSlXgD6k1krGcBEc9x7bAqKsj267a5kUTgCa99lAAxYv7R1awXbwf0nSuUMfd/JJogXQJhKRIKdsAwB182BkpD7C2XF7tWzBAeoYVmZmtL0gLlQHdSczDdBhtYlEJeE73O5fxSNAZRu1L4uE2RFNJ+5pm96tMGYYHURHmRT6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTKyARaqCrwrGE7flFDUJD45iRYbULdw01QtyrEPIpI=;
 b=st3bwzqBKL+at0DeMxDeUFqHnKE2xhsxXnyo1Fhc+aujq4JRCXHp1vGjLnus/ErolRwDywOsDSxyBBgI74PWUD+ojh3OnySUxYvIqxXzlsz7x+xt9vVP/AejHYMHrU7hPP3MlQ4Rv74oiruehu9vtuHJejNqtAtwxkcVeqqPka4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10179.jpnprd01.prod.outlook.com (2603:1096:400:1e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 3 Oct
 2022 08:25:07 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262%7]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 08:25:07 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Lee Jones <lee@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 4/8] dt-bindings: mfd: rzg2l-mtu3: Document RZ/G2UL
 MTU3 counter
Thread-Topic: [PATCH RFC 4/8] dt-bindings: mfd: rzg2l-mtu3: Document RZ/G2UL
 MTU3 counter
Thread-Index: AQHY0arnN204r1km9kWDmY4lojl+hK38VyKAgAAHINA=
Date:   Mon, 3 Oct 2022 08:25:07 +0000
Message-ID: <OS0PR01MB59226A719B656596435B4ECE865B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220926132114.60396-1-biju.das.jz@bp.renesas.com>
 <20220926132114.60396-5-biju.das.jz@bp.renesas.com>
 <f8d68874-e3d9-887e-e9d4-0da72352c564@linaro.org>
In-Reply-To: <f8d68874-e3d9-887e-e9d4-0da72352c564@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10179:EE_
x-ms-office365-filtering-correlation-id: 2c0aadce-4cef-4b1f-8cda-08daa518c77f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ob4EiDfEYCYYm5Bh8S9/FHQ28LNOnO47sjwr9jyB39cl5e+EzbiIny+lHfa0/Z5JOdFphENe6RbDqMYJJjTeHp7JUsNoVF7ek4jiJBvv7F5ckEc6cdg0Os7c1gZQL5M8MZZgFRsrbgVP6D3+kXeGLloXNu2NzH8Li82kbP9+bUxAr1G+w0+mWO+W9+ikz734Vv97ueTjPg+01JiRLHDa0gl1pqEz/WylnthAxo4rMHtopTLvshnO32Uhj7Lp8R0BTk9w67M0ORoPbqL+PfcnXgSrcV/Kn8NEY+Bz40Q5Iz22MmUWFy5vHl3sMXfn7QQ440Iw6z5UTI7GTZcZDXaBR+kAqOWJW4NFGVX0QjB88vdLuYD4J+GFjJjv6Cwb9slER7YDdBBUnAaSlKXTgpyrg9xf+eXp6PeoLpFMJz8eB9XD0IGYVAvYOYsQao5tLPlLzERXydd8rq3+F4WSZ5oyUDRCRPg9PZlk3Vs5iQxcB1Y7995tzMZPgqHPs2kK7yP/gHTKrJfeJaFCw4lcReAwnO1rUM4/x4UB18p5S4pWxxvJ0P/9gwBwa80x2hrRj5t9QUtEZIUITHtmDdsjHDsSHCUkgoQUglVud6pmbW+I/EKeNJRoxeIa50rfkn7+DKiD3W6a1ykjds36BvgA0gyqfiFlrguZ1/G5jf80ptaO//WM9Xdb5SgxdvjssxzWqaMQRkc22hV2pADwM1vyIxgA47xru5dB3NOqGqss5L9tkXZeB8G87DOgF13IVQkv0gKFDeEZrEpWm+EsE77kSd2N+y95Gq3jC/D/Pr7z1+/g8nA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199015)(8936002)(5660300002)(122000001)(38100700002)(83380400001)(52536014)(110136005)(41300700001)(2906002)(86362001)(71200400001)(966005)(478600001)(54906003)(186003)(45080400002)(33656002)(8676002)(64756008)(38070700005)(4326008)(66446008)(66476007)(66556008)(55016003)(66946007)(7696005)(316002)(76116006)(26005)(53546011)(9686003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?andNR0R1UGJoNXZ4YzQxUlNRSzRIeFpEK2c1L1o3alFZdWtqRUg4S2NiNGwv?=
 =?utf-8?B?dzZRREtJdjFERGJEMEZlTmZrbXJDcGtjVnJiRUFOQmNqNkY3ZExrZzlPWEM0?=
 =?utf-8?B?cXBFK0FXY2x3M2t1S09odkxCWEZqd1d3aFF4M1JNL2ZrU2JHaDBhZkpUUk9r?=
 =?utf-8?B?UFZvMEJYdVBvU3FnTWZJRzZaRFM5aDljS1JPOHJnSUpoM2xRSjNOTG5rOXJN?=
 =?utf-8?B?TnREUVgyQld1VTBUZ3ZIS244bDZrYWN0VDZzV1IxeE1lbGpsNEhPdlVwRFBR?=
 =?utf-8?B?VDdOVFpJNjl3MW84Z1cwUkRzU21HWlJackhZWDNCelJRUXpZZEZ0SmVLTTQw?=
 =?utf-8?B?bCtnR0pVOTlkVlNyMXgwNWdvM0h5SXpoYUR6OVlETVc2dmR3eFhzeXA4YWFQ?=
 =?utf-8?B?SWVUQ1hNR1g5MjdKMjFjeitYR3hhcy9EZjhnekZXb1hHZ2plZWpCKzhOenJW?=
 =?utf-8?B?d244OHJLOFFaQ2duOTA3UkxYVm9ESCtETjgzRk5HZGxSVG1WcitGOXV0dVZQ?=
 =?utf-8?B?ZE5YWE90Rk50WjkzL0ZQY3Jsb1hyTGFEeTVObVplUVdoazl2dkdSSS9kbGhr?=
 =?utf-8?B?cVc2UXZMTU5ySWhmR3ovWW55aXUrKzZTQ0tjMzhRT09JWGl6eU5ESWt1NHhi?=
 =?utf-8?B?Y0h5R3YzdGJDSXNzVys2eENXYkRrbjY0dnRKbyt1Y0VUb1BHV3lXWDY2K056?=
 =?utf-8?B?UlpxQW5KWDl4NlF0MXgxWEFMU0JTbEtqdjJoaEFXRm9icWhhVzk5bE5ja2FS?=
 =?utf-8?B?b1B2UmZMa2FuRVhucTZKLzdlM2xZeXAwZWZtYkZkbTZuODkzaVBKU3NiVE4x?=
 =?utf-8?B?djdJQzV2Q3JXTEhMRHhUVkpXZVZKQTVCcnBHeDZycmo4a2JIbkk2VHJRM0pG?=
 =?utf-8?B?YUxNa1cybTFiLys2dnhyc0pZS1JIRjVMaHBBVEtMR2VyZHAzdjVRd3pwQXI0?=
 =?utf-8?B?NXlSUFl0TFp5ekVFWVpBZmEyR25vWWRwVk5qT1lJcEU2ZnI5eFZvQ0pWNldE?=
 =?utf-8?B?OVUxakp6aXFGTTRJVlhMcEI0WnZtUjg1RklZdmZSUnZhYnpocWcxcUVyc2pG?=
 =?utf-8?B?TFc3LzA2aDF4RjlaQjIvZFRRQzZBZmpwR3FvQXFVc1hNQUFyWlViSW5lVlIv?=
 =?utf-8?B?OFNTcHBwd09IK2R2N3BqWHJ6cEI4RWVsQmJ5NmlEOHAwMnFLWXlaRGhuM1oz?=
 =?utf-8?B?bWZDeHlCUkVxQWR5Rm1XZmh5NUVVMWNRMXVjc3MwZkl0bUY3VnA2QXlCYjIr?=
 =?utf-8?B?d3V4Vmw4dFlVQTVDRzQ4aGF5bURtQ2tmNldQMWYzd24vSzU3eWM5NHl3Qi9W?=
 =?utf-8?B?Y2lHTWg1ZDZrbTZSZGg3ZmhQQ3pLVHkvZDJiZWNvbFUyZzVtTWhKSUlKSEpi?=
 =?utf-8?B?OU8rYU9zdnU4Z1lpbFlXcEhzR3ZVOFQzenBUQWY1K2ZRcEdlQjRHZlVsMGRR?=
 =?utf-8?B?TzVyNGRuUEEwSlc4V21PVjhiYVkzbE9ubzZtN2x0M3BNcUpkV284bW9qamkw?=
 =?utf-8?B?clI2eXlVR0E4WmhFa1RCWEp6VTZFT0FmVDZIcDQ0V0krVTBNTnZiTlI2NTVP?=
 =?utf-8?B?ems2WWZFV2lUNCt3UDJ4OHZ5SVdwUUtFOTRXVTUvU05TWU9hTVRqRmRyYXNy?=
 =?utf-8?B?K2gwakszL2dkQ0duWjkzRUc1MzJIN1NrVE5JUjdGMzdXandSNUhNOSswNDdH?=
 =?utf-8?B?ZlJpTWdzOWYzZGt1SzcxMEgwODBjeWt1Y1lEWXQ5RmowMjEzcityVGxOL094?=
 =?utf-8?B?eDRyRWFZeXdoai9YMVdrQ0tDMm4rRmJjdTQyMCtXVVVFVHlvNjFtZjhrWWc1?=
 =?utf-8?B?YTdBR1gzSU83eTJ1N0lqdStEUEo5cHZXN3E1RE1rT3Q2eFhjOFF2RGpNRnRx?=
 =?utf-8?B?R0JzRVRIWUNGNmxSZ2hZNG5WQi9qZHZrQjZBSjlmZWJPY2FrOEhta05LczhI?=
 =?utf-8?B?L2J6eFdyZGJDVmQrM3JQQ0EwUHZiSUROTHVQeDBqY29zanRRcTA3TnVYZlM2?=
 =?utf-8?B?S2NscitZSlRUcUQ1c3k0R0tqNjVGNGlvb3M0TFBWTTNLOWJVUEhLWDRlU2xl?=
 =?utf-8?B?bGpkRUNoOFZRRVVMZDN1MXdGSGtmcmxmZEJSc1hkOGFQMGNxM0NETzcyOURM?=
 =?utf-8?Q?O4SvyiMz7Qs0n3MgafpUP0Zj3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0aadce-4cef-4b1f-8cda-08daa518c77f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 08:25:07.0845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lUO8PwaWmnMKF0w7kb1sHJNMBDeoddlEPGrmZhV3V9vqpb9gTD+fpieeZvQpzdwKZnVsoABssWdh5bweiGTTKTGSWbypwtTXaJsSO9CfVrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10179
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpIaSBLcnp5c3p0b2YgS296bG93c2tpLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggUkZDIDQv
OF0gZHQtYmluZGluZ3M6IG1mZDogcnpnMmwtbXR1MzogRG9jdW1lbnQNCj4gUlovRzJVTCBNVFUz
IGNvdW50ZXINCj4gDQo+IE9uIDI2LzA5LzIwMjIgMTU6MjEsIEJpanUgRGFzIHdyb3RlOg0KPiA+
IERvY3VtZW50IDE2LWJpdCBhbmQgMzItYml0IHBoYXNlIGNvdW50aW5nIG1vZGUgc3VwcG9ydCBv
biBSWi9HMkwNCj4gTVRVMw0KPiA+IElQLg0KPiA+DQo+IA0KPiBTcXVhc2ggd2l0aCBwcmV2aW91
cy4gTmV3IGRldmljZXMgYXJlIGFkZGVkIGNvbXBsZXRlLCBub3QgYXJ0aWZpY2lhbGx5DQo+IHNw
bGl0IGludG8gbXVsdGlwbGUgbm9uLXdvcmtpbmcgY29tcG9uZW50cy4NCg0KT2sgd2lsbCBzcXVh
c2ggaW50byBwcmV2aW91cyBwYXRjaC4NCg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5n
cy9tZmQvcmVuZXNhcyxyemcybC1tdHUzLnlhbWwgICAgICB8IDM1DQo+ICsrKysrKysrKysrKysr
KysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRp
ZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcmVu
ZXNhcyxyemcybC1tdHUzLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZmQvcmVuZXNhcyxyemcybC1tdHUzLnlhbWwNCj4gPiBpbmRleCBjMWZhZThlOGQ5Zjku
LmM0YmNmMjg2MjNkNiAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWZkL3JlbmVzYXMscnpnMmwtbXR1My55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yZW5lc2FzLHJ6ZzJsLW10dTMueWFtbA0KPiA+
IEBAIC0xOTIsNiArMTkyLDM3IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgIiNzaXplLWNlbGxzIjoN
Cj4gPiAgICAgIGNvbnN0OiAwDQo+ID4NCj4gPiArcGF0dGVyblByb3BlcnRpZXM6DQo+ID4gKyAg
Il5jb3VudGVyQFsxLTJdKyQiOg0KPiA+ICsgICAgdHlwZTogb2JqZWN0DQo+IA0KPiAgICAgYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQoNCk9LLg0KDQo+IA0KPiA+ICsNCj4gPiArICAgIHBy
b3BlcnRpZXM6DQo+ID4gKyAgICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgY29uc3Q6IHJl
bmVzYXMscnpnMmwtbXR1My1jb3VudGVyDQo+ID4gKw0KPiA+ICsgICAgICByZWc6DQo+ID4gKyAg
ICAgICAgZGVzY3JpcHRpb246IElkZW50aWZ5IGNvdW50ZXIgY2hhbm5lbHMuDQo+ID4gKyAgICAg
ICAgaXRlbXM6DQo+ID4gKyAgICAgICAgICBlbnVtOiBbIDEsIDIgXQ0KPiA+ICsNCj4gPiArICAg
ICAgcmVuZXNhcywzMmJpdC1waGFzZS1jb3VudGluZzoNCj4gPiArICAgICAgICB0eXBlOiBib29s
ZWFuDQo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246IEVuYWJsZSAzMi1iaXQgcGhhc2UgY291bnRp
bmcgbW9kZS4NCj4gPiArDQo+ID4gKyAgICAgIHJlbmVzYXMsZXh0LWlucHV0LXBoYXNlLWNsb2Nr
LXNlbGVjdDoNCj4gDQo+IEkgcHJvcG9zZSB0byBkcm9wICJpbnB1dCIuIEkgdW5kZXJzdGFuZCB5
b3UganVzdCBzZWxlY3QgcGlucyB3aXRoDQo+IGNsb2NrPw0KPiBJZiBpdCBpcyBleHRlcm5hbCBj
bG9jaywgdGhlbiB3aHkgbm90IHVzaW5nIGdlbmVyaWMgY2xvY2sgYmluZGluZ3M/DQoNCg0KSXQg
aXMgYmFzaWNhbGx5IGNsb2NrIHBpbnMgYXMgZGlzY3Vzc2VkIGluIFsxXSwNCg0KVGhlcmUgd2ls
bCBiZSBhIG5ldyBzeXNmcyBpbiBjb3VudGVyIHN1YnN5dGVtIGZvciBoYW5kbGluZyB0aGlzLg0K
DQpIYXJkd2FyZSBzdXBwb3J0cyA0IHBpbnMgZm9yIHBoYXNlIGNvdW50aW5nIG1vZGUsDQoNCk1U
Q0xLQSBJbnB1dCBFeHRlcm5hbCBjbG9jayBBIGlucHV0IHBpbiAoTVRVMS9NVFUyIHBoYXNlIGNv
dW50aW5nIG1vZGUgQSBwaGFzZSBpbnB1dCkNCk1UQ0xLQiBJbnB1dCBFeHRlcm5hbCBjbG9jayBC
IGlucHV0IHBpbiAoTVRVMS9NVFUyIHBoYXNlIGNvdW50aW5nIG1vZGUgQiBwaGFzZSBpbnB1dCkN
Ck1UQ0xLQyBJbnB1dCBFeHRlcm5hbCBjbG9jayBDIGlucHV0IHBpbiAoTVRVMiBwaGFzZSBjb3Vu
dGluZyBtb2RlIEEgcGhhc2UgaW5wdXQpDQpNVENMS0QgSW5wdXQgRXh0ZXJuYWwgY2xvY2sgRCBp
bnB1dCBwaW4gKE1UVTIgcGhhc2UgY291bnRpbmcgbW9kZSBCIHBoYXNlIGlucHV0KQ0KDQpGb3Ig
TVRVMSwgaXQgaXMgZml4ZWQgTVRDTEtBIGFuZCBNVENMS0IuDQpCdXQgZm9yIE1UVTIsIGl0IGNh
biBiZSBlaXRoZXIgMC17IE1UQ0xLQSwgTVRDTEtCfSBvciAxIC0geyBNVENMS0MgLCBNVENMS0R9
DQpPbiByZXNldCBpdCBpcyBzZXQgdG8geyBNVENMS0MgLCBNVENMS0R9Lg0KDQpbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmVuZXNhcy1zb2MvT1MwUFIwMU1CNTkyMjNGNjlFQTMy
MTU1Mjg1MTlGNDkwODY1OTlAT1MwUFIwMU1CNTkyMi5qcG5wcmQwMS5wcm9kLm91dGxvb2suY29t
L1QvI21iN2RiOTUwYzllYjYxYWM1MmY0MDVjZGM2NTRhNDA5YjhjYjE5OGY5DQoNCg0KQXMgcGVy
IFsxXSwNCml0IGlzIGdvaW5nIHRvIGJlIG1vZGVsbGVkIGFzICwgaWYgZXZlcnlvbmUgb2sgd2l0
aCBpdC4NCg0KICBjb3VudGVyOg0KICAgIHR5cGU6IG9iamVjdA0KDQogICAgcHJvcGVydGllczoN
CiAgICAgIGNvbXBhdGlibGU6DQogICAgICAgIGNvbnN0OiByZW5lc2FzLHJ6ZzJsLW10dTMtY291
bnRlcg0KDQo+IA0KPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3VpbnQzMg0KPiA+ICsgICAgICAgIGVudW06IFsgMCwgMSBdDQo+ID4gKyAgICAgICAg
ZGVmYXVsdDogMQ0KPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgICAgICBT
ZWxlY3RzIHRoZSBleHRlcm5hbCBjbG9jayBwaW4gZm9yIHBoYXNlIGNvdW50aW5nIG1vZGUuDQo+
ID4gKyAgICAgICAgICAgIDwwPiA6IE1UQ0xLQSBhbmQgTVRDTEtCIGFyZSBzZWxlY3RlZCBmb3Ig
dGhlIGV4dGVybmFsDQo+IHBoYXNlIGNsb2NrLg0KPiA+ICsgICAgICAgICAgICA8MT4gOiBNVENM
S0MgYW5kIE1UQ0xLRCBhcmUgc2VsZWN0ZWQgZm9yIHRoZSBleHRlcm5hbA0KPiBwaGFzZSBjbG9j
aw0KPiA+ICsgICAgICAgICAgICAgICAgICAoZGVmYXVsdCkNCj4gPiArDQo+ID4gKyAgICByZXF1
aXJlZDoNCj4gPiArICAgICAgLSBjb21wYXRpYmxlDQo+ID4gKyAgICAgIC0gcmVnDQo+ID4gKw0K
PiA+ICByZXF1aXJlZDoNCj4gPiAgICAtIGNvbXBhdGlibGUNCj4gPiAgICAtIHJlZw0KPiA+IEBA
IC0yNzAsNiArMzAxLDEwIEBAIGV4YW1wbGVzOg0KPiA+ICAgICAgICBjbG9ja3MgPSA8JmNwZyBD
UEdfTU9EIFI5QTA3RzA0NF9NVFVfWF9NQ0tfTVRVMz47DQo+ID4gICAgICAgIHBvd2VyLWRvbWFp
bnMgPSA8JmNwZz47DQo+ID4gICAgICAgIHJlc2V0cyA9IDwmY3BnIFI5QTA3RzA0NF9NVFVfWF9Q
UkVTRVRfTVRVMz47DQo+IA0KPiBCbGFuayBsaW5lDQoNCk9LIHdpbGwgZml4IGl0Lg0KDQpDaGVl
cnMsDQpCaWp1DQoNCj4gDQo+ID4gKyAgICAgIGNvdW50ZXJAMSB7DQo+ID4gKyAgICAgICAgY29t
cGF0aWJsZSA9ICJyZW5lc2FzLHJ6ZzJsLW10dTMtY291bnRlciI7DQo+ID4gKyAgICAgICAgcmVn
ID0gPDE+Ow0KPiA+ICsgICAgICB9Ow0KPiA+ICAgICAgfTsNCj4gPg0KPiA+ICAuLi4NCj4gDQo+
IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==
