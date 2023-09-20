Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7A77A72C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Sep 2023 08:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233230AbjITGVC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Sep 2023 02:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbjITGUg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2023 02:20:36 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02872192;
        Tue, 19 Sep 2023 23:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPoUn7i/KB5VJ4yPbzRFR7lbagChfMSa1BqhCqO5gujj8hbLhKntwimaYyMJh6HoWShNirBjmBgNaKLsxZhTGwJ3qzVDrMknr1ha+VLpQreFBc4fnE6cbGo8EEyG4QGOZQyqGfwEvUhuUKghYv3DxbouAaIE9RVDFZHoOzzi639h5eoxepxlJvb4rqmUGmWF8lrsFQf+kqGIEGl789qQIbEPAjcQYpB9eSrJczFuwPRGRYPi+DaqjytJ1wOjbpGJfLAE1iyeB+qv+fefiJvBYd1QiSDK0hAuNBT9GlsU/2zmsKQGiVGTwasbNFqsaeRqkpdyg24Il9IA0BpEVh295A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fb4xFyCRpTzvcpETfX0nJ1gUxRBKdP0GL4VauL94uuA=;
 b=cdPebPxmkQIUGefNzyDbXWqSh3LNmExzRx+jN+S3mKvIS3z2/kK4k2JoEvZUGlB9fO6hkjzcvvi4+VTlIla74TfZE+My1THdHtsPwP+7sn6Q4x/vfwylESNz4t8lQkni7tJhtu/5Pi0FtbK11n2NDx1Ist2+jdldX5YCAu8GnR73nbhNFPON5erwoz7CEfa68BrP2OfrKPq/wsu2Qd7pYMOHECzdFuDte2DhO4l/IY4wbd9l0kw7F4KuRlBxMKDypyckP3SgCnn5l1+DsuZdSfsIjwAh+lQoNbzjFhEUZl07Vn/sIvntSkadeL0gsGnB+8bD50BMM9GN9W2Ssrcoaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb4xFyCRpTzvcpETfX0nJ1gUxRBKdP0GL4VauL94uuA=;
 b=NuZImY8B7QVYW9j2O2UUYSzrDPk+aDEv9hP/DvT3wDNduKGoFUgaFoNHR/j6Wf21FCTDRQBX6GaGAn4eDkgOGqZhkQ7mY+kfu52KOEDugbqWS/7HE2v7pi2tE1BmpMaqOdPz/y564NrW4t2BEag9VRD/4cljAgNTuQlLdFlk0ZI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB8248.jpnprd01.prod.outlook.com (2603:1096:400:111::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 06:20:16 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 06:20:15 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] leds: pca955x: Convert enum->pointer for data in the
 match tables
Thread-Topic: [PATCH] leds: pca955x: Convert enum->pointer for data in the
 match tables
Thread-Index: AQHZ0z8kv9KjU7Awp0CLK9RcUh98aLAibbSAgAEAhqA=
Date:   Wed, 20 Sep 2023 06:20:15 +0000
Message-ID: <OS0PR01MB592269A101AFD719C4052B3A86F9A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230820082005.55124-1-biju.das.jz@bp.renesas.com>
 <20230919150059.GY13143@google.com>
