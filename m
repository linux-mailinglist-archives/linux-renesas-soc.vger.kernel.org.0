Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A81DC4EF758
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 18:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238740AbiDAP4e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 11:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351708AbiDAPfb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 11:35:31 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A5124954;
        Fri,  1 Apr 2022 08:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+EWduCwLhpL/OuTZpnUXAGuJklCl+XorSgqgwjBDzAio6KKGIipTterFVRUvzyxUJ32OodDcZC3xnilRdocUEI9ej/sWXNGQfqUKtiMa0FzU0FuRIaF+UqaWHJ8L4ief9z+I4XdC9k/HyCi4P/BW+80z28OKqN4L3MEdmnOeiPf5gxtcuInI2dYQHin1JcOyX0cpjrKrVe2AGwdjtD45g+a9kQYtm0DsdpSqWsXjij5cCulANI0sbKEHSC7ZuAV9YWpWfz9rR0SgsqyESp41dp2sZeGCYn6waVr7r6jwZYGkgqgqYsohOU6Ib9EZ3489AYA4spabbJB9Ah001oODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwM0ca5OW2Qy4jq7bBnQqCYCK61MxeQdBrJcSUYd7Zo=;
 b=GwkvRcPb2wUc6N4OgnkS1+B5CfyLt2I6DqdzNwG4Gq/ChpTDtFQ3L0u3zkHGnCmzlx4IySgDDujk3JMStFpn4sy7SheY5NxsGmup8cco0WydHHUxfGJZxa+L1jlHJqd4c9/VPX1NdGKXssvqIT25BMXdKDTLdg7vRmbJXas9QG8Y8plo95vxDbf4g6avFtfYBXP+PnB7Fsn+bfWpO00qg/7/k464y5XzZUxG6XBvzBrmuhFUKKqBrIkXcxH2LZQdwWJ8BCKcd1BqZVDWiByJxZp6nIcgCGTTvH7gSwtI4o5lMLS1mPXUjFbcSAbgkSLLtR2rOG81OEp/JLIRzyH8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwM0ca5OW2Qy4jq7bBnQqCYCK61MxeQdBrJcSUYd7Zo=;
 b=IIxwvUBcUEo/sV/dQzhHa2jSLAuVbObIPoVmpf/TH2yqLWbpcwnO8oIaQTbBVw3V1pNgx4gN7TzB32XvDcSjsTrfI9S3tNqTcVoqUwn5aWLbnS84BnWTPpcYso8Inm6JMVakKIrdjbkad+BGS4bfseZFz8yakvRyB6qbp5IDiDU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB6392.jpnprd01.prod.outlook.com (2603:1096:604:102::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23; Fri, 1 Apr
 2022 15:05:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::7ccd:4eb0:e2ae:fca8%3]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 15:05:55 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 7/7] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 Ethernet on SMARC platform
Thread-Topic: [PATCH 7/7] arm64: dts: renesas: rzg2ul-smarc-som: Enable
 Ethernet on SMARC platform
Thread-Index: AQHYOIWutAhJxRtakECApsHlJEY54azbD4SAgAAzK2A=
Date:   Fri, 1 Apr 2022 15:05:54 +0000
Message-ID: <OS0PR01MB592283D334E7DCD2597D711786E09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220315155919.23451-1-biju.das.jz@bp.renesas.com>
 <20220315155919.23451-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdW15oNDrDk0CGvf9ABX83HB6rs3tXz+33a80K-dmJ0fuA@mail.gmail.com>
