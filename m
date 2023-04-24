Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91EEF6EC468
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Apr 2023 06:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjDXEgL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Apr 2023 00:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjDXEgK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2023 00:36:10 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10276271E
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Apr 2023 21:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V56cDTwe04k4YD2ZVmqwT4r5whfPd2IQj8+KufVmGf7wJKC1so5qEfBZM5+VVbV6ogXNpAegfMXf/jbbRFOQbLSZEkYbkptytDnKv4wx2kNdS2hHmOO+Uy56JWcC5herlVFUWJ108nWH8o7wwGnp2Qqa1NXOp93tGNur7vZ2IZvUHVQSpvMauP5ghIBAkzOsVp5q5YsxnhYoyyTye1W5c7EHp1PUX9pOTir/lyW79EWklAVRWGLNr5pBCLK4kpNNwe6DoBw4yF5Po3KPKbMrz/yLfEXw6RLprDGRTNhqBrJALci9wldd2EhLvzTWYFK/7UJocdfAwTQrIsVEmxMJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5gllRac78XGFXBvounyuC0tkIZln71AX31s0MTzYlc=;
 b=ImABgOzAWlL+gkjZI7pWCvNUpHMNtaCCIbRAnMcJoi51pWLKyPMHcKSG6CNCYhXGv62uirtrurJlSzGy0xFZQygWJrTqUs5hdHokeb7nnN6Gxw8kL6vbLOQ1ftWYoyRpKE8XQ0uV6wm76rz9ZdcSTuxFzHexlywUM1uFnOm7sQRULG6WcG3eRl4MCD9m66vfmwHNmQdhJL7vUkq0dpr0xt0LnO2yAdnukT5UsmJlqhroKu266V1vsCke4Mt8UgwVq7iLx5Tjq0IArKoFNXCPfOE2AcPdUwfbPEaIqm1NRip9oWYoyjbuN4VekXRLzidicdQtl3LsrEzXS8iA/XmTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5gllRac78XGFXBvounyuC0tkIZln71AX31s0MTzYlc=;
 b=F89KY8tSTdQanN0D1u03hBN3TsqSv90WH0JnNXBDInQkYuVKly/++qTUsq/LbHVPVVAUnvN9zYvc6/Oz/GuxMag+9OPlAUvxAt2d+ZBWa07y/JXoPbjedFHXJnqaly0MkhS9ZMGRLH9oJUGHPcSWCqpdv/eHuWDQr6UlswOgqF0=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS0PR01MB5316.jpnprd01.prod.outlook.com
 (2603:1096:604:a3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 04:36:05 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003%5]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 04:36:05 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Robin Murphy <robin.murphy@arm.com>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>
CC:     "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] iommu/ipmmu-vmsa: Allow PCIe devices
Thread-Topic: [PATCH] iommu/ipmmu-vmsa: Allow PCIe devices
Thread-Index: AQHZdExosVjFx/ENmkO7bQMGPrzvqa81yLmAgAP6fgA=
Date:   Mon, 24 Apr 2023 04:36:05 +0000
Message-ID: <TYBPR01MB5341FFAAD32BD11E3A9215F5D8679@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230421122538.3389336-1-yoshihiro.shimoda.uh@renesas.com>
 <c972e852-7630-5843-fabe-59664361df87@arm.com>
