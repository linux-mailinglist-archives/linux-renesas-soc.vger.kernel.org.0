Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD61067CB91
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 14:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236286AbjAZNCP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 08:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236606AbjAZNBx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 08:01:53 -0500
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2093.outbound.protection.outlook.com [40.107.215.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3824F61868;
        Thu, 26 Jan 2023 05:01:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIMFWIvG5uAUuRX9w4GibcSJo1jJjhcEEQcmBnTQhdDM93J1gsE5gUYFkhn5FawjKeKiQGn+DO12M9jzez7JF1lg7/VuaBHQ7P6MJohovtn5uhhDwwJ87WuJkmgLAavBs0nrCgvOD4He6zIPjOzG/9IErQnFMbNIKukNyohIG+52vj/Rgvr2tnmeu5PEGeQbPKCm24KKdOEjxYJqSRpy8OS8Owp1qefH4gdqWPzBBbaViwhudnVT3ViVVx/DuhDC0FREiLyuSwDuVRRsuNnfQ5G/C7TzqtVeXpyaSwRXFbIQIUD+VzLzJsXi62Y3Xmld6kgIbO9r8IdZ4gAw4BJcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5X1PoIw7YoIr+WTgn+htCNN7/XX+2dy/IVtrhC+jqE=;
 b=Y73XQxiinjSw8CASpE3jCpCHtnk0nTriotZYMmf/bGqEDbhMPAo6a3vuXtEUy+sZRagyF8dcMpjZymthHM+lEOFNuxJMz3brqfOu0UEKjwCWiDSMocE/cwAXPouPIhLF6MoaonDhu+QnQjFSPc99fgP8qnOBzwhQ7adpgdlxMC6v/WgrET/chtFzb94mnuwKDZ03NFB9luJfztxISfsgEMce9umTthri5TKoWLIDZfwvn+XC0KunO/3rfNfQmvDHYN9tv6VD2mZ3M5ISXroL+1SG0dwEcdo6bLd/U8p+me+1PFiTmwyxzqt5JTY8lAygoL4xuhmZRzLmtWidt9sjSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5X1PoIw7YoIr+WTgn+htCNN7/XX+2dy/IVtrhC+jqE=;
 b=Anaq5B0js7TwhIPL638r8E2ETCp+4VvOW+5Jx9DSd4/B9a1ve41cSNHRDavx3IhNR+AlvCgkvhd3FfCCrrbZkts/Lo9egweFof3sXOGjeSJsvxiZB1bN0uzN00Y3boiv8o9MJXcivxI99S0YFmfNyTBDznbpGskb94wyfs4Kx6s=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB9354.jpnprd01.prod.outlook.com
 (2603:1096:400:196::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 13:01:46 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18%9]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 13:01:44 +0000
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
Thread-Index: AQHZLsourgLTvtmvK0W71iwTdWHd8a6tpGsAgACkryCAAI6eAIABBdTwgACH/oCAAEkPoA==
Date:   Thu, 26 Jan 2023 13:01:44 +0000
Message-ID: <TYBPR01MB5341A464477F3B7AB4A89B84D8CF9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdX92KMeON0xC9p17kiqWT7ksEBX_NyPiiQk0fLaucDZBA@mail.gmail.com>
 <TYBPR01MB5341B023178B4A10DE52B844D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdXXnu88Tn2ucuHZK=3G18v-nCfaTYpomchRXBu3bD7UuA@mail.gmail.com>
 <TYBPR01MB5341F8DC36EAD659209A2BDDD8CF9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdU6fWeQU=kPni5hfP5BC=MzpxSzNNf5ADe37qt1k6mnFw@mail.gmail.com>
In-Reply-To: <CAMuHMdU6fWeQU=kPni5hfP5BC=MzpxSzNNf5ADe37qt1k6mnFw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB9354:EE_
x-ms-office365-filtering-correlation-id: 123f1fb0-d775-4113-f398-08daff9d79a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sbvMzjBYzczRVHwUpFdSkp/GuuB5xvV/TsJeN0pQAf+QO+RGjFdpv3MjXBgQ0MNvoak4Y5Je+C5DajNKuL/HK+DV9SCWKZ9M4GqrH9CIIOuigWkm4zbZBKhhYBWj/TRI9YI/vl/W3yUywkLWiisKy+ft7Ehu1KNogITSZ22Q3arNuGF+grB/1pMXdmm9voQ8WkTkfJrbNMlK3woq6eM2N08+0jVEQl1VGSI5Ghx5Wi0syQltvu03VFSZZc73MhRk2qPGc6XoezOweKrpumjRdThHLznVo5wC4oZHROr5wrfj3Cu60N2bsHQpwULDasdzrxJcCIV0YvKm+La9MF2okuXPpWhGmBw72FsaXG3pCZL3LOKRVA2Piwvh9MtHuy3iCj/tRj/L+oSlXMeDOCcb158oqNt9hmeuOE90U1LTEFyMDV7Cp9HyZ9Jul6zHIzZMf85tHvGfvSbmh9r+p4f8VJeW9P3ODfP5aUXq8D62ahwy/ANTKN53h6EB3yKNeVfE5PxQh0FF7w7O7C0ct33jGQO7bgSgtagZHmU7foHykfsUUEtGA6Ej3c0uHLcls0+U4pzPrCKWV5QHfuSFvfbQz8kHKDdMhIC7yTemYXXn8avBOp9bn+sgJ6SCTn5sckjbR/aoqGn5j6lYwYjZS0KFV9gNww+bEpJCRDZsXg7oCL2kE8II3FYTAY5HAB6CMsEZnZu6NKPmxXTdL4UwFYCDGQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199018)(83380400001)(38070700005)(86362001)(55016003)(33656002)(38100700002)(122000001)(5660300002)(15650500001)(4326008)(41300700001)(6916009)(66556008)(66476007)(76116006)(66946007)(8676002)(66446008)(64756008)(316002)(8936002)(2906002)(52536014)(26005)(54906003)(9686003)(186003)(478600001)(71200400001)(7696005)(6506007)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2FGTlZMaTl5bkljS3JQWlRrYzU2UjRGTkdiM0c4OXlFN0NFZVM0bFRPdHh6?=
 =?utf-8?B?L1lpU0tCMXNJcGdteGd4c085aENUMElWQ2tDck9wVHBTYUpvdnJ4UkNzM0p4?=
 =?utf-8?B?Q3BDblBrdTlINU4xOHlacGVuYTZ1RVRGcHdBd0JGRkcxVUdHZGt2SXlmY1FC?=
 =?utf-8?B?T1VMZEJnL1hmbnh4VW84RHdHVDFScjFhdmpTSzNKMFpiOEhpclczT3FMbzVu?=
 =?utf-8?B?VUVQenRPRTZHNkpMYXVxM25ZZ0JId1p0ZUx2cWZ4b3RrN0s4ckhKcXlVM0Q0?=
 =?utf-8?B?U3I1ZERTQ0V5aXR2eW9TWVVzaEJBRTVkdy9aU1dnaXlCZ2ZkK3luL3Myd1RE?=
 =?utf-8?B?QmZYcXRtb0RvcjFrZkUrVTcxU1dkWllXc0EwdlBiaEtBMThwdnFzN1Y1REhz?=
 =?utf-8?B?UEI4K2tyN2tGTTd2dHJDZlV5UHAxdUxOaHZ6YUFRUm5KVkJ2SUVJaHpxbmk5?=
 =?utf-8?B?STFTLzJaWU1lTERLL3hJTU5rTXNpVUVBUnR0emZLZUd6dWVWZ3lFVDV3YmI5?=
 =?utf-8?B?VWdoZ3JRZ01YcnU3OWJVUkRQY2dSalRlWHdMNnlqVm1MMHZoaXMrREg4eUZV?=
 =?utf-8?B?TXZZS0xxQWVaQ0JEbEZpZUU1K3NQeFF4R29lSFZROU9jM0pvTGRjd29oZjdF?=
 =?utf-8?B?VnE5UzBGTDEwdENPdnIxWnlDUmYzMno4Z1RGNExoNTlTQW9sVFRndkd3cm8y?=
 =?utf-8?B?dWtyV2pTaXVRUzIzK1kvaVJqaDlDaU1ETXFOdjlHMXFuM0RObzd0K0VucEt5?=
 =?utf-8?B?YWx6aWxYR0xXdjNkRytOc0ROcVNuOTEva1A4YlczV2g3U3VMOEpIMDhhbFR6?=
 =?utf-8?B?OW1LaDMwN3cwZ0d5L0IrYTJ1amt2anYrQ09hMUdKbElncHdHaGpBOTViczUw?=
 =?utf-8?B?aEZxMjhyU3MwdGV2UXo0eEtieGVZOXBkcVFITW10QXZHUHlKV3VDc2FOTWNE?=
 =?utf-8?B?ZlN4ZWtNZ3o3MG8wQnBYOUU5ZVVSK1BlbTI3TTdKc3hIYko4d1Z3bTNJQ3dh?=
 =?utf-8?B?UWNwc0MxdXNtNjBOVThWcmY3Z3pOcFRaY3YrZENEcW0zcmZjWms5ODIzV2Ev?=
 =?utf-8?B?alREcDN6cit2ZVRoNkdGb2RXRGVzQkU2cDVPK0phL1BIckduQUh0YUNubVE4?=
 =?utf-8?B?eGc0Z2lZYWZsZTY2T3ltVC9sc3IxZXl2ajc3QVpVK3F4QjViSjBQbUM3eUdV?=
 =?utf-8?B?Y1VTSjJZRk9lYVk2UlNjTVpNNHpnMk42NXJDdEpGSFNlaStoTGtnZmNNNWdl?=
 =?utf-8?B?WHZ1Y0xQcEVjVGw5VWlJNDFBWWQ3WFI5dHo5ZkhnejYxM09GL2lPQ3hnSkNo?=
 =?utf-8?B?cExSZmFmSkFManlaRUJaL3ZRM3E5bkRoR3R4Y2d1OUNBRVpjVGR5SWd4RWd0?=
 =?utf-8?B?VjEza0RFd1B4UElWcnBPUGJiVXVTV21Ibk8yeSthU05ZTGdOS2s2MHpRUC9x?=
 =?utf-8?B?b0c3WjRwQmdRRkdzOGhQMWl3WW1ybmpSMXdIQ1BaQS9oWkgyeFFGNUFYV0s0?=
 =?utf-8?B?NWg3cCsrSHdDUzZyT2ZFbDk3UEpBdnBCRzc0eVNGSkVWclRnNlJUa1F3RFFQ?=
 =?utf-8?B?cVVBb2hiL3FubUNwLzRMbnF0cTc5RFUyWE9iKzJNWCtrTUpobktLSkc4WXFM?=
 =?utf-8?B?N0IxVGVicUpENnoyK2gxUFdLSDE3cWMwbHZZKzRUQlJiOWpETFVxc3VFdzdL?=
 =?utf-8?B?cjVYWFhlcjZ0ZHhYZ3BhRDJlQmZiNmhQRWpIN1IzalplMnM5WklmNmZyUG44?=
 =?utf-8?B?L3dLZzFMOHNPa3hIR2dQa1A0eWYrS1BGTlRTYmQ5T0lOY21HY05BMnM2c1Zw?=
 =?utf-8?B?YlV1cS9sWFhZcjdmZTZnMG5VeVBMcVBDN0YrVlB5azdzTWVxSW41Z2Z4UE1a?=
 =?utf-8?B?RHN2NmQ4RGJSa3g5MEs3WXhib08vS0RYOEZpblZTRkxjc1NuKzROZGU3c1hQ?=
 =?utf-8?B?Y0doTVdLeTkvL0Eydy8yNjViK0FtUE1WNGFtem9XZEtVYlZkQXBtVUxORHJE?=
 =?utf-8?B?c2x0bmFBVVVRZ210THFEdDBHa1lZMTRpZXFQWkNvZXp1eEc1ditNVEZUOUtX?=
 =?utf-8?B?TXFURWlwZU5jRm1NRjB4U1JiNXVtM3QrbTBCcFYrRlJhazVic2JHaXgrcTRr?=
 =?utf-8?B?cVhPQVk5RFU4SC9uV1VnMG80dCtJTmhPbERCN2YrY3UwWTJlcWtJUWdnZGUw?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 123f1fb0-d775-4113-f398-08daff9d79a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 13:01:44.1654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pYcuk3Zd+jy+6moK/l9pORZ/ssONEB0eKgFVM/ab/6WwFcfL1A1gvYpIwvb0pngSPEUWg8n+4gK337g/49m4QzGH2Ao47vA4hJQrzPTZ6P2D3DA1mvJKXHzaXWS7PLXw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9354
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgt
bTY4ay5vcmc+LCBTZW50OiBUaHVyc2RheSwgSmFudWFyeSAyNiwgMjAyMyA1OjM4IFBNDQo+IA0K
PiBPbiBUaHUsIEphbiAyNiwgMjAyMyBhdCAxOjU1IEFNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5
b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4sIFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAyNSwgMjAyMyA1OjU1IFBN
DQo+ID4gPiBPbiBXZWQsIEphbiAyNSwgMjAyMyBhdCAxOjQ5IEFNIFlvc2hpaGlybyBTaGltb2Rh
DQo+ID4gPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4g
PiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2RheSwgSmFudWFyeSAyNCwg
MjAyMyAxMTozNSBQTQ0KPiA+ID4gPiA+IE9uIE1vbiwgSmFuIDIzLCAyMDIzIGF0IDI6MzUgQU0g
WW9zaGloaXJvIFNoaW1vZGENCj4gPiA+ID4gPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNh
cy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gU2luY2UgUi1DYXIgR2VuNCBkb2Vucyd0IGhhdmUg
dGhlIG1haW4gSVBNTVUgSU1TU1RSIHJlZ2lzdGVyLCBidXQNCj4gPiA+ID4gPiA+IGVhY2ggY2Fj
aGUgSVBNTVUgaGFzIG93biBtb2R1bGUgaWQuIFNvLCB1cGRhdGUgZGVzY3JpcHRpb25zIG9mDQo+
ID4gPiA+ID4gPiByZW5lc2FzLGlwbW11LW1haW4gcHJvcGVydHkgZm9yIFItQ2FyIEdlbjQuDQo+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEg
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+ID4gPiA+IC0t
LQ0KPiA+ID4gPiA+ID4gIFRoZSBvbGQgUi1DYXIgUzQtOCBkYXRhc2hlZXQgaGFkIGRlc2NyaWJl
ZCBJUE1NVSBJTVNTVFIgcmVnaXN0ZXIsIGJ1dA0KPiA+ID4gPiA+ID4gIHRoZSBsYXRlc3QgZGF0
YXNoZWV0IHVuZG9jdW1lbnRlZCB0aGUgcmVnaXN0ZXIuIFNvLCB1cGRhdGUgdGhlIHByb3BldGll
cw0KPiA+ID4gPiA+ID4gIGRlc2NyaXB0aW9uLiBOb3RlIHRoYXQgdGhlIHNlY29uZCBhcmd1bWVu
dCBpcyBub3QgdXNlZCBvbiB0aGUgZHJpdmVyLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gRFQgZGVz
Y3JpYmVzIGhhcmR3YXJlLCBub3Qgc29mdHdhcmUgcG9saWN5Lg0KPiA+ID4gPg0KPiA+ID4gPiBJ
IHRoaW5rIHNvLg0KPiA+ID4gPg0KPiA+ID4gPiA+ID4gIFNvIG5vIGJlaGF2aW9yIGNoYW5nZS4N
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNvIHdoZXJlIGRvIHdlIGdldCB0aGUgbW9kdWxlIGlkIG51
bWJlcnMgdG8gdXNlLCBpZiB0aGV5IGFyZSBubyBsb25nZXINCj4gPiA+ID4gPiBkb2N1bWVudGVk
IGluIHRoZSBIYXJkd2FyZSBNYW51YWw/DQo+ID4gPiA+DQo+ID4gPiA+IElmIHNvLCB3ZSBjYW5u
b3QgZ2V0IHRoZSBtb2R1bGUgaWQgbnVtYmVycy4gU28sIHNob3VsZCB3ZSB1c2Ugb3RoZXINCj4g
PiA+ID4gaW5mb3JtYXRpb24gd2hpY2ggaXMgY29tcGxldGVseSBmaXhlZCBpbnN0ZWFkPyBJIGhh
dmUgc29tZSBpZGVhczoNCj4gPiA+ID4gMSkgSnVzdCAwIChvciBvdGhlciBmaXhlZCB2YWx1ZSkg
aWYgdGhlIElNU1NUUiByZWdpc3RlciBkb2Vzbid0IGV4aXN0Lg0KPiA+ID4gPiAyKSBTZXF1ZW50
aWFsIG51bWJlcnMgZnJvbSByZWdpc3RlciBiYXNlIG9mZnNldC4NCj4gPiA+ID4gICAgSW4gUi1D
YXIgUzQ6IGlwbW11X3J0MCBpcyB0aGUgZmlyc3Qgbm9kZSBmcm9tIHJlZ2lzdGVyIGJhc2Ugb2Zm
c2V0LA0KPiA+ID4gPiAgICBhbmQgaXBtbXVfcnQxIGlzIHRoZSBzZWNvbmQgb25lLg0KPiA+ID4g
PiAgICBTbywgaXBtbXVfcnQwIGlzIDAsIGlwbW11X3J0MSBpcyAxLCBpcG1tdV9kczAgaXMgMiBh
bmQgaXBtbXVfaGMgaXMgMy4NCj4gPiA+ID4gMykgVXNpbmcgYmFzZSBhZGRyZXNzIHVwcGVyIDE2
LWJpdHMuDQo+ID4gPiA+ICAgIEluIFItQ2FyIFM0OiBpcG1tdV9ydDAgaXMgMHhlZTQ4MDAwMC4g
U28sIHRoZSB2YWx1ZSBpcyAweGVlNDguDQo+ID4gPiA+DQo+ID4gPiA+IFBlcmhhcHMsIHRoZSBv
cHRpb24gMSkgaXMgcmVhc29uYWJsZSwgSSB0aGluay4gQnV0LCB3aGF0IGRvIHlvdSB0aGluaz8N
Cj4gPiA+DQo+ID4gPiBJIHdvdWxkIG5vdCBtYWtlIHVwIG51bWJlcnMsIGFzIHRoYXQgd291bGQg
Y2F1c2UgY29uZnVzaW9uIHdpdGggU29Dcw0KPiA+ID4gd2hlcmUgdGhlIG51bWJlcnMgZG8gbWF0
Y2ggdGhlIGhhcmR3YXJlLg0KPiA+DQo+ID4gSSBzZWUuDQo+ID4NCj4gPiA+IEFzIHRoZSBkcml2
ZXIgZG9lc24ndCB1c2UgdGhlIG1vZHVsZSBpZCBudW1iZXIgKGl0IGFscmVhZHkgbG9vcHMNCj4g
PiA+IG92ZXIgYWxsIGRvbWFpbnMsIGluc3RlYWQgb2YgY2hlY2tpbmcgSU1TU1RSLCBwcm9iYWJs
eSBiZWNhdXNlIG9mDQo+ID4gPiBoaXN0b3JpY2FsIChSLUNhciBHZW4yKSByZWFzb25zPyksIHdo
YXQgYWJvdXQgZHJvcHBpbmcgaXQgZnJvbSB0aGUNCj4gPiA+IHByb3BlcnR5PyBJLmUuIGFkZCAi
bWluSXRlbXM6IDEiLCBwb3NzaWJseSBvbmx5IHdoZW4gY29tcGF0aWJsZSB3aXRoDQo+ID4gPiBy
ZW5lc2FzLHJjYXItZ2VuNC1pcG1tdS12bXNhPw0KPiA+DQo+ID4gSXQgbG9va3MgYSBnb29kIGlk
ZWEgdG8gbWUuDQo+ID4NCj4gPiA+IEJUVywgdGhlIHJlbGF0ZWQgSU1DVFIgcmVnaXN0ZXIgaXMg
c3RpbGwgZG9jdW1lbnRlZCwgYW5kIHRoZSBkcml2ZXINCj4gPiA+IGRvZXMgZW5hYmxlIHRoZSBp
bnRlcnJ1cHQgYml0IChJTUNUUl9JTlRFTiksIHNvIEknbSB3b25kZXJpbmcgaG93IHRoZQ0KPiA+
ID4gaGFyZHdhcmUgKGRvY3VtZW50YXRpb24pIHBlb3BsZSBpbnRlbmQgdGhpcyB0byBiZSB1c2Vk
Li4uDQo+ID4gPiBQZXJoYXBzIElNQ1RSX0lOVEVOIHdpbGwgYmUgcmVtb3ZlZC91bmRvY3VtZW50
ZWQsIHRvbz8NCj4gPiA+IE9yIHBlcmhhcHMgdGhlIHJlbW92YWwvdW5kb2N1bWVudGF0aW9uIG9m
IElNU1NUUiB3YXMgYSBtaXN0YWtlPw0KPiA+DQo+ID4gSSBkb24ndCB0aGluayB0aGF0IElNQ1RS
X0lOVEVOIHdpbGwgYmUgcmVtb3ZlZC91bmRvY3VtZW50ZWQgdG9vIGJlY2F1c2UNCj4gPiB0aGUg
SU1DVFIgcmVnaXN0ZXIgaXMgcmVsYXRlZCB0byBJTVNUUiByZWdpc3Rlciwgbm90IElNU1NUUiBy
ZWdpc3RlciA7KQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+ICAg
ICAgICAgICAgICAgfn5+fn5+DQo+ID4gQWJvdXQgdW5kb2N1bWVudGF0aW9uIG9mIElNU1NUUiwg
SSBmb3VuZCB0aGF0IGFjY2Vzc2luZyB0aGUgcmVnaXN0ZXIgaXMNCj4gPiBwb3NzaWJsZSB0byBj
YXVzZSBhIHBvdGVudGlhbCBpc3N1ZSBvbiBib3RoIFItQ2FyIEdlbjMvNC4gVGhhdCdzIHdoeQ0K
PiA+IHRoZSBJTVNTVFIgcmVnaXN0ZXIgaXMgdW5kb2N1bWVudGVkIG9uIFItQ2FyIEdlbjQuIEkn
bSBub3Qgc3VyZSB3aGV0aGVyDQo+ID4gUi1DYXIgR2VuMyB3aWxsIGJlIHVuZG9jdW1lbnRlZCB0
b28gaW4gdGhlIGZ1dHVyZSB0aG91Z2gsIGJ1dCBhdCBsZWFzdCwNCj4gPiB3ZSBzaG91bGQgbm90
IGFjY2VzcyB0aGUgSU1TU1RSIHJlZ2lzdGVyIG9uIGJvdGggUi1DYXIgR2VuMy9HZW40Lg0KPiA+
ICMgSSdtIG5vdCBzdXJlLCBidXQgdGhhdCdzIHdoeSB0aGUgZHJpdmVyIGRvZXNuJ3QgY2hlY2sg
SU1TU1RSIHRvIGF2b2lkDQo+ID4gIyB0aGUgcG90ZW50aWFsIGlzc3VlPz8NCj4gDQo+IElDDQo+
IA0KPiA+IFNvLCB0byBzaW1wbGlmeSB0aGUgZHQtYmluZGluZ3MsIGp1c3QgcmVtb3ZpbmcgdGhl
IHNlY29uZCBwcm9wZXJ0eSB3aXRob3V0DQo+ID4gYW55IGNvbmRpdGlvbiBpcyBiZXR0ZXIsIEkg
dGhpbmsuIEJ1dCwgd2hhdCBkbyB5b3UgdGhpbms/DQo+IA0KPiBTbyBqdXN0IGFkZCAibWluSXRl
bXM6IDEiLCBhbmQgbGVhdmUgb3V0IHRoZSBzZWNvbmQgdmFsdWUgb2YgdGhlDQo+ICJyZW5lc2Fz
LGlwbW11LW1haW4iIHByb3BlcnR5IHdoZW4gYWRkaW5nIHN1cHBvcnQgZm9yIG5ldyBTb0NzLg0K
PiBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGFuIGltbWVkaWF0ZSBuZWVkIHRvIHJlbW92ZSB0aGUg
ZXhpc3Rpbmcgc2Vjb25kDQo+IHZhbHVlIG9uIGFscmVhZHkgc3VwcG9ydGVkIFNvQ3MsIGFzIHRo
ZXNlIHZhbHVlcyBhcmUgbm90IGluY29ycmVjdA0KPiBoYXJkd2FyZSBkZXNjcmlwdGlvbi4NCg0K
VGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnQhIEkgdW5kZXJzdG9vZCBpdC4NClNvLCBJJ2xsIHN1
Ym1pdCBzdWNoIGEgcGF0Y2ggYXMgdjIgdG9tb3Jyb3cuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hp
aGlybyBTaGltb2RhDQoNCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJl
J3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiAN
Cj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2Fs
bCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg0K
