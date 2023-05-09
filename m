Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBEC86FC2D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 11:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbjEIJdY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 05:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234805AbjEIJcx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 05:32:53 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCE5100F5
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 02:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqBbSaucXnjpCni9MMKZUbYHS3LZcIQi3gNgSruIilT7AHpEFeroHgxc6y/4BLB/FPZvVt97d3kJWju/G+IiuX0NU/iJfovdEz4BUH309u2FLJt+lKShvpWAtWoTMf2JoNDJ12SmiaYUQexV7wFTY+TVRjs952n2rMJ5m7Ko/tjahZ7z+T5plXBiy+pkY1DzJv33m7zFjA24/toBGAq2FxYltnyZBq8uvF2CdyciZTHMHG+QZjT5XXwtUvj56zmHq77LakBxfRRKlvJnFIzIVR+M2m10aNMMyQPG7FjnUbsR5JM8N98oNdFOMk+1GKJ+idR4kQHkOU1ffHMTPlepAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMwCAGBJJXMU1XCtD91XJSdGWqBwGnHNFMC8f5XVFqg=;
 b=FiqBnILtwHT23f1OOERRbopFM/ovqssGVzHnwUeqhXRbue2u3Smqv4K+JksHzLOynw7sZGf2knaa8JXS/Gtq5O0D+ftjx0dDfs2ljRflZ0XXTIYGhYxJS9aUCfSeDJaO0z+vbrtzpCSoAfxTHPPlTg2TMH7quRhmGAh7RpTL6rIrTdRP2A2Yn5XgXU/LIak8G0bZqF4a53SiF7COuN+hfmOkwsyTmRhkuj34JluII35mUI1blZ6K36d1KxA4itkdEwvdoxwww9f6on5CcIKKs7uYvhchkvLis3gix4PZdbZN1HYG2H5xXSAPmVjFLG7dUApIHJgiNnjssoPojpVaQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMwCAGBJJXMU1XCtD91XJSdGWqBwGnHNFMC8f5XVFqg=;
 b=ZDbvgptIl1d/KeIdVzG/G977M3tE/2D5wxU5xVy6ZhhsMHmvTc5Vy3K/KW4hbDeKAd/378VIP29ldB3Yx75dqmJpDAKH+7hVCJB/t8qZQtT9r+jQC8Jvvb0wmi7w/r9zi0aSbLxhtN23DHznwD0+6ZVKinQpu7BY6/FXWKOGL/0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11760.jpnprd01.prod.outlook.com (2603:1096:400:406::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 09:32:21 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 09:32:21 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Lee Jones <lee@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: RE: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
Thread-Topic: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
Thread-Index: AQHZf3aj2rY7Ee22ykCAZA9TJ0ZPFa9RiFzwgAADeoCAAACWwIAAHvYAgAAE0UA=
Date:   Tue, 9 May 2023 09:32:21 +0000
Message-ID: <OS0PR01MB5922257A4BBA98232317C38286769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
 <20230505172530.357455-5-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922CB267130D6E5DBE4AD1086769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU36vONu2GMKYZwtLPo_+CDYnWKDXjMytAg0r6BPRUv7Q@mail.gmail.com>
 <OS0PR01MB5922474E0B42B6301DB1961986769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdV+kjU5Ymy70_fus+tvO6ENPY04QG0ANr2WtraPK0H45w@mail.gmail.com>
In-Reply-To: <CAMuHMdV+kjU5Ymy70_fus+tvO6ENPY04QG0ANr2WtraPK0H45w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11760:EE_
x-ms-office365-filtering-correlation-id: f39a1483-22d9-491b-784a-08db50704a2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8eVWqjovL2L7H7QLYnu5Y9rmb1XUdhDz4M6W0sS7oTb0gDJLOTKO9loxEf6XPs2bwGWsjTu0v33p3QSXcSGtXNs7IGLuInRKXG05ykL6qD1C1NjTtiaAPMzRw9oiWx86HY5e0o6eCt8GeXlzD3qi81qpSUddCadK5sllzRbv1lw4QDaYdkCSSRsXM3E6kvefa73Xh87cis68JQ9c7lD7CYoWD/dUcSxX07AFX7jrDs163d1ocVQt7Be+Dy4wbuFteajzGKWDXMbxZgHUL5a7kiqC08jDmYZxLw3YDuaBVo7e7b81OT8+K1Z42qoMxcISSg8ow+GUlkWbY1GBsNuTbKCMf2ToeeIWSAW85Z6sB3s/ZdlhIO+2viqZ3Mu8f+M0w04w/dHDvVp0lhl6i8skt3pNHReTgEzxtqNImcdPBupRRSLWzvlp8wdtw/CuGRdlAw/NnRIxr59bSq24VV0ElaNKn5mcmNKS0K9ESxXPhPfBNLOeCh8Q6AyoGun4u4/zSDnOIf+AlTBXLFrSE9QpGeP5xe0qzmNJg7STCOiOTLCHtUOKWpFebUVxKWvsv4FL52vEc76v37DU1gAxn19jt+71vxF2OCa/s7gRg4tJ+VefeIgMBQAJZHOhoFv5Fe57
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199021)(2906002)(186003)(26005)(6506007)(9686003)(53546011)(33656002)(38100700002)(55016003)(122000001)(71200400001)(316002)(38070700005)(64756008)(66446008)(66556008)(41300700001)(6916009)(66946007)(66476007)(76116006)(7696005)(4326008)(54906003)(86362001)(478600001)(5660300002)(52536014)(8936002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjRxWEEvcWVKaTQ1WXN3S242UmFlV2FmNEVVakRDeHd1TktzZTY4a2ltR29x?=
 =?utf-8?B?cWxwdThMVXBkSklZbGVWck5tdnZLRXN2VU42dCtCL2tKS3ZWRFU0cngxemh6?=
 =?utf-8?B?VllLK3UxazFXMWVveFBFN01mbTZ1a3FCWlBSQUd3d0E2M2RNVU5rWEozZWEr?=
 =?utf-8?B?TmtsRXY3RGIvcTkwV3BpQjFUUVdnTCs0c2dXalBaYzdEZFBkK0NwSE5hdVk4?=
 =?utf-8?B?bU5kVncxaTZTUVNoMWtNS2NNQ0VXTXdhd1BBN3RKT3BTeFNVTXY2Vlc2dU1w?=
 =?utf-8?B?TURkYzhyd1ZUQlcrZVZKWGY1ano1ZDAxQzJtclgrU2ZpOUtvTllVUDdYR29u?=
 =?utf-8?B?cmg0RjQ0ZGNtR0Y1RXBTTmc2Y1ArNXIzR3JkK0w1bWxmdVFDbC9mZ2VVaHll?=
 =?utf-8?B?QnFsbDY3dGZjdkxZTjZRRzJ1N0gzcjBVMjFZdWUzZEhTRDFwZnBCOU9YNDRx?=
 =?utf-8?B?MGM2bit4YVVROTY5cXRWUWZJOU1SZG5VQUV6dUU5RG93aVVhbnFYOVBOSjNo?=
 =?utf-8?B?bUR3eEpVT08yc1dLcG9Fb0NzVW5GZUFJSXRlT2pqWEJvSkRWN2xDOVVQazlH?=
 =?utf-8?B?Y2Nhbzk5ZFAwRVhMOEF5WDdHazVmYXJITVdWRVUrSVFTQTZSek1KbTVPYjJx?=
 =?utf-8?B?VG9mNG9FVTRBdzBqVytGZVRyZnVHaDYzK040RmgyaG1OeDlZL3R1NVh2NTlT?=
 =?utf-8?B?SkthNTh5cEh6SGdnWEVwSmgzOWhnUnQxYlRPQmxRWUdSKzdzT0F4TnNkazF4?=
 =?utf-8?B?WUxrY25PakZuSjhZVXZhZmVqWWV3ZFVwOVdKQTBlYWZHM2VSZXprTk5WcFZT?=
 =?utf-8?B?OU8ybEl2NG5VREVNRXJJVXZkdXBISWRDcDBKMkQwZkUvYVlEbnd6Z0I5c0xt?=
 =?utf-8?B?TFN3QnFKZzhHSUtycFEwc3FhRmtPR1U2aTVrZ2pYQmRCVnVhdVBZSldJL05R?=
 =?utf-8?B?b1hIVVRKeE8yRXo4UUVBWm82MFA5bFFvNkZlajUrc2dUaEFySVY3bnVYUnND?=
 =?utf-8?B?SVBrc1Y2YVp3UFVsdnMwVEd3b0wrbDFGdGVRemxmNWNBK3F5bVFzSHlacFhw?=
 =?utf-8?B?TStnMHpIZ0RLRlZNYzNwMmRBb2NocDdNU0Vna2ZnSitZY1hKaUdwQWVmMkJN?=
 =?utf-8?B?UkNNcGsvVnJRWTAzV09lVFdTV2l6MUJaM1hVa0c4aHQxYndHaDVhQU5ZYllv?=
 =?utf-8?B?cEZFZ1orMlVobXozK3hlVUM1cUhmZ295ZjlZR2R3NWNJcUR2WDllVVlYK2Ez?=
 =?utf-8?B?TmwrVXdvWlp4YXF4cFB3V3JtbG83OUIwRGpiSTNnQjd5WllUeWpWNjF5VHBi?=
 =?utf-8?B?b2c1czBrYjI0VzVVSXpPdEV0RUlhRFVlNWJhZTJwZ3lBQ2lXdnpya290S05p?=
 =?utf-8?B?VUVzcnVrRkErQjB0K2RudUFDUTI4S055ZkpRemJRN2hmY2NzeGxhU0dGZ2Ni?=
 =?utf-8?B?MTV3Wkd3T1VRMDZKbUxYZmliLzcwWG1yeFVhaUhXb3dPNzhybUluYXJmbDUz?=
 =?utf-8?B?MjN2ZkVTOXhkLzl4K29oYzdLQUVqa2d0b3FOWWJMdnFVODE2ZVZXTVFMSlcw?=
 =?utf-8?B?N0t2R05YMlZXUTFTNnNucGlkZzdhd0ZXQlpSQ01sSGxoRjZxdC9oRDN3SlRN?=
 =?utf-8?B?ZGRxdW14cW5pV2E1NVZMR2EwNzRrc1g5dEc2WEx3ZzBIaXhqbk42ZlNSMEtR?=
 =?utf-8?B?Smd6eTQzMzdBYTA4UWhwTUFlelkwR1U2MnFMdk8wc3NNeFNPUE9RQW41WTF2?=
 =?utf-8?B?M043L3RiSER5aDVRK0V2cWZOTkF5S29wZUc3dDAxYnRPR2tIWUdneFJ1RUpa?=
 =?utf-8?B?eXRvaWZPMHhrelZ2WVBURFpZeGZ4UlpRNlhsclkrWGpodmRBQ2pPeklJR1Ju?=
 =?utf-8?B?M2owY3k0dTQ2WkRsZWZlcjRnMEdvaTF0QXhHaWdpRW44dkFuVGtqMG02ZmRj?=
 =?utf-8?B?TFc2TmVMMXFNODNCbFRrcFIwaXVuK2dubjV3eUhMS1lFbStNMzhDNHNyK21w?=
 =?utf-8?B?cUhOeExleUdIbDVwYWdDNlNmT0tSdHM3L2lzVGhkWTdYSDJjMXZEb0JoNHpM?=
 =?utf-8?B?bnZsMFJZRjBNL0NmWlVUMGlNRnFrbW9WYnFFZWtpNWFLd2lNem1UcVk5L1la?=
 =?utf-8?Q?u54Kvxzujn4TlsD1Gsi/iG91i?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f39a1483-22d9-491b-784a-08db50704a2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 09:32:21.3578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UuIoZ0jFHBHQ4mFOupFvhaDOWm5OMSHplP16CZKK9Bgyx1aAIrpsaf8osEe8r36fmpG/J2Q5nOUFJp6+tjMfWuLH2OL4ZUhZONQI3PKTXTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11760
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA0LzVdIG1mZDogQWRkIFJlbmVz
YXMgUE1JQyBSQUEyMTUzMDAgUlRDIGRyaXZlcg0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1
ZSwgTWF5IDksIDIwMjMgYXQgOTozNeKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDQvNV0gbWZkOiBB
ZGQgUmVuZXNhcyBQTUlDIFJBQTIxNTMwMCBSVEMNCj4gPiA+IGRyaXZlciBPbiBUdWUsIE1heSA5
LCAyMDIzIGF0IDk6MDbigK9BTSBCaWp1IERhcw0KPiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+IHdyb3RlOg0KPiA+ID4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2MiA0LzVdIG1mZDogQWRkIFJl
bmVzYXMgUE1JQyBSQUEyMTUzMDAgUlRDDQo+ID4gPiA+ID4gZHJpdmVyDQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBDdXJyZW50bHksIGl0IGlzIG5vdCBwb3NzaWJsZSB0byBpbnN0YW50aWF0ZSB0aGUg
aTJjIGNsaWVudA0KPiA+ID4gPiA+IGRyaXZlciB1c2luZyBNRkQgY2VsbCBhcyBpdCBpcyBub3Qg
YSBwbGF0Zm9ybSBkcml2ZXIuIEFkZA0KPiA+ID4gPiA+IHN1cHBvcnQgZm9yIFJlbmVzYXMgUE1J
Qw0KPiA+ID4gPiA+IFJBQTIxNTMwMCBSVEMgcGxhdGZvcm0gZHJpdmVyLCBzbyB0aGF0IGl0IGNh
biBiZSBpbnN0YW50aWF0ZWQgYnkNCj4gPiA+ID4gPiBNRkQNCj4gPiA+IEFQSS4NCj4gPiA+ID4g
PiBUaGUgcnRjIGRldmljZSBpcyBjcmVhdGVkIGJ5IHVzaW5nIGkyY19uZXdfYW5jaWxsYXJ5X2Rl
dmljZSgpDQo+ID4gPiA+ID4gYW5kIGl0IHJlZ2lzdGVyIGFzIHRoZSBydGMgZGV2aWNlIGJ5IHRo
ZSBoZWxwZXIgZnVuY3Rpb24NCj4gPiA+ID4gPiBwcm92aWRlZCBieQ0KPiA+ID4gPiA+IHJ0Yy1p
c2wyMTA4IGRyaXZlci4NCj4gPiA+ID4NCj4gPiA+ID4gTm90IHN1cmUgdGhpcyBwbGF0Zm9ybSBk
cml2ZXIgaGFzIHRvIGJlIHBsYWNlZCBpbiBSVEMgc3Vic3lzdGVtDQo+ID4gPiA+IHJhdGhlciB0
aGFuIE1GRCBzdWJzeXN0ZW0gYXMgUE1JQyBNRkQgZHJpdmVyLCBjYW4gaW5zdGFudGlhdGUgaXQg
dXNpbmcNCj4gTUZEIGNlbGw/Pw0KPiA+ID4NCj4gPiA+IENhbid0IHlvdSBqdXN0IGluc3RhbnRp
YXRlIHRoZSBpMmMgYW5jaWxsYXJ5IGRldmljZSBmcm9tIHRoZSBQTUlDDQo+ID4gPiBkcml2ZXIs
IGFuZCBkcm9wIHRoZSBuZXcgbWZkIGFuZCBwbGF0Zm9ybSBydGMgZHJpdmVycz8NCj4gPg0KPiA+
IFllcywgaXQgaXMgcG9zc2libGUuDQo+ID4NCj4gPiBUaGUgb25seSByZWFzb24gTUZEIGlzIHVz
ZWQgZm9yIGZ1dHVyZSBleHBhbnNpb24gbGlrZSBhZGRpbmcgc3VwcG9ydA0KPiA+IGZvcg0KPiA+
DQo+ID4gMSkgYmF0dGVyeSBjaGFyZ2VyDQo+ID4gT3INCj4gPiAyKSByZWd1bGF0b3INCj4gDQo+
IEknZCBqdXN0IHN0YXJ0IHdpdGggYSBza2VsZXRvbiByZWd1bGF0b3IgKCJQTUlDIikgZHJpdmVy
Li4uDQo+IA0KPiA+IEluIHRoYXQgY2FzZSwgd2UgY2FuIHNoYXJlIHJlZ21hcCB0byBzdWIgZGV2
aWNlcy4gQnV0IHRoZXNlIGRyaXZlcnMgYXJlDQo+IG5vdCBjdXJyZW50bHkgcGxhbm5lZC4NCj4g
Pg0KPiA+IEFwYXJ0IGZyb20gdGhhdCwNCj4gPg0KPiA+IDEpIEl0IGF2b2lkcyBzdWJzeXN0ZW0g
ZGVwZW5kZW5jaWVzLCBpZSwgUE1JQyBkcml2ZXIgZGlyZWN0bHkgY2FsbGluZyBydGMNCj4gZHJp
dmVyDQo+ID4gICAgZm9yIHJlZ2lzdGVyaW5nIFJUQyBkZXZpY2UuDQo+IA0KPiBZb3UgbWVhbiB0
aGUgZGlyZWN0IGNhbGwgaW50byByYWEyMTUzMDBfcnRjX3Byb2JlX2hlbHBlcigpPw0KDQpZZXMs
IGluZGVlZC4NCg0KPiBJIHRoaW5rIHRoYXQgY2FuIGJlIHNvbHZlZCBieSBlbmhhbmNpbmcgaTJj
X25ld19hbmNpbGxhcnlfZGV2aWNlKCkgdG8gdGFrZSBhDQo+IHByb3BlciBkZXZpY2UgbmFtZSwg
aW5zdGVhZCBvZiB1c2luZyAiZHVtbXkiPw0KDQpHZWVydCwgV29sZnJhbSwgDQoNCkFueSBwb2lu
dGVycyBmb3IgaW5zdGFudGlhdGluZyBpMmNfY2xpZW50IGRldmljZShmb3IgZWc6IHJ0Y19pc2wx
MjA4LmMpDQpieSBlbmhhbmNpbmcgaTJjX25ld19hbmNpbGxhcnlfZGV2aWNlKCkgYXBpPyANCg0K
QXBhcnQgZm9yIHRoaXMsIHNpbmNlIGEgc2luZ2xlIGNvbXBhdGlibGUodGhlIHBtaWMgb25lKSBp
cyB1c2VkLCANCg0KSW4gcnRjIGRldmljZSBwcm9iZSwgSG93IGRvIHdlIGlkZW50aWZ5IHRoaXMg
UE1JQyBSVEMgZGV2aWNlIGFuZCB1c2UgdGhlICJUWVBFX0lTTDEyMDgiIGNvbmZpZw0KaW4gUlRD
IGRyaXZlciwgb25jZSB3ZSBpbnN0YW50aWF0ZSBSVEMgZGV2aWNlPw0KDQoNCj4gDQo+ID4gMikg
SSBndWVzcywgdGhlIGN1cnJlbnQgc3BsaXQgd2lsbCBhbHNvIGdpdmUgc29tZSBtb2R1bGFyIGRl
c2lnbi4NCj4gPiAgICBXZSBoYXZlIGEgY29udHJvbCB0byBlbmFibGUgb3IgZGlzYWJsZSB0aGUg
ZHJpdmVyLg0KPiA+ICAgIGllLCBFbmFibGUgdGhlIGRyaXZlciBQTUlDIHdpdGggUlRDIGVuYWJs
ZWQgYW5kDQo+ID4gICAgZGlzYWJsZSB0aGUgZHJpdmVyIFBNSUMgd2l0aCBSVEMgbm90IGVuYWJs
ZWQoaWUsIFhJTi9YT1VUIGdyb3VuZGVkKSBpbg0KPiB0aGUgc3lzdGVtIGRlc2lnbg0KPiA+ICAg
IGJ5IGNvbnRyb2xsaW5nIHRoZSBjb25maWcgIlBNSUNfUkFBMjE1MzAwX1JUQyIuDQo+IA0KPiBZ
b3UgYWxyZWFkeSBoYXZlIENPTkZJR19SVENfRFJWX0lTTDEyMDgsIGFuZCBsb29rIGF0ICJyZW5l
c2FzLHJ0Yy1lbmFibGVkIg0KPiBiZWZvcmUgYWN0aXZhdGluZyB0aGUgUlRDPw0KDQpJIGFncmVl
LiB0aGlzIHdpbGwgdGFrZSBjYXJlLiBJIGp1c3QgYWRkZWQgdGhpcyBDT05GSUcsIHNvIHRoYXQg
d2UgY2FuIGhhdmUNCkJ1aWx0LWluIFBNSUMgZHJpdmVyIGFuZCBSVEMgbW9kdWxlIGRyaXZlcj8/
DQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiBUaGVzZSBhcmUgdGhlIHJlYXNvbnMgZm9yIGNy
ZWF0aW5nIE1GRCBkcml2ZXIgYW5kIHBsYXRmb3JtIGRldmljZS4NCj4gPg0KPiA+IEkgbWF5IGJl
IHRvdGFsbHkgd3JvbmcuIFBsZWFzZSBjb3JyZWN0IG1lIGlmIHRoYXQgaXMgdGhlIGNhc2UuDQo=
