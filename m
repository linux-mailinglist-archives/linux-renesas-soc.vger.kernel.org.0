Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76D5169AB11
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 13:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjBQMLw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 07:11:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjBQMLv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 07:11:51 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2121.outbound.protection.outlook.com [40.107.113.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C42644D2;
        Fri, 17 Feb 2023 04:11:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQflyXkZ9jsCKnYrJnUx6Og0MOJ+OPYSRBiEcNZO1WMmD5T/5I6wENn7p2tpx2FIDlMSSa1ETYDrfDnhwlwDSl6+YQ8T+N3+3nqG5zdZi8hfNPScYgug5yEKB1FVOk9E0Fc7gThb4c4VNBAb+WeaX3DbZLngrx7WaooKbEguPBaHyLN/AvJGDJT6uviQ/NAwcV22GVf4CPnXd2kltEKTEPHkiD4F1CNnqX+47fPDmz7UVMKZwSON3Unealn4Xyt5PYosGsVwz7kGRDzMVP9EDOw4Q5jFRCwkO5LA5JaJS82wCnrM6J2lOnB59vq6qIwcujJhnq/wOt8svdCaMdsHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xe/7neHUZs8bkiD+J/Im+zCczsoH5/Qqp5aUrVd5nIg=;
 b=gL8OizbXSMuJRfhejBzguFGbsd/5qefA+E+dAyyg55Dbw/nMSEcBVGrg3d99cWctf+mXSFG/vqMunM7dmEob3xcLNoWsqkr7SMikEwm4yRjo1bPgl6x3wT4fMzpoN6zFjYf7mgSsCTaUwinvs5CMM3fzUyvCJazkh2dJ/S98YUmTA68EzqINzyzLOe6Bi9sOpu7dAO8JqNmXB0cKuIykUIMc1rxl9BTM+NZoR8pde3IXNa26l/DxiZsRZ+5G1/MFlu8orAdGChywuBV5tRdRdmpt0A8Ra+4ToWT7UEIuI9l5VaP3SVAucQLdSvsTP5OcEi+M1dmfX1L6uSSR1Fmxxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xe/7neHUZs8bkiD+J/Im+zCczsoH5/Qqp5aUrVd5nIg=;
 b=LPMv/RWBz/LyXpXb3En0uiG57t/8Sln/ugozX/H5UqjsdADECK33H+FHeqjV3I9ZZ6/BFXfWVTL+D3gnENuG8Z3tHoj+Dpa066P5b/Tq6qZ28DzgQx8Ir8G+fPQj1OSkCJsghAMemsNCM7EAaGICutydHtym7qyyxQEJdHkFwrE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10278.jpnprd01.prod.outlook.com (2603:1096:400:1d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.17; Fri, 17 Feb
 2023 12:11:46 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 12:11:46 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= 
        <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset for UART_FCR
Thread-Topic: [PATCH v4 5/6] serial: 8250_em: Use pseudo offset for UART_FCR
Thread-Index: AQHZQsUI4w2Y27F7KECGzFHdmm5uz67TBUiAgAABfXCAAAKCgIAAAoqg
Date:   Fri, 17 Feb 2023 12:11:46 +0000
Message-ID: <OS0PR01MB5922B4904BB49D53968AE42D86A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-6-biju.das.jz@bp.renesas.com>
 <a893f031-b08a-638a-70e0-3e6e37e9954c@linux.intel.com>
 <OS0PR01MB5922EA33B354EB2B31680AB686A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <1e8b1e7-5f3e-61be-dd65-8d5da7ca14d2@linux.intel.com>
In-Reply-To: <1e8b1e7-5f3e-61be-dd65-8d5da7ca14d2@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10278:EE_
x-ms-office365-filtering-correlation-id: e6503831-3b49-4d9d-93c8-08db10e023c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nu1WA7gJUZepZ8jPHa+slIHODdRd4k1/OznE8iWJAND/DV2fBZk7zc91qC5tY8/m9i/a/zZDCFc69YDZjl/iyC/idBbfoMdfChKHS+pGICnocoCVxcv8JsoCrt+o1jMGp+eVNzMbmoCSvCPgQpW7d2tidW7HCUkwtMVcOz12BEydQsxIk1UJ6FAFeouTon512az6qKn4sWpKl4FxfEwCb1gfxNBg1XsBbYzqpRhybmpHsMrYmNrLNXVar/esYOEHorq1aeTbkOvpipZ9ECw39E79Z4mxU+XPZY5qYvfFvLI8n0tuc2kzmyk0pFu+K/T4rMw11qmvIKo5chOFHy5CXXN/6vB7bAld00R9MhYesGOP40VPAlL8M5lyI35FRW5EppOmIlJI7eb6EecAsOEy+5/w//lGjSRoTaFgb6ks3R+mwqJoXkKCtYvZ6Us23LE35oBqXjip5GsHlw3naqg6kcPQVK+rqxNc4T4j1wpgMOI45lfRCwikbEIvK8Kl4D7lLZ9Uitk81LJpe1jqqrl3if3OEF8X+AyhXv17ZmTUYvPFkFXOKLmzZRfOnMRv78H25JFkloBQbtIWmoAXLsxcUP9nqU08da17Cj/zyctRRHDSLXQW1IeW0K+d/52SdhVNBEYPWsCm8viuXY38UWSexk2wFHgh/GMdfl47Somzy9T207EItL2yiaOE/Fojet9VHOgPPah84GybTeCgf/x4Ng==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(451199018)(83380400001)(6916009)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(316002)(4326008)(8936002)(52536014)(5660300002)(41300700001)(9686003)(6506007)(26005)(186003)(478600001)(54906003)(66574015)(71200400001)(7696005)(33656002)(55016003)(86362001)(38070700005)(2906002)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2ZYUDBBWmNKbmpjSmlrWllPaXd5RlcyU0huL20rZWJvWEFWWkIrNkJJMVdU?=
 =?utf-8?B?eWd1T092N2VsdHIvVGI5UHFwUUpKWUVxN2l5TGRHVnZucitJQ214U2NEL05t?=
 =?utf-8?B?aVo3eWpwUThsSWFXajYzc01hUzlGSmZSL21rcTlHdDhrb2V2eWpDL1VJNGZo?=
 =?utf-8?B?bTVXWlRFbURmTkh2V2VQeXBXTjkzMURtb20zUlNkU01ZUGdaK2kyQWVHYThO?=
 =?utf-8?B?UFlNb1NtR1hjWTV1Q1o5V3RSQUVIL0lld3l4QmthdXZ0NENhRFBzR2lYaXNz?=
 =?utf-8?B?NVZQMVYyNGU0bVppWU16aDJQNTkweCtDUUg4V1lwaVI3WGllc3dEdVFFUVJW?=
 =?utf-8?B?bHozWWtaK3VMdXBkMFRPdnozSkpCeExDWkV4NGg5NGsvYVpoS044RFhHNk9E?=
 =?utf-8?B?TXNsSVJ3UXpqN3R6UFRSaXFTOFMrQ0MxaHdRbTFaSmhxT0ZIbVhDOGRpL2Z1?=
 =?utf-8?B?Nnk3OU10VXFZTHlFNmI1TjJTcTdNVVBPeEJFUmQrRGpEVzhIZDZ4ZWtPa1Jj?=
 =?utf-8?B?Tk5HRkNVbndTQlpDbUh2R2t5c1ZoUXdsaG1HUEhSdVZNVzhkMEY0Z0JadXRC?=
 =?utf-8?B?UThaUUpPcnlTak9rVXRCakFRVGp6Z2krbXFHQTZUWWtuWnJDL09zZnpBZGF1?=
 =?utf-8?B?bDN6cUxIWUs0YVYwbHY2cHFRK2NYRDUxOGppVmozL1JTVnQ1UU82Y3hOWnJQ?=
 =?utf-8?B?K2lUNzcwRGJlV01jc3Q3cjhVRHF6TDVDR1F6SGlqbXVZcTNmbUduY0EwVlZY?=
 =?utf-8?B?YWRMdUlKbm1Tdkp2Vit1RUdKdnpsYTRHbXlHVEhIV0ppTnlVZkJHeVFHYTNC?=
 =?utf-8?B?cjBHN0s4Z2NzUW5YMnEvMjQrR0VXK3lIU3E1d0U3cldrYkpmRXlNYnBZeGZX?=
 =?utf-8?B?RDlZaThHTk96bzd4bnhQM2VWaVlIMDc0MjVzRG0zdTM1WW0zYjlFVXdJOTdO?=
 =?utf-8?B?eU9hMm44QldiVVVhNEx0MG5pSExXbVFkTkF3aGhoSFB2MitxUkJjVHN3eWlZ?=
 =?utf-8?B?ellwd2FBWlhlZVJoZkQyTExoSFlLMFhMcUFLNmQ1UUpUU0h5cmJzbzRGY1Zv?=
 =?utf-8?B?RGJvOUZGZmtEUDAvcWpjQmErYzVheUl6S241Q0N1ZGxGR2krajJSY3k2eTlH?=
 =?utf-8?B?dFd4ajJadnlHcllBQU8zTXNoZTNpeDBsWDB6SlpWODkvQjFJQ1d1Z3puSmRQ?=
 =?utf-8?B?Nm5KeitXa0xpRjlDK21XanNLRmJzbWFIZTI3QXFnaFMxdlBnd1pEbnYzdFl0?=
 =?utf-8?B?akVSQVNzREhwYmVGVlE4SHp3dGVpSFhNWi9GUXJ2eGkwWU4wMlFFQWxuZ3dw?=
 =?utf-8?B?alpPN0VXUVFvdTU2Nm1LMmlqQ1JwVXlhdUpqSTZ4SVpZT1VqdHdaM2FVMmNs?=
 =?utf-8?B?OWpzcS9OYVV1OEV2cVlvQ2k4STJvay9JUGRIOWdpTG5zSDR0cUk0VWY1UjJw?=
 =?utf-8?B?U25JYVVVUUFjVkY4M0tSaFA1QkRuc0ROQ3VraDNJd2JDNE1uMVF0T0t1cW15?=
 =?utf-8?B?N3poMU5YcUhpeXJqMXVUTzBDUVMxMmV3K3ZlVjM5M1RFdk5CRVV0MnR2ejZJ?=
 =?utf-8?B?dXRsUzlRcUkwV0pVTHZ5MUczRXdWdDRvQVdKVm9zWnBETEhXZHV6ZXR2TGpy?=
 =?utf-8?B?MXRSWFRIQ2QxWVpQNmpRVzJObFYxV29sOGVIcmF5Mk5kbVFyS3lmSXZjb1hN?=
 =?utf-8?B?ZXJIei9ZUmxEdFRpdjV2Y3NpQ1l1M0RGUUxJdDFRcE90K0MvQzUwT1o4ejlQ?=
 =?utf-8?B?bVFEaGVlTTB5YjhDTzM1TjhQcy92bTUyVlhNcHo3NVZYMS9KV3FGdjVxaHY4?=
 =?utf-8?B?TzRUK2FiSlBIaHNGWFhIcDVPOFI4MktwbFFuQ0l1SnE0K05lN1pxbE41akFO?=
 =?utf-8?B?SVVuem5xMU44MkVkSDFXYk1QZ256QWN0RmV1MGd3Y0hldENzNU1EUm5xSDZR?=
 =?utf-8?B?VnZSS1VnVGNXUTNuZlJ0dU1DZVc1dU1HK3FwUWJ1c0dKY3FHdTRvTUJ5M1Ew?=
 =?utf-8?B?aituSy9ZSXpRLzlXYTB1SE9VMURjNFJUNmVCU1lSaWcyL0czaXk5RFlZNzVl?=
 =?utf-8?B?alZUdVd4OG4zQmJoaXNGNzVwY3lEbkJIMHE5aDgwR3IrdEp1aGxhL1B1SUFj?=
 =?utf-8?B?VWxQenFxZkM1SWpKb2k4MzJSWkgyalZBUU1YTHFUMVJwYk1rajVLWjBJL3Zr?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6503831-3b49-4d9d-93c8-08db10e023c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 12:11:46.0974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +zvVXweIU+jtTNkS7NE+0F52G1VzfLCeL9ir644J+0+REIRxC71YldjC15AOeeueg5G2aE3AgMlGS6Si4U72Xn/CyS3sdx8J28nnGKOXmjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10278
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SEkgSWxwbywNCg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY0IDUvNl0gc2VyaWFsOiA4MjUwX2Vt
OiBVc2UgcHNldWRvIG9mZnNldCBmb3IgVUFSVF9GQ1INCj4gDQo+IE9uIEZyaSwgMTcgRmViIDIw
MjMsIEJpanUgRGFzIHdyb3RlOg0KPiANCj4gPiBIaSBJbHBvLA0KPiA+DQo+ID4gVGhhbmtzIGZv
ciB0aGUgZmVlZGJhY2suDQo+ID4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgNS82XSBz
ZXJpYWw6IDgyNTBfZW06IFVzZSBwc2V1ZG8gb2Zmc2V0IGZvcg0KPiA+ID4gVUFSVF9GQ1INCj4g
PiA+DQo+ID4gPiBPbiBGcmksIDE3IEZlYiAyMDIzLCBCaWp1IERhcyB3cm90ZToNCj4gPiA+DQo+
ID4gPiA+IFVBUlRfRkNSIHNoYXJlcyB0aGUgc2FtZSBvZmZzZXQgd2l0aCBVQVJUX0lJUi4gV2Ug
Y2Fubm90IHVzZQ0KPiA+ID4gPiBVQVJUX0ZDUiBpbiBzZXJpYWw4MjUwX2VtX3NlcmlhbF9pbigp
IGFzIGl0IG92ZXJsYXBzIHdpdGggVUFSVF9JSVIuDQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgcGF0
Y2ggaW50cm9kdWNlcyBhIG1hY3JvIFVBUlRfRkNSX0VNIHdpdGggYSBoaWdoIHZhbHVlIHRvDQo+
ID4gPiA+IGF2b2lkIG92ZXJsYXBwaW5nIHdpdGggZXhpc3RpbmcgVUFSVF8qIHJlZ2lzdGVyIGRl
ZmluZXMuDQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgd2lsbCBoZWxwIHVzIHRvIHVzZSBVQVJUX0ZD
Ul9FTSBjb25zaXN0ZW50bHkgaW4NCj4gPiA+ID4gc2VyaWFsODI1MF9lbV8gc2VyaWFse19pbi9f
b3V0fSBmdW5jdGlvbiB0byByZWFkL3dyaXRlIEZDUiByZWdpc3Rlci4NCj4gPiA+ID4NCj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiA+ID4gPiBTdWdnZXN0ZWQtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZpbmVuQGxpbnV4
LmludGVsLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IHY0Og0KPiA+ID4gPiAgKiBOZXcgcGF0
Y2guIFVzZWQgVUFSVF9GQ1JfRU0gZm9yIHJlYWQvd3JpdGUgb2YgRkNSIHJlZ2lzdGVyLg0KPiA+
ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZW0uYyB8IDEz
ICsrKysrKysrKysrKy0NCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0
eS9zZXJpYWwvODI1MC84MjUwX2VtLmMNCj4gPiA+ID4gYi9kcml2ZXJzL3R0eS9zZXJpYWwvODI1
MC84MjUwX2VtLmMNCj4gPiA+ID4gaW5kZXggNDk5ZDdhODg0N2VjLi40MTY1ZmQzYmIxN2EgMTAw
NjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZW0uYw0KPiA+
ID4gPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2VtLmMNCj4gPiA+ID4gQEAg
LTE5LDYgKzE5LDEzIEBADQo+ID4gPiA+ICAjZGVmaW5lIFVBUlRfRExMX0VNIDkNCj4gPiA+ID4g
ICNkZWZpbmUgVUFSVF9ETE1fRU0gMTANCj4gPiA+ID4NCj4gPiA+ID4gKy8qDQo+ID4gPiA+ICsg
KiBBIGhpZ2ggdmFsdWUgZm9yIFVBUlRfRkNSX0VNIGF2b2lkcyBvdmVybGFwcGluZyB3aXRoIGV4
aXN0aW5nDQo+ID4gPiA+ICtVQVJUXyoNCj4gPiA+ID4gKyAqIHJlZ2lzdGVyIGRlZmluZXMuIFVB
UlRfRkNSX0VNX0hXIGlzIHRoZSByZWFsIEhXIHJlZ2lzdGVyIG9mZnNldC4NCj4gPiA+ID4gKyAq
Lw0KPiA+ID4gPiArI2RlZmluZSBVQVJUX0ZDUl9FTSAweDEwMDAzDQo+ID4gPiA+ICsjZGVmaW5l
IFVBUlRfRkNSX0VNX0hXIDMNCj4gPiA+ID4gKw0KPiA+ID4gPiAgc3RydWN0IHNlcmlhbDgyNTBf
ZW1fcHJpdiB7DQo+ID4gPiA+ICAJaW50IGxpbmU7DQo+ID4gPiA+ICB9Ow0KPiA+ID4gPiBAQCAt
MjksMTIgKzM2LDE0IEBAIHN0YXRpYyB2b2lkIHNlcmlhbDgyNTBfZW1fc2VyaWFsX291dChzdHJ1
Y3QNCj4gPiA+ID4gdWFydF9wb3J0DQo+ID4gPiAqcCwgaW50IG9mZnNldCwgaW50IHZhbHVlKQ0K
PiA+ID4gPiAgCWNhc2UgVUFSVF9UWDogLyogVFggQCAweDAwICovDQo+ID4gPiA+ICAJCXdyaXRl
Yih2YWx1ZSwgcC0+bWVtYmFzZSk7DQo+ID4gPiA+ICAJCWJyZWFrOw0KPiA+ID4gPiAtCWNhc2Ug
VUFSVF9GQ1I6IC8qIEZDUiBAIDB4MGMgKCsxKSAqLw0KPiA+ID4NCj4gPiA+IDgyNTBfcG9ydCB3
YW50cyB0aGlzIHRvIHJlbWFpbiBpbiBwbGFjZSwgSSB0aGluay4gT3RoZXJ3aXNlIGl0J3MNCj4g
PiA+IGF0dGVtcHRzIHRvIHNldCBVQVJUX0ZDUiB3aWxsIGVuZCB1cCBpbnRvIHdyb25nIGRlc3Rp
bmF0aW9uLg0KPiA+DQo+ID4gT29wcywgbmV4dCBwYXRjaCBoYXMgdGhpcyBjaGFuZ2UuDQo+ID4N
Cj4gPiArCWNhc2UgVUFSVF9GQ1I6DQo+ID4gKwkJc2VyaWFsODI1MF9lbV9yZWdfdXBkYXRlKHAs
IFVBUlRfRkNSX0VNLCB2YWx1ZSk7DQo+ID4NCj4gPiBJIGp1c3QgbmVlZCB0byBrZWVwIFVBUlRf
RkNSIGZvciB0aGlzIHBhdGNoIGFuZCByZW1vdmUgaXQgZnJvbQ0KPiA+ICJzZXJpYWw4MjUwX2Vt
X3NlcmlhbF9vdXRfaGVscGVyIiBvbiB0aGUgbmV4dCBwYXRjaA0KPiANCj4gSU1ITywgdGhlIGV4
dHJhIGxheWVyICsgX2hlbHBlciBzZWVtcyBwcmV0dHkgdW5uZWNlc3NhcnkuIEkgZG9uJ3Qgc2Vl
IGFueQ0KPiB1c2VmdWwgdGhpbmcgaXQgYWNoaWV2ZXMgb3ZlciBqdXN0IGhhdmluZyB0byBzZXJp
YWxfb3V0IGZ1bmN0aW9ucy4NCg0KV2l0aG91dCBoZWxwZXIsIGl0IHdpbGwgYmVjb21lIGN5Y2xp
YyByaWdodD8/DQoNCnNlcmlhbDgyNTBfZW1fc2VyaWFsX291dCgpIG5lZWRzIHRvIGNhbGwgc2Vy
aWFsODI1MF9lbV9yZWdfdXBkYXRlKCkNCg0Kc2VyaWFsODI1MF9lbV9yZWdfdXBkYXRlKCkgd2ls
bCBjYWxsIHNlcmlhbDgyNTBfZW1fc2VyaWFsX291dCgpIGZvciB3cml0ZXM/Pw0KDQpDaGVlcnMs
DQpCaWp1DQo=
