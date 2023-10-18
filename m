Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25BB67CD861
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Oct 2023 11:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjJRJj3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Oct 2023 05:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjJRJj2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Oct 2023 05:39:28 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8EE39D;
        Wed, 18 Oct 2023 02:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMgWMqLPkr1rqIkHAUFTTcpTkGrmW9WfxWHp+67AeoIUKbnETGZ4gqgOLmyMjo5hQPIZNFj75UZ4DwGEYA6Htc88LFGFIRVRdp8idKb3oN67PC87xkNIwGDtJvR904/97p4LgHupWTHWbqGDuTRE7s/aynpb7prx4YP4xHmgOiMWtD+Ef+Md0hDBmvSmC85Bf9T1IWdmKqFzxYVc43UESKrlFcVb+gbfUifsW33NmswBXO/PKE/eqNfuttRjBb2NgZwwRkV0eMcmjICnuYT2TsbL1Scn1bYR98MBe9tixgtGP8xbfMv4PE712iWU8ZS364wfu4QCSn4r3IaDIN8gvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gMQbnTCTd2t43WQFdCjz18ZuQd87l77ZL/72OP6hm4=;
 b=gnUUgNyU8IX8mds898qml275BmhYBIU8UQ5PvZN8Lui/7IAKwFA4Mpn0CYRu6Tz6CnaoLOUslyMpllQ6ajDr9btIPV0Y45aYrTRhiZdx30TA5qmLDbNiLGUzcBsaGMMVe94OfmpVtEvGPOmZB+HwxhSdfZOHqr5Vq8O8pqiokal5CgTM0UhzbUvX3gtiJJxBIQQmx5WgWL9/igfGDs6IDXfSQB5jFTT/z3DZorUOZwjZBQOyqs0q44MCnaOONuybQai3G8N8rLl6bvp03cINuh1I6MJ9ge+y50JnSEKGOxtZg6aqFn5//0rzAvN6nXcTQK5ZLc6/Nx1fgQgguP7ryg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gMQbnTCTd2t43WQFdCjz18ZuQd87l77ZL/72OP6hm4=;
 b=aCB/XoiPr8XhBh5Lfibcp7ZN30Cbsl1IFpap58xDzlRigYRJ0EDsWQF7t7yQhbAhtq9ryJKERwR3gAh91RYJgbDuTLdPXzka9dsTL6FHUuUQNzRJAV8QQf6hmhhzQkJkmdnzc3aLkeEs2v8It24Q3bg9JK8GIa5QGQvmypsilKA=
