Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0697C80F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 10:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbjJMIzT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Oct 2023 04:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjJMIzS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2023 04:55:18 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05EBD6;
        Fri, 13 Oct 2023 01:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODEU5CWg7OfJAiKVCviibOyL59Sk/OXd4XXx99nZyAIsukiDKPSlaVj0JJrmg6knm7t2MgMMCisPQY98c+3XF+SXSV7uOCAF9lUCa7GBvQpVq4ociSJVWsVnlHhrlOd7+dCldhSNHxt4G00aVyOhfMxJ/ZF8EVRRf9Silve9v1IxrP2c//jZDeV8mbgFnw2duf88sSbhSVek4K2KDgoi20f3A+g8uQHykChKUHPl3xbz/Z9OV/acPVBjNvfJOg/noinhTpH+Q+RuuHU9FaqK2saLaunAL8k5dny9ym+vJjQf7vr82VE8vFcjBPH36aVxtbRLexgY3szIxZRxirogqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjZSFEh/1/FidV0m/aU7lnIcHr70h3TPNu40rX3KlP0=;
 b=F8y4UP1Ep9NWG23XQU6JJ3B0xsArbYjRwf4w3X8eOBFkA0eXrozV+Shn2XaIqmtfEGANVLE68Y3n/tCD4uHxFFFxgoBSfjUMbLl2AToTbb7scqTnzkmtTLtc7q/d4hsh/CboFwftTwDP07hIgIur0lf7yulEjiTU8BByxVXBFmuNE7nxkpV1LIpjWtrwb+3dZg7baEty9/jo8d9nqZhpeUzgR1i79Se7FzaFLrmXAO+ZLO+5MYO2SPn1FND7BQQtg5cuKLixJtPMEiw7WN7ENqlyzVsw5yKzFlLokOlJfjaDP8ZNxpBMD9NdB60ZAh7dOQ+MrmQ2PA7g29zd6evzTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjZSFEh/1/FidV0m/aU7lnIcHr70h3TPNu40rX3KlP0=;
 b=WD0k6QePFVU8NDC0i67NgYuaaVVAGIx6ybPY96Got3A0XnY+amJBa/XzdkBHWkOuVHHgh2y/6Yn1t0PKUzLKFjwffBJK/DT7IiBSKYFIwx7EvbdKugdiSi3SWtxP0R1X/nHa4IqrfPskA+t4EQkXFNuaAuSXKOuNhZeiQavNLQw=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSYPR01MB5463.jpnprd01.prod.outlook.com
 (2603:1096:604:86::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 08:55:11 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%7]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 08:55:11 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next] rswitch: Add PM ops
Thread-Topic: [PATCH net-next] rswitch: Add PM ops
Thread-Index: AQHZ/QXyGwTSvnuvKE+t4wejKpfSH7BGFwMAgADbmiCAAGERAIAAFX3g
Date:   Fri, 13 Oct 2023 08:55:11 +0000
Message-ID: <TYBPR01MB5341D9408B9C4EA701E5E5D1D8D2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231012121618.267315-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWAk9kJBGGq9K-RnC0HFZk1XbaosTBO2OW1kpYFPh1Mqg@mail.gmail.com>
 <TYBPR01MB5341F5AAE321E3E373012E4DD8D2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <CAMuHMdU9Udd7xX7Us+3T06YMLAb4y0xnSOipN-5c-d-MfpvKdg@mail.gmail.com>
