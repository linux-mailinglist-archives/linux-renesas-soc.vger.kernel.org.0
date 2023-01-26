Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A68D67C216
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 01:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjAZAzX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 19:55:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjAZAzW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 19:55:22 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2132.outbound.protection.outlook.com [40.107.215.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD0E485A8;
        Wed, 25 Jan 2023 16:55:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeU1dx6dITjsj6kRJAIHVLc/pyy7UqBvDLme0fGVjblqs6CbzSgeWGWphWzGULoIIwDCDC4Cv/o8ut7Qaus7XRbQKsWtjgb/lq3ywrEsRNsKweuldia/IAVRl6B8fMLJEffO/v2mMQUaLaQa4gSArGNS5O8BaJoO/GEPHhEyNilsp5Vay7/P+uR3iBf7ycroLg4KxUTw1NAeInltzVp413tSXfA2GtvWzkYyfisBDhgdoLbKDeAr6GBLlP1TMrqd6JeqcUhWNwoZyw2p3JT/oCLay1nEaVMXO3uVCfnOQXWyoU38BHOseoCr5xekqMFQF4Kj1MUtez60kSXEds6nEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwJniM7Uy4Cm1dTtC4ilVdSPah5gZNzKcM90IhKElZY=;
 b=R/+hKfMaYk2KZs/ehWMljBf9yPYURTcW9vvEEfLrhuLa/NwkIFI6rnDlGzk04clp4V3bEtePaUpq9bt2y5cMkjvLLFEIwbpWgeFvmveUm+P2NKrhfQhSuPHIFFnUiwWnzvJZIThXpm5TQk70XIaifnyz31t8GAP0UwWzS2guAcawdpWHgVju2pxNMoSpeRpjLca3YeUGdTJProt3aN6NlYgUSDIxSu0Gvq0Sm2JZPYQbOPvjEIzi42Hk6supp/M08r3srYxUkxSOVD/llY7KRWZjhmAIS8fhYBEeJZfbN+mJkDwzITSPH8V/Oso/IyiK80gOtcfWU2E0duqQo6xBRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwJniM7Uy4Cm1dTtC4ilVdSPah5gZNzKcM90IhKElZY=;
 b=W7thfN/KUBE0vCezeBgi6PkGkaFN1XXDaWB8syQ49YSincNUwBucDnV+PZrPk6o4JcQbSZFGQRHNqgrD694Sq6q8fyabCUAxyxuMQBzRH3GR8DOPFHFylsnylEkZ/XYQo0jrdOWPKyM7GZY3SvqEauw5VKXzaKB05Rh9tp17beU=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYVPR01MB10780.jpnprd01.prod.outlook.com
 (2603:1096:400:2ad::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 00:55:16 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18%7]) with mapi id 15.20.6043.021; Thu, 26 Jan 2023
 00:55:16 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: Update
 descriptions for R-Car Gen4
Thread-Topic: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: Update
 descriptions for R-Car Gen4
Thread-Index: AQHZLsourgLTvtmvK0W71iwTdWHd8a6tpGsAgACkryCAAI6eAIABBdTw
Date:   Thu, 26 Jan 2023 00:55:16 +0000
Message-ID: <TYBPR01MB5341F8DC36EAD659209A2BDDD8CF9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX92KMeON0xC9p17kiqWT7ksEBX_NyPiiQk0fLaucDZBA@mail.gmail.com>
 <TYBPR01MB5341B023178B4A10DE52B844D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdXXnu88Tn2ucuHZK=3G18v-nCfaTYpomchRXBu3bD7UuA@mail.gmail.com>
