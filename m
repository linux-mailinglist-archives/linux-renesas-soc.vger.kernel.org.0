Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17234782515
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 10:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbjHUILH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 04:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbjHUILH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 04:11:07 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0733AB5;
        Mon, 21 Aug 2023 01:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jawz3RxGB87VImwpS56QWR+v++TI3wKeuiZOwQot6kX+gGeDrbP4yBk7QChN0dhyWMGS0lrOvBZMUhH6G2L9Wtx2yToMIp8RT7x62tYPJ7pjGJrwAunUMyCPf87hz0VngEXqriZAXmVXe6Av6+THf3U1C3pgbtEY+GWxbY4FVoinWm5TEJUnSsag2ix2l4PMvsWbBKHbjcktyb86jLOPxgwFhEexgPCPVjZVdNPBVod9kVoEmRBt3JhJWKNcXY3Sd5NTvmoyveMwtgnYmlpO0Purh8V+rAUvSmyD5XpDF/f/oBhZw6vaJy8TqBZ1O+hgPCqWgv5wzPjdusiUGT+JZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XI9LOIyCjT4C+lq/IyImRG3BwB/34XzNOJG4QUQyaOA=;
 b=aXpxyTL3Qvqd8etyEKqI/3S1nmECfO0ojVR/clyc4GanQrvqQgRnDlwCRlbLjFG9ZyLDwmLu0gaq8Z3m0D9iDb4VPc1+lRVUUWUsyIb50Gur0zNopFCcItenjiU6RPJagPHuaKMKDwlIDJpFjOlq+4Hc30hajLbomB0yPG3O7HkVVTqHpDiGLfmHUWiWDtsMQKuuxtIRqp3glqh+8CreUKWrZhsioHq8NgFn8fJx7daKEZt6VJkxg8jMs1REpOt7N/5EjVYVNcEmnI8onHrTQpQ8IA1p5akfyKaWXiaf5Qi9sDvZgGuySAkOU7XwIPz4t5Nl4HMBBvGdgINBArbRIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI9LOIyCjT4C+lq/IyImRG3BwB/34XzNOJG4QUQyaOA=;
 b=naLt5Qr0P3lmDYhRLz4ky3aSSQ44AK2R9MTA/FLVhfzCGS/OdxcLqkpb03UsziiBYxYIpPAvhIULa4WOep8NjlWvKl+QqIsO7WiJIfz2rE73dy1k/nVFHtk80Gno+KGa22+ZsbIIn5CSd/0A5QW+GxLji7ueSZ7rOD4eShj2pJw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB10388.jpnprd01.prod.outlook.com (2603:1096:604:1f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 08:10:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 08:10:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: clock: versaclock3: Document
 clock-output-names
Thread-Topic: [PATCH v2 1/3] dt-bindings: clock: versaclock3: Document
 clock-output-names
Thread-Index: AQHZ0OpfFpUW4kCf3U+dAC6wpe5OCa/0aSIAgAAA/5A=
Date:   Mon, 21 Aug 2023 08:10:59 +0000
Message-ID: <OS0PR01MB5922A41D6D8A3164EECE7C05861EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230817090810.203900-1-biju.das.jz@bp.renesas.com>
 <20230817090810.203900-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUoOu2sGeWO0tQ89iU6rT=kWtpJ0qfhYvxnhQAfPwA7dg@mail.gmail.com>
In-Reply-To: <CAMuHMdUoOu2sGeWO0tQ89iU6rT=kWtpJ0qfhYvxnhQAfPwA7dg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB10388:EE_
x-ms-office365-filtering-correlation-id: 7e1c75b2-827c-41d8-b095-08dba21e2726
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oTEQDKDaLTezmmoVD2A50R8bHc4RntzLXEppbl3E+EQFdO2p9R60EMjJK9ZJEqpqMpUI/5HHgR+fr1VA2JCttNs9Pf3cQCml65EuQ+c1EFbtrOTWbNKRBrpqwb/JI29aDHwHK3UGx+Xuu2Ol2gYyzNAADGXLTD/+zrWkwifuypB0cw3o4V/XEMtXpMcQUWD0v7sTzkUA5ea+TLaRhflsvmYkqEB4u/cFsni/f/Waeq1qXtmK9BfXjY4APkHlzqbe3J3mZONGhTiJYhqmDrM1jS0S4UklMfeXxk2/yoUPsA0LtaiEwuia1kTBNQm5OMGvrxE7Wcqmoyo82v88QmQbm+6KbKVzO2+8vB17ErTQSBEub6uaz9J45jQinqOSTKmwIoITGgLE05TD73zJ1PTHS7wzLyDaQ9Lrpta0kf7ffCg/7YgAF8niqxAGBHtVa4godkyrpW02++sqjx96bfogUEiTdvI+sLlRD/f6i4sIlp+bpDVV7EyHXQFLpvumYbsha5B4MiUVXQ3J1s10LzBthaUidbA+DI+ebNnA6NQsXCj0YAVjWGI8x6GGsXbsoWW5NBAPVA5er3vtsSTD4wi7KEjEFUiYKUBURFeILHOFs0c8IQ0ptbIcYvp6ynCQTvuI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199024)(186009)(1800799009)(2906002)(7416002)(83380400001)(53546011)(7696005)(38100700002)(38070700005)(6506007)(5660300002)(52536014)(33656002)(26005)(86362001)(8676002)(8936002)(107886003)(4326008)(316002)(9686003)(66946007)(64756008)(6916009)(54906003)(66446008)(66556008)(76116006)(66476007)(478600001)(122000001)(55016003)(71200400001)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjZnYi9nQ0FCTUt5ZjdwQVVqSktqRVRIT0FkSjUwVmlGUzhlUjFBQ3hTUVFH?=
 =?utf-8?B?Z2h2OWFDQWFJUkxWYVB6aVJoRk1aMVRlTE93RlJYYzZad3M1aG5pTmM2aUE5?=
 =?utf-8?B?V1JuWnNUT0VIdUhqQ202WHVFZkU2NW1ua2pQNEdXbGFUSndFczNVTTAvMXpa?=
 =?utf-8?B?Mk5JdXVIN0c0cDBlK0pNVFZNU0tFc2t3SDJ3NUh4TzRUbEYwTHExbTMyR2lE?=
 =?utf-8?B?VHBzQkJTYUxRYVdWWU1QR1VlZnZQS0ZKaEpZYnNCTHZ4WDhGb0d6MXVMMFlr?=
 =?utf-8?B?dUNRZkdwbGVWUkFGSkpuRlI2SlpZNmdLR2VqUm54ZjlLblJoNEd0QzhTNm5y?=
 =?utf-8?B?UDU5Smlwc2lvU3FGd1pEY3llck5WR1kwblJDVUFteGtNRXowREZMNUZHelV1?=
 =?utf-8?B?bDdGYW4vMWtIS0FNRzdqZlhFOG1DME5VZGx0RXNJdW04QlJBQ0RGZGFBMGtS?=
 =?utf-8?B?TlRhaDJtZEFERC9lNmpOdkw1MHdNSFkzKzd5ckF0UFR4SlFTMXpMN0VGL0Mr?=
 =?utf-8?B?QlQvWXBTMmtjbmNMK3RCUDNDVnhPbUpjSUFzNjIwU2lvbDVpblFzQkpuMitJ?=
 =?utf-8?B?YlUyRlFaTU5RZC9OMDlXQytBejB5SFNhNE9YbUpFbUszRFkxejYvbVdEMkU2?=
 =?utf-8?B?SXdhOFk2VnZZZVFWSi83bXkzVGlNZ1BFYzlyQXp5ZTJURlZLcTk1alpEZWM2?=
 =?utf-8?B?emJGUkN5cnl0V1ZhNHNjMUZwU0JEYmNONktYUks5Rkc0aEZxaWs0UHV1Q25p?=
 =?utf-8?B?TVdmTDE5ZlVqQlRCMDJOMkRJL3lVaEZ4b0pSbFpKZ085THdoM0NMRW5ncUkx?=
 =?utf-8?B?bUYzU21PMVExS0wzOXhZRURwU3BJeVhYQUFWQXlTTklHZnVteEMvVzA1OVVY?=
 =?utf-8?B?ZXhSQ2JOakhkN2lqWERaV0hERml3Rk56bjNVV2JGZTRUL3cyR3BTZzd2dmtk?=
 =?utf-8?B?N0hOTUUzbmUrV3VYVGViN2NQTTJ5Um01T0tPRkRyUnkydGlQczZJYW40UFhK?=
 =?utf-8?B?RTZ1MVZXMzdyQ1RoWE5WbDhST0ZSaWFDMDl3L3RXeHdNNHZCb295WStHNGNp?=
 =?utf-8?B?ZnlDa205U3ZNWjhkQlhORkpnVzBLQU1FVXlmajdiRjlwN0dNbEtiem5qYmVJ?=
 =?utf-8?B?OXJoYnpQcC9RYkg3QlRnODV3aFVHb2loY21NRk82aEQ4TldkYi9kVDdlVHZk?=
 =?utf-8?B?YWlpSFVXYzA5Si9adVYrWExheEVLR25LUVRERFVJTnR2d2pLVWZaUnZCSzFz?=
 =?utf-8?B?bGVLUnJldTYzeVc1QW5uWlVqblJ2QTRsZGF5cGJqR1pFWVdPSEIxeWlxRXJV?=
 =?utf-8?B?VU1wbEd3SWl2d1FDSkRFbU5uUDYyN0FWc09zMEtlbnBHalpkazR4SGtKZzli?=
 =?utf-8?B?M2FRSGZYMkdZbE81VXE4YjU5WHJqdDNmOXIydVUrbWF0QmhMMGlDS3BoS1RM?=
 =?utf-8?B?UjFVRm1ubmM1bHdLM1lQRzNlWXVrMkludno4cTR4bVdDZkZqQzdCZWtsUU9D?=
 =?utf-8?B?SUt5WXhWUzQvWjYwZnFKNW81NTBIbmVxQ24rdUd4ZGFNdTYyemhRZTI2N082?=
 =?utf-8?B?Y3VRM2ZNODR2anRPbWEyWVVEN0kyLzRXWUc2WkY2eGNBbXZHRW5CSkVlazEv?=
 =?utf-8?B?K2N2dXhSd1o3bERrYWdXVGd3ZHRtclV6bHc5aCszZjUydENFblEzZ3B6MHJF?=
 =?utf-8?B?NjhVb2pULytHV3V0NlFVOWkzdzZNUkk2cDFtQ1JRREpJbmRjYUtKSjVLbkth?=
 =?utf-8?B?Vmp1TWc1RmxkNkg5WHpxb3dYRXA1S0I3ZHlwWWNWV0JINll5cHd5NUkzTDNN?=
 =?utf-8?B?M0E3VVRiSGVHdTdEa2Q3K2FPRGI3SkJaSXE2MmpvQXNoZnhtblB3MmlURjhu?=
 =?utf-8?B?anhVcFdUZWRMd1dMYnVpZHA1STVvUFFwTlpUQXlvQjFJUXRqZERlZHRTNERM?=
 =?utf-8?B?d2d6dmNWZTIzYldWdU56ckFrTFlOcHcwUDZGYmNQVUUwZGtpK3VwTEt0WWV3?=
 =?utf-8?B?bEFrYlpUZExTRDdsdUowMWdWK2dkbkkzTkhad1pUb2c0OXl5ejBzQmVBVG1a?=
 =?utf-8?B?ZmJFTTlSbVBGTjM1RVY3QWR3Y3F4alFXaUVoakQxTjJKTVRGWEhrVWZxNXlI?=
 =?utf-8?B?bTc3UFEvVDdsMVhUUXc4QjRPNjJNMGRiL09xZklHL0VlTjFvbm1SSFRDYnRR?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1c75b2-827c-41d8-b095-08dba21e2726
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 08:10:59.2494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rUxXUM40puZM4/Y4T9cVDkF1GTAwRN8y00StIUJd0FNus2aTV084cBpbwx4dqlfY+A44HdHQI04Pmp1PSx0JaX5VG8ENUKbki6lIQ8XQ5Ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10388
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYyIDEvM10gZHQtYmluZGluZ3M6IGNsb2NrOiB2ZXJzYWNsb2Nr
MzogRG9jdW1lbnQNCj4gY2xvY2stb3V0cHV0LW5hbWVzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4g
T24gVGh1LCBBdWcgMTcsIDIwMjMgYXQgMTE6MDjigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IERvY3VtZW50IGNsb2NrLW91dHB1dC1uYW1l
cyBwcm9wZXJ0eSBhbmQgZml4IHRoZSAiYXNzaWduZWQtY2xvY2stcmF0ZXMiDQo+ID4gZm9yIGVh
Y2ggY2xvY2sgb3V0cHV0IGluIHRoZSBleGFtcGxlIGJhc2VkIG9uIFRhYmxlIDMuICgiT3V0cHV0
DQo+ID4gU291cmNlIikgaW4gdGhlIDVQMzUwMjMgZGF0YXNoZWV0KGllOiB7UkVGLFNFMSxTRTIs
U0UzLERJRkYxLERJRkYyfSkuDQo+ID4NCj4gPiBXaGlsZSBhdCBpdCwgcmVwbGFjZSBjbG9ja3Mg
cGhhbmRsZSBpbiB0aGUgZXhhbXBsZSBmcm9tIHgxX3gyLT54MSBhcw0KPiA+IFgyIGlzIGEgZGlm
ZmVyZW50IDMyNzY4IGtIeiBjcnlzdGFsLg0KPiA+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+IENsb3NlczoNCj4gPiBG
aXhlczogYTAzZDIzZjg2MGViICgiZHQtYmluZGluZ3M6IGNsb2NrOiBBZGQgUmVuZXNhcyB2ZXJz
YTMgY2xvY2sNCj4gPiBnZW5lcmF0b3IgYmluZGluZ3MiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2MS0+djI6
DQo+ID4gICogVXBkYXRlZCBjb21taXQgZGVzY3JpcHRpb24gdG8gbWFrZSBpdCBjbGVhciBpdCBm
aXhlcw0KPiA+ICAgICJhc3NpZ25lZC1jbG9jay1yYXRlcyIgaW4gdGhlIGV4YW1wbGUgYmFzZWQg
b24gNVAzNTAyMyBkYXRhc2hlZXQuDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4g
LS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3JlbmVzYXMsNXAzNTAyMy55
YW1sIHwgMTQNCj4gPiArKysrKysrKysrLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yZW5lc2FzLDVwMzUwMjMueWFt
bA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3JlbmVzYXMs
NXAzNTAyMy55YW1sDQo+ID4gaW5kZXggODM5NjQ4ZTc1M2Q0Li5kYjhkMDFiMjkxZGQgMTAwNjQ0
DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3JlbmVz
YXMsNXAzNTAyMy55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Nsb2NrL3JlbmVzYXMsNXAzNTAyMy55YW1sDQo+ID4gQEAgLTQ5LDYgKzQ5LDkgQEAgcHJv
cGVydGllczoNCj4gPiAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3VpbnQ4LWFycmF5DQo+ID4gICAgICBtYXhJdGVtczogMzcNCj4gPg0KPiA+ICsgIGNsb2NrLW91
dHB1dC1uYW1lczoNCj4gPiArICAgIG1heEl0ZW1zOiA2DQo+ID4gKw0KPiANCj4gV2h5IGRvIHlv
dSBuZWVkIGNsb2NrLW91dHB1dC1uYW1lcz8NCg0KSSB0aG91Z2h0IGl0IHdpbGwgYmUgdXNlZnVs
IGluZm9ybWF0aW9uIGZvciBhIHVzZXIsIGJ5IGxvb2tpbmcgYXQgdGhlIGV4YW1wbGUgdGhlIG5h
bWUgb2YgY2xvY2stb3V0cHV0LW5hbWUgYW5kIGNvcnJlc3BvbmRpbmcgYXNzaWduZWQtY2xvY2tz
IGFuZCBhc3NpZ25lZC1jbG9jay1yYXRlcy4NCg0KU2VlIGJlbG93LCBmcm9tIHRoaXMgb25lIGNh
biB1bmRlcnN0YW5kIHRoZSByZWxhdGlvbiBiZXR3ZWVuIGluZGV4IGFuZCBhY3R1YWwgY2xvY2sg
b3V0cHV0Lg0KDQogIGNsb2NrLW91dHB1dC1uYW1lcyA9ICJyZWYiLCAic2UxIiwgInNlMiIsICJz
ZTMiLA0KICAgICAgICAgICAgICAgICAgICAgICAiZGlmZjEiLCAiZGlmZjIiOw0KDQogIGFzc2ln
bmVkLWNsb2NrcyA9IDwmdmVyc2EzIDA+LCA8JnZlcnNhMyAxPiwNCiAgICAgICAgICAgICAgICAg
ICAgPCZ2ZXJzYTMgMj4sIDwmdmVyc2EzIDM+LA0KICAgICAgICAgICAgICAgICAgICA8JnZlcnNh
MyA0PiwgPCZ2ZXJzYTMgNT47DQogIGFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDI0MDAwMDAwPiwg
PDExMjg5NjAwPiwNCiAgICAgICAgICAgICAgICAgICAgICAgICA8MTEyODk2MDA+LCA8MTIwMDAw
MDA+LA0KICAgICAgICAgICAgICAgICAgICAgICAgIDwyNTAwMDAwMD4sIDwxMjI4ODAwMD47DQoN
Cj4gVGhlIGNsb2NrIG91dHB1dCBuYW1lcyBzaG91bGQgYmUgY3JlYXRlZCBieSB0aGUgZHJpdmVy
ICh0YWtpbmcgaW50byBhY2NvdW50DQo+IHRoZSBpbnN0YW5jZSBudW1iZXIsIHNvIGl0IHdvcmtz
IHdpdGggbXVsdGlwbGUgaW5zdGFuY2VzKS4NCg0KT0ssIHNvIHNoYWxsIEkgcmVtb3ZlIGl0IGZy
b20gYmluZGluZ3MgdGhlbj8NCg0KQ2hlZXJzLA0KQmlqdQ0K
