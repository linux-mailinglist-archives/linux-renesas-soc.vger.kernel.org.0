Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3F2562EA8A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 01:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234928AbiKRAtK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Nov 2022 19:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233894AbiKRAtI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Nov 2022 19:49:08 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2109.outbound.protection.outlook.com [40.107.114.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821B074CCF;
        Thu, 17 Nov 2022 16:49:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRPLRVLDATlwlbzSjikCcuVrKPrEF6mk3sYvoN+ScR+UCYMVshxFqRklZTzCRdDgdonAIh1pmOpdCluzcoC0hT1ryKO89ajQTuDWTr3m63Ubal33bexz3Q9pk5yescI+SnBc3n4A2SNFnmwLIs/7B4IOQhhtKAGNl5zJ4SMrtuveS1HT5/+glRfX3q269TihzEBVGvs6lo3NZy+l4yfwBezxiFQKrP5PtpQ0GE7IjzkxDfzUwH3EHnXo1KQhMWiSBQH/PdtuY7ZpHHfvKw+AsrrAl8vQCJwJczE5HPPbyFQtccMbJkARMBTrcjqUS+cjCTOrFu1Qs+emRJ9hNDUkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LnV/tpCO6Td+N+B5LdDyvoXgb5x1bCrpcJ/Obp3VXI=;
 b=iOyWXEJswg8uYCqPO9MQvP1mE1BN/dYQI7vawiFSKd3RBBB4XXplQO1PCLb38EIyqxLk7cLq6yG+ISPhk9twNL35s8hoa9OUKvJ90Oab+JmGbCPVwYDCVyeRm9voabPL2cFTga4oKDns7YtjZ61LbxSOcwch2bOke0FKPWKeq9gUyMEnRYzroXX5zywp+btdAmSSKvQXCOc7d5J8iTRe9Y/y4IpyJlt4TFOiQlWutmQXDm8tbOSA6zkDhfVh6pdyT0qITkRINnwlfooUWoR+WbvCzZzrXkRB61ox4Fl0x7K9la3B96LYjt1omVwc2B6/oG+Sc+XKQbLasmHJX2pT2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LnV/tpCO6Td+N+B5LdDyvoXgb5x1bCrpcJ/Obp3VXI=;
 b=bUUVRnLpI1Z3byA8kqJDey5KSfxBieLhyLL/oeiOl+UdwT5oxFe/MfFFDcvGVgoqual/MfxATmGkjtJAIELTT3sQQu4dnMm/8TzspnPgGmO8EAOWHAFrH4Tj44u9N5rWBFRdamp4bRQpmZJa4UtECcC8Qh/9aV7bJtu3hXNuI84=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB10281.jpnprd01.prod.outlook.com
 (2603:1096:604:1e0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Fri, 18 Nov
 2022 00:49:05 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d%8]) with mapi id 15.20.5813.019; Fri, 18 Nov 2022
 00:49:05 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Duy Nguyen <duy.nguyen.rh@renesas.com>
Subject: RE: [PATCH RFC 0/6] mmc: renesas_sdhi: add support for DMA end irqs
Thread-Topic: [PATCH RFC 0/6] mmc: renesas_sdhi: add support for DMA end irqs
Thread-Index: AQHY2baNLTBGCWF8oUGRm9kCTo+XR64fC/4AgA0fLgCAAUxyAIAAN7yAgBZrLMA=
Date:   Fri, 18 Nov 2022 00:49:05 +0000
Message-ID: <TYBPR01MB5341615451524AA587210447D8099@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20221006190452.5316-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqA1RtcaGMCQgDsKKju4izHWJRAD12SqqirNm+TWLt_hA@mail.gmail.com>
 <Y2LBiOqomYJ2E/Gd@shikoro>
 <CAPDyKFr1UR3QX4X45TmShADDpOEuxnadcvyTGaXLhcxKrAxbow@mail.gmail.com>
 <Y2QHKcgNOTA8d6aV@shikoro>