In-Reply-To: <20230919150059.GY13143@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYYPR01MB8248:EE_
x-ms-office365-filtering-correlation-id: 90257ba4-4be9-4225-0f31-08dbb9a1a7c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ar9ImxOBG4ZV0B02d3/B0Xd2IRvQ7AZd7uGky83SlWB8uW4eQvPw78VfoKAZ+MgFu8JDp+djxyl+tKcBOtx2sK6pP0EujjWgBLbZ40ESU/IsSffcUony6j6D9wHd35B+R22VGkRM5EmCKk/lQTAu/WnWXz+jd5KgUrCcD4GNTs5++YGX0aMqg1/7K52jQ837K9PgSnKXH6u7YNqTA8LAPjVJvLFi2xqcrNVcs8DGSBZwZArnA3T2QBWi9we7eJanOtm0E5nZHA+DxggYo0o3PZ83MillU0iprrfYXFAQYqTpZBKELiiZrUI2geP9Zv6gDGY7KCBGjGJeS/qcNQqAD/vGIQY6OVzVwf2+un4QIJswosUz8kC+ZFgw7KDN5kI+UX/15A4T56Lj1rwvLnMzIuDH9x64uhUMpoe6EuReF2rElvRsf2Wlg8hha1pr0Z8y9HyGUmNoqgjGA64fSnbTqUt9wDp44+hf2gAFFC1eo2SXD+1uJqZ8FwM1kvGVGI23EDrTJf91g15cvNbM19EvaMMZvQnalcKOhhadv62P3kVRi8UsIS6BMzx5vSo8aS3ShdxALsWfaYWAAMN3ujLzgqpGjLDiCHrg0lkmwPK/u1NQJxkCr2+Essn7v2iasCil
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(39860400002)(376002)(451199024)(186009)(1800799009)(6506007)(478600001)(55016003)(71200400001)(26005)(2906002)(316002)(4744005)(83380400001)(5660300002)(86362001)(7696005)(52536014)(122000001)(66446008)(4326008)(38100700002)(66476007)(66946007)(41300700001)(54906003)(76116006)(9686003)(8676002)(66556008)(6916009)(64756008)(8936002)(38070700005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEJvVCswQ0ZhNHNxV1pSZGVSNU12VG5KdFUzanBRS3djZ0ZGTm83TzdBcnZN?=
 =?utf-8?B?YzZhcC9LdTlkcWNxQzN2VHJrblp4R1h5S1dWUGZxQW1IQUFQQVF4MEZtSlY1?=
 =?utf-8?B?WGlwRU80NERlb1JqQmFjcGxJdUdIU0EwaFljdm1NNDFHY2dKbkhUSUtkSjl6?=
 =?utf-8?B?ZUQ1Q2tBYXcxL3ozRk43cFQvL3pJZW5DT2RxajhJdnhmNHFKQi9aSmlsdDFz?=
 =?utf-8?B?NFZ5WWZ1dWJ5c1o3SjhZSnpHSmlKdFNxVlhvMUJ4bm5kdDAvYkorU0Q5b2RG?=
 =?utf-8?B?YWZ2dkI3eEwvazZDVUpwRmVmK0EyMWZnM2E4REVoMG0xWEEwcXp5cFl3WUUy?=
 =?utf-8?B?cWZucXQwVFFFbUFGNTRweU1QYURTN1Vhai8zTU5RZndBdGJoNVR0NWgyVGta?=
 =?utf-8?B?TFN4NFBmc2RFQk41SVVRVTRFbmE3MHowRjhXRVFFWkkraHpNbGZGZlhwRFlO?=
 =?utf-8?B?b0NJUEtGdjNYNktlQ2tmRmFGcTlmOGF1blAxTFJ0dEh4L2dUb2x2NGtxL1V0?=
 =?utf-8?B?Q0NNaStONVpEOWJGU28yR09LYnNvSkJrQ0VvOU5mSE8xUjRKaEN4OEhnbjMv?=
 =?utf-8?B?SWQxbk9oVU9HZHd1c1J5N2ZqUVRPbmF6TUtqaWErUDd2MGM3MS9XbkZIVkd2?=
 =?utf-8?B?MTNhU2dJSlpuWTN0NDE5OUZaUXdxejZtMVhQRkpIL0pvQXZremxrblRKcVVU?=
 =?utf-8?B?ellDbDMrYUtnM0hQSm1EbzBMMlp6QzdzWmt4V1ljZks3dXVWTWxleENzZm15?=
 =?utf-8?B?VUpTOEZKOTdXeFB0N2hnY01kazRSUExOTllqSTluMC9TVkd5bkRldjRrS1gv?=
 =?utf-8?B?U0Z1Zm9GUUEyczVPaFpKV3dIMHlXZkZjWnpReVJTQTJYN3lBQTkyRXpsaGVI?=
 =?utf-8?B?enpuak5wZEQzTlhKNWNWL1c4TXF0MDVaMGpWOENzeFd0OTl6MmJtQjhSSlZN?=
 =?utf-8?B?Zys0VXduSlU4TW9tR3JvOXd0ckxGbndmTkwzMFFsSkU1RVFKd2tqOHlvWUhI?=
 =?utf-8?B?SXdkOWdLck9IU01GWVRodno0WE8zMGVYVldzVndVUGN0Sk1aanA3SEtPMkZP?=
 =?utf-8?B?VTRLTDd2UWo1blR3UFlSRWtiaXFPenhUbk5OMklDaHh2T1pQVUs4STh2dWRF?=
 =?utf-8?B?VFpyRnY3M3c1U3Izb1A5ZTZmOFlFMGNhd3owa3RST2sxNUJZektCMGVCcW1W?=
 =?utf-8?B?ZUhuK3h2cDlkRkFwMFBwcDBaYm9hT1NvcFlYVmpJckd1OUQ0UmlKblFJUVBk?=
 =?utf-8?B?Q0dZQzZlbzNhbDFZejdTNDhObGkybVNMYmpGdXZ4c3BZSkxrWUtwSDF0RXUx?=
 =?utf-8?B?Y1hnK2dDQmlaUzJ3OHRjMFdlS0Y4blJaZFVxMEMxN2s1aEpLTHpCb0UwWjZL?=
 =?utf-8?B?RTJGZi9qeE9OY2xmczRBcU5zNDIzZDBjTkNpM1BTY2pUK3laSGt5c2lKbkhm?=
 =?utf-8?B?ZEVWRktmMzVBdnAwSzQ1SWM1S0VNSHI4ZjRJaDlNVkpCSTBNUlZMbE84WFRw?=
 =?utf-8?B?cTlVQkE5emVxZzVqdGo2QjQzS09QMHRXcmpHa2twY2REWmdNNUNQZHlDRzEz?=
 =?utf-8?B?NW9vLzBlRlUwbzh6RHM1UW1QUUZvb09Zc2ZGSmRNNlpnSmt1eFZwc1VxVW1t?=
 =?utf-8?B?WjVSWDFzRkIxejRKQThWQStZcFEyQklPM015QUVEbnNQanZiQXJIdWs4VllP?=
 =?utf-8?B?RjkwaTBya2Q3OGNpQTdiUmlNclVvc0hwRGlXbVZjUXlheGpGSDFmWWtMOXRM?=
 =?utf-8?B?d3JpV3NXQ1pEczRCQmFRVW5IOERHK2wvVmx3UGR5SVBYbUNPNE5GU2hqZlE0?=
 =?utf-8?B?VUhENTl2M0xFbkFDNVJ0NkZXNHRqWTRUMmhlV0t0T3RFdzU3amZYREZwbHR1?=
 =?utf-8?B?WUgvQ1VxZmRLeEYwY0Q4MVhDU0FJWHZYTUcxZlA0M25WUXZPK3Rpa2NscGg3?=
 =?utf-8?B?Ykl6TE9SaWg4REloSS9xaVE1c3phRlZNZDJjekt4SDloM0FQc0dTaVhPQUZ1?=
 =?utf-8?B?bkFtOGlHTnFiTTBNZXU2eVlXZHVlcitpQ1hCQlJhL1Q3SEVOdnkzYmZFU0E3?=
 =?utf-8?B?dThXNWpHM2VFS3BCMGxKcmdjOFBycVVVdVRTbTBmK0VRaG5EZER0WWU0NXZx?=
 =?utf-8?B?UFBNRG1paXZMeDdRVTN0MlgzeXB0WVZtUzN4a1JrNGNtZFRtN3RNTWUrRGdK?=
 =?utf-8?B?ZlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90257ba4-4be9-4225-0f31-08dbb9a1a7c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 06:20:15.8408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HpaaqB0XTeJFV3UpXVbGVolHiIMjz0kNzOJRUYgxOcZbYDF+lY4Pe0GST56841+7J7A+IXf4+V9bHMveVfdRav+gaFzA4vOqs6hb5G/+kRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8248
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGVlIEpvbmVzLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSBsZWRzOiBwY2E5NTV4OiBDb252ZXJ0IGVudW0tPnBvaW50ZXIgZm9yIGRhdGEg
aW4gdGhlDQo+IG1hdGNoIHRhYmxlcw0KPiANCj4gT24gU3VuLCAyMCBBdWcgMjAyMywgQmlqdSBE
YXMgd3JvdGU6DQo+IA0KPiA+IENvbnZlcnQgZW51bS0+cG9pbnRlciBmb3IgZGF0YSBpbiB0aGUg
bWF0Y2ggdGFibGVzLCBzbyB0aGF0DQo+ID4gZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgY2FuIGRv
IG1hdGNoIGFnYWluc3QgT0YvQUNQSS9JMkMgdGFibGVzLCBvbmNlDQo+ID4gaTJjIGJ1cyB0eXBl
IG1hdGNoIHN1cHBvcnQgYWRkZWQgdG8gaXQuDQo+ID4NCj4gPiBSZXBsYWNlIGVudW0tPnN0cnVj
dCAqcGNhOTU1eF9jaGlwZGVmcyBmb3IgZGF0YSBpbiB0aGUgbWF0Y2ggdGFibGUuDQo+ID4gU2lt
cGxpZnkgdGhlIHByb2JlKCkgYnkgcmVwbGFjaW5nIGRldmljZV9nZXRfbWF0Y2hfZGF0YSgpIGFu
ZCBJRA0KPiA+IGxvb2t1cCBmb3IgcmV0cmlldmluZyBkYXRhIGJ5IGkyY19nZXRfbWF0Y2hfZGF0
YSgpLg0KPiA+DQo+ID4gV2hpbGUgYXQgaXQsIGFkZCBjb25zdCBkZWZpbml0aW9uIHRvIHBjYTk1
NXhfY2hpcGRlZnNbXS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiBOb3RlOg0KPiA+ICBUaGlzIHBhdGNo
IGlzIG9ubHkgY29tcGlsZSB0ZXN0ZWQuDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbGVkcy9sZWRz
LXBjYTk1NXguYyB8IDQ1DQo+ID4gKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0p
DQo+IA0KPiBSZXZpZXdlZC1ieTogTGVlIEpvbmVzIDxsZWVAa2VybmVsLm9yZz4NCj4gDQo+IFBh
dGNoIGRvZXNuJ3QgYXBwbHkuICBQbGVhc2UgcmViYXNlLCBhZGQgdGhlIHRhZyBhYm92ZSBhbmQg
cmVzdWJtaXQuDQoNCk9LIHdpbGwgcmViYXNlIGFuZCByZXNlbmQgd2l0aCBSYiB0YWcuDQoNCkNo
ZWVycywNCkJpanUNCg==
