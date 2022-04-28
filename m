Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3E83512C0C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 08:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244633AbiD1G5W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 02:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244609AbiD1G5V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 02:57:21 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E346F986D3;
        Wed, 27 Apr 2022 23:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqNN0sLK6+u7O7w7OIAyVWwDEYuc6IerGGAlIm/qGRTIJTm0RFTSPtzvYMhXIOI3DyugGhovLxj1XshV4UfUaOdTbreEt8ZDHorRSXXT6y5Jt/+DTKRqnJUjypR2mLCkl2vOPGyyONJx3wy/YN5hNMj/ZgjLJ4ucpWBYsHnReR0O6/OBW2ZSx/XqVzdBzeuk0gQR5z7wjU76uKElDSPVWCZG8KNhudzfFEBShOcm/uA6ExGT5QbSrlCr45enbaMWKzag7fyY0wDaJYOEfGUojL8W6nZLdt+jjPgLGwTu0fovmW5w8nRRcdCH44/H6Gmkonz4Nx5GwGIJ8DNmZpfY2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQA+uwPtdJm+t/rVGrMBISRYEq6blkziKIQlcIy3PMM=;
 b=jJbbP0TbI6aFVD1XRhhoGFhv3uH3BbRsEy5dR2WPC+QdpvqQuxA8PPy8MqQQWt84WtUxcgWFVGdnPK8pULXioLFz8ZZ9YopAz5SVJpAesbt1AzGDaEnHId4NBh+MAxYUuTy9HBRFene0ATPsaDqhr6QmU4WjSm5htD7CWhUVPc/cg4MrwiOsOGH9PFtA+qZmrEX8wjdcLVEANsM6eXFhNwcSaEgrz561A/dmNfmjviGhvFkFAs+ONfFeSVa6FqeXVI91D4L7gyFtE8Z+Ls7qtn8Qhcog2hVfb1daL6JEp/qLqQgMwcW0hv7nVCPpEdmj6a0qWZxT5YtSJrWo2dpN6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQA+uwPtdJm+t/rVGrMBISRYEq6blkziKIQlcIy3PMM=;
 b=WFmtz8ypIjPKi0lx8wVuKKZQ8A5PmROaud83WVQfusrP5PEwpyV7EUU0s3oJCU3OYba+gLRqWscJpi2mHkggER5WlYpZL0xpdKjfikof/1rxYwDr9npUSvOaMN/Jzb9u1S1q2tPTcMleryljDz+bB/mE28KS/Oojq5Scki2ia2o=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB9726.jpnprd01.prod.outlook.com
 (2603:1096:400:225::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 06:54:04 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%9]) with mapi id 15.20.5206.014; Thu, 28 Apr 2022
 06:54:04 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alim Akhtar <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        scsi <linux-scsi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 6/7] arm64: dts: renesas: r8a779f0: Add UFS node
Thread-Topic: [PATCH v4 6/7] arm64: dts: renesas: r8a779f0: Add UFS node
Thread-Index: AQHYVGIHfAeb2jY4VEmNTQFLByGlT60DyKaAgAEm+HA=
Date:   Thu, 28 Apr 2022 06:54:04 +0000
Message-ID: <TYBPR01MB5341FD0D3C9B69EAF0CED3CDD8FD9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220420025450.289578-1-yoshihiro.shimoda.uh@renesas.com>
 <20220420025450.289578-7-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU7_nqwT8J_OKLez9GDU8sCiP_PB1ioZBK5YvevToOsXg@mail.gmail.com>
