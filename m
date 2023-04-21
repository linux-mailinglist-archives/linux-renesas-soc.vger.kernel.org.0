Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71BB86EA8A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 12:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbjDUKzL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 06:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbjDUKzJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 06:55:09 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2298A69;
        Fri, 21 Apr 2023 03:55:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jUgs3n+/P+KyKo1Pb7vcrGhwnQm48nchZi1BlUp8Ual2pLMRLoS3xUfbxLx4eoT1urgUvTL7ccYZUJsIXIyZfECXgmIM42Oidw3h6Ja3GpHGR1p4ObyP0mJmEJlYSG9kDck0iDYMSML69JM6vu4BQSC8UT+CBfS6XstpHFwwSdEBrcNVG/ZS/2Rr+uQ8roq0hq8yvPWXEekDCmscY1Z2v3I8l5aJEvLUcsYjEnlObmUzfy0MZ/RVynD8wOrr0qPtsZCWfTuAYl8VV7wywYAj3jRgjrEB4jDhrk5HyUx7PwAwruT4fHDv8dB9pBQSx/J1c8WWPmLawYDdhAm2mcy6fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRIZh74H/WPy9R0wctx1sj4fGUgA2mUMlasj3ENk1RU=;
 b=YYleoPLqc5ouPp7WRHUrsDlSSYgRdskRGcQ1RBykFF0w7vnTvsjd5+rmsFW9tlgjprE+FJgtgiR2ekMng0uA4oifjNFNRNQoZ6Brg0WJr/CBq14iiKbzR+dTZis1ayOpq6OzC2JYc0j8u9A7ErtkfUYTEB677KTUYgyLS+LhYRONy7oQBci/sGtzVHzNUkKrOlSt2FgYePPcT1mNfXZ1DVbY6oW1VaqyufxB04EPD4XYdiNLlt2WPpTIUyYpjE4pkw+y9+d16sUk4hWyZ2z8HEfi2iCYICqtNGXrhiJcmX9EdYbdUiTQ7d4n9mS93WxtiZgkyITStozm9A2XLXmTww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRIZh74H/WPy9R0wctx1sj4fGUgA2mUMlasj3ENk1RU=;
 b=v54LB/EJOcC6LfjxToH5ltjyAsOgfy/MGdam6zh1sIMohkoVbpb3xQQwH2EXZZ/3c4MVZZcxmgDVUmzntr2220iF32j8eR85ByMplB62wZI7w7lwFQhZIfYLcAOETf01ZwlCiXaLBe/SzqlpH4hsBMuuI0m3nKl+HFMb1WamSwQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB10105.jpnprd01.prod.outlook.com (2603:1096:604:1e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 10:55:05 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 10:55:05 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 5/5] tty: serial: sh-sci: Fix end of transmission on
 SCI
Thread-Topic: [PATCH v4 5/5] tty: serial: sh-sci: Fix end of transmission on
 SCI
Thread-Index: AQHZbU46vLY3hndEL0KAfF75mCWnea81ko8AgAARyMA=
Date:   Fri, 21 Apr 2023 10:55:04 +0000
Message-ID: <OS0PR01MB59225DDBD14DC30FFABD909886609@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230412145053.114847-1-biju.das.jz@bp.renesas.com>
 <20230412145053.114847-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdUQ05U9oiepVJsShg8xFoHTD6M7XczQ2=Qce+pE+0RPag@mail.gmail.com>
