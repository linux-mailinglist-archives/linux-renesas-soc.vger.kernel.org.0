Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCEC54658C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 13:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349011AbiFJL1i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jun 2022 07:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344904AbiFJL1h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jun 2022 07:27:37 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2096.outbound.protection.outlook.com [40.107.113.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 285E43668A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jun 2022 04:27:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wyu7YZedb/BVFmqyKNdy3ljim3iMnWuoaFFUKiE4z/BflrpJr6Wpo75nlAq7qEnLXoMUTLxc0cRknE3vhwS+DMhMnV9yIMDMkETIe01HlPdtwQypvMImR8IBIw3dFUM6/BlEQU9P7xSXukxmM1D0vxXBCi2pSKSPT5+/4q849Afp8wCJEmAgVed+5QEb5fP8bYMutiGH09UA5BzSeI2qQVWE+YJtFceEXEw5HvXPBx6Tz7MVqi3acMMT+/QMtrlfUf+gtsQv/q0DzIJ1JvPFn0cH6Vd4saOnbQEguVznDDVdHhgNOLN3xO8qz+Z3N7Vd7+nmaQUN8qD3QwgmuOY/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQVeqJsvDHpmEYEM/hqfBtl0K5KXRbxa9XsADVvVvB0=;
 b=VlV67nA17YXCrS4A3gDj26aZHyaclVjuM8zIYXf39AJpgw+6XN8bAorH1hTyOMe7HNEzkzrLEESvDuWvnjYIG3FDtrpW8skNcdANn48IPKaY/DFVlRk2vfAT9Cb+ohMuwdla6Pozv4oBCBnsqL776fmxxkSb0yaqZGiR7Umt1TD0Ta3PbjRHsAAEl6coRt/ceCiPhSZLia9SEeEaqwoxKPpzC3Gd549YOqt24EKhO3SqxSNfyP4KVdVhmyDGY5laarRJCiC+EbOiTjIbi25ZztxoGc9ot4VimSs1e9rqsjvh7M+MSKuOfqJF44rGw+E6Fcq2VQkVtou3A8oblx6ruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQVeqJsvDHpmEYEM/hqfBtl0K5KXRbxa9XsADVvVvB0=;
 b=MvXOuy+ZZBgJXCaLnnQSOWAQeLQBlrP13Yw8f4vJyE4oH0yqJqUqOIlPcOsQaYsj2ex6grOEFb49nahAZYTl9ZqIdKGJ4RmCDgsxDr7+w1lvIAtS6kK9+wNb/iuECpObo6LrGkhjWYDLqytJd132Ikxwtla0qjtngZ4VuOlDHr0=
Received: from OSYPR01MB5334.jpnprd01.prod.outlook.com (2603:1096:604:8a::15)
 by OSBPR01MB2501.jpnprd01.prod.outlook.com (2603:1096:604:1a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Fri, 10 Jun
 2022 11:27:32 +0000
Received: from OSYPR01MB5334.jpnprd01.prod.outlook.com
 ([fe80::60ad:abaf:4da3:f9e]) by OSYPR01MB5334.jpnprd01.prod.outlook.com
 ([fe80::60ad:abaf:4da3:f9e%6]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 11:27:32 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 0/4] arm64: dts: renesas: r8a779f0: CPU topology
 improvements
Thread-Topic: [PATCH 0/4] arm64: dts: renesas: r8a779f0: CPU topology
 improvements
Thread-Index: AQHYe04VoiH5FWZqlUOTSlLSXZHyYq1Ige2A
Date:   Fri, 10 Jun 2022 11:27:32 +0000
Message-ID: <OSYPR01MB5334FE472061FC00216FBD6FD8A69@OSYPR01MB5334.jpnprd01.prod.outlook.com>
References: <cover.1654701480.git.geert+renesas@glider.be>
In-Reply-To: <cover.1654701480.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3378553b-3003-40b1-29d3-08da4ad435b7
x-ms-traffictypediagnostic: OSBPR01MB2501:EE_
x-microsoft-antispam-prvs: <OSBPR01MB2501CFBB6B5E60CE3FAF5F28D8A69@OSBPR01MB2501.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ecG+jPIxW/yceOI2qoKTslccnJFXguOgmRBSSCX3JBM+0xOQHxtqk4OcUuWUxruy9aYTDUJyHTdYGXOFqYRbn3pzTah0Z+3ol3R260sROJuB2trCPjKWnTWdBLKVSKFaXs5v3xi8XoICzcmOOS6OKEx3IrAYB7b3SMo9GtEySmdm2if1oPY2uCC6VkWsYRHErluuX7Wh9B9WErWWqdY435T6OOktBqm1jJPaJWiLb2FW9fr1QQsz9C2PyaOVQgKT12bp8Jk2GJCECF/JdUK7TGYWRNd9QnME61HSAyQm4MYUd9Vhy4JxNdzyBDFo/61+daGodJ4ugnYlzp+D0CRxpPYH29eog5mN4L2AUVDMKY6v5nQeDk/e1ndNNPVeVpx/lrX7x370HDXKNiPxIhO3d2GZnmIiTdrmr9iyLAOV1/EFIoqZCoLTquNnQe1/qVOp9/ZHEtpqj3GSeeE4DMvGXyUrDUzMfijtb+a71o9+opRqVWY/XTaP8EYNpwWnCY9EeR9tlLBrxDRD0n5gZdam6sIWPg9b2Jn3j5mKKtTZwTBqmbhSkHrQkNcHj74mNTYtyRcZc0s5iBMx73K6BvG8Z3tpLhxAKxclz4yvHI/80ntuXIIdIh1sW8GU0RnzWApISX8ju0jsYnDyywucWo3naBeG0W/Ds1/RKQs9kd2yOG/KkXLhgPYhPocKOAsnqHCp1jFb4rkKvA/JgkShHinvaQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSYPR01MB5334.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52536014)(186003)(38100700002)(8676002)(66556008)(66446008)(66476007)(38070700005)(110136005)(55016003)(66946007)(4326008)(64756008)(76116006)(54906003)(122000001)(316002)(26005)(9686003)(6506007)(33656002)(2906002)(7696005)(71200400001)(5660300002)(86362001)(83380400001)(8936002)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFFra1V6NkFLbUZkUDhzZ0RBSUN4eWlqT2RHdmFxUEVxbzFNV2lXakZ6OXpw?=
 =?utf-8?B?MWMvL2JMblhqUkVCZzNIMmZ5TXExRndwbnBnaktTMUduYzZTemQxQmFvZTla?=
 =?utf-8?B?YzlyUXJON0RHbHM3aVE1U2psY2p2Qjc1OXNOci9NZmxXekNtek9IMVl4aitY?=
 =?utf-8?B?UXpaQzg0SkpUK05IcmlqY3RyVGxVNXNnR01rNnhZYkorcmZyMi9aZFByQzlY?=
 =?utf-8?B?OGVVd1dDNEZCdFM1V1J5THFKRnQ5T2hldFlZZU1LdHNTV3JjQVU3YXVwMVov?=
 =?utf-8?B?VnBMQWJRNFUxQ0ZLRVBqTFA0dWs4eDlwRnFPcmI3SlFOL3dzd1duT3I3VTZD?=
 =?utf-8?B?VDBwWGNwNlZ5OHNJSGVDMG1KOENWM2pYK3R6K0FMU2E4TkZOTnU1K2IzT3Fv?=
 =?utf-8?B?KzFWRTVyN283eWRaYUh3cSt3SzlSeW5icjZGUzczbGpqTnR3czQ1aXUyZUgr?=
 =?utf-8?B?bmVsYUlhWFkrMDBrYUx0VGwySkJPaGl4QjdxU1REcGkzZDh5YlhCTHhBRUFs?=
 =?utf-8?B?RDdKQ1FvY2JxTXpySnd6WXdpYVlqbnY4SjdncllFWi9LeHZFdGxCSC9rTzhW?=
 =?utf-8?B?RHdhU2k1c3plTG5lQmhHbjF2NVdlSTNCczZHQW50U3lKaXo3RVdSQmpHVlVa?=
 =?utf-8?B?S3prSjF4TUc0VjBTWXhIQ3hxRWRVUmcycDF3L0NPRytnL0JBdlovcUxTd1ZX?=
 =?utf-8?B?TzhyeElTVnBTSUVZaFFDeW0zQmQySUljbGVzYldMSmtiK05uNUI3Z3ZadUQz?=
 =?utf-8?B?VzllNWxlTFBvSGVTQUJEVWRrNXkxL3R0RkhsYkQzYU9CRVFhQzRiY3BSdnZq?=
 =?utf-8?B?ZXo2dnY1YlRPNWQvR3pRVW9sVUpvVmFJcVJHSklrejJpY2FuZ3N0ZmovOXVk?=
 =?utf-8?B?cHRWYjcyVk9qc21CRTJkRGJKSXFLbHFCVUw5K3ZndzdHTG5WRWIvRVBsNFpr?=
 =?utf-8?B?RFFYa0dsY2g0a0tyU1ZoNEtKT3JZZXArVDlNN3g3ckxqcVliWGMwMzRYOTk0?=
 =?utf-8?B?eGtFQ3lVazdXY0tqWEpBYUFkY1ZaOUNMdzRPRG5uWjA1Z1BjcDdYcWlUMFZC?=
 =?utf-8?B?U3ROdWNrMis0RnhFK3cxSXVUUkg3R3F4SHprUlVNOFhacUpQRzNhTFdyWWRa?=
 =?utf-8?B?NmxucUJwZ1Brc2tDL1pTS2xzdDFHZVpIZVhFU2tLOE9iRXRvQktLTy9KZGhk?=
 =?utf-8?B?RnZ4em44d0lJVXByZkxNakliNFZ3WjAzc2x5VVk0YnI3Q2FkTXFaeTdueHdu?=
 =?utf-8?B?TGZmUkdubm5HTTk3RkxnYlZ5SHJZUlRWMlNtZzR5eXNzWGVNRkZwV1JqSG1o?=
 =?utf-8?B?Wm5xRmNBOHd6Z3NvS0QvbmlGVVNQYUxldXV6aVBiRzZuRWlhVXhzanJaWTZR?=
 =?utf-8?B?aXFLaTU1d1B5bmtOb3VrUllBOGo2SXZiRDFsTGRLOHJCM3hpWGpEZC9PNkk4?=
 =?utf-8?B?SDNGdDRCUWg1aTdqcWNKVkVsSmRucENqOUZtalVTbWtXb1A1U0NLVGhPU3ZD?=
 =?utf-8?B?ckIvdzBOZEJwQTRhY0tua1A1UUNOdjYwZi94TWxNNWJtaVlSV2lJQjdYcWhk?=
 =?utf-8?B?ZXMwWlBWM2luVHpVbjVCSjAzR0xMZVBUTzJxTzQyaVhQZyszamtJSVloaElt?=
 =?utf-8?B?aHAyN2t1dzR2VVg0OWNTWmd6Z09QYUxjYnp0eWQxYkFSakdBYVlCWENEVXB1?=
 =?utf-8?B?d2VTbDVlNjhqNkQrNVpoNEtySzlvRUl6WXZsa0x1NERYcDB5cUIxald2OXR2?=
 =?utf-8?B?VDNiVXFCcy9UVktHaWhRczNTTmNkakdHeWxrOXNoVnBydWZUOWE5SVF1bDRR?=
 =?utf-8?B?NXhOT3llR29zdmRTa0xxTVJKUnZtYmllU0pyd3lNSDhzV0UxTm5QYmJsY3hu?=
 =?utf-8?B?R3hlMjkrK0ZvWFRQQW0vSFNNNDVYd1JLZGZQTkJyQWNRVkQxZkxrM1M2ZVhr?=
 =?utf-8?B?aVlOSTBzYkFCbC9lT0NjR2JqYlBoSTJxcEtCN0xFU3p5WDNJUDhpWUtsNGwr?=
 =?utf-8?B?Y2J3eUY2WHZEc0JUbXVWRTBqUEYrbE1MdEs4bitkTFVlNEFkZUtvK3ltZm1s?=
 =?utf-8?B?dllNUG44SW50SytUa2Y2T2dvS0dkeS9uTk14SHk2NE9uZExrbG1zazkwemU0?=
 =?utf-8?B?V2lkMGlENFczbjhJZm8rdHJnWWZuV0VaRlhNUHFqdUxRQjdlYXNTZlJaVDBl?=
 =?utf-8?B?K3ptWXFKY1hHU21zaWlHWE5jYS95ZVV4a0UvYTV1NjJ5Tjg0eDVGenZFMG5v?=
 =?utf-8?B?bHdDYzZOa3RacFVDbjNRcVJ0ZXl6NUp1cTdDamRibTNzMU43Unpkb0JLRWNt?=
 =?utf-8?B?Tk1PNE0vTTZmYUxHcnBrK0xXUTh1Y2NKYU5wMjYveEFDaGc1UEMxUExXSnpG?=
 =?utf-8?Q?h2lPhfTatzN8z9wDzhOHklV+/HDEkqaPkVUm4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSYPR01MB5334.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3378553b-3003-40b1-29d3-08da4ad435b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 11:27:32.0908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nKAzxIHylJxrH8/MZHlWlm32KMh0p5uFrWgFPJNLR3YwJTxzRKYdcmL6RrlWvnSK328v0x0rY1Zaf+LEbPql1VNoF3uTyb4OSoHhrPo47vV3UKiNSHU6+ynzqf132Z1d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2501
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIEp1bmUgOSwgMjAyMiAxMjo0MCBBTQ0KPiANCj4gCUhpIGFsbCwNCj4gDQo+IEN1cnJlbnRs
eSwgdGhlIFItQ2FyIFM0LTggRFRTIGRlc2NyaWJlcyBhIHNpbmdsZSBDb3J0ZXgtQTU1IENQVSBj
b3JlDQo+IG9ubHkuICBUaGlzIHBhdGNoIHNlcmllcyBjb21wbGV0ZXMgdGhlIGRlc2NyaXB0aW9u
IG9mIHRoZSBDb3J0ZXgtQTU1DQo+IGx1c3RlcnMgYnkgZGVzY3JpYmluZyBMMyBjYWNoZXMsIENQ
VSBjb3JlcyAxLTcsIENQVSBtYXAsIFBTQ0kgZm9yIENQVSBicmluZyB1cCwNCj4gQ1BVSWRsZSwg
YW5kIENQVSBjb3JlIGNsb2Nrcy4NCj4gDQo+IFRoaXMgaGFzIGJlZW4gdGVzdGVkIG9uIHRoZSBT
cGlkZXIgZGV2ZWxvcG1lbnQgYm9hcmQsIHdoZXJlIG5vdyBhbGwgOA0KPiBDb3J0ZXgtQTU1IENQ
VSBjb3JlcyBhcmUgYXZhaWxhYmxlIGFmdGVyIGJvb3QuICBBbGwgYnV0IHRoZSBmaXJzdCBDUFUN
Cj4gY29yZSBjYW4gYmUgY29udHJvbGxlZCBmcm9tIHN5c2ZzICgvc3lzLyovKi9jcHUvY3B1WzAt
N10vb25saW5lKS4NCj4gQ1BVIGNvcmUgcGVyZm9ybWFuY2UgZm9sbG93cyB0aGUgQ1BVIGNvcmUg
Y2xvY2tzLCB3aGVuIGNoYW5naW5nIHRoZQ0KPiBmcmVxdWVuY3kgb2YgdGhlIGxhdHRlci4NCj4g
DQo+IEkgcGxhbiB0byBxdWV1ZSB0aGlzIGluIHJlbmVzYXMtZGV2ZWwgZm9yIHY1LjIwLg0KPiAN
Cj4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIQ0KDQpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaGVz
IQ0KVGhlIHBhdGNoZXMgbG9vayBnb29kIHRvIG1lLiBBbmQsIEkgdGVzdGVkIG9uIG15IGVudmly
b25tZW50LA0KaXQgd29ya2VkIGNvcnJlY3RseS4gU28sDQoNClJldmlld2VkLWJ5OiBZb3NoaWhp
cm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQpUZXN0ZWQtYnk6
IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCg0K
Tm90ZSB0aGF0IENQVUlkbGUgb24gUi1DYXIgUzQtOCByZXF1aXJlZCB0aGUgbGF0ZXN0IFRGLUEg
ZmlybXdhcmUgd2hpY2gNCm91ciBCU1AgdGVhbSBtYWRlLiBPdGhlcndpc2UsIHRoZSBzeXN0ZW0g
Y291bGQgbm90IGJvb3QgY29ycmVjdGx5IGlmDQpDUFVJZGxlIGlzIGVuYWJsZWQuDQoNCkJlc3Qg
cmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==
