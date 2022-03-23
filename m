Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA664E53F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 15:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244643AbiCWOIy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 10:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbiCWOIx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 10:08:53 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2136.outbound.protection.outlook.com [40.107.114.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 085F07E093;
        Wed, 23 Mar 2022 07:07:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFmVJLh7kc+qK8qi8ZqpMvP2rM159x0VFqoMtsF3tOtUWkkzSt/B/AUlPJ21bpwSIutI+qza4opV2QCWYDoY9j10NuVooZrXLPNIk5m/cHAq9hbZpyOki2IvgIhioRbGQS6S2ZjiE+5EsMQvsMN/zey6+9n1aM8qqoJ7P0aW67fcfA92ukzotlxhQXI/ut7aGVWX0/wMxrOvPti5pEw2HPGDQpKHwzGUNplUldE1PhGV8HgH6ROwIvyJQRhk6YIPLecbwbp/uYiJpjlUvosMAO/Vc29mKNOW97TsxWF/l0NVCb3xDypCQ+zWXagcTxXggt4LU7cKFf2U7mveNoO7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kSqQpRtM2Ve4S0ZTYS0uxr17zq9v5ok6Y9euG23KR8=;
 b=PFS4QWwaFVm1qa3Eb943Ann+IXUeGUGdOtJcvSfbgSd+8JnCTPXI1m1wuTdqDHJobbFIFA0r3UoD4nQhrBZ4s7QkGn/QpTQiBhQroly+h6nhBptOien1ceHxl75FlhB4SVAywgjJ7wxdp80sHkTyjTfTajtuaR60vefaBg92z2AoeAkdyD8LvHe3yG1UsXDU5G9PMBhfNs/89ezOMtCUB7JdqGFrj0Ck2nyzS6YatdITjcBVNnrqnM8wCWnTsa2K30vR7Fi9vz5BHipkQmxj++gdu1IHiBHMAE2ivmpRX87jHdD3PXzx6Qqt9MjL7ApvXEJCvyj40mu59HLfmxi3wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kSqQpRtM2Ve4S0ZTYS0uxr17zq9v5ok6Y9euG23KR8=;
 b=IGkxhV0aLwr3zggC3MfzLofwmNQx4CmHFuChXLMv9Bu3rGXFA08CTWSQBj1kmtm6GGEegeKGTq+LTA7QfNbSHdEDivjjoQP9f8umjesGgr3rfQ4wBHba1v2UaH5hieUs8y7bsUmP5zS43mGXaIa/ZqRxiVm3TUN4Qq1yvkk75MI=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OS0PR01MB5634.jpnprd01.prod.outlook.com (2603:1096:604:b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 14:07:20 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::7120:d44f:518:6daa]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::7120:d44f:518:6daa%8]) with mapi id 15.20.5081.024; Wed, 23 Mar 2022
 14:07:19 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH 04/14] dt-bindings: clock: Add r9a09g011 CPG Clock
 Definitions
Thread-Topic: [PATCH 04/14] dt-bindings: clock: Add r9a09g011 CPG Clock
 Definitions
Thread-Index: AQHYPTp6tICEqKzGTkeF4ug71cB5rqzMy28AgAA3OJA=
Date:   Wed, 23 Mar 2022 14:07:19 +0000
Message-ID: <TYYPR01MB7086D2858A43824FEB9BFD51F5189@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
 <20220321154232.56315-5-phil.edworthy@renesas.com>
 <b00a4cc8-c8b8-60ab-9891-e6cb44c8bf75@kernel.org>
