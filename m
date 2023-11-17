Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C01387EEA41
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Nov 2023 01:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbjKQAQq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Nov 2023 19:16:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjKQAQp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2023 19:16:45 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2092.outbound.protection.outlook.com [40.107.114.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A80FAD;
        Thu, 16 Nov 2023 16:16:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDigPc4sTkmiYRWd0Bdq9MBA6THKfcbdjVphwYq8yA94Ayit/xiFICZs6tn2DCFxnQSSmOX6zdWH0aw0xBdfVLwtG5/DKsRVm0tvKc7D95L2XWetktiMkzar6cZk2l2f12biF9Dxvu4JLuiW4RrlzGsM2TUelFnp+sNwlcmcCN0eS0q/NWNZ9h/AiolJIdHR2Ppx5NAwQcQS9RKV2Fwu1056wvMkPtoymZG2SQq/zV88XOPSO2zheCIFN+c/tV/G+vaObxlFJ9Hqf6Mee3FVAWGnNPG2goE5EM9+oKYGJ+H9b5iMrlJLSlbSIL0RxCIY8xWTJqWvfjILQiGdZ3QybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+myXBWJQSfIty3KY2wsFwOrt5oQispuVoQJndl5qyCk=;
 b=YdjbunFuWOctUU/3nB0KZhj4uOUoH6DVKSZnwcOua1Pmhe3f3/7pQfoN9xDwUIa2dGuK5uco1kR0HKbSRjIhkiZC5LmQW4CP8KY5KWqnxW5/XtiJKQTtYK8g9FAM2ynwLkukJXv7HmATz4ToVuDyolGVUqVzqzF791OrtXQMZ/LHkQwynnIt6M5CCZHOZJpF83fvRydmcivbqZ7UTXFFl7un6zemUWHVR2d3kAlKAccf8/36jKceVOI/G1xAnzmCexdFLytfxriOmLU4C51QEjfsu5QEOE9WkbThs57FE76E/gIij49e/sioCGFkpB4wOVzy/7vH23BApVgZwxI88w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+myXBWJQSfIty3KY2wsFwOrt5oQispuVoQJndl5qyCk=;
 b=QU++inNSovmG1QTymyft4UpvxMikVzcMJGEjwOH8dJGnpDI5UnJNZztu5ECwTQGp94t9Zlb448nFyfUMZDrEC6XUACIHopuNAXNvZHrC/XbzwT5yftlwS5xrgJAvmxl5DSrChaE+E+nLTA94ybQAXcrQDp2WU0RL4QyYQinA6sE=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB10404.jpnprd01.prod.outlook.com
 (2603:1096:604:1fc::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Fri, 17 Nov
 2023 00:16:38 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%7]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 00:16:38 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@kernel.org>
Subject: RE: [PATCH net v3] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
Thread-Topic: [PATCH net v3] ravb: Fix races between ravb_tx_timeout_work()
 and net related ops
Thread-Index: AQHaF2s87xPKvfomxU6H13dEu47X9LB7tqwAgACDB4CAAQsJgIAAYM7Q
Date:   Fri, 17 Nov 2023 00:16:38 +0000
Message-ID: <TYBPR01MB5341C76C88DF63DD3BB6ABC0D8B7A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231115022644.2316961-1-yoshihiro.shimoda.uh@renesas.com>
 <903d8187-3979-22b4-0849-43e84560ea4b@omp.ru>
 <TYBPR01MB5341209D8B6E97F8C0AE9DCFD8B0A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <27ea10c1-a975-f13e-dc4f-1fa0b5766406@omp.ru>
In-Reply-To: <27ea10c1-a975-f13e-dc4f-1fa0b5766406@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS3PR01MB10404:EE_
x-ms-office365-filtering-correlation-id: b72e577a-6bd6-4765-608f-08dbe7027754
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q9nZKfgi4pCyv6AzYXEde86QuK/BoZ4KHsoUJgXH/8Tfr8Meuql+p92KZ7e9+mjKrDjx7W+t80TtzHVg7aipB6qRVAcbV5cnXP6wHo1rN1RykOu1z5VdvOlD8vbvA2WtwKafURPE5+Z6emwElxd1Q4UckhBr46mol71J2NP4cPJkT1iV3yzdK5ArRGdyrjPK5MfqMK2mgF62T2+ts8nUYPwU5JXG8IZPORFURCK/UlX3M8qnOO8gpuwUFDXqFUwZQN07XkTdLonBtwlC+dwnwL0exzbfAUutKSG4bXsMyvHdf8WHv4+K6VJ3YGf6Oj4id+UYPnjMXM8HvQfMOD0v/dEcRI+l9tycd6PyBU6HMYeJZ72AQ7sciM5Y2wQByyk3Tn/HaLQ0yPvMj4RIRUyKrSzAYuZc8a1EG4jLLOVixT2C6X1auSaDiL7DusVB5JGz4FfTj1lj971bIdRKAY8aPXK9sbOTdTOTP3tXUad6M/CikaPTldT0ABjI6sR5oUKfQDPs88MP6abq4nLkq/3N7U3GUeDuzpIaTxu/l5J1BEb+6coi7w5UMuCN7SsnxVwAvrCq4vvLA0vuFu8jEOam+zMO8JOPSXkJnHeXymXk5mhywTlGpUYA07s2uR32ecrs
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(38070700009)(55016003)(6506007)(2906002)(122000001)(38100700002)(86362001)(5660300002)(33656002)(9686003)(83380400001)(53546011)(7696005)(71200400001)(41300700001)(4326008)(478600001)(66446008)(110136005)(64756008)(66946007)(66476007)(66556008)(8936002)(54906003)(76116006)(8676002)(316002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2lBNDErU01ZNzJqcjFWVEp2anNndTVNVzV4cDJkS0tlWjdxaDRFRHNsL094?=
 =?utf-8?B?aHhRV0FQbDNqcVdNUjRKZXkyTVQ4U04xUSthT1ZuQURVb1VPa1lnSDluZ3Zy?=
 =?utf-8?B?Qk1Ma0FtYWxuYU5iTXV1c2ZVVU5RMUVPU0FOaVlIUHh5bjFsSDZVZjcybmNu?=
 =?utf-8?B?U0d5aFlSY1pkaHgwRjl2UFFsR1hRdWtCTTF0RDhrbmtMZ05TdUs4VmtaVHJa?=
 =?utf-8?B?S1NPcmFJRWRpVEt6V0hDRDBYK1RWdUFqZG1rcnU4ZFFMWEpCeWtWcDdIa0xa?=
 =?utf-8?B?TmRkWkV4WHEvR2xZV25uY1o2UnpzSkhsbTYrRVQ2bW1jTHgvbjFiUFFMd3ZI?=
 =?utf-8?B?eng4ek9FYmNlQ3huMkJOQXhUQ2szc3J2b3R0c2VUOFlONllOTGdxaFJaQnVy?=
 =?utf-8?B?NEc4RXN1aER0UUpQVWg0RVY3VHNiZ1VZZmgxdjJMancrcnBtVVFQY3VQTk1q?=
 =?utf-8?B?Vnc2SXFrOUl4S0YwZURLLytJenNHOWxGQitEb0NXNjIreGpoWGJBbmxNUXVH?=
 =?utf-8?B?VTU0T2xTaG1jRUZaTG1yTmN2Z2l0VHhETHBmc3JTbDRBWlFtQklyc3NEek5w?=
 =?utf-8?B?dWw0ZHJieUNuV1dLNWVkRWhrdGppRWErbEdEclVGZFcrMFM1cEM4M1l6NEVw?=
 =?utf-8?B?dnkvby9Ba3JMZ0xRelRGSTFaZmwvbWtXK1FwSFJKUG5zeDZiWmY2K1RQaHFr?=
 =?utf-8?B?M3hzM1RjOUViSTFEZ1Rnb2kvcVBPWlhnanUrd3dqdXJZaW9HNER4UG5NdGts?=
 =?utf-8?B?eWZSYUlRSjVpQlZsUTVjcFViZDVraTFZY0EwT3pTb1gxWFBwZU5zREJJKzNF?=
 =?utf-8?B?VnVMV21PUGZ0QVBjRHVQTko4Znc3NHZuV0dMOFp3RjhDNk5ZTWt4QWQzYy9T?=
 =?utf-8?B?WU9wRUJYSjIxOGxEZmE2Qm1XZkZiSUxMZ3d6bHNUQ3krbVhkZ1FXeTVQZjkz?=
 =?utf-8?B?QitRMmIyY1p3dTFmMDdteHMycDR1LzZ4TmRnWldpNWsyeTJsMzRQOWpJUWl0?=
 =?utf-8?B?ZVdDTDJBaE1GblE1dnpQUE9FL0FReFNJcFpKZXo4a0syNUh0SU9sT0QwbllC?=
 =?utf-8?B?Y0tKYUVXQTVYNGtYN0RjbWo2RFdQTWM2dEFvVlhVS3g2WEZuOUZKKzJNYzkv?=
 =?utf-8?B?N21uZWRHMmUyTnNZN0dPaFRTZzZwZVlvZlkvMldmOFVEOVZTWllXWlI2VFcz?=
 =?utf-8?B?Nk9PNXdnYlFpQnJGMnFVRkhwNzF0VzgrYll2eXhiR1BLSUwxTVViMzVWajFk?=
 =?utf-8?B?dFoyb0NsMC9HbXR4dzdoUDFiZldSNUNpamlJeG9ueTlTVGcxNjB1bDZwZTB4?=
 =?utf-8?B?MnpmWWQvd0JRcGRNOGdJZnljK0xKa3N4cFpqNFhOQWxUaGFtNDdwMDFVU0k5?=
 =?utf-8?B?STdsMDdINzZ5bW1nWGRPUDFYaHl6V09EZVZmVldDdzdOemZYTDNTYWRMa1JT?=
 =?utf-8?B?NTczRk9BNmlIZFhoNkkrTzJ3VGhDVW5CSERsMlE1bk1tOVNjWWkweEVZckV5?=
 =?utf-8?B?UTZuZ25scDVCMENQemlBNjhoaXdFcFkwelFWR0xtVkFaVWhlSVg4dlNHb3NU?=
 =?utf-8?B?N0szNXBheG1EN3BPYjdwRXpaVlRLbW41U1gyQnl4Y3MzUFVVMGNrZnltNW94?=
 =?utf-8?B?RGtYQVJuS1pqZjN5eWJkRzloV0syb2dGNEEramlLZkJjY2VBTGJ2NlJLMkRU?=
 =?utf-8?B?eEtOeGJ5RDh0c2VlOXVzRGRVMThTY3plNiswNHJSdmdPOWU5aGcvNFNqRlF6?=
 =?utf-8?B?Q2R5M1ByTG82TXBWbnBISTJrc2owNHNqeU1SZ0FnTlRnNUxMbllRalhTdEM0?=
 =?utf-8?B?NWhDcnliMGIzZ0x5ZzBaTytMZEdsazNlTHJnR1RaaXNZbGNMMy9CalV3czB4?=
 =?utf-8?B?ekNVV1BBcmlXQU9QLzJhUW1lL2l4THN5QklzS2hWYlNPKzRQNTdQRUZ4c1lI?=
 =?utf-8?B?SXpXT3RjMU4vRERqYjZFMXpNZ1VrWjFZeWxTYjRCM1R4SDROTHN6cS9uYmpx?=
 =?utf-8?B?dDJnSGZQbmJFM2ZBNktyZXlGdWtiTUVlV1VGTnJKbjVQeWNld0psWC9sS1NR?=
 =?utf-8?B?ZDgxU3VjaUtnaFRaOE4wTXp3WkNsc0d2amwrdHdMandkT014UEdwU0xueHJF?=
 =?utf-8?B?SFA1V0YxRjRSY1RCMC9qUFZ2RSs5d0U0SXhMNkJCMkM4aTlpSitLQVgwQzJI?=
 =?utf-8?B?em51MXhFVCtjdm1yY01SbkNiSHh3Y2VLa0dBTXdrRjZrYU5vY0pOckpkd1FI?=
 =?utf-8?B?YjlMTmlFektNSTcyNmRKamU2Vld3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b72e577a-6bd6-4765-608f-08dbe7027754
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 00:16:38.0839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0l5zTdF74ZaSZ0iBg0OIfXfVgQjHrjJQogdaUcVwgnARXn0R+G6ppaZzZhLQ8HhP02kO228nIYbrBLqScoPnasROrnrV7n7Z6U5B+wg3L3BgH3+nc+RQpEcIHq4wTO3X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10404
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiBGcm9tOiBTZXJnZXkgU2h0eWx5b3YsIFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMTcsIDIwMjMg
MzoyMiBBTQ0KPiANCj4gT24gMTEvMTYvMjMgNTo0MyBBTSwgWW9zaGloaXJvIFNoaW1vZGEgd3Jv
dGU6DQo+IFsuLi5dDQo+IA0KPiA+Pj4gRml4IHJhY2VzIGJldHdlZW4gcmF2Yl90eF90aW1lb3V0
X3dvcmsoKSBhbmQgZnVuY3Rpb25zIG9mIG5ldF9kZXZpY2Vfb3BzDQo+ID4+PiBhbmQgZXRodG9v
bF9vcHMgYnkgdXNpbmcgcnRubF90cnlsb2NrKCkgYW5kIHJ0bmxfdW5sb2NrKCkuIE5vdGUgdGhh
dA0KPiA+Pj4gc2luY2UgcmF2Yl9jbG9zZSgpIGlzIHVuZGVyIHRoZSBydG5sIGxvY2sgYW5kIGNh
bGxzIGNhbmNlbF93b3JrX3N5bmMoKSwNCj4gPj4+IHJhdmJfdHhfdGltZW91dF93b3JrKCkgc2hv
dWxkIGNhbGxzIHJ0bmxfdHJ5bG9jaygpLiBPdGhlcndpc2UsIGEgZGVhZGxvY2sNCj4gPj4+IG1h
eSBoYXBwZW4gaW4gcmF2Yl90eF90aW1lb3V0X3dvcmsoKSBsaWtlIGJlbG93Og0KPiA+Pj4NCj4g
Pj4+IENQVTAJCQlDUFUxDQo+ID4+PiAJCQlyYXZiX3R4X3RpbWVvdXQoKQ0KPiA+Pj4gCQkJc2No
ZWR1bGVfd29yaygpDQo+ID4+PiAuLi4NCj4gPj4+IF9fZGV2X2Nsb3NlX21hbnkoKQ0KPiA+Pj4g
Ly8gVW5kZXIgcnRubCBsb2NrDQo+ID4+PiByYXZiX2Nsb3NlKCkNCj4gPj4+IGNhbmNlbF93b3Jr
X3N5bmMoKQ0KPiA+Pj4gLy8gV2FpdGluZw0KPiA+Pj4gCQkJcmF2Yl90eF90aW1lb3V0X3dvcmso
KQ0KPiA+Pj4gCQkJcnRubF9sb2NrKCkNCj4gPj4+IAkJCS8vIFRoaXMgaXMgcG9zc2libGUgdG8g
Y2F1c2UgYSBkZWFkbG9jaw0KPiA+Pj4NCj4gPj4+IEFuZCwgaWYgcnRubF90cnlsb2NrKCkgZmFp
bHMgYW5kIHRoZSBuZXRpZiBpcyBzdGlsbCBydW5uaW5nLA0KPiA+Pj4gcmVzY2hlZHVsaW5nIHRo
ZSB3b3JrIHdpdGggMSBtc2VjIGRlbGF5ZWQuIFNvLCB1c2luZw0KPiANCj4gICAgQWgsIHlvdSBz
YXkgMSBtcyBoZXJlIGJ1dCAxMCBtcyBpbiB0aGUgY29kZSEgTm90IGdvb2QuLi4gOi0pDQoNCklu
ZGVlZC4uLg0KDQo+ID4+PiBzY2hlZHVsZV9kZWxheWVkX3dvcmsoKSBpbnN0ZWFkIG9mIHNjaGVk
dWxlX3dvcmsoKS4NCj4gPj4+DQo+ID4+PiBGaXhlczogYzE1NjYzM2YxMzUzICgiUmVuZXNhcyBF
dGhlcm5ldCBBVkIgZHJpdmVyIHByb3BlciIpDQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhp
cm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ID4+PiBSZXZp
ZXdlZC1ieTogU2VyZ2V5IFNodHlseW92IDxzLnNodHlseW92QG9tcC5ydT4NCj4gPj4NCj4gPj4g
ICAgSG0sIEkgaGF2ZW4ndCByZXZpZXdlZCB0aGlzIHZlcnNpb24uLi4gOi0pDQo+ID4NCj4gPiBP
b3BzLCBJIHNob3VsZCBoYXZlIGRyb3BwZWQgdGhlIHRhZy4uLg0KPiA+DQo+ID4+PiBSZXZpZXdl
ZC1ieTogU2ltb24gSG9ybWFuIDxob3Jtc0BrZXJuZWwub3JnPg0KPiA+PiBbLi4uXQ0KPiA+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yi5oIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiLmgNCj4gPj4+IGluZGV4IGUwZjgyNzZjZmZlZC4u
ZTliYjhlZTNiYTJkIDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVu
ZXNhcy9yYXZiLmgNCj4gPj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2
Yi5oDQo+ID4+PiBAQCAtMTA4MSw3ICsxMDgxLDcgQEAgc3RydWN0IHJhdmJfcHJpdmF0ZSB7DQo+
ID4+PiAgCXUzMiBjdXJfdHhbTlVNX1RYX1FVRVVFXTsNCj4gPj4+ICAJdTMyIGRpcnR5X3R4W05V
TV9UWF9RVUVVRV07DQo+ID4+PiAgCXN0cnVjdCBuYXBpX3N0cnVjdCBuYXBpW05VTV9SWF9RVUVV
RV07DQo+ID4+PiAtCXN0cnVjdCB3b3JrX3N0cnVjdCB3b3JrOw0KPiA+Pj4gKwlzdHJ1Y3QgZGVs
YXllZF93b3JrIHdvcms7DQo+ID4+DQo+ID4+ICAgIE5vdCBzdXJlIHRoaXMgaXMganVzdGlmaWVk
Li4uDQo+ID4+ICAgIFRoZW4gYWdhaW4sIHdoYXQgZG8gSSBrbm93IGFib3V0IHdvcmtxdWV1ZXM/
IE5vdCBtdWNoLi4uIDotKQ0KPiA+DQo+ID4gSSB0aG91Z2h0IHRoYXQgdGhlIHNjaGVkdWxlX3dv
cmsoKSBjYWxsZWQgdGhlIHdvcmsgZnVuY3Rpb24gaW1tZWRpYXRlbHkuDQo+ID4gU28sIEkgdGhv
dWdodCBjYWxsKmluZyB0aGUgc2NoZWR1bGVfd29yaygpIGZyb20gdGhlIHdvcmsgZnVuY3Rpb24g
Y2F1c2VkDQo+ID4gZW5kbGVzcyBsb29wLiBIb3dldmVyLCBpdCBpcyBub3QgdHJ1ZS4gVGhlIHNj
aGVkdWxlX3dvcmsoKSBqdXN0IGluc2VydHMNCj4gPiBhIHdvcmsgcXVldWUsIGFuZCB0aGVuIHRo
ZSBrZXJuZWwgY2FsbHMgdGhlIHdvcmsgZnVuY3Rpb24gbGF0ZXIuDQo+ID4NCj4gPiBTbywgY2hh
bmdpbmcgZnJvbSB3b3JrX3N0cnVjdCB0byBkZWxheWVkX3dvcmsgaXMgbm90IG5lZWRlZCBmb3Ig
Zml4aW5nDQo+ID4gdGhpcyBpc3N1ZSwgSSB0aGluayBub3cuIEhvd2V2ZXIsIEkgaGF2ZSBhbm90
aGVyIGNvbmNlcm4gYWJvdXQgcmVzY2hlZHVsaW5nDQo+ID4gdGhpcyB3b3JrIGJ5IHNjaGVkdWxl
X3dvcmsoKSBoZXJlIGJlY2F1c2UgaXQncyBwb3NzaWJsZSB0byBjYXVzZSBoaWdoIENQVSBsb2Fk
DQo+ID4gd2hpbGUgdGhlIHJ0bmxfbG9jaygpIGlzIGhlbGQuIFNvLCBJIHRoaW5rIHdlIHNob3Vs
ZCBjYWxsIGEgc2xlZXAgZnVuY3Rpb24NCj4gPiBsaWtlIHVzbGVlcF9yYW5nZSgxMDAwLCAyMDAw
KSBmb3IgaW5zdGFuY2UgYmVmb3JlIHNjaGVkdWxlX3dvcmsoKS4NCj4gPiBCdXQsIHdoYXQgZG8g
eW91IHRoaW5rPw0KPiANCj4gICAgSSB0aGluayB0aGF0IGEgc2xlZXAgYmVmb3JlIHJlcXVldWlu
ZyBpcyBwcmV0dHkgbXVjaCB0aGUgc2FtZSBhcyB1c2luZw0KPiBhIGRlbGF5ZWQgd29yay4uLg0K
DQpJIHRoaW5rIHNvLiBTaW5jZSB0aGlzIGlzIGEgZml4ZWQgcGF0Y2gsIHVzaW5nIGEgc2xlZXAg
ZnVuY3Rpb24gaXMgYmV0dGVyIHRoYW4NCmNvbnZlcnRpbmcgZGVsYXllZF93b3JrLCBJIHRoaW5r
LiBCdXQsIHdoYXQgZG8geW91IHRoaW5rPw0KDQo+ID4+IFsuLi5dDQo+ID4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21haW4uYyBiL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWluLmMNCj4gPj4+IGluZGV4IGM3MGNmZjgwY2M5OS4u
Y2E3ZGI4YTViNDEyIDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVu
ZXNhcy9yYXZiX21haW4uYw0KPiA+Pj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNh
cy9yYXZiX21haW4uYw0KPiA+Pj4gQEAgLTE4NjMsMTcgKzE4NjMsMjQgQEAgc3RhdGljIHZvaWQg
cmF2Yl90eF90aW1lb3V0KHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2LCB1bnNpZ25lZCBpbnQgdHhx
dWV1ZSkNCj4gPj4+ICAJLyogdHhfZXJyb3JzIGNvdW50IHVwICovDQo+ID4+PiAgCW5kZXYtPnN0
YXRzLnR4X2Vycm9ycysrOw0KPiA+Pj4NCj4gPj4+IC0Jc2NoZWR1bGVfd29yaygmcHJpdi0+d29y
ayk7DQo+ID4+PiArCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmcHJpdi0+d29yaywgMCk7DQo+ID4+
PiAgfQ0KPiA+Pj4NCj4gPj4+ICBzdGF0aWMgdm9pZCByYXZiX3R4X3RpbWVvdXRfd29yayhzdHJ1
Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+ID4+PiAgew0KPiA+Pj4gLQlzdHJ1Y3QgcmF2Yl9wcml2
YXRlICpwcml2ID0gY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCByYXZiX3ByaXZhdGUsDQo+ID4+
PiArCXN0cnVjdCBkZWxheWVkX3dvcmsgKmR3b3JrID0gdG9fZGVsYXllZF93b3JrKHdvcmspOw0K
PiA+Pj4gKwlzdHJ1Y3QgcmF2Yl9wcml2YXRlICpwcml2ID0gY29udGFpbmVyX29mKGR3b3JrLCBz
dHJ1Y3QgcmF2Yl9wcml2YXRlLA0KPiA+Pj4gIAkJCQkJCSB3b3JrKTsNCj4gPj4+ICAJY29uc3Qg
c3RydWN0IHJhdmJfaHdfaW5mbyAqaW5mbyA9IHByaXYtPmluZm87DQo+ID4+PiAgCXN0cnVjdCBu
ZXRfZGV2aWNlICpuZGV2ID0gcHJpdi0+bmRldjsNCj4gPj4+ICAJaW50IGVycm9yOw0KPiA+Pj4N
Cj4gPj4+ICsJaWYgKCFydG5sX3RyeWxvY2soKSkgew0KPiA+Pj4gKwkJaWYgKG5ldGlmX3J1bm5p
bmcobmRldikpDQo+ID4+PiArCQkJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZwcml2LT53b3JrLCBt
c2Vjc190b19qaWZmaWVzKDEwKSk7DQo+IA0KPiAgIFlvdSBjb3VsZCByZXVzZSBkd29yayBpbnN0
ZWFkIG9mICZwcml2LT53b3JrIGhlcmUuLi4NCg0KSSB0aGluayBzby4NCg0KPiA+PiAgICBUaGUg
ZGVsYXkgaXMgcmF0aGVyIGFyYml0cmFyeS4gV2h5IG5vdCBlLmcuIDEgbXM/DQo+ID4NCj4gPiBJ
IHRoaW5rIHRoYXQgMSBtcyBpcyBlbm91Z2guDQo+IA0KPiAgICBTZWVpbmcgbm93IHRoYXQgMSBt
cyB3YXMgaW50ZW5kZWQuLi4NCg0KWWVzLi4uDQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBT
aGltb2RhDQoNCj4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gWW9zaGloaXJvIFNoaW1vZGENCj4gDQo+
IFsuLi5dDQo+IA0KPiBNQlIsIFNlcmdleQ0K
