Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B7C691EFC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 13:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbjBJMTq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 07:19:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjBJMTp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 07:19:45 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2123.outbound.protection.outlook.com [40.107.255.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C242595D;
        Fri, 10 Feb 2023 04:19:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jY170MInWlryvjkrYVsetLIT7FYWESrI98N92OAT+dG0tgt7IE6+NH9r0KWNP1JZPn8siJIUJexN7Z+W6I4xk3rjjJgEhcidiRitTm2aOE/iBRAbJ7Vw9soj3LlAnZYwrXhLj/h7UiOU5CWPTH7q9BlJVpWabNTp3gDlTHeIxsbLAPeYgf+BJ329PgVI8TkNNGRn91SuZM/nnb0tCTmGd8efX7NjyUJ08WScPXHWAfH14GLrwi8aq8pc5QoH2Qb4S2Mo3CFdPdmdRTBS8V68vnId2ZoE1270rnD0nyGTntK9vIevNg26pkcYDM88HNpI7eS7scjU2n+tn13gkA6rlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SspdvMx9m3uqArDRCVcObB9j4x3i+ylXnrGNt055H90=;
 b=SFta3U4qK3QglAJRSnCS5WHlhe5XN64kQWrpMEaHm2T/hjnBlngSejIr/sLQsHBdTfIEf2/eydKNyuOyVwbzPiZLOyQTR2LWqKNrBPTlCX/Yx3o13XFbUPAH5tmqASigfLY7HGd5DoBEXNPethkMXoJy6gkrvzF4z6fcO20eHQGmhMVIBGRvL5APwk+UFyfG0/6KQD0/XPGHYdsmVLOML4IkG4bwxrZCLmcv+QoWMd8fIFciNsSLIpLnRN4YU6FAVO4M0MH82LzL+LOpd1wlNBxyiZCRzRRELmsNO7flYIGYQM2gMvjlAOcvnjF0d622pfeP36gc8PSmpsaxpikxXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SspdvMx9m3uqArDRCVcObB9j4x3i+ylXnrGNt055H90=;
 b=MQoJraJb7fn9/POenhECjvqMSjRfUgJOfpAdSihvlhbQhq6jQF3D5jmu/EafPYsjcrvuLsBe2vjXfgtBwDn+gy7KPMRg1tauhqTlm2370W8MJ5EC4r/dxlRWZsPBmGNWv2Qyr3ryIVfClUIUIBB/IOkyOUjjupkOAlSqKgFZq/I=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSRPR01MB11420.jpnprd01.prod.outlook.com (2603:1096:604:22c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 12:19:40 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 12:19:40 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/3] serial: 8250_em: Use dev_err_probe()
Thread-Topic: [PATCH 2/3] serial: 8250_em: Use dev_err_probe()
Thread-Index: AQHZPIop4mjRMPuEbUOqHonFnNSGj67G5JaAgAE1xOA=
Date:   Fri, 10 Feb 2023 12:19:40 +0000
Message-ID: <OS0PR01MB59221B841E0E439F23E1127586DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
 <20230209132630.194947-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVbR4612RAN3h16iHwPr-1vLERfoEa4-=K3iqvueYn-Lg@mail.gmail.com>
In-Reply-To: <CAMuHMdVbR4612RAN3h16iHwPr-1vLERfoEa4-=K3iqvueYn-Lg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSRPR01MB11420:EE_
x-ms-office365-filtering-correlation-id: 667bce87-2c49-46cd-f5d8-08db0b61157c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZDgfQ6KAVMb1w0U3xKsZxV8mDPVIcJAVPWC5KXa/QXfwqu4eGVz78Kz2YZ/SCQ9qjRPvCJy8XkfNdcsnZR0yFDR17VN0rWFSIWXpbO59+D+EqPeg+2DrrdjUqaCZ5RvaQtnCUwBd2WVxMZ+vO6IETSsGAHX+GAiM8mADENpSwYaLwixY7XAP/E0h2HRULdhi5Od3DQlfDOugezobY2Wfx11QjJ3jNcPk9+k4BxBOZeIH/4HPdMWkT/jr8LhC+Lwiv++S/JgDUuFPVNLpO9yVp0af22JHXbo2h9GfMPnkZ6GsG6WCeLGYF1YMtXqm9on/ksbKtRFcxOZDA7PF5c4FXvLeXtb9DLKMT77Qs2fEfmip+e0d/3kk3ECJZ4YljnE1uVxx6jhhVYKowdqCvg9ilG4hRAadTM83fsqLZs4b+PaF138FW1IxeLJ4Ie1Tyyn+QiUtUQlLl3AZzUpm6ID4ZScQ1WpiKl44E0/I8KW88ALY3WaHb8adNcIIkmdObagioDW9FcXcpHJh6GB3mlBNlhwk2R3HMKc02BYsaa7HTAdkxaJESxDP7xbyPPQVBc/oaidsQu9lsy2fPi+Ui5cKhxx204l6gbtE0rVzpf+SL6FtKhz0fWdZrkeSQQvalT71I9SmfM8iZrIXmKVU1FZB6hWmbDIoyKyESnZdl1oDI2ZZ6lFfYFihIqygDsbGwvRFyfx7Ut/38kga9FQa+Ks6GQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199018)(122000001)(7696005)(86362001)(38100700002)(71200400001)(33656002)(316002)(55016003)(83380400001)(8676002)(6916009)(4326008)(52536014)(66946007)(8936002)(66556008)(66446008)(64756008)(66476007)(41300700001)(76116006)(5660300002)(54906003)(2906002)(38070700005)(9686003)(186003)(26005)(6506007)(53546011)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm1INXJwSTZneVNJT1FWdWQ5Mis1K2FkT01BVjl1WUJIYVZHUWFGVHVkLzNo?=
 =?utf-8?B?Z1NhUHZNTVhLVW51SG5IdDhnRWNmY01DaEJPT1Y5eDN2cU1UaWNMUDVYQmRD?=
 =?utf-8?B?OXVoVGdiRGR6SEs3bFNNaldqS1Fxc1JiV1d3T2pKOWxtaFNIdmZOc2V1MzRj?=
 =?utf-8?B?TFg0elN5RmlvQ0JVNU9GYlR2SkhLVUd0TTl5Q1l4UCs2SFR3QnBhQjE2WU5C?=
 =?utf-8?B?WjU2blBlajFZTmtzTHVieU43NlljeWhkajZzRGFoem85ajYrZUplUG9YSitJ?=
 =?utf-8?B?TVAzTnVVQmo4bFhtWE5iSVFJUCtNeElHNVRLbDhFdHEwVjZrZGduSHNuYS9W?=
 =?utf-8?B?VG1nS3BKSis4WGtEYU9pNXRhZzl5akVMUWlzU1VvWDdOR29XNHh2c2lVWm03?=
 =?utf-8?B?SUdGZ3M4TVZiWERxcWtXd0FaL2hzb29tWmFKb0dCa3RVbTVWVlZja1QxY0lF?=
 =?utf-8?B?RWlRd1hMNWIyZ2t2ZldaakVFVWZwSHdLdTJBOW83NWJ0MCt6UDZGbHFEM1lW?=
 =?utf-8?B?eUNuNG5aVDdEVzJMaGl2QUNQNVZMY00xZWNkV1RndFFiOXdGd0xoTkN3K2JS?=
 =?utf-8?B?QzU1bERBSGtCdmpiUVFLaTZKTFQwZy8rM0E3ZUloMVJVZVVWVmptNFU1RFFQ?=
 =?utf-8?B?ZENVcG1jMzkrbG4xa1lTN2RJZW4xRURoWVpVN1ArZ3lnN3UvUDRjem5pZnFk?=
 =?utf-8?B?UFB4UGxTRm5PMGs2UWlRUVZVS3gvcDZ5TkQyQWdTYllQSVBBMzNJUEgzTTRI?=
 =?utf-8?B?QnBMWEdBUU4va2dKWGhGZnBFY0hKaS9mMU9OVFowdnp2SlNadjZmcTRtd2d6?=
 =?utf-8?B?UnY1YWtCSUNDWWh0Q2EvR0dFRFd4TkpZMEhObTdMUWRwUVM2WGgyRWhORURX?=
 =?utf-8?B?N3hqVzROL3VSS0NFQjdLcnBSVitpSWVZK1R3aTJXWkR3bGR4L2FSaVUwWTBN?=
 =?utf-8?B?eEE2NytES21uWEVVZTk5N0hIK2VtRlQrTm1DYlJOSWdmb1F1TUNwaXRKOUtQ?=
 =?utf-8?B?MEM0b3pSSTRHR0xxOHlna2NIWWNsWnZrZVNhNnM2cUdYejJkWXk1ZmJSSHBM?=
 =?utf-8?B?Qkt4NXRWSll2RkZnZi94SytpVnBEa1lWSlphTFM4UjBLNFBpWnhlK2FYZjJp?=
 =?utf-8?B?TU9zcGFlc3R2YWxMVXd4MXNXVzVRaTU3Wk4ycm42Uzh5QzBWRVExalQzQ0NE?=
 =?utf-8?B?YzNJTy9lRXlkTy9JZHcwVktlcVdWNXlFTm9hZnFsUFJuZGJmeXN0d1NjZmVk?=
 =?utf-8?B?LzY5QmpCdHd6WnRHTWI4OWl0cCtiNm5GTEhXclhQYXFsTDkzekJPVDFCS2pr?=
 =?utf-8?B?OVZyaVY0YlJuOElqRy9Od2wvNHVBaDRRWlRpT1FCSkRFVzc1TDUvVXlzelky?=
 =?utf-8?B?dUFGZ3RVQlkzVWV3WG1lOGxPV01kbkZuVEtMOG8wZEF4UVJTVFlkT2xHTUE5?=
 =?utf-8?B?V1IrQUJlaTlYdGN1YkdEUkxESGIreEIxS2pBZ3hQMVFEWDRzeGNYemlMUmhH?=
 =?utf-8?B?aTBBZDVOcFAzMVpmelNNay9pMTJITjAzNys1dkUwRE5WdTV1dU1yWUs4Rjhh?=
 =?utf-8?B?MVVmYXVlejF2OWJIQXNnNWdJY3BNNTBhNkgvQzNvUXZkS0FYczRsYWFaVFl4?=
 =?utf-8?B?cThvMm5jcXpnbEUyUlNkT0YzWmd1STlaTVcwbzFVVEJZOVZlc2w2RVFzUFRH?=
 =?utf-8?B?M1FwYUhSSGVTTEZHbytpZnRiYWI5THo5QTBPYnFnRWdjK3lMeFZxOE9pb3pp?=
 =?utf-8?B?em1jQnZvRzJrQWhQZHpzdC95ZVFjdndudTFFcTRlVUUzbkpaZzZkMG5qaHhM?=
 =?utf-8?B?UzVYZ2lRZngxanpvMDNaZkg3aDZKNEliNkU0Wk1tWmZQVlJNSno0d2pCL2tT?=
 =?utf-8?B?Snk5OEpQVkg4SldVcVNWaWx1OFlXNDlxNXI5aUlXcmtRUHNvaUxjOXFKNzN1?=
 =?utf-8?B?Y2pmSWI0MVh3OU1oVUM3alJTNllKanR6dldWSHJHalo3OWlmeThDNHN6Sito?=
 =?utf-8?B?bGY3TWVEOWpOTUZyNXFJa1lFbUY5OW4vVWtxKzJSaWJEWVBZTkJSRzZxTWpk?=
 =?utf-8?B?M2k1dTBWT2x5N2Z2SGIwN3dQMzNpUTJzcDkyZ1JTZEhzWUd0Q1dpeDJWUjM5?=
 =?utf-8?B?amhFSzU0NHVuZ0YxeDNBRGRTQkxoU3JOWGNOQ2pEVDlnU2poUlFsaXJremVq?=
 =?utf-8?B?VWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667bce87-2c49-46cd-f5d8-08db0b61157c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 12:19:40.2676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1rxOD9DbLb9zl//mVMk7QfRjzbn+KtwOggR68aZsoor/K0JgraBo1JTia0IZPnm9L7RhY7sStCRe+bmTJ1tDjO0Lveke78xjFxZNLDx8gmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11420
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMi8zXSBzZXJpYWw6IDgyNTBfZW06IFVzZSBkZXZfZXJyX3Byb2JlKCkNCj4gDQo+IEhp
IEJpanUsDQo+IA0KPiBPbiBUaHUsIEZlYiA5LCAyMDIzIGF0IDI6MjYgUE0gQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIHNpbXBsaWZ5
IHByb2JlKCkgZnVuY3Rpb24gYnkgdXNpbmcgZGV2X2Vycl9wcm9iZSgpIGluc3RlYWQNCj4gPiBv
ZiBkZXZfZXJyIGluIHByb2JlKCkuDQo+ID4NCj4gPiBXaGlsZSBhdCBpdCwgcmVtb3ZlIHRoZSB1
bnVzZWQgaGVhZGVyIGZpbGUgc2xhYi5oIGFuZCBhZGRlZCBhIGxvY2FsDQo+ID4gdmFyaWFibGUg
J2RldicgdG8gcmVwbGFjZSAnJnBkZXYtPmRldicgaW4gcHJvYmUoKS4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRo
YW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsLzgy
NTAvODI1MF9lbS5jDQo+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9lbS5j
DQo+ID4gQEAgLTEzLDcgKzEzLDYgQEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3NlcmlhbF9yZWcu
aD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiA+ICAjaW5jbHVk
ZSA8bGludXgvY2xrLmg+DQo+ID4gLSNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ID4NCj4gPiAg
I2luY2x1ZGUgIjgyNTAuaCINCj4gPg0KPiA+IEBAIC03OSw2ICs3OCw3IEBAIHN0YXRpYyB2b2lk
IHNlcmlhbDgyNTBfZW1fc2VyaWFsX2RsX3dyaXRlKHN0cnVjdA0KPiA+IHVhcnRfODI1MF9wb3J0
ICp1cCwgaW50IHZhbHVlKSAgc3RhdGljIGludCBzZXJpYWw4MjUwX2VtX3Byb2JlKHN0cnVjdA0K
PiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikgIHsNCj4gPiAgICAgICAgIHN0cnVjdCBzZXJpYWw4
MjUwX2VtX3ByaXYgKnByaXY7DQo+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRl
di0+ZGV2Ow0KPiA+ICAgICAgICAgc3RydWN0IHVhcnRfODI1MF9wb3J0IHVwOw0KPiA+ICAgICAg
ICAgc3RydWN0IHJlc291cmNlICpyZWdzOw0KPiA+ICAgICAgICAgaW50IGlycSwgcmV0Ow0KPiA+
IEBAIC04OCwyNyArODgsMjMgQEAgc3RhdGljIGludCBzZXJpYWw4MjUwX2VtX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBp
cnE7DQo+ID4NCj4gPiAgICAgICAgIHJlZ3MgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwg
SU9SRVNPVVJDRV9NRU0sIDApOw0KPiA+IC0gICAgICAgaWYgKCFyZWdzKSB7DQo+ID4gLSAgICAg
ICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgIm1pc3NpbmcgcmVnaXN0ZXJzXG4iKTsNCj4g
PiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gLSAgICAgICB9DQo+ID4gKyAg
ICAgICBpZiAoIXJlZ3MpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2Jl
KGRldiwgLUVJTlZBTCwgIm1pc3NpbmcNCj4gPiArIHJlZ2lzdGVyc1xuIik7DQo+ID4NCj4gPiAt
ICAgICAgIHByaXYgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpwcml2KSwgR0ZQ
X0tFUk5FTCk7DQo+ID4gKyAgICAgICBwcml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpw
cml2KSwgR0ZQX0tFUk5FTCk7DQo+ID4gICAgICAgICBpZiAoIXByaXYpDQo+ID4gICAgICAgICAg
ICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+DQo+ID4gICAgICAgICBwcml2LT5zY2xrID0gZGV2
bV9jbGtfZ2V0KCZwZGV2LT5kZXYsICJzY2xrIik7DQo+IA0KPiBPbmUgbWlzc2VkIG9wcG9ydHVu
aXR5IHRvIHVzZSAiZGV2Ii4NCg0KQWdyZWVkLg0KDQo+IEFuZCB0byB1c2UgdGhlIG5ldyBkZXZt
X2Nsa19nZXRfZW5hYmxlZCgpIDstKQ0KDQpPSywgd2lsbCBkbyBhcyBpdCB3aWxsIHNpbXBsaWZ5
IGNsayBoYW5kbGluZyBpbiBwcm9iZSgpDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiAtICAg
ICAgIGlmIChJU19FUlIocHJpdi0+c2NsaykpIHsNCj4gPiAtICAgICAgICAgICAgICAgZGV2X2Vy
cigmcGRldi0+ZGV2LCAidW5hYmxlIHRvIGdldCBjbG9ja1xuIik7DQo+ID4gLSAgICAgICAgICAg
ICAgIHJldHVybiBQVFJfRVJSKHByaXYtPnNjbGspOw0KPiA+IC0gICAgICAgfQ0KPiA+ICsgICAg
ICAgaWYgKElTX0VSUihwcml2LT5zY2xrKSkNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGRl
dl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHByaXYtPnNjbGspLCAidW5hYmxlDQo+ID4gKyB0byBn
ZXQgY2xvY2tcbiIpOw0KPiA+DQo+ID4gICAgICAgICBtZW1zZXQoJnVwLCAwLCBzaXplb2YodXAp
KTsNCj4gPiAgICAgICAgIHVwLnBvcnQubWFwYmFzZSA9IHJlZ3MtPnN0YXJ0Ow0KPiA+ICAgICAg
ICAgdXAucG9ydC5pcnEgPSBpcnE7DQo+ID4gICAgICAgICB1cC5wb3J0LnR5cGUgPSBQT1JUX1VO
S05PV047DQo+ID4gICAgICAgICB1cC5wb3J0LmZsYWdzID0gVVBGX0JPT1RfQVVUT0NPTkYgfCBV
UEZfRklYRURfUE9SVCB8IFVQRl9JT1JFTUFQOw0KPiA+IC0gICAgICAgdXAucG9ydC5kZXYgPSAm
cGRldi0+ZGV2Ow0KPiA+ICsgICAgICAgdXAucG9ydC5kZXYgPSBkZXY7DQo+ID4gICAgICAgICB1
cC5wb3J0LnByaXZhdGVfZGF0YSA9IHByaXY7DQo+ID4NCj4gPiAgICAgICAgIGNsa19wcmVwYXJl
X2VuYWJsZShwcml2LT5zY2xrKTsgQEAgLTEyMiw5ICsxMTgsOCBAQCBzdGF0aWMgaW50DQo+ID4g
c2VyaWFsODI1MF9lbV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+DQo+
ID4gICAgICAgICByZXQgPSBzZXJpYWw4MjUwX3JlZ2lzdGVyXzgyNTBfcG9ydCgmdXApOw0KPiA+
ICAgICAgICAgaWYgKHJldCA8IDApIHsNCj4gPiAtICAgICAgICAgICAgICAgZGV2X2VycigmcGRl
di0+ZGV2LCAidW5hYmxlIHRvIHJlZ2lzdGVyIDgyNTAgcG9ydFxuIik7DQo+ID4gICAgICAgICAg
ICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5zY2xrKTsNCj4gPiAtICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJv
YmUoZGV2LCByZXQsICJ1bmFibGUgdG8gcmVnaXN0ZXINCj4gPiArIDgyNTAgcG9ydFxuIik7DQo+
ID4gICAgICAgICB9DQo+ID4NCj4gPiAgICAgICAgIHByaXYtPmxpbmUgPSByZXQ7DQo+IA0KPiBB
cyB0aGUgcGF0Y2ggaXMgY29ycmVjdDoNCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4g
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0
YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlDQo+IHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMNCg==
