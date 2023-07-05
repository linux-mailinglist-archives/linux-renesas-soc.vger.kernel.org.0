Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CACAB748560
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jul 2023 15:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbjGENsr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jul 2023 09:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjGENsq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 09:48:46 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8B0F7;
        Wed,  5 Jul 2023 06:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPMZP7r/VA84W08YaIOerbO7kPL8w/vgqcy/hc7lWzldCF1UrIVmyDEYvCplk9aJnfcqtP24UETMVkMJ1HRABkfY+pjXaBPGkhOL+XJbq5xHOPS0h4Qm7W7dZnFgZ+lB0oSDfLjZCJvlfKhlsCynOHS1r3p5Wh9RCKP3FwXmJyZfeqmjm8gEpzlgvV8bLW/EGoqsy4DIu4H8qwB+n+zOXgAqT5XpQsO/q3V7eFcjqd7Tz1/hb7aQVCoWZ2Kp/mKC6LrnVW8+EmCoYJwWWncuLsU+WTpGjP87asuAJOBBMb0u8aY2Ey6HBbAMD9TywbBo0JsJbDZKXjVNBLjuutspVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sur+PHDqkrJ5+TwNpa+5XazG/M9n1cPE1W4hUlvfiBQ=;
 b=fnjgP+G9AhaMrdbunWL0jpoURXRLVFHyw/tOEOOnlH3Kx3dgMjXYkD+ZMeOpF5Cjl3PzmxW09MmEPyRMKvs3pkp81dsqV/M3G9WJMKmOFqnuYhQJXhfxvsz5+7kCXkN09TQX256lOqmLYStBlKyHKFj+hZiRxwFcr5Vq2yEYlJCgqxBOcmGKcZR5MhvF8q9zl4zgAdtf/tQFGoFuXZMaAw9We09ywN+dNdgT6k+ken+XuveWQnmTGZOJCZUnfYOcvgNPaiba3t+Jlhvbp/liz4JTpiqv6pg/74fGTk2h8uouDaPZzQ3OOXzAZF2ZI0Fx6qsT+5AiSIGuRS5mmXJB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sur+PHDqkrJ5+TwNpa+5XazG/M9n1cPE1W4hUlvfiBQ=;
 b=HyPTwYVEkV1DoKjWvwLWiDRdzXssaJ8AJSH/he0Dl6vCpdGg0ZW0x4U5ksLtqvoJfAf2jAIGe4dJTevvWwdmNiTaP636pyQGW6DAWl0n3Cpq1YKv6JWVDySz+jtryUT7ej6hGmX3NT/6nEZa6RO8R0hCV/UOG7HuC+8ToCdcCv4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10001.jpnprd01.prod.outlook.com (2603:1096:400:1d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 13:48:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 13:48:38 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r9a07g0{4,5}4: Add support for
 enabling MTU3
Thread-Topic: [PATCH] arm64: dts: renesas: r9a07g0{4,5}4: Add support for
 enabling MTU3
Thread-Index: AQHZrbJpKcI5SjSCoky47Ik5e/fUv6+rHBuAgAAFWmCAAAxngIAAApwg
Date:   Wed, 5 Jul 2023 13:48:38 +0000
Message-ID: <OS0PR01MB5922AC613EB582FEE5ECD514862FA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230703132929.356009-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWHKR77MbhTcD6xJw42OXCF_DC3P0VNdXJqFXG5dZhQ+Q@mail.gmail.com>
 <OS0PR01MB592220826E0102C41FD4CD2C862FA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXSYA0t7H5bkPCE1gVEzscn+PLv3B1pbRtJqqc51RaMqw@mail.gmail.com>
In-Reply-To: <CAMuHMdXSYA0t7H5bkPCE1gVEzscn+PLv3B1pbRtJqqc51RaMqw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10001:EE_
x-ms-office365-filtering-correlation-id: 1ce5ad46-d7f0-462a-bb28-08db7d5e8901
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oBpCdN+kukh81wkwFzSaHu+Kx0Lv6uqJPRx71quhl7njlim08n6n81SbJ8b94oUS3cgyj8eA/tieyzpJ73iaNe4Ls9JE10CXDe9unKyst7XBSdO1MDYMSZwYzchOu/QymiGh/sAc0NQYdsQDsMYeiNkv4qaATKtcRcwVp7P7ny6L4F5BZYZuIFqPwbS5DH2Y3sBOgzh1CDccwo1sBBQQNRtCx7AY9uYFTKt5+UM0xKcpe24qKoyi48uYhKsuaptI1DFHvwBIAiBEc+Hl+zdK8nI2n3EcYHf9fkYHwPpxkcXdlWw/CPeQKWq7Tg5np+cHfUGSogBiqkSePbYjDjLhSp05a90Jae/NO5Fjt7kDJ304Y6AxksAij3vqyp1UgDww0XoCjVckVfauLw4AoAOuisxbJNOA7j61p43L97E+oGrpq9FO674Xhq4YZSL3VpGhQAd4dpS7mataV4CM/Oj0foPZ/5IqePPkok5BeSoMB4NB2cTier4HC1kzlIa5FH9g5nY7c6KZF4pRhJ7VSLICFYI58NjXbMVQsw90RqxnlxLDpgSjMJnzrVE6VkaWoj0Clm6+TIjH2YTxYYuw6bzU0Ue2t1cBkuwSTcwUsVlFUGNUzrd/ae1z96GAZqMTRDev
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(55016003)(54906003)(122000001)(7696005)(478600001)(71200400001)(41300700001)(8936002)(8676002)(38100700002)(4326008)(66946007)(66556008)(66476007)(66446008)(64756008)(6916009)(76116006)(316002)(186003)(83380400001)(107886003)(53546011)(9686003)(6506007)(26005)(33656002)(86362001)(5660300002)(52536014)(38070700005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aS9kOWR0TnRjQ3FPTjVRWTN5eTlYMHA3cGo4eUhMSlFWdFFENEczZXZnekNl?=
 =?utf-8?B?cCtnSi95ZUFMNGd4TnRHTStCU2ZDV3Y4WEY1YlMvTDQ4UCt6aktmUzk2V3Ey?=
 =?utf-8?B?d2lta2pnVGsxNDFrclBFNm0rclZvMVZDNE1zSk5YWVljZEQ4UDUzc0F2dTN1?=
 =?utf-8?B?OXhseWtxcHU5TWZMWHRPMGQ5VStsOENSRGwvUEFSbVE4eUg2Y2YrOTYzcmc1?=
 =?utf-8?B?ZkdFOTgybXFJUXhiNmE3eGVDYlJJVDJTUHZlYzR2bXVOeWNrT0xHNWhqTW13?=
 =?utf-8?B?NTd4SGJsWGpnSHlsUWpKbmFSMWMwSkl2L1pPRys3dUdDQ2tZMkNoMFpQakxx?=
 =?utf-8?B?a3ZYdWx5V2pzemZseTJlMWNPQVFXUkY0TTJQK3dIc25sMXllTUVVRGRDaU5O?=
 =?utf-8?B?VWIvdHNVcWEya1hKRUpaM0tnSzI3SlRwZWlpbXNNM2pyNXUzejMwOGtLajc3?=
 =?utf-8?B?Y0ZUQ2pUQ1lZTDhjTk1xZlFPMEg4N2lGVUVRa3hBcGpGOEkvRkc5am8zVW9w?=
 =?utf-8?B?R2xvRmt5a3Rnc2k0akhoYi9qNlhuMjM0bVdrWWhLM2xMeTByREdsdVdBa1Bp?=
 =?utf-8?B?eDFjS1JZTHMwYzhEaExWbDd4c0YyemQyOUIyRnF6NFBrbXFNOFlCUlRyMDdI?=
 =?utf-8?B?VDRGZ2xsaHdBZkt4NDFCWUFxaGZYVjJMWDFqYWpnZFM3aTFnU2ZKM2VNOXY3?=
 =?utf-8?B?cnNWSThRZU1KY1dQbnVzdVNFdUxmM3ZkaThGQWhtNXp1eUhPNkpXek52TmYx?=
 =?utf-8?B?ZENZZ1dlMFNTemhOclRGZWtQY1FVOVg0eG1GZktHaEF1NWphVWhObGpuME1O?=
 =?utf-8?B?VHZ2am9NZkFtc3BjeWtyeDVvTHBCclI5QjA2NGxjU0FvSG5WSTl3dlJLUEgw?=
 =?utf-8?B?dTMwVlR6aWJDenNwYlR1Z1ZEeW5WN2RiekNzVFFiMDBreElUNGx4aEpaTStr?=
 =?utf-8?B?c090UWxjL2tQRWJYdkFicFdDSFdjdEtlZVRFME5oaGJhZHBlTmZzdkUwM1Nv?=
 =?utf-8?B?K05CbSsvTnZ3bHZaUXo0djdGUDlmeUZiUEhJWnhEOFlxN0RwRkZVRDRPSGNO?=
 =?utf-8?B?NEJkUVZ2ek91c2ZmNmJ1cFgrZGFCU0x5cjJ2UEtoS3FKUVhGaEJ0dkp6Y3Nu?=
 =?utf-8?B?QUhHdzlVOFNpeXMrSVhqOHJhZ2treWdRdStlaE5QYWVWRnpWNUg3OWdURHFx?=
 =?utf-8?B?ZmJIOGxLNXA4NjJiMWVzWDkyOTFMemlmL3hOckpLUzhFaEdiSS8wR0pQOEhI?=
 =?utf-8?B?WFY1dHkzQnpCaU14VE1JYzJIajRyZWIzZGJTYUpVUkFaUVl2WlpYT2dWSUhk?=
 =?utf-8?B?MWdETENjeDVlVFdmZ3MxbGFWcUFoMzdrWWdFbmM0OG05cHJtSU1RSzdHZVBN?=
 =?utf-8?B?UHNkRTdJTUlWWWxPbWZMRGlOdDN0Ri9LbElEY2tleWo0My9qS0lYNzZuZXUx?=
 =?utf-8?B?QkhCa2xaL0hhOHkwTG8xenpUck9tS2F4UFpYeGFQKzlrY0swRnRHcldCNEVz?=
 =?utf-8?B?TDE4d2llWmlFMXdtY3F3K3dnNTFscHlZZHJXaE55bVV2YzhKR0FWZUk4NzNI?=
 =?utf-8?B?dk53L2ZmSGdoK2xjL2RwMVFLdDExdjRWWVVEU2lURWo0Q3o5ZXIxaGJjNUF2?=
 =?utf-8?B?QUZ6S0FBelA5NGlpNlIxeFlyWE0vMTJqbzg3NElUdmNmUytMSXhvU2pWK3hP?=
 =?utf-8?B?RFByOXg0S2xhTzRKK0pRb1o0STFDeHkxQU45dk5IYlAraXRpdjFwY0JZOGU5?=
 =?utf-8?B?YVp5VU9KYVhJcHpoVTFmYW42SXZEQUgvM0RSQVNoY3pudndrTnBvTGhNdzRl?=
 =?utf-8?B?empENFJ4bDl4ZHVmSG9jYitXZ2lLRzFRMVRHUnNabmRmb1RLSzJ2TDY2MXN0?=
 =?utf-8?B?YmxEY0tUbzZyODRhc0JYMG5oS2E2UlRtdlhDL29YTDYwNVBuNXBaRGFuNTRO?=
 =?utf-8?B?NmhIZ3lscUpKbWNmeDhTNHFXWXhmL1FLNmhnOWdvcDljdHN1UnRralZwVVNh?=
 =?utf-8?B?UG82U0FmYWIzb1dTcnFIRkZhTUROdkE2bG8weFkxZkJWaFBxeS9oU0VrUEUr?=
 =?utf-8?B?dnlvcFlTeHlRWXBuZGVOM3ZnTjVub3hPU1I1eDVNWmRlRG9iVEI2b1VCMlFr?=
 =?utf-8?Q?84z4wUPq6q4+jqhGy/gRwNTyk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce5ad46-d7f0-462a-bb28-08db7d5e8901
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 13:48:38.1601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HWOV+xWXvvDigQoX6UoyZIzTNFUg3fWtJXzrlJSkMlOb8Ile9HIyCs5ofvwOY6sfufx6GyH8QvixrR/kYEGgINzL2ZvdYe525Pu4eHb9CRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10001
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
UEFUQ0hdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA3ZzB7NCw1fTQ6IEFkZCBzdXBwb3J0IGZv
cg0KPiBlbmFibGluZyBNVFUzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBKdWwgNSwg
MjAyMyBhdCAzOjA24oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiB3cm90ZToNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFybTY0OiBkdHM6IHJlbmVzYXM6
IHI5YTA3ZzB7NCw1fTQ6IEFkZCBzdXBwb3J0DQo+ID4gPiBmb3IgZW5hYmxpbmcgTVRVMyBPbiBN
b24sIEp1bCAzLCAyMDIzIGF0IDM6MjnigK9QTSBCaWp1IERhcw0KPiA+ID4gPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+IEFkZCBzdXBwb3J0IGZvciBN
VFUzIG1hY3JvIHRvIGVuYWJsZSBNVFUzIG5vZGUgb24gUlove0cyLFYyfUwNCj4gPiA+ID4gU01B
UkMNCj4gPiA+IEVWSy4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIE1UVTNhIFBXTSBwaW5zIGFyZSBt
dXhlZCB3aXRoIHNwaTEgcGlucyBhbmQgY291bnRlciBleHRlcm5hbA0KPiA+ID4gPiBpbnB1dCBw
aGFzZSBjbG9jayBwaW5zIGFyZSBtdXhlZCB3aXRoIHNjaWYyIHBpbnMuIERpc2FibGUgdGhlc2UN
Cj4gPiA+ID4gSVBzIHdoZW4NCj4gPiA+ID4gTVRVMyBtYWNybyBpcyBlbmFibGVkLg0KPiA+ID4g
Pg0KPiA+ID4gPiBBcGFydCBmcm9tIHRoaXMsIHRoZSBjb3VudGVyIFogcGhhc2UgY2xvY2sgc2ln
bmFsIGlzIG11eGVkIHdpdGgNCj4gPiA+ID4gdGhlDQo+ID4gPiA+IFNESEkxIGNkIHNpZ25hbC4g
U28gZGlzYWJsZSBTREhJMSBJUCwgd2hlbiB0aGUgY291bnRlciBaIHBoYXNlDQo+ID4gPiA+IHNp
Z25hbCBpcyBlbmFibGVkLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+ID4gPiAtLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQ0bDItc21hcmMuZHRzDQo+ID4gPiA+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDRsMi1zbWFyYy5kdHMNCj4gDQo+
ID4gPiA+ICsmbXR1M19waW5zIHsNCj4gPiA+ID4gKyAgICAgICBtdHUzLXpwaGFzZS1jbGsgew0K
PiA+ID4gPiArICAgICAgICAgICAgICAgcGlubXV4ID0gPFJaRzJMX1BPUlRfUElOTVVYKDE5LCAw
LCAzKT47IC8qIE1USU9DMUENCj4gKi8NCj4gPiA+ID4gKyAgICAgICB9Ow0KPiA+ID4gPiArfTsN
Cj4gPiA+DQo+ID4gPiBXaXRoIHRoZSAjZGVmaW5lcyBtb3ZlZCB1cCwgbXR1My16cGhhc2UtY2xr
IGNhbiBiZSBtb3ZlZCB0bw0KPiA+ID4gbXR1M19waW5zIGluIHJ6ZzJsLXNtYXJjLXBpbmZ1bmN0
aW9uLmR0c2kuDQo+ID4NCj4gPiBaLXBoYXNlIHN1cHBvcnQgaXMgYWRkZWQgb25seSBmb3IgY2Fz
Y2FkZSBjb3VudGVyKE1UVTEgKyBNVFUyKQ0KPiA+DQo+ID4gSSB0aG91Z2h0IGJ5IG1ha2luZyB0
aGlzIGFzIG9wdGlvbmFsLCBTREhJICsgc3RhbmRhbG9uZSBNVFUxIG9yIE1UVTINCj4gPiBjYW4g
c3RpbGwgd29yay4gVGhhdCBpcyB0aGUgcmVhc29uIGl0IGlzIG1vdmVkIGhlcmUuDQo+ID4NCj4g
PiBJZiB3ZSBtb3ZlICJtdHUzLXpwaGFzZS1jbGsiIHRvICBtdHUzX3BpbnMgaW4NCj4gPiByemcy
bC1zbWFyYy1waW5mdW5jdGlvbi5kdHNpIEVpdGhlcg0KPiA+DQo+ID4gd2UgbmVlZCB0byBtYWtl
IE1UVTMgbXV0dWFsbHkgZXhjbHVzaXZlIHdpdGggU0RISQ0KPiA+DQo+ID4gT3INCj4gPg0KPiA+
IEd1YXJkICJtdHUzLXpwaGFzZS1jbGsiIHdpdGggIk1UVTNfQ09VTlRFUl9aX1BIQVNFX1NJR05B
TCIgbWFjcm8gaW4NCj4gPiByemcybC1zbWFyYy1waW5mdW5jdGlvbi5kdHNpLg0KPiA+DQo+ID4g
V2hpY2ggb25lIEkgbmVlZCB0byBzZWxlY3Q/Pw0KPiANCj4gSSdkIGdvIGZvciB0aGUgI2lmZGVm
LCBhcyB5b3UgaGFkIGFib3ZlLg0KDQpPSy4NCg0KPiANCj4gPiA+ID4gKw0KPiA+ID4gPiArJnNk
aGkxIHsNCj4gPiA+ID4gKyAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ID4gPiArfTsN
Cj4gPiA+ID4gKyNlbmRpZiAvKiBNVFUzX0NPVU5URVJfWl9QSEFTRV9TSUdOQUwgKi8NCj4gPiA+
DQo+ID4gPiBCVFcsIGhvdyBkb2VzIHRoZSBkcml2ZXIga25vdyBpdCBjYW4gdXNlIHRoZSBjb3Vu
dGVyIFogcGhhc2UgY2xvY2sNCj4gPiA+IHNpZ25hbD8gIEkgdW5kZXJzdGFuZCB0aGlzIGNhbiBi
ZSBlaXRoZXIgYW4gaW5wdXQgb3Igb3V0cHV0IHNpZ25hbD8NCj4gPg0KPiA+IEl0IGlzIGFuIGlu
cHV0IHNpZ25hbCBhbmQgaXMgc3VwcG9ydGVkIG9ubHkgZm9yIHRoZSBjYXNjYWRlKE1UVTEgKw0K
PiBNVFUyKSBvcGVyYXRpb24uIFdoZW4gd2Ugc3VwcGx5IHotcGhhc2Ugc2lnbmFsKEJ5IGluc2Vy
dGluZyBTRCBjYXJkIG9yDQo+IGFwcGx5aW5nIGEgdm9sdGFnZSB0byBjZCBwaW4gb24gdGhlIHNk
IGNvbm5lY3RvciksIGNvdW50ZXIgdmFsdWUgZ2V0cw0KPiBjbGVhcmVkLg0KPiANCj4gVGhlIGRv
Y3VtZW50YXRpb24gZm9yIE1USU9DMUEgc2F5czoNCj4gDQo+ICAgICBNVFUxIFRHUkEgaW5wdXQg
Y2FwdHVyZSBpbnB1dC9vdXRwdXQgY29tcGFyZSBvdXRwdXQvUFdNIG91dHB1dCBwaW4NCj4gDQo+
IFNvIHRoZSBvdXRwdXQgZnVuY3Rpb25zIGFyZSBub3QgeWV0IHN1cHBvcnRlZCBieSB0aGUgZHJp
dmVyPw0KDQpGb3IgWi1QaGFzZSwgQ291bnRlciBjbGVhciBmdW5jdGlvbiBpcyBUR1JBTFcvVEdS
QkxXIGlucHV0IGNhcHR1cmUsIHdoZW4gd2UNCnNldCBNVFUxICYgTVRVMihMV0EgPSAxKQ0KDQpX
ZSBhcmUgc3VwcG9ydGluZyBvdXRwdXQgZnVuY3Rpb24gZm9yIFBXTSwgYnV0IGl0IGlzIG5vdCB0
ZXN0ZWQgd2l0aCBNVElPQzFBDQpwaW4uIFNvIGZhciB0aGUgb3V0cHV0IGZ1bmN0aW9ucyhQV00p
IGFyZSB0ZXN0ZWQgd2l0aCBNVElPQ3szQSwzQ30gYXMgaXQgaXMgYXZhaWxhYmxlIG9uIFBNT0Qw
Lg0KDQpDaGVlcnMsDQpCaWp1IA0K
