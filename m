Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B94054E005
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jun 2022 13:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359656AbiFPL1q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jun 2022 07:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbiFPL1p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jun 2022 07:27:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA9D1C134
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jun 2022 04:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgMJcRusEpY1VV1qRr6gW6rlOU06OdXPHPF4Qmm+3/IcORzmKT2iW3ySnYX8P0UJssUM4C4/ERTTXHcC1ek/WgjOEVb9mchcp/Ya8m9EeFzkpZBa1zrqjayVg9ZF1WLMb5qjzwAD+a/84vvzXTqP+LxtH86hRHntnVjX+7lY/Fs1dHcsRRuNG0MxQC2T5s8lIG+nIb0fMiHveNofBZbFMKWZSIxbOxA5ReUIc2NE/Xx+gDKYlAZDnFAHaeMhrUFH1UJI/glAbhm5T4qIEGhb9zohaYXUs3WcBCLZnlnfazBKPntA1Qf3X/p/XJtitSJmN/5fvTTaPffrDy1B/o18lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzwTFWsPJR0dLY8oAv92TE+oWXWWj4nfbGF7fP3Pvrs=;
 b=YDBuJhWWnLzvzouJAV+zBWsBbxgSlGjQOU2jnjhQFDNeQdL16uOvlFBGdXts9zckPCAv1QpGUYNcxp8SW3p2zgGYo5EhdOCXXxExTSabzai25e4THPQa/9WYR6yBCgVpVcCcLKJEIt2jCLvuiMmVQswe77mCQyZdP+9wEwfArprKslR8T+qKmGx+69BaaL9BtF6lgvaigphfDO7ynGhnKrL+BxKbFpxTHu4r29SAu92WTv7NP6ch0aqa/juu1YnM/Dc0++6LfrgAYYjIyK6GdgxPR0w3JE2BfmYY0au3SedVc3+wO8L3oMeK2sxMdI/o0tecxoSNQhTVjlCF04JVKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzwTFWsPJR0dLY8oAv92TE+oWXWWj4nfbGF7fP3Pvrs=;
 b=JNFCyAZ01le3q37x0hLFEhJcOgUR4iz7TTfRAI5qdmsz/JFAztaRpXE00bA1XEmp/kCuTjXm/fVj3K3VybGN2GLhupRrNyFs9mxFuIz8NUVRWN32aVDrcXLPG9yth7w5KQyYBzmG/oiaiISnmhcsPaQkr6E0CBFqB3AiZ/WMwDU=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSBPR01MB4887.jpnprd01.prod.outlook.com
 (2603:1096:604:3a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Thu, 16 Jun
 2022 11:27:41 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::b596:754d:e595:bb2d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::b596:754d:e595:bb2d%6]) with mapi id 15.20.5353.013; Thu, 16 Jun 2022
 11:27:41 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] arm64: dts: renesas: r8a779f0: Add IPMMU nodes
Thread-Topic: [PATCH v2 1/2] arm64: dts: renesas: r8a779f0: Add IPMMU nodes
Thread-Index: AQHYc893vK9Oe4eqJUajL6oWQutVaK1QVtEAgAGo0PA=
Date:   Thu, 16 Jun 2022 11:27:41 +0000
Message-ID: <TYBPR01MB5341C4B91E7ECFC77D94510CD8AC9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220530024626.1870277-1-yoshihiro.shimoda.uh@renesas.com>
 <20220530024626.1870277-2-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdV+mwbymADOLezK7F-sZzi5FgUGez0ZCFdq9bowJfuuCg@mail.gmail.com>
