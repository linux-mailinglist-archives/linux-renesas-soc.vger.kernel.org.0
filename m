Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAF09628F6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 02:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbiKOBlT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 20:41:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231944AbiKOBlT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 20:41:19 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2124.outbound.protection.outlook.com [40.107.113.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F03E0167D1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 17:41:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ekwj3ypo/0nSvRgxBomcxk6D9TlCWc0I+C0uCO+Zo8k+k2kpQ6SYgRSRWvLTXZeEVnEk9cTkiLAHVEyyDNOfX3JLUqSCPCZghPyRvMkuiar0rrzK3PboXl5DK+QgXDrCgzVQyjiJ400dT0Wf0Ixl21jR/LHHCofLLXqGKolK3DkBYQpxMKH0OxEzU99Te8aBjTiC9UOF18W6nH7MllXgvOvnkiGS855/Rstx+V+NTu9wkZOV7/+i+AlzCDx5UlfsYpPEfwIE+3tSU43TffxGx1eKRKSEMYVU7rxxQ3kbocYMJ1dP/CKauFkgIGgRzpXflAN5TSmURAGumKcSo+NtDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CORcV9biP4/s5Ur3dLxmEqs8W79UrBYP2cOTITN27bs=;
 b=lpTDaENTVbTLQNu4YN+OsrK/LqCQ2M0orlIcks23pW0e2oAreVbvL0wncZWU6jBEUd8WhzKl3pIs+0OyZLI5Vn5VzgEvGaTBh9yGjD0ATQUHbmaCIHmEZSapnyv5sSt+YZ/fMtAkiLQCVrS/E+LQpQlK2ejq/FvCaURdQKUuQUK5n2nQGEWWnndNegwjQPdzfSkTPzWPkI2gfG26k7XIg8FgYLL80NyT6aKtMdl7hgQmjDHPclhbgBnikdquvEC88gEXsuZb88m/QKwflrwP53bsJJQT7bSOfec85ba6rRfyq3vyRRSqy+Y4vXmvIh0QHbUu10TOeHG0TT5uD5s/kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CORcV9biP4/s5Ur3dLxmEqs8W79UrBYP2cOTITN27bs=;
 b=Mn4fB1C4dtn5uJRuowR6ciXfuJUVCgr67Kg1Q+mObSz6/bR2ieGG6ijjzmkh7JJRowLa0Etmz+EwiO3wzzUzdt+8cKGtDY+nPD4HASMjs/iVCbHha2hIxPxV6t9ykU58lzu8Eekf0Qa5SQY++OGGsFMp/4E4EH0aeHj2p34xSrM=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYAPR01MB6204.jpnprd01.prod.outlook.com
 (2603:1096:400:84::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 01:41:15 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d%8]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 01:41:15 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 2/3] arm64: dts: renesas: r8a779f0: spider: Enable
 Ethernet Switch and SERDES
Thread-Topic: [PATCH v5 2/3] arm64: dts: renesas: r8a779f0: spider: Enable
 Ethernet Switch and SERDES
Thread-Index: AQHY9QaqbsPaz5Av/U2LN9LstyPgOq4+mXiAgACiaVA=
Date:   Tue, 15 Nov 2022 01:41:15 +0000
Message-ID: <TYBPR01MB5341EE8187BC82EB7CB408D8D8049@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20221110131630.3814538-1-yoshihiro.shimoda.uh@renesas.com>
 <20221110131630.3814538-3-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWsZrhZMkN3ybv+vEaBmtwSkVVADLbot-MTn3F_q6PV=g@mail.gmail.com>
