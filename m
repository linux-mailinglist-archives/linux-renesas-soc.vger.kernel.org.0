Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91ECB3B26C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 07:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhFXFad (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 01:30:33 -0400
Received: from mail-eopbgr1410125.outbound.protection.outlook.com ([40.107.141.125]:9024
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230116AbhFXFaR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 01:30:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8RJbLgeuah7Yi5yOxvLu4fFMztG40F58UPAzyZP6F1CVgeaPLon1RjTlYWYWYkg2zknZhRZqq3zbkf8Bo48CuGDGZu1VQAFocKpe9rY2e841hoOjwo0xG5rZCGt9Ed6QTgptXjqfAvVMc8HOQDQO8cB38KaRhcKYtRsbuut6SvZIxZemsEc5gN5IlaV7ZI3tHbqQzcM54Pe/7p/tiM1OVp7TD8DBnabo1Cbrp+I4uQqwtXY/9A+tsejnfJAH3g9Mn5ysoWXsjjPVQwknnSHeGYksJ66HuRgVGEwm5XBef/ITZYZZANXRk5dYpVRRPCjCCoy2UeO8ojhM0WTxP5Tsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1r3JlzZBaHuscLaEmnfoSZ+B4ZKOr6NX9Rx4M6F+nY=;
 b=crbgWkUz6ijZysdsocuerlhaDkerbcNwnMCr59h72aBZ9EF7YaoyZAKwiuV+0/ZMjHGWx8YQ4m6a458GTvPUq8VwIvePNGoR1SR6We4eQX3bWDNXKqyTUiNGzNiL1x32zXYaLwtoudMIj004uSpbhGhSWtCPfBoMDYVH3GZwngD6VaA54pDIM6DEVcnVAYsZFfuJQDHBkrpcoJk7oC77jvpuUBuAn4LM4BP9sQYx9dS1sJgjWdD6hy8Co72boN5aUAUowp1+z8Tc/mTiovlOHKAe6iXe9JwGDZVm9ejboCYsm/NDzrVSZa81EN9OiP4um9AVV0sE4mP+ovbQjhjkUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1r3JlzZBaHuscLaEmnfoSZ+B4ZKOr6NX9Rx4M6F+nY=;
 b=hwkBX0tdhnv/rR0oqWoCdRIbJhD30fleJnU5LOgLJP7abdZ8hl0YAJhenTonRLnLrmmDzHCNBJJf5g830YT+RC5HSlcdQvvFTdsDbzaf4Xr//zUdKZH9Pms7Hh1TZVh8yOta6gXwLgfRksDINu5ZU1dDIkONrpANVxMlpxRhfBM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4542.jpnprd01.prod.outlook.com (2603:1096:404:12d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 24 Jun
 2021 05:27:56 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Thu, 24 Jun 2021
 05:27:55 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 07/14] arm64: dts: renesas: Add support for Salvator-XS
 with R-Car H3e-2G
Thread-Topic: [PATCH 07/14] arm64: dts: renesas: Add support for Salvator-XS
 with R-Car H3e-2G
Thread-Index: AQHXXdxJ/bmhak7lTUO/ZlNNoObb7KsT30IAgAANloCADskVIA==
Date:   Thu, 24 Jun 2021 05:27:55 +0000
Message-ID: <TY2PR01MB369248B6C6F64529BB037B42D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <fda1bc3516ac98084089b5565b486a0a41b3a62c.1623315732.git.geert+renesas@glider.be>
 <YMej3BSjxeiRxLWg@pendragon.ideasonboard.com>
 <CAMuHMdU2OvMvwKD+Y=f7iwARBT_YXfG3qBEeuiZhyFsNhS7_KQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU2OvMvwKD+Y=f7iwARBT_YXfG3qBEeuiZhyFsNhS7_KQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4fbbc4a-a4bc-48e1-576b-08d936d0d251
x-ms-traffictypediagnostic: TYAPR01MB4542:
x-microsoft-antispam-prvs: <TYAPR01MB4542D7B6BCEED59C0C8DC49CD8079@TYAPR01MB4542.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J/am4gL/oYe2+Eh+q5qD/rJBoJ3jPKS3aYQopT71nsDYM1vpGwOQRp0x58MTnffufVvTugwv5/lvV0AiD0nX/sjn9mk8vppML/ht2CtQprv7xkC9Ct38xfbyARceyt9M0OxYDHfD+NSFHWK7UULkDeGsRgTkMNA7Ti0+gPGbDHBYo3dfQn4dJV7JQP6OiUyguoxl5kFeFT3z4qC71RJXe2gU7JP80bVpQlkByOCn6ar0P6dkExTD/rLmLiE3Eg7EP3CWzItKX6j6OE9aP8kY1JxZubh2a4WfrtL+QL0HJb1mq73a6yWE7mS1hZrbwaBXeuvPAEYHuREhV2T/mPAC21XNptzDkZn5Dx13GvioJBQ0fyeBEiMY5p50nRWFuckDtvXQUFMvqrP7TPnIQ2croRRJdROlYMntncrx2BNQtDDOmpd17hPnHVC9CUhYiaD9RUQT5St/bIlttxaRtCFsCuynPMXTqyt5pe3eWGr2f/laPMwa6MCEQ/ePw3CPThpp8DLy6Z2tJWjdrsvALbFCx4cI+H3NC+wPZ8MFAHnnkcMFuaX6AAlpxH9Q+TIDSonrn01iYxLJO0zlWFKG6P1VYQ1BRioUBYX6iNA6d9yGHbc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(316002)(33656002)(66556008)(110136005)(64756008)(66446008)(66946007)(76116006)(38100700002)(8936002)(4326008)(2906002)(66476007)(54906003)(122000001)(8676002)(186003)(26005)(83380400001)(7696005)(86362001)(5660300002)(55236004)(9686003)(71200400001)(6506007)(55016002)(53546011)(478600001)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVlQLzRRS2FwNXlMYmo4bnV5TU1pT1RSRXZZMWRmbDRJVFlQU0dnRjRkVnBF?=
 =?utf-8?B?ZWJOT3dPQ0ZpcHJrc0tZZVVsY2RIdFhDaWJsTlhGOGhrRDB0ckxyYXptaG45?=
 =?utf-8?B?UC9QYWg3ajZhOGh2SXNlWkhHb1hPMzZSdnJZM2VWVzZmUlI5b0EwUVFqQ0hC?=
 =?utf-8?B?U0gyeDFNRVh4aldPVzdvNkZJd1pVTGkzR21WUzJIR1ZkdGRJWXVvTDJBUnVi?=
 =?utf-8?B?eXdpNVpNNVpXOTFXNWU3WDZHSkJUQ0lEbWtjY0lVOWc3a0hYQjBScmcrZFdk?=
 =?utf-8?B?ckVCYXVsdTh6STVVbXZmelZ3V0hEVDRYNGIvSXJXYTQzRzBZZ3Vuc0FDYXFa?=
 =?utf-8?B?dkVPTEUxMDRSQ1FBTnZTdmNRakxLU2cwTzVYSnBobDNTWFNXNlhSQXVMb2Vs?=
 =?utf-8?B?c3I2MGkxcUFuc3cwTS9UVklLYmVCNmRwVUtpM0ZIREgzWGE2Q0xaalJJb0Nw?=
 =?utf-8?B?N2d0ZXd1b2lqQWFVYTIwOUhISnRBQUtxeml2SHFSbHEzVmVqNUM2cXVuSU1y?=
 =?utf-8?B?QUczMG1IdHFWaU1kVWRDOU8zbnMrZXFDYWpLYjIxUXZnNXJPN0xEcm9JL2g5?=
 =?utf-8?B?dXk1NDBOdGg5RWswaExieS84WmxUZ2lLRXJaa3l1YkpHOHFvSnhWNS9abThq?=
 =?utf-8?B?VS9PR01QaThlbjZGbGVaZkdibmhQTnhCbGlwMXo2NGVqeWVlTjdiN0M0ZEJi?=
 =?utf-8?B?RXl5NkxXakNscHhpSk0rdElrWDNyYlFISVZUWHVudmp5OGhxYVdROWJEVGRV?=
 =?utf-8?B?bERrWnJVTjJuM2MvZW84SGpuZzJueTk5Z2JpbVhtaEtVM0RFVmxWT0FHelRY?=
 =?utf-8?B?WW9qTzhxcUhBZGI1ZndNK2kwSWtqeHZXbFZWL054SFJXalVuUFpGZkU2QzRy?=
 =?utf-8?B?emJOdnRPTks4Wm5udnlDUFdzMUl0L3BuQnRlSy9QNi9VREtOOTlrM0hqaW9X?=
 =?utf-8?B?bjhrMHE4SE1zcVBRbW9EL2oyL1lBaXFHNlluUE5kV1hiT0RBaThyMHl0Z1Bk?=
 =?utf-8?B?Yk1xYmd1NzhqUEQyK1hkcUlhVzExcEdBZzFLdE5ZVkNzdExMMVZ1MFc1VXhN?=
 =?utf-8?B?eE15ZElRYmhTNk5Sd1hHeUZTcFNIRzNaREhzbmJKZndpbUpMSHRETUErUDdD?=
 =?utf-8?B?VnprcW9IQ3BacDBvMWtJbHQ2eHNCaktHMU9Ua3NxT0UrL1pEMHNxQVhuZWV1?=
 =?utf-8?B?c3pZbUJyK0c2RWN3MmxuM3hUR0NKakFHTHZKOU9MQ1oxV055OG93UUluYVl1?=
 =?utf-8?B?RFhJenJseWEzM3NQdGZ1ZDZZWmkxUTh2dTk3ZGJQNk1yN2JYdDBld2lYdklk?=
 =?utf-8?B?NExVOVJhQ2NNZCtkcEJEVy9icGpCVXRNT210dk95Unl6UCtvSzV0dzh1Ri9S?=
 =?utf-8?B?TEE2dTlQSEc4S0d0ODc3US9Wb1E4SHhtOWxBNW8wdDNjRms0OUE3NzZ6TXdM?=
 =?utf-8?B?eUtsb0I3VE9SLzNGNncwbjBkcmxCYy9zSkhXdGJXSTNKN3NPUVZlWXRtajM3?=
 =?utf-8?B?SzhwWm0rVHVQcDkxOHB5NDJHeWhrNTIyYktCTjVFTEw3bXFYYmltTlVkc0k3?=
 =?utf-8?B?WmM2Mmc2cU9xMFVlZEpkZ3hWa1oxM1pISFo5VWZJVTU1VnhQaEFiOE1FcW9E?=
 =?utf-8?B?V2dWNUdsaGQvaDJUQzA1aVZ6WFZuanp2OVJMV0hpYTBjaEdkenFJdytPMkVY?=
 =?utf-8?B?QlVrQmlYcCtZM0RKRHdxMG4zT2xsZW1WL2hsTEhiM1c4ajVMc1hpRnlaMkpM?=
 =?utf-8?Q?5WAxvu+nIBgHtsOx02Fz/rGLzdUY3S/7OFBdZAj?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fbbc4a-a4bc-48e1-576b-08d936d0d251
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 05:27:55.8429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BlAzR60EH6gbfs4J3A21u1z+E06I9jU6mvh0I6A370c4UmOcA1GSSTbtvru02LRjjzBrp2nVjfG8P0PiI7uAk9Ca8NZC094SamgZ2mkPrGlFDEvQzCIDKfTNS8r3GRCh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4542
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgSnVuZSAxNSwgMjAyMSA0OjM0IEFNDQo+IA0KPiBIaSBMYXVyZW50LA0KPiANCj4gT24gTW9u
LCBKdW4gMTQsIDIwMjEgYXQgODo0NiBQTSBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiA+IE9u
IFRodSwgSnVuIDEwLCAyMDIxIGF0IDExOjM3OjIwQU0gKzAyMDAsIEdlZXJ0IFV5dHRlcmhvZXZl
biB3cm90ZToNCj4gPiA+IEFkZCBzdXBwb3J0IGZvciB0aGUgUmVuZXNhcyBTYWx2YXRvci1YIDJu
ZCB2ZXJzaW9uIGRldmVsb3BtZW50DQo+ID4gPiBib2FyZCBlcXVpcHBlZCB3aXRoIGFuIFItQ2Fy
IEgzZS0yRyBTaVAuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+ID4gPiAtLS0gYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvTWFrZWZpbGUNCj4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9NYWtlZmlsZQ0KPiA+ID4gQEAgLTYyLDMgKzYyLDUgQEAgZHRiLSQoQ09ORklH
X0FSQ0hfUjhBNzc5OTApICs9IHI4YTc3OTkwLWViaXN1LmR0Yg0KPiA+ID4gIGR0Yi0kKENPTkZJ
R19BUkNIX1I4QTc3OTk1KSArPSByOGE3Nzk5NS1kcmFhay5kdGINCj4gPiA+DQo+ID4gPiAgZHRi
LSQoQ09ORklHX0FSQ0hfUjhBNzc5QTApICs9IHI4YTc3OWEwLWZhbGNvbi5kdGINCj4gPiA+ICsN
Cj4gPiA+ICtkdGItJChDT05GSUdfQVJDSF9SOEE3Nzk1MSkgKz0gcjhhNzc5bTEtc2FsdmF0b3It
eHMuZHRiDQo+ID4NCj4gPiBIb3cgYWJvdXQgcHJlc2VydmluZyB0aGUgYWxwaGFiZXRpY2FsIG9y
ZGVyIG9mIHRoZSBLY29uZmlnIHN5bWJvbHMgPw0KPiANCj4gQXQgdGhlIGV4cGVuc2Ugb2YgYnJl
YWtpbmcgYWxwaGFiZXRpY2FsIG9yZGVyIG9mIHRoZSBEVEIgZmlsZSBuYW1lcz8NCj4gDQo+IEkg
YWdyZWUgYm90aCBtYWtlIHNlbnNlLiBEbyB3ZSBuZWVkIGEgdm90ZT8gOy0pDQoNCkkgcHJlZmVy
IHRoZSBhbHBoYWJldGljYWwgb3JkZXIgb2YgdGhlIERUQiBmaWxlIG5hbWVzIDopDQoNClJldmll
d2VkLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5j
b20+DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
