Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAEC4AC03E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 14:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239586AbiBGNwC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 08:52:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381679AbiBGNlq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 08:41:46 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EE21C043181;
        Mon,  7 Feb 2022 05:41:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxrylBlrtCB/6dJ4MeTSRA8K6YCPnXvvPi5VuQevB0Rdc+Ge4QDcji4SGEUTQyw3ZhSQ8TebjLTS7OKxoVEZBqYkR6Bhp1yGqThEKqB+ol4sIxY8YliAJ9qy7EKjxaHqJ8++wAjMcvSq3ttpmBvf40Vi7y9ZGus/Os1pvlwYj7XdsvhaQPjEahdnRW4Kf3nZPhmjeZ2B62Htr5BQsQo1UBwCUiCDPE3lY1jyhPy9WwgQ90nzWrxuP1gF3xZlyytyDyZzPNDJgs3oVvM0pE9U+JvcWaGtqCmq5ALKAZC0DoKwFXgoZYA78UQ9+S1fVRRAp/zwHmOt5zreCPsAb164dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejKbYN8MzchJecmjryDvutoVZRhOAWBhaUUTiiYGpUY=;
 b=I5SEXAdvbUBlFFRvnMRw3kLzE34jNnLANGLHuuv+d8JsrsFhZAx7zNC0YEWzCanC7LkUkFZ6dYzL31tJo4V9KVzOzSne24Io0BXInz3baZgnUpOzjjWOHQA/so2jRT6Gahttc9LjoTfEgsjaEY5lvf5Cq4iw9HizQLZ5PqvYs52OQkXMORwimKaI+CrbmRMU1zclYR5+xvoPniavhMpANEvdAf7LXPex6J1lh+XyQV/CzRriaSgZrr5Bz4x8s3swfH6D7Jsufn1yrrkh9g+vqCWbFjhTj+0h9esOqDF/P4plZMzUsp7TSfU04s96jerbjo3BoWt2QWHPsq3zjiwsLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejKbYN8MzchJecmjryDvutoVZRhOAWBhaUUTiiYGpUY=;
 b=BMOqPoGpBsURncku3/OYshUJv+L7Nf9rR34JhMiKxKKjVMtVKVbzOC9P1CTLankXXsTpu72RDV+wP9lzZnbTYSOxbjB0rzdmw+s93V8o8Q30ilQY2G6kxq8yq4JM7HI69qYVQKKavd+qxVz9ANF5nDtLd+rz9yzcSW002Tb0aGc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB10250.jpnprd01.prod.outlook.com (2603:1096:604:1e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 13:41:42 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%8]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 13:41:42 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/3] dt-bindings: serial: renesas,scif: Document RZ/G2UL
 SoC
Thread-Topic: [PATCH 2/3] dt-bindings: serial: renesas,scif: Document RZ/G2UL
 SoC
Thread-Index: AQHYG4oPdeBXAMpKj0mHQp80LWTL3qyIFP2AgAAEXBA=
Date:   Mon, 7 Feb 2022 13:41:42 +0000
Message-ID: <OS0PR01MB59229987D1F32C8432D66212862C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220206184749.11532-1-biju.das.jz@bp.renesas.com>
 <20220206184749.11532-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdVPOjQLBZ+F6b7Wb4HoASxfM_9Cr6PPmeGmsArr=WnjqA@mail.gmail.com>