In-Reply-To: <CAMuHMdV+mwbymADOLezK7F-sZzi5FgUGez0ZCFdq9bowJfuuCg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05259f42-bbb9-451c-43bc-08da4f8b3996
x-ms-traffictypediagnostic: OSBPR01MB4887:EE_
x-microsoft-antispam-prvs: <OSBPR01MB4887D09A757A126914A1C46BD8AC9@OSBPR01MB4887.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8R/giOVMMT93sJdBTGzPUPxGNCYPhvvUGqv72DVQVV51bkBklNiljj7KLtg75N1VgNNWi7uCSzcsTC8HdyGYEcKtXnz4C9CT8hNZ64zX5uyBr5pxmAw7RP+GigaVHj/4Po9KiJdTWnJ+ruLJElNGSEJtR+zu2YJq4VEBs0gOYqpCRU+maCm8n9j/BKTW3qplXIB7rh/dlZok3Ue4IEuyypiUK/zNZW6hwDxYy/IrWDRWpl+D2QvGiLqQWp64QKzoXuzrj7H0pZywIuGi5GDunvEC6fhfM00ZkuNHwCsBUGFRikpAJg0bn575UF+DG0GWQYG36sTO1BrZyGMn0/zk2M7CSg/6mFq7pCS+u9W5UK6x6JWqscso0XJ1s/bG8D/t8RtnrbnuFx7dg+RdXHKa6m8C4pu8Z3BsSHTlw8wiM+mBDeOhnejxXNXmD1JB5VQ2LO4PRQ4QR8HO/N7cVEUz0OzCLZbrgxRw4wyhNqUgxBGuILSavCL3qIBzPN6qwvUm+2hz2snBP1SwDILqycKj06AJ88jQ7WAb8FLTxEe0UvLEbg4p5RErVA/IXIKbj2CHNP8jWoRh+dKMeW2cYzHU1wiBE1KF08CCyLvILDrsw+PJ/g2qNskuM3KWixGweUKj8h7uRVQA1ZNCwyWqqdl/grxkU4tQpbsJKaECtK5tgEiwdM0bVEItvxsHhEh+Wd4Lon/edqpC/AwgpqTUvVlJig==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(6916009)(66446008)(2906002)(8936002)(55016003)(66946007)(33656002)(76116006)(71200400001)(66476007)(52536014)(8676002)(66556008)(5660300002)(508600001)(64756008)(38070700005)(86362001)(122000001)(316002)(7696005)(54906003)(6506007)(4326008)(53546011)(186003)(9686003)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFJidTRZOXkvMW5WZnhPYVNvQkV3WllsRlo2a1htY2hjRG9ibTRDZHNwT0lK?=
 =?utf-8?B?ajVkVE1sY2NZRXJpaDlBOVFDV3EvclZYNFZqV1hnNnd2MHBRc2JMb1BtWFc5?=
 =?utf-8?B?RmJ1dXNTR1dWaW5sZlE0SUpLR1Y0VjhOYzNEc05ITjdGcUdHSGtZMHIvRU9Z?=
 =?utf-8?B?anFnQlM2cDZQNndPZHFxTVAwQ09IbnZvT0hFbEJxejg5VlErS2dqaVB6UWZT?=
 =?utf-8?B?S3lkZ29lK24zemlhREFYZ2pob3B5dnVmSFRBWFhFZ1pjdkhkemt4TUVVdjRI?=
 =?utf-8?B?clZlRXRFa1pZaHpHcVhIN2JzaCtzZnRpY1RtWURoSzA1a3NZbURCN1hoWDZ1?=
 =?utf-8?B?UXdqZGtJYWRmaFllb0lKN2hSVXpHWUp1V1M5ZkloZGlQMnNUUVVTRVhPRUpD?=
 =?utf-8?B?NktGSmZuSkRwcjgwNVRzM05uVW02cUIvZW9paHg4am93WXlPYk5pdjJrZFJR?=
 =?utf-8?B?cktRZk9oMjBGYXNNMjZSeUUrZ2doS0lSWnJKMjZLVWw3bGhjNXJUcVZwY0ZQ?=
 =?utf-8?B?NXAxdTVpSWJ4NnhIK1hOR1dSSXRIWkF3Mml4MnhSRE5HL3V6Y01hajZwYjNa?=
 =?utf-8?B?V1MwVUlIOWxBUTZjSkNKUmEyamQzekhKdmtHR2R3RUs5SDcrdGFCUmFNRmV6?=
 =?utf-8?B?a0YwTW12OSs3Q0RRWW5RYVRKQkVOR0c0dGZPS3pGc3ZSSXlBbEJzTHpLNmd1?=
 =?utf-8?B?alZkU1Z6TEFwQjZFOHp3cVZvd0lJZ2tZUHAwOTFQU3BieEJJMGFFaXNScnlV?=
 =?utf-8?B?dG1pcW1MTUlNeXV0VXA4UWpEVGhZWGVjT2pub2pJVGtwZUt6QTRzcUc0OFNB?=
 =?utf-8?B?cGczeWtEYm95UVdxVUVRMHVkbXNKLzFOdkt3Q3JWVWpsSHRlRXFKZk5sSFNO?=
 =?utf-8?B?bFhndzcyVEd2V0YvVVp1a3ZxMElMVjV2d0pHazZOZjJ2aFhMVlEvVUF0dTI2?=
 =?utf-8?B?VHZWQ2pBZDl4VVZWZ2dmRU12V1FkK05rdGRvQW1GY1A1VktFbDNQR3JGRCtZ?=
 =?utf-8?B?RHRjUlE2QzdQUWM3d1E4UG5rdTdyV2dvUTNzYTRnZlVEeWx2V3hnblFXa3BV?=
 =?utf-8?B?cGNXaitzNmpmSDdHK3JjQU15ZjZBSFRHUkUxS0w5OHlzRW1WanVPeGlYdEsv?=
 =?utf-8?B?OVUrZVI1UFRLYjJvMC9ycFRtdWw0dVlhNHJvaG1WQWN2WWNUblRiVHpGTjZn?=
 =?utf-8?B?eU1OSEM3UzdFZDVpSGlIdk5ubGwrNDVSa2ZNWVMreTVCMGJWbzBRVFhFd2Y2?=
 =?utf-8?B?TGxuYU1DajBrZy9FbUJwcWF1Mlo0VUQ1RTROUjVoM3QzN0RnN2M1UFB4bjFv?=
 =?utf-8?B?cWJOLzRSRm9TdittRlc3QzlZSkE4cVVVN01YWG1WaXRqTTB6QVlUMFdVcEt2?=
 =?utf-8?B?LzFqRnplMWI2eTFXSEw3NHRZQy9TRmpQNWN2SjNIRDhyT05wU2NGUXFxaTRz?=
 =?utf-8?B?LzJ2K3ArdTBVWnQwVjA5dk1OaWQ2SFJVVlFpNXdhMjE3M2tDUmwxY3dpS3Fx?=
 =?utf-8?B?RWZWTmQ3S2llODUrdWk3Vm9oQk1uMk4zUXZLWU01VTFtZkNLYTFYSnhUZzFs?=
 =?utf-8?B?aHNJdEhReFdvUk1tbG54TWRqSFpyM2tvNjFQQ2ZmckJsYWVPWmxsWkVjUXU1?=
 =?utf-8?B?UjVjODBPVFNwaDRWL3lIcXlEay9BRzhlR0lDZE5LSFFLQ0RjMjVvNU84eEZo?=
 =?utf-8?B?OTFsRWZQbUlUaTlobDNJdzFrNXFCTmtxc09UMGxPTVpIVUFqU3dHTGc1c09h?=
 =?utf-8?B?V29iOXdCblVFY1VYYlBYZ1NSVnFmN0lTd3JnZ0tzZHFSZk5hU1h2Zk11QUda?=
 =?utf-8?B?bk1lb2l5VU9ORm8vOGZSSlZuZjhaRmp5R2VvTThUSzBqNlBvZVVIYmZDeEkv?=
 =?utf-8?B?M0pHR3RhTkhvbWhCOW9pcnRpdGJSclFPQW85cXJCUi9vWmFtOC9WNEpmbkgy?=
 =?utf-8?B?aU5FbE85RmdDNHVUamkydFdaZThyNHhsWmtsaG1ySkNhdGtDeXpwOTRORUJr?=
 =?utf-8?B?enhBbU1OOWdBSHR4dDdPbUlzN050bUxFVWtvQTNTcnpJWUUwUjhPOGRTZHVT?=
 =?utf-8?B?aGZtV2ZXZCtWdE1nTUtIMUJaOEVFNE95cEtPQ2ZjUGVLSUdPQXQ0MEorNHNO?=
 =?utf-8?B?YlFmSUNIVWxndjBkKzZyU1VkbUkxTjZYcXl3aTN0L01INE0xQzFBOFVJNnpv?=
 =?utf-8?B?MnFVUElENFFDanBZcjM3cGRjdzZZdkZSOC8zUWFzem9WKzdwQXlNVHkyZWFx?=
 =?utf-8?B?Ymh6bzVxWFdoeUNQV3FMZytHWDBycUhHcU9rSnhMUjNrd3MwSjFiRmpwRFNT?=
 =?utf-8?B?QmhKUFJlaWQ1ZmVNcms5NnhudlorMDZPaGFXdk1wdEZwVEpadWtSZ21PZ0pX?=
 =?utf-8?Q?XmJp5AryniJqHqRK4XUPJD4cT9z4m/tf4N7lwu2NL9x2c?=
