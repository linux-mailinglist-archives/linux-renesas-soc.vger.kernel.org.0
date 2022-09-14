Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 408655B8112
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Sep 2022 07:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiINFoo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Sep 2022 01:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiINFom (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2022 01:44:42 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F2EDED6;
        Tue, 13 Sep 2022 22:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hg2f9dTkKhQdGXdhhUFTPV797G2P58aK+tk+wcnhNUYNzCxB7T5f0eKZbyULRzjp+obythsuWoFItRB+AjDiccpbSwQUcDjpfWTXrRvnGNmtJUcNIEfSClhqKi0mCOSJzs37eETkZMpYyJRCU5QZMGmbeJJNkaVlMUH1KyqvkzIhnOB7cF7VHFQMfVbJSdzREelyJdyJ5FqGPuXwg7Y0BlKyZVGcCUfp+CyCo1xBmmGW4p6GnorK6s6VZ4CpiD1+6syf8TnWCIO8B2vX/exR5doHGuv5jk+1oAjkae38OdncvxHiZByN/dNEzoHwCkAme68zuNNo3A79i9Y3lH0QGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32j6UjvmWYRoWBfRhn25Ml6w9E/KIgiGkqAXLf04KFQ=;
 b=YsptxrWen7TAyI/dd0k6rPGHRrSjjt50IVfVaL6g4W59M/t+5DiRkR20rK5OPAyGe3nnKd6WWGyNXZD8SSOvDOEmqQFzgLht3d3dGDCGmTaFZDphrykyhx2mdq6e+4UiPQseBofjXKjOy6kwxPdiRxtEYRC3Anw8s5OO/vBs+dJWbFM5fsLAtGCYEFG14Y8jRDbts2psK0Pt43FliRMFkm1zL8GP1F7sdX9SMcrRLjT9eOzduU9Dntzel6udRiEa9ZetY26BagTvu1iHU3YY8MTvwW5D8BKDwSOIAUJXtjJaMgWcW40ZC2nzixphlfaVdMfB0S0aQDERYQTc0LTb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32j6UjvmWYRoWBfRhn25Ml6w9E/KIgiGkqAXLf04KFQ=;
 b=qD/3doH5EcgMzPdfANNV0zGRs802OMzsl0bRC1EzN5BQoVCNgi/l8flpQtFg0BYVpah0pcTE5YnGoB7raWSHLHOCVw96VcvAP6unqq2tHAGHM5WvC0wvmLyqTno2TsHk03y2X+qZ324uC62P7z0gs0DqjhooGLouvYMx6orBfXI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8658.jpnprd01.prod.outlook.com (2603:1096:400:15e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 14 Sep
 2022 05:44:37 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f%3]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 05:44:37 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] mmc: renesas_sdhi: Add margins for main clock and hs
 clock
Thread-Topic: [PATCH] mmc: renesas_sdhi: Add margins for main clock and hs
 clock
Thread-Index: AQHYx4wC10b6ZMAwoESpl81Rqm30zK3dmNGAgAAAmPCAAM/ZYA==
Date:   Wed, 14 Sep 2022 05:44:37 +0000
Message-ID: <OS0PR01MB5922BA53872389BBDBA8A72E86469@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220913161506.1817432-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWLRyW_6oTxK1eWXoJ0e=XS=p90yQPHB7kJANTj5Xk9vQ@mail.gmail.com>
 <OS0PR01MB59228767EFF2C9FA75D01B9486479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59228767EFF2C9FA75D01B9486479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8658:EE_
