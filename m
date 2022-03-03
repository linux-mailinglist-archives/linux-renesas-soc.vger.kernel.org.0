Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D6E4CBABD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 10:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbiCCJyM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 04:54:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbiCCJyK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 04:54:10 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5E4F145AC5;
        Thu,  3 Mar 2022 01:53:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7LhL1ZhoCosJ48ofeprCs4xcY64W0tzhlvjttLRbFOV7lxa9LZGjRPbiXHLbOCbOtRdOvy8N1DOhMhnLg1egxpToATF04vkqb5rRzUQi8RHEVKyHPsxBGEVnY+umVSHlMUEAIa4wwNwSFSOBgLtJoKvM0EQr0pIGyGqwP6wCOgzIDnCy7U7B5cSgjX5qfp+fep6rqDaHExuWCyZ0+ojo9cCiSUOKjG5iYlcCaQ2+TpU2KIMcdBZTVOXMRbgdeiRnLjnZpaa0k7fViwoW0gepBGo5IiR2F83lisks7mIjNprupsh9HASHubnCe7R/Wgzi81ieIMhYddmPuWg6Gs5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dvYY7mRWe1Yrf6oPFUWU1lJf2nFZwpCZgQd33gtZMQ=;
 b=ekx96KKXEPLFjLB2QgFujQ5D3NEApkdou91qyi3h+aGC7d02ryFQb9nCXa/rcydWXBkKJAnkMrRp4bFlp+oyr9pQdYLzNHCkU+mhLAxo9wDbJKSHoI+OjoZBifB6OkZGvaJcnRJOrehBd0GZlAI0bB/t6dQ4o7Ini2EXZ+3B8W4isLV278qAFlkQg6w/3JteaK+wFGb/7yyMx64N1q54VP5G8zMOC/jAiY2AduxKxj43ULIpt5VLL8l3H9+jOjSyxHPO0ChylnAbXPYODnHIVHHqW7Uet4kiWlQBM/NIbtszUQfRE4dVXMVWceyMiR41glleV+dqwQvyOzu2H5Sj6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+dvYY7mRWe1Yrf6oPFUWU1lJf2nFZwpCZgQd33gtZMQ=;
 b=vxKtaG/EKd8GZtwipJ8YJZPY5b1OAFTCrR99u0GgRqRmdGdRCR0gebLNOVmX6VoUWQhPKpHvAp7XtvGZDwIjAfB/rZOKiEsLWLylb+/eIfOW9NrUbKhFXQYTomMwXiUlQnhtV6DRvVHkVQxEMjbA8F/Ho76eSsN335oBL35zYGE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB5153.jpnprd01.prod.outlook.com (2603:1096:604:6b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Thu, 3 Mar
 2022 09:53:20 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 09:53:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] dt-bindings: serial: renesas,sci: Update compatible
 string for RZ/G2UL SoC
Thread-Topic: [PATCH 2/2] dt-bindings: serial: renesas,sci: Update compatible
 string for RZ/G2UL SoC
Thread-Index: AQHYLt0GxdAENj1IRU+g0GIU0w2p0KytXh8AgAAMYDA=
Date:   Thu, 3 Mar 2022 09:53:19 +0000
Message-ID: <OS0PR01MB5922D605643E8F52D15B069586049@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220303085934.29792-1-biju.das.jz@bp.renesas.com>
 <20220303085934.29792-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUD_jsZCh95O290y1OTz7Y9gHAcVZ6=Nm=k=1fAqPQJVw@mail.gmail.com>
