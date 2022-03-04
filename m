Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A05494CD4F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Mar 2022 14:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiCDNRK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Mar 2022 08:17:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiCDNRJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 08:17:09 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C9A108572
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Mar 2022 05:16:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENTbrx6JdPE4M+3W3tN438fCVWsrVMWFwW1UTbsfUcJJBWdy2qXHap9kHMZ6llLvDlNbqYB21MdYu/1zpg8ymeKRsF+fqgC2mvPJNMyhXttCzs7XO5RsnDJpY3U++cOETBQzT317DlHFQ/bhc2Qo3H92ImhjVQSMRb4LFGnmDWgXayJjH/zTN8SR57G/X6A8kNMYlFi3i+ZDkMna2+5nkyT6SKSv1YzJWWm8w6ZC5PP19XW1nXcJ8+3HDvNk58bSuKympETKI7c+hN9LsOHcPGO9I31bFrGGU13+6AgebZ/V/9ns9H1gaESB6yl/2KhlIyMbV4PcltHQhuzqNd6QXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4z3vUEe6mxcSSUIleLaA74k9drA8m/vOwvwlaAREjs=;
 b=ho6OTEymYvAQ/6Ws6NZUQ5tdu7c9hinf74GRy9NvC1GYzsMt5bMtk3+nVgrVqpTtPIqvBeUT+rcW2cfCvfaxnTgzNCeimBVDKjfrVMToHCo/AQKbPPIP0Pf/DXA2bOGciL1CEj4ojPbq01lqfS1GtIPood47U6aA+jGtCoQbIt/25ouk4yBLx6Sw0hJcKOFzjuE8uKOViujNBmEIa9Qrn7s9StngzWjx5NtT61lVt7bPgEBzqA5/ZwRCL7zKbzAiYOd4Fjsl4pZhykc0ndWzmhF5qXnmxQcvh6HSHpWMu9k0/wyy3wnkPNKl5wZuFLdAisN+Wxp6uD2TjtvJeTRGBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4z3vUEe6mxcSSUIleLaA74k9drA8m/vOwvwlaAREjs=;
 b=KjeSmIAuqd1ikTkD0oaci1CTnActEa1D5EFWtFLsLKR3lu04oUphA274HrzCZ8ygemjs0f0JYmfmjhPsylRR/lua7SUFAC0nMjFAqrZOdXUNZ2+FeLllK2r7xKXqySrU4yOma4sMJEESmNdPmLTSlAiySoqC45VSg60ttb/hwAg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8191.jpnprd01.prod.outlook.com (2603:1096:400:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 4 Mar
 2022 13:16:18 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 13:16:17 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH V2 2/7] soc: renesas: Identify RZ/G2UL SoC
Thread-Topic: [PATCH V2 2/7] soc: renesas: Identify RZ/G2UL SoC
Thread-Index: AQHYLxt58YT6dVYuZ0WjzHvyyL7EDayvMzqAgAAAN1A=
Date:   Fri, 4 Mar 2022 13:16:17 +0000
Message-ID: <OS0PR01MB5922EA5F1646A6B23AC72D9F86059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220303162634.6572-1-biju.das.jz@bp.renesas.com>
 <20220303162634.6572-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdX12L55NLABtTvE6b16a+9NvC6LcDG7npRhiHSWeMQ7Zw@mail.gmail.com>