In-Reply-To: <CAMuHMdU7_nqwT8J_OKLez9GDU8sCiP_PB1ioZBK5YvevToOsXg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ca216b3-e016-4765-c7a8-08da28e3e264
x-ms-traffictypediagnostic: TYWPR01MB9726:EE_
x-microsoft-antispam-prvs: <TYWPR01MB9726AFAA414F5BE75D5753B9D8FD9@TYWPR01MB9726.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d7KMwje7JNHu9lL6oETVrt4MkPgmhL5QHQBjlM3Kd174PIlSbbDZm5CVeFePrqhNAyjhym/4UYD2WxC5NplT5N06iDBNFSLh7Nn7p1djH6Fm1VJ57dhkdON31p1slGQ+oJkak8KGPG8JMkBSTTci8atDI4ganAa6zicqVxjXJpyRb0xDbxM1O3nPSjjzQD1YAgZdoWY8NYI7YPO6uBjp+V7dsVpdA3UvbNoF5mIfayAodIXIhaxb1nlXFfF/Ci+vtx4uw8ABvAlrvbp1HTtIci35SssT48mE8+yhGEyvyCaiJFiVkQhCY4nedJlTa2TJFhkcQIvghDSrkI+yisI5VchbIVJ6JsYUX6RyWDKojb2jrhyYnIjPYqGHgwKOzU3i9hZldvrTqfwuX/cZnqCThejJGvIFaTc9RsFD7Ih7xGovA86ICv/RaU8N6RCSfMK8LrXCxiYgZAJ7gk8nSqyQE3tHxcnWYQjZ5zn7+r0j+8zCmxSMlSyyufdFl5zoG+46E9SLDw8mauIJpmWsw48v4bp3/ZG+D9/ujD9qPmwcNGAli5qz9F4wusUlXMd+dQ8c/eROsmoXyxbJQHJ2g2N56Dr8/gZk6FQfhoeGqg0nNwhHYXAi0Sp9j/KxsjdduqMr+3SBDlcjzQJyqproPLAbuOlOxC3QyQt8t+5/zONK+cHFV4IX6B9aaMuds23TZWX3qKkt3sU0lbSZ/w+fC7DvNQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(7696005)(9686003)(83380400001)(86362001)(186003)(7416002)(52536014)(8936002)(4326008)(66476007)(64756008)(66446008)(66556008)(8676002)(38070700005)(5660300002)(2906002)(38100700002)(71200400001)(55016003)(66946007)(122000001)(33656002)(53546011)(508600001)(316002)(76116006)(6916009)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlB5RVFoZVpMV2RaUEtxeUVteGlCbWIwU2RkN1JSU25mcjZ5SUI4SjliQ3JK?=
 =?utf-8?B?REpob1lLUjM1U3pyR0xUNXJSMzFrQUxBQjRPR0duWkZTSUZXaW1iSWtoYW9G?=
 =?utf-8?B?TkdMRFNkb3d2SGo1TW5LRHRqb21PWmFuSnJaNUp1bUxjcHdOREYvR3ZIR0h2?=
 =?utf-8?B?NlRiNHZ2MzRoU1pVMHhwS01VRmg4bC9nS0Y3UkE4L05xZUQ1aGN0K2ZLMjUx?=
 =?utf-8?B?R0FPYnF4SHNoMlVkcWtxQ05WdGk3SmVSTjhYUlQrZFpsczlFTmx5bVpvNGVw?=
 =?utf-8?B?MHhCM0dRUUdtZGttZlQrdHdCOTlmZU1kOFc1OHp3eXdhTGo5Q1lLYkUwM3dT?=
 =?utf-8?B?NXpFV3JIVVlpdE53YTNqSzBiZ080SUhreS9Ia2RzcTVIaVpoNzhQcGJlb2lP?=
 =?utf-8?B?bmVFc1J5RFFYbWZNTDZXTlVBcHNsQkxBdlJkYVBwdWFFMVJueFZydTkwdVJw?=
 =?utf-8?B?Z25wRjVYa0V0bzEwY1pSS1pJK0dxRTdwa0hnd2VGZ3IyZ3hJdlBqeXduZGxX?=
 =?utf-8?B?YTAyQ0ZmWTh1S3Y4VTg4Y0k3MkdickdLZktzVCtxdi9hUmF3cDJuUXhIZ3N4?=
 =?utf-8?B?N1l0SndNMVZqRy9wVG5WSXYvMVd5a1ROc2hHVWZVMXlPc3o2WW9KWnFtS0xI?=
 =?utf-8?B?ME5SZkxJZ1E0UXE5a3czb3VwcnNCWStLSlZDM2NFMjY5aWhISjUxNmgyVDBn?=
 =?utf-8?B?VzdLOFRQSGtrK3BrOXFGWUdpV3pCTXlyRW9zTHhBOVRWVUEvamYvdXpiZHAr?=
 =?utf-8?B?RU4zVFBQZmJINjI0YXlhM3hWQ1A0cU5iVFg4cWQ3cUJVMER4Ly9EcEVaSXlQ?=
 =?utf-8?B?RHcyM0FOQkRYbnM5dzhuYXhFMkpFbmlSclI5b3lGdTdUUmFGSE5tYVNzS1Rh?=
 =?utf-8?B?b3QwSTRoSUpRM09pQW9xOEgvODR0ZjVkaElGQW91WUo5eHJhdHhlUlRjS1Bi?=
 =?utf-8?B?WnpleWYxWXE4a3Byai9VZTFHa29oRUpDZDN1dkN4VjVXRzgxd0VPMnVmbGp1?=
 =?utf-8?B?UWNiNjYyM0VjM2pENzZaMTFuQXJSWmxVZmQwL3RUcG4zV1c3R2pHYjIxMHMr?=
 =?utf-8?B?Y1p6OVFxUUxOd2ZuYXoyWGkxYStjbjFwYThiNVJTVTg5aEFNb0NTYjBYamg1?=
 =?utf-8?B?RG85QTVVWlpzY1Q2dmlaY09BV3g3a1QvV1RjTFdGenFoaEcxNVROd2c3QTVD?=
 =?utf-8?B?dE5LamsyaHlKK0JTSFZxSmdoZlJaMGR1MlR4d1R3RDBscEgrVkF2a0ROMDRk?=
 =?utf-8?B?QXdGNTlnOG54RlZKUjB2SDE5Wm1nblhhNW1ia3UzVHFDcy96ZzlGV0JSWnRl?=
 =?utf-8?B?UnZwSTJsQlpaVGsrOWZHZUxPMHRmY2NwZ25HUEY4S2p0RkpXQ2JjNGpXTXNp?=
 =?utf-8?B?QUMxbms5WSs1NXZPRFlvazRQaVVHZmJNS1d4QjVPMjBwVzlOaytwWFhaSjZR?=
 =?utf-8?B?c1BTWnpKMEhHQ0ZNYjVSSVdjRTI0N0puRVpFUWY3bVNJNjRheitXV3pMMk5L?=
 =?utf-8?B?L3R5emNoUHIwTEpQcHRneUxrMU9wQlZycU5hbHZMeGxTU1lyekZlRC96aFg3?=
 =?utf-8?B?bElsY1NzWHdOSFJLUHVxN2dxQWI1QXQ5RHZmTHIwbTZ6SDFVL0pYamhNYURj?=
 =?utf-8?B?bnZmVHhTSSt2ZEN5amZwWlpURmdVNGhtekNrUVdTQ2d1QkV5RkVrOGc3QnU0?=
 =?utf-8?B?SFF4ZE1GZEtBQXBtZE8xKzNGZERjdC9yQ25ydXl5aHMrdzdkSXNhYmRqVWl6?=
 =?utf-8?B?eDJOQ2tvZWh0NEl3S2Y5SHFTK1U2SEhKR2pxVGEwRWlQVzl6OWEzWTNaVDZ2?=
 =?utf-8?B?REpNNHRIYmJYZUZBMWcwc3VMOFd3Z3VERE1KWTh4ak5rNU5yK0xoNUUzcWZM?=
 =?utf-8?B?NlJWbitDNk9PdU1IdVdKSnlMTUUyVXdpSUJtZzQ5Qnh5MVl6a0o0NHBqTDlG?=
 =?utf-8?B?MjQyN1pPRHlVekYxbmNWejNuWHg2bys4RmNJeE5TMXNadDQxdStObUJkZHBO?=
 =?utf-8?B?bm84WWtOcy9nOWJjV2YyRUQ0MStkNksxdG56NkdBOFBtc0d0ZzNiYXEzbDZI?=
 =?utf-8?B?Q1VKc0VQcEJoZ2x6UmV1VlBLN1NTVVVaQ2IwaEtCdStvSEFlb0cvdnBybjQ5?=
 =?utf-8?B?R3doMGtsbktnM0VSa3RIU0x6UUwwMHVrRzFrb2Q1cUJSYlBjblFKUmNlVlli?=
 =?utf-8?B?VW1HVVllOE0vdjYxc3liL3Jaait6N1JXK0g3TG5qQ3hab1VrMW5sckxIK05H?=
 =?utf-8?B?MVdCcjd3MTMxWVhUWGdZeDZ0ZFVVZ2RnQ2p4R2JOVVRmVnZIWGplWmpBOFk3?=
 =?utf-8?B?cXRsbHRBTG9vMGVndHBCSlRnWG4xUjZoQ2k5VnlsLy9yNkVzdGNUelNVS213?=
 =?utf-8?Q?hRyYmY5hHzg69MDY8KWcS0NnMZaphF3KtkR7BdMf+W1EG?=
