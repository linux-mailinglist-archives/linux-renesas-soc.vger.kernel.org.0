Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98F6F538C5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 May 2022 09:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244670AbiEaH6J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 May 2022 03:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244682AbiEaH6I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 May 2022 03:58:08 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2097.outbound.protection.outlook.com [40.107.113.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750D454BD5;
        Tue, 31 May 2022 00:58:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YazsliXPHcnd0pby4T3bbXj+tjTh5TjqQJPcwuPbs/CqYYoe+Jxq4Yl1z+vXyB3aICOYaD0bB9zS+9/J12GR/O42tY+q/EbPt9GqhiUKnJv2KP1KujHutnIjX2U35llDRxKBvtB2/sG6QBbUIA+/WDbzciYORJrNGH9/hV3oAyjrIuuz3Mn/hYoLDxR545IE2v29E4V+T6Cjym4ba+F7cBAsjishIl4SbKFKurDWSX5xGe2MvzgioYj1FseMTf/Ey9rlnRIME757f649+bWmXNIn3tQ46Z7OyrJil3brFpzRZnaSaLsNdEC+h2fUEoBqpzYsA4+z6qwI5g4BIOz6KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbULcmseikoa9gz3/8Ri3mqFgF8cEsmnWmpsuMjvTao=;
 b=AV7stNUi/99wjCgWuI4BVe1NzVeVEZBSspxhcEytS4dePd5bBXLAad0KpzyC3ytbACMBYwwmfnuqyUaffSgshKsEdf6yK2wu+RKv2lYe4MGwZmERFeJ40fIjaH03JjELDb/6KeUrIHUE4TLLII2u+E7njKNDTd+1MJd0yJeCbU/M6uuxlA2zjpV9lyUoC3F4j3V/2TB85fnZNC2Cg4669L22KrJ9XOOQV978WllTuLOljEgbkjqJ52w73zaRB+jULHoDno0Vay0vB0q2EkoqEeWW1POK29aJBvnAyGdIu4iMe7/0A7RAqGJQX8ipUeTec7uI+RgvCOcq8hOkvAvH1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbULcmseikoa9gz3/8Ri3mqFgF8cEsmnWmpsuMjvTao=;
 b=OV5/7OCzXpC4vKJBHYOj79dWmdrrYqVZKcbHyLbRUM/NB1QisgsQwTwG6xxjY6JOuf85riIlXxhOqTegpAFNrB73eAv3CNhSXlmeaID5Zm/m/lfkJeNJps/131E73VecHfu/cvwjc+DuL9AjUoJB4eIFfgu+rwimBrZn7UEIITE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB7037.jpnprd01.prod.outlook.com (2603:1096:400:d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.16; Tue, 31 May
 2022 07:58:04 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%9]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 07:58:03 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: rzg2l: Fix reset status function
Thread-Topic: [PATCH] clk: renesas: rzg2l: Fix reset status function
Thread-Index: AQHYdL5uBo73FtK7wkCDUzoPMpthKq04mSWAgAAD+sA=
Date:   Tue, 31 May 2022 07:58:03 +0000
Message-ID: <OS0PR01MB592258FC31B22925E8D5D24F86DC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220531071657.104121-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXhJfdoRKZ2cxhAEBU95uLLr0rRTbEzow7sqHy+V7UxrQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXhJfdoRKZ2cxhAEBU95uLLr0rRTbEzow7sqHy+V7UxrQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1192603-c5f2-437a-d8cd-08da42db4a2a
x-ms-traffictypediagnostic: TYYPR01MB7037:EE_
x-microsoft-antispam-prvs: <TYYPR01MB703781941433FD9C967ED7ED86DC9@TYYPR01MB7037.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7eKy3uNpgrzceo5pA+suCruQvCusLQbvxbB8/WO0HQpAh7njb/g7rsgVT1hN2dfS46jP7Gy9aDBaLwm023svCzBPgPeVI//spbz7v0W0pm3sBxlY8UBGBvAOONYQC+uOy4nIYvGMU03zsBjmpWO1Bknwdo8N5NamGSR281MrTVRtuqpnmYV+9soiEygkmbPN93Ykavow8EImbUkQ7kBJGbQw57gIogJDNGxq/x7tYNDktAiLLCW1dUm6X/e7MpBCy0Of83NT5KGUahQp0dH6jU3R8w9t4YIAobLxm4sn21qap/JMnXg2tvGAHsov2mGrO79B/+0pV+sB47RFL7SamAsYCoCJ9yRt4HzC+YNrhz2OX9g7IIoHXGyUDO3hmanlPtZtsz9xZ4aFlM2z1c62Gu0b6P00s1rV5M7uySD38Xl89VD9qYeZcvlKfSqsTuLtYlGVY8gptQpy4vY6oeN5NcSmEVBgD3bvODzO3NUqA3gZHlIWWbM/UuDPhVv34t4blAgxX2Ik8L63wn3nj964DJ187IAzdwV6V8Wpz0VgLmQFS2DuWwfU/21TgDC/7rLY5LgJeVBOquzZCtUo8tWdIgrZH2yH0JGNKnAsFn84OXzisdpOSo/SGc5Y8cHHRXP96Rw6SCGronqG2ueqQ68bKnFtMh2ozvHjVRGf0IjJb3Hru7v0lH1L8juAJC4Iib7ZNRsPTQjh1vIAALpmOqGT6TeYavCqxPcEBgy2xDU5WZEnq81CUFq4zyOALmeg+Lx29Rs987fCKSu+Ncr4KzSpAD0RxT4NUZxwt7H8MGhHuQQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(52536014)(8936002)(64756008)(66446008)(66476007)(66556008)(54906003)(6916009)(8676002)(33656002)(76116006)(4326008)(26005)(316002)(122000001)(6506007)(9686003)(83380400001)(966005)(107886003)(53546011)(5660300002)(55016003)(508600001)(71200400001)(186003)(38100700002)(7696005)(38070700005)(86362001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWcxSHVtc3RnY3hwbEFKS1ZHcy9RN0NuNUlhMFA3OGNpcEI2ZXRsMGlCWThG?=
 =?utf-8?B?RkRjVGZrRDlWOXlNZnVUSU9ySThnZ3ZwNDdLT2tlaU1nVlpZamprUEJQYVRr?=
 =?utf-8?B?bUJ2eWs4VVErNmtHbVRrTXJtZVc0WDIvanBjV1crZHlleHpNVExUb2JzQldZ?=
 =?utf-8?B?M09xL25LNU11MlBwL1RYR0VkaTVoamZBV2JDak9Cck9HeXBGZFFqMjJoMW5p?=
 =?utf-8?B?eU9SQ1JraE1IL2Q5SWNqRjlETXZkSUZOM0hqWDlHb2NDM29UMEhFL3dYLy9k?=
 =?utf-8?B?RzJBVm1Fd2JjWnkxMXZsNUQ2T1h3ZU1vR1NIbGN2emZNV09uL25DVVhUVHN2?=
 =?utf-8?B?UXNydW4zUSttLzJBRHV6bEtjU1YrRFNzZXNIQ0tzQnFHdFltckRYSE9iOHQ3?=
 =?utf-8?B?MHplWTVPT3FrTWVWcFd2T0VseXdEV3hHVmFYL2pKSVVSZ1dxYTV1Q1ZiMW1K?=
 =?utf-8?B?STZSd1ZzVG52Rm9FNVpFWWhBa0JjaUtkNkJkc2g0SEZ3ZG9uTUhDd1pSeW5y?=
 =?utf-8?B?SUo3MlVyTlhyVjluVXZNWG5tdzc2MVlnVTZmd3R6V1EwWDZDZGNWNzE2ZnFs?=
 =?utf-8?B?QXdCUlVHSEFUUHAxbUNpaWd6THdrUWhFSnhrZURFUlNWSys0OU54Z1BFQ3J0?=
 =?utf-8?B?SHh5Rm85ZEY1M2hNWk9zV0JaelhxZWhLb0E5RG9zeTdWN1VhR0xFa1JSQkcy?=
 =?utf-8?B?MngvSGFGRTc4djZhZVRsMkJrNTNHMThuZGczRDRmZi9IV0g2enNSZWxYYkFl?=
 =?utf-8?B?Z08xc2w1TUs4SXl3bENBeGsrelo5eGJtd09iYncyWFZqTVp4YS9CdVFBc21m?=
 =?utf-8?B?RElyQ2xPMjg0MTg1b0ZrL0RDQjZFMi9ZcVNpSkIyM0wzZTlSdzF3djhRajdE?=
 =?utf-8?B?ellHYVBoSjFna2ZGbHZ0ZFRkb2gxK28zMy9PZEN5WEs2cUFQNi9Ia1pNTGZ3?=
 =?utf-8?B?aVZabkt5bVNScXhUdHBSL05LcnBQdHBXUmZTbFdLRUtFMCt5Wms2RFBRcnEr?=
 =?utf-8?B?TWMwdlBDaCtNd1ltVjA0b0xkSnpzSkt6akFIWk13OFlKN05BWXo2R0RJekZL?=
 =?utf-8?B?Wm5YTUY0MEt2RFQxSGhmSFhCVTFWRi8rU05odHhsQndxRHJVcy9LZG1lbzB1?=
 =?utf-8?B?eFJhdUdVMWNDamloVnFBcUNwc0NFWEl5clBieFJPUlBCT2hJdXVQRWxIejIy?=
 =?utf-8?B?QWhvdlpPZ0pRYVRhN2FNOHBDVnZyRjNxY21DRTAzSkp1b01YU0U5NlVJYlB3?=
 =?utf-8?B?L2ZVTTVQQzBNamtLZVJvVzQvMnRRRDBuNTd5aFJ4T3ZyU1hXTjQ1QVJpeUkx?=
 =?utf-8?B?dWdRbTF2ZEQ2aGxZN3NEelNmdW80V3kxSWlYT09QZkVGYUluNFRDSmVqZVdV?=
 =?utf-8?B?eTR5Tnh1STdFUXhYQzQ0VC9HZEIwdmFPZjZHRG9GSFdhVWRnbjB1V2hCb0hB?=
 =?utf-8?B?NS9VWVlkMys4eVFvUnlmdlV4dE5sblFEMFZpYWp3Z1JnUTNsY0R6NVhLdmVu?=
 =?utf-8?B?TkpIVWVjd3c3ZUEzaTdCbFY5d0xWMFltalRQNTc0cTZrU2szM00zRDM1SlpS?=
 =?utf-8?B?cGxJcmQ2bm9qMExDcXZGVmZJd0RlTGY0SWF1MlZ5MjBtYkFlWFVycjFtMFFi?=
 =?utf-8?B?WTlwSnVvMUdVT0d3TEUzSkkzaFo4Y0hmd2VBdnprdUE2eHBRY1FrSXVuS1N2?=
 =?utf-8?B?QXZrdUVvdXlDSlQwOWNXT0hCVmhzZ3ZuNTMyc3k5OGhaYWRCRE5KUXJBREdV?=
 =?utf-8?B?TkJkK3FBbU1XOHZjeVVrTzAyQW5renJhQVNyL01iczBnNlRNaXlzTGRQNUYz?=
 =?utf-8?B?L0dYblJ2MmdYc2dMYzZXVC9GcTd4VjVDaEVoOUF2U21lQVBaa0dSa3lML0xK?=
 =?utf-8?B?dFdRK0J5OFNva0FhamNjb2hsSHhvbTZkajUrdDdJMDliRzJjWEVTR1VRUXor?=
 =?utf-8?B?KzdBNEViM2lONVBmakM2U1puaTByRnlsMlIwR0trVDQ5TE9PRTh4UWRKKzFZ?=
 =?utf-8?B?Y2VCL2MydVpPanovejQyVjE4dXVKczc4RXNVWWsvWVdrQzV4ZGp2Ylp6VW1I?=
 =?utf-8?B?Ly91WklhZjAxemFWeEFxUTNuMEhrV0hTdzNFK0EwRG5uUGt5eWFTRENXdEhG?=
 =?utf-8?B?ZG80cklNb0ZEUEdBb1J0bjNrS0FIZFFGUUJSdzRiT0xCdDJNcmVudEUwRmpO?=
 =?utf-8?B?bXJmZUlPK2xRQTBDN0hJd3E4RE1VU3NvVjl4R3NJcTJwNk5PNEJ2M0VWTldW?=
 =?utf-8?B?b1l5b080UVNXZWdEM2NJQlIrR0R0L05KYW5TdS9ydHpKRVFtSXFWb28rRXV4?=
 =?utf-8?B?ZllZeTVNSng0eTlQd0oybm5JeHdQU0h6ZFNicWNkMnYvcVcvQytxRzVlUmUv?=
 =?utf-8?Q?YYZRGsCfbR2Vu4U0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1192603-c5f2-437a-d8cd-08da42db4a2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 07:58:03.5627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DMQRr+WcvH02SU+Fem1T0m37QBojGAxp+moUSycNCel8DnVCsU9xD2JX0qSnr2CvXerslSGVP1E4ZANhlcjgsJSlppIeCEMudFKM8r7c6cw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7037
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIGNsazogcmVuZXNhczogcnpnMmw6IEZpeCByZXNldCBzdGF0dXMgZnVuY3Rpb24NCj4g
DQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIE1heSAzMSwgMjAyMiBhdCA5OjE3IEFNIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gQXMgcGVyIFJa
L0cyTCBIVyhSZXYuMS4xMCkgbWFudWFsLCByZXNldCBtb25pdG9yIHJlZ2lzdGVyIHZhbHVlIDAN
Cj4gPiBtZWFucyByZXNldCBzaWduYWwgaXMgbm90IGFwcGxpZWQgKGRlYXNzZXJ0IHN0YXRlKSBh
bmQgMSBtZWFucyByZXNldA0KPiA+IHNpZ25hbCBpcyBhcHBsaWVkIChhc3NlcnQgc3RhdGUpLg0K
PiA+DQo+ID4gcmVzZXRfY29udHJvbF9zdGF0dXMoKSBleHBlY3RzIGEgcG9zaXRpdmUgdmFsdWUg
aWYgdGhlIHJlc2V0IGxpbmUgaXMNCj4gPiBhc3NlcnRlZC4gQnV0IHJ6ZzJsX2NwZ19zdGF0dXMg
ZnVuY3Rpb24gcmV0dXJucyB6ZXJvIGZvciBhc3NlcnRlZA0KPiA+IHN0YXRlLg0KPiA+DQo+ID4g
VGhpcyBwYXRjaCBmaXhlcyB0aGUgaXNzdWUgYnkgYWRkaW5nIGRvdWJsZSBpbnZlcnRlZCBsb2dp
Yywgc28gdGhhdA0KPiA+IHJlc2V0X2NvbnRyb2xfc3RhdHVzIHJldHVybnMgYSBwb3NpdGl2ZSB2
YWx1ZSBpZiB0aGUgcmVzZXQgbGluZSBpcw0KPiA+IGFzc2VydGVkLg0KPiA+DQo+ID4gRml4ZXM6
IGVmM2M2MTNjY2Q2OCAoImNsazogcmVuZXNhczogQWRkIENQRyBjb3JlIHdyYXBwZXIgZm9yIFJa
L0cyTA0KPiA+IFNvQyIpDQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBUaGlzIGJ1ZyBoYXMgYmVlbiBwcmVzZW50
IHNpbmNlIHY1LjE0LCBhbmQgd2VudCB1bm5vdGljZWQgc28gZmFyLg0KPiBJcyBpdCBPSyBmb3Ig
eW91IHRvIHF1ZXVlIHRoaXMgaW4gcmVuZXNhcy1jbGstZm9yLXY1LjIwLCBvciBkbyB5b3Ugc2Vl
IGENCj4gcmVhc29uIHRvIGZhc3QtdHJhY2sgdGhpcyBmaXggdG8gdjUuMTk/DQoNCnJlbmVzYXMt
Y2xrLWZvci12NS4yMCBzaG91bGQgYmUgZmluZS4gVGhpcyBpc3N1ZSBmb3VuZCB3aGlsZSBhZGRp
bmcgcmVzZXQgc3VwcG9ydA0KZm9yIFZTUEQuIFRoZXJlIGlzIDEgdXNlciBwcmlvciB0byB0aGlz
WzFdDQoNClsxXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNl
L2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYyNMNTc2DQoNCkNoZWVycywNCkJp
anUNCg==
