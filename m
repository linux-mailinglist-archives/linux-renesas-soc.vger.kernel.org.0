Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3D657EBB1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Nov 2023 03:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjKOCJu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 21:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjKOCJt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 21:09:49 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2107.outbound.protection.outlook.com [40.107.114.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED48BE;
        Tue, 14 Nov 2023 18:09:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hw2QD9Qjr89ZbUkpT3KmHjA+MmORqMjxiY5c8y3lIcdKHoLubGLE1b4gSrCdZhp//Kci7QtAgYZP3Wrht/K/q/UHZ/xC3ia3RbIz0n2+5EenUNpCdddSGSz+01Sph45qNzfx1tiqpNo8pScMprm0TNYxmbI9KgXIbbV+z5htCBHn/BPUgtte8/TZxSVVrLeEqQ7r+8VkMSEcwPhkAF1bCfLO+RvaRNby2IcVDI0hNYNoN0we+5npZsqcdo9TKXlrHDhpZhg6Bh93l1Cz65EoSLrwWnoow+6aEGm+11Wt32BBC69sWxiCYGm+MuFsS3qcOQVDqJFRuAgHisw/4J1IBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIYdMK8927Q3iyXQp4EkNAu8WW4jTHmPVM8HJskKsRA=;
 b=dTj3jsFXz2n5o5h/N3Yw6KG5V4JJdujlYZcW6qKzQtzjW84Ujb6JS1KVmkiscFf3R6M64dBp9zrBpMKczA7hcTGRYzFo8LqLfLiQsk0jgwHquf1NFReNcFwjRJfEy4EfBLM+yAvB/sb2iGjtq98RwwwT53M2GPxr/aQFsFQFLAxzt1mfWrF0z2ikmPx25kFdTzN5V2Mg4LAyBhQWx+H5/uvsN3/SDRSwf3INZ7CyqWI/TBqBma5w7CGjGNpTtPqQLnu/euyNndsHjDPirVYe9mzSpTAO0Z6QuxLmw97vaXSoW+kRT5tyoZ/XJsDn1omg60T78/YIFNLUOhN2KGWhQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIYdMK8927Q3iyXQp4EkNAu8WW4jTHmPVM8HJskKsRA=;
 b=HWi1z3PB+gDGf5X5efmfJt7EWUQcSG1vvj25dlTSvF0EKq3dESfB4wOANWse5ffe4RulNwRPUQeWpKo3J+uMQ97LxL/2hqd8AkOtwxykhK5E11D5gJMcpUBKJcnvknnGIqmKbCrQKYzUrAwKCPyQXYv9nb/XxQwxgn97n87h3nw=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB11733.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Wed, 15 Nov
 2023 02:09:42 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%7]) with mapi id 15.20.7002.018; Wed, 15 Nov 2023
 02:09:42 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net v2] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
Thread-Topic: [PATCH net v2] ravb: Fix races between ravb_tx_timeout_work()
 and net related ops
Thread-Index: AQHaAoALb6SIWPIxUEiZAXqbN+NjubBRDKoAgCm+z2A=
Date:   Wed, 15 Nov 2023 02:09:41 +0000
Message-ID: <TYBPR01MB5341061AB0A805D0AF71FBB5D8B1A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231019113308.1133944-1-yoshihiro.shimoda.uh@renesas.com>
 <f5421248-3341-a5f7-84e6-c601df470a63@omp.ru>
