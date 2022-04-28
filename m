Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C07AB51345A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 15:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346607AbiD1NGN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 09:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346514AbiD1NGM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 09:06:12 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0436584ECE;
        Thu, 28 Apr 2022 06:02:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFSGH1/yGnFMCKMxMJLKIAhJ9hYDlOlYHZa4zAjK/KjT1zq6S3lKCiij/1Njly8yI/plODPh1Pl1qO2VtWGBXZoLhI8w/aSCNTcrhD+El18n35JhcAL9APKkR4oJ71Oi6qoPNchOCrmbkXOEfBhCOKUTg72LeihjWbFmF9ueywm/A9f8X/q9oO1Ssb4TQzMhJrKJ5c6GpuA9ev3jCwdO1YKYq2L+IDEJlyvyYuLaWpnX6F0DKG0TiQrla79+f/n6DhszzMnFTJePP879/s5/dMjLxgaB9w330I+5hMLCcxYW2nUJY0342n5qu+WZqwlpETc2k18bttOmd6NpYtb7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BGiMzYHLe1SiG3Bv4Xmu3rfFJcPaC2dDzShHZiK2nY=;
 b=C/o0VYm5Y7nqj1uOc79APWpPDs7k76yHlKVYzVJvYAPmQZKjhS0kiwuFcrbTQOdl9ut0Soeip5dY642bgt/93Qz1aCPY4VNjojdHhU2w1Eb49sXHwfj6KDhaPSXgCv1OI4jyHHbwXRCdbTFc9TpewHUrgYRI2aku/ckwbsgESTGi42/vWFFcEF3uBJGxfnqu1yoEirEF6xfSFH/LPNahOC7RwQPpbaUJJF5MLqbWUQA22EOkgeu+pUw5lXVgGSx7ndGU4YW4jj2ffXsjHxlAogsa/mmpOd0i8IO4c/FC+V5D275PklJnQzKL/gR9Gp+yl6fzHBO717tadHtZGk6VYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BGiMzYHLe1SiG3Bv4Xmu3rfFJcPaC2dDzShHZiK2nY=;
 b=aESxZmlR8wKPwnR4PyLudVHzY+wJr4fDjOdmOrgJACJZZXias+5SL4zZ/DEO8muHvjAVK1A6kUK33HOHzbW7oFWtqixlnwHLHXLfnl8z81wAKymZXzkrLYYi/bjj3A1PM8G9p4dm/xCfTHs38QpQGkayEXRdv0HDXxVoEYVt3r0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYXPR01MB1485.jpnprd01.prod.outlook.com (2603:1096:403:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 13:02:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.014; Thu, 28 Apr 2022
 13:02:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 1/2] arm64: dts: renesas: r9a07g044: Fix external clk
 node names
Thread-Topic: [PATCH v3 1/2] arm64: dts: renesas: r9a07g044: Fix external clk
 node names
