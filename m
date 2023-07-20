Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E033875B78C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jul 2023 21:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjGTTKb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Jul 2023 15:10:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjGTTKa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jul 2023 15:10:30 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2112.outbound.protection.outlook.com [40.107.113.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F2BE75;
        Thu, 20 Jul 2023 12:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpXMixYXWRe4wwxpIAWvC3kQWpjUO5j+onk20Dlli8/gW6UPt4hFMCUafJVJkAJhDXWYMnYl1DopFxx38qpKKY/EGwd7cc1jM1EaB/kXETbfPMgY9UQxLzQwVIAlQgruEXlDhwUS6Qa9BVB4rZMDJU5sa+U3xkOVlavDQegt+kJ7NCtLyZKuiE5uv+nVmNRaNrGISB473/Vulmnc4s0HBvQ3L/2mvvrRpwCe+XV7tjbremmc1PsJflZECFGELEB+6o+6cq9g3xozTdPRHLUZz/MXzW8e0zQoLwAVk+32yt27p1aU0GUry8IhCGTbuCuDN62NgclT3N2DLApzyieGtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3yGUITPnVZ9llDLTBQqnkNpHD2LRK2/PfEn2EtBmm0=;
 b=mnNWqIoVCFppqjgsOg3SKYJ8o53wsU/evDapuXtFqmhUR1NLZWzMNsh6Jgm49CLHyt53UI5gxXsuymHMQBxk/xkkEwvsX0QrsVDHErzpcfRE7NWnwt2HPhwR18KIrBSY4TFLyVLflodJ03w7mID6B7QBZ49nKtUcwbpgETKxxHMmOfimHu6dkcKYxACL7xkRytVhjPaz0gg1y76ww6fpMKP4tThXAuffCU5wUdYaapq3BC2+4l92h+PVgviUJUG20iF4lGl+PtZMq3wjIbjkC5iLt35wpvnU92flp9RJQueP+xOn/cpL7AcEkkfqrIXgtH4P94EsrZa7HdaNTYiJDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3yGUITPnVZ9llDLTBQqnkNpHD2LRK2/PfEn2EtBmm0=;
 b=M45ZEHyZmZmqUKdJK9C1U6dmBWl34d1fPPjJxDkgWE9KnaFNxHFtHdZmUkXfATHPWVl4lZjbvIEQ9lzNzDpBQcDwiAmqoqHZE8c05Q65/wpBa5AbF3rB8HQUrP5dxlG/Qa8nxhbJm2w7YbaJAdWultbh8HZZu3fLG8rNftXp/JY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8618.jpnprd01.prod.outlook.com (2603:1096:604:19c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Thu, 20 Jul
 2023 19:10:22 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95%7]) with mapi id 15.20.6609.026; Thu, 20 Jul 2023
 19:10:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marex@denx.de>,
        Alexander Helms <alexander.helms.jy@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] clk: vc5: Use i2c_get_match_data() instead of
 device_get_match_data()
Thread-Topic: [PATCH 1/2] clk: vc5: Use i2c_get_match_data() instead of
 device_get_match_data()
Thread-Index: AQHZt/x26WS4OvT3hUmkHdt3DgnVi6+9kpQAgAACITCAAFd/gIAFHymA
Date:   Thu, 20 Jul 2023 19:10:20 +0000
Message-ID: <OS0PR01MB5922D604163A8486CC0726A4863EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230716154442.93908-1-biju.das.jz@bp.renesas.com>
        <20230716154442.93908-2-biju.das.jz@bp.renesas.com>
        <CAMuHMdUjF-_pX53xaEXJVP1Yvz-o=0bdHLx7ekqbqrGX7ygCLA@mail.gmail.com>
        <TYCPR01MB5933389C26B1C2FD6F35D97C863BA@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <20230717145623.473cffca@booty>
