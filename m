Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A3F750B43A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 11:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446107AbiDVJk5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 05:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238862AbiDVJk4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 05:40:56 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2101.outbound.protection.outlook.com [40.107.113.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D8C33882
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Apr 2022 02:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bb7cDFbWB/+5Mfr+QShMePflNulWDARghRaz++HXu8wd5C8VqW3so5/KnySKnkODpMV5yCDp3iXv9NH5BkX2oDUZUpkDoZpJocw9wCwP90Dmc0xBzW5rhccCtXfwQIbQzK0CfKVe9M9SdF2bMVCY4oQAxysSdWSXAFYRso+jefofDXeHbK8N4Cs0DyJbvcqilFVNQMdGuywJslPlK8n0G/UkM8GBCBcblEelXm8DLtiS5+YK8Mg3ydrseP3cE2RhlHXy+kkv7gko46WibuAKrHhsVKbfnGYtWMHCUp+JQyL6gAWA6AKrjs4UNrtb2urdLC7AH1Q9PYwGkyZoX38KFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVvACaySGC5c/tXQew1ZWwOvZiWQ9UnZP4Yn6qnOLoA=;
 b=G13E0gyFBWhsK9TRCE0UJGYO+9+0lH3nvZ1A3DIiWxm7H7wWl3W1pgbVEgAYLunYr/ZnKt6fWCaeaDpQl5Qd8nut2gPgrEzKHZBh48L5X+t5EQVPGD8uwNpy1WAgY1I1eqlLZHOCKXyqNxHSlub6qAD5UulQ6TtlVyVDoUbcq20C6xBYAvN2OBeZ2AHYxK+8F2IeefmqvQpSvs35YMXunRfJ5rQlLkur27T4cQK8sVcDc0tDpz8GdHAZ6SgVwL9TWdBZy79W7hxoSeOn8aD6m8EFl6B9oc933uqVmk3UYtzhZAxvXLWtVdOAPWDdT701xu8uNpfksCt1kw/Rv/KI9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVvACaySGC5c/tXQew1ZWwOvZiWQ9UnZP4Yn6qnOLoA=;
 b=J7gYoEkyBZJarl4I8DWhfS0f47izXMryHUyeQO4trXswHx+fRZAxc3u9AKN7zbrLHsKvQCsZy8y0/XoOd53MHxSxHIDQB1Wi7BQX4Cn6VyVZ9Yl6cAWppxyxcCUDY3WOoNMjQNRr4fRMd9+im+gaPpVXxBoC3z4BiRX/n1dhlQo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY1PR01MB1802.jpnprd01.prod.outlook.com (2603:1096:403:8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 09:38:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 09:38:00 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 2/4] drm: rcar-du: Fix typo
Thread-Topic: [PATCH v3 2/4] drm: rcar-du: Fix typo
Thread-Index: AQHYVZ1KwGddPqPEj0WtGe3WF9brO6z7n8IAgAANTUA=
Date:   Fri, 22 Apr 2022 09:38:00 +0000
Message-ID: <OS0PR01MB59222BB60DE4DFEA83A851C186F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdV_eNxM4yHgkUFPz58KyiGFtjjBeePtuAg8pZYfsS5t9g@mail.gmail.com>
In-Reply-To: <CAMuHMdV_eNxM4yHgkUFPz58KyiGFtjjBeePtuAg8pZYfsS5t9g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0997aa2-728f-44f8-67d9-08da2443ca7e
x-ms-traffictypediagnostic: TY1PR01MB1802:EE_
x-microsoft-antispam-prvs: <TY1PR01MB18024D724618A795A9F121DC86F79@TY1PR01MB1802.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NwDuMX7Tzp6EV8VfYXejD/8CztZ+HPcbgIQg2/4ALUSgpSEOJISufwYqdXb6OofIsPzN666Cr9ZZg9zVci8IUyRqJuM6isStjqv1sGaDaTXJwHFSFLUS3hIi209lrNQNYRf7Ecd+VumNHGWzmJcBdTUdgYtUnlJH6wJIGTu55Z4VECXwD1eu3vUYzL5uVPkrc8lgwQP1mdG4OackAUNYiMFH4DaaVb31OHU8sjqOFCSkvZgD9Rwq77ZTq5sZVXOLGu1pmTZj/ViHmpqgSGOAB0LgLNGPqwuQDcjVGXlTvWBs7uireOxgec620cedQRJw6gapfXBSRH9Hdhc3j+RFcJU1WqH0a593TnE/ADzxDeZyRyz/xMiXKrtxs22tWPuwjkc9+Qve+xLe/db57SxMbeL0DvcsOOTiwdgKsV99+MsmBU9eZP6ZQsA4x0UvXKNHl5D6lcpURvycXcukeu6ehZFTTUdZ4yfCUpIf6FdsEL33RO1umdHaX20WeWD/L7wlx1PU3HppSPHUenaC+b7OVGF+oslO0upBhdK3Cwhc0UyKJm7uzWPuedOWr8lBj0wpSsw3QM2YHz9e3iSZNK0M3egDYogIqO0yKbztMDujnSTBTLDvQRFqzCupQX4iwwm6et9RhGzxWlspAgR1mstw3HHg5Kvqx/ykCA+JmpmRQiPKw/XFn0u3sY2Jqu528b61Yr4vP72LtSFjRw8DsHaUaw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(2906002)(6506007)(53546011)(4744005)(66446008)(122000001)(38070700005)(38100700002)(76116006)(86362001)(66946007)(508600001)(64756008)(8676002)(4326008)(66556008)(186003)(7696005)(5660300002)(55016003)(66476007)(107886003)(26005)(9686003)(52536014)(8936002)(71200400001)(54906003)(33656002)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnYrd1VidFFoQmtLZzVLbXRSK0hBU3pndVlrT1o2RGpDczBTRENzd1liVUpt?=
 =?utf-8?B?RGFRTGMxSjRTdzlqREpva1I1U3d1MjlDUm91cytPZGRKT2V5QVhjMFQySEgr?=
 =?utf-8?B?ZjVYK2FycXRhYnFKZ2FQU2pDSWhmU3R5cW9lUzYxU1NKZ1hqMFU4UDlpclR4?=
 =?utf-8?B?bEp4ZGJBUHB3TTNGZWxzaXVZeTNYaTdHeEJRVkF3ZEpydEJYVlVHS0RBazJT?=
 =?utf-8?B?d3dvTnBUeXhWZnR2dlBQYVRvelhKWE5jeEU2MHZJVUFLM2U3VS9CSDhIMjhJ?=
 =?utf-8?B?NnMyRHJmdmExTWRwaVZjWDYvaVRibDRyVVUzMTJWNktGYUNWRjNEdGV3Qk41?=
 =?utf-8?B?M1pGUTQ5ODB6Z2NhYUZHZTJhdjZXUVNWSzgvcnVCZUsvcEFqM3JINkhyNjZP?=
 =?utf-8?B?emdOa2wzQXpyaGkwVFFjN0pvcVpCeFFNd0RxTlFwbWdSUnZyWjErSWxOTXo3?=
 =?utf-8?B?OWZUcjFYRC9TcFB2UXhCcFg3ME5yQVp2TFluM0NkdE15WkEydXprSjNrUDlV?=
 =?utf-8?B?K1AzU2hkdlcycnhJRVlnSVp2bUYrUTE5RnA5V2NodUlybXZjdmhGbEFmYUhn?=
 =?utf-8?B?T25kSWg5ZXI1L3NZRUFSQ1dkYW1ZZ0ZYSDNWekhLTmxsTjN3VFh2NDRyalpW?=
 =?utf-8?B?SzR1MGM3RnlvMDZZdmR1RE1hdkR1Y1YwcVJSVnQ2UkhMOG93dkM3RDI5Q3FB?=
 =?utf-8?B?Tyt1S0xkNFRWazhLaTlxdHV5Sk5jbUZ3NUJVdktaWVJOTm9ZSDVQai9WYnI0?=
 =?utf-8?B?VWN2YWpsWDJ0UVdsTmVEWVljbVVadHBGZHQ0NFlqMFFGNUxyVDFKNW11dE9H?=
 =?utf-8?B?ZnhBcnRNRXczbWRKamdEdFhzNXFVSnkyeEVNazRrSGI2dFEyeEttRWVKM1BZ?=
 =?utf-8?B?NU5VK3k1dFJ4dGVOOS9sOEVzTlAycmtpMjVCdjd6bzRzWG42U092QUlrbHJO?=
 =?utf-8?B?eGU3bnFCc0RKaDVqTlVRZ0pXRFRLNHlGRTNDTUszQmRNUmlpWkFuS29jYXBz?=
 =?utf-8?B?VWhSTnpmbytxTWxhRmVTazVmVnozSTB4bkJCZHhXYWI5aGlJZUNaU1FSNS81?=
 =?utf-8?B?SHczekdNMVY0SDFoeE9QRDUyYzVEcXdldUFmVDhaRXdNTStCWGFZRzJjaVJR?=
 =?utf-8?B?b0E0dUdiTUJKY3VkaElTemlYQ2d3dTRwdFdscWhVSlJDb1dPSFRBb25hYzhL?=
 =?utf-8?B?SURFY3VNMDA4VmZEbkpCa2ZwWjFTeUVUazd1WG9vaTQwT1hrV3kzZjR6bWFs?=
 =?utf-8?B?ck5HUlp2bGFLYlZwdFBJelNyU0hkcm1uNnF3TC9pSzFCcy9hYXFrRXJMUm1h?=
 =?utf-8?B?OVNBUGdwSXhBdTJKc0I1ODNISVR6UUFtZ2xGWG1rNUx0U0c2cU5KSDMvNHNr?=
 =?utf-8?B?UDB4dG9GcE54aVlFMEJJanZlMlNjOSt0aU5Ec3Jndy9yM2VudnB6UlFqdVYz?=
 =?utf-8?B?OWcxZHBQcUNpSGFaYzZOUTdJNW8zcFFBa3NITjZ1WC9rMXBQYjB1NDM5WWpG?=
 =?utf-8?B?ZXBkY1IvUFBoQyt6V3dMYlF3RWk0UGFPOHdrR0hOS05VR1ZzQ1ZiSlRnZU5R?=
 =?utf-8?B?MnhvRDJEVlBFUENpZ1EyMlk4U0dtb0dkTGhudzdmdVVObGZRaEtpWUZyVTVp?=
 =?utf-8?B?Q3dzOHRMNGlmMktMNEpFTElSNGxjSG5qSFJ2UHgrUm1EZHhwOVFFYWlleTNU?=
 =?utf-8?B?K3E4bm5NdlVwVnp6U0w0Z0lybHJvYkYzMDQ1bFFTa1pFNFZOUS9HL0gwVHp5?=
 =?utf-8?B?eWNLSWlNUE9vbUxWblFBWE1LaFJCMjlocG11RGV3U0V3RjRYSVByMU9tZWwz?=
 =?utf-8?B?VjRDbTV2ZlFIb0syNk9pSlNwYlRzZGUwc0lGVEs4VVVZdlNHdUdnQ0t4NTdV?=
 =?utf-8?B?K1lIamM5RW1jTUZVcStTVmEzTlJiNmNaaHI4a1JTbXZJQVZmQUI2b2FvQWNm?=
 =?utf-8?B?ZTNIVWg2bDg2Z2JEMm9kYU1qeE8wUnh4Mnk0RXB6VFVDZVdqWmpjL1p0bGV6?=
 =?utf-8?B?bGxmR1U5RzVUN1IxaFJKUUR0Ti9GR0FEMjFPcWRxcXVnSE9lT3g2VDV3QzRG?=
 =?utf-8?B?aHpTZENkRzdLNVhDUm5GYllIeUlZQmRqLytHQzlpYSsvU3RKMnpZaXZXbkpX?=
 =?utf-8?B?Z1UzaW1ZNmd6WjBGSTMrZXNkamg2UVRxcGM1T1N4SDAxODUvWGlvM1VVNlBE?=
 =?utf-8?B?UzNuQ3ZHMTd4bVNqT3BCeE5aZk5aamRCSXRaOVIxTkMvV3NEQmtHSExhWStJ?=
 =?utf-8?B?T1JjeEFUbDV2Mk5xaytTUDRnWVc5UGpGdkdHY0dvSS9xYlp3RmJvbURGSHhm?=
 =?utf-8?B?bXpHOHZKalV2akdTYVJPVExEM1FkbVU5TDBpWndPOFRVaVY2aDEvUXg5R0tG?=
 =?utf-8?Q?9B6HRQe+9uHQ+p3w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0997aa2-728f-44f8-67d9-08da2443ca7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 09:38:00.4880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GhQ9DefH34HkJMjJoMC1Pq/Y7NreImsuo5iwPPGdsTJLa8ipoQZZT4xm+SxGQCwhbdVXENsKFLz9+UZ5UXPHhkVFxDtoMHF0xIsOtNXECYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1802
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMi80XSBkcm06IHJjYXItZHU6IEZpeCB0eXBvDQo+IA0KPiBIaSBCaWp1LA0KPiAN
Cj4gT24gVGh1LCBBcHIgMjEsIDIwMjIgYXQgNjozMSBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEZpeCB0eXBvIHJjYXJfZHVfdnNwLmgtPnJj
YXJfZHVfdnNwLmMNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV92c3AuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfdnNwLmMNCj4gPiBAQCAtMSw2ICsxLDYgQEAN
Cj4gPiAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArDQo+ID4gIC8qDQo+ID4g
LSAqIHJjYXJfZHVfdnNwLmggIC0tICBSLUNhciBEaXNwbGF5IFVuaXQgVlNQLUJhc2VkIENvbXBv
c2l0b3INCj4gPiArICogcmNhcl9kdV92c3AuYyAgLS0gIFItQ2FyIERpc3BsYXkgVW5pdCBWU1At
QmFzZWQgQ29tcG9zaXRvcg0KPiANCj4gUGVyaGFwcyBkcm9wIHRoZSBmaWxlIG5hbWUgY29tcGxl
dGVseSBpbnN0ZWFkPw0KDQpDdXJyZW50bHkgYWxsIHRoZSBSLUNhciBEVSBmaWxlcyBoYXZlIGZp
bGUgbmFtZS4gTWF5IGJlDQpBIHNpbmdsZSBwYXRjaCB0byByZW1vdmUgYWxsIG9mZiB0aGVtIGlm
IHdlIGFyZSBwbGFubmluZyB0byBkby4NCg0KTGF1cmVudCwgcGxlYXNlIHNoYXJlIHlvdXIgdGhv
dWdodHMgb24gdGhpcy4NCg0KQ2hlZXJzLA0KQmlqdQ0K
