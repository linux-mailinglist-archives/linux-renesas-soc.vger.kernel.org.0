Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 562CB53733E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 May 2022 03:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbiE3BTM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 29 May 2022 21:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbiE3BTL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 May 2022 21:19:11 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728A97357A
        for <linux-renesas-soc@vger.kernel.org>; Sun, 29 May 2022 18:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8uYnmVIhUjc8h8eeMDm3W6sbNyr6QLcqN328LRIcXo7EZiEFunb/dnccBOj1POKUcpFUYrKOckcpPN4lM0lBsw0wMGliBl7u3TEPHkZV65bvB+4FOEnGrsYrf5deJxzOL24OX+yihoa9+aKp+BkFFrMmAAgF1ix5sTxl5hd1u3qL/X3rd+xoU1m5PoDwR8QPRH+yInqJgQwo8iLR8E4b6pkDNN1ZPenZqt+KSo3Mx1AicEG6iLId+0GIDX9yE+XeKp3iZbELpVYq8ynmn9X60W8B3cFmQhu5zSzLS5QOxMEvv6x/hBmTenmE+7mcI9TCEpJyyBunv/ER9DE8mV2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2r+CamTMT3/XmaFeJaum3Gb/3UeHslpr2yDaYS4qLo=;
 b=UxdFtkPJ/XtRi/8RiORg2IdbzgrKFAXOcHAzxtyjDFiZjhbW9APumSnmDykA4WPc+UcVE8npciDJIbEtPKmteuzs2pdDf3ADlQauJHHNnYx2kurZSaeUPeTDJFHEKdkKlE7+SRu5d9wCp0BVUE/BbzBcl7wlea5RGcPfifRPq0yJJuVJ7A1LyzC+30DgdRlS9AU5C2o8g+N/9N92uiiAfOsYOC8UaelUSW78SwwXB+pxzWLsi05+iJys59Ro9OYt894G5chWrCFndY7XeQOYnvrJM/8zppUL3TIyrvjKTyN+Y0KnD9u+33whOLs+V8mOHIu/+6/6V0vZasOGvfJnmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2r+CamTMT3/XmaFeJaum3Gb/3UeHslpr2yDaYS4qLo=;
 b=YCmw/7gckIhrOYKoLegUOJLiGZ2H9epc+xqg+s+tYYx0Lu9QgRI1kPsIsDK83zyIglaIg0Yhsxo4UtACJsSaiCcJoWJ/CUkrdW+qEkcB4x7z1D23u9IUYtgIlos2uGQd5ej+RpWpugQZvQCrsDOsToHIlmGu9lCy8jieMs/eA1E=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB8109.jpnprd01.prod.outlook.com
 (2603:1096:400:11e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 01:19:07 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::7c7c:9331:bdd:218b]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::7c7c:9331:bdd:218b%2]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 01:19:07 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: r8a779f0: Add IPMMU nodes
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: r8a779f0: Add IPMMU nodes
Thread-Index: AQHYEeuFUFIPSYrUTECREI/s9QFAe6yACI0AgLdW5bCAAALVsA==
Date:   Mon, 30 May 2022 01:19:07 +0000
Message-ID: <TYBPR01MB5341F8E42C0F6A322CCAD1E0D8DD9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220125130021.4144902-1-yoshihiro.shimoda.uh@renesas.com>
 <20220125130021.4144902-2-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWrqMNMhTSCX_1k8RiEx2Mm8oXbEYpvNPqJiyGVVrEunA@mail.gmail.com>
 <TYBPR01MB5341E866CF6355E0D7ED557FD8DD9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341E866CF6355E0D7ED557FD8DD9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11b1c8c4-485b-4770-e9b2-08da41da64ed
