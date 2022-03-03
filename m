Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 925954CBD83
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 13:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbiCCMSq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 07:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbiCCMSp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 07:18:45 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2126.outbound.protection.outlook.com [40.107.113.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FD7FD1E;
        Thu,  3 Mar 2022 04:17:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0QJuZI/wmUnK73CC7IasXgW/jy+LAz5LMN9zlYO/WjrLQ6frAFkgwVZB1Hni7neozgoZqcxPRvuM1jxrkWlUvBF3rKTIh7xxe9UIXSSaL9VdR/oCZUdUtY4Nl/i3hyc0HA6Lr925MJkEFCz21p7QfNSosdAzS5VEEQmOUzE56AlnYK8vSKNuJyZMNs/DI+wrXFj+Xx8mSMOrqsL8VUQpLZCPfO1g4UYEIpgh26Y+iW8XOVmnxNjEZ0gDlLJ8FHM/mYkhBquG/baP27hfbP+rMTOUYHpTJMrPrX9WBhEfHvwV+XgmN+tF0o8Bh6o54QcHwCqyvjI/gXkIdg0YMcG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHfA1gEZHtrCxA955Rpf8mmv+QY0fv/c0p16XchWSFg=;
 b=Kqw4987KHSNI8wNYVdhhy/fQRFVpeENYVNRHpjtFR5su4+2FlWwSLftW1YD/D84lTVVqUG7oDZmIdYzZl6bdUqfoJWtZbe59M9jMqx9V7OSdy09kDKGfF4TKXuCJaO9u7qwuROPpazZfaWjF6mv4aaKN5w7oudvCUxfVwLIPbs6J9lKZ8lh5APWplIlXEmR5hcHkCyL9s4CEwqqB4wQPaPUGikMTq8bxb1s7gPpHLAM9YWzqxCuQxTH5o7G6LWdw+eKLSjVrgGiQ7B4vi3JJN9iyPEqXxM91BbqdObzKkf7k/9XbhiI/Dj1y3E5fcnUp1ei9213MNdPTCg8E77yOUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHfA1gEZHtrCxA955Rpf8mmv+QY0fv/c0p16XchWSFg=;
 b=nv7rWFMaqaqCD9MEUoywfx1jBjz1jG1zvqIjd7ORaCO9FGUyTwwmh5PsRy04h97XA5rc8XEGRBUC+cXIKT526P7GJkfptYI1rilobRyZ2v862YFcQlffFxaOG1FPIC3szyomCJ3QZFyJ2k1q4Gud+8cNmb9FAGlX92x/63/68i4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB5692.jpnprd01.prod.outlook.com (2603:1096:404:8052::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 12:17:56 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 12:17:56 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/4] arm64: dts: renesas: rzg2lc-smarc-pinfunction: Sort
 the nodes
Thread-Topic: [PATCH 1/4] arm64: dts: renesas: rzg2lc-smarc-pinfunction: Sort
 the nodes
Thread-Index: AQHYLiDpucj17VkmNkmW66gCKc/AMaytZOeAgAAvokA=
Date:   Thu, 3 Mar 2022 12:17:56 +0000
Message-ID: <OS0PR01MB59225007E2DF9654450C2A7586049@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220302103301.23852-1-biju.das.jz@bp.renesas.com>
 <20220302103301.23852-2-biju.das.jz@bp.renesas.com>
 <98b0cafb-4f0b-5e4c-72b0-a0983d0ff493@gmail.com>
In-Reply-To: <98b0cafb-4f0b-5e4c-72b0-a0983d0ff493@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ef83f70-9950-41c5-072e-08d9fd0fd9b2
x-ms-traffictypediagnostic: TYAPR01MB5692:EE_
x-microsoft-antispam-prvs: <TYAPR01MB569270C8C0599B0EC77DF85686049@TYAPR01MB5692.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7i+2T6xQaPrIZ5K17MzH3WTPX2UwKzDGU+XTvKF0hOuhzfoj8c4mNeGVxTU5Ml264tsJylhG+s2biTao5gtekrWVYLHMu1pU37NeQXIXNPmgQl6bPqTKiFIoZIxHPoPYndc42LGitfDg2NRSkgqwzLcwQUnCcdnuTnEiCQ7GgW65eel2gn0pZnP7A8Re5lyOh500MPC7VEOGZHtoMbkNsRVV4WMPB9gqRjXuJWUKZi7lyx3km3fiAZzcFZrr+xfy6HYkseWrsmEsxAoWT1Q3VsxJamvfYFBpk5eSVdKFsGAOk2q45sSEjq/CKhFScPrpiwq2x/CPgmaLj1VKVl1IrB3D1L1/kesnQrr4V/zG9wfvQdkD+ERthAnyzvvlW00TDJWOceKdv0A64Dui+V5Qb2FR+q/Y5nluPNA8/o+9uz16Dt9ThBfaDSR30eFSHOK4GLfuEVBw0vrYShQ0h7IVFn+uoof6aQXmYVivuVieW1zpjpivNjBBqkoA2aIcP7mKjvzhKAhaI4b1OxftjC0j2AWCRQLQxJnPryNe0D5+vY02p3YTDE0nUpcHaZqp7pIVTMy5OktN+eJ9uEs56Mvbtm2RCAvzY7JchavHLzxcwkvIyYsfa1j+rjygHVIUXHoM7Gv3Vd9F1Hkcnpz0flU4lUZHVONPncN+zMe/La4Id0VAcsnUkz4AvR0duHarck7cGqBXGEyQSkgWRDIlQjKaYw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(38100700002)(8936002)(66556008)(66476007)(66446008)(52536014)(66946007)(107886003)(71200400001)(316002)(33656002)(55016003)(9686003)(508600001)(2906002)(8676002)(5660300002)(64756008)(38070700005)(86362001)(122000001)(4326008)(26005)(186003)(54906003)(7696005)(6506007)(110136005)(4744005)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0tIWEtLWFh5dGZzUUpmRjEzUzVoN1Q3Zm43cy83SWVaZmNiNERtMGNSRWlr?=
 =?utf-8?B?YklNQVcrbjBQdHl6OFYrSHh6bjlSdVY2RkJTVWRZVFRTZmkxT0JzNWFDWXhh?=
 =?utf-8?B?d1JUb21nVlFXN3UxbjM1RFJMdzN2OHlWRHFZUFFUZ0p3bVBaOXlieWdjdEpF?=
 =?utf-8?B?dlE5QmwzMkFaNFE0emVEQ0J0a1ovNlUrTVlJUy9OY3RkbTBRMVFvNWcxckJH?=
 =?utf-8?B?NDA2S012bWRQaEY0VWttRGtwYU1OWjA5cVJCMWhLejhXSVFVY0pyNlV2Ri9o?=
 =?utf-8?B?MXluU2JOUktQY0lHNXI3NHp5N2crb0NtRUZZejU5ZHdhd0NNaGZQdnBKeFFX?=
 =?utf-8?B?WGw4WnRkSEdPcnFTNjJXNEFZMGdjRmZhUjR3bitRdVdTTXlFMUQ4WVhhTjRD?=
 =?utf-8?B?eVhSeVllcHl1WjYyd05EejgwVkZ2MC9rc2NxNDNXM2FLYk03VzhNczkxUm8r?=
 =?utf-8?B?U0tVOUpCWGFrR0JqV1pZREJmQTR4VnJuUlVIQXB2MzNncE5jZm5MNU1Jb3Nn?=
 =?utf-8?B?Q3dySWFjaGVNYTNHajlZeVNZMjJHU2RHTDNJdDZkT2dzRms3QThoODFncEtn?=
 =?utf-8?B?ZEI2aHpVYThqZUM2VDBvVmhBY0ZPaHFJM3VhUEZJYjhZNEJtOUlxcnAxRzNX?=
 =?utf-8?B?WVFGRXBvTDhEN0Y0SUlyVVlpSFBnQ01lZm1DUWhaWW54clNrV2hjV0d0NkVn?=
 =?utf-8?B?dGJBT2RYYWo4cUZLZWNZMXVhZjIyOG43VE1Eakl6UjcvR1hxOGt2UjhJeWxR?=
 =?utf-8?B?RHgrbXYyT1JxOEFNbUVOTGlqN1dPK2FraUtxWVRZcHZZMTQ1VWhqVXBVblBy?=
 =?utf-8?B?ODJlbjhRSVd1bjREQTJUZEJJYURoTDl6QXFld1h1elJ1N1ltdzJaL0VuVmxK?=
 =?utf-8?B?S1FIcTZyR1gzVXVKVGJYRzRlazlUd1pDdW1NQ1BRTXQ2R1I2V3FZdUVxbnFv?=
 =?utf-8?B?SUp5WXBsSXNCWEszY1BsVUhERklVMFVhZlFwU1RJYk01QVhya1pDL3RBTEtS?=
 =?utf-8?B?VTMvRktZSUw1QnhXODl5SkhVbnM1ZHVKWjNkaDNLVThsMGwyYVloL2J5amNY?=
 =?utf-8?B?NG1PTkQ2ajR0aG1EWU9ZZktaenMwQzlBdXVJYXF0dkJwUDNPNk1VVmFPM0JE?=
 =?utf-8?B?ZU5tbEZGU3NVc1hKMWR1M3d2ZytuUDkyN01ERDI4b2pzaE9oOVVxNGxQQk5G?=
 =?utf-8?B?QmQ5Wk9HL0l6WnVyWGgxb2tGZ0w0QndJK2tueGJrNmJDR3l3VXZCNFdpZVRN?=
 =?utf-8?B?NXVhR2FhVGpzMS9SbHBKU0lYOTlZQzlRZ0JFSTRNRTJrZi9JaHU4MDdHWlla?=
 =?utf-8?B?OUl4V2hOTUdVOERzOXhRcG5BcjhwZ21COVRMbnFGUHNNNzd4RzdCSTk0MEFP?=
 =?utf-8?B?cUtpZ21MM0dITTU0d1dYU1c3bjFBdCt4bk5wYU56OXY4djBHM1hKdlp1U2Fu?=
 =?utf-8?B?V3E4ckl4a0F3cEZPaVF2QmwwK2crai9jeDlleGNqL21PckFNOTlWbWtRRWZX?=
 =?utf-8?B?SnhEeFUwOFZCUDNPczg0c2F0VXp6dXlQblc1eGxNZVNXTkdSdHdINUNGZWFN?=
 =?utf-8?B?eGdmUTNNalA0M0Nrc0xMbW9BaWFoL3U2K3NHMGo2cGdBODdlWSs4VUxMb3hG?=
 =?utf-8?B?c1dRcm82ZGsybnMrUkllQUVRNFNQb04wTGdsU3F0Z2FMY3g1VlVMSkhvcFJX?=
 =?utf-8?B?Z3h4QlAxZlBkSWdBTHA2SjI1R29iQkxRMnVxb0lEKzZlbXQxYnRKdlh3d1hN?=
 =?utf-8?B?aGw5SGJGRjJEYVBrclo5aFRNd2o4TlU1UFJOOUM1OUhlRDJoUk1QL1pva2cz?=
 =?utf-8?B?encvZ09zWXVpU0oraGgxdXFtNU9wRnBaL3p5ai9yS1FnWGlCOUJ3OWtjNXh0?=
 =?utf-8?B?eW1zQW5KRC9pOHIrQ3RLNW9TS0pNaXg0cnYwbFNLNXZGc0VPRnVJR29PUjhn?=
 =?utf-8?B?UWNGYzRaOGJXd2lOdXZvQmZPMlo2YUdqcm05eHZsOE5NenF2VCtZNzVOYVZH?=
 =?utf-8?B?VFNodFB2ckEwc2FEM2oxVGpma0U5cFBBZmczYWtaRnZjN2lZZm14YmtWMS9G?=
 =?utf-8?B?b3BhZ092V0dtYytpeWZoWmQzTVl4SnprV1hpSEZhZW9ya0szRmhDTWhaVHpv?=
 =?utf-8?B?L1NqYUZIZDlXWGNLUkZkTE03aGlaYVcvYlI5RksxMVdXQ3lLT3FXM2JnT2g2?=
 =?utf-8?B?Ui90M01RUkdKRVBLRkVIbTNNTFJhMVBxZ0doaVQ3dlJpRFExRFNHd3VQanlT?=
 =?utf-8?B?VVdEUTFCZWpYYTh1ZEFTUXMvYU53PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef83f70-9950-41c5-072e-08d9fd0fd9b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 12:17:56.7501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZNzDz/TTTy7KGsfwfgEzDhktcG8YLpUPSWmwBRuLsOD00l+mVXSna1W2NE8sBLuEkuyOPTPcXmwr3L4Atl2TTfuBXbjS3L30jqnX80BcCKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5692
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gU2VyZ2VpLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDEvNF0gYXJtNjQ6IGR0czogcmVuZXNhczogcnpnMmxjLXNtYXJjLXBpbmZ1bmN0
aW9uOg0KPiBTb3J0IHRoZSBub2Rlcw0KPiANCj4gSGVsbG8hDQo+IA0KPiBPbiAzLzIvMjIgMToz
MiBQTSwgQmlqdSBEYXMgd3JvdGU6DQo+IA0KPiA+IFNvcnQgdGhlIHBpbmN0cmwgbm9kZXMgYWxw
aGFiYXRpY2FsbHkuDQo+IA0KPiAgICBBbHBoYWJldGljYWxseS4gOi0pDQoNCk9vcHMuIFR5cG8g
bWlzdGFrZS4NCg0KR2VlcnQsIFBsZWFzZSBsZXQgbWUga25vdyB3aGV0aGVyIEkgbmVlZCB0byBz
ZW5kIFYyPw0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gICAgQ291bGQgcHJvbGx5IGJlIGZpeGVkIHdo
aWxlIGFwcGx5aW5nLi4uDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJh
Ymhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gWy4uLl0NCj4gDQo+
IE1CUiwgU2VyZ2V5DQo=
