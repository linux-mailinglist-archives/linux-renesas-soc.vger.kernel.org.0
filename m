Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6426537336
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 May 2022 03:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbiE3BI6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 29 May 2022 21:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbiE3BIz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 May 2022 21:08:55 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2097.outbound.protection.outlook.com [40.107.114.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6363666B5
        for <linux-renesas-soc@vger.kernel.org>; Sun, 29 May 2022 18:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4tYvq3Q0bBJOhjQILrkO1BFy7pwTPyXEhF4kGNrjHGpJBpqDdhaG3Mp0oZScvrzVViUoc+JpmknQ8C+JTLR/O5Xz6vo+1sLJz/Hbth2uGzcuWHTQiLvzGmd+I/Lhd+QmaL9Vs97Yac1ttZypdn2xS8fvmgH6BfbnI5SyKvZPz/wYaLppSMpkxiO2jOhlwbO3DTqOWCFkyGT4EZBCXaIMySALSRzYLtUjXBzmraQ/pHRpc3iVUGEUNGXofxyDVvSCzSyZDYh9eLOP94EzYckYVf0ycOI3VaGV7KVAH2vI4t+6MTagYQX7WwUDtEGOZYYZl4if7Q2nZ5X4q9k7LwMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/zMuduJUfLssInda1j8w2sBZZD58uEqrpSSy0PLie4=;
 b=VXmMVjr+ZvNbmzWPXFHoiHAqEXM365RMH58nYrVbffvxvlOiXO9nXPQo7niUavrMj5znLwCnLjAnIWgz2UK99oiZcP2cAkrhgSwNW/rsfC9gnMxbMXn8Ok6ay7vB/xEPJRpdkkp+wd1ohkGrn4+x20wa/lDx6DkNv6PDlGmcQIZxK72USitXo820aWjKCPx5ZoJQDE1GTsCx30TneuRSJeCyxoWcSR686uRXM6NotDA58F7srJaXGDLp5SYNN3J2OoSfAwrEFa/UiWQ4DfBolYkP9GLfSYFMh7RckW1VDvIE8jmG7u2PwT5ITNY+pWe/s62+gH61/I9BjZxB3v6KHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/zMuduJUfLssInda1j8w2sBZZD58uEqrpSSy0PLie4=;
 b=A2LnJmmKXD62BITK/zxA32Eyl8H6SyxkJuBj1rgGTmhmzitaQluZXCo/bBFFRjZk4otU4rGIpi3lsaamXxppR0Bazcazyrt2OEB6gckmB1tw0Id+TwvIiXKXmwnAvlwlTWKHe8hwgnTHY0CtWoFCEsCTiCb5/P+wY0V6mMqVbsE=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSZPR01MB8369.jpnprd01.prod.outlook.com
 (2603:1096:604:180::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 01:08:51 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::7c7c:9331:bdd:218b]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::7c7c:9331:bdd:218b%2]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 01:08:51 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: r8a779f0: Add IPMMU nodes
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: r8a779f0: Add IPMMU nodes
Thread-Index: AQHYEeuFUFIPSYrUTECREI/s9QFAe6yACI0AgLdW5bA=
Date:   Mon, 30 May 2022 01:08:51 +0000
Message-ID: <TYBPR01MB5341E866CF6355E0D7ED557FD8DD9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220125130021.4144902-1-yoshihiro.shimoda.uh@renesas.com>
 <20220125130021.4144902-2-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWrqMNMhTSCX_1k8RiEx2Mm8oXbEYpvNPqJiyGVVrEunA@mail.gmail.com>
