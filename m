Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE8A6BD4A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Mar 2023 17:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjCPQEX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Mar 2023 12:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjCPQEW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 12:04:22 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB073144B3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Mar 2023 09:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faBFo3HuI3TeXPGg3LmTkbFe7kYG+w4adzccfWVlpyELpS0+yW9tnPQaEIlIaEWVDGp+5ayvRnRRTbcUOAYvARuu1s7VGD/YynHbtGRwiIV6AltKupGPMrPVRLcVl+KL2ThOl5VcyOrRNDNKsZf7+9BCtoWUSrTL2vuyO3UhBpEBLmjeCn4qDoF8SWIu77NazRjAOOU1bqDXI43isCe+l/doBisFeLJNrfN95guByeCNC5jWZpc/6p8jaOY5GhXusoAngJuvjLMEN8FvdMuyFxXYyoi52Lgvls3kIk9ZUmjej+TJIiW3NPaujRfovoLRXg6k5Y6LXWQR/Gt9Z44pug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nECvk1W0pg8GuY+rNBMZGK5pP9GnWY3FtOtqnRB2+5g=;
 b=m0pPj06A1/SH6W3qPl6dwqHYPoGK8Wp4J+XI/Xa7AIvPUot5Ef6jwTYD4a7NSwUGVFzGADRCuvPlgMM+d9ZdBYaIg9i/P3lkIC/dQAqXrEu3oHgTTGsbqXm1zq3jZQlhV5WsHLvql4eyUQEJNcw/3JqSFeGSRtZg8FRVx81dyd8tZcVYOB4AO/zBgNFPkRR3uMA0j9SkWd8I6dAi3Ckn3uIkET6JP+DlbYdiPjir6GFOolI1csnU1LNxo+CW9S2cHJtqj8zMFTLMUWsIT976+h3D5WKdSR0/qgVVG2yHHsx6ew+T8YImcxCa+dZwNRTcCrWwM0gUu5+ttHgCCXvAZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nECvk1W0pg8GuY+rNBMZGK5pP9GnWY3FtOtqnRB2+5g=;
 b=G8BNGYuBxoW8L56FrTCKEt4nQqpZPfiUJg9vnbdNAAaOUvQw4oPpazydFgKmX0ugR1s4yZJ9R7S1FQIleaOgNBHsSXRtFgiAlOd5BbQ2BS9jtUMP21RJh7WmZXl9o6/mDvGlDQrdFWaZrgk2KWkb2qyg2cgqFG9roKcDy74HYMA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB10203.jpnprd01.prod.outlook.com (2603:1096:604:1e2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Thu, 16 Mar
 2023 16:04:01 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 16:04:00 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        William Breathitt Gray <william.gray@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v14 2/6] mfd: Add Renesas RZ/G2L MTU3a core driver
Thread-Topic: [PATCH v14 2/6] mfd: Add Renesas RZ/G2L MTU3a core driver
Thread-Index: AQHZU3LB+N0F0bfecU29+uor8D29b679mUsAgAABbIA=
Date:   Thu, 16 Mar 2023 16:04:00 +0000
Message-ID: <OS0PR01MB5922FE8D99B0DB1903E6D3CB86BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230310170654.268047-1-biju.das.jz@bp.renesas.com>
 <20230310170654.268047-3-biju.das.jz@bp.renesas.com>
 <20230316155806.GN9667@google.com>
