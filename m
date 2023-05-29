Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6840A714B83
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 May 2023 16:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjE2OFf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 May 2023 10:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbjE2OFd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 May 2023 10:05:33 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C84AE41;
        Mon, 29 May 2023 07:05:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUNe3G0BGW43Mrmt3dJfcJF0Nt7n8OphmX33c10anKfzPkF68cxE8H2Ik8e6CPk4WPyQjl9ODRKh+1jLyCMpCrzuv0TK2Vs3o1WNSmlUrUHwaq7ggQWuOIV9Rw2Le+PXxGrvXTqd4ghX/yem46u0RlsuEk587v43i/fBUlGUyUjfdWVE8o6d5oDXixXWQc131SrC8FUjn4AxB50L5yzf7rHpgkTo9yjTDUUEcNk5wojE5XyLyj84XMRW/7OSid6pkKCNxUMl+kpCItPOnAfEy1IE0UPJVWOunoKuiRD0cnriDPQylVN39FsP+nPnLIe4gqJghvRgOrUVi+LKl344Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0J9UKPgeZjVokbvVzrj5M6+MmAnRPFLdWImMVIsH1h8=;
 b=ZlyJChuMjN/m5NnI2r57UnPfWRIKI4GbAFG8EiZpkGDY1BCkrPEhztOk7DEbocRjmkBAjRIQBQv2XWiCyt1qfh2mYRxAAZpxWR8Re5wSyrLFWMDVhAXd/VsZdk5mFVEE/9kZTThIOBYdoEE2cYsTU1gzN2jNXDBUyhwaeaBEZ2JtS3PLgKkrG7KA5p2aqO3qctrH+TuATE/cNvM5BT2LlakDVg5gmmkTy6Wqd7aVf6UlLZzkjleWB2gty9E01v8bBZj5D+adKiDPjllZBuOqTo/ivMw7hlIFreYMfM3BB6G6H1w3GJU7ODnZiVpDWmfhEPI1UM4uTiYD4Q7p99Pq5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0J9UKPgeZjVokbvVzrj5M6+MmAnRPFLdWImMVIsH1h8=;
 b=APqfvkxddWFEy/PLsZwX02fPOM9LsrOhMOb+emsW1F4tIjmpZimpiem14yIssje1RgjsNS7FqxLBBWx+qSS4FPVOouJTO9hSlQJDqfN8ReZ2x1TDz53LipNivAYmOXzojXHXGo2PqYhKpGWbcw0SGJFuEqqYf6Dp+80F0ZfVkfo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11556.jpnprd01.prod.outlook.com (2603:1096:400:379::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 14:04:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6433.020; Mon, 29 May 2023
 14:04:55 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v9 RESEND 2/5] dt-bindings: display: Document Renesas
 RZ/G2L DU bindings
Thread-Topic: [PATCH v9 RESEND 2/5] dt-bindings: display: Document Renesas
 RZ/G2L DU bindings
Thread-Index: AQHZfN4xQipznoOPxEa2mbk4gR1gk69xby6AgAAEA/A=
Date:   Mon, 29 May 2023 14:04:54 +0000
Message-ID: <OS0PR01MB59225A64CC522B2EF0D2EFF1864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230502100912.143114-1-biju.das.jz@bp.renesas.com>
 <20230502100912.143114-3-biju.das.jz@bp.renesas.com>
 <20230529134959.GA27467@pendragon.ideasonboard.com>