In-Reply-To: <CAMuHMdWrqMNMhTSCX_1k8RiEx2Mm8oXbEYpvNPqJiyGVVrEunA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb2f1e79-09f8-4be6-5817-08da41d8f5a5
x-ms-traffictypediagnostic: OSZPR01MB8369:EE_
x-microsoft-antispam-prvs: <OSZPR01MB8369F2AF10E14099F75BBFAFD8DD9@OSZPR01MB8369.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VCHBnswp/jaZ7ABFAt+UqWs6Teg8uS4EsZU/lQrSKHwP5etaGUjMfkEkHgwy6vDcov+s9dTogh776OgTd1g4vbRnXk63tZ+zNlDXMbI3BT7/DjYMWj0DlyeK+Twoa8b2xCzsTmCAn6IE0qldJZPgcUANKztg9CT4/7Z12N4ef+XiTFI2Z7nwrMk+dvO/HsUVL+73r94DSN9QMn7FMI8FMIeNIp4gwTopXc5MJ2uz5N0C+vLyIGtuqhngR3tTlzNawWMCZs26Tgg5ZG6dywvioA1zDidusyI2afkoVJiTjHQ+yrIld4sjVDdX8nRlQw9NH6lWEhB3Wq4OrOemwSYVDUkCa9SzIL7ALpt9LIopsYplB7OUBd9LInWRmAPsoLc1a90VUsDfcPEdHv6MjGYc2Czs2UIUxlLPym/p1X99VQl3jZKn8VT4ps8ZppFSvglN3k4s7Mc6IGa/qzdJ3Nll+NmeusWen8Why7pHrmyAQ2MIoYv/Z0vfrRpRGgg0PKSCq6dCbPZmcpsShpR76e/nCTeNCNRf9VTz2TFI/SYOdulVaDuhqO+1JsLyKq6m5/u08deD3E42UmmQM0yOOLcQaYOGvY+rKYWVWQ2G7Y30TpFnhxlYQSFWxbPdroSJ6TCrj9DBwJsfiZSDm8tsOfj2uCeq91+hI+mvuLmPKVf+eURucsFqJXyRQ4AC1rqkx3aiYgDKNMYCXScivwIT4e+ceg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(186003)(508600001)(53546011)(6506007)(9686003)(2906002)(38100700002)(5660300002)(86362001)(52536014)(8936002)(316002)(38070700005)(55016003)(122000001)(54906003)(33656002)(6916009)(71200400001)(76116006)(64756008)(66446008)(8676002)(4326008)(66476007)(66556008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFJvcUNTbnpRalVkVXdIaDNmaVZlL1ZMWlJDVlpIRlpSZVJaZkZNR2VnZURs?=
 =?utf-8?B?OFQ2UGE4dmdEdVg1OXZleVpSMFBFWERNZjJMeEFYMVlHRXUwVkhHTy92cHJT?=
 =?utf-8?B?Qm9hWnZsb2psbmFna2hXMjN5WGZEK2w5M05kYjRZN0ozeUpXZ0tTam9sdEJJ?=
 =?utf-8?B?QzA5SjlRMEg4dVVGYVZya3BUUlZzWDhGV0dCd1J3TEdWZWNSOStCYmt0Nk1D?=
 =?utf-8?B?aXl3azBKQnp2bVFxREUvRzVQWm9MSFRva0l6YzQrUGhpMHV2U2p0ZzNLRDRu?=
 =?utf-8?B?SGYyU1lpUjYxVVNVSlRUU3pUaDRmL2V4S3NTKzdEQ1RTVHFDSUhjbXdGR0Ns?=
 =?utf-8?B?YUNUMm9wSDRlZXJtS1N5cGt6RW9oSld0YWFkN2hWckNSYTJMMkdBa3dNdmds?=
 =?utf-8?B?UFg4amg2YVhoNExoNlk4ZG00NmttR0FHSG5jVXpucyt0M1FRK0RoSUZjNlEx?=
 =?utf-8?B?NG54QW9HNFEwQTRzMEtPWDVYdXEzblloNyt6VWxjSEE3TDNUSU1jSHBvUU5R?=
 =?utf-8?B?dEphWWY0YmNGZzdiTjlDR21pSC9rZi9PSVVOd3pqVnl4bDczRVZadlJxRmJD?=
 =?utf-8?B?R0w0bThkSm5RU3A4bnprWnhJUFpvcC9PamdhUWV3Mmwzblg3QUcrY1ZWQjVM?=
 =?utf-8?B?NkZtNlRYK3o0UFNHNTFFZ1hJV1FSMFdaU01ES2NVMVh5dWxReDE0bDM3Yk45?=
 =?utf-8?B?ajNtdkVQbm5mMm9WT3czMlRCY1BlQ3E2WmpXbXpwa3QvcXJoZXhhU3d3Zm51?=
 =?utf-8?B?ZjZVenRXOXduVWFDbjdyaDRBbUxTbVoxNmV4MCtzV0dMSm9PMDhubFRmeVpq?=
 =?utf-8?B?QlB5b2drdHJIYmczNjV1TWNPcjd3cGJHSlNGTFExMTduRlpvUEcxS1BTTWhT?=
 =?utf-8?B?TGdBUXptcnozcWxiV0lyQTRMN0d0dTNPdUpvcG90WjhFTEFMV2p2NzhwRkN1?=
 =?utf-8?B?eUhxb01tbndwR0FtYWVUcWlkZXRqS3o5V1ZxRE9aTW01bEphNEJLU1lWRnVR?=
 =?utf-8?B?bDc1eDBZSWhBYjBzbmNnNFNNVjNFSzdRRmJmYVNwbnBRTXc5VW9zM1E1MTNT?=
 =?utf-8?B?OVVlRDdrZStrRnVvR002UTNvWFZKRjhac1dYa1RJWmhLdkJlWm82K0EwNG9t?=
 =?utf-8?B?dzlWWVY5ck85bU1NWXBnaWh0WVlKcXRLNWt6V1JHaUxEUDRJelhTcVBpSGtk?=
 =?utf-8?B?bmtxcHlwRDJwVGlLNGo0dExSZEVaamRGWm1zSnF3TjVMbHNUNFA1UjhzUGZQ?=
 =?utf-8?B?dzBNOE1ISnc2N09BSTAwbDBDNEhtRFYvZThJaFQwSFhBamc2QTRjL0d0c2Fa?=
 =?utf-8?B?SjZRa2U3WHU1Szl5OG5kMXduOEVLQlZ5cVBIV1E2M2lDcU9lN0dLVzJKTEI1?=
 =?utf-8?B?ZTBVbHpEZkR1bWJYV3F3RW9nbmpKak5VV1ZwNHJJWFUzNEJpNEdJV2lxM2Rq?=
 =?utf-8?B?eDNsSHMxVGF6NktmNU5zRWx6S2tmbjh5R1R6NUpQUW1XQXVoamNmSTBMSDNy?=
 =?utf-8?B?L1MxeCt0MjR5YlIvdkMyMjJkZmVaSEZhSkFuMjRFRlBZRzAvZmJRYW5oNXdy?=
 =?utf-8?B?WHQ5YXU1QkVSK3hnYzRmdG1xUmZDVDBlbUFOVFVLTlJCVy9yZldiRU9FMGRs?=
 =?utf-8?B?cHp1VzIyN25ScDFDY01YcDBIVGIrVm1EbS9SbjlXcG5uUGhXZkVqV2ZxYlVG?=
 =?utf-8?B?cktNdkppV0xDVy9kY2F3MWljaVZKVmRvTml3NW5NMUtsbURqa3ZFeHJFVXlw?=
 =?utf-8?B?OUdSVlZsV2J2QlRTWWUvUUg1Wkt1aVZtbUhwYXhkSHBIUHhCOEFhUzE5VmRE?=
 =?utf-8?B?Wk5QOW1DczBlZ0tndTAwbysyN3c2cStKQU5xUjF5amp4dG5OU1F3cjNZZyt4?=
 =?utf-8?B?ajd6MVJjaVZEWE8rYjhxeXFTbmlwTHBEck1vL0Exa0JFeXNxM2hBcnVXYnFi?=
 =?utf-8?B?Y0lHbEhKQ0JpSmMvNmtYQTkvTWUrMlBLK0ZkTnpHeGhrVzFNNzkzVGZ0bUQw?=
 =?utf-8?B?QWNITE1SUkpRYjJyRDhhbTNlZ3BQdnNkTytNUjRwOGNYZW5mT2FnYkoyZjJz?=
 =?utf-8?B?b2VXNVMxMHl0a0s0VmxDeldNV1lQK1VTOUdRRnZwbzk3OWo1Z3YwN2NueXRE?=
 =?utf-8?B?K0RvTU9pdU9MelpxZVFsdk9wUjEyV1ZDTjUxZXA5VndKb1dnL0NRdm1YN1U1?=
 =?utf-8?B?NjByZ1Bwby95VUNNeUdhRjFkOG5wZVQySmM3a1liSktsWDRycGNUNDVMdVF1?=
 =?utf-8?B?dytjamhSTDd0YnJ3UHZYMU8xSmMwYjJWbGkzaFp6ekVObzFmRTlvQzlxeUJ3?=
 =?utf-8?B?UlBqSjA0VEplQ3pocjhlL0FXTnQ4SklrTzFiVlhMMXEyVnF1UlU2RlJra3Bp?=
 =?utf-8?Q?2E2Rnpj1Kyryyn2kB60VQDKGbE4/er2jfbkO+THvnBted?=
x-ms-exchange-antispam-messagedata-1: S2MTISN6/LJ48oUGjJnwL/uy3Np+hhnw3Eo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2f1e79-09f8-4be6-5817-08da41d8f5a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 01:08:51.6029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TB9ObQoOBXXegiN2x2TZ2dcJrctp4jI+s2w+XC/SYcGJJCdXNYT7+YxNlKQ/EMSEtAA8Lnc8R4y0AQr3ZC0N7/6BV2Ex4E2hM5vxfk27GoZDZzT1z78pKeEnJk4hQB72
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8369
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2VkbmVz
ZGF5LCBGZWJydWFyeSAyLCAyMDIyIDY6MjEgUE0NCj4gDQo+IEhpIFNoaW1vZGFuLXNhbiwNCj4g
DQo+IE9uIFR1ZSwgSmFuIDI1LCAyMDIyIGF0IDI6MDAgUE0gWW9zaGloaXJvIFNoaW1vZGENCj4g
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgSVBNTVUg
bm9kZXMgZm9yIHI4YTc3OWYwLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNo
aW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQ0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3ISBBbmQsIEknbSBzb3Jy
eSwgSSBjb21wbGV0ZWx5IG92ZXJsb29rZWQgdGhpcyBlbWFpbC4uLg0KDQo+ID4gLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OWYwLmR0c2kNCj4gPiArKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5ZjAuZHRzaQ0KPiA+IEBAIC0xNjQsNiArMTY0LDUy
IEBAIGRtYWMxOiBkbWEtY29udHJvbGxlckBlNzM1MTAwMCB7DQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgZG1hLWNoYW5uZWxzID0gPDE2PjsNCj4gPiAgICAgICAgICAgICAgICAgfTsNCj4g
Pg0KPiA+ICsgICAgICAgICAgICAgICBpcG1tdV9ydDA6IGlvbW11QGVlNDgwMDAwIHsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMsaXBtbXUtcjhhNzc5
ZjAiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicmVuZXNhcyxy
Y2FyLWdlbjQtaXBtbXUiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4
ZWU0ODAwMDAgMCAweDIwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZW5lc2Fz
LGlwbW11LW1haW4gPSA8JmlwbW11X21tIDEwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBwb3dlci1kb21haW5zID0gPCZzeXNjIFI4QTc3OUYwX1BEX0FMV0FZU19PTj47DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgI2lvbW11LWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAg
ICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgaXBtbXVfcnQxOiBpb21tdUBlZTRj
MDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2Fz
LGlwbW11LXI4YTc3OWYwIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgInJlbmVzYXMscmNhci1nZW40LWlwbW11IjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICByZWcgPSA8MCAweGVlNGMwMDAwIDAgMHgyMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmVuZXNhcyxpcG1tdS1tYWluID0gPCZpcG1tdV9tbSAxOT47DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3NzlGMF9QRF9BTFdBWVNf
T04+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICNpb21tdS1jZWxscyA9IDwxPjsNCj4g
PiArICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGlwbW11X2Rz
MDogaW9tbXVAZWVkMDAwMDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAicmVuZXNhcyxpcG1tdS1yOGE3NzlmMCIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJyZW5lc2FzLHJjYXItZ2VuNC1pcG1tdSI7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmVnID0gPDAgMHhlZWQwMDAwMCAwIDB4MjAwMDA+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJlbmVzYXMsaXBtbXUtbWFpbiA9IDwmaXBtbXVfbW0gMD47DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3NzlG
MF9QRF9BTFdBWVNfT04+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICNpb21tdS1jZWxs
cyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAg
ICAgIGlwbW11X2hzYzogaW9tbXVAZWVkNDAwMDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxpcG1tdS1yOGE3NzlmMCIsDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyZW5lc2FzLHJjYXItZ2VuNC1pcG1tdSI7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHhlZWQ0MDAwMCAwIDB4MjAwMDA+
Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlbmVzYXMsaXBtbXUtbWFpbiA9IDwmaXBt
bXVfbW0gMj47DQo+IA0KPiBCaXQgMiBub3IgSFNDIGFyZSBkb2N1bWVudGVkIGluIHRoZSBNTVUg
SW50ZXJydXB0IFN0YXR1cyBSZWdpc3Rlcg0KPiAoSU1TU1RSKSByZWdpc3RlciBpbiBSZXYuIDAu
NTEgb2YgdGhlIFItQ2FyIFM0IEhhcmR3YXJlIFVzZXIncyBNYW51YWwuDQoNCkkgZ290IGl0LiBJ
J2xsIHJlbW92ZSB0aGlzLg0KDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9t
YWlucyA9IDwmc3lzYyBSOEE3NzlGMF9QRF9BTFdBWVNfT04+Ow0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICNpb21tdS1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4g
PiArDQo+ID4gKyAgICAgICAgICAgICAgIGlwbW11X21tOiBpb21tdUBlZWZjMDAwMCB7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLGlwbW11LXI4YTc3
OWYwIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInJlbmVzYXMs
cmNhci1nZW40LWlwbW11IjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAw
eGVlZmMwMDAwIDAgMHgyMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDIxIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSAyMiBJUlFfVFlQRV9MRVZFTF9ISUdI
PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZzeXNjIFI4
QTc3OUYwX1BEX0FMV0FZU19PTj47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgI2lvbW11
LWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4gDQo+IFRoZSBy
ZXN0IGxvb2tzIGdvb2QgdG8gbWUuDQoNClRoYW5rcyENCg0KQmVzdCByZWdhcmRzLA0KWW9zaGlo
aXJvIFNoaW1vZGENCg0K
