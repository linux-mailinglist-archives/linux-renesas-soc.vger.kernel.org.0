Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54CCB4EC5E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 15:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346277AbiC3NrA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 09:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245544AbiC3Nq7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 09:46:59 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B161F8F9B6;
        Wed, 30 Mar 2022 06:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c77nFeX+8GEC/Bv5klz+a7tAFfmXfbZOpkAQGI7jT2RDZ5AX6tUoI5TvFwvHGgRP9WjL2cH7HPLSrSaAGzSHywZ9LlMYRy8eTtVJCbVaXNgMlxRUG0C0th+ihKUYn48oYCtUNgIQdnd6jRz00HGCFAQrIcp9+SkP6+bGNwmFFXVjdUxMkBcnRZiv0+aBdssFrr4NNAWpAy6qKVuzAC//YW1hYuaZganPVKWzWaW0orjx5WEyZOYnX8u3ychz/CZQK0fP+jr2BoUbuqwUMz7jw1cCqrUfVmf8tIxkkx5B/VfgQefhPkRfDJr8CvCB4r3g+kq61hH/ZkQIcaJrji40/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DM/ceWlNz3IdSEVSF6wU5tmSwAC1nXTmu2SAdH9QfFY=;
 b=Jkz5PfB3QN5Tj54qx7CLxOIzcSPfOudzK2sE23Sa4Sby8v1iYUa9yq/C31ey7cN3l0oBZnX1/aSZhmjB+jZS3/TyE1W5GImchkEtsPjMnSeNo6izsKVIzXqsJ18o8WCXKtx4oGP+2qiz9UNc+kR9p5j82V8/2FW2miadH0JHFNaAfbudeelmYnEejgqRrdMKVaYTmMdTBgGs8F+ue1xCt4tZ9BCcSngjzIoJlBRSHSj8QQ5fg9yuT/1CSXBWu2FgVc9J6Q8JVpu8BrSoSx+zJlxUGY3XMm+zy6TEPWQQAiM/NSdRn5gGqJqnQe7L4BgAKHsE7F0eABiSag4BnC7xfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DM/ceWlNz3IdSEVSF6wU5tmSwAC1nXTmu2SAdH9QfFY=;
 b=gzA+rXJ3wv7cilZesTf0ezLTYhZFSccUNsVbPinNrmBejV4/WxFW8YR/H40qarNlXIjJH/lASYCwDbW+pCapleTwFq/qBBLrYOMW8uU9IA9nVTVMpQuUCHuZOWER8FCnQxMbBTCg5SxaSBCRkYgQo2NyWh6h7H6cSktBRP6rdvY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2419.jpnprd01.prod.outlook.com (2603:1096:603:3d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 30 Mar
 2022 13:45:10 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8%3]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 13:45:10 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 1/7] dt-bindings: power: renesas,rzg2l-sysc: Document
 RZ/G2UL SoC
Thread-Topic: [PATCH v3 1/7] dt-bindings: power: renesas,rzg2l-sysc: Document
 RZ/G2UL SoC
Thread-Index: AQHYOHi3x+GBN/gXpEWypb/noUlbxazX/b4AgAAJ51A=
Date:   Wed, 30 Mar 2022 13:45:10 +0000
Message-ID: <OS0PR01MB5922D9A78967F1820EF1F333861F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com>
 <20220315142644.17660-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdU9_8_1PAcujWQgU3VrGsOAdj+72NWeotR6_h3uCix0Lw@mail.gmail.com>
