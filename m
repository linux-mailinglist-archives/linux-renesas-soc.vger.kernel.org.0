Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63AB25EDB10
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Sep 2022 13:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233791AbiI1LDf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Sep 2022 07:03:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233711AbiI1LCN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2022 07:02:13 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 943C95051A;
        Wed, 28 Sep 2022 04:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwWh0LrOEjISyWDtNFM6FMJgj9VRgozFr3QXbzOkliJE/a03TKYID6Y2FSZyDjnudtcDybLA5r/HiYJMZ0Pu9JzyMz6l0AevU7sPdjsaTrt5yYJGQ/Q0yQT1/owrGKKPYEG1bw8wDUxJDQl5YdtzWcDuCOM8IUY11O7dNCScakyzbDHqcD+CrQmoyMxSbv4xgESY7e1E+BCMVdHALk8q5iFOGVFzIrCJCPUrggydmX5VA1v1DRHb4JRMDjEt4x8ITM/cuNPVFBo7cSS1BIbbPZCCxmKFE7qE9oPtiT5ru3NIlliQ8aaPK+ZyYIMMMM5xECdhpUNwp5++o+ELSdzSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msE7vnDl8J8IGuinMaghZihuL2sfwqpjhVUnInBU6xM=;
 b=krbhHh//Ax0j384+PqW5OcSV3Y2yZfuIK8ZC9PSgmmQkTxgh+UtezMCp0hytqMRKUaCjsEVpz7lssxzGaS7Fg56e9fbKvKzPGktagN6ft+7upJwKGwrtrWtuZ4he9AMxEh8N1w42uqCE/rJO3oIaexgpOiQaXpH+6ENWZ1WG+fnPOor3UYwLMW4BlZpNmslNl2oqZCFXd4B1A9fdrvwqJhOiL1mkR17AfwxfdMRQ6oKbOnvUMCOnAxREKfqMzwasJtnCZDLJMi7KuMwmP345iCWcricDmS2k25Bc0eGDg3dyewcjhfyVyKjW8OUcZXfpACBguQ5CqYJnEJHLmJTYLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msE7vnDl8J8IGuinMaghZihuL2sfwqpjhVUnInBU6xM=;
 b=Rep/JvwRcA6YWYCz0H3I+wsXT1bxlYowkLQYk2SpM1urXq3gcbpSD7e0jZutGvMajclGkh8UNiZR/ivMa55AD/Wgy0WRXxDchx2ojXYgOvK9Cg6cD3uhQ7rZRrFOlp8PcfWXRTy8JH+g/Pb2O78/I7cBx1VoVxVgkRBl/605G8w=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8211.jpnprd01.prod.outlook.com (2603:1096:604:175::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Wed, 28 Sep
 2022 11:01:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262%7]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 11:01:23 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4] mmc: renesas_sdhi: Fix rounding errors
Thread-Topic: [PATCH v4] mmc: renesas_sdhi: Fix rounding errors
Thread-Index: AQHY0noUTw65KpPtl0+JXvsHlc8xea30rBYQgAABXVA=
Date:   Wed, 28 Sep 2022 11:01:22 +0000
Message-ID: <OS0PR01MB59226BAE3CA2CA8438A63A9A86549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220926171002.62352-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXa3d=0r73HV+1JjYeVN+FoyJs==zTo983wiNB12KJM2w@mail.gmail.com>
 <OS0PR01MB59225FB854430BD3A4A84AF186549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59225FB854430BD3A4A84AF186549@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8211:EE_
