Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7FA7B993B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Oct 2023 02:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244208AbjJEA1H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Oct 2023 20:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233943AbjJEA1G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2023 20:27:06 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D99AD;
        Wed,  4 Oct 2023 17:27:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kI7f8WSsToT89bs7L3qXzpg05xJ3MrzWz2kpvcU2edSORkkht3d3oVonHHwrBqCo2oIHOA22rwfNF7U/gla3Bg1RMVCLTgWXIyGPlExkWRQwSg4TL7OqpRYIRpblFL2e+RaZMsMP0sPQcRVUaFrXYwF12Pa5j3IHD8pr7eCZLt0n+eSqRCuBozagBCS7sahar74liwsCpwgwH0EHVccF1jLvrDREYDb0T3VTw6XeUVxmTj44M+k8ton3nD2v61FrQmguCTDhm7E4XIMjLWhfKhpUhVzPbBRn0yw02GNxZESTRMUAgcAR9vafRK9bC+fn8XtWcCRRxGYGMPDB4A3Yzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Zg360nBFj1p7Ka2FKiNGqRJifaSTOvfzEd/MvDNHrY=;
 b=dyE1lIlSNupkJQMHcyS1otogUIMIxP6T1mrHeZTICvjKX8Jo/A2wwkDFyfehxvoC6gvcR7wH8omnkcxxgxzScqZao107L2EtpG10c9u7SAxbFYmH7BrHGDuzUfRoTOFKNsdStHBiz3hW24gO7OisufVd1hLOqTjCn+VsQvMu4bLSssdsxVVrfE93wqeYAJxWq/6UoeeLGEnNEnMQNzltGW0zKJEI01wH6Zg1gP0DTmwIUiWsyQPmMVZKRC0SJt19D9pdmmoGlW4FwC9g7S/iUZ20b3uMajSUWGbToMGBPbUQ+ChMcUNsjkn9QXa3YM35YG9H/6aP+JeEGZ4yLUQfcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Zg360nBFj1p7Ka2FKiNGqRJifaSTOvfzEd/MvDNHrY=;
 b=Q9OQxXx3Rc/1jnMlTE0N7K6ptZCcS0po/dPYw5gSK68wGqVBF0g3bLhwmS4FEfFVxWVSR8gUXp7x0YRpe1Pm2KAYcoZO/oGTR/XzV4K4dBfmSRlv3LW7NozERu/MDqKioqE2oxsf/tnIS5M+Gmc/BBIuhpoC3240NqOAueSZBBM=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB8795.jpnprd01.prod.outlook.com
 (2603:1096:604:152::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Thu, 5 Oct
 2023 00:26:59 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 00:26:59 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net 1/2] ravb: Fix dma_free_coherent() of desc_bat timing
 in ravb_remove()
Thread-Topic: [PATCH net 1/2] ravb: Fix dma_free_coherent() of desc_bat timing
 in ravb_remove()
Thread-Index: AQHZ9qL+Da6Og9aD5UO+I/AffZU9hbA5+PSAgABevaA=
Date:   Thu, 5 Oct 2023 00:26:59 +0000
Message-ID: <TYBPR01MB53413E07E966984C601232BED8CAA@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231004091253.4194205-1-yoshihiro.shimoda.uh@renesas.com>
 <20231004091253.4194205-2-yoshihiro.shimoda.uh@renesas.com>
 <79fa0c14-a203-1e0b-532d-846551ccaf36@omp.ru>
