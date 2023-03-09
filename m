Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 843B96B1FBA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 10:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjCIJTF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 04:19:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbjCIJTE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 04:19:04 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2102.outbound.protection.outlook.com [40.107.114.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D354559DB;
        Thu,  9 Mar 2023 01:19:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHjazjVIjQJPG9rD8b0Ar0bP0DO9/iEd3PuBCogpCH0cWN+QeiUmdksk98JryuuOchawEN2/4IY8ggs4zUtjT1iUjQidC0WGyAE1tglGvQFwuQctaGD2g4ffszisK62chpxykqo856aHSPrZ2cKfcjDZa2/0YQn6VuVRUfuUpyFDL6lSyIlRReLi0btXRHKxXSlLhNe2cRHfe99rwvqW1u0y80lb3uMASIq2bnIB7k1q11pBsa8Qi4YOXNdxJbSzbegGmC1SULx/5LUK1q3jn8x16hVUKymDMFNve4pYPf1NitYHhEfvKnZAVQGr01C5qnGs2Ngc6AlQhnANa55I0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLQ6GuN3CRHKVDXANFZ0QtEiGC9omeCgfqRvHnsq7vU=;
 b=QOr+sQYBusNyurUn3l7H1OXS99AtKGGFAJ1EeYe23rUeA23rz8h/LQRVPFUo+ncdjNPqAXnqweHm74fNB0h1UlPDHK8Vm6DBxm3yUHDhZIrN5dl0oq7PlEIz3Edb+7o1WQbbn2rOe+Ch5q+VK+X0mXWT61tFiTN2wqy6CGI+jglBQMPpaYKnK5ntTwcFokiWv1z/0qcbPWPFurN768tURiwuPORGz960pQKNKlyHfhcGG0Ubh3Gyoee+UT7gSoJud2l/h9rypKGDeazWitdICVu/3k31Zx/Zy7Ki/eHveEIW0tUKapemw5YiL9TQWZqRHpYHBbWH53QbrIhCQsEISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLQ6GuN3CRHKVDXANFZ0QtEiGC9omeCgfqRvHnsq7vU=;
 b=QP0SvYgjFZwRgjtfgaoFnxkGNqrBZGrzKmVygvt+FU3FQo1Xt/e02gdS5GbgfHZHp5LNCNfKfLsTwgTQQusHAiMkfBfmasBA+iQJxHw7girZZp9Bo+ihf9RHk0Yx2Hny1qtepyL0EQxg7BPOVAazDXzDNA85FpA9tIg3MhCF/xw=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYVPR01MB10894.jpnprd01.prod.outlook.com (2603:1096:400:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 09:18:56 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::9eb:3c9a:c2bc:af06%4]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 09:18:55 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Topic: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Index: AQHZRS0aT95BTvtLwUKgslaMkC+eWK7at0aAgBZQ9vCAAEpeAIAAAIEwgAAHzgCAANKNMIAAFx2AgAAAUHA=
Date:   Thu, 9 Mar 2023 09:18:55 +0000
Message-ID: <TYCPR01MB59335607AE6A2F4FBBA46ACC86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com>
 <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
 <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <36e06397-2189-4f1b-99cc-d39e720ebc71@linaro.org>
 <OS0PR01MB5922BDA0632ACCCC0100EEBD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <6cbe6c71-2d2d-0f79-1270-7f8ed2ddc1d6@linaro.org>
 <TYCPR01MB5933650D5BAB7A3F4BE03BAF86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <984f1689-459e-bd26-b96c-6c759417b3d1@linaro.org>
In-Reply-To: <984f1689-459e-bd26-b96c-6c759417b3d1@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYVPR01MB10894:EE_
x-ms-office365-filtering-correlation-id: f16e2ebd-1be9-43f1-702f-08db207f4ec3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CqiJZKGNxPz81+oQTh7EmnxMOBFwFTV+UUjo39rH4kQsHAYb3MA8pYNIxFhrlIEnT67yd1G0nyCwgeFZcV3GQ61MRHQsfsrZNW47XDnm5Yeven4nWwkk8JMG8JSKBSFj01xXy4wd/hEUDyqD4RjJYX7NoJECbmJdQnpEj/R2OE4zWSWqobT8s9Kz5KEIz0Up6pZmglTIgJQKK3Aapx2CcN5aBgb9qOpYe5pJjXZ1YvrpcsvILQdaBZvbs/M68BVYxlwYHzX4ZH3sf9SiGiA+aa2h431xMhtLUNJfjlxowEHT4rsocra6BgadRqoehPQpkzzI/SkfAGJhZkjt9AUs/qmQkw7ylhWZXac1JzUs9rc5ih0G1eFdcGtqdUhxJy7aQP31WpcnUs9zvDWS3iypief6Vc264R/WG7xVu29NgdIzM2DeEvV3Tzqd5t4ESBe2jBU2UVLbJEJGJM6w/rYxM6Ctcoa+7jDfeX4aINlZsF4m7CWziU389wuJ/D+jJK3ZNO14DZFoHPpmwvSk9EVHcRIfp6icNKfIFGOuo/xrJ8S18dx3y/knY+g167WKhp0A+gJXN851kWMF+PLiRNKa5SeKZz8OHO7mSE7c408ldvDRoShH6rbMkq3edaG+LUrxlK4wrEwSwtY/Cak9BN8HoCk9utljrVT4memq6408DT8PRagfgv23LYHXgFJI58YvhkIDBK/5Yxb9RsEaqPYiGg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199018)(110136005)(54906003)(33656002)(55016003)(86362001)(38070700005)(122000001)(26005)(6506007)(38100700002)(83380400001)(53546011)(9686003)(186003)(52536014)(316002)(5660300002)(7696005)(107886003)(71200400001)(478600001)(2906002)(4326008)(8936002)(41300700001)(66946007)(64756008)(66446008)(66556008)(66476007)(76116006)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alBTakZDc0NVaU1COW5WYU40Y2dBVzUreVZOTmJLSktPWEhPV29MTHhtTG9K?=
 =?utf-8?B?RUZpaGRza2JVUTR5Z0NOZ2NHcHJPYzdxTW4vd2ZtVUc0Skt3QzFOY1ZqS0Zm?=
 =?utf-8?B?YXlQTEtIV3BXMWYwNlRJZEdnZzVTZU5ab1lZeGxQU29pTWIzWGNHYnZkS1R4?=
 =?utf-8?B?WGVwTHllemUwbGpQcDhxWXlPbDJlS2Z0eDNvT21hSHovNkJ5UmR5dnpmMlJB?=
 =?utf-8?B?UmtPTGRxQlJsMEc5SE9jRjRZWDJ1MnFjTGZXcUZmMGJ3N1BteHQ3dWQ4Zk9x?=
 =?utf-8?B?a0RsM3hJbGlnSlpIdmtOMGQveVVZWWNWRkIreUE0aEVERllkV0Y0Szd5Wko1?=
 =?utf-8?B?MnloTXoxVG5pa3BFcWV3VVNmNEFSUzF0ZVlwdzJ3V3hBeUdCWTI2bWhLSHZ5?=
 =?utf-8?B?ajdNdmJmaU1CY3NIdXNaRVlXRWtDaHVDb2RJS3FqdTJKRmVmTjZvNnRmNG1h?=
 =?utf-8?B?ZlY2L2FiTklRL0NqWmFhZmdOQzFXOG95YjRRa3NheW9VRlBUL1BRMjRYZ2pV?=
 =?utf-8?B?Uk1WNSt6Z0VKSk1mT0I2ME1ubTU2cEFqamRvSlI3a3c4cUFDU3o2b3owaWVB?=
 =?utf-8?B?NmxwQXZ1ZCtsZU9WaUZOTGVXU0FzZThkdzVBRy9kWDN4cE5DeUR6RlJhR2Rw?=
 =?utf-8?B?SW50aVVaRnZjc2VBM1V6c2tleEZZNUs2eFZ3SnBnQWh0NVdjeVo2WW1CZkR0?=
 =?utf-8?B?ejM5bFl5QlZ0Rlo4cmVYNXR6OXA3b2lRWTd0S0JoRnJYSi80dnJnbUZSV2ZL?=
 =?utf-8?B?Q0ttbXdrK2NvNXhOQk96NHBLVEFla1l3c1pGbW9ReGgzUGpRQ3ViS3dhVzhE?=
 =?utf-8?B?YTlRL0REejdtV2J6NVBjdHRacXdKejl0SWVZSlAza01POUp2bDVPYXN5MjAz?=
 =?utf-8?B?QTFWc2E0MjdEbHRFbXNPRlRaazZFaWU0eTdCYi80SE00aUN4OU5JZ2pBbHZ4?=
 =?utf-8?B?MGdnOEk5NDcwMCtKc1FoRHBtZ1kxKzJWYytHbmE4TlRzRDJkR1BFVmZWVVox?=
 =?utf-8?B?MnQyanVEemkwYlVPb2JabzB4aC8zVlVkODl5NXE0RkhOaFYxWFUrQ1BIdjZC?=
 =?utf-8?B?RkJOWklCOHRFZ283VG5pdDhMWmVZZUE4UjAwV21veWJYQTJuZXF2VmNQbmU4?=
 =?utf-8?B?Y2RWZHd1Sk5pYjloSVJON1M1cHozOXp6Q0c3VWs2ZE9BVnV3NXVBUXhnSlhL?=
 =?utf-8?B?RDUyeU1HN0dkOTNLbldTOWxQbjZ0Y0hvMzc0M1RyRTlIVVVqb0ViRlJTak91?=
 =?utf-8?B?Q1R1NFdKb2J1S0p3OU5ac2dVb0Fid3hlSG8yQWtwZDdPNnZvakRWM2MyMDNn?=
 =?utf-8?B?VnRaWkt6RTBUMndEeGdtcy8yL2E1WVNLZnlPR0VoNnRYUTBsVnQvOHNhUldH?=
 =?utf-8?B?WnViU1J3MTgzem0xVmFrUkUvczFJR2h0M3lNcUVCNUR0WWEwTWdVNm9weVI1?=
 =?utf-8?B?bUU2VVJJU2NsZFJHcVFYYXdubFk4TFA4TzJuZUlEdmMwRTNlTnF6OENUVTI4?=
 =?utf-8?B?L3k3OUg2N2N6ZzdrUFFIdE9yWm84RXlKZkZpWXdBZnRaQnJ6ZUN4Rk8rb1oy?=
 =?utf-8?B?Z0hialBaMm5OOTEzeFpmTFpYOEZ2S0J4dGhMQXEzUFFqRmprOXVGcmxmdW0x?=
 =?utf-8?B?RlY2L2w5bVZmTklwL0pUVlVRdnJtS1prZlNXdkZ4WDlObkt2NnpIK1dwbjhP?=
 =?utf-8?B?TW5td092eTdwUjF4RWFzUTdLUnYzVkhCbXEzVG9ORjlvbDhyQkRYb3VWZ0hP?=
 =?utf-8?B?Vmg3QlFVVDZOVVEzZW5WSDFGYWVia280cE1hL1gzQllGQ1hNSVd2VXN6L2ll?=
 =?utf-8?B?SGlhUnhWQkhOLytoK2tMaUFIQlhnNDc1NmN6bEEybzh3bjRXYjFwb2xSZjVV?=
 =?utf-8?B?QjFmK3BQWUVoOGZpWWhJNnZxcXBIeVpOL1RJcVFDdjBXTlhraFpCRmFkcEdU?=
 =?utf-8?B?ZXlveDAzcytLNEJSbFVsdGtjMXdhVXdSL2dVakxHM3N3S0EwSldlUzB4TjNi?=
 =?utf-8?B?emhQUTZNR0tCTEdPOXNqU1VUTVlQRzAyQnZVK2h4T3NzS0NrZXh3OXJKYktz?=
 =?utf-8?B?RS9xZ1RRMEZGRU8xVHN5ZysyVEpNUTFQVFJISG9oL09JYmJRYnkrdStNOUg4?=
 =?utf-8?Q?ytANv5K79WaSHPDZVSDjVQH3U?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16e2ebd-1be9-43f1-702f-08db207f4ec3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 09:18:55.6798
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HGLes+cIn3TmNFjd4Ii8Ohp/5XOJmsNtGIHh9ARRM+WtQQJPOdUwtgtSZQsZ4F5noOelIBU0s5BM2D3eTrMBAK7Q/ssuZbg5hhiYVm13jUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10894
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwg
TWFyY2ggOSwgMjAyMyA5OjE0IEFNDQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+OyBNaWNoYWVsIFR1cnF1ZXR0ZQ0KPiA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+
OyBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+OyBSb2IgSGVycmluZw0KPiA8cm9iaCtk
dEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6eXN6dG9mLmtvemxvd3Nr
aStkdEBsaW5hcm8ub3JnPg0KPiBDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT47IGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWNsa0B2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBGYWJy
aXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBSRkMgMS8zXSBkdC1iaW5kaW5nczogY2xvY2s6IEFkZCBSZW5lc2FzIHZlcnNh
MyBjbG9jaw0KPiBnZW5lcmF0b3IgYmluZGluZ3MNCj4gDQo+IE9uIDA5LzAzLzIwMjMgMDg6NTcs
IEJpanUgRGFzIHdyb3RlOg0KPiA+Pj4gSXQgaXMgY2xrIGdlbmVyYXRvciBIVyBzcGVjaWZpYy4g
Q2xrIGdlbmVyYXRvciBpcyB2aXRhbCBjb21wb25lbnQNCj4gPj4+IHdoaWNoIHByb3ZpZGVzIGNs
b2NrcyB0byB0aGUgc3lzdGVtLg0KPiA+Pg0KPiA+PiBFdmVyeSBjbG9jayBjb250cm9sbGVyIGlz
IHZpdGFsLi4uDQo+ID4+DQo+ID4+PiBXZSBhcmUgcHJvdmlkaW5nIHNvbWUgaGFyZHdhcmUgZmVh
dHVyZSB3aGljaCBpcyBleHBvc2VkIGFzIGR0DQo+ID4+PiBwcm9wZXJ0aWVzLg0KPiA+Pj4NCj4g
Pj4+IExpa2UgY2xvY2sgb3V0cHV0IGlzIGZpeGVkIHJhdGUgY2xvY2sgb3IgZHluYW1pYyByYXRl
IGNsb2NrLw0KPiA+Pg0KPiA+PiBPSywgSSB3YWl0IHRoZW4gZm9yIHByb3BlciBkZXNjcmlwdGlv
biB3aGljaCB3aWxsIGV4cGxhaW4gYW5kIGp1c3RpZnkNCj4gdGhpcy4NCj4gPg0KPiA+IEhlcmUg
aXQgaXMsIFBsZWFzZSBsZXQgbWUga25vdyBpcyBpdCBvaz8NCj4gPg0KPiA+IHJlbmVzYXMsb3V0
cHV0LWNsb2NrLWZpeGVkLXJhdGUtbW9kZToNCj4gPiAgICAgdHlwZTogYm9vbGVhbg0KPiA+ICAg
ICBkZXNjcmlwdGlvbjoNCj4gPiAgICAgICBJbiBvdXRwdXQgY2xvY2sgZml4ZWQgcmF0ZSBtb2Rl
LCB0aGUgb3V0cHV0IGNsb2NrIGZyZXF1ZW5jeSBpcw0KPiBhbHdheXMNCj4gPiAgICAgICBmaXhl
ZCBhbmQgdGhlIGhhcmR3YXJlIHdpbGwgdXNlIHRoZSB2YWx1ZXMgZnJvbSB0aGUgT1RQIG9yIGZ1
bGwNCj4gcmVnaXN0ZXINCj4gPiAJbWFwIGluaXRpYWxpemVkIGR1cmluZyBib290Lg0KPiA+ICAg
ICAgIElmIG5vdCBnaXZlbiwgdGhlIG91dHB1dCBjbG9jayByYXRlIGlzIG5vdCBmaXhlZC4NCj4g
PiAgICAgbWF4SXRlbXM6IDYNCj4gDQo+IGJvb2xlYW4gaXMgc2NhbGFyLCBub3QgYXJyYXksIHNv
IG5vIG1heEl0ZW1zLiBJZiB0aGUgZnJlcXVlbmN5IGlzIHRha2VuIGZyb20NCj4gT1RQIG9yIHJl
Z2lzdGVyIG1hcCwgd2h5IHRoZXkgY2Fubm90IGFsc28gcHJvdmlkZSBpbmZvcm1hdGlvbiB0aGUg
Y2xvY2sgaXMNCj4gZml4ZWQ/DQoNCk9LLCBJIHdpbGwgbWFrZSBhbiBhcnJheSBwcm9wZXJ0eSBp
bnN0ZWFkLiBGcm9tIEhXIHBlcnNwZWN0aXZlIGVhY2ggY2xvY2sgb3V0cHV0IGZyb20gdGhlDQpD
bG9jayBnZW5lcmF0b3IgaXMgY29udHJvbGxhYmxlIGllLCBmaXhlZCByYXRlIG9yIGR5bmFtaWMg
cmF0ZS4NCg0KSWYgYWxsIHRoZSBvdXRwdXQgY2xvY2tzIGFyZSBmaXhlZCByYXRlIG9uZSwgdGhl
biBmcmVxdWVuY3kgaXMgdGFrZW4gZnJvbSBPVFAgb3INCnJlZ2lzdGVyIG1hcC4gQnV0IGlmIGFu
eSBvbmUgY2xvY2sgb3V0cHV0IGdlbmVyYXRlcyBkeW5hbWljIHJhdGUsIHRoZW4gaXQgdXNlcw0K
ZHluYW1pYyBzZXR0aW5ncy4NCg0KQ2hlZXJzLA0KQmlqdQ0K