In-Reply-To: <CAMuHMdU9Udd7xX7Us+3T06YMLAb4y0xnSOipN-5c-d-MfpvKdg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OSYPR01MB5463:EE_
x-ms-office365-filtering-correlation-id: 81932df9-6e6d-4a05-22ee-08dbcbca1c1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B9tJk3E6AsCtWQinkQS+3T5ODU5hTJHSjqTn9yqZdPKs5HI6LJtbHr0B0K+ethLcAq0ouBP9MkvDte+CJLuDmfVCLVFkL5IFsUw9B2ZOajbZRwja2pafosDDSN5bedZ+2vY2IHNYh+39dKlHzQ4uU0MX5t9IChon/fL7t/l2nOMTo7dIvYSfKDILwwaUtQYhRXID6noUY1sT2fzmqAl2vboklus0fW51r6aMQ7R63tPL9eQ4ooZlQFsiOZ54CX1OE0jf/je6YogbPaqQ1LrWr1K9Xe19hDvQWE6tolQBKUk0PZv8PsuDqiLBwIhTnu4YH+RWHsCN7JdXsi/efBEcHEebUoreLqe45S0d0zMVrYiTRJbGaWp2soksjf4ml5J0mMUxai5IZ5nKWZD45LOF5Qu0aoNyFJwMf/hbipS5nZrpB9oDq+Jg+jg9GOwQ90BS1rDcXqVPUn3Be+RAlX3xEZhlACWDPNLvvIQAtFxlKn7vRNbHMqyUpcJdcWULJH9ZN8p4uCIq/h9y1H6wk03n9E4SARNt7Ws+L3LF5cW9hhKKjveaGl4WkRbGSpvGBHu+r3Dlz4/pIM+ZC+fNQiQeat63IltCSDncmrPhxqOucr9VE6oH1F7ih8GuNBk2iKRn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(346002)(376002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(64756008)(316002)(54906003)(66446008)(66476007)(66556008)(66946007)(76116006)(6916009)(7696005)(6506007)(71200400001)(53546011)(4326008)(8936002)(52536014)(8676002)(5660300002)(2906002)(41300700001)(86362001)(9686003)(33656002)(122000001)(38070700005)(38100700002)(83380400001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDNhOHRwK3RhOHZsWm9ZR25LdWVXZEFsWDQzOUI5Z1Z3Z3JRY1N1c0YxYVp2?=
 =?utf-8?B?WFRONjNEendFTWpObmxzOU5mR2FYZnFVNEpteUQ2VFV0RnJ5VlhlSnBNbW03?=
 =?utf-8?B?bnV5VndVUkhzbHFJL2s0aVF4WnBETlBtd2VQUWJQU0R5ZlJIaEFJT1pUcmRm?=
 =?utf-8?B?SU9hK09uZ253S2haSndhbHVvc1JBbjhBVFpuQjkzMzE1VDE2ZHR3SVJvdUs0?=
 =?utf-8?B?VzdMbGVSeUFkRU8wM3lveU5weXo2WTFXb3M0T0pIbWtjSmljU3ZCWHBHSy9p?=
 =?utf-8?B?em5DR0pqcXEyODlwUVpuVzNiOGt3OUUxbHZ2RjAxMTg1TmdOU0s0SkgzOE4x?=
 =?utf-8?B?S3huUm9lMHVGYjZsRklDYk5oeW1Ob05pZWtQaTMvUXEyZTkzQXM5bTZTSVdk?=
 =?utf-8?B?cEtCdTBpUGpwOG5YYnRINHNyUnJ2SjgwWkdNazFVSzNMQVlTVnE2UjRMa3Y5?=
 =?utf-8?B?cTRxNTVXcC9jYzZRamtGNTRUdWJwOURFUitTcWxlcTYzREJjRXB0R1dVKzJh?=
 =?utf-8?B?TFFJRHdoWU40VS96MUNyTTdpM3ErVHc3eThWQVBPbko1bnV3TTJNbFdKLzZG?=
 =?utf-8?B?YkhFckNpT2lLQ0Qyc2ltcFdRQU5uVng4YWtoQktZbUlOUm41bDRrUWFlZjM5?=
 =?utf-8?B?bk5SVU51SkJsSVM1UXV3OWZiUSsvanVkcjM4OWowNUJOUll4a0dySzZjcmEw?=
 =?utf-8?B?c1N1TGFuM0t3eXNYWk0zYTVjUDRkbEtCOHQrNERIQUZOcGllMExBVm1BcUFh?=
 =?utf-8?B?cm1OYXBiZUxnVTZLV2tTSzlLWTQ4WFI5b1BuUUtkVjQ5U1ErM1pqdFlUZ1NO?=
 =?utf-8?B?Y3ladmdOLzVNQWxocW5DMU1vU1l0Z1Bzd0pvcVZGckE2TWttaVZlV0xCNXFM?=
 =?utf-8?B?cWhLQWpJeXQyNG9CQ2FHZFh0VDJkbkxCakV1OGV1MWxWQkJPYXpUV1FqRXIz?=
 =?utf-8?B?SldZZktjRythNGZ5eU11WGR4aENYTjk5aDdBSk9tYnBpSHVwRlpxdmtvWjBw?=
 =?utf-8?B?ZFNsVFdOV2xqWEExK2pYLzNVUHNFK0plMHpqVHNkQ2lOZDh1aTlwOVQ2QS8y?=
 =?utf-8?B?ZnpDTHFXdnpWNFg4YmpHbHBTNU8rWGxnODV5MnBiYXpLcnNKclpJS3ZXZGl0?=
 =?utf-8?B?YVBrYkxaVUluY1JyT28wTk5CTGQ5cUM3bFRLeUk0dkVsZmV1bnAvYnZ2ZzNE?=
 =?utf-8?B?blU0ekhVa3pCbjZOdmFYRFd0RkVlTVN3Tll0Ti9TQVdiTFJ1L1FLZ21naStI?=
 =?utf-8?B?b1NNK254bURGOGxEL3JzTXRmeExyZGxZblZycDNFdWl0MkFkQ0ttUUpQc05G?=
 =?utf-8?B?RFRSZWhIT1JFbDgyZGZ5TUlpZlF0WVdJa3JnZGRGNkoxYkR6K1JZOE8zQkpi?=
 =?utf-8?B?SnpvdkVJRWp0eDNzZnFsQURSSWZHdTdBZ0NWbkFTb0RYVVM4cnlQVER2YVU4?=
 =?utf-8?B?TWF5eEhHaThjeERzYW9nbTc4S20wVWZJQVhSL09tNnlReDRtL25SUGh5Mmkw?=
 =?utf-8?B?eHBvYzIzWklFNWVSZHlseXVOUmFHVFlaK1lCSUF0U1pBTlYwRjBLek5aQWx5?=
 =?utf-8?B?RlpGMEYrVFgxdnNKMTlJR1prR0VZNk1CWHdHWlM5K05NaXRBdHlNWXhOV3hx?=
 =?utf-8?B?ank2MFNOMGZueVBGVkJVdWY2Ri9McnJtd0NPK0hVTno5bG0wS01BZ0JiRGNr?=
 =?utf-8?B?TnRvVllzQTNCeU9jTFZuVW1xdHkycmJ2c2cxdGJ0NWJ2Skd1RW1BK0g3K2Vq?=
 =?utf-8?B?YVI5djFvcXFPMlZ1TmF6OTRnVHJGTFN2UVhtZUJIRHM0YmtwQ0dJcy92QWdT?=
 =?utf-8?B?M00wdWtSY1ErOHIvMVpuRE80VnN5QXNPYVc2U3RKYUdkRi9seHdxT1M1bDZx?=
 =?utf-8?B?SjJ3NnhjaDJUMVFYcDNoVXRNUC9hNmFKT1hCSmRKTE1ic1FhcEpXc2F6WnZh?=
 =?utf-8?B?TW9pYWc5UG1ra0NXSlNTNlBHUXVFQm5CcWV4cm05RnFJNDl0cUxNRmFoRjBE?=
 =?utf-8?B?VEwrekllMmt1SzVSU21hdHJRd0toQ0lZc3BSK2FzY0ljblZPNUtJMytmeWh6?=
 =?utf-8?B?U25ibmlEQjZEL0dxaGNqU0pyc2syTXlWSjZhelFwbWlPWVRoNmN0ZmIvWmhQ?=
 =?utf-8?B?WkV2RjVWSllyQmVDazZFamtXZEdGMUMzQ1RRbnlQcU9IU0d0anljc3o4dUVp?=
 =?utf-8?B?ZWZxOEtjUmNmSTlTQmFtWFNEVHBYcDNmdjBZSy9YakhvWE4wN25CSDlkOVNT?=
 =?utf-8?B?MUdxMmdrUDhEK3RQZTg2SUVxaFRRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81932df9-6e6d-4a05-22ee-08dbcbca1c1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2023 08:55:11.7960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ymf6ga3/xk5iK+iiDB4kGYXHXbGCEkz9aUi/sdUuaXOUAVuwg6GC7QkTmB3dAfgAK7pBJJJrzTAJQIV7da8DOoSj+6lfQ34hkDeUpv6gGSESRevEGJc5RPkLLyMkmNT8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5463
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogRnJpZGF5
LCBPY3RvYmVyIDEzLCAyMDIzIDQ6MjkgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
T24gRnJpLCBPY3QgMTMsIDIwMjMgYXQgNDoxMOKAr0FNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5
b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4sIFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDEyLCAyMDIzIDk6MzUgUE0N
Cj4gPiA+IE9uIFRodSwgT2N0IDEyLCAyMDIzIGF0IDI6MTbigK9QTSBZb3NoaWhpcm8gU2hpbW9k
YQ0KPiA+ID4gPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+
ID4gQWRkIFBNIG9wcyBmb3IgU3VzcGVuZCB0byBJZGxlLiBXaGVuIHRoZSBzeXN0ZW0gc3VzcGVu
ZGVkLA0KPiA+ID4gPiB0aGUgRXRoZXJuZXQgU2VyZGVzJ3MgY2xvY2sgd2lsbCBiZSBzdG9wcGVk
LiBTbywgdGhpcyBkcml2ZXIgbmVlZHMNCj4gPiA+ID4gdG8gcmUtaW5pdGlhbGl6ZSB0aGUgRXRo
ZXJuZXQgU2VyZGVzIGJ5IHBoeV9pbml0KCkgaW4NCj4gPiA+ID4gcmVuZXNhc19ldGhfc3dfcmVz
dW1lKCkuIE90aGVyd2lzZSwgdGltZW91dCBoYXBwZW5lZCBpbiBwaHlfcG93ZXJfb24oKS4NCj4g
PiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGly
by5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+IFRoYW5rcyBmb3IgeW91ciBw
YXRjaCENCj4gPg0KPiA+IFRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQo+ID4NCj4gPiA+ID4g
LS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yc3dpdGNoLmMNCj4gPiA+ID4gKysr
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yc3dpdGNoLmMNCj4gPiA+ID4gQEAgLTE3
LDYgKzE3LDcgQEANCj4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9vZl9uZXQuaD4NCj4gPiA+ID4g
ICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+DQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGV2aWNlLmg+DQo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvcG0uaD4NCj4gPiA+ID4g
ICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+DQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgv
cnRuZXRsaW5rLmg+DQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiA+ID4gPiBA
QCAtMTMxNSw2ICsxMzE2LDcgQEAgc3RhdGljIGludCByc3dpdGNoX3BoeV9kZXZpY2VfaW5pdChz
dHJ1Y3QgcnN3aXRjaF9kZXZpY2UgKnJkZXYpDQo+ID4gPiA+ICAgICAgICAgaWYgKCFwaHlkZXYp
DQo+ID4gPiA+ICAgICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gPiA+ID4gICAgICAgICBfX3Nl
dF9iaXQocmRldi0+ZXRoYS0+cGh5X2ludGVyZmFjZSwgcGh5ZGV2LT5ob3N0X2ludGVyZmFjZXMp
Ow0KPiA+ID4gPiArICAgICAgIHBoeWRldi0+bWFjX21hbmFnZWRfcG0gPSB0cnVlOw0KPiA+ID4g
Pg0KPiA+ID4gPiAgICAgICAgIHBoeWRldiA9IG9mX3BoeV9jb25uZWN0KHJkZXYtPm5kZXYsIHBo
eSwgcnN3aXRjaF9hZGp1c3RfbGluaywgMCwNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZGV2LT5ldGhhLT5waHlfaW50ZXJmYWNlKTsNCj4gPiA+ID4gQEAgLTE5OTEs
MTEgKzE5OTMsNTIgQEAgc3RhdGljIHZvaWQgcmVuZXNhc19ldGhfc3dfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiA+ICAgICAgICAgcGxhdGZvcm1fc2V0X2RydmRh
dGEocGRldiwgTlVMTCk7DQo+ID4gPiA+ICB9DQo+ID4gPiA+DQo+ID4gPiA+ICtzdGF0aWMgaW50
IF9fbWF5YmVfdW51c2VkIHJlbmVzYXNfZXRoX3N3X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2
KQ0KPiA+ID4gPiArew0KPiA+ID4gPiArICAgICAgIHN0cnVjdCByc3dpdGNoX3ByaXZhdGUgKnBy
aXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgbmV0X2Rl
dmljZSAqbmRldjsNCj4gPiA+ID4gKyAgICAgICBpbnQgaTsNCj4gPiA+DQo+ID4gPiB1bnNpZ25l
ZCBpbnQgKGFsc28gYmVsb3cpDQo+ID4NCj4gPiBJIGRvbid0IGtub3cgd2h5IHVuc2lnbmVkIGlu
dCBpcyBuZWVkZWQuIE90aGVyIGZ1bmN0aW9ucyB1c2UNCj4gDQo+IFRoZXJlJ3MgdGhpcyBvbGQg
bWFudHJhICJwcmVmZXIgdW5zaWduZWQgb3ZlciBzaWduZWQgaW4gQyIsDQo+IGFuZCBhIHZhbGlk
IHBvcnQgYXJyYXkgaW5kZXggaGVyZSBpcyBhbHdheXMgdW5zaWduZWQuDQoNCkkgdW5kZXJzdG9v
ZCBpdC4NCg0KPiA+IHJzd2l0Y2hfZm9yX2VhY2hfZW5hYmxlZF9wb3J0e19jb250aW51ZV9yZXZl
cnNlfSgpIHdpdGggaW50Lg0KPiA+IEVzcGVjaWFsbHksIHJzd2l0Y2hfZm9yX2VhY2hfZW5hYmxl
ZF9wb3J0X2NvbnRpbnVlX3JldmVyc2UoKQ0KPiA+IGhhcyB0aGUgZm9sbG93aW5nIGNvZGUsIHVu
c2lnbmVkIGludCB3aWxsIG5vdCB3b3JrIGNvcnJlY3RseToNCj4gDQo+IE9oLCB0aGVyZSBpcyBh
bHNvIGEgcmV2ZXJzZSB2YXJpYW50LCB3aGljaCBpbmRlZWQgbmVlZHMgYSBzaWduZWQNCj4gaXRl
cmF0b3IsIGN1cnJlbnRseS4uLg0KPiANCj4gPiAtLS0NCj4gPiAjZGVmaW5lIHJzd2l0Y2hfZm9y
X2VhY2hfZW5hYmxlZF9wb3J0X2NvbnRpbnVlX3JldmVyc2UocHJpdiwgaSkgXA0KPiA+ICAgICAg
ICAgZm9yIChpLS07IGkgPj0gMDsgaS0tKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcDQo+IA0KPiBJIHRoaW5rIHRoaXMgY2FuIGJlIG1hZGUgdG8gd29yayB3aXRoIGFuIHVuc2ln
bmVkIGl0ZXJhdG9yIHVzaW5nDQo+IA0KPiAgICAgZm9yICg7IGktLSA+IDA7ICkNCg0KSSB0aGlu
ayB0aGF0IHRoaXMgbG9vcCBjYW5ub3QgYWNjZXNzIGluZGV4IDAgOikNCg0KPiA+ICAgICAgICAg
ICAgICAgICBpZiAocHJpdi0+cmRldltpXS0+ZGlzYWJsZWQpICAgICAgICAgICAgICAgICAgICBc
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwNCj4gPiAgICAgICAgICAgICAgICAgZWxzZQ0KPiA+IC0tLQ0KPiA+DQo+
ID4gU28sIEkgd291bGQgbGlrZSB0byBrZWVwIHRoaXMgZm9yIGNvbnNpc3RlbmN5IHdpdGggb3Ro
ZXIgZnVuY3Rpb25zJw0KPiA+IGltcGxlbWVudGF0aW9uLiBCdXQsIHdoYXQgZG8geW91IHRoaW5r
Pw0KPiANCj4gQ29uc2lzdGVuY3kgaXMgZ29vZC4uLg0KPiBTdXJwcmlzaW5nIHJlYWRlcnMgKHdo
eSBpcyB0aGlzIHNpZ25lZD8pIGlzIGJhZC4uLg0KPiBJdCdzIGhhcmQgdG8ga2VlcCBhIGdvb2Qg
YmFsYW5jZS4uLg0KPiANCj4gQlRXLCBwZXJoYXBzIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gdXNl
IHRoZSByZXZlcnNlIG9yZGVyIGluIHN1c3BlbmQ/DQo+IEFsdGhvdWdoIGl0IHByb2JhYmx5IGRv
ZXNuJ3QgbWF0dGVyLCBhcyByc3dpdGNoX2RlaW5pdCgpIHVzZXMgdGhlDQo+IG5vbi1yZXZlcnNl
IG9yZGVyLCB0b28uDQoNClRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9uLiBJIGFsc28gdGhp
bmsgdGhhdCB3ZSBjYW4gdXNlIHRoZQ0Kbm9uLXJldmVyc2Ugb3JkZXIuIFNvLA0KIDEpIENoYW5n
ZSAiX3JldmVyc2UoKSIgbWFjcm8gdG8gb3RoZXJzIHNvbWVob3cuDQogMikgQ2hhbmdlIHRoZSB0
eXBlIG9mIGkgZm9yICJmb3JfZWFjaCIgdG8gdW5zaWduZWQgaW50Lg0KIDMpIEFkZCBQTSBvcHMu
DQoNClBlcmhhcHMsIGNhbi9zaG91bGQgd2UgbWVyZ2UgdGhlIDEpIGFuZCAyKSB0byBvbmUgcGF0
Y2g/DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gR3J7b2V0amUsZWV0
aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4g
R2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAt
LSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMNCg==
