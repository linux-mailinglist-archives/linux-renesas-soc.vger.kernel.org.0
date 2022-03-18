Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5754A4DD7EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 11:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234987AbiCRKa0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 06:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234982AbiCRKaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 06:30:25 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2090.outbound.protection.outlook.com [40.107.114.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBCA7460D;
        Fri, 18 Mar 2022 03:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFjPbBS0E6Dru3B6FV7Rn6+nmDxc+zc3jxZvSH0mBIT/egOD9Ulbg3Yyek4CBYNhMCdF5hbWV3v7XizkOWL6zmVoNypW31KBwi/YhzT2gIl5Gv20LxlQvAB/SpFWVAGWICuy1Te1TamEd8NB0R4MngEP8X01OqjVnmMLtijIa3JyM66qJyuJoln2/qf4wZ8lneb4+scXOwALD+pinm+FRmHvOXmiVkAWWL+UXI1Kko5xKV7/gomTltryRyLv75zRBt1v+K0gcxs9/tDEG7IwqIYcCEc24ym25stk2xIEussKYjvYkOjVBKD4Wraa10CthxJB6t7SFw3fVJvZ7u/hVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQDeuv+eooSbUGHTGfZ5uh4L8gE0hSvfcudJMpMDVxc=;
 b=LqPTlToSTTARHd2l4W1QbtR5PQxOcp4FS1eR0PpTIA5iVlb/+LDQ/kwfBdTjejM3bwuWufhlJ39XwFKNVoiRfPv/wGKuP/oHQPN3MpzP5YBPj/s3wavEpg2U+oVIeusYxtavvKRodAfJgB6wS3cYGGLyLsMpBl1KiAC1kiSjE5cWEY9r12cpdGG/sd3OB+bWFo6UTvpA1etX2F5cy+UMy6rQNOhq5Blz0l1ZmTZOtKLS9dxlDSeX2jPXtmrNqYB/yCec4AQ64o8TzSwBNugbuaLvZ5VdOeVfQCZ0LZGcHfy7JnUjZ7JIviEPJKvSWK9xJjVeCg9Sn6zyUnpUmj17Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQDeuv+eooSbUGHTGfZ5uh4L8gE0hSvfcudJMpMDVxc=;
 b=UEeW9626XXbirkECIpht++2D6mK3Rj0oKvcIjMqNa2p/Gtv9BQJ2NQ5+MD+1A2z4ap8Q9aqvVsr6I+y5+Q8kFNd8JpXhWtYxCGBBlOXXBVyh/bjLJ0Qc/euFC4dxCPZXqi6kwWQUhBGQUk2qoffzdzQ5AagKYRn8joP3S1zjvsA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8424.jpnprd01.prod.outlook.com (2603:1096:400:13b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 10:29:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b%5]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 10:29:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [RFC 04/28] clk: renesas: r9a07g044: Add M1 clock support
Thread-Topic: [RFC 04/28] clk: renesas: r9a07g044: Add M1 clock support
Thread-Index: AQHYB9xUPsnUs4gAuUWDNKmuLoao8Kx+4nyAgEZzlTA=
Date:   Fri, 18 Mar 2022 10:29:02 +0000
Message-ID: <OS0PR01MB5922CD073C00C049610285E586139@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdXJz8BHXw=NdV0c9P3JZ0QH655njmA4cNx1j1mGJhDsHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXJz8BHXw=NdV0c9P3JZ0QH655njmA4cNx1j1mGJhDsHQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef596c4e-bcc2-43af-05bf-08da08ca1ef7
x-ms-traffictypediagnostic: TYCPR01MB8424:EE_
x-microsoft-antispam-prvs: <TYCPR01MB84249D2D704248EB31477ADC86139@TYCPR01MB8424.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: li78Rukxv/9+DtxIN4eFWU7EcqE9kjDj3smmCePqGWv/fuine046+BXq1pLacA48f0PPqmXuAPpY/YjfNxe8stKPOLJJp5cilOE20dg/rn94fx1cNcdBNUBzPcSgm10VFwZnih63wGQ3RBdxzIeNVV8SydMMKI/ngr2za9H9sTMWcdER1M64T9klKueuDAGEzBPMEGvQz8msFZYwJQKL653kv6W3x4YQY7ZNGpmQZlcWV+xrB4z+ukpBDs/X5HygYD/jCBKyB5m3fo1bZ/4fuVji3eZ0F9Uvk9lW4xauCXyNz0HxbBr8KjxTjfxWeLnrfFwa6Fdw7fg7ldAJWaEpkaMAG16oqd7BfwU4K90I2vp8Ck+IKRgVquALZLhWp/CHZHAYaaQRDc7EVeB6FuUgIaa4AXa/ElaYr3E4ZhGICk8ofxRJvZOVXAHRgfQ1UN4b3BuQqOTHCU9so3OM1EHpTW4jSydkhDXtO8bi3Xa1bk1XimUFqkkeYhOfD0Ou8tbDfGGEYbMMDam70cva1up/f7r3J/hdOPEMPBn6S7enK4iae2ossSORNzLOvtzW+CCnvrJGYYlMmBoQ0DsgYxkZzMVGwwf8vF1k3i2L30fhWFjBVfkAt5fxlLkj/kXMBIL3YygxM6VGf7Bdf9xTBBdh+ENl+z+hw7RYrH53MCg5+R4pOn5U3ZY92CkOX/TiYTTNhpyHTPx2UTiFrpqcc48imw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(64756008)(66946007)(66556008)(66476007)(66446008)(76116006)(4326008)(9686003)(122000001)(316002)(86362001)(6916009)(53546011)(54906003)(83380400001)(4744005)(2906002)(33656002)(38100700002)(5660300002)(7696005)(6506007)(71200400001)(55016003)(8936002)(26005)(52536014)(186003)(38070700005)(508600001)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmNqV3VRUzhMYzhSV0dFQUs0cmgyTDhDNmZRbVZyelFGbFBybHF5d2QwWkNq?=
 =?utf-8?B?T29xSmIyc3F1VXRNV3FkRWx2TlJ2dmd3M3VXdDFWVkd5YlNlRWljdG43bHcv?=
 =?utf-8?B?V0dHcDBNY2gwQmNMTnE5TENlS2gvSkl6ZlFLcnVHdmJRRk51c0tpSWh2Z3dL?=
 =?utf-8?B?WW5oNFBmU0lmc3Z4QklRMUpUTVh6M1luaWJ6N0xKREl0UURpL0JmUUZqR1Fo?=
 =?utf-8?B?eDdFeW11Ri9OVFdmTnZLRStkNWxZU3pwV3RqblFSY0g5b052b2NxVStRUjMw?=
 =?utf-8?B?clRRQjRrYVZVUDNjVmhpT2pQanQraWNEN0JSY3R5cThIZGlmYmF4dHJIdWZ2?=
 =?utf-8?B?VUE0RWNXREJZL0R3cFpjTGhjT29yYW0rSWdoU2ZFcG02RS8wb3U3blZuUVFy?=
 =?utf-8?B?NnhFTlp4ZDNqRzFrU0JqelRSckVoTGV6VmxLbzhzdHFrcHBZU3NteU1zWXhr?=
 =?utf-8?B?VlphZ3gyMk8wY1RZelQ0dmNuYWRxVTBVK1ZIa2VyT1pQN0hzOVpMQzZKV2d4?=
 =?utf-8?B?bGsyUFpTMTE2a3ozaG5pcFFRaVlqQmF5Y3ZFc2NtZWptUmZ1MWRVT2dVY0s1?=
 =?utf-8?B?Nmc4NXllTHExbHlmQXlOSUtsNllnRU5GMng5bzZ0by9BdTI1SjdXYlFKOWt3?=
 =?utf-8?B?ZUpGcWU3UG1OK2Z1aFZVNk9hRit4WHFna3kyZXNDZ2JiVlZGd1Zudko0MjJE?=
 =?utf-8?B?YWphdzJuQ0swcXhlZHF0UkR5SmU5d0MxbFB1bjMzS01Ob3VJTkpwUC9QamF2?=
 =?utf-8?B?UkNCcjJOZ1lkZlBNZkkvOW5SRnA4SVZKeGlncFZndmxqYlJsNUgrNm1rUks2?=
 =?utf-8?B?Wm1KMVVmQVp3dkUwOElVUElKaGtRbElXMHhSN3J1bGprdGxNN2h4MFJMNHJB?=
 =?utf-8?B?clJYajhiaThUVGN3NWlweUVIY09ac0pGeXJSWkxQamkvbnZhR0N4UVJtb0lY?=
 =?utf-8?B?ZWVUMXI1MklLOTVlMnRXUXJlTlJIdGFtRDJya21jYUhLUDJwanFING53VlJI?=
 =?utf-8?B?R0dtaGlCM21pTnpQUUFwcHVmSkVTdVVxbElSNlZqKy9WTWFuVkdxN2NiTlJh?=
 =?utf-8?B?OElsSE8yVStNNVRSYmhzdFpHeXMrcjZPZFYyTGc0b2NqUzRMaTVIdXIrVG1p?=
 =?utf-8?B?Z2RzT21ZaUVzMHdNSURpRG5Hcmk1RTBSbHVrQUdKQVhlSHpQS3NmR1dFQ0Vq?=
 =?utf-8?B?U2ZwOCtiVXp2Q0s4a0M3QWpQZGliUFJ3cjRHUXFKN1IwWnNvaHJscUw4c0Jl?=
 =?utf-8?B?RktXbm5VNWp4bXlCM0Uva2tmZW5UMzVQdGpEaG1jRmt0dVhjRkVqaS9HMzVk?=
 =?utf-8?B?MWI0dFdMcDVDdlJpUm9ucXVqRjRmajJtZllOOWhjeGxtQWw0cEd3a1E1alpZ?=
 =?utf-8?B?Q29rNVBIUUR3QjVCandpOFFrREhGanJsT09GbXhuNXhvd1pjaXB3N3IwRk44?=
 =?utf-8?B?QW8vZjFVN2h5S1hPZHkyUVhBTVViMzZPRXdkbVVmVURVSHlsclhjdjJTVTky?=
 =?utf-8?B?Q3k3cFVXdXdsQU9qQU5Wc1hOSGhPaDdVeFU3bXZnc1hyR21CRjJXWnpMZjRJ?=
 =?utf-8?B?TkhZZFkxY1dLV2lCd0RIRzBVcWprdkR2eU9FQXMxemNmL05WRUdYU1BuZnh3?=
 =?utf-8?B?ckppVDVGaW1aYkYrTjFBbmJRUHdHSHUxVUlvYzlKc29TNzFwN0k1ZVZaM3RW?=
 =?utf-8?B?Y2crVEplbTR0ckNkNTJFOGhXWDMrTXExR3pMcTQ3NWVwdE1BZjV2SldJMndt?=
 =?utf-8?B?Vm9aMmRlVWVqVVZyZmpkNEVOS2pGRDlqRS9KL1BDbzBWQXMrNkxLOFRQUkEr?=
 =?utf-8?B?M3FsMzM4ZVpic2JkSWEyQTBxL1RjVjRmT05rc09LSHQvczRxQ3N3ZVhTVkw5?=
 =?utf-8?B?ZTRLZEZ4LzltWEpvV0l3YThtTlMxTys0RityTFMzTWVIZkRWWXhKS3ZQN0hn?=
 =?utf-8?B?bTJIc3Jpd1NGYzJNaEhTMW84Rm1TZ3o2aHJOUU1zTXdsaGF1UHZwOU1kT2hH?=
 =?utf-8?B?THNNZ09QL253PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef596c4e-bcc2-43af-05bf-08da08ca1ef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 10:29:02.1486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HF5zTMa1WW7qeoSVkpYyoGKZh3Q0ZFRfBJmgQqkfMgXVosTfO/kPC7DDyHGlBNaHI8NmpT0uI4R3cDmKKdmu2M70JE07HHnlk1UxfM8fsrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8424
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UkZDIDA0LzI4XSBjbGs6IHJlbmVzYXM6IHI5YTA3ZzA0NDogQWRkIE0xIGNsb2NrIHN1cHBvcnQN
Cj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQsIEphbiAxMiwgMjAyMiBhdCA2OjQ2IFBNIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gQWRkIHN1
cHBvcnQgZm9yIE0xIGNsb2NrIHdoaWNoIGlzIHNvdXJjZWQgZnJvbSBGT1VUUE9TVERJVi4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9j
bGsvcmVuZXNhcy9yOWEwN2cwNDQtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2Fz
L3I5YTA3ZzA0NC1jcGcuYw0KPiANCj4gVGhlIGFib3ZlIGxvb2tzIGNvcnJlY3QgdG8gbWUsIHNv
DQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVy
LmJlPg0KPiANCj4gPiBAQCAtMzUzLDQgKzM2Miw3IEBAIGNvbnN0IHN0cnVjdCByemcybF9jcGdf
aW5mbyByOWEwN2cwNDRfY3BnX2luZm8gPSB7DQo+ID4gICAgICAgICAvKiBSZXNldHMgKi8NCj4g
PiAgICAgICAgIC5yZXNldHMgPSByOWEwN2cwNDRfcmVzZXRzLA0KPiA+ICAgICAgICAgLm51bV9y
ZXNldHMgPSBBUlJBWV9TSVpFKHI5YTA3ZzA0NF9yZXNldHMpLA0KPiA+ICsNCj4gPiArICAgICAg
IC8qIGxjZGMgbW9kZSBmb3IgUExMNSBzZXR0aW5ncyovDQo+ID4gKyAgICAgICAucGxsNV9sY2Rj
X2RzaV9tb2RlID0gdHJ1ZSwNCj4gPiAgfTsNCj4gDQo+IFRoaXMgaXMgdGhlIHBhcnQgSSBkb24n
dCBsaWtlLCBidXQgSSBndWVzcyB5b3UgY291bGQgaW1hZ2luZSA7LSkNCg0KQWdyZWVkLCBXaWxs
IHJlbW92ZSB0aGlzLg0KDQpDaGVlcnMsDQpCaWp1DQo=