In-Reply-To: <79fa0c14-a203-1e0b-532d-846551ccaf36@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS3PR01MB8795:EE_
x-ms-office365-filtering-correlation-id: 9cf571d3-4b8c-445b-e82f-08dbc539ca0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dnjwS7Mlha/2OQKIRQ+nnrWb/CkXgBG7QnQnX9D+aoSCSMQ6WE+qMDsgy09CibPz8tBdTIg8cPepk7o4mVcZpKYGCmEwEdjaP6sb1BY1Yh6dt+mfzKQprC6Iwp8nFSYPMWZFI4sQllegyqcqjQs8YQE9ZFZiqBwAqNez00KgI5t4CRkYhYKWgqrh3jrU2PcDAv3+GRdSrgwWw0Fa/lllcHQocypOCekPcGpkRTOy4v1LEelOfkaI5s65LJcr2oVNPl3R3mgrzlQ1/oo/oqhhaRuB6Roj7yYJCu8fhCLktmePtKBJlHrCJhehcVd2VAtAO/qlIxrJU80fUwnO/wgU6CotwU3hRvj5iy0p1sOu7cQiKlfuF3wGpeTqlcwbTi3AA84GDo1weT3zUihiuKu6gLtuXXYqnE+NfRteH/T1jKupdUiXeJ12Kt3Bh2Matsh8adZ0QYzvnKX1B7dzD7crXg0XDOnoiJl+xOWCzCBIUDLMl/7Cf4A7jWP3v66wa58tQ0KoWW5Ke6oElOFoti19mRtB/1RqL6emY9oHf4oNwa9zs4fhiSixortLssGZ/V6jt+Lnv/vf1JDKMINMIxcBS9bh/LQOVUEPzJeH36incyREyHiQ284mZyzVCZ5rTNcY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(346002)(136003)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6506007)(7696005)(53546011)(71200400001)(478600001)(9686003)(2906002)(41300700001)(4744005)(316002)(54906003)(110136005)(66946007)(76116006)(66446008)(66476007)(66556008)(5660300002)(8936002)(52536014)(4326008)(8676002)(64756008)(33656002)(86362001)(122000001)(38100700002)(38070700005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnFWSWtnYzNEcWVOZndJVzlIdWFhYjhKdjB1OUNWZDJQL0FyNStubURwWFlL?=
 =?utf-8?B?Q3pCbFBJR3M5VklqS0ZadTh6TzdCajlYY0NqODk0MXY3U2lKOCt5R2huaGRi?=
 =?utf-8?B?bjMwa25RRkJVSU1pZjB2MFBxUXZNRWxSYkVLV04zWThKaHdaeWxNRzdxZG15?=
 =?utf-8?B?OVRqTThhZjhCNk42VzQvSGF2M2NmNW05QUM5L1g3SHZTSlYxSGU3aDJVcy9N?=
 =?utf-8?B?TVJ4dnFNZ2V1QVkvTjJnb0lZYzdtU3VFMTVkSjhhOTRRRng0MnE5VUMyK2Vu?=
 =?utf-8?B?ekFZSVV2V0pTSHE2OWRMa21kUWlXc1pVQlF2dXZnbW80VHNHQ1dUMW5nRWQy?=
 =?utf-8?B?NU1TbXZtY1JoaENBNnhCMWsyR3dYcG1Tdjk4NCtrd3VFY0NWcnNrdkVqRkxO?=
 =?utf-8?B?Qy9qSFNHendJeENQUW9JN1NJWlFTRjMxU1BsQ29LbWFlaEZSUEx5R2ZEYU9x?=
 =?utf-8?B?NFdBdHRqbEVvY0pUd25iNmc2TmlXOWpwclhBa09nUUNQUXZVQnZUNXYvbkRL?=
 =?utf-8?B?NXQvS1M2ZUczdU91NEdOZUVHdFNPeEN2NHVQNk5QTTk4YkhWWDY1NDEzclpI?=
 =?utf-8?B?cnovMlVENTJoN0NIaHRJZzNybStCcS9nbXZ5d2NybWNNSktSV0ZiNytCMmV4?=
 =?utf-8?B?eG1lc2JBUGRwQWsvSWxtSUJjSFVGbjhpT0YrM2tiU2tKeGw2N0NLVTBibTRH?=
 =?utf-8?B?SHl4NHhZMzZaVGQycGlSaEZpQXd0V0VzWnVBU1N1RkxoSHRwUlpWeTMvVk96?=
 =?utf-8?B?ak45TkFwWThhMUd3dXhqWFFCSGRmZ1FTZjEzVTZVbmFWZjFyVE1HSUloSWFs?=
 =?utf-8?B?YkNHa1U0NXdweWJkU0ZSYTB3MFA1Q3Q4S0ZPOHZEekJZN3dxQi9uK0NvQXdw?=
 =?utf-8?B?ZEVDK2kydGlMWEw4NUc5cEsyT1F3L1MrM2N5amsyaGlpQk5kdkhiNjI5Kzg0?=
 =?utf-8?B?TmMrd1BSRVNvNlZ1dWxlaGI4Ym8yL3JWYllybU9CVjY1S1liNFFpMW95T0ND?=
 =?utf-8?B?YlR6NW9KNXl1clBSdVVWZmtYM3lSSHBFNksybTRHVHdRWll1cW05VitPdHp5?=
 =?utf-8?B?MzRHb3JhaDlwNlZtUVZLOVFnQitwWXozdVdTU1pzeGk0T0FkQ3ZabGlwbE1Z?=
 =?utf-8?B?SzhGRVNUVHk1a3FqRjVXdlVPVk5qN2ZxbHFJOWJYMmRYc3hRNHBjV3UxQnBM?=
 =?utf-8?B?dnNEMVE3Nm9xdlh5NjJLNHBmcnVVRmxNYmR5aE1xM2dYL3hsVkdxeE5yY1Ft?=
 =?utf-8?B?Nm5tcVNzS1FVWlkvSnVUSkl4dW9mblZXOWdnTGoxQ1dxQlVEaDdPeTI1UDRB?=
 =?utf-8?B?aG56alFsbGQ3WGhaZ1ViMDNVc3dhcXljYWN5YStoaWVBY0pBTkxJZjZHa3dx?=
 =?utf-8?B?ZnR4d2lLeWJxQ1J5SE1nWXVIenJFUWpqS2xtWXhFSS9GN3NUMGcvY0ZQRlZ4?=
 =?utf-8?B?NUxEcWVac3RmN0JvK2doMzJUMEFLUmcvWWNoTGU2c3ZiR0ZvVmkzWmttZEVU?=
 =?utf-8?B?MFRqYVVLRWZpeGIwb1BKSktQcEsxZGgxeFQxRU5LM2g3ci8xbURQanpXcE5h?=
 =?utf-8?B?NDhxV280dGhmN21JTEFrUEFrVUZiVU9zVHFRK1B4WUpkd0xjUFM1R3BScVJ6?=
 =?utf-8?B?dzRuanNtZDd2Z3ZUb1M0ekRaamtuQmxkeXhBTThDUEROR3Z5ZVhwV0FVR2pJ?=
 =?utf-8?B?TG1xVnJ4VHFmeFZOUjJSbDVLS0EvTGRKTWZtN01BMWV5NDU1OEdzdHdrcWNG?=
 =?utf-8?B?RlkxZm15TUFKL2FBOG4yRGxnRUJSRmYvcUtJMDd5eW9PM0dXajkyYUtYTVpz?=
 =?utf-8?B?b2tHcm16OGhEa3NpT1dqb2MvRUd0aWpOY3A2TkJ1WWszeXROSmV4R2ZwUmFh?=
 =?utf-8?B?bnlEVHYwSGFSc1lFQkU1SzM2Ymh2UnZqNGtyOVYzN3IrQjdxVjBjK3lWeHVF?=
 =?utf-8?B?VWUwYkE3TU92MUFGWkg0eFF6dHowU2hjcUJqUGtDMWtqL202SVN5ZUJHeTR4?=
 =?utf-8?B?MEJRUEYzcDJVN1ByYUtHUnJ2REIxQWd4VU5uWURXSDNzdnNPbzlIN0hLMEsx?=
 =?utf-8?B?ZXJVVjBjRUFyZkQ5V1o3aTNrazVWdlg1SisxMXZFaTBJYzQzc25vL215c0tx?=
 =?utf-8?B?eTMvbjZ3MlM5SHQ3NVIydENlcFE3N0daZHNxZFZFaDhyQnJlbEhhbDRqOUYy?=
 =?utf-8?B?TEdkbk5TUmVqT1VpQUJuTHJZS1MweWF3RDkxaUthVEw2b0FIN3U2MTlGcnpV?=
 =?utf-8?B?aitSSTk1cFUxYm9pM0JWNkZMVC9nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf571d3-4b8c-445b-e82f-08dbc539ca0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 00:26:59.5998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3j33MwLk7cjaPuDlrajo8OU/8873Vp175zRgIpgPg8y0TaInLbnW7p7T28W8jWYAzC0hbYN7pBZc/r4jxraRtMpmCrI6AH6lITTLIiDx5+ozr9P9A+4v6DB8CMIZ01/8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8795
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gU2VyZ2V5LA0KDQo+IEZyb206IFNlcmdleSBTaHR5bHlvdiwgU2VudDogVGh1cnNkYXks
IE9jdG9iZXIgNSwgMjAyMyAzOjQ3IEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0IDEvMl0g
cmF2YjogRml4IGRtYV9mcmVlX2NvaGVyZW50KCkgb2YgZGVzY19iYXQgdGltaW5nIGluIHJhdmJf
cmVtb3ZlKCkNCg0KVGhhbmsgeW91IGZvciB5b3VyIHN1Z2dlc3Rpb24gaW4gb3RoZXIgdGhyZWFk
LiBJJ2xsIGZpeCB0aGUgc3ViamVjdC4NCg0KPiBPbiAxMC80LzIzIDEyOjEyIFBNLCBZb3NoaWhp
cm8gU2hpbW9kYSB3cm90ZToNCj4gDQo+ID4gVGhlIGRtYV9mcmVlX2NvaGVyZW50KCkgaW4gcmF2
Yl9yZW1vdmUoKSBzaG91bGQgYmUgY2FsbGVkIGFmdGVyDQo+IA0KPiAgICBIb3cgYWJvdXQ6DQo+
IA0KPiBJbiByYXZiX3JlbW92ZSgpLCBkbWFfZnJlZV9jb2hlcmVudCgpIHNob3VsZCBiZSBjYWxs
ZWQgYWZ0ZXIgdW5yZWdpc3Rlcl9uZXRkZXYoKS4NCg0KSSBnb3QgaXQuIEknbGwgZml4IHRoaXMu
DQoNCj4gPiB1bnJlZ2lzdGVyX25ldGRldigpLiBPdGhlcndpc2UsIHRoaXMgY29udHJvbGxlciBp
cyBwb3NzaWJsZSB0byB1c2UNCj4gPiB0aGUgZnJlZWQgYnVmZmVyLg0KPiA+DQo+ID4gRml4ZXM6
IGMxNTY2MzNmMTM1MyAoIlJlbmVzYXMgRXRoZXJuZXQgQVZCIGRyaXZlciBwcm9wZXIiKQ0KPiA+
IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEBy
ZW5lc2FzLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBTZXJnZXkgU2h0eWx5b3YgPHMuc2h0eWx5
b3ZAb21wLnJ1Pg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQpCZXN0IHJlZ2FyZHMs
DQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IFsuLi5dDQo+IA0KPiBNQlIsIFNlcmdleQ0K
