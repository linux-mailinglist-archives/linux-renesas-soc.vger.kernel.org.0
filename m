Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40DBB71FAA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jun 2023 09:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbjFBHGS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jun 2023 03:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233852AbjFBHFl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 03:05:41 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E28E77;
        Fri,  2 Jun 2023 00:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cL9unr89TqySA81XshPP5wPkrcHeynymWbsuWmZ3OUuvslXI59NCg/nHG5I64ozQxSq/vXl8YK9W1d23vRZhk4+A9D29U6hbovJUgaMGh5RH44CAplTPaV1ooUUbYfBa5xWMCP5ayLnlZUlANpmrvCLBFdIpN3xBBAY6sc7FHtlmhVJYs7cweWeBYy5Zi1jrj8J2SmT3MB84W0U7ZkUco3X7N8D2m/tJDye+51MWoF/gFpW7agwcGvt3KPq0rCNROSMdRejY2363Ssc7XnKFDk4zu9wQ2sOMrPMQ2D+x0s9AZwmJbNaoYQlrPSJyhyEC9C9Ztg2AH9yzNqPmG4KkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHQhXVpjZy9jPk/K4kd6U6GBYO/riTIV4y3XLGwyYng=;
 b=K5KZWp62doVgck6y5pUjeKXVJ25n6WTOKeZLBfCtNatUIp59OeHUgSACIBuGSrEYbeRI+XDh9nJuvvn9We1GOhBpNry1wbP8vyenwCc9b0Qp6GcCsOP6eP5pKPT7WVNyo3hs6/c/+uAeaCF5dMHj3FSShEiCafrYbZfr/9a7at69b5+D4bgX9yjC+kjWkoAm1VQY/Z3ovcyvVPXWcrJhgrGPUn9pUlooJ7QLZP05CC5Pk8DKQ/BHRo5GZveHMC+WlbwrD6wANGZdc2ql6JRbd/wdZXs88EKJuBJU4MAQNf3M5ZgVgdE6+nIHJFR80bPkeosbAkM7auuBEN7E5L2F0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHQhXVpjZy9jPk/K4kd6U6GBYO/riTIV4y3XLGwyYng=;
 b=BoQSYY9t/jCpG0SKgs7tYOCOsyi0fA41Ra5lDC3gOIwsMnHris6rFgq63yD2PSsFCPlECYzP2e7TT2n8kEvnCiiyNYMEmvzJ4gnsUKLrr3QD9Gm0ZCCOzgbIDnrZgb73Y5Uhqax25zzakA490S1rd4fXGMFzHbglj+d+3EocFhg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB6297.jpnprd01.prod.outlook.com (2603:1096:402:3d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 07:05:32 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 07:05:30 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v3 3/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Thread-Topic: [PATCH v3 3/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Thread-Index: AQHZhbtbMOqhbQvWykaInHFTxQ/ddq9cjXkAgAAOw6CAGpj7cA==
Date:   Fri, 2 Jun 2023 07:05:30 +0000
Message-ID: <OS0PR01MB592293AE5FDD0038DE3F25A0864EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
 <20230513165227.13117-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdXpHgU3p1OE5_Vea8feqdyFbiSuyporhw6gEUwn=HX73Q@mail.gmail.com>
 <OS0PR01MB59222B5EE44743343B34BE7D86799@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59222B5EE44743343B34BE7D86799@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYAPR01MB6297:EE_
x-ms-office365-filtering-correlation-id: fc6aa1f6-ea9e-4c4d-d478-08db6337c091
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +18C0Pr0k/Ywe1DKTGZTBLiW+a3AFRghh74dEdQe2f6rTFFHG5qK5ntxhXJImW7tCCopIRgaWf+nqX/CHjYqmYDke2b8RYDx6qZGdcvNMki0QvcTuTGxGqwaSZ412hHS1ytJx9+9BIFeQe2U3S4AeHeKRV8aA2hrdVfg2cA7Y74XL5bBtG0LLrPifbCEhhz3eTB+cR9To+rHgG14iWWwJqzjxazZ9o2zzJ6aJNp8bU4oj0hHTMOJ4P7X2V4LJBfQOI6panXI4F1dU9njWRPh8IWkEd8id4+7N5dpPWb8952gIlD4/+C6POjVJvNiIBFeQwI3dDtZcxQCPhBu/eG0GlQZ8mJ4+YGuNYmTD3EBWaGr3aFs/I75ISOAwPRgnRim0vuy+X4WVb7cLzmecwHDUFaADVKsn+RC4BaGVODyT/7NTfap2hBpVpBn5gHqM7dmfdUSDiTFi6ff6v4CvlqeFnG37JMhmIktCD7rF6rowhnIOuwvqMrDByBCMkDos1rSi7BaNFIpvLmdccgFt8Z3xd4QijGojEkAkkSyJ3Jy0DCMudwrfgh9uLu6BjQwRWEI3kn5c/75cHVGl9BAyqfqhI5V1oY7VUTuyrYCVqxWJ99GDSaVLUjYKcN8fgXJm6k+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(71200400001)(7696005)(478600001)(26005)(6506007)(33656002)(186003)(53546011)(9686003)(83380400001)(86362001)(38100700002)(38070700005)(122000001)(107886003)(55016003)(4326008)(41300700001)(316002)(66946007)(66476007)(6916009)(76116006)(66446008)(64756008)(66556008)(2906002)(5660300002)(52536014)(8676002)(8936002)(54906003)(66899021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGlzZHZDc2JPS1p5SDdyaUJ6VWo3QytUcWFDNUltMmIwRVFiVlh3eWRuVEIy?=
 =?utf-8?B?LzgwS1R5OFJ3UGY1MzFmZXdzTXJxNEJhMlVrWldDK2ZQM0pKOTBLb0FDVTRu?=
 =?utf-8?B?ZHBrRzExM0hud1BsN0d6UEVhZG1IaDN2L3lBVTBXazBBMkNTOWhSdG9qZUsv?=
 =?utf-8?B?bkc4aUZUUlkwUlB2cWljL1Vmblh5cC9SeEJUM0J0bDZwMEpSbWNtTTd3SnBS?=
 =?utf-8?B?MTBSdEVkWkZKQjU5bGZKNEQ2S0FQbW15YnZWMGNlTkVMYnhoVUlBWFVDV0hp?=
 =?utf-8?B?NlZSNVJrWlFvREV3RlJZNThzVnYxQUtOTGwwRWlYcGowTjAyRVEvcFg4MHNr?=
 =?utf-8?B?dHZjQXpJMzdXOG9IQUYxOUtoWElLK0k0Wm5naFVYRDNvUmxCREozNzZ3dkdD?=
 =?utf-8?B?dHlORFNndkFwTVZraW8vTVRKcGNQbng0ZDNzUHI4SlBCZ09aeHlWc0hRQTRN?=
 =?utf-8?B?S3Y0VHVGYzhGd0t5RDhzdExUU1BweDd2bWxNdGRPd1lZY0RSbk9VeDNxZFB2?=
 =?utf-8?B?V3JRSWNXdC9IdHVvdll2SmMxbnd0Y1lKTmxMS3kvQ1NEa2p4ZUtDR09Iajlu?=
 =?utf-8?B?NG1vVllGYTEvT0w4eWJMeW9zN3FTY2VmclhnM3VYajlvaUNId0hMRjhFWU5O?=
 =?utf-8?B?Y0N6WE01UE5yRWxWYWRqQ2t4bHU5WkpKYnQ0NjIvUHpaNytWS1dxZHRDSDNK?=
 =?utf-8?B?bnJjQXZMSDNjZXpabXk4aytveW9GTTY2NjlrTEdDQXVVYWkwZHdXeUdpWTB1?=
 =?utf-8?B?dHdVRkVYaFJMQWlXWTRvNjlCRDBiQXBka1p5T1F6UHlpbkFnQzgwY0Y0Tllz?=
 =?utf-8?B?UkJRTjczbC9pVHFFbkdoZDRkRnN5Y1d3VHhjTlJLSno1a3N3QkxsTXVhaGI0?=
 =?utf-8?B?MUxNMTVQVjdPWStLSFl2Nmk3ZnVwS0M4bFpLOTJpUFlqYS9wa3NTLzNlczA5?=
 =?utf-8?B?YWQ0RG9Ka24vZTlZbVdPYkxYdHVsekRZSCtoMURSa2dXU1ZSTFhkMFFCMFgv?=
 =?utf-8?B?dUIyaXdyNUZjaGJqQjc5dWVDU3AvUjFGR3EwU0MvV2hPaWJHMHhIZ3ExTUl5?=
 =?utf-8?B?eW5XN2VWbTdQRFM0SUlDSnErSjV1UjJUeElwSkhXN1hBL2gvS3Z4cUF6d3BL?=
 =?utf-8?B?MWR3bjY0aFpKWkIvTlhnRmIvR3V1VC9mNVppL3I2akZWbTFsT3NsNm5lenBz?=
 =?utf-8?B?Q3NaWENjbVlxeTVtTnh3Zzg2MnVjZGFmYzRNbG9sdVVuYjFjZVhJWXRQNXZQ?=
 =?utf-8?B?ZmFKcDh5ZHZQUEJmWXNaSHp1bVhJeFlqeGtqRGRORzhYZE8zNHBkR0Zvc1kx?=
 =?utf-8?B?QWtVd1lpamc3ZGMrUTVGSFZPS25GMWxaY3hYVkkvRXpaWU50N25xK3ZReUY0?=
 =?utf-8?B?K1dTVDVENHg2UEZiVDNwQXNqVytmQmU0M004WlVnYlBzRjR4Y1ZIWXdXekI4?=
 =?utf-8?B?VVE0TVUyc2ZhY3hxemtmWDlmeVFiRm1yZUJLUHJmMGNGV3RtWWkvWXVMTktm?=
 =?utf-8?B?V3FTeDBwMzdjQjRUczNsNTRpMTRQbUdpUllqSm5qMHUvNEdQZWREN2ZadXk0?=
 =?utf-8?B?NVpsZkx1MGJYcXZSeWdWTTVqUTEwTy8vM1BWQ2kwWnhlMFVUcU5NaWtXeGNt?=
 =?utf-8?B?U3Bpa29LOXRxSVBKN0Z0aFJtNm82SVhnbFFqN25ZVVdWNy9nQXNVbDBLcVRL?=
 =?utf-8?B?ck5iWEFhdTlldHR3VTBieWQ0amZkUEwvWWVaUkNKcmE1Z2Q3SnhMZkxjbndO?=
 =?utf-8?B?T3Z2U2xqelJJTGxKRVFDZ2I2SWN0aGRQbTBqTXhCcVB2bHIwYmc5QTNxU0ti?=
 =?utf-8?B?ek5iUG5OSlZmRkVlTCs5TkNzMGplM3YyNmFMNVRRaXl2VWxwK2J1Z3hQUWxw?=
 =?utf-8?B?ZmYxSldKQ1Nla09DcW5aTHAzdzJvNzcvaUJOTzk5elE4ZlRKaGpxUWc0YUNu?=
 =?utf-8?B?aWpJZXVONm1mQ1NOdkZjZDl1bnRXSGlHM1lnQzVBUm5FYnJ0by9VVm9NajBZ?=
 =?utf-8?B?MVJVYTJEVGxxem5PRXMyWHZ2VUxYQWhLVTk1OFUwZVlNTzFQYS9wMHV2S3Fi?=
 =?utf-8?B?RUk4L2NEYkJVSEYraWZ1SmdwL0VueVIzVTZKRHFGVlNld21paEZ2NWNrempo?=
 =?utf-8?Q?v3dcRHGzkkl/sCtXVxETXQzkS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6aa1f6-ea9e-4c4d-d478-08db6337c091
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2023 07:05:30.7851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iT6T62xzi76k7JTedtTNTYPH9q10qPaUaN4wgbhK7HmraHfDkXqkbDnVPITuIN1QTBRL84xKZX22MHoeIz5h2kOGNVOKG7NMEWtnnugErsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6297
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2MyAzLzVdIGR0LWJpbmRpbmdzOiBt
ZmQ6IEFkZCBSZW5lc2FzIFJBQTIxNTMwMCBQTUlDDQo+IGJpbmRpbmdzDQo+IA0KPiBIaSBHZWVy
dCwNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KPiANCj4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgt
bTY4ay5vcmc+DQo+ID4gU2VudDogVHVlc2RheSwgTWF5IDE2LCAyMDIzIDk6MDAgQU0NCj4gPiBU
bzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IENjOiBMZWUgSm9u
ZXMgPGxlZUBrZXJuZWwub3JnPjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47DQo+
ID4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3Jn
PjsgTWFnbnVzIERhbW0NCj4gPiA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsgZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJlbmVzYXMtDQo+ID4gc29jQHZnZXIua2VybmVsLm9yZzsg
RmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+DQo+ID4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MyAzLzVdIGR0LWJpbmRpbmdzOiBtZmQ6IEFkZCBSZW5lc2FzIFJB
QTIxNTMwMA0KPiA+IFBNSUMgYmluZGluZ3MNCj4gPg0KPiA+IEhpIEJpanUsDQo+ID4NCj4gPiBP
biBTYXQsIE1heSAxMywgMjAyMyBhdCA2OjUy4oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiA+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IERvY3VtZW50IFJlbmVzYXMg
UkFBMjE1MzAwIFBNSUMgYmluZGluZ3MuDQo+ID4gPg0KPiA+ID4gVGhlIFJBQTIxNTMwMCBpcyBh
IGhpZ2ggUGVyZm9ybWFuY2UgOS1DaGFubmVsIFBNSUMgc3VwcG9ydGluZyBERFINCj4gPiA+IE1l
bW9yeSwgd2l0aCBCdWlsdC1JbiBDaGFyZ2VyIGFuZCBSVEMuDQo+ID4gPg0KPiA+ID4gSXQgc3Vw
cG9ydHMgRERSMywgRERSM0wsIEREUjQsIGFuZCBMUEREUjQgbWVtb3J5IHBvd2VyIHJlcXVpcmVt
ZW50cy4NCj4gPiA+IFRoZSBpbnRlcm5hbGx5IGNvbXBlbnNhdGVkIHJlZ3VsYXRvcnMsIGJ1aWx0
LWluIFJlYWwtVGltZSBDbG9jaw0KPiA+ID4gKFJUQyksIDMya0h6IGNyeXN0YWwgb3NjaWxsYXRv
ciwgYW5kIGNvaW4gY2VsbCBiYXR0ZXJ5IGNoYXJnZXINCj4gPiA+IHByb3ZpZGUgYSBoaWdobHkg
aW50ZWdyYXRlZCwgc21hbGwgZm9vdHByaW50IHBvd2VyIHNvbHV0aW9uIGlkZWFsDQo+ID4gPiBm
b3IgU3lzdGVtLU9uLU1vZHVsZSAoU09NKSBhcHBsaWNhdGlvbnMuIEEgc3ByZWFkIHNwZWN0cnVt
IGZlYXR1cmUNCj4gPiA+IHByb3ZpZGVzIGFuIGVhc2Utb2YtdXNlIHNvbHV0aW9uIGZvciBub2lz
ZS1zZW5zaXRpdmUgYXVkaW8gb3IgUkYNCj4gPiA+IGFwcGxpY2F0aW9ucy4NCj4gPiA+DQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
ID4gPiAtLS0NCj4gPiA+IHYyLT52MzoNCj4gPiA+ICAqIEFkZGVkIG1vcmUgZGV0YWlsZWQgZGVz
Y3JpcHRpb24gZm9yIHJlbmVzYXMscnRjLWVuYWJsZWQgcHJvcGVydHkuDQo+ID4NCj4gPiBUaGFu
a3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4NCj4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcmVuZXNhcyxyYWEyMTUzMDAu
eWFtbA0KPiA+DQo+ID4gPiArICByZW5lc2FzLHJ0Yy1lbmFibGVkOg0KPiA+ID4gKyAgICBkZXNj
cmlwdGlvbjoNCj4gPiA+ICsgICAgICBUbyBpbmRpY2F0ZSBSVEMgaXMgZW5hYmxlZCBvbiB0aGUg
UE1JQy4NCj4gPiA+ICsgICAgICBFbmFibGluZyBvZiB0aGUgUlRDIGlzIGJhc2VkIG9uIHN5c3Rl
bSBkZXNpZ24uIFN5c3RlbQ0KPiA+ID4gKyBkZXNpZ25lcnMNCj4gPiBtYXkNCj4gPiA+ICsgICAg
ICBjaG9vc2Ugbm90IHRvIHBvcHVsYXRlIGJ1aWx0LWluIFJUQyBieSBncm91bmRpbmcgWElOIGFu
ZCBYT1VUDQo+ID4gcGlucy4NCj4gPiA+ICsgICAgdHlwZTogYm9vbGVhbg0KPiA+DQo+ID4gUGVy
aGFwcyB5b3Ugc2hvdWxkIGdvIGZ1bGwgRFQgbW9udHkgYW5kIHJlcGxhY2UgdGhpcyBsb2dpYyBi
eSBhIGNsb2Nrcw0KPiA+IHByb3BlcnR5IHBvaW50aW5nIHRvIHRoZSBleHRlcm5hbCBjcnlzdGFs
Pw0KPiANCj4gT0sgZm9yIG1lLiBLcnp5c3p0b2YgS296bG93c2tpLCBSb2IgYXJlIHlvdSBvayB3
aXRoIHRoaXM/DQo+IA0KPiA+DQo+ID4gSG93ZXZlciwgYXMgSSBvbmx5IGhhdmUgdGhlIFNob3J0
LUZvcm0gRGF0YXNoZWV0LCBJIGFtIHdvbmRlcmluZyB3aGF0DQo+ID4gIkJ1aWx0LWluIDMya0h6
IGNyeXN0YWwgb3NjaWxsYXRvciAod2l0aCBieXBhc3MpIiByZWFsbHkgbWVhbnM/DQo+IA0KPiBJ
dCBpcyBub3QgbWVudGlvbmVkIGluIG9yaWdpbmFsIGRvYyBhcyB3ZWxsLg0KPiANCj4gPiBEb2Vz
IHRoaXMgbWVhbiB0aGUgUlRDIGNhbiB3b3JrIHdpdGhvdXQgYW4gZXh0ZXJuYWwgY3J5c3RhbCwg
dXNpbmcgYW4NCj4gPiBvbi1jaGlwIG9zY2lsbGF0b3I/DQo+IA0KPiBJIGFtIGNoZWNraW5nIHdp
dGggaGFyZHdhcmUgdGVhbS4gSSB3aWxsIHVwZGF0ZSB5b3Ugb25jZSBJIGdldCB0aGlzDQo+IGlu
Zm8uDQoNClBsZWFzZSBmaW5kIHRoZSBhbnN3ZXIgZnJvbSBIVyB0ZWFtLCBpdCBpcyBpbmxpbmUg
d2l0aCBjdXJyZW50IGltcGxlbWVudGF0aW9uLg0KDQpRMSkgQ2FuIHlvdSBwbGVhc2UgY2xhcmlm
eSAiQnVpbHQtaW4gMzJrSHogY3J5c3RhbCBvc2NpbGxhdG9yICh3aXRoIGJ5cGFzcykiIHJlYWxs
eSBtZWFucz8NCg0KQW5zOg0KVGhlIFJUQyBvbiBSQUEyMTUzMDAgY2FuIHdvcmsgd2l0aCBhbiBl
eHRlcm5hbCAzMi43NjhrSHogY3J5c3RhbCBvciBhbiBleHRlcm5hbCBjbG9jayBJQy4gU28geW91
IGNhbiB1c2UgaXQgaW4gdHdvIGRpZmZlcmVudCB3YXlzOg0KMSkgQ29ubmVjdCBhbiBleHRlcm5h
bCAzMi43NjhrSHogY3J5c3RhbCB0byBYSU4vWE9VVC4gVGhlIG9uLWNoaXAgb3NjaWxsYXRvciBu
ZWVkcyB0byBiZSBlbmFibGVkIGluIHRoaXMgY2FzZSwgbWVhbmluZyB0aGUgWFRPU0NCIGJpdCgw
eDA3WzZdKSBuZWVkcyB0byBiZSBhdCDigJgw4oCZIChkZWZhdWx0IHZhbHVlKS4NCjIpIENvbm5l
Y3QgYW4gZXh0ZXJuYWwgY2xvY2sgSUMgb2YgMzIuNzY4a0h6IHRvIHRoZSBYSU4gcGluLiBUaGUg
b24tY2hpcCBvc2NpbGxhdG9yIG5lZWRzIHRvIGJlIGRpc2FibGVkIChieXBhc3NlZCkgaW4gdGhp
cyBjYXNlLCBtZWFuaW5nIHRoZSBYVE9TQ0IgYml0IG5lZWRzIHRvIGJlIGF0IOKAmDHigJkuDQoN
ClEyKSBEb2VzIHRoaXMgbWVhbiB0aGUgUlRDIGNhbiB3b3JrIHdpdGhvdXQgYW4gZXh0ZXJuYWwg
Y3J5c3RhbCwgdXNpbmcgYW4gb24tY2hpcCBvc2NpbGxhdG9yPw0KDQpBbnM6DQpJIGd1ZXNzIHlv
dSBtZWFudCB1c2luZyB0aGUgb24tY2hpcCBvc2NpbGxhdG9yIG9ubHkgd2l0aG91dCBjb25uZWN0
aW5nIGFueXRoaW5nIHRvIFhJTi9YT1VULiBUaGF0IGlzIG5vdCBwb3NzaWJsZS4NCg0KQ2hlZXJz
LA0KQmlqdSANCg==
