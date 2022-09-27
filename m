Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27F865EB9C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Sep 2022 07:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiI0Fht (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Sep 2022 01:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiI0Fho (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2022 01:37:44 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B50780EA0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Sep 2022 22:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fk4Ge8XrWtkxdbzj7H0NxqJEke6auD8BUw+MVJbTuc4JYNOoc6fPDNpqN+k0SaJpBTiIPLaLTS5igACza1lmu4A+F0ZvTQVidq+wHsz2/m0jR9vp/v3ssxc/vPqnV/2xQ/bU8mzxurDJ8yCdmgL1q6y9yJ6JAlGVrI5Yzo2N/Ql7siB6O3zRGl9xTipV43ep7MCyuIp1e7yJLpYgjkFnwr7otnL4yWEdAQgLbVUUg80ALhDHNt8xuMCakHcTxsetBcDiovJ0aHUvLptXMVB9j6e8Kn2mwy439OH0jBqZdY82KqlS6N4uvmDxWHoqjj8rbTKz3mrFWWXyh0FbcFzrUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7lju54xmhaU0STyKsB8ngbs6ZadgvMgIGR8QflFHec=;
 b=PqpOZY0DnRHLxIHdM2aGg15X1d7K9jk/Iuh/RrZ9tG0FS2OpdenPDypfYPNmK1QFIYFUFiog0trwMUh/CyejXQx9+yKwPRHVTOFMFvtc2tDgz6UNAWH0Ec0fF4r1apCxzr0giZidVesYkmMl2IwZbxd8VkPOtkxuqbvEn2D+Ah+9ro5YL+QkqDiwmrDKU9TgOo11KGOqxEjJCxFTFqeoGfeoZbOYCp/hpNrE/lgXtLO+RbSkGvFsj+mTjRBwRQMDXhUzmayNch8bGzznsRMAoBTsBBZ8lNW9PMKyGepVjl9K74BQTNtcjJBfg4LNoJrSRbMVFk1Y7rhQpOGADXufPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7lju54xmhaU0STyKsB8ngbs6ZadgvMgIGR8QflFHec=;
 b=qErXZ2pp/tt6RI10cT7gNcRoDg7cAU7b5PEPavBPR1Ok4F6KKmVHsolMmZ5cKk07cz2BvLhnxJxTME+eLE7ckwj8cxdsT6XhBiHDwL9/jMKRUngcK5UA/fcFI24DOPeqMp4waw5ahiB/LUGwkw48lVPe6HJP15BBCoDxItQ60uQ=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYCPR01MB8406.jpnprd01.prod.outlook.com (2603:1096:400:151::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 05:37:41 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::7c12:d63c:a151:92bc]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::7c12:d63c:a151:92bc%9]) with mapi id 15.20.5654.024; Tue, 27 Sep 2022
 05:37:41 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
CC:     Lee Jones <lee@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 3/8] mfd: Add RZ/G2L MTU3 driver
Thread-Topic: [PATCH RFC 3/8] mfd: Add RZ/G2L MTU3 driver
Thread-Index: AQHY0arl1Thp0AsTikGjWBVKgM5Hha3xxAWAgAD+4XA=
Date:   Tue, 27 Sep 2022 05:37:40 +0000
Message-ID: <TYCPR01MB59336E78DA4D6D064BBFAD5586559@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220926132114.60396-1-biju.das.jz@bp.renesas.com>
         <20220926132114.60396-4-biju.das.jz@bp.renesas.com>
 <b63073642723dd3ca188809ad9ba388dd6b91320.camel@pengutronix.de>