x-ms-exchange-antispam-messagedata-1: uPc4Ux+j2kqjlyGmL8Dt4k9Y2j1keZmE38U=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05259f42-bbb9-451c-43bc-08da4f8b3996
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 11:27:41.0919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NUyNHxY6KucY14REs/dK5ompw+SDHI67ukkoSI1lOz8TMH7xFrIeN79Aj8PUjilDAjLWK6bWqhmsfQ/z9LTnKB7DVgy1fZnZ5RHrYjPkWFLxAByYIzAu2uQrqmGXW/by
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4887
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
ZGF5LCBKdW5lIDE1LCAyMDIyIDc6MDQgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
T24gTW9uLCBNYXkgMzAsIDIwMjIgYXQgNDo0NiBBTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEFkZCBJUE1NVSBub2Rl
cyBmb3IgcjhhNzc5ZjAuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9k
YSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIGFyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzlmMC5kdHNpIHwgNDYgKysrKysrKysrKysrKysr
KysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKykNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5ZjAuZHRzaSBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzlmMC5kdHNpDQo+ID4gaW5kZXggZGY0
NmZiODdjZmZjLi41MTJlMGI1N2ZkNmEgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9yZW5lc2FzL3I4YTc3OWYwLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L3JlbmVzYXMvcjhhNzc5ZjAuZHRzaQ0KPiA+IEBAIC0zNDMsNiArMzQzLDUyIEBAIGRtYWMxOiBk
bWEtY29udHJvbGxlckBlNzM1MTAwMCB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZG1h
LWNoYW5uZWxzID0gPDE2PjsNCj4gPiAgICAgICAgICAgICAgICAgfTsNCj4gPg0KPiA+ICsgICAg
ICAgICAgICAgICBpcG1tdV9ydDA6IGlvbW11QGVlNDgwMDAwIHsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMsaXBtbXUtcjhhNzc5ZjAiLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicmVuZXNhcyxyY2FyLWdlbjQtaXBt
bXUiOw0KPiANCj4gInJlbmVzYXMscmNhci1nZW40LWlwbW11LXZtc2EiDQo+IA0KPiBJIHRob3Vn
aHQgSSBoYWQgZml4ZWQgdGhhdCB3aGlsZSBhcHBseWluZywgYnV0IHRoYXQgd2FzIGZvciByOGE3
NzlhMC4NCj4gV2lsbCBmaXggZm9yIGdvb2QuDQoNClRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgaXQg
b3V0LiBJIHJlYWxpemVkIHRoZSBkcml2ZXJzL2lvbW11L2lwbW11LXZtc2EuYw0KYWxzbyBtaXN0
b29rIGFib3V0IHRoZSBjb21wYXRpYmxlIHN0cmluZy4uLg0KLS0tLS0NCiAgICAgICAgfSwgew0K
ICAgICAgICAgICAgICAgIC5jb21wYXRpYmxlID0gInJlbmVzYXMscmNhci1nZW40LWlwbW11IiwN
CiAgICAgICAgICAgICAgICAuZGF0YSA9ICZpcG1tdV9mZWF0dXJlc19yY2FyX2dlbjQsDQogICAg
ICAgIH0sIHsgDQotLS0tLQ0KDQpTbywgSSdsbCBmaXggdGhlIGRyaXZlciBhbmQgZHRzaSBmaWxl
IHRvbW9ycm93Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IEdye29l
dGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+
IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNh
dGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQN
Cj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVy
IiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