In-Reply-To: <CAMuHMdU9_8_1PAcujWQgU3VrGsOAdj+72NWeotR6_h3uCix0Lw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd45302e-6474-4658-491d-08da12538287
x-ms-traffictypediagnostic: OSAPR01MB2419:EE_
x-microsoft-antispam-prvs: <OSAPR01MB2419BCD9DBD362C43DDE5084861F9@OSAPR01MB2419.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mFJD1FakPvqYpzNyUSZ0tFGTwTMKix202lbu75ut60rX/5riH5/WsiH6IMnqavSLqElxp8CdMBmxM4/Id3uz/WWVphfzrrG6CkWZCH9kJ0Uw2zTpEwCWGYjapXeJCsrUXykQVUYDqNTemby0TeoZTeVcgSdTis5S+DFqi1mldJ4O2vu6u17ObmM6c2CaByNFC4woUc9VAVthgG0Bf0Dcm+lb6dh6Dk2fjCps0A1432ph4LHjh9uIt8c8Yu/6YHBjOXkIj0vXXEzebgsbKurhYSOLVTqOSpY5N4hLaQQmSGesaLG/idqCFfR8rnumDDdt2P/F2OVE5HbYEPflZtSnhqbvsmnt9nhmD3kXIbwcJkeXOlxCKQ65a3otKGdkPxnpLib7WESFmTOfOoRTflBIrHNCFMOF++jXj7zz2r/wT70VgWLownBPGqv3XK4qFFUDJB1ZwUSS3l+DnS+LLhLP0D/CC/JLe7tq5jQYH04ItSIRmTC7L4jspvab1ot4Xo/kjVfLisDCakLDH4+8yq3yTNXeYAIgtURxy3qOPRv9YR0p5b1mp5ydl7pYkqLYykZa7MtDoLwCozyi2DeGkiOpQYb10lpDlLGikyX5CcHQgNDzUMJivGdiFsO4mOE2KbEDJOhq4bUNRMllBh0Jqw6McLdgU7AXmvThKtFh1yvtPQoV+Jiy2xTCItskc2qokNgEQqMfePthfwIXY/iq2MA69A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6506007)(86362001)(38070700005)(66946007)(33656002)(66446008)(8676002)(66476007)(83380400001)(4326008)(26005)(53546011)(55016003)(54906003)(76116006)(7696005)(71200400001)(508600001)(9686003)(66556008)(6916009)(186003)(64756008)(5660300002)(38100700002)(2906002)(52536014)(122000001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnBQRFVML0JjYW9VM3ZEdUR0SDh3UUpibUVKcytMNlkyUW1FeXl3N2Z3dkN0?=
 =?utf-8?B?bVpMNWNuL1JQUWFiakt0Q29Md0NaZ1RtTXlLb0xheXd5WFlIQmNMSmRWMlJz?=
 =?utf-8?B?ZXRTWklrKzFZTE04R1U3Z3JjeVVKaUFrVjYwbG1JT0hVUFRIblpjUUgvOEZV?=
 =?utf-8?B?NjJ6VjNHTHpLWmI2TDJLMHRFSWs5dFFJTmpSR2V3aWNFLytXODRLYTBta3hS?=
 =?utf-8?B?aVEyeWt5dG5OUUczVHVER1d5L0IrQkdtWHdvU3orUVRhaVh5UHpLSWhOMmxP?=
 =?utf-8?B?eEZlM2VkbTZVRWZIZzFNM1E4Z1pQcGVDNnB1WlFjd3Z3T2orMU5jWXFmS0ow?=
 =?utf-8?B?NEdna3VpR21SRHVHbkp5RGFFeng4bWxiV01kbGtQMER5UHZBNzF3cDhmZWNt?=
 =?utf-8?B?K3hBeEhhYWJUd1ZUdHVOSW9nbHM5bXJCV3BMLzc2bWlxRzdRMUdNOWF4NXd1?=
 =?utf-8?B?WVUydDFReTVFUjlBd2tGSHJtTmJ2cUl6Umd3UEVudHVPK2ZnRkZzS01HRlF1?=
 =?utf-8?B?d0haWEVsbHM0dkwwWHA2R2VENnZGamFKZlROSHQ1bHliSjhCMk5JQ1BpNFRy?=
 =?utf-8?B?NkNkcmVkd0tUaXZER0NUT25OdFhSUW5TeGlsYno3akwwWXpuWG8rRHFpanF3?=
 =?utf-8?B?T01xU0ZDdjJNNis4Z09xRk0wcGdnQUg3L2lZdHMrWXQwSVIvcS9LWXYxRkNZ?=
 =?utf-8?B?dFUydURXS2FLeXpLVkN4M1N3YWZBeXhta0p6dmZ6MlZtalZDVHlKMm5oQUl1?=
 =?utf-8?B?cmd4WkFRSXpLMjZ1TTVSSnFDMUxwQXBtL05PYzd1a1RteFVHZXNRS25uNm5x?=
 =?utf-8?B?aG8xWXNFNFhWR2FsT1pDLzhxOFBwbEN4eXNzak1FZUxLdWMwcDJPMGtldXhI?=
 =?utf-8?B?VExlVmhuM0t6QUNSYjhZUFM2ZXJWL2htUGJzbHk0dkRHV0lWSjM4b0NSSFFS?=
 =?utf-8?B?OXNZT3ZqOEZwWmpjWFk0RjFQMVlVbER1Z3JpTWZKYkVhRUQwa3R4OVVpbWlk?=
 =?utf-8?B?TWVtL2s2T2dtWFRZMkVpRlM4clMvKzhHRmVTbXVPQWdkeDl3NXNnUXdaMXNN?=
 =?utf-8?B?MGRhRFNyZ3pMaTZOSFgybStIbFVGRE9xcTFMUVRHeVk2ajJwSmQ3RVJ5NWtu?=
 =?utf-8?B?aGRyL0VWVlB3RmRBLytxRW1kL0ZiZUFUR1ZVZzE2T2lXUjJvN3RIQmx2dHAw?=
 =?utf-8?B?NXJZMlhPSHp1UmZIRjEwVkIyVjVtc2h3U1o2Z3BEUnZMM09RYW5WeC9tS1NS?=
 =?utf-8?B?SzRzeXhjUE53ekxFYk5WQlNtU1dIYXlQbjJaY0diM0NLb2QzekdrdDdPSTZS?=
 =?utf-8?B?SVNaclhzcnJPV2dRQzFTTzFJVmJOQ2EyamR6NjNnYVNYSE03UkQrZWwveE1u?=
 =?utf-8?B?WDFTMlliaStDWDFxNGdWUURrQmlqWmNlSWNKdmN3OFhiL2ZUQlRRY05MeXVI?=
 =?utf-8?B?Y3d6UVh0WjFuZ0ZvY3IvYzJwNm96bVBmZFRUc2FhQ1g5andnayt5QXZ0aVA4?=
 =?utf-8?B?aVhrUU9uQ0lGTW1CREtmaXNlK3Eyc2JOZEJ3VXlzYkxMd1hhcUxuNWR4S0po?=
 =?utf-8?B?NGlpd3FYRTY5ZWpSZ05MaTQxVDQ2VzJOeERhRmkzNzAwbmx4bEVnQ1hUbU9D?=
 =?utf-8?B?SjJEMGJlKytZWVRtVGdEV2pldmowb20yVVVCM0N1Y0NrY1doY0VzU0dtOExk?=
 =?utf-8?B?MXA5MUoySDA0WEJWM1dUQndPbSthdEVNdmFMQm1seXlQYXJDUTN0MVNRemd6?=
 =?utf-8?B?ajBRY2hYSVg3MTB1cFNaSGZFWitEbDVLWnNjRHp4WHhjM1NNUUZzSW83ZTNy?=
 =?utf-8?B?cTllNG41Ym5yZWZlODQvUDhYK3FWWmxRdFR3M25JR1FsWlc3dTNhZGQrYnNn?=
 =?utf-8?B?dmY0dm9rVFRZTU1tNkN5NXVMUXBnN0FQSWhtTk9DTmp0L2JEYTRVY1U0bk9Y?=
 =?utf-8?B?aGprb2dUY3RDM2JxNEdBdGRkWjlOWFFvUGZJTkdsNERVZFdFVS9wb1AxOFFs?=
 =?utf-8?B?UmVtUjM5SFg4TjY4Y2NNMytaaVNJTXlYb0lUNDZLNlM5NEhGbzdDV284blZK?=
 =?utf-8?B?SU9rYmM0ZUp0cmNyQ2RaRjdKVzVlVzhGOEo5aVJNQnNrNmkzcVVRMGY5Z3BP?=
 =?utf-8?B?MmxmNnJaTmpzNzZvUEJBOHZwOHFBM1BEZGZzdkZqRzlNd3oybWV1Sno0RUZs?=
 =?utf-8?B?TDlQZ2NIdEsvNGRrTlk4aVlWWVlpSHB0REVQRTJCTnl6S3RJeVljNTIxRUxE?=
 =?utf-8?B?OGxCZG9HcXRrOVRuTG5USDBuYmJBT3lHdlAxamxwRnZkTnRIQnJxYzdKSnNw?=
 =?utf-8?B?Q3lEbmNkMFlUaklNK3liY2hzc0xMd0l4aTlFSmw5OFZqZEMyTk96WmdNempD?=
 =?utf-8?Q?bkjqenyDnfh8Wn9o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd45302e-6474-4658-491d-08da12538287
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 13:45:10.7523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KOTWvu3NlF3UHC6iraDZdv7zbMpXHdID81KHT6eCP3frhnEhdIhlvh8l/YuLj85rO2jITYcwMrT9vkYZGZjhFbrqkaoTbtD/tiBD4ka//DY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2419
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzddIGR0LWJpbmRpbmdzOiBw
b3dlcjogcmVuZXNhcyxyemcybC1zeXNjOg0KPiBEb2N1bWVudCBSWi9HMlVMIFNvQw0KPiANCj4g
SGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgTWFyIDE1LCAyMDIyIGF0IDM6MjYgUE0gQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBBZGQgRFQgYmluZGlu
ZyBkb2N1bWVudGF0aW9uIGZvciBTWVNDIGNvbnRyb2xsZXIgZm91bmQgb24gUlovRzJVTCBTb0Mn
cy4NCj4gPiBTWVNDIGNvbnRyb2xsZXIgZm91bmQgb24gdGhlIFJaL0cyVUwgU29DIGlzIGFsbW9z
dCBpZGVudGljYWwgdG8gb25lDQo+ID4gZm91bmQgb24gdGhlIFJaL0cyTCBTb0MncyBvbmx5IGRp
ZmZlcmVuY2UgYmVpbmcgdGhhdCB0aGUgUlovRzJVTCBoYXMNCj4gPiBvbmx5IENBNTUNCj4gPiBj
b3JlMCByZXNldCB2ZWN0b3IgYWRkcmVzcyBjb25maWd1cmF0aW9uIHJlZ2lzdGVyLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpA
YnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+DQo+ID4gLS0tDQo+ID4gdjItPnYzOg0KPiA+ICAqIENoYW5nZWQgdGhlIGNvbXBhdGli
bGUgZnJvbSByOWEwN2cwNDN1LXN5c2MtPnI5YTA3ZzA0My1zeXNjDQo+ID4gICogUmV0YWluZWQg
UmIgdGFnIGZyb20gUm9iIGFzIGl0IGlzIHRyaXZpYWwgY2hhbmdlLg0KPiANCj4gVGhhbmtzIGZv
ciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcG93ZXIvcmVuZXNhcyxyemcybC1zeXNjLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcmVuZXNhcyxyemcybC1zeXNjLnlhbWwNCj4g
DQo+ID4gQEAgLTIwLDggKzIwLDkgQEAgZGVzY3JpcHRpb246DQo+ID4gIHByb3BlcnRpZXM6DQo+
ID4gICAgY29tcGF0aWJsZToNCj4gPiAgICAgIGVudW06DQo+ID4gLSAgICAgIC0gcmVuZXNhcyxy
OWEwN2cwNDQtc3lzYyAjIFJaL0cye0wsTEN9DQo+ID4gLSAgICAgIC0gcmVuZXNhcyxyOWEwN2cw
NTQtc3lzYyAjIFJaL1YyTA0KPiA+ICsgICAgICAtIHJlbmVzYXMscjlhMDdnMDQzLXN5c2MgICMg
UlovRzJVTA0KPiA+ICsgICAgICAtIHJlbmVzYXMscjlhMDdnMDQ0LXN5c2MgICMgUlovRzJ7TCxM
Q30NCj4gPiArICAgICAgLSByZW5lc2FzLHI5YTA3ZzA1NC1zeXNjICAjIFJaL1YyTA0KPiANCj4g
Tm8gbmVlZCB0byBhZGQgb25lIG1vcmUgc3BhY2UgYmVmb3JlIHRoZSAjLg0KPiANCj4gUmV2aWV3
ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IGkuZS4g
d2lsbCBxdWV1ZQ0KPiBpbiByZW5lc2FzLWRldmVsIGZvciB2NS4xOSwgd2l0aCB0aGUgYWJvdmUg
Zml4ZWQuDQo+IE5vIG5lZWQgdG8gcmVzZW5kLg0KDQpUaGFuayB5b3UNCg0KQmlqdQ0K
