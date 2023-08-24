Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B52786C62
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 11:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238307AbjHXJ5l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 05:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240824AbjHXJ5V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 05:57:21 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2107.outbound.protection.outlook.com [40.107.114.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441FD198E;
        Thu, 24 Aug 2023 02:57:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6T3dzfFbeBiBXe3CetIReHnjrSMIXzSCMr5B5xjTX4byD5ChsEc8Z+qV4ZnKfgD0VgFp4VF/RmRUupcnuCJZJv9pSBzLPbW4+G6382RS65pMvbtR7LiTe28vyLV9QoopZqbNdEwSVhHrwJgk7ncaLZQHCbcfvgjf4q3YX9CQyzZrsF0cS4VbduMIXwhnmga1D62VFeB6Fl+3HfmfbXHv8w737O0r4bhqG8YHyz2dU2vdyByHidg7wfZF//LXOl23OqkjlFLys7Ewukc6f/XZ/8XLJsIlQuSnBDfOvckXVe883Va2/dXMJaMH8S11jB3omBRhtS86Kbw5e7tckPQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4s/UhQFNYWqbbhBj+kX3oC85+FnotUwb1s+HdUNEeAs=;
 b=Fdr8Sc0A37P6ldxURN6RYYFe9dwNRhuyX1mZ+0nWvAjyl9ysCfJgYoCpHIXd+je22dzTzw7lOboMsBy3gI9XTIDBdNHQdUXApokPLjK4/ZL0wIDhCqR6sHAI/f5ki6ZY8jTaJfCGpqGLI+8vX5aj1lepweSMg6osrlnH0JYJ7GyRaKOZL5PJgJS6OQLchJFJJpBhqEiERDM8LjRuyT7DFyg4CaAdok6o7zZMBaZXMItVpH9e0gTjz0eRbLqcCQnz79iWUpw/A7Fzlppw84+UEOZlUnyh0sXzy3cR12ATRWHt2s9cK3ukyFRw2a1Xy0ZiiRBBsqOZgxUBx8ORJfbxTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4s/UhQFNYWqbbhBj+kX3oC85+FnotUwb1s+HdUNEeAs=;
 b=oWQEOEz/MAC1cvIatNeGNnfa8zDyeuIeYM9HtWrbZDfizLlWlDiZ4znyHwsRJboONgqjDsd6EKQjVMYXCZt9rAU7P7WhSnonZKff9VNAsFhyRfe27nPe585dpr9CnJC5hS2JoQxoW+hFG1PaLUPI2S7dbuAHZHzLKNhZHdD+V9o=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10322.jpnprd01.prod.outlook.com (2603:1096:400:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 09:57:14 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%4]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 09:57:14 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 3/4] clk: vc3: Fix output clock mapping
Thread-Topic: [PATCH v4 3/4] clk: vc3: Fix output clock mapping
Thread-Index: AQHZ1mSFL5p7PNApFEqpyrj0ENw8/6/5HvqAgAAL16CAAAXLAIAAAl9QgAABeACAAAE5gA==
Date:   Thu, 24 Aug 2023 09:57:14 +0000
Message-ID: <OS0PR01MB592247E8EDFA57DFA08F5EB1861DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230824082501.87429-1-biju.das.jz@bp.renesas.com>
 <20230824082501.87429-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUyb0rt7T82h_wS1jCt=U-1o6tS+B0AgMTHgyBbkEi5eQ@mail.gmail.com>
 <OS0PR01MB5922249F5000425F44B6A075861DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXCnP7ErKYVtyfsxsABjUTgZDFRuWnSPtRoL=9m4-ciSA@mail.gmail.com>
 <OS0PR01MB5922F2A5E303B9E194B829F0861DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU52bhZf3AcpYZ-yRRaKCftpUaE8BeZYPXJO30+nLfc7Q@mail.gmail.com>