x-ms-traffictypediagnostic: TYCPR01MB8109:EE_
x-microsoft-antispam-prvs: <TYCPR01MB8109CDF0B9CD97261779EC59D8DD9@TYCPR01MB8109.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dEXYfNTFrqpJPCJxKdySm8PbZvpff68oZ77X4dVv6fvGdk6TGFTi++T+qbRkBVaFCDyUsTljIVPlck6/5wDow87Lh6BEQKES7S4bOS47Kd4MTNT5tK+A2ld6g51ChBNXHtTuiwjbilBpM7mwKgXEkJw89iUa3dxW5U9cz34xjmhVZzJrgy9k7d2esrxEI767ooXxoQ2o+fkF9ks96GImeflBXaPa2QZgqkFyc/TRf8i+7sxNrUuhe60v2QsKCO+jT8vJjy0oRx9ym3Ii0FxTzfgmAOnjMoc+hFbtvgu4MI3YvRDoZQHC1DekS6y/fV22NV16eCVI68t67m8CtgFX1TAyJ97bLtFb5mqrdY0ROSSNEcUyHOpx4BMEc8xI0U3z3XR8wy+wyO+0kBbcgejo3ZtZgcvN/oeX4cFq/qhvCi6wrCTCcHlciMxJOKQ8DU6k0pP6tJ6ya5XWT5U55H9d15+nhh3chLCo9Jv0jNGnl3Q2MfceIBZoPTJiDLRAywNzDVgKtr4VAYBQCs1biDbdAseRbTVcOhBgUH+55ZcMsL/Bp3pBXHWoijvFVFjZ+txKo0uZC/7MXLDkcZgmO4IccQrfjhfsyQ0I0eOzSpXVxOwc/mujaVTpkLssyzjXkZs1hpn25djtnPjqLp2DzwcaCfdNwg/TNEuyhOxDrejqzl8zpMJK6cj5FUoeONuBr7uSicinJ0lPZcGIck+it7Bs3w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(7696005)(2940100002)(2906002)(316002)(53546011)(9686003)(54906003)(6916009)(122000001)(38070700005)(55016003)(8936002)(66946007)(38100700002)(5660300002)(86362001)(52536014)(4326008)(64756008)(66556008)(66476007)(76116006)(66446008)(8676002)(71200400001)(33656002)(508600001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnBKbXM0TDlBSHVod0V4ODQ2WjZVU090MS90eGpPQUkvbGpBcUdtYUdCV25s?=
 =?utf-8?B?dmxHTTJqS2U5d0hBVi9heitpRG8rQk1GVXpBeGdJRTZxc1kyenZwLzNoSFUy?=
 =?utf-8?B?WXFHOTNkOVdRRm5VeGpWS1RLeTJWMkFJM1pvZDJTU3YzUWtudHFoVkdORkM0?=
 =?utf-8?B?TmNMOHRBQVIxTEFITmxod09Jd2czcTl0d1k1UmZCekZBbGN2TUptYU9FU2I4?=
 =?utf-8?B?ZFpFZ1MvV2NkdHU5dkl5Mno4ZGNuOFo4SFBnc2pPaUYrTkRFUFZmb0xXamQy?=
 =?utf-8?B?MDd2QnNpL05EOUVUbkxyQVB5Vi85VFcwODlqTjdPUDJPdk5NZjE2b0cvQ1V6?=
 =?utf-8?B?T1JhOHJRWmF5N0sxeE1MYlduVFBHclg0NU01WUJCbFZqcEJFZVAyQ3dLUkRi?=
 =?utf-8?B?dzE4aHlETk8xVWpvQjhXcVZNMEpNOW9Bd0JzdVFZQnZBQzAxWDFxOWJzOHdX?=
 =?utf-8?B?Z1czZmhTUGU0cURmeG15R3ZsdEFkeVkzOExuc1BzWm5iT3V5TzJRVWE0UHRY?=
 =?utf-8?B?cG9pak9sVERiUTVoSDZ3SkFDZE5FaytZYlBwK21tbmJ0RGZSb1BzdDNaN0NT?=
 =?utf-8?B?QVE2WThaV2JCRXAwRTViTTdVYnhENFNtRWx1blplYTdESFNPZ3B4SnN0a2tJ?=
 =?utf-8?B?Uk1HRkE4SlljL3NqbkJOYmhDN08wNWh2b3U0dWxTd2kyOG0rN3lBdkRONStt?=
 =?utf-8?B?NUhxU0dKbnpUOTJSUHFZMFNlR3ZiMEg2aGVjT3ZZdGxzbzI5OUUyWWV0eDkv?=
 =?utf-8?B?S3graWYwbGNIb3VDa1RqclpPTVQzOWcwSmVMZ0lSZjFMM1gyOFJOVW9aSENR?=
 =?utf-8?B?ank5eEJRSGxMeG94M3NJMlM4NFJsTlF5WlhRWnIzMDNvMll3MGFiRVFlZDRS?=
 =?utf-8?B?Mk1lazN0NEh0UDI3Zk52V3pEd3JkbjVhekdDc05IeXpYb2MzakpackcwWlh6?=
 =?utf-8?B?c1pzMU9KWVA2ck1aQkFETXE5TlVTMWw1cEpaUW9CTWRmMUFoMHp2U0tUWHRV?=
 =?utf-8?B?Q3VxZzRSZkhqWEtYQ05CalRhSEdvcWdyR2J1bTByMjYwV3FMWm04VHpOcFo4?=
 =?utf-8?B?TDlmbVR0WUNSZVdCS1MyNVU0YktDL21jMlBwSEVKZFFTTUpZcHMyakxmQ3dB?=
 =?utf-8?B?WEt4R1M5eFJLRlRRWHZRTnVIVUw4YzVqS0FZNDVPUGlJSEpDSDBGSXYrVStB?=
 =?utf-8?B?dU1RVitBNE9qbzJXZm5KVW1UcUxWOFJUc1JlMDNrcnp0R1BXVnZUTzRoMUls?=
 =?utf-8?B?eCt4eEwrSDlTczV6bU1GN0xkUmM3TkJaNlppdktJdzdldmxJNSt4NnZxZ04x?=
 =?utf-8?B?Z2pQTWZEYmlwQ0pPSGR3NG96M1pwK0FROFY1Mys1TG1iOUZlbTJUNGNldFdh?=
 =?utf-8?B?SHE5ZXl6YVdnS0xFT1pSaUtnQXY0MWtuemk4SlFZRFVWVnJ1MnhBRWxmU2hu?=
 =?utf-8?B?SURVS29tbGRRNnNBR1dNbUEzY0t6N3dreGdyNE5vS2g5YmI3ek1BcVVlSjV4?=
 =?utf-8?B?NUVUcjRva2hoZ1dWVXVZNGJ2RFdTbDlTd0ZMV2VSY0MxRGV5T2FhWitGZmNY?=
 =?utf-8?B?TitPOUNoeTlPb1VMWkZiYjNPb3MydytjRFZ6NGJ6NFZhNjNqckxsc0drODRw?=
 =?utf-8?B?dG1JN0dzUENnWm55NUdZT3FraWs0b1JNRnlMOWU4Q216YlhLMW9mN2pqMnZl?=
 =?utf-8?B?WHhrcHlQRlpPUTNUbG9vRmtsYWFFYmF3dWtOT2k1T3FBbVFjM1YrMzhQaHRD?=
 =?utf-8?B?RzlUZTd6cklURW1qMmlSVnRneEJoMW1MR1phL2QyVkY5bzVLQzJOcGJLaTc1?=
 =?utf-8?B?d2svOXlzK3VzM2RzZm03cDBZVGZUWXBGRStkUlUyOXNEemcvZEF4RWcyd2Y1?=
 =?utf-8?B?cnFqaU41S1pQLzQrTGtWVlFTYmdWQ1hDR0E1WXRQLzhZUE5lZEtmRjJCYmEr?=
 =?utf-8?B?VWVlelo3WUhCblJvWFRIamhCeUxTQ28wYUNDY1ZJdFltN3pmbndlR2sxK3p0?=
 =?utf-8?B?VzRRclRDYktxZXk3bVJBVzlJVTlZZDZOemh2czNoNlV3RDhJeDB3RGhNeHdn?=
 =?utf-8?B?NTZpRjZkVnNzYllXbUpnWWdnNUd3T3lIVG5WYzA0SzFqMUoycU03MENteFZ6?=
 =?utf-8?B?K3lyTWhoNG9MMkFOZUNkckVndGtFd3VRaWJHbTNxanBkME5aRGg2NFl3TjZ1?=
 =?utf-8?B?eWJvMkdhZW9pVEp5MFB1U3RINEpxUnh6RjlJWW0wZ0hQb2lvM1B2UGdnRVNU?=
 =?utf-8?B?ZlV6ZCtSeFJBbHI5UXdRVFJKN1JPNkxqMVYxbXl2cFhhdnNWTXg0WkRYdFdi?=
 =?utf-8?B?KzJ0d1hCQ2R0Ly9BenFDZ3RPZkhkUjBBcmE4TjhiWEdScXVpS2xTSXF6ME83?=
 =?utf-8?Q?lXX0IOc3MaZ46PaKImZNw6J+cCuLMLN1hE+7FCW3+KXoF?=
x-ms-exchange-antispam-messagedata-1: 6N2WldK2/0hLyMc1CtQUydy2CLFP8GgJk4o=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b1c8c4-485b-4770-e9b2-08da41da64ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 01:19:07.7867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5zlobnhkjRHPGRB0lukuZNFggeQPzuHfAuHHVuATdlZQPvzLGMxOk9fHj0Sl9MuLjXBqOSYIqmvxmEPxZVojBoYWo/BNpPhqljpPW8fayCCbBdAAXszy2bSGakzn4lS0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8109
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuIGFnYWluLA0KDQo+IEZyb206IFlvc2hpaGlybyBTaGltb2RhLCBTZW50OiBN
b25kYXksIE1heSAzMCwgMjAyMiAxMDowOSBBTQ0KPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZl
biwgU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyLCAyMDIyIDY6MjEgUE0NCj4gPg0KPiA+IEhp
IFNoaW1vZGFuLXNhbiwNCj4gPg0KPiA+IE9uIFR1ZSwgSmFuIDI1LCAyMDIyIGF0IDI6MDAgUE0g
WW9zaGloaXJvIFNoaW1vZGENCj4gPiA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+
IHdyb3RlOg0KPiA+ID4gQWRkIElQTU1VIG5vZGVzIGZvciByOGE3NzlmMC4NCj4gPiA+DQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhA
cmVuZXNhcy5jb20+DQo+ID4NCj4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiBUaGFu
ayB5b3UgZm9yIHlvdXIgcmV2aWV3ISBBbmQsIEknbSBzb3JyeSwgSSBjb21wbGV0ZWx5IG92ZXJs
b29rZWQgdGhpcyBlbWFpbC4uLg0KPiANCj4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yOGE3NzlmMC5kdHNpDQo+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjhhNzc5ZjAuZHRzaQ0KPiA+ID4gQEAgLTE2NCw2ICsxNjQsNTIgQEAgZG1hYzE6IGRt
YS1jb250cm9sbGVyQGU3MzUxMDAwIHsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGRt
YS1jaGFubmVscyA9IDwxNj47DQo+ID4gPiAgICAgICAgICAgICAgICAgfTsNCj4gPiA+DQo+ID4g
PiArICAgICAgICAgICAgICAgaXBtbXVfcnQwOiBpb21tdUBlZTQ4MDAwMCB7DQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMsaXBtbXUtcjhhNzc5ZjAi
LA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyZW5lc2FzLHJj
YXItZ2VuNC1pcG1tdSI7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAw
eGVlNDgwMDAwIDAgMHgyMDAwMD47DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZW5l
c2FzLGlwbW11LW1haW4gPSA8JmlwbW11X21tIDEwPjsNCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhBNzc5RjBfUERfQUxXQVlTX09OPjsNCj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICNpb21tdS1jZWxscyA9IDwxPjsNCj4gPiA+ICsg
ICAgICAgICAgICAgICB9Ow0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICAgICAgICAgIGlwbW11X3J0
MTogaW9tbXVAZWU0YzAwMDAgew0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJyZW5lc2FzLGlwbW11LXI4YTc3OWYwIiwNCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAicmVuZXNhcyxyY2FyLWdlbjQtaXBtbXUiOw0KPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHhlZTRjMDAwMCAwIDB4MjAwMDA+Ow0KPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVuZXNhcyxpcG1tdS1tYWluID0gPCZpcG1tdV9t
bSAxOT47DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZz
eXNjIFI4QTc3OUYwX1BEX0FMV0FZU19PTj47DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAjaW9tbXUtY2VsbHMgPSA8MT47DQo+ID4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiA+ICsN
Cj4gPiA+ICsgICAgICAgICAgICAgICBpcG1tdV9kczA6IGlvbW11QGVlZDAwMDAwIHsNCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxpcG1tdS1yOGE3
NzlmMCIsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInJlbmVz
YXMscmNhci1nZW40LWlwbW11IjsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwwIDB4ZWVkMDAwMDAgMCAweDIwMDAwPjsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJlbmVzYXMsaXBtbXUtbWFpbiA9IDwmaXBtbXVfbW0gMD47DQo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OUYwX1BEX0FMV0FZU19PTj47
DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAjaW9tbXUtY2VsbHMgPSA8MT47DQo+ID4g
PiArICAgICAgICAgICAgICAgfTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgICAgICAgICBpcG1t
dV9oc2M6IGlvbW11QGVlZDQwMDAwIHsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAicmVuZXNhcyxpcG1tdS1yOGE3NzlmMCIsDQo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgInJlbmVzYXMscmNhci1nZW40LWlwbW11IjsNCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4ZWVkNDAwMDAgMCAweDIwMDAwPjsN
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlbmVzYXMsaXBtbXUtbWFpbiA9IDwmaXBt
bXVfbW0gMj47DQo+ID4NCj4gPiBCaXQgMiBub3IgSFNDIGFyZSBkb2N1bWVudGVkIGluIHRoZSBN
TVUgSW50ZXJydXB0IFN0YXR1cyBSZWdpc3Rlcg0KPiA+IChJTVNTVFIpIHJlZ2lzdGVyIGluIFJl
di4gMC41MSBvZiB0aGUgUi1DYXIgUzQgSGFyZHdhcmUgVXNlcidzIE1hbnVhbC4NCj4gDQo+IEkg
Z290IGl0LiBJJ2xsIHJlbW92ZSB0aGlzLg0KDQpJJ20gc29ycnkgYWdhaW4sIGJ1dCBJIGNoZWNr
ZWQgdGhlIFJldi4wLjcwIG9mIHRoZSBSLUNhciBTNCBIYXJkd2FyZSBVc2VyJ3MgTWFudWFsDQph
bmQgdGhlbiB0aGUgQml0IDIgSEMgaXMgZG9jdW1lbnRlZCBpbiB0aGUgcmVnaXN0ZXIuIFNvLCBJ
J2xsIHJlbmFtZSBpdC4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3NzlG
MF9QRF9BTFdBWVNfT04+Ow0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgI2lvbW11LWNl
bGxzID0gPDE+Ow0KPiA+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gPiArDQo+ID4gPiArICAg
ICAgICAgICAgICAgaXBtbXVfbW06IGlvbW11QGVlZmMwMDAwIHsNCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxpcG1tdS1yOGE3NzlmMCIsDQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInJlbmVzYXMscmNhci1nZW40
LWlwbW11IjsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4ZWVmYzAw
MDAgMCAweDIwMDAwPjsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMg
PSA8R0lDX1NQSSAyMSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSAyMiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsN
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnN5c2MgUjhB
Nzc5RjBfUERfQUxXQVlTX09OPjsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICNpb21t
dS1jZWxscyA9IDwxPjsNCj4gPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ID4gKw0KPiA+DQo+
ID4gVGhlIHJlc3QgbG9va3MgZ29vZCB0byBtZS4NCj4gDQo+IFRoYW5rcyENCj4gDQo+IEJlc3Qg
cmVnYXJkcywNCj4gWW9zaGloaXJvIFNoaW1vZGENCg0K