Received: from OSYPR01MB5334.jpnprd01.prod.outlook.com (2603:1096:604:8a::15)
 by TY3PR01MB10468.jpnprd01.prod.outlook.com (2603:1096:400:310::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Wed, 18 Oct
 2023 09:39:22 +0000
Received: from OSYPR01MB5334.jpnprd01.prod.outlook.com
 ([fe80::4509:6a2f:2bbd:a23]) by OSYPR01MB5334.jpnprd01.prod.outlook.com
 ([fe80::4509:6a2f:2bbd:a23%4]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 09:39:18 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
Thread-Topic: [PATCH net] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
Thread-Index: AQHaANdzUqvglpER9EWPMMq36hSU3bBOVi4AgADupUA=
Date:   Wed, 18 Oct 2023 09:39:18 +0000
Message-ID: <OSYPR01MB533414034BFE166BA7344025D8D5A@OSYPR01MB5334.jpnprd01.prod.outlook.com>
References: <20231017085341.813335-1-yoshihiro.shimoda.uh@renesas.com>
 <7b153bc6-2094-eee5-f506-0c1615032edb@omp.ru>
In-Reply-To: <7b153bc6-2094-eee5-f506-0c1615032edb@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSYPR01MB5334:EE_|TY3PR01MB10468:EE_
x-ms-office365-filtering-correlation-id: 11d817c0-026c-4e26-37b2-08dbcfbe19d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0zXMG39z6KIKo3GD5vkUQDFuz13oKQUBEsi2RRPT7UqkrZ9wnuf4/q8pNIkPw9vww8y0qd102KMW3pQJCh27T1oybOOEokHHAU2IhAqLNdkHJk1Wd8AbNJ+QeQw7het9wLIYO5FqBCDDwLkA1X+WYKzREVLXO77n+YkcbWPFqK66kYBh/dnbS66DWqNvgS7LtsZ/AID9lu2QuagDRdihXc+GAlyCbMhH8at21eCLQjZUDn0PRZwVE4us0/brEYeua0Zj/9HBDIpW0OeYTfsnRmIuA98DSXdoEbFhZSR79dBwRpmjrR03NoFvmqcpPneprHavzT475AO53Wi+jxPLfM/PSSrMCtqrsHGKN38wJo8iQJTPwpXhpUMiCP3cALKOIGdd5cBCI+iCX9HRzRrru078oW3Sx7fGEIls2LpFoxwG00WNYT6YFxluwG7DKwP3r0IEIenzLG2huC3yDZL4/TepinMxeotz3PKg70JSyZaWIzIiOIAlEGzygn/XbRWW71WrVhkk+9AnzDJ22cA6l93gVNILRCQNUqWKFyOm2ov/EttkBRAvVxSkP78+fevJR8HM/HkV5ayq70b3i1F2jTTuzmpqqMDpMI8grQdsLRkRvO3oADo/5gW83s0vWRll
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSYPR01MB5334.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(33656002)(55016003)(66476007)(316002)(66556008)(64756008)(38100700002)(54906003)(110136005)(86362001)(66946007)(122000001)(38070700005)(66446008)(83380400001)(53546011)(76116006)(26005)(71200400001)(9686003)(6506007)(7696005)(478600001)(8936002)(8676002)(41300700001)(52536014)(2906002)(4326008)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Umk5eE1TUFpkZlNNTEZxWitIbmQ1eUdTTzBJcy9xZGErWFdCNWFIUGM0cGdS?=
 =?utf-8?B?bHY5clFxcFdHSjZiblB6c3ZVcEd3WEtUcUMvMms5elZESFJ0disvQ21FRWtY?=
 =?utf-8?B?TExEOEEwLzd5emtrU2xld1I5OHJGUThkVzkwQTJpcXczN0hGanlxWTNZL0s0?=
 =?utf-8?B?N1plOFpDNHNlOHdQQ3lNTXFvaWJEeUVSK0xRdTJGV0FyY1Y2VDErbXB3MEVR?=
 =?utf-8?B?NHMzWUluSktub0NNT2lDQ0pHMkhzbDRFaXg5L2lrcEJOSmRSVUdOSVk2TXd0?=
 =?utf-8?B?c2MyRGhlb2dkcDdsMW9MT1hpSmZkc3FuSmUxcUZWZjVtSHVCbzNPN3lKeWta?=
 =?utf-8?B?ck5mSlBWT0h1a0F5Wng1Y0lVSEp3YXcvbGZlYnpXcURqaVo4Ty9QQ3Q1T0Qz?=
 =?utf-8?B?ckwyamJCVUJLQk96TnQxdmZwZmtpMjFtaWsxRGg2QXJxL05IRmlYOTF4Qnl4?=
 =?utf-8?B?YW5QMnkyL2g2U2lBdmZ3cHZmZGlrUGtwUndrUm56Y0c3cDVaK3BuRVlNZ1pP?=
 =?utf-8?B?ZEVZUEtUSTFMMVVQSHJFc3hOT3ZmMXBheUtvS2Nta3Vwc3pCUW1xejM3RnUv?=
 =?utf-8?B?NXZpM1E4RnFURkZ5aGZJZ29Ncy9Paklta0d2ZmVNZ2ZpREl1SVp6T3hJVUVB?=
 =?utf-8?B?eldWdS9xZFZBVlZicW5tTlMwZitsbVFuN1E5bXJmaGJQQkZwNFdHZkUxK3NX?=
 =?utf-8?B?OTdLYTBIdlNpa1RUNmxiTUo5UFF6TldhSWZycGhyd1EvL0ZPS2ZkaW1Gb2NU?=
 =?utf-8?B?MTZBUFdKeDNwL29EWXlmVTMxdGlqdzVESWZYS0pqd25STmRYWE0yYThFQUdi?=
 =?utf-8?B?L21zdVBxYWcrZVVMVVhWU3duQzFDZVdJanFILzNtb2RoQkhLSnJLVkhlNktQ?=
 =?utf-8?B?SzhDSUtQWE4zc2VXczdjUlRYTVVUdDhTN2ZMNE53YmlsTFhBOENVNFVibFR1?=
 =?utf-8?B?UmRMNFpkMitWRmJGZ3J4ZFRHTXp0WjFNS0tobmRnbFkyTnkyMm1ZMDVUckVJ?=
 =?utf-8?B?dTIvQ3RoZFFwVmQyUjk0b1U1dE9EMGswYUtieTZDYVBkNWVpZzRiRy9kTjlM?=
 =?utf-8?B?aExTa2pIYmVTOTRmb1FTRmdWcVpVVFgzbFFVa3kzUC9nWEJaN0R5VUdLY0VW?=
 =?utf-8?B?aEREMVdZUG94S2J1SHZzS24wcndCam4wZ1I4WU9sbjdoeGNjQmNiYjh5dEg3?=
 =?utf-8?B?end5S3dITEVxcHZuckQ5Wkl2T01wZVQ0ZU96YmgwVGF5V2p6UnFQZDNJYmFU?=
 =?utf-8?B?MGNPSUVsc3ZBRms2dHU5dzdLWFBEZWp5cEp5YkZ3bSt2Wk1jdnpmOHJycjVC?=
 =?utf-8?B?MXVCczdPUlNoeGMxOFZ1dzRNUlc4QnQ1d3VRdU1UeGVXRXgvaFpJY2pobUpG?=
 =?utf-8?B?MHYzMHZRSkVXZmYxck1iQUFMRWNqbTRQVS9taTV1emcrcXF6SkNwTXBiQnFo?=
 =?utf-8?B?RXBPVXVlMTQzSjVLQ1Rkc2FoKyt4NDJWUjV4T2RSM2VhK2VZcGljbWU0ZWJX?=
 =?utf-8?B?MlFLRXN5TTNJWmpGdHB0RW5BMGlOVGIvWGo1SHVVSm14TVREZE5lL1YzbkZF?=
 =?utf-8?B?dWhjTjBvdExFVkRUZzdjbXNnQmhOZXZ4dHBrUHQ4YTFUVEhqOW9zeUNmekd2?=
 =?utf-8?B?Z2E3d0lHVjNwOHJGcllaWFhwMVV2dnpmWmEzNUZCb3JoanpaSVoyMzkrR3Iy?=
 =?utf-8?B?bGZ6LzBERkVhMy9BdnZBSkd2R0tQOGhFTTJUWUpoeFJBZG5sODhpVHVub1lG?=
 =?utf-8?B?ZkxIRWl1TEtJb1lmSDRjbndLeDhRTXZsU3ViZ2JqZlBZeVk1eGRQZkFob2gy?=
 =?utf-8?B?MWtmL2tMVW41L0ZPVUN2S0s5RFpuZnRZOFpKenJEKytoVGp1OWQ3bUdpZStO?=
 =?utf-8?B?cDFWbHZ6MFBqUm45SHJweTU1WVg0TDJBNWVvTm1GVnExWDJJc3IwQ2xrOXJ5?=
 =?utf-8?B?NHBteWxWcEhjc1cyQlQ1RDhFbnU0SXVXdXlpOUovbnJSamduTFFNNDJrNU9z?=
 =?utf-8?B?YlF2OTE2OGZHaW1PalhBVUUydUd6eHFOTzI3OG9aK2kxck5ibVRFckY5cm9s?=
 =?utf-8?B?dXNaM1diWDdNL0pUb2w2SDJiMlpDUkpxL1JzSktVbW91cW10SXp5ZHpEK2JZ?=
 =?utf-8?B?NytpNnZDajZ0SG5nZVpZd09iYTFOWFZjd1BHempMOUx6U3hiNkIzaVFOQjFH?=
 =?utf-8?B?c0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSYPR01MB5334.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d817c0-026c-4e26-37b2-08dbcfbe19d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 09:39:18.6442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqOqTyaQc+LF4KJvHrKgrQ5vfluf3PHn0NxgrP4+iFeEJMWiDtSwQRohS2U/EkY4xIZ2ylM+TKV/ftecu9cP7TLjyvUqqU8VLGbJeWEi2UC6qIAbrS3HNcuZHS/k8put
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10468
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gU2VyZ2V5LA0KDQo+IEZyb206IFNlcmdleSBTaHR5bHlvdiwgU2VudDogV2VkbmVzZGF5
LCBPY3RvYmVyIDE4LCAyMDIzIDM6NTkgQU0NCj4gDQo+IEhlbGxvIQ0KPiANCj4gT24gMTAvMTcv
MjMgMTE6NTMgQU0sIFlvc2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiANCj4gPiBGaXggcmFjZXMg
YmV0d2VlbiByYXZiX3R4X3RpbWVvdXRfd29yaygpIGFuZCBmdW5jdGlvbnMgb2YgbmV0X2Rldmlj
ZV9vcHMNCj4gPiBhbmQgZXRodG9vbF9vcHMgYnkgdXNpbmcgcnRubF90cnlsb2NrKCkgYW5kIHJ0
bmxfdW5sb2NrKCkuIE5vdGUgdGhhdA0KPiA+IHNpbmNlIHJhdmJfY2xvc2UoKSBpcyB1bmRlciB0
aGUgcnRubCBsb2NrIGFuZCBjYWxscyBjYW5jZWxfd29ya19zeW5jKCksDQo+ID4gcmF2Yl90eF90
aW1lb3V0X3dvcmsoKSBjYWxscyBydG5sX3RyeWxvY2soKSB0byBhdm9pZCBhIGRlYWRsb2NrLg0K
PiANCj4gICAgSSBkb24ndCBxdWl0ZSBmb2xsb3cuLi4gaG93IGNhbGxpbmcgY2FuY2VsX3dvcmtf
c3luYygpIGlzIGEgcHJvYmxlbT8NCj4gSSB0aG91Z2h0IHRoZSBwcm9ibGVtIHdhcyB0aGF0IHVu
cmVnaXN0ZXJfbmV0ZGV2KCkgY2FuIGJlIGNhbGxlZCB3aXRoDQo+IHRoZSBUWCB0aW1lb3V0IHdv
cmsgc3RpbGwgcGVuZGluZz8gQW5kLCBtb3JlIGdlbmVyYWxseSwgc2hvdWxkbid0IHdlDQo+IHBy
b3RlY3QgYWdhaW5zdCB0aGUgVFggdGltZW91dCB3b3JrIGJlaW5nIGV4ZWN1dGVkIG9uIGEgZGlm
ZmVyZW50IENQVQ0KPiB0aGFuIHRoZSB7bmV0X2RldmljZXxldGh0b29sfV9vcHMgbWV0aG9kcyBh
cmUgYmVpbmcgZXhlY3V0ZWQgKGlzIHRoYXQNCj4gcG9zc2libGU/KT8NCg0KX19kZXZfY2xvc2Vf
bWFueSgpIGluIG5ldC9jb3JlL2Rldi5jIGNhbGxzIEFTU0VSVF9SVE5MKCkgYW5kIG9wcy0+bmRv
X3N0b3AoKS4NClNvLCB0aGUgcmF2Yl9jbG9zZSgpIGlzIHVuZGVyIHJ0bmwgbG9jay4gV2hpbGUg
bG9ja2luZyB0aGUgcnRubCwgaXQncw0KcG9zc2libGUgdG8gY2FsbCByYXZiX3R4X3RpbWVvdXRf
d29yaygpIG9uIG90aGVyIENQVS4gSW4gc3VjaCBhIGNhc2UsDQppdCdzIHBvc3NpYmxlIHRvIGNh
dXNlIGEgZGVhZGxvY2sgYmV0d2VlbiByYXZiX2Nsb3NlKCkgYW5kIHJhdmJfdHhfdGltZW91dF93
b3JrKCkNCg0KQ1BVMAkJCQlDUFUxDQoJCQkJcmF2Yl90eF90aW1lb3V0KCkNCgkJCQlzY2hlZHVs
ZV93b3JrKCkNCi4uLg0KX19kZXZfY2xvc2VfbWFueSgpDQovLyB0aGlzIGlzIHVuZGVyIHJ0bmwg
bG9jaw0KcmF2Yl9jbG9zZSgpDQpjYW5jZWxfd29ya19zeW5jKCkNCgkJCQlyYXZiX3R4X3RpbWVv
dXRfd29yaygpDQoJCQkJcnRubF9sb2NrKCkNCgkJCQkvLyB0aGlzIGlzIHBvc3NpYmxlIHRvIGNh
dXNlIGEgZGVhZGxvY2sNCg0KPiAgICBJIGFsc28gaGFkIGEgc3VzcGljaW9uIHRoYXQgd2Ugc3Rp
bGwgbWlzcyB0aGUgc3BpbmxvY2sgY2FsbHMgaW4NCj4gcmF2Yl90eF90aW1lb3V0X3dvcmsoKSBi
dXQgbm90aGluZyBpbiBwYXJ0aWN1bGFyIGp1bXBlZCBhdCBtZS4uLg0KPiBtaW5kIGxvb2tpbmcg
aW50byB0aGF0PyA6LSkNCg0KWWVzLCBwZXJoYXBzIHdlIGhhdmUgdG8gY2hlY2sgaXQgc29tZWhv
dy4uLg0KDQo+ID4gRml4ZXM6IGMxNTY2MzNmMTM1MyAoIlJlbmVzYXMgRXRoZXJuZXQgQVZCIGRy
aXZlciBwcm9wZXIiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3No
aWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9uZXQv
ZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21haW4uYyB8IDUgKysrKysNCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2Fz
L3JhdmJfbWFpbi5jDQo+ID4gaW5kZXggMGVmMGI4OGI3MTQ1Li5iNTM1MzNhYjQ1OTkgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21haW4uYw0KPiA+
ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWluLmMNCj4gWy4uLl0N
Cj4gPiBAQCAtMTkwNyw2ICsxOTEwLDcgQEAgc3RhdGljIHZvaWQgcmF2Yl90eF90aW1lb3V0X3dv
cmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+ICAJCSAqLw0KPiA+ICAJCW5ldGRldl9l
cnIobmRldiwgIiVzOiByYXZiX2RtYWNfaW5pdCgpIGZhaWxlZCwgZXJyb3IgJWRcbiIsDQo+ID4g
IAkJCSAgIF9fZnVuY19fLCBlcnJvcik7DQo+ID4gKwkJcnRubF91bmxvY2soKTsNCj4gPiAgCQly
ZXR1cm47DQo+IA0KPiAgICBQZXJoYXBzICpnb3RvKiBpbnN0ZWFkIGhlcmU/DQoNCi4uLg0KDQo+
ID4gIAl9DQo+ID4gIAlyYXZiX2VtYWNfaW5pdChuZGV2KTsNCj4gPiBAQCAtMTkxNyw2ICsxOTIx
LDcgQEAgc3RhdGljIHZvaWQgcmF2Yl90eF90aW1lb3V0X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0
ICp3b3JrKQ0KPiA+ICAJCXJhdmJfcHRwX2luaXQobmRldiwgcHJpdi0+cGRldik7DQo+ID4NCj4g
PiAgCW5ldGlmX3R4X3N0YXJ0X2FsbF9xdWV1ZXMobmRldik7DQo+IA0KPiAgICAuLi4gYW5kIGFk
ZCBsYWJlbCBoZXJlPw0KDQpJIGdvdCBpdC4gVXNpbmcgZ290byBpcyBiZXR0ZXIsIEkgdGhpbmsu
DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gPiArCXJ0bmxfdW5sb2Nr
KCk7DQo+ID4gIH0NCj4gDQo+IE1CUiwgU2VyZ2V5DQo=