In-Reply-To: <20230316155806.GN9667@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB10203:EE_
x-ms-office365-filtering-correlation-id: a4d95457-d93e-424b-6ad5-08db26380e48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Xtl9VTcTdcdPY5tOlpRRT1j/8TY3QFJWEVNUDMLKzIQyegx38A3kNdkRREF85G9A6RqWI0EmkCUBLAeZbeR3VmzcnPwEsVYjBh508WmaUTYioUMOo7DmjQBA/srDtsCIC7fLSFuxG/2KP0LpWn1m23iFGw68m892kaSCaLGmLOZ/d6kT/WQHKDc675BDA6A5C1S5NqDSJHhBIPCvAZqwy8C2NT+p3EqPNHFkrjvJvMzoAhejYYdxRP2Scv4LVr/wNbLaFSoBJGEb3FsyVeb8v3M39z5KxMzPhlm9DV2AWGW8aVqgEAGzJCRn1OyBYip6aQIwU0l/6N8k9evHWTheC384lBs01yC2OXQawLwmMmaalkevnWiKKzbV+2D7ri3vlDKLKVl8XEO+hq0NTf5LoSmZf8O8YEWGEXAL1gtYtphuyiS2jBV/fBLg4++Pvu15Yg7tesEoQ/+GNegzM1iazQB5JinKQxQQkz0Mz/XRecP9AZlO2B3Xauu2sVWrteD/xOnBQ48kVg6T77PoD6MZgaGASKJGNSJQ8LY24Wnx/Kb3vt1ZLolXSIXd4iX4hfsd3KgMDYVuCOJRsxRBjrsyyTHWmatcFncOLbYRqFKL3WQFr4mJWKelsHPkrl0s0KGcmBSGzU7IO+fVLlDtEYyPq6K1J73XSARD3rU7T2VFVcM7YBPb+T5GOp6DwobQQ+jLvDanjSZjtiyqv2OqPUWOITWc/RdeUNL6Jrnznu2E/Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199018)(478600001)(7696005)(5660300002)(45080400002)(71200400001)(6506007)(9686003)(26005)(2906002)(55016003)(186003)(33656002)(966005)(86362001)(4326008)(41300700001)(38100700002)(122000001)(66476007)(64756008)(66556008)(66446008)(8676002)(6916009)(66946007)(76116006)(38070700005)(83380400001)(8936002)(52536014)(54906003)(316002)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjViTXdnb0x6ZmxjS3c4S0VzT2tBVnNadmVEb0dRQW9OYk1pYmZlQUk0WVBi?=
 =?utf-8?B?NlEzOGNVbjFpb2JvQXd1NHZiSDFVRWRtWFp3cHZWQlpVQ053eUFNMXExWnBU?=
 =?utf-8?B?VVdwejMxN2JrOWlyNG5QTEZlbHQxTmdqSFZkZWZzYmVuc1pQK2lIbUhQUjFO?=
 =?utf-8?B?bkVNNkFzSFNLMjVQRzc0SDA1b1VyT3ViY0tPblFQUzdnQVQ2b0NBeGM5SzBI?=
 =?utf-8?B?S2QyV1Vod3ZocXh1V1VpN3NLR09kNGd3RzYrbmFON0U0dVVYZTUvVlpDQTBQ?=
 =?utf-8?B?T1E0dGt3L3g0d0dOUFhSMWhLTEZ3VjlKc0xhaGpUcFFMSWFWMUVobDZXZ1Rh?=
 =?utf-8?B?akdxajhPZGx5NkRjd3hHWHF1VlZHMWhDazEwTlR0N1dldHFJNTVWajdaRmgy?=
 =?utf-8?B?aC9meU1xYm1DM01SSDZSeFdrWkVFeU1NeS9VRVRIS3NueTZEb0FpcnJ5TTly?=
 =?utf-8?B?ckZvQjlOM1Ntcyt4bk1wNzJncVZWZXdqS252akJZQnU5em5uRUptR3MxaHV2?=
 =?utf-8?B?MTViTU45cDRYMkE4clExQU81VzY2dHdVbHEwcWJSQmNPbzhkbTBJRUFOL1Ba?=
 =?utf-8?B?QzBMQ0lOSHBlMUpHTjY3T055UktpUk5pd2x4VFBtbEpoemhER0JpelhJRU40?=
 =?utf-8?B?Ukg2USttOG9mTEd5SzVTNDZxaS84dmptYTRjbG9keUpaQWIvcm94RmxMUWpD?=
 =?utf-8?B?YmtBd1g2dWNnMGNUTnVWc3BMaFJPQmlsQTRuRzM2V0JiTE9OUE1RTmQyQ3JN?=
 =?utf-8?B?bGdwUW0yaloxQXJ6dmpHcytJdUtxUFNVOWM5bzdLTmZva3pGY1lPMDJiNUdO?=
 =?utf-8?B?WUdubkFxZTQyY3BnU01kcWFuSVNuemJOV0FKTXVLVEpuWjhReHlDNFhlOTZL?=
 =?utf-8?B?b3B5STB0UUQ0T2YzQVFWV29yWXhRRmF0Z1pUWk9aSDQwbnZuamRJRFRrMGd6?=
 =?utf-8?B?dTdjeTVlTm5CTVUrN1ROY0lJOFdCczVtNldqZE8zT2VMTHB5WmV1dzdRTnQ3?=
 =?utf-8?B?aStubW1WRlpZQ0hXUEwyY3RvWE90VmFGWkk3RVFhS0g4NkZBaFBMYWlCRVhY?=
 =?utf-8?B?b2sxeG9QS2xBTmRDVFhsMytHbFgvWFJhUmJDbG5tMDRrQ1pGbGtMbVJRM3dy?=
 =?utf-8?B?YlpUejZsR1d5ZVlYc0FqV0ZxcG41RmIvaXh6Qzc5YzhxdHg4amZEZ3pTMXlN?=
 =?utf-8?B?YnYzTGRBTm5jSE16N1E3eklEbFhyeDM5SXk0dVlhSFM5WkJJbGt3OGRLdmVU?=
 =?utf-8?B?Tlk0aGRBaW1jY0JZS2QzTkQybVhVZy9aZTZqc2xtcnJWVlJFM2ZrN1pYcjJN?=
 =?utf-8?B?OEVNejVSUFpGbVAyS1p4UERDWFFTVCtZR21BOFNIOWY3NzVMR3Q4QlVNNkFn?=
 =?utf-8?B?RWhyNVozQ3JGQm10aTU4ZmMrbXFnUWpVV082WHZHeWk5ZVBsK2d6UkZod3J6?=
 =?utf-8?B?WUFXTWZnOEVzQUd6MVNjYU1YOFU3bzB5M3FPbFdxWHBRRTE5NDYxK2tKa0Nk?=
 =?utf-8?B?ZGQrVkprR25XbUZGQk9zYjBBYWIyVkRiSGhpQzdjU0ZQWnl2KytkWjlMamtD?=
 =?utf-8?B?VjJwZHd5eDBEWVJRNU5rMVJ1eHJHMXpvcjJ3Y045bjM3VUZuTGdUZjVla2I2?=
 =?utf-8?B?ZWNpc0VCWkhDNVVnQU93bi8rTXR3Y3VLM0x6VE9CZ3hFUXBZekJSVHRSS2Vy?=
 =?utf-8?B?TWl3S0h3K2NCSVRGVU1GUFM3aFFwelpKVmdpVWtSalcvbGZOajY5aWJiZE5H?=
 =?utf-8?B?cEZ3Ujh1emo4bjRDbTVtbzFFaUs4UG1MTjVVTUZTN0tjYWRnb0R3blJOR3hY?=
 =?utf-8?B?cGt4emZkcUFMeENxd3VPV3VteHVYQm9yQUVhSGg5c2NxTUpGcDVYN05UVGtE?=
 =?utf-8?B?NndqZDRGbWVuT2lER0lIaTdUaTNISkhxai83Tk9ISnNVOGZEc2R2Mys1YWw4?=
 =?utf-8?B?aXluaGpjVWU3V0RKS1BwR2FmQmhOSVJWbDNHZ2ltS29rUkVod3YycXFuOTRx?=
 =?utf-8?B?MEFtVzB2UWxJTE1Pb0cwL0R1bEYzNUdBUHNLdVYxTVVKNThvNzk4cjZsNFls?=
 =?utf-8?B?NTVVc1RpbWdtdStTeFErd1VvdFpxaUQ2cTVmWG8rVDFKemw4N25tWThmaFd1?=
 =?utf-8?Q?41riq52HWOEVaMms+x0cmkY/i?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d95457-d93e-424b-6ad5-08db26380e48
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 16:04:00.2083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSG0G9yNDql+YfSazR/095/DYoQDIOaaNImXvcmx9R+bIHoBCyNo4pipy6hCZTsYQZ/iThUDRN/eXLW8l/IqpvYuu8Zq4xEc47oraR3yojM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10203
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGVlIEpvbmVzLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjE0IDIvNl0gbWZkOiBBZGQg
UmVuZXNhcyBSWi9HMkwgTVRVM2EgY29yZSBkcml2ZXINCj4gDQo+IE9uIEZyaSwgMTAgTWFyIDIw
MjMsIEJpanUgRGFzIHdyb3RlOg0KPiANCj4gPiBUaGUgUlovRzJMIG11bHRpLWZ1bmN0aW9uIHRp
bWVyIHB1bHNlIHVuaXQgMyAoTVRVM2EpIGlzIGVtYmVkZGVkIGluDQo+ID4gdGhlIFJlbmVzYXMg
UlovRzJMIGZhbWlseSBTb0NzLiBJdCBjb25zaXN0cyBvZiBlaWdodCAxNi1iaXQgdGltZXINCj4g
PiBjaGFubmVscyBhbmQgb25lIDMyLWJpdCB0aW1lciBjaGFubmVsLiBJdCBzdXBwb3J0cyB0aGUg
Zm9sbG93aW5nDQo+ID4gZnVuY3Rpb25zDQo+ID4gIC0gQ291bnRlcg0KPiA+ICAtIFRpbWVyDQo+
ID4gIC0gUFdNDQo+ID4NCj4gPiBUaGUgOC8xNi8zMiBiaXQgcmVnaXN0ZXJzIGFyZSBtaXhlZCBp
biBlYWNoIGNoYW5uZWwuDQo+ID4NCj4gPiBBZGQgTVRVM2EgY29yZSBkcml2ZXIgZm9yIFJaL0cy
TCBTb0MuIFRoZSBjb3JlIGRyaXZlciBzaGFyZXMgdGhlIGNsaw0KPiA+IGFuZCBjaGFubmVsIHJl
Z2lzdGVyIGFjY2VzcyBmb3IgdGhlIG90aGVyIGNoaWxkIGRldmljZXMgbGlrZSBDb3VudGVyLA0K
PiA+IFBXTSBhbmQgQ2xvY2sgZXZlbnQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gUmVmOg0KPiA+DQo+
ID4gaHR0cHM6Ly9qcG4wMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGcGF0Yw0KPiA+IGh3b3JrLmtlcm5lbC5vcmclMkZwcm9qZWN0JTJGbGludXgt
cmVuZXNhcy1zb2MlMkZwYXRjaCUyRjIwMjMwMTEzMTYxNzUNCj4gPiAzLjEwNzM3MDYtMy1iaWp1
LmRhcy5qeiU0MGJwLnJlbmVzYXMuY29tJTJGJmRhdGE9MDUlN0MwMSU3Q2JpanUuZGFzLmp6DQo+
ID4gJTQwYnAucmVuZXNhcy5jb20lN0M0NThjZmM3ZDhlZTg0NDUyOGE3NDA4ZGIyNjM3NDI0OCU3
QzUzZDgyNTcxZGExOTQ3ZQ0KPiA+IDQ5Y2I0NjI1YTE2NmE0YTJhJTdDMCU3QzAlN0M2MzgxNDU3
OTA5OTUwMTM1NDQlN0NVbmtub3duJTdDVFdGcGJHWnNiM2QNCj4gPiA4ZXlKV0lqb2lNQzR3TGpB
d01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDDQo+
ID4gMzAwMCU3QyU3QyU3QyZzZGF0YT1mTERlSFB4UlF1Y0RvZHFRY0htMW9od2F2U2JOYlduZzRt
dkZ0UzFwU0dNJTNEJnJlcw0KPiA+IGVydmVkPTANCj4gPiB2MTMtPnYxNDoNCj4gPiAgKiBBZGRl
ZCBoZWxwZXIgbWFjcm9zIGZvciBpbml0aWFsaXppbmcgOC8xNi8zMiBjaGFubmVsIHJlZyBvZmZz
ZXQgdGFibGUNCj4gaW4NCj4gPiAgICAiZHJpdmVycy9tZmQvcnotbXR1My5oIg0KPiA+ICAqIFJl
cGxhY2VkICJvZmYiLT5vZmZzZXQgaW4gcmVhZF93cml0ZSgpDQo+ID4gICogUmVwbGFjZWQgX19M
SU5VWF9SWl9NVFUzX0hfXy0+X19NRkRfUlpfTVRVM19IX18NCj4gPiAgKiBBZGRlZCBoZWFkZXIg
ZmlsZSBkZXZpY2UuaCBhbmQgbXV0ZXguaA0KPiA+ICAqIFVwZGF0ZWQgcnpfbXR1M19yZXF1ZXN0
X2NoYW5uZWwoKQ0KPiA+ICAqIFJlcGxhY2VkIGNoYW5uZWxfaW5kZXgtPmNoYW5uZWxfbnVtYmVy
IGluIHN0cnVjdCByel9tdHUzX2NoYW5uZWwNCj4gPiAgKiBEcm9wcGVkIHJlZHVuZGFudCBjb21t
ZW50cy4NCj4gPiAgKiBSZW5hbWVkIGNoYW5uZWwgbnVtYmVyIG1hY3JvcyBmcm9tIFJaX01UVSot
PlJaX01UVTNfQ0hBTl8qDQo+ID4gICogQWRkZWQgY29yZSBkcml2ZXIgc3BlY2lmaWMgcHJpdmF0
ZSBkYXRhIGluIHN0cnVjdCByel9tdHUzIGFuZCB1cGRhdGVkDQo+IHRoZQ0KPiA+ICAgIGNvbW1l
bnRzLiBUaGlzIHJlcGxhY2VzIG1taW8gZnJvbSBzdHJ1Y3QgcnpfbXR1My4NCj4gPiAgKiBTdGFy
dGVkIHVzaW5nIGFjdHVhbCBvZmZzZXQgaW4gY2hhbm5lbCByZWcgdGFibGUgYW5kIHJlbW92ZWQN
Cj4gY2hfcmVnX29mZnNldHMgdGFibGUNCj4gPiAgICBBbHNvIHNpbXBsaWZpZWQgdGhlIGNvZGUg
OC8xNi8zMiBiaXRzIHJlYWRfd3JpdGUoKSBhbmQgcmVtb3ZlZCBiYXNlDQo+IGZyb20NCj4gPiAg
ICBzdHJ1Y3QgcnpfbXR1M19jaGFubmVsLg0KPiA+ICAqIFNpbXBsaWZpZWQgcnpfbXR1M19zdGFy
dF9zdG9wX2NoKCkvcnpfbXR1M19pc19lbmFibGVkKCkgYnkgYWRkaW5nDQo+IGhlbHBlciBmdW5j
dGlvbnMNCj4gPiAgICByel9tdHUzX2dldF90c3RyX29mZnNldCgpL3J6X210dTNfZ2V0X3RzdHJf
Yml0X3BvcygpLg0KPiA+IHYxMi0+djEzOg0KPiA+ICAqIE1vdmVkIFJaX01UVTNfVE1EUjFfKiBt
YWNyb3MgZnJvbSBwd20gZHJpdmVyIHRvIHJ6LW10dTMuaC4NCj4gPiB2MTEtPnYyOg0KPiA+ICAq
IE1vdmVkIHRoZSBjb3JlIGRyaXZlciBmcm9tIHRpbWVyIHRvIE1GRC4NCj4gPiAgKiBNb3ZlZCBo
ZWFkZXIgZmluZSBmcm9tIGNsb2Nrc291cmNlL3J6LW10dTMuaC0+bGludXgvbWZkL3J6LW10dTMu
aA0KPiA+ICAqIFJlbW92ZWQgU2VsZWN0IE1GRF9DT1JFIG9wdGlvbiBmcm9tIGNvbmZpZy4NCj4g
PiB2MTAtPnYxMToNCj4gPiAgKiBObyBjaGFuZ2UuDQo+ID4gdjktPnYxMDoNCj4gPiAgKiBObyBj
aGFuZ2UuDQo+ID4gdjgtPnY5Og0KPiA+ICAqIE5vIGNoYW5nZS4NCj4gPiB2Ny0+djg6DQo+ID4g
ICogQWRkIGxvY2tpbmcgZm9yIFJNVyBvbiByel9tdHUzX3NoYXJlZF9yZWdfdXBkYXRlX2JpdCgp
DQo+ID4gICogUmVwbGFjZWQgZW51bSByel9tdHUzX2Z1bmN0aW9ucyB3aXRoIGNoYW5uZWwgYnVz
eSBmbGFnDQo+ID4gICogQWRkZWQgQVBJIGZvciByZXF1ZXN0IGFuZCByZWxlYXNlIGEgY2hhbm5l
bC4NCj4gPiB2Ni0+djc6DQo+ID4gICogQWRkZWQgY2hhbm5lbCBzcGVjaWZpYyBtdXRleCB0byBh
dm9pZCByYWNlcyBiZXR3ZWVuIGNoaWxkIGRldmljZXMNCj4gPiAgICAoZm9yIGVnOiBwd20gYW5k
IGNvdW50ZXIpDQo+ID4gICogQWRkZWQgcnpfbXR1M19zaGFyZWRfcmVnX3VwZGF0ZV9iaXQoKSB0
byB1cGRhdGUgYml0Lg0KPiA+IHY1LT52NjoNCj4gPiAgKiBVcGRhdGVkIGNvbW1pdCBhbmQgS0Nv
bmZpZyBkZXNjcmlwdGlvbg0KPiA+ICAqIFNlbGVjdGVkIE1GRF9DT1JFIHRvIGF2b2lkIGJ1aWxk
IGVycm9yIGlmIENPTkZJR19NRkRfQ09SRSBub3Qgc2V0Lg0KPiA+ICAqIEltcHJvdmVkIGVycm9y
IGhhbmRsaW5nIGluIHByb2JlKCkuDQo+ID4gICogVXBkYXRlZCBNT0RVTEVfREVTQ1JJUFRJT04g
YW5kIHRpdGxlLg0KPiA+IHY0LT52NToNCj4gPiAgKiBNb3ZlZCBjb3JlIGRyaXZlciBmcm9tIE1G
RCB0byB0aW1lcg0KPiA+ICAqIENoaWxkIGRldmljZXMgaW5zdGF0aWF0ZWQgdXNpbmcgbWZkX2Fk
ZF9kZXZpY2VzKCkNCj4gPiB2My0+djQ6DQo+ID4gICogQSBzaW5nbGUgZHJpdmVyIHRoYXQgcmVn
aXN0ZXJzIGJvdGggdGhlIGNvdW50ZXIgYW5kIHRoZSBwd20NCj4gZnVuY3Rpb25hbGl0aWVzDQo+
ID4gICAgdGhhdCBiaW5kcyBhZ2FpbnN0ICJyZW5lc2FzLHJ6LW10dTMiLg0KPiA+ICAqIE1vdmVk
IFBNIGhhbmRsaW5nIGZyb20gY2hpbGQgZGV2aWNlcyB0byBoZXJlLg0KPiA+ICAqIHJlcGxhY2Vk
IGluY2x1ZGUvbGludXgvbWZkL3J6LW10dTMuaC0+ZHJpdmVycy9tZmQvcnotbXR1My5oDQo+ID4g
ICogUmVtb3ZlZCAicmVtb3ZlIiBjYWxsYmFjaw0KPiA+IHYyLT52MzoNCj4gPiAgKiByZW1vdmVk
IHVud2FudGVkIGhlYWRlciBmaWxlcw0KPiA+ICAqIEFkZGVkIExVVCBmb3IgMzIgYml0IHJlZ2lz
dGVycyBhcyBpdCBuZWVkZWQgZm9yIDMyLWJpdCBjYXNjYWRlDQo+IGNvdW50aW5nLg0KPiA+ICAq
IEV4cG9ydGVkIDMyIGJpdCByZWFkL3dyaXRlIGZ1bmN0aW9ucy4NCj4gPiB2MS0+djI6DQo+ID4g
ICogQ2hhbmdlZCB0aGUgY29tcGF0aWJsZSBuYW1lDQo+ID4gICogUmVwbGFjZWQgZGV2bV9yZXNl
dF9jb250cm9sX2dldC0+ZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNsdXNpdmUNCj4gPiAgKiBS
ZW5hbWVkIGZ1bmN0aW9uIG5hbWVzIHJ6ZzJsX210dTMtPnJ6X210dTMgYXMgdGhpcyBpcyBnZW5l
cmljIElQDQo+ID4gICAgaW4gUlogZmFtaWx5IFNvQydzLg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJz
L21mZC9LY29uZmlnICAgICAgICAgfCAgMTAgKw0KPiA+ICBkcml2ZXJzL21mZC9NYWtlZmlsZSAg
ICAgICAgfCAgIDEgKw0KPiA+ICBkcml2ZXJzL21mZC9yei1tdHUzLmMgICAgICAgfCAzOTEgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGRyaXZlcnMvbWZkL3J6LW10
dTMuaCAgICAgICB8IDE0NyArKysrKysrKysrKysrKw0KPiA+ICBpbmNsdWRlL2xpbnV4L21mZC9y
ei1tdHUzLmggfCAyNDEgKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICA1IGZpbGVzIGNoYW5n
ZWQsIDc5MCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21m
ZC9yei1tdHUzLmMgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRyaXZlcnMvbWZkL3J6LW10dTMu
aCAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL3J6LW10dTMuaA0KPiANCj4g
SSBwbGFuIHRvIHRha2UgdGhpcyBzZXQgdmlhIE1GRCBvbmNlIHlvdSBoYXZlICBQV00gQWNrLg0K
PiANCj4gRm9yIG15IG93biByZWZlcmVuY2UgKGFwcGx5IHRoaXMgYXMtaXMgdG8geW91ciBzaWdu
LW9mZiBibG9jayk6DQo+IA0KPiBBY2tlZC1mb3ItTUZELWJ5OiBMZWUgSm9uZXMgPGxlZUBrZXJu
ZWwub3JnPg0KDQpUaGFuayB5b3UuDQoNCkNoZWVycywNCkJpanUNCg==
