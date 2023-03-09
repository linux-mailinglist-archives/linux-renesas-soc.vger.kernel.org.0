Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA006B216D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Mar 2023 11:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbjCIKa1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Mar 2023 05:30:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbjCIKaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Mar 2023 05:30:25 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEC3E2767;
        Thu,  9 Mar 2023 02:30:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPCVZNgDMV5ay7Kqzd4PN+ZAbHzvsvlPbtHEkHsDpTf3Q5+PDBkEPvKlmcMX6OCu8PA7XiVpSd6ET6CysJR6rI/eTyPD/Jn/B9fBon+TAANtRDOUi2impuT5oC/6lOW99INJSghSmc8A8AE6VFRsNRq0uRp/3h9seQi7Fx3U25Haa100tU2JVb7/V4OaPQ9CDLeKX46+cqXcX9yBedYkIgFUUroQs/7XwYco+vBGh/+hrc5hI7PNc1cEOleWpgaovWAb4l1f3qW4q+1D+MXLudjeTwrSiqCzRkfH0TKo374LLWntsQv9ZB5IJM5mFmMLOxZZHSgCE1jH0gLkhq2JTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eMmkiK2H2uagdaXnrxWEcTWQInx5vyiltC6TBi7Z1w=;
 b=iN0T9YAOGsKEqUaPinYd4ZNYfeMCZHGC8eNuyC0ifWPznoHyvQ5Nyu3W7DcW+qh4hwKl+PL9otkXvsEgpxBNEZAfu/2Gc1zmakq22pJXOg6XknrnNDzUkfSQMRpa/qhCxi9ZO4U1Pap07J/6gGJ5HMVVL4DtiKIJaDXrwoyOaTLtPz9XT+N0QZ6uGIil2AlAKk48PDoRQlre+BLOb5Dl59Kc7/dDKgGSbhyOsyt3f1MgKUEM3mVjKDorETlP8GKTkXYGRTsTJvmKXQa5EIDSj7dGXJ4gnHhMe78d0b/3H/MPcH/rc2KBOMBX4y3GkLWxdDDdQdhzNVnmiRrNJ4cWIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eMmkiK2H2uagdaXnrxWEcTWQInx5vyiltC6TBi7Z1w=;
 b=ezsqcxRtUHrXeqBx15q4PAQ/HTMhH0/LPUM+rEK4kPF7b+iwXqdu5uJcxqhJzAepnl28/tHr2yNWyZWevUmsH/g3JdlHnJxCwxlLANiBhzF5VBtA7XXaXfwMprmTb73OBqSKqmsGRZHIj1GjqY4aBzNKF3WQsLBRnY12SYC2XmA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB6208.jpnprd01.prod.outlook.com (2603:1096:400:7b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 10:30:20 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 10:30:20 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Topic: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Index: AQHZRS0aT95BTvtLwUKgslaMkC+eWK7at0aAgBZQ9vCAAEpeAIAAAIEwgAAHzgCAANKNMIAAFx2AgAAAUHCAAAgsgIAAA/sAgAAA3ZA=
Date:   Thu, 9 Mar 2023 10:30:20 +0000
Message-ID: <OS0PR01MB59221F006F53E2ACC7690F2A86B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com>
 <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
 <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <36e06397-2189-4f1b-99cc-d39e720ebc71@linaro.org>
 <OS0PR01MB5922BDA0632ACCCC0100EEBD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <6cbe6c71-2d2d-0f79-1270-7f8ed2ddc1d6@linaro.org>
 <TYCPR01MB5933650D5BAB7A3F4BE03BAF86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <984f1689-459e-bd26-b96c-6c759417b3d1@linaro.org>
 <TYCPR01MB59335607AE6A2F4FBBA46ACC86B59@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <bc9e8ccd-9f98-6fae-9491-dc2bd96c2e4f@linaro.org>
 <CAMuHMdVNCvu6La_=f=6i4Kj3UXeFU6McnNSkXb0PVjVyzdNR4Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVNCvu6La_=f=6i4Kj3UXeFU6McnNSkXb0PVjVyzdNR4Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB6208:EE_
x-ms-office365-filtering-correlation-id: 054bb8b4-2fd3-4e87-8c6f-08db208948d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oTEt2HEPLsVwcMYvFo4RKVEUr49MV51qNWscAjAHyof6wEH5bB/Wv4NOqgPd6tazfQAXb/zpE0tWf6cIjcET2WxsHeqYXPkIUpkieObH2QyrZGnerQSRkSxEO3/mXWLzgneX4Tajm99rA/EwVGQY3GXpQeHR8pcbCFyQkL+1uY/CjmkmvX0Mnc49B0o5VqEeSCkzpIQSGzBBN3DeVJH5HVXvgbrvnklAV1sJGslFZTikp2x6NSqFE+ZfZPOnjhi5kDZBAveCvlIY6WYIRDP/v13HNLKE5LrfTGEipZW75FYYuCTvS7eAkU7Sn8ncbjCOTdlwkjYrDSMpNg3UhP6QQvG3ptbPODt0Y+aWAItSM8ilX9yjhSod0ORYA/6lltVqroZZZp9raCNEVRI1QrOuE1X9xwom0hngLlwzdkFEiGdS7ykoHwcgN6Z6YyPjU3DK7yvf0x3XLAU7NsQtl/pFJ3NIiig3BAWfs5L5mxLvSTS2LRYAuPhDQmzHheKQQwWTLwUldn1RarBErBmfmTgVycfRMG4YCJ+PUEAz/2jygbKzGZ8jU/nWY4Eg3nnmnD+OQTYzZeLONaLqekLkpxc4B6OJU2PjsZDVwc+mIvZHFP6G4PGKQPVJ+2SC7AfITzyO5YG1ty/QYaXyzk+/URE8Lxm2oLSl3UCqueTIRnHviZIhEb5YoMLz9R7hz2t+CJVE0tjzcGLk8eplou2OdoMx5A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199018)(66899018)(38070700005)(33656002)(2906002)(7416002)(5660300002)(26005)(8936002)(8676002)(52536014)(66476007)(66946007)(41300700001)(66556008)(64756008)(4326008)(76116006)(66446008)(6916009)(55016003)(86362001)(54906003)(316002)(7696005)(71200400001)(478600001)(122000001)(107886003)(38100700002)(53546011)(9686003)(6506007)(186003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUt6QU9ya0pQcE13cm9aT2x3cThPaWZBcFFtdENvSkpGTkxlWUpwYzRZcFNB?=
 =?utf-8?B?TzlvaEQ0UlNVOXZEckVKRWJ3eHVTL0VpL0lueUNTT0pRRFl0ZE8wZGNEUmdq?=
 =?utf-8?B?cU5ZWmdEcUpOTnhNS2VtcWlta1k0RFl0RHhicUZQUElicXVYVk8zcXFTOU0x?=
 =?utf-8?B?ZDFzWTVoN0xvbE1IRnplUUhIZDRrQ0h5ZTR5Tks0TUlFRngyNzU0cVZ2b2NR?=
 =?utf-8?B?UXZQL2xBL2tUNWZRODNobUxBbGt6c3J0ZTE5eDFQdk5sY00zbDBvaTU3UThk?=
 =?utf-8?B?NVFFYjB6TXNjaWZRYWV2N0ROS2ZOdDRRdDZqNmFpbCtuOXFXTUhCUmV4Kzl1?=
 =?utf-8?B?TlRXM09oUEsxbGJ5R204NWpkKzRkOERYdWVjc0pHaGRQNVlWTFpHd2RJbXR4?=
 =?utf-8?B?QmwrMTNFeHhpN1dvVG1nL0F6bnRoVnRzb2NGMWRpcGRrL0ZxOWZnZjJXcGhE?=
 =?utf-8?B?T1FydE96UFJXUW5wQmRkVUtDTmVpZTZWZmVGdG9yeUh4NWl2Vm1oQkd1Q3VG?=
 =?utf-8?B?cktIT0pxK245OGRrVkN1Mm1yckZjbUpaR2FFVFliUG5PMStYV0wwNXEwUzND?=
 =?utf-8?B?eEViblduUU9mNTZBcjdPRFlEeG5Od1JDak5mZVpQZmEvSzE2UFhZN0Y2YTN2?=
 =?utf-8?B?UXZ4YkdrdC9pR3lCY1pLNVdwVXM0VkR4V2RWUERJZzRkeTFzcjc4T3ZjMHhK?=
 =?utf-8?B?YVRuZFRNeFhTcUlTNUJEaUVJTGFBOFFMMTlaQWVWL3NKSTZ1cGdUMkMvM2E2?=
 =?utf-8?B?RWxsOUFRSUc1bSs4QlZVbE16d0doaGhDRis0bHB0WmtmMk5heDFENm1oWXR3?=
 =?utf-8?B?ZndBS1d1MmZjQ3ltMWRDd2pQYVJSeUpJcUkybVBWY2JmcXJ6aEpNelZRaVR2?=
 =?utf-8?B?b0FsZFZHRnQ2NHhoaTA0eWd5bU9DM3o0RnJpeURNa1hPRjVLYUlZZU12VFJH?=
 =?utf-8?B?a01HMDBIaUlJMmhzNWFGR3E4RWJ5VjBUczErNG9JampoWVFYMFJLNEEzT0t2?=
 =?utf-8?B?VThjUUVET3l1cHc1RDhuM08xcUE3aUk2TWhRUStLV2hiUkNxYUgwTEY4Qzl0?=
 =?utf-8?B?SVJQS1lDWjkvUjgvcEd3akR4TEhsajRJR2hRQVNjWGVMcDAyOEh2cDgySnVm?=
 =?utf-8?B?QjlWbjM4ZU4zVlpnclBBa25JSWowYmxUWFNoeTFadUN0VEs4MHBaK2JEWGJQ?=
 =?utf-8?B?RVYrTml4R2xFc2l4Q095Nm9USmIrREU0aTFDanlBdTJkdDZqN2ZqM3VhUGI3?=
 =?utf-8?B?Y3c1Tnc4dE1YR010ZkhiU0lOT0loZ1A0YXBPczVjTk02elZNY25Gbm9XTTRY?=
 =?utf-8?B?alRuK1ZDRVdZeElqZjRZVDM1Vmc0bE9LRUxaN2x5TENyVHVJY3NEQ1ZDMWgw?=
 =?utf-8?B?WWttdmNvZ3F2TjczVlZEY3FoMHQzb0UrOUJJckxFRE95aFJySFBDOTNtSEJS?=
 =?utf-8?B?WWF1Q0tFOUVlQ1hzeGhaWENqQXBnbFIrSUxjSjRNVmpWZW12TDZjdHRtdHJM?=
 =?utf-8?B?QVZmQmM3cGJEOGRHaDd4Rk1aZ3duNXQ2MFVXM0hEaDhnNDQ3bE4rZkxWTDlU?=
 =?utf-8?B?cXpPRThBREF2SnhMbS9tOERNVmdBY1A4dHBVL0JmTE1pUUQzbDMxdnFEQjhq?=
 =?utf-8?B?OUdVMEhmQysvV0w4U0k2V09RTjBWMkIzTUZwNmV0MnZPQVdPcGlraEpZTVpU?=
 =?utf-8?B?WHRuZU95czFocjFROUNYQk5ObHh0TzB5eGlaN2pwZXRqNmdlekRXU25Gb1Jp?=
 =?utf-8?B?T1FxQ05sRjdtb21sRDIzd3hvaHpOQjBDWFhuSjYzbzFXNXIzQXB0ek5wTWdy?=
 =?utf-8?B?dnNZc3UwdDBDQW9yRUpEek50OStCOU1sQk1MZ2piVFJwNzFpVGVVci9ZT2RY?=
 =?utf-8?B?SE5LRGlYWndSWURhd0xpKzhuUFMxTUlHWVczZUtMTm9FWFlueGZLRUt4STlK?=
 =?utf-8?B?TzlxbUoxNnJRaHN4U1I0OFRSV3BEWFBSV0Rzd1hRZTI0a2lGa0xqNkFkcXQ4?=
 =?utf-8?B?ZW45MlNQQkxGY2cyS1A2aGNET0h1YUJyRkpJME5naWQyRTI4UjhVNGVBL21q?=
 =?utf-8?B?M2VCc2d1WTZaN2ZMUjlUMG80cDdCQkZGSjlVM2xid2lmSkwxSmplMGdmcUdC?=
 =?utf-8?Q?a8eupm20kiXkENWUCxO9y+qjl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 054bb8b4-2fd3-4e87-8c6f-08db208948d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 10:30:20.7398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JJbcpoGubfrkpZXoO8oXC8nVbeeAzgKj6yB9sHcneSkYU5NDRLRJT1p9EniklKi5QlyxjN8N08Ndw6itEQwhVzjCG4MvkGnrPIV/FtvCCdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6208
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIFJGQyAxLzNdIGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIFJlbmVz
YXMgdmVyc2EzIGNsb2NrDQo+IGdlbmVyYXRvciBiaW5kaW5ncw0KPiANCj4gSGkgQmlqdSwNCj4g
DQo+IE9uIFRodSwgTWFyIDksIDIwMjMgYXQgMTA6NDTigK9BTSBLcnp5c3p0b2YgS296bG93c2tp
DQo+IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOg0KPiA+IE9uIDA5LzAz
LzIwMjMgMTA6MTgsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4gPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxv
d3NraUBsaW5hcm8ub3JnPiBPbg0KPiA+ID4+IDA5LzAzLzIwMjMgMDg6NTcsIEJpanUgRGFzIHdy
b3RlOg0KPiA+ID4+Pj4+IEl0IGlzIGNsayBnZW5lcmF0b3IgSFcgc3BlY2lmaWMuIENsayBnZW5l
cmF0b3IgaXMgdml0YWwNCj4gPiA+Pj4+PiBjb21wb25lbnQgd2hpY2ggcHJvdmlkZXMgY2xvY2tz
IHRvIHRoZSBzeXN0ZW0uDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gRXZlcnkgY2xvY2sgY29udHJvbGxl
ciBpcyB2aXRhbC4uLg0KPiA+ID4+Pj4NCj4gPiA+Pj4+PiBXZSBhcmUgcHJvdmlkaW5nIHNvbWUg
aGFyZHdhcmUgZmVhdHVyZSB3aGljaCBpcyBleHBvc2VkIGFzIGR0DQo+ID4gPj4+Pj4gcHJvcGVy
dGllcy4NCj4gPiA+Pj4+Pg0KPiA+ID4+Pj4+IExpa2UgY2xvY2sgb3V0cHV0IGlzIGZpeGVkIHJh
dGUgY2xvY2sgb3IgZHluYW1pYyByYXRlIGNsb2NrLw0KPiA+ID4+Pj4NCj4gPiA+Pj4+IE9LLCBJ
IHdhaXQgdGhlbiBmb3IgcHJvcGVyIGRlc2NyaXB0aW9uIHdoaWNoIHdpbGwgZXhwbGFpbiBhbmQN
Cj4gPiA+Pj4+IGp1c3RpZnkNCj4gPiA+PiB0aGlzLg0KPiA+ID4+Pg0KPiA+ID4+PiBIZXJlIGl0
IGlzLCBQbGVhc2UgbGV0IG1lIGtub3cgaXMgaXQgb2s/DQo+ID4gPj4+DQo+ID4gPj4+IHJlbmVz
YXMsb3V0cHV0LWNsb2NrLWZpeGVkLXJhdGUtbW9kZToNCj4gPiA+Pj4gICAgIHR5cGU6IGJvb2xl
YW4NCj4gPiA+Pj4gICAgIGRlc2NyaXB0aW9uOg0KPiA+ID4+PiAgICAgICBJbiBvdXRwdXQgY2xv
Y2sgZml4ZWQgcmF0ZSBtb2RlLCB0aGUgb3V0cHV0IGNsb2NrIGZyZXF1ZW5jeQ0KPiA+ID4+PiBp
cw0KPiA+ID4+IGFsd2F5cw0KPiA+ID4+PiAgICAgICBmaXhlZCBhbmQgdGhlIGhhcmR3YXJlIHdp
bGwgdXNlIHRoZSB2YWx1ZXMgZnJvbSB0aGUgT1RQIG9yDQo+ID4gPj4+IGZ1bGwNCj4gPiA+PiBy
ZWdpc3Rlcg0KPiA+ID4+PiAgICAgbWFwIGluaXRpYWxpemVkIGR1cmluZyBib290Lg0KPiA+ID4+
PiAgICAgICBJZiBub3QgZ2l2ZW4sIHRoZSBvdXRwdXQgY2xvY2sgcmF0ZSBpcyBub3QgZml4ZWQu
DQo+ID4gPj4+ICAgICBtYXhJdGVtczogNg0KPiA+ID4+DQo+ID4gPj4gYm9vbGVhbiBpcyBzY2Fs
YXIsIG5vdCBhcnJheSwgc28gbm8gbWF4SXRlbXMuIElmIHRoZSBmcmVxdWVuY3kgaXMNCj4gPiA+
PiB0YWtlbiBmcm9tIE9UUCBvciByZWdpc3RlciBtYXAsIHdoeSB0aGV5IGNhbm5vdCBhbHNvIHBy
b3ZpZGUNCj4gPiA+PiBpbmZvcm1hdGlvbiB0aGUgY2xvY2sgaXMgZml4ZWQ/DQo+ID4gPg0KPiA+
ID4gT0ssIEkgd2lsbCBtYWtlIGFuIGFycmF5IHByb3BlcnR5IGluc3RlYWQuIEZyb20gSFcgcGVy
c3BlY3RpdmUgZWFjaA0KPiA+ID4gY2xvY2sgb3V0cHV0IGZyb20gdGhlIENsb2NrIGdlbmVyYXRv
ciBpcyBjb250cm9sbGFibGUgaWUsIGZpeGVkIHJhdGUgb3INCj4gZHluYW1pYyByYXRlLg0KPiA+
ID4NCj4gPiA+IElmIGFsbCB0aGUgb3V0cHV0IGNsb2NrcyBhcmUgZml4ZWQgcmF0ZSBvbmUsIHRo
ZW4gZnJlcXVlbmN5IGlzIHRha2VuDQo+ID4gPiBmcm9tIE9UUCBvciByZWdpc3RlciBtYXAuIEJ1
dCBpZiBhbnkgb25lIGNsb2NrIG91dHB1dCBnZW5lcmF0ZXMNCj4gPiA+IGR5bmFtaWMgcmF0ZSwg
dGhlbiBpdCB1c2VzIGR5bmFtaWMgc2V0dGluZ3MuDQo+ID4NCj4gPiBTZWNvbmQgdHJ5LCBzYW1l
IHF1ZXN0aW9uLCBsZXQgbWUga25vdyBpZiBpdCBpcyBub3QgY2xlYXI6DQo+ID4NCj4gPiAid2h5
IHRoZXkgY2Fubm90IGFsc28gcHJvdmlkZSBpbmZvcm1hdGlvbiB0aGUgY2xvY2sgaXMgZml4ZWQ/
Ig0KPiANCj4gV2hhdCBpcyB0aGUgYWN0dWFsIHVzZSBjYXNlPw0KPiBNeSB1bmRlcnN0YW5kaW5n
IGlzOg0KPiAgIDEuIElmIHRoZSBPVFAgaXMgcHJvZ3JhbW1lZCwgdGhlIGNsb2NrIGdlbmVyYXRv
ciB3aWxsIGJlIGNvbmZpZ3VyZWQNCj4gICAgICBmcm9tIHRoZSBPVFAgb24gcG93ZXItb24sDQoN
CkNvcnJlY3QuDQoNCj4gICAyLiBUaGUgY2xvY2sgZ2VuZXJhdG9yIGNhbiBiZSAocmUpY29uZmln
dXJlZCBmcm9tIHNvZnR3YXJlLg0KPiAgICAgIGEuIElmIHRoZSBPVFAgaXMgcHJvZ3JhbW1lZCwg
dGhpcyBpcyBub3QgbmVlZGVkLA0KDQoNClllcywgQnV0IHdlIG1pc3Mgc29tZSBIVyBmdW5jdGlv
bmFsaXR5Lg0KDQpFZzoNCk9uIFJaL0cyTCBTTUFSQyBFVkssIEJ5IGRlZmF1bHQgYXVkaW8gbWNs
ayBpcyBjb25uZWN0ZWQgdG8NCjExLjI4OTYgTUh6IGNsayAoc2UyIG91dHB1dCBmcm9tIGNsb2Nr
IGdlbmVyYXRvcikgIHdoaWNoIGlzIG11bHRpcGxlIG9mIDQ0LjFLSHouDQphbmQgdGhpcyBjbG9j
ayBpcyBhIG5vbi1jcml0aWNhbCBjbG9jay4NCg0KNDhLaHogcGxheWJhY2svcmVjb3JkIGlzIG5v
dCBwb3NzaWJsZSB3aXRoIEF1ZGlvIGNvZGVjLCBpZiB3ZSBqdXN0IHVzZSB0aGUNCnZhbHVlIGZy
b20gT1RQLg0KDQpCdXQgYnkgY2hhbmdpbmcgcGFyZW50IG9mICJzZTIgY2xvY2siLCBpdCBpcyBw
b3NzaWJsZSB0byBhY2hpZXZlDQo0OCBLSHogcGxheWJhY2suDQoNCj4gICAgICBiLiBGb3IgY3Jp
dGljYWwgY2xvY2tzLCB5b3UgbWF5IHdhbnQgdG8gcHJldmVudCB0aGlzLg0KDQpGb3IgY2FzZWIs
IENyaXRpY2FsIGNsb2NrcyB3ZSB3b24ndCBjaGFuZ2UgaXRzIHJlZ2lzdGVycy4NClRoZSByZWNv
bmZpZ3VyYXRpb24gaXMgb25seSBmb3Igbm9uLWNyaXRpY2FsIGNsb2Nrcy4NCg0KPiBBbHNvLCBB
RkFJVUksICJmaXhlZCBmcmVxdWVuY3kiIG9yICJkeW5hbWljIGZyZXF1ZW5jeSIgaXMgYSBwb2xp
Y3ksIGFuZA0KPiBwdXJlbHkgc29mdHdhcmU/IE9yIGFyZSB0aGVyZSBPVFAgYml0cyB0byBlbmZv
cmNlIHRoaXM/DQoNCk5vdGhpbmcgT1RQIGJpdHMgcmVsYXRlZC4gDQoNCj4gDQo+IFBlcmhhcHMg
eW91IG5lZWQgYSBwZXItb3V0cHV0ICJkby1ub3QtY2hhbmdlLWZyZXF1ZW5jeSIgZmxhZywgcHJv
YmFibHkgd2l0aA0KPiBhIGdlbmVyaWMgbmFtZSwgaW4gdGhlIHNwaXJpdCBvZiAicmVndWxhdG9y
LWFsd2F5cy1vbiINCj4gZm9yIHJlZ3VsYXRvcnM/DQoNClllcyAiZG8tbm90LWNoYW5nZS1mcmVx
dWVuY3kiIGZsYWcgZm9yIHBlci1vdXRwdXQgaXMgc2Vuc2libGUgb25lLg0KDQo+IE5vdywgaWYg
YWxsIHRoZSBvdXRwdXQgY2xvY2tzIGFyZSBmaXhlZCByYXRlLCB5b3UgbWlnaHQgd2FudCB0byBk
ZXNjcmliZQ0KPiB0aGlzIGluIERUUyB1c2luZyBhIHNldCBvZiBmaXhlZHssLWZhY3Rvci19LWNs
b2Nrcz8NCg0KT24gSWRlYWwgY2FzZSwgYWxsIHRoZSBvdXRwdXQgY2xvY2tzIGFyZSBmaXhlZCBy
YXRlIGFuZCB1c2UgdGhlIHZhbHVlIGZyb20gT1RQLg0KDQpCdXQgY2FzZXMgbGlrZSwgbm9uIGNy
aXRpY2FsIGNsb2NrcyB3ZSBzaG91bGQgYmUgYWJsZSB0bw0KY2hhbmdlIGZyZXF1ZW5jeSBvZiB0
aGF0IHBhcnRpY3VsYXIgY2xvY2sgb3V0cHV0Lg0KDQpJbiBhdWRpbyBwbGF5YmFjayBjYXNlLCBp
dCBpcyBqdXN0IDEgYml0IGZvciBjaGFuZ2luZyB0aGUgcGFyZW50LA0KQWZ0ZXIgdGhlIGluaXRp
YWwgcmVjb25maWd1cmF0aW9uLg0KDQpDaGVlcnMsDQpCaWp1DQoNCg==