In-Reply-To: <20230529134959.GA27467@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11556:EE_
x-ms-office365-filtering-correlation-id: de9905bc-bd90-4d9c-34eb-08db604dadf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: We03ZGIYsPugSL7R2Frkfsfb8iUxr8FcopNM3hSgWta1dKMmiSQaLacKilu5c5NwDCqvINSIwaCb7aWM4wPTWJs43SCRKVvKyIQo18Ijqo60PV1bYtT+A3MkaHGyVvrQLlCYO1Z8Cf8FxGdQGAXIzt57ncAihBo5l4cYBKWUYhuopCDisTq9/b0NLr0sn9Nkj9MKQzxV0hSxrEC8TPg6uXrqPjf0sdblPEltUJpY77puPaz8a2gU24tpjx9nOKMejPaWLdyDU22ME4L5wNDdXx3dUbyDHZN6rMpLfzvwlRjn8nqSAAEnD8eBhGjHitsfSIuRgoqSSjEbphqCg1rP58srMA278UBIgZAG6+f9vBbCIFegOy8c5SUw18FCFcTnbC3jEdH8eU+d5i5VWoCj9N33Z2FNxpwkQxza7DV4P/+UdfFPzpHlJrfu74LuotQ6ZXW4aD5BYTL0bwcU/QnQtjyQyXxZwAiXssvWsj7InypA99wfIzaAsIzwkh6uoioauHs30iPHvHHhscLUC4LXJ8V2V/EiUAnTGqVfthnrzr65vG6XvmFnh/IEpTLyrN89PcAoVnI2VbLNSdVgo5p0JOIcCAc2P9swS72WcR/CyO+IuZeoVbwtXYciVxm9Yi4W
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(54906003)(71200400001)(478600001)(45080400002)(8676002)(8936002)(7416002)(5660300002)(52536014)(2906002)(38070700005)(33656002)(86362001)(64756008)(66446008)(6916009)(66946007)(76116006)(66476007)(122000001)(4326008)(66556008)(316002)(55016003)(38100700002)(41300700001)(26005)(186003)(83380400001)(9686003)(6506007)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aThVTW95TkpndHVURzl4TGNmREdjV3ExMkw5UmN5Rmo1UnBSTkExaWoyaHEz?=
 =?utf-8?B?Tk1JSGRFZ0JaTm1ub1RFYWpTQWhORlpHU2I3MStyU2tac3ZsMXRmcndoM3Nr?=
 =?utf-8?B?TGM3T0R2cW5EU2E5V01NR2NPdHM0K2lFVUpWRFdSVmJMOVA1NWQ5a3h4aWFN?=
 =?utf-8?B?aGJlY0FoMzZObndtZ25US2dwN3Q4NGZ0R0dNS21Jejc3TytoUGc0UEpMWG9O?=
 =?utf-8?B?QVkzK3ozN3Y0Y3MxMkh0T2NOYzBOVWVyTmVBczdhRTZjSEFZSnhOQ2k4TENL?=
 =?utf-8?B?YTBaZFRtTDdKQ0JPcmF0L0ZzVlBUVjlTeGtNOURzMm5xa3hMQ1M2ZFJHTGM0?=
 =?utf-8?B?NWs3QllZL1RJSmM4ck5XRkcwQXZvVjVSd0JpTnpPa2dqcms5VHhJTW1hUzhT?=
 =?utf-8?B?TStUVVZoTlI3dFZIUHhnYXpOa05QbFMzd0RpS1djMW5jdytrRndZK1NEdkE0?=
 =?utf-8?B?T3V1WCswZm1zcUJ6Y2N1aW9lY2h3Z3JBU2N6YmtESVFOREc3OFlmVVlETjlU?=
 =?utf-8?B?QUxBL2JFaGsrWlFBUEt6UHgrTjlZbXp2V2xRdTk5MlhOSTA0VzNOMm1FcVRC?=
 =?utf-8?B?N3pQdUJtUzlwSnpRT3pEYTJVTFZPYmhzTllwMy9GT3N2akdzSTZMa1htcXFS?=
 =?utf-8?B?WUJFbzVtZVlhVDNCRENnVnNNakxVczM4NzZsNXVqU1lQR0lma1FLR1N4SnVN?=
 =?utf-8?B?QmRzekRZTEVEVm1kM2x6MktCczZMUkFLNGpzektMbnF2eTdsQ1d1d1UyZjJV?=
 =?utf-8?B?VjVtS3Z6SXhmelRld01kakRHZXIzS1RDcmVLYXBtUEFKbThQN0tBUVdkREUz?=
 =?utf-8?B?UW9EazJmS0hWbm54NWVQc0k3elFJL0taUnJjalhLcWp0emowUlZZbW4wU3pv?=
 =?utf-8?B?emc4S2lmWHNFMW1NaytKeVJVL3dLUW9hOGVZRSsvNFlnY29icW9SVXpsOC9Z?=
 =?utf-8?B?ZEI2VVM1azNSYmNzcWpCMUplYXkvRFBURDFGWFRqQ3hkMVBtUHF0NDhJU2tM?=
 =?utf-8?B?NU5DU1lvZE9qbTRQWWx2UmkyY1RTRDdZSGt5N1QvNytvMWZRS2ZmeTVZN0t0?=
 =?utf-8?B?WEZwaDVqbjlsa0hPbkhzUXNVSktGTENHU0hVSkY5SzJyMHBuQk1NOGkyY2xX?=
 =?utf-8?B?Mk8xK0Nkc2FpK0tGbGdzYWZMOFBNdEliby9Remlib2NvU1Z1eVZza3RlTHlt?=
 =?utf-8?B?eVdPNy9ITU85akNQMDlJeUFIdEFENWJIOXRmUXplc2FjOGp1eW9QbG5IOUtx?=
 =?utf-8?B?RUhEcE1GTEtxbzBYSDNTSFMxUFRHR3g0UkhHTWxIaGhzR1MvTWpkSGIzazEv?=
 =?utf-8?B?R2ZPMnhZRHNtTGtxV3hrbTROd1RoUXdIcHpsbE5JbFkzQ1Y2N1JvNm9VTk1C?=
 =?utf-8?B?NWJvU001RFlGOWlIVFRBNlFLWW9zd2UwbmJ6dk1HRzhsSDlGdWlYZGlSWnhY?=
 =?utf-8?B?a01TMFhXSU5TOEJmVHhTSjN4MkhpdUl4ZDkxZjRKOE04QmxGcDRUd1VCTTFD?=
 =?utf-8?B?clpyV2pvUEVJelVoK0l2SGxCREc1VWRWT2NkR3prQ1BIS3pSblY1a3hXcEhH?=
 =?utf-8?B?bjJHMWszSFRYVElqZ3laTG5iem1PTGVmUm1qcGZWTThNTHdpZVllbEdXYkZX?=
 =?utf-8?B?WmdpYlVJOFdzNE4xYmh4dzVMdmRHODNxdkJFN3czWVhBd3NYSlg1cW5qSjAw?=
 =?utf-8?B?ZjFGYnJsYTlUTHRoSnkzRTRDVDZnTjM4dDlsSEFmLzBYMTFpd0RWSUx2RHlI?=
 =?utf-8?B?ZWpYMGtXYjkyS1lFaWlSYzh2MWdseGppRTdDWHBwenY0Y3ZXbFJ1NlQxbTh2?=
 =?utf-8?B?MzQ1U3VuNGt1VXNlME8wNDcyMXFuU1hrYVArK1V0QkJpdWcxejM2UVNZTUk4?=
 =?utf-8?B?ODZaWkdOS3FlVEFEcGYwVkdNQUovUWlvNzdDV1pickw4WjdjUjdIbkREeFA0?=
 =?utf-8?B?N3ZyRG1ZU1VkQlYram10Vmxvdno2Rm01R2ZJeHNFb0VHeUJtVXhPaXZnUG9z?=
 =?utf-8?B?MTgrcXJzc1FRcllSQlN1SHY3Umd1b0VBVVRiVUZBOTEwQm9RTEFBTlFZR05P?=
 =?utf-8?B?Sm5LeFRnbTRXRDBwSFd1MDYxUXhYQU41cU8wTzBPV2J4SVBLYlRyZ1JQRWNX?=
 =?utf-8?Q?8thr8GOzS9ieeirKKtzo3fI0+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de9905bc-bd90-4d9c-34eb-08db604dadf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 14:04:54.9856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WfyXppJc/nkgz5e4r8UsrdMDabHFrR8I93nl6IqgW3/nmeZcGNbwoQ4xpnsf0upVD+RxazONgdshPiO/BpIy5R5UNbTUVgnTRMGbsaxyj6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11556
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGF1cmVudCwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY5IFJFU0VORCAyLzVdIGR0LWJp
bmRpbmdzOiBkaXNwbGF5OiBEb2N1bWVudA0KPiBSZW5lc2FzIFJaL0cyTCBEVSBiaW5kaW5ncw0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24g
VHVlLCBNYXkgMDIsIDIwMjMgYXQgMTE6MDk6MDlBTSArMDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+
ID4gVGhlIFJaL0cyTCBMQ0QgY29udHJvbGxlciBpcyBjb21wb3NlZCBvZiBGcmFtZSBDb21wcmVz
c2lvbiBQcm9jZXNzb3INCj4gPiAoRkNQVkQpLCBWaWRlbyBTaWduYWwgUHJvY2Vzc29yIChWU1BE
KSwgYW5kIERpc3BsYXkgVW5pdCAoRFUpLg0KPiA+DQo+ID4gVGhlIERVIG1vZHVsZSBzdXBwb3J0
cyB0aGUgZm9sbG93aW5nIGhhcmR3YXJlIGZlYXR1cmVzIOKIkiBEaXNwbGF5DQo+ID4gUGFyYWxs
ZWwgSW50ZXJmYWNlIChEUEkpIGFuZCBNSVBJIExJTksgVmlkZW8gSW50ZXJmYWNlIOKIkiBEaXNw
bGF5DQo+ID4gdGltaW5nIG1hc3RlciDiiJIgR2VuZXJhdGVzIHZpZGVvIHRpbWluZ3Mg4oiSIFNl
bGVjdGluZyB0aGUgcG9sYXJpdHkgb2YNCj4gPiBvdXRwdXQgRENMSywgSFNZTkMsIFZTWU5DLCBh
bmQgREUg4oiSIFN1cHBvcnRzIFByb2dyZXNzaXZlIOKIkiBJbnB1dCBkYXRhDQo+ID4gZm9ybWF0
IChmcm9tIFZTUEQpOiBSR0I4ODgsIFJHQjY2NiDiiJIgT3V0cHV0IGRhdGEgZm9ybWF0OiBzYW1l
IGFzIElucHV0DQo+ID4gZGF0YSBmb3JtYXQg4oiSIFN1cHBvcnRpbmcgRnVsbCBIRCAoMTkyMCBw
aXhlbHMgeCAxMDgwIGxpbmVzKSBmb3INCj4gPiBNSVBJLURTSSBPdXRwdXQg4oiSIFN1cHBvcnRp
bmcgV1hHQSAoMTI4MCBwaXhlbHMgeCA4MDAgbGluZXMpIGZvcg0KPiA+IFBhcmFsbGVsIE91dHB1
dA0KPiA+DQo+ID4gVGhpcyBwYXRjaCBkb2N1bWVudCBEVSBtb2R1bGUgZm91bmQgb24gUlovRzJM
IExDREMuDQo+IA0KPiBzL2RvY3VtZW50L2RvY3VtZW50cyB0aGUvDQo+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdl
ZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gPiAtLS0NCj4gPiB2OC0+djk6
DQo+ID4gICogTm8gY2hhbmdlDQo+ID4gdjctPnY4Og0KPiA+ICAqIE5vIGNoYW5nZQ0KPiA+IHY2
LT52NzoNCj4gPiAgKiBObyBjaGFuZ2UNCj4gPiB2NS0+djY6DQo+ID4gICogTm8gY2hhbmdlLg0K
PiA+IHY0LT52NToNCj4gPiAgKiBBZGRlZCBSYiB0YWcgZnJvbSBSb2IuDQo+ID4gdjMtPnY0Og0K
PiA+ICAqIENoYW5nZWQgY29tcGF0aWJsZSBuYW1lIGZyb20NCj4gPiByZW5lc2FzLGR1LXI5YTA3
ZzA0NC0+cmVuZXNhcyxyOWEwN2cwNDQtZHUNCj4gPiAgKiBzdGFydGVkIHVzaW5nIHNhbWUgY29t
cGF0aWJsZSBmb3IgUlovRzJ7TCxMQ30NCj4gPiB2MzogTmV3IHBhdGNoDQo+ID4gLS0tDQo+ID4g
IC4uLi9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMscnpnMmwtZHUueWFtbCAgICB8IDEyNA0KPiAr
KysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyNCBpbnNlcnRpb25zKCsp
DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMscnpnMmwtZHUueWFtbA0KPiA+DQo+ID4gZGlmZiAtLWdp
dA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNh
cyxyemcybC1kdS55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9yZW5lc2FzLHJ6ZzJsLWR1LnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYWI5OWU3ZDU3YTdkDQo+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVz
YXMscnpnMmwtZHUueWFtbA0KPiA+IEBAIC0wLDAgKzEsMTI0IEBADQo+ID4gKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAxLjIN
Cj4gPiArLS0tDQo+ID4gKyRpZDoNCj4gPiAraHR0cHM6Ly9qcG4wMS5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZkZXZpDQo+ID4gK2NldHJlZS5vcmcl
MkZzY2hlbWFzJTJGZGlzcGxheSUyRnJlbmVzYXMlMkNyemcybC1kdS55YW1sJTIzJmRhdGE9MDUl
Nw0KPiA+ICtDMDElN0NiaWp1LmRhcy5qeiU0MGJwLnJlbmVzYXMuY29tJTdDNjAzMzllMmMxNTdk
NGIyODZjOTkwOGRiNjA0YmEwYjQNCj4gPiArJTdDNTNkODI1NzFkYTE5NDdlNDljYjQ2MjVhMTY2
YTRhMmElN0MwJTdDMCU3QzYzODIwOTY1MDE3Mzk1MDE5OCU3Q1VuDQo+ID4gK2tub3duJTdDVFdG
cGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFo
YQ0KPiA+ICtXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0MlN0Mmc2RhdGE9RXBiSmFwT2xZ
SnliZ0ptRFUlMkZtTUpaUTc1dlMNCj4gPiArRjh2NkdONXBoWFhsMCUyRkkwJTNEJnJlc2VydmVk
PTANCj4gPiArJHNjaGVtYToNCj4gPiAraHR0cHM6Ly9qcG4wMS5zYWZlbGlua3MucHJvdGVjdGlv
bi5vdXRsb29rLmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZkZXZpDQo+ID4gK2NldHJlZS5vcmclMkZt
ZXRhLXNjaGVtYXMlMkZjb3JlLnlhbWwlMjMmZGF0YT0wNSU3QzAxJTdDYmlqdS5kYXMuanolNA0K
PiA+ICswYnAucmVuZXNhcy5jb20lN0M2MDMzOWUyYzE1N2Q0YjI4NmM5OTA4ZGI2MDRiYTBiNCU3
QzUzZDgyNTcxZGExOTQ3ZTQNCj4gPiArOWNiNDYyNWExNjZhNGEyYSU3QzAlN0MwJTdDNjM4MjA5
NjUwMTczOTUwMTk4JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkDQo+ID4gKzhleUpXSWpvaU1DNHdM
akF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlNw0K
PiA+ICtDMzAwMCU3QyU3QyU3QyZzZGF0YT1YUndDeXZYYlIyNzR0a09CejZkM1FHZm10SUxLRWpn
VjVrZkNrNExqckFNJTNEJnINCj4gPiArZXNlcnZlZD0wDQo+ID4gKw0KPiA+ICt0aXRsZTogUmVu
ZXNhcyBSWi9HMkwgRGlzcGxheSBVbml0IChEVSkNCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0K
PiA+ICsgIC0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ICsgIC0g
TGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5j
b20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsgIFRoZXNlIERUIGJpbmRpbmdz
IGRlc2NyaWJlIHRoZSBEaXNwbGF5IFVuaXQgZW1iZWRkZWQgaW4gdGhlIFJlbmVzYXMNCj4gPiAr
UlovRzJMDQo+ID4gKyAgYW5kIFJaL1YyTCBTb0NzLg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoN
Cj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSByZW5lc2Fz
LHI5YTA3ZzA0NC1kdSAjIFJaL0cye0wsTEN9DQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAg
IG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBtYXhJdGVt
czogMQ0KPiA+ICsNCj4gPiArICBjbG9ja3M6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAg
LSBkZXNjcmlwdGlvbjogTWFpbiBjbG9jaw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBSZWdp
c3RlciBhY2Nlc3MgY2xvY2sNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogVmlkZW8gY2xvY2sN
Cj4gPiArDQo+ID4gKyAgY2xvY2stbmFtZXM6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAg
LSBjb25zdDogYWNsaw0KPiA+ICsgICAgICAtIGNvbnN0OiBwY2xrDQo+ID4gKyAgICAgIC0gY29u
c3Q6IHZjbGsNCj4gPiArDQo+ID4gKyAgcmVzZXRzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4g
PiArDQo+ID4gKyAgcG93ZXItZG9tYWluczoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0K
PiA+ICsgIHBvcnRzOg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVy
dGllcy9wb3J0cw0KPiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgVGhlIGNvbm5l
Y3Rpb25zIHRvIHRoZSBEVSBvdXRwdXQgdmlkZW8gcG9ydHMgYXJlIG1vZGVsZWQgdXNpbmcNCj4g
dGhlIE9GDQo+ID4gKyAgICAgIGdyYXBoIGJpbmRpbmdzIHNwZWNpZmllZCBpbg0KPiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3JhcGgudHh0Lg0KPiANCj4gVGhlIGZpbGUgaGFz
IG1vdmVkIHRvIGdyYXBoLnlhbWwgaW4gdGhlIGR0LXNjaGVtYSByZXBvLiBJJ2xsIGRyb3AgdGhl
DQo+IGxhc3QgcGFydCBvZiB0aGUgc2VudGVuY2UsIHN0YXJ0aW5nIHdpdGggInNwZWNpZmllZCBi
eSIuDQo+IA0KPiA+ICsgICAgICBUaGUgbnVtYmVyIG9mIHBvcnRzIGFuZCB0aGVpciBhc3NpZ25t
ZW50IGFyZSBtb2RlbC1kZXBlbmRlbnQuDQo+IEVhY2ggcG9ydA0KPiA+ICsgICAgICBzaGFsbCBo
YXZlIGEgc2luZ2xlIGVuZHBvaW50Lg0KPiA+ICsNCj4gPiArICAgIHBhdHRlcm5Qcm9wZXJ0aWVz
Og0KPiA+ICsgICAgICAiXnBvcnRAWzAtMV0kIjoNCj4gPiArICAgICAgICAkcmVmOiAvc2NoZW1h
cy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQNCj4gPiArICAgICAgICB1bmV2YWx1YXRlZFBy
b3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICsgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgIC0g
cG9ydEAwDQo+ID4gKw0KPiA+ICsgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+
ICsNCj4gPiArICByZW5lc2FzLHZzcHM6DQo+ID4gKyAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheSINCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsg
ICAgICBpdGVtczoNCj4gPiArICAgICAgICAtIGRlc2NyaXB0aW9uOiBwaGFuZGxlIHRvIFZTUCBp
bnN0YW5jZSB0aGF0IHNlcnZlcyB0aGUgRFUNCj4gY2hhbm5lbA0KPiA+ICsgICAgICAgIC0gZGVz
Y3JpcHRpb246IENoYW5uZWwgaW5kZXggaWRlbnRpZnlpbmcgdGhlIExJRiBpbnN0YW5jZSBpbg0K
PiB0aGF0IFZTUA0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgIEEgbGlzdCBvZiBw
aGFuZGxlIGFuZCBjaGFubmVsIGluZGV4IHR1cGxlcyB0byB0aGUgVlNQcyB0aGF0DQo+IGhhbmRs
ZSB0aGUNCj4gPiArICAgICAgbWVtb3J5IGludGVyZmFjZXMgZm9yIHRoZSBEVSBjaGFubmVscy4N
Cj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVn
DQo+ID4gKyAgLSBpbnRlcnJ1cHRzDQo+ID4gKyAgLSBjbG9ja3MNCj4gPiArICAtIGNsb2NrLW5h
bWVzDQo+ID4gKyAgLSByZXNldHMNCj4gPiArICAtIHBvd2VyLWRvbWFpbnMNCj4gPiArICAtIHBv
cnRzDQo+ID4gKyAgLSByZW5lc2FzLHZzcHMNCj4gPiArDQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0
aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgIyBSWi9HMkwgRFUNCj4g
PiArICAtIHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9yOWEwN2cwNDQt
Y3BnLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xs
ZXIvYXJtLWdpYy5oPg0KPiA+ICsNCj4gPiArICAgIGRpc3BsYXlAMTA4OTAwMDAgew0KPiA+ICsg
ICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwN2cwNDQtZHUiOw0KPiA+ICsgICAgICAg
IHJlZyA9IDwweDEwODkwMDAwIDB4MTAwMDA+Ow0KPiA+ICsgICAgICAgIGludGVycnVwdHMgPSA8
R0lDX1NQSSAxNTIgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gKyAgICAgICAgY2xvY2tzID0g
PCZjcGcgQ1BHX01PRCBSOUEwN0cwNDRfTENEQ19DTEtfQT4sDQo+ID4gKyAgICAgICAgICAgICAg
ICAgPCZjcGcgQ1BHX01PRCBSOUEwN0cwNDRfTENEQ19DTEtfUD4sDQo+ID4gKyAgICAgICAgICAg
ICAgICAgPCZjcGcgQ1BHX01PRCBSOUEwN0cwNDRfTENEQ19DTEtfRD47DQo+ID4gKyAgICAgICAg
Y2xvY2stbmFtZXMgPSAiYWNsayIsICJwY2xrIiwgInZjbGsiOw0KPiA+ICsgICAgICAgIHJlc2V0
cyA9IDwmY3BnIFI5QTA3RzA0NF9MQ0RDX1JFU0VUX04+Ow0KPiA+ICsgICAgICAgIHBvd2VyLWRv
bWFpbnMgPSA8JmNwZz47DQo+ID4gKw0KPiA+ICsgICAgICAgIHJlbmVzYXMsdnNwcyA9IDwmdnNw
ZDAgMD47DQo+ID4gKw0KPiA+ICsgICAgICAgIHBvcnRzIHsNCj4gPiArICAgICAgICAgICAgI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0K
PiA+ICsNCj4gPiArICAgICAgICAgICAgcG9ydEAwIHsNCj4gPiArICAgICAgICAgICAgICAgIHJl
ZyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgIGVuZHBvaW50IHsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmRzaTBfaW4+Ow0KPiA+ICsgICAgICAgICAg
ICAgICAgfTsNCj4gPiArICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAgcG9ydEAxIHsN
Cj4gPiArICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgIGVu
ZHBvaW50IHsNCj4gPiArICAgICAgICAgICAgICAgIH07DQo+IA0KPiBFbmRwb2ludHMgc2hvdWxk
bid0IGJlIGVtcHR5LCB5b3UgY2FuIGp1c3QgZHJvcCB0aGUgZW5kcG9pbnQgaGVyZS4NCj4gDQo+
IEknbGwgZml4IGFsbCB0aGlzIGxvY2FsbHkuDQoNClRoYW5rIHlvdS4NCg0KQ2hlZXJzLA0KQmlq
dQ0KDQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydA0KPiA8bGF1cmVudC5waW5j
aGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+IA0KPiA+ICsgICAgICAgICAgICB9Ow0K
PiA+ICsgICAgICAgIH07DQo+ID4gKyAgICB9Ow0KPiA+ICsNCj4gPiArLi4uDQo+IA0KPiAtLQ0K
PiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K
