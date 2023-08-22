Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD9C784135
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 14:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235123AbjHVMvO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 08:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbjHVMvN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 08:51:13 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF81CC1;
        Tue, 22 Aug 2023 05:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCJ7tpPiHKDRbJZABCbniEyNtI8PPmm7njfFQTgLQmV+RWgZ7MiDrD2vJ0NisITTYpnskOXkgPdeSsonNfskaQvylGQOFELTGq+Td4T31bK79sE7er/0I85Be0YS+yxVYOZEuX2OVTfFfCzCdlfkGTSc1YaMnKeSifWJDol/mFUX3an3bIdO//xyP1GMxQIr4KGtcBy4AudAO/JBeOcc0BvJyqKezVlnIEC4tOyIvzXTfRvXYw+3bfeJ77gcAEz8Q0rL+BfhZaDTeZbsGbSPrRTHE1DLdTXczNsQVEjCLMr8AtzOkQMrb2AR/Vi00M2v3z2/lhWf4o7QIG1shPCaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A69C5hUHmqsVsivblBV5YFMeLFY9K5/8uckVdCU1xdU=;
 b=kccmuz+W1WT9fWEa7Q0ZJA5oNc6lQ0lwRlhuhFeFaSQr8oXAM/lXf/JrRgac1TplKyS7pBPWOmwgwf4Tmn8bHniEP/zz9z6w9BIEJb7XBBBtxso2nfI+IsUwckZBH8Vlm2U3KkxZERtQMlPVL7cZSk6nVVZSeRpKKccjlOKZ1i87tZlHYhjt1KXkRdTAMrYqIDKJX4Yy9es6CeVsWnAIqa+dDH3dqv5zG/fdxdno8H0kg7OVBrKi5CuChGIvM0I3RhibqbE/eQ9bWpDuYfuM4IOgSQAeZO8o0HCwCRPMMUcwswE+UlHjpxbQw6apERD1v2c5lDXLdHWQJ55GKP/lwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A69C5hUHmqsVsivblBV5YFMeLFY9K5/8uckVdCU1xdU=;
 b=pVJa9CDqLUtPxThsEu3l5sT76KVl93UcL728vAKMUpb5c+xnx8L547Cx+J93VFUFQfc5d76t5Gk2r/fYVkG4oi9NIykXk3UAYwfACPXK1tQStnS25UkLjnyDhYX8vRkuayVQ1D+ET5gqLYIXYP56INaWNYRagz+tN2xfRDDEIzY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9461.jpnprd01.prod.outlook.com (2603:1096:604:1cc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 12:51:07 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%7]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 12:51:04 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: RE: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for
 data in the match tables
Thread-Topic: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for
 data in the match tables
Thread-Index: AQHZ05ZTk3glzaSVW0+92976qL4cHa/0uMsAgAAGj4CAACC6gIAABEKAgAAYvgCAAO48gIAASZkAgAAESoCAAAJkAIAACjFA
Date:   Tue, 22 Aug 2023 12:51:04 +0000
Message-ID: <OS0PR01MB5922715864D3A25CFBFD0922861FA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-3-biju.das.jz@bp.renesas.com>
 <ZONgzqlS8bGP0umn@smile.fi.intel.com>
 <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com>
 <ZOOBw/3fqdinIwCh@smile.fi.intel.com>
 <CAMuHMdW8mqtceDxuZ4Ccq0Wrg8ySfFzVC3OBB0AqvfSR-54KYA@mail.gmail.com>
 <ZOOaFioDSpasda82@smile.fi.intel.com>
 <CAMuHMdU_4Mg==Jh14K0ecVXfLCDt-RbNia5gCwLPjPj3tBQbsA@mail.gmail.com>
 <ZOSfrHUDpaax1FS4@smile.fi.intel.com>
 <CAMuHMdVwy72utSLBFro7emgG5Hx6xzD8MHwXczAyJJvBpVDgYg@mail.gmail.com>
 <ZOSlRhLiYoZmcDfT@smile.fi.intel.com>