x-ms-office365-filtering-correlation-id: 3ce36645-b52b-46e8-5929-08da9614360d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PrSc91x2e/GvopVFOGFRBbDPkWBaEPPmr1GJiQ2+0UEAGLNJdLseIYfLqsQOSj9tRPQdvMFubw1iRrLb7Izh8MVVoi2FrAlazeXtzJO0if4UYsMcWIjbhgKwvcUN3/0NDDum7QOcbQbvfjq7BlCqTEdwZXcp2SPt2b3tJ6j2JCjm92NEP5krXsiizYSd6+1NMzyZwYdsAM0TyvcF936cwlWPoAaNirukb2MGD81FdysZb97y9/sAINqVk5JqlNWCPASBRJ0Kd+Q9PWZuvR1CYUmQNNeaVk07vDJKiBpG6BkVmo26Qpb86pNbNKqW/EQyyhJk4KN/Ck+M6bx5Gnl1IBNyOjEbQMWixUFhwQ+QjnFs4/R2d3vALl3AFtFBMkOs+6ybxx9L7MC/vMMQnThWQDCjQjBrCJze7WKgRKwn51T18aCYdzIrLvUSAGHUWyX7kV7DUn6v0bbIRtHAc1+2lbmiW9F6flc6oroE/0vxm2T7W51Wz8LPiOjQRBQYUghaYQD6DOozEs1L4hV7zxv5XmHsLlQcDq5dzVvUGSMhz92xwRiifktRM0hd+JacwysOgw0Zbca4hA3nDg4hlRFhQeQdIY5uAMArD5+9sUbF7zBfK/8dwWXz028ggAfOsCl9jg3Yt+Y7p3Xiyg2UmRi2snOWHqXxI+A4Fe1JRiK3+Dj47GEI5pNVI87N6iohRfWCWjLTd8mr0qla41UVCzt0jmTd8mLSW1ENWUB6joVIin8bERqr43ZikJA9B0GlxmQM985/z1Nq/0aX/wmGSca3AQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(451199015)(122000001)(316002)(478600001)(33656002)(38100700002)(55016003)(83380400001)(4326008)(2906002)(66476007)(76116006)(26005)(66446008)(6506007)(6916009)(54906003)(8676002)(52536014)(8936002)(86362001)(5660300002)(66946007)(71200400001)(66556008)(38070700005)(64756008)(107886003)(186003)(9686003)(53546011)(7696005)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUM2VllXUzNUMGpvVmJyb204cnMyMDkrY3Y0OWdLQ1l3RERPWVBKb0gxdXR2?=
 =?utf-8?B?c0cvbVNOZU5RS0dFTjdwajQwMThSd0pYcFNndEw2eFhJZU8xMm42ZzlXSm1o?=
 =?utf-8?B?UDdXSkt6enFXWkdlVkVXME5jYUkvWTlPVTBVbGRsK2prT1R6OFZOTHlMLzBn?=
 =?utf-8?B?ai9sN2JFZVY1QmhXd0tXcmxXa1ZVdVhqRmV0bm5ON1FLR3A3ZVBVZ3pRVWgr?=
 =?utf-8?B?UUNOeVQ5S3Bzc04wRmtKelpadW8wdGFLcnI4SU5GK09EemFOemFMd0d1ZVNZ?=
 =?utf-8?B?MFcvQlljNzU2KzIwOHB6dUlBNmVvbjJBNUZlK3VrS0xGQmJVMEtnaFI4ZU9q?=
 =?utf-8?B?ekxUVjN5NU1EUG94em1NWU9Ra1grRTM0YXduUWkxbVliY3U5WEdDRjNSZUVz?=
 =?utf-8?B?VUpwZXBpSE9tbEt2YzE5Q3FUZHhTdVNtWGIxclpkRnplYXhRNWJhS3pLcFV0?=
 =?utf-8?B?T1NJVHZ5cHlXaDVXNHhua0NpQ2lsaVVpN2dxMmUwTmZNYkV4TmRuR2hIeWNK?=
 =?utf-8?B?VG5KalFDdHlaWUF0bldqdWtYbGcxSkVtamhJT055NXJURHZpSFdKbkVjUURa?=
 =?utf-8?B?TDJ6Q04zZ2N4U1B2SHM0K0pENGRmTy9JaHpOMERSamNXMlJpNUNJYzNqclRz?=
 =?utf-8?B?bXpEZDFvL0wrdldlUWFtbHZpOXNKZEdPYmp4NlB5cWlENE5LNkp6V3FyM2Zh?=
 =?utf-8?B?TlFScnlXdUtsMGtleGpES0dvaVhKNHhhZTczdjIveUd3TitaeW5ucjFOS2hT?=
 =?utf-8?B?TXk4T2kyME9yb0NZS1BoUWJESXpTdFpRRTROUFB2SmRNSlN6V3EyYjFzdHVy?=
 =?utf-8?B?Q0tyL296YVo4MFArRzhkOXpjTmZoSGZvTG9aZzhVWnJOTC9WU0ZLMUloUFhT?=
 =?utf-8?B?SE1mVEYybHRHYmsyV3hzVlN6eUU2OFVBblM4aDh2Z1hGZTFBWndHMVIrT09I?=
 =?utf-8?B?cXhrZlI1ZDN2Q0hqbldDRFkyeWZFbjUrRXdCbFdtVG5jdHlscWF1L2UwTFd2?=
 =?utf-8?B?Y2tlcnRONWFsYVRlazd0Z29lUWZsendOUUZKSWsySlJBNVhJWTlKTXBUeTUy?=
 =?utf-8?B?MEcrZ3VUNkdZUll2TjFremk5MEFhenhadWJVcE85U3gycFhaekV5bHVab0FI?=
 =?utf-8?B?cUV2Q3ZzLzdGUHZOUG1wb09ta29VbHNBVDMxNmd2bWFIWE9zZ3E0K0dZRFhE?=
 =?utf-8?B?WWpJdnVlY09SczBMdW5ReUkrcGIwb2xhWWZCU3hxWEJTaUdoTi9Id2o5Tmpx?=
 =?utf-8?B?TXZpenBnK3FsQW9EUitNN2ZUMXZ3RlJqbkpteEgreit0Q0t3ZzFnT2hoMHY0?=
 =?utf-8?B?ZTN2NTZEcS9BOHM5SHVjdFRZY2FPV09OODNHT1Zod2pWQkVueDUybHpRSEU2?=
 =?utf-8?B?Qk81bnM5WUNiamY2MXhRNzVVTERmZDNoS3Y2eFJNcU82MDVDMFFrRFYxVG5S?=
 =?utf-8?B?cVY2SHhscVp6S0MxYWU0RCtMQVNKVFpFcEwydm13WFJuRGU5eldhTmQ1cTE2?=
 =?utf-8?B?SWltL1J0N1pLa0EybUwybHhHL1paUGt3MmJBRGJjb291SFBUZWJES2VId1hH?=
 =?utf-8?B?MlhtUUpOT1RIanl6U3Y3YmpmaGllSHZuU200TTU4ZVVpdFZ1QTlZYzIrVjc2?=
 =?utf-8?B?ZHNlMWF3RWpxd1g5Sm1uSzJrWEZmV0htSG9sMFN6OE9RZmdNMXUzOEozQS95?=
 =?utf-8?B?SHk5dzFoNDAxQXlhTHB4MTNSZjZCaXlBcTQvZEtuS0dMOEQ2ei90WEtmbGxI?=
 =?utf-8?B?b1J6L2g0SFRjRmVIVUk3UzMrcVBoTlNJL2dIN2pHamo4T2ttbkp1Z0R3Ri9G?=
 =?utf-8?B?QXNiMXZlcTVYQXNkejdyYWl0RUV4Ulc3elVuMGV4ZEc1NlJYMmJ0aXZvbFdh?=
 =?utf-8?B?Y3p5VnpLenF3bkZGczNqU0pDcEpETUI3TkdhWWNZeS8zRDBLWHo5clJmeDdl?=
 =?utf-8?B?cEo2c3pBS3lXTjQwWjRPYUNEdlFqUzhTWWtwS2ExeGpxRTl1R0FsbVVhM3VT?=
 =?utf-8?B?cDdRNHIxR2xNY0NOUHVBQnlHMDFkNnVXT1Zhd2xYZlFERllFZ0psYzlrSVpo?=
 =?utf-8?B?TkF3WWNrQWdoYmFtblpYM1Q5ckJBZnI3WkZ4cXlaaFZtREM5Mkw1NktBM2Rv?=
 =?utf-8?Q?++LOGGfxYwabKCzK1wGSlHW7L?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce36645-b52b-46e8-5929-08da9614360d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2022 05:44:37.6234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: edwkiN94+ls2NM/LQ/C01Ww3RwqqUuPHWbd7yiPnnBdSLYSuAYzeWRBj5FAU++xVMzIdF36NN84qHP2HsA/rC3O+1CiVYBAyJFOZyZtkKAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8658
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gbW1jOiByZW5lc2FzX3NkaGk6IEFk
ZCBtYXJnaW5zIGZvciBtYWluIGNsb2NrIGFuZCBocw0KPiBjbG9jaw0KPiANCj4gSGkgR2VlcnQs
DQo+IA0KPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gDQo+ID4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gbW1jOiByZW5lc2FzX3NkaGk6IEFkZCBtYXJnaW5zIGZvciBtYWluIGNsb2NrIGFuZA0K
PiA+IGhzIGNsb2NrDQo+ID4NCj4gPiBIaSBCaWp1LA0KPiA+DQo+ID4gT24gVHVlLCBTZXAgMTMs
IDIwMjIgYXQgNToxNSBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
ID4gd3JvdGU6DQo+ID4gPiBUaGUgU0RISSBoaWdoIHNwZWVkIGNsb2NrIGlzIDQgdGltZXMgdGhh
dCBvZiB0aGUgbWFpbiBjbG9jay4NCj4gPiA+IEN1cnJlbnRseSwgdGhlcmUgaXMgbm8gbWFyZ2lu
IGFkZGVkIGZvciBzZXR0aW5nIHRoZSByYXRlIGFzc29jaWF0ZWQNCj4gPiA+IHdpdGggdGhlc2Ug
Y2xvY2tzLiBPbiBSWi9HMkwgcGxhdGZvcm1zLCB0aGUgbGFjayBvZiB0aGVzZSBtYXJnaW5zDQo+
ID4gPiBsZWFkcyB0byB0aGUgc2VsZWN0aW9uIG9mIGEgY2xvY2sgc291cmNlIHdpdGggYSBsb3dl
ciBjbG9jayByYXRlDQo+ID4gPiBjb21wYXJlZCB0byBhIGhpZ2hlciBvbmUuDQo+ID4gPg0KPiA+
ID4gUlovRzJMIGV4YW1wbGUgY2FzZToNCj4gPiA+IFNEMCBocyBjbG9jayBpcyA1MzMzMzMzMzMg
SHogYW5kIFNEMCBtYWluIGNsb2NrIGlzIDEzMzMzMzMzMyBIei4NCj4gPiA+IFdoZW4gd2Ugc2V0
IHRoZSByYXRlIGZvciB0aGUgbWFpbiBjbG9jayAxMzMzMzMzMzMsIHRoZSByZXF1ZXN0IHJhdGUN
Cj4gPiA+IGZvciB0aGUgcGFyZW50IGJlY29tZXMgNTMzMzMzMzMyICgxMzMzMzMzMzMgKiA0KSBh
bmQgdGhlIFNEMCBocw0KPiA+ID4gY2xvY2sgaXMgc2V0IGFzIDQwMDAwMDAwMCBIei4NCj4gPiA+
DQo+ID4gPiBUaGlzIHBhdGNoIGFkZHMgYSBtYXJnaW4gb2YgKDEvMTAyNCkgaGlnaGVyIGhzIGNs
b2NrIGFuZCBtYWluIGNsb2NrDQo+ID4gcmF0ZS4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+ID4NCj4gPiA+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNh
c19zZGhpX2NvcmUuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlf
Y29yZS5jDQo+ID4gPiBAQCAtMTQ3LDYgKzE0Nyw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQNCj4g
PiA+IHJlbmVzYXNfc2RoaV9jbGtfdXBkYXRlKHN0cnVjdA0KPiA+IHRtaW9fbW1jX2hvc3QgKmhv
c3QsDQo+ID4gPiAgICAgICAgIH0NCj4gPiA+DQo+ID4gPiAgICAgICAgIG5ld19jbG9jayA9IHdh
bnRlZF9jbG9jayA8PCBjbGtoX3NoaWZ0Ow0KPiA+ID4gKyAgICAgICBuZXdfY2xvY2sgKz0gbmV3
X2Nsb2NrID4+IDEwOw0KPiA+DQo+ID4gVGhpcyBjaGFuZ2VzIHRoZSByZXF1ZXN0ZWQgY2xvY2sg
cmF0ZS4gSXMgdGhhdCByZWFsbHkgYSBnb29kIGlkZWE/DQo+ID4NCj4gPiBJc24ndCBpdCBzdWZm
aWNpZW50IHRvIGNoYW5nZSB0aGUgdGVzdCAiaWYgKGZyZXEgPiAobmV3X2Nsb2NrIDw8IGkpKSIN
Cj4gPiBzbGlnaHRseT8NCj4gDQo+IFdlIGhhcmRseSBlbnRlciB0aGlzIHRlc3QsIGFmdGVyIGl0
IHJlcXVlc3QgZm9yIHByb3BlciB3YW50ZWRfY2xrLg0KPiANCj4gZnJlcSBpcyBjbGtfcm91bmRf
cmF0ZShyZWZfY2xrLCBuZXdfY2xvY2sgPDwgaSk7ICBhbmQgaXQgY29tcGFyZXMgNDAwTUh6DQo+
IHZzIDUzMy4zMzIgTUh6Lg0KPiANCj4gQmFzaWNhbGx5IHdhbnRlZF9jbG9jaz0gMTMzLjMzMzMz
IE1IeiBhbmQgaXMgc2NhbGVkIHRvIHBvd2VyIG9mIDIgYW5kDQo+IHRoZW4gZWFjaCBpdGVyYXRp
b24gaXQgc2NhbGUgZG93biB0byBwb3dlciBvZiAyIGNvbXBhcmUgd2l0aCByb3VuZCByYXRlDQo+
IHZhbHVlLg0KPiANCj4gWyAgICA0LjAyMDc4MV0gIyMjI3J6ZzJsX2NwZ19zZF9jbGtfbXV4X2Rl
dGVybWluZV9yYXRlIyMjIyMjIyByZXEtDQo+ID5yYXRlPTQyNjY2NjY2NTYNCj4gWyAgICA0LjAy
ODAxM10gIyMjI3J6ZzJsX2NwZ19zZF9jbGtfbXV4X2RldGVybWluZV9yYXRlIyMjIyMjIyByZXEt
DQo+ID5yYXRlPTIxMzMzMzMzMjgNCj4gWyAgICA0LjAzNTMzMF0gIyMjI3J6ZzJsX2NwZ19zZF9j
bGtfbXV4X2RldGVybWluZV9yYXRlIyMjIyMjIyByZXEtDQo+ID5yYXRlPTEwNjY2NjY2NjQNCj4g
WyAgICA0LjA0MjYzOV0gIyMjI3J6ZzJsX2NwZ19zZF9jbGtfbXV4X2RldGVybWluZV9yYXRlIyMj
IyMjIyByZXEtDQo+ID5yYXRlPTUzMzMzMzMzMg0KPiANCj4gPg0KPiA+ID4NCj4gPiA+ICAgICAg
ICAgLyoNCj4gPiA+ICAgICAgICAgICogV2Ugd2FudCB0aGUgYnVzIGNsb2NrIHRvIGJlIGFzIGNs
b3NlIGFzIHBvc3NpYmxlIHRvLCBidXQNCj4gPiA+IG5vIEBAIC0xNzIsNiArMTczLDcgQEAgc3Rh
dGljIHVuc2lnbmVkIGludA0KPiA+ID4gcmVuZXNhc19zZGhpX2Nsa191cGRhdGUoc3RydWN0IHRt
aW9fbW1jX2hvc3QgKmhvc3QsDQo+ID4gPg0KPiA+ID4gICAgICAgICBjbGtfc2V0X3JhdGUocmVm
X2NsaywgYmVzdF9mcmVxKTsNCj4gPiA+DQo+ID4gPiArICAgICAgIGJlc3RfZnJlcSArPSBiZXN0
X2ZyZXEgPj4gMTA7DQo+ID4NCj4gPiBDYW4geW91IHBsZWFzZSBlbGFib3JhdGUgd2h5IHRoaXMg
aXMgbmVlZGVkPw0KPiA+IEl0IGxvb2tzIGNvdW50ZXItaW50dWl0aXZlIHRvIG1lLg0KPiANCj4g
V2hlbiB3ZSB0cnkgdG8gc2V0IDEzMy4zMzMgTUh6IGNsaywgdGhlIGRldGVybWluZSByYXRlIGNh
bGN1bGF0ZXMgcmVxLQ0KPiA+cmF0ZSBmb3Igc2QgY2xrIGFzIDUzMy4zMzIgYW5kIHNpbmNlIGF2
YWlsYWJsZSBjbG9jayBzb3VyY2UgZm9yIHNkMCBjbGtzDQo+IGFyZSAyNjYuNjY2NiwgNDAwIGFu
ZA0KPiA1MzMuMzMzIE1Ieiwgc28gaXQgc2VsZWN0IHRoZSBjbG9jayBzb3VyY2UgYXMgNDAwTUh6
Lg0KDQpKdXN0IHRvIGFkZCBoZXJlIHRoZSBtYWluIGlzc3VlIGlzIGNvbWluZyBmcm9tIG1hdGgg
Y2FsY3VsYXRpb24uDQoNCkNvbnNpZGVyIGFueSB2YWx1ZSBBDQoNCkIgPSBBIC8gNA0KQyA9IEIg
KiA0DQoNCklkZWFsbHksIHdlIGV4cGVjdCBBID0gQywgQnV0IGluIHRoZSBiZWxvdyBleGFtcGxl
DQpJdCBpcyBub3QgdGhlIGNhc2UgKGl0IGlzIEEgIT0gQykuDQoNCkEgPSA1MzMzMzMzMzMgKDE2
MDAvMyBNSHopDQpCID0gNTMzMzMzMzMzLzQgPSAxMzMzMzMzMzMNCkMgPSAxMzMzMzMzMzMgKiA0
ID0gNTMzMzMzMzMyDQoNClNpbmNlIEEgIT0gQyB3ZSBhcmUgZW5kaW5nIHVwIGluIHRoaXMgc2l0
dWF0aW9uLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4NCj4gPiA+ICAgICAgICAgaWYgKHBy
aXYtPmNsa2gpDQo+ID4gPiAgICAgICAgICAgICAgICAgY2xrX3NldF9yYXRlKHByaXYtPmNsaywg
YmVzdF9mcmVxID4+IGNsa2hfc2hpZnQpOw0KPiA+DQo+ID4gR3J7b2V0amUsZWV0aW5nfXMsDQo+
ID4NCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiA+DQo+ID4gLS0NCj4gPiBH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
DQo+ID4gZ2VlcnRAbGludXgtIG02OGsub3JnDQo+ID4NCj4gPiBJbiBwZXJzb25hbCBjb252ZXJz
YXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhDQo+IGhhY2tlci4N
Cj4gPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvcg0KPiA+IHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
