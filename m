Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59F2D4E2CFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Mar 2022 16:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237438AbiCUP7L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Mar 2022 11:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236298AbiCUP7L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Mar 2022 11:59:11 -0400
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com (mail-zr0che01on2093.outbound.protection.outlook.com [40.107.24.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDF71817B9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Mar 2022 08:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQeePV/HOcyLvwI5z7Ak8ZcEQEyh5MstCCeInqAt20gpedOcZbih7WpFW2SZhikDEpSU1Kiar62AV7AtKU5f7SQA3YlNCKeQUakxEwpaUkXzHcjhL/e5LwcLCQmLl3Df+qqw3rEpr0Exs3yZ9IsJGhVH2UcPCf1H/1m0EvgOyDVHcF9RY5hQ8i4zyLSf3kZq/YzbamJV//USX6rNFmb5ZT6dmKmjDjAJsaj+5SFuqDUDABYOcYCsXOpSngbUzugXzh1uU1WnkgUrvIIe3CPBjkDpitxOknag58uuA4XE/t1oo78L0JxkGndeJYkIsRRMTpJEYk2bYcNL50dZyhP3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCYd39fsbc8PekMxNcfVdIPEFcjv2MvJrjPCbOBo2vs=;
 b=IFKg9/gMEwLqeVe2PpDg6kMu5Ua1zO29eWItmIvqQEdPOTsvxsbDoBpC2twsF37jjvdSNGPaNcnzQIhsGYVuOUnqGsiDZRaJUaqU9kbaAg8rFwmFg5nLj3+AYXedk3AgaUPWgRzav9HGgEr2kaOou+EzAR57SY6lnfS+Shv/TuphtoUyTgzF21kUU/vTNgcjrQNVD2PbDX1aOec5aX7QTvl1GIkXXDZjQGm3Ctb5x+uYScPYxrmySc0p2PgT1leRFc672LVlOtC+DqQCt3C6tqMUuPaRoP5Z+bn1UzebYGYsZWu9U4J3jpnG+WSGSTKNJ/P59rBkHqSksC2o8hB05w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCYd39fsbc8PekMxNcfVdIPEFcjv2MvJrjPCbOBo2vs=;
 b=oIoXR6ePz1o/4nue2g3Dv71IMjpxTwM7NKVaj/kYq0WBYkocam5xr4YcfHkvM+sqpmNWss26OrEZ9XT0aJ0hthZ2Dt4mUZ16hk6fD8EGflHKCPuX7eDhe6wbPYCwOFMfqgXUiNMJUvE5c5/fSvgsqppNBgyueKdeL1OX+Tz0E70=
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3b::9) by
 ZRAP278MB0924.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:4c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.17; Mon, 21 Mar 2022 15:57:43 +0000
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::ac85:57a0:359e:149e]) by ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::ac85:57a0:359e:149e%3]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 15:57:43 +0000
From:   Marcel Ziswiler <marcel.ziswiler@toradex.com>
To:     "will@kernel.org" <will@kernel.org>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "phil.edworthy@renesas.com" <phil.edworthy@renesas.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>
CC:     "vkoul@kernel.org" <vkoul@kernel.org>,
        "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "biju.das.jz@bp.renesas.com" <biju.das.jz@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 12/14] arm64: defconfig: Enable Renesas RZ/V2M SoC
Thread-Topic: [PATCH 12/14] arm64: defconfig: Enable Renesas RZ/V2M SoC
Thread-Index: AQHYPTrJ/OxJB41uFkC5IhxrF02Z36zJ/laA
Date:   Mon, 21 Mar 2022 15:57:43 +0000
Message-ID: <56b5299a95ea7752756bd4dae6cef9444d774149.camel@toradex.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
         <20220321154232.56315-13-phil.edworthy@renesas.com>
