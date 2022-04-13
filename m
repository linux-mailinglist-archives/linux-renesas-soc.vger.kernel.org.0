Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D174FEBFC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 03:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbiDMBCV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 21:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbiDMBCT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 21:02:19 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2121.outbound.protection.outlook.com [40.107.114.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D3E220D9;
        Tue, 12 Apr 2022 17:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkmlv/B+2YV7acd0TBif6VThMOZCiRwO7F6aUV6P75XgsPodcN3YSbRDwS7YMesfH1FwXjvC/rPAL0u+P4rjiz/ipTPJhxUEIC4D86Nx14WGaqicanGW6EKfG7Q1HMGutGYtSv/fqZWchpc14lZY9EDtHcRCg/NqkAb6Cp51h7ItAuTYppSNx1OqGMXVzf2mkpcdzmza9RWS7YIMrHXoJCbrPSAfRdlXUYhZcNUSzMFolR+Lc896RVbOl9eSsPgkpFVarnbYPmNeoP0KfACFwww4FwrQXHvySSNyWsfWI7dmMGusQ4S6yCF4aSowj0JzITwfOL8p6EYuPMDjPxT9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6tVmbAFL/NkQoeiFP981GZeHAjG/wzK38/ZYfwQP7c=;
 b=NgIdtPu7m7b/RF8c58gLT5ploX/HBB3KL5ydJswBdPsOrpcmQi+IpzJVR2iXroSE5DGzr8mbKKPfULu1n0C674VG7UThmM2iEGjsYJvqGEO4JqiYDJtFqDw95rnrYE0Smqb1+RvU6goup8geZ+p/S0mHDwT3ygeAB4+aJBjms2JVPDOqo2u1TyOeElPB6lMYIA3++gIzhkMSFb/wIpmSmIzdL3uj7mvJmJXvlZUAJ/vQTYUhxu3Ezqa7g+tVYE+ONdwmy19PSTiYnepj31NaslHY1mJqITTbDoSa2bClIgI+W9vzM1li3CPST341eHTr+mXZgKU/khrGe/tgNo7n0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6tVmbAFL/NkQoeiFP981GZeHAjG/wzK38/ZYfwQP7c=;
 b=m7deKGBVRPj+t3XaKprTF2Mr/Y3me4LoXfk1mkt2CEOZ5EkdQv0IF/sqThJrC/P/gY1C2TSIG+lAWMeKPdpagPF2fW7V9/OemtGhl24XzRXGHIfXGyjxR1IAkzvd4frCrRLT4cm1KRb/VOWyiZvlWK6z1tis2bC97auhiZEWCxg=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY2PR01MB3995.jpnprd01.prod.outlook.com
 (2603:1096:404:dd::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 00:59:56 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%7]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 00:59:56 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC:     "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/7] dt-bindings: ufs: Document Renesas R-Car UFS host
 controller
Thread-Topic: [PATCH 1/7] dt-bindings: ufs: Document Renesas R-Car UFS host
 controller
Thread-Index: AQHYTkAd1PLNw/zDJ0++B1PYIXfYWqzsM64AgADI7bA=
Date:   Wed, 13 Apr 2022 00:59:56 +0000
Message-ID: <TYBPR01MB534177B93A0D38B88427A58ED8EC9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220412073647.3808493-1-yoshihiro.shimoda.uh@renesas.com>
 <20220412073647.3808493-2-yoshihiro.shimoda.uh@renesas.com>
 <ad2a3830-d77e-7460-42f2-03dfbddc42f4@linaro.org>
In-Reply-To: <ad2a3830-d77e-7460-42f2-03dfbddc42f4@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b138a46-c5f0-4706-809a-08da1ce8ed15
x-ms-traffictypediagnostic: TY2PR01MB3995:EE_
x-microsoft-antispam-prvs: <TY2PR01MB3995B8047AFA546F7E3E0413D8EC9@TY2PR01MB3995.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U031Vw5ZjyNBox5heusKtdzSLLl0b0Lqd0IlX7wJt4xuKk6RiD2M/4GHhXyirohBp6lDjYqkL+fpleTXcyqClChnz4QIIkSbEoFpnR4fxREmc2POPD34bcXoIIA2imq3mGMsNOhesILVNWlZLE06YBvYmpuf6zWIZIqVkbhiiSZTV8Iid252dZW6AucjZD6MbZiDNbxmw2goTLJiXPWGChtIrklousDHDEuYyVbcOwy5VQVtl/o5jBNQJCUVNMyrorkj1nDvYIxQChOv7zEvuNvH1YF9SHASEO2Ilx8Y8fV79634uLN+BQOns/F6iuRpy7zOMQ7maaMSox9bnLO0fgZC0NFORgfHPH00xTWnz2yl/WF6afI0Go0EGL3waG7aiNrmyUsW5mTgmvdEffKCIucV0uIdbFKvyd7jJOIqmwJ3arEHMqLc9TCSjwJtw+3xwgWuVn4cQWPzeQOMhm3Zqwjy0zk3wWbeThshEQXnenmEo8b543P1jpB08j7EDThYaHLTuDbuhy8wXSHGnXiUXNcuc+ppQeqnotvez1ll/5HuU83slguxJFOrMYWEk6hSSKYKIsoTV7IcydK9yCjpo+6ofi406QUebNfyqqrMkp3FGoZdr3sWLGrqT/nffTkMbfp58/NZnc8I672f7+uHL5E489p156SHenYCR384yRY4vTPZNFgW1imP1RebYB2uP1B+bG23HootPb6IXCbgMg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(316002)(122000001)(71200400001)(54906003)(110136005)(38100700002)(2906002)(8936002)(86362001)(83380400001)(52536014)(5660300002)(7416002)(66946007)(66476007)(64756008)(66446008)(66556008)(38070700005)(8676002)(76116006)(4326008)(186003)(508600001)(7696005)(9686003)(6506007)(53546011)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjhnTGdldFc2WGVlV3dObW0vVkd1bVhFN0NUMFdvaVdQL3g3UWk5STVoNEE2?=
 =?utf-8?B?djBHa2tSUUI0cmYvdGplUnpqSFA1VXpmZ0lhZFdjcW02Z0FxVXc1RHVHK05Q?=
 =?utf-8?B?R3NtbC9ZK2VZc0pvcCsrekVjc21aZTYwc3VpTFdteThBM1FWaEhGQ0NOaTBZ?=
 =?utf-8?B?YWd6aWpJTVNVVmNyL0YwVXp4TU9xc3dMYnNHdkwxY2dLSzdVUDR4dExqL0Nn?=
 =?utf-8?B?bnFhQTg1MndQT3VhQzdET3liSTZ3d1RVTWh3UTdVQW12Ukk3SEtvZ1E4ME4w?=
 =?utf-8?B?bmlOc1V5Vll6c0JLNUYzN0FtR0ZVb3R3L2k3SWlJekxLSFpKOXM0TW5tVHpl?=
 =?utf-8?B?VnNud1Bpb0FmaHdVaGc3QjF1bW51OEJROEQwQkpnQ1ZZdXcxaWNXWEVPU1N4?=
 =?utf-8?B?N0tnODAyTXZZcE1KQkVsVkRTclV4MUlzS3luMG9qZllwaUJjTlA5S1cyOUpZ?=
 =?utf-8?B?RFdnNWhoRW4xM0pRQzZBdHQwZjJZUTJxei9xTGpsVGRtcTl5SDFYMklEZXpk?=
 =?utf-8?B?ODI4M0MydDdEZDZybW04K0JLaE96OWpxejk5d3J0S3pMc2gvWklBd1lZU2F3?=
 =?utf-8?B?Q0xlYUtIdldsQW83a1BKajJKQkZCWHhuTU5SQlcrUFlGUTMxZnhCTnFCc0Vn?=
 =?utf-8?B?amRHdzh6NFZPSE9yUGVFdGw0cVozQ1E5azJwNDJ5dThPV3UyS0tRKzlzMWYr?=
 =?utf-8?B?cldkajdsVGYycEd2Q0E3d0dMbldZMlc4T1RJekZZNHVxTWVnV29kaEs4TTVJ?=
 =?utf-8?B?SldBZ0JzKzhVY0VjMFlXUkd5SGkrNW9PeTZiSXhyenQwYlFQUzRsSjd6eDFM?=
 =?utf-8?B?ZjNCSVZjOEpWVXAyb1prMThYN00rQVFzbFh3TEpDcytzeGNyYTZTZGNaWnF3?=
 =?utf-8?B?ZFlrcW12YUFtbUJQWFNlWlN6ZWF6U3lUSWJqbzlRN01RUXV4OWl6akJOb3Jq?=
 =?utf-8?B?THdoalhwOXBYbDhiTUt1NmtaUStkQXNKVnczMWg4TWJvNzBEZEw5cVFvRlMv?=
 =?utf-8?B?UHdMWG5WSmxKTFZiQit5M3lwQkNzWFVscStJbkFsQzVuOWsxckNWckk1Y0Rv?=
 =?utf-8?B?SXhpWE9tNUpEaEZ4WnZ4RTJGeG1zSHZUR2x3bDRUbE5ldjJUbGdlRUFNZW5L?=
 =?utf-8?B?MmJ6MjNzRG1WZTVwaW9IY0RURWJVY1AwM2g1R3EyNzRjWENodmJEQ0RhUjJR?=
 =?utf-8?B?QmJGMkNaTUgralNzZWJMbGZwUFBEKzBoaGpJMUZRUmJ5SGEvOUczU0VwZGN6?=
 =?utf-8?B?L1Q4bHBTTFBwNksvb29OaUE4RkJzWFpvUDU1Z010Y3FENjIvZDQ0ZjBITDZw?=
 =?utf-8?B?eE1vR1RVbmNYemdRSm9jZ1FIN3ovWnJycnhpSC9VSXNQTWkwdUROaEJHR2FQ?=
 =?utf-8?B?b013STZObFNpUEI3bWJ4RnVxSHNucHdWNzVXUFYreTZtb3lSd0ZDN0RML094?=
 =?utf-8?B?OW04S1lhNFc2OHZ0NzM3VVFQdTRDbEU0YWxUaVUyajF0VVd6SVpjNGtsTUYz?=
 =?utf-8?B?OVhYTE5LU0JFNlNFUnA3Y0RtdkMrMUt4bjFnalV5RFVPQURsalZxZms1WkZv?=
 =?utf-8?B?S01mbzIyY2ZSR3NJTkJFbUF0T2FYSnlFdjlxYXBjOHFEMEg1ai9LRUNDcE92?=
 =?utf-8?B?ZHAvbWZ1OUVUSkNNK0x1Q0NWclBBRUpFOWU2WW9GRlY3VDQwcG5zYjZHY01j?=
 =?utf-8?B?eGtOek14dTN2ZDNlTHA4d05iYnZrcVRNVitKSno2QUtKeHo2QnVZbUkwYkpJ?=
 =?utf-8?B?RGRoNFBjZ1dxZnJ6cElFZFhkd1lja3YyOGVVdVEvVEJPRnIybnMwKysvWVY3?=
 =?utf-8?B?QXRyb2JPUkozakFic3J1NGk1eXcyZ0VNWUI4ZUd0RjdGYTJWRXJVeVJsclFq?=
 =?utf-8?B?RG1ZK0NYL09SYUZMQW5Dd1dNazRMaDRVaW5ZYTl4WVdKQkVRaHRzWHAvWTlZ?=
 =?utf-8?B?ZEJJREJsMVkvZE9SOE9HNHA1TFFoaUNNREpqQnpFKzN5dDJaZjZBaHZSbnBw?=
 =?utf-8?B?eXFXLzA5QkNrVFlRVDZ5bC9XTEt5OHlQeWJjR0RLM1BZSmlUNDFIakhTWVBY?=
 =?utf-8?B?YmVsaVBwYTZEYVphcnJadW9vMnNuWWorYmo5bFRvbXpYd3UyemxGUTcxUkFy?=
 =?utf-8?B?SW93am1WZ2M5emxEZGQ3aXVPcnMvMEc1MGk4MkVpeFFtWTJrdWpnbkVWU3V3?=
 =?utf-8?B?Sk5KN3NmVVk0b2ZZeE12cTRnZXduUlg2dGd5clU5bER2NG1QTjNqdGhlU0RN?=
 =?utf-8?B?b2NncjFzN2krR3RadC9haVV3ZmtpMldJQ090QWw0VXhJcCs2R3N4Q0wwZEZE?=
 =?utf-8?B?Q3FIMC9ZR21obCtIbmJJLy9TMVExdnVzQWwySFFvd1FnM0xOUmpzeEMwVkdX?=
 =?utf-8?Q?qVD7BXhGk2Q8malXY4xw+qjbf5NXB568ShUt3ryCw0NAH?=
x-ms-exchange-antispam-messagedata-1: I94LCw69W2Up6cJnAGp82hrOc8ifRDzOpW0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b138a46-c5f0-4706-809a-08da1ce8ed15
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 00:59:56.1321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bjFB4VItNF3KC37buG4NSPMoc46R3IKGTXqOC3q1op2YodyOSe4H+NDwk/55fjzz61QGJLrJBvROTznwII7rGq8/Uy5jLVb03ArWIAbyiBg5kOz78Mz3bGIQQGhItSCl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3995
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2ksIFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDEyLCAyMDIyIDk6MjMgUE0N
Cj4gDQo+IE9uIDEyLzA0LzIwMjIgMDk6MzYsIFlvc2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiA+
IERvY3VtZW50IFJlbmVzYXMgUi1DYXIgVUZTIGhvc3QgY29udHJvbGxlciBmb3IgUi1DYXIgUzQt
OCAocjhhNzc5ZjApLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEg
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy91ZnMvcmVuZXNhcyx1ZnMueWFtbCAgfCA2MyArKysrKysrKysrKysr
KysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdWZzL3JlbmVz
YXMsdWZzLnlhbWwNCj4gPg0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLiBUaGVyZSBp
cyBzb21ldGhpbmcgdG8gZGlzY3Vzcy9pbXByb3ZlLg0KPiANCj4gPiArYWxsT2Y6DQo+ID4gKyAg
LSAkcmVmOiB1ZnMtY29tbW9uLnlhbWwNCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAg
Y29tcGF0aWJsZToNCj4gPiArICAgIGl0ZW1zOg0KPiANCj4gTm8gaXRlbXMsIHNvIGp1c3QgImNv
bnN0OiByZW5lc2FzLC4uLi4iDQoNCkkgZ290IGl0LiBJJ2xsIGZpeCBpdC4NCg0KPiA+ICsgICAg
ICAtIGNvbnN0OiByZW5lc2FzLHI4YTc3OWYwLXVmcw0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4g
KyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBjbG9ja3M6DQo+ID4gKyAgICBtYXhJdGVt
czogMg0KPiA+ICsNCj4gPiArICBjbG9jay1uYW1lczoNCj4gPiArICAgIG1heEl0ZW1zOiAyDQo+
IA0KPiBObyBuZWVkIGZvciBtYXhJdGVtcy4gUGxlYXNlIHRlc3QgeW91ciBiaW5kaW5ncyB3aXRo
IGR0X2JpbmRpbmdfY2hlY2ssDQo+IGJlY2F1c2UgeW91IHNob3VsZCBzZWUgYSB3YXJuaW5nIGFi
b3V0IGl0LCBBRkFJUi4NCg0KSSdsbCBmaXggaXQuIEkgc2hvdWxkIGhhdmUgY2hlY2tlZCBkdF9i
aW5kaW5nX2NoZWNrIGJlZm9yZSBzdWJtaXR0aW5nIGEgcGF0Y2guLi4NCiMgSSB0aG91Z2h0IEkg
aGFkIGFscmVhZHkgY2hlY2tlZCBpdCwgYnV0IEkgZGlkbid0IGNoZWNrIGl0Li4uDQoNCj4gPiAr
ICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiBmY2sNCj4gPiArICAgICAgLSBjb25zdDog
cmVmX2Nsaw0KPiA+ICsNCj4gPiArICBwb3dlci1kb21haW5zOg0KPiA+ICsgICAgbWF4SXRlbXM6
IDENCj4gPiArDQo+ID4gKyAgcmVzZXRzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+
IA0KPiBObyBwaHlzLiBBcmUgeW91IHN1cmUgeW91IGRvbid0IG5lZWQgb25lPw0KDQpUaGUgcGh5
IGRvZXNuJ3QgaGF2ZSBhbnkgbWVtb3J5IG1hcCBhcmVhLiBUaGUgaG9zdCBjb250cm9sbGVyIGNh
biBhY2Nlc3MNCml0IHZpYSB2ZW5kZXIgc3BlY2lmaWMgcmVnaXN0ZXJzLiBCdXQsIHRoZSB2ZW5k
ZXIgc3BlY2lmaWMgcmVnaXN0ZXJzIGFyZSB1c2VkIGZvcg0KaW5pdGlhbGl6YXRpb24gb2YgYm90
aCB0aGUgY29udHJvbGxlciBhbmQgcGh5LiBTbywgSSBkb24ndCBuZWVkIHBoeXMgb24gdGhlIHVm
cyBub2RlLg0KDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0g
cmVnDQo+ID4gKyAgLSBjbG9ja3MNCj4gPiArICAtIGNsb2NrLW5hbWVzDQo+ID4gKyAgLSBwb3dl
ci1kb21haW5zPiArICAtIHJlc2V0cw0KPiA+ICsNCj4gPiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVz
OiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4gKyAgICAjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svcjhhNzc5ZjAtY3BnLW1zc3IuaD4NCj4gPiArICAgICNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+DQo+ID4g
KyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIvcjhhNzc5ZjAtc3lzYy5oPg0KPiA+ICsN
Cj4gPiArICAgIHVmczogc2NzaUBlNjg2MDAwIHsNCj4gDQo+IE5vZGUgbmFtZSAidWZzIi4NCg0K
SSBnb3QgaXQuIEknbGwgZml4IGl0Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9k
YQ0KDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=