In-Reply-To: <CAMuHMdVPOjQLBZ+F6b7Wb4HoASxfM_9Cr6PPmeGmsArr=WnjqA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60755e8c-a030-4fc6-2bfa-08d9ea3f934f
x-ms-traffictypediagnostic: OS3PR01MB10250:EE_
x-microsoft-antispam-prvs: <OS3PR01MB102508FAA79693E0F439E94BA862C9@OS3PR01MB10250.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SLeIBtzHV3r4ZaIDXKj9xzGEh7nW8GyGSYrPippIi29j08lb8aCNIaptIsQWVgEMUrWYApcgKdwWp0mnz8MLXkz1QoEBnolyQ6l0BdYAI8+hLMr1YcvuE6iTnscC5X+sn+RcRYPRiz6hbK5PkoTzftPrww38oE+FS79SynOsOngSFkXHqsjsUvlabwGlZzH2ZHXmjOLtIt4b/rDvEA8dRU0SR8A/+7pCu2HwmGamgnMB+eI/kjByjoyOgdZeyZlv6r0/ADj0PXCVUqxWhlMl6h4YI4/vbvl8WlMZ/X3ALWYSwb3vjaWWMridJ7QxcjBz+gynVhAgqrFPEa2gkeklqUNg6a71QK7PeBonIDsrPfA5gxqvcwReWdNqbuvIHImgjfhX/watfUzEkLvFg1f8dzrBqNrlNLcRdg+VT/FKzi9fx1LnxWDV9DZ+9kI45+dOKUR3eg4p4kaWjZQJsGOzNwyXFtH1S2NgOkp5n4k7guS2bePyciuIgY/jQ5naC556n3GfRCObjtrwsVIGwEne/Pd1fSOrOF9fID2QWlq6kd1jhrft9kyTJhSJOpOyutZZVI06OqukKwcShVLRo6zLEc4URKI31Jqs8TNdoQXFrWhj+1k1M1Tsg8gcI3wJGaJwQWptdxRZDLpXE0gTX6kT2Q5zmrsEwe47LXgKi80M84jWOeKAna0suy0WOCbEC5fBdyfX237mgkZfoDVHO5G8ig==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(508600001)(26005)(7696005)(83380400001)(53546011)(9686003)(71200400001)(6506007)(186003)(5660300002)(38070700005)(2906002)(8936002)(86362001)(55016003)(6916009)(316002)(54906003)(33656002)(122000001)(8676002)(52536014)(76116006)(64756008)(4326008)(66476007)(66446008)(66946007)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1ZrR2IyeHhFQ29uUW15QVdWRTJOKzFkMTNLenlzNHZMVGNuWjNsVGRRaCsz?=
 =?utf-8?B?TDBMc2E0SWtkalRzMUx1d0Z1NkZjVnVxek9EZ2QyRExNRHNkT21mR2lhVlB4?=
 =?utf-8?B?M20rcHZyc3hucmlDbkRxRFNHUElRS09rcTl0ek1LbGhRRW9PRkNUK3BvTEhw?=
 =?utf-8?B?TzJGN2lCS0ZRb0c3VFkvdW12bnFlOHpXRXVvby9Dbm9pRDNmYnFqTnZrcGly?=
 =?utf-8?B?RzZjcnY1VmVxTzRERkNUSHcyditmMUdNZVgrZmxtcHpRd3hxVUtXTDVkbjk5?=
 =?utf-8?B?d3FhZmpUdmtZclE1R2xlSnlIRXJJWHNGTmVMNkdheXNCTFhFOFJETENpUWtl?=
 =?utf-8?B?dU1QWGVqT2ZocVlVb25Sc05KM1JXZU8yRlM5QVZteGdTN3ZwaTgybGxlbWIz?=
 =?utf-8?B?YWtTa1laYjRvTk9uYVIwNS9tNTNmSU11Y0Mrd0lwMyt6dmQ3Qi9zT3h2V0NO?=
 =?utf-8?B?cjVzV09YYW9yZ2lIRTU2a3ZKZUxyZVV1a010K1VpNmdRT2QxK3JobDNQNWw0?=
 =?utf-8?B?Ty92V2pHQWNVMnpHSlFJWUJQY2JTcUZxUkExaHUvdzZDVXJ6WlpXSW9YRzY4?=
 =?utf-8?B?RzNONWlXL2pkcmEzUlY3aDNUV2FJNUxNN1htYjd6R0RWeUlTTE1WUGVOT1RE?=
 =?utf-8?B?YjVVbXZjTDQzZWFQZUFLSzFIK0NzdDBNSFFqRURnZGRYU0VNNUM3Zktkc24z?=
 =?utf-8?B?Z0pucThpUm1xOXB1ZjNuRHNFOHZsSnlIdjNjS202eGtqeDB2TFVFZUdmaTRw?=
 =?utf-8?B?WTROUEdidGErSEcvU1I5c1hGNWlsUEJ6STArNmNRaGI4MmhuMlpiaVpsVXNK?=
 =?utf-8?B?YUpNZ3B4MXE0LzIwZXZxYnFwaW9hc2Nrejl2dVJVL3kyb1ZUQ1ZlTEV3OTRr?=
 =?utf-8?B?UUNBOFVrMGZ3K0RqZnVIWjREZzBhU3hrSWN2aG54U1BIdFB0UnFMY1hhbmIx?=
 =?utf-8?B?OFQwQSt6NFEvVDRSMXdEL0ZqWFdZdW1CSWNoVDhJM0JKcjZWUHo2Syt4YTdU?=
 =?utf-8?B?cHpiSU1GanJGU2g1d0J6TnR6K1FkdGJ6N0U1ak5jQ3pxMm94cmZqNDdlSU5H?=
 =?utf-8?B?Q2d1bG9Gc2tMeFdIcmJWcWZRYVZ4WmplcEh6ZXZhQWFVYjRKdFQ3MEtkRFlk?=
 =?utf-8?B?TnU0SWRtT0t0bUlCVjI2Zzl1WGh0VkNoYTZONEJBMGMrTlNVUm9xOE1DT29O?=
 =?utf-8?B?Qk9WdWhyWmtWUkJLMmxGUTNxTjUrWTl5UU94NytXbG5YdnkwRnB6Q1dyS2R6?=
 =?utf-8?B?Z2IrR2IrSWxjcHZVRHdRalBsNHRKRFV4Q2lmdjhERExWU2J5YmFJV2lrcGFm?=
 =?utf-8?B?dUhpQjlpYWFZOFdTQlJsd0gvSTRUb3BCc2ozbHhFRmRaa0M0U1JlVGJ0RUdv?=
 =?utf-8?B?aHdOWUJhdmRyQ3UvSkIzTXNUTGh3YjkrL3F2Y3BCcFhoSUZBRWFzRVlmaWMx?=
 =?utf-8?B?RTZKRGdNQUhWclVTakxxd3ZVL1NJT2VndEVKVTdoLzBnSWk2UEYyNmI1ZUY2?=
 =?utf-8?B?eXV6QnVzNUVLYjUweXVCY1JOSG5JSXU1NHZvWE93REpzNXlmV3AzeU5YQ1Jr?=
 =?utf-8?B?MzV1UnBzcSszOGFRelBtMmZ4R041eFU2R1p3OXIvY0lJZUwyZFJiRW5mcWtI?=
 =?utf-8?B?YnhhNmQwdHFnTmRRQk81LzVEK3JyOTFneUo2eEVXM3Z5VVBhbXc2QTJ4VUl4?=
 =?utf-8?B?YWxHVHFqYk1IRHI4OWp6ZXN5VmF2R0xNWi92V2dVdkVJQzVUS01KWkpkOWpY?=
 =?utf-8?B?Q2l1UVc5Um5GR1ZOcnlLclBMTzB1VVdSa20rajFnQUJCU0hKVDhnd29hM3FR?=
 =?utf-8?B?SnZmY0o1eWo4N0VMc05yZkIxbnhoaE9XazBJNlFsV2t4eFN0M1YxS2w2TUIz?=
 =?utf-8?B?NnFlUUxKaVpsd0tVUGVoRXFkM2lTaHVwR2JsS2VUdExZS1dHc1NHLzdDN2lH?=
 =?utf-8?B?NnJEeTFzTjR2OE1HZkVjQVdDaUJMZ3pKYzRYQ1hlMjJub2FZbzh3NFpQSTZM?=
 =?utf-8?B?UGtINzc0Q3lMVnJ3UDlCZXl5RWU3OXBKbCtDZWlLOWRXS3lKdE5ucXFjUUk0?=
 =?utf-8?B?cXJRYlU5RllkMllQT2tNaFFMeGZDV29tZEVtb09qU0pQUXNranlObHVPUnNI?=
 =?utf-8?B?QlZwdXI4WnFnUUdQbVNWTVhaQzFWanFNQUVjaVJRVXovQ3hVeG5SSHBmTURN?=
 =?utf-8?B?QkJvRUZyUDVJeDhDYTEzMFJqRjFNR0lvbW9TNHkxdTRZOUdmZ25hM2hnS2tD?=
 =?utf-8?B?YkJPaXhEZjJubnZ0RjVCbzQzOXB3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60755e8c-a030-4fc6-2bfa-08d9ea3f934f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 13:41:42.3976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DJzEFf26bpArsVfID2+wbYtljdcZ7/Q1usD65FZfvR3fz8UJPYAVMKhBLidunkfxiW48z/0GKjc2lTQxwBIJIxvW0VcIoUIECDp+nnFX/G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10250
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
UEFUQ0ggMi8zXSBkdC1iaW5kaW5nczogc2VyaWFsOiByZW5lc2FzLHNjaWY6IERvY3VtZW50DQo+
IFJaL0cyVUwgU29DDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gU3VuLCBGZWIgNiwgMjAyMiBh
dCA3OjQ4IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6
DQo+ID4gQWRkIFNDSUYgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBSZW5lc2FzIFJaL0cyVUwg
U29DLiBTQ0lGIGJsb2NrIG9uDQo+ID4gUlovRzJVTCBpcyBpZGVudGljYWwgdG8gb25lIGZvdW5k
IG9uIHRoZSBSWi9HMkwgU29DLiBObyBkcml2ZXIgY2hhbmdlcw0KPiA+IGFyZSByZXF1aXJlZCBh
cyBSWi9HMkwgY29tcGF0aWJsZSBzdHJpbmcgInJlbmVzYXMsc2NpZi1yOWEwN2cwNDQiIHdpbGwN
Cj4gPiBiZSB1c2VkIGFzIGEgZmFsbGJhY2suDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIg
cGF0Y2ghDQo+IA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
ZXJpYWwvcmVuZXNhcyxzY2lmLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc2VyaWFsL3JlbmVzYXMsc2NpZi55YW1sDQo+ID4gQEAgLTc2LDggKzc2LDkg
QEAgcHJvcGVydGllczoNCj4gPg0KPiA+ICAgICAgICAtIGl0ZW1zOg0KPiA+ICAgICAgICAgICAg
LSBlbnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0gcmVuZXNhcyxzY2lmLXI5YTA3ZzA0MyAgICAg
ICMgUlovRzJVTA0KPiA+ICAgICAgICAgICAgICAgIC0gcmVuZXNhcyxzY2lmLXI5YTA3ZzA1NCAg
ICAgICMgUlovVjJMDQo+ID4gLSAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHNjaWYtcjlhMDdn
MDQ0ICAgIyBSWi9HMntMLExDfSBmYWxsYmFjayBmb3INCj4gUlovVjJMDQo+ID4gKyAgICAgICAg
ICAtIGNvbnN0OiByZW5lc2FzLHNjaWYtcjlhMDdnMDQ0ICAgIyBSWi9HMntMLExDfSBmYWxsYmFj
ayBmb3INCj4gUlove0cyVUwsVjJMfQ0KPiANCj4gVG8gYXZvaWQgaGF2aW5nIHRvIHVwZGF0ZSB0
aGlzIGNvbW1lbnQgb3ZlciBhbmQgb3ZlciBhZ2FpbiwgcGVyaGFwcyB0aGUNCj4gImZvciAuLi4i
IHNob3VsZCBiZSBkcm9wcGVkPw0KDQpBZ3JlZWQsIFdpbGwgZHJvcCAiZm9yIC4uLiIgaW4gbmV4
dCB2ZXJzaW9uLg0KDQpSZWdhcmRzLA0KQmlqdQ0KDQo+IA0KPiBUaGUgcmVzdCBsb29rcyBnb29k
IHRvIG1lLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhr
Lm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRo
YXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMN
Cg==