In-Reply-To: <c972e852-7630-5843-fabe-59664361df87@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS0PR01MB5316:EE_
x-ms-office365-filtering-correlation-id: f2343d08-87ce-4334-8905-08db447d6ae0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bJ7U9+9Isqv04zrNQ9KX38CwKZGt0Ho21aqXPnFk962gWhwCOypSLkQ7OItbJxH/Pq5bha7YCYpib9vDUR+sU9ziFtphjhBeeNLdsY20W6/8rElbPJjhxcqdDUDKTIhriv8+3sLzQ9dDizTGWRQOvcwyLNh2ZhWdC5A33owMTE+XeTl3+GhBdqnct4rmYFlb+AezTgTlqx3KdAN+Rp8j4ovmpt7PtiyDGzDNqDUyerefHtQatEygC5fL170rRaf9IXbhI6T3jk+sv9Z6ccn4BhtQcTAoi2ZiJ+UIGu2UoXIWbIcoOCdssvOD4N57sYPW1FBrfMEQ9KmF3ljfXsRvPR8jzg1M6sK2V4EngikHT2HGsaDvMqEYV4d0F6vmj40fZaLzXjTa4E+1953f+MohcKwAgjEqYm/aYJLOZUmUi8opvkuH5PMUQJFU3MPqBbCXdFWvEXJ8yqa3hDe3d2s+3vA6+lBOdEtcvdCB/RRRGOcpcoR1l75FKSlU5JxVPXQOceCdlb/S233NBnxzgejPhGRnGilk8w3jfA1iz40YoIlyt+A+grhD4i7eql0P/YLIYmqvgkvLbXyvWxp+nXejF2tsPdYgJP7Nxfg/1hVLoixSdtqfOwVTPbbYhuLBidJ1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199021)(38100700002)(122000001)(6506007)(9686003)(53546011)(55016003)(186003)(83380400001)(33656002)(2906002)(8676002)(8936002)(52536014)(5660300002)(54906003)(478600001)(7696005)(71200400001)(38070700005)(110136005)(316002)(4326008)(41300700001)(64756008)(66446008)(66556008)(66946007)(76116006)(86362001)(66476007)(66899021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTJCaXV3V2JPRXo4Qm03czhBaGJCSTJtZEVIUmFoc25vdUlXSUJzK1ovb2pF?=
 =?utf-8?B?SHFvMlQ4VXZsZE12R2RlTHNpTTlNY2RMRzJpREczUUs1OHJkR0JyU1N3eXp5?=
 =?utf-8?B?VUkwSHR2dDdlNTBJR25FSHlpUFVEdmRVZ0NQUUZwUktuSUE1c3BoemxHWENt?=
 =?utf-8?B?K1ZlRHF1OFIxZ2FZME03SjRVSDBJK0hMb2ZwMVBxMG1PUEFlekpCZmlpME1K?=
 =?utf-8?B?WTNwdXkvdnFrdVFKZTY3MXZ3clVKeXdLamxBOXFndXJDRUxBdmlLZGdMTXZt?=
 =?utf-8?B?WEd6cTZXdHJMZXM1RnoyYVpZZ3RKUStLb1c3ZWwxcWl0WnNNZ1VHbDhUREQw?=
 =?utf-8?B?c2hTUGh2ejFxWWxKNmFZdEJ0VCsrc2VvUGtzdngvQ05FWm1ITUZvcG5lNEJ3?=
 =?utf-8?B?a0dZdFN4aThUL3dudGFtN1MxOVYzVDN4VkszT0EyV1k3N0RUWVZ5YjdDcXZj?=
 =?utf-8?B?WVY0YkgvbHdVMlFsdEk5UEQ0T0U4aENISUtaUjhZUFdFNnhJRDV3T3EyZ1B5?=
 =?utf-8?B?N1QyaGgxa3l2KzdENjdBdkovVkgyQS9SRkNodDN1NEpEWEEzWUs1S0FHcHdu?=
 =?utf-8?B?MC84d0Z3elhrT2Q0aG93L2M3YjRJVXlxVndOZGtXT1pGTGZaUGlCWWdtV1RJ?=
 =?utf-8?B?MEszTTdMaTN4UDJWR2dnbEZOTGQrLzd2cjdmbGhIZjVpb1ZtSzM4NmdoZjBu?=
 =?utf-8?B?SGlzVDNUOFlhbHRIcjgyY0J1cjhvWitaRDFVMGV3VkUzdnphMEVzcVZsRG9x?=
 =?utf-8?B?V3IvTllEUHVZeGFpdVJxV2VuOWF5c0ZwcHB5VmJMRTgxR0kzWDRrWElqMTBx?=
 =?utf-8?B?anlYdTVqMGJpMVlSNnlwbStML2IzbHh6K1FETmEzdC9paExyVG1CQjlJc2Yv?=
 =?utf-8?B?b3dCMWdmbnUzcjRybGMySzZ4Z3VJRm55RlpnYUxDai9PZGJVelBrUGtYRGpR?=
 =?utf-8?B?cU8raVRLbXljZGp3NU1vaVlSY3NsNzJBUUtOdW1maCtDZWt1M3dCc3dLcjdV?=
 =?utf-8?B?eXRzQndHdS9RU2tNTWtjK0ljcVB5RE5wMEVySHpsbEQ0SzVna0dmZWxTRnBH?=
 =?utf-8?B?R09VcUVSejhjVXg2aVJibk02NzZFU1dyWTcwdUNvb0wydEt2bVFhYzhiZXVR?=
 =?utf-8?B?UnR5bjI0VUZsU0VIOGNGc1FncUJYWk4wTXMwcmFCaGJUbGFQaytDb2ovTVV4?=
 =?utf-8?B?YW54bXJjelFvUkFaNEltUVczazdNamlZY0JBZXY1VWJvOHZ3OWdCeE8xM3Vt?=
 =?utf-8?B?RURObEEvR2IxMDBZNXArNHAzSGUrNFlObm5BaHRiSklwTkhHeHNYYkFhc0dt?=
 =?utf-8?B?L2JDUExzT2N0OWhFWWkycTk4bjg0NERNSjRUV1FybTVZbFdNWENxZEU4Vk9P?=
 =?utf-8?B?M0xCa3RyaGFRVENQYVU4UzdBdnBWS1B4dVVld0VONC9OUkdtNFJKTEllMS9G?=
 =?utf-8?B?RDI2UGN3bU94bzRnZDlOUkE3dk5uVGtsMmxLRVZpNlhidHJuMXVhWXpZUlR4?=
 =?utf-8?B?WTVFV1pSRlRqSWN5VnlaWDFsV2RBcnJWYUFtUU9jZzJzQzhzQTE2WVc0cUhV?=
 =?utf-8?B?U240NVVwVS9HU3gzNnRSOUNycHFhdGJXQWt0K0NDZWNZMTI2elRmMzVSWWJC?=
 =?utf-8?B?c1oxNXFEelZtUTF3allKVUJQRVdtZTZmOVBrZ21ZS082aGVNSVhOcDBKcFkv?=
 =?utf-8?B?b1VnRTBWWkFRcEFmaURRUnluZEE3NHZ6WVlIQWJFdzk4MG5YbjJ2M3E5Tmdw?=
 =?utf-8?B?bG9Vekkvbkk1dzQ2YUFsVGpvMEI4VHc1SFVPbVozQ0Uvd3pFWWQ4eUVKTTBi?=
 =?utf-8?B?WE11WUhOaDNlZ24wbldic2VjV2pjcWZEb01NNkdjL0pWcVlDUFZzb1Z3MTBx?=
 =?utf-8?B?cC83N1lwQUJxSWNLOEEvc2FWQVhXdWw5WHM4dkR3UmJvd3lSQStWdUdic1Vt?=
 =?utf-8?B?S1Rxdlh5dTd5Y3RVM2Fzc3NoUkN5cDU0RU9GU0NrZk5FSGhKWVR5ZEVxbGNK?=
 =?utf-8?B?TXdyOW41K1Y5OUova0lrREVMSGlOdlFCcXlvb3U5OFVUNTBkV1NhZGE0b2VP?=
 =?utf-8?B?YldGVllUSm4xVVRaUDZaL3hCUlFSZWpQT0oyakhUb0k0dzByRGJva2VoRnFI?=
 =?utf-8?B?SVJWZk83Z2F4OEp2bHZZL0k3ZWhUa091WWtCMy8yUWpPMnNWT3R5eW8yaWJJ?=
 =?utf-8?B?Tzlwb3JYSlE1a2Y5cFM4K3RuWFdvRzhhNVFXWmdQRkpWWTRBMUVPbWdHV1E0?=
 =?utf-8?B?aU1KY201MVZsZlVBdFdNYWR3NUJ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2343d08-87ce-4334-8905-08db447d6ae0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 04:36:05.7301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qpH3Joic6VlQA5CuAgvaVX3+vdoix+BkrYU9Ob5D2nTRlpn5jlVy/xTDkqX8l5uHGjZVFbMrhkDHkOjwiZRcpRIJmGhsY5iubtOPzxDvRAGJ1tDg0qhmMCH/P+9tKFnV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5316
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUm9iaW4sDQoNCj4gRnJvbTogUm9iaW4gTXVycGh5LCBTZW50OiBGcmlkYXksIEFwcmlsIDIx
LCAyMDIzIDEwOjU0IFBNDQo+IE9uIDIwMjMtMDQtMjEgMTM6MjUsIFlvc2hpaGlybyBTaGltb2Rh
IHdyb3RlOg0KPiA+IEFkZCBQQ0llIGRldmljZXMgb2YgUi1DYXIgR2VuMy80IGludG8gZGV2aWNl
c19hbGxvd2xpc3QuIEZvciBhIFBDSQ0KPiA+IGRldmljZSwgaXBtbXVfYXR0YWNoX2RldmljZSgp
IGhhcyB0byBhdm9pZCBlbmFibGluZyB1VExCIGJlY2F1c2UNCj4gPiB0aGUgdVRMQiBoYXMgYWxy
ZWFkeSBiZWVuIGVuYWJsZWQgYnkgdGhlIHBhcmVudCBkZXZpY2UuIE90aGVyd2lzZSwNCj4gPiBl
bmFibGUgYSB3cm9uZyB1VExCIElELiBBbHNvIGlwbW11X2RldmljZV9pc19hbGxvd2VkKCkgaGFz
IHRvDQo+ID4gY2hlY2sgd2hldGhlciB0aGUgcGFyZW50IGRldmljZSBpcyB0aGUgUENJZSBob3N0
IGNvbnRyb2xsZXIgb3Igbm90LA0KPiA+IHRvIHVzZSB0aGUgSU9NTVUncyBkbWFfb3BzIGZyb20g
YSBQQ0kgZGV2aWNlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEg
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVy
cy9pb21tdS9pcG1tdS12bXNhLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKy0NCj4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9pcG1tdS12bXNhLmMgYi9kcml2ZXJzL2lvbW11L2lw
bW11LXZtc2EuYw0KPiA+IGluZGV4IDlmNjRjNWM5ZjViOS4uYzYzNWM5YjE5MmY0IDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvaW9tbXUvaXBtbXUtdm1zYS5jDQo+ID4gKysrIGIvZHJpdmVycy9p
b21tdS9pcG1tdS12bXNhLmMNCj4gPiBAQCAtMTksNiArMTksNyBAQA0KPiA+ICAgI2luY2x1ZGUg
PGxpbnV4L29mLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+DQo+ID4gICAj
aW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3BjaS5o
Pg0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiA+ICAgI2luY2x1
ZGUgPGxpbnV4L3NpemVzLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiA+IEBA
IC02MjQsNiArNjI1LDEwIEBAIHN0YXRpYyBpbnQgaXBtbXVfYXR0YWNoX2RldmljZShzdHJ1Y3Qg
aW9tbXVfZG9tYWluICppb19kb21haW4sDQo+ID4gICAJaWYgKHJldCA8IDApDQo+ID4gICAJCXJl
dHVybiByZXQ7DQo+ID4NCj4gPiArCS8qIEF2b2lkIHRvIGVuYWJsZSB1dGxiIGlmIHRoaXMgaXMg
YSBQQ0kgZGV2aWNlICovDQo+ID4gKwlpZiAoZGV2X2lzX3BjaShkZXYpKQ0KPiA+ICsJCXJldHVy
biAwOw0KPiANCj4gQWRkcmVzc2luZyB0aGF0ICJUT0RPOiBSZWZlcmVuY2UtY291bnQgdGhlIG1p
Y3JvVExCLi4uIiBjb21tZW50IGluc3RlYWQNCj4gd291bGQgYmUgZXZlbiBuaWNlciA6KQ0KDQpJ
IHNlZS4gSG93ZXZlciwgSSBpbnRlbmRlZCB0byBhdm9pZCB0byBlbmFibGUgdXRsYiB3aXRoIHVu
ZXhwZWN0ZWQgSUQgZnJvbSBSSUQuDQpBbHNvLCBhcyB5b3UgbWVudGlvbmVkIGFib3V0ICJpb21t
dXMiIHByb3BlcnR5IGJlbG93LCBub3cgSSB1bmRlcnN0b29kIEkgc2hvdWxkDQpub3Qgc2V0ICJp
b21tdXMiIHByb3BlcnR5IHRvIHRoZSBQQ0llIHJvb3QgZGV2aWNlLiBJIHJlYWxpemVkIHRoYXQg
dGhlIFJJRCBpcw0KYWx3YXlzIHRoZSBzYW1lIHdpdGggIm91dCBpZCIgaWYgImlvbW11LW1hcC1t
YXNrIiBwcm9wZXJ0eSBpcyAwIGxpa2UganVuby1iYXNlLmR0c2kuDQpTbywgSSdsbCBkcm9wIHRo
aXMgY29uZGl0aW9uIG9uIHYyLg0KDQo+ID4gKw0KPiA+ICAgCWZvciAoaSA9IDA7IGkgPCBmd3Nw
ZWMtPm51bV9pZHM7ICsraSkNCj4gPiAgIAkJaXBtbXVfdXRsYl9lbmFibGUoZG9tYWluLCBmd3Nw
ZWMtPmlkc1tpXSk7DQo+ID4NCj4gPiBAQCAtNzAyLDEwICs3MDcsMTQgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzb2NfZGV2aWNlX2F0dHJpYnV0ZSBzb2NfZGVueWxpc3RbXSA9IHsNCj4gPiAgIH07
DQo+ID4NCj4gPiAgIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgZGV2aWNlc19hbGxvd2xpc3Rb
XSA9IHsNCj4gPiArCSJlNjVkMDAwMC5wY2llIiwJLyogUi1DYXIgR2VuNCAqLw0KPiA+ICsJImU2
NWQ4MDAwLnBjaWUiLAkvKiBSLUNhciBHZW40ICovDQo+ID4gICAJImVlMTAwMDAwLm1tYyIsDQo+
ID4gICAJImVlMTIwMDAwLm1tYyIsDQo+ID4gICAJImVlMTQwMDAwLm1tYyIsDQo+ID4gLQkiZWUx
NjAwMDAubW1jIg0KPiA+ICsJImVlMTYwMDAwLm1tYyIsDQo+ID4gKwkiZWU4MDAwMDAucGNpZSIs
CS8qIFItQ2FyIEdlbjMgKi8NCj4gPiArCSJmZTAwMDAwMC5wY2llIiwJLyogUi1DYXIgR2VuMyAq
Lw0KPiANCj4gVGhpcyB3b3VsZCBzZWVtIHRvIGltcGx5IHRoYXQgeW91IGhhdmUgbm90IG9ubHkg
YW4gImlvbW11LW1hcCIgcHJvcGVydHkNCj4gcmVwcmVzZW50aW5nIHRoZSBQQ0kgZGV2aWNlcywg
YnV0IGFsc28gYW4gImlvbW11cyIgcHJvcGVydHkgcmVwcmVzZW50aW5nDQo+IHRoYXQgdGhlIFNv
QyBzaWRlIG9mIHRoZSByb290IGNvbXBsZXggaGFzIGl0cyBvd24gRE1BIHBhdGggdG8gYW4gSU9N
TVUsDQo+IGRpc3RpbmN0IGZyb20gdGhlIHRyYWZmaWMgY29taW5nIG92ZXIgdGhlIFBDSSBicmlk
Z2UuIFRoYXQgY2FuDQo+IG9jY2FzaW9uYWxseSBiZSB0cnVlIChlLmcuIGlmIHRoZSByb290IGNv
bXBsZXggSVAgaW5jbHVkZXMgYSBzdGFuZGFsb25lDQo+IERNQSBlbmdpbmUpLCBidXQgbW9yZSBv
ZnRlbiBpdCdzIGp1c3QgYSBtaXN0YWtlLg0KDQpUaGFuayB5b3UgZm9yIHRoZSBleHBsYW5hdGlv
bi4gSSB1bmRlcnN0b29kIGl0LiBTbywgSSdsbCBkcm9wIHRoZW0gb24gdjIuDQoNCj4gPiAgIH07
DQo+ID4NCj4gPiAgIHN0YXRpYyBib29sIGlwbW11X2RldmljZV9pc19hbGxvd2VkKHN0cnVjdCBk
ZXZpY2UgKmRldikNCj4gPiBAQCAtNzIzLDEyICs3MzIsMjIgQEAgc3RhdGljIGJvb2wgaXBtbXVf
ZGV2aWNlX2lzX2FsbG93ZWQoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICAgCWlmIChzb2NfZGV2
aWNlX21hdGNoKHNvY19kZW55bGlzdCkpDQo+ID4gICAJCXJldHVybiBmYWxzZTsNCj4gPg0KPiA+
ICtyZXRyeToNCj4gPiAgIAkvKiBDaGVjayB3aGV0aGVyIHRoaXMgZGV2aWNlIGNhbiB3b3JrIHdp
dGggdGhlIElQTU1VICovDQo+ID4gICAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZGV2aWNl
c19hbGxvd2xpc3QpOyBpKyspIHsNCj4gPiAgIAkJaWYgKCFzdHJjbXAoZGV2X25hbWUoZGV2KSwg
ZGV2aWNlc19hbGxvd2xpc3RbaV0pKQ0KPiA+ICAgCQkJcmV0dXJuIHRydWU7DQo+ID4gICAJfQ0K
PiA+DQo+ID4gKwkvKg0KPiA+ICsJICogQ2hlY2sgd2hldGhlciB0aGlzIGRldmljZSBoYXMgdGhl
IHBhcmVudCBkZXZpY2UgbGlrZSBhIFBDSSBkZXZpY2UNCj4gPiArCSAqIGV4Y2VwdCAic29jIi4N
Cj4gPiArCSAqLw0KPiA+ICsJaWYgKGRldi0+cGFyZW50ICYmIHN0cmNtcChkZXZfbmFtZShkZXYt
PnBhcmVudCksICJzb2MiKSkgew0KPiA+ICsJCWRldiA9IGRldi0+cGFyZW50Ow0KPiA+ICsJCWdv
dG8gcmV0cnk7DQo+ID4gKwl9DQo+IA0KPiBUaGlzIGlzIHRoZSBwbGFjZSB3aGVyZSBhIHNpbXBs
ZSBkZXZfaXNfcGNpKCkgY2hlY2sgd291bGQgc2VlbSBpZGVhbC4NCg0KSSB0aGluayBzby4gU28s
IEknbGwgdXNlIGRldl9pc19wY2koKSBhbmQgY2hhbmdlIHRoZSB0aW1pbmcgb2YgdGhlIGNvbmRp
dGlvbg0KZnJvbSBoZXJlIHRvIHRoZSAicmV0cnkiIGxvY2F0aW9uIG9uIHYyLg0KDQpCZXN0IHJl
Z2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IFRoYW5rcywNCj4gUm9iaW4uDQo+IA0KPiA+
ICsNCj4gPiAgIAkvKiBPdGhlcndpc2UsIGRvIG5vdCBhbGxvdyB1c2Ugb2YgSVBNTVUgKi8NCj4g
PiAgIAlyZXR1cm4gZmFsc2U7DQo+ID4gICB9DQo=