In-Reply-To: <CAMuHMdX12L55NLABtTvE6b16a+9NvC6LcDG7npRhiHSWeMQ7Zw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8414e555-e5f8-43ae-18d0-08d9fde12af6
x-ms-traffictypediagnostic: TYCPR01MB8191:EE_
x-microsoft-antispam-prvs: <TYCPR01MB8191D7BCE482FD9FD9D814EF86059@TYCPR01MB8191.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XhQ0PQaulUtv9n+Sk5FvB2AheQtptS+LFZ7CuGh+CQYboHr47Tva/2YOy/IjCwFSdrs62UiaRW6uboTwQx432KW4XkJQmfprEHtL+VIBHYJw3lzSOY2REsG+5su+be0018yq1KVxrbCfm9dbvzmz19QU3dtPSXOKoGRrRflJnjskuzKhMFtMjUWY9TiM2XlYdib9Lxn670m8iMdIMuj1gQOu4ngJwMGDjiIMBElDZzfun2za1tUhIPj7/47ykYe09+w4wE1q8RzOLmFBkzSrL6CJ/aDF5qQmEipojGVr42mBBN7n2+/aUS7l73JavR32KZNLrtG4nFg8ohDCVFzWHkHigRMlfZ1RYESehdvWJpzj7YU5JFoX872C0CiGzBIz4scPZ8SWY+5kK204iC5dXoA6UCUlY9cEuki92OqcazTUQ62NfGm5IVjAnN/ePLq0F65gOmce2vK7+OrcHlNUIKW99TXyl3eQ2YfalrUoOxAdNp00CyjHOi5D3Isn7fbg7/I6iJjued7O+/yo5DIXhpLLsayMOmSZXxiOQ01IHYj42xa7rCo8oML3TTinwhv+DaDmAkfR79VUfrRt1EPqjl+5bWDn0a/D0Tans9jcRfTAuqogUU5r6R7rMgQRR/aGY5Knec0EMnZS4lN6MmBgukBh5cR8VVprHF802qMDIHWqQnmw/Am6JHM5vxW7AyC9e+ctyYnNeHIErf4+brzAlw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(38100700002)(2906002)(508600001)(83380400001)(5660300002)(52536014)(7696005)(9686003)(38070700005)(8936002)(53546011)(86362001)(6506007)(8676002)(66446008)(66556008)(66476007)(64756008)(66946007)(76116006)(316002)(6916009)(54906003)(122000001)(71200400001)(55016003)(33656002)(26005)(186003)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnNTZUd4NldaWS9PdGlqd21hdGJFbXVHb213K2x5dGR4S2N1ajVJWHcrN1BL?=
 =?utf-8?B?b2VTYXJ4WXd1VDI0WXpBWUF0WVlweVJwblBrWjVVVTl4QWlQWFJXaDMxSElM?=
 =?utf-8?B?S3ZrVjNOdFM1UWUwUkZLQkc1eXhQSEs3WG5KQjlFcmhXUFBtOVRJcC9IRE9y?=
 =?utf-8?B?SDBvU01LVmMxVEpsRDBlV2Q3VUcraGJ5VkJDbEszcDA0U0RMTFA4bVJlSzJJ?=
 =?utf-8?B?Szh5OWFpazRkVlZsTDVCQlpVOVNuRDN3T0FiaHg3OTNqS0JqUTQzcHF2Y3Nj?=
 =?utf-8?B?QlFxb3pvdFhmeVUxcnFYMXNJeGxxRmdkbHQyYlFId2FwemlKTHdoUjdkT0FK?=
 =?utf-8?B?TlVJaEhuM1FzL09BamFkL0V6dEVxRmhnSVBGbjczeXlXV1NNU2kxMXlKN0d2?=
 =?utf-8?B?OTdvWk42eVZucTRWNlZ5eXFpVE1Xb3VqZU5VWkhWNisyTXlhQ2VRTHYzbDNR?=
 =?utf-8?B?eStLUFdHbWRZVnd6ODhKcU0vK25pTU5LNW5RTHZLZGxZR25wVDBzUngwTzgy?=
 =?utf-8?B?cmtaclZuRTVNN2h0eFFRNDRNNHM3NEtFNW12ZllPTHdtbnZNQ3BzajI3dDIy?=
 =?utf-8?B?NC9TNVhMS0VvRDhtNWIyS0xJOXorOE1XTS95dm5RUW4rSUFtaW9FR21Jd0dJ?=
 =?utf-8?B?QUJGZ0xwSEVNcC9BcGVmZ1dHaEF1TStCMVpDREdnRGczVVZmM3RTaHl6eDJw?=
 =?utf-8?B?RlZqY1RBRFU3YVBPZWoxSTBUaDlYVytFSlNyZkpLbUR0YzZWL0VueE52UWE2?=
 =?utf-8?B?TzlCZlA1cHJMQ1RTbXBDMGFCYy9GM05yOWt0VW1wMnpQRXFhZ0ZKR2x2VHpO?=
 =?utf-8?B?emd1emhpK3lOK0ZuVGtZMEtNNlFhazJ3NDRYNzNxNzZNNzJZQ0QvVGRibHJR?=
 =?utf-8?B?TGlSdm5jaVBLTlNYa0ZpSTlQVnRiTlJsbTcyZjc4RUoyaVhiQjFIL05SSG5R?=
 =?utf-8?B?VGg5bjZLeGNWMzRJcWVhbDBsR1orVHQ0NTh5M1RkWnlRU3VhLzljVkduWWRw?=
 =?utf-8?B?bnh5b2o4S2MrUjBxWnNkaUpnQWJldVV0Q240a1l5bHNGZjFmUGM0bHVWMm1I?=
 =?utf-8?B?UzUwcUI2M09mK09Ebk5MTnAzbmRMa0JUamhHN1dmTVJuREpPM2NkVlV1bmxI?=
 =?utf-8?B?Q1QrVmI5N1Q0WTVVenRFcitzZllwaWZLN2NUOURJSVhxZ3FxQUtNWDJqWEtm?=
 =?utf-8?B?NzZwNTQ5RWEzd1BkTVA3ckJLMVU2VmdYZFdjVTdNQUtoWWhUVlpwWFF6SmZ3?=
 =?utf-8?B?QlloQlJEK0F1czE3MnUvNTZFNmMzSlkvWHc5WjNxbm9WNUh2VlduOXVib0x6?=
 =?utf-8?B?ajZ5dlZtU29Vc01rdkRlY3VKNm9sckFMVHhWWllucVBIbE1yK0ExUFhmZDNZ?=
 =?utf-8?B?TitZNkJxVkx1Zk5DZGRFN0J2TkliT2VqUzg2cERZKy96N3NhK1FFcHJqa1Rt?=
 =?utf-8?B?c24xL1RSNXBWWEdMeTFmWmhSejBqQzFSb2wvNlF2WUk1NzhqMkNSZDJ5NUVV?=
 =?utf-8?B?QkZrT0cxU2NlTFhmZFY4S3dPVXlMRXlGN0Y5QmZSMmdiczYxNkhHbnYyc1VT?=
 =?utf-8?B?TDdGcWVmR2JsT1J2a0dac3JQdWhhNXF2RG84cUJOK2xxZUtPQmtxY01EWVJV?=
 =?utf-8?B?dnBhUUxWanAyYi8xdDN6WFhNVkVNVHlaNTMxQTJLVkJySkZEbXJZVndIdDBm?=
 =?utf-8?B?WXp2NDBpVWZmbVR1ZTBQVkFTUmdpRUpHZ3NFK1hvT3FzQXR4Z2lMeFFKekZK?=
 =?utf-8?B?bHpCRUhYbTNYNjYxT1BveTc4WkxyWCtRYzUrQWpsUHZ6OCtGVUVUT2k4VTla?=
 =?utf-8?B?T3hpWG5janpXem1SbEkxQmY4YVhMQlVaWThwbHllU2p4ZnFZYjNZSm15Tmtm?=
 =?utf-8?B?Vy9JNmtBaXFJelhEaWNrSGliMmRMSDF5ZnBjMFNCMVVlM0VGcmMzWkVWL1ov?=
 =?utf-8?B?cmJjV01rV1FGckRwRHE0Y2RWZnJaYjVWTmZVSEJSdlhVaTlPNFZyRm5vWE8r?=
 =?utf-8?B?ZUV5TnpVVkR3TEhjQ1dHdUtKVlpvdTF1alpGc0haNHlpTEwvM09HdmUyeTF3?=
 =?utf-8?B?QnBQcnk2VldCb2hSUDdUSzdTMkxHVDIzRzh6QVNNdEU4d2Z5SWNsUVJqUWR0?=
 =?utf-8?B?R25WOStLN2F5QUczRnRIK0w3MEM4WnBnWXp6dWUxMnFYMGpOdGJMUUx2L2Np?=
 =?utf-8?B?czUraEZJSnY1TkVWaGFXdEJ0NmRQYmhBZlo0ZlVqZGx5YXlHZEZET0d3d1g4?=
 =?utf-8?B?WldlYWdxTVhZaFRjTGludGY3ejVRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8414e555-e5f8-43ae-18d0-08d9fde12af6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 13:16:17.9094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AjXa2SrDeVuUW4zzQP4afCW1RiGajLcpMtSTJREJ7qEaZezzOEiBzDRn+Kw7nwDTYvI5KiHydUoR8cPTc2+vWp7uPv8rfkbJELgRtFC8kVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8191
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
UEFUQ0ggVjIgMi83XSBzb2M6IHJlbmVzYXM6IElkZW50aWZ5IFJaL0cyVUwgU29DDQo+IA0KPiBI
aSBCaWp1LA0KPiANCj4gT24gVGh1LCBNYXIgMywgMjAyMiBhdCA1OjI2IFBNIEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gQWRkIHN1cHBvcnQgZm9y
IGlkZW50aWZ5aW5nIHRoZSBSWi9HMlVMIChSOUEwN0cwNDNVKSBTb0MuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2
aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5l
c2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJp
dmVycy9zb2MvcmVuZXNhcy9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9zb2MvcmVuZXNhcy9L
Y29uZmlnDQo+ID4gQEAgLTI5Niw2ICsyOTYsMTIgQEAgY29uZmlnIEFSQ0hfUjhBNzc0QjENCj4g
PiAgICAgICAgIGhlbHANCj4gPiAgICAgICAgICAgVGhpcyBlbmFibGVzIHN1cHBvcnQgZm9yIHRo
ZSBSZW5lc2FzIFJaL0cyTiBTb0MuDQo+ID4NCj4gPiArY29uZmlnIEFSQ0hfUjlBMDdHMDQzVQ0K
PiANCj4gTGlrZXdpc2UgKGNmci4gbXkgY29tbWVudHMgb24gMS83KSwgSSB0aGluayB0aGlzIHNo
b3VsZCB1c2UNCj4gQVJDSF9SOUEwN0cwNDMgaW5zdGVhZC4NCg0KT0ssIEkgd2lsbCB1c2UgQVJD
SF9SOUEwN0cwNDMuDQoNCj4gDQo+ID4gKyAgICAgICBib29sICJBUk02NCBQbGF0Zm9ybSBzdXBw
b3J0IGZvciBSWi9HMlVMIg0KPiA+ICsgICAgICAgc2VsZWN0IEFSQ0hfUlpHMkwNCj4gPiArICAg
ICAgIGhlbHANCj4gPiArICAgICAgICAgVGhpcyBlbmFibGVzIHN1cHBvcnQgZm9yIHRoZSBSZW5l
c2FzIFJaL0cyVUwgU29DIHZhcmlhbnRzLg0KPiA+ICsNCj4gPiAgY29uZmlnIEFSQ0hfUjlBMDdH
MDQ0DQo+ID4gICAgICAgICBib29sICJBUk02NCBQbGF0Zm9ybSBzdXBwb3J0IGZvciBSWi9HMkwi
DQo+ID4gICAgICAgICBzZWxlY3QgQVJDSF9SWkcyTA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3NvYy9yZW5lc2FzL3JlbmVzYXMtc29jLmMNCj4gPiBiL2RyaXZlcnMvc29jL3JlbmVzYXMvcmVu
ZXNhcy1zb2MuYw0KPiA+IGluZGV4IDkyYzdiNDIyNTBlZS4uYzY2N2JhZjRmYzU5IDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvc29jL3JlbmVzYXMvcmVuZXNhcy1zb2MuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvc29jL3JlbmVzYXMvcmVuZXNhcy1zb2MuYw0KPiA+IEBAIC02NCw2ICs2NCwxMCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHJlbmVzYXNfZmFtaWx5IGZhbV9yemcybA0KPiBfX2luaXRjb25z
dCBfX21heWJlX3VudXNlZCA9IHsNCj4gPiAgICAgICAgIC5uYW1lICAgPSAiUlovRzJMIiwNCj4g
PiAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlbmVzYXNfZmFtaWx5IGZhbV9y
emcydWwgX19pbml0Y29uc3QNCj4gX19tYXliZV91bnVzZWQgPSB7DQo+ID4gKyAgICAgICAubmFt
ZSAgID0gIlJaL0cyVUwiLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVj
dCByZW5lc2FzX2ZhbWlseSBmYW1fcnp2MmwgX19pbml0Y29uc3QgX19tYXliZV91bnVzZWQNCj4g
PSB7DQo+ID4gICAgICAgICAubmFtZSAgID0gIlJaL1YyTCIsDQo+ID4gIH07DQo+ID4gQEAgLTE0
OCw2ICsxNTIsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByZW5lc2FzX3NvYyBzb2NfcnpfZzJs
DQo+IF9faW5pdGNvbnN0IF9fbWF5YmVfdW51c2VkID0gew0KPiA+ICAgICAgICAgLmlkICAgICA9
IDB4ODQxYzQ0NywNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlbmVz
YXNfc29jIHNvY19yel9nMnVsIF9faW5pdGNvbnN0IF9fbWF5YmVfdW51c2VkDQo+ID0gew0KPiA+
ICsgICAgICAgLmZhbWlseSA9ICZmYW1fcnpnMnVsLA0KPiA+ICsgICAgICAgLmlkICAgICA9IDB4
ODQ1MDQ0NywNCj4gDQo+IFJldi4gMC41MSBvZiB0aGUgUlovRzJVTCBIYXJkd2FyZSBVc2VyJ3Mg
TWFudWFsIHN0aWxsIGxpc3RzIHRoZSBzYW1lIElEIGFzDQo+IFJaL0cyTCwgc28gSSBjYW4ndCBj
aGVjayB0aGlzIDotKA0KDQpJIGdvdCBjb25maXJtYXRpb24gZnJvbSBIVyBwZW9wbGUgdGhpcyBp
cyB3cm9uZyBpbiBIVyB1c2VyJ3MgbWFudWFsIGFuZCB3aWxsIGJlIGZpeGVkIGluIHRoZSBuZXh0
IHZlcnNpb24NCk9mIFJaL0cyVUwgSGFyZHdhcmUgVXNlcidzIE1hbnVhbC4NCg0KVS1Cb290IDIw
MjAuMTAgKEZlYiAyNSAyMDIyIC0gMDg6MTM6MDkgKzAwMDApDQoNCkNQVTogUmVuZXNhcyBFbGVj
dHJvbmljcyBDUFUgcmV2IDEuMA0KTW9kZWw6IHNtYXJjLXJ6ZzJ1bA0KRFJBTTogIDg5NiBNaUIN
ClNXX0VUMF9FTjogT0ZGDQpNTUM6ICAgc2gtc2RoaTogMCwgc2gtc2RoaTogMQ0KTG9hZGluZyBF
bnZpcm9ubWVudCBmcm9tIE1NQy4uLiBPSw0KSW46ICAgIHNlcmlhbEAxMDA0YjgwMA0KT3V0OiAg
IHNlcmlhbEAxMDA0YjgwMA0KRXJyOiAgIHNlcmlhbEAxMDA0YjgwMA0KTmV0OiAgIGV0aDA6IGV0
aGVybmV0QDExYzMwMDAwDQpIaXQgYW55IGtleSB0byBzdG9wIGF1dG9ib290OiAgMA0KPT4gbWQg
MHgxMTAyMEEwNA0KMTEwMjBhMDQ6IDA4NDUwNDQ3IDAwMDAxMTAxIDAwMDAwMDAwIDAwMDAwMDAw
ICAgIEcuRS4uLi4uLi4uLi4uLi4NCg0KPiANCj4gPiArfTsNCj4gPiArDQo+ID4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgcmVuZXNhc19zb2Mgc29jX3J6X3YybCBfX2luaXRjb25zdCBfX21heWJlX3Vu
dXNlZCA9DQo+IHsNCj4gPiAgICAgICAgIC5mYW1pbHkgPSAmZmFtX3J6djJsLA0KPiA+ICAgICAg
ICAgLmlkICAgICA9IDB4ODQ0NzQ0NywNCj4gPiBAQCAtMzQwLDYgKzM0OSw5IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHJlbmVzYXNfc29jc1tdDQo+ID4gX19pbml0Y29uc3Qg
PSB7ICAjaWZkZWYgQ09ORklHX0FSQ0hfUjhBNzc5RjANCj4gPiAgICAgICAgIHsgLmNvbXBhdGli
bGUgPSAicmVuZXNhcyxyOGE3NzlmMCIsICAgICAuZGF0YSA9ICZzb2NfcmNhcl9zNCB9LA0KPiA+
ICAjZW5kaWYNCj4gPiArI2lmIGRlZmluZWQoQ09ORklHX0FSQ0hfUjlBMDdHMDQzVSkNCj4gPiAr
ICAgICAgIHsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwN2cwNDN1MTEiLCAuZGF0YSA9ICZz
b2NfcnpfZzJ1bA0KPiA+ICt9LA0KPiANCj4gICJyZW5lc2FzLHI5YTA3ZzA0MyIsIHNvIGl0IGNh
dGNoZXMgYm90aCBUeXBlLTEgYW5kIFR5cGUtMiBTb0NzPw0KDQpPSywgV2lsbCBjaGFuZ2UgaXQg
dG8gcmVuZXNhcyxyOWEwN2cwNDMiDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiArI2VuZGlm
DQo+ID4gICNpZiBkZWZpbmVkKENPTkZJR19BUkNIX1I5QTA3RzA0NCkNCj4gPiAgICAgICAgIHsg
LmNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwN2cwNDQiLCAgICAuZGF0YSA9ICZzb2NfcnpfZzJs
IH0sDQo+ID4gICNlbmRpZg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0t
IFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4
ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0
aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
DQo=
