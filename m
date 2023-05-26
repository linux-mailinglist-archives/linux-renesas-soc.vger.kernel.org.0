Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2048712298
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 May 2023 10:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236628AbjEZIs1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 May 2023 04:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242790AbjEZIsQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 May 2023 04:48:16 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E25B399;
        Fri, 26 May 2023 01:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3YFIjb5UgZRuYBj17S7kG6qHdmhBrZ/seEOgVkpv73qgoG1FJfTJVra7j+WbDfiy5H4sSXCxGs/lrz9T1y1H0Zm/2fQQoymiNpleqmeZnJgNcgxGqW3RivMmC6TZQsMm88MYE+Lo3KcA4cCep1nWTa5Z3QwrGnQn8lF0i1B3Km2rvzZIXfSiWwk7EbfKcfPiTqWF39KLYklg+2r5OoTCvdAE8tioL4YuvcfsZMYq3gE9gSZbqYnbZfjOPDrc0yEpYitieYRJhjskgf+2/uktWGPO2iaGhRRj+UeTIldHhKDGHNhaH2QHlP5f2OE4Fz+ZZrDAtQUXVkACwTJ32mMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiBpb+t2K8Af7vGgjJDpGvunuHKARCZJwTwZjSF0lCw=;
 b=hifzj2QYbnNk/onEq37DvReR1KFkLIAAdfu2iawdpGOd09IWSLsB3iqcYHEGogtimuf+JbZ5U49s0v+NkFNyJuI9Bq8rF3ZzMtnjiBLkqxQsxPbT7JV6dt3d73W6GEIjsThu6QnZxT8MRpxXNVXWKaRbrPpk6zITZjN4eh17bMpihLUmfT3/FX1RkFomWE9JU7GKaWUhmLqO3mjMhJNoSEhSBwyHviPvF0aHssaP6wJ2QutuxZAjdBu5MzhOgUEKMIZk0hDSX8uJqe46uMgjLbiEKJOYnCW25jbVcEFybiR4zvBbvlGDx5LYrVwoOaTwxs+/jhIDTeVL+fniHAJ1Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiBpb+t2K8Af7vGgjJDpGvunuHKARCZJwTwZjSF0lCw=;
 b=OghVwh21B+iiJeq62bKPbapwRQfM9aH2/pfNuE96FwDzsKLWjSI/eMJHNZVTEZNdlezB0BNTf4KzwQywjnQy5Xwceyaiz9NX2lhvj8CVb0I587TdhAofv2Ncb5es6jobqJnsR5XvmMV/Jbj/NwBN4RrmuDNk2KcFfPT61sNuFLQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB7879.jpnprd01.prod.outlook.com (2603:1096:400:113::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 08:48:09 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 08:48:09 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v5 11/11] arm64: dts: renesas: rzg2l-smarc-som: Enable
 PMIC and built-in RTC
Thread-Topic: [PATCH v5 11/11] arm64: dts: renesas: rzg2l-smarc-som: Enable
 PMIC and built-in RTC
Thread-Index: AQHZjJbq58UsvZDZOkywW1Jn//zhyK9sNa8AgAAMVWA=
Date:   Fri, 26 May 2023 08:48:09 +0000
Message-ID: <OS0PR01MB592224D2211A629284FDC7C186479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-12-biju.das.jz@bp.renesas.com>
 <CAMuHMdWAkyHYhUfNLB-wkDeqmzAxARCcxqiBVYLdG_Udnj5bvA@mail.gmail.com>
