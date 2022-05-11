Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 770A4522BEC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 May 2022 07:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiEKFw7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 May 2022 01:52:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiEKFw6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 May 2022 01:52:58 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2128.outbound.protection.outlook.com [40.107.114.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B07CA0D31;
        Tue, 10 May 2022 22:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcZjyoNkFIFnqWB/VULgIqMeqarQ77jlt2R6xprH4S/dsU2+wVqRE6stWLcG3n7BCWPRHNR6woSrd+VJNJSR+Pj0y7s2eNghAm+ehYZGEq3VVMIXaHqBjT+YsUusf7lVc/ekBCQLAjwGYTUItmgRp2QFxFtXd0qH8BEPUKH4Fy80Oaf1tAa/bxWGC6DPLaFm5WphT3Vz72r92IlSeYWsvnt9SQ9TycAIwHN9ryz1+k7zTnU+8N2cz22DOM3IV7z6pE0dvmByni5SaL79FNYDi3zcvuWIdt0e6jUn5nS+N/OsF4kv9+wNGwdkbLZUm6CYoaI8G9/dNmH6AjNGRQbmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0olBGzOOdkuKekTK6EUdxaq9IG/H+E24oJC+yevA9M=;
 b=gCaNCgFgTvrSWjzs6NKpkqieoNo8f6WgpWCio9DKcju02TJt+m91EitbpQuFK3Rk2tqyXw0PzNV1Ait0J4kTQCNJ8UspIBc7W2cjvnP2PoQEk+lGDbe0Cf8nTBH763pVR7770cRG9YdD46HmuzTk25t1F8+fmbs3cRp9esCeSv2hFVlfkUnzAxHSdpp3BP3nrsQ7rqrMtZY1hsAq7UuLStoZIg3GQ0pxjd5wcDoEYZJyN3QveJEp//tJs9dPMHI12brhfytL5x3gdQ+PFVcNazyuos3nTSXXYkETT/INBUOcJMtEacthkysusErGWd5o6HHvu5VlC1lBFPHvOisQ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0olBGzOOdkuKekTK6EUdxaq9IG/H+E24oJC+yevA9M=;
 b=qDiIgY92R8WkoJsyXtbvDiAo3TT9cvC8aQ3VLghDNJuX1ydGop1ZviDcqEbskikVkUjSewFUtsBgf3nL+h1pC551tXWXlPiZ5O482w/yO7NndM6IhF2aOtGZ6lIbmssR5D89TCwirvchPej1BV/oNrdIlMhiq8EZCSniC4WnHpk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB6636.jpnprd01.prod.outlook.com (2603:1096:400:c9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 05:52:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%9]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 05:52:53 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r9a07g043: Add ADC node
Thread-Topic: [PATCH] arm64: dts: renesas: r9a07g043: Add ADC node
Thread-Index: AQHYYLAXexu1Iz9l/0mXLMs9PUTblK0Xy8wAgAAA//CAAA0fAIAAAPdggACdYQCAALyH4A==
Date:   Wed, 11 May 2022 05:52:52 +0000
Message-ID: <OS0PR01MB5922BCD7EF5E6F788AB484DB86C89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220505184353.512133-1-biju.das.jz@bp.renesas.com>
 <b89be37d-ec17-8b6f-561b-63781352e774@gmail.com>
 <OS0PR01MB592248147BA1A775236B080186C99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <530ed78e-bce5-09bd-f0ef-f20de956cfcf@omp.ru>
 <OS0PR01MB5922B28212F59C522FE432B786C99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <2d987f83-d59b-b598-1a3d-94bc570b8d89@omp.ru>
In-Reply-To: <2d987f83-d59b-b598-1a3d-94bc570b8d89@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb7ad497-337f-407d-097d-08da33127d52
x-ms-traffictypediagnostic: TYYPR01MB6636:EE_
x-microsoft-antispam-prvs: <TYYPR01MB6636B76DCF6D0145F9AED21A86C89@TYYPR01MB6636.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JiWYImOiHkkAal4KACgnk03CPZ1IkDuFvBQVx8HCQy4DTicJHW4gstSCTlIINe0wyrOF9a+uNgdRoZSEfZ1xgPse4LMt6qc7jSU/8jB6sB+0fl2++V6ueSmx1sygYuQZn230AZ2F3Lt9BW5E5FzBfaB1VA0id97uiJkM6HQgpPaspghfFsX5hmusuZqjoNjh0KHBrm7g/66WK+vvMFx646KWoWOvZpV1/CVjMnon6f4IfF51LhMTE4VhKH6wTe6UProNLh472x6QRIbuphPprwtpc1M4WCVG19tDnItkksA8juS3Rvb5zgpz5fqnkH9ocPe3iTww84jw6QL78/zMgZJLUSQ/3QpSPMutXWrBhl8ObhkV64WHhkN9s7BBpK9XMLH43ol4rBhGd93HRkkoullT65PW9UfQz1bYOZz2kjxiUAlOCyv642kZaugw1w74wecTy1LBBof8zJAGe4xiha+Vn7cgW0iiZC4tgvEhVxXSmXgaPgvWjZa89YMgfCbifBLMkLYB/4LdwzJmL2nxkQ5FgyYnEDPDCa7pTB8+CEqDa12ITrp1J7TJ3ebvnl5t3EPsiwTu6eQhno5N3rytEx5+jaWOQRkOq8Gy/H+PH9h6l/G3wL6wW8f+S34Cxv/U8leC7HTNp7L8oK0w3cNlSqslodNWKI89XlmY8c8tQLzlIdqVRcjevJl3WcuylW6dUGAE/kWeAgUqC9s8W3WKzw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(122000001)(55016003)(52536014)(38070700005)(38100700002)(5660300002)(8936002)(508600001)(4326008)(186003)(83380400001)(107886003)(33656002)(66476007)(66556008)(8676002)(64756008)(66946007)(66446008)(76116006)(54906003)(316002)(53546011)(6506007)(7696005)(110136005)(26005)(9686003)(86362001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXhuSk5ST0pzTWxWdCtxS3B2Qk5EUHNVRzA1cjRWTmFhRlU4emc0bmt2SlBn?=
 =?utf-8?B?bmE2aHU5N2pyNGwwcXk3VHQ1dWpZMXgyY0RhUHdMR1dzRnI2dDl2OWFNTDgx?=
 =?utf-8?B?b0x1VEZFcWt0eVNscFJsQ2ZBcDNacUFhc1VYWVRvVVFhVGVFekYycnA3cjB3?=
 =?utf-8?B?bUxONWl3c21GaXArUm5DY1d4MjZ3Sm5CYm02QU5oL3FEUVUzL3k4bUVEeDRI?=
 =?utf-8?B?M0tPWE9BS3lOa21sWlQvUEkzMEl5eFdNZlFqVCt5a3orKzB0OFZLM1p6b0Ur?=
 =?utf-8?B?U1pxcEswL0UzdDZJZml2RnRabElCT0x3emh1WTFjRTl5aWl3QnpCWFJUdlFm?=
 =?utf-8?B?UnRtUndCV3o1b044bHhKMHpMV3NxcDFhU3NaODcrUlZJbFJoWHJzS0lMOGFt?=
 =?utf-8?B?R296NWI4ZEExallYVkppM0lHSG44b2VhY2UvaG1tMFBvM2x0OGtzL3Q5SUky?=
 =?utf-8?B?TzVDZzlKbzFWMnI3SDN4WE95ZGF1eHE0YTZjYTQ4a2tydGMxSG5KNlc0Q3Fm?=
 =?utf-8?B?SXFsekdHUkt1enljOGs0RUdLUDU2N0VpQU1qZU9yY0kvTkJ1dDgrUE9CeWRH?=
 =?utf-8?B?aFcrYVlLYWNmZzZ6UkN3a0Q3OTRMamhmdE1Fa2FVTmVzYmhvVDVKYm1aMVdH?=
 =?utf-8?B?bGlOR0VEc29oYUVCdUFZVm9rcFFvZnhoNG9obUNFeHZqZlJBMStieUc5endS?=
 =?utf-8?B?ekhyQ2VCQmw5UHRIcVEvTFgrUkp1V0JjWUpHYytUSExCbDgvRXdWSXRONmpu?=
 =?utf-8?B?eGRUUGZka2FVQWFRdXpURFBBd1VlNmdaQkxpU2VxTHlkb3ZBbVRIWXBBMVIv?=
 =?utf-8?B?WjlybjdGZmVLVFQwdC9PVEFocHhzVDd6VWlvRlROLy9jM0kxTDFmTEZTcVlz?=
 =?utf-8?B?bGx6U013ckNkalJGdjlYQ1VSR1U0UG1PakJOL0ZRSE9ISncyRjE4by9qYWxa?=
 =?utf-8?B?UzFOTnFHY01MbWgxaHpIeU11QmpUTGJOR1ZYTWJ2TWNWV0x3UWErM1ZOWnIy?=
 =?utf-8?B?Mzc3MFp2T3dmYlgrUjNQYXpxQzRrUGE2enYyd3BMM1Y1OHU3YmNZZTBNWDds?=
 =?utf-8?B?THNSUXJHbkI0YkNpL1liNWd5ZWFCcS9pdHlLZW5zVEdiQWdrd0EyME56NlJw?=
 =?utf-8?B?aC9CZXc5d2ZJM21pSjl6dk41V2xKY29xNkVXZDRCaDhwQ09JeUc5R1A1Z1Rw?=
 =?utf-8?B?SmxQVFN2eml2NEs2dmhuZ2ZFRmhacWdabFhEL2N6TmFOOUpLTXlGQVhXdERo?=
 =?utf-8?B?RTJ0Z3kwWGNZN0FiVTZMNzhDd2toWlRhcWxtT3dQS29EdHMwUzJRMFVBWnJN?=
 =?utf-8?B?N3dNYmFMVFp3bzZGQWtmL3FpT3E5WEU2MGYwM0p5YVRKOU9WcHQrTDhWUE5m?=
 =?utf-8?B?REVIYWtLWXdQaEtCTzNpWFpJWFV1bi9idTYvQWJZWlFhS1l6cXJBTS9kOE1s?=
 =?utf-8?B?VkhYbU1Fek12R2cwRzhDU2pSL2J6dTY4d2REKzh3SWE2MkFqMFNVelNVd2Rn?=
 =?utf-8?B?MVoxbG03ZGpxekZ2c08vS1pZWTdDQUJHRndhTDFNd1k1TGliQ1hZS0pSYnJN?=
 =?utf-8?B?YnNqYm5VQ090Q3FhMEVGME1iRGwxWWwyb2x6b0Z4Snc4cTJ3N2xyQ21FOFZM?=
 =?utf-8?B?ZTBXa2YxL1BoQVl6U2tZVTRTdE10VHdnNEZLVnYzaW5vTTRiQmZpOHQ4VEFa?=
 =?utf-8?B?TktHUDU1OXFmVW5YUU9RR0lENUQ5dVBMaG5VRWwvR2lWSmwrUERid2ZJMGNk?=
 =?utf-8?B?SExWYXNSYWlIVmRjQ0tOT2N0cXhKTjJWVkp4SjRMb0t3aTBDQ2IzMjNqTzFv?=
 =?utf-8?B?UVVqV2NuRGViaWdBaUgvZDJrZjlrOENqYWhQMnUwU050ZkVxWC9tT1lmczFt?=
 =?utf-8?B?L1FNb1ZKcWFqQ3Z4UmRKWUx1M2doZTc2OHE4cHJaM1NSRHhKVHNmdlY0TFl5?=
 =?utf-8?B?YXFiRHVBdlBMdG1ZUVlkcUxWd0czdnExN3JEVzg4MytreDlmcFE1azQyek9w?=
 =?utf-8?B?dnhveTFZMGtyUTRJeW8zckZaQWNsbTBrcGd0d1IydmJYSXIyNnN0aXpQTU1N?=
 =?utf-8?B?ZW4yRVZtTmxUU1RHSWE2L01KMDFWWWZjRkI2TnpiN3ZERkdNcHVQUzViYllW?=
 =?utf-8?B?bHJ4UWlyc016b01WV04rbHJNMmpnRzZCQXdwM1o2T1NzTVhueHhkS2JBWjVQ?=
 =?utf-8?B?WllBbkkwVDRQM04zNnpQN2FDRWZuL3I2WTZiZDlsTWpJOHYvMXJKRGt6dTJl?=
 =?utf-8?B?MXNyYVY4eXQ5N1Q2V2FqOG1aQXpZSDNuTFAwQy9EdGtaZGIwM0FONmNxbGZ2?=
 =?utf-8?B?a2V6YUlNRStJRHgrQ0lKNVQ5N29YbjFiaEwxRytBbzBJVUpackZoOVhqL1Zt?=
 =?utf-8?Q?8lDlU37P/CzbbSBw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7ad497-337f-407d-097d-08da33127d52
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 05:52:53.0834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qQNqc6J2G3PCHuKTxwY+Cc06g4PMDmB73451Z14iMeft9z1r+rC/239PCgihG/y/r92qXX+AWYGDP0G9NeF+ZPg4u7kgkS7LdwYSfREa5JY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6636
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2VyZ2VpLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFybTY0OiBkdHM6IHJlbmVzYXM6
IHI5YTA3ZzA0MzogQWRkIEFEQyBub2RlDQo+IA0KPiBPbiA1LzEwLzIyIDEyOjE1IFBNLCBCaWp1
IERhcyB3cm90ZToNCj4gWy4uLl0NCj4gDQo+ID4+Pj4+IEFkZCBBREMgbm9kZSB0byBSOUEwN0cw
NDMgKFJaL0cyVUwpIFNvQyBEVFNJLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4+Pj4+IC0tLQ0KPiA+Pj4+
PiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0My5kdHNpIHwgMjENCj4gPj4+
Pj4gKysrKysrKysrKysrKysrKysrKystDQo+ID4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pj4+Pg0KPiA+Pj4+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0My5kdHNpDQo+ID4+Pj4gYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzLmR0c2kNCj4gPj4+Pj4gaW5kZXggYjMx
ZmI3MTNhZTRkLi40MDIwMWExNmQ2NTMgMTAwNjQ0DQo+ID4+Pj4+IC0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDMuZHRzaQ0KPiA+Pj4+PiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzLmR0c2kNCj4gPj4+Pj4gQEAgLTQ4Myw4ICs0ODMs
MjcgQEAgaTJjMzogaTJjQDEwMDU4YzAwIHsNCj4gPj4+Pj4gIAkJfTsNCj4gPj4+Pj4NCj4gPj4+
Pj4gIAkJYWRjOiBhZGNAMTAwNTkwMDAgew0KPiA+Pj4+PiArCQkJY29tcGF0aWJsZSA9ICJyZW5l
c2FzLHI5YTA3ZzA0My1hZGMiLA0KPiAicmVuZXNhcyxyemcybC0NCj4gPj4+PiBhZGMiOw0KPiA+
Pj4+PiAgCQkJcmVnID0gPDAgMHgxMDA1OTAwMCAwIDB4NDAwPjsNCj4gPj4+Pj4gLQkJCS8qIHBs
YWNlIGhvbGRlciAqLw0KPiA+Pj4+PiArCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM0NyBJUlFf
VFlQRV9FREdFX1JJU0lORz47DQo+ID4+Pj4+ICsJCQljbG9ja3MgPSA8JmNwZyBDUEdfTU9EIFI5
QTA3RzA0M19BRENfQURDTEs+LA0KPiA+Pj4+PiArCQkJCSA8JmNwZyBDUEdfTU9EIFI5QTA3RzA0
M19BRENfUENMSz47DQo+ID4+Pj4+ICsJCQljbG9jay1uYW1lcyA9ICJhZGNsayIsICJwY2xrIjsN
Cj4gPj4+Pj4gKwkJCXJlc2V0cyA9IDwmY3BnIFI5QTA3RzA0M19BRENfUFJFU0VUTj4sDQo+ID4+
Pj4+ICsJCQkJIDwmY3BnIFI5QTA3RzA0M19BRENfQURSU1RfTj47DQo+ID4+Pj4+ICsJCQlyZXNl
dC1uYW1lcyA9ICJwcmVzZXRuIiwgImFkcnN0LW4iOw0KPiA+Pj4+DQo+ID4+Pj4gICAgTm90ICJh
ZHJzdF9uIj8NCj4gPj4+DQo+ID4+PiBBcyBwZXIgYmluZGluZ3NbMV0sIGl0IGlzIGNvcnJlY3Qg
aWUsICJhZHJzdC1uIg0KPiA+Pg0KPiA+PiAgICBUaGVuIEkgdGhpbmsgdGhlIGJpbmRpbmdzIGFy
ZW4ndCBhY3R1YWxseSBjb3JyZWN0LiBCdXQNCj4gPj4gbmV2ZXJtaW5kLi4uIDotKQ0KPiA+DQo+
ID4gV2h5IGRvIHlvdSB0aGluayBpdCBpcyBub3QgY29ycmVjdD8gV2hhdCBkaWZmZXJlbmNlIGl0
IG1ha2UsIGNoYW5naW5nDQo+ID4gZnJvbQ0KPiA+IGFkcnN0LW4tPmFkcnN0X24/IElzIGl0IHZp
b2xhdGluZyBhbnkgRFQgc3BlY2lmaWNhdGlvbj8NCj4gPg0KPiA+IFBsZWFzZSBjbGFyaWZ5Lg0K
PiANCj4gICAgTm8sIEkgZG9uJ3QgdGhpbmsgdGhpcyB2aW9sYXRlcyB0aGUgRFQgc3BlYy4gSXQg
anVzdCBkb2Vzbid0IGZlZWwgcmlnaHQNCj4gdG8gY29udmVydCB1bmRlcnNjb3JlcyB0byBoeXBo
ZW5zIGluIHRoZSAicmVzZXQtbmFtZXMiIHByb3AuLi4NCg0KT2ssIFRoYW5rcyBmb3IgY2xhcmlm
aWNhdGlvbiwgc2luY2UgaXQgaXMgbm90IHZpb2xhdGluZyBhbnkgU3BlYywNCkl0IGlzIGp1c3Qg
bWF0dGVyIG9mIHBlcnNvbmFsIHRhc3RlLg0KDQpDaGVlcnMsDQpCSWp1DQoNCg0K
