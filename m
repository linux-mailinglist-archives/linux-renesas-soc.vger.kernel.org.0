Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03C867484A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jul 2023 15:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbjGENHA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jul 2023 09:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbjGENGz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 09:06:55 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2105.outbound.protection.outlook.com [40.107.113.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF16E12A;
        Wed,  5 Jul 2023 06:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1kG7k8MzYvSFbMUsLitzi4RpIOzS4h1d33e4hg1wmUNGJ7dpznaxHQGX9u5NrDtPyhdMj08csXBlwLRPsfj4cO6kX4EghniHayh31X99Na5Tv6p9JKHePhVyOJb5AG/t9shi7Sy7jiGTrnaHdryRAXTbLwNIPYmNP8tL+wRsuPXrEbYumn7i1MFk311BI14kASqhbFCTr2u8mgPJrobxsrQ0aZQLvkUg6dCU7Y5ShVAga+deUK6hLFHluUYqQuUsT6eMpcg9L1IdwyUcLYPiqdMxHGzKBPq4CUaAD6qEQx9MCkDcXslIggZuqkbn8Cro9poprigFg4FMrwHpyM3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZI5rYjpRn6uMomZS7uJw0XKRpRC3JWveXY+yLLETTo=;
 b=jhlt2ZJ1Mcg8Q9WbqBgCfLshVINZh2Mk58wUgSALnzu41pTB77VhF7bnssckxHDMadBDR4V0Mhr2INl7uXq9P1HHCGYfSehjm/bT9I6L4AQENyBGAuJf7d7sR76dHTwo1gfsI+EhlZnjnUnqP7flDJt4DsTVLIY6WmVNFQevDHvQ5X1oIqVkQ00szYwawp2c+egbDoroCyO+Ad7bJ4TyzyX4kA0id+Br0cqBYVJZ/RFXREkkRVW30GZBwPN+E08IJhSzwBXqNtYcpqpRXDkdBkedu2lUEciAaDYbIbzINKlpx6hwcukomgkmubAV31tYNjBzYxQ2n9sBb/lSTfwuXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZI5rYjpRn6uMomZS7uJw0XKRpRC3JWveXY+yLLETTo=;
 b=kOAHweVv21cSuiH8gu5oB8APxqNTVp55MygQWag6HybAD1zs/XtpYjGNNCCC2U060iZnK8lfW01OLvdOV9SI3k0M3RL2OXXVlvcJvuT5EJ6mxsIQWj7sO1xJ1GTgErhGjdUoxeAGUa/BFKe5QWXW4DGG34iaL8KgomAwECV3iTo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYTPR01MB10976.jpnprd01.prod.outlook.com (2603:1096:400:39c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:06:49 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 13:06:49 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r9a07g0{4,5}4: Add support for
 enabling MTU3
Thread-Topic: [PATCH] arm64: dts: renesas: r9a07g0{4,5}4: Add support for
 enabling MTU3
Thread-Index: AQHZrbJpKcI5SjSCoky47Ik5e/fUv6+rHBuAgAAFWmA=
Date:   Wed, 5 Jul 2023 13:06:49 +0000
Message-ID: <OS0PR01MB592220826E0102C41FD4CD2C862FA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230703132929.356009-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWHKR77MbhTcD6xJw42OXCF_DC3P0VNdXJqFXG5dZhQ+Q@mail.gmail.com>
In-Reply-To: <CAMuHMdWHKR77MbhTcD6xJw42OXCF_DC3P0VNdXJqFXG5dZhQ+Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYTPR01MB10976:EE_
x-ms-office365-filtering-correlation-id: 65e4ffd7-3786-4f6e-5159-08db7d58b172
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tALlaKInexCGgvadZx6fugvXz7Y+cu9K+liehgX/+8zyE4t4t+CzSCngkIcbqjKH6484WJHqqDgCbXgx2voYs5T4b4XgYsvaL7Y7D/njulrN572EosF9in/NrKV+qYuEAN6+TN26pNn7XoWHA0OG1rPIza2h+Gx4w1Nfp6sfd4vWtHHGF8PM00jHNGmd1C14mZC9yq/ovroYZEkbIP8NJjxD4nN5hoTzMpDvu/OkcIO9VTUy2jOEvsu0mGTqeQJDbjzxicXWAY1r6qIY6yJlbPxPCsh3LB1q+4+vRkENJ/WfWRMftXQd+lk3X/oEzpIjGjP3ex9HABcmcrZblosDae3zJVW9LmK+n24BQVFXpOINFXI1h2uRagDvI2h7rbyD3ksF3ldo0MHaB24FehffFezRJkdvb/HueSrJ564gJaQqo/2Ful+nRsYUrGQJJpduWOpp9mOpYeSIgZQqWVlGxTDqVlG6z/QZ4+QgZOX62Oix1bUWsrM0yXw+BXz3egWu9tWTxBgkvyeyFsfgjk6ppXzmqhUOoUTaPuysnc48PNIizhv9bQsBTjOJFlbBwPtW1ZS/MTpGBJqQPFisj5QmHZxMreDuFo6PR0xdlYokoKIusI2LvGw7ef9wYqe0L04q
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(76116006)(38100700002)(66476007)(66446008)(66556008)(4326008)(64756008)(6916009)(66946007)(122000001)(55016003)(186003)(86362001)(33656002)(71200400001)(7696005)(38070700005)(9686003)(26005)(53546011)(6506007)(478600001)(54906003)(107886003)(8936002)(8676002)(5660300002)(52536014)(2906002)(41300700001)(316002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qnlwdjh6c2lWSjBIVnd0NzlLUFdMQjF3NkZsYTlIcTIzZWE0NlVSUkdXeUdM?=
 =?utf-8?B?RVV0UWVwdS90UjVHT0NDYThIU0Q5eTR3NEJadlJZbS90WUJMdGgzekNpQ3c3?=
 =?utf-8?B?Z1hQbjJpczJ1V2RIUXZjSDhaRzJESCtnakhldFVvS1NFbFNjTFhnendvMzdS?=
 =?utf-8?B?RGVxK2hjRjhOTlBkZ3E3VkZyQmtTZmZLT3FmbW80NERBYXRJQkx2R3ozRHlI?=
 =?utf-8?B?QzYwcE8yZHZGekg3R3VOWjFYcnhydmNEMU5GbXRBZitzREZ1c1EyTU5PQ1Jt?=
 =?utf-8?B?bVFIMFpSaHBnZWc3NWYwM25aaXdoZWh6dFZ0MEx6dmpneXdHWWNWV0xWVTFN?=
 =?utf-8?B?dVdodXU3aVlxTXNkNEZJK0pwcFI1Z3k5NW0zeERRNEdxdUIyZ1U1Yi9vLy8w?=
 =?utf-8?B?aFF0TlVWRjdZMVlNUmN0ZldiaUlTZXk4dUh0RVJqbTFwbzhiR21Qc01RQ1ZR?=
 =?utf-8?B?THJzd2pZR2EwempEWndaMkFzMWorSWx5ZldGcU9tZ3JCdDl5VVhqWE5YY3dz?=
 =?utf-8?B?Zk5FNWhvUWJITTBVTWV5Uy8yOTM3Y1B4RWNheGE4NUl2Q2J4UEp3YzR4N0Nv?=
 =?utf-8?B?bGlISGs1V080WUxIdi9VZmVtNE9YaUx4bVBJQm5ic0FHcnZyTmFFSSs1emww?=
 =?utf-8?B?dm5BYmsxQjhLYmxickEzTGFvdnRqTGlyOWhLOTdTUVc2UHpFYjdZS1JKWjZr?=
 =?utf-8?B?eGZabitBTEpSL21vU1B1elJjZEFpNTd3L2tmZlFWTUFxUjFpMDU4VGl2a1c2?=
 =?utf-8?B?cnBkMEZvQ1hXVTVvQ2tKdk0vK0pkaUhMbGNlOFlxNCtaNGRjdVBrTUdqRVBX?=
 =?utf-8?B?THNZMmJMZG9xYkRCdGphSldIUDYyU0ZodWVFUXBEM3l1cGdKVVloZU1QMGIv?=
 =?utf-8?B?cUlCazZONjBubTY1dzM4dWxvUUJrTXU5bE5jUFpKeXFTK1JmME5OeWpkSHBo?=
 =?utf-8?B?bFJnMWpoZHZwSzVla1NTTlZ3bnRsb0oxMGhveFlGTVdUb0YxMDVTWFZaazh6?=
 =?utf-8?B?SnAzVEtuODY3Nk1QdXBEN1dianlEQ1pNaEk5SkV1MEZtQW11OEtHc1hSUElH?=
 =?utf-8?B?Y0RhR2lmRWVxNVlMWUhMNjRoeGJnQjNrRXFwL2NtT0RJMElBV3A5eFR4TzlZ?=
 =?utf-8?B?NVlOd3l2eWRncWd3cUhyUWpuR2ZtYndodVdvVi9scHhTakVvR3JkNTFseE9m?=
 =?utf-8?B?bW9IYkxmcGF0MTVlbzdZSGpFeW1XUEVVNlErVUg1VjZ4VHM0SUwvQ2NheWxU?=
 =?utf-8?B?SEpJdUdXTGt3U2lvcjdGRTF1dFdGZFJkempxSlhCSnJZUWNmK1BDZXRYQ3Nu?=
 =?utf-8?B?Qmh2bk9wODBRZVJHWktrVG41b3JITGtDMjVqU0hCZW9GMnEyVlEwQndra1BL?=
 =?utf-8?B?aFcyWXNqNVZDNEpyd3NQUTQ4emdzdzhtaVJ6czBJcmlzR05iSi9sVWVFYUdG?=
 =?utf-8?B?MVZXVnFIKzljYzNFRkxBSjRKWGZLQkFUdGI0Nlk3cUVuWlNIUmx0NmVSWGd3?=
 =?utf-8?B?cjZ5eFlxVUtrRmZ2Y0tmdUR4ZEU0ais4TUZSMVpNOEw3d0xXNThBWG1kdnFq?=
 =?utf-8?B?NzNDM2JpVHlVeUthKzRFbjV1QzVha0lrdlRVNkE1YVF6eTNidlpsbmp0OUt0?=
 =?utf-8?B?c0VDY0lkak5Wbnd6QTJldmtTYU1ZQmFSem5QNmpCT3N4U0lFSW0xK0tKd1hy?=
 =?utf-8?B?QVJJeTREd20rOUVHQ1JsdzVsZ1NKTTBaTHVmOFlKaVFWb00weXJBaldicHhC?=
 =?utf-8?B?czlnZ29GZjhMV09HL3ozcmZRbDNMVmp5T1FjbzI4K2I5UlFTaVl4YzE4WDRw?=
 =?utf-8?B?alUwV1RoVEJjS1Q4NysyNmhiUTdCVWRUTzZoa294U2kvT25ycWNWVmk2TTdM?=
 =?utf-8?B?ek9aM0ozSGpxalNxS0ZzelVFQTd6aW1STDh3VWdveHVES2U0MUVaa3poMFFD?=
 =?utf-8?B?ZzlRR1Q1UTF1Z2VBMjVTdmR6YzF3Qkg5eGx3Sk5QdnJYbXE3dkprdDdVS2Z2?=
 =?utf-8?B?d0FpRFB6amxPQStMcTE3azFSTmY1eHN5WWhtbFB6MXF6cGJETG5xcHhDelY1?=
 =?utf-8?B?Z3grdm1KUVR3QWhyT0IwVk95QUNkTTd2eVF0QmJ4Z2l2SWJsVEVIUHlCOUZG?=
 =?utf-8?Q?EXQrmEFRFIZBXpjG21KhxMs5q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e4ffd7-3786-4f6e-5159-08db7d58b172
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 13:06:49.0356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /UFW50XX4rLosRTMSFRj5Ci2AhmwUOPrGVNfVneLIPVZK2miKevnTWMBi/qNbuEVcMinpu1qByc3JvT3xNX1ggkUrTjMlxzwtnkhJCk6DNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10976
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzB7NCw1fTQ6IEFkZCBzdXBwb3J0IGZv
cg0KPiBlbmFibGluZyBNVFUzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBKdWwgMywg
MjAyMyBhdCAzOjI54oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiB3cm90ZToNCj4gPiBBZGQgc3VwcG9ydCBmb3IgTVRVMyBtYWNybyB0byBlbmFibGUgTVRVMyBu
b2RlIG9uIFJaL3tHMixWMn1MIFNNQVJDDQo+IEVWSy4NCj4gPg0KPiA+IFRoZSBNVFUzYSBQV00g
cGlucyBhcmUgbXV4ZWQgd2l0aCBzcGkxIHBpbnMgYW5kIGNvdW50ZXIgZXh0ZXJuYWwgaW5wdXQN
Cj4gPiBwaGFzZSBjbG9jayBwaW5zIGFyZSBtdXhlZCB3aXRoIHNjaWYyIHBpbnMuIERpc2FibGUg
dGhlc2UgSVBzIHdoZW4NCj4gPiBNVFUzIG1hY3JvIGlzIGVuYWJsZWQuDQo+ID4NCj4gPiBBcGFy
dCBmcm9tIHRoaXMsIHRoZSBjb3VudGVyIFogcGhhc2UgY2xvY2sgc2lnbmFsIGlzIG11eGVkIHdp
dGggdGhlDQo+ID4gU0RISTEgY2Qgc2lnbmFsLiBTbyBkaXNhYmxlIFNESEkxIElQLCB3aGVuIHRo
ZSBjb3VudGVyIFogcGhhc2Ugc2lnbmFsDQo+ID4gaXMgZW5hYmxlZC4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRo
YW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3I5YTA3ZzA0NGwyLXNtYXJjLmR0cw0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9yOWEwN2cwNDRsMi1zbWFyYy5kdHMNCj4gPiBAQCAtMTIsNyArMTIsNDMgQEAN
Cj4gPiAgI2luY2x1ZGUgInJ6LXNtYXJjLWNvbW1vbi5kdHNpIg0KPiA+ICAjaW5jbHVkZSAicnpn
Mmwtc21hcmMuZHRzaSINCj4gPg0KPiA+ICsjZGVmaW5lIE1UVTMgICAwDQo+IA0KPiBTaG91bGQg
dGhpcyBiZSBjYWxsZWQgUE1PRF9NVFUzIGluc3RlYWQ/IFRoZSBzaWduYWxzIGFyZSBwcm92aWRl
ZCBvbiB0aGUNCj4gUE1PRDAgYW5kIFBNT0QxIGNvbm5lY3RvcnMuDQo+IFBlcmhhcHMgYWRkIHNv
bWUgY2hlY2tpbmcgdG8gbWFrZSBzdXJlIFBNT0QxX1NFUjAgYW5kIFBNT0RfTVRVMyBhcmUNCj4g
bXV0dWFsbHkgZXhjbHVzaXZlPw0KDQpPSyB3aWxsIGRvLg0KDQo+IA0KPiA+ICsjZGVmaW5lIE1U
VTNfQ09VTlRFUl9aX1BIQVNFX1NJR05BTCAgICAwDQo+ID4gKyNpZiAoIU1UVTMgJiYgTVRVM19D
T1VOVEVSX1pfUEhBU0VfU0lHTkFMKSAjZXJyb3IgIkNhbm5vdCBzZXQgMSB0bw0KPiA+ICtNVFUz
X0NPVU5URVJfWl9QSEFTRV9TSUdOQUwgYXMgTVRVMz0wIg0KPiA+ICsjZW5kaWYNCj4gPiArDQo+
IA0KPiBQbGVhc2UgbW92ZSB0aGVzZSB1cCwgYmVmb3JlIHRoZSB2YXJpb3VzIGluY2x1ZGVzLCBs
aWtlIGlzIGRvbmUgaW4NCj4gYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0NGMy
LXNtYXJjLmR0cy4NCg0KT2suDQoNCj4gDQo+ID4gIC8gew0KPiA+ICAgICAgICAgbW9kZWwgPSAi
UmVuZXNhcyBTTUFSQyBFVksgYmFzZWQgb24gcjlhMDdnMDQ0bDIiOw0KPiA+ICAgICAgICAgY29t
cGF0aWJsZSA9ICJyZW5lc2FzLHNtYXJjLWV2ayIsICJyZW5lc2FzLHI5YTA3ZzA0NGwyIiwNCj4g
PiAicmVuZXNhcyxyOWEwN2cwNDQiOyAgfTsNCj4gPiArDQo+ID4gKyNpZiBNVFUzDQo+ID4gKyZt
dHUzIHsNCj4gPiArICAgICAgIHBpbmN0cmwtMCA9IDwmbXR1M19waW5zPjsNCj4gPiArICAgICAg
IHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gKw0KPiA+ICsgICAgICAgc3RhdHVzID0g
Im9rYXkiOw0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArJnNjaWYyIHsNCj4gPiArICAgICAgIHN0YXR1
cyA9ICJkaXNhYmxlZCI7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsjaWYgTVRVM19DT1VOVEVSX1pf
UEhBU0VfU0lHTkFMDQo+ID4gKy8qIFNESEkgY2QgcGluIGlzIHVzZWQgZm9yIGNvdW50ZXIgWiBw
aGFzZSBzaWduYWwgKi8NCj4gDQo+IEFuZCB0aGlzIHBpbiBpcyBub3QgYXZhaWxhYmxlIG9uIGFu
eSBvdGhlciBleHRlbnNpb24gY29ubmVjdG9yIGJ1dCB0aGUNCj4gbWljcm9TRCBjb25uZWN0b3Iu
DQoNClllcywgdGhhdCBpcyBjb3JyZWN0Lg0KDQo+IA0KPiA+ICsmbXR1M19waW5zIHsNCj4gPiAr
ICAgICAgIG10dTMtenBoYXNlLWNsayB7DQo+ID4gKyAgICAgICAgICAgICAgIHBpbm11eCA9IDxS
WkcyTF9QT1JUX1BJTk1VWCgxOSwgMCwgMyk+OyAvKiBNVElPQzFBICovDQo+ID4gKyAgICAgICB9
Ow0KPiA+ICt9Ow0KPiANCj4gV2l0aCB0aGUgI2RlZmluZXMgbW92ZWQgdXAsIG10dTMtenBoYXNl
LWNsayBjYW4gYmUgbW92ZWQgdG8gbXR1M19waW5zIGluDQo+IHJ6ZzJsLXNtYXJjLXBpbmZ1bmN0
aW9uLmR0c2kuDQoNClotcGhhc2Ugc3VwcG9ydCBpcyBhZGRlZCBvbmx5IGZvciBjYXNjYWRlIGNv
dW50ZXIoTVRVMSArIE1UVTIpDQoNCkkgdGhvdWdodCBieSBtYWtpbmcgdGhpcyBhcyBvcHRpb25h
bCwgU0RISSArIHN0YW5kYWxvbmUgTVRVMSBvciBNVFUyDQpjYW4gc3RpbGwgd29yay4gVGhhdCBp
cyB0aGUgcmVhc29uIGl0IGlzIG1vdmVkIGhlcmUuDQoNCklmIHdlIG1vdmUgIm10dTMtenBoYXNl
LWNsayIgdG8gIG10dTNfcGlucyBpbiByemcybC1zbWFyYy1waW5mdW5jdGlvbi5kdHNpDQpFaXRo
ZXIgDQoNCndlIG5lZWQgdG8gbWFrZSBNVFUzIG11dHVhbGx5IGV4Y2x1c2l2ZSB3aXRoIFNESEkN
Cg0KT3INCg0KR3VhcmQgIm10dTMtenBoYXNlLWNsayIgd2l0aCAiTVRVM19DT1VOVEVSX1pfUEhB
U0VfU0lHTkFMIiBtYWNybyBpbg0KcnpnMmwtc21hcmMtcGluZnVuY3Rpb24uZHRzaS4NCg0KV2hp
Y2ggb25lIEkgbmVlZCB0byBzZWxlY3Q/Pw0KDQo+IA0KPiA+ICsNCj4gPiArJnNkaGkxIHsNCj4g
PiArICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gK307DQo+ID4gKyNlbmRpZiAvKiBN
VFUzX0NPVU5URVJfWl9QSEFTRV9TSUdOQUwgKi8NCj4gDQo+IEJUVywgaG93IGRvZXMgdGhlIGRy
aXZlciBrbm93IGl0IGNhbiB1c2UgdGhlIGNvdW50ZXIgWiBwaGFzZSBjbG9jaw0KPiBzaWduYWw/
ICBJIHVuZGVyc3RhbmQgdGhpcyBjYW4gYmUgZWl0aGVyIGFuIGlucHV0IG9yIG91dHB1dCBzaWdu
YWw/DQoNCkl0IGlzIGFuIGlucHV0IHNpZ25hbCBhbmQgaXMgc3VwcG9ydGVkIG9ubHkgZm9yIHRo
ZSBjYXNjYWRlKE1UVTEgKyBNVFUyKSBvcGVyYXRpb24uIFdoZW4gd2Ugc3VwcGx5IHotcGhhc2Ug
c2lnbmFsKEJ5IGluc2VydGluZyBTRCBjYXJkIG9yIGFwcGx5aW5nIGEgdm9sdGFnZSB0byBjZCBw
aW4gb24gdGhlIHNkIGNvbm5lY3RvciksIGNvdW50ZXIgdmFsdWUgZ2V0cyBjbGVhcmVkLg0KDQo+
IA0KPiA+ICsNCj4gPiArJnNwaTEgew0KPiA+ICsgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsN
Cj4gPiArfTsNCj4gPiArI2VuZGlmIC8qIE1UVTMgKi8NCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA1NGwyLXNtYXJjLmR0cw0KPiA+IGIvYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA1NGwyLXNtYXJjLmR0cw0KPiA+IGluZGV4IDNk
MDFhNGNmMGZiZS4uNDE4NmJmZTczOWZhIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOWEwN2cwNTRsMi1zbWFyYy5kdHMNCj4gPiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDU0bDItc21hcmMuZHRzDQo+IA0KPiBUaGUgY2hhbmdl
cyB0byByOWEwN2cwNTRsMi1zbWFyYy5kdHMgYXJlIGlkZW50aWNhbCB0byB0aG9zZSB0bw0KPiBy
OWEwN2cwNDRsMi1zbWFyYy5kdHMuICBTbyBJIHRoaW5rIHRoZXkgc2hvdWxkIGJlIHVuaWZpZWQg
YW5kIG1vdmVkIHRvDQo+IHJ6ZzJsLXNtYXJjLXNvbS5kdHNpIGFuZCByemcybC1zbWFyYy5kdHNp
Lg0KPiBUaGUgdmFyaW91cyAjaW5jbHVkZSAicnpnMmwtc21hcmMtcGluZnVuY3Rpb24uZHRzaSIg
cHJvYmFibHkgbmVlZCB0byBiZQ0KPiBtb3ZlZCBkb3duIGZvciB0aGF0IHRvIHdvcmssIHRob3Vn
aC4NCg0KT0ssIHdpbGwgZG8gdGhpcyBjaGFuZ2UuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4g
cnpnMmwtc21hcmMtc29tLmR0c2kgYW5kIHJ6ZzJsLXNtYXJjLmR0c2kgYWxyZWFkeSBoYXZlIHNp
bWlsYXIgaGFuZGxpbmcNCj4gZm9yIEVNTUMsIFNESEksIGFuZCBQTU9EMV9TRVIwLg0KPiANCj4g
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc21hcmMtcGluZnVuY3Rp
b24uZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1zbWFy
Yy1waW5mdW5jdGlvbi5kdHNpDQo+ID4gQEAgLTUzLDYgKzUzLDIwIEBAIGkyYzNfcGluczogaTJj
MyB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIDxSWkcyTF9QT1JUX1BJTk1VWCgxOCwg
MSwgMyk+OyAvKiBTQ0wgKi8NCj4gPiAgICAgICAgIH07DQo+ID4NCj4gPiArICAgICAgIG10dTNf
cGluczogbXR1MyB7DQo+ID4gKyAgICAgICAgICAgICAgIG10dTMtZXh0LWNsay1pbnB1dC1waW4g
ew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBpbm11eCA9IDxSWkcyTF9QT1JUX1BJTk1V
WCg0OCwgMCwgNCk+LCAvKg0KPiBNVENMS0EgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8UlpHMkxfUE9SVF9QSU5NVVgoNDgsIDEsIDQpPjsgLyoNCj4gTVRDTEtCICov
DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBtdHUz
LXB3bSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcGlubXV4ID0gPFJaRzJMX1BPUlRf
UElOTVVYKDQ0LCAwLCA0KT4sIC8qDQo+IE1USU9DM0EgKi8NCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8UlpHMkxfUE9SVF9QSU5NVVgoNDQsIDEsIDQpPiwgLyoNCj4gTVRJ
T0MzQiAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxSWkcyTF9QT1JU
X1BJTk1VWCg0NCwgMiwgNCk+LCAvKg0KPiBNVElPQzNDICovDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPFJaRzJMX1BPUlRfUElOTVVYKDQ0LCAzLCA0KT47IC8qDQo+IE1U
SU9DM0QgKi8NCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgIH07DQo+ID4gKw0K
PiA+ICAgICAgICAgc2NpZjBfcGluczogc2NpZjAgew0KPiA+ICAgICAgICAgICAgICAgICBwaW5t
dXggPSA8UlpHMkxfUE9SVF9QSU5NVVgoMzgsIDAsIDEpPiwgLyogVHhEICovDQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgIDxSWkcyTF9QT1JUX1BJTk1VWCgzOCwgMSwgMSk+OyAvKiBSeEQg
Ki8NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJ
biBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15
c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
