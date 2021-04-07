Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B608A35685B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Apr 2021 11:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346079AbhDGJuI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Apr 2021 05:50:08 -0400
Received: from mail-eopbgr60064.outbound.protection.outlook.com ([40.107.6.64]:2278
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234025AbhDGJuH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Apr 2021 05:50:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+FVny34nk7sVOHlI+UpUH3tHitCwfzdvCxfvIHD6Ol4VnH28VsFDAqkJnZseTyYmShpqG5R+ozPfR2nR+k72MuQ+2Qer3KedakIuRupprp/ns08TX2nwoCO/vPBON8uLlBfExzMR5n0ECsCRICMbf87nUtBvxBx1cqjD2KfT4qqWUwlvz3uB1X15G4Z4Bj0Xs6nPDksHO213FOOwZQqJByLygi320571BhzUvXQ6XX0BPpgL4ap5s/3LLgs3XoSqRQTQdClJxsbHPRNYQcthzFTG2OUxjKPU09G+HMeQr5Qzpala/ypBuTIVl8o/06Xtz7GXOZVm0eD7ouM2fwf0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dguz76hFmLmXlIgL92UOIx3/29PY66E+nCacjGzW5YI=;
 b=dL9N10AHt1/CoPRsUiBi2ulvaXMvRXCQnTfTWeqHvdeDMuJ0MqekEv9GzjS0IjtNspzZxspu0v/MRon1sTgRfwlUcJRh7J2S5AP6Yq6o1mCc3W+tlx+wpfmS/Cm05tinsMRA7Y1BahKsBmpq420rHFgbKII+v4qUeLbU3h1+ci83dUH0jB1XIguVt57vX4fiLM9a/pHZCl3eX5rRbDGa3yfKjer/GGi92Z9UoSGx4uR+lq3hcnscFG5oTpqBV64hikOy91eDFw7jBLVC446g9fmxfI/0fb3ngZmhIuzbgrszREjzFVwLKsIvqZN0V9pe0AyTqUnBBDh9hcYaRlCWAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dguz76hFmLmXlIgL92UOIx3/29PY66E+nCacjGzW5YI=;
 b=dz3y8xmQbFUTl1DRoNZysAOeZvIulxHWy582k+x9/Wr49JhXiiP7tuHbvcbJgGIIpBHGi+vZMruh4YJ4VoqClBHZ1AiG8dbPpYbA6ODEkqihtpqHVrEuC7z76POpcQjGkqyqGYHX26y3TBUHz7sCiHnqEveMw1sJyAL42XllfAY=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB2891.eurprd03.prod.outlook.com (2603:10a6:7:62::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32; Wed, 7 Apr 2021 09:49:45 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd%3]) with mapi id 15.20.3999.033; Wed, 7 Apr 2021
 09:49:45 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
CC:     "agross@kernel.org" <agross@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v4 3/7] regulator: IRQ based event/error notification
 helpers
Thread-Topic: [PATCH v4 3/7] regulator: IRQ based event/error notification
 helpers
Thread-Index: AQHXKrRUz5e/K6qNQUGVKWIQIRdIZKqoF3GAgACvA7WAAArQAA==
Date:   Wed, 7 Apr 2021 09:49:45 +0000
Message-ID: <42210c909c55f7672e4a4a9bfd34553a6f4c8146.camel@fi.rohmeurope.com>
References: <cover.1617690965.git.matti.vaittinen@fi.rohmeurope.com>
         <2b87b4637fde2225006cc122bc855efca0dcd7f1.1617692184.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VeoTVNDemV0qRA4BTVqOVfyR9UKGWhHgfeat8zVVGcu_Q@mail.gmail.com>
         <55397166b1c4107efc2a013635f63af142d9b187.camel@fi.rohmeurope.com>
         <CAHp75VeK+Oq9inOLcSSsq+FjaaPC5D=EMt4vLf97uR1BmpW2Zw@mail.gmail.com>
