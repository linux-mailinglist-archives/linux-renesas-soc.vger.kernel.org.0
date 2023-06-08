Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A321272791B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jun 2023 09:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232710AbjFHHqj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Jun 2023 03:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232462AbjFHHqd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Jun 2023 03:46:33 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6779273C;
        Thu,  8 Jun 2023 00:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDB+gwiLwwIDx28PRTertOXXEWYYRZlD8mgo6uH+v6qujdYviPU8FhqRzogMZJtYkj9x+4Q8FHUsD496sd6k6KsdobtNBQ/3+BMV8t8ue2MUJCZI12HNCYsTTBjWNRNAsy2jjJRbSZWLG9CTpiFSm6K0kcrG2nYBkUb/zZNIbnngS3Phlh4eMN83eTf5BvhnGgK+Vu+xn8e6d7JB0rYdxiJjQYTrj6uXgwnYC1wIbJnavhBcDSyslUw/7o3gtfBoVW/ma7CXGZS18TY1iqgFCTjdiqXPRPeo5FFZbCGFpt1zQ9oMErDxbGMIgMKufpL+9GNCB5rRYjdzxIVjSoZMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIVlhmcsdeOnmuOiFF0ximI4esHrKhwMXJX0ynPwpWY=;
 b=bGuaAlpJKRwBrEMa033AH9yXQjgIApFwDQGJ+oGvsk0JCYLyPL/sDITQBrfGPDCYEMpwOlTeeGXijG03po1hjwNxShOXaoBwWbCSeHEeaD95+XDpEAp4CV8t3+BdVKzlySDCo5kat5cDwbbvQOryXIBoF2l4q4KN7KGlxGlysv8QvhOhBY73Av/6Ida2D1I5jBB9SN15fKku+j0+k56ux8osEvLxdefcPxA2BTv5Hcoc146zPEcIQVfIDfMCT7Xfyxi9BLIhK7n0lgziyMdymVQdfce3c8XaSVjs3z9MaI9SXfrjHXPEWrVDabmLw0OJduca2Rk6+M9O07KPAw1Bhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIVlhmcsdeOnmuOiFF0ximI4esHrKhwMXJX0ynPwpWY=;
 b=T6OMAJdYfHzSQrlBAaLGgCLiKz+tVpro3iQkpjrzLA1k3DIKgL/SkK7VU6pPTiRngCu+bN7EXlk9Nd9m/uHFhyNuzThB8S6p4DSKF5A3LjKmgQ7nTxZhq2kN8FG7w50SgfYJpa9VfQboOCF+EHWi8ZkXFN1omuEvozCEEINxQHo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11753.jpnprd01.prod.outlook.com (2603:1096:400:3e3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 07:46:24 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.039; Thu, 8 Jun 2023
 07:46:24 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a
 counter using DT overlay
Thread-Topic: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a
 counter using DT overlay
Thread-Index: AQHZcQtLK6/JZK1zYUeFXuixSTqo8q+AytqAgAAM2xA=
Date:   Thu, 8 Jun 2023 07:46:23 +0000
Message-ID: <OS0PR01MB5922C35BD8A7A9A65BFFDF548650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230417090159.191346-1-biju.das.jz@bp.renesas.com>
 <20230417090159.191346-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVNaBk8XV8aCpsiE1SruHNgq47e0YHrF=_H4+SbG5DVmw@mail.gmail.com>
In-Reply-To: <CAMuHMdVNaBk8XV8aCpsiE1SruHNgq47e0YHrF=_H4+SbG5DVmw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11753:EE_
x-ms-office365-filtering-correlation-id: b26cef4b-5c1b-4368-6ac8-08db67f4754d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6JRREp9mizpXj4rkbfrvPYu24R+65PfXUWtB0vJMO+9vAigs/MletX+G0hZ/noqYYNjjHnNsUK0zQnUDeTFZak9hiFXC5Ny6xWntg8ekB1UvaiFGQXNBrfMm57+dlNh8cKE2l1H+L+pCnGsGyDozKRTDZBO9G7DL6aQHo++jnmtMgZ7l+3n79a8anSEgcLintd3k1DbujUstJ+P0r5P1vyhEl/KyE9WqfTCtWbERQdHpvkzfiU+92zHgsUrGbDTsu6vOLfeUVBnIkdqMULZUCM5C6Uhe8nzXdG58aJRqMDQ5Tgx/BQ00UQWeyIcbQOy8AojheiO5yxJ5h53OrKt4TvbDEnvIoJjNvD1S2mEmMHNWcILmt+sJvX1z+0KkvyG9uCVJGwaBmJVEn1fLS1+sXrps3aAKT4w5OjTrWjNihTp4TF0RnJ20jE1RRLMYUGo7OKCWs7zNf4pOlwnE8SoDyVpctaIfHWkXQ4fBXSDCYLlUFjTlmfQPHiOYWVNQHokO1Vi6Dew7i23l2c3hyK9i13/wXd+4uwK1jchJOHuEM17keHyUOk88oKK8mun/ooQ+MtBkbFpqeP/gUh6QzQVmR7CMxPMjZd6fQB8OOri7lrTPJSJI9x8qc2xBL5Vtvv9aQGQMaQ9DfFQHTivUvFczkA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199021)(53546011)(26005)(9686003)(66446008)(6506007)(316002)(83380400001)(122000001)(76116006)(66476007)(4326008)(66556008)(6916009)(66946007)(64756008)(7696005)(107886003)(186003)(478600001)(71200400001)(33656002)(38070700005)(54906003)(41300700001)(2906002)(8676002)(5660300002)(55016003)(8936002)(86362001)(52536014)(38100700002)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djRkQWIzV0hKaytlQTRRNnI5NXNWcDd4V1pmUFJ0dElHMjYzRFNDMk13Rktn?=
 =?utf-8?B?YkxRTEhNdnA1azc0RHhGR0RCNitiODNzTVluRG1NVTVLbUdFMVlMMHB4TnN5?=
 =?utf-8?B?U045K1dIN1JNZStQMjhTUFZ0T0gyOC9RVWFWSUhDYklHeWJZQ1YrM0RuSG8v?=
 =?utf-8?B?L3JrUk0rMElVWXArS3Y0aXBTRElZMlRKNXRZSHVMSjh3VlZyQmpnMStRUm8z?=
 =?utf-8?B?MS9BN1FYTmxnUzRNVTNYWXJEUXF5RCswQnNSRzI3SWcySUtCbWdIckIyK2dP?=
 =?utf-8?B?aG5xY0VFYkphaVo2VXczTGxFWUZCaXpoU1ZidStlZE4raDViOGRDVi84cCtX?=
 =?utf-8?B?bjU4Ym9HYmxQMnRub2t0ZUlRRStIYzNaNlg2U0xvTFZ4eGxvcEt6YlBKdFBK?=
 =?utf-8?B?T0cyaS9NeThCSHJJaFV3MzNxSUZGWlJGdHdZR01tcDFva0V1VG95WjV5QUl6?=
 =?utf-8?B?dk9IL0p0TnpleG9jdmlWWTVONE93QlZtSWlpbUVBNlNKSlR1S0NMV0E2anNx?=
 =?utf-8?B?WGoyeXNjd3lNTlE2L3lKeDc1UlNPNjArVXAyQkw0enFDcHFTNTAzamxKSHpP?=
 =?utf-8?B?VlZMREhzU1NwMjBRRGRsWEw5SzNFS251TVNwb3paV0FYbVhERUlIQVgwQU5W?=
 =?utf-8?B?Y1FCUGJ5bldLVzJQdjJDaVROaGJlQWI3eWQzYkJSWTA5Ri9ub1NvU3lyTXA3?=
 =?utf-8?B?a0M5ekp2MUp1VXV6S0o0MFQxb1BvMGlPWE40bTNPTmRWYm1USnZNRXE2Smx2?=
 =?utf-8?B?aUdlYUMvMm9zRjdjM2NCL2dETzZGQ290TXVZd05nUHRIRG1LYW1HamwvQW01?=
 =?utf-8?B?cFl2ZnBwQ1J2eUxTMlBqV0xLeDFRVVBZbXZDTWR5WmJ2Ky84M1B1L2FjcmFK?=
 =?utf-8?B?OUxmTzdHY0k1aDZkdmQ1blpyVzV5cGNuQjFpT3NDK1dzYjY5ejN6WkxNREhl?=
 =?utf-8?B?d0k4N3NWcFNMaS8xVWJEOUNLbXVBV0xNZysxZS9HYXpiTFNGSFhDRTlzTTlC?=
 =?utf-8?B?TlZPUjVqYWpNcFpNaVFZSVF4a0oyclRyYk03VEw0RUhtbW5relcrSWc1eDZ0?=
 =?utf-8?B?Ui9KbEJSQmdWSHdmR2ZPT1lYSjNTN1FRMlBTUDdiTGhxRXQza2NMbUtNRitK?=
 =?utf-8?B?bDM2SXp2UTFteWQzc3hpbVF2dk5LelVhald1bjUrVXFjcFZYTzRvYXI1ay91?=
 =?utf-8?B?VTB1bTBpNlJGaWVXa2dRRXJnaXk5Q3NuU1VWUHZiUjRtcDd6M082L2hBdDRW?=
 =?utf-8?B?VGI0blM4SmV1aXc5SHhuSkdIWndtNzdQNEhHUkFwSWJTS001WUwxM1k2bDJL?=
 =?utf-8?B?YXhCaGR5dTEwUENzOTZla0FLTElPREhwUW5VY3hWY3NzOVlHc2VhR1FSeVkx?=
 =?utf-8?B?eXNud0JNajNyMDg0V3dvbFpEZW1GaEVqNWVRYWE3UUhIeUsyS0dVUWVJMkRo?=
 =?utf-8?B?L2Y4ajlXTDZLS0FtVDJRZXBiM2RSOXM0ZTlDMm5KYlFad01Hb1VObmJqQWxO?=
 =?utf-8?B?U2lYc2tVN3dtYkZBMWgxdTdVQmRTOVdVaTZwa0NKTHVHUVI2dFNJZWV2d0Ex?=
 =?utf-8?B?MXNTMDZTQ1VOOTJ3Y3VBejB2ZGdheEliMHQyMWJSeGtrVlF6alpBTzQyNkNO?=
 =?utf-8?B?NkpUKzBqM0dhTHgzLzlBWWxqaEE1R2VjRXBqSnRxbmh4cmk1V1ByUitraG9l?=
 =?utf-8?B?SlJBSGpxSDZETm9FY1JvdWtPQ3B5MG5xaUpIRFdyN2ZXN1BIcTBCMndLd0RV?=
 =?utf-8?B?NEJnbkp0SWdHcDJ1NlZsLzlJalVYZVNRdFBiRDg4cEc1YXVZZlozUDhYOW5y?=
 =?utf-8?B?b1ZML1FXczVvdGZNUllZTHlYZ3BscWJ5VDhndExUZU01c1JqdDZRV1J0TDAw?=
 =?utf-8?B?Wm53cU1JMnNqTkNWTUI2N1hzUjZuQ2dtL0dHMktyLzlOc3hValdacUh5bjZ3?=
 =?utf-8?B?WUthTTlrYzlJQUlEY0pWblpmb1l6UEJOZVJuYTZJaU5IY3Y2K0VuMkJWSmF0?=
 =?utf-8?B?cXQ2YStFYkNRVExRRkFNY0ZsOFgvbkowMFY5OXIxMUFlczk0NGJQVTV1VjVI?=
 =?utf-8?B?U3JjV21BZmJQQ1JzbzJJa1JrQ3RWQ1l3L2R4cC9YM05QTzVZQ1BDUHVYY1F5?=
 =?utf-8?Q?sW2niXDtVxLLdU/n9jR7LaLeQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b26cef4b-5c1b-4368-6ac8-08db67f4754d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 07:46:24.0030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z6s6a7pJDA26ErGGmJTxKLDtjV7cf5ddpMNidNTIuMor6hbnWaoDXaXO6LKMHCpFeUKmxkbnIJ7Xx6e/6cy1ZomBMzwZq+W0+xDmamqFuwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11753
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzNdIGFybTY0OiBkdHM6IHJlbmVz
YXM6IHJ6ZzJsLXNtYXJjOiBFbmFibGUgTVRVM2ENCj4gY291bnRlciB1c2luZyBEVCBvdmVybGF5
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgMTE6MDLigK9B
TSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEVu
YWJsZSBtdHUzIG5vZGUgdXNpbmcgZHQgb3ZlcmxheSBhbmQgZGlzYWJsZSBzY2lmMiBub2RlIGFu
ZCBkZWxldGUNCj4gPiB7c2QxX211eCxzZDFfbXV4X3Voc30gbm9kZXMgYXMgdGhlIHBpbnMgYXJl
IHNoYXJlZCB3aXRoIG10dTMgZXh0ZXJuYWwNCj4gPiBjbG9jayBpbnB1dCBwaW5zIGFuZCBaIHBo
YXNlIHNpZ25hbChNVElPQzFBKS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL01ha2VmaWxlICAgICAgICAgIHwgIDIgKw0KPiA+ICAuLi4vYm9vdC9kdHMv
cmVuZXNhcy9yemcybC1zbWFyYy1wbW9kLmR0c28gICAgfCA0MyArKysrKysrKysrKysrKysrKysr
DQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJsLXNtYXJjLXBtb2QuZHRz
bw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9NYWtl
ZmlsZQ0KPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL01ha2VmaWxlDQo+ID4gaW5k
ZXggZjEzMDE2NTU3N2E4Li41NzcyN2JjZDEzMzQgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL01ha2VmaWxlDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL01ha2VmaWxlDQo+ID4gQEAgLTgxLDggKzgxLDEwIEBAIGR0Yi0kKENPTkZJR19B
UkNIX1I5QTA3RzA0MykgKz0NCj4gPiByOWEwN2cwNDMtc21hcmMtcG1vZC5kdGJvDQo+ID4gIGR0
Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA0NCkgKz0gcjlhMDdnMDQ0YzItc21hcmMuZHRiDQo+ID4g
IGR0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA0NCkgKz0gcjlhMDdnMDQ0bDItc21hcmMuZHRiDQo+
ID4gIGR0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA0NCkgKz0gcjlhMDdnMDQ0bDItc21hcmMtY3J1
LWNzaS1vdjU2NDUuZHRibw0KPiA+ICtkdGItJChDT05GSUdfQVJDSF9SOUEwN0cwNDQpICs9IHJ6
ZzJsLXNtYXJjLXBtb2QuZHRibw0KPiA+DQo+ID4gIGR0Yi0kKENPTkZJR19BUkNIX1I5QTA3RzA1
NCkgKz0gcjlhMDdnMDU0bDItc21hcmMuZHRiDQo+ID4gK2R0Yi0kKENPTkZJR19BUkNIX1I5QTA3
RzA1NCkgKz0gcnpnMmwtc21hcmMtcG1vZC5kdGJvDQo+ID4NCj4gPiAgZHRiLSQoQ09ORklHX0FS
Q0hfUjlBMDlHMDExKSArPSByOWEwOWcwMTEtdjJtZXZrMi5kdGINCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc21hcmMtcG1vZC5kdHNvDQo+
ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc21hcmMtcG1vZC5kdHNvDQo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmE1MDJmYWY2
ZTFhZA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcnpnMmwtc21hcmMtcG1vZC5kdHNvDQo+ID4gQEAgLTAsMCArMSw0MyBAQA0KPiA+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICsvKg0KPiA+ICsgKiBEZXZp
Y2UgVHJlZSBTb3VyY2UgZm9yIHRoZSBSWi97RzJMLFYyTH0gU01BUkMgRVZLIFBNT0QgcGFydHMN
Cj4gPiArICoNCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIzIFJlbmVzYXMgRWxlY3Ryb25pY3Mg
Q29ycC4NCj4gPiArICovDQo+ID4gKw0KPiA+ICsvZHRzLXYxLzsNCj4gPiArL3BsdWdpbi87DQo+
ID4gKw0KPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9yemcybC1waW5jdHJsLmg+
DQo+ID4gKw0KPiA+ICsmbXR1MyB7DQo+ID4gKyAgICAgICBwaW5jdHJsLTAgPSA8Jm10dTNfcGlu
cz47DQo+ID4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiA+ICsNCj4gPiAr
ICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZwaW5jdHJsIHsN
Cj4gPiArICAgICAgIG10dTNfcGluczogbXR1MyB7DQo+ID4gKyAgICAgICAgICAgICAgIG10dTMt
enBoYXNlLWNsayB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcGlubXV4ID0gPFJaRzJM
X1BPUlRfUElOTVVYKDE5LCAwLCAzKT47IC8qDQo+IE1USU9DMUEgKi8NCj4gPiArICAgICAgICAg
ICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIG10dTMtZXh0LWNsay1pbnB1dC1w
aW4gew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBpbm11eCA9IDxSWkcyTF9QT1JUX1BJ
Tk1VWCg0OCwgMCwgNCk+LCAvKg0KPiBNVENMS0EgKi8NCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8UlpHMkxfUE9SVF9QSU5NVVgoNDgsIDEsIDQpPjsgLyoNCj4gTVRDTEtC
ICovDQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICB9Ow0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiArJnNjaWYyIHsNCj4gPiArICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4g
K307DQo+ID4gKw0KPiA+ICsmc2RoaTFfcGlucyB7DQo+ID4gKyAgICAgICAvZGVsZXRlLW5vZGUv
IHNkMV9tdXg7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsmc2RoaTFfcGluc191aHMgew0KPiA+ICsg
ICAgICAgL2RlbGV0ZS1ub2RlLyBzZDFfbXV4X3VoczsNCj4gPiArfTsNCj4gDQo+IEknbSBhZnJh
aWQgZGVsZXRpbmcgbm9kZXMgaW4gdGhlIGJhc2UgRFQgZnJvbSBhbiBvdmVybGF5IGRvZXMgbm90
IHdvcmsuLi4NCg0KSXMgaXQgb2ssIGlmIEkgdXNlIE1BQ1JPIGluc3RlYWQgb2Ygb3ZlcmxheSBh
bmQgTUFDUk8gaXMgZGlzYWJsZWQgZm9yIE1UVTNhIGJ5IGRlZmF1bHQ/DQo1LjEwIGNpcCBrZXJu
ZWwgZG9lc24ndCBzdXBwb3J0IG92ZXJsYXkuIEhlbmNlIHRoZSBxdWVzdGlvbi4NCg0KQ2hlZXJz
LA0KQmlqdQ0K