In-Reply-To: <b00a4cc8-c8b8-60ab-9891-e6cb44c8bf75@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c79486a2-62eb-4529-2a22-08da0cd671e3
x-ms-traffictypediagnostic: OS0PR01MB5634:EE_
x-microsoft-antispam-prvs: <OS0PR01MB56340562B876A6A47F3B5FC2F5189@OS0PR01MB5634.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aO0zhRt3ge4sYfpfnELSny6pPEPX2AvdF48EzB0XuRpLmlIjyb+p+a0tmlhz+4xvV6eq2PkTSVmmVxQscSU5dHe3GUorX3vWXGu1N39qxn0xW8xlV4uBjcezsTphMIIxvTOfl3i1MqiHXTEnOiCECbEznndlCDmeQFahcVDEnVzw1XP8nN7I+MnhV9OzH4zLdhBBaPYG5A/9bgPhqi9Ml61k2Nwa0SsokUo8KhdTIcmE88/BSG4k+ucRuYxTNVpu64F5j2b6L2xdjYYCL4QfkOWL8SFP4RtNg34bZV4CUZK4wvtROifc9TKJgb8inFcmCO0TSE7XY9GGuLOvwKZsn78xKFU7QXuyQ3Zb55tcSxsW/q2a7Bx8CHiVcryzEVB93atICMozj9WUkvml2JqqURsLOjwamwCObFHrFzvig7ZO/hepV1ZB6mW9EmpECM95PK2IgvbBxEduWGoUZgCPRPERfakI+iySX4J9CyU+2NNGQILKnocMH5OwVC8qhyywnlwSr1T2fAWT7NOzmmQohQJjI/gSYAlLFqtv/wmVlPDcJCadG6aFM0SsqIohMjlMOrQ7ROaaJnC5pChyfcP2hXEQ/awi7/8UOx3rFzQX3zHYQiQsPTxxh33ffxdW3dFRD3IGUU0ajiq4jjxUs8gxn/vfBPH5GblRjq+4fXFRWZ7bsliMT9+I08TuhTjbXyJA1aqRzd7sEPvVyQFo/Wgr9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(5660300002)(6506007)(71200400001)(86362001)(9686003)(508600001)(186003)(26005)(107886003)(55016003)(53546011)(2906002)(66946007)(76116006)(316002)(52536014)(44832011)(38100700002)(33656002)(8936002)(38070700005)(64756008)(54906003)(110136005)(122000001)(66476007)(66446008)(4326008)(8676002)(83380400001)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkhHZjdnSTF2WXJWbTkzU0t3VXh1emNyZzFrdXArdTFYYU9GWmJpK3ljcE1E?=
 =?utf-8?B?cHhUaHpLVTJzeXYwR01TQWFKNG9VSGU3eElidUZlQm1JWUYzWEFMbjJjY0dt?=
 =?utf-8?B?aWpieURxbUk0c1IybHVwMmQ4SGl3TVEzVmJnUitZR05UV3gyYUZtZGM0UjFU?=
 =?utf-8?B?emZqM3BVbUcyVXhzYWE4OUpncUp0dzFKMUpMK1BGbGRNOXAzMkhzN0NWZWQ5?=
 =?utf-8?B?RUhqS1AzRkJuYXY2bCszQXMzVE1LSUtNUkNEWGltenRZS0txaG5odFRKektw?=
 =?utf-8?B?bXA4aUJuYVE2Q1hkTHJDcDJtaEU1cFpFeTVFUDlPdkRnUDlwbjI3RUJlMUdL?=
 =?utf-8?B?ekc1Z3dNdlM5OEw4REFoOFBiUEtJME8rY0x5cW43dStkS29UQjd2MSt1clpI?=
 =?utf-8?B?MVVLR01jbFgzRlhKeUpkSjh5dVh2S0hFVzN6NVoyT1ZudCsvYlBtaFZsMzhV?=
 =?utf-8?B?WHRFVkJ3SmgvWC94ZGlVaTl4bDNHUUVVNm1GOFBIUG50NWJsaFFpR0gxUGF4?=
 =?utf-8?B?Q0x5YStsckFRaERvY05xMDArdFkyc254TW04SjRiNUkxcVEvSXNGU0Q4WjNP?=
 =?utf-8?B?K096b2cycGRJWHN0SC9ENlpGU0FPRnNBd2FUNUlLcDFhR2Z2S1NXVEdvcVpZ?=
 =?utf-8?B?SEpOL1pLcjlQWUZnVWFEQklhMVpsVHBrWGs2ZEVESVlFZlkrNEptVXNCdWp1?=
 =?utf-8?B?VjdZeUJNVW1vbEpBQnVVRWNlelJTSEU4TnNjdVE3NDBuVjFsT1liNUhYd0FP?=
 =?utf-8?B?VUpUcTE3VWk4MDNrb0k5TmRmaThRSmdtWE8zT0FYRE9zcWdZdWh1MFM2N3p3?=
 =?utf-8?B?dDY5cEN4STZPSG91WTZlYjFnaTdKZ0RtSVorT0VPc3dMeUN3bnJFalZKZ0p5?=
 =?utf-8?B?N2tvbWNZdVNTRG1kK21HQ1BIT2FyNElCWjEzTncyL2VOSk1KMkMzc1g0cXUy?=
 =?utf-8?B?bjREZk5iNHhjM1FGZjljY1hPRVVWcjRjOGlWVnVGM1VqeDFTQTVBTnk1ZjEw?=
 =?utf-8?B?U2FUTHE3d1c2ODkzK214enVHUnB2WnRiYjZoYWhwNmJ2YUw4QThPMHl5anZx?=
 =?utf-8?B?dkdmc1pWUm1CNVVqd3BBZE81OExHMW1JZFRMbVJMLzR3NkFkWENhSjJMT0dv?=
 =?utf-8?B?ZVdKTUs1UjljR04rc0t4Z1BvcFNxN1pvZ1g0azRLR29JNndFSFp3QkJvcWFm?=
 =?utf-8?B?WlQ0dXJCNGxUYTVSdlRJeGhMbU92akd2NjRQMCtINVo4bmRMazRzdm00SUJ3?=
 =?utf-8?B?Unpqamg4b255SWZVNmEyVStLZWFEZ1YyZ1lXR2J0UzJVL2Y5VDk0YTVSZU9Q?=
 =?utf-8?B?MjYvck1EYnNHWWNqOVJsVHMrcTZGVDdtTlFJRzdkMlJVZE5OTGY5NTNDMDRX?=
 =?utf-8?B?VW9tZENObTN6eVZyYjVWU2FER2dtQXVMNGFsM1NCOEptbnVhbW1aNDczdkJC?=
 =?utf-8?B?QlgzcGFUM0h4cGRZT2MvQ1RhTmJadmd3M1RKcDBRNisxalJ5YlRQbGVSazkv?=
 =?utf-8?B?NktRRmFxSFZFMmxVYkdVaVJObzAxTUxXZG9hUzV3UnByMThmRm9VdWJZcVp0?=
 =?utf-8?B?RkRLa3EydkVCdEJQWTlEVWhaNjM3bUxWelRPSUdsZWJaQzh2R3dlVFl1Z2Ez?=
 =?utf-8?B?YnErekZrVlRsaWh0cUhUOTYwZm1RaGUvNnJuayt6YzFZT0R3bzlTRVl0RHN5?=
 =?utf-8?B?aHMxWld2VDd6aTZDMGpmOW8yTlhXNm4wYmZiYnAzeklVVGhTRzdKcm0vQjVL?=
 =?utf-8?B?MmRkOVEzSThzUkNPYVkva3BtS1lJRW1rMXVXcDVwaS9neG8wK21pQUhqQzRW?=
 =?utf-8?B?QjNtOXkwK1NnYjdCbURhTDJ4NUZiWDNMQmJIYm92MENFd205eDdpZktZajFv?=
 =?utf-8?B?c1RWTWk1OGFMeFF5bUJwNHc5SG1wVXgxd1VxS2lBVHRWaHptSGxpenNiejVU?=
 =?utf-8?B?ZzFNd3J0QkVPbm5aSnFtUC9Ua08yZ2pHTFR3NGZTTDAvcHdPYVNMOTl0YnBh?=
 =?utf-8?B?VFFKZ0tZbDNBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c79486a2-62eb-4529-2a22-08da0cd671e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2022 14:07:19.8812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OL/2+7+cVCUu4OZFg31Lte1tUZV29n2PGjDQll40egW6j10yye/76hnBXUuV35X6HLGPW5fpxMQ70uO4PwBgJOT684pRG50uiPh5iENy++4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5634
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIDIzIE1hcmNoIDIw
MjIgMTA6NDQsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDIxLzAzLzIwMjIgMTY6
NDIsIFBoaWwgRWR3b3J0aHkgd3JvdGU6DQo+ID4gRGVmaW5lIFJaL1YyTSAoUjlBMDlHMDExKSBD
bG9jayBQdWxzZSBHZW5lcmF0b3IgY29yZSBjbG9ja3MsIG1vZHVsZQ0KPiBjbG9jaw0KPiA+IG91
dHB1dHMgKENQR19DTEtfT04qIHJlZ2lzdGVycyksIGFuZCByZXNldCBkZWZpbml0aW9ucyAoQ1BH
X1JTVF8qDQo+ID4gcmVnaXN0ZXJzKSBpbiBTZWN0aW9uIDQ4LjUgKCJSZWdpc3RlciBEZXNjcmlw
dGlvbiIpIG9mIHRoZSBSWi9WMk0NCj4gSGFyZHdhcmUNCj4gPiBVc2VyJ3MgTWFudWFsIChSZXYu
IDEuMTAsIFNlcC4gMjAyMSkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQaGlsIEVkd29ydGh5
IDxwaGlsLmVkd29ydGh5QHJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIGluY2x1ZGUvZHQtYmlu
ZGluZ3MvY2xvY2svcjlhMDlnMDExLWNwZy5oIHwgMzM3ICsrKysrKysrKysrKysrKysrKysrKysN
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMzNyBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3I5YTA5ZzAxMS1jcGcuaA0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svcjlhMDlnMDExLWNwZy5o
IGIvaW5jbHVkZS9kdC0NCj4gYmluZGluZ3MvY2xvY2svcjlhMDlnMDExLWNwZy5oDQo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmI4OGRiYjBkOGM0OQ0K
PiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3I5
YTA5ZzAxMS1jcGcuaA0KPiA+IEBAIC0wLDAgKzEsMzM3IEBADQo+ID4gKy8qIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArICoNCj4g
PiArICogQ29weXJpZ2h0IChDKSAyMDIyIFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29ycC4NCj4gPiAr
ICovDQo+ID4gKyNpZm5kZWYgX19EVF9CSU5ESU5HU19DTE9DS19SOUEwOUcwMTFfQ1BHX0hfXw0K
PiA+ICsjZGVmaW5lIF9fRFRfQklORElOR1NfQ0xPQ0tfUjlBMDlHMDExX0NQR19IX18NCj4gPiAr
DQo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9yZW5lc2FzLWNwZy1tc3NyLmg+DQo+
IA0KPiBJbmNsdWRlIG9ubHkgaGVhZGVycyB3aGljaCB5b3UgdXNlIGhlcmUuIERvIHlvdSB1c2Ug
aXQgZGlyZWN0bHkgaGVyZT8NCkFoLCBpdCB3YXMganVzdCB1c2VkIGJ5IG15IGR0c2kgZm9yIENQ
R19DT1JFIGFuZCBDUEdfTU9EIGRlZmluaXRpb25zLg0KSSdsbCBtb3ZlZCB0aGUgaW5jbHVkZSB0
byB0aGUgZHRzaS4NCg0KVGhhbmtzDQpQaGlsDQo=
