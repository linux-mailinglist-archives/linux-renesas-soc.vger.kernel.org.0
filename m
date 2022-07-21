Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22AF557CD40
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 16:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbiGUOVU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 10:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbiGUOVS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 10:21:18 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2133.outbound.protection.outlook.com [40.107.113.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD0F48E9C;
        Thu, 21 Jul 2022 07:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWnm5n+KGnVFtaxOvKrfl7LHscdtUNopnQLKr35sbccN+pd1Vk9HfeM2SkdAI8n5QbIIrBnNoH/rD58ibl0T3YONzx7rcAZjxAN/+mPRjWdf2XZqvOE0+sEtxVsqqfLkv+LNAZbP5yygJBcN5tU4M7mhhsbH3Jhy2F/i4bTecdSrSRHJGhWCxgpvpTtjgm2iZYjkXIA5buRp9exiDphNMZqLEev0XKTZ89UHzg9GfvS9+3oLCF9VFz5yboL/Qq75K9TwpbwJXTNju96N/gSPtlGF8mMoTHej4XxC/J8FCYA1TDkosn0khRjacFvHrGOQmrLcSIE2e+ghZNPwDAwRmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELR+a6cfkeDNIyhQGZdYscbaZZO+D2IueofhzGmk8nY=;
 b=IlsBxVsdMaNL8jtHFuKYF0nczvcmKhmYWtG2R+fdkDiblL0owVabjQUKoHumOBUjWF6zGGvXg4J1jVVTDDWBdEUCBHzdgryQAxQtrG1bmrAmooXRcC6iQxe1zA3LoIQ6zi+LQWypyjloGCG5vrcJNxxUIDil+L7yOpM8HSIR5IF5bLKtQ7n1fWFt6erGCG+WGRk+jmXXDxlbiVjslKU1l0IsykH4+7lcpc7jQXq7jqC7LLtCKa4Vz475spfqt1zOphXwzJRrGKe2Mx51E9DSW7q0q0G68SUPN7TW9QF/0p6+q5Ze9l5GucjPfNaXiUhuRz3UihxkS3QL5ihMJ6j7DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELR+a6cfkeDNIyhQGZdYscbaZZO+D2IueofhzGmk8nY=;
 b=cqNVAiQOgSyRgSLEROWqOPspZMagn+bES51glULNRCmiJF9JwzkzfRRehFozs6HoaQs4M1ahXC4vSJBfFqn2C8kadyN9nm3c45RYpDoy506g5d46YktWIFyvyOY99VQpdfUqa4ZpOrXz2kSa1viBM3fcQDK6rWn0ZpVrqVt1Rwk=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYCPR01MB6286.jpnprd01.prod.outlook.com (2603:1096:400:7d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 14:21:15 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5458.018; Thu, 21 Jul 2022
 14:21:15 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Adam Ford <aford173@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: gadget: udc: renesas_usb3: Add support for
 RZ/V2M
Thread-Topic: [PATCH 2/2] usb: gadget: udc: renesas_usb3: Add support for
 RZ/V2M
Thread-Index: AQHYmqymW/0eL/mqCEKHRkgiHHt+a62IwEAAgAABA/CAAAgpAIAAAk0AgAAXwkA=
Date:   Thu, 21 Jul 2022 14:21:14 +0000
Message-ID: <TYYPR01MB7086CC951631BAED0F424DA4F5919@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220718134458.19137-1-phil.edworthy@renesas.com>
 <20220718134458.19137-3-phil.edworthy@renesas.com>
 <CAMuHMdXuY_HOphyDtw4edZWu_D4QCi2hi-GWLF5R2jPNMHGcpg@mail.gmail.com>
 <TYYPR01MB7086F7C2A25D70EABB9BD338F5919@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <CAMuHMdVaHXfyW27G7ZdRvg-VG1Gw4F2zJ1v8K4JuS1W_u5T4ng@mail.gmail.com>
 <TYBPR01MB5341BB25BFE06E58EA9F4A34D8919@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341BB25BFE06E58EA9F4A34D8919@TYBPR01MB5341.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5653391a-18e7-43ac-aa04-08da6b244529
x-ms-traffictypediagnostic: TYCPR01MB6286:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c/nS5AzJxMusIWqjkvBP7xfxjxZXnE07Uflaazp3ra8fdHNcUkmScARuyMmdEE6PoJ/gp47l+SxkAz3mijkJf2tiVofqZ5ms5BSAyYI4+1KgSR4rJdbpqXUrUhllD2F5KJ5jAPeeFSyIBJNPmRID02KOnuuNDWWgX3Pz9Y0v2vp8MKQS59m2iEYdpFZMOZFRuORdL1G+/p+0vs3krS9HVvKSpzwBiqyrb/CQEiOr58PoTrFGkcRFUeouGQqv3SBGpx0whF9Q4DamrGL+bbxuFTlsK2bkGuQfihEXMpNSXZlGbJl+tRcIXWMg1dWOKo1gR581eZApK7OEH/ZeTGneOz1HeR00bV0baSWJ+qOIH1xGrmtblyEapEkMjXz2ApC73PxIPs6S2OWMsqErDegp7Y4Sz6q/3f3VEioPbIqO79+ewMDdvbESq8XPsSWtNvyO/WJKk7l1vZvzpH9Y6VtLpnTH3Xgw+cRnl8PRim/zJwVoV2QJOegm9NNp8o9mvQUnHDfwkvDxbSd47zMVQtPGx87uwDSbjsqjhXuWh18ANQy3joLA4/YJ1+LCW8AgytH+q6qSdRbH4jh+w3zh6WMAa4UiYoH/0N6kTRcD/54fMqz7WFOaU6GnFbAhLH0sKqHhYUERPKYYxKrM/t7VCKrCU/WxZy48CFfGTh8I3R/lsV4VBlpcwXNU6NglyWLzcgtpJi0QpjLcJBCherSNvgplQGBxrLoKy5YC1G/oL/GDvCMGnxuh3L/oGOYg0NjV8uOK84I8SWL+Z7pFyCJX2pPzJ8xNNI7pDg1f++94Crf9CeDKUO7fIyGeQHeTvueXFKqM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(64756008)(2906002)(66556008)(7696005)(71200400001)(6506007)(55016003)(66946007)(33656002)(66476007)(26005)(53546011)(76116006)(4326008)(122000001)(66446008)(38100700002)(8676002)(9686003)(8936002)(86362001)(38070700005)(5660300002)(110136005)(83380400001)(52536014)(54906003)(44832011)(186003)(316002)(478600001)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHRkTWJsRC9XMmNxRkhnR2UvUzhSU1pqTWVldVJNMFVwMEVaamJod1FjSE9i?=
 =?utf-8?B?NTNHdW03UVllMVZmZWIvQWNBd0hmTU1CZlZXYjdJbkcweDRCNzgzY0IvdWNH?=
 =?utf-8?B?WkR2UkZYelV3WFZLK1g4dVoxbTFtNHNQa0FobkJYYjE1MDYzdUdTemFRcnp0?=
 =?utf-8?B?YjNiQXYzSEJlWlhpVTVoTjJOMEdNL0twT3BqWERyZHR3QTBOUVhYTGE1TEVU?=
 =?utf-8?B?QzIvTE5pazlNTnBrdU11M3o2KzZZVTBtSmYxdlR2TVpqY1JMVFgwQTBVNHpT?=
 =?utf-8?B?cE1jdGFHQ3k5cFJWbjdWbkU2bnJlcUs0dmZwTTdRNEpJdGQ0RVdXaGJyR2dB?=
 =?utf-8?B?MC81eG9DSUE4eFUycDJRemZZemQ4SVlRSGg5bTE1K3NRQ3doL3NJQ01HTit6?=
 =?utf-8?B?OWszbkdpVExydlE4SFVBOXZDMFVuamtnMDNFRWlhNGJnUkI0cittUCs2WjR1?=
 =?utf-8?B?NXcyT3B0RE9ORWVhcVpkdG9JOGFJVTFhZHFzR3hDVy9CcHREeUlQS0FZRHNC?=
 =?utf-8?B?aDVoKzBpWmZRYmV6TDJOVEF6aWxDbnA4czRuYkFMSWpDREpVNVN0d3B1T3Vu?=
 =?utf-8?B?MXhISmViZ1FBMU4zaDJGWEI1TWxDMUcwZ0s3eE1CRFdXOVovMitKNkk3aG1s?=
 =?utf-8?B?SmF0QXpiRHRqbHNsWll6ZStWblF3ZXJvZEVDRS8vVkt1RlZQMEIvZ2xDV0lD?=
 =?utf-8?B?VmdxMGowM01Rblk0K3R4K2s4eXJPbFB3Mm11R2tPSlhGYlNMWkxVNUZmUlpQ?=
 =?utf-8?B?bDFZeFF4clVuejZsUnRVT1QxTDY5KzI5d0UzZTVuak5CRGNhMU15aUtJZkdH?=
 =?utf-8?B?RkdZc2c0VGV2c3dkcXVvU3ZEdFhOVTBRcEJVUDNpSlFNclpSbmxUWFVXazQ0?=
 =?utf-8?B?eHMwcXZJMUZML2tKdlNRSzlrTlFxSVdvMk5WVHRkWU1mbzVqa1JBRFBFSy9F?=
 =?utf-8?B?VGVsdmNZeHNRaCt0UFBPVTlNOThQVjN4YjFCZWhSNUloOUNsaEY5elRYMjVn?=
 =?utf-8?B?MmgwMUtJWDdmd2tkaitZUUx6TmZjdWF0cmF2ZmhMK3RscExzZUFqSXNMV1JK?=
 =?utf-8?B?MjRMUTQ0Y21RbEpCM3FLbzlvZHFKUlQwTlBUZ0lQTXdLTHZNZ1lVTUcwc2Nh?=
 =?utf-8?B?MjJHZmdNb0tCbklpSEpud24weXhGOXRrOVYwVHk1Smd2ZkhkOGRVelBlcllK?=
 =?utf-8?B?OGhhTUFjYytxOHJ0L0xGZ2VQZGRVSFlsdklsZ3RpRUhqa2k1aGU2UmpsQzds?=
 =?utf-8?B?QXA2V3BVRTJ1NWp0WWpwdDFnM1FVdGJmSWVDT0kxcHdPeDNsYjJkenMwem8r?=
 =?utf-8?B?alR6WTZ5aFI5ZlNDVUNtK0VFelNKWHlydkhGZmhaMzBkS01FcjBCK2pBUXg3?=
 =?utf-8?B?bzd0d0VKWjRhVWp1TkRlSWNEREtuRWl5NXJVWUo5Zkhjcm5ad2lNdFNWeVJ5?=
 =?utf-8?B?TDZMU0g1Y1NlVkI5MkY3SUhPRDM1SXZ4bEdsaC9CbVZVREhzdkpGc0IxeFdj?=
 =?utf-8?B?bTVmWDV2cXNwSDdPcmNYL2dIeUlyc2NLT1VLczRUdEtrM0tFOFJjTDVmS0Fy?=
 =?utf-8?B?SFZ0ZERteDQ0bXp0bXA3QkpvWjNsWlJtWHA5aFdQVEdUYVRqeHBoa0p6ejY2?=
 =?utf-8?B?TzByQTAzclQ4TWVkbjVGU01INkZVQ2VnSFgzY3Jqb1NPbkZ1cjEwSm5obTFO?=
 =?utf-8?B?WmZhekxBaFBtYXVPR2hJdFhzYkQrSG9CS0ZxT0F4RU5VejY5ZUx2cDZkZ2Vs?=
 =?utf-8?B?NXZLNVREa2k5djJPa1lTOTBiSzludmxpYXVEMnhKeHF1TEtCSGpnc1RpY1NP?=
 =?utf-8?B?S1pKU1UxWXNHdGh4RVo4OXpWNWtzY0pPZFlCTHFwL2FyYzVyRFo2U2g5VGs2?=
 =?utf-8?B?T0hOdHV5RjZ4VjBIZ3R1OStGYUxuNGRhRlk5ZVNTWDJJU3FZSTU0a0pGRDJy?=
 =?utf-8?B?TEVORzd2Zyt2dkQ1Qlh1NkJ0TjFTbVlyTE5HZnUrcFRtZk1LaDh1K3QrOWZs?=
 =?utf-8?B?NFhudzFYTmc0UlZ3Rk81UjZpQkExc2xIQ3Y4emxXR2NFdW92eUtOK3hvMDJa?=
 =?utf-8?B?ZXhqNmlIdEwxdUNCWlJoanRDTXJaVld4TStjbFI4V25FYVV5YjlPVjI1dmdw?=
 =?utf-8?B?NjlwVE1YV0hTOWZBcVZodVNQTEZWcmFYZkZOYmNHaUtrd212dVl5N2ZJNktX?=
 =?utf-8?B?N0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5653391a-18e7-43ac-aa04-08da6b244529
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 14:21:14.9230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e7De1flDBpINMGdlPKt1L8V+Vb3ccNRvWKFYhCIf75R8sSIsBuGzTyDf9DApJuty1mAyTL+KpfRFbAIEazmiafPUmwpBUt0mG+iXrjfmE6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6286
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgWW9zaGloaXJvLA0KDQpPbiAyMSBKdWx5IDIwMjIgMTM6NTEgWW9zaGloaXJvIFNoaW1vZGEg
d3JvdGU6DQo+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuLCBTZW50OiBUaHVyc2RheSwgSnVs
eSAyMSwgMjAyMiA5OjQzIFBNDQo+ID4gT24gVGh1LCBKdWwgMjEsIDIwMjIgYXQgMjoyNSBQTSBQ
aGlsIEVkd29ydGh5IHdyb3RlOg0KPiA+ID4gT24gMjEgSnVseSAyMDIyIDEzOjEwIEdlZXJ0IFV5
dHRlcmhvZXZlbiB3cm90ZToNCj4gPiA+ID4gT24gTW9uLCBKdWwgMTgsIDIwMjIgYXQgMzo0NSBQ
TSBQaGlsIEVkd29ydGh5IHdyb3RlOg0KPiA+ID4gPiA+IFJaL1YyTSAocjlhMDlnMDExKSBoYXMg
YSBmZXcgZGlmZmVyZW5jZXM6DQo+ID4gPiA+ID4gIC0gVGhlIFVTQjNfRFJEX0NPTiByZWdpc3Rl
ciBoYXMgbW92ZWQsIGl0cyBjYWxsZWQNCj4gVVNCX1BFUklfRFJEX0NPTiBpbg0KPiA+ID4gPiA+
ICAgIHRoZSBSWi9WMk0gaGFyZHdhcmUgbWFudWFsLg0KPiA+ID4gPiA+ICAgIEl0IGhhcyBhZGRp
dGlvbmFsIGJpdHMgZm9yIGhvc3QgYW5kIHBlcmlwaGVyYWwgcmVzZXQgdGhhdCBuZWVkDQo+IHRv
DQo+ID4gPiA+ID4gICAgY2xlYXJlZCB0byB1c2UgdXNiIGhvc3QgYW5kIHBlcmlwaGVyYWwgcmVz
cGVjdGl2ZWx5Lg0KPiA+ID4gPiA+ICAtIFRoZSBVU0IzX09UR19TVEEsIFVTQjNfT1RHX0lOVF9T
VEEgYW5kIFVTQjNfT1RHX0lOVF9FTkENCj4gcmVnaXN0ZXJzDQo+ID4gPiA+ID4gICAgaGF2ZSBi
ZWVuIG1vdmVkIGFuZCByZW5hbWVkIHRvIFVTQl9QRVJJX0RSRF9TVEEsDQo+IFVTQl9QRVJJX0RS
RF9JTlRfU1RBDQo+ID4gPiA+ID4gICAgYW5kIFVTQl9QRVJJX0RSRF9JTlRfRS4NCj4gPiA+ID4g
PiAgLSBUaGUgSURNT04gYml0IHVzZWQgaW4gdGhlIGFib3ZlIHJlZ3MgZm9yIHJvbGUgZGV0ZWN0
aW9uIGhhdmUNCj4gbW92ZWQNCj4gPiA+ID4gPiAgICBmcm9tIGJpdCA0IHRvIGJpdCAwLg0KPiA+
ID4gPiA+ICAtIFJaL1YyTSBoYXMgYW4gc2VwYXJhdGUgaW50ZXJydXB0IGZvciBEUkQsIGkuZS4g
Zm9yIGNoYW5nZXMgdG8NCj4gSURNT04uDQo+ID4gPiA+ID4gIC0gVGhlcmUgYXJlIHJlc2V0IGxp
bmVzIGZvciBEUkQgYW5kIFVTQlANCj4gPiA+ID4gPiAgLSBUaGVyZSBpcyBhbm90aGVyIGNsb2Nr
LCBtYW5hZ2VkIGJ5IHJ1bnRpbWUgUE0uDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBQaGlsIEVkd29ydGh5IDxwaGlsLmVkd29ydGh5QHJlbmVzYXMuY29tPg0KPiA+ID4gPiA+
IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4g
PiA+DQo+ID4gPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gPiA+ID4NCj4gPiA+ID4gPiAt
LS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL3JlbmVzYXNfdXNiMy5jDQo+ID4gPiA+ID4gKysr
IGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5lc2FzX3VzYjMuYw0KPiA+ID4gPg0KPiA+ID4g
PiA+IEBAIC0zNjMsNiArMzY4LDcgQEAgc3RydWN0IHJlbmVzYXNfdXNiMyB7DQo+ID4gPiA+ID4g
ICAgICAgICBib29sIGZvcmNlZF9iX2RldmljZTsNCj4gPiA+ID4gPiAgICAgICAgIGJvb2wgc3Rh
cnRfdG9fY29ubmVjdDsNCj4gPiA+ID4gPiAgICAgICAgIGJvb2wgcm9sZV9zd19ieV9jb25uZWN0
b3I7DQo+ID4gPiA+ID4gKyAgICAgICBib29sIHI5YTA5ZzAxMTsNCj4gPiA+ID4NCj4gPiA+ID4g
QW55IGJldHRlciBuYW1lIGZvciB0aGlzIGZlYXR1cmUgZmxhZz8NCj4gPiA+IE5vdGhpbmcgc3By
aW5ncyB0byBtaW5kLiBXZSBjb3VsZCB1c2Ugc2VwYXJhdGUgZmxhZ3MgZm9yIGhhc19yZXNldHMs
DQo+ID4gPiBoYXNfZHJkX2lycSwgbWF4X25yX3BpcGVzIGJ1dCBJIGFtIHN0cnVnZ2xpbmcgdG8g
Y29tZSB1cCB3aXRoIG5hbWVzDQo+ID4gPiBmb3IgdGhlIG9mZnNldCByZWdpc3RlcnMgYW5kIG1v
dmVkIGJpdHMuIEFueSBzdWdnZXN0aW9ucz8NCj4gPg0KPiA+IE9LLCBzbyAiaXNfcnp2Mm0iPw0K
PiANCj4gVGhlIGZsYWcgbmFtZSBsb29rcyBnb29kIHRvIG1lLiBIb3dldmVyLCBJIGRvbid0IGxp
a2UgdGhlIGZvbGxvd2luZyB1c2FnZQ0KPiBpbiBtYWNyb3MuDQo+IC0tLQ0KPiAtI2RlZmluZSBV
U0IzX0RSRF9DT04JCTB4MjE4DQo+ICsjZGVmaW5lIFVTQjNfRFJEX0NPTgkJKHVzYjMtPnI5YTA5
ZzAxMSA/IDB4NDAwIDogMHgyMTgpDQo+IC4uLg0KPiAtI2RlZmluZSBVU0JfT1RHX0lETU9OCQlC
SVQoNCkNCj4gKyNkZWZpbmUgVVNCX09UR19JRE1PTgkJKHVzYjMtPnI5YTA5ZzAxMSA/IEJJVCgw
KSA6IEJJVCg0KSkNCj4gLS0tLQ0KPiANCj4gQWJvdXQgcmVnaXN0ZXJzJyBvZmZzZXQvYml0LCBJ
IHRoaW5rIGhhdmluZyBzcGVjaWZpYyBtZW1iZXJzIGludG8NCj4gYSBuZXcgc3RydWN0IGlzIGJl
dHRlciBsaWtlIGJlbG93LiBCdXQsIHdoYXQgZG8geW91IHRoaW5rPw0KPiANCj4gc3RydWN0IHJl
bmVzYXNfdXNiM19yZWcgew0KPiAJdTE2IGRyZF9jb25fb2Zmc2V0Ow0KPiAJLi4uDQo+IAl1MzIg
b3RnX2lkbW9uX2JpdDsNCj4gCS4uLg0KPiB9Ow0KPiANCj4gc3RydWN0IHJlbmVzYXNfdXNiMyB7
DQo+IAkuLi4NCj4gCXN0cnVjdCByZW5lc2FzX3VzYjNfcmVnIHJlZ3M7DQo+IAkuLi4NCj4gfTsN
Cg0KSSB0aGluayB0aGF0IG1pZ2h0IGJlIGEgYml0IG92ZXJseSBjb21wbGV4IGZvciB0aGUgcHJv
YmxlbS4NCkhvdyBhYm91dDoNCiNkZWZpbmUgVVNCM19EUkRfQ09OKHApCSgocCktPmlzX3J6djJt
ID8gMHg0MDAgOiAweDIxOCkNCg0KVGhhbmtzDQpQaGlsDQoNCg==