x-ms-office365-filtering-correlation-id: a3e74be9-8b07-443e-3ed7-08daa140c7e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vHQ7vqecNjzYZs9LKLyXCDmtjTe5fiSawLHFKyqAz6Qwg0iRwlixBXYNVY++KuWJzCw3diFcwfoeb5/IXeZYN/J3+uBz9ZQVuI3dqjrcuftBBswBSzUWq71IrW0j8jLgWoIrOcvjQAcRAYxed4y8OhFHi2aQIwr+dsaUyeO4f0FTonU8OwYlMoKoQ8cZJjBkurUhY9JF6kEjUWHxreLWSZROuM90uhh7dF+f0njEcuaVCiv8yyVC7l12csMliUBoigwkNCPFpcfqmE29EY6dUYcwlrCpNl4ox8JaFC9r5Iyllr0kZtsPi1H2+2Spc8vNvmba+dW+x0kbi9u1FujsA9RGWAenbX3jal/VKDJIc+fdRiRVef7fPnTVi1ebTkaB4hk2JKT+88j5LWHX4dPdpjF3bB6qCwZXJ33sZXAZygzuLwNDtUiT0MiHM/1HwlkhIW5tdz3xocUFZ74sS10EVlpGsHWN7AXZWO4TQA4w9EZ3RDG2sqUQ0ZmSN9pC6J3gJ7lTG6MYf+mXqLnZm0cR2YJKaQIXc3ly6LrFf0mgAuROEorbbai+xQgP2gJnTCwKdHBMfhF2K4fzTRLE7O3fEq0CAq4j8e0It6tOa2G5BL+8Fr18eoOQbju8j4qtUf9CFc7+PUSIKMThDI6zEw4tZLSFTY9mvovBUGs+bN5EoZATip+1JGo3BxkdpONfFgOQTeKxMRKh40GJQiayuh4nN2za2wlBYQj7fXXMdPNvk9aC490QhxkWa6HHaEBtaHof
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199015)(64756008)(316002)(54906003)(110136005)(66946007)(66446008)(478600001)(8676002)(76116006)(66556008)(66476007)(86362001)(4326008)(55016003)(38100700002)(5660300002)(71200400001)(7696005)(26005)(52536014)(8936002)(6506007)(9686003)(41300700001)(122000001)(53546011)(2940100002)(107886003)(186003)(2906002)(33656002)(83380400001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vy9aUGFPVW5VU3BzYmZHY0lLU3Bndit4T0p0SVJCem1jaWdrZVIzR1Y4SnJN?=
 =?utf-8?B?dU95SXJwTDhhcUxRTy9nbHU0QmJQam95UllkMUNuWDE1WnRUc3c2dWRSV0RM?=
 =?utf-8?B?U0Y2RXd0QXluTlNocjJYTzFCS0ZOTXgrdGhzV1R4YnhBRElVWG1NSnR4Mmlk?=
 =?utf-8?B?RlU0NTUwb1FINDh2QjVGVEpDMUJyRDBNVjBVRzI3WXZwUmZYZ3RJcittenNp?=
 =?utf-8?B?UmhiZ3FSSzU1THFZQzl3ak1QcXlWZzBib2cvdXQwVjlrVWdCK0YvckhoaktI?=
 =?utf-8?B?TTRUcWZ0c1BqRmhzT2huVnBqUDl1ZTVKd0trVDE4dnh6aHVrT0N1R2RSZW1z?=
 =?utf-8?B?bGVxMkY2dHhzNm14Y25OTGZTRHZEZ0dHaUszWTVQSmFoLzhXL01NNTRYNDFS?=
 =?utf-8?B?dzZycDFaaGl5d2gweXNyQWtVMldyM0NDUnNZNnZRbDAvbUNwcEpBLy91MEpH?=
 =?utf-8?B?bGJuRUl3NUxhbnFPT2J2WHdTRERvTk1aY3BuS0haMDEwSFhiWVBCYk1kT1J3?=
 =?utf-8?B?eEdqUCtGL1R0ZlRYSUczRzBOVDVWME1GMnUxc3R2K1ZIcHhMVElXSnRPNzhE?=
 =?utf-8?B?bE5NVVFib09ENVQzLzhtMmlJVU10N3BVWWR1aFlMUlgydFliLzV6cXc0dW5i?=
 =?utf-8?B?bXNlMVkvU01uUXpjTlBNdVRZUmJHN2lqbUdIZkVlUE9zd0RWYVlHNUgzUTFI?=
 =?utf-8?B?V01vK213NzFzdklTUExEcGFKNEtUcTdGQTRjNnpBdFU1YUJZMzN5NkVIYVU3?=
 =?utf-8?B?cjU0TzdMSXBvMElFRDZESkdUc292NXJlYURwbnlhQmFuRGtCMEwzMlBsckxV?=
 =?utf-8?B?RUYyMkhHY0pFSm9iaFE5NFF3YkZnbEdoU0UvTjBBdXlLUXN1eUJIT1J5ZDJR?=
 =?utf-8?B?S0xuMGswSVBXNVpNdkQxQ1FLQU82dDR6V0FuZlAzZG5oM20ranFxYkVsTUky?=
 =?utf-8?B?UDMyWWh6a3p6OXlBTitiSUxCK3BzTzhtM1lPbDQ5UWJlRWxOWGRjNSs4bVZS?=
 =?utf-8?B?cGNPSEthZUVPVzhXWnJHWXZ5WlEySkkrMkk0UTl2bXhRN01pbXV2c2drS3Jq?=
 =?utf-8?B?dWtZYUJieHpwMVBWK3NneTN6RlMxOWhJc0YyRTRSNmtxWGpSY0h1SDlHVmpx?=
 =?utf-8?B?TW8yYkFOeHpCOXhTRmtIWEp2V3lQS2pHZ2tuaTRlMXZUbkNsZnZqRVZWV2wy?=
 =?utf-8?B?YWpsV0FDRVcyaXp4OW5SMHF5R2xYQ3VtZDVUTGhXZTdIYklMWjAyNkxJT21v?=
 =?utf-8?B?TnhPWTdnbnZBUzJEUzc4QUNkbVpDL2V1SHlrT1hDTkxWcXlzMlpkU3IrRVU3?=
 =?utf-8?B?NWU3WE1od0xvMHdQck4xQWtBZVBLZ2xuTmY5THQ5WEFYL1F2S3NLbU5FRkg0?=
 =?utf-8?B?Z1pVSjBXTDdFYnZmbG9JQU9wZjY2WmRMS3JyUG9FZmZyUEJ3V3hmcEV0U0Vh?=
 =?utf-8?B?K0szdXBxZnVrcmlrajlKd0dKeXZIUkZaU2tCQll2RFRXcHZ5bVM3dzh1UkJN?=
 =?utf-8?B?M0FraGE4bGl6dERYWGZrYkVuSjkvQ3dsTmtxQkE3RzZsOVJxRVZ3RHJTUFNO?=
 =?utf-8?B?cmYyUEc3cXF0c3MzcUlrNXJzYkxvYlE4T0dRSHV2c3hHeHJGNkIwazJic3VB?=
 =?utf-8?B?aGIrdmZWV2FZTDRxYkd3MlcyNjVYZ0dZOTZLZU0vSWZDbG1YaTZJa0cvTnRO?=
 =?utf-8?B?anVNeHowaUxXYmFqU1V5MWFycTRnaFJNU25yVWFkaFhyQUxXQ2NtVWlCZ005?=
 =?utf-8?B?ZjVIVmN4TkFhOVVudFpNR3NNRS9wSktTWnlwWkdxUDVPTjdCN2pCWGZrOGFB?=
 =?utf-8?B?a1NVLzJ5aWdaS2UyNUt6UkZET3pLcmg3UHhLbVRyb0JtNlFPUFFnQlpiM1Ur?=
 =?utf-8?B?TVVFZGZBUGxIbThBaTQwTG1reDBmQmg0VThyTzdGQVhwWklyaHBlRTY5RDZ5?=
 =?utf-8?B?cVM3SUUxV0pwNXhRcS9BMHV6aGxTenN2OUp1VVlMdktMdzZEazJIZ2ZkeGhI?=
 =?utf-8?B?cjRtb0k0QmZENnZMczVsQzN0U0F5bHNsZjN1REE2c1VWQmJkTFdDMVZneTI1?=
 =?utf-8?B?WlYzckxrajh1cXZnUk5VbVRXV2pVOURVUktMUGNYN3ZCV1FWUVhuQWh3dCtu?=
 =?utf-8?Q?PMSJ/6iaQNk3FmjpSb5UtpF1P?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e74be9-8b07-443e-3ed7-08daa140c7e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 11:01:22.9964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FByvB0D3OFfkXVPkdxiyPbWzZAtwJzh4dVKIrBg2ucp/vcy85Wp6Sc7GncuPJK715YQnuvWqP6u3cOEYiRb+rezJaC/ypgvc7j7Vkj/cxqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8211
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2NF0gbW1jOiByZW5lc2FzX3NkaGk6
IEZpeCByb3VuZGluZyBlcnJvcnMNCj4gDQo+IEhpIEdlZXJ0LA0KPiANCj4gVGhhbmtzIGZvciB0
aGUgdGVzdGluZy4NCj4gDQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NF0gbW1jOiByZW5lc2Fz
X3NkaGk6IEZpeCByb3VuZGluZyBlcnJvcnMNCj4gPg0KPiA+IEhpIEJpanUsDQo+ID4NCj4gPiBP
biBNb24sIFNlcCAyNiwgMjAyMiBhdCA3OjEwIFBNIEJpanUgRGFzDQo+IDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gPiB3cm90ZToNCj4gPiA+IER1ZSB0byBjbGsgcm91bmRpbmcgZXJy
b3JzIG9uIFJaL0cyTCBwbGF0Zm9ybXMsIGl0IHNlbGVjdHMgYSBjbG9jaw0KPiA+ID4gc291cmNl
IHdpdGggYSBsb3dlciBjbG9jayByYXRlIGNvbXBhcmVkIHRvIGEgaGlnaGVyIG9uZS4NCj4gPiA+
IEZvciBlZzogVGhlIHJvdW5kaW5nIGVycm9yICg1MzMzMzMzMzMgSHogLyA0ICogNCA9IDUzMzMz
MzMzMiBIeiA8DQo+ID4gPiA1MzMzMzMzDQo+ID4gPiAzMyBIeikgc2VsZWN0cyBhIGNsayBzb3Vy
Y2Ugb2YgNDAwIE1IeiBpbnN0ZWFkIG9mIDUzMy4zMzMzMzMgTUh6Lg0KPiA+ID4NCj4gPiA+IFRo
aXMgcGF0Y2ggZml4ZXMgdGhpcyBpc3N1ZSBieSBhZGRpbmcgYSBtYXJnaW4gb2YgKDEvMTAyNCkg
aGlnaGVyDQo+IHRvDQo+ID4gPiB0aGUgY2xvY2sgcmF0ZS4NCj4gPiA+DQo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiBUZXN0
ZWQtYnk6IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+DQo+
ID4gPiAtLS0NCj4gPiA+IHYzLT52NDoNCj4gPiA+ICAqIEFkZGVkIFRlc3RlZC1ieSB0YWcgZnJv
bSBXb2xmcmFtLg0KPiA+ID4gICogVXBkYXRlZCBjb21taXQgZGVzY3JpcHRpb24gYW5kIGNvZGUg
Y29tbWVudCB3aXRoIHJlYWwgZXhhbXBsZS4NCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIHVwZGF0
ZSENCj4gPg0KPiA+IFVuZm9ydHVuYXRlbHkgdGhpcyBwYXRjaCBjYXVzZXMgYSBjaGFuZ2UgaW4g
dGhlIGNsb2NrIGZyZXF1ZW5jaWVzDQo+IHVzZWQNCj4gPiBvbiBSLUNhciBNMi1XOg0KPiA+DQo+
ID4gICAgIC1jbGtfc3VtbWFyeTogICAgICAgICAgc2QwICAgICAgICAgICAgICAgICA5NzUwMDAw
MA0KPiA+ICAgICArY2xrX3N1bW1hcnk6ICAgICAgICAgIHNkMCAgICAgICAgICAgICAgICAgMzI1
MDAwMDANCj4gPiAgICAgLWNsa19zdW1tYXJ5OiAgICAgICAgICAgICBzZGhpMCAgICAgICAgICAg
IDk3NTAwMDAwDQo+ID4gICAgICtjbGtfc3VtbWFyeTogICAgICAgICAgICAgc2RoaTAgICAgICAg
ICAgICAzMjUwMDAwMA0KPiA+DQo+ID4gICAgIC1jbGtfc3VtbWFyeTogICAgICAgICAgICAgc2Qz
ICAgICAgICAgICAgICAxMjc4Njg4NQ0KPiA+ICAgICArY2xrX3N1bW1hcnk6ICAgICAgICAgICAg
IHNkMyAgICAgICAgICAgICAgMTIxODc1MDANCj4gPiAgICAgLWNsa19zdW1tYXJ5OiAgICAgICAg
ICAgICAgICBzZGhpMyAgICAgICAgIDEyNzg2ODg1DQo+ID4gICAgICtjbGtfc3VtbWFyeTogICAg
ICAgICAgICAgICAgc2RoaTMgICAgICAgICAxMjE4NzUwMA0KPiA+DQo+ID4gICAgIC1jbGtfc3Vt
bWFyeTogICAgICAgICAgICAgc2QyICAgICAgICAgICAgICAxMjc4Njg4NQ0KPiA+ICAgICArY2xr
X3N1bW1hcnk6ICAgICAgICAgICAgIHNkMiAgICAgICAgICAgICAgMTIxODc1MDANCj4gPiAgICAg
LWNsa19zdW1tYXJ5OiAgICAgICAgICAgICAgICBzZGhpMiAgICAgICAgIDEyNzg2ODg1DQo+ID4g
ICAgICtjbGtfc3VtbWFyeTogICAgICAgICAgICAgICAgc2RoaTIgICAgICAgICAxMjE4NzUwMA0K
PiANCj4gVGhhdCBpcyBub3QgZ29vZC4NCg0KT3RoZXIgdGhhbiB0aGlzLCBpdCBpcyBiZXR0ZXIg
dG8gdGVzdCBwZXJmb3JtYW5jZSBhcyB3ZWxsIHRvDQpjaGVjayBhbnkgcmVncmVzc2lvbiBkdWUg
dG8gc2Vjb25kIGZpeCBpbiB0aGlzIHBhdGNoLg0KDQpOb3RlOg0KQWZ0ZXIgbW91bnRpbmcsIEkg
dXNlIGJlbG93IGNvbW1hbmQgdG8gY2hlY2sgcGVyZm9ybWFuY2UuDQpkZCBpZj0vZGV2L3plcm8g
b2Y9dGVzdCBvZmxhZz1kaXJlY3QgYnM9OE0gY291bnQ9NjQNCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+
IA0KPiA+DQo+ID4gPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9jb3JlLmMN
Cj4gPiA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYw0KPiA+DQo+
ID4gPiBAQCAtMTUzLDEwICsxNTQsMTcgQEAgc3RhdGljIHVuc2lnbmVkIGludA0KPiA+IHJlbmVz
YXNfc2RoaV9jbGtfdXBkYXRlKHN0cnVjdCB0bWlvX21tY19ob3N0ICpob3N0LA0KPiA+ID4gICAg
ICAgICAgKiBncmVhdGVyIHRoYW4sIG5ld19jbG9jay4gIEFzIHdlIGNhbiBkaXZpZGUgYnkgMSA8
PCBpDQo+IGZvcg0KPiA+ID4gICAgICAgICAgKiBhbnkgaSBpbiBbMCwgOV0gd2Ugd2FudCB0aGUg
aW5wdXQgY2xvY2sgdG8gYmUgYXMgY2xvc2UNCj4gYXMNCj4gPiA+ICAgICAgICAgICogcG9zc2li
bGUsIGJ1dCBubyBncmVhdGVyIHRoYW4sIG5ld19jbG9jayA8PCBpLg0KPiA+ID4gKyAgICAgICAg
Kg0KPiA+ID4gKyAgICAgICAgKiBBZGQgYW4gdXBwZXIgbGltaXQgb2YgMS8xMDI0IHJhdGUgaGln
aGVyIHRvIHRoZSBjbG9jaw0KPiA+IHJhdGUgdG8gZml4DQo+ID4gPiArICAgICAgICAqIGNsayBy
YXRlIGp1bXBpbmcgdG8gbG93ZXIgcmF0ZSBkdWUgdG8gcm91bmRpbmcgZXJyb3INCj4gKGVnOg0K
PiA+IFJaL0cyTCBoYXMNCj4gPiA+ICsgICAgICAgICogMyBjbGsgc291cmNlcyA1MzMuMzMzMzMz
IE1IeiwgNDAwIE1IeiBhbmQgMjY2LjY2NjY2Ng0KPiBNSHouDQo+ID4gVGhlIHJlcXVlc3QNCj4g
PiA+ICsgICAgICAgICogZm9yIDUzMy4zMzMzMzMgTUh6IHdpbGwgc2VsZWN0cyBhIHNsb3dlciA0
MDAgTUh6IGR1ZSB0bw0KPiA+IHJvdW5kaW5nDQo+ID4gPiArICAgICAgICAqIGVycm9yICg1MzMz
MzMzMzMgSHogLyA0ICogNCA9IDUzMzMzMzMzMiBIeiA8IDUzMzMzMzMzMw0KPiA+IEh6KSkuDQo+
ID4gPiAgICAgICAgICAqLw0KPiA+ID4gKyAgICAgICBuZXdfdXBwZXJfbGltaXQgPSAobmV3X2Ns
b2NrIDw8IGkpICsgKChuZXdfY2xvY2sgPDwgaSkgPj4NCj4gPiAxMCk7DQo+ID4NCj4gPiBNZWEg
Y3VscGE6IHdoaWxlIG5ld19jbG9jayBpcyBhIGNvbnN0YW50IGluc2lkZSB0aGUgbG9vcCwgaSBp
cyBub3QhDQo+ID4gU28gaXQgc2hvdWxkIGJlIG1vdmVkIGJhY2sgaW5zaWRlIHRoZSBsb29wIGJl
bG93Lg0KPiA+IFdpdGggdGhhdCBjaGFuZ2UsIFItQ2FyIE0yLVcgaXMgaGFwcHkgYWdhaW4sIGFu
ZCBJIG5vdGljZWQgbm8NCj4gPiByZWdyZXNzaW9uIG9uIFItQ2FyIEgzIEVTMi4wLg0KPiANCj4g
T0suDQo+IA0KPiA+DQo+ID4gPiAgICAgICAgIGZvciAoaSA9IG1pbig5LCBpbG9nMihVSU5UX01B
WCAvIG5ld19jbG9jaykpOyBpID49IDA7IGktLSkNCj4gew0KPiA+ID4gICAgICAgICAgICAgICAg
IGZyZXEgPSBjbGtfcm91bmRfcmF0ZShyZWZfY2xrLCBuZXdfY2xvY2sgPDwgaSk7DQo+ID4gPiAt
ICAgICAgICAgICAgICAgaWYgKGZyZXEgPiAobmV3X2Nsb2NrIDw8IGkpKSB7DQo+ID4gPiArICAg
ICAgICAgICAgICAgaWYgKGZyZXEgPiBuZXdfdXBwZXJfbGltaXQpIHsNCj4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgIC8qIFRvbyBmYXN0OyBsb29rIGZvciBhIHNsaWdodGx5IHNsb3dlcg0K
PiA+IG9wdGlvbiAqLw0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZnJlcSA9IGNsa19y
b3VuZF9yYXRlKHJlZl9jbGssIChuZXdfY2xvY2sNCj4gPDwNCj4gPiBpKSAvIDQgKiAzKTsNCj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChmcmVxID4gKG5ld19jbG9jayA8PCBpKSkN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5e
XiBQcm9iYWJseSB0aGlzDQo+ID4gc2hvdWxkIGJlY29tZSBuZXdfdXBwZXJfbGltaXQgdG9vLCBm
b3IgY29uc2lzdGVuY3k/DQo+ID4gSXQgZG9lc24ndCBzZWVtIHRvIG1hdHRlciBpbiBteSB0ZXN0
aW5nLCB0aG91Z2guDQo+IA0KPiBPSy4gV2lsbCBkbyB0aGUgYmVsb3cgY2hhbmdlIGluIG5leHQg
dmVyc2lvbi4NCj4gDQo+IC0JbmV3X3VwcGVyX2xpbWl0ID0gKG5ld19jbG9jayA8PCBpKSArICgo
bmV3X2Nsb2NrIDw8IGkpID4+IDEwKTsNCj4gIAlmb3IgKGkgPSBtaW4oOSwgaWxvZzIoVUlOVF9N
QVggLyBuZXdfY2xvY2spKTsgaSA+PSAwOyBpLS0pIHsNCj4gIAkJZnJlcSA9IGNsa19yb3VuZF9y
YXRlKHJlZl9jbGssIG5ld19jbG9jayA8PCBpKTsNCj4gKwkJbmV3X3VwcGVyX2xpbWl0ID0gKG5l
d19jbG9jayA8PCBpKSArICgobmV3X2Nsb2NrIDw8IGkpID4+DQo+IDEwKTsNCj4gIAkJaWYgKGZy
ZXEgPiBuZXdfdXBwZXJfbGltaXQpIHsNCj4gIAkJCS8qIFRvbyBmYXN0OyBsb29rIGZvciBhIHNs
aWdodGx5IHNsb3dlciBvcHRpb24gKi8NCj4gIAkJCWZyZXEgPSBjbGtfcm91bmRfcmF0ZShyZWZf
Y2xrLCAobmV3X2Nsb2NrIDw8IGkpIC8gNCAqDQo+IDMpOw0KPiAtCQkJaWYgKGZyZXEgPiAobmV3
X2Nsb2NrIDw8IGkpKQ0KPiArCQkJaWYgKGZyZXEgPiBuZXdfdXBwZXJfbGltaXQpDQo+ICAJCQkJ
Y29udGludWU7DQo+ICAJCX0NCj4gDQo+IENoZWVycywNCj4gQmlqdQ0KDQo=