In-Reply-To: <CAMuHMdUD_jsZCh95O290y1OTz7Y9gHAcVZ6=Nm=k=1fAqPQJVw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be927159-0f92-407d-b4f6-08d9fcfba60e
x-ms-traffictypediagnostic: OSAPR01MB5153:EE_
x-microsoft-antispam-prvs: <OSAPR01MB51533B4F6A62341DA561897386049@OSAPR01MB5153.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EK1kcYRA7YSZYWkyS8REsgMCtSAGgbrkgZCNWb27E2Fm6nGo4qsln2ovUodWTXKbmdt5bazoPkzq8ovatqJigCo4JyW0iWzqqkZkK2hWKKWcIC/8tdkJTm/nPqYSxkqGx0pAM3ZbAQRwu68X9Tc4276vBJwhRLusxMTymltRS7aTk6+PypvbG+HyeDOje6MIxyK5rG+OdP0SXKt/c+NZiT1wy9RWpRsI+TCrKzW/+cSBcihAhyeMaRDD3YCKzrR1CYlwzQk3W6X/SEnpI3LsmK1Y+7LgrmOAdbaQX9HTNiZn8+e9QIi/6GgW1tBylqSFoVOa0WEiNDps1zcsMOhqSrJoNDc/UH97uW5YKCLd7mBhJscoxt9giQHup7f+fE+av1tcxnrTLS5TBhLBtg7T8WGIw4FxAcMySNKDdVprJT5oqFC48lPgRHGM1MJDgsoWzevYVaab87/eNiPcxgdfZcy5STQxQzjMnQOI8boaCEnSTkuGaJsJbP14Pupo4QgDOEM5L6aTJ254anhQAb16R/vmkA2uHQXtsLDCUqWP6SLpT29Xe0qv0KWISe0MyWNKcsrmtCzD877pvurrowZGC9R2K9hmldiIn8sb+O70wQamYKrATz/NHEEPgIU/D/LEbMdsEAYOvV94En7URV1vezJdea6DgNq+kZOxZuNXWD2Hbue7mwsd7bNv66ol3M7IbhOJGR0R2ISRTeJEdeMWOg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(38100700002)(86362001)(83380400001)(38070700005)(5660300002)(2906002)(15650500001)(76116006)(66946007)(8676002)(66446008)(64756008)(8936002)(52536014)(66476007)(4326008)(66556008)(186003)(26005)(33656002)(6916009)(54906003)(71200400001)(508600001)(9686003)(7696005)(6506007)(316002)(53546011)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUJNYjBMQnBubTNnMjNNSC9rLzEvbm5oMVJ0ODVKWXFZQi8rOVZoNlVuNUxW?=
 =?utf-8?B?dVBZOVdHSnNBKzVpMER1Mll3b1FFOVVReldMTU5VOEJENmYyRTFoRDJ6SmFi?=
 =?utf-8?B?TnEwQVdzeXdIbVZPR1d4TVdNK3NrcWhsZUVrcDVKWm54c08vZFdCejAwaHBD?=
 =?utf-8?B?N0ZFUElTaVduVmJabHhiZWlOTHFUYVRFNXdUSFl1Y25wUktZVGlKRzBTY1g0?=
 =?utf-8?B?ZXhxOFJVaDdwbWVVc0wxTHJuUUpmNEVld1NYZkNBT3NMYUN1U3RpYmxCVC9t?=
 =?utf-8?B?emtMRzBSSDFwU2lEazBMVTVTZW5CZC9nbDAxNjNzTHozN1F0c3pjTUwrRVpX?=
 =?utf-8?B?NUplYXg0T3RWYnd1VUhDdDA3dW1rYTV1Z1k0T2tkdGR5cVBOSU1CelFraUZy?=
 =?utf-8?B?dHAzU1pDSUEwRzB1UlhCR2p3dGUyUEF0UUNMcUZKRDRabHp3ZERqa0kyVFFR?=
 =?utf-8?B?UHpvemdKUXZVMVRaVGlvdWRVU05HNUJGQ1hxb0lqQWIwSDQ4U0x6SnFqbWlW?=
 =?utf-8?B?dzJhWlpnOXlRdWNJendKWHpWSXI4b0lpNSs3NTZnSDQxdTdwWTRNMThKTEYz?=
 =?utf-8?B?ZHQ0R2xVQkdmTmV6SmtoYXJDQ1lyQUZKTTVEZ2ZINlNGWjh5M1FQMmYrUXdo?=
 =?utf-8?B?dXN0OTcrNGMvWHBuZ1FITVdldzlqTlg1RTlpWDFSajV6cTh5SUJaYlpxWWRh?=
 =?utf-8?B?dnNOT0MzU0JnY00xbkFHS3BzczJ0YTE4djUvTko3WHl6RDJMZ3JZK1g1Tzg3?=
 =?utf-8?B?bElmT29zUmdFMlc2YU0wU0JhbnJMeGc1WVlrMGp4cDVuRGRvTU1aeEg2ekxr?=
 =?utf-8?B?QW40d001YmlZeXNXaUdPZ0FsUzNhMm11TXNLeTZFUU55UFVZU3VzMnRlWFBP?=
 =?utf-8?B?UCs1MGxoaXhMTkxPNmhpNVFoYkVGMmRLRnA0NHpjMkpha3V5NDVNb2xyWjhI?=
 =?utf-8?B?T0tITzVWZVR6dlZ6aXNMcDhHYWJMTzhZZWVJNHMwVHpiMmwvdFZDdndFejlB?=
 =?utf-8?B?NnZUeENqWW05QmZjZ0NyTzVYQ2ZtMHpOVXhoNUhjZHlHV3huU2N5dFFIdjUy?=
 =?utf-8?B?YnNxajdmVXcyMExTSlpFWEV6L0dyZEExY1JaS1dZeDI3dTUwSzhTaUtEcFZk?=
 =?utf-8?B?TGR2dlNpeVZybDhEUHNXQVdLMWdnb3J6bFJTVnVQczQxZFZISjIwU0Y4QUJY?=
 =?utf-8?B?ZGNoMjB0L01ybjBKUlFNVnhlQS81eDZqK0JzanZPbi9qa3IxMjRtVjRFZG9r?=
 =?utf-8?B?TnpYdnVMUlRLMjRra0ZHcGJVK2xIS0JlRE5OZk95bnN6TXdXWGVxc0NzODRE?=
 =?utf-8?B?WkQwVktvUEg2RStRS3pCNzR6Q1NXUWppUjg3a3VDWC9SUERnY1orbFh6ZjFN?=
 =?utf-8?B?bUdpa3MwdU9TWk9rS2dPUEE4L1V6RWVQVVIyQW90QkV2OGhUS0x1SFBSaEcv?=
 =?utf-8?B?MENTMUZ4eGVrWlRiL2w5elhtRCtNaWRGdmM1ZkkxS3JQNkFzWDFONEVMMzE4?=
 =?utf-8?B?c3ZMWVNpNy9ka3V2d1ZuVjYxSGRLUmM4SFdyMWpxWVhuV09xSjdDQWVhWCtP?=
 =?utf-8?B?Y0hPQjNjb0g4aEtUQzZPZGlMU3dwd1hQZFlpdVRnNStWbDRMclU0SW9jRHlK?=
 =?utf-8?B?Ym9zeHpiMUgybjF3V3hBSFpHUDl5QkpLR3FkUU01OEU3VHZVZE1LaEdMQ0JJ?=
 =?utf-8?B?eStqU2pZYXF1VENZYldEMm1PbTdHalA1WHdpQ0xRenBMVXFHaGZyWUdvTFZF?=
 =?utf-8?B?TWo0aFFVSVZyd3RhVVNyRXJ1VTFsVG51UFQxQlJ3dTJZU0dMTE8zTmpCMDNY?=
 =?utf-8?B?VmZ0a29WWDZQTjZxcHZKaUpweUpuRzFMMGFUeHl6Z2xhMEgweHNsYVgxMklv?=
 =?utf-8?B?MVE4bWYxeGx5dTFmRzZwcEpROUZZUW5SbTFndUNYckQ2M0ZaYUw0K0I3bUYv?=
 =?utf-8?B?bmZjSmQraURwYmR1NDF2Z3JxaVVJZTNiZXdyMStrTGJXRXNPNjB4K3A5TUtJ?=
 =?utf-8?B?bkVyRUcxbXZoN1lpOUZqcjlwbVpsOXZxYWFFYXFicW9STTBJR3AwLzdJd2tR?=
 =?utf-8?B?Tk1nNTZ3UTJBa3A3M0taNW0xWVVkOXdaNVFEa1d4L1BhMnFDSkN6YzF4bVlH?=
 =?utf-8?B?MkFzSWZ2d2JDcTR2bklJWE9KQ3ZvdXRUYUdwYkZzRlR1YVBPeUVvazU2V0Vz?=
 =?utf-8?B?bHBPVWtxV1E5elJqaFBzUzF5MnBNaVAyYk1ONXltUDVJQ051eFUyU2lEdU13?=
 =?utf-8?B?bmdJd3JpM0dBdnl4bHB2VUJMU0RnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be927159-0f92-407d-b4f6-08d9fcfba60e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 09:53:20.1827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cU+58AMslf3yJRMz7NhdOaJyJhl6044U3iZ+I3OQTWF8pySQzRTuZxEiVMuM28mTZ79epetwLGtVrErCq+qR5amAZNjORRlTHx9HjxRNC2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB5153
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
UEFUQ0ggMi8yXSBkdC1iaW5kaW5nczogc2VyaWFsOiByZW5lc2FzLHNjaTogVXBkYXRlDQo+IGNv
bXBhdGlibGUgc3RyaW5nIGZvciBSWi9HMlVMIFNvQw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9u
IFRodSwgTWFyIDMsIDIwMjIgYXQgOTo1OSBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEJvdGggUlovRzJVTCBhbmQgUlovRml2ZSBTb0MncyBo
YXZlIFNvQyBJRCBzdGFydGluZyB3aXRoIFI5QTA3RzA0My4NCj4gPiBUbyBkaXN0aW5ndWlzaCBi
ZXR3ZWVuIHRoZW0gdXBkYXRlIHRoZSBjb21wYXRpYmxlIHN0cmluZyB0bw0KPiA+ICJyZW5lc2Fz
LHI5YTA3ZzA0M3Utc2NpIiBmb3IgUlovRzJVTCBTb0MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6
IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4N
Cj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9yZW5lc2FzLHNjaS55YW1sDQo+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9yZW5lc2FzLHNjaS55YW1s
DQo+ID4gQEAgLTE3LDcgKzE3LDcgQEAgcHJvcGVydGllczoNCj4gPiAgICAgIG9uZU9mOg0KPiA+
ICAgICAgICAtIGl0ZW1zOg0KPiA+ICAgICAgICAgICAgLSBlbnVtOg0KPiA+IC0gICAgICAgICAg
ICAgIC0gcmVuZXNhcyxyOWEwN2cwNDMtc2NpICAgICAjIFJaL0cyVUwNCj4gPiArICAgICAgICAg
ICAgICAtIHJlbmVzYXMscjlhMDdnMDQzdS1zY2kgICAgIyBSWi9HMlVMDQo+IA0KPiBJcyB0aGlz
IHJlYWxseSBuZWVkZWQ/IEFzIGZhciBhcyB3ZSBrbm93LCBSWi9GaXZlIGFuZCBSWi9HMlVMIGRv
IHVzZSB0aGUNCj4gc2FtZSBJL08gYmxvY2tzPw0KDQpPSywgSnVzdCB0aG91Z2h0IHRoZWlyIERF
VklEIGlzIGRpZmZlcmVudCBhbmQgdGhleSB1c2UgUklTQy1WIGluc3RlYWQgb2YgQVJNNjQuDQpJ
IGFncmVlIGl0IHVzZXMgaWRlbnRpY2FsIElQIGJsb2Nrcy4NCg0KTWF5IGJlIEkgY2FuIGRyb3Ag
dGhpcyBwYXRjaCwgaWYgaXQgaXMgbm90IHJlYWxseSBuZWVkZWQuIFBsZWFzZSBsZXQgbWUga25v
dy4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICAgICAgICAgICAgICAgIC0gcmVuZXNhcyxy
OWEwN2cwNDQtc2NpICAgICAjIFJaL0cye0wsTEN9DQo+ID4gICAgICAgICAgICAgICAgLSByZW5l
c2FzLHI5YTA3ZzA1NC1zY2kgICAgICMgUlovVjJMDQo+ID4gICAgICAgICAgICAtIGNvbnN0OiBy
ZW5lc2FzLHNjaSAgICAgICAgICAgICMgZ2VuZXJpYyBTQ0kgY29tcGF0aWJsZSBVQVJUDQo+IA0K
PiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0
DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4
IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29u
YWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBo
YWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkg
InByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