x-ms-exchange-antispam-messagedata-1: JxMEuXaodXqC+OLXr90pMzzs382DjsUP54I=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca216b3-e016-4765-c7a8-08da28e3e264
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 06:54:04.5570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eH0jIgq5tIeffli9lotYgjLab/SxvoTA4z5nv8P8239vli5L9QzMS3gg+rILRnvXshpdqEk8h5n8eXG3ywjDNAbJyA6Cy3jyijiVhyWZPxm2PHqX86lUiHWNHWoN8iSd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9726
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IEdl
ZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVzZGF5LCBBcHJpbCAyNywgMjAyMiAxMDoxNCBQ
TQ0KPiANCj4gT24gV2VkLCBBcHIgMjAsIDIwMjIgYXQgMTA6MzEgQU0gWW9zaGloaXJvIFNoaW1v
ZGENCj4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQg
VUZTIG5vZGUgZm9yIFItQ2FyIFM0LTggKHI4YTc3OWYwKS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4N
Cj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OWYwLmR0c2kN
Cj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5ZjAuZHRzaQ0KPiA+
IEBAIC00MCw2ICs0MCwxMyBAQCBleHRhbHJfY2xrOiBleHRhbHIgew0KPiA+ICAgICAgICAgICAg
ICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MD47DQo+ID4gICAgICAgICB9Ow0KPiA+DQo+ID4gKyAg
ICAgICB1ZnMzMF9jbGs6IHVmczMwLWNsayB7DQo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiZml4ZWQtY2xvY2siOw0KPiA+ICsgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8
MD47DQo+ID4gKyAgICAgICAgICAgICAgIC8qIFRoaXMgdmFsdWUgbXVzdCBiZSBvdmVycmlkZGVu
IGJ5IHRoZSBib2FyZCAqLw0KPiA+ICsgICAgICAgICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8
MD47DQo+ID4gKyAgICAgICB9Ow0KPiANCj4gVGhpcyBtYXRjaGVzIHdoYXQgd2UgdHlwaWNhbGx5
IGRvIGZvciB0aGUgUENJZSByZWZlcmVuY2UgY2xvY2ssDQo+IGJ1dCByZWxpZXMgb24gdGhlIGN1
cnJlbnRseS1taXNzaW5nIGNsb2NrIGdlbmVyYXRvciBpbml0aWFsaXphdGlvbg0KPiBpbiB0aGUg
Ym9vdCBsb2FkZXIgc3RhY2suDQoNClllcywgdGhhdCdzIHRydWUuDQoNCk9uIFVGUywgdGhlIHVm
c2hjZC5jIHJlcXVpcmVzIGEgcmVmX2NsayBhbmQgdGhpcyBpcyBmb3IgaXQuDQpUaGUgZHJpdmVy
IHdpbGwgZ2V0ICJyZWZfY2xrIiByYXRlIGFuZCBjaGVjayBpdCBieSB1ZnNfcmVmX2Nsa19mcmVx
c1tdLg0KDQo+ID4gKw0KPiA+ICAgICAgICAgcG11X2E1NSB7DQo+ID4gICAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hNTUtcG11IjsNCj4gPiAgICAgICAgICAgICAgICAg
aW50ZXJydXB0cy1leHRlbmRlZCA9IDwmZ2ljIEdJQ19QUEkgNyBJUlFfVFlQRV9MRVZFTF9MT1c+
Ow0KPiA+IEBAIC0yNTgsNiArMjY1LDE4IEBAIGkyYzU6IGkyY0BlNjZlMDAwMCB7DQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiAgICAgICAgICAg
ICAgICAgfTsNCj4gPg0KPiA+ICsgICAgICAgICAgICAgICB1ZnM6IHVmc0BlNjg2MDAwMCB7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI4YTc3OWYw
LXVmcyI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHhlNjg2MDAwMCAw
IDB4MTAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19T
UEkgMjM1IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiANCj4gVGhlIFItQ2FyIFM0LTggaW50ZXJy
dXB0IG1hcHBpbmcgc3ByZWFkc2hlZXQgbGlzdHMgdHdvIGludGVycnVwdHMuDQoNCk9vcHMuIEkn
bGwgYWRkIGl0Lg0KDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjcGcg
Q1BHX01PRCAxNTE0PiwgPCZ1ZnMzMF9jbGs+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGNsb2NrLW5hbWVzID0gImZjayIsICJyZWZfY2xrIjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBmcmVxLXRhYmxlLWh6ID0gPDIwMDAwMDAwMCAyMDAwMDAwMDA+LCA8Mzg0MDAwMDAgMzg0
MDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnN5
c2MgUjhBNzc5RjBfUERfQUxXQVlTX09OPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXNldHMgPSA8JmNwZyAxNTE0PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMg
PSAiZGlzYWJsZWQiOw0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4gPiAgICAgICAg
ICAgICAgICAgc2NpZjM6IHNlcmlhbEBlNmM1MDAwMCB7DQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHNjaWYtcjhhNzc5ZjAiLA0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicmVuZXNhcyxyY2FyLWdlbjQtc2NpZiIsICJy
ZW5lc2FzLHNjaWYiOw0KPiANCj4gVGhlIHJlc3QgTEdUTSwgc28gd2l0aCB0aGUgYWJvdmUgcmVz
b2x2ZWQ6DQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlPg0KDQpUaGFua3MhDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2Rh
DQoNCg==
