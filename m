Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 179AE647EBA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Dec 2022 08:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbiLIHpt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Dec 2022 02:45:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbiLIHps (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 02:45:48 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC6C4E6BC;
        Thu,  8 Dec 2022 23:45:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0oZx+2rAvCf5MIyp13hnpFWrVMfV/eCns3WLAS094kU6L5xZQFUTZ80n8lYexdoIIB4qmkIFdMfX/jUzevxnAHWGqeaEXAbzpjD5jsswpYxfEGG/G/fjCszqvcmMFkGURTKZivmPKtoavaSxSy1grBZ8kVDJAyfRTy075hjetVthANmrM+DHH8Tpjht1mA1/neW2D6Pz4puc/1SQIX1itTspSFqdQtVWmiT8r468RWhbZRxOPulAEbejS+1rvrDCQts5tDdiGdmNgY+XMhowYlli9vBDfud5r1ra8KQmqXePu9lqC5tTylMQCAGqHpVKQm9uo31aLLhTUxPPN1s6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hgTNYLYEFSHNKGMa7xT2UWREFvebaeM+awuQeNGfHY=;
 b=KihBoCOgoj4IVjAkddfoPKDFXhUdyeWXEYH8hwD4GVUxiJu1nvgzaa6M0vgsdfKEUch74Py2eVBy68hrrGbx2Mcd6SvoqgkPw7zSwVBPOkDljc2IIZaUbWmmeR85HvJZJPOJee1q2woHPmiM4NhTEEyZZuf7KnkkVHnKQOKvKwRGsCQpMrBAki6BD9KqTp34M120CedZPTCVnQl85nkkRzgw1i9ynUnGZx4dwY01qx5gHLk+wF6EufE17oUbiWXLaWq1ilUtFGVNOUFuLqsw6jDvlLadgCPGnfmJ7Yndk4YuyRMJFBNGDVu5ue+9ORF7njGYKGIqXAXGYdk/raz0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hgTNYLYEFSHNKGMa7xT2UWREFvebaeM+awuQeNGfHY=;
 b=DvLEMFj4Z3wafASstjzkDiZ8OZRx1NdjU4UkbxRVP5XRem7gWXNQ5/vjUJltm/k+V2RFuUXDDvlp3XOonBMO1GsAtcXXlEE4s7e4+uO30zyZmvHSItdKmzUXenYPJWEHPcsJNaHhEnHFkYY+cj4xt2T2EcyrRYRmjGBTm8xppCk=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB10820.jpnprd01.prod.outlook.com
 (2603:1096:400:2a4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Fri, 9 Dec
 2022 07:45:43 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d%8]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 07:45:42 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Serge Semin <fancer.lancer@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC:     "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "kw@linux.com" <kw@linux.com>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "Sergey.Semin@baikalelectronics.ru" 
        <Sergey.Semin@baikalelectronics.ru>
Subject: RE: [PATCH v7 5/9] PCI: dwc: Avoid reading a register to detect
 whether eDMA exists
Thread-Topic: [PATCH v7 5/9] PCI: dwc: Avoid reading a register to detect
 whether eDMA exists
Thread-Index: AQHY/ab1Tv+LcLa0Z0uhVdCr0bfU4q5K+PQAgAiDNgCAACHrwIAAqEAAgAAJ9jCAADx6AIAAiB/AgA7axpCAADAVgIAAuIMA
Date:   Fri, 9 Dec 2022 07:45:42 +0000
Message-ID: <TYBPR01MB5341B4EB94F1B829F0E0431CD81C9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20221121124400.1282768-1-yoshihiro.shimoda.uh@renesas.com>
 <20221121124400.1282768-6-yoshihiro.shimoda.uh@renesas.com>
 <20221122135550.GD157542@thinkpad>
 <20221127235532.u7q7oou36wymkpyf@mobilestation>
 <TYBPR01MB5341932B42719E026AA16D40D8139@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <20221128115908.awhznkkrelk7h3nm@mobilestation>
 <TYBPR01MB534107A3C2B521BA0D67B4A7D8139@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <20221128161114.deacldwbckfnn6ft@mobilestation>
 <TYBPR01MB5341FA664D5F1FCA07294F96D8129@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <TYBPR01MB53413E1BE13CCA65307770FDD81D9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <20221208140111.7phlnsxktxzsc55f@mobilestation>
In-Reply-To: <20221208140111.7phlnsxktxzsc55f@mobilestation>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB10820:EE_
x-ms-office365-filtering-correlation-id: fb360907-d800-4763-1d95-08dad9b96007
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uw+prKWS+ZEfPDxIQyHjA+SOxWSVUN5RIECL6Q76h2rOSHwq3yjhc0vyvyLuv1ZhzTrv7mUUaiLVVg79IHpm8enuCd6cKIodnUpxR5tv/+aM287cblSZPH4L7rnxwH71tuwbBk+iMMbwNEiA3WCJ7aqvzKSMGm90yg1AaCujtY0Xu26IK4sKg9GySCi1HzbNpzAdJlUaZVPk1qW9uNQT5B4pFB0AyRixuJChayYgjECfbmEhwF2saY8kOm89EU8NLCUxirve4GijK+Y262FRT6U5LPTg8BMvw4clOXRLUCZBFZRwfpamAPC1/buoaZSHrnQ1gpDHNwwq59tXr5iAPspjObXheJTpixr4LMj5REOjlorA6n29WvibjLZMXvpHXAaV0B3szKgqjAYIEeNBEHub1ZQCMyfrqdAwjSvBzhfVjeOMiC0PMKdMmwuKNT93Qpg4W5eeMn/XKunf4pWY6608uygc3dR7GPDRp1dQSEBS1+Wu/P7J+/1m4+cvOXc/4yRQSbm1wTHhRaU4T/oPutkigd8JKpKV7NGhjXLG/okTb6YOi81IxvgDS4An7y+FFnpff9geFMP61MyehPXVdnGl0BswwQ7UPDlYdcxUWGRunEwZjQeE/WDK2FIfcTO9oKBZUAnYgiz096EHORxKgJhAmvwg37r8QIUOu33ISX6MmQYPBzMS2CUTnoP9KGOytJStDN1ppQrytHAWQ8JTrQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199015)(38070700005)(86362001)(83380400001)(2906002)(33656002)(54906003)(66476007)(8936002)(5660300002)(66446008)(122000001)(38100700002)(4326008)(316002)(64756008)(8676002)(66946007)(66556008)(41300700001)(76116006)(71200400001)(7416002)(55016003)(110136005)(7696005)(52536014)(478600001)(9686003)(6506007)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFdKWWFUcTZSUUViL25rZ1h5RU5yZ1d4Z2ZiNkhPTHl2ZS84VnNWMHNtVzdF?=
 =?utf-8?B?QjBYZkVmaVRpbG5xbUFuR1cwSHZUa250QlRDTDdFRmFPYkpReHNIRjFMMkN5?=
 =?utf-8?B?M3dEb3N0SGYxVTIzWTdlMDVmbldEbEQraVdMY2tDZjQ4V01kbzAvNzNYK1pj?=
 =?utf-8?B?eXMwK1IyM0pvY2dFanFsTUVyanlyYkx4S1JoY25NZFNXY00vVmRJcXI2cHkw?=
 =?utf-8?B?WTJ5M04wNVAxR3ZzMklyeHg2djlhMU1talgxU2Y2QnNrMzBiZCs2R3RuZjdC?=
 =?utf-8?B?ME5MZ3g3bjZ4cVMyR251V3ZMSHhkZnhzczd1VkxVRUV6TFBHekg2Y2J4c0V1?=
 =?utf-8?B?U2tPZUVFem01Z0tPaWszOXhVNWxQRWhaS1dISkM4cE13RWIwSkErdGFIZ0pZ?=
 =?utf-8?B?SzBROU5JYU92RmVYblpGT3gxT0VpeTRDMGZPanplSTJ6QW9iK0RwL29NWGN1?=
 =?utf-8?B?OHZFa3J0Qm55MXVldU16MGUvNXkxT2R6SDVNRE1ZWnFlSFBvVloraXQzUFli?=
 =?utf-8?B?L2pCSStkeEFPcWoySjZaaUp0Q25rWm9NakhibkI4NFc5RFFOcGcweXhaQWhY?=
 =?utf-8?B?MWhrT0ZXTTlUN1ViZkVjYjQxSzVzcVRJVTVPeDJIb3BsRU11aVc5ZldFVzhI?=
 =?utf-8?B?cWN1ZGczcSswbG52c3g1dzEwUUE4cW93aDVaK0FJcEF1WTVnaUM5dFczeWp4?=
 =?utf-8?B?Z2RFbVVLNVMweU4xbk4yeGZadXdJTVpBWkJYWGVjQmdGZ2M1SGgyTURMR0dW?=
 =?utf-8?B?d01BMjcvTlZEUk1iNDRIbXBPSVFZekZtWDRKbGQ1cHFhN0NMSDhwWmRkaE00?=
 =?utf-8?B?KzYvOWJJWnkyUzhyM0hkNmpwQ010NW5XbDRIVWVwdWxla1ZvODRRMW1UMGV0?=
 =?utf-8?B?S1VFclBKUTBnN01lUkd2U3VkTUlKeG9vcWVudzJoVHI3UXlDWmg1RkZHWjM1?=
 =?utf-8?B?MlJQWEpNbU5jVWROak4rVitlU1Jna2hMa3lrRU5mWUliL09Ia3lydFRweVRo?=
 =?utf-8?B?cFRDR0k0djYzQUpaUkpVRndtd2FobHZnZkR6Wnc4aW5kdnlMaWNWVEJOVTFD?=
 =?utf-8?B?ZkYvKzVhaEJPQTJoTTcwWG1ORUNEY1M0cHNPemRlMjBIMTRmYVFoWmsvTkpW?=
 =?utf-8?B?R2NQTXFvVnBLWFRQV01PWEFOMXFJWWxzMS9tKy9iSnIrTk0xWjhCcVh0Qk4v?=
 =?utf-8?B?dlRQcXEzOWpGZ2YyaFNzWjRHdnc1NXFwZVo1dFBPK0thelkwL25RRVlyU0J6?=
 =?utf-8?B?OC8waGJqSUkvc0xDN0NWKzMrLzlyc0ovNG1DUmFLMjI4bm13dGg5OFplMnYx?=
 =?utf-8?B?aUhURytRaTI2Y01ZSVdrY2l1ZUduSUtKdGhJTUdjdWw4UlB2U0JXTTB0ZDAr?=
 =?utf-8?B?Z1pGcnRsUFU1YkYwby9QNERPVUJzK2ZuODFGSHZrbm5GZ0gvUzF2RGoxVDV6?=
 =?utf-8?B?TWpIdUR4TWJKenc1cmkwZEpQclJISzdiZmw0WFE1L3psTnU1ODJ3N2p1RHVo?=
 =?utf-8?B?S0pNOFNFQm9OK3pvNWsxWjk3UjAzM2F3VmRjaHRYdDVGVmhBSWc0TWZ1MFhO?=
 =?utf-8?B?K2dMM2xRZ21YakluTnQwNndzb2dqWGR1N21tZ3ducy9KZ0RpLzcwYWg3TU15?=
 =?utf-8?B?TG41R3RpRzhmS0JBM3E5NnNhdXp3bitHcW1GQzlJVitkU3NEVU9ZYTZLTFlB?=
 =?utf-8?B?aEZaTm9DaU5uZTBoNUhMUmUzZm4rc1JEbjZDYmRLcXRxejcyN3RFN050TDE3?=
 =?utf-8?B?SlR1VE1NVVcvcXlBTGxXaExEM2piZ1ZzeDdWTG9TZ29qZmZ4NHBuZWxMOVY5?=
 =?utf-8?B?MXk4NEdiWnd4SlNpdXpGK3Y1K092cjkveTIzUExNRElUaTRzZUlYUEo3aXNX?=
 =?utf-8?B?cjdwRks2YTdIMStrMk9hZy9mNHZKcUpLWWpkVitkL1FwaE05VjdXUDJhdDdw?=
 =?utf-8?B?MFVwcTFaK3l1WkcyYmJzbDVXdC8rUGZFcHJ1OVI3YnNFMnRTemRjMG5PNy9k?=
 =?utf-8?B?NXZVQ3ZvRitkTFBKb3lnWDFSRGhacDJvTXpWV0kvWlFqNnZyS2paQ0ZLdGNH?=
 =?utf-8?B?TkxZamNJVnBjcjFIdVphWjF4NzlMVlo0VDhZVDlaZTRBVE0rd0JhQjZLWWQ3?=
 =?utf-8?B?WHFTcnJCVG5CVlFUcGpxd2lhN1NjNDlNUno2b0hRdXlGbitrQ0s3QkxkY1Rz?=
 =?utf-8?B?S21FdTl1Y3Y0SmNIVFh4R1o0aDJQVG0zaVM5UU5OV0FFS3hwWjJIYnA0M1hZ?=
 =?utf-8?B?UWpqQXZQUllkVVhXcWdjQzlxNXBnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb360907-d800-4763-1d95-08dad9b96007
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 07:45:42.9290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p5DdJ3JGIbyWFBcdMV5rcp0Ngx3HeseScRzA01rxPV85taSaTXuAZpGFWd3tk51BlE0d1LMd9OY7YdFsYhjeGq5jaLPnFGABOvzRseMKROWBmdvOLYwIqjUOnYRbainP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10820
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2VyZ2UsDQoNCj4gRnJvbTogU2VyZ2UgU2VtaW4sIFNlbnQ6IFRodXJzZGF5LCBEZWNlbWJl
ciA4LCAyMDIyIDExOjAxIFBNDQo+IA0KPiBDYyArPSBGcmFuayBMaQ0KPiANCj4gQEZyYW5rIGNv
dWxkIHlvdSBoYXZlIGEgbG9vayBhdCB0aGUgdGhyZWFkIGFuZCBjaGVjayB0aGUgY29udGVudCBv
Zg0KPiB0aGUgQ1NScyBkYmkrMHg4ZjggYW5kIGRiaSsweDk3OCBvbiBhdmFpbGFibGUgdG8geW91
IERXIFBDSWUgK0VETUENCj4gZGV2aWNlcz8NCj4gDQo+IE9uIFRodSwgRGVjIDA4LCAyMDIyIGF0
IDEyOjI2OjE4UE0gKzAwMDAsIFlvc2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiA+IEhpIFNlcmdl
LCBNYW5pdmFubmFuLA0KPiA+DQo+ID4gPiBGcm9tOiBZb3NoaWhpcm8gU2hpbW9kYSwgU2VudDog
VHVlc2RheSwgTm92ZW1iZXIgMjksIDIwMjIgOToyMiBBTQ0KPiA+ID4NCj4gPiA+ID4gRnJvbTog
U2VyZ2UgU2VtaW4sIFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDI5LCAyMDIyIDE6MTEgQU0NCj4g
PiA+ID4NCj4gPiA+ID4gT24gTW9uLCBOb3YgMjgsIDIwMjIgYXQgMTI6NDE6MTFQTSArMDAwMCwg
WW9zaGloaXJvIFNoaW1vZGEgd3JvdGU6DQo+ID4gPiA+ID4gSGkgU2VyZ2UsDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+IEZyb206IFNlcmdlIFNlbWluLCBTZW50OiBNb25kYXksIE5vdmVtYmVyIDI4
LCAyMDIyIDg6NTkgUE0NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBPbiBNb24sIE5vdiAyOCwg
MjAyMiBhdCAwMjo1Mjo1NkFNICswMDAwLCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4gPiA+
ID4gPiA+ID4gSGkgU2VyZ2UsDQo+ID4gPiA8c25pcD4NCj4gPiA+ID4gPiA+IE5vLCB0aGlzIHNo
b3VsZCBoYXZlIGJlZW4gdGhlIGR3X3BjaWVfcmVhZGxfZGJpKCkgY2FsbHMgaW5zdGVhZCBvZg0K
PiA+ID4gPiA+ID4gZHdfcGNpZV9yZWFkbF8hZG1hISgpLiBXaGF0IEkgdHJ5IHRvIHVuZGVyc3Rh
bmQgZnJvbSB0aGVzZSB2YWx1ZXMgaXMNCj4gPiA+ID4gPiA+IHRoZSByZWFsIHZlcnNpb24gb2Yg
eW91ciBjb250cm9sbGVyIChkYmkrMHg4ZjgpIGFuZCB3aGV0aGVyIHRoZSBsZWdhY3kNCj4gPiA+
ID4gPiA+IGVETUEgdmlld3BvcnQgcmVnaXN0ZXJzIHJhbmdlIGZvbGxvd3MgdGhlIGRvY3VtZW50
ZWQgY29udmVudGlvbiBvZg0KPiA+ID4gPiA+ID4gaGF2aW5nIEZGcyBpbiB0aGUgZGJpKzB4OTc4
IHJlZ2lzdGVyLiBNeSBjdXJyZW50IGFzc3VtcHRpb24gdGhhdA0KPiA+ID4gPiA+ID4gZWl0aGVy
IHlvdXIgSVAtY29yZSBpcyBuZXdlciB0aGFuIHY1LjMwYSBvciBoYXMgc29tZSB2ZW5kb3Itc3Bl
Y2lmaWMNCj4gPiA+ID4gPiA+IG1vZGlmaWNhdGlvbi4gQnV0IGxldCdzIHNlZSB0aGUgdmFsdWUg
Zmlyc3QuDQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gPiBPb3BzISBJJ20gc29ycnkgZm9y
IG15IGJhZCBjb2RlLiBBZnRlciBmaXhlZCB0aGUgY29kZSwgdGhlIHZhbHVlcyBhcmU6DQo+ID4g
PiA+ID4gLS0tDQo+ID4gPiA+ID4gWyAgICAxLjEwODk0M10gcGNpZS1yY2FyLWdlbjQgZTY1ZDAw
MDAucGNpZTogZHdfcGNpZV9lZG1hX2ZpbmRfY2hpcDogKzB4OGY4ID0gMzUzMjMwMmEsICsweDk3
OCA9IDAwMDAwMDAwDQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+DQo+ID4gPiA+IEBZb3NoaWhpcm8u
IEdvdCBpdC4gVGhhbmtzLiBDb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gKGRvdWJsZS1jaGVjaykN
Cj4gPiA+ID4gdGhhdCB3aGF0IHRoZSBjb250ZW50IG9mIHRoZSArMHg5NzggQ1NSIHdhcyByZWFs
bHkgcmVhZCBieSBtZWFucyBvZiB0aGUNCj4gPiA+ID4gZHdfcGNpZV9yZWFkbF9kYmkoKSBtZXRo
b2Q/DQo+ID4gPg0KPiA+ID4gWWVzLCBJIHVzZWQgZHdfcGNpZV9yZWFkbF9kYmkoKSBsaWtlIGJl
bG93Lg0KPiA+ID4NCj4gPiA+IC0tLS0tLS0tLS0tLS0tLSAoc29ycnksIHRhYnMgcmVwbGFjZWQg
d2l0aCBzcGFjZXMpIC0tLS0tLS0tLS0tLS0tLQ0KPiA+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5jDQo+ID4gPiBAQCAtODQzLDYgKzg0MywxMCBA
QCBzdGF0aWMgaW50IGR3X3BjaWVfZWRtYV9maW5kX2NoaXAoc3RydWN0IGR3X3BjaWUgKnBjaSkN
Cj4gPiA+ICB7DQo+ID4gPiAgICAgICAgIHUzMiB2YWw7DQo+ID4gPg0KPiA+ID4gKyAgICAgICBk
ZXZfaW5mbyhwY2ktPmRldiwgIiVzOiArMHg4ZjggPSAlMDh4LCArMHg5NzggPSAlMDh4XG4iLCBf
X2Z1bmNfXywNCj4gPiA+ICsgICAgICAgICAgICAgICBkd19wY2llX3JlYWRsX2RiaShwY2ksIDB4
OGY4KSwNCj4gPiA+ICsgICAgICAgICAgICAgICBkd19wY2llX3JlYWRsX2RiaShwY2ksIDB4OTc4
KSk7DQo+ID4gPiArDQo+ID4gPiAgICAgICAgIGlmIChwY2ktPmVkbWEucmVnX2Jhc2UpIHsNCj4g
PiA+ICAgICAgICAgICAgICAgICBwY2ktPmVkbWEubWYgPSBFRE1BX01GX0VETUFfVU5ST0xMOw0K
PiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ID4gPg0KPiA+ID4gPiBATWFuaSwgY291bGQgeW91IHBsZWFzZSBo
YXZlIGEgbG9vayBhdCB0aGUgY29udGVudCBvZiB0aGUgKzB4OGY4IGFuZA0KPiA+ID4gPiArMHg5
NzggQ1NScyBpbiB0aGUgQ0RNIHNwYWNlIG9mIHRoZSBhdmFpbGFibGUgdG8geW91IGNvbnRyb2xs
ZXJzPw0KPiA+ID4gPg0KPiA+ID4gPiBJJ3ZlIHJlcHJvZHVjZWQgdGhlIGJlaGF2aW9yIHdoYXQg
ZGlzY292ZXJlZCBieSBAWW9zaGloaXJvLCBidXQgb24NCj4gPiA+ID4gdjUuNDBhIElQLWNvcmUg
b25seS4gSXQgd2FzIGV4cGVjdGVkIGZvciB0aGF0IGNvbnRyb2xsZXIgdmVyc2lvbiwgYnV0DQo+
ID4gPiA+IHY1LjIwYSB3YXMgc3VwcG9zZWQgdG8gaGF2ZSBGRnMgaW4gKzB4OTc4IGZvciB0aGUg
dW5yb2xsZWQgaUFUVS9lRE1BDQo+ID4gPiA+IHNwYWNlLiBJdCdzIHN0cmFuZ2UgdG8gc2VlIGl0
IGRpZG4ndC4NCj4gPg0KPiANCj4gPiBTbywgc2hvdWxkIEkgYWRkIGEgcXVpcmsgZmxhZyBmb3Ig
bXkgY29udHJvbGxlciBsaWtlIGJlbG93Pw0KPiA+IC0tLQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuYyBiL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5jDQo+ID4gaW5kZXggNjk2NjVhOGEwMDJlLi4z
ODRiZDJjMGVhNzUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpZS1kZXNpZ253YXJlLmMNCj4gPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2llLWRlc2lnbndhcmUuYw0KPiA+IEBAIC04NDQsNyArODQ0LDcgQEAgc3RhdGljIGludCBkd19w
Y2llX2VkbWFfZmluZF9jaGlwKHN0cnVjdCBkd19wY2llICpwY2kpDQo+ID4gICAgICAgICB1MzIg
dmFsOw0KPiA+DQo+ID4gICAgICAgICB2YWwgPSBkd19wY2llX3JlYWRsX2RiaShwY2ksIFBDSUVf
RE1BX1ZJRVdQT1JUX0JBU0UgKyBQQ0lFX0RNQV9DVFJMKTsNCj4gDQo+ID4gLSAgICAgICBpZiAo
dmFsID09IDB4RkZGRkZGRkYgJiYgcGNpLT5lZG1hLnJlZ19iYXNlKSB7DQo+ID4gKyAgICAgICBp
ZiAoKHBjaS0+bm9fZG1hX2N0cmxfcmVnIHx8IHZhbCA9PSAweEZGRkZGRkZGKSAmJiBwY2ktPmVk
bWEucmVnX2Jhc2UpIHsNCj4gPiAgICAgICAgICAgICAgICAgcGNpLT5lZG1hLm1mID0gRURNQV9N
Rl9FRE1BX1VOUk9MTDsNCj4gPg0KPiA+ICAgICAgICAgICAgICAgICB2YWwgPSBkd19wY2llX3Jl
YWRsX2RtYShwY2ksIFBDSUVfRE1BX0NUUkwpOw0KPiANCj4gVmVyeSBtdWNoIG5vLiBJIGhhdmUg
anVzdCBnb3QgcmlkIGZyb20gc3VjaCBib29sZWFuIGZsYWdzIGZyb20gdGhlIERXDQo+IFBDSSBw
cml2YXRlIGRhdGEuDQo+IA0KPiBQbGVhc2UgYmUgcGF0aWVudC4gTWFpbnRhaW5lcnMgbm90IGFs
d2F5cyByZXNwb25kIGFzIHNvb24gYXMgd2Ugd291bGQNCj4gd2FudC4gUGxlYXNlIG5vdGUgbXkg
cGF0Y2hzZXQgYWxzbyBzdGFsbHMgZHVlIHRvIHlvdXIgZGlzY292ZXJ5IChEVw0KPiBlRE1BIHBh
dGNoZXMgc3RpbGwgdW5kZXIgcmV2aWV3KS4NCj4gDQo+IFdoYXQgd2UgaGF2ZSBkaXNjb3ZlcmVk
IGhlcmUgaXMgdGhlIHVuZG9jdW1lbnRlZCBiZWhhdmlvci4gVGhlDQo+IEhXLW1hbnVhbHMgZnJv
bSA0LjgwIHVwIHRvIDUuMzAgc2F5IHRoYXQgdGhlIHJlZ2lzdGVyIGRiaSsweDk3OCBtdXN0DQo+
IGhhdmUgRkZzIGlmIHRoZSByZWdpc3RlciBkb2Vzbid0IGV4aXN0LiBBIHNpbWlsYXIgcnVsZSBp
cyBkZWZpbmVkIGZvcg0KPiB0aGUgaUFUVSBDU1JzIHNwYWNlIGFuZCBpdCdzIHdvcmtpbmcgd2Vs
bCBhdCBsZWFzdCB1cCB0byBJUC1jb3JlDQo+IDUuNDBhLiBUaGUgdmlld3BvcnQtYmFzZWQgZURN
QSBDU1JzIHNwYWNlIGhhcyBiZWVuIHJlbW92ZWQgZnJvbSB0aGUNCj4gSFctbWFudWFscyBzaW5j
ZSBJUC1jb3JlIDUuNDBhIGFuZCBJIGNhbiBhc3N1cmUgdGhhdCBJUC1jb3JlIDUuNDBhIGhhcw0K
PiB6ZXJvcyBpbiBkYmkrMHg5Nzggb24gdGhlIHJlYWwgSFcuIEkgZG8gaGF2ZSBhbm90aGVyIGRl
dmljZXMgd2l0aCBlRE1BDQo+IGJ1dCBhbGwgb2YgdGhlbSBoYXZlIGJlZW4gc3ludGhlc2l6ZWQg
d2l0aCB0aGUgbGVnYWN5IHZpZXdwb3J0LWJhc2VkDQo+IGVETUEgYWNjZXNzLCBzbyBJIGNhbid0
IGNoZWNrIHdoZXRoZXIgdGhlIEZGcyBzdGF0ZW1lbnQgaXMgY29ycmVjdCBmb3INCj4gdGhlIGRl
dmljZXMgb2xkZXIgdGhhbiA1LjQwLiBZb3UgZGV0ZWN0ZWQgdGhlIHByb2JsZW0gb24gdGhlIElQ
LWNvcmUNCj4gNS4yMGEsIGJ1dCBATWFuaSBkaWRuJ3Qgc2VlIGl0IG9uIGhpcyBkZXZpY2VzLiBO
ZWl0aGVyIGRvZXMgRnJhbmsNCj4gQUZBSVUuIFRoYXQncyB3aHkgSSBhc2tlZCBoaW0gYW5kIEBG
cmFuayB0byBjaGVjayB3aGF0IHZhbHVlIHRoZQ0KPiBkYmkrMHg4ZjggYW5kIGRiaSsweDk3OCBy
ZWdpc3RlcnMgaGF2ZSBpbiB0aGVpciBkZXZpY2VzIGF0IGhhbmQuIEFmdGVyDQo+IHRoYXQgd2Un
bGwgZWl0aGVyIGFkZCB0aGUgSVAtY29yZSB2ZXJzaW9uIGJhc2VkIHRlc3QgaGVyZToNCj4gPCAt
ICAgICAgIHZhbCA9IGR3X3BjaWVfcmVhZGxfZGJpKHBjaSwgUENJRV9ETUFfVklFV1BPUlRfQkFT
RSArIFBDSUVfRE1BX0NUUkwpOw0KPiA8ICsgICAgICAgaWYgKGR3X3BjaWVfdmVyX2lzX2dlKHBj
aSwgNT8wQSkpIHsNCj4gPCArICAgICAgICAgICAgICAgdmFsID0gMHhGRkZGRkZGRjsNCj4gPCAr
ICAgICAgIGVsc2UNCj4gPCArICAgICAgICAgICAgICAgdmFsID0gZHdfcGNpZV9yZWFkbF9kYmko
cGNpLCBQQ0lFX0RNQV9WSUVXUE9SVF9CQVNFICsgUENJRV9ETUFfQ1RSTCk7DQo+IG9yIGFkZCBh
IG5ldyBjYXBhYmlsaXR5IGZsYWcgaWYgQE1hbmkgaGFzIElQLWNvcmUgNS4yMGEgd2l0aCBGRnMg
aW4NCj4gdGhlIENTUnMgZGJpKzB4OTc4LiBMaWtlIHRoaXM6DQo+IDwgLSAgICAgICB2YWwgPSBk
d19wY2llX3JlYWRsX2RiaShwY2ksIFBDSUVfRE1BX1ZJRVdQT1JUX0JBU0UgKyBQQ0lFX0RNQV9D
VFJMKTsNCj4gPCArICAgICAgIGlmIChkd19wY2llX2NhcF9pcyhwY2ksIEVETUFfVU5ST0xMKSkg
ew0KPiA8ICsgICAgICAgICAgICAgICB2YWwgPSAweEZGRkZGRkZGOw0KPiA8ICsgICAgICAgZWxz
ZQ0KPiA8ICsgICAgICAgICAgICAgICB2YWwgPSBkd19wY2llX3JlYWRsX2RiaShwY2ksIFBDSUVf
RE1BX1ZJRVdQT1JUX0JBU0UgKyBQQ0lFX0RNQV9DVFJMKTsNCj4gDQo+IFNvIHRoZSBtYWluIGdv
YWwgb2YgdGhpcyBhY3Rpdml0eSBpcyB0byBjaGVjayB3aGV0aGVyIHlvdXIgZGlzY292ZXJ5DQo+
IGlzIGEgYnVnIG9uIHlvdXIgcGFydGljdWxhciBkZXZpY2Ugb3IgaXMgYSBidWcgaW4gdGhlIEhX
LW1hbnVhbHMuIElmDQo+IHRoZSBsYXRlciBpcyBjb3JyZWN0IHRoZW4gdGhlIGVETUEgQ1NScyBz
cGFjZSBhdXRvLWRldGVjdGlvbiBwcm9jZWR1cmUNCj4gc2hvdWxkIGJlIGZpeGVkIHRvIGJlIGV4
ZWN1dGVkIHVwIHRvIHRoZSBjb3JyZXNwb25kaW5nIElQLWNvcmUNCj4gdmVyc2lvbi4gSWYgdGhl
IGZvcm1lciBpcyBjb3JyZWN0IHRoZW4gd2UnbGwgYWRkIGEgbmV3IGNhcGFiaWxpdHkNCj4gZmxh
Zy4gSW4gYW55d2F5IGhhdmluZyB0aGUgbmV3IGJvb2xlYW4gZmllbGQgaW4gdGhlIGRldmljZSBw
cml2YXRlDQo+IGRhdGEgd291bGRuJ3QgYmUgYSBnb29kIG9wdGlvbiBzaW5jZSB0aGVyZSBpcyB0
aGUgY2FwYWJpbGl0aWVzIEFQSQ0KPiBhdmFpbGFibGUgaW4gdGhlIGRyaXZlci4NCg0KVGhhbmsg
eW91IHZlcnkgbXVjaCBmb3IgeW91ciBkZXRhaWxlZCBleHBsYW5hdGlvbiEgSSB1bmRlcnN0b29k
Lg0KIyBBdCBsZWFzdCwgSSBzaG91bGQgaGF2ZSByZWFsaXplZCB0aGF0IHRoZSBQQ0kgZHdjIGRy
aXZlciBoYXMNCiMgdGhlIGNhcGFiaWxpdGllcyBBUEkgYmVmb3JlIEkgc2VuZCBhbiBlbWFpbC4u
Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IC1TZXJnZSh5KQ0KPiAN
Cj4gPiAtLS0NCj4gPg0KPiA+IEJlc3QgcmVnYXJkcywNCj4gPiBZb3NoaWhpcm8gU2hpbW9kYQ0K
PiA+DQo+ID4gPiA+IC1TZXJnZXkNCj4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IDxzbmlw
Pg0KPiA+ID4gPiA+ID4gPiBTbywgc2hvdWxkIEkgY2hhbmdlIHRoZSBjb25kaXRpb24gbGlrZSBi
ZWxvdz8NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+IC0J
aWYgKHZhbCA9PSAweEZGRkZGRkZGICYmIHBjaS0+ZWRtYS5yZWdfYmFzZSkgew0KPiA+ID4gPiA+
ID4gPiArCWlmICgodmFsID09IDB4RkZGRkZGRkYgfHwgdmFsID09IDB4MDAwMDAwMDApICYmIHBj
aS0+ZWRtYS5yZWdfYmFzZSkgew0KPiA+ID4gPiA+ID4gPiAuLi4NCj4gPiA+ID4gPiA+ID4gLQl9
IGVsc2UgaWYgKHZhbCAhPSAweEZGRkZGRkZGKSB7DQo+ID4gPiA+ID4gPiA+IC0JfSBlbHNlIGlm
ICghKHZhbCA9PSAweEZGRkZGRkZGIHx8IHZhbCA9PSAweDAwMDAwMDAwKSkgew0KPiA+ID4gPiA+
ID4gPiAtLS0NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBEZWZpbml0ZWx5IG5vLiBFdmVuIHRo
b3VnaCBpdCdzIGltcG9zc2libGUgdG8gaGF2ZSB0aGUgZURNQSBjb250cm9sbGVyDQo+ID4gPiA+
ID4gPiBjb25maWd1cmVkIHdpdGggemVybyBudW1iZXIgb2YgcmVhZCBhbmQgd3JpdGUgY2hhbm5l
bHMgd2Ugc2hvdWxkbid0DQo+ID4gPiA+ID4gPiBhc3N1bWUgdGhhdCBnZXR0aW5nIGEgemVybyB2
YWx1ZSBmcm9tIHRoZSBETUFfQ1RSTF9WSUVXUE9SVF9PRkYgb2Zmc2V0DQo+ID4gPiA+ID4gPiBt
ZWFucyBoYXZpbmcgdGhlIHVucm9sbGVkIGVETUEgQ1NScyBtYXBwaW5nLiBMZXQncyBoYXZlIGEg
bG9vayBhdCB0aGUNCj4gPiA+ID4gPiA+IGNvbnRlbnQgb2YgdGhlIGRiaSsweDhmOCBhbmQgZGJp
KzB4OTc4IG9mZnNldHMgZmlyc3QuIEJhc2VkIG9uIHRoZXNlDQo+ID4gPiA+ID4gPiB2YWx1ZXMg
d2UnbGwgY29tZSB1cCB3aXRoIHdoYXQgdG8gZG8gbmV4dC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IEkgZ290IGl0Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQmVzdCByZWdhcmRzLA0KPiA+ID4gPiA+
IFlvc2hpaGlybyBTaGltb2RhDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IC1TZXJnZSh5KQ0KPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gQmVzdCByZWdhcmRzLA0KPiA+
ID4gPiA+ID4gPiBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiA+IC1TZXJnZXkNCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiAgCX0gZWxz
ZSB7DQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAJCXJldHVybiAtRU5PREVWOw0KPiA+ID4gPiA+ID4g
PiA+ID4gPiAgCX0NCj4gPiA+ID4gPiA+ID4gPiA+ID4gLS0NCj4gPiA+ID4gPiA+ID4gPiA+ID4g
Mi4yNS4xDQo+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiA+ID4gLS0NCj4gPiA+ID4gPiA+ID4gPiA+IOCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCv
jSDgrprgrqTgrr7grprgrr/grrXgrq7gr40NCg==
