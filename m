Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78E425EDAB3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Sep 2022 12:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233995AbiI1K5O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Sep 2022 06:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233906AbiI1K4l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2022 06:56:41 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2099.outbound.protection.outlook.com [40.107.114.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0566594101;
        Wed, 28 Sep 2022 03:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqSessS9GRRUPACIzlxJtBBHGP3NX7FFGrx9l066eqrhi5ABYhzNAvYLfC/Ao+z/Zi506xIcKcTyIiOcjErZ5J2Q0Re6kp9/iiVKYepG5BdjnhbqcCgEymWGFQcx2PlrGrtEuSu9ehOBRnwtV8EfNnlYJ+OX45rKOBSM6XrSfCJ51IMqcajN0aFtgnar4uUbFi1ygaycbH2l4tPs0L0jvL56wiy8uzeMEuv1UGG9a+ghAtjxcajtdgSTFJXyxskda7HzFL+4zCrTG0rzTgJYwjSBGwb3vyzgVnxs1GJ6AlpwBnUBEzen/ir9YhReGxnTdDeRVDtlkq9YFLwQ7AUGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihJa+iyNO2N68pmAuoV8FXDF2quzLtLWjgz76k36C2g=;
 b=EuE0eo8Y/oWp+miw059r71uKr7xQs07m/d3juB1Goah2Alc70zWqx39RGf4A4turctlOWHa3HV7YEJcWcr+1eeisAjarGDet/3U0SEyTySLFXX4IGnuXuwaHuV2ZVtvddSWdSjr+BTx6SwOBsEHckocKCE5VEzbzq8Dk2eoOGT3Dt4dbV4vSxDRhik3eXq5qiuU9k3fZcL/PAwuWbioEJocxCcjGosP003kYOORRPKatmH7d2F+BSBoLOlMowlPOliyq8nXWNpUSdPWfCu+UAGj77h90wbUEIkehyR7EqwZx9Ikinm68iweU01JiUb2FdWGeLZ8oAsc01GNelH+7Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihJa+iyNO2N68pmAuoV8FXDF2quzLtLWjgz76k36C2g=;
 b=GJM+LxedlCyo0GPvtTLDwUTZIcvjl/KjVfL0imkOrQdD/E8YkVQIgnTsc3z2RWjuDA7kEY/9eExj8vDz/xqaY6UteXYENc5USpfyrzfYUciel0fqYcx6CcknzYaTi0mLdKwRqouV7xfYDO9IGClyep+HJAU16YSxdhSEO3igDHo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB5420.jpnprd01.prod.outlook.com (2603:1096:404:803f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 10:55:34 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262%7]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 10:55:34 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4] mmc: renesas_sdhi: Fix rounding errors
