Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF78944EA17
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 16:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbhKLPew (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 10:34:52 -0500
Received: from mail-tycjpn01on2127.outbound.protection.outlook.com ([40.107.114.127]:41921
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229509AbhKLPev (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 10:34:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKZM2q45iRGZ+yx0hSBC6YPtl1I9XHGs07lon0PRPw131kPhnwN+yVzKSnKX7etcre0+V/6jq8mSH4DDi4G/k/bk5Kt8rBBeT+I/Kmnf9uQICho/lPI0P32xDGF+CzZGcooiLUiN3CJc3+SXmWVhGK9wWjNLvoip12RXSc/Bk8NobMthlhBQZPPnvmnsE4aTM/nsvImjUEKBXghuszzI6HJAx7Ee8Xhw18fwfYwcqE22wDiD9kIhkSuC0uJiYpWSUEYp9XxnkkYUrjDqCIHh5FzOc96pMmmApMswnSN7MY+RmwG1LV0rFp7ZjTRMHHJWD+YGuYUlqxpKc6H7dfREJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shxoCCp/ffKebqI9dYOaOygRIm3gHf2DiKVVRPbdPso=;
 b=K8EemwShh1TUN2P/r9OnUU3/2h9e3pSVlkB/ReYd8QpQfe36WFjSsNh0PV/r4YJmIktN0/Pepf1so393rpPq+vsFFryymMn6D/wddn16Qv6CUWk6Pj7U0TrF1aCb2A+xHbzEhhLFVEqA0FMrkIc7v8xKadp4EWEJFT3gvUmnIKaRaZJPpM/vD1r9dIha8vte+CF8B7VAh8uonXSH8YDdGqiFUBmV/J8nbHUsDRwAJUbeOueIyMzbrLyirmUDGZ3cqgdkVvjFKXvozV9k4OX6snVZf+SP1BxcDC1pCHWmwqZX7P3LtbI4j9h2vb1envtvEYVP5/F+9nwPtRWSQN2wIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shxoCCp/ffKebqI9dYOaOygRIm3gHf2DiKVVRPbdPso=;
 b=YEnwvF4tinapXTXYHg5IXCqFMiN1qJrFZc/5uuFfqSjj/Hps+m9qg9OVYge1o6X/KnB9AOqedzH5ifIBHWUzqc94YLUwfWH2ec4wDps9kRxvcyt7P2djj5LH+U2fUqxgKWEna+bgBvVYc3W8BJ9FkATwk8p510VrfqrOT28oLmI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3299.jpnprd01.prod.outlook.com (2603:1096:604:5b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Fri, 12 Nov
 2021 15:31:57 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4669.021; Fri, 12 Nov 2021
 15:31:57 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/3] drivers: soc: renesas: Enable RENESAS_OSTM
Thread-Topic: [PATCH 1/3] drivers: soc: renesas: Enable RENESAS_OSTM
Thread-Index: AQHX1g7r5193LXhjoUGu4KCvOFlmGKv/+AYAgAAQTdA=
Date:   Fri, 12 Nov 2021 15:31:57 +0000
Message-ID: <OS0PR01MB5922983090C977E32DF049DE86959@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211110084232.652-1-biju.das.jz@bp.renesas.com>
 <20211110084232.652-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXqLXiKobS-w3OyK-uUP2z=1Zq2y=rXiJn7SOfyDRoQFw@mail.gmail.com>
In-Reply-To: <CAMuHMdXqLXiKobS-w3OyK-uUP2z=1Zq2y=rXiJn7SOfyDRoQFw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d07089f-cfa6-422a-abd8-08d9a5f1903a
x-ms-traffictypediagnostic: OSAPR01MB3299:
x-microsoft-antispam-prvs: <OSAPR01MB32993FCBE338BD63F8BF98DC86959@OSAPR01MB3299.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ODQ981hugfWMou2n2nBUwqD7UX4ESC7hB4fgDm0uZ/+RqxVsnusoyBrQCnxOi2W1rXE095GgpzpSFBOTqfSzE4tJhsFTdne1NdeeH4nM46wZ2nWmylrSDE4Ia5MXm/QN8TMerxgdWXDYE0Dqx012GRXCmAA+7UO5xNDYH5Qcf98qhKjUHCjy4bmulzIZ9kGprYy/DaKo6A01OMXZk/Mq5ayrqzEvpCPvYiD3Ykx4zgXSabHulOg2QMrFK7ABK6SDQQF5SEr7WPtdG6T26200j3O/cguODRSV7ZsKj1HfVeB7GFC0AqC6KY6+OYW0OfThGQyxzpZK2Qd3dgSel8/Vv0U4SM/nF70Xqdt8F/x4hF5AFGJgQU+MN793n22QTwUSDzwFVu+hFLhcKCZQ5FQPaUGE2Fx/3KZ+eDNi4lb7x9GSJ1wca3GM21BQhr2H/AicJ9ldxqKtoXMQ4he+5OQoAgOhKbpF4rjaSXcd6H3/xUb72eaIV+/NypbjauvSDcg7eYvl9oFzrw23+lgmPsDqZpsb6j8SCnA0k+FI1fE+WHDBOS4FtiIu5N1MccLClmWlI/YISYNT3SeQhSFOv3sBPFYBOxyYroLNstoKCa1U/Pya+YufuqKepANRT4tib5HpL5MUY7f2Kfb+drGn9TQfT+0gSn+RxIocye58ouOq2cAVxZrcXxqOEfBAqGOTk7GCbTDsRSIiG5UHx/uobcUAlw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(186003)(8676002)(38070700005)(26005)(122000001)(6506007)(38100700002)(53546011)(5660300002)(66946007)(55016002)(4326008)(9686003)(316002)(107886003)(2906002)(8936002)(33656002)(66556008)(66476007)(6916009)(64756008)(66446008)(7696005)(52536014)(71200400001)(76116006)(508600001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWhOa08xSnhtOVVmU2NKY3NnS0t6bUthek9PMkN4MlFNVHJsbldTZnBqTHRh?=
 =?utf-8?B?SDdCeDc3Rm1FRXFuZWRqK3ZnTzR6L1NFTE03Mk5ocy84eW9XQXdTTjc5Yjg1?=
 =?utf-8?B?ZXpXbTYzTUNGcmtjWFJLQllneGk1WDdEVCtvbnN4VGZwcDUvQnhkZ3pRSXAx?=
 =?utf-8?B?a3ZMUlQ4L2xnd0dDVG1RbGtOL3JxSlpaRkczQStROWMzNFN5MjBaZ1hsYjNS?=
 =?utf-8?B?N0UxelY5VzQ2QjgrVi92eDZOc0E2MEgwbmY5cEhaTG8zQVplOHpMOGFJcW5H?=
 =?utf-8?B?KzA4VXNEUjhRSTlnWVF3WVQwZnRpdUxQcG1FcXV5ZzVCaFFJSXVEdDRtS3pL?=
 =?utf-8?B?d1ZTdWxCcmNJbEVJTXFPTUJvL2RGSEZTRzFYRGxTQ2llR1VHUjcxNzFTQUhr?=
 =?utf-8?B?YjFxcHJscG50UmI1LzVsTDE2R1QyUVFwbVVHTFdQSGtla3VhS1djWmpRZmhY?=
 =?utf-8?B?Vld0VXFvdHVqLy9Ic0xuOGlkZzFQT2VoTmJ3Y0gwZlRRS1gvUW5NQ215YVlK?=
 =?utf-8?B?akJ2bjgrQlU1SFBaVG80Y1ZWa1hnRDhXK2ZWSTF3aVRldkErZzdCYlRFbTR1?=
 =?utf-8?B?TjFHbXYrNlJJc0tmSHNqWC9PREFEU2gzWnQ1N2NGbWtMdnUrT3pBRXRXOFA1?=
 =?utf-8?B?N3NZNW5LanVGMk5XMno1bW9vb0UvL0tpYmFzdVhxTTR0ai9jMUlVempEZEJJ?=
 =?utf-8?B?dUE5OHNEc3ZxR04rTTlMWnBBeUlzVmx3M3lFa2VacWZobjZSWWV2dEtiUlE4?=
 =?utf-8?B?bzErREN5OWZiQkpPaytZemFWcjFteWoxN29XMTdtRGh5MzMyVkVtWjBUbTdh?=
 =?utf-8?B?N1QyaGI1NlBzVjFWWnJkZy9oZGt2VmZSYWhnVG4zOUtvbHd1U0Z5QmxoRDlU?=
 =?utf-8?B?MVB2ZVkyYW5XOVJQUk9tL25zSjlhUUF5bTNGZEpNazdkSVZoOXpJbEticTdh?=
 =?utf-8?B?RkJVUEFza0d6WE9Zc3IwUS9HRFJXMkw4eUJMTndPM2hLdVFWMkpTNWlnQmMz?=
 =?utf-8?B?QTlVK1JqR1hQSHoyWStzMWRZVW8rZ2RVOTBlK2E1RnZCZWdxUWZLZXFiK2FL?=
 =?utf-8?B?c20rQU9XMm5lZ0dsMStFUGE3OGRLcE5meDNCeFZWNjZUSys2U2pWR01OY3VF?=
 =?utf-8?B?NEZ3U2Q3bFJrWk5kdUxyYkpjeDBsc2w1UUZhamVZZzE2RTJlbUphQXNvN0xv?=
 =?utf-8?B?MnVTZTdLMjFCZXdGc3RmS2NCcUZodGhnYmNMOVNIZUhtTVFqOXlmQXMvMlA1?=
 =?utf-8?B?R2RIelF3WEMvVy9HY3N3a0hCckJPMVIzQmkvRjBzcGJ4M29sb01sK29GMnRt?=
 =?utf-8?B?bDF5SjZMa01KYXBrTVhYcEN3VmNDOWViNDErMUg4dGFUMzFGNC9SdXFnODAv?=
 =?utf-8?B?SERMK1ZDMW5wQ29RVEVTcFFhR1hURFpaQTFRYWtLUUVKOVZQN2VqRDc2WE1j?=
 =?utf-8?B?M3lBOWdJV0lsWTNobVF1NnFmQ09WcndOVmsrRjlkTmIvblRVem9GVWhEZkpq?=
 =?utf-8?B?ekEycEZLNDhCZXJXQTFlbVRjc0Jnalp5NG5CaURVa2xab0ZrYWZFNnhxNDRQ?=
 =?utf-8?B?cXByeEd4WUdKMU82OS9UZWZXaTNTNUxXanNxQ3B5RmUxKzdXWHVjek01bWhW?=
 =?utf-8?B?bEFzY0oydlhQQjlZUFZQdWp4UEtlK05zbmFGcjhGZXh0YkVXdXY4MEttdGZM?=
 =?utf-8?B?YjR0RzVtS284NFJZRnNXZ2VzeVpBZVNSRU1INm5veEViY3BZV1B6eXJaWmxP?=
 =?utf-8?B?RFIvT1VSRFZuUThiTFBxa3hPSDBBNDcyZ2cxUnlrbXRJQi9GLzBGYWZSS2JX?=
 =?utf-8?B?ajJHNVFBVnNLUW1VQ0NUMG9Zc0FSSHM2aXBpK0NhTmpnNTFXWGNIQ1J2K3l6?=
 =?utf-8?B?NWdkYmkvaVJkVUhQQXg2eXhkMWgvWVl0eHZJU0RsUThHN0JOejcxeXoyZVdh?=
 =?utf-8?B?K0h3VlZudTAyU29WTWh5M1VVR1hNUEpVTEFwR0RxZHZtOWNmY2kzaGxNQUNh?=
 =?utf-8?B?YWNkZnFTK1o1WGQ2clp2ZkxlRjh2SHhiMTZ0K2EyNG1paWhGK3d0Z2l6MVJE?=
 =?utf-8?B?Qlp6ZzdlSHoyS2k0NjRhQTNOcDJkbjhEaWNXMVBDcngySGxaN09NZnJYZ3lu?=
 =?utf-8?B?dktkWk9jeno0T3lkRWpTQlZhMVkvTVpzM3VVb0hLblc0STlvMEVUZnJwUisr?=
 =?utf-8?B?ZEFiNU9ieDJ4bHU2QnYySlQzcEQ3Qmx4L0wwYm5pOFBtZkxudUFjMlN5S0FG?=
 =?utf-8?B?eFRNS3Y4MUlQMHowMWJSVnRJeDJRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d07089f-cfa6-422a-abd8-08d9a5f1903a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2021 15:31:57.1009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZQaGPOp7148YT1fW+R9yTUgTPEraXr7GyykuTdZkoWQUCQAgyYGJEMvuK5ZfL1aSyuap3QBUpRf4af66cjIrAyzSHWz2JbbEwJLBe4qHlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3299
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS8zXSBkcml2ZXJzOiBzb2M6IHJlbmVzYXM6IEVuYWJsZSBSRU5FU0FTX09TVE0NCj4g
DQo+IEhpIEJpanUsDQo+IA0KPiBPbiBXZWQsIE5vdiAxMCwgMjAyMSBhdCA5OjQyIEFNIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gRW5hYmxlIEdl
bmVyYWwgVGltZXIgTW9kdWxlIChhLmsuYSBPU1RNKSBkcml2ZXIgc3VwcG9ydCBmb3IgUmVuZXNh
cw0KPiA+IFJaL0cyTCBiYXNlZCBwbGF0Zm9ybXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExh
ZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4g
DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9zb2MvcmVu
ZXNhcy9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9zb2MvcmVuZXNhcy9LY29uZmlnDQo+ID4g
QEAgLTI4Niw2ICsyODYsNyBAQCBjb25maWcgQVJDSF9SOEE3NzRCMQ0KPiA+DQo+ID4gIGNvbmZp
ZyBBUkNIX1I5QTA3RzA0NA0KPiA+ICAgICAgICAgYm9vbCAiQVJNNjQgUGxhdGZvcm0gc3VwcG9y
dCBmb3IgUlovRzJMIg0KPiA+ICsgICAgICAgc2VsZWN0IFJFTkVTQVNfT1NUTQ0KPiA+ICAgICAg
ICAgaGVscA0KPiA+ICAgICAgICAgICBUaGlzIGVuYWJsZXMgc3VwcG9ydCBmb3IgdGhlIFJlbmVz
YXMgUlovRzJMIFNvQyB2YXJpYW50cy4NCj4gDQo+IEFzIFJaL0cyTCB1c2VzIHRoZSBBUk0gQXJj
aGl0ZWN0ZWQgVGltZXIgYXMgc3lzdGVtIHRpbWVyLCBlbmFibGluZyB0aGUNCj4gT1NUTSBpcyBu
b3QgbWFuZGF0b3J5LiAgUGVyaGFwcyB0aGUgUkVORVNBU19PU1RNIHN5bWJvbCBzaG91bGQgYmUg
bWFkZQ0KPiB2aXNpYmxlIGluc3RlYWQsIHNvIHRoZSB1c2VyIGNhbiBlbmFibGUgaXQgd2hlbiB3
YW50ZWQ/DQoNCkkgd2lsbCBkbyB0aGUgYmVsb3cgY2hhbmdlIHRvIG1ha2UgUkVORVNBU19PU1RN
IHN5bWJvbCB2aXNpYmxlLg0KSXMgaXQgb2s/DQoNCmNvbmZpZyBSRU5FU0FTX09TVE0NCi0gICAg
ICAgYm9vbCAiUmVuZXNhcyBPU1RNIHRpbWVyIGRyaXZlciIgaWYgQ09NUElMRV9URVNUDQorICAg
ICAgIGJvb2wgIlJlbmVzYXMgT1NUTSB0aW1lciBkcml2ZXIiDQorICAgICAgIGRlcGVuZHMgb24g
QVJDSF9SRU5FU0FTIHx8IENPTVBJTEVfVEVTVA0KDQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gR3J7
b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiAN
Cj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlv
bmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
Lg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