In-Reply-To: <20230717145623.473cffca@booty>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8618:EE_
x-ms-office365-filtering-correlation-id: 3d6a238f-2e51-4e3e-aa5a-08db8954f63e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: enTx7g1rLapMaoz1jjVtaFkcjQinqrcoYWtbyJt+F2X/AzlPj2L0LSU0D1w2xeOXGqMCs2noL05chKnUK1ypkwDr/lJBQRdWMjkjtj4W4HacbFQHune0WqlvHwYC6KN3VTfnvlJoErCWdCfi78AKJucUjLiaImGfdtMj3sTBeFxsyF0u/laG4WIl6U6t7qIOhmb6Acx5u+5RPD5k3XvdTErvbHqQlyAlrpeG09BA4vyrogJ13DFF6oypIOjEw+tvckgy9x/JedSrWn2W1AiMsxW0s+K/ebUdQX2FNFJ3WSMX7wI7/PyXVNCn/+pTtMCmkUjgNGdY0hvh6HF8wtcBIXdhfrZxSev9cJCsjstMoFjBbst2ZZUJ3h/H5fzjqZxNzaEoy89viIj9gJdlolcMM3CytgR7b0RIU+NsXEzUiIaaO+j+hYVdOqtTLH0idBcP++2K3e0gpS4gvd0lvK7J8MN1HU69/Z6csKdFXFJvKnq/5gM08Bp/+qNKwFqdldh3o/R2DowXtC5Jlz163hmHIWDYkLyTkcSlY3cNWCaHrsSVPyLNVbitc4GWdvZI2JfFx/yH8g/LYgBv7z8S/HPaOtUpeIi3DbWKp/wUbprIFUy+CHLs9POBZ8CWOPJvWAL+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199021)(52536014)(5660300002)(8676002)(8936002)(41300700001)(316002)(2906002)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(26005)(38070700005)(6506007)(53546011)(38100700002)(55016003)(83380400001)(86362001)(9686003)(54906003)(478600001)(7696005)(6916009)(4326008)(71200400001)(33656002)(122000001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHF3elVCc1NRVUxtUDU0eXp2WXA4S0d0UTJkTkxtcnN1R0NIUzllNGNONmgy?=
 =?utf-8?B?Uk1VR2ZNbDUzRmJIYkRtU05SaCtXTXBpckNSR2xYVndEVHlzeElobkFaRlVG?=
 =?utf-8?B?WCszck9ncGk0M1hrVDNnRm0vOFdSdGpNRU5sRmNsS3A1OVFkT09hVG5xUG80?=
 =?utf-8?B?ODY4WGlCQnI5ZUFUWTFSVmhWS3JxL0svbVhmeldqM1ZrbENlRHoyeXBnMG0x?=
 =?utf-8?B?QTNVSXpoZ2t5c1dSdGRzbGV5dEQ3eVZldzBkSTlNbFVKRWV0N08wamI4UkNQ?=
 =?utf-8?B?RDA5RDQ4U0VLUjhmY09BbndGUjlQN1RiR2VObkhXS1Z5THFoZzZaUng2Y2dl?=
 =?utf-8?B?blE4aHlPQ0RmcHRMQmpNOTVNK0hzLzRoS0JDaGRQSnJDUGh5enoxOFFaWllk?=
 =?utf-8?B?U3RXNUJTczBNdHcwbkpLYkFBR2hkUDBHdVc1V2E0bnB2aWMzQ1hLSDNPbnFh?=
 =?utf-8?B?NG9LbVRnV3JPeWV5YmVQMk1LYnBGOENWaGpLSmN0cWtGcVVUaS9XektWMFZ5?=
 =?utf-8?B?MGlheFdncVFNN1Y1K0NhWVZ6RzdvZWRGLzQyRzJldUF3NHA4OUhpcWdTbnBi?=
 =?utf-8?B?TEpmNndsMFdiZE5xMjROSDQvUHVCTTZYbUhncTZ1VU50UExDb3pkUjI2MHRZ?=
 =?utf-8?B?YkJnRlNtajdhcCtvQ3hqV1N4S0dJcWxqU0JVd3lXMU4yV2hBS0NZY2pNWFd4?=
 =?utf-8?B?ZjYwZVBob1BJOWYwYWxEeGU5OFArd3kzVG56NkhOL3RjTDZkT3NKTUhzR1ZZ?=
 =?utf-8?B?MERxa014dzJIQmxGR1B0YmpzY0M0VWJZelFNNkZqVmlySDlZbk1zZXlMOU9h?=
 =?utf-8?B?UysrR09yYmovazlva3VDbkZ4a1dUV0RwL2FwYUlXYkphRXZiUUFkWXl2L24x?=
 =?utf-8?B?eFFjVVZ5YzNaa2VwQ253REswWDFDWmx0SzFONUtPdnNwc1NnOGN1VjdXUDBj?=
 =?utf-8?B?OFcxRUt4UFNZWjd0bEJMZTFBTFpCbWhRSDY5aHIvR0pPNjltNUpaN3FOdGNm?=
 =?utf-8?B?VUkrdGhaRzQvWERiNFNyV1BzSlB3UVUzV0hWcXgvWkJ3U29RVGh6Ykl6b1o4?=
 =?utf-8?B?dHB1R0RjcFl1amNwSXJiTkZybTlOMUE0Y25Cdyt5M1NyUDRaazcrbVA2QWR4?=
 =?utf-8?B?cHNKSTN6RktaaFdXRUhXOXp1NjNUMDNaVWN3WGg2OEc2NEpiUXFSUENQVGJW?=
 =?utf-8?B?MzgvejRtVjdJY1h5SmVaUm9qaERyemhaNTBaZGlqQmlxYnlyNW1CU3ByVnpG?=
 =?utf-8?B?Q0Q2eWZMUkU3Z25TOVlERzdEcTRYYk5mTFRzL1B4WC9mS21QN1E3MDBSSkUw?=
 =?utf-8?B?eEpJREtrMnNWdE5nb0ZYV1EvL3l4cTA5SXpJZWU3bXhvQnRkQkhORTBkUUk0?=
 =?utf-8?B?bFcwMEN5TjFRMk1Fa2d6QjVaWVNLMEVSSWhqRktaT1gzMnNyRDA3ZGVtcUdM?=
 =?utf-8?B?TjRhRVNMYThvNjNoMFBWTHZDVHRUWjJUTUJrYmhFM294b2h3VUMrOC91eEk2?=
 =?utf-8?B?YXRFYi9ROGhpK0l0MUpQZTU2cFp5RjlobUJFWHZmR3c5Nk8rY3ZHN0toamRE?=
 =?utf-8?B?OG01OSt6Nk5LbTdyT3AvTXJMTnV2SGs1RUJqendhS3lQeCtCbVdBWFZObm1i?=
 =?utf-8?B?RjMraVJrT2Mxak0zNWhsZkl5ZWVhd1Z5Y0ZFdCtkNURLWTRnUGdpN0JvRzZH?=
 =?utf-8?B?ZDBNUUVVd3lIeW1zSUYyT3VQMWlvWnM0TDVUR1hMblp2RW0wQzJZUmxjOTAz?=
 =?utf-8?B?QTBqUnFOOHNReWtXS2d0ZkhGMFNtWmZQSVhGQS9ZS1lXUXZOc0hRSWhYT2RL?=
 =?utf-8?B?QkVnRWNiNk9xQkRDdU9mZ0pnenREdW5hSDhoRUlNYlM5LzN5T3FQZ1F1dGs1?=
 =?utf-8?B?a3JxSitzb3dKRjcvamRxS0IxaWNjSElRQS94aWNXODhlQ2xON1NMUm9FcHpm?=
 =?utf-8?B?eDJ3dTNsWWtXaWtQS2xwTldocm9VNTJJY0UyVWRvV3BSeSttTkFnMTROWk1x?=
 =?utf-8?B?UzMyczBoTWtNZVJJV1VpcWpLcEYyZHRSWVk1SG03aUVGK2JHSDYvK2NRWnZN?=
 =?utf-8?B?QnpWZVY1bTNFT1h6NWhjOW9IT2tORG1rNUFJeU9sa1gxZ3EyZzhVUkFmRmpq?=
 =?utf-8?B?MHE1aWhRSkhqR3dnemxpS0VnUXhHL2FwYytvSzUweFlSRkQwbUIxSFdWVjFx?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6a238f-2e51-4e3e-aa5a-08db8954f63e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 19:10:20.3994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V8bIvC2q+vnNYnCiP1qFi0xQoP2LTrn47WiTUO3UBklS7Jz5pzx4roojEceBmNKLesAmiXYhNmgqD0bpO8O6X1Ec39H0KnEQR/vLRuegC9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8618
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTHVjYSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGlu
LmNvbT4NCj4gU2VudDogTW9uZGF5LCBKdWx5IDE3LCAyMDIzIDE6NTYgUE0NCj4gVG86IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gQ2M6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnRAbGludXgtbTY4ay5vcmc+OyBNaWNoYWVsIFR1cnF1ZXR0ZQ0KPiA8bXR1cnF1ZXR0
ZUBiYXlsaWJyZS5jb20+OyBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+OyBsaW51eC0N
Cj4gY2xrQHZnZXIua2VybmVsLm9yZzsgR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT47IE1hcmVrDQo+IFZhc3V0IDxtYXJleEBkZW54LmRlPjsgQWxleGFuZGVyIEhl
bG1zIDxhbGV4YW5kZXIuaGVsbXMuanlAcmVuZXNhcy5jb20+Ow0KPiBQcmFiaGFrYXIgTWFoYWRl
diBMYWQgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT47IGxpbnV4LQ0K
PiByZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJd
IGNsazogdmM1OiBVc2UgaTJjX2dldF9tYXRjaF9kYXRhKCkgaW5zdGVhZCBvZg0KPiBkZXZpY2Vf
Z2V0X21hdGNoX2RhdGEoKQ0KPiANCj4gSGVsbG8gQmlqdSwNCj4gDQo+IE9uIE1vbiwgMTcgSnVs
IDIwMjMgMDc6NDY6MzQgKzAwMDANCj4gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gDQo+ID4gSGkgR2VlcnQsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBy
ZXZpZXcuDQo+ID4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBjbGs6IHZjNTogVXNl
IGkyY19nZXRfbWF0Y2hfZGF0YSgpIGluc3RlYWQNCj4gPiA+IG9mDQo+ID4gPiBkZXZpY2VfZ2V0
X21hdGNoX2RhdGEoKQ0KPiA+ID4NCj4gPiA+IEhpIEJpanUsDQo+ID4gPg0KPiA+ID4gT24gU3Vu
LCBKdWwgMTYsIDIwMjMgYXQgNTo0NOKAr1BNIEJpanUgRGFzDQo+ID4gPiA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+ID4gPiB3cm90ZToNCj4gPiA+ID4gVGhlIGRldmljZV9nZXRfbWF0
Y2hfZGF0YSgpLCBpcyB0byBnZXQgbWF0Y2ggZGF0YSBmb3IgZmlybXdhcmUNCj4gPiA+ID4gaW50
ZXJmYWNlcyBzdWNoIGFzIGp1c3QgT0YvQUNQSS4gVGhpcyBkcml2ZXIgaGFzIEkyQyBtYXRjaGlu
Zw0KPiA+ID4gPiB0YWJsZSBhcyB3ZWxsLiBVc2UNCj4gPiA+ID4gaTJjX2dldF9tYXRjaF9kYXRh
KCkgdG8gZ2V0IG1hdGNoIGRhdGEgZm9yIEkyQywgQUNQSSBhbmQgRFQtYmFzZWQNCj4gPiA+ID4g
bWF0Y2hpbmcuDQo+IA0KPiBHb29kIHBvaW50LCB0aGFua3MhDQo+IA0KPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL2Nsay9jbGstdmVyc2FjbG9jazUuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2Nsay9j
bGstdmVyc2FjbG9jazUuYw0KPiA+ID4gPiBAQCAtOTU2LDcgKzk1Niw5IEBAIHN0YXRpYyBpbnQg
dmM1X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50DQo+ID4gPiA+ICpjbGllbnQpDQo+ID4gPiA+DQo+
ID4gPiA+ICAgICAgICAgaTJjX3NldF9jbGllbnRkYXRhKGNsaWVudCwgdmM1KTsNCj4gPiA+ID4g
ICAgICAgICB2YzUtPmNsaWVudCA9IGNsaWVudDsNCj4gPiA+ID4gLSAgICAgICB2YzUtPmNoaXBf
aW5mbyA9IGRldmljZV9nZXRfbWF0Y2hfZGF0YSgmY2xpZW50LT5kZXYpOw0KPiA+ID4gPiArICAg
ICAgIHZjNS0+Y2hpcF9pbmZvID0gaTJjX2dldF9tYXRjaF9kYXRhKGNsaWVudCk7DQo+ID4gPiA+
ICsgICAgICAgaWYgKCF2YzUtPmNoaXBfaW5mbykNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJl
dHVybiAtRU5PREVWOw0KPiA+ID4NCj4gPiA+IENhbiB0aGlzIGFjdHVhbGx5IGhhcHBlbj8gQWxs
IHRhYmxlcyBoYXZlIGRhdGEgcG9pbnRlcnMuDQo+ID4NCj4gPiBJdCBpcyBub3QgbmVlZGVkLiBJ
IGp1c3Qgd2FudCB0byBhdm9pZCBwZW9wbGUgc2VuZGluZyBwYXRjaGVzIGFzIHRoaXMNCj4gPiBm
dW5jdGlvbiBjYW4gcmV0dXJuIE5VTEwsIHNvIGFkZCBhIGNoZWNrLg0KPiA+DQo+ID4gUGxlYXNl
IGxldCBtZSBrbm93LCB3aGV0aGVyIEkgc2hvdWxkIHJlbW92ZSB0aGlzPw0KPiA+IEkgYW0gaGFw
cHkgdG8gc2VuZCBWMiB0YWtpbmcgb3V0IHRoaXMgY2hlY2suDQo+IA0KPiBJIGNhbm5vdCBmb3Jl
c2VlIGFueSBzZW5zaWJsZSBmdXR1cmUgdXNlIGNhc2UgZm9yIGFkZGluZyBhbiBlbnRyeQ0KPiB3
aXRob3V0IGEgZGF0YSBwb2ludGVyIGFzIHRoZSB3aG9sZSBkcml2ZXIgaXMgbm93IGhlYXZpbHkg
YmFzZWQgb24gdGhpcw0KPiBkYXRhIHRvIGhhbmRsZSBzbyBtYW55IHZhcmlhbnRzLiBBbHNvLCB0
aGUgZXJyb3IgY2hlY2tpbmcgZGlkIG5vdCBleGlzdA0KPiBiZWZvcmUgYW5kIHRoZSBpMmMgbWF0
Y2ggdGFibGUgaXMgbm90IGludHJvZHVjaW5nIGFueXRoaW5nIG5ldyBpbiB0ZXJtcw0KPiBvZiAu
ZHJpdmVyX2RhdGEgdmFsdWVzLg0KPiANCj4gVGh1cyBJIHZvdGUgZm9yIG5vdCBhZGRpbmcgYW55
IGVycm9yIGNoZWNraW5nIGhlcmUuDQoNCk9LIHdpbGwgcmVtb3ZlIGVycm9yIGNoZWNraW5nIGlu
IG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0K