In-Reply-To: <f5421248-3341-a5f7-84e6-c601df470a63@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB11733:EE_
x-ms-office365-filtering-correlation-id: 34be0586-6ccc-4cd8-9f73-08dbe57fee06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: egD7yornr3lUqwXleXhuobezXYqfQbxKBiO7aj1wTi4Wya1Tiaj79M/YHJEWsAEiFMMSYOpTQ3fBmO3ZEp/qTyfaOuNiE1Y+ztfJO2hw2/t9UEXbhLZE7PBopLwvTH8UKsQcXDi+TqYaRQEQ/M1rP9ZbeDVRS2Pkjrorx0rWmtit8++pqD31r+UXEclaHhzXmaS48lSN3gY4SuGksDL64Q9taQLHJE3QNimDfzdQSs5683mGCe8vxq22tJrnhgyMKA/tGWmvrLhXnxCX2ICzJ5IKHjyFlIS73iehQUWWKqUv14g/RN3SS2vQUebKGcsFhguxbivVwMCgf5/G5k47cFsEgSotZmnTi+db0fsYhLKKwIwnnqKgzAmYsUIWSmLS5AxffaHZWCntAVcWpLscK+yE0cBeAjLYw5KCEsc8YgyJTeEzZvPks3IEokQSy09KRn9RRV2wzybOZC2VghUQJaCuspRW4hZi9kGp389SrIjsZG0CSSY/U7sjN6AHHUBYxYaC3IvOJKvkIedi9OCG1tdceo1bRV7Y8d8PmaZ//SHMZsXPpRLCCtpETWL6/f5Rew0Lb57RmsxEyz6b4i5rYcNfb/Tplkn4q7iiS2sQTzLfcjsXLtKSCnYOs1G0dkDN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(39860400002)(396003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(38070700009)(71200400001)(38100700002)(53546011)(122000001)(7696005)(6506007)(41300700001)(9686003)(83380400001)(52536014)(8676002)(8936002)(4326008)(2906002)(86362001)(316002)(5660300002)(66946007)(66556008)(66476007)(66446008)(64756008)(110136005)(54906003)(55016003)(76116006)(33656002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXR4TXpIQmtlQXNlRGJlbmZ1cm9ZWkN1NFNPSlRucXBXRHAxbkY3SkxDanJx?=
 =?utf-8?B?amhHdlViSUdaOVdEbUg3QnF0RHJaSUVOaEhBWFdRdlRCcC9hZEtXNG5jSXk5?=
 =?utf-8?B?am1Yb1d6MS9TVkd0cHVIVXlxaWFoSUw2aUNQSFRiSlRuSTJiWEp6MU9TZWRQ?=
 =?utf-8?B?Zk1pU1lyVkczNzlTenM3MEZnZkZLdWR5cHh6eTQ3Y25XczlyZkR5OUNWSGI5?=
 =?utf-8?B?Z3A3NjlCK3pTTVVHdGpadGNDa2Uvb3ZjbE1aeGNnZytkZHdUR1hoVWJLblhy?=
 =?utf-8?B?a2owOUlmbUJPN0pIYmtiNEVJNjFRYXFvZ2FYa00zRmdBNUQ2U3FrY0VsYnBT?=
 =?utf-8?B?KzNHTXBMWkxLTzFVdlRmSldIWjJEdkdrQmN5M1dwQ3pXcVhRVnJXYjNLS2N3?=
 =?utf-8?B?RUxtK2s3S3hCWDlLenoxU0RqSWFYVnNpQUNMdjBiWm5xMzI4K0Z4eHdiSWRC?=
 =?utf-8?B?WlZRU2ZhV1ZLcGc2YUlWbHkxUEpyMlBnM0tvRXVhT3pyb0w0UWtvUkYxRTY4?=
 =?utf-8?B?VzZPRm4vVXdhejk2eFI2eUJLNjRJUlJ0SGUzSzZqVmQvYnVxU0VJRTkwZDd0?=
 =?utf-8?B?aTN0R3Mxc1ZBQXJadnFTNFV4UUtXN0dmWGNrRFdWNHBnVURVVzlpdjFPY0Ju?=
 =?utf-8?B?ZkJ3NkJKK2hUdG1INElpelFXSCtNTnVQckJwOVB1enRRRGl2N09hRjdjUWxa?=
 =?utf-8?B?Y3JMdWsweUhnYXV4ZXZ3eGNSWGNVMUNlbldBRGpSbDd0WW1lYzJrai8rNU05?=
 =?utf-8?B?UWJEeERZL3EzLzcxdzgweHg3UE92a1VUK0NJWm1RK3pUdSsvM1BXVENRbS9H?=
 =?utf-8?B?OUY1T2RUZzUwWDN0aHlSUlhjZXFhNXZzYUt0bDJsbnd3aTVBVTRvamR1bHBn?=
 =?utf-8?B?aWM3bFRGVElteU5QekVFL3RMdVhKUzZBcW1mUzZMeWE5Ui9nejFPYTZiRDgx?=
 =?utf-8?B?Y1dmdVlTcG1WS2t6NW5rcGQ4RmQrcmpSTWg0OGdSSnd1MjVSM3JtUjFpZTJE?=
 =?utf-8?B?UXBqakkwWUVheDgydmpINjZFNGlzUW9zQXpZeVFvN2JlUWVROTlOSXBBemJ0?=
 =?utf-8?B?YmVldGRHZzQwRHlicVhueVQ1WXRLMnYraUdqK0JQcGVNeG1NL29QaGlIL1I2?=
 =?utf-8?B?bkR0R3Bxbk8vM1F6WGZxTlVmOWVVemszTUF3a1M4MklkUisxNWRMcVJZcG40?=
 =?utf-8?B?UjJ0dE1ld3I1dFp4aGpOK2tzMFhVVEx3Y0poczRjRm1aNDRsK2U0UEhDdWht?=
 =?utf-8?B?Tm9UZWdDamRld1N5ZGkzL3hGVmFHaEFxdUlNQTkvNGdaVEVRWUM4MjNGOWZx?=
 =?utf-8?B?dzh5TGI1T0JsRzF2YXpRV2ZoMno1QWtsa2V6Q3YwbHpBNjFZUGhEbllRT1RG?=
 =?utf-8?B?cXgyNmg5WUtrbHRFaG1Ka3F6a3lPSUhWRExDTnE3WXRqS0s0OTJzZlNFa3pO?=
 =?utf-8?B?Z3FIQ3NnVnJyQ0ljaXU5VnBhcTBLMStOQ2tTYTEya25uS1ltTHNWUE5yT3RT?=
 =?utf-8?B?Y0x6RXVDVDF0NnJ4L0tIM1hnYVVxUzRyVS9YWmhvb3pGdTBlc2YxMzY1eStX?=
 =?utf-8?B?aGxqUGJEenhvR1hqeHZ3S0lId20vMStROVhqcTB0eEswaXZzam96eXdMSVRU?=
 =?utf-8?B?dVNrQVl0NE1XQUZjMCtla2U5L3FibFFVVmV1bVpaZ2RYQm5JYldWc1ZydWti?=
 =?utf-8?B?aDNFWnF3MUcyQWJ6OGFLbVdJY1QvT3VuMUNraTZyQWgrL1hkenNmU1B1TmVC?=
 =?utf-8?B?Nng0RmpQVEFUeUZrZ3hJS1RsU0U2VTJ3cnJmSmdzK1Q4c2lzeFZqK0V6cy9y?=
 =?utf-8?B?Z0J2NzZ3bmYwWmlpNGw0d0hYaGtWdkN6ZTBMMGpwc05qY3U1MjhjNWE5aG80?=
 =?utf-8?B?a3cxaFRKNWZaMDluajIwNmFxNmM2MGdqZ3VoV01RZHU1WjBpYVVrY2ZHK2w2?=
 =?utf-8?B?aWVlMC9DVFBqWGFncnE2V1ZXa2xvWGVFVXJqa0dlWm9WcDQvb3U0UHhWMzFE?=
 =?utf-8?B?Ui8xMkhuRmF0OXkyRnpDY1F6VFVGRUdoVnBWVlFsaDBjQS84U0FiSDdqbG5k?=
 =?utf-8?B?U1ZSTHhiNEEwYXhmbE90ZkVGWlNHTnFaZnhsSDhNTndwMk5pa1FTcFBDZ0N0?=
 =?utf-8?B?SHVXU1NPTU9KRjRwOFJaVXR5OXh2VlU3cU9CZkxsam93c3NQclFheFlES3BK?=
 =?utf-8?B?YkVneFFsQi94VmprVy9sL2ljNU9lM0gxSDVab0JUTjFYNkZ4cDBXNmdTNG16?=
 =?utf-8?B?a3hMdkM4emZPVlVkWkZUNklhTHV3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34be0586-6ccc-4cd8-9f73-08dbe57fee06
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 02:09:41.9918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EHgUEHcZqVSDY88apwfZ/riwiYrrV0m2Ogt8SWsUwdVXFRl6FxREmAHx2+ox7fNaHDEnJZfTbufBjCzV5jZ4E4vgHZ03RYqJVgMrw/wcdFyA6ZKuhWRu6ZTKW8qEBEi3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11733
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gU2VyZ2V5LA0KDQo+IEZyb206IFNlcmdleSBTaHR5bHlvdiwgU2VudDogVGh1cnNkYXks
IE9jdG9iZXIgMTksIDIwMjMgOTozNiBQTQ0KPiANCj4gSGVsbG8hDQo+IA0KPiBPbiAxMC8xOS8y
MyAyOjMzIFBNLCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4gDQo+ID4gRml4IHJhY2VzIGJl
dHdlZW4gcmF2Yl90eF90aW1lb3V0X3dvcmsoKSBhbmQgZnVuY3Rpb25zIG9mIG5ldF9kZXZpY2Vf
b3BzDQo+ID4gYW5kIGV0aHRvb2xfb3BzIGJ5IHVzaW5nIHJ0bmxfdHJ5bG9jaygpIGFuZCBydG5s
X3VubG9jaygpLiBOb3RlIHRoYXQNCj4gPiBzaW5jZSByYXZiX2Nsb3NlKCkgaXMgdW5kZXIgdGhl
IHJ0bmwgbG9jayBhbmQgY2FsbHMgY2FuY2VsX3dvcmtfc3luYygpLA0KPiA+IHJhdmJfdHhfdGlt
ZW91dF93b3JrKCkgc2hvdWxkIGNhbGxzIHJ0bmxfdHJ5bG9jaygpLiBPdGhlcndpc2UsIGEgZGVh
ZGxvY2sNCj4gPiBtYXkgaGFwcGVuIGluIHJhdmJfdHhfdGltZW91dF93b3JrKCkgbGlrZSBiZWxv
dzoNCj4gPg0KPiA+IENQVTAJCQlDUFUxDQo+ID4gCQkJcmF2Yl90eF90aW1lb3V0KCkNCj4gPiAJ
CQlzY2hlZHVsZV93b3JrKCkNCj4gPiAuLi4NCj4gPiBfX2Rldl9jbG9zZV9tYW55KCkNCj4gPiAv
LyBVbmRlciBydG5sIGxvY2sNCj4gPiByYXZiX2Nsb3NlKCkNCj4gPiBjYW5jZWxfd29ya19zeW5j
KCkNCj4gPiAvLyBXYWl0aW5nDQo+ID4gCQkJcmF2Yl90eF90aW1lb3V0X3dvcmsoKQ0KPiA+IAkJ
CXJ0bmxfbG9jaygpDQo+ID4gCQkJLy8gVGhpcyBpcyBwb3NzaWJsZSB0byBjYXVzZSBhIGRlYWRs
b2NrDQo+ID4NCj4gPiBGaXhlczogYzE1NjYzM2YxMzUzICgiUmVuZXNhcyBFdGhlcm5ldCBBVkIg
ZHJpdmVyIHByb3BlciIpDQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlv
c2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IFNlcmdl
eSBTaHR5bHlvdiA8cy5zaHR5bHlvdkBvbXAucnU+DQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZp
ZXchDQoNCj4gWy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVu
ZXNhcy9yYXZiX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWlu
LmMNCj4gPiBpbmRleCAwZWYwYjg4YjcxNDUuLjMwMGMxODg1ZTFlMSAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5jDQo+ID4gKysrIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21haW4uYw0KPiA+IEBAIC0xODc0LDYgKzE4
NzQsOSBAQCBzdGF0aWMgdm9pZCByYXZiX3R4X3RpbWVvdXRfd29yayhzdHJ1Y3Qgd29ya19zdHJ1
Y3QgKndvcmspDQo+ID4gIAlzdHJ1Y3QgbmV0X2RldmljZSAqbmRldiA9IHByaXYtPm5kZXY7DQo+
ID4gIAlpbnQgZXJyb3I7DQo+ID4NCj4gPiArCWlmICghcnRubF90cnlsb2NrKCkpDQo+ID4gKwkJ
cmV0dXJuOw0KPiANCj4gICAgSSB3b25kZXIgaWYgd2Ugc2hvdWxkIHJlc2NoZWR1bGUgdGhlIHdv
cmsgaGVyZS4uLg0KDQpJIHRoaW5rIHNvLiBCdXQsIGl0IHNob3VsZCByZXNjaGVkdWxlIHRoZSB3
b3JrIGlmIHRoZSBuZXRpZiBpcyBzdGlsbCBydW5uaW5nIGJlY2F1c2UNClVzZS1hZnRlci1mcmVl
IGlzc3VlIGhhcHBlbnMgYWdhaW4gd2hlbiBjYW5jZWxfd29ya19zeW5jKCkgaXMgY2FsbGluZy4g
QWxzbywgSSBhbHNvIHRoaW5rDQp3ZSBzaG91bGQgdXNlIHNjaGVkdWxlX2RlbGF5ZWRfd29yaygp
IGluc3RlYWQuIFNvLCBJJ2xsIHN1Ym1pdCBzdWNoIGEgcGF0Y2ggYXMgdjMuDQoNCkJlc3QgcmVn
YXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gWy4uLl0NCj4gDQo+IE1CUiwgU2VyZ2V5DQo=
