Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A79951BCB5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 12:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354772AbiEEKFU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 06:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242070AbiEEKFT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 06:05:19 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2097.outbound.protection.outlook.com [40.107.114.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B781B49FB0;
        Thu,  5 May 2022 03:01:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVFegIx4KdkDrRn4z7iGjapL0wIovOVQEeSguIXRn6hOAQ5MedhPbnwssBma+k552AEYOdx6qWbRzfpjOVXhw99oSswdX5rGxZe7J0AzT6prTCEg2l3SAvd6rM9mZ3Yb+Mr69tOJCRDm1bLq5jZOCekbKUKM4ZvRsa0XulJhq6MYNvwnDeisl8+Clt4Eu/7hWsEHb9eT1pA/AMHyT017E94MfomeRkY7HQWbr5MTmj0rOxinmB9STW2MH9lpYs6yuhV8nwazHmD7OpiXtF11nJeKZfGqPb4+S+ZkuL1TNuaZavGK7wVqjUzfr+19F8/btspp1PZ5XvchN0coBpNfPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6ejEhxhTj3ZZnxGFl4bp33ysx9Jbqbmhzfw8ri1ufQ=;
 b=D+cVjEhHGE4SoT+eGWPysZLd2kNRSCF7a5N5vXCAKHISW6kTZQ2Ay8Yq4ohEGU9N+E3ZQRkFn1ldgGyap4NIm21H7XZ+azhqbU19r7OozT1TaVojIed432zAS2hh4y2Poz8rhWlkXElAONYDQKpQN9aOkjuZ+7kuiWk4Fau7B3KkaiBgp1WNzzbf/a8jRkpFbyFY7HEv1oP+wDmkZ83znRtNbVY1rNuPWSTc/x1lLXDGqS2N4H9B4LkvY78kLIqOdi2Z9Mf16bQwaHt3BFrWJSe5/TZlNHEgOpVGFcIikdzpbJz5+qGaCc5twfiVdf5tYNQJV0l2lcWHvdstjHE+jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6ejEhxhTj3ZZnxGFl4bp33ysx9Jbqbmhzfw8ri1ufQ=;
 b=Qw+nI79mm3W/rUk7Lnme3iZK4DBmhotw5o/Et2QVGEkT5btBRfw16m+WTtmcVEM0ppUXORefhdKRfe2zCgr54u0NppnHxDPqbw+1fk3shmWR5SOCrvjUuqgOpH27WzsqIW/qtNuvHEYWXAqM9j6YMu1O7MtGi7TMjy8Gf/Y0waE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB2006.jpnprd01.prod.outlook.com (2603:1096:603:21::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 5 May
 2022 10:01:36 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 10:01:36 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: cpg-mssr: Add a delay after deassert
Thread-Topic: [PATCH] clk: renesas: cpg-mssr: Add a delay after deassert
Thread-Index: AQHYX+bzJzYgcOdHs023qA1K4buvQK0P3WyAgAAvvCA=
Date:   Thu, 5 May 2022 10:01:36 +0000
Message-ID: <OS0PR01MB59224D1908A7DBB08DAF444986C29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220504184406.93788-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUh69grzYVsMwdZLgv=KLy5-_FVjeMWx37qGsqCxz9Y6g@mail.gmail.com>
In-Reply-To: <CAMuHMdUh69grzYVsMwdZLgv=KLy5-_FVjeMWx37qGsqCxz9Y6g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffe94023-4e05-4fe1-1be5-08da2e7e3e0d
x-ms-traffictypediagnostic: OSBPR01MB2006:EE_
x-microsoft-antispam-prvs: <OSBPR01MB200683342D6924C6573D48B486C29@OSBPR01MB2006.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vs+tKpalMTKwlZxPrziSn/JACbr5gu/4Z0wIVpqJHvNfi0Apzjgt4w2F/0MK9Ov/4voHxM5vfagsEvzWgNo3uDN1E4nO3RLENwVBLnSdlLA+Ucf9e5MyQtCjOKEFVtM1beJtt/Ct0EhYZIoVRXvGDQBPRXbzqxwFP8fHw5e8LsjHOP4BSHc/Qc75qU0QFq7anERgz7aRZ8IfTayxNHvtzbIIhfURWM+my0K37bDK0UkdGkYiKrqQt/sxr9/JckpmaEk5hiqYqOoXmxhPbFtLYz7vHW5hsOhq9ZLkYe/ZWrkTp+pMxejUTzYfOfqticsRS2d7FcljRqUVYAjxREiqNIVOztVfZIQQYI23rMx2Se+4CaxuOfvTqTj9kewzCAWlVpuWiq4Mv18QOAYlsK3PIukcRyqCRXvFfj+hUFPjPk3wGk2jv2Bv3YBHKkTcheeYKsSdpHFotVMz7SD3gXmmZQ8aIvvlbNHARZfG++5K0kHscuBMCT1Uhk3phhckye5XE5HNDMVqKKGJvHQqNw3XxvkJtyqWqcritgJlTPbWVMP7i48OxwmWlDG5BiApbmasZxnpfzW5bkdELtozYCB33O50bTXPRMxaucn+30TNZsMqigT8BT8qBUGjo3bdw6s7u4Et+c+CU2WuCcsuQocuT4LGsTGXyeLYYuV4g1k54DUfAU5DIk3fo4C0XmEil+fbocaGHj+z00Pcws6XufAGwg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(55016003)(122000001)(7696005)(107886003)(33656002)(2906002)(83380400001)(71200400001)(66446008)(66556008)(66946007)(8936002)(52536014)(508600001)(38070700005)(38100700002)(64756008)(5660300002)(66476007)(54906003)(6916009)(316002)(76116006)(9686003)(8676002)(26005)(86362001)(4326008)(6506007)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azB6VXp4SnBOMnZrcVdneEk4VFdZWXBrUXQrYnNVQy80M1FGazEvbFQ1MDNz?=
 =?utf-8?B?eTlDemlaQUU3RFUrRmZGTGdIL3RRc1JlNUE5UlNvR2pxbDIvTjlrUTNtYzB5?=
 =?utf-8?B?Z3duRDZKazFrOW92a0dFM2Q3RmZwdVJjRUkwVmIySTR0Qm9SY3hOWC9Jc1BZ?=
 =?utf-8?B?QW9VODJsZWRZMmFiQVVGOVBhREE0aU5naS9sc3kvRkluL0MvY1N0VHFCNTRy?=
 =?utf-8?B?dUJTOWxQVDdkZE9EU1lvNnhSTlA1bWVLdkZCVE5EQUdRMHkwLzJ3L2QwQ0lX?=
 =?utf-8?B?ZXRjaGFTVm5velc1WWh0NHJuazB4Nk1tRGNTWHlaaHhrdzJBdUtPWWVhVnJa?=
 =?utf-8?B?eXFaTzkrVTJ5V3c2ZURPZkVhYUtrV1lhSXVkM2h4OFNWcExUSk9vRzczY2to?=
 =?utf-8?B?b0tyUURuNFQ2b1RYUmkxdndJRnR0YU1HOENPS3k2UGE3c0xSZ2hib05FT1Zi?=
 =?utf-8?B?bmdzOEgrVTVwQjFSSlFrN0t5NjBtTVpuSjhOcjB2cUNqQjJ2VEdGU1d1cW45?=
 =?utf-8?B?WHRhM3orS21adXRvblpFY1R2Rm5pc0FaNHNqRTNhMDNGUUY1c2IxY1VKcXZt?=
 =?utf-8?B?YmlRTUZqWHJrRndSTGFvUXE2emFVaFFHZW1jTElNNDV0bFA3TmJmVlNIQ1ov?=
 =?utf-8?B?THVvbjNjVmZVellEMmRHclcrcmJZVGxEZ1JzcnE4ak12TVZhUmtGZkxUMVcz?=
 =?utf-8?B?djJldHFpRGZoVmIxUzQrY3BmNHF1Yk9xMHdqU2hhcDh2ZDYvSXB3cForVTdZ?=
 =?utf-8?B?ckJEM0l1VFU0RWRzQ0ZDR3lCc1p1Vi8vVWlvZTBzL09oNEFhczlRblRvbFRy?=
 =?utf-8?B?Q0QwMERWbHU0UlVXYVFoR3JLb2plcllXQ0NMeTNTWCtiK1dOYWJuMFFlaVh4?=
 =?utf-8?B?bUlDR3dFbnpuK1I2dnFVK2xSak5xVUZFdkpVRmp3bVFtUkxQa0pRdlp1MnZ2?=
 =?utf-8?B?enBYY3NoLysvdXltcEsrQ1VORzY1NTVVb0RkTjJrNlZMWFdCY2hjMlkzOHMr?=
 =?utf-8?B?WEVNK3dQMWJla29wTVJRSGUwNjNFdWZWVTdQQy96dFpGcllucm4vU3RmcXdI?=
 =?utf-8?B?TEV4OTFkS3QrZ3Jicy9kUUExVmJoZmdPdU1FZjFqVm1oV1lkTlEvdWplZEEw?=
 =?utf-8?B?SU9ZRnJLcEJ1N0JZWHlWSC9zcHhLb0MvU25qU0ZLeFg3cktQNkJST0FzSnl4?=
 =?utf-8?B?bmo4d3piU0QxU3ZXd3U1UGk4dEpxNzJQcU11VS9OWndEUkJ4QTV1dUt5SXRU?=
 =?utf-8?B?MXNSZk9Nb3FoRU1RdElmcG5Ka0xKUW5TVHY3WkZMYXdkd1pWamZlb0J0SzJI?=
 =?utf-8?B?ZktTWkkwSXZnMytOQWkwckphRmhjbXg4U2NDenpKa1VJSUhuZksyLytRZXhk?=
 =?utf-8?B?U3FuNVVVOGhLYUc4MHhmTXQ5VXpsTmVNcW5WM1F1TUU3UFh1cXZNZEdWbnli?=
 =?utf-8?B?L1FtSEE4R1BheVFzbmxmTWRrL0tsdk5GL1ErZlBNdU5wU0h1a3c4WjRiMXUz?=
 =?utf-8?B?N3ZlWjA0dFRkQ2NBY011Y3B5MWxiYTg2bFFaVE1waGdxbDlGRXZWVU9xZnNI?=
 =?utf-8?B?bGhmTUdzWlhGbnBmRnFTNGV1V1ozUWMrblFScVhrRHpHQXZ3Y1ZaSVR0UkRM?=
 =?utf-8?B?U3pDM1NMSk5XWThrcXB2cDBBb1dadlA5dytiR0dHOGFTRkV5SzVVWUdpWlZi?=
 =?utf-8?B?UGlSOXpySWZDenhTSER5a2t1QUp6MzVZZm51N3F0d0FDTlFjRThHTXVTZlJ1?=
 =?utf-8?B?MWpTMm1KNWZFaW9ab3JYc2FraW80dmpKNkNieXMxb0hwQ245RmIyTEQzQVVw?=
 =?utf-8?B?dDVOVTZVczcrMFo5bFh5UWI3RmxHQVBZeGVoQkNCVTQxcjhBdzIzQ0dkQzR3?=
 =?utf-8?B?dE1YeENObjArYVBOWVFEM2hkenhqclVnSXlVTDlqRUhsNFBKMnZteUZqQkph?=
 =?utf-8?B?TnhycXJTMDFJb2dTTVFBeGpxamJpK203ZlBYZW8vaGhtY2d6b2NwUEFaNVJE?=
 =?utf-8?B?YlFXaThIUXFiaHptMlM2UmZXTG0relMzQTlVV2RNWUllWjBoNjdzZ1VXN2NT?=
 =?utf-8?B?ODlrOVBYZldLMGwzUUIzMlNDY3FMZVp0YjF1OWUvd1hWVmRISnB5SUY5ZnNX?=
 =?utf-8?B?c3U5Q3ZXSFdrZG9pZndGZzJEMW4vb0E2MFRiOXh6bDlzZE41LzhmZUZIanRF?=
 =?utf-8?B?Y05BSXFZWnpVMHJyaEhGV2xGeWFRVlVGQVRTRFN0Nm1aNUNYQlhSdXFkSVlp?=
 =?utf-8?B?UFl4OTlEakdhd1ZxT1BXOGtJdG5zV2JnUTJjLytVS3pZQkZNc0dLelRjSEtz?=
 =?utf-8?B?Yzk0QW5KZTFPVGJTaGppV3dKdlZWOWVud2dmVmdVak1Ga0FBZzB5T2Ztbmh4?=
 =?utf-8?Q?X6u/XhYNDsMN/1NE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe94023-4e05-4fe1-1be5-08da2e7e3e0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 10:01:36.7837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sqMTVBD9BzwLXBwR+FNzTmBodJSo6iy13yOF/wO6dJ9Z59OTxdaLQkEAvG5sCiwHayjM91zjxd7h4kS751h2bKFR4QAbzNg5FadRfSCLtCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2006
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
UEFUQ0hdIGNsazogcmVuZXNhczogY3BnLW1zc3I6IEFkZCBhIGRlbGF5IGFmdGVyIGRlYXNzZXJ0
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBNYXkgNCwgMjAyMiBhdCA4OjQ0IFBNIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWZ0ZXIgYWRk
aW5nIHJlc2V0IHN1cHBvcnQgdG8gdnNwLCBpdCBuZWVkcyBhIGRlbGF5IG9mIDMyIG1pY3Jvc2Vj
b25kcw0KPiA+IGFmdGVyIHJlc2V0IG9wZXJhdGlvbiwgb3RoZXJ3aXNlIHN5c3RlbSBoYW5ncyhk
dWUgdG8gcmVnaXN0ZXINCj4gcmVhZC93cml0ZSkuDQo+ID4gVGhpcyBwYXRjaCBmaXhlcyB0aGUg
c3lzdGVtIGhhbmcgaXNzdWUgYnkgYWRkaW5nIGRlbGF5IGFmdGVyIGRlYXNzZXJ0DQo+ID4gb3Bl
cmF0aW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiBBZnRl
ciBhZGRpbmcgcmVzZXQvZGVhc3NlcnQgc3VwcG9ydCBmb3IgdnNwIGJhc2VkIG9uIFsxXSwgUlov
RzFOIGJvYXJkDQo+ID4gaGFuZ3MuIE9uIGRlYnVnZ2luZyBpdCBmb3VuZCB0aGF0IGl0IG5lZWRz
IGEgZGVsYXkgb2YgMzUgbWljcm9zZWNvbmRzDQo+ID4gYWZ0ZXIgZGVhc3NlcmludCByZXNldC4g
V3Rob3V0IGRlbGF5IGlmIHRoZXJlIGlzIGFueSByZWdpc3Rlcg0KPiA+IHJlYWQvd3JpdGUgd2ls
bCBsZWFkIHRvIGhhbmcuDQo+ID4NCj4gPiBUaGlzIDM1IG1pY3Jvc2Vjb25kcyB2YWx1ZSBpcyAg
cGlja2VkIGZyb20gdGhlIHJlc2V0KCkuDQo+IA0KPiBUaGUgMzUgwrVzIGNvbWVzIGZyb20gdGhl
IEhhcmR3YXJlIFVzZXIncyBNYW51YWw6IHRoZXJlIHNob3VsZCBiZSBhdCBsZWFzdCAxDQo+IFJD
TEsgY3ljbGUgX2luIGJldHdlZW5fIGFzc2VydGluZyBhbmQgZGVhc3NlcnRpbmcgcmVzZXQuDQo+
IFRoZSBtYW51YWwgZG9lc24ndCBzYXkgYW55dGhpbmcgYWJvdXQgZGVsYXlzIF9hZnRlcl8gZGVh
c3NlcnRpbmcgcmVzZXQuDQo+IA0KPiBDb3VsZCBpdCBiZSB0aGF0IHRoZSBWU1AxIGRyaXZlciBp
cyBhY3R1YWxseSBkZWFzc2VydGluZyByZXNldCB0b28gZWFybHk/DQoNCk15IHRlc3QgcmVzdWx0
cyBvbiBSWi9HMU4gc2hvd3MsIGl0IG5lZWRzIDM1IG1pY3JvIHNlY29uZHMgYWZ0ZXIgZGVhc3Nl
cnRpbmcgcmVzZXQuDQoNCkxvZ3Mgd2l0aCBqdXN0IGFkZGluZyBkZWxheSBpbiBhc3NlcnQoKQ0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpbICAgIDEuOTM4OTkxXSByZW5l
c2FzLWNwZy1tc3NyIGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGRlYXNzZXJ0IDEzMQ0KWyAg
ICAxLjk0NTM3M10gcmVuZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9jay1jb250cm9sbGVyOiBh
c3NlcnQgMTMxDQpbICAgIDEuOTU2NDQ1XSByZW5lc2FzLWNwZy1tc3NyIGU2MTUwMDAwLmNsb2Nr
LWNvbnRyb2xsZXI6IGRlYXNzZXJ0IDEzMQ0KDQpJdCBoYW5ncyBhZnRlciB0aGlzLiBBZnRlciB0
aGlzLCB0aGVyZSBpcyBhIHJlYWQgcmVnaXN0ZXIgY2FsbCB3aGljaCBoYW5ncyB0aGUgc3lzdGVt
Lg0KDQpMb29rcyBsaWtlIGFmdGVyIGRlYXNzZXJ0LCBpdCBuZWVkcyBzb21lIGRlbGF5IGZvciBh
Y2Nlc3NpbmcgcmVnaXN0cmVzLg0KDQpMb2dzIHdpdGgganVzdCBhZGRpbmcgZGVsYXkgaW4gZGVh
c3NlcnQoKQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpbICAgMTIuNTM2
Mjk4XSByZW5lc2FzLWNwZy1tc3NyIGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGRlYXNzZXJ0
IDEzMQ0KWyAgIDEyLjU2MzU3N10gcmVuZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9jay1jb250
cm9sbGVyOiBhc3NlcnQgMTMxDQpbICAgMTIuNTcxNjMwXSByZW5lc2FzLWNwZy1tc3NyIGU2MTUw
MDAwLmNsb2NrLWNvbnRyb2xsZXI6IGRlYXNzZXJ0IDEzMQ0KWyAgIDEyLjU3ODQxMl0gcmVuZXNh
cy1jcGctbXNzciBlNjE1MDAwMC5jbG9jay1jb250cm9sbGVyOiBhc3NlcnQgMTMxDQpbICAgMTIu
NTg0NzAyXSByZW5lc2FzLWNwZy1tc3NyIGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGRlYXNz
ZXJ0IDEzMQ0KWyAgIDEyLjYwOTg3NV0gcmVuZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9jay1j
b250cm9sbGVyOiBhc3NlcnQgMTMxDQpbICAgMTIuNjE4NjY2XSByZW5lc2FzLWNwZy1tc3NyIGU2
MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGRlYXNzZXJ0IDEzMQ0KWyAgIDEyLjYzMTczNl0gcmVu
ZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9jay1jb250cm9sbGVyOiBhc3NlcnQgMTMxDQpbICAg
MTIuNjc5MjQwXSByZW5lc2FzLWNwZy1tc3NyIGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGRl
YXNzZXJ0IDEyOA0KWyAgIDEyLjY4OTcxMl0gcmVuZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9j
ay1jb250cm9sbGVyOiBhc3NlcnQgMTI4DQpbICAgMTIuNjk3MjQ5XSByZW5lc2FzLWNwZy1tc3Ny
IGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGRlYXNzZXJ0IDEyOA0KWyAgIDEyLjcxMjc5Nl0g
cmVuZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9jay1jb250cm9sbGVyOiBhc3NlcnQgMTI4DQpb
ICAgMTIuNzU1MTkxXSByZW5lc2FzLWNwZy1tc3NyIGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6
IGRlYXNzZXJ0IDEyNw0KWyAgIDEyLjc2MjM4OV0gcmVuZXNhcy1jcGctbXNzciBlNjE1MDAwMC5j
bG9jay1jb250cm9sbGVyOiBhc3NlcnQgMTI3DQpbICAgMTIuNzc1ODgyXSByZW5lc2FzLWNwZy1t
c3NyIGU2MTUwMDAwLmNsb2NrLWNvbnRyb2xsZXI6IGRlYXNzZXJ0IDEyNw0KWyAgIDEyLjc5MTMy
OV0gcmVuZXNhcy1jcGctbXNzciBlNjE1MDAwMC5jbG9jay1jb250cm9sbGVyOiBhc3NlcnQgMTI3
DQoNCkl0IHdvcmtzIE9rLg0KDQoNCg0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2Fz
L3JlbmVzYXMtY3BnLW1zc3IuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcmVuZXNh
cy1jcGctbXNzci5jDQo+ID4gQEAgLTYzNyw2ICs2MzcsNyBAQCBzdGF0aWMgaW50IGNwZ19tc3Ny
X2Fzc2VydChzdHJ1Y3QNCj4gcmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2LCB1bnNpZ25lZCBs
b25nIGlkKQ0KPiA+ICAgICAgICAgZGV2X2RiZyhwcml2LT5kZXYsICJhc3NlcnQgJXUlMDJ1XG4i
LCByZWcsIGJpdCk7DQo+ID4NCj4gPiAgICAgICAgIHdyaXRlbChiaXRtYXNrLCBwcml2LT5iYXNl
ICsgcHJpdi0+cmVzZXRfcmVnc1tyZWddKTsNCj4gPiArDQo+IA0KPiBVbnJlbGF0ZWQgY2hhbmdl
Lg0KDQpPb3BzLCBBZGRlZCBhIGRlYnVnIG1lc3NhZ2UgdGhlcmUuIFdpbGwgdGFrZSBvdXQgdGhp
cy4NCg0KQ2hlZXJzLA0KQmlqdQ0KPiANCj4gPiAgICAgICAgIHJldHVybiAwOw0KPiA+ICB9DQo+
ID4NCj4gPiBAQCAtNjUxLDYgKzY1MiwxMCBAQCBzdGF0aWMgaW50IGNwZ19tc3NyX2RlYXNzZXJ0
KHN0cnVjdA0KPiByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsDQo+ID4gICAgICAgICBkZXZf
ZGJnKHByaXYtPmRldiwgImRlYXNzZXJ0ICV1JTAydVxuIiwgcmVnLCBiaXQpOw0KPiA+DQo+ID4g
ICAgICAgICB3cml0ZWwoYml0bWFzaywgcHJpdi0+YmFzZSArIHByaXYtPnJlc2V0X2NsZWFyX3Jl
Z3NbcmVnXSk7DQo+ID4gKw0KPiA+ICsgICAgICAgLyogV2FpdCBmb3IgYXQgbGVhc3Qgb25lIGN5
Y2xlIG9mIHRoZSBSQ0xLIGNsb2NrIChAIGNhLiAzMiBrSHopDQo+ICovDQo+ID4gKyAgICAgICB1
ZGVsYXkoMzUpOw0KPiA+ICsNCj4gPiAgICAgICAgIHJldHVybiAwOw0KPiA+ICB9DQo+IA0KPiBH
cntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+
IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwg
Y29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNr
ZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInBy
b2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
