Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF80757CAD8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 14:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbiGUMov (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 08:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233481AbiGUMou (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 08:44:50 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2131.outbound.protection.outlook.com [40.107.113.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E9C7F501;
        Thu, 21 Jul 2022 05:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITRzKdKmuYQJW1fqrQ2xCFXzm7lT1/yI+ZxnrtJirTqaUCsOkjDOQCjFPlhnb0vXFr73UAcy6mSL5OnMGxG1M/tkQteiiDRK3RggC/pi5YUPPU3IEc3EEXqS0vhe7tlpRAYGOzv7amZri3EGmt3v7yeDOfMCDd12z1xqc1w9a2kvVVfw9YneZXEum6J8xtlTQV+dfpO5S2h2JcR3aIVw8DEtCglmv0lUHICGtiK9o+s4AfTxkdOyr5VEBoivRLpyH3LIlpHuCCar9pUX7JNihzT9j3ARqFAqOJBFd4kdeWm6AYf/lzUFL6a1Mx6EQcEB10S6qBNx5gDPT3Y/gFFSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ4Sk85JZqGNLF8JjpSCEMSwiExujdDTI6ZaRlo1e2s=;
 b=dYvgEDfUEXG2ZxiHjdS9We0HmLkhno+Ly0L+MTx7k4N3RKJHjr3vka7ZE11jTj6m/U1D70GS4/ZY4dKIc1LQMZU5JGVDfiNNwxhyx9cBVsiLhlDMLUY+8I4hQAAI6vJCLb8EoRSI+7MVybpeLFZWUt3uQOoqd8lm0ciCZGm+K+CkhgDsc6K5FT58n1bw/ddESyjIe4gGjw1erLVyK7uN7WLJ0sQqJDVfubXPi9rHYnkMHpVOTnXNBr8ijyHGTjPZfz51V9oRF6QAT8JZbHE5Fbup45+GaFjAzBFzwIVu1hD0qrsGGmH5UD3J4rUjZAEyadrg8u2mreG4uj6R3QfspA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQ4Sk85JZqGNLF8JjpSCEMSwiExujdDTI6ZaRlo1e2s=;
 b=RZLbgafZngUfBOsE5HqtkfjNh3wFp8FR+xq4Wk/9PkvRWIZ0PcQ9urFnSutb8vOlVCVhixQ7hoIAcHpgVaSqIsQLTGb+vXiwjs0KeIP16NN1IX8X5QdfPBbu8GA4kI2esDlQM/8TYbv1Z8hsSz+pjRIz9SLKmjRR2KqwRrdyDP8=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYWPR01MB7212.jpnprd01.prod.outlook.com (2603:1096:400:e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 12:44:46 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5458.018; Thu, 21 Jul 2022
 12:44:46 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Adam Ford <aford173@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: gadget: udc: renesas_usb3: Add support for
 RZ/V2M
Thread-Topic: [PATCH 2/2] usb: gadget: udc: renesas_usb3: Add support for
 RZ/V2M
Thread-Index: AQHYmqymW/0eL/mqCEKHRkgiHHt+a62IwEAAgAABA/CAAAgpAIAAAFZQ
Date:   Thu, 21 Jul 2022 12:44:46 +0000
Message-ID: <TYYPR01MB7086225F8269BB72A2F85D57F5919@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220718134458.19137-1-phil.edworthy@renesas.com>
 <20220718134458.19137-3-phil.edworthy@renesas.com>
 <CAMuHMdXuY_HOphyDtw4edZWu_D4QCi2hi-GWLF5R2jPNMHGcpg@mail.gmail.com>
 <TYYPR01MB7086F7C2A25D70EABB9BD338F5919@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <CAMuHMdVaHXfyW27G7ZdRvg-VG1Gw4F2zJ1v8K4JuS1W_u5T4ng@mail.gmail.com>
In-Reply-To: <CAMuHMdVaHXfyW27G7ZdRvg-VG1Gw4F2zJ1v8K4JuS1W_u5T4ng@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c64a6d95-f5be-459c-5b4c-08da6b16cad3
x-ms-traffictypediagnostic: TYWPR01MB7212:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DJxd0UJSfxI39lCAhNpDtm2NZHEk2n0AwiXW8HJxQ7oCe3ge6CL62weG4cMahLv6I1pH2RwaYcA2PlNO4EFysmxWmPAcUaINExx9GLpMk7mQfv404LqQU3WPrvCcc/1jYx0EUSpPEal2G7ZUk/i2QUSvKDP5Y3cumqyf1VPzohWnSk2aJ21K8Pc1wRfR1IRxGim6EHyuWbsNAgJ6ZRWRmCujCvUj2rWUOrCGjlSPypZBBegyTRHYUifEg2nxIUbdgDvxBh/suwRJlnivQW/B5/VbmMX4Hs+52dpqndrpFtJhxdG/jtHRADIIRxtQ+7iUr8y0YcXyVqFnEmEoWNgI4+jnJSzsFkiKNuW9uGaIQZ+1TeBTULmYxyJkULpxB66DMOaq/ifD0s9YmkmpayTyKeEMiFVQZE3oMGVv69Np3RFXeTzCauFpau+leL4PQAYTG+bvih6qg1injm9X8QklJCDLmujWGl35gQTMDkkUHFOt68o6is6qAA6RjyGp8AiXmYL3oc6FIRy+wQxBwHTksblVMY2a5UlS/ymQIGddRQFxxvXkVONsNGOxzqTbsaXdRF9m1whhEQvt7TeoT8YKMkKYBxWJ8blVk9kB4KRgtmlfup3BBN67hbF2lnfSg1V2mPUhO+WM+iLUHO1kJG+o0h5lrbAIJ4JeNtUCJIDcfDt1aNoMKRkPm/D3Ow14rDC8NIieLTgMPesOD2WENmJpj8mg3fvtaWwoarWRrOemTpt4KVPms92224yGR89h8m7QsqLIHeu8zqD34Uj7YXWEofd4U7UvqfoL3VgDNydvtJkh82zhFpm6rk1w2PyAWwno
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(122000001)(44832011)(478600001)(52536014)(38100700002)(38070700005)(4326008)(5660300002)(8936002)(2906002)(83380400001)(71200400001)(41300700001)(66446008)(8676002)(7696005)(9686003)(64756008)(66476007)(76116006)(66556008)(66946007)(53546011)(6506007)(6916009)(186003)(54906003)(55016003)(33656002)(86362001)(316002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1dna0VnNjB3NVNoTG5ZY3hVMEhHVFZhZEdXYTZUVDhWSEYzWEFPclVJcncx?=
 =?utf-8?B?ejFEeW44dWo2aC82L05sZXBuUTUwdnZWOWtNbWR5bzRUQjJUeGJpWGVpYVBQ?=
 =?utf-8?B?S3UzTjVsa0UzcWtuZ2ZvdHJ1Zkk3L1UrM01ERzFvRkVsM084VnREQkppNW1T?=
 =?utf-8?B?bGRhakl0bnREYlBNNWx1cWFzZ0RVSEpQSDZ2QnJsMWd3Q04zeVB6QU4yeEhC?=
 =?utf-8?B?Q1hyc1Z4TVp3V1RSWWJkNUtPbFIraDNSL3k3TW5QY3NBQWdSKytjZFBWYUdR?=
 =?utf-8?B?eHl5aHNQTmhHeGpubGZpTXNQZ2NzOG51akMxS0xBOGtFNUZ1OUQ1WjBUN1dR?=
 =?utf-8?B?M2gyZ3pPYkh5UGdIcld0bWJrMzYza3dDM2kveXMwYjBLYWM4aDRwWkZzSEsz?=
 =?utf-8?B?Z3FzRHZFVjZpclEydGJNdElwQWFHSEtzeHZsNTlBY3dCQ2FWQWh4ODdiZisy?=
 =?utf-8?B?VWs5UkdSblVWRzRSQ1ZVdGU1UFV4R2U3ejdLbXlkU2RiV2F0eUp2bVdmZjRH?=
 =?utf-8?B?YzgzWVgxUnIycEJpM1A4TStBQTR6dmEyVmVwYThPVUZEaHg0dlJkR1k5SERV?=
 =?utf-8?B?alQ2d0hXS25LaXJmbHpzNm1BMVJ5LzVGNFo4RlhYNDZNQ09aTUxadU10Vi9a?=
 =?utf-8?B?Yk8rbDQ5Sys2ZDlyVGpWT2J5OXp1c1ZhZkl0ZHFRMVYxeHQ4MlNOV1BwZSs1?=
 =?utf-8?B?Y28rZWhTdlJTbWNsemU0WDBrbmptbXJXUk52TkkxeFVCZlBFTk5TNXE2bVpo?=
 =?utf-8?B?a25kYXFNVUVmZHc2aURudmtqQ2l1WVp3Y1NreGlOOHdJeitJaGtEdEgrMnFp?=
 =?utf-8?B?SStlczg2b1ovWkJCT3BtenhBeUFncWljNjcrd1RvVCtINFdVK0dZNlI5VEp5?=
 =?utf-8?B?QkRHZzFBdDNyS0UzNEFtL2hVN3M3azJjV1cwRU83MHY0SktFMzFvYjF6ejVO?=
 =?utf-8?B?dmFLVFBRbnZ5MXVZdE9KRDNTeEZsdVduUlFuSmRRdDAvSnovVkVHdmRRb2Jj?=
 =?utf-8?B?Z3NWblRyREliU2NFSUp5S3FlaWwrV0tlNEFLeTgxRldBM1dsUGRvdURpZWFF?=
 =?utf-8?B?UTNPYWt4T1Q0amVIUWVCMWdqVU5PcWd6KzIzOFVTQWhhYnJRUllMTUZYUkM4?=
 =?utf-8?B?M0tUTEhzZ2Vsd3d1THpOOXFTanFHQ3dlamMwUVRocHVGbmIzMDRGb1l1TXpI?=
 =?utf-8?B?YUR3ZGlUK1FaZ2pQemx1KzIxOWJza3JxM1Vxd0hyck5waDRNVW8yOWdCcUk4?=
 =?utf-8?B?NnNGQXloRCt4aHJVL0hDWmkxUkdCa2VYVCtCZUQwWjhMYWVqMEhhS2VyNkxY?=
 =?utf-8?B?cUJmRWVoTnVldHp6eVVmcVViOXRod1d5N3RFTEVJTy9oUzU1aCtxbFVzckNX?=
 =?utf-8?B?bnVoMEYzbzBKSHlwai9lTHVjeFZzZXd3bE1tOTNlUUhvQjhsTWViNzBIT1Q3?=
 =?utf-8?B?UFBGclJoVTdRVlJaVTFnZ29Sci9ONHVpT0d6ZHZOakVUdzJySHJvbklZaTlt?=
 =?utf-8?B?TDRiTG1pOVp0M04rTFUyMmczU3dxeDdTZnp5WlJsbi9CdUQ0R3JVYlN6S2hE?=
 =?utf-8?B?emlHeXVROXFCd2JLSWNrc0tUNUF6WUk0RDh4SHY1Rkd2cTFoekYyMWs1Smpt?=
 =?utf-8?B?bDJUdG5saFFBOGUrQ09lTk43WUViUVdJd0VMS1NyN09xbCtRdHJFWkNpWkxw?=
 =?utf-8?B?eGZvVlpYY0xNK1VCaFJnd1JYRGxvYlVWZWVSOGFrc2Y3VE9EVW1IWXRIZGFy?=
 =?utf-8?B?SThnT052WU5ONW5yd0RqRFBQOUNWS1l1L3V1MTlCaXZVQVBITWZNVXNlN1Zi?=
 =?utf-8?B?VUo3WUY5dmFRaXpLbUxoeGRSeXlua3lQcFV0TVRGdU1BTFByWDFYVGRqSllU?=
 =?utf-8?B?Ym5OMUl4SVhHREV6SlhvRnpOYlZQWFNnR0JuMTNib2xoU1B3OXVta0UzV3F4?=
 =?utf-8?B?YVhQelEzam5ZQjN6dVl5UG0yREhoRHMza0xybzNSbTBiQjJNYzRHWEcrZ3Z4?=
 =?utf-8?B?R3lhM0hyTnFlTjJHclhlR2wrQjd3ZWRDZ0ljT3NLZkdkUkd1cCtUa2xMUlcv?=
 =?utf-8?B?aDVpRU93b1kycEE1ZXVRMlhjUDdkREFYejJNSEFSS2YvUkJxYXdaOU5pNWRN?=
 =?utf-8?B?RklLR0hWaGpYSHR5dXpMRFhVYnFZVjhIeDZKM0NWOWhrUkh0NHIvYnNWUWJh?=
 =?utf-8?B?R2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64a6d95-f5be-459c-5b4c-08da6b16cad3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 12:44:46.2492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4gggWQbuFO7MwhRFpkxUO3x5bjVLOsYDkz82SH2iQoSz0T1CIwI4WVz1VuOtVVIjvNisrdIMPCA0NWPUFePHjC4rtMhMiooM9YAbdTyojKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7212
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDIxIEp1bHkgMjAyMiAxMzo0MyBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+IE9uIFRodSwgSnVsIDIxLCAyMDIyIGF0IDI6MjUgUE0gUGhpbCBFZHdvcnRoeSB3cm90
ZToNCj4gPiBPbiAyMSBKdWx5IDIwMjIgMTM6MTAgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0K
PiA+ID4gT24gTW9uLCBKdWwgMTgsIDIwMjIgYXQgMzo0NSBQTSBQaGlsIEVkd29ydGh5IHdyb3Rl
Og0KPiA+ID4gPiBSWi9WMk0gKHI5YTA5ZzAxMSkgaGFzIGEgZmV3IGRpZmZlcmVuY2VzOg0KPiA+
ID4gPiAgLSBUaGUgVVNCM19EUkRfQ09OIHJlZ2lzdGVyIGhhcyBtb3ZlZCwgaXRzIGNhbGxlZCBV
U0JfUEVSSV9EUkRfQ09ODQo+IGluDQo+ID4gPiA+ICAgIHRoZSBSWi9WMk0gaGFyZHdhcmUgbWFu
dWFsLg0KPiA+ID4gPiAgICBJdCBoYXMgYWRkaXRpb25hbCBiaXRzIGZvciBob3N0IGFuZCBwZXJp
cGhlcmFsIHJlc2V0IHRoYXQgbmVlZCB0bw0KPiA+ID4gPiAgICBjbGVhcmVkIHRvIHVzZSB1c2Ig
aG9zdCBhbmQgcGVyaXBoZXJhbCByZXNwZWN0aXZlbHkuDQo+ID4gPiA+ICAtIFRoZSBVU0IzX09U
R19TVEEsIFVTQjNfT1RHX0lOVF9TVEEgYW5kIFVTQjNfT1RHX0lOVF9FTkEgcmVnaXN0ZXJzDQo+
ID4gPiA+ICAgIGhhdmUgYmVlbiBtb3ZlZCBhbmQgcmVuYW1lZCB0byBVU0JfUEVSSV9EUkRfU1RB
LA0KPiBVU0JfUEVSSV9EUkRfSU5UX1NUQQ0KPiA+ID4gPiAgICBhbmQgVVNCX1BFUklfRFJEX0lO
VF9FLg0KPiA+ID4gPiAgLSBUaGUgSURNT04gYml0IHVzZWQgaW4gdGhlIGFib3ZlIHJlZ3MgZm9y
IHJvbGUgZGV0ZWN0aW9uIGhhdmUNCj4gbW92ZWQNCj4gPiA+ID4gICAgZnJvbSBiaXQgNCB0byBi
aXQgMC4NCj4gPiA+ID4gIC0gUlovVjJNIGhhcyBhbiBzZXBhcmF0ZSBpbnRlcnJ1cHQgZm9yIERS
RCwgaS5lLiBmb3IgY2hhbmdlcyB0bw0KPiBJRE1PTi4NCj4gPiA+ID4gIC0gVGhlcmUgYXJlIHJl
c2V0IGxpbmVzIGZvciBEUkQgYW5kIFVTQlANCj4gPiA+ID4gIC0gVGhlcmUgaXMgYW5vdGhlciBj
bG9jaywgbWFuYWdlZCBieSBydW50aW1lIFBNLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBQaGlsIEVkd29ydGh5IDxwaGlsLmVkd29ydGh5QHJlbmVzYXMuY29tPg0KPiA+ID4gPiBS
ZXZpZXdlZC1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4N
Cj4gPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gPiA+DQo+ID4gPiA+IC0tLSBhL2RyaXZl
cnMvdXNiL2dhZGdldC91ZGMvcmVuZXNhc191c2IzLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy91
c2IvZ2FkZ2V0L3VkYy9yZW5lc2FzX3VzYjMuYw0KPiA+ID4NCj4gPiA+ID4gQEAgLTM2Myw2ICsz
NjgsNyBAQCBzdHJ1Y3QgcmVuZXNhc191c2IzIHsNCj4gPiA+ID4gICAgICAgICBib29sIGZvcmNl
ZF9iX2RldmljZTsNCj4gPiA+ID4gICAgICAgICBib29sIHN0YXJ0X3RvX2Nvbm5lY3Q7DQo+ID4g
PiA+ICAgICAgICAgYm9vbCByb2xlX3N3X2J5X2Nvbm5lY3RvcjsNCj4gPiA+ID4gKyAgICAgICBi
b29sIHI5YTA5ZzAxMTsNCj4gPiA+DQo+ID4gPiBBbnkgYmV0dGVyIG5hbWUgZm9yIHRoaXMgZmVh
dHVyZSBmbGFnPw0KPiA+IE5vdGhpbmcgc3ByaW5ncyB0byBtaW5kLiBXZSBjb3VsZCB1c2Ugc2Vw
YXJhdGUgZmxhZ3MgZm9yIGhhc19yZXNldHMsDQo+ID4gaGFzX2RyZF9pcnEsIG1heF9ucl9waXBl
cyBidXQgSSBhbSBzdHJ1Z2dsaW5nIHRvIGNvbWUgdXAgd2l0aCBuYW1lcw0KPiA+IGZvciB0aGUg
b2Zmc2V0IHJlZ2lzdGVycyBhbmQgbW92ZWQgYml0cy4gQW55IHN1Z2dlc3Rpb25zPw0KPiANCj4g
T0ssIHNvICJpc19yenYybSI/DQpPayENCg0KVGhhbmtzDQpQaGlsDQo=
