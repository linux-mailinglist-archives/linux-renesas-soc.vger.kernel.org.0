Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E05A51461D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 11:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357186AbiD2KCh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 06:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357181AbiD2KCf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 06:02:35 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2127.outbound.protection.outlook.com [40.107.113.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78442C6656;
        Fri, 29 Apr 2022 02:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGe0XMiLamLIvamkoMQ7PhaYzp5Tw7P1yqB09NE0bfuqI9X2EWMr0y2bZPMpKf16IyyE+/ULSsUlWXZuq2cTMnuG/EVnFpWC4YFExDrcdUPpCYLSawy4dH1vWunRHPCoT1O174ozdutBace8IEU1hdK/gjAqoSEImlytI52SRNz4ZaA02/no2dTKgxb7nU6iO1kRooMjcPmYXnhid/LCrsrI1BRAhCFqaOrkb/TUchhWLkeSp+Ay4OOjqQwUo1zBgnGumLaDy2UT2ZqydTja2o5D0zjcXXtyxPdskyRvVApcdjM+hm4ajJnTeRPzFFZNqyEONNJwLPIvsl4F7Lsu/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2TdYLNT2yzFRoQyShAh46gtzmQ/uOUpTNAr6WEPKcg=;
 b=RrufQ5MUMwE5JAOtGJct09jDejtRMJrXFa/+C9JmeMNibmphW8xHt3CBQdyPrHNgBD9fWjzOZRItAY4FV3EuDAIjKeJPMSvH+ZhQjrFxHz8wiiqxAiXdTHtupsyT8Zp22k15excmzBP+8NiIiiE1wBiRrvU8B5nE8GIR1D4bXjlkqW9ZObLDqn9oJDz9ryCGvbzPKbGKzNyAtYFNfb2/bjxGQT1yTOvBV5T5SHfAoRrXJnjioyVvjtfV1jUlPLRWkvMj658noxbJ2+HwGicciTXDULHk1K07ajFTlweRIkbd3jtun6ouzp83igdMKvcSPfC86H+bQ47cQjif3uGCeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2TdYLNT2yzFRoQyShAh46gtzmQ/uOUpTNAr6WEPKcg=;
 b=JrQuqyyOZggjYWT0bK76QyAzj2KQs+Brl1cw38sa5JWID+tEQI116jH2vEkWqhkROdpcXgrzdnGzGEv2ef08weNuBI9aDyDnv0H5n5VivYysLf356uXRJfUYpXbAQnBKl1FwoX3glU2AZdCE1fCoXxN34IutOW/6pIsnHBwFt38=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4550.jpnprd01.prod.outlook.com (2603:1096:604:78::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Fri, 29 Apr
 2022 09:59:15 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.014; Fri, 29 Apr 2022
 09:59:15 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 3/9] clk: renesas: rzg2l: Add DSI divider clk support
Thread-Topic: [PATCH v2 3/9] clk: renesas: rzg2l: Add DSI divider clk support
Thread-Index: AQHYWhv7A6T+bHumC0eniUT7n79q0q0GpZ6AgAABVgCAAANHgIAAAI7g
Date:   Fri, 29 Apr 2022 09:59:15 +0000
Message-ID: <OS0PR01MB5922127A42B6EDF9CB1E135186FC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220427094823.3319-1-biju.das.jz@bp.renesas.com>
 <20220427094823.3319-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUo6J7_hfsoDYprMc7Tk79D4FxQiXJ7hFH8s_6nzptsUw@mail.gmail.com>
 <OS0PR01MB5922F0C5A80F26109A27BC5D86FC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdW88S+STBvsL45wT1ox0mO=_HUtSd8HqB5037R=XCcGTw@mail.gmail.com>
In-Reply-To: <CAMuHMdW88S+STBvsL45wT1ox0mO=_HUtSd8HqB5037R=XCcGTw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9160715b-a0e0-47e1-266c-08da29c6eb25
x-ms-traffictypediagnostic: OSBPR01MB4550:EE_
x-microsoft-antispam-prvs: <OSBPR01MB4550156CF0F5EE74833BA91D86FC9@OSBPR01MB4550.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V9cDomuX8U7Su1AKpRhoNUxnUuwa7DP8sUoPqzzpWdZyE3PAfbhVFius3QU8O6r1ZguRvnrFj6Jq5wspBUD5REtUuV/sCk+oIRDc1lDqeNLD1zuyBBIcIvSl73RXGUgs4hI1PzAJMFzDi+wvPfArgYw02qpbDSuKv5tErVCNen6tKBpgp6h/zFRFWnjYXzO/2Ah7j6SuhwjHDgjO9lEL+XqwDkwInnmJ9adu6b1GP2h6p/pPe17QGhm2VNLvsG0mqz9asyN4OvgV5UKPMVJwn/UW4xUbKhbRSCAxneFeIs656kt2c+aeszdnUKR4Oh+6PD0UX0XIxUMN9ZFlgKPvkzrMvoOcUE+/GP9yGwhGrJoMVvn/SMvbkjudtGyA7lG4l8D9Dv+Ef8+L/5ezCxR9BUBW9+AfrhmhokM2aXwXd2BoO/fI+i1DqeUK5onwSLHZtY94tB+LntStqamEnWksN9sLtacq9Io5fIEuo5tq6x6Qi7sDDbt1lGRg5xQ/6Ec+S0mg6O1D4ScDQZU6ATalfgBY/mlxFq6n4T7QGx9EIUuxh4zJaOW0QJ7HKHXGebavcePp3cOB1elKCkWppblWylxM4CYBT+o7Ujtlk8KjdtJCvp+g1zCgDwFsi5NQOk+sXADFQTvEgkGj/MNtDolRBQQRUf47/1OPBoVVXZRrQm8AEZVOVcFkvm9Fr0BdHBbCAsmw8/OgpFqP3TY04/K/Uw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(6916009)(6506007)(53546011)(54906003)(508600001)(26005)(7696005)(71200400001)(33656002)(2906002)(55016003)(122000001)(38100700002)(38070700005)(66946007)(66556008)(66446008)(8676002)(4326008)(76116006)(66476007)(64756008)(316002)(86362001)(5660300002)(8936002)(52536014)(107886003)(9686003)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3IxM0ZCVGdVZWNSa1J2S216UlZLNUNPZXFkemlxa0NUQmpIRXFLNzhnNTBE?=
 =?utf-8?B?ajFrbnpaUk1KUEFBaHZWZmx1S08vZFZYVllKRUc2UGUvQk5sNkRkSjZGTUJz?=
 =?utf-8?B?YWxISkpuZ2pQTDhnV0FjYnBiZGRPN09zckhxZGMvRzNLSmNZU0dmelBKL0t3?=
 =?utf-8?B?ZVVybzB2TEpTTmhmYWpMbWpOVWxCTGdFK1VwaFJyQ1hDcFBpV2lkN3hqanJu?=
 =?utf-8?B?bmUzVFEwZUJTZENSWmE3a1ErWll2Y0hCaHEySS84SFZZZEV6S0dDYWgxYlU0?=
 =?utf-8?B?b2l2TklLc1Z1Z2VBQVBIMGVWS1lpK2hrZmR2UFBKTVBxRmZWOVZZWm1YcEpK?=
 =?utf-8?B?MkgwTFVFR3FWeTNSbmloZ3p4dThTakJ5RU9uRzZTWWhqbEhIWkZYdUs5clYy?=
 =?utf-8?B?RDVXc3lwY01CV2t1a3E0RXBnSTZMUjE2TEZmUVZDbzFTdXp1M0ZidjBLcW1R?=
 =?utf-8?B?Q0NQZmV4K1FzVTJuM0JFSUpDcDVTYXA3T1BUNG5qUGdZcWlKYmZ1SWI2REVK?=
 =?utf-8?B?bkwwOGZkWFdjQkhJWE84eDNob2g5U21kQnRvbzNtMy9xYjJjSnUzNmd5RjNY?=
 =?utf-8?B?Nkk2R0dRUk9VY3pTMlJHL3dDcEdPV1F6S3hOZ3lCWUttNHFEWTlBM3Jyc3d1?=
 =?utf-8?B?QXk0YkRQSEY5cG1Xbnc3Wk9ISzk2YUJmeVYwZXlJMXpsK0tHNnBwdWhJR3No?=
 =?utf-8?B?R3NjZThDQTN0bUZORjBreE10elVUMWhhSjVXcEVLcTNHc1V4SlNBbjFodkx1?=
 =?utf-8?B?S3IzOU5VSDE0MkZ2UGpUa3haTWpkSFlVakpWaW5Ya2N0SkhmWm5EaHNRUzNO?=
 =?utf-8?B?RDZFYXlGVE54SzZycDRTUFFya0VZZmQyeENTVDVmWUxWVTRVNDcyL1VaY2VZ?=
 =?utf-8?B?ck15bVNRTXFkaUJCaWpFSFhGUTVRN0REWFF6WlYrUklLdmVrS2pTTlJDY05W?=
 =?utf-8?B?dU10THVzYytiUnUzcGQ4WVRiUXc5TkdoakZrVjVzbDVlcFAvc3huUTJpRHZQ?=
 =?utf-8?B?Z0QyV1FhclJ6SlpLOEp6QVdlbTNQcittOXo3TmtvbWNZNVhSbXFOa2dscjVQ?=
 =?utf-8?B?T2djbVlBM1hlVXpWOG9DWTJ0ZGtBV2pha2trNzNKS0NNMGRrSFkwMGxFUXVa?=
 =?utf-8?B?MFA1b0VzTEp2eXJzS1YzMXBSU2lxWHlYT3kwb0NFUGhyYm9TV294SVlLN09a?=
 =?utf-8?B?V2gwSE9LVjQwK3MzNGlWdkd3UHFXd3VURUlIbnp0T1NzZkZxZTFyZzh1aVNs?=
 =?utf-8?B?Qnd2c2YwWjN5WTlCZzhuQlZzQ3J3WlJJY0VFTTcwZGMxUndwOFk5Z1A2L0RJ?=
 =?utf-8?B?OU1DcmhnS2phWG5EOHlWbnJMUytDTDEyOXlwdGU3N3dqWXhFRTRTWnBnbU9t?=
 =?utf-8?B?QUZvc3NMb2JvYm5VaE5qdS81bEM0Uzcrd2VNd2VRNWdzRmorT3NHUEUxZnlY?=
 =?utf-8?B?N3ZidjhJTUNGUWdyVHpOVHR2SnNEUUdBeW5lZzVmS3ZZQzBjYktVbzdwMFNJ?=
 =?utf-8?B?UVRFd0lRU1lnbmhNd1ZlSE5wMTJ1RjJnQ0FuK0F2VnJnQW9zNWZ4K1VvMm1k?=
 =?utf-8?B?VWRhS3BvME1sRTNLMUhzdDQvck1kRldiREh0WHpnWGkySEdlVC9QZUhEdFZ0?=
 =?utf-8?B?K0U3Mzhwb0RPa1dRTDVML1UvQW1GYjNoc2EyYWc4SThxeUVialhHK0REWENx?=
 =?utf-8?B?YS94ZHpOU2pGakJvTi9ZcWFPWUhoQWl6Z1dzdzFGekhzZEJtNjVncUQ4elZt?=
 =?utf-8?B?ZWVLRFFXNHlrcDdCVFc2Znl4SjhyZ3dZbCtLRXpTVDdhS2wyVXYzdFo1bEtB?=
 =?utf-8?B?NzJPRFltK09wdkhwQ0RaV3VEaFhGY0hIR2JPRnllbjZxNzRwYS9SWjJEancy?=
 =?utf-8?B?WEJPUDRoYUJRVjVhcmpYcmR1VHdyaFZEU3FBTmsrWEh2YktTbG1nU3g5NlpX?=
 =?utf-8?B?QWRHb3AvNG15U2d1K2c1M1NnaWtTVUlHb25ocFhUU1ZZU25Vemx2dzU5N1E4?=
 =?utf-8?B?OE5LL0d0S2Y4cHZMVFhGRXlHWG93R2VhLzBpNUQ3VmlOZVBVS3dpQ2ZTejJz?=
 =?utf-8?B?VXpiNkJxMnNQRk02aktkWkI4YlBpNWpsd2NHOVBDelZBUVhWcStxRmErb2JP?=
 =?utf-8?B?S1NnVTJLWlNwZnd2Vy92Z1d6RzRtbTJNYnVBNHc2eWVaTUhuZk42Z2xXUjdt?=
 =?utf-8?B?Ty9NdnhhUVluM2NEWThhaG1iK3Z0dnhYNTh3MFBqMEZBYVJHOVRtemlpVGoz?=
 =?utf-8?B?VWJPRzEvamhDSk12TGwvRDB3RXowcGZoMndBeWJzSFM4RUdtQVB2Mm1Gci9W?=
 =?utf-8?B?RjE1RXdrUXRONGVreXIxZ3lMQ1Z1clJRY2FCdDkzT2pYT3FldWhxUWpRdXQr?=
 =?utf-8?Q?bIFCIrE1Xbf0A4QI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9160715b-a0e0-47e1-266c-08da29c6eb25
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 09:59:15.1534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BTsxAwtAdb3t2ckMIqW6X/NfUCxfMJJp2EuYW01aRz+fCn/jgC5X0V1kci6SOxtXdPvYp46GK6HKbU95YfxqywJZebUdCHKzZqpi1ktNMys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4550
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMy85XSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgRFNJIGRpdmlkZXIgY2xrDQo+
IHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIEFwciAyOSwgMjAyMiBhdCAx
MTo1MCBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0K
PiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAzLzldIGNsazogcmVuZXNhczogcnpnMmw6IEFk
ZCBEU0kgZGl2aWRlciBjbGsNCj4gPiA+IHN1cHBvcnQNCj4gDQo+ID4gPiBPbiBXZWQsIEFwciAy
NywgMjAyMiBhdCAxMTo0OCBBTSBCaWp1IERhcw0KPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+IE0zIGNsb2NrIGlzIHNvdXJjZWQgZnJvbSBE
U0kgRGl2aWRlciAoRFNJRElWQSAqIERTSURJVkIpDQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgcGF0
Y2ggYWRkIHN1cHBvcnQgZm9yIERTSSBkaXZpZGVyIGNsayBieSBjb21iaW5pbmcgRFNJRElWQQ0K
PiA+ID4gPiBhbmQgRFNJRElWQiAuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gPiA+ICsNCj4gPiA+
ID4gKyAgICAgICBwYXJlbnRfcmF0ZSA9IHJ6ZzJsX2NwZ19nZXRfZm91dHBvc3RkaXZfcmF0ZSgm
cGFyYW1zLA0KPiA+ID4gPiArIHJhdGUpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgaWYg
KHByaXYtPm11eF9kc2lfZGl2X3BhcmFtcy5jbGtzcmMpDQo+ID4gPiA+ICsgICAgICAgICAgICAg
ICBwYXJlbnRfcmF0ZSAvPSAyOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgcmV0dXJuIHBh
cmVudF9yYXRlOw0KPiA+ID4gPiArfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMgaW50IHJ6
ZzJsX2NwZ19kc2lfZGl2X2RldGVybWluZV9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LA0KPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdA0KPiA+
ID4gPiArY2xrX3JhdGVfcmVxdWVzdA0KPiA+ID4gPiArKnJlcSkgew0KPiA+ID4gPiArICAgICAg
IHJlcS0+YmVzdF9wYXJlbnRfcmF0ZSA9IHJ6ZzJsX2NwZ19nZXRfdmNsa19wYXJlbnRfcmF0ZSho
dywNCj4gPiA+ID4gK3JlcS0+cmF0ZSk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICByZXR1
cm4gMDsNCj4gPiA+DQo+ID4gPiBTbyBhbnkgdmFsdWUgb2YgcmVxLT5yYXRlIHBhc3NlZCBpcyBz
dXBwb3J0ZWQsIGFuZCByZXEtPnJhdGUgbmV2ZXINCj4gPiA+IG5lZWRzIHRvIGJlIHVwZGF0ZWQ/
DQo+ID4NCj4gPiBZZXMsIFdlIGNhbiBhZGQgYSBjaGVjayBmb3IgZnJlcSBncmVhdGVyIHRoYW4g
MTQ4LjVNSHogYW5kIGlmIGl0IGlzDQo+ID4gZ3JlYXRlciwgQXNzaWduIHJlcS0+cmF0ZSB0byAx
NDguNU1Iei4NCj4gPg0KPiA+ID4NCj4gPiA+ID4gK30NCj4gPiA+ID4gKw0KPiA+ID4gPiArc3Rh
dGljIGludCByemcybF9jcGdfZHNpX2Rpdl9zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywNCj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IHJhdGUsDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBwYXJlbnRfcmF0ZSkgew0KPiA+ID4gPiArICAgICAgIHN0cnVjdCBkc2lfZGl2
X2h3X2RhdGEgKmRzaV9kaXYgPSB0b19kc2lfZGl2X2h3X2RhdGEoaHcpOw0KPiA+ID4gPiArICAg
ICAgIHN0cnVjdCByemcybF9jcGdfcHJpdiAqcHJpdiA9IGRzaV9kaXYtPnByaXY7DQo+ID4gPiA+
ICsNCj4gPiA+ID4gKyAgICAgICAvKg0KPiA+ID4gPiArICAgICAgICAqIE1VWCAtLT5ESVZfRFNJ
X3tBLEJ9IC0tPk0zIC0tPlZDTEsNCj4gPiA+ID4gKyAgICAgICAgKg0KPiA+ID4gPiArICAgICAg
ICAqIEJhc2VkIG9uIHRoZSBkb3QgY2xvY2ssIHRoZSBEU0kgZGl2aWRlciBjbG9jayBzZXRzIHRo
ZQ0KPiA+ID4gZGl2aWRlciB2YWx1ZSwNCj4gPiA+ID4gKyAgICAgICAgKiBjYWxjdWxhdGVzIHRo
ZSBwbGwgcGFyYW1ldGVycyBmb3IgZ2VuZXJhdGluZw0KPiA+ID4gPiArIEZPVVRQT1NURElWIGFu
ZA0KPiA+ID4gdGhlIGNsaw0KPiA+ID4gPiArICAgICAgICAqIHNvdXJjZSBmb3IgdGhlIE1VWCBh
bmQgcHJvcGFnYXRlcyB0aGF0IGluZm8gdG8gdGhlDQo+IHBhcmVudHMuDQo+ID4gPiA+ICsgICAg
ICAgICovDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICBpZiAoIXJhdGUpDQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAg
IGRzaV9kaXYtPnJhdGUgPSByYXRlOw0KPiA+ID4NCj4gPiA+IFNvIGFueSBub24temVybyB2YWx1
ZSBvZiByYXRlIGlzIHN1cHBvcnRlZD8NCj4gPg0KPiA+IEN1cnJlbnRseSB5ZXMsIEJ1dCBJZiB3
ZSBhZGQgYSBjaGVjayBmb3IgPiAxNDguNU1oeiBpbiBkZXRlcm1pbmVfcmF0ZSwNCj4gaXQgd2ls
bCBhbGxvdyBvbmx5IHVwdG8gMTQ4LjVNaHouDQo+IA0KPiBZb3Ugc3RpbGwgbmVlZCB0aGF0IGNo
ZWNrIGhlcmUsIHRvbywgYXMgdGhlcmUgaXMgbm8gZ3VhcmFudGVlIHVzZXJzIHdpbGwNCj4gY2Fs
bCAuc2V0X3JhdGUoKSB3aXRoIHRoZSByb3VuZGVkIHBhcmFtZXRlcnMgb2J0YWluZWQgZnJvbQ0K
PiAuZGV0ZXJtaW5lX3JhdGUoKS4NCg0KT0ssIHdpbGwgYWRkIGEgY2hlY2sgYW5kIHJldHVybiAt
RUlOVkFMIGZvciBmcmVxID4gMTQ4LjUgaGVyZS4NCg0KQ2hlZXJzLA0KQmlqdQ0K
