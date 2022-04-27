Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B461511F5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Apr 2022 20:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244569AbiD0SDl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Apr 2022 14:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244538AbiD0SDk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 14:03:40 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2105.outbound.protection.outlook.com [40.107.113.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93672362522;
        Wed, 27 Apr 2022 11:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUbGs7LapPLG0iZgLc6EIX2nrO5HhPmoYzk8njNSdWRDfdx6BW3EM54o7vVB2BrwVRXCGScbBMGONo+0th2VhhlZLSvtC9qGUXSXrhwlcaVN6EZmCcwFZAh/dwy8Jrvyza28SlaCAYNprj6MqHfCNxXOS2SgwYhmrH7gfQxfUsWS/zO8YW/oZnekOuUnhDzbqisdUYf0d2rl4K9/G8sM5i1N5DJfCsCnpMXz+Uq5i6wusgRn+74Tb6iKrGiMG9vxlXneOMMldYsjgo/u3toVHamoCliKwK1Al9IEIUIaEmWvZf2Ylrbl+jrVLafajFEJlQYUrgKwz1t7LWAfP9pfKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZmxsdEEPVQaGv04I/OO1O6bPr45Dn4+w0qREnnsFAk=;
 b=fdnAO6IICvMkOlVfN0PFXW+hqjUKTYtrIRgodkW5kk23j5qdaJeQcHw+XFcRoMnvOv0xvREyBXQ2zu6TQLkS4HU/7ZSpbm9MIvx1Davk7sl+q1Fz5u5QCE+CAxpMviBIP7TrOFrwG84GJVjOk3KaQTNLJCifrM/7DFQdY1QGw/lpHp7cNDwzbhx/DbipyZJQJc+tyyEpDcRQbIVqdY+0cY4sc7aHxFSYZGMtb9wqnq4b4UoG+F9Ex0AzndEkf5SfSbsLep9uEnPGJwCqEYVirovVrn1wMX3Aiq9KlU+6bRFIM7wPuOlvqcCYmucNGUNSFkqTFqUkVx2XmNlnr/eTsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZmxsdEEPVQaGv04I/OO1O6bPr45Dn4+w0qREnnsFAk=;
 b=QjMCCdsUoeH0voiCLuK8DCHQ06EB6sFnzCFHCjFQH0z/SC8gHE9QHh94gZD2wyAotFsnX9qNlPiaWpbvctnARbBiWW8HtBM2AYomofkOU0OTp8nazcvUde4L22rRvHg7ZK8hXlliNUKxSghMr8T1F8gpPVgAZkQTwqwj3lcERcs=
Received: from OS3PR01MB7080.jpnprd01.prod.outlook.com (2603:1096:604:128::5)
 by TYBPR01MB5310.jpnprd01.prod.outlook.com (2603:1096:404:8022::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 18:00:24 +0000
Received: from OS3PR01MB7080.jpnprd01.prod.outlook.com
 ([fe80::cdb4:632d:77f0:2a23]) by OS3PR01MB7080.jpnprd01.prod.outlook.com
 ([fe80::cdb4:632d:77f0:2a23%9]) with mapi id 15.20.5206.012; Wed, 27 Apr 2022
 18:00:24 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH v2 09/13] clk: renesas: rzg2l: Add support for RZ/V2M
 reset monitor reg
Thread-Topic: [PATCH v2 09/13] clk: renesas: rzg2l: Add support for RZ/V2M
 reset monitor reg
Thread-Index: AQHYREy+dKc7l5AiIEKRCxFSpyU7S60CfngAgAG48pA=
Date:   Wed, 27 Apr 2022 18:00:24 +0000
Message-ID: <OS3PR01MB708084236C44425A51C48B4CF5FA9@OS3PR01MB7080.jpnprd01.prod.outlook.com>
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
 <20220330154024.112270-10-phil.edworthy@renesas.com>
 <CAMuHMdXSRx5XxS0a0OkJd+tiyXmXGxprQkwgWDT9FODLz5=msw@mail.gmail.com>
In-Reply-To: <CAMuHMdXSRx5XxS0a0OkJd+tiyXmXGxprQkwgWDT9FODLz5=msw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28343298-00d5-491a-0faa-08da2877cdfd
x-ms-traffictypediagnostic: TYBPR01MB5310:EE_
x-microsoft-antispam-prvs: <TYBPR01MB531048028B5AB3529511A469F5FA9@TYBPR01MB5310.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GhOnMrExcYtM1XXVx8mogEHHYKYEm7+C24deIq8Mw+SsI0FW6C6zJ19S99iaGBscmr5d6uB74SCZDVdpAkw3CWiVO+30uTrqY07ODBkYUHPtOlh5D9HSIo/Lm7/k3QZfGVuingdqC96TTcSfhaCS1KDDls+Mt7NTWKm8CF/gHzUZCq6pIVNjTTOA/gx/9MqaM9o0UZOPaida7scD30xuOU9D6XNd5SBBqW7nhgawcEsl63xsXWtF+iUlSQI6qJ6rLnYU5lHx4prFr4Xk3jx4QBk9bTh7ht6tTVUrHYdewqHXMem/sGGAwzm0WQnPb9MRqpKPyjY38h3iJaf+0QMDhP2qVufsXSodb58Y8kq8v1rlR8FH+gWhs0oen3F4ErZcotTm8FuJJ3ercBBRoHO2cofuJl1bYX0yA5pCJQE3FFl1YZYjkglQBzy+qkSAKfogA7gj2jr1/lzP9/hUMR1UPmJD+JbzMGPAnTLfhG38pSDmHKWj3XH0PkwWhKo+VvxxZSywAubxCSZWiR55OskE2fHibyhjPzphqjj2tOIs0FbWlxm9uSR1BmHcN8icfNcd2gBFagO855TQ/vTu5I3XTvkMzrgMtkj1AfT/CmjR4q6B6qHi6X99l/TS5Y96V9xck5izEgRBMPolPReht/+5tHHPMeV5u0oanv0/Q/etdoJVKnuEKh3HoRmR4Xk+QjbGxesmczJDRnY1A45dTlDdDA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB7080.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(316002)(55016003)(33656002)(4326008)(8676002)(66556008)(66476007)(66446008)(76116006)(86362001)(64756008)(52536014)(122000001)(6916009)(54906003)(38070700005)(71200400001)(38100700002)(66946007)(6506007)(5660300002)(53546011)(2906002)(7696005)(26005)(44832011)(9686003)(186003)(107886003)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEdITWI3b1E1OGZGclJmREZBUFc1ZkhEMU9PQTA1aS9LSDVYZ0laTXNGQmlh?=
 =?utf-8?B?WWl2QUthbmZoUGlKV2drZ2I3bUlMWHJzQVp4Um9HR2NGcGxTMERoN0diREVm?=
 =?utf-8?B?Syt3a05hT2oyMDhCNnBIQ2lZTk5iZVVpdDg1dTFwaGJCWjNwTlAwb3hCdjBE?=
 =?utf-8?B?eVRKOW9HZjRQdFNuK0xkNWZlakJPdjk3L3pXOUU2a2N5QVhLZzhDKzJoSGRp?=
 =?utf-8?B?dFo0OStaeS8wVjFXY0hzVWZNdkZQa0xwclZ5MEdVSzFydmU2Z1FPSGtsbTlH?=
 =?utf-8?B?Qy91Mm1vZEl6WWViUEx2Rm5PVExCOEcxRU9TZFFMUkhrRFlXVnhuMHJub0Fy?=
 =?utf-8?B?YjEzWDBVdjQ2QWZXU2ZyZFF2YWc4NnExMjdSaVVkUi9GWlM4Z2JOQk4xTlFq?=
 =?utf-8?B?OWt2WjNSenRrNE5tVGNSTkxWNzRpaGE2YVNSSzNZTWdIVVRJOGpIZWFDM05S?=
 =?utf-8?B?SzJRTGdyYkpwQS80dit2bTgveCsrc0pBR0JGWStXR1lieGJOcXZtNVozNVho?=
 =?utf-8?B?dDdiamgvY3FNLzdVWElSNjhUTGlRdXQ4OTQ0UWpaNFZBVkxZSnJRQWtheG5s?=
 =?utf-8?B?a0pReGN5U2xVNHI3ZDlsaDFrSjg2MnVkdFR3dENPVVcxSzFqZDhNLzY5N3Fi?=
 =?utf-8?B?b3pEV3J2YW4vZkJuNW1LbHZnQkZvcnF4TFIzdnRjMjVmWUUvUGdQcFpmcTBR?=
 =?utf-8?B?bTdERzNRYmR6TzlRcmxVdjd3WFhDZnUwSnA5Um1RbFo3T2k1amdsS1hiUFVU?=
 =?utf-8?B?ZnhqK1JPck9ZVVgyNDlQdHBoQ28wemlxU21lV2NmUWg1NWZrbmQ2bEViRTFH?=
 =?utf-8?B?aHk4aXNtY0g1SUlUSUxodkVDNUMwYlRLOFhWeStKaTlTQklmVUZ4azJDemFw?=
 =?utf-8?B?WEFnaGJhVHZWSTNYUjFySFU3aVZpNkZRalNOWEhESVQ4a0VvblhTTzE4U2Fk?=
 =?utf-8?B?UjhWMVNZMlVhZkRKL1lYSit4OTQ5MHdVU2VIaWNRUG5hUmg5SkdLdjVmM3Ns?=
 =?utf-8?B?OVVteVlzV21peHh4dUpFaVRJeS8xNCtWY2RvOFB1N1BJSSs5VzNzditBUUxq?=
 =?utf-8?B?YWpOazlqM3o2K2p3NXBGSlNCbGdyMDJ4c0E3UTVPRFJWVWM5S3NMd2FEQ3M1?=
 =?utf-8?B?OVE4bGU0ekpRRUNRY01Ea3prNk9yLy9RVi9WZ2N3VXRwVjRTQVFUZVdCdWJ4?=
 =?utf-8?B?blIxRmdFWUgvSmdCd0Zqa1g2QUpXc2htNEJZOVoyb2dMUWJWZ0ZteWlOa0ho?=
 =?utf-8?B?ckNlRWgxNlJVbXlHdTZZVjhGNWVCaHl2bXZ5T0JoTzNiOU5ueURZRXZZUjJy?=
 =?utf-8?B?QXB4c2I1dy9tcVNNTzBwN1lzdGFvMm5RV01JdVpEMlgydTBWcis1QlI2Snlv?=
 =?utf-8?B?M0hzS1NuUGx4eTU5RXV4aE1ENk16Z2pzclBwZXYvd3hCZXIweE15ZXU0UXRj?=
 =?utf-8?B?L1VzZ3ptOW5YSDhXL3hSdU5iT2ZNaFZrSWdPWUM5ZUNDNThGd2NnWWdpR1Nx?=
 =?utf-8?B?RGkxS2tKWVhMdVYwQ3FZSURBTmx0TmdsZjRLTXcySWhRdnFQMzBqL3ZPeGJk?=
 =?utf-8?B?c1ZhcytZNXVPQTNUOUlBcUFNc29weTl6Q3YvTGg5cW5FMHdQSVEwc0hLNFpm?=
 =?utf-8?B?em90M0Z6bi9PRjFCL0RNcnlWVzh3Q3RhMklUWjRIY0QwbUkxajlpcm5pWjlM?=
 =?utf-8?B?MkFwOWxJRWJIVVBld25oN2ZSbVVMWC9TZnBteWxrMXlFd2V6RENxbkZaUWNn?=
 =?utf-8?B?ZkFOK1lQa291bWtsUmZBeUxyTDV5cGNyMmltVXUzUWFiYnBncTBXQXYwZSty?=
 =?utf-8?B?bWl4R2RVM3cxc0N1U2Q2WkVzZGdLQ0MybVRmRVNwTkh2YTBtZWQ4b1VONVRX?=
 =?utf-8?B?ZzFGVEQ1U3pBRUdnVit2ejdPU1lUZU1mS3lXdlcvUWJLYVhoL1lrMG4ySk9m?=
 =?utf-8?B?TEpCUVVUMGFBQnFQNnhoMlk3T1hpell2eGlUNUVHT1BpeW5oK3p1cDJ5Tkow?=
 =?utf-8?B?T0YxMEU3cGlMNmxzR1RON2JrSWhhbThPckx0dWh6UkRVV28rakdXeDdyL0U3?=
 =?utf-8?B?MHFtSjJza1o0L2RpNXdNT2RRbktqeTE5aGNTa1NJTm1KcWNVYURKNHdoMDVT?=
 =?utf-8?B?VU5vQ2ZZT0dpYitUa0FUVmd2dXBJTUFuSTk4VnhYRmJTcDRCOHEwWkx0bzBw?=
 =?utf-8?B?YkE2Qm94djg3Ni8rZnZYVEFHZXVHL001ZzFTZTFUZnJtejU4WnphQUdVazlt?=
 =?utf-8?B?Z2NqcXdaUmRnTEh6VkJ3V1pEU1BpRnZYVVErWGlIRldOcEhSTXN4cUU5VEdp?=
 =?utf-8?B?UUJSZVRHbUN4eFRWWHhYQXRmVmw2dnhzM0JwRmVYK0phQ2ZSeitjNy9kUGlO?=
 =?utf-8?Q?rg3n370zuvGzh55A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7080.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28343298-00d5-491a-0faa-08da2877cdfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 18:00:24.8323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ay+1TzC+9LbvFuQo9VtMY8UxugUlq1EF2d/XP8HYt3Tkrw73BZk+A7apUMrCAnvr8DNmSgWOT/yMojVw6TD7Wi8lW7qGk80I+ZW5X1ZaT3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5310
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uICAyNiBBcHJpbCAyMDIyIDE2OjM3IEdlZXJ0IFV5dHRlcmhvZXZlbiB3
cm90ZToNCj4gT24gV2VkLCBNYXIgMzAsIDIwMjIgYXQgNTo0MiBQTSBQaGlsIEVkd29ydGh5IHdy
b3RlOg0KPiA+IFRoZSBSWi9WMk0gZG9lc24ndCBoYXZlIGEgbWF0Y2hpbmcgc2V0IG9mIHJlc2V0
IG1vbml0b3IgcmVncyBmb3IgZWFjaA0KPiByZXNldA0KPiA+IHJlZyBsaWtlIHRoZSBSWi9HMkwu
IEluc3RlYWQsIGl0IGhhcyBhIHNpbmdsZSBDUEdfUlNUX01PTiByZWcgd2hpY2ggaGFzDQo+IGEN
Cj4gPiBzaW5nbGUgYml0IHBlciBtb2R1bGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQaGls
IEVkd29ydGh5IDxwaGlsLmVkd29ydGh5QHJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jDQo+ID4gQEAgLTc0OCw4
ICs3NDgsMTIgQEAgc3RhdGljIGludCByemcybF9jcGdfc3RhdHVzKHN0cnVjdA0KPiByZXNldF9j
b250cm9sbGVyX2RldiAqcmNkZXYsDQo+ID4gICAgICAgICBjb25zdCBzdHJ1Y3QgcnpnMmxfY3Bn
X2luZm8gKmluZm8gPSBwcml2LT5pbmZvOw0KPiA+ICAgICAgICAgdW5zaWduZWQgaW50IHJlZyA9
IGluZm8tPnJlc2V0c1tpZF0ub2ZmOw0KPiA+ICAgICAgICAgdTMyIGJpdG1hc2sgPSBCSVQoaW5m
by0+cmVzZXRzW2lkXS5iaXQpOw0KPiA+ICsgICAgICAgdTMyIG1vbmJpdG1hc2sgPSBCSVQoaW5m
by0+cmVzZXRzW2lkXS5tb25iaXQpOw0KPiANCj4gQklUKC0xKSBpcyBub3QgZGVmaW5lZC4uLg0K
PiANCj4gPg0KPiA+IC0gICAgICAgcmV0dXJuICEocmVhZGwocHJpdi0+YmFzZSArIENMS19NUlNU
X1IocmVnKSkgJiBiaXRtYXNrKTsNCj4gPiArICAgICAgIGlmIChpbmZvLT5oYXNfY2xrX21vbl9y
ZWdzKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gIShyZWFkbChwcml2LT5iYXNlICsgQ0xL
X01SU1RfUihyZWcpKSAmIGJpdG1hc2spOw0KPiA+ICsgICAgICAgZWxzZQ0KPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gISEocmVhZGwocHJpdi0+YmFzZSArIENQR19SU1RfTU9OKSAmIG1vbmJp
dG1hc2spOw0KPiANCj4gLi4uIGhlbmNlIHRoZSBhYm92ZSBtYXkgYmVoYXZlIGJhZGx5IHdoZW4g
dGhlIHJlc2V0IGhhcyBubyBiaXQgaW4NCj4gQ1BHX1JTVF9NT04gKDY5IHJlc2V0cyBkbyBub3Qg
aGF2ZSBhIGJpdCBpbiBDUEdfUlNUX01PTikuDQoNCkFoLCByaWdodC4gVGhlIFNvQ3Mgb3RoZXIg
dGhhbiBSWi9WMk0gaGF2ZSBtb25iaXQgPSAtMSwgYnV0IHRoZXkgYWxsDQpoYXZlIGluZm8tPmhh
c19jbGtfbW9uX3JlZ3MgPSAxLg0KU3RpbGwsIEkgdGFrZSB5b3UgcG9pbnQgdGhhdCBpdCdzIG5v
dCB2ZXJ5IGdvb2QgY29kZS4NCg0KDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcy
bC1jcGcuaA0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmgNCj4gPiBA
QCAtMTgsNiArMTgsNyBAQA0KPiA+ICAjZGVmaW5lIENQR19QTDNfU1NFTCAgICAgICAgICAgKDB4
NDA4KQ0KPiA+ICAjZGVmaW5lIENQR19QTDZfU1NFTCAgICAgICAgICAgKDB4NDE0KQ0KPiA+ICAj
ZGVmaW5lIENQR19QTDZfRVRIX1NTRUwgICAgICAgKDB4NDE4KQ0KPiA+ICsjZGVmaW5lIENQR19S
U1RfTU9OICAgICAgICAgICAgKDB4NjgwKQ0KPiA+DQo+ID4gICNkZWZpbmUgQ1BHX0NMS1NUQVRV
U19TRUxTREhJMF9TVFMgICAgIEJJVCgyOCkNCj4gPiAgI2RlZmluZSBDUEdfQ0xLU1RBVFVTX1NF
TFNESEkxX1NUUyAgICAgQklUKDI5KQ0KPiA+IEBAIC0xNTEsMTcgKzE1MiwyMiBAQCBzdHJ1Y3Qg
cnpnMmxfbW9kX2NsayB7DQo+ID4gICAqDQo+ID4gICAqIEBvZmY6IHJlZ2lzdGVyIG9mZnNldA0K
PiA+ICAgKiBAYml0OiByZXNldCBiaXQNCj4gPiArICogQG1vbmJpdDogbW9uaXRvciBiaXQgaW4g
Q1BHX1JTVF9NT04gcmVnaXN0ZXIsIC0xIGlmIG5vbmUNCj4gPiAgICovDQo+ID4gIHN0cnVjdCBy
emcybF9yZXNldCB7DQo+ID4gICAgICAgICB1MTYgb2ZmOw0KPiA+ICAgICAgICAgdTggYml0Ow0K
PiA+ICsgICAgICAgczggbW9uYml0Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gLSNkZWZpbmUgREVGX1JT
VChfaWQsIF9vZmYsIF9iaXQpICAgICAgIFwNCj4gPiArI2RlZmluZSBERUZfUlNUX01PTihfaWQs
IF9vZmYsIF9iaXQsIF9tb25iaXQpICBcDQo+ID4gICAgICAgICBbX2lkXSA9IHsgXA0KPiA+ICAg
ICAgICAgICAgICAgICAub2ZmID0gKF9vZmYpLCBcDQo+ID4gLSAgICAgICAgICAgICAgIC5iaXQg
PSAoX2JpdCkgXA0KPiA+ICsgICAgICAgICAgICAgICAuYml0ID0gKF9iaXQpLCBcDQo+ID4gKyAg
ICAgICAgICAgICAgIC5tb25iaXQgPSAoX21vbmJpdCkgXA0KPiA+ICAgICAgICAgfQ0KPiA+ICsj
ZGVmaW5lIERFRl9SU1QoX2lkLCBfb2ZmLCBfYml0KSAgICAgICBcDQo+ID4gKyAgICAgICBERUZf
UlNUX01PTihfaWQsIF9vZmYsIF9iaXQsIC0xKQ0KPiA+DQo+ID4gIC8qKg0KPiA+ICAgKiBzdHJ1
Y3QgcnpnMmxfY3BnX2luZm8gLSBTb0Mtc3BlY2lmaWMgQ1BHIERlc2NyaXB0aW9uDQoNClRoYW5r
cw0KUGhpbA0K