Thread-Topic: [PATCH v4] mmc: renesas_sdhi: Fix rounding errors
Thread-Index: AQHY0noUTw65KpPtl0+JXvsHlc8xea30rBYQ
Date:   Wed, 28 Sep 2022 10:55:34 +0000
Message-ID: <OS0PR01MB59225FB854430BD3A4A84AF186549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220926171002.62352-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXa3d=0r73HV+1JjYeVN+FoyJs==zTo983wiNB12KJM2w@mail.gmail.com>
In-Reply-To: <CAMuHMdXa3d=0r73HV+1JjYeVN+FoyJs==zTo983wiNB12KJM2w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYAPR01MB5420:EE_
x-ms-office365-filtering-correlation-id: 7248bb72-c223-4897-aa5e-08daa13ff85d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9HiQJhG+aV1YC1JqXUxeAg2zWLyne8XfFMYAG81ZoWLLop7Rro5E02JRgCG4PXUM33N8sl5RFkKoCgcT19AB0QTeYJG92naBZLjzyP6rMw23qmFsToz/N/myQgQiP2J8J7e6DfAInC4/DefpQrHBEmpioHvYfOfe5c3eKqxpWt9B3gUbCJ/hjvMbkTofKqImWciYzGgo4g2voXMzzDgHLJjordz3rtCxNEjbwg/vi2T4VXBSdrgi/x1wbMpFibdHXJFpwOKD7Oimhj/tvvfhggoOr39BeS8RiiHUQzOWUwoRrpaKXuwDyvtAM2At2VI77wh5wVDetg9f81EbGiZ+NxL6eohPxJpBqJ7G1b7HIyupL/3x7EqfLjUw5mVLcm1lM/jF30wsE91Lj3L9MNh/hdlbArhCPtPZ/qIZb4GpV7+/fYYrpdhlaaKU5AW4zzU+lHMG0pN7cczznONBMqjsdNFirTB6v7+q+xX9TJC1QA0p1kOdDrIx8UT4vKYz8tsQBqVBL+6+7Jq2YHlOHQ5PyB5GSQndHWvv+4KzFuRtXLsvGmCUTRn+DmQX+HiKZvDTCzhJ5pyOS7+LaLiZQRlfPY6LG7pLPElMTsedzD4c3DVr/8TDPosZxSQ4WqBJLCmF6Q5ziYiHlhSUyprnfKXcLsBkKyoYX6J6K0heLGAXdU76TXsCi6tHuUPH33xN3CtxCe1Xyd1iNqQereJpt1H/p7jQwzs8/Hp0e2YfSvUnufb20+Z0X/5DKueT/ES3GtpAklqwgpmMCUGdlegq7/hilw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199015)(186003)(8676002)(38070700005)(122000001)(83380400001)(55016003)(71200400001)(478600001)(26005)(54906003)(38100700002)(66476007)(8936002)(66446008)(64756008)(9686003)(52536014)(4326008)(86362001)(76116006)(66946007)(66556008)(7696005)(2906002)(316002)(6506007)(5660300002)(107886003)(53546011)(41300700001)(33656002)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eSs4YzR5U205cXBDN25lckdyRWRxYmZqMXVuWjZyeS9WendqU1NvZ2hFUnBi?=
 =?utf-8?B?MWw5Rm5UV3d6R2cxM3lHTUthUW5uUHdIQXA4WE55bVBxQUw4ZlRRY25aQzh4?=
 =?utf-8?B?UWorYUhORGpmcHhTZnF1SXFKUzBFd3NFam4veDVCc3R2cUNnb253QitOMWNv?=
 =?utf-8?B?TWJiZzNkbGNsbVJOSGUrQkwwbHdldkthSVpLeFRSRVpTamVoNEZuUzdaNjZS?=
 =?utf-8?B?NDNyRGdlT1p2WmFJbU5iTmVreTZIaFU3d1pwRzgxTW5qaTg3czJvamx2Rm5O?=
 =?utf-8?B?RDZiWnV3VEZLdmtqa3VpVVVvMmowQ2VzbVZhS0pqcXhackIvbmtmZ3oxakV4?=
 =?utf-8?B?Mm9DQjhQVTRTQVBsQ2tENWI4YVdGcWVTSkppVkcxTmN2MXZucXV2WHVpSDZH?=
 =?utf-8?B?WldXTkFVYU9qUGNRcnZDM1BCTlVQYWo2eW4wSWFadFp0ejd4bXlCcXlJWEFF?=
 =?utf-8?B?dHBqWWJQVUpCL252YTluN2RxZ24rU1BwdzNkcndOcExwdy9lMHRuSDM0S3pI?=
 =?utf-8?B?dDBQR1VYczdTaHpEb3FETmhTOW5uY1E4ZjF2aHF3UzZRZ2FuU3YyTTJtN05E?=
 =?utf-8?B?aHVnQ2NJb3Z0T0tWd05NdENiT2o4VFo0cjVqVExldk82eEUvUjF4MTBVZEIz?=
 =?utf-8?B?U2VuQTk2aFVMejZ0VGdPRVliOS9DRjZPMUhzU1E3VTJtbjRmTXk4V0lhMlpn?=
 =?utf-8?B?SkdySzdxTlJKeFNWbC9nUW1UOXZZOHk5aFR6NFY2Z0Y4YmdOQVc1VU4xdlRC?=
 =?utf-8?B?ay9yUXZ6RUNFQld5RUZ5Mnp6TFViOWVUWlIwZFVLekxNOXFTTGhGN1dnNUkw?=
 =?utf-8?B?ckhvWjNQOE9zanpsTUxaNURTaCtsVHlvWS9QUUJyR1B6YTJHZ3RNdmtGZ3h5?=
 =?utf-8?B?Q3RyYXc0emxueDk3VlpacjIrSG9OUkVaOUorZFlYN250Tmx0UjFEUm1Rdlh0?=
 =?utf-8?B?ckZzSVVLdnBYNEovT3YyaFBVRWo5R01yMFRNWVZMN0hBb051Z3oyOEN1TkJQ?=
 =?utf-8?B?elI4RFBCbHIyODR2TFM3Y1NLMkVkUERMQXlPQ0RyQy82YmJkb2traWZRY0hM?=
 =?utf-8?B?Q0RZTFBoSG03b2I1VUNVS2FlaFhmejE1Yi9qWC9HTVRHemZ6SlhIbXQraVBj?=
 =?utf-8?B?WS9GQzJxNVZOS2ZWSjJFU2VReGRxMUxGWENmOUE3STlDU216OHN0cFV5NVUy?=
 =?utf-8?B?bTRBMFFydWdHL216Wk1RZ25jWjk0NDJjSmFRbEpERFA4eUdWTzkySW9QcCtD?=
 =?utf-8?B?cGJsNWxSWXU5WVRSdFYzVWd4VTNFQXk5TEoyMDNlK2ZpOTNsa2N4RlZVRWlM?=
 =?utf-8?B?TzJQVEo3WGkrL1N6YVVLWWJ0UExWVWxlUEI3bG5BVEV3WnAvaUgyQStURVQv?=
 =?utf-8?B?WXNuYUVXNXFHTHA2OTZKVGtWVHp5Sy9hSU4ybVNhM1Z6RnA5dVF1cVdDOERk?=
 =?utf-8?B?L2pSNTBoSmZZbER0SHFEM0prUG5uRVhod3RDdUtpZDdCdXE2OFh0K1N3a2VX?=
 =?utf-8?B?UWpGaHM1dVJZZjhEdi8xcVdYSXNZUnNjRlVzazRwdkx3NFMrMURZdnVkclFE?=
 =?utf-8?B?MHlIZkRkUWZxU3FaK3RhWitqVUlwSWt5a2VGaXg3VFdWbnU0QlVWRGZpS2g1?=
 =?utf-8?B?dFpybDNKNTgxTFgvNFRCcDlZU2x2T3dyMEs0Tjd0Njlnait3UnVTVVB5TUo5?=
 =?utf-8?B?Nk5yYkpSeFQwZWF2U3Q3Mm5PUmJHOHlRbDJIeU9QSFZPZTNrd1I5ekZTZ1ZU?=
 =?utf-8?B?aDlXbk5NV2RteHlUdGtGbVBIWmFPL01uRzZ5NFhJeHJhVlRkR01EQ2FoZE9K?=
 =?utf-8?B?TkVUcFJIbjFlakRjM2UwZnkvMi9HR3pCRWZoY0JUbUsrSm41dGN6SVRlN1pH?=
 =?utf-8?B?S1NWN2JsbzQzblg5aDRKS1BwRXVwUUViYmQ4TEZtREVsMTZleTdaZG5nbVZr?=
 =?utf-8?B?VjlYb2FmOEtIUUFRdzlMbXhJNUpCc2xXc21xM1dsbW4wSUtaZHo2YlpFcVBR?=
 =?utf-8?B?Kyt4ajRYNExrUFhJc0JFSTFGWjF6YUZsVE1EZjRXcDExc3RyWWQ3clhUVFZX?=
 =?utf-8?B?L0JkVytTTnd0YktCZUpVQUVNUGpxMDFrZVM0bTBCUVhnZUVIMGZnSHF0VEVQ?=
 =?utf-8?Q?G5zAb+FDibPGoDq1TS8+qInBw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7248bb72-c223-4897-aa5e-08daa13ff85d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 10:55:34.7933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W2dGvEIodJvDqlyYLP3Ejij+LKkwArpNvTKMdm07wP7mnH+8KTOU2kz41+9SIDDO3YZQF+HuseVl4a4vwP4MEYapd2L3o0hhlaJV2TEPT2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5420
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIHRlc3RpbmcuDQoNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2NF0gbW1jOiByZW5lc2FzX3NkaGk6IEZpeCByb3VuZGluZyBlcnJvcnMNCj4gDQo+IEhp
IEJpanUsDQo+IA0KPiBPbiBNb24sIFNlcCAyNiwgMjAyMiBhdCA3OjEwIFBNIEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gRHVlIHRvIGNsayByb3Vu
ZGluZyBlcnJvcnMgb24gUlovRzJMIHBsYXRmb3JtcywgaXQgc2VsZWN0cyBhIGNsb2NrDQo+ID4g
c291cmNlIHdpdGggYSBsb3dlciBjbG9jayByYXRlIGNvbXBhcmVkIHRvIGEgaGlnaGVyIG9uZS4N
Cj4gPiBGb3IgZWc6IFRoZSByb3VuZGluZyBlcnJvciAoNTMzMzMzMzMzIEh6IC8gNCAqIDQgPSA1
MzMzMzMzMzIgSHogPA0KPiA+IDUzMzMzMzMNCj4gPiAzMyBIeikgc2VsZWN0cyBhIGNsayBzb3Vy
Y2Ugb2YgNDAwIE1IeiBpbnN0ZWFkIG9mIDUzMy4zMzMzMzMgTUh6Lg0KPiA+DQo+ID4gVGhpcyBw
YXRjaCBmaXhlcyB0aGlzIGlzc3VlIGJ5IGFkZGluZyBhIG1hcmdpbiBvZiAoMS8xMDI0KSBoaWdo
ZXIgdG8NCj4gPiB0aGUgY2xvY2sgcmF0ZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBUZXN0ZWQtYnk6IFdvbGZyYW0g
U2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+DQo+ID4gLS0tDQo+ID4gdjMt
PnY0Og0KPiA+ICAqIEFkZGVkIFRlc3RlZC1ieSB0YWcgZnJvbSBXb2xmcmFtLg0KPiA+ICAqIFVw
ZGF0ZWQgY29tbWl0IGRlc2NyaXB0aW9uIGFuZCBjb2RlIGNvbW1lbnQgd2l0aCByZWFsIGV4YW1w
bGUuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiBVbmZvcnR1bmF0ZWx5IHRo
aXMgcGF0Y2ggY2F1c2VzIGEgY2hhbmdlIGluIHRoZSBjbG9jayBmcmVxdWVuY2llcyB1c2VkDQo+
IG9uIFItQ2FyIE0yLVc6DQo+IA0KPiAgICAgLWNsa19zdW1tYXJ5OiAgICAgICAgICBzZDAgICAg
ICAgICAgICAgICAgIDk3NTAwMDAwDQo+ICAgICArY2xrX3N1bW1hcnk6ICAgICAgICAgIHNkMCAg
ICAgICAgICAgICAgICAgMzI1MDAwMDANCj4gICAgIC1jbGtfc3VtbWFyeTogICAgICAgICAgICAg
c2RoaTAgICAgICAgICAgICA5NzUwMDAwMA0KPiAgICAgK2Nsa19zdW1tYXJ5OiAgICAgICAgICAg
ICBzZGhpMCAgICAgICAgICAgIDMyNTAwMDAwDQo+IA0KPiAgICAgLWNsa19zdW1tYXJ5OiAgICAg
ICAgICAgICBzZDMgICAgICAgICAgICAgIDEyNzg2ODg1DQo+ICAgICArY2xrX3N1bW1hcnk6ICAg
ICAgICAgICAgIHNkMyAgICAgICAgICAgICAgMTIxODc1MDANCj4gICAgIC1jbGtfc3VtbWFyeTog
ICAgICAgICAgICAgICAgc2RoaTMgICAgICAgICAxMjc4Njg4NQ0KPiAgICAgK2Nsa19zdW1tYXJ5
OiAgICAgICAgICAgICAgICBzZGhpMyAgICAgICAgIDEyMTg3NTAwDQo+IA0KPiAgICAgLWNsa19z
dW1tYXJ5OiAgICAgICAgICAgICBzZDIgICAgICAgICAgICAgIDEyNzg2ODg1DQo+ICAgICArY2xr
X3N1bW1hcnk6ICAgICAgICAgICAgIHNkMiAgICAgICAgICAgICAgMTIxODc1MDANCj4gICAgIC1j
bGtfc3VtbWFyeTogICAgICAgICAgICAgICAgc2RoaTIgICAgICAgICAxMjc4Njg4NQ0KPiAgICAg
K2Nsa19zdW1tYXJ5OiAgICAgICAgICAgICAgICBzZGhpMiAgICAgICAgIDEyMTg3NTAwDQoNClRo
YXQgaXMgbm90IGdvb2QuDQoNCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2Fz
X3NkaGlfY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfY29y
ZS5jDQo+IA0KPiA+IEBAIC0xNTMsMTAgKzE1NCwxNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50DQo+
IHJlbmVzYXNfc2RoaV9jbGtfdXBkYXRlKHN0cnVjdCB0bWlvX21tY19ob3N0ICpob3N0LA0KPiA+
ICAgICAgICAgICogZ3JlYXRlciB0aGFuLCBuZXdfY2xvY2suICBBcyB3ZSBjYW4gZGl2aWRlIGJ5
IDEgPDwgaSBmb3INCj4gPiAgICAgICAgICAqIGFueSBpIGluIFswLCA5XSB3ZSB3YW50IHRoZSBp
bnB1dCBjbG9jayB0byBiZSBhcyBjbG9zZSBhcw0KPiA+ICAgICAgICAgICogcG9zc2libGUsIGJ1
dCBubyBncmVhdGVyIHRoYW4sIG5ld19jbG9jayA8PCBpLg0KPiA+ICsgICAgICAgICoNCj4gPiAr
ICAgICAgICAqIEFkZCBhbiB1cHBlciBsaW1pdCBvZiAxLzEwMjQgcmF0ZSBoaWdoZXIgdG8gdGhl
IGNsb2NrDQo+IHJhdGUgdG8gZml4DQo+ID4gKyAgICAgICAgKiBjbGsgcmF0ZSBqdW1waW5nIHRv
IGxvd2VyIHJhdGUgZHVlIHRvIHJvdW5kaW5nIGVycm9yIChlZzoNCj4gUlovRzJMIGhhcw0KPiA+
ICsgICAgICAgICogMyBjbGsgc291cmNlcyA1MzMuMzMzMzMzIE1IeiwgNDAwIE1IeiBhbmQgMjY2
LjY2NjY2NiBNSHouDQo+IFRoZSByZXF1ZXN0DQo+ID4gKyAgICAgICAgKiBmb3IgNTMzLjMzMzMz
MyBNSHogd2lsbCBzZWxlY3RzIGEgc2xvd2VyIDQwMCBNSHogZHVlIHRvDQo+IHJvdW5kaW5nDQo+
ID4gKyAgICAgICAgKiBlcnJvciAoNTMzMzMzMzMzIEh6IC8gNCAqIDQgPSA1MzMzMzMzMzIgSHog
PCA1MzMzMzMzMzMNCj4gSHopKS4NCj4gPiAgICAgICAgICAqLw0KPiA+ICsgICAgICAgbmV3X3Vw
cGVyX2xpbWl0ID0gKG5ld19jbG9jayA8PCBpKSArICgobmV3X2Nsb2NrIDw8IGkpID4+DQo+IDEw
KTsNCj4gDQo+IE1lYSBjdWxwYTogd2hpbGUgbmV3X2Nsb2NrIGlzIGEgY29uc3RhbnQgaW5zaWRl
IHRoZSBsb29wLCBpIGlzIG5vdCENCj4gU28gaXQgc2hvdWxkIGJlIG1vdmVkIGJhY2sgaW5zaWRl
IHRoZSBsb29wIGJlbG93Lg0KPiBXaXRoIHRoYXQgY2hhbmdlLCBSLUNhciBNMi1XIGlzIGhhcHB5
IGFnYWluLCBhbmQgSSBub3RpY2VkIG5vDQo+IHJlZ3Jlc3Npb24gb24gUi1DYXIgSDMgRVMyLjAu
DQoNCk9LLg0KDQo+IA0KPiA+ICAgICAgICAgZm9yIChpID0gbWluKDksIGlsb2cyKFVJTlRfTUFY
IC8gbmV3X2Nsb2NrKSk7IGkgPj0gMDsgaS0tKSB7DQo+ID4gICAgICAgICAgICAgICAgIGZyZXEg
PSBjbGtfcm91bmRfcmF0ZShyZWZfY2xrLCBuZXdfY2xvY2sgPDwgaSk7DQo+ID4gLSAgICAgICAg
ICAgICAgIGlmIChmcmVxID4gKG5ld19jbG9jayA8PCBpKSkgew0KPiA+ICsgICAgICAgICAgICAg
ICBpZiAoZnJlcSA+IG5ld191cHBlcl9saW1pdCkgew0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIFRvbyBmYXN0OyBsb29rIGZvciBhIHNsaWdodGx5IHNsb3dlcg0KPiBvcHRpb24gKi8N
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBmcmVxID0gY2xrX3JvdW5kX3JhdGUocmVmX2Ns
aywgKG5ld19jbG9jayA8PA0KPiBpKSAvIDQgKiAzKTsNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoZnJlcSA+IChuZXdfY2xvY2sgPDwgaSkpDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eIFByb2JhYmx5IHRoaXMNCj4gc2hvdWxk
IGJlY29tZSBuZXdfdXBwZXJfbGltaXQgdG9vLCBmb3IgY29uc2lzdGVuY3k/DQo+IEl0IGRvZXNu
J3Qgc2VlbSB0byBtYXR0ZXIgaW4gbXkgdGVzdGluZywgdGhvdWdoLg0KDQpPSy4gV2lsbCBkbyB0
aGUgYmVsb3cgY2hhbmdlIGluIG5leHQgdmVyc2lvbi4NCg0KLQluZXdfdXBwZXJfbGltaXQgPSAo
bmV3X2Nsb2NrIDw8IGkpICsgKChuZXdfY2xvY2sgPDwgaSkgPj4gMTApOw0KIAlmb3IgKGkgPSBt
aW4oOSwgaWxvZzIoVUlOVF9NQVggLyBuZXdfY2xvY2spKTsgaSA+PSAwOyBpLS0pIHsNCiAJCWZy
ZXEgPSBjbGtfcm91bmRfcmF0ZShyZWZfY2xrLCBuZXdfY2xvY2sgPDwgaSk7DQorCQluZXdfdXBw
ZXJfbGltaXQgPSAobmV3X2Nsb2NrIDw8IGkpICsgKChuZXdfY2xvY2sgPDwgaSkgPj4gMTApOw0K
IAkJaWYgKGZyZXEgPiBuZXdfdXBwZXJfbGltaXQpIHsNCiAJCQkvKiBUb28gZmFzdDsgbG9vayBm
b3IgYSBzbGlnaHRseSBzbG93ZXIgb3B0aW9uICovDQogCQkJZnJlcSA9IGNsa19yb3VuZF9yYXRl
KHJlZl9jbGssIChuZXdfY2xvY2sgPDwgaSkgLyA0ICogMyk7DQotCQkJaWYgKGZyZXEgPiAobmV3
X2Nsb2NrIDw8IGkpKQ0KKwkJCWlmIChmcmVxID4gbmV3X3VwcGVyX2xpbWl0KQ0KIAkJCQljb250
aW51ZTsNCiAJCX0NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=
