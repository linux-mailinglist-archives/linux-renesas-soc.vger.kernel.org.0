Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E508D7828C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 14:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234703AbjHUMQK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 08:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234482AbjHUMQK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 08:16:10 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2125.outbound.protection.outlook.com [40.107.113.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 251F3FB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 05:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC8Co68UxyZxh87V9PgZFMJw4N8nxwwr5IoMUAZsV0cMc0/R8e4xP2cERKORRRQO4jHZ32P8kmLKWriIPdI2b7Vol7Pf2gAankhX3vyNOL/dQPhpncNFxmiC2NVwRhjCpCaBQsLXrCHyr/fWL4iQjaqhsoZtjfJ6CQur9wC344GWnXTFznABsXsoY0MQ7n/4VbJ4JRXzmwXgEQcewkxts0emhHYIFb/iSuNaIW+6Zg+A+PkJf2uinoN1bZlDmy2mji9xP3Jk8AeqxzSULGpoCw9dDBVNbqFDBAqi/SVr+pasMY9SNXFSIV39VkeiWVVk27P6vFJFtcaoXNJPnpFs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDLebwW4CAgM8CJ45oFrDdfIgrnxQHX/ixCnEDFJC+8=;
 b=FNeRCrickvdrdYs0Y8UcYqvYJbZWVLX3GnvtQL8cew4lM8Vns0dDe+soi/pF+U/gNe+kf7kUDbzdJFKbRiBz3ZS8NWfKSX/AXdW43QmPY5NHR+U5dWW4wIAMuqBVhzxJxl5rPx16qccQM9AUizWbpx+CMLsE/2j/GcRW+VDlsyJ8lI6TNndCi91I4IDbC+cz1YK2hxLWGRM8T8QhjoRur7+Iiic1t/AoAIOYPT6JHunmrNbfvM0zl920DsRE7VobbD34jKMRalcIompNpvQMmFFyMbfnPEOeT8JXlepZzYvSZCE1mtsLhbingXHdWffrRm3dM2bf6HIFRb6A1Kjbzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDLebwW4CAgM8CJ45oFrDdfIgrnxQHX/ixCnEDFJC+8=;
 b=NNNYbhGgJ8nN9OFp1VtFuoEuOAkkY1IlSIdmCW+6B34oevUShtY95LwU5jiZ9M6Hwr1vkfR51w16Q5dqvC7uiP5YFsik9zg8KVl9P7Bx2w5PO48xKjx0WMDSC0XAZGgy7467pnLSxQkjHcyvcBcowMTdRoZwh9KM37kpsm/au9Q=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB8024.jpnprd01.prod.outlook.com (2603:1096:400:fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 12:15:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%7]) with mapi id 15.20.6699.025; Mon, 21 Aug 2023
 12:15:57 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Lee Jones <lee@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mfd: mc13xxx: Simplify probe()
Thread-Topic: [PATCH] mfd: mc13xxx: Simplify probe()
Thread-Index: AQHZ0stxt3OCNoiiqkSTqYDbzaHv76/0qn0AgAACIFA=
Date:   Mon, 21 Aug 2023 12:15:57 +0000
Message-ID: <OS0PR01MB5922956C8F2D0375BEC46321861EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230819183155.22335-1-biju.das.jz@bp.renesas.com>
 <20230821120722.GG1380343@google.com>