In-Reply-To: <CAMuHMdWsZrhZMkN3ybv+vEaBmtwSkVVADLbot-MTn3F_q6PV=g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYAPR01MB6204:EE_
x-ms-office365-filtering-correlation-id: e116a6e5-32d4-4b42-298f-08dac6aa7c08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2IMVcmtRwgwYZIJRrL+p2udEQxehUq5i+MPY/BSMru3qIpQntnlq8Od+0K+kT0Ki98PQHKdgKKv5wqpWmmKbk4thnbT8toGBIH89HMm+Jn7yU3mumg2SZlGYJkq4XiqtmJmc61kdAqMnuWyQTp2rWJ9hc9CNmijyVBZ+A4beEPa6sHsxTytbF1hAHR07jtLVi7R1z3JiAsYFwsh/ic9KICj1SNYwJVDEU0fZz4VLqxXIN9lJhDRTxGfAhgJFSZdwpIRJEWnUpZO/iHkNs8EOgTnsSC7uzgCm3/R24HmsRafeYV7KpIFHUY2BKryOw0rgeHUsWh0++nVwtU4NAZQW5mUU8oG7c2GO3oWkO/maJTevHYUO9L5fbpEqROmH2SaFUuDmdRXKSQ+LL8sZxFHohh/SuEJrm+xvtTRVKmVFNtz9TvF0Zy8BCPiA53l3Cwt20h/QdbGMqUAugZihJVuwxdSRI4gYEpXEI4qyBX6+vYmKfAZ+WmYt3FHtkGhWIficAA3bSrMwr3GvfxG9uRDkB4hQOcVdW0IFIf8ZEvlFoB879Fp8B92lzHld1kjfRmw87CUzLtBhZjhsi7I45hJIVu4PBBaZbz3p+uHykFhkXHh8Oa4n6ogS50YhJlZaEm7UUmtCDbnTs13SRPUgNfeiQM6JbpIohUZw73Gl6bn8o6ojkB5zHdzhXsJ0UJW3p4Yvkghfo5o9VPIFXex2ft6SCgIK/y1aQo7RartcrtABQBLhFP6YUwMCJe6Fkzfm2uT2TuWMbEF8KhJcPYzzk8AUgg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199015)(478600001)(6916009)(54906003)(71200400001)(53546011)(9686003)(76116006)(41300700001)(52536014)(8936002)(66556008)(66476007)(64756008)(4326008)(8676002)(66946007)(186003)(5660300002)(316002)(66446008)(7696005)(2906002)(6506007)(33656002)(38070700005)(55016003)(38100700002)(122000001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ky84NXpNZ3RNOWhuOTFPdTZ0Ull0Q1hrSFdFaHpQZ0xkeDZxTUprRHVpOER6?=
 =?utf-8?B?L3hQc3Yya3dpWFFZcFY5U25keHdUZGpzc3JxK0JocThablk3MlQ4SnZacWdm?=
 =?utf-8?B?YkVmTGx6TExKdHZRczlobWxxb3FqRTQwT0xuOVNQYktucEptcktjM2hvejlk?=
 =?utf-8?B?Ylc1dEhoekFMV1czTGNJTCswY21JYUUrT2pWNDRlWVIvT1pLYWpKMEE1N2Zl?=
 =?utf-8?B?bzJTcmx4S2FMZHM4WENPVTFrRjBJOVFPYUMvalU1aDB5WXpJcWFJMDkydDd0?=
 =?utf-8?B?dFdBUm9MUHhlaDExQ1VDaEtOWjllQ0JBeVZwZHpNK203dGE4YWJPcXVXdlN4?=
 =?utf-8?B?aXZmdjhsRFE5QXF2djRZMWhzRE5GVDdMRTBLNFhZbFl6R3VlSFBmT0EvV0Ra?=
 =?utf-8?B?b0FENWJRMmZmQUc2VkRIT0VLK2NDNE04ZUZEUDVmdU9UVS83OElSTDl0TUYw?=
 =?utf-8?B?L2dQdHpPQ2l3bFZMdUY2S1F6N3V1SjMrcFJ4cm0reU9MVC9mOERxTWJwNWdK?=
 =?utf-8?B?YWNwU0MwMmFtRlV4TjgxZFBOYkNwVi9sMFkwUDdQVTZwL0tIUkczb2xZck5J?=
 =?utf-8?B?UThpWUkycVhjSGppb2R0NmRPQVRBM2NzSGJnRXdNQlZCQ1NGMlhza3AwNVdj?=
 =?utf-8?B?NDkwREFETUxic1hyOEZjUzFFa2NGU0Z3QVNJQUl3RCtjMnRWY0RxOGY3WjVZ?=
 =?utf-8?B?cU5EK3ppbnFIOGZFcVFNUDZYZ3BUak05VTA0SFpNelBGUUMxcDU4VkZjbGtx?=
 =?utf-8?B?OVFIZHNvQTJmYXpuQVpWOStaZ1lDa0pGL3l5Yit5U1pXa3BMTXRkdUxBejh1?=
 =?utf-8?B?VUxpdGs5Ynd2VmJ0ZldrSHpla3BuQ3NGK3BhaDZ6ZXVTTXdmTUw2dm1pWmRx?=
 =?utf-8?B?OGpLY3RIdExUN0J4UFdrUHhpdHJVWUs3QzFjRnJjZmhtU2ZpUGk5bExSYm5y?=
 =?utf-8?B?Z3hNazNMY3RjQzVnYVZBQTl4ZVlyTmhzMTg5MGNQcnRSbkk4WmIrQnhqa3Bz?=
 =?utf-8?B?RU5LZnRqcXgxenc5b0h2dndiZnhRbjdpR0dYSW5OS1I0bmRBNTA1NVlvNy9O?=
 =?utf-8?B?SVNTVnU5T3dncXhwNmVYN29tRldCN2VEcURaK05TRGoxYlhNdGpPVWRhV1Vq?=
 =?utf-8?B?aCs1N2J0MEdBQVEvUElMWjE1aEx4TlgvVDl4b2lJNEhWTGxkV2dCNW0zS3E0?=
 =?utf-8?B?K09HcFVPWDNUekJOTE5kV2Rnd2J3dGw5NjJSeGFPRUtWWXhDSzNrN3JGbjg5?=
 =?utf-8?B?eXk3dUFUS2p3OWtNYlV1NlcrSWpmcEh3ZDcxSDBESThjSG1yZTg4bC9BYm9V?=
 =?utf-8?B?cHBHM0xBaU5TT2pmV0NLdmxHWFBLbHlDZitwOEJlR001NExpWDBCK1RxeFVK?=
 =?utf-8?B?T3BpUlFKVllSWVZEL1dqcVBoMFRwUWtkZzllM3ArRUFqUU4rWXlTODdiTnNm?=
 =?utf-8?B?QkN3MFFyVFhiaUF5cWQ4eFBWZWY1TklCN2tESENJYk5mZTg4SVVoQklFRzJk?=
 =?utf-8?B?a2ZCcFVhUEpjRXpDVWJaR1NUWm9UMTRGajlHdE41RWFLTUczajJ6ZHhlUDdh?=
 =?utf-8?B?aVQ3NGo0YXcvYnJ2bU40M3R5MS9XakZjMjUxSWpwQ1BUUE9Mc0hUU1RoalVm?=
 =?utf-8?B?U1VtTnBhcHQwRk1YSDV3MVdraUZHeVZRZDUza3lSa2lvTGdUMUt4ekc4MmM5?=
 =?utf-8?B?UGJ0WEY4K3FHQm04eDhwS0ZtOWlHL0lnTXVjOHd1Vnd1YkJzZlhycUZPdUhY?=
 =?utf-8?B?WG4zcGVuSDJkVU05ZDRSbFc3U3l0VE1RZlMwYUl0WkpVaXJjSXZaTHFaTGZx?=
 =?utf-8?B?UGNENWszK0VzazNJWlFsemVuZTR0R0N0Ly9MVGZWTDZmMy96ZDlMVWZvL0xj?=
 =?utf-8?B?Rm1ac0VINWJjaTBCMXgwd3ZVQVFkUnNoVjhoR0lnZmhCN1AwV2FzV0lGbVZB?=
 =?utf-8?B?bUw4Q3Btd2UrajFla0hxYk5RVU5jNkJrQ3dHbXJlMGpWYWp6UnkyRFg2UXAz?=
 =?utf-8?B?NnR5aEtJVk9TR3FuS2ROUU5LdTVXNm5JcDE1YnN6THp4K0Q3L21zcExWK1N2?=
 =?utf-8?B?Z2FCclNTK2N0L2p2MTgrKzl3OVVRdU1ObnpoanlhL1pTNnFqc3RvUUZtYmRJ?=
 =?utf-8?B?SFU3cllRUzBrcmxwa2EwNGRzOG1SUGwzUzRLdkdjL2NYclFyTDZtSkdrMVdi?=
 =?utf-8?B?RFV5djgxenlTamNMWXlnQUhNZDFOYzA1Vy9laGVaVTZxdGNNcSsycU52ZkRY?=
 =?utf-8?B?Y3NOSlM5aUxDaHMyQjI4V0ZhWVR3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e116a6e5-32d4-4b42-298f-08dac6aa7c08
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 01:41:15.3839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lFJQpyLnWVG+vnq07R1opYUUrveLkUpDTlc8nWoKgJrinmwUkEcxigixVQzjWmS9yCcrAcNedCfs/I61C7VCAvT0YCwhj1PDpvIxAOYRdy5z6K3Ghy8BOvssQ+mtakcD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6204
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgTm92ZW1iZXIgMTUsIDIwMjIgMTI6NTcgQU0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiAN
Cj4gT24gVGh1LCBOb3YgMTAsIDIwMjIgYXQgMjoxNiBQTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8
eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEVuYWJsZSBFdGhl
cm5ldCBTd2l0Y2ggYW5kIFNFUkRFUyBmb3IgUi1DYXIgUzQtOCAocjhhNzc5ZjApLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVo
QHJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5ZjAtc3BpZGVyLWV0aGVybmV0LmR0
c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5ZjAtc3BpZGVy
LWV0aGVybmV0LmR0c2kNCj4gPiBAQCAtMTMsMyArMTcsNzYgQEAgZWVwcm9tQDUyIHsNCj4gPiAg
ICAgICAgICAgICAgICAgcGFnZXNpemUgPSA8OD47DQo+ID4gICAgICAgICB9Ow0KPiA+ICB9Ow0K
PiA+ICsNCj4gPiArJnBmYyB7DQo+ID4gKyAgICAgICB0c24wX3BpbnM6IHRzbjAgew0KPiA+ICsg
ICAgICAgICAgICAgICBncm91cHMgPSAidHNuMF9tZGlvX2IiLCAidHNuMF9saW5rX2IiOw0KPiA+
ICsgICAgICAgICAgICAgICBmdW5jdGlvbiA9ICJ0c24wIjsNCj4gPiArICAgICAgICAgICAgICAg
cG93ZXItc291cmNlID0gPDE4MDA+Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAg
ICB0c24xX3BpbnM6IHRzbjEgew0KPiA+ICsgICAgICAgICAgICAgICBncm91cHMgPSAidHNuMV9t
ZGlvX2IiLCAidHNuMV9saW5rX2IiOw0KPiA+ICsgICAgICAgICAgICAgICBmdW5jdGlvbiA9ICJ0
c24xIjsNCj4gPiArICAgICAgICAgICAgICAgcG93ZXItc291cmNlID0gPDE4MDA+Ow0KPiA+ICsg
ICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICB0c24yX3BpbnM6IHRzbjIgew0KPiA+ICsgICAg
ICAgICAgICAgICBncm91cHMgPSAidHNuMl9tZGlvX2IiLCAidHNuMl9saW5rX2IiOw0KPiA+ICsg
ICAgICAgICAgICAgICBmdW5jdGlvbiA9ICJ0c24yIjsNCj4gPiArICAgICAgICAgICAgICAgcG93
ZXItc291cmNlID0gPDE4MDA+Ow0KPiA+ICsgICAgICAgfTsNCj4gPiArfTsNCj4gPiArDQo+ID4g
KyZyc3dpdGNoIHsNCj4gPiArICAgICAgIHBpbmN0cmwtMCA9IDwmdHNuMF9waW5zPiwgPCZ0c24x
X3BpbnM+LCA8JnRzbjJfcGlucz47DQo+ID4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1
bHQiOw0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICsNCj4gPiArICAgICAgIGV0
aGVybmV0LXBvcnRzIHsNCj4gPiArICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
DQo+ID4gKyAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiANCj4gUGxlYXNlIGlu
c2VydCBhIGJsYW5rIGxpbmUgYmV0d2VlbiBwcm9wZXJ0aWVzIGFuZCBzdWJub2RlcyAoZXZlcnl3
aGVyZSkuDQoNCkkgdW5kZXJzdG9vZCBpdC4gSSdsbCBmaXggdGhpcyBwYXRjaC4NCg0KPiA+ICsg
ICAgICAgICAgICAgICBwb3J0QDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwaHktaGFuZGxlID0gPCZ1MTAxPjsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwaHktbW9kZSA9ICJzZ21paSI7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcGh5cyA9IDwmZXRoX3NlcmRlcyAwPjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBtZGlvIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1MTAxOiBldGhlcm5ldC1waHlAMSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJldGhlcm5ldC1waHktaWVlZTgwMi4zLWM0NSI7
DQo+IA0KPiBNaXNzaW5nIFBIWSBpbnRlcnJ1cHQ6DQo+IA0KPiAgICAgaW50ZXJydXB0LXBhcmVu
dCA9IDwmZ3BpbzM+Ow0KPiAgICAgaW50ZXJydXB0cyA9IDwxMCBJUlFfVFlQRV9MRVZFTF9MT1c+
Ow0KDQpPb3BzLiBJJ2xsIGFkZCBQSFkgaW50ZXJydXB0IHByb3BlcnRpZXMuDQoNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgfTsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAgICAgcG9ydEAx
IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcGh5LWhhbmRsZSA9IDwmdTIwMT47DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcGh5LW1vZGUgPSAic2dtaWkiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHBoeXMgPSA8JmV0aF9zZXJkZXMgMT47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgbWRp
byB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0g
PDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTIwMTogZXRoZXJuZXQt
cGh5QDIgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcg
PSA8Mj47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jNDUiOw0KPiANCj4gICAgIGludGVycnVw
dC1wYXJlbnQgPSA8JmdwaW8zPjsNCj4gICAgIGludGVycnVwdHMgPSA8MTEgSVJRX1RZUEVfTEVW
RUxfTE9XPjsNCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4g
KyAgICAgICAgICAgICAgIHBvcnRAMiB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVn
ID0gPDI+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBoeS1oYW5kbGUgPSA8JnUzMDE+
Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBoeS1tb2RlID0gInNnbWlpIjsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBwaHlzID0gPCZldGhfc2VyZGVzIDI+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIG1kaW8gew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHUzMDE6IGV0aGVybmV0LXBoeUAzIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDM+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZWVlODAyLjMtYzQ1
IjsNCj4gDQo+ICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvMz47DQo+ICAgICBpbnRlcnJ1
cHRzID0gPDkgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gKyAg
ICAgICAgICAgICAgIH07DQo+ID4gKyAgICAgICB9Ow0KPiA+ICt9Ow0KPiANCj4gVGhlIHJlc3Qg
TEdUTS4NCg0KVGhhbmtzIQ0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+
IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQN
Cj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