In-Reply-To: <20220321154232.56315-13-phil.edworthy@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89a89440-51ee-42f0-f791-08da0b538919
x-ms-traffictypediagnostic: ZRAP278MB0924:EE_
x-microsoft-antispam-prvs: <ZRAP278MB09242C752EF5763D8005FDD7FB169@ZRAP278MB0924.CHEP278.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vscS02TJp5xMCe1p/uOuBY/KKh/S0jYptN7jhoPLR6pwR6ZbuPiR+jrgoP8jj6JPN9FxQMiFv7owq/Yxtv3W6L4DZr35gf/NcvQ3Ixp7M2pBEHKQkPnNva7Dwgu0VzvPU95EACFLpR+rDro0Y4J3kCzoWVUY+PvULev+6DkTeWzAigNM8RnyXyztId1spTs4K3MAgFbU4rPO+zlJAZSBJec/xOPck/Jn5/Ww5N5s85Ga1EHCBCbB9kK+y3Eo1k6Koy3x1HPAKPsQ7qxMQDwWe6L+Y2W7ErRNEkKQdzAb10th1aHcARRi/lUUvTaVnYLeTaaoct0oHwom0m2hBvbQd1UXDEVElAvpNkSDVGn0Ck+bM6e3RvJK0wdRirCl68KIXF/kggXHfiYXPhobVeSDPC//SuSfeRLaM7R4qTxw7bRTyW6VO4nhVY/s7LdDWLvaMZrgnbGp/O8i+uh+4Tox1q+g6Z34jF+2iNlKrSYAhk5nkvO8/AYBGlgaa8+ZcGYBWLSjskArVIVA0OQEeCAwY69nmUQJCgOxbw3ra5UsLkV/QPo/fZaSlIc/FywTmU+JJrmLj2F3jh+bwouyY9NwiU4pEHkr9Phm6Y38trOqrFnA3gyk4AQtq+MFR4pTeHndiKtyvzXltuPNit0B9BBPv36nZWQqVtx0psQq5BOMaOgCWVb7ts+yQ8H6z53WrJta/OKjw7ZHXnkDwZRByvgzTQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(346002)(366004)(38100700002)(36756003)(122000001)(8676002)(38070700005)(76116006)(26005)(66556008)(186003)(66946007)(66446008)(64756008)(4326008)(66476007)(2616005)(7416002)(8936002)(2906002)(71200400001)(6512007)(54906003)(508600001)(6506007)(110136005)(86362001)(5660300002)(6486002)(4744005)(44832011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M05STUovYkFlTUNuNVZCSVg5M1ltMWc4OGlDS29Ed3lXdEJpdE90cDl6TnZp?=
 =?utf-8?B?bDZDazJxSXJpbHFvUGVaWC92YkVlMGpzVU9neStkR09DZ0lwT28vZHkya2tZ?=
 =?utf-8?B?ZFM2U242ZmpNNHlPaUxaRmpDSG5ya2JKbTJlbmpYV2thTjNmMnhUTmp3dmpY?=
 =?utf-8?B?aFFZU0FtOEJQd1ArcWVXeXg0eVkvdXZwWGdIMGZNbGUrNFZWZVI2NHlHMnBX?=
 =?utf-8?B?eXEzd211TEo5b3Bad1pHWUVLQzBtNFJHbkJwcUUrdDRRUXpGcUdwdWZBejZa?=
 =?utf-8?B?clZ0dzZNUlIwMVF3bGhSRzI5UWZPU3RiTGdyQ1ZVWit2Z0oxTlBmY05Qdnlh?=
 =?utf-8?B?dTFzblh2YzRVZlJBNjVPNjBFS0NmYVZGR2ZOajV2aGwvWEdsTVl6aU85UTM2?=
 =?utf-8?B?RmRKSzVoOGplVG5PdTNhaDVJUyt5RCs0emd4R0s2anJJaGVEdTlkY1ZteGVP?=
 =?utf-8?B?WCtna0Q2WUU0OCtpOEJZRmlHTlVmN1NiQnEwY01xckk4dVQxWFhLZm9UeEhQ?=
 =?utf-8?B?NnkvYzZwbVh2Zk1nVUw1SzZrck1iNC9zeUlRR3ZGZjdRSStCL3FERDRDRDFG?=
 =?utf-8?B?b2J6R0V0SU5YYnBsVkZCaitYb2hWbGQvWHEwUVlmOC85d3JnNlU2bTQrL3NW?=
 =?utf-8?B?MDFTazB6Mld4TjQxQ0tRbXUzZ2MzR3orM1k1MTZGVEdzRjlrcDQxOTdxNVRE?=
 =?utf-8?B?TWNTMmhGUUFnMXFDMEh4bG8vMVVkaUl5bmRQb2hDd2lWdDl1bkNkdmRkN1Fn?=
 =?utf-8?B?QmZkSEgzVHllQ2txTE5mQm5sWUlMTXVaSWN1dkVDZ2VqaXRFMEJ2d1F0SW1I?=
 =?utf-8?B?cjNXZ0NTUEJtK1FNdnlDL3pOU2Ura0pYTGhIN0puRy9oMDB3d2FRVk02RUQ5?=
 =?utf-8?B?UkpZYlBHbDc5V3FJYXFSMDVEcG1VTWthZ0x4OGduT0FhWTdjZlVMRXhMWUIz?=
 =?utf-8?B?eHgvYTZ5djRJbktWNGNoZ0VFbFRKNHhQUGFnSytLcVhpeHdJWjY1dUY5TXY0?=
 =?utf-8?B?UnN0elN6OXNrZlFRa3E1amMxaWRESitxNXZXb211WmZva2FBVHVmM1NvKzAr?=
 =?utf-8?B?b3U2ZjArTXhOMGQ4ZWcyaXhPeWt3MFlCdUdENHlVRGlFSDVqd2xlS3k2L3dy?=
 =?utf-8?B?TkNGd1lmQ2N0ZkFyUm5reks2RW5XelJHSEJaWnlyQ0JLUmxqd1BkajFpaE9S?=
 =?utf-8?B?UzU3M1ZXdmZVak1QQjVicEcrSDI4N0JMSGxJeU5ZOXZMQWNRNUs4UXExVkFY?=
 =?utf-8?B?eEpjSktNeWE3ay9rOXc1MUZjZ2dLUjlxSEwvWWZZS2crUHhWK3JMSzQyWEdx?=
 =?utf-8?B?bDJZSnl5My8xV3JoSmdWTnBvcnBhOXpDK3Y4K05VSWNyRDhPRFJ4alhBMkxs?=
 =?utf-8?B?UFVxY0I0NVRmdHpBYWUxRXk0QUNPZmgycWU2ZEJKc3VDZGk3eDY0UzJrRHBs?=
 =?utf-8?B?cU5kQWJTWFNzR2hZc1VoWXVocXluS2pGMjhCSGJ4a3AydEpya1FRallCMnJa?=
 =?utf-8?B?SGNCS1gyTHlQd1hDUjNNbmt0dW5oMmxqN2JCQkpudWZ5NEYrbExJZ1czaFJ3?=
 =?utf-8?B?aStoREVOaFJpaEsrYmlrYWpyeko2cG1SMExzbk12eDUwak9ZT3NGNkdrallK?=
 =?utf-8?B?bWxxSFlKOVg1Qk1HSjEyb2QxRWV0MC96UW02OEdTU1FuYk5wWEw1dmZieFdW?=
 =?utf-8?B?MnpEV0xNdlVaTW1YYXdQdzZ3L2xwMFkzWEZoR1dmWGhtV2ZWMlhiejR6UzJK?=
 =?utf-8?B?akF3OHZLODFhTXVXLzRMcnNhMktiV1ZRRW1LTVhseUpTNno0SE5CejFicDlt?=
 =?utf-8?B?MlRJa2V2MzhQZU1XNEdZL2hwN1BHaXpELzlwZEp5dE5IY1Y1MGUzY3pEUEw4?=
 =?utf-8?B?bzBhaEl3UVNTbkZHZDhqSzZxUXJLcWNEaEpzY2lhK2w4d1V5dFpOVUVxbzVx?=
 =?utf-8?B?c0J4ZjNGOFF0MEVTZERiMEhGQkNoQjA3WkU1VTh2R21pcldHNndaTkJiSDkx?=
 =?utf-8?Q?yVMmpCrFP2NT9O6qOxpnamLXbIkyiI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE0872B909E7EE4A915AE0D95BB3946A@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a89440-51ee-42f0-f791-08da0b538919
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 15:57:43.6248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hg4NKC6lDU55xlSVrkrEd/2SaFTeW1jkhasqWCbtwMgAJY7oSvVo6/y0AVfXG/et4LbbxyWYXfgb6lahEPo7FotbIV3N6K2jsJuN2xLAoNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0924
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gTW9uLCAyMDIyLTAzLTIxIGF0IDE1OjQyICswMDAwLCBQaGlsIEVkd29ydGh5IHdyb3RlOg0K
PiBFbmFibGUgdGhlIFJlbmVzYXMgUlovVjJNIFNvQyBhbmQgdGhlIHVhcnQgaXQgdXNlcy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFBoaWwgRWR3b3J0aHkgPHBoaWwuZWR3b3J0aHlAcmVuZXNhcy5j
b20+DQo+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQoNClJldmlld2VkLWJ5OiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4
LmNvbT4NCg0KPiAtLS0NCj4gwqBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIHwgMiArKw0K
PiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIGIvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZp
Zw0KPiBpbmRleCA4MTNlNjQ0YjZhZjEuLmNjODE5NmM0ODAyOSAxMDA2NDQNCj4gLS0tIGEvYXJj
aC9hcm02NC9jb25maWdzL2RlZmNvbmZpZw0KPiArKysgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVm
Y29uZmlnDQo+IEBAIC00MjgsNiArNDI4LDcgQEAgQ09ORklHX1NFUklBTF84MjUwX0RXPXkNCj4g
wqBDT05GSUdfU0VSSUFMXzgyNTBfT01BUD15DQo+IMKgQ09ORklHX1NFUklBTF84MjUwX01UNjU3
Nz15DQo+IMKgQ09ORklHX1NFUklBTF84MjUwX1VOSVBISUVSPXkNCj4gK0NPTkZJR19TRVJJQUxf
ODI1MF9FTT15DQo+IMKgQ09ORklHX1NFUklBTF9PRl9QTEFURk9STT15DQo+IMKgQ09ORklHX1NF
UklBTF9BTUJBX1BMMDExPXkNCj4gwqBDT05GSUdfU0VSSUFMX0FNQkFfUEwwMTFfQ09OU09MRT15
DQo+IEBAIC0xMTA2LDYgKzExMDcsNyBAQCBDT05GSUdfQVJDSF9SOEE3NzRFMT15DQo+IMKgQ09O
RklHX0FSQ0hfUjhBNzc0QTE9eQ0KPiDCoENPTkZJR19BUkNIX1I4QTc3NEIxPXkNCj4gwqBDT05G
SUdfQVJDSF9SOUEwN0cwNDQ9eQ0KPiArQ09ORklHX0FSQ0hfUjlBMDlHMDExPXkNCj4gwqBDT05G
SUdfUk9DS0NISVBfSU9ET01BSU49eQ0KPiDCoENPTkZJR19ST0NLQ0hJUF9QTV9ET01BSU5TPXkN
Cj4gwqBDT05GSUdfQVJDSF9URUdSQV8xMzJfU09DPXkNCg==
