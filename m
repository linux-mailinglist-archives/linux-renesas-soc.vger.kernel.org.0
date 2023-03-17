Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62DDD6BE53B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 10:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjCQJPs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 05:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjCQJPr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 05:15:47 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B2A62844;
        Fri, 17 Mar 2023 02:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0GaWz5n3QVP/s9WYIsCtNiO7vX2BqOZ4rJNRqv7k3oX9+DwlGA7bQF7dZ07mBB+PT8ZjPO0zpY5GpQKmmaYjBi6geM4sSPVhISkll8Yc1sOfz0ReWIGGiRR0o/9Ktx3SsjD03J/tB6KLtf2qc9YkErkpadWGFjHAJYBp5Nv7f8qGp6HhQM0B4lSTfzEqtwdkOr32cOZv2bTNs7VyD5/PydPMNrefWVg9rvtq1KPDaYxwpvc7fhsJoHsbi8XzASizN11T6eWtnwF4GXOwbWJeF1Y3wkWhNT/t3NRRGAINj7pyuIKjndcRzKVllGRJsK16Sg9tqLS1jmLT12hY7HWRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEQ/LFTSO8baxCecn7iMyvzgPYeQ4NNo58mEn1fjePQ=;
 b=Cy+yieGjGAKCUjMo55I28OILiu1a5aTsl4L1edBGG3zkwJ0oqVYv4/OZIKBpntT2o6VK8UE986WbxFLjNN/+na6ffzwdO7kRu0iR/KM2JZqJ7PoEsIKaoLyCOe+o6n/4Hp+EeRBbOfxGRSPny2OFwoyqif5ARjhxO7b5je/9QpVr2Bnt0j9v1jndPtUyHDt2oqjEs+BiNpB4I5G05yILvRcG2aInhukSf7XzNxXQcSCfwSrEy6HEUT+eZW6y9ZvS5V7gLcga2xcBofs7zQuYLYoCWLOAL93fvCHEhE2POUKBz8/riw6v3G5aQHhDFhgRcWCL/c4CfeDzLcyqPsap9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEQ/LFTSO8baxCecn7iMyvzgPYeQ4NNo58mEn1fjePQ=;
 b=h2CiDobKPxfxDRtwedMEj926iOarvI90lH0/UDkLYTJseaUj7Y+LLFRVmolydJq6ld8srOp3nzdo+mi1l8UF7v2STRa0cJLzU1KSRQR2X6KAJsAXK4Z5zUxzkjlpOhW5oSIjWN2VXslPL5mdr135hkyyHypVMtws/H3aU/aRqnc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB10059.jpnprd01.prod.outlook.com (2603:1096:604:1e6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.33; Fri, 17 Mar
 2023 09:15:24 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 09:15:21 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Topic: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Index: AQHZWCCS4vXtQ/fzW0yUXUaCYffr6a79lBkAgAAA5oCAABuIgIAA62sggAACXICAAABMkIAAEAYAgAABSMA=
Date:   Fri, 17 Mar 2023 09:15:21 +0000
Message-ID: <OS0PR01MB59228F2CA5A579AEE793A67486BD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
 <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
 <TYCPR01MB593334BB3847CCC45A1B6C7286BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdUN=0aJ-7huv0XrhG3LMu8q_SEuqHU48ytTgGAYEjng5A@mail.gmail.com>
 <TYCPR01MB593390150CAC755AE540D7D586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdVmz_JNmC7Fk03zpaZY+MiBAgvFUc1Tnr+w=wHjbgeSug@mail.gmail.com>
In-Reply-To: <CAMuHMdVmz_JNmC7Fk03zpaZY+MiBAgvFUc1Tnr+w=wHjbgeSug@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB10059:EE_
x-ms-office365-filtering-correlation-id: 77ab4ab3-65da-455a-e938-08db26c82256
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cvz6LWMmI8v2kxSBh5ECyG8+UkzIOord6lglrBRMG67DqFfCStMg6xIbWQWYcB/qpbXsTX6BoabuW3ey4a0Zh/Zg5qj701Yta1OSOdqc0CvltREzjKcHO47nRKJBZ9S8N1Tus1DrgjEX/xW6Kp4vGhUpzHy7SHT0kAP6zmiY0/GErNmL9DURq4jS+U0Kh7sBusXp/4Z61OmV3fbAfQC/MoIjuSpCQW1/paxM1nYKcr+FfEZGQktpx06544sT5XdBd4UMfUlsvmKQQ5QnklQhoeRU0kxR4SRFhRoaHibDuMoti5UMa44NWMQH+89U9KDt2hxNRmrO9btcWj3L/cdwd4Sd9bM/8xdfk6bczZuOq+dLCeSQHx3Vj4llhelJN2y+f30QB08UylgbWtnoOkFh92+AXGY/LsX08yp3azRfK6aWmvdBA1yBYrnuKriVW+Fs+v+M8B4XW86m5CRi6PtM1Msb+2Ib++wyLL4mtEIkr75O4A1dJEsbyB04MbMP5/gghjK5Qzf57JZdgHonn+5oTb94UtvvBGPqhy6n73Z35NeRbagmwUgw9CGoe87b/yG0uzUq7D4a8r2IQP5OwYn5D7s3uZxBkiaMfPlCtZo1qPuvKEvVIDX6GOTN/v0bwuBYBeg2Nq9wUJT4yXQJCOagn849y6q/+6Jfi6f1wPcRPLP/q+gkBPXgdvnARtY/FGXXOWgW1lespm21ovAIHucaIA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199018)(9686003)(186003)(83380400001)(76116006)(33656002)(6506007)(86362001)(41300700001)(8936002)(7696005)(71200400001)(53546011)(52536014)(55016003)(5660300002)(316002)(4326008)(38100700002)(8676002)(54906003)(6916009)(122000001)(2906002)(38070700005)(66946007)(478600001)(66446008)(64756008)(66556008)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2ROYXRGYTVJamJ4ekRVM01tUzVtTzY4aW13S3hOOUk1MTYwaDVjbzNSZ3JF?=
 =?utf-8?B?VFdIWHJSUFlqdmVxZ3BDdHE4eWpMRlBFTXNIcUV6S01mUU95L1VOVS9HU2x0?=
 =?utf-8?B?Zit2TUN0Sjk2V2pYQlBxMnJXeFJ3UmhTM09xM1BpVVEyOFRzaktzN2oxRUtV?=
 =?utf-8?B?TlAwTThkQjNyMXhEZUVFaTJYMXR2OWNwTFNEVzhmYnlUNUt1c1FLc3QxTFZW?=
 =?utf-8?B?b1d0YldXUFBXUWVoSDJyYStBMkM0VUw2MEFTeURhVjI3OWI4UFNJajlUclRQ?=
 =?utf-8?B?VGxCYTRpWVVWcDE3R0Zmb2NEUTVDOG92ZEhOOEpNaWRHSlcrUDFIM09iRTF0?=
 =?utf-8?B?dGRnZk1lZW8zd1pKNjBycDBiUjJKR0dLd2ZZaWNZUUxKanNmU1FZS2dBTERI?=
 =?utf-8?B?c1FEeUp4WUdvZmZIMVlKM0NYZ3ZmK3VLNnY4WUdXVmkxM1NqWmFVQktUdE1R?=
 =?utf-8?B?QmZCZ3c2eDNtOXhmeWh3Yk9UeFUrZ0RETS9vYUpRdDVWSGJ0bFdKemV0dG5M?=
 =?utf-8?B?QVNHa0c5RndrTk41U2tnV2NkK3pibFcyNFE5RlZNK21BWXVqVkQxRCt1NUlK?=
 =?utf-8?B?OXBnekJaNEJlc1NYdzVnOExDM2kzV0FZbUY0bFEyamdhN3pxVVc4bnlJa0wz?=
 =?utf-8?B?eG1NSkJ1dkZuMzlqYnJWc3Q5UmtOL2tJS3NuRUptdVBqaG03VjBxMmQzWW9Q?=
 =?utf-8?B?K0RNaldNbGo4VnNaT3E4YVNwSlNRZEpTeHJDemNobGN3aG9RN1FZVlU4Vk5n?=
 =?utf-8?B?NjV1Vno4YzhNbDBZcklVazJoRmpmaXdlSzVXbnZJUVNuUnBjN0JxTVl3ZjZQ?=
 =?utf-8?B?ODhYQ1dHdWFRL2t2alBVc3Y0RWZ4OTR6QXNEbGd5VWczaDF5T1h6ZTlTcWlO?=
 =?utf-8?B?MFA0YWlLakF2Y09jUWxycTBvQ2VjbjRKNFRPQ2ViSXF3YXJQRVFQQU9UVENR?=
 =?utf-8?B?clJLRjF6bUFvYmI3dVJVMEJLelVJUXlnQzUxR21CT1dGUHEzLy9XL2pXVHBu?=
 =?utf-8?B?VUNIdzhKOWZaRGdNeUZETmpuNXlyWW4rZFBDajczS1R5WWpxQThoQU9uQXlE?=
 =?utf-8?B?UVQvaU5HVTQxMUVYY0hQc2JSSVBwRkpBdkZic1ZwVWdUWkk2dm9KVkdhZmFR?=
 =?utf-8?B?Z1RrZitlNG5aQWVLN2p1ekdXSWFkV2dmSHFhSW5TNE9XOFNXK2ZEaW50YWl6?=
 =?utf-8?B?Qkp3TXNpMjE4ZXlINHViVkE4cmV1VmFqdkZuelpBOERuZ2xIQTlMYWRlS1pn?=
 =?utf-8?B?d0F2TUxOMXd1L2VSSDFEenFMdDJzMmFmenUrSmQ2V3FYbDFJbExrWEV0RGxo?=
 =?utf-8?B?ZHV4UUNJL0puSEhvdjRzZWR3QUR4TGtlWGQraHRwVDNaTFZ6cFV2NUdOZ3JM?=
 =?utf-8?B?dkFxOGhpRVBpVGFrVE0yRVdxWDZZaUx4TzhNWThreE5SSEpkM3gyS0ZSOG1R?=
 =?utf-8?B?eXpDcjNlbUtacXh1YVJwV2ltelBVbWxWVXNlMW5sTXJjc3JwMlY4Y2hwUExi?=
 =?utf-8?B?RmJFQXNkeEliekN3dGxWUG5zMk1LcTB2ejUrZXpTdGF3WDJVSFR5cWxVRHdI?=
 =?utf-8?B?WkdkeTI5TGw5UFhHZUJDaWJCN2FZaGxRNlovWjBoaHdBdGQ0Z2dQRTB5YlJL?=
 =?utf-8?B?TERnT0piRitZczZSL2xpb21oUGZRWGMzY1BFUmd5YmtoYWFKZUdlQVVRN0Zi?=
 =?utf-8?B?RkFCQWZsaU1xSWRPWnBPb2xWZE5lSm9UY2VBN2dpSVE2dlBsZXVydkZCUUhT?=
 =?utf-8?B?U3RONHhCQm1kZHIxbFYrSFBHTkhWeHNhVndodU03N0N0Si9WcWFUTHpMOVRk?=
 =?utf-8?B?V0NiSms0bzJsbENCdXQvbGgrTlNlZk9uMjNEM1BDMGxBS0xqamY4ZEdOR0ZB?=
 =?utf-8?B?MW8zZVZpbVhtTDVyMHZtcG8zWnJhN2V0MHNOaCt2ZFhhNi9tVWF6N0E0WUE4?=
 =?utf-8?B?cWFPcmo4dUtFSjNLZVNKZ252Sm1iSi9paHZDQ3lQTmxBYlNYR3VsRzFSSm0x?=
 =?utf-8?B?SE51LzZCMEYrdU9DMWxJTUgvTkpaOUY4ZnVSL0I1SlliQWxyMjZtSmJYc05w?=
 =?utf-8?B?UFo4d0Q3U2xDRzRRamlnQkUxMlp2ZTA0K2dJQXh1R1U1TWxFdlpKUWhJc1BV?=
 =?utf-8?Q?ZuDc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ab4ab3-65da-455a-e938-08db26c82256
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 09:15:21.4336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E26awA+Yc+U1Nm3a8YF+0j0qgzjL6+FmlrmgRenh3QN+7syXRMhbfIwCvLR32xwAmP8OtPsJWR0CVEoYj0ACEfALhibkRUNnrZRRf7aRwyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10059
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIHR0eTogc2VyaWFsOiBzaC1zY2k6IEZpeCB0cmFuc21pdCBlbmQgaW50ZXJydXB0IGhh
bmRsZXINCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIE1hciAxNywgMjAyMyBhdCA5OjA4
4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+
IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHR0eTogc2VyaWFsOiBzaC1zY2k6IEZpeCB0cmFuc21pdCBl
bmQgaW50ZXJydXB0DQo+ID4gPiBoYW5kbGVyIE9uIEZyaSwgTWFyIDE3LCAyMDIzIGF0IDg6NTni
gK9BTSBCaWp1IERhcw0KPiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+
ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHR0eTogc2VyaWFsOiBzaC1zY2k6IEZpeCB0cmFu
c21pdCBlbmQNCj4gPiA+ID4gPiBpbnRlcnJ1cHQgaGFuZGxlciBPbiBUaHUsIE1hciAxNiwgMjAy
MyBhdCA1OjM04oCvUE0gQmlqdSBEYXMNCj4gPiA+IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHR0eTogc2VyaWFs
OiBzaC1zY2k6IEZpeCB0cmFuc21pdCBlbmQNCj4gPiA+ID4gPiA+ID4gaW50ZXJydXB0IGhhbmRs
ZXINCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBPbiBUaHUsIE1hciAxNiwgMjAyMyBhdCA1OjAx
4oCvUE0gQmlqdSBEYXMNCj4gPiA+ID4gPiA+ID4gPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiA+ID4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+IFRoZSBSWiBTQ0kvIFJaL0ExIFND
SUYgaGFzIG9ubHkgNCBpbnRlcnJ1cHRzLiBUaGUgZm91cnRoDQo+ID4gPiA+ID4gPiA+ID4gaW50
ZXJydXB0IGlzIHRyYW5zbWl0IGVuZCBpbnRlcnJ1cHQsIHNvIHNodWZmbGUgdGhlDQo+ID4gPiA+
ID4gPiA+ID4gaW50ZXJydXB0cyB0byBmaXggdGhlIHRyYW5zbWl0IGVuZCBpbnRlcnJ1cHQgaGFu
ZGxlciBmb3IgdGhlc2UNCj4gSVBzLg0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4g
Rml4ZXM6IDM5MmZiOGRmNTI4YiAoInNlcmlhbDogc2gtc2NpOiBVc2UNCj4gPiA+ID4gPiA+ID4g
PiBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgZm9yIG9wdGlvbmFsIGludGVycnVwdHMiKQ0K
PiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBJIGRvbid0IHRoaW5rIHRoYXQncyB0aGUgcmln
aHQgYmFkIGNvbW1pdC4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBPSy4gSSB3aWxsIHVzZSBi
ZWxvdyBjb21taXQgYXMgZml4ZXMgb25lLCB0aGF0IGlzIHRoZSBjb21taXQNCj4gPiA+ID4gPiA+
IHdoaWNoIGFkZGVkIFJaL0ExIFNDSUYgd2l0aCA0IGludGVycnVwdHMuDQo+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gY29tbWl0IDhiMGJiZDk1NjIyOGFlODcgKCJzZXJpYWw6IHNoLXNjaTogQWRk
IHN1cHBvcnQgZm9yDQo+ID4gPiA+ID4gPiBSN1M5MjEwIikNCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IFRoYXQgb25lIGFkZGVkIHN1cHBvcnQgZm9yIFJaL0EyLCBhbmQgaXMgYWxzbyBub3QgdGhlIGJh
ZCBjb21taXQ/DQo+ID4gPiA+DQo+ID4gPiA+IE9LIHdpbGwgdXNlIGJlbG93IG9uZSwNCj4gPiA+
ID4NCj4gPiA+ID4gRml4ZXM6IDRjODRjMWIzYWNjYSAoIkFSTTogc2htb2JpbGU6IHI3czcyMTAw
OiBhZGQgc2NpZiBub2RlcyB0bw0KPiA+ID4gPiBkdHNpIikNCj4gPiA+DQo+ID4gPiBUaGlzIHJl
YWxseSBzdGFydHMgdG8gbG9vayBsaWtlIGEgZ3Vlc3NpbmcgZ2FtZS4uLiBCZWVwIDstKQ0KPiA+
DQo+ID4gQWxyZWFkeSB0aGVyZSBpcyBhIGdlbmVyaWMgY29tcGF0aWJsZSBpbiBkcml2ZXIsIHdo
ZXJlIHdlIHN0YXJ0ZWQNCj4gPiBpbnRyb2R1Y2luZyBSWi9BMSBTb0MgV2l0aCA0IGludGVycnVw
dHMuIFNvIGFkZGl0aW9uIG9mIHRoaXMgU29DIGhhcyB0aGlzDQo+IGlzc3VlLiBBbSBJIG1pc3Np
bmcgYW55dGhpbmcgaGVyZT8NCj4gDQo+IFRoZSByYWJiaXQgaG9sZSBzZWVtcyB0byBiZSBkZWVw
ZXIgdGhhbiBJIHRob3VnaHQuLi4NCj4gDQo+IExvb2tpbmcgYXQgdGhlIGNvZGUsIHRoZSBkcml2
ZXIgYWx3YXlzIGFzc3VtZWQgdGhlIGZvdXJ0aCBpbnRlcnJ1cHQgaXMgQlJJLA0KPiB3aGljaCBt
YXRjaGVzIHRoZSBSWi9BMSBkYXRhc2hlZXQgZm9yIFNDSUYuDQo+IFNvIHRoZSA0IElSUSBjYXNl
IGlzIHJlYWxseSBhIHN1YnNldCBvZiB0aGUgNiBJUlEgY2FzZSwgYW5kDQo+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxzY2lmLnlhbWwNCj4gaXMgd3Jv
bmcuDQoNCk9LLg0KDQo+IA0KPiBIb3dldmVyLCBTQ0koZykgaXMgdGhlIG9kZCBvbmUgKGFsc28g
b24gU0gpOiBpdCBoYXMgVEVJIGFzIHRoZSBmb3VydGggSVJRLA0KPiB3aGljaCBJIHByb2JhYmx5
IG1pc3NlZCB3aGVuIGRvaW5nIHRoZSBqc29uLXNjaGVtYSBjb252ZXJzaW9uIGluIGNvbW1pdA0K
PiAzODRkMDBmYWU4ZTUxZjhmICgiZHQtYmluZGluZ3M6IHNlcmlhbDogc2gtc2NpOiBDb252ZXJ0
IHRvIGpzb24tc2NoZW1hIiksDQo+IGxlYWRpbmcgdG8gdGhlIGJ1ZyBpbiBzY2lmLnlhbWwuDQo+
IA0KPiBOb3RlIHRoYXQgdGhlIGRyaXZlciBuZXZlciBsb29rcyBhdCB0aGUgaW50ZXJydXB0IG5h
bWVzLCBidXQgdXNlcyBpbmRpY2VzDQo+IGV4Y2x1c2l2ZWx5Lg0KPiANCj4gU28gSSBndWVzcyBT
Q0kgaGFzIGJlZW4gYnJva2VuIG9uIFNIIHNpbmNlIGZvcmV2ZXIsIHRvbz8NCg0KSSB0aGluayBz
bywgYnkgbG9va2luZyBhdCB0aGUgY2hhbmdlcyBkb25lIGluIHR4IHRvIG1ha2UgaXQgd29yayBv
biBSWi9HMlVMLg0KT24gUlovRzJVTCBib3RoIHJ4IGFuZCB0eCBpcyBicm9rZW4uDQoNCk5vdCBz
dXJlIFNDSSBpcyB0ZXN0ZWQgZXZlciBvbiBTSCBwbGF0Zm9ybT8/DQoNCkNhbiBhbnkgU0ggcGxh
dGZvcm0gcGVyc29uIGNvbmZpcm0gdGhpcz8NCg0KQ2hlZXJzLA0KQmlqdQ0K
