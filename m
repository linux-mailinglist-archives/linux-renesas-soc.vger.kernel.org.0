Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A762709CDA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 May 2023 18:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjESQtZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 May 2023 12:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbjESQtQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2023 12:49:16 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2125.outbound.protection.outlook.com [40.107.114.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE3610CE;
        Fri, 19 May 2023 09:49:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RT5zIiUpVdOwZPHtMbSm/6NRwUCYbuErh8srsK0XxBLp09Fv+fN3NCIDNA2vLAeBVix3wOhCCcmqAXEGIFqQExSheJO95Yy5KercqoXYxnwM9XxymK/XCFI94iiEkPdaHMYzr8JiqLwj0lg/DpZiRuExdGMAfkPCX7/lstCLNfyph/FmXyCAxIBnjqgAohqEVcnKtPJb3PDllTpHlwZGReHcdVGnY6wM9K1zaSvXjq/B02l4zwH1PVwnOBrKzInjjvhMbAwkNzqxmiasY/pRL8qAkMtEqo5ZKIWfZ8H02s2JYGevuZ51tfoHuD/XIv0juB6YFUkyakuxkSjd9jsG2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOJTwow3owGdtj7NnczulIW+gDBc/guIWrgDGrMh0ZM=;
 b=FDtr/cwS9FTEdELuid8o6v7mmhFp1I6oqqhPjpCVXXwI72Ra37WcY9BGGyr4z8cIijNHmjXc9XZDJ9/6kq62FBLfoC+Iq2F3DTdK7sOlqgDZ5Et0kCCngzcThFHc5MOdHQ01Fkd1hm5kvjTCtPOlzBJtfNNPrz7JR308RZwQjd268FPQA5IK5gtZZLcMXaObVbepI5MTe8G863KYwybfgja1RKzfZ8rksdKc21YQK8jBA7xcB42l1SK/QVjAWqZWtKtAmQQHo5KG4/hAkM7FyEDlKkO3MMcPV4H2z+DhCNnJMDVfiEsAuxS7FVpvhLEYgi0Bcp0uowSagVsgnukpCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOJTwow3owGdtj7NnczulIW+gDBc/guIWrgDGrMh0ZM=;
 b=Vdg+VsVXAg5YwiL5w1vvZHH2ilZBLzjLMyT8eF8uuMShVJGEK9KcoR8voif54t3FVhbQmEJHnLNOcFWHCgm86xPIhvTcvkLojuVNJIe174uTksTgehDgMIpUZekt+5gYl8mw5d9rPIM0cIWhyFoM98NDaS1PV/M0o3odvikFKgA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5895.jpnprd01.prod.outlook.com (2603:1096:604:c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Fri, 19 May
 2023 16:49:03 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 16:49:03 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas RAA215300
 PMIC bindings
Thread-Topic: [PATCH v4 09/11] regulator: dt-bindings: Add Renesas RAA215300
 PMIC bindings
Thread-Index: AQHZiX0f8Q76HwTBKEKFLFKF5VU7o69hkEAAgABAGxA=
Date:   Fri, 19 May 2023 16:49:03 +0000
Message-ID: <OS0PR01MB59227F39CFB11E5DF4433641867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-10-biju.das.jz@bp.renesas.com>
 <CAMuHMdUsNYhD8VQWpwPqn_AV6cw85m+vg_DMXQP+ggGOz3RF0Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUsNYhD8VQWpwPqn_AV6cw85m+vg_DMXQP+ggGOz3RF0Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB5895:EE_
x-ms-office365-filtering-correlation-id: f347131b-c3c3-4842-f83b-08db5888f42d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4rafeY6RAvjQRytHBmI/WR3D7zqbzMCMWHKmiStjN4czMvs4ZMX/LAsvxqPufTxlmOY+7k/v6Pa9rLA30Y1sRwG7QCxEGhLots8Ud9yWTzT/zoaYBtg1IGGx0X2eY+cWVV+liwq6w03nDdWFEkCU4yXy9FA0I5uSLUYreDrXS2azPkUGH7Z+rtupMEj6LZFC0j6zJBrRaajZPhTZTXFKzROjHnR12ZDrVFMFjjUDbNbfHvYrIpA/qzrSo21cwjMFrAkoqdNnE6+dik+ydRbUHBlkSX4BbeQJaZx+vqEm8ALQivOce30y0RtoXnj8DzxsjGcX/VgJjCHym6/J513aKTC3dLR9Dn1i2f4yfKu5fmAIBV3fywVaqaFPCPg9++KNzPB8W6eHcF7YsuJ41+cO0S3nJ6Np0HCYwF+MQ8mLBARv17qbPetExfIpVLHUfXwmMu4BiYLVFTq+dgY9P4+ehUufFgD9K7jtTKQQV2M6+3jasytV8GpEF54xaTdGQBRct9DyAieC5gBrUBwIGS1Suh1T1CswPQSvFVz8rTNn4yl4CkeCzyLdpzQ9Aoc5tTktg2m9jaqs/I+adbL9TRfXOJllIlPz2pmG4Ff4IjbdDhA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199021)(66899021)(4326008)(966005)(66446008)(478600001)(66946007)(64756008)(66476007)(76116006)(66556008)(6916009)(54906003)(316002)(33656002)(38070700005)(86362001)(83380400001)(26005)(6506007)(107886003)(53546011)(9686003)(186003)(7416002)(7696005)(71200400001)(5660300002)(8676002)(52536014)(55016003)(2906002)(8936002)(41300700001)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3piME9CY0c3QmFkdmp1WWtuTmF2aXU3TVVhbVF6QnFwUHRBM092WHF4cUxJ?=
 =?utf-8?B?ODZGWnd0RXhwNTc4akUyYnFFclUzWEFYQ1hMUHpSQWg1WEZlem1sRmt4TkhF?=
 =?utf-8?B?UXFNSTJvWEs1VHFSQlpaNFBUdHhTR3pxVTlOMnZ1WFVNSnE4dlhpMUJ5Nzhl?=
 =?utf-8?B?NDJabG9VZFQwSE04L1JRNUc4MzFKd1lzUWdScGNxVExhc3Q0NEw0SGxtT0x2?=
 =?utf-8?B?ckpncEN3TE9Fc1BCTjNMQUlUTVBBYTE4b3VzdllENnN0K2V6UEEvOStuVzNk?=
 =?utf-8?B?NkVNbUpGemlKQ0Y2aXBQbE1NM3YxTnFJMjJxczNqcXNubzdUSG8ySkxwV242?=
 =?utf-8?B?UkxDakNmY09VVXBUdXBBK2tkWDJoSW53bXZjNUZzb21tMSsvVmRZTXIvWWsz?=
 =?utf-8?B?ZVpQbVBLV1VBcmUvdnF5ZWRNUVcrQVJrTGFKQm5DK0ozaWtEblNIdUZzNVlz?=
 =?utf-8?B?eWN5MjhIcFhGK2xFZEN0aDBxOWpWSnJnNS9tZHRHZjV0dEFkOFZmLzdqVlo4?=
 =?utf-8?B?TzZQK1NtQ2NFY0pHQUxuVTgvSU1PN1U5YTFJV05CMk9hSjBMaWNmdFNaQ0FM?=
 =?utf-8?B?R1JaazdNcElIdWZkYTZQODd1ZU9qNDVnSll1NUE3Z2Rzbjcxa1Y5aEtMM05h?=
 =?utf-8?B?b0VkbDFhekFyS080blhZbHZlWUFlcXgzbmRRdnduTzNCYjB6NzdFd0plbjN4?=
 =?utf-8?B?V2JjT2hEYVZQUmU5QmJXOEJ5bWVlRkhZTWpNY29TcEZmU0ZaMVcxZ1dDSmtl?=
 =?utf-8?B?OUtsdVFTYkxwUEVCRXhsRkgzazZsY2VyZDlJTEwrK3NxRUlZRkhoZnlqQnVi?=
 =?utf-8?B?bmRvSGhSQ0krbkhLNmlwVHIvVWdERXJKRzJxZVZNbnE3aEltVUdDY3BtOTQz?=
 =?utf-8?B?OVFFUEd4OElMaHd4TGFTNHh6THl0MjdHUzducWZpU25VL2RlcWJEVXhUVDlO?=
 =?utf-8?B?aE9mZnloTktMK0VxY21FWk9YU1Bnc3FtRk5LVCtXZzJtdjMyQ2pSRjREMDRS?=
 =?utf-8?B?WWQ5YVBUbnBuMnhqaFRTVVdwaTVYa2JIbi9udHE1VitLeXM5OWQ5RUo3ZExQ?=
 =?utf-8?B?Q1BtMUZlNndnRzB0ZEQweWdocU5DRG9EbXhWeTQ5RG5tSm91Z05FeGliWEEr?=
 =?utf-8?B?VG96U2hrQ3RSTHVVMnB5dlZpaDNJb1NhMHZ6VktqWkJoOFZyVkx3b1lVYjAw?=
 =?utf-8?B?Tm84SVp3dnZVbHNUckNEUWRlL2RnRDAzT2p0ZkNiSWYwd0MxZXMzTjFKUTQr?=
 =?utf-8?B?T3VGMXlKblVjcjFwQnZrRHNLOVplV0RzT2J6dER3R0ZiekF4bFRwZkk3OEZs?=
 =?utf-8?B?OHRveWY4S3NGY0xvMjhFOUlaRGw5bXR3QUZUaEJmUkVUQ3JROHY0ZEpONHps?=
 =?utf-8?B?dStVbmUvSlQwYzVBRU40UmlnOEY4SVBQSXZJd1RxRXk2K0doTkZvc3lSZVF0?=
 =?utf-8?B?R1Bvclg3V0JyM292OXAvMFFqbkRKRTBkL21MdTJXcGJMRnJqRGEvS09lZHdC?=
 =?utf-8?B?RElQelQ4MXNiaWFMeldGdWFoMXBzN0E4d2ZYVVlrVy9rSVFUNjZTeG5QL0hw?=
 =?utf-8?B?bHdSZTRHejZ0Risxa0xXSW8xL0Q4U2dXL24yNndScjh5aW4ya3ZtYjJpamxk?=
 =?utf-8?B?TTU0aVBDcHRxeENHaGMvaVZEZ0hoZ1FZK3EzUlJaRjdoSXBjMTdTUGc1Q0pV?=
 =?utf-8?B?dW1TZ0pFZFl5a1RtdmZCb0daTTJjMzJsQjhoWlFZRTN2RmlBVTJsQTFCcURD?=
 =?utf-8?B?Vkl2dVBwaTczc210M0UyM05jWmtJekh1dGRXUDBqZFltaGJ1TlJTa1B1VlAx?=
 =?utf-8?B?eGo3czJvWEI4eGRXUzNrb05EL2kvcVNqYmxuUmVOY2pHeFZpZ1pzcUk4dU5u?=
 =?utf-8?B?cU9mcTdjVzZoSVJTZlV0VWhGR3d6OERzY1JUSUE0TnUwNDdiNzVLeSt6UWRT?=
 =?utf-8?B?RnJacE9XRjJ0d2svell5QnhaNk0yOFJFenViQ2MyY0grR3p3cEJuaTN3Uk5l?=
 =?utf-8?B?Lzd1TVFxVE51S21LWC9sZDNOUlJRcGplNjRnTkNsTUdkVmNFZ1o3cWtmb015?=
 =?utf-8?B?T1dyZ3RnWGNVamZLZGowQysyU0FtOUZQOWNIKzJUMys0Z2pQY1V1ay84TGJ0?=
 =?utf-8?Q?6idC7mN+q1KEZAl99Deonc/A5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f347131b-c3c3-4842-f83b-08db5888f42d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 16:49:03.8267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v4y38cz8w32xZdMl3cnlJ8yr/opv56EIE0CTHjdeBvETgmf0fyYaJ/y7A+mjdXUh9ehcgIAdUV11MMGg/rzG3a1cHMbc5OQm5Z3lYwPQo/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5895
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgMDkvMTFdIHJlZ3VsYXRvcjogZHQtYmluZGluZ3M6IEFkZCBSZW5lc2FzDQo+IFJB
QTIxNTMwMCBQTUlDIGJpbmRpbmdzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBNYXkg
MTgsIDIwMjMgYXQgMTozN+KAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gd3JvdGU6DQo+ID4gRG9jdW1lbnQgUmVuZXNhcyBSQUEyMTUzMDAgUE1JQyBiaW5kaW5n
cy4NCj4gPg0KPiA+IFRoZSBSQUEyMTUzMDAgaXMgYSBoaWdoIFBlcmZvcm1hbmNlIDktQ2hhbm5l
bCBQTUlDIHN1cHBvcnRpbmcgRERSDQo+ID4gTWVtb3J5LCB3aXRoIEJ1aWx0LUluIENoYXJnZXIg
YW5kIFJUQy4NCj4gPg0KPiA+IEl0IHN1cHBvcnRzIEREUjMsIEREUjNMLCBERFI0LCBhbmQgTFBE
RFI0IG1lbW9yeSBwb3dlciByZXF1aXJlbWVudHMuDQo+ID4gVGhlIGludGVybmFsbHkgY29tcGVu
c2F0ZWQgcmVndWxhdG9ycywgYnVpbHQtaW4gUmVhbC1UaW1lIENsb2NrIChSVEMpLA0KPiA+IDMy
a0h6IGNyeXN0YWwgb3NjaWxsYXRvciwgYW5kIGNvaW4gY2VsbCBiYXR0ZXJ5IGNoYXJnZXIgcHJv
dmlkZSBhDQo+ID4gaGlnaGx5IGludGVncmF0ZWQsIHNtYWxsIGZvb3RwcmludCBwb3dlciBzb2x1
dGlvbiBpZGVhbCBmb3INCj4gPiBTeXN0ZW0tT24tTW9kdWxlIChTT00pIGFwcGxpY2F0aW9ucy4g
QSBzcHJlYWQgc3BlY3RydW0gZmVhdHVyZQ0KPiA+IHByb3ZpZGVzIGFuIGVhc2Utb2YtdXNlIHNv
bHV0aW9uIGZvciBub2lzZS1zZW5zaXRpdmUgYXVkaW8gb3IgUkYNCj4gPiBhcHBsaWNhdGlvbnMu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gLS0tDQo+ID4gdjMtPnY0Og0KPiA+ICAqIE1vdmVkIGJpbmRpbmdzIGZyb20g
bWZkLT5yZWd1bGF0b3IuDQo+ID4gICogRHJvcHBlZCBtaW5JdGVtcyBmcm9tIHJlZy4NCj4gPiAg
KiBEcm9wcGVkIHJlbmVzYXMscnRjLWVuYWJsZWQgcHJvcGVydHkgYW5kIGluc3RlYWQgdXNlZCBj
bG9jay1uYW1lcw0KPiBwcm9wZXJ0eQ0KPiA+ICAgIHRvIGZpbmQgUlRDIGlzIGVuYWJsZWQgb3Ig
bm90Lg0KPiA+ICAqIEFkZGVkIHJlZy1uYW1lcyBpbiByZXF1aXJlZCBwcm9wZXJ0eS4NCj4gPiAg
KiBVcGRhdGVkIHRoZSBleGFtcGxlLg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiAN
Cj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3JlZ3VsYXRvci9yZW5lc2FzLHJhYTIxNTMwMC55YQ0KPiA+ICsrKyBtbA0KPiA+IEBA
IC0wLDAgKzEsODQgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5IE9SIEJTRC0yLUNsYXVzZSAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDoNCj4gPiAr
dGl0bGU6IFJlbmVzYXMgUkFBMjE1MzAwIFBvd2VyIE1hbmFnZW1lbnQgSW50ZWdyYXRlZCBDaXJj
dWl0IChQTUlDKQ0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0K
PiA+ICsgIFRoZSBSQUEyMTUzMDAgaXMgYSBoaWdoLXBlcmZvcm1hbmNlLCBsb3ctY29zdCA5LWNo
YW5uZWwgUE1JQw0KPiA+ICtkZXNpZ25lZCBmb3INCj4gPiArICAzMi1iaXQgYW5kIDY0LWJpdCBN
Q1UgYW5kIE1QVSBhcHBsaWNhdGlvbnMuIEl0IHN1cHBvcnRzIEREUjMsDQo+ID4gK0REUjNMLCBE
RFI0LA0KPiA+ICsgIGFuZCBMUEREUjQgbWVtb3J5IHBvd2VyIHJlcXVpcmVtZW50cy4gVGhlIGlu
dGVybmFsbHkgY29tcGVuc2F0ZWQNCj4gPiArcmVndWxhdG9ycywNCj4gPiArICBidWlsdC1pbiBS
ZWFsLVRpbWUgQ2xvY2sgKFJUQyksIDMya0h6IGNyeXN0YWwgb3NjaWxsYXRvciwgYW5kIGNvaW4N
Cj4gPiArY2VsbA0KPiA+ICsgIGJhdHRlcnkgY2hhcmdlciBwcm92aWRlIGEgaGlnaGx5IGludGVn
cmF0ZWQsIHNtYWxsIGZvb3RwcmludCBwb3dlcg0KPiA+ICtzb2x1dGlvbg0KPiA+ICsgIGlkZWFs
IGZvciBTeXN0ZW0tT24tTW9kdWxlIChTT00pIGFwcGxpY2F0aW9ucy4gQSBzcHJlYWQgc3BlY3Ry
dW0NCj4gPiArZmVhdHVyZQ0KPiA+ICsgIHByb3ZpZGVzIGFuIGVhc2Utb2YtdXNlIHNvbHV0aW9u
IGZvciBub2lzZS1zZW5zaXRpdmUgYXVkaW8gb3IgUkYNCj4gYXBwbGljYXRpb25zLg0KPiA+ICsN
Cj4gPiArICBUaGlzIGRldmljZSBleHBvc2VzIHR3byBkZXZpY2VzIHZpYSBJMkMuIE9uZSBmb3Ig
dGhlIGludGVncmF0ZWQgUlRDDQo+ID4gKyBJUCwgYW5kICBvbmUgZm9yIGV2ZXJ5dGhpbmcgZWxz
ZS4NCj4gPiArDQo+ID4gKyAgTGluayB0byBkYXRhc2hlZXQ6DQo+ID4gKw0KPiA+ICsgaHR0cHM6
Ly93d3cucmVuZXNhcy5jb20vaW4vZW4vcHJvZHVjdHMvcG93ZXItcG93ZXItbWFuYWdlbWVudC9t
dWx0aS0NCj4gPiArIGNoYW5uZWwtcG93ZXItbWFuYWdlbWVudC1pY3MtcG1pY3Mvc3Nkc29jLXBv
d2VyLW1hbmFnZW1lbnQtaWNzLXBtaWMtDQo+ID4gKyBhbmQtcG11cy9yYWEyMTUzMDAtaGlnaC1w
ZXJmb3JtYW5jZS05LWNoYW5uZWwtcG1pYy1zdXBwb3J0aW5nLWRkci1tZQ0KPiA+ICsgbW9yeS1i
dWlsdC1jaGFyZ2VyLWFuZC1ydGMNCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29t
cGF0aWJsZToNCj4gPiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gcmVuZXNhcyxyYWEyMTUzMDAN
Cj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgbWF4SXRlbXM6IDINCj4gPiArDQo+ID4gKyAg
cmVnLW5hbWVzOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gY29uc3Q6IG1haW4NCj4g
PiArICAgICAgLSBjb25zdDogcnRjDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAg
ICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBjbG9ja3M6DQo+ID4gKyAgICBtYXhJdGVtczog
MQ0KPiANCj4gUGVyaGFwcyBhZGQgYSBkZXNjcmlwdGlvbiB0byBtYWtlIGl0IGNsZWFyIHRoYXQg
bm90IHByb3ZpZGluZyBjbG9ja3MgaXMNCj4gc3VwcG9ydGVkLCBhbmQgbWVhbnMgdGhlIFJUQyBp
cyBkaXNhYmxlZD8NCg0KQWdyZWVkLg0KDQo+IA0KPiA+ICsNCj4gPiArICBjbG9jay1uYW1lczoN
Cj4gPiArICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgIFVzZSB4aW4sIGlmIGNvbm5lY3Rl
ZCB0byBhbiBleHRlcm5hbCBjcnlzdGFsLg0KPiA+ICsgICAgICBVc2UgY2xraW4sIGlmIGNvbm5l
Y3RlZCB0byBhbiBleHRlcm5hbCBjbG9jayBzaWduYWwuDQo+ID4gKyAgICBvbmVPZjoNCj4gPiAr
ICAgICAgLSBpdGVtczoNCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHhpbg0KPiA+ICsgICAgICAt
IGl0ZW1zOg0KPiA+ICsgICAgICAgICAgLSBjb25zdDogY2xraW4NCj4gDQo+IFBsZWFzZSByZXBs
YWNlIG9uZU9mK2l0ZW1zIGJ5IGVudW0uDQoNCk9LLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+
ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0K
PiA+ICsgIC0gcmVnLW5hbWVzDQo=