In-Reply-To: <CAMuHMdW15oNDrDk0CGvf9ABX83HB6rs3tXz+33a80K-dmJ0fuA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb4e4051-58e5-4d65-6d52-08da13f11ed5
x-ms-traffictypediagnostic: OS3PR01MB6392:EE_
x-microsoft-antispam-prvs: <OS3PR01MB639245E984E27318122C971986E09@OS3PR01MB6392.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PwowtMom+bHDmVO/cCtxTaUE7fVxOt/nEAYIWVkGL2062HxzlncSGiIpqZxBFQmS5xsRD+W7EkU2cXLRrWe63Rfog0qeHAXd2zD7wAV4AlV9zeL9LLza8lmUb1lcAnEG66iCKOuzflZmquMakE7JbbJddtAELUHOg7W4FTgJUhVXN8+1jpZbBrG8pO1UGpyXyu2XnS7tFJNB3DFP4RH/91kABY1ifQA/nIr1IYWruZzBvrY+uXo6QioLmui+pbwifcV5Xqjyx0c5MqJQDBz86BuIT3lzuhz4i/4t2+S20W9tL+kjD2JhcXKLjuqrQ0e+Ux7kF4cldddgw5PZdBbJMZNEacVty3T1am87veo/QLVLBDfaYQWGsiriGtghxQKsc4CSkyI8FwCRM8p5OgvffTr2l85wPndsRguHMXO+dIWFvgXDnT8DIF1j1p1chEYm/BXdCyd0IEBQIZlhZzJExa5pA2XlHJZBIs8gxuB3T9EZ8KekhxT9Vg7vwKatjZSEoTRkk/AMTfbRNK0F/+dkP2Uq8PK9egEZHl83U6LDz8BRwTDITr0V1u+B6Hte7EEcMpJETxGs4c2GDOgyhYnZteUg1laeszjE1QN4ocq6ULiZkODTTAhzjqdehUBdO7A/6imtI6TpqnSiLFRlx9YwrM00/Flkgy4m/dRWwmfCGIDflz3ZCLj3PU7CHPPVD2TALQVsAQFiPuh8cznRDp8Pjg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(66446008)(66556008)(66476007)(8676002)(76116006)(2906002)(38100700002)(4326008)(66946007)(316002)(5660300002)(6916009)(38070700005)(71200400001)(33656002)(8936002)(52536014)(26005)(122000001)(54906003)(55016003)(186003)(9686003)(7696005)(107886003)(53546011)(86362001)(508600001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M216dTJ0VXBQWGQyOXBtSzdQckkxc2RLS2trMXZFbWVlak9vdlNYL2tSN3VI?=
 =?utf-8?B?NWRjbDhuM0NPYjhRMVFEeEw2UFVSYVR6dzdVNXpCTWl1eExWZTJGV0pGSzh0?=
 =?utf-8?B?QjNiVzl6Y1F0NTRoVHg2aU5hbnl2L0hWVjBRNXFhbFc5cVBJVzFNeWd6U25N?=
 =?utf-8?B?UUF5dmV2bXRWaG9Ia1hXWHF2SFgvREpuM0JGK255ZVUyYVdaUGdDYi92OTcr?=
 =?utf-8?B?RE5oY2hkZ3pzc2NTQnRubUFHNDRGRzJIVnJUbDU3SitycGtkMFlaU1dXSFRj?=
 =?utf-8?B?RzBIcWxrb0lRR3RDMkhoTUhtdG1obkZnTmV6cm9Hakwwd0RNY1NHTEtEU3gz?=
 =?utf-8?B?QzlBSFBBd3hlTGtWTWt5VXNJQVRIWkNGejBSeExkWUR0WDh2T3FRSHlFOU52?=
 =?utf-8?B?S2NkL29xa2xpU3ZGNGttUk90alpyRWtaK2VTY20xM1FHbGpFMCtSclI1dVVz?=
 =?utf-8?B?cWVxUFR3ZmFQTTdLdHFlQmV6N0k5SnVVWGFPMGRxb3hGazUyeTh2QnpXdXp3?=
 =?utf-8?B?TXhpSEZIOWV3YmpzSkNyMTNuUEUzRVFVdUw4N3k5c3BoY2w1OU5CV3VhbE9x?=
 =?utf-8?B?c2NFZHJ0L2lDY2xMa2g0VTRnYmtjTkVNOWlPS2JWcnhIWFVGT254RUpxcGJ4?=
 =?utf-8?B?M2tqZlJFOXJTcUtySmw2aDVXOU5xLzAybHpKWUVSR3QrRm9pS0t6Y2VpWDdy?=
 =?utf-8?B?eDZxWUFyTkdzeFNQL2NsaGtUdlJNZU4zM0pLcjZISFcwMnY1SmU4SHc0VDM1?=
 =?utf-8?B?ckxGUm5qMmtqMllHcmg0Q2JDNFpwTVU2MGN3UlFONVBibFkxRnREdjdnTlFr?=
 =?utf-8?B?amJEMG1aN0pSWUNCV3Zsbzg2V000aEFNWVFVUzZFcUxzU3hxTnVRaWQ0UTFT?=
 =?utf-8?B?MFhCRVRMTVBBL0trRTNxR0NGTmlXK2t6YU5scC9ZQXVGb0JpVlhCajJxRi9P?=
 =?utf-8?B?TS9CeXlKWCtMajdwT0s4YjVhYmNxaDJJN2swTDMzM01EcmsvaE1qZDkzakd2?=
 =?utf-8?B?UDNyeHU0SUROMnhXMzVkYjl3SUJsVFVDVWYrYWNaSDdOOHYyR1NzV3o4QU41?=
 =?utf-8?B?dmtTZ1pDN2tpMjlEVmU1N2dwbEQ5N2VqV1BvakZpTHZLZnAxZHVSVmwyQi9K?=
 =?utf-8?B?L0Y1ODdUcjFIbmFoblpINis1NkdtS1hFeVVwVEdrbUNraU4wQkt4dFZBbEFZ?=
 =?utf-8?B?RHljYmlPbFlKWDdaTnlyZzRYY3BJTDlTVnFRMkpGQ2h4Q2ZVM2I0VWYwck01?=
 =?utf-8?B?eC8yWmNVeG9NOS9vWFhCeUNZQ1AvN1VueG1vSExBczl1M2hTVzNtejA1ZTRv?=
 =?utf-8?B?YVVsQUFST3QzVmhmWkxpLzNhSnNPNUxRdkZNaXlSUDd3Zm9aZlpocHorVnRz?=
 =?utf-8?B?ZUs4ZGZ3QlpIdmxCSjQ3dVgrdkNUeHRpRXM0cjVvSlRZZ01Eak05djhRZnVB?=
 =?utf-8?B?WTBNYm56bDJLN0N3SVRFWStmaFpaQVB1OU9Pb0w4QmFrek1PV1JVNU13OHdJ?=
 =?utf-8?B?MEVDM0pORnJoUjFtdWl5a2QwbitEMGUwbzZLdE0xWGRhNjF0LzBDL1pRazkr?=
 =?utf-8?B?T25reitjZGhRdTFLVXhwOTdjKzFzcUphT3I5REs2bUZEQ3piR0t4K054SkxY?=
 =?utf-8?B?NnRkdGJlVDIzSUhaK2VsTGlOczlqbzRjM2tJdjhSRmNrZnJETTVqcXFGdGFk?=
 =?utf-8?B?bzYxT0xVWUJORFRValFTalRlbWRFYUppbDRqNGxjTmFEVWpBQm1GT3VwUDVj?=
 =?utf-8?B?Qm1JN0N5R0pVb1pGNE1EUGVrTXd3cUVzWmdXZ1JadUlUckFEOXNCKzdUN0NF?=
 =?utf-8?B?MXBGcTB0MGp5bmRQZjh6U3R0b2NnQjZKZDVNUU4rcVNmM2xiMXNibVZ0NnRP?=
 =?utf-8?B?UUpKTWM1WXpEc1hVekhpVWUrSVZrNlR3WjgxanVVZjdsMllKb3Y1enhoL0ZS?=
 =?utf-8?B?TUJqb3ZHUkRzNzZ0Z2t4elJJYkVyeVl1NTJha2ZFcEQ2VVJIbnd4U1o4YmpT?=
 =?utf-8?B?N3g5QUlLazdLUmI1RjltRk5WZ20rUGhFNGZCR01UU2gzVTRWTC95RzVhd2x1?=
 =?utf-8?B?MUZNYzRFamFhSFBCV2dOem5Fc2d6Rnhvd2YrOWROcUR2MHlUWU9QdXhvOFlK?=
 =?utf-8?B?N3RBd1VNK1kvRzF5Q1BZaTVPaHd0VmNvYVVLUmtPdENDVjg4Y1dBT0MvYU9K?=
 =?utf-8?B?NUFTbE45dUZvaGt4Q3pnUnd1Ykc5VmVPa2hjT2s0alhCMVRCUTJMTUdHejNC?=
 =?utf-8?B?SVkwdlNpWXVmdC9ORmlRNmFCdDN6SFpvT094cloyM1ZsTVVnclhRVmpkUCtK?=
 =?utf-8?B?eHB4ZUE2UDh4TmFyL2JmSm5uN3c0RjlKZzJSeFcwdmdUMjJPTzM3R1cwTVNT?=
 =?utf-8?Q?7XFDa8lxTe63Kf+k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4e4051-58e5-4d65-6d52-08da13f11ed5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2022 15:05:55.0914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R3yIP3aaHW/fSdzeu85kGTGO/Fq1o1nI+Z1mhrvlYK6JWMHwVBTbUZ6ytC7fp4F73c9xJCW/Pn4EZsFzMM6Zu+YUXKxrkqDNa/i5h0rzP9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6392
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggNy83XSBhcm02NDogZHRzOiByZW5lc2FzOiByemcydWwtc21hcmMtc29tOiBFbmFibGUN
Cj4gRXRoZXJuZXQgb24gU01BUkMgcGxhdGZvcm0NCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBU
dWUsIE1hciAxNSwgMjAyMiBhdCA0OjU5IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gRW5hYmxlIEV0aGVybmV0ezAsMX0gaW50ZXJmYWNlcyBv
biBSWi9HMlVMIFNNQVJDIEVWSy4NCj4gPg0KPiA+IEV0aGVybmV0MCBwaW5zIGFyZSBtdXhlZCB3
aXRoIENBTjAsIENBTjEsIFNTSTEgYW5kIFJTUEkxIHBpbnMgYW5kDQo+ID4gRXRoZXJuZXQwIGRl
dmljZSBzZWxlY3Rpb24gaXMgYmFzZWQgb24gdGhlIFNXMVszXSBzd2l0Y2ggcG9zaXRpb24uDQo+
ID4NCj4gPiBTZXQgU1cxWzNdIHRvIHBvc2l0aW9uIE9GRiBmb3Igc2VsZWN0aW5nIENBTjAsIENB
TjEsIFNTSTEgYW5kIFJTUEkxLg0KPiA+IFNldCBTVzFbM10gdG8gcG9zaXRpb24gT04gZm9yIHNl
bGVjdGluZyBFdGhlcm5ldDAuDQo+ID4NCj4gPiBUaGlzIHBhdGNoIGRpc2FibGVzIEV0aGVybmV0
MCBvbiBSWi9HMlVMIFNNQVJDIHBsYXRmb3JtIGJ5IGRlZmF1bHQuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3
ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2Fz
LmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJ1bC1zbWFyYy1zb20uZHRzaQ0KPiA+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcydWwtc21hcmMtc29tLmR0c2kNCj4gPiBAQCAt
NTIsMTEgKzU3LDEwMSBAQA0KPiA+ICAjZW5kaWYNCj4gPiAgfTsNCj4gPg0KPiA+ICsjaWYgKCFT
V19FVDBfRU5fTikNCj4gPiArJmV0aDAgew0KPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZldGgw
X3BpbnM+Ow0KPiA+ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArICAg
ICAgIHBoeS1oYW5kbGUgPSA8JnBoeTA+Ow0KPiA+ICsgICAgICAgcGh5LW1vZGUgPSAicmdtaWkt
aWQiOw0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICsNCj4gPiArICAgICAgIHBo
eTA6IGV0aGVybmV0LXBoeUA3IHsNCj4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJl
dGhlcm5ldC1waHktaWQwMDIyLjE2NDAiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgImV0aGVybmV0LXBoeS1pZWVlODAyLjMtYzIyIjsNCj4gDQo+IFRvIGJlIGF1Z21lbnRlZCB3
aXRoIGludGVycnVwdCBwcm9wZXJ0aWVzIHdoZW4gdGhlIFJaL0cyTCBJUlFDIGRyaXZlciBhbmQN
Cj4gYmluZGluZ3MgaGF2ZSBiZWVuIGNvbXBsZXRlZC4gIEJ1dCB0aGF0IGNhbiBiZSBkb25lIGxh
dGVyLi4NCg0KT0suIEFncmVlZC4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICsgICAgICAg
ICAgICAgICByZWcgPSA8Nz47DQo+ID4gKyAgICAgICAgICAgICAgIHJ4Yy1za2V3LXBzZWMgPSA8
MjQwMD47DQo+ID4gKyAgICAgICAgICAgICAgIHR4Yy1za2V3LXBzZWMgPSA8MjQwMD47DQo+ID4g
KyAgICAgICAgICAgICAgIHJ4ZHYtc2tldy1wc2VjID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAg
ICB0eGR2LXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgcnhkMC1za2V3LXBz
ZWMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgIHJ4ZDEtc2tldy1wc2VjID0gPDA+Ow0KPiA+
ICsgICAgICAgICAgICAgICByeGQyLXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAg
ICAgcnhkMy1za2V3LXBzZWMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgIHR4ZDAtc2tldy1w
c2VjID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICB0eGQxLXNrZXctcHNlYyA9IDwwPjsNCj4g
PiArICAgICAgICAgICAgICAgdHhkMi1za2V3LXBzZWMgPSA8MD47DQo+ID4gKyAgICAgICAgICAg
ICAgIHR4ZDMtc2tldy1wc2VjID0gPDA+Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArfTsNCj4gPiAr
I2VuZGlmDQo+ID4gKw0KPiA+ICsmZXRoMSB7DQo+ID4gKyAgICAgICBwaW5jdHJsLTAgPSA8JmV0
aDFfcGlucz47DQo+ID4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiA+ICsg
ICAgICAgcGh5LWhhbmRsZSA9IDwmcGh5MT47DQo+ID4gKyAgICAgICBwaHktbW9kZSA9ICJyZ21p
aS1pZCI7DQo+ID4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gKw0KPiA+ICsgICAgICAg
cGh5MTogZXRoZXJuZXQtcGh5QDcgew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
ImV0aGVybmV0LXBoeS1pZDAwMjIuMTY0MCIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiOw0KPiA+ICsgICAgICAgICAgICAgICBy
ZWcgPSA8Nz47DQo+IA0KPiBMaWtld2lzZS4NCj4gDQo+ID4gKyAgICAgICAgICAgICAgIHJ4Yy1z
a2V3LXBzZWMgPSA8MjQwMD47DQo+ID4gKyAgICAgICAgICAgICAgIHR4Yy1za2V3LXBzZWMgPSA8
MjQwMD47DQo+ID4gKyAgICAgICAgICAgICAgIHJ4ZHYtc2tldy1wc2VjID0gPDA+Ow0KPiA+ICsg
ICAgICAgICAgICAgICB0eGR2LXNrZXctcHNlYyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAg
cnhkMC1za2V3LXBzZWMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgIHJ4ZDEtc2tldy1wc2Vj
ID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICByeGQyLXNrZXctcHNlYyA9IDwwPjsNCj4gPiAr
ICAgICAgICAgICAgICAgcnhkMy1za2V3LXBzZWMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAg
IHR4ZDAtc2tldy1wc2VjID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICB0eGQxLXNrZXctcHNl
YyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgdHhkMi1za2V3LXBzZWMgPSA8MD47DQo+ID4g
KyAgICAgICAgICAgICAgIHR4ZDMtc2tldy1wc2VjID0gPDA+Ow0KPiA+ICsgICAgICAgfTsNCj4g
PiArfTsNCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlPg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5v
cmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxl
LCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0
Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