In-Reply-To: <CAMuHMdU52bhZf3AcpYZ-yRRaKCftpUaE8BeZYPXJO30+nLfc7Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10322:EE_
x-ms-office365-filtering-correlation-id: f3500a27-3475-41b0-98d1-08dba4887e43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XTp/PElWLwqQcYuLgiylMXi6ji+klfi/wGtAqaU1qC/ECdM/SCGjwNljwoPvMcMk5g8525As5JzYR1O8W0C4NArFXSU17TsViYPGaUq2fGpAMqdCBTbdvcAcahR4hOopl3g4fnGMLrXdO6I9EAvBz8+R/O9v1HJ7dcFmfLnL/obSNWhvLixrJ6r7uOBGpWr+G0iK32k4DTl/6dDFnWtpwDhCWjoJtjpGz2N+hrFx+ZXauPdQdNw8n9GbD5WY/Z7hWXV03CiBU+1LytJFibPEXZ/NgCitExU7ESsDmqReGu+AGAsp77byk/6dbRaV1bHoQL94oGw2ZF00kTNFYlZk8IC0iEPfnclkgMOgXhkNmWnTAy0IBVmwKWHqvwdcQ1ghK1QPKudTxP+wwmCPX1eY0MBAAnQuGWA9h07bWexCH9lhbuccakvlfBggIX6xwKCDgoP3DkmmXD/nh5kZUB6bFSx/BmXLhsmZ8ArrnZKAq4wB1V1pEkUqT4iW0WEzSXfdJc8Nm4F53qeAr2N4dsyfbn+h04xqGaydVK15GS9GyvCuQr6yjcfXZtfbXoWCbaFrkThjLMHN3aPJccMO0u5W7uqbwrMkR6GehjWYa3DWLxnby7LunO1AS9+H4pK1Aa+J
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(186009)(1800799009)(451199024)(52536014)(5660300002)(4326008)(8676002)(8936002)(83380400001)(33656002)(55016003)(26005)(71200400001)(38070700005)(38100700002)(122000001)(66946007)(76116006)(66556008)(66476007)(64756008)(54906003)(66446008)(316002)(6916009)(478600001)(41300700001)(53546011)(6506007)(2906002)(86362001)(7696005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVRpVzFJVVcxQWRCRWZjSm1MUVJjWUFKYmxIbXd3Nk1CbENXS2t6dGUwb3Vr?=
 =?utf-8?B?TEoyamw4eFVweUlxZzVCS2lCVzJDa3R2VWRlbWZCMHhvUXlCSUdtQmRSdjdw?=
 =?utf-8?B?amV4alZwUVBYOStjQlRoT1l6S2VSa1hBangxWGpYTzQ1NnE3eXZhTjZMSldl?=
 =?utf-8?B?MDdtUkw5empaanE0ZjZBYTZudUtURXFFWkxpd05jVzR3aFJJbjVVRExmdG9M?=
 =?utf-8?B?amVId3pudGlLT3JXKzhVNjZBTTA5VkNoMjhIODNDdXluQjd1RnE2Z011bUQ4?=
 =?utf-8?B?ME5lYW9waGFrbk1CbzhIL213Vi9aWldlNXZ6STBOQUdHN3FCdGdyQ1lBWHFt?=
 =?utf-8?B?VWNocG9HN1BKUG5ZY3pSUVg2UUE2dHFwOTQwb0tBZDVBUFBiUEE2ZUl0cVNE?=
 =?utf-8?B?bC9NbWxoblZKeGU0VTBtK3pHdDdic1YvckxybjZQeW5zaXNjd2NhWXFNNjVl?=
 =?utf-8?B?UzExYkRHTHM3TTJOeE1CSjU1djNlbGNUZlRlRE1aZjBWclY5WmJ5MXFlYVgw?=
 =?utf-8?B?bU9QcVhHeXEzWi9ucmdoVm5TUDcweXllTWxpSTlTdTUwVkQ4THVqa1dXMWRF?=
 =?utf-8?B?T0R0YnBUUVc2Y1RKT3A1VjhBRzM0ZmdBN3FZQ2I4N0wydGpyTHZXU082bEwr?=
 =?utf-8?B?aEtWeUdTUnZyKzRvbStHU25nOEdKU1ZveUUrREFPcjBjL1VWNnM1MUxZWGxO?=
 =?utf-8?B?bms1Vjh6UjRwZVBpTGUrcnJwU0VPNnJPOHVYbSttQ1dRcFZiTXhZSXZkQ0JQ?=
 =?utf-8?B?eDZoS2lWNGw5bmdBYTF6eWRHUTk4ejRLVThRek9ZSEo2Y1ppR1d4NXk1RzhX?=
 =?utf-8?B?b2xUUmwycFM1RzIrcTN2Q0pkRktXNGhQN1JDeENPS1IrK1Q5VUpRWk01ZkpJ?=
 =?utf-8?B?a3Jod2ZHUGpuNWdaSlRRc1YvWWxjZ0J4SXRQUjZIa2JOamtUcEtRRGNUSFha?=
 =?utf-8?B?dndURlQ4Zk1yTlJ5SlJRYzIzQnZNMkROazZLYlNjNDdabDY0aHVRa3V5Q1dV?=
 =?utf-8?B?dVBwUmF3NkV1REpHbm9NaGVnQlFHV1Y3dzVacjhRRjZ2b3NaR2NkejBrWDdT?=
 =?utf-8?B?UURHSldicFBTRjZNVm5GaXhxRDk0YjdVa2FPS0ZJUFNzMGdYS3JJeWozdHk0?=
 =?utf-8?B?d0tnVFhEOFJGa2V5NlFpTGZOTkYwRlFhQ3RwWHJudS85UFBJQmt4bGRnNGdq?=
 =?utf-8?B?UGJqTnRjR2FhU013bmxVcE5NQ0hpTlpMbWZTQXZKdWNXanF5MjREN242SGNC?=
 =?utf-8?B?b3phV0RwNy96aDE2SHp5RXhreVJVSlJoWi9XeUsyM2VQT2d3N3o4WTJUZHRF?=
 =?utf-8?B?RGlpOStCbkFRR2hLRmkwWFdibkZlV0l1RDJTS3ZDZnJqWGJ3WnBCeE5Yajdr?=
 =?utf-8?B?SDdLdkhiSUcraVFndHl0aEhja3FOQ1I3T2hNempqbnExdmIrbVprWUNJWU5w?=
 =?utf-8?B?aFN6d3BMVEFmS2Rwb296L05yZGdvTjIydkV6UGVmSW5jZm5Jd2ovNm9JSWNL?=
 =?utf-8?B?ek5TRGUrcjRNQnlQZjJSSTZra1J5RXdFdEljWlZNZjA2SU1HN1pjYjNEQXB4?=
 =?utf-8?B?Y3NrTFF5NEJmY1BKaEtHRUlUNkxpa0hkUjNUSXVNOEZaK2dmMEY0VzFnWDhQ?=
 =?utf-8?B?MHEvZDRhL0tQSUZYQzZoR3plQ0xzRFc4YTk4OUdBOXEvZWN2SGdpRWdZTTJa?=
 =?utf-8?B?UzRWbE9LUW9JaEV5R3VpNVpJdmxRenppck5mODdaUDhrT0RIeGw3eDJiUVlu?=
 =?utf-8?B?Q3VVOEFTdmZERWIvck05VTFtQzdTM0xRcU9rb0NNL3lUeHpMeFV1YXY1emhC?=
 =?utf-8?B?V1Z5RHpualBXVFpuZmRhTk5sSkkyM2VYUzgram1zMFpGYTBmOEVQR0F3SzRE?=
 =?utf-8?B?UzdHeXhqY2kvYWgyR1FjVVIxeTRZSW41YjY0OXdncjhNa1Y4VDJHZkxyZ3Jk?=
 =?utf-8?B?bHV1Y3dUUHFxQUg1QkpFSjdlWEVBZmczRWRhSm1vZDMrWVRENUx3cG8wY3Ja?=
 =?utf-8?B?Um8vV3daRjk5SXB1KzdCalVEUE9SeEQ2enpPZXBtNEVwTmtaV2RxTzBadWhL?=
 =?utf-8?B?bVdPV1ZsRUlQQU9VaVdROGZWRGx0UWFwQ25PL0U3TjJWOUdFUTBzWldFSlpz?=
 =?utf-8?B?QVp1ck9Zci90OHlpN2hhWjVoUmd6MDkvZE10cGx4Rkd3RVhqWDQ0RVY1RnB0?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3500a27-3475-41b0-98d1-08dba4887e43
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 09:57:14.3763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wRCCoIBoq7xGXWPgxV18vn6AeHRe8xG8OTk3BNjj8RWL95WjXbNzEQ94tr/pkxnYsn/024knn5JQkMNe2ldjm9tS7cD7kLBLEaTbKRwzNHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10322
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KPiANCj4gT24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgMTE6
NDjigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0K
PiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAzLzRdIGNsazogdmMzOiBGaXggb3V0cHV0IGNs
b2NrIG1hcHBpbmcgT24NCj4gPiA+IFRodSwgQXVnIDI0LCAyMDIzIGF0IDExOjIw4oCvQU0gQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+
ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAzLzRdIGNsazogdmMzOiBGaXggb3V0cHV0IGNsb2Nr
IG1hcHBpbmcNCj4gPiA+ID4gPiBPbiBUaHUsIEF1ZyAyNCwgMjAyMyBhdCAxMDoyNeKAr0FNIEJp
anUgRGFzDQo+ID4gPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+
IHdyb3RlOg0KPiA+ID4gPiA+ID4gQWNjb3JkaW5nIHRvIFRhYmxlIDMuICgiT3V0cHV0IFNvdXJj
ZSIpIGluIHRoZSA1UDM1MDIzDQo+ID4gPiA+ID4gPiBkYXRhc2hlZXQsIHRoZSBvdXRwdXQgY2xv
Y2sgbWFwcGluZyBzaG91bGQgYmUgMD1SRUYsIDE9U0UxLA0KPiA+ID4gPiA+ID4gMj1TRTIsIDM9
U0UzLCA0PURJRkYxLCA1PURJRkYyLiBCdXQgdGhlIGNvZGUgdXNlcyBpbnZlcnNlLiBGaXgNCj4g
dGhpcyBtYXBwaW5nIGlzc3VlLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFN1Z2dlc3RlZC1i
eTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPiA+ID4g
PiA+IEZpeGVzOiA2ZTlhZmY1NTVkYjcgKCJjbGs6IEFkZCBzdXBwb3J0IGZvciB2ZXJzYTMgY2xv
Y2sNCj4gPiA+ID4gPiA+IGRyaXZlciIpDQo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPiBSZXZpZXdlZC1i
eTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IFRoaXMgb3JkZXIgc2hvdWxkIGJlIGRvY3VtZW50ZWQgaW4gdGhlIERUIGJp
bmRpbmdzLCB0b28uDQo+ID4gPiA+DQo+ID4gPiA+IE9rLCB3aWxsIHVwZGF0ZSB0aGUgbWFwcGlu
ZyBpbiBiaW5kaW5ncyBsaWtlIGJlbG93Lg0KPiA+ID4gPg0KPiA+ID4gPiArICBhc3NpZ25lZC1j
bG9ja3M6DQo+ID4gPiA+ICsgICAgaXRlbXM6DQo+ID4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiBMaW5rIGNsb2NrIGdlbmVyYXRvci4NCj4gPiA+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IE91
dHB1dCBjbG9jayBpbmRleC4gVGhlIGluZGV4IGlzIG1hcHBlZCB0bw0KPiA+ID4gPiArIHRoZQ0K
PiA+ID4gY2xvY2sNCj4gPiA+ID4gKyAgICAgICAgICBvdXRwdXQgaW4gdGhlIGhhcmR3YXJlIG1h
bnVhbCBhcyBmb2xsb3dzDQo+ID4gPiA+ICsgICAgICAgICAgMCAtIFJFRiwgMSAtIFNFMSwgMiAt
IFNFMiwgMyAtIFNFMywgNCAtIERJRkYxLCA1IC0gRElGRjIuDQo+ID4gPiA+ICsNCj4gPiA+DQo+
ID4gPiBUaGVyZSBpcyBubyBuZWVkIHRvIGRvY3VtZW50IGFzc2lnbmVkLWNsb2Nrcy4NCj4gPiA+
IFRoZSBjbG9jayBpbmRpY2VzIGRvY3VtZW50YXRpb24gYmVsb25ncyB0byB0aGUgI2Nsb2NrLWNl
bGxzIHByb3BlcnR5Lg0KPiA+DQo+ID4gT0ssIEkgd2lsbCB1cGRhdGUgdGhlIG1haW4gZGVzY3Jp
cHRpb24gYXMgYmVsb3cNCj4gPg0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9jbG9jay9yZW5lc2FzLDVwMzUwMjMueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yZW5lc2FzLDVwMzUwMjMueWFtbA0KPiA+IEBA
IC0yNSw2ICsyNSw5IEBAIGRlc2NyaXB0aW9uOiB8DQo+ID4gICAgYm9vdHMuIEFueSBjb25maWd1
cmF0aW9uIG5vdCBzdXBwb3J0ZWQgYnkgdGhlIGNvbW1vbiBjbG9jayBmcmFtZXdvcmsNCj4gPiAg
ICBtdXN0IGJlIGRvbmUgdmlhIHRoZSBmdWxsIHJlZ2lzdGVyIG1hcCwgaW5jbHVkaW5nIG9wdGlt
aXplZCBzZXR0aW5ncy4NCj4gPg0KPiA+ICsgIFRoZSBpbmRleCBpbiB0aGUgYXNzaWduZWQtY2xv
Y2tzIGlzIG1hcHBlZCB0byB0aGUgb3V0cHV0IGNsb2NrIGFzDQo+ID4gKyBiZWxvdw0KPiA+ICsg
IDAgLSBSRUYsIDEgLSBTRTEsIDIgLSBTRTIsIDMgLSBTRTMsIDQgLSBESUZGMSwgNSAtIERJRkYy
Lg0KPiA+ICsNCj4gPiAgICBMaW5rIHRvIGRhdGFzaGVldDoNCj4gDQo+IFBsZWFzZSBhZGQgdGhp
cyB0byB0aGUgI2Nsb2Nrcy1jZWxscyBwcm9wZXJ0eSBpbnN0ZWFkLg0KDQpPb3BzLiBNaXNzZWQg
dGhhdC4gSXQgbWFrZXMgc2Vuc2UuDQoNCkNoZWVycywNCkJpanUNCg==