In-Reply-To: <20230821120722.GG1380343@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYYPR01MB8024:EE_
x-ms-office365-filtering-correlation-id: 76019ac4-79f0-47d5-d804-08dba2405fe9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3shWOylpzoG1TqoTGBDhZ87hD4q5VswSekGv+RhQDDJO3kL39T87c3T7fBQrUDQvnFRnBfvVvRzFv3G1USP0owszE/oBjnZtBsCjkw2oVdcQdBl1DDF2xHLY6KqATZxYUdJoeguLXm9uGQq0R6NQxSTOOp8e9WtKbK3Cq8cD41qGWJmOdtuSeKmiJYxiPmsICz6zcqeco86KiY3hkcqgMWgTGnhorWuC8dVhH7GoEYxGK0P9v+WGq6Dz010kLHrZCMiROqx64N1qcQ7byFfWW4+SN18ZcUkLKy23hJqlX52zMtUvPovPYm9MOC2/BUlFbBoDM8HV/1MrN0eObHoUhIEWEd61+O0teZgn2VcXN1CrEpfhncqTMpacHzHzMoxVTtR+RDhfyrlKE2GZ2VpeN8ihKunfuzBRDMh+HhNDdd+h8KRrZDA1w9a+jnxeM3zsG3+3Wu2lDrncZ//QpK7Gs6if7xAcKA8veIH8wtObmP+z0/00TEzlJBQjWDCWasS64MuTEKzOn1jAswKhqs9cG2ivXA6VE81knKXRXZ75tini4fPbWxXMxYBra9giLFd+lrpk2bCf9NWWya3tTuCp1/pNH2uXAQUC1g2jiBw1UZxEw5bE3zncAgzka5egiOep5cY+tv62HpTrSWYCOFXFMtfQXfIL8xedxbDFB1A5bFU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39860400002)(366004)(396003)(1800799009)(186009)(451199024)(71200400001)(7696005)(6506007)(38100700002)(122000001)(9686003)(38070700005)(55016003)(83380400001)(26005)(33656002)(41300700001)(66556008)(6916009)(316002)(2906002)(66946007)(54906003)(66446008)(4744005)(66476007)(76116006)(86362001)(5660300002)(64756008)(52536014)(8676002)(478600001)(4326008)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amlVOVVyRjVaY3h6NlBraWZmVjUwS3hVSGF2c1U4K0I4NnFmNHBNRFMxM1E2?=
 =?utf-8?B?bVBNVEtBY0MrK0dJTjdSTFdyNXcyYnR0WFc1ekNpdmdYRnhwa2doVkdSOUpB?=
 =?utf-8?B?RTAyTUhaOVExUkJaMW8wc1BpRzdRTzVTeU5kczhsc2VNNVVPODc0cmpvclpP?=
 =?utf-8?B?b3pUbFNqakg2UXhLK244aG00eUJGR0g4WnkvMnZUR1FYMXB4RGg1VGtHRDNi?=
 =?utf-8?B?QWpzRlRDT2VKT0o1bFB2UkM0UHNQaEV4MFZrNUdtS1lDZVR6c1h6b256ZFhq?=
 =?utf-8?B?LzBWZHlxQ1QyRmpIU2xwRkJNSXBFMHo1SU9GSHc0b3JoRWZtNGZsUnh6TVN3?=
 =?utf-8?B?cnRYRzM1cVJGU0tzZDFET3Z2WGRlUlRJZ3ZNUlMwWHNVTllyV0ZsVW4wdk0v?=
 =?utf-8?B?NFZQa09vVWdRcDhTSnFVbTRjeXhvTVkwOWhUbDloeVpsMnNsOFowTjJaZWJS?=
 =?utf-8?B?Q092YXlHcEZxYVdGeEFJbTFWMC9NeCthSjlFc3hhbDRSYy95OVkyTERObnNY?=
 =?utf-8?B?Q0QrOWZpOXpkT3h5RlVpMHpzZ3grNTNmb1RHUzN2YjFWOFBCRTZBZSttWkRU?=
 =?utf-8?B?QnpPRDhaWDcySUJ4bDFoMElwRVlNZngwWURyckVtd0RIbzRSNktYaHBselR3?=
 =?utf-8?B?NWRoZ1VqTFJJWGh2Q3ZhcCttamp1M3QvWFE2WCtTZS9qVitCZU9iMklHVTY3?=
 =?utf-8?B?TEZhemROOU9vNkVadUVYbEFsc1RXK0JPYXZXZ21HdURPOTZGd3E4Zk85RGha?=
 =?utf-8?B?ekdHcVlMQ21xQ08zZ2I5bVNpdEJyYWNGNzZSVVJSbmpJck5kMXFnd3NqRVc2?=
 =?utf-8?B?T1lVVWJlTnREbDRhOUJ5SENUblRwZDZPSmIrV2dVcE82dkl1dkhKR0F2NXYx?=
 =?utf-8?B?eDVLRDEwTGdoNUNUcDRWRXloK0RtbXNUb09oWmx4VzRXNGMwTStJNGdVNmR6?=
 =?utf-8?B?Y2k4NVRxMkhWVmlrUSt1MEQyMWdkeURucnV0VFZVNjh4eWNZUGdZZStxNGlz?=
 =?utf-8?B?Z3NMZURST2tCbENUekIvYzlGN1ZEWUZkSXhEWmxFWW1UKzFEbUlwK01NRmRs?=
 =?utf-8?B?TmVUODFLNTBlZEpsdUU5NzAxQ09aYjc5SHljMjErM2dCSmY0NFdQSFdsNUUx?=
 =?utf-8?B?YkE2WUtYZ1BQcU4wQkNLWXhTUzllQVkwd0xEcTBCbGdTVGFyMjVkM3lJS0Ev?=
 =?utf-8?B?ZjdDamg4Umora2ZmZWl1bXZqYitnZW5JV3FCdWY3R21HNS9UT2RnYVFhdEhO?=
 =?utf-8?B?dWllVW5wRVQ0bU1QdDFmeE5Qd2EwUEZaOGpCSWk0OEd1TU5hajFzYTJzb1NH?=
 =?utf-8?B?Y3VaOWdpUy95ejVvYlNmdmVQY3ZBZm05NlBOWjBlWDNjem12MDFMZ0pBY0RD?=
 =?utf-8?B?eFMwcWRMSW11RW11ZG1pS0U4N3RuaWMyWWdtUGJhS2RDanhBMG1uRFM1dENW?=
 =?utf-8?B?dWF2S2wrV0I4bE5pNVYvVE1HeEJlNjNMdzI5RVF3NitwWHNkZFNVZldTZXV0?=
 =?utf-8?B?a0w4S042clNkRUV5Y21uOG9ycTVyV1hmVGkwZ01LbnpIeWtXamJnNjcwYVUz?=
 =?utf-8?B?RlJsRTFZVVB0MUVOcjc3WW1BVTFlMU9lczBEMFNHVCtWQUtCcWV0VTFYQ3lz?=
 =?utf-8?B?bnhZMzBQUlVZYzZUZlBySVJCQWo3OFZtTDdkd09CR2hycU55Y1Z0RldCWHM2?=
 =?utf-8?B?UFdjckprS21rNVhSQmxLaTJqN3oxZFpOWGlRZ1JiU3o0Y3lUUnAzbHdCY1pl?=
 =?utf-8?B?b2tTZVVCS3BzMjg0ek1wcTNEZUlIWmpUTENMSXRYaUJhZkMzVnQ5N3MwbWtB?=
 =?utf-8?B?T0hncUdINUthaWtLdUYreFFWNnVEMEN3WURnanpBMzE2Q3NkVnl6c2ZuZ2lw?=
 =?utf-8?B?ZEtjclBYUkQ5L1M4OW5rdkQ1RCtwb3JQWGVpKy8ySUZEMzhOVkZQZWVheUY1?=
 =?utf-8?B?Ujd4elBhR2ZnNXNyVklCcTdsN1VTZXB5VDN2emMwbzN1eGpLYTY3enpuL29t?=
 =?utf-8?B?OHkxbldYQ202MkczQ1VXV2k1MG1VVnpvZWVRT21jc1NWeXFTUitiVDR5SXB1?=
 =?utf-8?B?SFBIQ1gxV1dXNUdFWkxxQzV0bkpaTWxTdkh4V0lsRXY5LzdNVklrRnpZNUNU?=
 =?utf-8?B?cHJSeVRkQWNER3FlV1dBUzdTcmd2VUwvOFNBZzlPdy9yeXVva0h3OWZrMTJO?=
 =?utf-8?B?enc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76019ac4-79f0-47d5-d804-08dba2405fe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 12:15:57.3354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h74hjiTW0uCFKr7D5Z1KFzsKGxvTpGv0sqSJGSWkZypm7B+NtL//YlOe5s7pv/TEZu6hrsR3fBI8N9+3wxMaUevWHkkWlSuHJQWUD8pxYRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8024
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgTGVlIEpvbmVzLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSBtZmQ6IG1jMTN4eHg6IFNpbXBsaWZ5IHByb2JlKCkNCj4gDQo+IE9uIFNhdCwg
MTkgQXVnIDIwMjMsIEJpanUgRGFzIHdyb3RlOg0KPiANCj4gPiBTaW1wbGlmeSBwcm9iZSgpIGJ5
IHJlcGxhY2luZyBvZl9tYXRjaF9kZXZpY2UoKSBhbmQgSUQgbG9va3VwIGZvcg0KPiA+IHJldHJp
ZXZpbmcgbWF0Y2ggZGF0YSBieSBpMmNfZ2V0X21hdGNoX2RhdGEoKS4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0N
Cj4gPiBOb3RlOg0KPiA+ICAqIFRoaXMgcGF0Y2ggaXMgb25seSBjb21waWxlIHRlc3RlZC4NCj4g
PiAtLS0NCj4gPiAgZHJpdmVycy9tZmQvbWMxM3h4eC1pMmMuYyB8IDkgKy0tLS0tLS0tDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IEkg
aW1wcm92ZWQgdGhlIGluYWRlcXVhdGUgc3ViamVjdCBsaW5lIGJlZm9yZSBhcHBseWluZy4NCj4g
DQo+IFBsZWFzZSBlbnN1cmUgc3ViamVjdCBsaW5lcyBhcmUgYm90aCBzdWNjaW5jdCBhbmQgZm9y
dGhjb21pbmcuDQoNCk15IGJhZCwgd2lsbCB0YWtlIGNhcmUgbmV4dCB0aW1lLg0KDQpDaGVlcnMs
DQpCaWp1DQo=
