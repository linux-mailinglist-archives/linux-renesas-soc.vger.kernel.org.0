Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0362E57D700
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jul 2022 00:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiGUWiU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 18:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiGUWiT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 18:38:19 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2100.outbound.protection.outlook.com [40.107.114.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05BCC23E;
        Thu, 21 Jul 2022 15:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0IHHs95xUdUOd4C4v6Z+27sJ1+kL6iMxAquf4e/OU40vz7YadtIJDq43+tJNphSXSne2FRbkVll8r679wb/QThCdeNKJq6x40DMMy2nlIAxkpvQTwyJBxU1qhBCuI8+WfZ3604W0UL64cjPOmTdFt/K7cD7N2VEFrol7kdLdW+zmb6HTNCARtiufK9iUtjv0DiqqbLkBSnBdqFZh+D0tyS4NIJdOqzJIc7Y36r6Z3GUZMTtr3cN+DOnllT9wMQ62ld3NzNFK64arLJXYIiLiMcIo2wl6NJqPQfzcfv55mkN9Stw0xVlnq92V0Ro8yYZoEOIiJn9MN/MqnI5Co+z2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1cJGyQYWgkMjYqxAW2IsP6aGvs8sSSFqiEiNuSyJjM=;
 b=ikB0Gr26f09cCblv2yUX4GNPSuCZPi1oi0Ut4P/2W0/lhJM1GGbGJkF+Le13gq5X6amsyQr1TBlG3wfSzBE1M3ng8P72KqCBZBzxeJNGM3gwThQnO3XqaGQ0Wqld6eRk/ZOCtegFtoPXcdrX5BR1a6sBdveLdqEKJX4wBIqdfg+9vCIHPhWcmMfvcLFtsZakikNCrejGsVn6C2M3OlEyU6QcKTggb8WA5jsGBJnUiIuqU/jePuT+aOER3cKKF6HeY0f30T26pFzriwoRB0QtC00GRcFblTpkupsIWfjSf+uWMdKv7/KBdTuvyHeusD3gyhCTc2p1qN9omlVpqxPtwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1cJGyQYWgkMjYqxAW2IsP6aGvs8sSSFqiEiNuSyJjM=;
 b=Qlk4cJO2H1H092GhPOrQvqmSIRt4ydH4wZHHaBaj+RprgF+XcUl5phv0Vpj1yKObfQh7WuYYI9SunqaCXGXeDWs2sXr/Gean4Nc1OgC6S/2gYCFbxejMtY2eHDHNG9pBrdukSchMc7Wu40CBAZsLc479Jfbr7U3zj2snivRmJGc=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSBPR01MB2533.jpnprd01.prod.outlook.com
 (2603:1096:604:1f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 22:38:15 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f%9]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 22:38:13 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Adam Ford <aford173@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: gadget: udc: renesas_usb3: Add support for
 RZ/V2M
Thread-Topic: [PATCH 2/2] usb: gadget: udc: renesas_usb3: Add support for
 RZ/V2M
Thread-Index: AQHYmqyltpFgm8HiQk+Q9huKSROR6q2IwEAAgAAEN4CAAAT1AIAAADWggAAbSQCAAImtwA==
Date:   Thu, 21 Jul 2022 22:38:13 +0000
Message-ID: <TYBPR01MB5341E6A52A358ECCD8DD8522D8919@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220718134458.19137-1-phil.edworthy@renesas.com>
 <20220718134458.19137-3-phil.edworthy@renesas.com>
 <CAMuHMdXuY_HOphyDtw4edZWu_D4QCi2hi-GWLF5R2jPNMHGcpg@mail.gmail.com>
 <TYYPR01MB7086F7C2A25D70EABB9BD338F5919@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <CAMuHMdVaHXfyW27G7ZdRvg-VG1Gw4F2zJ1v8K4JuS1W_u5T4ng@mail.gmail.com>
 <TYBPR01MB5341BB25BFE06E58EA9F4A34D8919@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <TYYPR01MB7086CC951631BAED0F424DA4F5919@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086CC951631BAED0F424DA4F5919@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80f64ace-aa65-4ec8-c9fb-08da6b69b27b
x-ms-traffictypediagnostic: OSBPR01MB2533:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GnGy+vlJMgEUWKPQUkhSykLPmQ1fNyPdFQ0/VUKxEl42JLnWZg2XxaZ84k504NddTenpqcU/RBWjD9DbPKzPIsUuhWcr3mCnh3g1U1B4hIbBYwQaYoJONQKJz8QcxC5MPiLeV8aoW31ymzvc4if3NP4lQuv4+uJc7C7N+uU1/PljMXZ4ub23c3vMF5OXhT+9kYu9quMDEahMJTv03BS+gmH3g33pclDPrXPzFpjEI9+tmNqOrt986IGgIafJviMxeOX3uHopAs/FVAiWYqqwJyL5bd54yoQd0UgjfyM4TMMl62TWCyw5iBHvD8yIhFuR/kUO2Ev2pU5zjhTcRjqlKAaa1sqtaj0b8JzmP0DBPjIDT8vZVNKdmD2vxSKDzzCFhvQWcnMYObfexgWxGKOwxktpZbzYsT8FfYjTONg5z3vRJ2V92wBitTXUOk5LRJuWEOrBMxGh3gpFJsNYTWubdYAXQir8CR/6nat3zNfyU5oxX+61KTKlJxZcOTA5QWcenaffCeEcWw1nJGVFTA4dTYwn0WtBe6oMayLtnBTO7H23XUaM9kE7TMindE3QUSy0o/aroyLpgxNStAuHySFQZMjTe12eMjLa4uTbcABm1Vq97DVI0kd7/a6FDAJ8n2rtUQP2Oaiws9fmCWYvTq/zCfhpvmq7B/3zJrVHH7tDmzEnyuVMgsSzhDUO/WKq8AdZ5ZbUUTNlbEF4LhkJTUu1/FTLfc+1ojhEbPh4dkGdGgQtIBjTwE99grDQsF6gKkdvkOfqhHgwc2Z6Br80SM6XCUTOLFgXSM7Pd+Fcf6u6VZMSk5LPMmhKMJEIxTA0mPhE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(66556008)(8936002)(7696005)(2906002)(316002)(52536014)(71200400001)(41300700001)(478600001)(9686003)(55016003)(53546011)(5660300002)(110136005)(6506007)(54906003)(38070700005)(186003)(38100700002)(66446008)(122000001)(76116006)(64756008)(66946007)(8676002)(66476007)(86362001)(83380400001)(4326008)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTIwa0dMTkhiNC9wSkZsUStQSStjK1E1TldpVnZMZCsrMFVGSVp2bW5yc0l1?=
 =?utf-8?B?T1dudFZiM1pEVWJDUE41NmNFMGVCZE1rOC9uUno1bDVXQTdsaGxxOEN1M29x?=
 =?utf-8?B?VE1ubFZlT2N5Z0I0bDRrdWlCZkkrVE9KbHgxS0swYW9Cb1pldjdReEdpQ1c5?=
 =?utf-8?B?c1RtYTVwZG5JMGczOWlYeGFnczdTWjlxYTRrWWxOak8xZUZZWjh3WEVBRStU?=
 =?utf-8?B?eXJYQUMydEF1VE8vTVo4VU9qSWJudHhPNlRnQUNtVEZRRml4MGFONjNOZzE3?=
 =?utf-8?B?YmpFUkdYZ1hqNHlsRUl3T2pmbGVqWi9VUVVJMkgzL3pzcEVKVklhTE9mY0s3?=
 =?utf-8?B?WGlYd0tyaHBFRFoydHVtaGI4YmZmcy9DRmJ4bFNuNnJPanNyMm9FbSt4d09G?=
 =?utf-8?B?QnlodFhkZGJQUS9CbkpJc3BwbXRlZ1FmSDZZeDUyalRwbmJQMG50VjJQNnBP?=
 =?utf-8?B?d2FBS2wwMTF0d1FCdUZrMk1YcjJDNElxNVRZQnozZDlqMEZHR1VKbXA4REJz?=
 =?utf-8?B?a1dGYmtJWUJ0MmFUWlc5OGloaGF6S2RBeVMxS0NwUy9HeFhMZHRwN0VDR3hB?=
 =?utf-8?B?aDE5VU0wU1FBbkxJaG1VZ1k0aHN2Tno2QU5WbWdnb2E0ek1HNDFFc2g4Rlpp?=
 =?utf-8?B?VU94ZE9sY3ZKYkpOV1dCbmNVZTVQTk5OTk0reE1pcFJWamVuRDJoZGFieVRB?=
 =?utf-8?B?RnpZSmFnRTlVQVZJN3I2OU5lUysybWF0QW0xYlA2Yjk3N01ibEoxTE0ra2Jh?=
 =?utf-8?B?UTZoQmRjaGxJN2pPcTYvNzNwVEZ6SnA4RGprMnpIdFdhZWlya2dVa0t4aGlT?=
 =?utf-8?B?RnZONjdHNVlmalY4em1LeUFwbVdEaUJxWDNZSVVJdUNHYVRoWFpEK1pZM1ZT?=
 =?utf-8?B?dzZZUlM5OWtjWitLeWQvTmwzV1F6WjZMQzQ2czdYY2VjTU12SGZJeGpiSGVu?=
 =?utf-8?B?UjFvendiOXgzYWMwUUh2SVMvcVZRL2tCV1JBUElmMjVDMVkwVmcvTDNhVnRn?=
 =?utf-8?B?c3pxVFdNN0d1WDhLNTgxSEIrVis5WWpjZVRQeUZPVXVaVUZWK1UyVjk5VnNi?=
 =?utf-8?B?eElpeHBOcGFZTTI3ZUhnN1FzNEtnTGltckU0a28wZlRWcDQ0ek9YRWxlZXdE?=
 =?utf-8?B?bzJ2djQ1TE5PUzhkZmdodDZLZjYwaWZOMWwvSHFSVlNHbWJxSlpqK1JNNUhO?=
 =?utf-8?B?cldyMUNjbXExclRDKzlzaUExdlNtQWREQ2lLOE1CNTBMYS9wSlNxODU2RUYz?=
 =?utf-8?B?TmwvdjRMOGZvU2I4bXNqb01GYzdIUmhpMXNqeGdiQzJzNkROOTZjeDM1aUxR?=
 =?utf-8?B?eHFuRFlPem9hZk1peUdDUXB3VHlUdm5FWlpUNUdxQVUweENaRVZlU1luSVBI?=
 =?utf-8?B?b2hyODc3ZmNGbldQRFo0Y1d2djNLcDBvOUlUaHJuMlF1bzZ1S2xqRlQ0K1Mw?=
 =?utf-8?B?emJqS3h2MGI0WGZOZ2hYTVUwK3IxZlppRENoM3d0Z1NGTDZMZEFOMDkwRUZU?=
 =?utf-8?B?M2x0VC9tam5QcUQvS0FXVWlGQWlsREFadi81d1hOME01dkhualpZaU5SbjNo?=
 =?utf-8?B?QW5NZit2Q1E1SnlwWUFWRGI0Z0JNaElCZkUrZk0yK0hJOTc0UzFOMlVXTlBH?=
 =?utf-8?B?TExUdnd2R05PVXZrb081YVllZjhZeGYvWlYweW5uYzhXcWM4ekpYSTNpVHVz?=
 =?utf-8?B?aXNvZ1VOaWRhRC9qWjlaWUhXTXdzeGN0TDRQMk03U3FJdUJRc2xQT2ZIWFJM?=
 =?utf-8?B?dXVFVmt1LzNEZVA4L1hQbHJhaGE5UThlcnczNHZZRThld3djL2FmQ2h6MFdt?=
 =?utf-8?B?ZUIwQ21SRE9uTExTYmE4NnNKcThxT2NKRi8yWjlxa3N0cTNxS0E5VmN1aVhY?=
 =?utf-8?B?dVZVK01tZzNXZ0cyVkdBa3FqcTJQV0J1NVRVWE9jaFNYcTg3WEdXb1NZTTRE?=
 =?utf-8?B?U0pPRmpEUTJEdytKYW9oejlueWtFd1pJY1loNklqMnVPaEtUTEJXRndCSjIr?=
 =?utf-8?B?N2xETmJ6MEhlWnFVWWxXQ29xbjFUdWRKU0sya0h4Y1hBRkNEdk5teFczZ2RN?=
 =?utf-8?B?aXk3SUt3aEtHT29QNEFSbC9KTkkyM2l1MFFvOU9TU3ZPSW1lZE9ndHJ5ZFlF?=
 =?utf-8?B?RmhnaWpMOHNYL2N6L1JoTjhpS0dGd09HN2l6czhoWndXQUJlbU5ROEZhU0dV?=
 =?utf-8?B?SGlyY3JDcHpJMXV2dTZSb25OSXdJVkdGRlpFaTY2bnM0WDlZM2VURENpQnVX?=
 =?utf-8?B?UzI1cjYvc0pDL3ptVkVSZGN5M1hBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f64ace-aa65-4ec8-c9fb-08da6b69b27b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 22:38:13.6385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KkfD8y7T/boker1GUOlg8Wa3Ca8uzludHHc4lWJkFFjmsRuFfCPHSPvW3eLIQswgP73pykQwwZlFdG5+ZHrk50VqSrSzMzSL1yTM54qBv5EXXplRQdmjESeye7wxt6I2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2533
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUGhpbC1zYW4sDQoNCj4gRnJvbTogUGhpbCBFZHdvcnRoeSwgU2VudDogVGh1cnNkYXksIEp1
bHkgMjEsIDIwMjIgMTE6MjEgUE0NCj4gDQo+IEhpIFlvc2hpaGlybywNCj4gDQo+IE9uIDIxIEp1
bHkgMjAyMiAxMzo1MSBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0
IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNkYXksIEp1bHkgMjEsIDIwMjIgOTo0MyBQTQ0KPiA+
ID4gT24gVGh1LCBKdWwgMjEsIDIwMjIgYXQgMjoyNSBQTSBQaGlsIEVkd29ydGh5IHdyb3RlOg0K
PiA+ID4gPiBPbiAyMSBKdWx5IDIwMjIgMTM6MTAgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0K
PiA+ID4gPiA+IE9uIE1vbiwgSnVsIDE4LCAyMDIyIGF0IDM6NDUgUE0gUGhpbCBFZHdvcnRoeSB3
cm90ZToNCj4gPiA+ID4gPiA+IFJaL1YyTSAocjlhMDlnMDExKSBoYXMgYSBmZXcgZGlmZmVyZW5j
ZXM6DQo+ID4gPiA+ID4gPiAgLSBUaGUgVVNCM19EUkRfQ09OIHJlZ2lzdGVyIGhhcyBtb3ZlZCwg
aXRzIGNhbGxlZA0KPiA+IFVTQl9QRVJJX0RSRF9DT04gaW4NCj4gPiA+ID4gPiA+ICAgIHRoZSBS
Wi9WMk0gaGFyZHdhcmUgbWFudWFsLg0KPiA+ID4gPiA+ID4gICAgSXQgaGFzIGFkZGl0aW9uYWwg
Yml0cyBmb3IgaG9zdCBhbmQgcGVyaXBoZXJhbCByZXNldCB0aGF0IG5lZWQNCj4gPiB0bw0KPiA+
ID4gPiA+ID4gICAgY2xlYXJlZCB0byB1c2UgdXNiIGhvc3QgYW5kIHBlcmlwaGVyYWwgcmVzcGVj
dGl2ZWx5Lg0KPiA+ID4gPiA+ID4gIC0gVGhlIFVTQjNfT1RHX1NUQSwgVVNCM19PVEdfSU5UX1NU
QSBhbmQgVVNCM19PVEdfSU5UX0VOQQ0KPiA+IHJlZ2lzdGVycw0KPiA+ID4gPiA+ID4gICAgaGF2
ZSBiZWVuIG1vdmVkIGFuZCByZW5hbWVkIHRvIFVTQl9QRVJJX0RSRF9TVEEsDQo+ID4gVVNCX1BF
UklfRFJEX0lOVF9TVEENCj4gPiA+ID4gPiA+ICAgIGFuZCBVU0JfUEVSSV9EUkRfSU5UX0UuDQo+
ID4gPiA+ID4gPiAgLSBUaGUgSURNT04gYml0IHVzZWQgaW4gdGhlIGFib3ZlIHJlZ3MgZm9yIHJv
bGUgZGV0ZWN0aW9uIGhhdmUNCj4gPiBtb3ZlZA0KPiA+ID4gPiA+ID4gICAgZnJvbSBiaXQgNCB0
byBiaXQgMC4NCj4gPiA+ID4gPiA+ICAtIFJaL1YyTSBoYXMgYW4gc2VwYXJhdGUgaW50ZXJydXB0
IGZvciBEUkQsIGkuZS4gZm9yIGNoYW5nZXMgdG8NCj4gPiBJRE1PTi4NCj4gPiA+ID4gPiA+ICAt
IFRoZXJlIGFyZSByZXNldCBsaW5lcyBmb3IgRFJEIGFuZCBVU0JQDQo+ID4gPiA+ID4gPiAgLSBU
aGVyZSBpcyBhbm90aGVyIGNsb2NrLCBtYW5hZ2VkIGJ5IHJ1bnRpbWUgUE0uDQo+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUGhpbCBFZHdvcnRoeSA8cGhpbC5lZHdvcnRo
eUByZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdl
dC91ZGMvcmVuZXNhc191c2IzLmMNCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdl
dC91ZGMvcmVuZXNhc191c2IzLmMNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQEAgLTM2Myw2ICsz
NjgsNyBAQCBzdHJ1Y3QgcmVuZXNhc191c2IzIHsNCj4gPiA+ID4gPiA+ICAgICAgICAgYm9vbCBm
b3JjZWRfYl9kZXZpY2U7DQo+ID4gPiA+ID4gPiAgICAgICAgIGJvb2wgc3RhcnRfdG9fY29ubmVj
dDsNCj4gPiA+ID4gPiA+ICAgICAgICAgYm9vbCByb2xlX3N3X2J5X2Nvbm5lY3RvcjsNCj4gPiA+
ID4gPiA+ICsgICAgICAgYm9vbCByOWEwOWcwMTE7DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBBbnkg
YmV0dGVyIG5hbWUgZm9yIHRoaXMgZmVhdHVyZSBmbGFnPw0KPiA+ID4gPiBOb3RoaW5nIHNwcmlu
Z3MgdG8gbWluZC4gV2UgY291bGQgdXNlIHNlcGFyYXRlIGZsYWdzIGZvciBoYXNfcmVzZXRzLA0K
PiA+ID4gPiBoYXNfZHJkX2lycSwgbWF4X25yX3BpcGVzIGJ1dCBJIGFtIHN0cnVnZ2xpbmcgdG8g
Y29tZSB1cCB3aXRoIG5hbWVzDQo+ID4gPiA+IGZvciB0aGUgb2Zmc2V0IHJlZ2lzdGVycyBhbmQg
bW92ZWQgYml0cy4gQW55IHN1Z2dlc3Rpb25zPw0KPiA+ID4NCj4gPiA+IE9LLCBzbyAiaXNfcnp2
Mm0iPw0KPiA+DQo+ID4gVGhlIGZsYWcgbmFtZSBsb29rcyBnb29kIHRvIG1lLiBIb3dldmVyLCBJ
IGRvbid0IGxpa2UgdGhlIGZvbGxvd2luZyB1c2FnZQ0KPiA+IGluIG1hY3Jvcy4NCj4gPiAtLS0N
Cj4gPiAtI2RlZmluZSBVU0IzX0RSRF9DT04JCTB4MjE4DQo+ID4gKyNkZWZpbmUgVVNCM19EUkRf
Q09OCQkodXNiMy0+cjlhMDlnMDExID8gMHg0MDAgOiAweDIxOCkNCj4gPiAuLi4NCj4gPiAtI2Rl
ZmluZSBVU0JfT1RHX0lETU9OCQlCSVQoNCkNCj4gPiArI2RlZmluZSBVU0JfT1RHX0lETU9OCQko
dXNiMy0+cjlhMDlnMDExID8gQklUKDApIDogQklUKDQpKQ0KPiA+IC0tLS0NCj4gPg0KPiA+IEFi
b3V0IHJlZ2lzdGVycycgb2Zmc2V0L2JpdCwgSSB0aGluayBoYXZpbmcgc3BlY2lmaWMgbWVtYmVy
cyBpbnRvDQo+ID4gYSBuZXcgc3RydWN0IGlzIGJldHRlciBsaWtlIGJlbG93LiBCdXQsIHdoYXQg
ZG8geW91IHRoaW5rPw0KPiA+DQo+ID4gc3RydWN0IHJlbmVzYXNfdXNiM19yZWcgew0KPiA+IAl1
MTYgZHJkX2Nvbl9vZmZzZXQ7DQo+ID4gCS4uLg0KPiA+IAl1MzIgb3RnX2lkbW9uX2JpdDsNCj4g
PiAJLi4uDQo+ID4gfTsNCj4gPg0KPiA+IHN0cnVjdCByZW5lc2FzX3VzYjMgew0KPiA+IAkuLi4N
Cj4gPiAJc3RydWN0IHJlbmVzYXNfdXNiM19yZWcgcmVnczsNCj4gPiAJLi4uDQo+ID4gfTsNCj4g
DQo+IEkgdGhpbmsgdGhhdCBtaWdodCBiZSBhIGJpdCBvdmVybHkgY29tcGxleCBmb3IgdGhlIHBy
b2JsZW0uDQo+IEhvdyBhYm91dDoNCj4gI2RlZmluZSBVU0IzX0RSRF9DT04ocCkJKChwKS0+aXNf
cnp2Mm0gPyAweDQwMCA6IDB4MjE4KQ0KDQpUaGFuayB5b3UgZm9yIHlvdXIgc3VnZ2VzdGlvbi4g
SXQgbG9va3MgZ29vZCB0byBtZS4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGEN
Cg0K