In-Reply-To: <b63073642723dd3ca188809ad9ba388dd6b91320.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYCPR01MB8406:EE_
x-ms-office365-filtering-correlation-id: 46109fed-22c1-4c00-31e1-08daa04a6522
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6LdKOUn+1I9ShCkh0wnAfkyOuPhsYEkAtCfS85edB6Bmp3jG5btcr7SHhGEsnjeFIZO+l7CChoOuSpW+jf0NKgg99JG3ihyVwiAgvi6OLq6+we8TfYOOooukeTEM+cpMeyTeLg9b86Ilg9xANBjYJ0uGFvtxg3vkHueIc6BTD5G1gnx+1POSX2Lv3lRgUETLscLf9UzJCJ/VF/6x5tKk81o0eqMMtYQYh/z43xw/YHGg9vR+t9kysa/cjOvjV2N00lyIb5p0zvP3Ku9Aga9FCAs4sUCXeTpaPjou7DtGmH3Mmz7k30uaix0MAVDxngA3ESeOXEcRmuf5nnKlIW+C8amNfA6+AKXELGYDLYq54n3MbR9Y3AhhMJ1oThaWM3V4YjZs2RwMzY5QO1B2nR+13CUSNX/GxEHlhvAoqSp9utJIsL67WJ3x2O0LCOu0jlFU6oZbfopkGmCg2Q4e5jn0pRNN5BgkFr39KBtEcO9JKhlS4+QgDPIak9B6AbDPdkN2zIlciO/vzaiEhBSWOXbF7Go2+4mIoJHhY7FtOu6BkgLoSFtoRvo2Bb3mQnuJ1Ai4T1fh37C6BtYp3L7Vc/B00w1CfyPcjMf3svwfMEJYNeHFRihIjFkYE0Mm0PleSomWW/oo40iIvGBbTO1TycVt0I31typ3cOJjpOsJiCBgRSiBxIVeXz8uTmocz7QbXqWITGZcQTtFYkB/I+ZX6Vee1hoSpb+yZzBT4YmE9H2sdQhxRmjaKx8dTGXcdKuVQDCbc5XhUVWVJsgA/g2vQ9NeTQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199015)(122000001)(38070700005)(186003)(26005)(9686003)(7696005)(6506007)(478600001)(41300700001)(38100700002)(8936002)(71200400001)(66446008)(52536014)(64756008)(76116006)(66556008)(66476007)(4326008)(66946007)(8676002)(4744005)(2906002)(33656002)(5660300002)(6916009)(54906003)(316002)(55016003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFV2ZkticzJBL3pGeUkxWEkrazhhUkRGUEFNdnY4akxZNkhEVStVNkFFL2tD?=
 =?utf-8?B?YXZKc1VaSGZTaUpseGRXVDNVNmtWcjdOUXg4SXZXdE9HTnQ0Uk8wZXRsQ0RB?=
 =?utf-8?B?dU9HVDJYeTR0dnE5YnhXZ1lQS25iZDNjSFcvQVNYTWFYRmx6NE8rbVdmSHFt?=
 =?utf-8?B?a2xaa21XRGlLRHBmTU52U0dBLytOamhuWTVvNjNxajBlYmhvNXZsK2daUEI1?=
 =?utf-8?B?cDNyczBobmNtTmN6bGVmMkNmeGRLVUV4SFNFOThHRzhoWEJ0YmdDQ0xDcmFU?=
 =?utf-8?B?V2lwcm1PbHZUWnlYRTBSSis3SlNaUUlMSUZTWk5SODl3TGFCc0ZtbVdGNmVh?=
 =?utf-8?B?ZXJOdzVRSWV1OUh4WWk3WWJlREpJSHFpWDZoYkpPdGxlT3ErNjRHMzdKTHZK?=
 =?utf-8?B?dE5Nd0xVVURkZytNeUtUaUtncTJ6NmkrN0NkYVBIalliYWRzMjZVUDBQRk9y?=
 =?utf-8?B?SWxOeWo1NURTTjZoaForR2lSY2MveEhLQ1dhN1Y1WXN4a3BtN0s3L2lUL0Jt?=
 =?utf-8?B?T3NscDYrSXRja0I2UlY4TERmeWppV1p4eFJ1TWZHTE9pYmQ4RWhFWHI0aG1x?=
 =?utf-8?B?Smw1Zzk2WXVlQWYraE1JTk9aYjZ5b2g5NjhrQ2l0V0ZRMENEM1ZDUnQzWmRn?=
 =?utf-8?B?OHNEb05tK1RtbE5FanlYblpxUmd5NjYwck8rT2V4QU1IelZlSU9pZDBQWHdF?=
 =?utf-8?B?K2svYm1hOU14NHJyMFNLNFdIdkMrR1hOcldaWDU1TGlTRlVvVFN2cFVpTjRy?=
 =?utf-8?B?TkFZQmo1c2RMSzBhbCsrMWpLUHZpbWdrc3V4YkQwUytZdHRiUG05UG5TRDk2?=
 =?utf-8?B?V044WnpZVFhPL0hISEY3blVFM3Eyc0VDMWpBNDdkR2ZwWGNQMWdQbTA4YlFu?=
 =?utf-8?B?Ym1tZ0dxWGpuTDk1cS9ERHcrTjFQY3JBVjZLVjhGMzcrUnc3ZE1YWFk2Wnhj?=
 =?utf-8?B?ckhpR1lmSjNyaEdPMnh2K2JER2poc2JhRkJMYkNXMWVmL1lrR1ZpUHJYQlVm?=
 =?utf-8?B?Q3plVThSR2JxdkQ2N1dGTXFpZjFjMGFQWkJHMEs5cDB6Ly84SkpXeXJ6SGxr?=
 =?utf-8?B?Ri85blJiQ09QL3JCaXFaZDJVRjNENzduYlNVU3FDLzJRWmdNRzV3N1h6enZo?=
 =?utf-8?B?TjFXR2l5TEgvNmZwNzVqMlJyTzFKbXBNbmFhelNUWkd4MkV4ZUdndzNaR1dt?=
 =?utf-8?B?RG84Ui9HUnRXTGVBQy83WWJNTTdxSWtPdlNPS2plWWhVWkp6dkNaQVpiK1Zi?=
 =?utf-8?B?ckFjMDhubnlWMVlTTjJJTTBLNDhkd1UvMXdqanB1dUdaQTAwRVdKVEpDUHBY?=
 =?utf-8?B?RW1vM0F6QzZWZWF5Nlp3ZFQ5ckJoZXg1dFVMMjF2TGlVRlB2ejdzQ3VhSWVr?=
 =?utf-8?B?UEhGTXdPTG9aakR3aDg5eS91QTNhSnFqQ21vbGZMNHZPRUJqTHgzaElXcTIr?=
 =?utf-8?B?Wm9JTzJXRitNTEtVY3VVNkh5Q1V1SWEzckdpdHVKSWxtdDU0QTlFc0N0T3Bu?=
 =?utf-8?B?OXdZYklUWGRCU2c0SmhZWk9oQXlScTVneFdGYkdITFFkZDc2UFZiUFhxTnRa?=
 =?utf-8?B?dHJraStNTzB5Njkxek8zcnAvVThiemNJU21GRjlSWUsraUNEd3lZMHRUT0wy?=
 =?utf-8?B?eUJSeFIveXRQU0h2S3VSVUZHT0ZlbWtVRUw0bE9TMks3UGxISXNiaUpuZ1Ax?=
 =?utf-8?B?RmNKbFZJOVRhMGFRRlFzM3JDbE9lT0N3bFpGRGlWRDFiODg3SDBXKzRxdCtK?=
 =?utf-8?B?Q0RNVEVhaW9NRUh2dzFuczFOZ0NqRzZSaEdqL3dtRDdPcUtrUXR4NFZCSHdC?=
 =?utf-8?B?a2g2bkRpeHlFNThYS0x0VXV4elNINXovWUJwOWdZKzRyK3FkYjF4aTlaRTBr?=
 =?utf-8?B?dWRXWG1PZmUvOUp5YW5INDJRMnM1MEVEeFZ2U2ZJV1MrQXIrUUIra2gvOTVq?=
 =?utf-8?B?QjNrUmVvWlE3TnU2OEZyVU8wN3ZKTU5maG52WlJUbitjQ2p2Z20wbDhKTEFM?=
 =?utf-8?B?QkZxd2JrZlRrRXpuYWk2UGxvVzhsdHhWM2xwMElwaEF2SS95NFVqbEIvQ0di?=
 =?utf-8?B?bG9wTHRKVzYrVmV5UHJybkk4UXp5Nkw1L214a3JmY0N2U3hGWkFHNld2MTVw?=
 =?utf-8?Q?Uc9cIiP9kQ/RIG1WJ7Nur6iNr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46109fed-22c1-4c00-31e1-08daa04a6522
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 05:37:41.0485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aWLqOe6w0xycpHj7rDsi2MyRDE23XpDnC2GxvNOo6sCtsIbCm9ZlJUej3npga5hPqwp4Pd4bDfrwhAekIiObYm/u/TTWD5AgpQTsW28rBd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8406
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUGhpbGlwcCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCBSRkMgMy84XSBtZmQ6IEFkZCBSWi9HMkwgTVRVMyBkcml2ZXINCj4gDQo+IEhpIEJp
anUsDQo+IA0KPiBPbiBNbywgMjAyMi0wOS0yNiBhdCAxNDoyMSArMDEwMCwgQmlqdSBEYXMgd3Jv
dGU6DQo+IFsuLi5dDQo+ID4gK3N0YXRpYyBpbnQgcnpnMmxfbXR1M19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ID4gKwlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0YzsN
Cj4gPiArCXN0cnVjdCByemcybF9tdHUzICpkZGF0YTsNCj4gPiArCXVuc2lnbmVkIGludCBpOw0K
PiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwlkZGF0YSA9IGRldm1fa3phbGxvYygmcGRldi0+
ZGV2LCBzaXplb2YoKmRkYXRhKSwgR0ZQX0tFUk5FTCk7DQo+ID4gKwlpZiAoIWRkYXRhKQ0KPiA+
ICsJCXJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiArCWRkYXRhLT5tbWlvID0gZGV2bV9wbGF0
Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiA+ICsJaWYgKElTX0VSUihkZGF0YS0+
bW1pbykpDQo+ID4gKwkJcmV0dXJuIFBUUl9FUlIoZGRhdGEtPm1taW8pOw0KPiA+ICsNCj4gPiAr
CXJzdGMgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0KCZwZGV2LT5kZXYsIE5VTEwpOw0KPiANCj4g
UGxlYXNlIHVzZQ0KPiANCj4gKwlyc3RjID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNsdXNp
dmUoJnBkZXYtPmRldiwgTlVMTCk7DQo+IA0KPiBpbnN0ZWFkLg0KDQpBZ3JlZWQuDQoNCkNoZWVy
cywNCkJpanUNCg==