In-Reply-To: <Y2QHKcgNOTA8d6aV@shikoro>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS3PR01MB10281:EE_
x-ms-office365-filtering-correlation-id: 95d36b27-e24c-47b9-bab6-08dac8feb1c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LSCwa/YPAU7x3XB2gtGpHI8teHq9Y/2UQFyiy0BduPlDdwDmhq6maT+/36oaaRLQVsJ9vf1TUQRzYgfmdhAq4ZnrheQ29qK70Bh7AgqUFTa9992knDd1J3idueQ+RdZRX2PxEWEXSmKDDYgdxfcyPNx5tmZrHtjAKjSoK0LlnMOLkQ6CZ12cyXam9rjKK4kHtItv8kiaDZ/dhks8li3fDkCa8ML3JVnT+zBmYyUnJ1HALub4FwJmIex9wAZq1PTicCAIa/cGqaVGCb7KCILjBmQ8mhZfnMlPj+sPcdkJ5tKEOrTB1ZDIO6E3FRQB6CVbauAtDGOawtF9SAWVYB5EdpcmJ9VTQRq2dB1sWb4vTt7o5kWxwym6jKdqFztbsD8qfZaxvMArIwM9a8Arh51awR+RV6Q3sDM7tXpKUnw+Wz41uLglUBq0J4vF39oXifbg0eyqOKCTVnQ8dbOuwASsM3akGAhVj3/WMavPbZnNK99/PbWhNWD16H8AkwSYzsIrpBUWpSWdLmsA4xS5Du2GQsNvitKMyytc2SewkiMqjwU9Qwkb+CPivn2JO2H/NeH5gM0sJj4AI3VtLW6Sriw7i5n5bCNf+3/sDuaudW1beIyQYkYT4gM3pbIgD3rmQAW2HIEwAly7nZoanSCfxsCqNDQHnrYgxhyjcaa4UVm2906U3Un9zjfEjY0cUHPHqYz8kYO8uSO74AKtJXJKEI+/wQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199015)(6506007)(7696005)(110136005)(54906003)(4744005)(33656002)(26005)(316002)(41300700001)(66556008)(66446008)(76116006)(9686003)(66946007)(5660300002)(8936002)(52536014)(186003)(4326008)(122000001)(38070700005)(38100700002)(55016003)(2906002)(86362001)(66476007)(64756008)(8676002)(107886003)(478600001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pHWPals5LWgdiCDqClfTFEcarzrf70KJp/0j43jXqf6hcf+ioG3IuY+mSfTb?=
 =?us-ascii?Q?m97kAoqhqyxKJuXoJSbWVgFEovIr/4Kf4COjqy0DyBAR0du8i94PGA89hRmz?=
 =?us-ascii?Q?BdSBT25AzSqua+nPBWcMZQVli8uJTWB/IKHNeT9IfEPZsfN05Hhj/8vvxUt2?=
 =?us-ascii?Q?czmLJeApuY6TcFuwbO8Dp28uzcx11pj1Yuyg4VlawV/yNacfTHYrLF6JpVs2?=
 =?us-ascii?Q?o1RllcqOkoGmXoVSR0Q0Ay5rfdSNHBKRto4zTTAjdg73r3ljRKIT4paljr7u?=
 =?us-ascii?Q?oo3I5R8eJYnvFuy69VzsrxAeGsNltPXuXTJXem8Pi6z0pMIhM0ffP5jZ/GyO?=
 =?us-ascii?Q?PypXt8WWrgg52bL5g1XhzgzURKhO9GqY4yzyiRZXxqRGv30olLUndpyLSdgu?=
 =?us-ascii?Q?upg9UFw84e4PuvPGSaxiI5wbfaFr1jHZ3zaR4LL46Wlp36GcAou+MQedzGF5?=
 =?us-ascii?Q?6MXHPsbbQAPRRPp1XYakILrEyaKeG4qQQbDU5PEDlrSmk+dQWquCWUpfKgsb?=
 =?us-ascii?Q?JW1d1PXmb7b3KvIa+S2ZeKrjT+liuKiVC4zq57rtv0GZjH3buE9ViRs1HXXY?=
 =?us-ascii?Q?kCKv5QpL7n/SZG/SskoscPebsVaerrHzZKEhAymx2StSjPMKU6Pc9s66A2x9?=
 =?us-ascii?Q?xHhAtVeAor3LqqbZFu91d/DAdId1SsVsGo4+eJPjOKVzKLH3CqdC+hO54Qi6?=
 =?us-ascii?Q?zSOnpV9LYtxryAvD4q4Nkmor6QzvomECdOse54UpvBJs2sxJ7fOlsbaaT1Va?=
 =?us-ascii?Q?sB1ACRYIXzkmPtqDlK07EJfZcL5CP32FnLG0NNsx4LaOE/jCrOInVLZGh3Ix?=
 =?us-ascii?Q?Ew4tR2CWWs/GbqMWCcRZ/T7FrTxjUNJfDb4mqOgpCDft+EuWwZ7cb7dYf74A?=
 =?us-ascii?Q?WVnj7bDdnhwZVKxlxMVvPQWXR+JygsVIXzRmrqR1ZKcgR7uWS+YMZDOBAYiJ?=
 =?us-ascii?Q?bFNjhV2OX+I19BS5Hw6mufF9c0OTc+xIQ9Uc6IRQl7SgE5Paku7xYEjtiywS?=
 =?us-ascii?Q?lXsodb826QGkpEfflPmtFtHXlB4Uiz+pZX6xXqy3vpXQmPrKRHVPI8jDJLt2?=
 =?us-ascii?Q?NUcCj909DKRibOKsfywCxsh44U788f7SsY1OxUTD4uc/5T+BZiVBT3HMM/RT?=
 =?us-ascii?Q?Fsu2eIDHAYWAmWYJmBJU40ZhX8LWT9rDZzi/DPyUsF4eabLdumo3I/9Wo63K?=
 =?us-ascii?Q?q2e5vYhDq5qusC/PmbCA5aWod7655xLfGpPFvW1t2JSu4vi/yQUE5EXy5UIb?=
 =?us-ascii?Q?3kXJke77F53DDSa0a3IgfjDqUnmJGbM660dKRTGCkeqyAmBNCnpejd+9Bg3O?=
 =?us-ascii?Q?BNQGTtIpeEhaZx/BW6cBVjTc+RmZHvQhPJiVSO4sSoptgHkehEjpex7v9Mar?=
 =?us-ascii?Q?EjTOULnnOJ1or/by540SI2RRdPmoNh5Y5XNB90wgT0RkWy914IGJY2hdg5BH?=
 =?us-ascii?Q?Crjl7UJYY0IDSVxU2iJ4flhZvvgXSwxiuIG6fBG1YEKapnCYMErYrDeCsZ2f?=
 =?us-ascii?Q?FMtK4807Xh/OlIuimYIvMbhc9Jh1A7kTf54vUF6oChhBw+ht0/2vDlr5ndOe?=
 =?us-ascii?Q?Ay9KIpoPdPrtx2EmIXq/E2sSKG28sp42MesQcdleJv6cWmhJ44xPRXZyFzMB?=
 =?us-ascii?Q?Ng=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d36b27-e24c-47b9-bab6-08dac8feb1c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 00:49:05.5586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cMyZxdEBLL2RNRNyWeqm1e72vQZVz1TPqd6eWbO2/mq8p4hC1Q6IcelXUom091mWfW9JBF8cEs5BgTtSiIr9+VYxkgLgXSNHZUR7u3GuUxMXpXup4oy1MT2ZTzKYmODg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10281
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, November 4, 2022 3:24 AM
>=20
> > Do you intend to send a new version to drop the RFC? Or can I apply as =
is?
>=20
> It should have actually been named RFT. I'd like the BSP team to test it
> if they have time. I will ping them.

I'm sorry for delayed the response.
Our test team tested this patch series on R-Car E3 board and they didn't ob=
serve
any regression. So,

Tested-by: Duy Nguyen <duy.nguyen.rh@renesas.com>

And, I tested this on R-Car H3 board. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> Thanks, Ulf!

