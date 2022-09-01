Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8EE5A998C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Sep 2022 15:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233652AbiIAN6H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Sep 2022 09:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234165AbiIAN5n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2022 09:57:43 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2117.outbound.protection.outlook.com [40.107.113.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 912EF37F8C;
        Thu,  1 Sep 2022 06:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/+Jo4Nu8IHa8/IIRv3ZzooCXfveDGIyYmJ2xyALZHOwrdLA9ChtYvt3nH8X8GqYqcziLosv7MbOZm/5NVoHs0N/ENFWM0WbuI4qOGebJ6YmT3jDS5IwCWSdyZHAe75VsojKcmjrGgaxa7BKaLEDu8+Ag5cD8JQY0TkC8i6FUAwmrTI9vRqBscRXKpIyrgW9C/8wCRcG9lQQS8QNic1UEe7Rii9hDDKc0OO6nKakNFfb/8gFy6uL/m3EN1aDhDO6aKMDT4v/cy6csqS/cypO8m+osrMWApDpU5luAAOeipPNt9fzLPr3JWkzzuFJlwoVzI2nKZF9DljlHBp6xMQfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jm7ZvKvM6VjdZN7505GBwhSwnY4uozfoT7EvDsmI/fo=;
 b=ll1nF8EFo7R50wW0XIQl9yFF6nSgMsVhBLxyclAFmhpxfJsAczL77P4dAeKdl7Uv0gqWT788dLTyEnRykiOvOS+HdhEz4dVJ9nqcu0b4cX8BoZjCxH0C0pJRr+X/4nrit+atO/atxbWD1Trh9OLwiG6c+Ky1CZAYi/BpswbJjyc3j9bDdQ0z3vM6PJrXkgQG16M0IpjoFwR1SgKZe1ZSPJZD9oScKBv9qYWTMcgQjIzC6CuXLBFQ6kRKvcYC7VDV4jhZXXIoSHgWcDYBdk3t4S5dNaJ8Tx4WDmi+x8GhmnIg9mOfK3VdMKrQXEEAHSGzdGElrL/oz6LNxGIHbGT1bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jm7ZvKvM6VjdZN7505GBwhSwnY4uozfoT7EvDsmI/fo=;
 b=nV/eRrWee6vzxD2Ugbmkn4Cw2D7wEcW1g786aCfmB8vGhbE8fCQVurtu8cvdFUYQZLR+0zBsyvDN08AI/ZyFvxEwGlPXtntcbx0M9DyReBcswArJi/HJ68+AfH5rtmWHxqb87azRC4miAaKTZ4LXVwyshZGGYfiKTFB0IvZ9ESw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB10482.jpnprd01.prod.outlook.com (2603:1096:400:2f5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 13:57:39 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 13:57:39 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v3 3/3] ARM: dts: r9a06g032-rzn1d400-db: Enable CAN{0,1}
Thread-Topic: [PATCH v3 3/3] ARM: dts: r9a06g032-rzn1d400-db: Enable CAN{0,1}
Thread-Index: AQHYvI/xwwoQLfdpd0uJ7SnkncZ0563KiFyAgAAEIXCAAA6sQA==
Date:   Thu, 1 Sep 2022 13:57:39 +0000
Message-ID: <OS0PR01MB59228FE2D7CD7EAFD12F63FB867B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220830164518.1381632-1-biju.das.jz@bp.renesas.com>
 <20220830164518.1381632-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdW_+VSbTj1qidjiHZX+0ryCSFj3AQskM3oX4PKjHD-9ow@mail.gmail.com>
 <OS0PR01MB5922F1B7FC6D7C6249EF22B9867B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F1B7FC6D7C6249EF22B9867B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c0b1c4c-f403-4748-74de-08da8c21eed8
x-ms-traffictypediagnostic: TYYPR01MB10482:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Hj/0xgFPmtu8yjpX+M/1uFMb+4LCnenFDtIkYg7AGTC4ny+aS8mJBjpb3xa2jKYBHTyCB9x/oFA+Qn0ANfRKquqHOoR6zcXyFR984B1g+fu3X/P4p+GazuU3KFWVjS3DV+d2MJ/1L7lQcaSNuChiG+fgiKCNGXu8KOLcxa+OLV9Dm10HSAB+sKxlxOrb3iEkftABqK28mW5J60JWhte5DVIPYC/PC4KeHR+rKecZ0B31jML8e2GnANXgNiVt5UDTtnSfMFlyNdmO+Bpe7O04Z2fpBi/5guL421REf+n4ltkgEpUAzFis//tieWRBc8T9Ti0A0j9kxZGAyMh2c72pewoIkSUWl9A/t5HylPVCvOXDVCiP5NnNGcAX/9U2NvA0J0IpWK9mApvqT5uGmbyZUZqJYGxAEHDKDeEwFvz2lTS0tsgG5p1Jv2vL3X9/M9b0P4bnSRUH+qrIY+3ENlhtF0uxeUuJwDM8ffghbI/efOr1t6vLOO0DHEgZaAIX+Kn9z8bJMIJgleE1O8U/DPJxqoV1mbPsbd/echO5dev+qelzSLfczNySgX09nfDC83feuVWKyMlX8EkuOoMbnUl6ARW1NG2c8ZQUx0RliJ8XTThKrFGHffJaPBnqw6DtWo+lBMKvCqjPGF9E6HvaNxwgTu/O64ha3LPJNDYY3WqSBK/8Cowx2UTCzZNOIM5SVWsxX3OABm+TJRCUv46pPqJ2XLUFMGSYiBGlpiTrOPF2TjzhKM0fJVkbns8WiDYXQqq4HtLdNuvF8Ssy3osk2rPYQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(6506007)(55016003)(54906003)(4326008)(66476007)(83380400001)(66446008)(8676002)(66556008)(66946007)(64756008)(76116006)(71200400001)(6916009)(316002)(41300700001)(86362001)(53546011)(26005)(9686003)(2940100002)(186003)(33656002)(2906002)(478600001)(5660300002)(52536014)(8936002)(38070700005)(38100700002)(7696005)(107886003)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUVrTmlnckdMYUUwaHBPVnZINnhERTVWcGFNeTlYYkEzYVV1WjhzaDhGbFNy?=
 =?utf-8?B?dDZDeG5uTmZVV1lhWWRNcWdJV0wvR2EzY3krOWxxbFNWVWcrM1o3UGI1USt5?=
 =?utf-8?B?RG1Md09ySXBwSVBwMVozMWRoWi9abWpqOGViRFlNWmFTdEU3bU5lcytlY2lR?=
 =?utf-8?B?WVJPM1VZeDYyNGR5SGxWVkNHV3hYeHArVG02SVYwbEJ6NG9iM1N2bHlNL0NT?=
 =?utf-8?B?Mzh0ZHZCUEpDbDc2Q3JoYUpUWkRIY1E0b3pWK0h6NkV4RDE0a09lZG85RE5t?=
 =?utf-8?B?S1R2cVRSc0RPSWMyTTVxZTM4SlYzcllCeDB0V3VMdjBVR2lVb3V4RHdxTUxu?=
 =?utf-8?B?QUg2RW02cGN5QlNrMS83Z3BuSHhYelcrNjl0ZGZkUXBYTis3M0NXalliWUxD?=
 =?utf-8?B?Vm9aVityeWpuK3dJc21GSU9pSHU4YUpUMkxlNEdyUjJTdkJONzVYNlRQbDVC?=
 =?utf-8?B?MERJR2ppbGdHT3A3aHdQZ01USHdEZnp0eDFiUUpzRGpnSjV5d21iOUI1dE8x?=
 =?utf-8?B?QnVPbytaVWZQbGRPYVhXV2xYajFiSDdUTGFXdDd2cUM3TmJjdU0xYi9qay9q?=
 =?utf-8?B?UjUzaHlMZExDVm1objZ1MWhrdWxhbS95N2FnWlh3OGdRWTVBUzhnMU5NYldq?=
 =?utf-8?B?NE5LdUFWclNDaUNHc1BtSksyeDRtSSt5d1owSk40aVBmaytKNHY4MUNxTG1j?=
 =?utf-8?B?VlNjQXlIOFNJdjNBVEkyUVM2U2ZkbENGNTk3RTJxWjVvMVo1ME9ieHExb05k?=
 =?utf-8?B?N1dJeFFPdE56alBmdG5uK3A0TjVKcTBDTHNyUzR6YW15aC9DTkVEZXE1cFFG?=
 =?utf-8?B?VmJyWWpNTi9VdjN4Tm1WYnBpbzBUcHdwOVFBOGZJdUpNdEFRNGk5R05NbE5G?=
 =?utf-8?B?UHY4enVlVDBGQlhEbk5zdHVHR29rMFQzRGxZcVBXYTA4M2x6d1paTFVBOWdW?=
 =?utf-8?B?bkhBb3FpZGNaZnZKZFFpVUpZUWM3ajM5WFBLc2xqL0ZKenNOaWVDS1BMR2kr?=
 =?utf-8?B?QVFGZFJjd0xLOS9jQ3VPejdyQnRORTZWR0d6VHJCQWE3RHhhcWordWlScVZy?=
 =?utf-8?B?T3hTR3ZDUXZlTkFVUUJjL0x0cFZHQnFsRTRYMDBYTDd0QnE1M0hZU1VhYk02?=
 =?utf-8?B?dXRrb2xyeXdTbFBiNmVTK2hJdDN1S2loSzRyUkJsa0xUTzdvdmNqN3ZPM1Ri?=
 =?utf-8?B?WXp2V0RTeWt4SGI3WkIzb0lNN2FVejdyQ2dacm8xa3ozRk0yR09PcUx1a3hM?=
 =?utf-8?B?eHQyWkp3ZVY5WjJSVGFPa0IySFBuWW5QdEp4VjRjNnloejV5WVFlczQweGlm?=
 =?utf-8?B?eTBxa2FuVTd2bWJ2aXYvV29DZjFmL1lQRU1MUXNEUkRvSUdNTjg2clNoMWtZ?=
 =?utf-8?B?Y3JZb2phQjhZSXZTZ3B3NHRBeVp6VE1naUN1ZlM3VHMrbmlrUkdDSE05RGJn?=
 =?utf-8?B?QkVKNmZXRXUwUlNIb2pDbkN2Y2RpMUlCZFJ6RFRQT0RibEJKNWFScUJqdEY2?=
 =?utf-8?B?TTI5dUp2RzlsVzQrczN3V3o1OGQ2RDFSZHFFZWREeDgyY3laSXZQdjJOM1NB?=
 =?utf-8?B?U2Rra2NrZDFpTmxsSzRoLzkxV0pPbVJ5WE03b0hjL2JGdVdkRlNYc2ZTTzc4?=
 =?utf-8?B?aFRMWmFYaStNZ014VUtCYWVyN1FYTCt3RzI3RjFaM1cwWVY4L0toNnY0dFla?=
 =?utf-8?B?Z05sbVVSTXdQS1ZkYUoyamk0Y2JCUXlodEpSR284ekNQTlora0g0VzQ2MmpK?=
 =?utf-8?B?elA2MHNXWVpWY0JaSzZCRDVLcEVGSU5qZDAxL1luYVpLSHJaRUYwRFdPQ1dB?=
 =?utf-8?B?cHRPZW1Na2phSmRzaEdhb2h0N1FWOFA1bUZtMFNyTlFuRzVlVTBBbUw4M3Mw?=
 =?utf-8?B?VDI4MEt1QVhhMEEwRWlLVmNpR3Y4VnROTGswcnkxSWRVMGFDR1pKd1JaSGQr?=
 =?utf-8?B?YUV3MlN6ejA5TXh4RVdMU0NJSEZWb1BnVU10aGNGTVIwODJWMkI4TlZMQWFu?=
 =?utf-8?B?SHhxUGlJRFRRcnJlN2R3VU1PNTltTG53a2ZKTENHQWNDditGTHdzdWJRQ1Fj?=
 =?utf-8?B?b2FGR3FEbHd0VmIwZGsvbzFkYXVqSEIrcHJUcWEvMmkzeEN2a1RJbTVMVnZu?=
 =?utf-8?B?U1I5dXF6elc4SFpwRlZ0elFpTW1QVXk2dW9tdGJEVEw3a2VkUDd1Q3k3RjNp?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0b1c4c-f403-4748-74de-08da8c21eed8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 13:57:39.4694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pw8+eVZa/CB8QF4u476Qkg2J6n+0Ai7YmjYlknWx3atnFj7DKGdWUqESZdg4hUUapbHHMBVfVot1fgZgPz0YnwtRqoY9LROb6BXWkygbkIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10482
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2MyAzLzNdIEFSTTogZHRzOiByOWEw
NmcwMzItcnpuMWQ0MDAtZGI6IEVuYWJsZQ0KPiBDQU57MCwxfQ0KPiANCj4gSGkgR2VlcnQsDQo+
IA0KPiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4gDQo+ID4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAzLzNdIEFSTTogZHRzOiByOWEwNmcwMzItcnpuMWQ0MDAtZGI6IEVuYWJsZQ0KPiA+IENB
TnswLDF9DQo+ID4NCj4gPiBIaSBCaWp1LA0KPiA+DQo+ID4gT24gVHVlLCBBdWcgMzAsIDIwMjIg
YXQgNjo0NSBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gd3Jv
dGU6DQo+ID4gPiBFbmFibGUgQ0FOezAsMX0gb24gUlovTjFELURCIGJvYXJkLg0KPiANCj4gTXkg
YmFkLCBpdCBpcyBSWi9OMUQtREIgQ1BVIGJvYXJkIGZpdHRlZCB0byBSWi9OMS1FQiBjYXJyaWVy
IGJvYXJkLg0KPiBBY3R1YWxseSBpdCBlbmFibGVzIENBTnswLDF9IG9uIHRoZSBjYXJyaWVyIGJv
YXJkLg0KPiANCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IHYyLT52MzoNCj4gPiA+ICAqIE5v
IGNoYW5nZQ0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+DQo+ID4gPiAtLS0g
YS9hcmNoL2FybS9ib290L2R0cy9yOWEwNmcwMzItcnpuMWQ0MDAtZGIuZHRzDQo+ID4gPiArKysg
Yi9hcmNoL2FybS9ib290L2R0cy9yOWEwNmcwMzItcnpuMWQ0MDAtZGIuZHRzDQo+ID4gPiBAQCAt
MjYsNiArMjYsMjAgQEAgYWxpYXNlcyB7DQo+ID4gPiAgICAgICAgIH07DQo+ID4gPiAgfTsNCj4g
PiA+DQo+ID4gPiArJmNhbjAgew0KPiA+ID4gKyAgICAgICBwaW5jdHJsLTAgPSA8JnBpbnNfY2Fu
MD47DQo+ID4gPiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ID4gPiArDQo+
ID4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiA+ICt9Ow0KPiA+ID4gKw0KPiA+ID4g
KyZjYW4xIHsNCj4gPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZwaW5zX2NhbjE+Ow0KPiA+ID4g
KyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAg
ICBzdGF0dXMgPSAib2theSI7DQo+ID4gPiArfTsNCj4gPg0KPiA+IEFjY29yZGluZyB0byB0aGUg
c2NoZW1hdGljcyBhbmQgYm9hcmQgZG9jdW1lbnRhdGlvbiwgb25seSBhIHNpbmdsZSBDQU4NCj4g
DQo+IFNlZSBhYm92ZSwgUlovTjEtRUIgc2NoZW1hdGljcyBoYXMgYm90aCBjb25uZWN0b3JzPz8N
Cj4gDQo+ID4gY29ubmVjdG9yIGlzIHByZXNlbnQsIGFuZCB0aGUgQ0FOIGludGVyZmFjZSB0byB1
c2UgbXVzdCBiZSBzZWxlY3RlZA0KPiA+IHVzaW5nIHRoZSBDTjEwL0NOMTEganVtcGVycy4gIEhl
bmNlIEkgdGhpbmsgd2UgbmVlZCBhICNkZWZpbmUgYW5kIGFuDQo+ID4gI2lmZGVmIHRvIGNvbmZp
Z3VyZSB0aGlzLCBvciBhdCBsZWFzdCBrZWVwIG9uZSBpbnRlcmZhY2UgZGlzYWJsZWQsIGFuZA0K
PiA+IGFkZCBhIGNvbW1lbnQgZXhwbGFpbmluZyB3aHkuDQoNCk9LLCBUbyBhdm9pZCBjb25mdXNp
b24sIHdpbGwgZ3VhcmQgZW5hYmxpbmcgQ0FOMSB3aXRoICNkZWZpbmUgbWFjcm8gDQphcyBjcHUg
c2NoZW1hdGljIGRvZXNuJ3QgbWVudGlvbiBhYm91dCB0aGlzLg0KDQpDaGVlcnMsDQpCaWp1DQoN
Cj4gDQo+IE91ciBCU1AgcmVsZWFzZSwgYnkgZGVmYXVsdCBlbmFibGVzIGJvdGggdGhlIENBTiBp
bnRlcmZhY2VzKENOMTAvQ04xMSkNCj4ganVtcGVycy4NCj4gSSBoYXZlIGEgUlovTjEtRUIgY2Fy
cmllciBib2FyZCBhbmQgdGVzdGVkIENBTiBsb29wYmFjayBvbiB0aGVzZQ0KPiBpbnRlcmZhY2Vz
Lg0KPiANCj4gQ2hlZXJzLA0KPiBiaWp1DQo+IA0KDQo=
