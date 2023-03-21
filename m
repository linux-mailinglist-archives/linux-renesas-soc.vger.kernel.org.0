Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4E3B6C2C37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Mar 2023 09:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjCUIXX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Mar 2023 04:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbjCUIXD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 04:23:03 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2112.outbound.protection.outlook.com [40.107.113.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C24729E32;
        Tue, 21 Mar 2023 01:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4WYlZknLBa+XJwyj8NBoPmO7C/LD6de+y5KB72chH+sd4tqyvjUFN6eOze/UPn346To7ac1u3k3LJaC3SdHCjaF6ix1Et55eiLqNimlmKI993OASYw+VmMmxMjobhtahOK8HuRzwVy5KHJg5BMB+4k+pdgoz1IV0Tq/r1VkdmaRP/z/RZs7+UmDJ9/3yQRsvYPbrrBpEtT8gucNGctY93tWoBW6LzhQKJB3LdqgulvlVH2hzShz5a355+Mo29rl86WjCSDbTi1X5B7mtBZB1/FCmRD76pRwLznVvH7llLxlk8vESoMrphI2uMQ/5NR1SMVdzU0hrJQ8oyAsFIa+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPlLnJnaV3nkFEHHctNv5A0Bw+PAqDGCSihqK4TIf90=;
 b=mCLYrfO8d/6c1yVfo7y8WZECS2oBlvoPB9MEGG8ChpAlbT8eZd8AKtTnRz6lh/6HmpFEtGzXUFawM+j4LBQFEjw/O84QAe4eXmzg141PGwfEgQ0cbTaKgZzddnMzAhzLCo4446/pR0s+ZTZd+MZzHYAuqPDeP/9flBdQDOiseWHZ9J4Cb8bg2GTSJGnv+vLPQljjV3X7bovn2btiuLhSx+r/3MU11T7W4dqJyqRTXe2TiVA2tdz+HROUPNWcBhJ6HHogW2JBccECnLb7AnFaiLmh4IrpX+wVgcy2YfHtDmzPle1uPx/F6TatDA70rotDXUW+hYXvlrc/FU0g+9BFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPlLnJnaV3nkFEHHctNv5A0Bw+PAqDGCSihqK4TIf90=;
 b=bGN813CPusayNjy2KKCKlALEcNbuA7n4dYHjaYwZ7pKLdtm4frTIJXVOHREbbXCenfcME+P3gINSROc3zTvNa5gGyTQDxqFj6C7wEW/K14259wvno2h0tXke031Q2bqddGoMny3u7JZZKmpNpP354OtfiAaOLceb33u8c80zKIA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB5999.jpnprd01.prod.outlook.com (2603:1096:400:4a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 08:22:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 08:22:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 5/5] arm64: dts: renesas: r9a07g044: Enable sci0 nodes
 using dt overlay
Thread-Topic: [PATCH v3 5/5] arm64: dts: renesas: r9a07g044: Enable sci0 nodes
 using dt overlay
Thread-Index: AQHZWxpJOyLhy/6kWkSwv+pz/AwLnK8ECjsAgADUi4A=
Date:   Tue, 21 Mar 2023 08:22:54 +0000
Message-ID: <OS0PR01MB59222995B3AD342170AB311D86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230320105339.236279-1-biju.das.jz@bp.renesas.com>
 <20230320105339.236279-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdXJDeWko1W_OeaJn7Xrgo3nBVnKrD_Ce8Xd0foD1nRDWQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXJDeWko1W_OeaJn7Xrgo3nBVnKrD_Ce8Xd0foD1nRDWQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB5999:EE_
x-ms-office365-filtering-correlation-id: 652bdcb7-f999-4d81-fd9d-08db29e5787d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v+QRpTZwZohnKk3c+R5xm3V98gDAM6jxLEu/QlflgA5ddFAjOHzMmmI7Ss5LLG5rfld8OiDEZcKC61rllW3YirUV2br0Ehp1QqGlQgmkd02yC61GW7SU9vIT4oXYS3na7b/uFd8NybC27o81J1zGxQt1JIcItfq5zJZSXVM0tzjLLWm32kQIjJ8uaSa7qlnuYJOY8Xpmk5WRED1RGNsirAo1TmgDQCh7TEd3/mA9N/EX3jO+1sqMZUQivSKEpphaPFv9AhZIErUYeZNg36R1UOzqZOCJqlkm9wwuhkQ3j/l4C69ELTLFiO+56BjdDVQbBID3U8zrzSG8kKyOt7efq1kOUOAHy7bsUvUqetevff/5MTLefI9niGynIyKDh6RKEi7dSCw5HEd/azandG2Q/DbaUD8gSkcNG7UnQjzFgWDBiphRqxD/1lZPQKsC/3hnq+SWG3TyKBamBFNVRrEJhF1LK9vhFUj8yRSqrvx/0y13wB+2E6MFmhcUn1vSYA+9tq6YGqu9tWL4rf/2O3enGSJd1o+MGHU9YRM+9jNw0UfRWDWzo9Gz0Qw39c2KcNgy0H0jawWQit///h24pF7NrSbVwmmDK3imEv+xi2Y2Ch8Z/ubtVZ2POB5W6+j+/Nh3rXHEd9fIs8mPTJzYnvWRQzI1MxbygvzDz9/2grPPoxjj62VL6S3wipNXTJU2CPt9eeafrGwx+7Vakwe4rQALMg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199018)(86362001)(33656002)(4326008)(38070700005)(41300700001)(66476007)(54906003)(316002)(8936002)(52536014)(8676002)(76116006)(66446008)(64756008)(66556008)(478600001)(5660300002)(66946007)(6916009)(2906002)(38100700002)(83380400001)(71200400001)(107886003)(186003)(26005)(55016003)(122000001)(6506007)(53546011)(9686003)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3FlTVZveVpSMXY3cExKUE5iY0RpN2V1QkRhZ1lMdFVDaEhDQlhtNEhraDJj?=
 =?utf-8?B?QVFhaXRoNk9zRTdvN0lwQThXdHFPTS9raTk5SUVsRjNRUmVnWDZ2aGNrTGlB?=
 =?utf-8?B?a0E3N2lkWi9wZkpINmo3dE5PcjZ4aEFTNVBwc3BZV1lGaTM5a2cwQjB0UWVm?=
 =?utf-8?B?Tm5sSVJ3d1VzTVdXNUtGKytCSHhQUVlzNWpVVEs0Y3JFUDVjMUR5eXBMdzdj?=
 =?utf-8?B?SEVmSFhCZE93N1FIWUtlNFFNMEFETzBvcHhjZDdtUjg3d2NzV1ZoTlFwL1hI?=
 =?utf-8?B?RFloNC9UaGs0M21oK2M5S1RmOElKYXlvOGJKYmNSQ1Q0ZlhBZTI4MTZnQkg2?=
 =?utf-8?B?S24vTE5BcUVpWnBraEtSVnZmQXRUSDd1eVRHNGZTQlNOTVUwRk9ZdC9QUnpL?=
 =?utf-8?B?N2poNWlJVmFEZ2gzOEpQOHpFQnhQSFVjUkdsK280a1UvaTBjeWVkOGthRnJ0?=
 =?utf-8?B?RWg3b0VUOGZoVGhUQk95em9qYVI5ZzAwU2JoMloyaDVPNTRFSTNUSzE2TDFj?=
 =?utf-8?B?cUZINFg1VHpyWnhMMWRNL3hya0xzajRQOGdIRm43a0FOM1hBK1JjLzlDRVli?=
 =?utf-8?B?ZzB2aWZldGhEVUpaKzhVVU5MUStDMkh2bHhYZnhQakx1TmJnakdNYVVBaUt6?=
 =?utf-8?B?RmNNcCsvSmx2Q2JZZUh4ZjdMWU8zWlQ3MU50ZFBUcm5la3VveVJ5eDZ5MXl1?=
 =?utf-8?B?YkdaSXFMOWpKZGJpeFJBQURXMmwzWkpud2ZTRHlRcUlyV1NaVzZ6QU5SN0Q1?=
 =?utf-8?B?WUxneUcrUi9VeGdKcWdGVjN6V2ZVYmlHcjRuVFVHWk15SjhUMElSWVBIM2lK?=
 =?utf-8?B?WHdwL0wycno0a1JQVEFWNjJwbUxVN2pYdGxDY2ErekxtUXdBbzhwcWlPM1RE?=
 =?utf-8?B?WElBOWhiUy9CNUJMdEV2dEdnMHRvWEdNemdrM05Hd2hrTzIyN3NCMHh3SHNr?=
 =?utf-8?B?Qzd2V0grQ21MTTdUSXhybjRkWXEyRWE3M01jTlVqRTNnOFlQaTFHQ1VnQ3VY?=
 =?utf-8?B?TFpvMkJpdGxCVThad0ViZWlpTU5DbkwyaGV5VTJLOXRIOFFTTmQxWEwybHJr?=
 =?utf-8?B?MmpaaFUxdDc4amU5RnNoaUdKSzFmU1BGaTM3OWUxTGMzd2EwUjIzTVl5M09I?=
 =?utf-8?B?OVhpdUZCckVHRjNCZVdERFdLKy9LQXNOR0VBY2FzS2pESEE3UWhoaVF1b3la?=
 =?utf-8?B?eDE0WnAvSDRFQUpXNWVkb0V1emNzRmpQNFIzRkJib2xHVnJENDdqaFliaVZa?=
 =?utf-8?B?T0gvNC8wczRaS0VmN2gxRzZoTTVHcGxXdFRLZjczRURCN1F0WUZqcEN1SDVL?=
 =?utf-8?B?Vy8rblNRWUVUcWZmbWt5TS8vU0RZOWFCVjRiOE8yNWpPd2VhU3JrSUhsWWtG?=
 =?utf-8?B?amRHZHA3MW9vMGJCMnI5eVN4U0tpTk84L0V5SXllM2c5YlgrN2RkcnppVDZE?=
 =?utf-8?B?a2RoNml2N0I2RXhPRkZ0c0ZINmxWZjlKczNQR29HYzZLcmV4dVk2N3Rjc2ZH?=
 =?utf-8?B?SUhlbG9HSTFjSHJGTFpGaFpUREEycWhDVVZ0TC9sb1FOUkJ3R09Ody8zc1Y5?=
 =?utf-8?B?Nm9XUGM5WHVscVc5Q1R3RW01UWU5S3B3TjBLVzlvMWwxbFBKMHJMNzJtZCtL?=
 =?utf-8?B?d1QwcUVSTks0V3o1OGdPU2pVc0VLc0xhMzlQNlZmRncwblZ6UGdvckc5a1FK?=
 =?utf-8?B?Qm1GQ3h1NDc2azJlUVZmNlBSNm5ndGhyTWJmS09kbFdVTU5UOEJrTXlYa3BS?=
 =?utf-8?B?V0NPSDVnbHFRY2JQMEN5OHloY29KcXd2YmRUaUl5Q0IrMHp5TXhheVdLck5K?=
 =?utf-8?B?TTVxTnF6QzdPblhIZytBTUV1RFFxUlA0NGRnMlk5d1J6OUNpSUFnMERhWi8w?=
 =?utf-8?B?LzlRV3d2TDdJaEcvbU5FaGwvN24xZGNTY0dZMWRaMk1ZVXdNdEFQQjkwSWhq?=
 =?utf-8?B?R1FUSDNVZjhHUVZ6SitvanJpLzE0eW93NzZJbC9oWlN2cnVlVmp6TWZUQWRR?=
 =?utf-8?B?MFprVlVNc1NSWHloYjR2UU03dndmUG0xRHdRMERLd3p4UTZ2aExBZ3B6YWlq?=
 =?utf-8?B?b1VPT0kxMkNvUjhGSm43WWpXZ2xmSFJsVnVqckw4cGVPSTA3bC9mdy9iWDZz?=
 =?utf-8?Q?avyjD7io3ZOJvDwBw53etUD4F?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652bdcb7-f999-4d81-fd9d-08db29e5787d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2023 08:22:54.8204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TyNZhUISbAVcu+FFVshtXaBgoIrM8ruCRYSF09T2DeeWaEu3h202FOwjlFLvyXkbqBDRfqUFVTVVkoJ4tvXGK2+Tw8okYqv/hmP4o9ztQMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5999
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMjAsIDIwMjMgNzoxNSBQTQ0KPiBUbzogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJv
YmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyenlzenRvZi5rb3ps
b3dza2krZHRAbGluYXJvLm9yZz47IEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiA8Z2VlcnQrcmVuZXNh
c0BnbGlkZXIuYmU+OyBNYWdudXMgRGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsgbGludXgt
DQo+IHJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc7IFByYWJoYWthciBNYWhhZGV2DQo+IExhZCA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJw
LnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDUvNV0gYXJtNjQ6IGR0czog
cmVuZXNhczogcjlhMDdnMDQ0OiBFbmFibGUgc2NpMA0KPiBub2RlcyB1c2luZyBkdCBvdmVybGF5
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCBNYXIgMjAsIDIwMjMgYXQgMTE6NTTigK9B
TSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEVu
YWJsZSBzY2kwIG5vZGUgdXNpbmcgZHQgb3ZlcmxheSBhbmQgZGlzYWJsZSBjYW57MCwxfS1zdGIt
aG9nIG5vZGVzDQo+ID4gaW4gZHQgb3ZlcmxheSBhcyBpdHMgcGlucyBhcmUgc2hhcmVkIHdpdGgg
c2NpMCBwaW5zLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYzOg0KPiA+ICAqIE5ldyBwYXRjaA0KPiAN
Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0My1zbWFyYy5kdHNvDQo+IA0K
PiBDYW4geW91IHBsZWFzZSBjb21lIHVwIHdpdGggYSBiZXR0ZXIgZmlsZW5hbWU/DQo+IFBlcmhh
cHMgcjlhMDdnMDQzLXNtYXJjLXBtb2QuZHRzbz8NCg0KQWdyZWVkLg0KDQo+IA0KPiA+IEBAIC0w
LDAgKzEsNDUgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4g
PiArLyoNCj4gPiArICogRGV2aWNlIFRyZWUgU291cmNlIGZvciB0aGUgUlove0cyVUwsIEZpdmV9
IFNNQVJDIEVWSyBQTU9EIHBhcnRzDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAy
MyBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAuDQo+ID4gKyAqDQo+ID4gKyAqDQo+ID4gKyAqIFtD
b25uZWN0aW9uXQ0KPiA+ICsgKg0KPiA+ICsgKiBTTUFSQyBFVksgICAgICAgICAgICAgICAgICAg
ICAgICAgICBQTU9EIFVTQlVBUlQNCj4gPiArICogKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0rDQo+ID4gKyAqIHxDTjcgKFBNT0QxIFBJTiBIRUFERVIpICAgICB8DQo+ID4gKyAqIHwgICBT
Q0kwX1RYRCAgICAgICAgICBwaW43ICB8PC0tLS0tPnwgcGluMiAgVHggICAgICB8DQo+ID4gKyAq
IHwgICBTQ0kxX1JYRCAgICAgICAgICBwaW44ICB8PC0tLS0tPnwgcGluMyAgUnggICAgICB8DQpU
eXBvIFNDSTBfUlhEDQo+ID4gKyAqIHwgICBHbmQgICAgICAgICAgICAgICBwaW4xMSB8PC0tLS0t
PnwgcGluNSAgR25kICAgICB8DQo+ID4gKyAqIHwgICBWY2MgICAgICAgICAgICAgICBwaW4xMiB8
PC0tLS0tPnwgcGluNiAgVmNjICAgICB8DQo+ID4gKyAqICstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tKyAgICAgICstLS0tLS0tLS0tLS0tLS0rDQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoZSBy
aWdodCBzaWRlIG9mIHRoaXMgZGlhZ3JhbSBiZWxvbmdzIGhlcmUuIFRoZSB1c2VyIGlzIG5vdA0K
PiBsaW1pdGVkIHRvIGEgVVNCLVVBUlQgYnJpZGdlLCBidXQgY2FuIGNvbm5lY3Qgd2hhdGV2ZXIg
aGUgd2FudHMgdG8gdGhlIFBNT0QNCj4gY29ubmVjdG9yLg0KDQpBZ3JlZWQuDQoNCj4gDQo+ID4g
KyAqDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArL2R0cy12MS87DQo+ID4gKy9wbHVnaW4vOw0KPiA+
ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+DQo+IA0KPiBVbnVzZWQ/DQoNCk9L
LCB3aWxsIGRyb3AuDQo+IA0KPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9yemcy
bC1waW5jdHJsLmg+DQo+ID4gKw0KPiA+ICsmcGluY3RybCB7DQo+ID4gKyAgICAgICBjYW4wLXN0
Yi1ob2cgew0KPiA+ICsgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICsg
ICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICBjYW4xLXN0Yi1ob2cgew0KPiA+ICsgICAgICAg
ICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICsgICAgICAgfTsNCj4gPiArDQo+ID4g
KyAgICAgICBzY2kwX3BpbnM6IHNjaTAtcGlucyB7DQo+ID4gKyAgICAgICAgICAgICAgIHBpbm11
eCA9IDxSWkcyTF9QT1JUX1BJTk1VWCgyLCAyLCA1KT4sIC8qIFR4RCAqLw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICA8UlpHMkxfUE9SVF9QSU5NVVgoMiwgMywgNSk+OyAvKiBSeEQgKi8N
Cj4gPiArICAgICAgIH07DQoNCk5leHQgdmVyc2lvbiwgSSBhbSBwbGFubmluZyB0byBtb3ZlIHRo
aXMgcGluY3RybCBkZWZpbml0aW9ucyB0byByemcydWwtc21hcmMtcGluZnVuY3Rpb24uZHRzaQ0K
YXMgc2VwYXJhdGUgcGF0Y2gsIHNpbmNlIGl0IGlzIFNvQyBzcGVjaWZpYz8NCg0KKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6ZzJ1bC1zbWFyYy1waW5mdW5jdGlvbi5kdHNpDQpA
QCAtNTAsNiArNTAsMTMgQEAgaTJjMV9waW5zOiBpMmMxIHsNCiAgICAgICAgICAgICAgICBpbnB1
dC1lbmFibGU7DQogICAgICAgIH07DQogDQorI2lmIChTV19FVDBfRU5fTikNCisgICAgICAgc2Np
MF9waW5zOiBzY2kwLXBpbnMgew0KKyAgICAgICAgICAgICAgIHBpbm11eCA9IDxSWkcyTF9QT1JU
X1BJTk1VWCgyLCAyLCA1KT4sIC8qIFR4RCAqLw0KKyAgICAgICAgICAgICAgICAgICAgICAgIDxS
WkcyTF9QT1JUX1BJTk1VWCgyLCAzLCA1KT47IC8qIFJ4RCAqLw0KKyAgICAgICB9Ow0KKyNlbmRp
Zg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZzY2kwIHsNCj4gPiAr
ICAgICAgIHBpbmN0cmwtMCA9IDwmc2NpMF9waW5zPjsNCj4gPiArICAgICAgIHBpbmN0cmwtbmFt
ZXMgPSAiZGVmYXVsdCI7DQo+ID4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gK307DQo+
IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlDQo+IHRoYXQuDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
