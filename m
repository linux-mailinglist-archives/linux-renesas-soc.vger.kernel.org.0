Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35674628678
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 18:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238017AbiKNRFb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 12:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236399AbiKNRFY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 12:05:24 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2114.outbound.protection.outlook.com [40.107.114.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB9F11827;
        Mon, 14 Nov 2022 09:05:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnrLjRiLsWuX0XPkXKVItJF0Z/NHku15oAuhr8mOwwihpGss35Ug6tB9jFclW1u1NMYIR40NNNkV3asP0eW7P7y4D6C2YlKgLDk4kr0dIWXOcE9VOuVrXBuX5tjjXCsEB6ZOrEKJmlkBtb/IqDq5Tfg2He/RGXqek3Vfe9yk+II5D3orRTOxhQTFn+yRS0lG7dVGZmhmslOxB8woLfKE2MXg+dp/irFZIjpoH9n3VmxRZlY8zfQKofqW/BGxXWENO0fQBQsoFvib+pB2EHPa2npOoZovnNAg0ezSO3Bk7VisWlXuyqgT8q99DawLnU/PdGWIuH0PWn8vDyxSGMOffQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOGZzch4mKORHolVp/HFaMfjzYebin/SPHO3kY3viGM=;
 b=T5kkEVu8b75QRm4tALiyjF5lwcd8AmE8fAJBMO0A/q0KbDB7oLfcFk6Pa2y9AbTedsGXAdLBATAclzprzoENs9vNgCQPgY0v34FIUwGGPT84luLZKDmPQPuYRIAONse/W2lAWM4IvGboRfG0mxvBXwwH0z160BXCOohHBn0d8STil6WnvsURNWE9xkNg0ghGnGG2yI9tSe1Lx/pSe3YiuQJ9RI481XaZq3+YPKhsdl89P95an/jQLLx4EeyJRQp+tnL+NyOIKNGguKA8BXR9tqv6F6phNuzn/X+4gIRlxmV7RL4CtWHQOvAzdNJliSqhUJe2xt2rC112pTFCPWXkNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOGZzch4mKORHolVp/HFaMfjzYebin/SPHO3kY3viGM=;
 b=s4a0tFLHb5OMRYnBtl8soQy5gKKuu4LiaHalWkCmjlB/7V0pbNFTK23/aJaGJeVJfhQCRUlwbhBsjup2bkM4blim3OLmbpJnOKxgMWzRr0I8k5qOqvG1WDPSNLZRWBL/bULOSI7GgvdkqEO7sb/GfvzdaNH405Q8WiqwNiPFl7g=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8061.jpnprd01.prod.outlook.com (2603:1096:400:11e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 17:05:21 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 17:05:21 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Thread-Topic: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas
 RZ/V2M System Configuration
Thread-Index: AQHY9SCBIuQl3m8nV0Kf1Ch8X1TBHq45ZpOAgAAH2aCAAB6FgIAABS+ggAUMRDCAAAS2gIAAAUsggAAD6gCAAACZMA==
Date:   Mon, 14 Nov 2022 17:05:21 +0000
Message-ID: <OS0PR01MB5922FB7D32AEC159234037D886059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-2-biju.das.jz@bp.renesas.com>
 <ae35fd75-64d3-3ab9-8cc0-3cbcc9c34b78@linaro.org>
 <OS0PR01MB59229179DE3D3D00C4963F3186009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a7bbfdd1-1abd-2ee5-1d32-47d0bcb7e1f2@linaro.org>
 <OS0PR01MB5922863B8EC8DF54D8E881FE86009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922C8A590502C8820B05A7186059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <839d9740-e814-897e-d484-ded3d531a97a@linaro.org>
 <OS0PR01MB59226FC7CA88208AB5C0AED586059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a3e5d695-535e-8587-6ccc-4c65fbeba278@linaro.org>
In-Reply-To: <a3e5d695-535e-8587-6ccc-4c65fbeba278@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8061:EE_
x-ms-office365-filtering-correlation-id: 059494bc-1a8e-403d-3a0d-08dac6626a07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OvHOOsIvpTJKBME6r94+HehQVoT1WvZ6hgNBogBTRVjp4uONu/Fu02v+oNpE5Frvb5AgcaDdV7GETZ4yQrDre3E07hle+3VxcghsjSqbrEV5yefHI73AhdosyhRkxH7fLYvM9GdeYDy/HZBI04NpSfe2GvJja7oLhzfDiubJSJj06bz7fKnbE2lxtEcQ2uiTG35u+IQLDEhHETj2PcCz7z7NA0TrVURdIZssP6Q/mp4LaR/8Cn+2/n2DIaxb0ChjGCajGcRhRUFzTJ1ZoK7WhmGynEhPXxYg4C6jMzH9cal87zyAo2sWfPhMJzPgedz6Kverc80QXlXVQBuFXNX7w2Drcv6B4byPoJxM3eJybfSgjppljRuTkiaIh8OnVj6Da39bGBVp8ruoM/czGyD0PBaMIoqRhKUKWPAt4QjTru5HPAlbQxTxeM00GP9k5zkY8gxB1B/jB1bg/JrcDMTUKkKTmPECbmQ5m0WlARmtyJ2Rq6fyW7t6/1d3TvPopRBxph+33vzs6vHS17iYfRfP9EC57Zpkelm5h+3CToan+bfMVYcNdjqMkdCTNLzyYEeWJV5SoL6q9WHCN7k7Iab5bsQrZjAR9v1zlQJ1OAaqY3tM1lvOymr4Sz3arxc1+e6khfPBWPAQH7+fd7hJj1GuAxHqJ6WUkWB9dx5jCGSIOeuD08g+8h8gw2iwVUbkCPoGZyXdMqQpKAZIsgzDAduMvqe2rLyfee0ySndVBDyJ0mxKQlcxe/YbRWGOPOp8ThgFu/jpddaAyKBX9NRA8Bq3gw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(55016003)(478600001)(71200400001)(38100700002)(5660300002)(52536014)(8936002)(41300700001)(64756008)(110136005)(316002)(33656002)(54906003)(86362001)(76116006)(66556008)(66946007)(66446008)(38070700005)(83380400001)(122000001)(4326008)(107886003)(66476007)(186003)(7696005)(53546011)(26005)(6506007)(9686003)(8676002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU9TdXdOQVZCNlpHMnpZZzlHRkZheVFYVHJjRDNTZm5uTDIxaFNMeUJwOHkw?=
 =?utf-8?B?RE80VHJpUzBtejB3UTB2cGJkZ0lVd3k0OGlwcDNPVHM1V0ttNVBGeXphR3RG?=
 =?utf-8?B?a1NtZGdpZ3Y1UFpEUnNFK0xBY05hcXRxVHNKYmZBWVZCSTRJOVdhNUJSZU5o?=
 =?utf-8?B?d1d1Mi9xdlY5UGFlY0l3VzJWUHYxT2ZkR1YyOUdCa1dyeDVPNEdJZklFOEFI?=
 =?utf-8?B?WDYvWStaNGdSdU5mVHVsYjFHb3E2QlpjZmxIWFZOcDREVXpBK1RPNFAzQzk1?=
 =?utf-8?B?TDBURmxhMlJpRGhNUGlDRzdmeElBemswSkxwTjFWMkJPU05Vd09qUEp1c0VZ?=
 =?utf-8?B?M2dVUGF1QUNXM09nZUVydGZtZEhSRkk0TFdTNlB1d0U4bE5mUHZOWElua1VV?=
 =?utf-8?B?SU5uQy93OWVLeWNVQkxsUVVqVDQ5bmVtNlcyTjNRdzZ0V1J1eE56cy91K2NF?=
 =?utf-8?B?Z0hrNnUyZGNEa1IyaU9icWlSbkhFV2VKZTBDQndQK2hDMWc5eTRBeGVMd2NG?=
 =?utf-8?B?QWRzSXRVYjBJQ25zWktVTldLdG9ORlFMajBnWjZlenRJZzFlKy9laUtPYTVL?=
 =?utf-8?B?NFNEaFVSNXVueWl6REtVb1pXSS9pUkZpRTcwc1VpUWVUVXFmcTlVbEZ3bHh6?=
 =?utf-8?B?eHRHNjN4T2dYbUhUNVdGcUxDN2hUaGxQME5jckpnMEo0ZjlqZmdkZC9ubnlR?=
 =?utf-8?B?UDJUV2RpUm0wTUFwbVhuby83RitraVJTdk9zc3RCbTUwbVJ5cGVFNnRMa3V6?=
 =?utf-8?B?SThLd0VKWkVuR1o1L1k3bWh6RmhFQ2RrMFhhYjBIWURhS3lpY2ZrRDdOcUZO?=
 =?utf-8?B?eWlzRVV3ZzZrVTFiT000S3VTWkJ2WlVTMWxQR1dNemJZa202SDd4TkEzeENS?=
 =?utf-8?B?TjFCNnVlb0lrYmM4V2hkQjRmZWtGc01kdnZ0ZW9aYUpvd21EQWREK3N6b1hw?=
 =?utf-8?B?eklvS0FPU0tKU2tGNlk4VVlaV3ZDWndoQjd1R2NzSFM3WWViZ2FzUDlmZ2JZ?=
 =?utf-8?B?aG0yRm4xa2sxWGppRTZ5ajl2QitNYm1pNjJCdjNiUXZOVzNuTFMyZWZTRnIw?=
 =?utf-8?B?a1RyeUF2QllDN21OblVLSW1TSytvUUk2UjNlMlQ0ZmVreEtvMlRqalQvK2pK?=
 =?utf-8?B?LzBLUFlZTXRzUTczUHFPVGlHVnhuS3NqOCtFK3ZXMXZpUzBsZG83bHVXcFVh?=
 =?utf-8?B?cmU1dklubzBXUEkrT3hudWNKNWp0alBIUGpkQ0JhR3dUSXRWWlpQN29YS2Y2?=
 =?utf-8?B?dDdQRHV4YllCeHVtM1V2MHZGUVh4K3ZQclZmRnllWUh3RlVRZXdxU0xxNlV3?=
 =?utf-8?B?N0FOVS91TFB1TG1XcDVXOU9BZDRHMXJqMGsvd0VRWk5EQUNjaFpmdmpWVTMx?=
 =?utf-8?B?Wi9SeGp0V3lHQUd1eWkwaEg0YUxKVkxwUXhCVytMV2ltR25DaEhQdEdDMHNt?=
 =?utf-8?B?S0xPZXgyTG1wcjBwZXZja21LTkZnM2hadmlhQ2d2NkEyMURpQ2xuNklTNExF?=
 =?utf-8?B?TFZPNy9Cc2M5WXZDTzZjTVloN1FBSEpYVEZHUDcvbWdzajJHVm9GeE8yMkx4?=
 =?utf-8?B?eWJ6ZThoZ3h1Sm5hbEU1cm54YXBkVDhtbzBxdlpPYkV3bkZUblpibjJ6cnZz?=
 =?utf-8?B?MkcxUWpiL0FmUzZNUTVFT2grTjlrSFU5UHhLQWx4YnZ6YXAyQVZHMWdZcitY?=
 =?utf-8?B?V2h0eTBpYm1Jd09QMTZBTldYcUpyUWVJazFKVlA1SkpWMk1sVVN1RGloUWRO?=
 =?utf-8?B?N3BYQ2dOcnVNTXBrelBjRmhNYWk1K05MTURYMDVEZmxNRTJ0LzZvazRSU3pz?=
 =?utf-8?B?REE5RGRoVnBZUE5wY0NMbklIbXRuRUhVTTd0cTZNbWtUaUcvQTR2ODN1WjE1?=
 =?utf-8?B?b1lJcGZEYUpqd1dsT005NWZBaHR6eEduTUNkYjZkczFncGhDWEsxOC9MVDBW?=
 =?utf-8?B?Mlh1MXBkWW1ldFNCVmlqOWljV0hwUjU1dVdtTFZHWms5N2E5ZzRaVWw4NkRt?=
 =?utf-8?B?RG9UMWVqRnhobm1tNlRUQzJRNUtiOTVRVDNHdkdUQUJxWXpvRmllL2grRlow?=
 =?utf-8?B?MU1oY3dvZTIrak5sZXVIMTFJWUgyM0ZKY3ZIVkFkU1l6S0Y2dDdUOCtxNEtn?=
 =?utf-8?B?WE9WNk45eS9ESHF4Y2dsNjZEUXJ5TVFvV2libS9qZDYxTDBJMTRnK3E5aWd2?=
 =?utf-8?B?blE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059494bc-1a8e-403d-3a0d-08dac6626a07
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 17:05:21.3830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SeMhVX3/259VkVbngsdpbxxbwe0SODKnRyD+b3vtNiAYMvbUBgzyqcOp7uEPqZXeGSYo1lt78snp7WVGhR2vZthwh0vRLujxJasM0/dg5k0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8061
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBTZW50OiAxNCBOb3ZlbWJl
ciAyMDIyIDE2OjUxDQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsNCj4gS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgR2VlcnQgVXl0dGVyaG9ldmVu
DQo+IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gQ2M6IFBoaWwgRWR3b3J0aHkgPHBoaWwu
ZWR3b3J0aHlAcmVuZXNhcy5jb20+OyBNYWdudXMgRGFtbQ0KPiA8bWFnbnVzLmRhbW1AZ21haWwu
Y29tPjsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsgQ2hyaXMgUGF0ZXJzb24gPENocmlzLlBhdGVyc29uMkByZW5lc2FzLmNv
bT47DQo+IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvM10gZHQtYmluZGluZ3M6IGFybTogcmVuZXNhczog
RG9jdW1lbnQgUmVuZXNhcw0KPiBSWi9WMk0gU3lzdGVtIENvbmZpZ3VyYXRpb24NCj4gDQo+IE9u
IDE0LzExLzIwMjIgMTc6NDQsIEJpanUgRGFzIHdyb3RlOg0KPiA+Pj4+PiBJZiB0aGUgaGFyZHdh
cmUgbWFudWFsIHNhaWQgdGhpcyBpcyBjYWxsZWQgImZvby13aGF0ZXZlci1uYW1lIiBvcg0KPiA+
Pj4+PiAicno4NTczNmRmbngyIiwgeW91IHdvdWxkIHVzZSBpdCBhcyB3ZWxsPw0KPiA+Pj4+Pg0K
PiA+Pj4+PiBOb2RlIG5hbWVzIHNob3VsZCBiZSBnZW5lcmljLg0KPiA+Pj4NCj4gPj4+IEkgZ290
IHRoZSBmb2xsb3dpbmcgZmVlZGJhY2sgZnJvbSBMU0kgdGVhbS4NCj4gPj4+DQo+ID4+PiAqVGhl
IHJlYXNvbiB3aHkgd2UgdXNlICJjb25maWd1cmF0aW9uIiBhbmQgbm90ICJjb250cm9sbGVyIiBp
cyB0aGUNCj4gPj4+IHBvc3NpYmlsaXR5IHRoYXQgdXNlcnMgbWlnaHQgdGFrZSBpdCB0byBtZWFu
ICJjb250cm9sIiBvZiBzeXN0ZW0NCj4gPj4+IG9wZXJhdGlvbiAocHJvZHVjdCBvcGVyYXRpb24p
LiBUaGlzIHVuaXQgZGV0ZXJtaW5lcyBob3cgdGhlIHdob2xlDQo+ID4+PiBMU0kNCj4gPj4gY29u
ZmlndXJlIHRvIG9wZXJhdGUgTFNJLCBzbyB3ZSB1c2UgImNvbmZpZ3VyYXRpb24iIGZvciB0aGlz
IElQIG5hbWUuDQo+ID4+Pg0KPiA+Pj4gQXMgcGVyIHRoaXMgaXQgaXMgbm90IGEgY29udHJvbGxl
ci4gSXQgaXMgYSBDb25maWd1cmF0aW9uIElQLg0KPiA+Pj4NCj4gPj4+IFdoYXQgc2hvdWxkIGJl
IGdlbmVyaWMgbm9kZSBuYW1lIGZvciBzeXN0ZW0gY29uZmlndXJhdGlvbiBJUD8NCj4gPj4NCj4g
Pj4gVGhlbiBpdCdzIGNsb3NlciB0byBjaGlwaWQgYW5kIHNob3VsZCBiZSBpbiBod2luZm8/DQo+
ID4NCj4gPiBZb3UgbWVhbiwgc3lzOiBod2luZm9AYTNmMDMwMDAgaW5zdGVhZCBvZiBzeXM6IHN5
c3RlbS0NCj4gY29uZmlndXJhdGlvbkBhM2YwMzAwMCA/Pw0KPiANCj4gUmF0aGVyIGJlIHB1dCBp
biBod2luZm8gZGlyZWN0b3J5LiBUeXBpY2FsIG5hbWUgaXMgImNoaXBpZCIsIGJ1dCBJIGRvbid0
IGtub3cNCj4gaWYgeW91ciBkZXZpY2UgaXMgYSBjaGlwaWQuDQoNClRoaXMgSVAgaXMgZm9yIHN1
cmUgbm90IGEgY2hpcGlkLiBXZSBjYW4gZGV0ZWN0IFNvQyB2ZXJzaW9uLiBUaGF0IGlzIG9uZSBv
ZiB0aGUgZnVuY3Rpb25zIHByb3ZpZGVkDQpieSB0aGlzIElQLg0KDQo+IA0KPiA+DQo+ID4gQWxz
byB0aGUgc2FtZSBJUCBibG9jayBpcyBwcmVzZW50IG9uIHJ6L3YybWEgYXMgd2VsbD8NCj4gPg0K
PiA+IFNoYWxsIEkgdXNlIHRoZSBzYW1lIGZpbGUgcmVuZXNhcyxyenYybS1zeXMueWFtbCBmb3Ig
Ym90aCByOWEwOWcwMTEtc3lzIGFuZA0KPiByOWEwOWcwNTUtc3lzPw0KPiA+DQo+ID4+DQo+ID4+
IEFueXdheSwgeW91IHdyb3RlIGluIGJpbmRpbmdzIGRlc2NyaXB0aW9uOiAicGVyZm9ybXMgc3lz
dGVtIGNvbnRyb2wiLA0KPiA+PiBzbyB3aGF0IGNhbiBJIHNheT8NCj4gPg0KPiA+IFNZUyBmdW5j
dGlvbmFsIGRlc2NyaXB0aW9uIGlzIGFzIGZvbGxvd3MuDQo+ID4NCj4gPiBUaGUgU1lTIGNvbnRy
b2xzIHRoZSBvdmVyYWxsIGNvbmZpZ3VyYXRpb24gb2YgdGhlIGNoaXAsIHN1Y2ggYXMNCj4gDQo+
IEV4YWN0bHksIGl0IGNvbnRyb2xzLCBzbyBpdCBpcyBhIGNvbnRyb2xsZXIuLi4gQW55d2F5LCBk
byBub3QgaW50cm9kdWNlIHlvdXINCj4gb3duIG5hbWVzLCBidXQgdXNlIHNvbWV0aGluZyBnZW5l
cmljLiBUaGVyZSBpcyBubyBzaW5nbGUgcmVmZXJlbmNlIG9mDQo+ICJzeXN0ZW0tY29uZmlndXJh
dGlvbiIuDQoNClRoZSBtYWluIGZ1bmN0aW9uYWxpdHkgb2YgdGhlIGNoaXAgaXMgQmFuayBhZGRy
ZXNzIGNvbmZpZ3VyYXRpb24sDQoNCkJhbmsgQWRkcmVzcyBTd2l0Y2hpbmcNCg0KVGhlIFNZUyBo
YXMgYSBiYW5rIHN3aXRjaGluZyByZWdpc3RlciB0byBleHRlbmQgdGhlIHR3byBoaWdoZXItb3Jk
ZXIgYml0cyBvZiB0aGUgYWRkcmVzc2VzIG9mIHRoZSBmb2xsb3dpbmcgSVAgbW9kdWxlcw0Kd2hp
Y2ggaGF2ZSBvbmx5IDMyLWJpdCAoNC1HQikgYWRkcmVzcyBzcGFjZXMuIEl0IG1ha2VzIDQgb3Ig
bW9yZSBHYnl0ZXMgb2YgdGhlIGFkZHJlc3Mgc3BhY2UgYWNjZXNzaWJsZSBieSBzd2l0Y2hpbmcN
CnRoZSBiYW5rIGFkZHJlc3MuDQoNClRhcmdldCB1bml0IDE6IERSUC1BSSwgZU1NQywgU0RJMC8x
LCBFVEhFUiwgUENJZSwgVVNCLCBHUlAsIFZDRA0KVGFyZ2V0IHVuaXQgMjogRE1BQw0KDQpUaGUg
b3RoZXIgY29udHJvbCBmdW5jdGlvbmFsaXRpZXMgbWVudGlvbmVkIGluIHRoZSBJUCBhcmUgc2lt
cGxlIG9uZS4NCg0KQXMgeW91IHNhaWQsIEl0IGlzIHVuaXF1ZSBJUC4gUHJvYmFibHkgaW4gZnV0
dXJlIHNvbWUgb3RoZXIgU29DIG1hbnVmYWN0dXJlcyBtYXkgY29tZSB3aXRoIHNpbWlsYXIgSVAg
Zm9yIHN5c3RlbSBjb25maWd1cmF0aW9uDQpsaWtlIEJhbmsgc3dpdGNoaW5nLiBXaXRoIEJhbmsg
c3dpdGNoaW5nIHdlIGNhbiBzd2l0Y2ggZnJvbSAzMiBiaXQgLT4zNCBiaXQgYWRkcmVzc2VzLg0K
DQpDaGVlcnMsDQpCaWp1DQoNCg==