In-Reply-To: <CAHp75VeK+Oq9inOLcSSsq+FjaaPC5D=EMt4vLf97uR1BmpW2Zw@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd58409b-3899-47ab-5ae6-08d8f9aa79c5
x-ms-traffictypediagnostic: HE1PR03MB2891:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB2891D2C588BA19872910E308AD759@HE1PR03MB2891.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gljkpRvzAj7TPeXFIXBEFjJqgwdObitHQVXPsYTm6Kkrlo4FGV4fMBEEUeSjtsCZzAA34S800Bl/C1X/mObwWa37SRtDoHZjSeRN2Oi4qYzkEN6eUQXZSXGDjhHswZK0VtVwvWl+lcLX4isX+bv2lJ7CLE6siJZV+ltMJy3OQg3qTcX9rVhRjFOnrGYXAy3CRMyDAB9pDACp2QZszPOMx8qEBZtFSbCudvPbj2Etv2vHTrpbPR7oRWuUFpW2W6QtqTdtpEAkmAblsOqHwwf5JD/TfC337zk6ajbQavJzxrQTDkSQEf954MYIjSZ1AHDxlMXt+uBYJtNenrj98cyzqM4QOX6WUXXyomFcLxsrs/JxT9J7fB9n+JZqwqpdNb/uaaF0c9GY5+pJmTNQB+8/+NfBZnql0ClVA4lP5/CL2JaJcA1XYZtbl/Vp+lIbhW2N4YO8NZIuj1wPIRAMGB6yYRaHmMKdu5CDLrFiZ86+RP1rAdZHccEaSuaI32GHu0oGHSozbRaM7p13LYjPSJed5UJQ/o9FHncfBSnPbS7at1MyiR8Bq42Rpze1WqTtAzLVcg/xIpKLAt5yH1+Pn9NB3Ju4q1byBaJi2TYEEmNIUlwn2D9qYFXZ70iMjI1SfJOO+8GA4V04Q4QZ7p3QdXt3FRWV5aXmKimyI+KV6NbEoN/ZY4+tRFl1z9rST+J8OzYq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(39850400004)(376002)(66946007)(86362001)(64756008)(76116006)(4326008)(6506007)(53546011)(66476007)(66556008)(83380400001)(6486002)(2906002)(66446008)(5660300002)(7416002)(8676002)(54906003)(71200400001)(6916009)(2616005)(186003)(8936002)(478600001)(15650500001)(3450700001)(316002)(6512007)(38100700001)(341764005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?am5Db2dLdE5kRGlaUHdRcFp3WElLS0tHWG5TMHBQOEozUElHVm5yeEJNaFBw?=
 =?utf-8?B?blpjWDlwNkUzM3NjTktGa1Ewa1hDczNINDlBU0RRWDBpajFQZ0p6RVh1VTJx?=
 =?utf-8?B?bUpVZG9wbG1OTmNucmwwOGVMZkhjWGQ1aWp1VHl2anlBeGtiUm0xRE5veWRO?=
 =?utf-8?B?R2RsVXU3Si9IZHNHOTEwRWxVd3JZTmdxYUduOE9RK0NxNWtuVWFMOTRZMzdQ?=
 =?utf-8?B?aVE1Um4xSkd0ZDc4dC9JeEM4MS9wZjIybXNMemhHQU5QVS9ZRTlIZHVLb1Uy?=
 =?utf-8?B?b2J0bS9QWHdaSXdsZGZrUlRrK0xVQ3U3U0hIa3p3RDAvRk40dzJTa2FpQmJO?=
 =?utf-8?B?a1Ayd1grcXJaeDZyT3A3cmpTYWFxMlJqSXZwM29Wa29HZ0RmV2xCYStNZU5D?=
 =?utf-8?B?UHRUL2dkYUpXTWxwSHBJYTF2b1h2b3hZaiszcjIvSW1mck5oUmFhQUtiRUVR?=
 =?utf-8?B?K3pkODFBdDNoYWZhaW5sOXg5WFZPYmxRWlU0T2g1M3R3dC9EL01UYTcwUkhD?=
 =?utf-8?B?ZUNjZHY4djlVQnZJcmJLdlFuNWhGREpWQWI4cnNaclpsVjk0UGNTTWlmZm5h?=
 =?utf-8?B?YThpZXRLQXo5eXB5U1ZLMDY1cnpBR0EzWUJPMWdXVmdjWEpnQnd6dXhKem0y?=
 =?utf-8?B?MjI4SVVPWUhtcXVkRjA2R1RoK3RGSFAxNmtKSTFiZHVFQ2gzak5QV3Q2OEw0?=
 =?utf-8?B?M1dqRGJsOVMzeFJsVlo0cjQvL0ZRWEUwM3pqOU1PNUxjUkErV0pCN2IzK0I5?=
 =?utf-8?B?SitZeS9mMEc2b3BoZWh3azRaMVB2SDZTTTNCbklQOW42WEc4QlI4RkJMelY3?=
 =?utf-8?B?NlJ5M3IwbTZDOVVzQ0d2bGFiLzJ0eW5ENmRxRzN6OC9pR0pRMVQ3amF3T1dD?=
 =?utf-8?B?Zkl4Mkc1Yk5CVmhoT25XV1QyUnYvRXEyd05rNzhKOU8zUDhQUVdobUhzWXZx?=
 =?utf-8?B?ZVZvYU1kMFNiazc4NEEwRFBaYXpzNlJyUUZPOW9EK0k4OFdTYnVpL2JacWRS?=
 =?utf-8?B?OHkydFpjTWFRN0xra1J4cnVjUFdlV3I3WnZzUmY2ajU0Yzdkd3duOUN6aHQx?=
 =?utf-8?B?R29jVElIdURqVnBNdWFGV2RPZ1dIbUhGdXN3dW5VbVRkai9wZUp1WVZ3SFQ0?=
 =?utf-8?B?U00wNmYvdHkzOGV6TElWNjI0N3RURVBubzRKbDJLaWNVTUNyakd1VmQzYnpq?=
 =?utf-8?B?WEMzZTEyV0NFdEQ2ajA5VzFrd1F0dExmL1NkRklpUSs1UHYzc3VmN29kR2U3?=
 =?utf-8?B?OTBSYm1udzJlSDFGMXNBUDJhV3NxaUd3akJTRDBQMzd3NjNJUTFvaXVCMm1t?=
 =?utf-8?B?Q3pZSVpXQ0F4RTl2WHlUbW9LZ1B3a2tBdVJENVg4elovYjhqSTE5dSs3TlZ5?=
 =?utf-8?B?MDMzSjdGNi9sMUFwODlWL2Y5bU5JeGVmUUdKZW9NbTlyeE1QT0plcmVZVE5R?=
 =?utf-8?B?T3pNejJIaElMUGJ6bVpxdmprNVhFRW8zRVhIR0FrRFpXLzNZZStURmZ3RDU1?=
 =?utf-8?B?dWhvZk1WZnFDejlRVnlSZ3kzeUZ3MVhySUl5aFZCQUNpcUdiMlNYYzlYaTB6?=
 =?utf-8?B?NUkvcXVDdUdLN3FPamxqL2YvcW5iTFdWMVhTVkN0MmNteGNVNDR6S3YzWnhW?=
 =?utf-8?B?bWhyY3l6SU5VZWlmVWJpelJ0WWx6VnlmVU90MEptVnE0NXZWbUFmdHhoUUxI?=
 =?utf-8?B?Wk9hd2l3UTUzTGJ3MVN5U0QrTEtaRUhLNHJ3U1UrcXRGak5HazdHSkYwQW1j?=
 =?utf-8?B?cmNER0luTzNYK2lkSFpZU1BpNEhXTHYyc2NrSWFsL3NTMWFLUDBnVWtrSlc3?=
 =?utf-8?Q?vyn5I0sZLCj/ef9Ndn+660LYphmqD1IKqYUgE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB41C6ADF2FB1C4DAC5D3B0ED131A34A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd58409b-3899-47ab-5ae6-08d8f9aa79c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 09:49:45.3549
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fsauN3OL1pH2kFsKw7CPNcqRCAFqjF2MvAqNrNbx/Z6YLMmSf0RB09BgLcIIyXwO1+7JxRsggK+orRaXgEFljnvddrNDQHtXRY0G753NoSZJDn4b7jBs/Q/M5gw2GEAA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB2891
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gQW5keSwNCg0KT24gV2VkLCAyMDIxLTA0LTA3IGF0IDEyOjEwICswMzAwLCBBbmR5IFNo
ZXZjaGVua28gd3JvdGU6DQo+IE9uIFdlZCwgQXByIDcsIDIwMjEgYXQgODowMiBBTSBNYXR0aSBW
YWl0dGluZW4NCj4gPG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4gd3JvdGU6DQo+
ID4gT24gV2VkLCAyMDIxLTA0LTA3IGF0IDAxOjQ0ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3Jv
dGU6DQo+ID4gPiBPbiBUdWVzZGF5LCBBcHJpbCA2LCAyMDIxLCBNYXR0aSBWYWl0dGluZW4gPA0K
PiA+ID4gbWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPiB3cm90ZToNCj4gDQo+IC4u
Lg0KPiANCj4gPiA+ID4gKyAgICAgICBwcl9lbWVyZyhtc2cpOw0KPiA+ID4gDQo+ID4gPiBPaCBs
w6AgbMOgLCBiZXNpZGVzIGJ1aWxkIGJvdCBjb21wbGFpbnRzLCB0aGlzIGhhcyBzZXJpb3VzIHNl
Y3VyaXR5DQo+ID4gPiBpbXBsaWNhdGlvbnMuIE5ldmVyIGRvIGxpa2UgdGhpcy4NCj4gPiANCj4g
PiBJJ20gbm90IGV2ZW4gdHJ5aW5nIHRvIGNsYWltIHRoYXQgd2FzIGNvcnJlY3QuIEFuZCBJIGRp
ZCBzZW5kIGENCj4gPiBmaXh1cCAtDQo+ID4gc29ycnkgZm9yIHRoaXMuIEkgZG9uJ3QgaW50ZW5k
IHRvIGRvIHRoaXMgYWdhaW4uDQo+ID4gDQo+ID4gTm93LCB3aGVuIHRoaXMgaXMgc2FpZCAtIElm
IHlvdSBoYXZlIGEgbWludXRlLCBwbGVhc2UgZWR1Y2F0ZSBtZS4NCj4gPiBBc3N1bWluZyB3ZSBr
bm93IGFsbCB0aGUgY2FsbGVycyBhbmQgdGhhdCBhbGwgdGhlIGNhbGxlcnMgdXNlIHRoaXMNCj4g
PiBhcw0KPiA+IA0KPiA+IGRpZV9sb3VkbHkoImZvb2JhcmZvb1xuIik7DQo+ID4gLSB3aGF0IGlz
IHRoZSBleHBsb2l0IG1lY2hhbmlzbT8NCj4gDQo+IE5vdCBhIHNlY3VyaXR5IGd1eSwgYnV0IG15
IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGlzIGNvZGUgbWF5IGJlDQo+IHVzZWQNCj4gYXMgYSBn
YWRnZXQgaW4gUk9QIHRlY2huaXF1ZSBvZiBhdHRhY2tzLg0KDQpUaGFua3MgQW5keS4gSXQnZCBi
ZSBpbnRlcmVzdGluZyB0byBsZWFybiBtb3JlIGRldGFpbHMgYXMgSSBhbSBub3QgYQ0Kc2VjdXJp
dHkgZXhwZXJ0IGVpdGhlciA6KQ0KDQo+IEluIHRoYXQgY2FzZSBtc2cgY2FuIGJlIGFueXRoaW5n
LiBPbiB0b3Agb2YgdGhhdCwgc29tZWJvZHkgbWF5DQo+IG1pc3Rha2VubHkgKGluYWR2ZXJ0ZW50
bHkpIHB1dCB0aGUgY29kZSB0aGF0IGFsbG93cyB1c2VyIGNvbnRyb2xsZXINCj4gaW5wdXQgdG8g
Z28gdG8gdGhpcyBwYXRoLg0KDQpZZXMuIFRoaXMgaXMgYSBnb29kIHJlYXNvbiB0byBub3QgdG8g
ZG8gdGhpcyAtIGJ1dCBJIHdhcyBpbnRlcmVzdGVkIGluDQprbm93aW5nIGlmIHRoZXJlIGlzIGEg
cG90ZW50aWFsIHJpc2sgZXZlbiBpZjoNCg0KPiA+IGFsbCB0aGUgY2FsbGVycyB1c2UgdGhpcw0K
PiA+IGFzDQo+ID4gDQo+ID4gZGllX2xvdWRseSgiZm9vYmFyZm9vXG4iKTsNCg0KDQo+IEFuZCBs
YXN0IGJ1dCBub3QgbGVhc3QsIHRoYXQgc29tZSBuZXdiaWVzIG1pZ2h0IGNvcHknbidwYXN0ZSBi
YWQNCj4gZXhhbXBsZXMgd2hlcmUgdGhleSB3aWxsIGV4cG9zZSBzZWN1cml0eSBicmVhY2guDQoN
ClllcyB5ZXMuIEFzIEkgc2FpZCwgSSBhbSBub3QgdHJ5aW5nIHRvIHNheSBpdCBpcyBPay4gSSB3
YXMganVzdA0Kd29uZGVyaW5nIHdoYXQgYXJlIHRoZSByaXNrcyBpZiB1c2VycyBvZiB0aGUgcHJp
bnQgZnVuY3Rpb24gd2VyZSBrbm93bi4NCg0KPiBXaXRoIHRoZSBtb2Rlcm4gd29ybGQgb2YgU3Bl
Y3RyZSwgcm93aGFtbWVyLCBhbmQgb3RoZXIgc2lkZSBjaGFubmVsDQo+IGF0dGFja3MgSSBtYXkg
YmVsaWV2ZSB0aGF0IG9uZSBtYXkgZXhoYXVzdCB0aGUgcmVndWxhdG9yIGZvciBnZXR0aW5nDQo+
IGFkdmFudGFnZSBvbiBhbiBhdHRhY2sgdmVjdG9yLg0KPiANCj4gQnV0IGFnYWluLCBub3QgYSBz
ZWN1cml0eSBndXkgaGVyZS4NCg0KVGhhbmtzIGFueXdheXMgOikNCg0KPiANCj4gPiA+ID4gKyAg
ICAgICBCVUcoKTsNCj4gPiA+ID4gK30NCj4gPiA+ID4gKw0KPiANCj4gLi4uDQo+IA0KPiA+ID4g
PiBlcnJvcnMgd2lsbCBiZQ0KPiA+ID4gPiArICogICAgICAgICAgICAgICAgICAgICBvcidlZCB3
aXRoIGNvbW1vbiBlcnJvcy4gSWYgdGhpcyBpcw0KPiA+ID4gPiBnaXZlbg0KPiANCj4gZXJyb3Jz
ID8NCg0KVGhhbmtzLiBJIGRpZG4ndCBmaXJzdCBzcG90IHRoZSB0eXBvIGV2ZW4gdGhvdWdoIHlv
dSBwb2ludGVkIGl0IHRvIG1lLg0KTHVja2lseSBteSBldm9sdXRpb24gaGFzIG9jY2FzaW9uYWwg
cHJvYmxlbXMgd2hlbiBjb21tdW5pY2F0aW5nIHdpdGgNCnRoZSBtYWlsIHNlcnZlci4gSSBoYWQg
ZW5vdWdoIHRpbWUgdG8gaGl0IHRoZSBjYW5jZWwgYmVmb3JlIHNlbmRpbmcgb3V0DQphIG1lc3Nh
Z2Ugd2hlcmUgSSB3b25kZXJlZCBob3cgSSBzaG91bGQgY2xhcmlmeSB0aGlzIDpdDQoNCj4gLi4u
DQo+IA0KPiA+ID4gPiArICAgICAgIGlmIChpcnEgPD0gMCkgew0KPiA+ID4gPiArICAgICAgICAg
ICAgICAgZGV2X2VycihkZXYsICJObyBJUlFcbiIpOw0KPiA+ID4gPiArICAgICAgICAgICAgICAg
cmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+ID4gPiANCj4gPiA+IFdoeSBzaGFkb3dpbmcgZXJy
b3IgY29kZT8gTmVnYXRpdmUgSVJRIGlzIGFueXRoaW5nIGJ1dCDigJxubyBJUlHigJ0uDQo+ID4g
DQo+ID4gVGhpcyB3YXMgYSBnb29kIHBvaW50LiBUaGUgaXJxIGlzIHBhc3NlZCBoZXJlIGFzIHBh
cmFtZXRlci4gRnJvbQ0KPiA+IHRoaXMNCj4gPiBmdW5jdGlvbidzIHBlcnNwZWN0aXZlIHRoZSBu
ZWdhdGl2ZSBpcnEgaXMgaW52YWxpZCBwYXJhbWV0ZXIgLSB3ZQ0KPiA+IGRvbid0DQo+ID4ga25v
dyBob3cgdGhlIGNhbGxlciBoYXMgb2J0YWluZWQgaXQuIFByaW50IGNvdWxkIHNob3cgdGhlIHZh
bHVlDQo+ID4gY29udGFpbmVkIGluIGlycSB0aG91Z2guDQo+ID4gTm93IHRoYXQgeW91IHBvaW50
ZWQgdGhpcyBvdXQgSSBhbSB1bnN1cmUgaWYgdGhpcyBjaGVjayBpcyBuZWVkZWQNCj4gPiBoZXJl
Lg0KPiA+IElmIHdlIGNoZWNrIGl0LCB0aGVuIEkgc3RpbGwgdGhpbmsgd2Ugc2hvdWxkIHJlcG9y
dCAtRUlOVkFMIGZvcg0KPiA+IGludmFsaWQNCj4gPiBwYXJhbWV0ZXIuIE90aGVyIG9wdGlvbiBp
cyB0byBqdXN0IGNhbGwgdGhlIHJlcXVlc3RfdGhyZWFkZWRfaXJxKCkNCj4gPiAtDQo+ID4gbG9n
IHRoZSBJUlEgcmVxdWVzdCBmYWlsdXJlIGFuZCByZXR1cm4gd2hhdCByZXF1ZXN0X3RocmVhZGVk
X2lycSgpDQo+ID4gcmV0dXJucy4gRG8geW91IHRoaW5rIHRoYXQgd291bGQgbWFrZSBzZW5zZT8N
Cj4gDQo+IFdoeSBpcyB0aGUgcGFyYW1ldGVyIHNpZ25lZCB0eXBlIHRoZW4/DQo+IFNob3VsZG4n
dCB0aGUgY2FsbGVyIHRha2UgY2FyZSBvZiBpdD8NCj4gDQo+IE90aGVyd2lzZSwgd2hhdCBpcyB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHBhc3NpbmcgbmVnYXRpdmUgSVJRIHRvDQo+IHJlcXVlc3Rf
aXJxKCkgY2FsbD8NCj4gQXMgeW91IHNhaWQsIHlvdSBzaG91bGRuJ3QgbWFrZSBhc3N1bXB0aW9u
cyBhYm91dCB3aGF0IGNhbGxlciBtZWFudA0KPiBieSB0aGlzLg0KPiANCj4gU28sIEkgd291bGQg
c2ltcGx5IGRyb3AgdGhlIGNoZWNrIChmcm9tIGVhc2luZXNzIG9mIHRoZSBjb2RlDQo+IHBlcnNw
ZWN0aXZlKS4NCg0KWWVwLiBJIHdhcyBnb2luZyB0byBkcm9wIHRoZSBjaGVjay4gR29vZCBwb2lu
dC4gVGhhbmtzLg0KSSdsbCBzZW5kIHY2IHNob3J0bHkgdG8gYWRkcmVzcyB0aGUgaXNzdWVzIHlv
dSBzcG90dGVkIEFuZHkuIFRoYW5rcy4NCg0KPiANCj4gLi4uDQo+IA0KPiA+ID4gPiArdm9pZCBy
ZWd1bGF0b3JfaXJxX2hlbHBlcl9jYW5jZWwodm9pZCAqKmhhbmRsZSkNCj4gPiA+ID4gK3sNCj4g
PiA+ID4gKyAgICAgICBpZiAoaGFuZGxlICYmICpoYW5kbGUpIHsNCj4gPiA+IA0KPiA+ID4gQ2Fu
IGhhbmRsZSBldmVyIGJlIE5VTEwgaGVyZSA/IChZZXMsIEkgdW5kZXJzdGFuZCB0aGF0IHlvdSBl
eHBvcnQNCj4gPiA+IHRoaXMpDQo+ID4gDQo+ID4gVG8gdGVsbCB0aGUgdHJ1dGggLSBJIGFtIG5v
dCBzdXJlLiBJICpndWVzcyogdGhhdCBpZiB3ZSBhbGxvdyB0aGlzDQo+ID4gdG8NCj4gPiBiZSBO
VUxMLCB0aGVuIG9uZSAqY291bGQqIGltcGxlbWVudCBhIGRyaXZlciBmb3IgSUMgd2hlcmUgSVJR
cyBhcmUNCj4gPiBvcHRpb25hbCwgaW4gYSB3YXkgdGhhdCB3aGVuIElSUXMgYXJlIHN1cHBvcnRl
ZCB0aGUgcG9pbnRlciB0bw0KPiA+IGhhbmRsZQ0KPiA+IGlzIHZhbGlkLCB3aGVuIElSUXMgYXJl
bid0IHN1cHBvcnRlZCB0aGUgcG9pbnRlciBpcyBOVUxMLiAoV2h5KSBkbw0KPiA+IHlvdQ0KPiA+
IHRoaW5rIHdlIHNob3VsZCBza2lwIHRoZSBjaGVjaz8NCj4gDQo+IEp1c3QgbXkgZ3V0cyBmZWVs
aW5nLiBJIGRvbid0IHJlbWVtYmVyIHRoYXQgSSBldmVyIHNhdyBjaGVja3MgbGlrZQ0KPiB0aGlz
IGZvciBpbmRpcmVjdCBwb2ludGVycy4NCj4gT2YgY291cnNlIGl0IGRvZXNuJ3QgbWVhbiB0aGVy
ZSBhcmUgbm8gc3VjaCBjaGVja3MgcHJlc2VudCBvciBtYXkgYmUNCj4gcHJlc2VudC4NCg0KSSB0
aGluayBJJ2xsIGtlZXAgdGhlIGNoZWNrIHVubGVzcyB0aGVyZSBpcyBzb21lIHJlYXNvbiB3aHkg
aXQgc2hvdWxkDQpiZSBvbWl0dGVkLg0KDQo+ID4gPiBXaHkgbm90IHRvIHVzZSBkZXZtX2FkZF9h
Y3Rpb257X29yX3Jlc2V0fSgpPw0KPiA+IA0KPiA+IEkganVzdCBmb2xsb3dlZCB0aGUgc2FtZSBh
cHByb2FjaCB0aGF0IGhhcyBiZWVuIHVzZWQgaW4gb3RoZXINCj4gPiByZWd1bGF0b3INCj4gPiBm
dW5jdGlvbnMuIChkcml2ZXJzL3JlZ3VsYXRvci9kZXZyZXMuYykNCj4gPiBPVE9ILCB0aGUgZGV2
bV9hZGRfYWN0aW9uIG1ha2VzIHRoaXMgbGl0dGxlIGJpdCBzaW1wbGVyIHNvIEknbGwNCj4gPiBj
b252ZXJ0DQo+ID4gdG8gdXNlIGl0Lg0KPiA+IA0KPiA+IE1hcmssIGRvIHlvdSBoYXZlIGEgcmVh
c29uIG9mIG5vdCB1c2luZyBkZXZtX2FkZF9hY3Rpb24oKSBpbg0KPiA+IGRldnJlcy5jPw0KPiA+
IFNob3VsZCBkZXZtX2FkZF9hY3Rpb24oKSBiZSB1c2VkIGluIHNvbWUgb3RoZXIgZnVuY3Rpb25z
IHRoZXJlPyBBbmQNCj4gPiBzaG91bGQgdGhpcyBiZSBtb3ZlZCB0byBkZXZyZXMuYz8NCj4gDQo+
IEkgdGhpbmsgdGhlIHJlYXNvbiBmb3IgdGhpcyBpcyBhcyBzaW1wbGUgYXMgYSBoaXN0b3JpY2Fs
IG9uZSwgaS5lLg0KPiB0aGVyZSB3YXMgbm8gc3VjaCBBUEkgdGhhdCB0aW1lLg0KDQpSaWdodC4g
VGhpcyBpcyBwcm9iYWJseSB0aGUgcmVhc29uIHdoeSB0aGV5IHdlcmUgd3JpdHRlbiBhcyB0aGV5
IGFyZS4gSQ0Kd2FzIGp1c3Qgd29uZGVyaW5nIGlmIE1hcmsgaGFkIGEgcmVhc29uIHRvIGtlZXAg
dGhlbSB0aGF0IHdheSAtIG9yIGlmDQpoZSB3b3VsZCBhcHByZWNpYXRlIGl0IGlmIG9uZSBjb252
ZXJ0ZWQgdGhlbSB0byB1c2UgdGhlDQpkZXZtX2FkZF9hY3Rpb24oKSBmYW1pbHkgb2YgZnVuY3Rp
b25zLg0KDQpCZXN0IFJlZ2FyZHMNCiAgTWF0dGkuDQoNCg0K
