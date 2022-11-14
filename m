Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8A79628937
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 20:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236897AbiKNTWC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 14:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbiKNTWB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 14:22:01 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A4327CCA;
        Mon, 14 Nov 2022 11:22:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=go062XAMThSAYE1lrtKnvGN530vG7kN/uIoeEacbgN/8Z7NB2r9qv/gkKC3qb4bdRV/rXJ2OK6nmpYFHL+HdA3PJkVAhw4t8ZJ8I+SrFqTXRSSz08DZI+4kuBAcuq0daAIBfahEpJLdUOQ+KPAsr7T1pGsEJvY7JvN7j9M0vNiQvB+6IHVEppnqA7vT5EIhRcaRkk/fZivVMtn1Iv+W5ebrmL98DeSDlzSaUIIJFJWYp1025jrL78rA6fX7xdeekURVbIM3rk3EL2Ot24u6rfRORTJK0B9Tgk/t1uGOdqdrHLFuHB9zWWcw9ZS2PVp0UWEjT/zKBcq0DxY4PAq6jPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/CXKV/W2bxKc0qW9D2ApPP6RrUrK6KAMgG3sg7LWzvY=;
 b=LTAw+lxzsPnvdFzaHvnRZfxcuEjXW2O51eXwySKO01lzw+3qLAXq2uvvvXXIAlXBNltoEDQP8zNQcYQtIhUcVF5NCkgMzKFqEedfXpl8DmSCAusn98UjlZchgF7WY2RGIqxnjBhAfiw3yIMLxqIic0Fue9pNKFUp6vi9+z6U9BuivASVMzQeJOeDvH9EtpYNyiLOLaTKOkqNVckwchRzaCE03FK92AqnV6sEDCNATI8C7dqvvWc0XDTZTbEA2LM+HrGAi5ld6s4BseuoKBszV4RuHOMgYnTuG6kCtUUC3a8aoru2nLLyOHg5M+HSxubB3GuA6ISdoYQoDtlf9A1A3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CXKV/W2bxKc0qW9D2ApPP6RrUrK6KAMgG3sg7LWzvY=;
 b=H5q0r6PIPvHjJiSsDon1udMmteVb3i4Z3VlLIYtb41M2Hgqt0Dizv0+vVdaotpmNAV34HRtC/N2Qf8h2mMGI6xYT+N4G+4LksrGNP7bF2X4ZZ7i/gZj0WsWo82b6kNM2n7g/pKG+g988eu3OwTKhZQreFqUD9w7xKofQXLXd9Y0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB10369.jpnprd01.prod.outlook.com (2603:1096:400:251::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 19:21:57 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5813.018; Mon, 14 Nov 2022
 19:21:57 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Phil Edworthy <phil.edworthy@renesas.com>,
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
Thread-Index: AQHY9SCBIuQl3m8nV0Kf1Ch8X1TBHq45ZpOAgAAH2aCAAB6FgIAABS+ggAUMRDCAAAS2gIAAAUsggAAD6gCAAACZMIAAJtqAgAABIaA=
Date:   Mon, 14 Nov 2022 19:21:57 +0000
Message-ID: <OS0PR01MB59220BB367224A4215365F0E86059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
 <OS0PR01MB5922FB7D32AEC159234037D886059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU=h_0Ay4U+PkzNQLE6nHP0UQ19fCdN4WPeh6e1H5TBZw@mail.gmail.com>
In-Reply-To: <CAMuHMdU=h_0Ay4U+PkzNQLE6nHP0UQ19fCdN4WPeh6e1H5TBZw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB10369:EE_
x-ms-office365-filtering-correlation-id: eff84f29-9b2a-4d54-c927-08dac6757f5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bi86xmFnEp2lLcjlwpQsnoIJJQc6nABD3kNvezGOX48bE3DUUz9dYMxtKHsf1Kzv59tM/2bn9HyZcUAVsNMHfVZhWKaA/QUwrXkCZFBJGKYMtNMZ1s/CXm4v5hDbqlFcZvsi3A3lEGA6aQdEpma/Wr183x2JNTZHuwuU/BTw4+MX2pUxRcMqueSfxnLFAgZMn4gW0/sM+WkpfPiziJW5yUi2WK1+g9gJUb75Gj+BUswDeNdqWN6f7g4lctEAoUi7UMzdAwf7/gYaW3v080P5Q1X6bevgjnQg4mcHeNyXYtErIPSGQo2bVogVtGuwSD94YOa+DIfNixKz2DZ4+epAbbHrQvmBswyFrk2ivKLQLOzXg5r17eIQTvLZ0dbvuy/R9aQLgrTiBInPX5Jt9AFYirO6Z86Srhm25/sUjdaP+RjezHjIYuJ78HVQV0PC30ieZYE1NuSm2cQf1PaYKIBBPtM87GEospLF1ZqXFks2T3qclmMlvZa4zXH/jvOrdj8bbp8RHGMsa9LZE+cuSYa+V3vKsmq7bpXHoGgZZtObSG7SYafWnLYa1BDv+E6EO+jUJRBAIOR6MbtB8abu7HUyTmXkQiKLhQkzzX3Lg4MWoeIcKKrqM5f+71Wp79Qi61hAr2/uuz0MLGBFWBJBqI8LHIGlNNTzG2Hxo6wGvqtaXPxCeroGSmQJqXtcl6t51EKVN5LTcKLcg9yiq1K1vF1GUaOxDcXPniFR4jyPYzvt/h3Cocn3ZTCAHymDKVzdJwsPvz5+d8XSojZPh78U/q8vSQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199015)(2906002)(4326008)(76116006)(9686003)(66946007)(8676002)(64756008)(66476007)(26005)(7696005)(316002)(66556008)(66446008)(53546011)(186003)(8936002)(52536014)(41300700001)(6506007)(38100700002)(55016003)(86362001)(122000001)(38070700005)(83380400001)(33656002)(5660300002)(107886003)(71200400001)(478600001)(54906003)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SC80ZWNWb0IxVTNXcVh5UnY5aXg5SC9MU2JRTUNXeTd3clkrYktvL0VocHJY?=
 =?utf-8?B?bFV0dkVtRkR0ZEEwNlduSHFVYVlGQmtINW1telJqTmlBc3c1eEJMMHhsQzgx?=
 =?utf-8?B?b3BBWERUcGV1VFFRQWgrRnN3ajVFZWEveTVlanQrSUZmQmZ1M1oxTVkrSU0x?=
 =?utf-8?B?V3hhdUtOUnhVY2hyM0ZhdUZKeU92NEYxQWozSmF3aFhYL2VOdHh3K1cxV0J3?=
 =?utf-8?B?UzQxaG5jbjE0bGIrVDl5VmEzM0w0UnRNMTlvd1VWTG43RU9YZzUvSkVTM1l3?=
 =?utf-8?B?SW9RZVBSQ2UvaVNVUWI3WlR3a2s1YkIzeEpmaDYwcUhiRUZ3cEs5UE1nalBB?=
 =?utf-8?B?RkFpZ3A2NS9OMnU4MEU3QnhTZThFQVRBNVVUeGJuNmRRU1ZWb1hEZG1YRXpX?=
 =?utf-8?B?NWYyeEx1d3BrSzN4MU9Rdy93cXIxdGRxWmZTYzhXQXBJaVpPY0xTMUN2c21Q?=
 =?utf-8?B?SDI5YjcxYS9BN3p5bFVJZDJLRHNLbkJibVBaWUxubDNIeFh0VGMvelJNYi9n?=
 =?utf-8?B?V0dIQUkrK20vUVpEdWtwMWo3RStLTlRkK2RYeFVTR1pHWDk1RHB6Q0x0bkhi?=
 =?utf-8?B?Z3V6NDJ2Z3pMaGFsWGFPSDVHMVN4Zi95VXNiYVNDemhjWEdWTmtMbCtSbVBj?=
 =?utf-8?B?dGZDUDF4RStXNEYyUVhkUWFoS1d6T21QeS82MFYva1BtdENWb0RhaG9zbGx3?=
 =?utf-8?B?Y0xJTUxYZnl5OTJ6b2c3b3NyVE5ESFFhNGVSbkdnNHZHNW04c0tmc1ZYRCts?=
 =?utf-8?B?Q2JTdXQ0OXpKNDBWaFJBZmlnbFh1amtJTlRTSUR2SnVZd3RnQ3IvVURZNXpT?=
 =?utf-8?B?bzJsNGxURGZSZUxQdnUweXlCSC9HQ0lVbzE4endPUmxtWXhwTlg5cWNaVFBj?=
 =?utf-8?B?L0tCQ1ZXR2FBaUNHUHZnMDVGdEpOcTVqaGJ0dHVZUE5QM2U1cy9IZm40WkR1?=
 =?utf-8?B?bHk0SnAwd1UrUFVYam5RZjJSUmtiR2ZndC9RNVo3ZWl4Q3ErbmY3VTg5a3hN?=
 =?utf-8?B?cnFnYVN6eHhVUFpUUUpidUMxcE5ubld3aVB4THhpcDZzSHFJakpnZXJER203?=
 =?utf-8?B?L2lDYytnY0VEVXlmWXVFb2l0T0QzZnYydHM3MXRMMnJqWHh3YUpGSi9zd1pZ?=
 =?utf-8?B?Q1gzNDh4dFljM0FQQnhKbnJGVmp3enBZdUJpczZTb0ZSdW5VY3NTMEt5eGhV?=
 =?utf-8?B?NHkwaTBNSi9qOUxwa091Z2FyL2RFMmR0d3NPZExxbjdvZy9HY2FWUmRtOGZj?=
 =?utf-8?B?bXh2RDNxeGQxMjJhaEk4Z2g1QWkzV2RJL1RFUERwRGI1YUsyQnU3akFobHlP?=
 =?utf-8?B?QUZETGlQLzRsWHRERW5na1IxUzkwVnkwSWRnMFVqZ0k2M3liajBVSk1kZjFt?=
 =?utf-8?B?ZUg3MFh2OStJSXVqd3BCeU5zZ2hGOGNYNXQzV1BReDh6RFpvZ1g2eXVPcUJ1?=
 =?utf-8?B?eFFOY3ZOYWhUQjJrbUtEY3A5cHJ0bHgwUWNjdWNGQVUvUmRCVkVHSkdOQngw?=
 =?utf-8?B?bU41Ky9tVjNrck51Tml3MkhKZmtTZVZtayt3VCs1TTdYZmpxaWpPUXdQOFVH?=
 =?utf-8?B?RUttcEJ6SkJpMGUrQm0xTGxvR2Z1NFVJclpZNDRtNy8ydjFoeVVRR05FS0dr?=
 =?utf-8?B?YytYaSs5cExqK2dQTm1YM1pyY29idllNR1pVeXNMSkJQKzY4cjRHTU9XRzNM?=
 =?utf-8?B?cDRZTzRKbGJiOFpZa1pDVmp0d3E5OFVnOU95d0xVNVNmOVA2WnZsQi9CS2ZC?=
 =?utf-8?B?TlBzRW04OWg0TDRRdnNzREx4SjFJSFlscWZDdnI2RU9HUHNqc1M0eUd0dW4x?=
 =?utf-8?B?WkdudEJkWEZHeUpydmQyaXVlTVNsQXA1RUQ5QTIwTTlRaVNMZVlPeUwwWFlM?=
 =?utf-8?B?bEZWRHNZU1ZRNlpvKzJPeEsrcmxVeFROUnQ0SWVwRzdCeXZLTkVFZGIwVFBQ?=
 =?utf-8?B?dUQyQmRKT2FKN0lwVWd4aEJadHh3YUJCOHRxUFNTK0Q4ZDl5ekxRSnFadWI2?=
 =?utf-8?B?WjB3QkNnYVNDWHA1blhTVlZlWjgzcFRpd0YyK2NrQXByUjRLKzFtcmxidW9W?=
 =?utf-8?B?bmZnY3Y4R3JBb2Zqd3FKMnM4Q0NPanFYbHpBeUx3VzlUWHU1amFKRy9scW1y?=
 =?utf-8?B?VlYweUg2WitxcVlFMDVZamtuQlZNWTYxckYyMExTTVNnVlhFZ2YyVXVJYk02?=
 =?utf-8?B?L0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff84f29-9b2a-4d54-c927-08dac6757f5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 19:21:57.6319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zZUHEL1pxEzLwcq+N7EZA0CA6bchcC+gI6WkxVE7HPh4Zq8ln24fTAErh0eJyv4rwMEGA46eOuhq+XRrI8iLPtrUtpI3h1m6v2Ri7+TJCEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10369
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMS8zXSBkdC1iaW5kaW5nczogYXJtOiByZW5lc2FzOiBEb2N1bWVudCBSZW5lc2Fz
DQo+IFJaL1YyTSBTeXN0ZW0gQ29uZmlndXJhdGlvbg0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9u
IE1vbiwgTm92IDE0LCAyMDIyIGF0IDY6MDUgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlz
enRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gT24NCj4gPiA+IDE0LzExLzIwMjIgMTc6NDQsIEJp
anUgRGFzIHdyb3RlOg0KPiA+ID4gPj4+Pj4gSWYgdGhlIGhhcmR3YXJlIG1hbnVhbCBzYWlkIHRo
aXMgaXMgY2FsbGVkICJmb28td2hhdGV2ZXItbmFtZSINCj4gPiA+ID4+Pj4+IG9yICJyejg1NzM2
ZGZueDIiLCB5b3Ugd291bGQgdXNlIGl0IGFzIHdlbGw/DQo+ID4gPiA+Pj4+Pg0KPiA+ID4gPj4+
Pj4gTm9kZSBuYW1lcyBzaG91bGQgYmUgZ2VuZXJpYy4NCj4gPiA+ID4+Pg0KPiA+ID4gPj4+IEkg
Z290IHRoZSBmb2xsb3dpbmcgZmVlZGJhY2sgZnJvbSBMU0kgdGVhbS4NCj4gPiA+ID4+Pg0KPiA+
ID4gPj4+ICpUaGUgcmVhc29uIHdoeSB3ZSB1c2UgImNvbmZpZ3VyYXRpb24iIGFuZCBub3QgImNv
bnRyb2xsZXIiIGlzDQo+ID4gPiA+Pj4gdGhlIHBvc3NpYmlsaXR5IHRoYXQgdXNlcnMgbWlnaHQg
dGFrZSBpdCB0byBtZWFuICJjb250cm9sIiBvZg0KPiA+ID4gPj4+IHN5c3RlbSBvcGVyYXRpb24g
KHByb2R1Y3Qgb3BlcmF0aW9uKS4gVGhpcyB1bml0IGRldGVybWluZXMgaG93DQo+ID4gPiA+Pj4g
dGhlIHdob2xlIExTSQ0KPiA+ID4gPj4gY29uZmlndXJlIHRvIG9wZXJhdGUgTFNJLCBzbyB3ZSB1
c2UgImNvbmZpZ3VyYXRpb24iIGZvciB0aGlzIElQIG5hbWUuDQo+ID4gPiA+Pj4NCj4gPiA+ID4+
PiBBcyBwZXIgdGhpcyBpdCBpcyBub3QgYSBjb250cm9sbGVyLiBJdCBpcyBhIENvbmZpZ3VyYXRp
b24gSVAuDQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiBXaGF0IHNob3VsZCBiZSBnZW5lcmljIG5vZGUg
bmFtZSBmb3Igc3lzdGVtIGNvbmZpZ3VyYXRpb24gSVA/DQo+ID4gPiA+Pg0KPiA+ID4gPj4gVGhl
biBpdCdzIGNsb3NlciB0byBjaGlwaWQgYW5kIHNob3VsZCBiZSBpbiBod2luZm8/DQo+ID4gPiA+
DQo+ID4gPiA+IFlvdSBtZWFuLCBzeXM6IGh3aW5mb0BhM2YwMzAwMCBpbnN0ZWFkIG9mIHN5czog
c3lzdGVtLQ0KPiA+ID4gY29uZmlndXJhdGlvbkBhM2YwMzAwMCA/Pw0KPiA+ID4NCj4gPiA+IFJh
dGhlciBiZSBwdXQgaW4gaHdpbmZvIGRpcmVjdG9yeS4gVHlwaWNhbCBuYW1lIGlzICJjaGlwaWQi
LCBidXQgSQ0KPiA+ID4gZG9uJ3Qga25vdyBpZiB5b3VyIGRldmljZSBpcyBhIGNoaXBpZC4NCj4g
Pg0KPiA+IFRoaXMgSVAgaXMgZm9yIHN1cmUgbm90IGEgY2hpcGlkLiBXZSBjYW4gZGV0ZWN0IFNv
QyB2ZXJzaW9uLiBUaGF0IGlzDQo+ID4gb25lIG9mIHRoZSBmdW5jdGlvbnMgcHJvdmlkZWQgYnkg
dGhpcyBJUC4NCj4gPg0KPiA+ID4gPiBBbHNvIHRoZSBzYW1lIElQIGJsb2NrIGlzIHByZXNlbnQg
b24gcnovdjJtYSBhcyB3ZWxsPw0KPiA+ID4gPg0KPiA+ID4gPiBTaGFsbCBJIHVzZSB0aGUgc2Ft
ZSBmaWxlIHJlbmVzYXMscnp2Mm0tc3lzLnlhbWwgZm9yIGJvdGgNCj4gPiA+ID4gcjlhMDlnMDEx
LXN5cyBhbmQNCj4gPiA+IHI5YTA5ZzA1NS1zeXM/DQo+IA0KPiBBcmUgdGhleSBzdWZmaWNpZW50
bHkgc2ltaWxhcj8gRS5nLiB3ZSBoYXZlIHJlbmVzYXMscnN0LnlhbWwgZm9yIHRoZSB2YXJpb3Vz
DQo+IFItQ2FyIHJlc2V0IGNvbnRyb2xsZXJzLCB3aGljaCBoYXZlIGRpZmZlcmVudCByZWdpc3Rl
ciBsYXlvdXRzLg0KDQpJIGhhdmUgYmVlbiB0b2xkIGJvdGggUlovVjJNIGFuZCBSWi9WMk1BIGFy
ZSBleGFjdGx5IHNhbWUsIGJ1dCBsYXRlciBkb2VzIG5vdCBoYXZlIElTUCBtb2R1bGUuDQoNCj4g
DQo+IElmIHRoZSBTb0MgdmVyc2lvbiByZWdpc3RlciBpcyBsb2NhdGVkIGF0IHRoZSBzYW1lIG9m
ZnNldCwgaXQgbWlnaHQgYmUNCj4gd29ydGh3aGlsZSB0byBhZGQgYSBmYW1pbHktc3BlY2lmaWMg
Y29tcGF0aWJsZSB2YWx1ZSwgdG9vLCBzbyB0aGUgc29jX2RldmljZQ0KPiBkcml2ZXIgZG9lc24n
dCBoYXZlIHRvIGNvbnRhaW4gYSBiaWcgbGlzdCB0byBtYXRjaCBhZ2FpbnN0Lg0KDQpUaGUgU29D
IHZlcnNpb24gcmVnaXN0ZXJzIGFyZSBsb2NhdGVkIGF0IHRoZSBzYW1lIG9mZnNldC4NCkJ1dCB0
aGVyZSBpcyBubyB3YXkgdG8gZGlzdGluZ3Vpc2ggYm90aCB0aGUgU29Dcy4NCg0KPiANCj4gPiA+
ID4+IEFueXdheSwgeW91IHdyb3RlIGluIGJpbmRpbmdzIGRlc2NyaXB0aW9uOiAicGVyZm9ybXMg
c3lzdGVtDQo+ID4gPiA+PiBjb250cm9sIiwgc28gd2hhdCBjYW4gSSBzYXk/DQo+ID4gPiA+DQo+
ID4gPiA+IFNZUyBmdW5jdGlvbmFsIGRlc2NyaXB0aW9uIGlzIGFzIGZvbGxvd3MuDQo+ID4gPiA+
DQo+ID4gPiA+IFRoZSBTWVMgY29udHJvbHMgdGhlIG92ZXJhbGwgY29uZmlndXJhdGlvbiBvZiB0
aGUgY2hpcCwgc3VjaCBhcw0KPiA+ID4NCj4gPiA+IEV4YWN0bHksIGl0IGNvbnRyb2xzLCBzbyBp
dCBpcyBhIGNvbnRyb2xsZXIuLi4gQW55d2F5LCBkbyBub3QNCj4gPiA+IGludHJvZHVjZSB5b3Vy
IG93biBuYW1lcywgYnV0IHVzZSBzb21ldGhpbmcgZ2VuZXJpYy4gVGhlcmUgaXMgbm8NCj4gPiA+
IHNpbmdsZSByZWZlcmVuY2Ugb2YgInN5c3RlbS1jb25maWd1cmF0aW9uIi4NCj4gPg0KPiA+IFRo
ZSBtYWluIGZ1bmN0aW9uYWxpdHkgb2YgdGhlIGNoaXAgaXMgQmFuayBhZGRyZXNzIGNvbmZpZ3Vy
YXRpb24sDQo+ID4NCj4gPiBCYW5rIEFkZHJlc3MgU3dpdGNoaW5nDQo+ID4NCj4gPiBUaGUgU1lT
IGhhcyBhIGJhbmsgc3dpdGNoaW5nIHJlZ2lzdGVyIHRvIGV4dGVuZCB0aGUgdHdvIGhpZ2hlci1v
cmRlcg0KPiA+IGJpdHMgb2YgdGhlIGFkZHJlc3NlcyBvZiB0aGUgZm9sbG93aW5nIElQIG1vZHVs
ZXMgd2hpY2ggaGF2ZSBvbmx5DQo+ID4gMzItYml0ICg0LUdCKSBhZGRyZXNzIHNwYWNlcy4gSXQg
bWFrZXMgNCBvciBtb3JlIEdieXRlcyBvZiB0aGUgYWRkcmVzcw0KPiBzcGFjZSBhY2Nlc3NpYmxl
IGJ5IHN3aXRjaGluZyB0aGUgYmFuayBhZGRyZXNzLg0KPiA+DQo+ID4gVGFyZ2V0IHVuaXQgMTog
RFJQLUFJLCBlTU1DLCBTREkwLzEsIEVUSEVSLCBQQ0llLCBVU0IsIEdSUCwgVkNEIFRhcmdldA0K
PiA+IHVuaXQgMjogRE1BQw0KPiA+DQo+ID4gVGhlIG90aGVyIGNvbnRyb2wgZnVuY3Rpb25hbGl0
aWVzIG1lbnRpb25lZCBpbiB0aGUgSVAgYXJlIHNpbXBsZSBvbmUuDQo+ID4NCj4gPiBBcyB5b3Ug
c2FpZCwgSXQgaXMgdW5pcXVlIElQLiBQcm9iYWJseSBpbiBmdXR1cmUgc29tZSBvdGhlciBTb0MN
Cj4gPiBtYW51ZmFjdHVyZXMgbWF5IGNvbWUgd2l0aCBzaW1pbGFyIElQIGZvciBzeXN0ZW0gY29u
ZmlndXJhdGlvbiBsaWtlIEJhbmsNCj4gc3dpdGNoaW5nLiBXaXRoIEJhbmsgc3dpdGNoaW5nIHdl
IGNhbiBzd2l0Y2ggZnJvbSAzMiBiaXQgLT4zNCBiaXQgYWRkcmVzc2VzLg0KPiANCj4gU291bmRz
IGxpa2UgYSBzeXN0ZW0tY29udHJvbGxlciB0byBtZSA7LSkgU28gdGhhdCBsb29rcyBsaWtlIHRo
ZSBtb3N0DQo+IGFwcHJvcHJpYXRlIGdlbmVyaWMgbmFtZS4NCg0KT0ssIHdpbGwgdXNlIG5vZGUg
bmFtZSBhcyAnc3lzdGVtLWNvbnRyb2xsZXJAYTNmMDMwMDAnIGFuZA0KTGFiZWwgbmFtZSBhcyAi
c3lzIiB0byBtYXRjaCB3aXRoIEhXIG1hbnVhbC4NCg0KQ2hlZXJzLA0KQmlqdQ0K
