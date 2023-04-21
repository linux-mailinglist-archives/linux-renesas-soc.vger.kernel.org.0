Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8183F6EA521
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 09:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbjDUHpu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 03:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbjDUHpt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 03:45:49 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D643886BA;
        Fri, 21 Apr 2023 00:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fazy39kR7dEDvA+ex7mITxkMoeCWGM0dYsUsjyah4fHjsuPmMvOo8+vzFGmiSJEXPHhtv/k2Un0zSstlb+lWr/q2xhqswV3VBw23l9Plqtj5/FJ1ix2h+vHXqecT+tOwuvnBaXLC4DluDT6DiEze1qCc1Mk0Ndnd4ificydBeVbpQeyycTb3zKBItp4G20V22FNg7DGPPPg0jCkmiLk4HwQlMXKN1d+bKZsrDhbDuU36wRZqJrVvkF4C6Fi4W8iEPq0W6TT9Pvp5QZb+qhmiM53rZTo1rOzVy6sc+eFO22Wxma471RJEvBctm/q8NMGvuAFg8vvMC4OyergyhbeYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoSPjOoFO1BubISRTU6HnoNqnkawF9oNPKvZLGQ/Kvs=;
 b=OnnLYka9HqrWoHhYNckMWEaPw9tXNkB+KRu3z/Nx/UWN7C4bK3g8nOzK+Jupe64Kly+whLprFJpMdaTGpFvt13fEHWpDWufjQrRYHRYLxUNfqEE0oat1tLUqwJHKaTGM0PvH7eyVB1pwWCVrZIfHNDn0Ueejt1OipaRT5Dpe27u9mv9YdTusKKkxpOLblr9lJVAIaCftKznlVGzV4E8dheQTbFNkoUR/IbgsTf10j1d7yn5J0T44tsPz6aDNTpM1xj8BXfoB76k+aAsG6i+WRoN75XiJr06EHEeGmqivSzrcsfzw24QlVSNcdVSR+GPGssEOsyv9xqLw8Yl6QtMJ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoSPjOoFO1BubISRTU6HnoNqnkawF9oNPKvZLGQ/Kvs=;
 b=DQWYW4Hr6PnXXuINmwAnn4SQuQtxLH12sqwtK1TqTsXhxHhHC9zsSIfwzF0qxceDwWll7OBQOxAG1+rRmXS42nLWJCeCf6UJYsmr7vKDYZ2xAmYZbnBU2oRsrh1U1eZl/YC/+FR0wR5JTQKcH7W4ydR1WWuNJfAzbNn3/6zLq4s=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10278.jpnprd01.prod.outlook.com (2603:1096:400:1d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 07:45:43 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 07:45:43 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a
 counter using DT overlay
Thread-Topic: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a
 counter using DT overlay
Thread-Index: AQHZcQtLK6/JZK1zYUeFXuixSTqo8q80WqqAgAAATSCAABpUgIAAD/tggADeDICAAAMUMA==
Date:   Fri, 21 Apr 2023 07:45:43 +0000
Message-ID: <OS0PR01MB5922D327CD46A5BC183656F186609@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230417090159.191346-1-biju.das.jz@bp.renesas.com>
 <20230417090159.191346-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXQ9NLra76pknQ+ASNiRVK2RWSh2jG=Ub+tZpC6uiwK6g@mail.gmail.com>
 <OS0PR01MB59221C7EE8ECA83F1892360E86639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVeeOGethjtSCUKjM2S+bhueLW25HtcDpSAY0xQcWgB5Q@mail.gmail.com>
 <OS0PR01MB59225B62056AFA6FF70F1F3186639@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdV4LOsJf+bnb8XRQo5_1Mdby1EArSdnW2oY6t0_yR1Oug@mail.gmail.com>
In-Reply-To: <CAMuHMdV4LOsJf+bnb8XRQo5_1Mdby1EArSdnW2oY6t0_yR1Oug@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10278:EE_
x-ms-office365-filtering-correlation-id: 8531c558-4bd8-4b2d-b88d-08db423c6972
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IEyuT3FN29ehNffIQgPiJtzRCL4uA7LI/VTxH5pPye5EHgEGQSdAVGhzFG5QGOePEca9nr8qjiamqs4SEqkpFVnSbw8mOkWQ+VjntEa8sCUMkgDwJKO3czWsNo9F1W6fW29lUhWwLSAGVz2WZVfnKx7wt4UO+D/l6Zc2c2FeTj61VPIqYIjCA894TlroUVXBP1UtfvEgGSQC4wYHbMLvpOgSC9NpIUV2URQ5ghRJBYov5UHuMPndXP9pe5YYmWx19aPcRT9AOnvHU6zQ/evxgIe8U0APArb6fvPFqyZXmArnKgz4LuXUPMWj2kukGqzbUGsHg51yTh4GBv3DdBM8xFm0UJmaUN+NJ5gsGz2VUzXL/piNFltaHGGGkjf/jtXVyYFyxBZPbZHPaFFE3YwboBb1ZocrQuNYQynJMMF1zthxh8TMNh341OdFuxVThP5qMH5R/PWN+6kq4sw3pyz+fA6T3XQEnh9LQl+ioF1jmWjHr9i2Ax85dbe9jfAi6sNv0ydymNVHSFo+LbUmhNuu8x5VNcIJcnGevv1lzTWUKYd9587MEw/TrByPeFyu1Wf1ptDGuTf/0veHusCVlqJLk3BrY2iLzD1LZLY/EnUpLmcgdKQlqcIqZtrOI4OFrMe1WxV71/55vpvoU4QvJqVLLA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(451199021)(83380400001)(186003)(966005)(7696005)(107886003)(54906003)(478600001)(71200400001)(66556008)(76116006)(66946007)(38100700002)(66446008)(64756008)(66476007)(5660300002)(52536014)(8676002)(8936002)(122000001)(41300700001)(4326008)(6916009)(316002)(38070700005)(55016003)(53546011)(6506007)(2906002)(26005)(33656002)(9686003)(86362001)(9944002)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnN0WGN2Z3FhVHlHcmpvMjhMcWdXMEdDa282Y3M1eXRybjB3V09sZ09xZzdL?=
 =?utf-8?B?NVFhVWxoWEFlclMvaEZLZUYxaThib2hNV3BOVGllTlRSUWtNTDBLZTRmVDFo?=
 =?utf-8?B?OFpDWk94MDJoVGdlaGpEcGFRc0xEQkdncDcwQzlKSngwTHF2QXFxZm9iSTNp?=
 =?utf-8?B?M0lzZDdHSVRXQm12eEZrOUpOdUNrN1kwWC9JT2t6cVluZ1ZWelFIaXFzRFFn?=
 =?utf-8?B?SkVsQXlqTG5PMElTQlJ5Y3pQYTlLN29mMHJNa1RQaXpoNFpIendWRERoSlFp?=
 =?utf-8?B?a1BRMVY0RHpmcithU1F1dFZjV1dqVXBvdjB1QnJGMitvcW5vZ01nVjZqeDVJ?=
 =?utf-8?B?V0pxWEtEMmgwMHI3QnZNQlhET2ZDUHo3SlB1Qzl1eWFaUnRYbkJydjg0RWJ4?=
 =?utf-8?B?azBlaGpJQnV4TGFzeHJWUmdGaktyb1VuZjdSTVVseHkzVEUzenREU2loMDRk?=
 =?utf-8?B?WTkyZVprVFdxQjgraGRBLzI5aUJSYWdWUk53N1AwaVNsU0RNai9IRUFnUlBn?=
 =?utf-8?B?alhrS0p5dG96T05IaHdZV3hXNURRSFRqc0x2YzRzdjFOaGxLV0NXTk9LNDZp?=
 =?utf-8?B?N3g5Mm9lOHZNVlpWOHRtTzRncDdtU2tVNFpCNHVQOXhUTFgwcWNDYURnUVVa?=
 =?utf-8?B?bThTb3k3dmNPbDZzM1FWdnFid09oK0ZUaHppdE5iUlNvcGFoMTQwSnRZODF6?=
 =?utf-8?B?L0lUTUZyc01RcUV0S1pXUnc1cHJWN0NCbzVuY0pseHdBQ3ZHWFRXbDdDV3NY?=
 =?utf-8?B?dnVBd255L01jdGcvRVhjZE4vdGtKbm9tSWFnNjlQZjljMkJ1MERLSStCSHUx?=
 =?utf-8?B?elcxYTVtaUM0UWtxTHpQSU9haWE2NE5qNkRRNEduSWlkTWluWEFNSXhkSFNC?=
 =?utf-8?B?Yy9DL21qQ05wd1ByeTFIa1NFMG13QW9UR3o4NVNMenUwSGZ2QWUzN0Q0cWpV?=
 =?utf-8?B?UGkwVW02amJXRWhNRlRMdjJVYlZLR0xoN3lMWGZFa2tsdmVTRWtnUE1aKzJB?=
 =?utf-8?B?VUVwbW45SnJiMnFQSEliRVBvbHhRclFid1hYNUxTMTVMUzlpVU03WUo1c1Z0?=
 =?utf-8?B?SVBXdzBHS3JpRyt0U1VBUDZkYVp0OUpGVUNLVEtVSjZhUE52SnR5eFlpVElw?=
 =?utf-8?B?KytJSFhOMHBwRTByRThuYlprR29jekdvR0VRVTQ3SDZSQ0dpWUx4c3hab3ZI?=
 =?utf-8?B?blJCRTFvb2Q1Uks0eWdCRXByNlpnVEhuYjYxRFUrQkVKQk54b0hMQjRMcGJr?=
 =?utf-8?B?SnNkVUZlWE16NlNQL0wxV0tXTmVxSGxpQTdhSFRUb0RXRG1YQW9vV20wZURR?=
 =?utf-8?B?UDkvbVVzU01FQmd4R3ljOWZEaVdkelhjai9YU3NrclFObWQ2Ukw5WWx1NUQz?=
 =?utf-8?B?dkJmWkNUR1BjT0hMSlhPTWVSWFpsTnJZYjVUekhzblRtVG1NTTZrTXZ4UUor?=
 =?utf-8?B?YStFUW9mN3JET2plNzduVGFiaE1wUG1YQXdqSHJWVlgzK0pUamhtd1M1dVNo?=
 =?utf-8?B?QTdKcEhxdld4b1RkKzIwVDkxRVZ4SHI5Y0VPNFFIS3lzUTlmNWRRbzhOeUgx?=
 =?utf-8?B?di9oQmZoRU9BOGRHeDNCVm9YOG1rck1vMnltSTNCUDRYaVppcG5qdFgxVmk0?=
 =?utf-8?B?SkJRRGFNNkd1cFc1d0RrU2N1OTlhTGlvbVo5YUFuNE1icFZuV0ZBMmFzRmt2?=
 =?utf-8?B?N29QL1NMam0zNysrY3p3VENONnRibkRlbUhZUEVIQXZjZFZ1NkVRM3lGYlRJ?=
 =?utf-8?B?My9NSndOZkdmUGltWmp1eFBidlpMcWU4MVBjWmRwOWVQck00SlI0VDhGam5R?=
 =?utf-8?B?SXhXREZaV2NNSldSVzJMZVZHNjVRY0txd09YcWxPbzMrQVV0THFVR1M1Q1Fz?=
 =?utf-8?B?VU5CN0swZkpqNlBQenphSTFaeU1ONkdjNWkwcVNqSGcxZTVuOXdCTURFaENu?=
 =?utf-8?B?TFNBNkJtSW1Dei9yakV4NklCbWVXOUtxQkpKV0ZEMVRSa0RZWXRpKytrYWxk?=
 =?utf-8?B?UjFiUjkrV3dneWw2WGZ5SlR0WVorV09weTMwb010Ym1aa2MwSVVpSHBHU3lI?=
 =?utf-8?B?dHF1UVhkS2ZFYldrUjgvczhHeVhjRS9wZm9DYnRLaEczUWN2SWdKZGJKbDVY?=
 =?utf-8?Q?8z7WDBs9ltyo/kwUpNPBRmLzS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8531c558-4bd8-4b2d-b88d-08db423c6972
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 07:45:43.7304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NVg33pCPpjm5EjRD28Cx1EGbajQzQ1wTgGDJTrAo9+PDxby0p5uiW9DhPkluW/XqufLp4xmVBcG16aZB0dmxkmfwCpi5bYfXuYDwd88nduQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10278
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gPiA+ID4gPiBFbmFibGUgTVRVM2EgY291bnRlciB1c2luZyBEVCBvdmVy
bGF5DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBIaSBCaWp1LA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
T24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgMTE6MDLigK9BTSBCaWp1IERhcw0KPiA+ID4gPiA+IDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4gPiA+
IEVuYWJsZSBtdHUzIG5vZGUgdXNpbmcgZHQgb3ZlcmxheSBhbmQgZGlzYWJsZSBzY2lmMiBub2Rl
IGFuZA0KPiA+ID4gPiA+ID4gZGVsZXRlIHtzZDFfbXV4LHNkMV9tdXhfdWhzfSBub2RlcyBhcyB0
aGUgcGlucyBhcmUgc2hhcmVkIHdpdGgNCj4gPiA+ID4gPiA+IG10dTMgZXh0ZXJuYWwgY2xvY2sg
aW5wdXQgcGlucyBhbmQgWiBwaGFzZSBzaWduYWwoTVRJT0MxQSkuDQo+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiA+ID4NCj4gPiA+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ID4gPiA+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybC1zbWFyYy1wbW9kLmR0c28NCj4gPiA+
ID4gPiA+IEBAIC0wLDAgKzEsNDMgQEANCj4gPiA+ID4gPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMA0KPiA+ID4gPiA+ID4gKy8qDQo+ID4gPiA+ID4gPiArICogRGV2aWNl
IFRyZWUgU291cmNlIGZvciB0aGUgUlove0cyTCxWMkx9IFNNQVJDIEVWSyBQTU9EDQo+ID4gPiA+
ID4gPiArcGFydHMNCj4gPiA+ID4gPiA+ICsgKg0KPiA+ID4gPiA+ID4gKyAqIENvcHlyaWdodCAo
QykgMjAyMyBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAuDQo+ID4gPiA+ID4gPiArICovDQo+ID4g
PiA+ID4gPiArDQo+ID4gPiA+ID4gPiArL2R0cy12MS87DQo+ID4gPiA+ID4gPiArL3BsdWdpbi87
DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0
cmwvcnpnMmwtcGluY3RybC5oPg0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gKyZtdHUzIHsN
Cj4gPiA+ID4gPiA+ICsgICAgICAgcGluY3RybC0wID0gPCZtdHUzX3BpbnM+Ow0KPiA+ID4gPiA+
ID4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiA+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ID4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gPiA+ID4gPiArfTsNCj4gPiA+
ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsmcGluY3RybCB7DQo+ID4gPiA+ID4gPiArICAgICAgIG10
dTNfcGluczogbXR1MyB7DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgbXR1My16cGhhc2Ut
Y2xrIHsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBpbm11eCA9IDxSWkcy
TF9QT1JUX1BJTk1VWCgxOSwgMCwNCj4gPiA+ID4gPiA+ICszKT47IC8qIE1USU9DMUENCj4gPiA+
ID4gPiAqLw0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBVbmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nLCB0aGlzIHNpZ25hbCBpcyBub3QgYXZh
aWxhYmxlIG9uDQo+ID4gPiA+ID4gdGhlIFBNT0QgY29ubmVjdG9yPw0KPiA+ID4gPg0KPiA+ID4g
PiBZZXMsIGl0IGlzIG5vdCBhdmFpbGFibGUgb24gdGhlIFBNT0QgY29ubmVjdG9yLiBTRCBjYXJk
IGRldGVjdGlvbg0KPiA+ID4gPiBzaWduYWwsIGlzIG11eGVkIHdpdGggTVRJT0MxQSAoWiBQaGFz
ZSBzaWduYWwpLiBTbyBmb3IgY291bnRlciB1c2UNCj4gPiA+ID4gY2FzZSwgd2UgdXNlIGl0IGFz
IE1USU9DMUEgcGlucy4NCj4gPiA+DQo+ID4gPiBBcyB0aGUgc2lnbmFsIGlzIG5vdCBhdmFpbGFi
bGUgb24gdGhlIFBNT0QgY29ubmVjdG9yLCBjYW4ndCB5b3UganVzdA0KPiA+ID4gaWdub3JlIHRo
ZSBaIFBoYXNlIHNpZ25hbCwgYW5kIGtlZXAgdGhlIFNEIGNhcmQgQ0Qgc2lnbmFsIGF2YWlsYWJs
ZQ0KPiBpbnN0ZWFkPw0KPiA+DQo+ID4NCj4gPiBTb21lIGN1c3RvbWVycyBhcmUgdXNpbmcgWiBw
aGFzZSBzaWduYWwgaW4gdGhlaXIgcHJvZHVjdCB0byBjbGVhciB0aGUNCj4gY291bnRlci4NCj4g
PiBNYXliZSB3ZSBkZWZpbmUgYSBtYWNybyBpbiBvdmVybGF5LCBieSBkZWZhdWx0IFogcGhhc2Ug
c2lnbmFsIGlzIGRpc2FibGVkLg0KPiA+DQo+ID4gSXMgaXQgb2s/DQo+ID4NCj4gPiBOb3RlOi0N
Cj4gPiBJIHVzZSBTRCBjYXJkIHJlbW92YWwvaW5zZXJ0IHdoaWNoIGNoYW5nZXMgdGhlIFogcGhh
c2Ugc2lnbmFsIGxldmVsDQo+ID4gZm9yIGNsZWFyaW5nIHRoZSBjb3VudGVyLg0KPiANCj4gQWZ0
ZXIgZ2l2aW5nIHRoaXMgc29tZSBtb3JlIHRob3VnaHQsIEkgZG9uJ3QgdGhpbmsgdGhpcyBvdmVy
bGF5IGJlbG9uZ3MNCj4gdXBzdHJlYW06IGl0IGRvZXMgbm90IGp1c3QgZW5hYmxlIGhhcmR3YXJl
IHN1cHBvcnQsIGJ1dCBwcm92aWRlcyBhIHdheSB0bw0KPiB0ZXN0IGhhcmR3YXJlLCBieSByZWRl
ZmluaW5nIHRoZSBtZWFuaW5nIG9mIHNpZ25hbHMgb24gdGhlIFBNT0QgaW50ZXJmYWNlLg0KPiAN
Cg0KPiBEbyB5b3UgYWdyZWU/DQoNCkxpa2UgYW55IG90aGVyIFBNT0QgaW50ZXJmYWNlLCB3ZSBj
YW4gdGVzdCByZWFsIGNvdW50ZXIgZGV2aWNlIHdpdGggUE1PRCBpbnRlcmZhY2VbMV0NCg0KaHR0
cHM6Ly93d3cubW91c2VyLmNvLnVrL1Byb2R1Y3REZXRhaWwvQWxwcy1BbHBpbmUvRUMxMUUxNTI0
NEIyP3FzPW0wQkE1NDBoQlBmRHBVRWtEbUZWNUElM0QlM0QNCg0KSSBoYXZlIHVzZWQgdGhpcyBk
ZXZpY2UgZm9yIHRlc3RpbmcgYXMgd2VsbCwgbGF0ZXIgSSBzd2l0Y2hlZCB0byBncGlvcyBmb3Ig
Z2VuZXJhdGluZyBwaGFzZSBzaWduYWxzLg0KDQo+IA0KPiBJIGNhbiBhZGQgKGEgZnV0dXJlIHZl
cnNpb24gb2YpIHRoZSBvdmVybGF5IGZpbGUgKHdpdGhvdXQgdGhlIGJ1aWxkDQo+IGdsdWUpIHRv
IG15IHRvcGljL3JlbmVzYXMtb3ZlcmxheXMgYnJhbmNoWzFdLCB0aG91Z2guDQo+IA0KDQpXaXRo
b3V0IGFueSBoYXNzbGVzLCBpZiBhbnlvbmUgd2FudHMgdG8gdGVzdCBjb3VudGVyIGludGVyZmFj
ZSB1c2luZyBSWi97RzJMLEcyTEMsRzJVTCxGaXZlLCBWMkx9DQpTTUFSQyBFVksgdGhlbiBJIGFt
IG9rIGZvciBhZGRpbmcgaXQgdG8gdG9waWMvcmVuZXNhcy1vdmVybGF5cyBicmFuY2guDQoNCkkg
YmVsaWV2ZSB0aGUgY3VycmVudCBvdmVybGF5IHBhdGNoIHdpbGwgcHJvdmlkZSB0aGF0IGZsZXhp
YmlsaXR5Lg0KDQpDaGVlcnMsDQpCaWp1DQo=