Thread-Index: AQHYWTh6kQZc0W/mKEegGgWuGhqdXq0FRnUAgAAGHSA=
Date:   Thu, 28 Apr 2022 13:02:54 +0000
Message-ID: <OS0PR01MB5922AB2A88DF1BA3751F2A8086FD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220426064002.9411-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdX5k5nsczGBPrO8HTio_8yONyLbs6JYBDBBLGrv0nzvMw@mail.gmail.com>
In-Reply-To: <CAMuHMdX5k5nsczGBPrO8HTio_8yONyLbs6JYBDBBLGrv0nzvMw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d200adfa-5dd6-485d-08cd-08da291768c3
x-ms-traffictypediagnostic: TYXPR01MB1485:EE_
x-microsoft-antispam-prvs: <TYXPR01MB14857A07F3910323C3DFED9286FD9@TYXPR01MB1485.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s8wii0yDZPK/OMAv1lfpTGskH/3xh73IN6TAPgk7XFtDTmkwCXNdU0zLrgHCWlpJQdik5Xy9912a/LJTis52AqxAoZizV+0fJNGRWFWF38Yz0ijDFd8tEy7gkEDIs2cuJ1eHQEx3YkbaJrmkJZdiZ7jGHIM3dpkIEkljkOyMG1I9Unhqqi5J9nbimz8fKPT6JwbHcVtTfIH2/USEYol55JEk2MRhFrY7fExDDvbb+DUxit9o5xvhWdmD0a+p7xTfShYQqO47lixg4GTwOAl2zH0JbpTVOOIq/9DFdKgtGsQiHFA9wbd6L0SmvlPFYkY36BUUVB0nQO/euxoAvylWN2GL57znpgWDqKk3pGSxlPsADYG8kkE2/+dVt01YvbXBgzg9uBrWrwaPkseEBOXb/IM8leEkLG5FjDrI6fyooQwRvexM+Zl04f8zW+CoTqsg7+XlJ2aEoehp8fPTQoeaIvn9qAF8TzoU3D+aQkiHdBG2o3zFsabaMBULEiJ4M94VwhDSoapkF9HqI8HyLwNITokzoeBJDpYwoOCJL/oIpQb/ADm65xr7IOfrc1vmuBT42sYxz4D7bdhfam6z02OhSJi+GDaubjvg+x+N2j5bIqCIVe8QlJwJ5uApmVtf5Br6E3XIgTAvUExcF98fnYPDI8PI1fglfDEBuClRV3ISOil04fC6y2jPc28utfxKSaoWKsVy9U2zaQIcdiD0vAoxFg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(66476007)(26005)(71200400001)(7696005)(66556008)(66946007)(66446008)(316002)(64756008)(38070700005)(9686003)(38100700002)(54906003)(83380400001)(4326008)(122000001)(508600001)(6506007)(186003)(53546011)(6916009)(86362001)(107886003)(33656002)(2906002)(5660300002)(52536014)(8936002)(55016003)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTJpOXpHMUlDSDZpT0RNeXk1YTJodHBablAxUU4yRi9GSkxlY1BUc0piamg1?=
 =?utf-8?B?bXRLUmRlTkVlTmpSaFlCVCtSN2U4a1VCVnhuNFpGcllJS2xQcExoZThQY3Uw?=
 =?utf-8?B?TFphTFdWQjJ5dXBBN1NtYmVhT25RQ1ZHTksyZS9LVFRDWjBhV25MZk1mRUdh?=
 =?utf-8?B?OCtWUnBUUThTMzhZcEFhTHNScUFBYmtDTHZ0YmErVHVqbHN5eUdTc0JwVE9t?=
 =?utf-8?B?Sm0rczNRTjlxdXcyTnFLRS83OUptc3UrUVNWd0kweWZCTGFMa1FIMzlqZ29r?=
 =?utf-8?B?OUU0Nmg1NG1LeHVSTG5yVDRLSmloNUM2OTVzSDYrcUdTK1Z1OWFoWG1qaXoy?=
 =?utf-8?B?UjJyUXBQWTF3NGlXSTJOTTQyditqeXArakU3RjcwSnFUQWNlemg3bTZPS3o5?=
 =?utf-8?B?SllRSUVOa2p1eUE4b1JKTDdWMWZwUGtNT3dPUHN0bUhadExBODRueFdkVzFJ?=
 =?utf-8?B?bjhjMU1qbmVFNHhtMmVDZDBSOFhKbFIvWlpuMWdWSVpiZEp4T0x4Q0NoMHJn?=
 =?utf-8?B?UTREb1Z4ZU5KOFNONUt0MXhYUmkwWUkwOE13SU5idmw5QXRkV0JkM3B5Um96?=
 =?utf-8?B?RXFjcFFGWmhETG9yMmpwRGZPckNNNnVzSFpGUnE2WU41djFjM2puZU55UE5N?=
 =?utf-8?B?L3h5ZWFLNnhYK1lKd1I1VUhrWFVwalovWEZsanFZaDl0SXZ6QjhSOTBudG5T?=
 =?utf-8?B?QUlEKzBINkF3UXVzN3I1MXhyVU1RTU5wQi9LdXBDQ0dQZmdRTEp1STFQdjNu?=
 =?utf-8?B?emE5a0EzUU9nNkVsTS82a1Qxb2ZTT1BoYW10K0FaY3d6NERNdTB6WW04VFZS?=
 =?utf-8?B?am9vSVhTeWpJdThjK0ZuNnk2ZHlOUUQycUN6MHV0OXhjd0h4MGV0TmRXWkdI?=
 =?utf-8?B?cklyTnJ0WTRacFlMS2R6b05XQ05IZzRYV2xiMXhSb055aFkwZ2hLaDJSTFVH?=
 =?utf-8?B?dk5JeU8zZ3BCMC9qVjJCVnlaM1hob045dE9uNVZpbThXdHoyVEF0QW5LakF4?=
 =?utf-8?B?bUdsUTljNG9IVE9XWDdKMi9sR24wS0JVNmp2VGpZaU5vT0M2RTV3b2FtNEdP?=
 =?utf-8?B?UFdBMVcxR2hXRmZjK3JNR015SjZmUVYrUHRNaStsYVNtdWRWVjkzUS8rZmdp?=
 =?utf-8?B?b1h3OVlDMVltSkU2dEhJVTQ4aWVLMExjUUJpcGVzdGFkZUFlMTROZ2RvbUlZ?=
 =?utf-8?B?d2VwZ3hhdE1kb3FGRnhOVzFrb0ZybkZtRGxhYlYzVlFxWHhFZjU0eTJNLzJB?=
 =?utf-8?B?Z2xBK2ZPMHpDRjRjUWc1Y0FpZFJaanZjNExBQjEyYXR3TG1uenBYSk1xalk5?=
 =?utf-8?B?TjlCbjNKQWFnQVlSV1NldzBHaXE4MWdBdE4wQXNRWmY2THowcGNYdlhxS3VK?=
 =?utf-8?B?MWFKWEdDdTNvRmhUaVlSTG13ZE5BTnNERmN0UWhpWGhpNWtpZ0ZNTUloT1gr?=
 =?utf-8?B?OSt5aXRpdVZJblNmR0prWUxTWWE2UzZEamVveUZlMXhuODkvblR3bTVwUVl0?=
 =?utf-8?B?ZUxVRi9PT0hObXljMEFjb2NrUXpHZ0VWN3BRV0t1bFRQNHVONmlpNUpWZ1px?=
 =?utf-8?B?NDU3WDJYTFZSUXpRRkZMT3M2L1lPNEJGanh4RElzN2dQVnZscDFyZE4vY3NU?=
 =?utf-8?B?RFdXNmRYVmZhS2FwSmVkRGYweTN5UTFpb3lzYTViQ1JLMzVyMDFXQXY5dlZR?=
 =?utf-8?B?NHRrM2VUSWlPVThJMDF2N3ppY3dtMkExTmFxV1NGOVpvN2RzQmJQZmQ3TmV3?=
 =?utf-8?B?ZmxadmZveFpBZkFGQ2NTVHlmTmxHaGY3RkhxZTM0THJnSUJxVEl1QXFMd2Vv?=
 =?utf-8?B?YnBHMjFPb2U1SlNhOWtqR1VQcVJqR3hEbkhPa3hQOUI2b1ltbUNTcWs3TExk?=
 =?utf-8?B?TnRpTkhydUhvWHkyVXp1anFRR2Z3TnBVazJYM3ljdVlSZEFzc1FmRTJPNmlQ?=
 =?utf-8?B?QlZhM25xOHZ1bVZrVzg3UWg5RS9RL3JHbUNaU1drd2ZxekpHc1N6aGdTV0g4?=
 =?utf-8?B?c0NzVWNPODhMT3IyOG11ejZNdlFXeEx0T045aFZ3dVh4WFJ6WHp1eUo1cnEy?=
 =?utf-8?B?UXZLNVk3NjU2d2tvWnNtTXpXV0ZxaVZ4VGVGVXN2ZFZ1dWh2ZXd4b3pzeEEx?=
 =?utf-8?B?RGZIYXRobnpYUFByU29xcFB6TFUwSlhQL3Q0aUtOeVJCREVqR0V2L1NSbnhS?=
 =?utf-8?B?ZmpxVGswSjFBaXlDVUZISXkwT1ZsWG4vSHRBS0JGTks5cnBBdnBvaVJyRXJJ?=
 =?utf-8?B?WThKZnIwRlNibi9ENXZVRWluQ1o3MG1RNU16cjNHZHNQaERrUHNNS3hNd0o2?=
 =?utf-8?B?WmZyRUo2anBJSm5FU3NNRDVINURwSnV5ZWVzOXoxNDVld1o0cG4yOWxQZGZQ?=
 =?utf-8?Q?/j3BHyQ6X0zGvKxw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d200adfa-5dd6-485d-08cd-08da291768c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 13:02:54.4632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8QNDCs7fvS66J5FiUQhMGd/N9Xpdtfn41jCqdC9JYjXJVCC8VAYvWlYMmQIsaqNRh7xdVNhLJc3C7vkTrWOImX8kApZLOJ/MQK7WU+mQWPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1485
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMS8yXSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwN2cwNDQ6IEZpeCBleHRlcm5h
bA0KPiBjbGsgbm9kZSBuYW1lcw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgQXByIDI2
LCAyMDIyIGF0IDg6NDAgQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiB3cm90ZToNCj4gPiBBZGQgc3VmZml4ICctY2xrJyBmb3IgY2FuIGFuZCBleHRhbCBjbGsgbm9k
ZSBuYW1lcyBhbmQgcmVwbGFjZSB0aGUgY2xrDQo+ID4gbm9kZSBuYW1lcyBhdWRpb19jbGt7MSwy
fSB3aXRoIGNsay17MSwyfSBhcyBwZXIgdGhlIGRldmljZSB0cmVlDQo+ID4gc3BlY2lmaWNhdGlv
bi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2Mi0+djM6DQo+ID4gICogU29ydGVkIGNsayBub2RlLW5h
bWVzIGFscGhhYmV0aWNhbGx5DQo+ID4gdjEtPnYyOg0KPiA+ICAqIFJlcGxhY2VkIGNsayBub2Rl
IG5hbWVzIGF1ZGlvX2Nsa3sxLDJ9IHdpdGggY2xrLXsxLDJ9Lg0KPiANCj4gVGhhbmtzIGZvciB0
aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlh
MDdnMDQ0LmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdn
MDQ0LmR0c2kNCj4gPiBAQCAtMTMsMjkgKzEzLDI5IEBAIC8gew0KPiA+ICAgICAgICAgI2FkZHJl
c3MtY2VsbHMgPSA8Mj47DQo+ID4gICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsNCj4gPg0KPiA+
IC0gICAgICAgYXVkaW9fY2xrMTogYXVkaW9fY2xrMSB7DQo+ID4gKyAgICAgICAvKiBFeHRlcm5h
bCBDQU4gY2xvY2sgLSB0byBiZSBvdmVycmlkZGVuIGJ5IGJvYXJkcyB0aGF0IHByb3ZpZGUNCj4g
aXQgKi8NCj4gPiArICAgICAgIGNhbl9jbGs6IGNhbi1jbGsgew0KPiANCj4gT0suDQo+IA0KPiA+
ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gPiAgICAgICAg
ICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Ow0KPiA+IC0gICAgICAgICAgICAgICAvKiBUaGlz
IHZhbHVlIG11c3QgYmUgb3ZlcnJpZGRlbiBieSBib2FyZHMgdGhhdCBwcm92aWRlDQo+IGl0ICov
DQo+ID4gICAgICAgICAgICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwwPjsNCj4gPiAgICAgICAg
IH07DQo+ID4NCj4gPiAtICAgICAgIGF1ZGlvX2NsazI6IGF1ZGlvX2NsazIgew0KPiA+ICsgICAg
ICAgYXVkaW9fY2xrMTogY2xrLTEgew0KPiANCj4gImNsay0xIiBoYXMgYSBoaWdoIHJpc2sgb2Yg
Y29uZmxpY3RzLiAiYXVkaW9fY2xrMTogYXVkaW8xLWNsayI/DQoNCk9LLg0KDQo+IA0KPiA+ICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gPiAgICAgICAgICAg
ICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Ow0KPiA+ICAgICAgICAgICAgICAgICAvKiBUaGlzIHZh
bHVlIG11c3QgYmUgb3ZlcnJpZGRlbiBieSBib2FyZHMgdGhhdCBwcm92aWRlDQo+IGl0ICovDQo+
ID4gICAgICAgICAgICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwwPjsNCj4gPiAgICAgICAgIH07
DQo+ID4NCj4gPiAtICAgICAgIC8qIEV4dGVybmFsIENBTiBjbG9jayAtIHRvIGJlIG92ZXJyaWRk
ZW4gYnkgYm9hcmRzIHRoYXQgcHJvdmlkZQ0KPiBpdCAqLw0KPiA+IC0gICAgICAgY2FuX2Nsazog
Y2FuIHsNCj4gPiArICAgICAgIGF1ZGlvX2NsazI6IGNsay0yIHsNCj4gDQo+IGF1ZGlvX2NsazI6
IGF1ZGlvLTJjbGs/DQoNCk9LLCB5b3UgbWVhbiBsaWtlIGF1ZGlvX2NsazEsICJhdWRpb19jbGsy
OiBhdWRpbzItY2xrIg0KYXMgIjJjbGsiIGlzIG5vdCBnZW5lcmljIG5hbWUgZm9yIGNsaz8NCg0K
UmVnYXJkcywNCkJpanUNCg0KPiANCj4gPiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJm
aXhlZC1jbG9jayI7DQo+ID4gICAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsNCj4g
PiArICAgICAgICAgICAgICAgLyogVGhpcyB2YWx1ZSBtdXN0IGJlIG92ZXJyaWRkZW4gYnkgYm9h
cmRzIHRoYXQNCj4gPiArIHByb3ZpZGUgaXQgKi8NCj4gPiAgICAgICAgICAgICAgICAgY2xvY2st
ZnJlcXVlbmN5ID0gPDA+Ow0KPiA+ICAgICAgICAgfTsNCj4gPg0KPiA+ICAgICAgICAgLyogY2xv
Y2sgY2FuIGJlIGVpdGhlciBmcm9tIGV4Y2xrIG9yIGNyeXN0YWwgb3NjaWxsYXRvcg0KPiAoWElO
L1hPVVQpICovDQo+ID4gLSAgICAgICBleHRhbF9jbGs6IGV4dGFsIHsNCj4gPiArICAgICAgIGV4
dGFsX2NsazogZXh0YWwtY2xrIHsNCj4gDQo+IE9LDQo+IA0KPiA+ICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gPiAgICAgICAgICAgICAgICAgI2Nsb2NrLWNl
bGxzID0gPDA+Ow0KPiA+ICAgICAgICAgICAgICAgICAvKiBUaGlzIHZhbHVlIG11c3QgYmUgb3Zl
cnJpZGRlbiBieSB0aGUgYm9hcmQgKi8NCj4gDQo+IFNhbWUgY29tbWVudHMgZm9yIHBhdGNoIDIv
Mi4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJ
biBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15
c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