In-Reply-To: <CAMuHMdWAkyHYhUfNLB-wkDeqmzAxARCcxqiBVYLdG_Udnj5bvA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYYPR01MB7879:EE_
x-ms-office365-filtering-correlation-id: 2dec1be7-3f68-48a2-e893-08db5dc5ee4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UHhvS2NFDyoi1gEXNz8WukQXzhYZY+fqDRK6Kr2ZoH5HSvJrXo3ej1Dr2KnO3QM89f/lmAwKQacaauoFELcqooavzdN5JoUo/5A0uZk7W6/Ug/6rNk84L18cvjO3soYkZpMKarRJqhg1l8WUJGjdPAwlkYSJ2qClsVww5VtTV/nzHNQzHW5nem8MtSdYWTP6JQOpxr2lwbILYAP25fJSRKNBzJgeWumhwNEOokoUU103wHUbBBDm817tE+dS36pKQk87cCVf+2U0/+Lrzd/1xBkWOuOZ9CSpigpwl976CZTU8R8yY+t77VjDMnWci59QYF0cfNzf3O/6eRWCq57UQxLQqIHyq9DvyBe5bwly+Y+4cPfMkPiveOFk+fRVzkyBkHFCY1/kIO3tQHHnzp8PPSFBIkELcerSAWC6CMK+ljThobqiv85Fmw6k9VNheEPCvK1x6bxW+5pQLBlabUyASZTSATWQbhzXrh+8waC/ftzTsLj+Av1WDu6X8zAgSt/nSrMQLAUSZwrrsgQqjwgbk/p9YFz0Yy8C+y5T5+hSho9w6BfA603vEm0Sc0N/M233
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199021)(52536014)(316002)(71200400001)(26005)(122000001)(6506007)(53546011)(9686003)(4326008)(6916009)(107886003)(66946007)(76116006)(64756008)(66556008)(66446008)(66476007)(966005)(38100700002)(55016003)(5660300002)(33656002)(41300700001)(8676002)(8936002)(7696005)(83380400001)(86362001)(478600001)(54906003)(186003)(2906002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkxFMllnSEJLWGlRWW1WNkxqUDcxdW9TWTB4a3NFVjhOZGtYbHVIRDVjRFVr?=
 =?utf-8?B?RTJNdGlZbGNoNXFlM0pNSy8xdG8rNnRDRXNQak1sanB4Nkw1UlBNYldrblRu?=
 =?utf-8?B?aWFXTXFmazRGVitUMFBHaU9PclFQbjZIanBiTWFneWlFcjdxdFV4aTJnNGRH?=
 =?utf-8?B?VXdyMGRLNitIUFlzL1VnVzNMMHhiOWxrb1NLZlpmd2VwdXR0RTl2UCtuLzd0?=
 =?utf-8?B?TWRQWFBRRlF3RnRrUkxnOVJHWUMwYU1uSmw2ZVhmblpRRVI0TU5DT0tzWUFQ?=
 =?utf-8?B?a2lUcXRORG1oSVUxMWc2eDJORzJneWJETWFyTzdQRkR5eVg3TXNsNmlua05i?=
 =?utf-8?B?Y2pxY2FOVHVaNStkbnZObW94MzhsM1huWmx5OVBkYzdoNkIzQkJ4VWtMZDAv?=
 =?utf-8?B?azhBakVxZVZOZ1BUb2J0akF4eDFKZmZPVVN5bE9vMld0QXkwYlZMTXlpOXFz?=
 =?utf-8?B?NzljaHlweWlrcm4yZEZ0R2FIall4QWtoaXpsb1FsTWNaQ0hFMzZlVVlOSUtH?=
 =?utf-8?B?VFVBT0FtdC9PYzNjWWpTMkIydUdETjI4NG9jT3h4RS94bEhvbml6R2Y2TGwx?=
 =?utf-8?B?UXlYT0s3TWdDZXN4eGduaFk0NUFqQnZqL1hCcDVVSE9LVWR3Q1k5QndaK2l4?=
 =?utf-8?B?UklJa3o1UlN3U05sOEE1ZlJ0U1EvTkV1SFFBem8zMWtCc0R2N016MktUR1Zk?=
 =?utf-8?B?THJwSTFISmtFL2FXM3B0Y1hDZ2U2b2tia0Y5OVJlQk82L01QVVAwMlJPNzhw?=
 =?utf-8?B?cncrVmpNOUZVVVkvOVpIRjZIdmJvbWtIbS9iQlZXV1E5R1BaMS9wNmt5Z1R3?=
 =?utf-8?B?QTA5b1VobnFReHU2TmVST1p3NWptTUZ6enl4TFZ3ZFFKTVU4ak5KSElFc0hu?=
 =?utf-8?B?Mmg3VFoxZWxIejIwMnlIV2Ezay9KMXEwUWZNRzNmY0NIVVF5bHFqcWxWZkxr?=
 =?utf-8?B?ZXRRS2NnZ2hmSkxadnVOY01pTmpXVW5DdHpwVDdLbCtZY05MVi9ocm0yQ3FS?=
 =?utf-8?B?UjhyMEwyZnduYXp3L1lBeXFUa0VrQjBBbzlETFcwblVuTmJleTVhNGNzaUlW?=
 =?utf-8?B?dmZUZUFWemNZVlUxbzlHMnB4cmFseGZXN1pLY1grRTdlcXdxTGpIVGwyeDRh?=
 =?utf-8?B?T2V4MEVPRVNsYU9BSkl6dGRCS1FqeEt5YjRSc0R4bnZ1WXAyNkpTOEp4UG1n?=
 =?utf-8?B?T1dYMjVrZnlLb1hJTzhaVndaMEk2TmpWcFhyNTc2UjlNeVBLQUF3dTc3aVhz?=
 =?utf-8?B?Y3pXMFFZL3V0Mmw1c1BvaTB4Q1FvQzhZT3pGMm5mYy9TaG10azl1dk9qQU5l?=
 =?utf-8?B?QWpJUlNmZDQ2Ymk2alNUSzRaU0hxMHNUZDJFK0Y5RXhaRVBrYmt5S2ZmWWR2?=
 =?utf-8?B?V0l5cHRaeTkrUi9MWklRVHo0VkdGbytTd1ZXejVTNWFiTjN2OGhxWEphUitw?=
 =?utf-8?B?cTB0Um16ZUxJVTM2ZGRZQXVxa21NNk16M1lodjJSUVlHRVZRWHpBcTFYQnJ4?=
 =?utf-8?B?Skwxcjhsdk0wTG5oQXV4Q0gvTFRKUTg1dUsyN1JOWVZJOWlOeVRGL1NMc2Rz?=
 =?utf-8?B?Yjc5UlBkeUQxY0I5UFhpK0ZRVC9McldxUENSbVpvMWpNTjNFbGRLRUdFb29t?=
 =?utf-8?B?OUxmTGRTVUVRV0szQkw3Skl1ODVGcTdpZ0V4M3J4cDl4V01lSVpCdGlOTEdo?=
 =?utf-8?B?V1Ywd3BVY0NmTXFkeUx1cDArWnRzVWZqNURtWHpvZ0hBRnVHN2NmY0xKeHZM?=
 =?utf-8?B?U3pjU1dyTTVRYWtIU1hvaDFIdHhPS0Zrbi9KcHF3VUN0eWlQR2tBa3BVd1ZK?=
 =?utf-8?B?WUY3RTgyTm9US1FTMTdwdUxXR3M5dE5DcFU2OXVjeHBhbG5Cd3lDL3NMTW9z?=
 =?utf-8?B?R3VqN201YWZ2eXpueDV0UkJSRXJWcE1RM1Z0U2d2dDJPMTFIMDdaSTlIMk12?=
 =?utf-8?B?YkxZSDJVOTl5ekNXYTM5OFlkVmxpbENkTTAwdGQwOWtDMnYxeDc3dkYweE1n?=
 =?utf-8?B?SVVnUzVnR3Yrc0dDbGxSVEVGRE11UjdtZVpNR2tqNDhoS0dJVHpNUWV5UDVM?=
 =?utf-8?B?aHlOY0NrVjA2cXFrcmtrMG5oWTBqcHNjK0ZIM3U3Qkx2VWFzU2k0c1V2NU10?=
 =?utf-8?Q?1XdT1ppq34S1wcHKAe4VXkLX0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dec1be7-3f68-48a2-e893-08db5dc5ee4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 08:48:09.0528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7gjiAJMd+1krIlwXFP6YmX/emhFtPFsbZBLYOs10rqV6fNl3SIqz35O94Ju0vqj8uw7L0NUO9RwYCusKbCDy3H3LkuxMhmuFXxmJ4DlcmoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7879
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjUgMTEvMTFdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzJsLXNtYXJjLXNvbToNCj4g
RW5hYmxlIFBNSUMgYW5kIGJ1aWx0LWluIFJUQw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCENCj4gDQo+IE9uIE1vbiwgTWF5IDIyLCAyMDIzIGF0IDEyOjE54oCv
UE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBF
bmFibGUgUE1JQyBSQUEyMTUzMDAgYW5kIHRoZSBidWlsdC1pbiBSVEMgb24gdGhlIFJaL3tHMkws
VjJMfSBTTUFSQw0KPiA+IEVWSy4NCj4gDQo+IExvb2tpbmcgYXQgdGhlIHNjaGVtYXRpY3MgZm9y
IHRoZSBSWi97RzJMLEcyTEMsVjJMfSBTT01zLCBpdCBzZWVtcyBub3QNCj4gYWxsIFNPTXMgaGF2
ZSB0aGlzIFBNSUM/IFRoZSBvbmVzIHRoYXQgZG8gaGF2ZSB0aGUgUE1JQyBhcmUgYW5ub3RhdGVk
DQo+ICJQTUlDIFZlcnNpb24iIG9uIHRoZSB0aXRsZSBwYWdlLg0KDQpPbmx5IGZldyBlYXJseSBw
cm90b3R5cGUgdmVyc2lvbnMgZG9lc24ndCBoYXZlIFBNSUMuIEN1cnJlbnRseSB3ZSBhcmUgbm90
IG1ha2luZw0KYW55IFNvTSBvZiB0aGF0IHR5cGUuIEFsbCBTb01zIGhhdmUgbm93IFBNSUMuDQoN
Cj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwtc21h
cmMtc29tLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnMmwt
c21hcmMtc29tLmR0c2kNCj4gPiBAQCAtNzMsNiArNzMsMTMgQEAgdmNjcV9zZGhpMDogcmVndWxh
dG9yLXZjY3Etc2RoaTAgew0KPiA+ICAgICAgICAgICAgICAgICBncGlvcyA9IDwmcGluY3RybCBS
WkcyTF9HUElPKDM5LCAwKSBHUElPX0FDVElWRV9ISUdIPjsNCj4gPiAgICAgICAgICAgICAgICAg
cmVndWxhdG9yLWFsd2F5cy1vbjsNCj4gPiAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAg
LyogMzIuNzY4a0h6IGNyeXN0YWwgKi8NCj4gPiArICAgICAgIHgyOiBjbG9jay14dGFsIHsNCj4g
DQo+ICJjbG9jay1leHRhbCIgaXMgYSB0b28gZ2VuZXJpYyBuYW1lLCBhbmQgbWlnaHQgY2F1c2Ug
Y29uZmxpY3RzLg0KPiAieDItY2xrIj8gDQoNCk9LLCB3aWxsIGNoYW5nZSBpdCB0byAieDItY2xv
Y2siIGFzIHBlciBbMV0NClsxXQ0KaHR0cHM6Ly9kZXZpY2V0cmVlLXNwZWNpZmljYXRpb24ucmVh
ZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2NoYXB0ZXIyLWRldmljZXRyZWUtYmFzaWNzLmh0bWwjZ2Vu
ZXJpYy1uYW1lcy1yZWNvbW1lbmRhdGlvbg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gPiArICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxz
ID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MzI3Njg+Ow0K
PiA+ICsgICAgICAgfTsNCj4gPiAgfTsNCj4gPg0KPiA+ICAmYWRjIHsNCj4gPiBAQCAtMzUxLDMg
KzM1OCwxNCBAQCAmd2R0MSB7DQo+ID4gICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gICAg
ICAgICB0aW1lb3V0LXNlYyA9IDw2MD47DQo+ID4gIH07DQo+ID4gKw0KPiA+ICsmaTJjMyB7DQo+
IA0KPiBQbGVhc2Ugb2JleSBhbHBoYWJldGljYWwgc29ydCBvcmRlci4NCg0KT0sgd2lsbCBhcnJh
bmdlIGl0IGluIGFscGhhYmV0aWNhbCBvcmRlci4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+
ICsgICAgICAgcmFhMjE1MzAwOiBwbWljQDEyIHsNCj4gPiArICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJyZW5lc2FzLHJhYTIxNTMwMCI7DQo+ID4gKyAgICAgICAgICAgICAgIHJlZyA9IDww
eDEyPiwgPDB4NmY+Ow0KPiA+ICsgICAgICAgICAgICAgICByZWctbmFtZXMgPSAibWFpbiIsICJy
dGMiOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgY2xvY2tzID0gPCZ4Mj47DQo+ID4gKyAg
ICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gInhpbiI7DQo+ID4gKyAgICAgICB9Ow0KPiA+ICt9
Ow0KPiA+IC0tDQo+ID4gMi4yNS4xDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0K
PiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBs
aWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMNCg==