In-Reply-To: <CAMuHMdUQ05U9oiepVJsShg8xFoHTD6M7XczQ2=Qce+pE+0RPag@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB10105:EE_
x-ms-office365-filtering-correlation-id: e9a3bf6c-a609-462a-852e-08db4256dd47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IGKGccdOP81xTFuxvjjQUB90vatFfbXeGFQ5sD3pueqiLUXMxX3PUcqklh7uk/Hhpsovz/FCc8AvPavk36wkqrmfr0tpB2XO26tTRlkOlyOMfTg+y1YjsFofBFamdEM4sSorKJRDN217OTWAZzX9k+QT/G++rMDvSXTLLGxnftk4gYUXTfxP1oq95o7jMhDqX4CrKfCKXDbG4xTqw3SJy7DDPyF2sstm5sPKG3tjjHdA7P4lvE31p+Vy6AANIV1RSX6+bRLJay9KG04Nm0Z/gMHJP+BEtVt5/jj5Ipc7R8ydoBgANy2uY53qm6KAr59HUiUHP+FL2gcSu5zMTdlWoq32bnXIAmNs/Y9j/aXOUsdGZATslM9pjfBCfKKKaaDPEyRzDSUvBt7Hr0PQmxH5yqbNz2wUQjHP0PaqyJjQT89zMEE8s42cIdv4Zm+htSu49DUIjf/lM020/QF5j2WKKYGJGNDsWkY4lfNqav/xmIbyHSBJ2u95ZBZUOyeyA6UhhtKmgXKldD/FZ1BaZJn4tT3HarmAPEMOoosKDpZB+QGMUs47/0p99yInA24ESGNexe789vdVd8y/ylqJF/zr9GSuOv1pJZdpRd45JCfs1ssgw9TIOFF9QcGf+A+yQpkc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199021)(83380400001)(186003)(7696005)(478600001)(54906003)(71200400001)(66556008)(76116006)(66946007)(38100700002)(66446008)(64756008)(66476007)(8676002)(8936002)(5660300002)(52536014)(122000001)(6916009)(4326008)(41300700001)(316002)(38070700005)(55016003)(26005)(9686003)(2906002)(6506007)(33656002)(53546011)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlJZOFlSREpVUkY2Yk1LRCs0VDcyZWxZV3Q2cEpHWW9FbmtTRHM5aDJTOWtl?=
 =?utf-8?B?ZTV0bFUzRjc4OUNTMWRtK1ZqMEVZYmNVTTI0cThabzN6Vk1hRlA1eEdDV01i?=
 =?utf-8?B?TG9DZzBFU08wTDhIc3FUaEY3cFM1N0V3SlEzTHhRQ2NYY0x1U0Vkd05SYVda?=
 =?utf-8?B?b3dqY2ViSE5haGllZjNPUFZ0R0g0emduVmhieGdndlprd1VjVUs0TGZBdFFn?=
 =?utf-8?B?NWdXYkRiYmRVZm5pVVorNzcwU09DV1JRTjB2WFNFZERmbENMNEZaSlRNd3g4?=
 =?utf-8?B?cnRHVUJ0Yk9hdWlkTXppN0FISEkrZjFLMXpOV3NjVGVscVd0cXdVbDdrK1pG?=
 =?utf-8?B?NlNBSUFKSHJFb240U0p4bnRtUnUvOWJhZkQ2U0N3WXl2ck1qbUdONXZnZ1Jw?=
 =?utf-8?B?TmJ3d2FlNE5GV1BKQ3oyZWU5UFo2Z0laclJKdGlDVHpVUmcwOGRzcFRiWXNE?=
 =?utf-8?B?bE41ZHhJRmprRytqZ3lpOFB5SkJ5T1JHSWFIaFlyckhSTS92L0ZVWDdjQ08y?=
 =?utf-8?B?TFpxWVhjbTlNMHFCN2lvMXlCRGsyRjE5Q013UmNicWpsQmxBdUViZXpZbzZS?=
 =?utf-8?B?UUgzUzhUUnNodEI4ZEVHem9zb2lBNmNBWHBrbVI5ZW5Ja3NEKzVseW5JeHRV?=
 =?utf-8?B?RUV5Sm1nOXZDRkJhdlJua2RsRkJLQVA3TzVEbk1BOHlJRk1xQm9Jb1R3OEZz?=
 =?utf-8?B?aWEyaEhNZnVmZjM4NCtVNlExeUowNVJaWmlQRE5LSkFib2I2NzZ2S3JtYmRC?=
 =?utf-8?B?ZGQwaG5NRkFKMlh4ZkYzN0RhcG93UFhGeFBQa2txblRycVB4WFRicTV1ZGU0?=
 =?utf-8?B?Q1BnZm1ETzg3ZU81L09Ia0dYemJOREVGbGRjbnkyTCtqdlJBUCtodEdvMXFU?=
 =?utf-8?B?MFkxWW44cmxUbjFDMTFTRGcxRytpY2xiVVVBM3dtTXZTWTh1ekpQS3grS0lv?=
 =?utf-8?B?cGtlT25hQUtZZ0h3MnJrUU44TEFPODhxVHg1TVZETXdpemRaRm4vbERJcU96?=
 =?utf-8?B?Rk1XMWtpcUQ0cjV6cTU5bllRQWtMU2J3dTZaTjJXa2V5cHE5U3F6bU54c0lL?=
 =?utf-8?B?Mk1yUmM0Ui9xZ3J5MkRSTkdMdUxXdWVIajJOWktldkVrTzFwWDlkRTRFZWV2?=
 =?utf-8?B?MGMzZ1ZUeXR5eWJMK2kyV1BLRjVCTSttb2ZyYkV4bHJUMDZCV3NGOVA4aHUw?=
 =?utf-8?B?UnR0RmlyVGVYU1FVZ3gvT0F3WWFyMVR4d1hyL3RQWWtRUkg3U1dDMXpCNHYw?=
 =?utf-8?B?UHdWMmI4OVRaUnc5RXVjeE5WeXhSamIydm5oKzlBNXJMQXEzbm1FdjhxYmQr?=
 =?utf-8?B?dW1XdVBGeVNUMVlXUk1QUmR1MGJrRmJ3cm1XNTZjWmc4TzNXZG1MTEp1c04y?=
 =?utf-8?B?RHdEWDI3QVVsNUVrWVBiOGVYVWliY2t2WVZTaWlxdDRGQURwckNRYkZQdW80?=
 =?utf-8?B?UVhKVjNhYTZHZ2wrVWZITVFyMmVSazEyaVAwQXZ5RHRMT2s2QXl5RHZmZmVV?=
 =?utf-8?B?RkppMTJZS1N6WjhCYUhpcG9UanhxY0JGVnM5SFNnTWdWWVJYTnY3dDkrZXNz?=
 =?utf-8?B?U1lDcGNRR0xvekNNV2lmczE4V3RYZU9vcXYzVWJ0Q3JVcnphNytWYWJqQ2wz?=
 =?utf-8?B?a0R6cXJnOFdFcTRPVlllTU9QRVl4VU55bzFBQzFPTWYxR2hXTjBFNkpqekp3?=
 =?utf-8?B?K09TRHU4SDZSZWtjc1BsNEp4VnE2S0ZDcDdRK3NtenV2YnQvQWdvcllFeUtY?=
 =?utf-8?B?OHpnbzlXemxoOEhGVnhFYjZWZ1NnaGN2YmRodTRlQzZJZzFKdG5lUlg2aEM4?=
 =?utf-8?B?cHB3cUxOY3dWRlRIakNHVnRNeUNSNzBjVDlZb3J5Mk93UTBEZjNNM2FRUGxF?=
 =?utf-8?B?SmxVSlpYZXE2RUNBbk9iVkUvbHZ2UTRNLzZlZ0h5WHZRSDQ4VG85WkZ4eDF2?=
 =?utf-8?B?bkZJWiszMEgwTExTK3o5bnRUSnBiTkJWTjE2V2ZvcHg3eFczc1l4KzNzYXFE?=
 =?utf-8?B?N0kyR1ppQmVGWTV5eWlVS3dWZFZ5M3FpdlRKejRqWTRZNUtMSmtyRE81Z1Ry?=
 =?utf-8?B?Vjl0anJtYjRvZ3QvbXNLUzhNTnhRT0l1SzBsTmZPNDMraFBRTkc4dTZRcEs1?=
 =?utf-8?B?Q0ZBR3RFNGpIOVFndWJZbENsdXBPdm9WclcwRk9PTHBCMldNS1o1S0NsS25W?=
 =?utf-8?B?SGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a3bf6c-a609-462a-852e-08db4256dd47
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 10:55:04.7923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t3sDOquQ0QGisiU9vdB6gFGKtMcNch0AxeyyLzjITNYjDCn5UTVwj9hrPvTAJD2e77CSWapBFWyvp+puYsw8mw17VPFYtPljW60WCgUVTp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10105
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBBcHJp
bCAyMSwgMjAyMyAxMDo1MCBBTQ0KPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz47IEppcmkgU2xhYnkNCj4gPGppcmlzbGFieUBrZXJuZWwub3JnPjsgWW9zaGlub3JpIFNh
dG8gPHlzYXRvQHVzZXJzLnNvdXJjZWZvcmdlLmpwPjsgbGludXgtDQo+IHNlcmlhbEB2Z2VyLmtl
cm5lbC5vcmc7IFByYWJoYWthciBNYWhhZGV2IExhZCA8cHJhYmhha2FyLm1haGFkZXYtDQo+IGxh
ZC5yakBicC5yZW5lc2FzLmNvbT47IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDUvNV0gdHR5OiBzZXJpYWw6IHNoLXNjaTogRml4IGVu
ZCBvZiB0cmFuc21pc3Npb24gb24NCj4gU0NJDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2Vk
LCBBcHIgMTIsIDIwMjMgYXQgNDo1MeKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4gd3JvdGU6DQo+ID4gV2UgbmVlZCB0byBzZXQgVEUgdG8gIjAiIChpLmUuLCBkaXNh
YmxlIHNlcmlhbCB0cmFuc21pc3Npb24pIHRvIGdldA0KPiA+IHRoZSBleHBlY3RlZCBiZWhhdmlv
ciBvZiB0aGUgZW5kIG9mIHNlcmlhbCB0cmFuc21pc3Npb24uDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2ku
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYw0KPiA+IEBAIC04NDcsNiAr
ODQ3LDExIEBAIHN0YXRpYyB2b2lkIHNjaV90cmFuc21pdF9jaGFycyhzdHJ1Y3QgdWFydF9wb3J0
DQo+ICpwb3J0KQ0KPiA+ICAgICAgICAgICAgICAgICB9IGVsc2UgaWYgKCF1YXJ0X2NpcmNfZW1w
dHkoeG1pdCkgJiYgIXN0b3BwZWQpIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBjID0g
eG1pdC0+YnVmW3htaXQtPnRhaWxdOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHhtaXQt
PnRhaWwgPSAoeG1pdC0+dGFpbCArIDEpICYNCj4gPiAoVUFSVF9YTUlUX1NJWkUgLSAxKTsNCj4g
PiArICAgICAgICAgICAgICAgfSBlbHNlIGlmIChwb3J0LT50eXBlID09IFBPUlRfU0NJICYmDQo+
IHVhcnRfY2lyY19lbXB0eSh4bWl0KSkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGN0
cmwgPSBzZXJpYWxfcG9ydF9pbihwb3J0LCBTQ1NDUik7DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgY3RybCAmPSB+U0NTQ1JfVEU7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc2Vy
aWFsX3BvcnRfb3V0KHBvcnQsIFNDU0NSLCBjdHJsKTsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm47DQo+IA0KPiBTbyBub3RoaW5nIGFmdGVyIHRoZSB3aGlsZSBsb29wIHNob3Vs
ZCBiZSBkb25lIGFueW1vcmU/DQo+IFdoYXQgYWJvdXQgY2xlYXJpbmcgU0NTQ1JfVEUgaW4gc2Np
X3N0b3BfdHgoKSAod2hpY2ggaXMgY2FsbGVkIGFmdGVyIHRoZQ0KPiB3aGlsZSBsb29wKSBpbnN0
ZWFkPw0KDQo+IA0KPiA+ICAgICAgICAgICAgICAgICB9IGVsc2Ugew0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICAgICAgICAgICAgICAgICB9DQo+IA0KPiBTbyBjb21i
aW5lZCB3aXRoIG15IGNvbW1lbnRzIG9uIHBhdGNoIDQvNSwgdGhhdCB3b3VsZCBiZWNvbWUNCj4g
DQo+IC0gICAgaWYgKHBvcnQtPnR5cGUgPT0gUE9SVF9TQ0kpDQo+ICsgICAgaWYgKHBvcnQtPnR5
cGUgPT0gUE9SVF9TQ0kpIHsNCj4gICAgICAgICAgICAgIGN0cmwgfD0gU0NTQ1JfVEVJRTsNCj4g
KyAgICAgICAgICAgIGN0cmwgJj0gflNDU0NSX1RFOw0KPiArICAgIH0NCj4gDQo+IGluIHNjaV9z
dG9wX3R4KCkuDQoNCkkgZ2V0IHN0cmF5IGNoYXJzIGF0IHRoZSBlbmQgYW5kIENhcnJpYWdlIHJl
dHVybiBub3QgaGFwcGVuaW5nLg0KDQpCYXNpY2FsbHkgdHggaXMgbm90IHdvcmtpbmcgYXMgZXhw
ZWN0ZWQuDQoNCkNoZWVycywNCkJpanUNCg==