In-Reply-To: <CAMuHMdXXnu88Tn2ucuHZK=3G18v-nCfaTYpomchRXBu3bD7UuA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYVPR01MB10780:EE_
x-ms-office365-filtering-correlation-id: 5af7b9aa-e589-44af-391f-08daff37fd8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DLHtmkjFUH8syva5ksjReKy4wRutklno3PAVWVl+Vp64G21ceaygY0w8zEZjk/6F57JGeRfCf74iL8MsWFQHFGje2CocXqcwqb+IRhtZ+cBpAqKawmPeMPztR/w7bFV89hIj+/bh0Yt2xoZd5IbKqk9kzagM2XJl8DOvlIw0qNgCwKk4LIrz4iot/BGBT4myPy6o9OsXeUshPbYbLZbAUKAK1yOuY1DX8qua7MZoXsV71ACCvQhpAa7YhwngDwZIaKya1dERmTek0avLnysyiZx6xpsw13YQRzngnhNplVP+yfvYg8q8fV8qdQdnoYcboKkxNsb2eIMMKjuSldJJduGD5gDUDtW8K7QzFkSZcXnnQW6EzGtccPAvFV25Ta4fjI+sVdpBPxYJD0N0WhohWnyDyXGaYOcMlGqtQgA6bg2dKWMkdF6j5YwLHoHcv6TTvNNLZ4Ft4kLNpv9cw/fGGPvKQZsVN5sdyXlehHCK8oGtlRoJyLGdRoBZZFX3JkbQLN+ZhhceN8tg522wbqFY7aHEZjj8rS3Osx4ZWZR7XIELqwfI+emc27N7AWgdNhmiOkNNu/SUtrTx9ksQYRBYmlGFe8TAYaWj6Z66zLoy+0XFT82NwhjH6JwXorsRHsDRk5K4KvyUESnLgKJykyYKa1stJgMUPrco5zQoNzcLvXNA9Yr6ofUeLWzYQ29pcvkz129sHGzjh68DrEmNsVG7qA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(451199018)(5660300002)(52536014)(86362001)(2906002)(15650500001)(55016003)(38070700005)(83380400001)(64756008)(122000001)(41300700001)(54906003)(316002)(38100700002)(33656002)(8936002)(8676002)(76116006)(66946007)(9686003)(66556008)(53546011)(6506007)(6916009)(186003)(66476007)(7696005)(478600001)(71200400001)(4326008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0d3akluM3pqb2pId29rMEpWR2VnMzk3OForUjJvQWtjR2Z3eVd4K2pmL21X?=
 =?utf-8?B?ZVFtRWdjd1phK01IcllFb21adktZdWtEVjRQcmQ2MVE0UXo3MnNQRGhUcnFF?=
 =?utf-8?B?WU53aTcwVElUL1FMckxsSlkyZWU4ZkI1VW9jSFZFTnhQVFQrR213cVlQVXQ2?=
 =?utf-8?B?c0hseWFLZiswUnYyQ3MwKzAyV0pTSE1ocUlETzVRWlBDSUVmU2hMUWIyOUhx?=
 =?utf-8?B?LzFEc3o1VzhIV3pPYkwvRUtBd3dZLzhQanF6VjUwZkJHUjAxSkpwMGtaYkEw?=
 =?utf-8?B?dUpDYUQxR2xLdHh0bGRWOHN6UjNZVytwZklYT0paQXBsTzdUeWRaRXhyc2J6?=
 =?utf-8?B?TFNiaURZTFZqSlE0bmlyS01tT210Zmhsbkloc3FFU0lGVEtkaC9kamQ4ck1W?=
 =?utf-8?B?Z0lwL2pvWUFPTjNWUTJMVXlzK2Z1dDF3TXBzQWdBeWoxN2ZRNUNSQy9od3lq?=
 =?utf-8?B?bWxwMU9JOW1hRE5mNUJhVlpVYnZURUd0VFh3YzhMRWI3Nm5UMHRUVUhjVUJ5?=
 =?utf-8?B?SXhyVGVSN0hySzFFc0hBQzJwRDZRejJFTzY2cXUwSCtacEM1R3Z4QUU2TVZ0?=
 =?utf-8?B?U1c0aGZOODlORU9Ybm1adTdEN0Y0Ujk3UkFhTU1iWS8yRytsV0duTi9XSjR6?=
 =?utf-8?B?clFXZVFwM1ZwelBOUUIxaDEzV2UwbTBrdDlCSjhwOCtmOEhGeXZiR2RRMk9K?=
 =?utf-8?B?OE1ucjhTTUdwTUdNS0I1ZnRNOGJPLzZYWUJpNHF6MzllUGhPeGltSFNGUExP?=
 =?utf-8?B?THcwOTFDUGNyQjhnQzhGenREa2JxcW1KME05TmRSaUg1RjQ0WFBMekNhL0Iv?=
 =?utf-8?B?S05na2pQait3L0NvUVFQMjlVSVo5TkV1M0x2TUlYTlNwRWxYb1BVdi9UaTA2?=
 =?utf-8?B?eVRzVE5BUUtLUlZWMkxLMFZFS2V4NUF2clp3eDN1OXN4Qm9qdWxDNlIxYjZ0?=
 =?utf-8?B?MHIzdDFRYUNVN0RBYitVeHJzMld2N0FsUmhaT1Y5eVNxMkxPek1uZks5Uk85?=
 =?utf-8?B?bWZYYmRVVm01S2psakN2MHlNclV0SVhQcHl2NjBiRitPdkIvWlVSNUxxSklB?=
 =?utf-8?B?NTVSR3dYYSswVEdsSnI0dExrWFhKNTFnWnZLb0dNNTlzTzhlSDVYcXZmdUV3?=
 =?utf-8?B?aUp3Qnk2YU96RmdWSmhFdjlmRExZU3hNTzFQZHRFK2o5WENaWnc4R21zbjYy?=
 =?utf-8?B?Y2VLVXVHUG02bVRERGFSQkthSk0rMDg3dXZFM0ZqNC9TckdDU3F0aHBpTVNj?=
 =?utf-8?B?azJjOUs3Q2dnK1phM3VwZmlwMFBVN1A4QzBYNkhpeElIL3BYNUd5Y0ZXUmFV?=
 =?utf-8?B?cmR0cjlYakN5ZkZvZzBoRUtuNlF0UGcwSmJBN1hUZUprNHViNHlpOGxtdlN2?=
 =?utf-8?B?cE5XeUxTZm1VMStvWCtURFp1Z3JKTitWVU10V3MrOHZmV2svQnVKZERETHJF?=
 =?utf-8?B?MmhuNUFyYi81MlZPWXBIOFZBVjhDRmZ6WllHZzBEQlJ0ZDVxNTdQNnp5aFdI?=
 =?utf-8?B?VG55ZnVuTDFaaklUYTdteUd1R1lGQWZRa0svZEI4NGFiK1VwY0xCelk3UFFR?=
 =?utf-8?B?QTAvWU8wYjZwWmtMZk9HdHZhbWR2a21oTHk5TFl0eUhzZENZQ05Jd2dOWDFV?=
 =?utf-8?B?dFR4NnduUHNGbEJ5d2R5TkxiU0xMRlI0cG4zWW9JNnZ6QnVKREsxZFd2NVBF?=
 =?utf-8?B?Q0lnUHZ1SVhLZkxVTEZkTWhrSWkrQnluLzBKVUZXaG5NbUdIcEtlKzZ4YldF?=
 =?utf-8?B?STYxb1lxb2EyL0pSNWR0QUs1Qy95SkgrdWdRSFZYUjd2Q3U2VUg0RmVuLzRE?=
 =?utf-8?B?L3ViL0M4bjg0VkEvOFBtNVJXU2MzWkRhNHZqK2J4ZUpiREYvNHhhYzJJZUI0?=
 =?utf-8?B?QS9zelAzYUI3aTFKWFZuaE56bnhTZzIrV282dXV4b1IrczM0ak5PclRmNVda?=
 =?utf-8?B?cngwMXhIYXVRWUJ3a0xSYlhJR2Y2VjRadkJCOWJQNEpsSHZISW1TWWZRT0xC?=
 =?utf-8?B?aCtORHNjTkZuYUxkeldpd0FWMUIzV0JIR1g0WTBJOXBXNU0yQW5ZTzRhR0Fw?=
 =?utf-8?B?dUNOZ3BDSDRIM3ByNzB3ZTdrQW9VTFNONEE1TXVTRzY2UWxaTGJ1OTVLeUgy?=
 =?utf-8?B?blErVTBSWkpMZk9DZk1xUW5IVUVUNWNZL1ZVVUJrb1lQUVJLbVNxU1BFcDhj?=
 =?utf-8?B?aERrUGdRdWlCTXlENkJpM0Npd1RRZzlFc2c4dktreklaZTZ2V2I2andZMDZN?=
 =?utf-8?B?cXEyMWRSRUIreWJHV3JBdEFWTitRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af7b9aa-e589-44af-391f-08daff37fd8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 00:55:16.7765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VZocFiO7Kqo/84cxD6GnCW8ewWl0YEjFGH4cX+zTSxa3iJlM8NbygmMyyG6ns+gRfcOzyDn57cIxHbHCU3qNlOce4bCQn4yOSlWLEJdojicyymMKS7d2q1P2pfLeTXuh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10780
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVz
ZGF5LCBKYW51YXJ5IDI1LCAyMDIzIDU6NTUgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiAN
Cj4gT24gV2VkLCBKYW4gMjUsIDIwMjMgYXQgMTo0OSBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8
eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogR2Vl
cnQgVXl0dGVyaG9ldmVuLCBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDI0LCAyMDIzIDExOjM1IFBN
DQo+ID4gPiBPbiBNb24sIEphbiAyMywgMjAyMyBhdCAyOjM1IEFNIFlvc2hpaGlybyBTaGltb2Rh
DQo+ID4gPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4g
PiBTaW5jZSBSLUNhciBHZW40IGRvZW5zJ3QgaGF2ZSB0aGUgbWFpbiBJUE1NVSBJTVNTVFIgcmVn
aXN0ZXIsIGJ1dA0KPiA+ID4gPiBlYWNoIGNhY2hlIElQTU1VIGhhcyBvd24gbW9kdWxlIGlkLiBT
bywgdXBkYXRlIGRlc2NyaXB0aW9ucyBvZg0KPiA+ID4gPiByZW5lc2FzLGlwbW11LW1haW4gcHJv
cGVydHkgZm9yIFItQ2FyIEdlbjQuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFlv
c2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gDQo+
ID4gPiA+IC0tLQ0KPiA+ID4gPiAgVGhlIG9sZCBSLUNhciBTNC04IGRhdGFzaGVldCBoYWQgZGVz
Y3JpYmVkIElQTU1VIElNU1NUUiByZWdpc3RlciwgYnV0DQo+ID4gPiA+ICB0aGUgbGF0ZXN0IGRh
dGFzaGVldCB1bmRvY3VtZW50ZWQgdGhlIHJlZ2lzdGVyLiBTbywgdXBkYXRlIHRoZSBwcm9wZXRp
ZXMNCj4gPiA+ID4gIGRlc2NyaXB0aW9uLiBOb3RlIHRoYXQgdGhlIHNlY29uZCBhcmd1bWVudCBp
cyBub3QgdXNlZCBvbiB0aGUgZHJpdmVyLg0KPiA+ID4NCj4gPiA+IERUIGRlc2NyaWJlcyBoYXJk
d2FyZSwgbm90IHNvZnR3YXJlIHBvbGljeS4NCj4gPg0KPiA+IEkgdGhpbmsgc28uDQo+ID4NCj4g
PiA+ID4gIFNvIG5vIGJlaGF2aW9yIGNoYW5nZS4NCj4gPiA+DQo+ID4gPiBTbyB3aGVyZSBkbyB3
ZSBnZXQgdGhlIG1vZHVsZSBpZCBudW1iZXJzIHRvIHVzZSwgaWYgdGhleSBhcmUgbm8gbG9uZ2Vy
DQo+ID4gPiBkb2N1bWVudGVkIGluIHRoZSBIYXJkd2FyZSBNYW51YWw/DQo+ID4NCj4gPiBJZiBz
bywgd2UgY2Fubm90IGdldCB0aGUgbW9kdWxlIGlkIG51bWJlcnMuIFNvLCBzaG91bGQgd2UgdXNl
IG90aGVyDQo+ID4gaW5mb3JtYXRpb24gd2hpY2ggaXMgY29tcGxldGVseSBmaXhlZCBpbnN0ZWFk
PyBJIGhhdmUgc29tZSBpZGVhczoNCj4gPiAxKSBKdXN0IDAgKG9yIG90aGVyIGZpeGVkIHZhbHVl
KSBpZiB0aGUgSU1TU1RSIHJlZ2lzdGVyIGRvZXNuJ3QgZXhpc3QuDQo+ID4gMikgU2VxdWVudGlh
bCBudW1iZXJzIGZyb20gcmVnaXN0ZXIgYmFzZSBvZmZzZXQuDQo+ID4gICAgSW4gUi1DYXIgUzQ6
IGlwbW11X3J0MCBpcyB0aGUgZmlyc3Qgbm9kZSBmcm9tIHJlZ2lzdGVyIGJhc2Ugb2Zmc2V0LA0K
PiA+ICAgIGFuZCBpcG1tdV9ydDEgaXMgdGhlIHNlY29uZCBvbmUuDQo+ID4gICAgU28sIGlwbW11
X3J0MCBpcyAwLCBpcG1tdV9ydDEgaXMgMSwgaXBtbXVfZHMwIGlzIDIgYW5kIGlwbW11X2hjIGlz
IDMuDQo+ID4gMykgVXNpbmcgYmFzZSBhZGRyZXNzIHVwcGVyIDE2LWJpdHMuDQo+ID4gICAgSW4g
Ui1DYXIgUzQ6IGlwbW11X3J0MCBpcyAweGVlNDgwMDAwLiBTbywgdGhlIHZhbHVlIGlzIDB4ZWU0
OC4NCj4gPg0KPiA+IFBlcmhhcHMsIHRoZSBvcHRpb24gMSkgaXMgcmVhc29uYWJsZSwgSSB0aGlu
ay4gQnV0LCB3aGF0IGRvIHlvdSB0aGluaz8NCj4gDQo+IEkgd291bGQgbm90IG1ha2UgdXAgbnVt
YmVycywgYXMgdGhhdCB3b3VsZCBjYXVzZSBjb25mdXNpb24gd2l0aCBTb0NzDQo+IHdoZXJlIHRo
ZSBudW1iZXJzIGRvIG1hdGNoIHRoZSBoYXJkd2FyZS4NCg0KSSBzZWUuDQoNCj4gQXMgdGhlIGRy
aXZlciBkb2Vzbid0IHVzZSB0aGUgbW9kdWxlIGlkIG51bWJlciAoaXQgYWxyZWFkeSBsb29wcw0K
PiBvdmVyIGFsbCBkb21haW5zLCBpbnN0ZWFkIG9mIGNoZWNraW5nIElNU1NUUiwgcHJvYmFibHkg
YmVjYXVzZSBvZg0KPiBoaXN0b3JpY2FsIChSLUNhciBHZW4yKSByZWFzb25zPyksIHdoYXQgYWJv
dXQgZHJvcHBpbmcgaXQgZnJvbSB0aGUNCj4gcHJvcGVydHk/IEkuZS4gYWRkICJtaW5JdGVtczog
MSIsIHBvc3NpYmx5IG9ubHkgd2hlbiBjb21wYXRpYmxlIHdpdGgNCj4gcmVuZXNhcyxyY2FyLWdl
bjQtaXBtbXUtdm1zYT8NCg0KSXQgbG9va3MgYSBnb29kIGlkZWEgdG8gbWUuDQoNCj4gQlRXLCB0
aGUgcmVsYXRlZCBJTUNUUiByZWdpc3RlciBpcyBzdGlsbCBkb2N1bWVudGVkLCBhbmQgdGhlIGRy
aXZlcg0KPiBkb2VzIGVuYWJsZSB0aGUgaW50ZXJydXB0IGJpdCAoSU1DVFJfSU5URU4pLCBzbyBJ
J20gd29uZGVyaW5nIGhvdyB0aGUNCj4gaGFyZHdhcmUgKGRvY3VtZW50YXRpb24pIHBlb3BsZSBp
bnRlbmQgdGhpcyB0byBiZSB1c2VkLi4uDQo+IFBlcmhhcHMgSU1DVFJfSU5URU4gd2lsbCBiZSBy
ZW1vdmVkL3VuZG9jdW1lbnRlZCwgdG9vPw0KPiBPciBwZXJoYXBzIHRoZSByZW1vdmFsL3VuZG9j
dW1lbnRhdGlvbiBvZiBJTVNTVFIgd2FzIGEgbWlzdGFrZT8NCg0KSSBkb24ndCB0aGluayB0aGF0
IElNQ1RSX0lOVEVOIHdpbGwgYmUgcmVtb3ZlZC91bmRvY3VtZW50ZWQgdG9vIGJlY2F1c2UNCnRo
ZSBJTUNUUiByZWdpc3RlciBpcyByZWxhdGVkIHRvIElNU1RSIHJlZ2lzdGVyLCBub3QgSU1TU1RS
IHJlZ2lzdGVyIDspDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fiAgICAg
ICAgICAgICAgIH5+fn5+fg0KQWJvdXQgdW5kb2N1bWVudGF0aW9uIG9mIElNU1NUUiwgSSBmb3Vu
ZCB0aGF0IGFjY2Vzc2luZyB0aGUgcmVnaXN0ZXIgaXMNCnBvc3NpYmxlIHRvIGNhdXNlIGEgcG90
ZW50aWFsIGlzc3VlIG9uIGJvdGggUi1DYXIgR2VuMy80LiBUaGF0J3Mgd2h5DQp0aGUgSU1TU1RS
IHJlZ2lzdGVyIGlzIHVuZG9jdW1lbnRlZCBvbiBSLUNhciBHZW40LiBJJ20gbm90IHN1cmUgd2hl
dGhlcg0KUi1DYXIgR2VuMyB3aWxsIGJlIHVuZG9jdW1lbnRlZCB0b28gaW4gdGhlIGZ1dHVyZSB0
aG91Z2gsIGJ1dCBhdCBsZWFzdCwNCndlIHNob3VsZCBub3QgYWNjZXNzIHRoZSBJTVNTVFIgcmVn
aXN0ZXIgb24gYm90aCBSLUNhciBHZW4zL0dlbjQuDQojIEknbSBub3Qgc3VyZSwgYnV0IHRoYXQn
cyB3aHkgdGhlIGRyaXZlciBkb2Vzbid0IGNoZWNrIElNU1NUUiB0byBhdm9pZA0KIyB0aGUgcG90
ZW50aWFsIGlzc3VlPz8NCg0KU28sIHRvIHNpbXBsaWZ5IHRoZSBkdC1iaW5kaW5ncywganVzdCBy
ZW1vdmluZyB0aGUgc2Vjb25kIHByb3BlcnR5IHdpdGhvdXQNCmFueSBjb25kaXRpb24gaXMgYmV0
dGVyLCBJIHRoaW5rLiBCdXQsIHdoYXQgZG8geW91IHRoaW5rPw0KDQpCZXN0IHJlZ2FyZHMsDQpZ
b3NoaWhpcm8gU2hpbW9kYQ0KDQo+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pb21tdS9yZW5lc2FzLGlwbW11LXZtc2EueWFtbA0KPiA+ID4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvcmVuZXNhcyxpcG1tdS12bXNh
LnlhbWwNCj4gPiA+ID4gQEAgLTc2LDE0ICs3NiwxNSBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiAg
ICAgIGl0ZW1zOg0KPiA+ID4gPiAgICAgICAgLSBpdGVtczoNCj4gPiA+ID4gICAgICAgICAgICAt
IGRlc2NyaXB0aW9uOiBwaGFuZGxlIHRvIG1haW4gSVBNTVUNCj4gPiA+ID4gLSAgICAgICAgICAt
IGRlc2NyaXB0aW9uOiB0aGUgaW50ZXJydXB0IGJpdCBudW1iZXIgYXNzb2NpYXRlZCB3aXRoIHRo
ZSBwYXJ0aWN1bGFyDQo+ID4gPiA+IC0gICAgICAgICAgICAgIGNhY2hlIElQTU1VIGRldmljZS4g
VGhlIGludGVycnVwdCBiaXQgbnVtYmVyIG5lZWRzIHRvIG1hdGNoIHRoZSBtYWluDQo+ID4gPiA+
IC0gICAgICAgICAgICAgIElQTU1VIElNU1NUUiByZWdpc3Rlci4gT25seSB1c2VkIGJ5IGNhY2hl
IElQTU1VIGluc3RhbmNlcy4NCj4gPiA+ID4gKyAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBUaGUg
aW50ZXJydXB0IGJpdCBudW1iZXIgb3IgbW9kdWxlIGlkIGFzc29jaWF0ZWQgd2l0aA0KPiA+ID4g
PiArICAgICAgICAgICAgICB0aGUgcGFydGljdWxhciBjYWNoZSBJUE1NVSBkZXZpY2UuIFRoZSBp
bnRlcnJ1cHQgYml0IG51bWJlciBuZWVkcw0KPiA+ID4gPiArICAgICAgICAgICAgICB0byBtYXRj
aCB0aGUgbWFpbiBJUE1NVSBJTVNTVFIgcmVnaXN0ZXIuIE9ubHkgdXNlZCBieSBjYWNoZSBJUE1N
VQ0KPiA+ID4gPiArICAgICAgICAgICAgICBpbnN0YW5jZXMuDQo+ID4gPiA+ICAgICAgZGVzY3Jp
cHRpb246DQo+ID4gPiA+ICAgICAgICBSZWZlcmVuY2UgdG8gdGhlIG1haW4gSVBNTVUgcGhhbmRs
ZSBwbHVzIDEgY2VsbC4gVGhlIGNlbGwgaXMNCj4gPiA+ID4gLSAgICAgIHRoZSBpbnRlcnJ1cHQg
Yml0IG51bWJlciBhc3NvY2lhdGVkIHdpdGggdGhlIHBhcnRpY3VsYXIgY2FjaGUgSVBNTVUNCj4g
PiA+ID4gLSAgICAgIGRldmljZS4gVGhlIGludGVycnVwdCBiaXQgbnVtYmVyIG5lZWRzIHRvIG1h
dGNoIHRoZSBtYWluIElQTU1VIElNU1NUUg0KPiA+ID4gPiAtICAgICAgcmVnaXN0ZXIuIE9ubHkg
dXNlZCBieSBjYWNoZSBJUE1NVSBpbnN0YW5jZXMuDQo+ID4gPiA+ICsgICAgICB0aGUgaW50ZXJy
dXB0IGJpdCBudW1iZXIgb3IgbW9kdWxlIGlkIGFzc29jaWF0ZWQgd2l0aCB0aGUgcGFydGljdWxh
cg0KPiA+ID4gPiArICAgICAgY2FjaGUgSVBNTVUgZGV2aWNlLiBUaGUgaW50ZXJydXB0IGJpdCBu
dW1iZXIgbmVlZHMgdG8gbWF0Y2ggdGhlIG1haW4NCj4gPiA+ID4gKyAgICAgIElQTU1VIElNU1NU
UiByZWdpc3Rlci4gT25seSB1c2VkIGJ5IGNhY2hlIElQTU1VIGluc3RhbmNlcy4NCj4gDQo+IEdy
e29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4g
DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBC
dXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
