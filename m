Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39966B0BFE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 15:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbjCHO53 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 09:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbjCHO5R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 09:57:17 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC4E98E98;
        Wed,  8 Mar 2023 06:57:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emy76+jppOY+Mfc3c0AA4AnClJe8R9leOgANg6cA5ZZnOe7kmFg1UCuoMI7vnwYuEegLvdPDafgXWkoEG/6FcUmplkx1TrVxxnVRGQN3bcNYXryKg9yBI87QgANwnfYyKy4eUqP5Bc/heY0XnyNpLvnMkB/NNVOr4sllGb0HJThmFd8i+Yx+BZ60YuZV/6h960zlclOPW66K16AY/iQbV0qQ/MHRlDLINcdTM1cowwTiGQJyrn1+D9XS1OrP9iWBrIaIPVOsA0dHpvWPJy6p4xn/KKKsSTFy4KS/DtArWPV8AkcBzsjyxCIFBp8g2SL6aO1imnvPnqe51jqxMtiTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vBd6UYJJceWcsz7P1lVGhR4eMbjyo7hIGM4OTqPmys=;
 b=Z3fc39vF5zCEgH1u6B5HQQo9PdXoB029HtfujCQ2sQdOR8/Etg/zvAyoWdzszF2znF1BSv6hu3A1hvDu31XhhfTg0iWUJ1gZ7/AGN+h9p8mYzMGKtRKWQ7qxMTWt88c9NY5v9YS6gaXcJ41891M53VIfucTmS2vH05fMUe0MQAWCjK7jH1/RPntY8lYk9Q/si1s8OQvU2kzcE4a+KzM4BqqqV36KZrpvjRwYTsvw3iOqoi6wSZnIOUHmLZUGVdmoA0BnzHueEWdFp1W2yHTP8gNIx0gb0Msf/qwvp5/iMI2N0EctiwYEhf4ZijBZ32bsJ4fhCqEn+3AKmvYaIbQHJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vBd6UYJJceWcsz7P1lVGhR4eMbjyo7hIGM4OTqPmys=;
 b=o7bp77mDBJA0iPIsS2Cd67NZxZWhdUl41WU0dY1TT1qNsC/gIh4wMs44wWnR7/WYWZ4BZY1Nxl7O05JOw+ESNdDuV30J8todz5LvQRguQscUY1lxuqeaUn/X3Hx9NPx7WIJboGO7NwERggcK2mP/ecfBlSrYxRCeg182ZNKe38E=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB7944.jpnprd01.prod.outlook.com (2603:1096:400:11d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 14:57:08 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.016; Wed, 8 Mar 2023
 14:57:08 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Topic: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Index: AQHZRS0aT95BTvtLwUKgslaMkC+eWK7at0aAgBZQ9vCAAAgpAIAAALjw
Date:   Wed, 8 Mar 2023 14:57:08 +0000
Message-ID: <OS0PR01MB592215A1822E31CF403FC82B86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com>
 <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
 <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXRym-ROY73KYJmt7RhmZC0a+Cb5HTdrhdDy4=huSuOzw@mail.gmail.com>
In-Reply-To: <CAMuHMdXRym-ROY73KYJmt7RhmZC0a+Cb5HTdrhdDy4=huSuOzw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB7944:EE_
x-ms-office365-filtering-correlation-id: ab86dd0d-e0cf-4db0-2da8-08db1fe563d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8OcIdqh/doA2fu6wm+8622EzHdXWtARCSymfPCHyxPq0bcHrNJjN+ueBEMQB4XL6/je6rK7sKpDRI/xiQx1r7CCttRFkGq/QIGCRmBJYioOC6ulrlJLnMebHYatkZ882KzEiEegFMrD3tqFVjh+bfnO4ooqpoqN1d56VY2QkB8JGEMNRhRZs+5HWGL6VRc0RH7T/GRRdUmrIjOz4PzBF6ramwUvb4T7X8yIskDstbuWeEUN5HxW/N6Kmx8HjnIffS9YjGrdTXw2vhzDbBq8M94ppewVZCS9NkYVPKYZiJYqhJUtW755q3BWCCF82aPL1o93PVoOS+Sxm4KaZ5BU6uWyocYFr/G6WiKREEpnCwiOa+UGBDCo4o+ZNr9tFYmw6Gt/EM8dVpEPO2GyELj59Xd7GbHpEy25ZgRBuQsX+ZtWC8JSk2rS4vqPrZR9zRnlWVZ3YZL5lk1K7BDVGQt1Nqdn/RcZ7sGdKs+HCm+fKS0xxjXK2U/OxNclEmJOoPlZ7nk5TC0kecBALqrSwKp689cFzH0/K/TFGDlxBh3HW8sJ5/mGaVPP7mQXf5vyqcaiJw1dZU0EfA0DKnrnnPDi/jVbV9/5uatgOkmUrFdnDznVISayE2VieaekZRHg6oiWFQkZqwXyQk0Tc+sGF4RDw201ZmWUZKuV/csk7Zd2tNgBoEJzHx2+RXWyErRzA5BK6rcjJtWiHfJBfoMstxJLTkQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199018)(33656002)(83380400001)(107886003)(9686003)(41300700001)(53546011)(26005)(6506007)(6916009)(7696005)(8936002)(86362001)(66446008)(66556008)(64756008)(66946007)(66476007)(8676002)(52536014)(4326008)(76116006)(7416002)(5660300002)(71200400001)(2906002)(316002)(38070700005)(38100700002)(55016003)(186003)(478600001)(54906003)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWE4WFlPS2JNdTFxejl2bm9LS1JHOGNpQmtWdXBobkcvS2V0dnVRN0Q0eVlB?=
 =?utf-8?B?dzhxMWhwbzNmMjFBZ2pwMWVKODA5aE9wa0t6T0w1MDNLaDdsVWVxTzdpQ3cr?=
 =?utf-8?B?YkFzN01CYkF1M3VMQzhuRk1pdlJKeFhZT2pwOVJ2TGcvTTIrUVJxQ3NYajJ6?=
 =?utf-8?B?dE9taERYOTZwNU5OWm85dC9qZUZFSG5aajFxVURBaWJMU0M2RjQySXZQNXFk?=
 =?utf-8?B?Mks0bkJCWVlkQlh1cE9oTnBENDRSNzhiRzZ6b21zRUNWYm9zZHUySFo4bUZZ?=
 =?utf-8?B?YzN2di9KZEZXWVZ3cnZ0NzYrdm9BTkk2NXR2L0Rva1NnenN0T1kvMStBTWN5?=
 =?utf-8?B?aGZ3YXAwa1BnN0pBb1A5UTlVNXNXTHpKSk5hZ1JaNS9tNkw2M3RuRzExT2Vj?=
 =?utf-8?B?L3pvUjh0T1ROTGx6Y01DTUpYSUcwNzBkNzU3QlZVOUc3Qk1tNGFKM1RyNStJ?=
 =?utf-8?B?bWo4enFNbml4MXJXciswbUhLTnhDenUvQ1BKUGZRdEpCbzlCcGlvZEl0ZFNP?=
 =?utf-8?B?MVNpWjBoOWdaaG1tYWhoOVNwTVRTaXI4Tk5rQm85S1ZMUTVzS2Q3MDhiMmpt?=
 =?utf-8?B?TEpTb2RReVJWazlTdlhWaXVsQXN6TnMvSndhTUEwaWRPVnp0c3oxc0ZvYkJI?=
 =?utf-8?B?TzZtVDhpUXQ4Wm5qSGtsdzFNNDRPQndwSERIdGQ0dVpYL1llYVhNU1pxSXZS?=
 =?utf-8?B?Nm5JbEJoUTBjbjltdzFCSDhyNHFtUjhleTJ5MzlxOGRQUzh3Zm1mcW9aUE9F?=
 =?utf-8?B?eWVLTDJLZ1VFU2xET2QwQlI3eXBxeUZvVGQ3OGdhbGRnMGN1OXlxK0pKWm5y?=
 =?utf-8?B?emVIS1NCUTUyZEp5allNMnhBUC9OYVF5VzRoNU0vSUN5N3FmNzgrdkVQcis5?=
 =?utf-8?B?NkNzdGxVNFV4YWxOdGp0bGtzb0R3UXJLVjhSbGRxeGczT2RxMmx4WDNhVkdS?=
 =?utf-8?B?VVRwS0ZYMitEdWJSRmVoMGo5dzVkTU04enFzYjBFMFY1cXFPL2hDb0tuOEFF?=
 =?utf-8?B?MkdINTRyRDhVSE9QQzZkTHhXTStCeTBReXdwbFhhYm94Z0FFY2RqdC8yK0Qv?=
 =?utf-8?B?VEgyWVFSV0pyUkJFN0J5S0dUb0gwNXowZ1ZjZ0lYN2dlbGNVTUw3V2tPMmJF?=
 =?utf-8?B?WXlCR0xFdkhUTDBScjdUWWRMK0VsQ1U3OTYrc3BEcmJ5NlpsVkwrNGtzakNP?=
 =?utf-8?B?YVIzekNBSmF3VEtQRkJnc1VHSlRmcXBOMCt0ZUQrT3ZPb1FEYTczVGpLRGNy?=
 =?utf-8?B?U3JIeG5GVm1yNWRmM0NhWVJ1T1EzbEltNEMvdHh0cjRGWFhmN294MkJSeXV3?=
 =?utf-8?B?SldyeUVyV2M5TjZDVEJhcTlFbGgra2U1SUhWb2FrUzF5dU5sQlBiRm1YTTZO?=
 =?utf-8?B?YjNLVnFJcnlHdnk0elBsanhLeGg4V2ZmUGRCL0cwZ0NTT2VFd0lKNlNQNFlm?=
 =?utf-8?B?NkVsNjloNkRxVkE2cnNHMVFPNnErR1JHdUN3czdXaGNUQ0QybURqOURxRHl0?=
 =?utf-8?B?K1pmbS9mY3ZNK2h1dy9BNHJ3RmVGSGhwdS8xMXZQOVFFak85RUlQM1lEcWxQ?=
 =?utf-8?B?ZmxzNy9ZL1dHK05vVUJhNllxU3pHMjY5TlcrRVlkUmxXWm1ISDVGdUFXSjdT?=
 =?utf-8?B?YVJpaVFUdkdvY3ZzdWp0VkZGVUx0eWJaWUk2ZnE2NEdGMGt6c1Z6eDI5ZHhD?=
 =?utf-8?B?UHJOc2R1QzQwaEsyY0swQ20vbmVnQXlhVHpMLzhBbnNrRDQwdjJ2d3NpMHQ1?=
 =?utf-8?B?bVNkekhIT093bXZZWjM3MXBXZ29oTEplWEloZDZ3cStIekd6d1dFdFU4YWxa?=
 =?utf-8?B?RWFXQ0ZVaUNDQ1lSbmIxY0pmY1BOTTZDQ2pFZHdmOHVQdUpEU0x6Q1Rnb2JH?=
 =?utf-8?B?Y2JGK2FoL3VsNnZ6RXAyR0NlWmdyU2llNGZiQjlSZkEweHdlRjRpdHVUTU5U?=
 =?utf-8?B?WG15VDhLNllScTdEaUJsMUQwTU1XSHB1Rm9mVDdyeS9vVVFjWkJkOEVUWWJo?=
 =?utf-8?B?dXNicTFXcGVFTW1QeW56YlhqNU8vLzViUUZxMENDZlJaR2N0dk1FWkUydVpw?=
 =?utf-8?B?WkVMNkFtMzVkYlJOc3p5NC9RTHhYUTluZ2EzdGdnaWtlbFN4aExQckIyOHpx?=
 =?utf-8?Q?k90YLhg5zHkLIP9tN77yqEK73?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab86dd0d-e0cf-4db0-2da8-08db1fe563d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 14:57:08.5344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oTTY00NavL++0mDs0RkVMQc5qT+2yY0LtLugoHHl8LV/moqfCefnmaQuSKkf069rREBGqBAnFHCM2IDVhV6MvTWuIuIoZqCzU2bjTnfUmz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7944
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggUkZDIDEvM10gZHQtYmluZGluZ3M6IGNsb2NrOiBBZGQgUmVuZXNhcyB2ZXJzYTMgY2xv
Y2sNCj4gZ2VuZXJhdG9yIGJpbmRpbmdzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBN
YXIgOCwgMjAyMyBhdCAzOjM54oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiA+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4gT24NCj4gPiA+IDIwLzAyLzIwMjMgMTQ6MTMsIEJpanUgRGFz
IHdyb3RlOg0KPiA+ID4gPiBEb2N1bWVudCBSZW5lc2FzIHZlcnNhMyBjbG9jayBnZW5lcmF0b3Io
NVAzNTAyMykgYmluZGluZ3MuDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSA1UDM1MDIzIGlzIGEgVmVy
c2FDbG9jayBwcm9ncmFtbWFibGUgY2xvY2sgZ2VuZXJhdG9yIGFuZCBpcw0KPiA+ID4gPiBkZXNp
Z25lZCBmb3IgbG93LXBvd2VyLCBjb25zdW1lciwgYW5kIGhpZ2gtcGVyZm9ybWFuY2UgUENJIEV4
cHJlc3MNCj4gPiA+ID4gYXBwbGljYXRpb25zLiBUaGUgNVAzNTAyMyBkZXZpY2UgaXMgYSB0aHJl
ZSBQTEwgYXJjaGl0ZWN0dXJlDQo+ID4gPiA+IGRlc2lnbiwgYW5kIGVhY2ggUExMIGlzIGluZGl2
aWR1YWxseSBwcm9ncmFtbWFibGUgYW5kIGFsbG93aW5nIGZvcg0KPiA+ID4gPiB1cCB0byA2IHVu
aXF1ZSBmcmVxdWVuY3kgb3V0cHV0cy4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gPiA+ID4gLS0tIC9k
ZXYvbnVsbA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2xvY2svcmVuZXNhcyx2ZXJzYWNsb2NrMy4NCj4gPiA+ID4gKysrIHlhbWwNCj4gDQo+ID4gPiA+
ICsgIGNsb2NrLW5hbWVzOg0KPiA+ID4gPiArICAgIG9uZU9mOg0KPiA+ID4gPiArICAgICAgLSBp
dGVtczoNCj4gPiA+ID4gKyAgICAgICAgICAtIGNvbnN0OiB4MQ0KPiA+ID4gPiArICAgICAgLSBp
dGVtczoNCj4gPiA+ID4gKyAgICAgICAgICAtIGNvbnN0OiBjbGtpbg0KPiA+ID4NCj4gPiA+IFRo
aXMgc2hvdWxkIGJlIHNwZWNpZmljLCBub3Qgb25lIG9yIGFub3RoZXIuIFdoeSBkbyB5b3UgaGF2
ZSB0d28NCj4gPiA+IGVudGlyZWx5IGRpZmZlcmVudCBjbG9jayBpbnB1dHM/DQo+ID4NCj4gPiBS
ZWZlcmVuY2UgaW5wdXQgY2FuIGJlIENyeXN0YWwgb3NjaWxsYXRvciBpbnRlcmZhY2UgaW5wdXQo
eDEpIG9yDQo+ID4gZGlmZmVyZW50aWFsIGNsb2NrIGlucHV0IHBpbihjbGtpbikNCj4gDQo+IEkg
YmVsaWV2ZSB0aGF0J3MgcHVyZWx5IGEgaGFyZHdhcmUgZmVhdHVyZSwgd2hpY2ggZG9lcyBub3Qg
bmVlZCBhbnkgc29mdHdhcmUNCj4gY29uZmlndXJhdGlvbj8NCj4gSS5lLiBsb2dpY2FsbHksIHRo
ZXJlJ3MganVzdCBhIHNpbmdsZSBjbG9jayBpbnB1dCwgaS5lLiBubyBuZWVkIGZvciBjbG9jay0N
Cj4gbmFtZXMuDQoNCk9LLiBBZ3JlZWQuIFdpbGwgcmVtb3ZlIGNsb2NrLW5hbWVzLg0KDQpDaGVl
cnMsDQpCaWp1DQo=