In-Reply-To: <ZOSlRhLiYoZmcDfT@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9461:EE_
x-ms-office365-filtering-correlation-id: ed39ff21-0542-4365-8d95-08dba30e7247
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dluelS8InSPmHfHwXtMIdeQfkF4zLpcfkyvNjm2FJ9LpHhpoFI0/+sqYDj/i77e1C4t/C3Vwmou7y2ZNPiUi78Z2PgS/VBdis8uaLY1qyA8+bs5yY26Et5MpqonTAanohfYlChQ6ROaMAGZZOyfLr2lC+svYyDeRHKmnI+WEGMyQRQjCXSPvut7g24HVKpOaluJP+HY+NCBiAUiCbwPkezo7z8BfcFVxJbmTt+Cr9R9tyi/kEZ4yuATuZe4VReXddh8/oG6IZZW+bNhCRxFm+V8AMXP+uWVOERZX0iYoHItU9sUIxgrVNb8oAvoTD+pgx5ROxbwKNY864cCbQfTodsvp++PapSwM6p2vi40xI1/wmcSTOWYLQEye/vSAiPQil9XBRGoOFspnL5It0FPS28T1WY2iWkQj51NO0WTLTBJazd1chRDljnFDVPQLW+Fxlrl2JvA3PhiLTvCWtyiaDE8dxMU/tK8LTzkHiDbGujUsRygiyfkvk5yuq7LEBgXM580FkNeGw7SudYzD1EbdP8iN9ydonBFzv7d6Ripg/gZ2AgWclvvcaQ9nAQlp7LiajaPdygs+k9j/iidxCFNQOtK291g0RDkCPvlBaPRCkNrEnOeYRvPDLMdpoYvp0Haw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(54906003)(76116006)(66446008)(66476007)(66556008)(64756008)(316002)(9686003)(66946007)(110136005)(8676002)(8936002)(4326008)(41300700001)(122000001)(478600001)(55016003)(71200400001)(38100700002)(38070700005)(53546011)(6506007)(83380400001)(2906002)(7416002)(86362001)(7696005)(5660300002)(26005)(33656002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmIyaU9ld0dLMTBwV28wMzFoOXdZMm1UNEVqNFloQ2hJNlJmbGVabUk2czF4?=
 =?utf-8?B?alYvdHRDWjZ5STBqVkQzUWJmckZyY2R2T0VUNzJ6M3c1ekRaTSt4YStNVUVM?=
 =?utf-8?B?REh0RHVmZlI1SnFHTUxkN1l1ejYxQTRjME5iTnVrcFc4bXNERytZcCszbmlk?=
 =?utf-8?B?ek15NnFHQVFXVzZ1NStwcW1XZlQrN2lsWWhva0t4aXFTWmhrclF5MDJNcWg5?=
 =?utf-8?B?cWx6bGVOYnZCRFcxeElyTmJhRWVqZTNESnVKUUV0UGgrUnZtb1AvQng3SGJm?=
 =?utf-8?B?a0RzcmNHZkFMUU14QnNPS2xKbkQ3TzdISGhIUlZpOTJOekpjelVSOU0xVlM5?=
 =?utf-8?B?L0NFRmlDRTRJamdVOTRNV3E4cklRczgyazJvdmhDRUF3anh6SDgvc1lVV21L?=
 =?utf-8?B?RUY4SEFNRWJBOHYva2NUTGpoNStENzlYMVF6MUIwUEdsS0pyVjlpM3owUXVB?=
 =?utf-8?B?RVdlRkJTSFUzOGZRZFB5cW5hMUZUVk51TnFtSVZwbXNhMmV4S3hBRHBONVQ3?=
 =?utf-8?B?dURCRlRzWWxzT2pEZTF0aEdMUVUwUmIvNFhGWFJTRXZ3Unp5WXdadlBSaFN5?=
 =?utf-8?B?NUVRZkRFa3NwVnpRUlcvWVpuV1V6TVdVTTBCNDFySEY1SUlBS0xWR0dsbHJx?=
 =?utf-8?B?ZVBubVNMOHR5N3JNMTFyOFk2VS93cnVSVUM1NTlkWkR4NzZtTURVbllHMmsv?=
 =?utf-8?B?Q29BSWFCQVZhcldJckpRSmJRa0M4dmRaUnIxZ0NLRnl0Y3FsekdFQmxqN3ps?=
 =?utf-8?B?bktvd0RPeExmOWpIb3d4bWVTZE1zYUxzdmZxWWh6ODNxaHNPcGZob29odEoy?=
 =?utf-8?B?aTErTTN3ZU5YYWd2K0pyN3FIRWVIdGl0YnN4OGlZQWFGTjlBSGdZN0FtNFZN?=
 =?utf-8?B?Sm1aaE5uVzErVUFab1hpRVo0RkFuejJjZDVHUWpiL0kvVTI4S0I1dVVxVU0r?=
 =?utf-8?B?L0J4U296alhMVXNBRU9qOEZCa2lSVmVDbHVCOWY3d2dFUmJtZGozNW1Ka0Ns?=
 =?utf-8?B?Sm5Bb2NSVFM4bW9JSGN3VnNuRGQ4Qit4MVFGQ0dNQ0drU0UraDNUWE9BQURk?=
 =?utf-8?B?RjQ5Q2J6ckYrSThBY2NVQ2pLLytpaXI1RXN3VXJIYmRKQkxnTnBQWXNzZmFq?=
 =?utf-8?B?eUhYeWlSeXVYL2tnOGpPMnBGWUE0NkJDYjkyZHZjanduMy9uUng2VmMyWUNq?=
 =?utf-8?B?d0JUWTRJcjhKbm5aV3pHREgySXNta3NiVVlvYkJRQlhiR2ZQNWM3Z0NzQXR2?=
 =?utf-8?B?NEwwb2MzZmpkaDNhcEUzdUYzZkFhN21qRFVMcDNZTnVYUERmZ3k1WkFaV2Vm?=
 =?utf-8?B?bmprVGhROTArSEdvaHVOa2UzVFloMVhGNitrc1JhL2hZU2tncmdCTW1pNEEr?=
 =?utf-8?B?TEZJOGVKbzFMMzRZbU5hN29yNGdUZWs1VTBla3J4TWpQc3dvUWhFNUlvSnFq?=
 =?utf-8?B?cWUyYnZkUjh5V3JLcVF1ckJhNVl4REFJcm1hNExxd0dHV0VOMXB0eEhiNjhs?=
 =?utf-8?B?d1djN0VxNjNSc2JCSUpTYUxBeEt3WU9hTlJ3SS9GNUo5clp1RG5xRGtFNktT?=
 =?utf-8?B?RVh1VnR0VTBMbGx1dDJRNEN5V2x3SDFtdU03SEs5dlU3VGJpQ2RnTVJ5aksx?=
 =?utf-8?B?TG5XTGpGYmdnd2cvZlFjakdNTUFXdXZWOGd0QTRadjdXRUdTVTNxbUN6aUIw?=
 =?utf-8?B?aVhqQzRmNDlONnBtZVAvUmtwc2JPbG11U3RnaHFTcEZjaHZzZks5TzJSaHdL?=
 =?utf-8?B?bWFETklBY0srUEFpbUtMVHEvZ2lEMFAyR0Nqd1BzNldFeFI0bThaYXBucjBD?=
 =?utf-8?B?QWhINzR0bjhQRndWVEZqWUlGRUxuQ2tCZjFlREVIMTEyNi9xRUppaHZkaFNO?=
 =?utf-8?B?cjBLWlhnRkg5OWFoWmlWeFZ3Y0Y5WnZ2dW5NbWZLSVNBZnZQakVKRHRxeFdw?=
 =?utf-8?B?OW5jN0ZUY1BqQktiZ2orL0hMRUMvZUtrZ09oTWtFbnl1NGcvNGNUeWRhSXR0?=
 =?utf-8?B?S0NOZ2pmTENBZlpFUysvNEJxcG1oT01wTm5icVBIOVU5MWtiQ09tZHVTcDhh?=
 =?utf-8?B?NkNXS0xGSUNjYk91NUZzZ2JvR29jWWxGWkp1enR2ZnAweFRqeVRUeEt4cy9s?=
 =?utf-8?B?bWJLVDNyd3ZaTlZXV2ZKMXpLL29ERFc4RW1NNWwwR3dVREk5dlpqbGhlTXFH?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed39ff21-0542-4365-8d95-08dba30e7247
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 12:51:04.5003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V/d2MlgxfBZrgMbPrSSoXsyTm9mmB3/5bm/Z8Osi9FklaVDBY6kPsMnKRmy+oOTsD5/u4iuB3g3KAe2cAEPmGuWS6TDM4x4mcRkCeFQRLA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9461
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvNF0gdXNiOiB0eXBlYzogdGNwY2lfcnQxNzExaDogQ29u
dmVydCBlbnVtLT5wb2ludGVyDQo+IGZvciBkYXRhIGluIHRoZSBtYXRjaCB0YWJsZXMNCj4gDQo+
IE9uIFR1ZSwgQXVnIDIyLCAyMDIzIGF0IDAyOjAwOjA1UE0gKzAyMDAsIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZToNCj4gPiBPbiBUdWUsIEF1ZyAyMiwgMjAyMyBhdCAxOjQ04oCvUE0gQW5keSBT
aGV2Y2hlbmtvDQo+ID4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6
DQo+ID4gPiBPbiBUdWUsIEF1ZyAyMiwgMjAyMyBhdCAwOToyMToxOUFNICswMjAwLCBHZWVydCBV
eXR0ZXJob2V2ZW4gd3JvdGU6DQo+ID4gPiA+IE9uIE1vbiwgQXVnIDIxLCAyMDIzIGF0IDc6MDni
gK9QTSBBbmR5IFNoZXZjaGVua28NCj4gPiA+ID4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4Lmlu
dGVsLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gT24gTW9uLCBBdWcgMjEsIDIwMjMgYXQgMDU6NDA6
MDVQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+ID4gPiA+ID4gT24gTW9u
LCBBdWcgMjEsIDIwMjMgYXQgNToyNeKAr1BNIEFuZHkgU2hldmNoZW5rbw0KPiA+ID4gPiA+ID4g
PGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+
IE9uIE1vbiwgQXVnIDIxLCAyMDIzIGF0IDAzOjI3OjQzUE0gKzAyMDAsIEdlZXJ0IFV5dHRlcmhv
ZXZlbg0KPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiBPbiBNb24sIEF1ZyAyMSwgMjAyMyBhdCAz
OjA04oCvUE0gQW5keSBTaGV2Y2hlbmtvDQo+ID4gPiA+ID4gPiA+ID4gPGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBPbiBTdW4sIEF1
ZyAyMCwgMjAyMyBhdCAwNzo0NDowMFBNICswMTAwLCBCaWp1IERhcyB3cm90ZToNCj4gDQo+IC4u
Lg0KPiANCj4gPiA+ID4gPiA+ID4gPiA+IEZvciBhbGwgeW91ciB3b3JrIGxpa2VzIHRoaXMgYXMg
SSBub3RlZCBpbiB0aGUgcmVwbHkgdG8NCj4gPiA+ID4gPiA+ID4gPiA+IEd1ZW50ZXIgdGhhdCB0
aGUgY291cGxlIG9mIHRoZSBzZWxsaW5nIHBvaW50cyBoZXJlIGFyZToNCj4gPiA+ID4gPiA+ID4g
PiA+IDEpIGF2b2lkYW5jZSBvZiB0aGUgcG9pbnRlciBhYnVzZSBpbiBPRiB0YWJsZQ0KPiA+ID4g
PiA+ID4gPiA+ID4gICAgKHdlIG5lZWQgdGhhdCB0byBiZSBhIHZhbGlkIHBvaW50ZXIpOw0KPiA+
ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gVGhlcmUgaXMgbm8gcG9pbnRlciBhYnVzZTog
Ym90aCBjb25zdCB2b2lkICogKGluIGUuZy4NCj4gPiA+ID4gPiA+ID4gPiBvZl9kZXZpY2VfaWQp
IGFuZCBrZXJuZWxfdWxvbmdfdCAoaW4gZS5nLiBpMmNfZGV2aWNlX2lkKQ0KPiA+ID4gPiA+ID4g
PiA+IGNhbiBiZSB1c2VkIGJ5IGRyaXZlcnMgdG8gc3RvcmUgYSBtYWdpYyBjb29raWUsIGJlaW5n
IGVpdGhlcg0KPiBhIHBvaW50ZXIsIG9yIGFuIGludGVnZXIgdmFsdWUuDQo+ID4gPiA+ID4gPiA+
ID4gVGhlIHNhbWUgaXMgdHJ1ZSBmb3IgdGhlIHZhcmlvdXMgdW5zaWduZWQgbG9uZyBhbmQgdm9p
ZCAqDQo+ICJkcml2ZXJfZGF0YSINCj4gPiA+ID4gPiA+ID4gPiBmaWVsZHMgaW4gc3Vic3lzdGVt
LXNwZWNpZmljIGRyaXZlciBzdHJ1Y3R1cmVzLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiAodm9pZCAqKTUgaXMgdGhlIGFidXNlIG9mIHRoZSBwb2ludGVyLg0KPiA+ID4gPiA+ID4gPiBX
ZSBjYXJyeSBzb21ldGhpbmcgd2hpY2ggaXMgbm90IGEgdmFsaWQgcG9pbnRlciBmcm9tIGtlcm5l
bA0KPiBwZXJzcGVjdGl2ZS4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBCdXQgdGhlIGRhdGEg
ZmllbGQgaXMgbm90IHJlcXVpcmVkIHRvIGJlIGEgdmFsaWQgcG9pbnRlci4NCj4gPiA+ID4gPiA+
IFdoYXQga2luZCBhbmQgdHlwZSBvZiBpbmZvcm1hdGlvbiBpdCByZXByZXNlbnRzIGlzIHNwZWNp
ZmljIHRvDQo+IHRoZSBkcml2ZXIuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBXaGVyZSB0byBmaW5k
IG5lY2Vzc2FyeSBpbmZvcm1hdGlvbiB3aGljaCBpcyBub3QgYWx3YXlzIGFuIGludGVnZXINCj4g
Y29uc3RhbnQuDQo+ID4gPiA+ID4gRm9yIGV4YW1wbGUsIGZvciB0aGUgZHJpdmVyIGRhdGEgdGhh
dCBoYXMgY2FsbGJhY2tzIGl0IGNhbid0IGJlDQo+IGludmFsaWQgcG9pbnRlci4NCj4gPiA+ID4N
Cj4gPiA+ID4gSWYgdGhlIGRyaXZlciB1c2VzIGl0IHRvIHN0b3JlIGNhbGxiYWNrcywgb2YgY291
cnNlIGl0IG5lZWRzIHRvIGJlDQo+ID4gPiA+IGEgdmFsaWQgcG9pbnRlci4gQnV0IHRoYXQgaXMg
aW50ZXJuYWwgdG8gdGhlIGRyaXZlci4gIEl0IGlzIG5vdA0KPiA+ID4gPiB0aGF0IHdlJ3JlIHBh
c3NpbmcgcmFuZG9tIGludGVnZXIgdmFsdWVzIHRvIGEgZnVuY3Rpb24gdGhhdA0KPiA+ID4gPiBl
eHBlY3RzIGEgcG9pbnRlciB0aGF0IGNhbiBhY3R1YWxseSBiZSBkZXJlZmVyZW5jZWQuDQo+ID4g
PiA+DQo+ID4gPiA+ID4gU2luY2UgT0YgSUQgdGFibGUgc3RydWN0dXJlIGlzIHVuaXZlcnNhbCwg
aXQgdXNlcyBwb2ludGVycy4NCj4gPiA+ID4gPiBNYXliZSB5b3UgbmVlZCB0byB1cGRhdGUgaXQg
dG8gdXNlIHBsYWluIGludGVnZXIgaW5zdGVhZD8NCj4gPiA+ID4NCj4gPiA+ID4gSXQgaXMgZmFp
cmx5IGNvbW1vbiBpbiB0aGUga2VybmVsIHRvIHVzZSB2b2lkICogdG8gaW5kaWNhdGUgYQ0KPiA+
ID4gPiBkcml2ZXItc3BlY2lmaWMgY29va2llLCBiZWluZyBlaXRoZXIgYSByZWFsIHBvaW50ZXIg
b3IgYW4gaW50ZWdyYWwNCj4gPiA+ID4gdmFsdWUsIHRoYXQgaXMgcGFzc2VkIHZlcmJhdGltLiAg
U2VlIGFsc28gZS5nLiB0aGUgImRldiIgcGFyYW1ldGVyDQo+ID4gPiA+IG9mIHJlcXVlc3RfaXJx
KCkuDQo+ID4gPg0KPiA+ID4gWWVzLCB0aGF0IHBhcmFtZXRlciBpcyB2b2lkICogZHVlIHRvIGNh
bGxpbmcga2ZyZWUoZnJlZV9pcnEoLi4uKSkuDQo+ID4gPiBTbywgdGhhdCdzIGFyZ3VtZW50IGZv
ciBteSBjb25jZXJucy4NCj4gPg0KPiA+IFNvcnJ5LCBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyBj
b21tZW50Lg0KPiA+IChrZnJlZShmcmVlX2lycSguLi4pKSBpcyBvbmx5IGNhbGxlZCBpbiBwY2lf
ZnJlZV9pcnEoKT8pDQo+IA0KPiBQYXNzaW5nIHZvaWQgKiBmb3IgYSAiZHJpdmVyIGNvb2tpZSIg
bWFrZXMgc2Vuc2UgZHVlIHRvIHBvc3NpYmlsaXR5IG9mIHRoZQ0KPiBwYXNzaW5nIGl0IHRvIG90
aGVyIGZ1bmN0aW9ucyB0aGF0IHdhbnQgdG8gaGF2ZSB2b2lkICogYXMgeW91ciBleGFtcGxlDQo+
IHNob3dzLg0KPiBBbmQgdGhhdCBzdXBwb3J0cyBteSBpZGVhIG9mIGhhdmluZyB2b2lkICogb3Zl
ciB0aGUgdW5zaWduZWQgbG9uZy4NCg0KVS1ib290IGFsc28gdXNlcyB1bnNpZ25lZCBsb25nIGZv
ciAuZGF0YSBpbiBzdHJ1Y3QgdWRldmljZV9pZC4gVGhlcmUgbWF5IGJlIGEgcmVhc29uIGZvciBp
dCBpbnN0ZWFkIG9mIHZvaWQqID8/DQoNCkNoZWVycywNCkJpanUNCg==
