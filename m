Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D16E176A8F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 08:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbjHAG0V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Aug 2023 02:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231184AbjHAG0S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Aug 2023 02:26:18 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2134.outbound.protection.outlook.com [40.107.113.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939311730;
        Mon, 31 Jul 2023 23:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5BQc5eL11v8novWTuIcT+ddiLJPyVoIrh+cHWKwromslMQ5XkTzEEmxXCy7q64GlVz3KOUJf5kb9kNfdirczZCQ7KeJ/4Uu+ve7urRdErQ0Etmv9GNs3Z6e/I54Y/kqjKTg8+fUhOM8u5FLvVVx6H9rhCbECYPzzOxjmotjGkRoRDjlByo/Jz4k6qITTPBiZ+hjp2B9bSgKf8mAplvx5U9SlJb11OgVLZQKEYnFz6r708U2bPJmfez4+0TBK7DJGXg520R0GVgxsROp0VH4i2PDryN5eo8I7ScMXM/m7J4DGaDGAy56VGa6tkcV08gVXAOvVhGrTaiQdDP9CD0XCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ku38Jd85hIaxudlcP2ZH9hcEkz6p9xNFUsusRpGEPYI=;
 b=ge/jgmNeNWF78PeFrxMK4nYjPhc4fTW7Y8g2zXrLrqZRJn4z3Poh8H525lOLI6HE9Tt4dX0M2flEnZXBu9w11jVRgSVnBrT5XuCEkXigTYrLCB7oU0PXqsbYfj+rYcGz1uFqVXDM56pIXD28t16hglS3ZA7FORVS6o60OQWmowNEKLuculcpPwrjMOEr5SbuKtHGe50svLNkp8p7EmkxYf6QfEfc/gy7Ny8Yvb+OdptxxRCZFY2YjDgsv76bsGAvVgHN00mEvkMbmJJfPkSvpIPk8vLoPcwJFL/NeTD0kzmIXzmvdP+lgo3Fo9dhGWrXH94VZLJowHe6QLs28uR0jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ku38Jd85hIaxudlcP2ZH9hcEkz6p9xNFUsusRpGEPYI=;
 b=gKWR/RmAVwKCpwRK3v1Vt50hJ7jp6WP1T3h66KD0AmfwIDj2swOt/c9n+ZDwVQU6AajIk9umzOc9xd0incRKlg3UpUKFWjJZOAWmglmg4GMVBDM+AnqddOWrDnjTasVyW0xCpWPuTarSCXw4bvL1cQGii3CBhUuHVlb5v+k7hXg=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYAPR01MB5801.jpnprd01.prod.outlook.com
 (2603:1096:404:8056::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 06:26:10 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 06:26:10 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Serge Semin <fancer.lancer@gmail.com>
CC:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
        "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "kw@linux.com" <kw@linux.com>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "kishon@kernel.org" <kishon@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v18 09/20] PCI: dwc: Add PCI_EXP_LNKCAP_MLW handling
Thread-Topic: [PATCH v18 09/20] PCI: dwc: Add PCI_EXP_LNKCAP_MLW handling
Thread-Index: AQHZu6dDGGGQ+OAg50C3BavsZe1ATa/IxbcAgAKD7jCAAzvRgIAAGFuwgADF+ICAA7m14IABgaQAgABrVnA=
Date:   Tue, 1 Aug 2023 06:26:09 +0000
Message-ID: <TYBPR01MB5341C3FA1E0C722AAEA1586FD80AA@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230721074452.65545-1-yoshihiro.shimoda.uh@renesas.com>
 <20230721074452.65545-10-yoshihiro.shimoda.uh@renesas.com>
 <20230724110344.GH6291@thinkpad>
 <TYBPR01MB534165847452C8A2398B03D9D800A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <20230728025119.GB4433@thinkpad>
 <TYBPR01MB534130DF2431F0A49E0C5C3BD806A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <2zv7mcxa7skywhxe2ene3c5ycine6tsmsfwmpf4nknhoeye7rx@m525r5ph3xow>
 <OSYPR01MB5334ACE9FCE20E92B7776919D805A@OSYPR01MB5334.jpnprd01.prod.outlook.com>
 <7utf36jc3v7kadsuxxf4tuvxrzlashu737jaalyprjj4w54rx6@2i2uqcknnvgb>
In-Reply-To: <7utf36jc3v7kadsuxxf4tuvxrzlashu737jaalyprjj4w54rx6@2i2uqcknnvgb>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYAPR01MB5801:EE_
x-ms-office365-filtering-correlation-id: 6ef290ff-006a-4e4b-5736-08db9258323c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0QoSyk4umJpInSMuFgWAM+jajAV35H8qgdtt96pGcjmKl1Uu+SboRJy8+XI8LxMbg2OJcUZoWnCMiRTXgZHJYJZmG9z2LnqXA3YDm8/cOlakilURWYirKZzRuVDFtM0G8JEGJ84Pz0kC80p+pwl+s9HuGFTLie8iWMnCfPw9+t/Rr4p22NmX4QjpuoXm4ymugKCj+rlFgjgwBQ8ESUV6S91IzMMjr+9ephDawkR51ypYc4WMHGzk+nFdFjhP2XDoVZeKO8LQoM6ClGPqYs5hHRGOyody1YULdGPtVj1ek/tVkJqV4p2ySNXMgIW7A4EjUHYNN5upWp0e7SwLXJlKp4GaTT+ixPYw9yKMJ9LXVUM1RThbXAMn+Dh0gv1whw9ONHj8Cm6vPK2AbzNHPO3X67DbbscrvOWOe5nVZ3SVCCETmmBAzyqyshAQssd4whLhVh+modJ6nYalADQXvzB8vd3i+88YlUWemJDAuMntqu65a4A61UGZCB8aDIRLMEKgLH/gAcdkFcAwp0l7rkifNh+i15zFHRqEui6FKtmdCPQuf65xHl9GM1TpM41j5lu3Q9c4tYx/5LIV10Cbak1Um5uvYHBTthEJRbWSDpGAouKC8liweptd+kOU9+RCBDoo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199021)(8676002)(8936002)(26005)(38100700002)(86362001)(122000001)(41300700001)(38070700005)(83380400001)(2906002)(6506007)(186003)(33656002)(5660300002)(55016003)(52536014)(7416002)(6916009)(4326008)(66446008)(66476007)(66556008)(64756008)(66946007)(76116006)(9686003)(71200400001)(54906003)(478600001)(7696005)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0cvR1VQdHlON01NbnhFV0hNTGlmb1BFYXpCT0JXck9hMXczbFhISnI1YXVN?=
 =?utf-8?B?ajRsZnRjWEo3YjN2ZTFQRUlUcW1DTUZud2FPUEx5MmNCNWJmWEZtK0oxeEFj?=
 =?utf-8?B?NFcveFp1dUNrSXZmRlQyNnVUSGJTdCtoT2NWdWxEOUlHb0hZL2JNaVNVZnJY?=
 =?utf-8?B?dW5zVkxXemRObzFnNG1INzd3eVF6cVZuRzkydkZjRmJncE9VUmp6djg3VkV6?=
 =?utf-8?B?YjNuZmg2YXkzeHFGSVFOQndaQ1lhN1AwbU04R2VvK2d3WjRMcnZ0YmRoNTFX?=
 =?utf-8?B?RFV0eWlCSHBoM0JiUW5vWklnbXBtMnlpb256V3dpU0RCYy81MHRTbmtJYjg3?=
 =?utf-8?B?MjN3NDRuTXdTaUFYT1VCcTY0YlRYcnVNbjFpeFlJa1ljbVdHT2FFYndCWXJL?=
 =?utf-8?B?dUttNmNqWUlsa2lab010aHhVOEZYVnh2MEI3R1FaRXJwMDE3bXkrSjR5Qy82?=
 =?utf-8?B?UnlnUU1GcFJQdVJ5MkJPTHZNcDBBS09DMGtOam9zVU1obG5IVFpRUUNwSjFu?=
 =?utf-8?B?MXhKeFltMk9DM0RpTUVDWGk0RlFxc0FOSk05MWk1cnZ5UE1MRVZ6NzhiR1Jy?=
 =?utf-8?B?Y0VmMWJmQUNkWnUvNFNzK0xlR3RScGQ3ZVlxQkdOc0ZQNVlkd0RYQzZrRGx4?=
 =?utf-8?B?d0xSa2F2ZVphZ3A5VEJNeTNpYzkyVWZWUHplSjJxazB3Q1pXZXZ4Y3A0Y0M0?=
 =?utf-8?B?elFIcHJhUUUvY0UvTENBNDVHek40cGdEUFRxb1o3dXhRQkpFRkZIMjBGTVc0?=
 =?utf-8?B?QVU3NXVFaHdGQTgzSkVKMXMrcEdxV3ZzLy9ieFllU1E1NHFqQmFHektNWDJs?=
 =?utf-8?B?dElKSXlIZitwM2Nib1lUTVlrcmpsT2ZzVkJvVjVaMFN1S0gzTmxxWkk3UFFn?=
 =?utf-8?B?NzZITlhQdEFZMGlkTmNQL2tWZXFnQm9rY3hIdDRLRHVPV3U4MVc2Y1E5a2U4?=
 =?utf-8?B?cEZwcUZGbmxiUGhFYkllbCtzTUI4cVZTaTh6UkZwaHZoYkpHL0pyQjNyeDJM?=
 =?utf-8?B?VXFFcEJyZ2RveTg1VU9XbWMzNkJ2c1RiYXVBSHpNNlQzbkZDNWdoR1dpTnNr?=
 =?utf-8?B?Z0k4NTQ5Q3BnNmp3Y1o0WVZidWtlRy9ITDR2SDVzSy9yTWtjSnNXU1gzUy9J?=
 =?utf-8?B?NHNBVHhTY1lpcmR5ZTFsL3dqVUpxMmk1ZFhNS1VOUTd2bHUraG1ETU1iTml0?=
 =?utf-8?B?Q3k2dFFaYXd6M2dyVnQ4eGhnTi9JWjQwQ05nUE44OHlYUi92elNtMk5Uc0s1?=
 =?utf-8?B?WVBtRUVIMXN0RVNNaVFYTlpSZFkxTXlBUkdCZnJMUjVSSmhZYmVqQ2o5RWcw?=
 =?utf-8?B?OWxxS0hrbFFMaUtjQW8zdWpVN3Q5VXE0ZTIyUzRqODVDS0pPUmNEdmh5N2tm?=
 =?utf-8?B?ZFEvem5hYTh1WVV3MlFORGhXOUI5eHZVOGQ0YWNoaDBHSm9jZVBkaDd1bEJs?=
 =?utf-8?B?NVg2cVZGOVk5dTBHb05kQ3lnaUZ4NUh5M0M3SHlERnNCMDcrVk1QZVh1b0Vo?=
 =?utf-8?B?b21Fd2ZKUEY0TkoxMjBNVjd5ZUNiWFlsYm1EMGZ1S3hNS0pRbkxWVkYyM053?=
 =?utf-8?B?bUJ4NDJtdURmYm9TVHdOMSt1VzhpTmxwbmRMK0J2U0IzN1BKNloycGpydmZx?=
 =?utf-8?B?UU43bi9SZmsrNXNvckFzemNrUmZqUVR3cjFzZUE2azRLZ0R4VU5NVVdKcEFJ?=
 =?utf-8?B?eXptbVZHZ1h0aTRYZXpUTldDMDRnUVRtdEo5VnRQV1hYV2JZcjZiSVlwblo0?=
 =?utf-8?B?VnZ5SUkzK2lVRlFYWWd0WnpJd1BTdHJuNFlDeStRdlFORFZNVzBiSGI2L2U5?=
 =?utf-8?B?eG5ISVVQaGl1NGZzM3NNZHE3T3NBa2lxUnVLKzBxOVNkTjdEZ05JamgxQW9u?=
 =?utf-8?B?Qzcvdmh6OE9UOHl0bkVjYmoreUpzRVpQZTZMak5tbWNYeVIxMFhLNUp6M3FT?=
 =?utf-8?B?YWh4WStKR0Jhc2NhUDhMaW52dUsxZmY3dmZRUFVqL241QTZvbzBpLzZ4MXVr?=
 =?utf-8?B?N211NVo3eDVKK1AvbGRtbmlFeUpVMmQzc2lCbW4vRWozT1VqOVF6M1ZMWUJR?=
 =?utf-8?B?WnE3TlE1M2Z1UVdCVGd5YmFKdVpFSDdDSEgwMTRlZXE2QUZldWk2VHFmQVFR?=
 =?utf-8?B?ZVRoaks0UlFtUUZ6QkthdDFETFgxaUptY1h5dStDT3RLTXV3eU4vc3lGdjJ2?=
 =?utf-8?B?Qnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef290ff-006a-4e4b-5736-08db9258323c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 06:26:10.0054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4t9s88bc1dl/ut9R/xRnxH0vx7TlPuhfmXMu1aFkBoecF82enAuIkMwW6ZzNZKY9XyTGHW+YhQcSOgaPXAoYIB5eA0/L5iXhwNrZHQU3L+nftBgMoozrAHi+9nDk4k3k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5801
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2VyZ2UsDQoNCj4gRnJvbTogU2VyZ2UgU2VtaW4sIFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAx
LCAyMDIzIDk6MDEgQU0NCj4gDQo+IE9uIE1vbiwgSnVsIDMxLCAyMDIzIGF0IDAxOjE1OjAyQU0g
KzAwMDAsIFlvc2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiA+IEhpIFNlcmdlLA0KPiA+DQo+ID4g
PiBGcm9tOiBTZXJnZSBTZW1pbiwgU2VudDogU2F0dXJkYXksIEp1bHkgMjksIDIwMjMgMTowNyBB
TQ0KPiA+ID4NCj4gPiA+IE9uIEZyaSwgSnVsIDI4LCAyMDIzIGF0IDA0OjE5OjM4QU0gKzAwMDAs
IFlvc2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiA+ID4gPiBIaSBNYW5pdmFubmFuLA0KPiA+ID4g
Pg0KPiA+ID4gPiA+IEZyb206IE1hbml2YW5uYW4gU2FkaGFzaXZhbSwgU2VudDogRnJpZGF5LCBK
dWx5IDI4LCAyMDIzIDExOjUxIEFNDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBPbiBXZWQsIEp1bCAy
NiwgMjAyMyBhdCAwMjoxMjoxNUFNICswMDAwLCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4g
PiA+ID4gPiA+IEhpIE1hbml2YW5uYW4sDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBGcm9t
OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0sIFNlbnQ6IE1vbmRheSwgSnVseSAyNCwgMjAyMyA4OjA0
IFBNDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFN1YmplY3Qgc2hvdWxkIGNvbnRhaW4g
dGhlIHdvcmQgIm1pc3NpbmciLiBMaWtlLCAiQWRkIG1pc3NpbmcgUENJX0VYUF9MTktDQVBfTUxX
DQo+ID4gPiA+ID4gPiA+IGhhbmRsaW5nIi4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJIGdv
dCBpdC4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IE9uIEZyaSwgSnVsIDIxLCAyMDIzIGF0
IDA0OjQ0OjQxUE0gKzA5MDAsIFlvc2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiA+ID4gPiA+ID4g
PiA+IFVwZGF0ZSBkd19wY2llX2xpbmtfc2V0X21heF9saW5rX3dpZHRoKCkgdG8gc2V0IFBDSV9F
WFBfTE5LQ0FQX01MVy4NCj4gPiA+ID4gPiA+ID4gPiBJbiBhY2NvcmRhbmNlIHdpdGggdGhlIERX
IFBDSWUgUkMvRVAgSFcgbWFudWFscyBbMSwyLDMsLi4uXSBhc2lkZSB3aXRoDQo+ID4gPiA+ID4g
PiA+ID4gdGhlIFBPUlRfTElOS19DVFJMX09GRi5MSU5LX0NBUEFCTEUgYW5kIEdFTjJfQ1RSTF9P
RkYuTlVNX09GX0xBTkVTWzg6MF0NCj4gPiA+ID4gPiA+ID4gPiBmaWVsZCB0aGVyZSBpcyBhbm90
aGVyIG9uZSB3aGljaCBuZWVkcyB0byBiZSB1cGRhdGVkLiBJdCdzDQo+ID4gPiA+ID4gPiA+ID4g
TElOS19DQVBBQklMSVRJRVNfUkVHLlBDSUVfQ0FQX01BWF9MSU5LX1dJRFRILiBJZiBpdCBpc24n
dCBkb25lIGF0DQo+ID4gPiA+ID4gPiA+ID4gdGhlIHZlcnkgbGVhc3QgdGhlIG1heGltdW0gbGlu
ay13aWR0aCBjYXBhYmlsaXR5IENTUiB3b24ndCBleHBvc2UNCj4gPiA+ID4gPiA+ID4gPiB0aGUg
YWN0dWFsIG1heGltdW0gY2FwYWJpbGl0eS4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiA+IFsxXSBEZXNpZ25XYXJlIENvcmVzIFBDSSBFeHByZXNzIENvbnRyb2xsZXIgRGF0YWJvb2sg
LSBEV0MgUENJZSBSb290IFBvcnQsDQo+ID4gPiA+ID4gPiA+ID4gICAgIFZlcnNpb24gNC42MGEs
IE1hcmNoIDIwMTUsIHAuMTAzMg0KPiA+ID4gPiA+ID4gPiA+IFsyXSBEZXNpZ25XYXJlIENvcmVz
IFBDSSBFeHByZXNzIENvbnRyb2xsZXIgRGF0YWJvb2sgLSBEV0MgUENJZSBSb290IFBvcnQsDQo+
ID4gPiA+ID4gPiA+ID4gICAgIFZlcnNpb24gNC43MGEsIE1hcmNoIDIwMTYsIHAuMTA2NQ0KPiA+
ID4gPiA+ID4gPiA+IFszXSBEZXNpZ25XYXJlIENvcmVzIFBDSSBFeHByZXNzIENvbnRyb2xsZXIg
RGF0YWJvb2sgLSBEV0MgUENJZSBSb290IFBvcnQsDQo+ID4gPiA+ID4gPiA+ID4gICAgIFZlcnNp
b24gNC45MGEsIE1hcmNoIDIwMTYsIHAuMTA1Nw0KPiA+ID4gPiA+ID4gPiA+IC4uLg0KPiA+ID4g
PiA+ID4gPiA+IFtYXSBEZXNpZ25XYXJlIENvcmVzIFBDSSBFeHByZXNzIENvbnRyb2xsZXIgRGF0
YWJvb2sgLSBEV0MgUENJZSBFbmRwb2ludCwNCj4gPiA+ID4gPiA+ID4gPiAgICAgICBWZXJzaW9u
IDUuNDBhLCBNYXJjaCAyMDE5LCBwLjEzOTYNCj4gPiA+ID4gPiA+ID4gPiBbWCsxXSBEZXNpZ25X
YXJlIENvcmVzIFBDSSBFeHByZXNzIENvbnRyb2xsZXIgRGF0YWJvb2sgLSBEV0MgUENJZSBSb290
IFBvcnQsDQo+ID4gPiA+ID4gPiA+ID4gICAgICAgVmVyc2lvbiA1LjQwYSwgTWFyY2ggMjAxOSwg
cC4xMjY2DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBTdWdnZXN0ZWQtYnk6IFNl
cmdlIFNlbWluIDxmYW5jZXIubGFuY2VyQGdtYWlsLmNvbT4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gQWRkIFJlcG9ydGVkLWJ5IGFsc28/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
SSBkb24ndCB0aGluayBzbyBiZWNhdXNlIFNlcmdlIHN1Z2dlc3RlZCB0aGUgY29tbWl0IGRlc2Ny
aXB0aW9uIGZyb20gbXkgc3VibWl0dGVkIHBhdGNoIFsxXS4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiBbMV0NCj4gPiA+ID4gPiA+DQo+ID4gPiA+IDxzbmlwIFVSTD4NCj4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBGaW5lIHRoZW4uDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhA
cmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFRoaXMgbG9va3MgbGlr
ZSBhIHBvdGVudGlhbCBidWcgZml4IHRvIG1lLiBTbyBwbGVhc2UgbW92ZSB0aGlzIGNoYW5nZSBi
ZWZvcmUgdGhlDQo+ID4gPiA+ID4gPiA+IHByZXZpb3VzIHBhdGNoIHRoYXQgaW50cm9kdWNlcyBk
d19wY2llX2xpbmtfc2V0X21heF9saW5rX3dpZHRoKCksIHRhZyBmaXhlcyBhbmQNCj4gPiA+ID4g
PiA+ID4gQ0Mgc3RhYmxlIGxpc3QgZm9yIGJhY2twb3J0aW5nLg0KPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+IEkgdGhpbmsgdGhhdCB0aGlzIHBhdGNoIHNob3VsZCBiZSBhIG5leHQgYnJhbmNoIGJl
Y2F1c2UgdGhpcyBpcyBwb3NzaWJsZSB0bw0KPiA+ID4gPiA+ID4gY2F1c2Ugc2lkZSBlZmZlY3Rp
dmUuIEFsbW9zdCBhbGwgZHJpdmVycy9wY2llL2NvbnRyb2xsZXIvZHdjLyBob3N0IGRyaXZlcnMg
ZXhjZXB0DQo+ID4gPiA+ID4gPiBwY2llLXRlZ3JhMTk0LmMgZG9lc24ndCBoYXZlIHRoaXMgc2V0
dGluZywgYnV0IEkgYXNzdW1lIHRoYXQgdGhlIGRyaXZlcnMgd29yayBjb3JyZWN0bHkNCj4gPiA+
ID4gPiA+IHdpdGhvdXQgdGhpcyBzZXR0aW5nLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEFs
c28sIHRvIGJlIGhvbmVzdCwgSSBjb3VsZCBub3QgZmluZCBhIHN1aXRhYmxlIGNvbW1pdCBJRCBm
b3IgdGhpcyBwYXRjaCdzICJGaXhlcyIgdGFnLg0KPiA+ID4gPiA+ID4gQWRkaXRpb25hbGx5LCBJ
IGNvdWxkIG5vdCBkZXRlcm1pbmUgd2hpY2ggb2xkIGtlcm5lbCB2ZXJzaW9ucyBzaG91bGQgaGF2
ZSB0aGlzIHBhdGNoDQo+ID4gPiA+ID4gPiBhcHBsaWVkIGFzIGJhY2twb3J0aW5nLg0KPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4NCj4gPiA+ID4gPiBPay4gQnV0IHlvdSBjYW4gc3RpbGwg
bW92ZSB0aGlzIHBhdGNoIGFzIEkgc3VnZ2VzdGVkLiBJZiB3ZSBoYXBwZW4gdG8gaGl0IGFueQ0K
PiA+ID4gPiA+IGlzc3VlIHdpdGggdGhpcyBzZXR0aW5nLCB0aGVuIHdlIGNhbiBlYXNpbHkgcmV2
ZXJ0IGl0Lg0KPiA+ID4gPg0KPiA+ID4gPiBJIGdvdCBpdC4gSSdsbCBtb3ZlIHRoaXMgcGF0Y2gg
YXMgeW91IHN1Z2dlc3RlZC4NCj4gPiA+DQo+ID4gPiBOby4gQnkgbW92aW5nIHRoaXMgcGF0Y2gg
dG8gYmUgaW1wbGVtZW50ZWQgYmVmb3JlIHRoZSBwYXRjaDoNCj4gPiA+IFtQQVRDSCB2MTggMDgv
MjBdIFBDSTogZHdjOiBBZGQgZHdfcGNpZV9saW5rX3NldF9tYXhfbGlua193aWR0aCgpDQo+ID4g
PiB5b3Ugd29uJ3QgYmUgYWJsZSB0byBlYXNpbHkgcmV2ZXJ0IGl0IGFmdGVyd2FyZHMgYmVjYXVz
ZSB0aGUgcGF0Y2ggIzgNCj4gPiA+IHdpbGwgbW92ZSB0aGUgY29kZSBhZGRlZCBieSB0aGUgcGF0
Y2ggIzkgdG8gdGhlDQo+ID4gPiBkd19wY2llX2xpbmtfc2V0X21heF9saW5rX3dpZHRoKCkgZnVu
Y3Rpb24uIEJhc2ljYWxseSB5b3Ugc3VnZ2VzdCB0bw0KPiA+ID4gc3dpdGNoIHRoZSBwcmVwYXJh
dGlvbiBhbmQgZnVuY3Rpb25hbCBwYXRjaGVzIG9yZGVyIHdoaWNoIGRvZXNuJ3QgbG9vaw0KPiA+
ID4gcmlnaHQuDQo+ID4NCj4gPiBZb3UncmUgY29ycmVjdC4gSWYgbW92aW5nIHRoaXMgcGF0Y2gg
dG8gdGhlIHRvcCBvZiB0aGlzIHNlcmllcyBhbmQgdGhlbg0KPiA+IHN0aWxsIGFwcGx5IHRoZSBv
cmlnaW5hbCAjOCwgaXQncyBkaWZmaWN1bHQgdG8gcmV2ZXJ0IHRoaXMgcGF0Y2guDQo+ID4NCj4g
PiA+IEJhc2ljYWxseSB0aGUgTGluay13aWR0aC1yZWxhdGVkIHBhcnQgb2YgdGhpcyBzZXJpZXMg
Y3VycmVudGx5IGltcGxpZXMNCj4gPiA+IHRoZSBuZXh0IGxvZ2ljOg0KPiA+ID4NCj4gPiA+IDEu
IFByZXBhcmUgdGhlIERXIFBDSWUgY29yZSBkcml2ZXIgdG8gaW1wbGVtZW50aW5nIGEgY29tcHJl
aGVuc2l2ZQ0KPiA+ID4gTWF4LWxpbmstd2lkdGggc2V0dXAgbWV0aG9kcyAoYWthIGFzIGl0J3Mg
ZG9uZSBpbg0KPiA+ID4gZHdfcGNpZV9saW5rX3NldF9tYXhfc3BlZWQoKSkgYnkgbW92aW5nIHRo
ZSBMaW5rLXdpZHRoIHJlbGF0ZWQgY29kZSB0bw0KPiA+ID4gYSBkZWRpY2F0ZWQgbWV0aG9kOg0K
PiA+ID4gW1BBVENIIHYxOCAwOC8yMF0gUENJOiBkd2M6IEFkZCBkd19wY2llX2xpbmtfc2V0X21h
eF9saW5rX3dpZHRoKCkNCj4gPiA+DQo+ID4gPiAyLiBBZGQgdGhlIFBDSV9FWFBfTE5LQ0FQX01M
VyBmaWVsZCB1cGRhdGUsIHdoaWNoDQo+ID4gPiBkd19wY2llX2xpbmtfc2V0X21heF9saW5rX3dp
ZHRoKCkgbGFja3MgdG8gYmUgY29tcHJlaGVuc2l2ZToNCj4gPiA+IFtQQVRDSCB2MTggMDkvMjBd
IFBDSTogZHdjOiBBZGQgUENJX0VYUF9MTktDQVBfTUxXIGhhbmRsaW5nDQo+ID4gPg0KPiA+ID4g
My4gRHJvcCB0aGUgZHVwbGljYXRpbmcgY29kZSBmcm9tIHRoZSBUZWdyYTE5NCBQQ0llIGRyaXZl
cjoNCj4gPiA+IFtQQVRDSCB2MTggMTAvMjBdIFBDSTogdGVncmExOTQ6IERyb3AgUENJX0VYUF9M
TktTVEFfTkxXIHNldHRpbmcNCj4gPg0KPiA+IFllcy4NCj4gPg0KPiA+ID4gSW4gY2FzZSBpZiB0
aGUgcGF0Y2ggIzkgYXBwZWFycyB0byBiZSBhIGJ1ZyBmaXgsIHRoZW4gaXQgd2lsbCBuZWVkIHRv
DQo+ID4gPiBiZSBiYWNrcG9ydGVkIHRvZ2V0aGVyIHdpdGggcGF0Y2ggIzggd2hpY2ggaXNuJ3Qg
YSBwcm9ibGVtIGF0IGFsbA0KPiA+ID4gKHRob3VnaCBpdCdzIGRvdWJ0ZnVsbHkgdG8gaGFwcGVu
IHNpbmNlIG5vYm9keSByZXBvcnRlZCBhbnkgcHJvYmxlbQ0KPiA+ID4gd2l0aCB0aGF0IHNvIGZh
cikuDQo+ID4NCj4gPiBCYXNpY2FsbHksIEkgZG9uJ3QgdGhpbmsgdGhhdCBiYWNrcG9ydGluZyAj
OCBpcyBnb29kIGFzIGJhY2twb3J0IGJlY2F1c2UNCj4gPiB0aGUgIzggcGF0Y2ggaXMgYSBjbGVh
biB1cCBjb2RlIGZvciByZWFkYWJpbGl0eS4NCj4gPg0KPiA+ID4gQnV0IGlmIHBhdGNoICM5IHR1
cm5zIG91dCB0byBicmVhayBzb21ldGhpbmcgaW4NCj4gPiA+IGN1cnJlbnQgY2lyY3Vtc3RhbmNl
cyB3ZSdsbCBiZSBhYmxlIHRvIGVpdGhlciBlYXNpbHkgcmV2ZXJ0IGl0IChzaW5jZQ0KPiA+ID4g
aXQncyBhcHBsaWVkIGFmdGVyIHRoZSBwcmVwYXJhdGlvbiBwYXRjaCkgb3IgZml4IHNvbWVob3cu
IElmIHlvdQ0KPiA+ID4gc3dpdGNoIHBhdGNoICM4IGFuZCAjOSBvcmRlciwgdGhlIHJldmVyc2lv
biB3aWxsIHJlcXVpcmUgdG8gYmUNCj4gPiA+IHBlcmZvcm1lZCBmb3IgYm90aCB0aGVzZSBwYXRj
aGVzIHRvIGF2b2lkIHRoZSBjb25mbGljdHMuIFRodXMgSSdkDQo+ID4gPiBzdWdnZXN0IHRvIGxl
YXZlIHRoZSBwYXRjaGVzIG9yZGVyIGFzIGlzIHdoaWNoIGxvb2tzIG1vcmUgbmF0dXJhbCBhbmQN
Cj4gPiA+IHdvbid0IGNhdXNlIGFueSBwcm9ibGVtcyB0byByZXZlcnQgdGhlIGZ1bmN0aW9uYWwg
Y2hhbmdlIG9yIHRvDQo+ID4gPiBiYWNrcG9ydCBpdC4NCj4gPg0KPiA+IFRvIGZvbGxvdyBNYW5p
dmFubmFuJ3Mgc3VnZ2VzdGlvbiBhbmQgeW91ciBjb21tZW50cywgSSdtIHRoaW5raW5nIHRoYXQN
Cj4gPiAtIGRyb3AgdGhlICM4IGJlY2F1c2UgdGhpcyBpcyBqdXN0IGNsZWFuIHVwIGNvZGUgZm9y
IHJlYWRhYmlsaXR5Lg0KPiA+IC0tIEFmdGVyIHRoaXMgcGF0Y2ggc2VyaWVzIGlzIG1lcmdlZCBh
bmQgd29ya2VkIGNvcnJlY3RseSB3aXRob3V0IGFueQ0KPiA+ICAgIHJlZ3Jlc3Npb24gb24gb3Ro
ZXIgcGxhdGZvcm1zLCB3ZSBjYW4gYXBwbHkgdGhlICM4Lg0KPiA+IC0gbW92ZSB0aGUgIzkgdG8g
dGhlIHRvcCBvZiB0aGlzIHNlcmllcyBhcyBNYW5pdmFubmFuIHN1Z2dlc3RlZC4NCj4gPiAtLSBU
aGlzIG1lYW4gYWRkaW5nIHRoaXMgY29kZSBpbnRvIGR3X3BjaWVfc2V0dXAoKS4NCj4gPg0KPiA+
IEJ1dCwgd2hhdCBkbyB5b3UgdGhpbms/DQo+IA0KPiBOby4gSXQncyBiZXR0ZXIgdG8gbGVhdmUg
dGhlIHByZXBhcmF0aW9uIHBhdGNoIGFuZCB0aGUgb3JkZXIgYXMgaXMuDQo+IE9uY2UgYWdhaW4g
dGhpcyBwYXRjaCBkb2Vzbid0IGxvb2sgYXMgYSBidWctZml4IHNpbmNlIG5vYm9keSByZXBvcnRl
ZA0KPiBhbnkgcmVsYXRlZCBwcm9ibGVtIHNvIGZhci4gSWYgYW55b25lIGRlY2lkZXMgdG8gYmFj
ayBpdCBwb3J0IHRoZXJlDQo+IHdvbid0IGEgcHJvYmxlbSB3aXRoIHBvcnRpbmcgYm90aCAjOCBh
bmQgIzkuIEl0J3MgYSBjb21tb24gcHJhY3RpY2UuDQoNCkkgZ290IGl0LiBJJ2xsIGtlZXAgdGhl
IG9yZGVyICM4IGFuZCAjOSBhcy1pcywgYmVjYXVzZSB0aGUgIzkgaXMgbm90IGENCmJ1Zy1maXgg
cGF0Y2guDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gLVNlcmdlKHkp
DQo+IA0KPiA+DQo+ID4gQmVzdCByZWdhcmRzLA0KPiA+IFlvc2hpaGlybyBTaGltb2RhDQo+ID4N
Cj4gPiA+IC1TZXJnZSh5KQ0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gQmVzdCByZWdhcmRzLA0K
PiA+ID4gPiBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA+ID4gPg0KPiA+ID4gPiA+IC0gTWFuaQ0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gPiA+ID4gPiBZb3NoaWhpcm8g
U2hpbW9kYQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gLSBNYW5pDQo+ID4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiA+ID4gUmV2aWV3ZWQtYnk6IFNlcmdlIFNlbWluIDxmYW5jZXIubGFuY2Vy
QGdtYWlsLmNvbT4NCj4gPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID4gPiAgZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLmMgfCA5ICsrKysrKysrLQ0KPiA+
ID4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLmMgYi9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuYw0KPiA+ID4gPiA+ID4gPiA+IGluZGV4IDVjY2Ez
NDE0MGQyYS4uYzQ5OTgxOTRmZTc0IDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5jDQo+ID4gPiA+ID4gPiA+ID4g
KysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLmMNCj4gPiA+
ID4gPiA+ID4gPiBAQCAtNzMwLDcgKzczMCw4IEBAIHN0YXRpYyB2b2lkIGR3X3BjaWVfbGlua19z
ZXRfbWF4X3NwZWVkKHN0cnVjdCBkd19wY2llICpwY2ksIHUzMiBsaW5rX2dlbikNCj4gPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ICBzdGF0aWMgdm9pZCBkd19wY2llX2xpbmtfc2V0X21h
eF9saW5rX3dpZHRoKHN0cnVjdCBkd19wY2llICpwY2ksIHUzMiBudW1fbGFuZXMpDQo+ID4gPiA+
ID4gPiA+ID4gIHsNCj4gPiA+ID4gPiA+ID4gPiAtCXUzMiBsd3NjLCBwbGM7DQo+ID4gPiA+ID4g
PiA+ID4gKwl1MzIgbG5rY2FwLCBsd3NjLCBwbGM7DQo+ID4gPiA+ID4gPiA+ID4gKwl1OCBjYXA7
DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiAgCWlmICghbnVtX2xhbmVzKQ0KPiA+
ID4gPiA+ID4gPiA+ICAJCXJldHVybjsNCj4gPiA+ID4gPiA+ID4gPiBAQCAtNzY2LDYgKzc2Nywx
MiBAQCBzdGF0aWMgdm9pZCBkd19wY2llX2xpbmtfc2V0X21heF9saW5rX3dpZHRoKHN0cnVjdCBk
d19wY2llICpwY2ksIHUzMiBudW1fbGFuZXMpDQo+ID4gPiA+ID4gPiA+ID4gIAl9DQo+ID4gPiA+
ID4gPiA+ID4gIAlkd19wY2llX3dyaXRlbF9kYmkocGNpLCBQQ0lFX1BPUlRfTElOS19DT05UUk9M
LCBwbGMpOw0KPiA+ID4gPiA+ID4gPiA+ICAJZHdfcGNpZV93cml0ZWxfZGJpKHBjaSwgUENJRV9M
SU5LX1dJRFRIX1NQRUVEX0NPTlRST0wsIGx3c2MpOw0KPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+
ID4gPiA+ID4gPiArCWNhcCA9IGR3X3BjaWVfZmluZF9jYXBhYmlsaXR5KHBjaSwgUENJX0NBUF9J
RF9FWFApOw0KPiA+ID4gPiA+ID4gPiA+ICsJbG5rY2FwID0gZHdfcGNpZV9yZWFkbF9kYmkocGNp
LCBjYXAgKyBQQ0lfRVhQX0xOS0NBUCk7DQo+ID4gPiA+ID4gPiA+ID4gKwlsbmtjYXAgJj0gflBD
SV9FWFBfTE5LQ0FQX01MVzsNCj4gPiA+ID4gPiA+ID4gPiArCWxua2NhcCB8PSBGSUVMRF9QUkVQ
KFBDSV9FWFBfTE5LQ0FQX01MVywgbnVtX2xhbmVzKTsNCj4gPiA+ID4gPiA+ID4gPiArCWR3X3Bj
aWVfd3JpdGVsX2RiaShwY2ksIGNhcCArIFBDSV9FWFBfTE5LQ0FQLCBsbmtjYXApOw0KPiA+ID4g
PiA+ID4gPiA+ICB9DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiAgdm9pZCBkd19w
Y2llX2lhdHVfZGV0ZWN0KHN0cnVjdCBkd19wY2llICpwY2kpDQo+ID4gPiA+ID4gPiA+ID4gLS0N
Cj4gPiA+ID4gPiA+ID4gPiAyLjI1LjENCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiAtLQ0KPiA+ID4gPiA+ID4gPiDgrq7grqPgrr/grrXgrqPgr43grqPgrqng
r40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAtLQ0KPiA+
ID4gPiA+IOCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7g
r40NCg==
