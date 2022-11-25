Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCEA6385E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Nov 2022 10:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiKYJHx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Nov 2022 04:07:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiKYJHr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 04:07:47 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48532D2F3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Nov 2022 01:07:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=As2KfOtkRKBrULPGBRdPBoz4y2AQIlyMvC8JWFBFIsn0dQdeYAnHnZHE9/3RZg/4YVcnYZ4IATHfSc7rSIyvvyjuaVzrWw7+UPf9wXQQDWbPpOp4TwgKk8XQMQ5Apid5AeSkPWakOlq7M4P6h9NdfBTHzVaHet/y+bUY0V0hJbsxoYprMOnY+7CQqqOaXl/mSUHOFxV0IK+6JyyLOBOoDbRK8Q+SXHynbniJCt9gFAV5P8eiXgQPSRYW0FRNZDKk7NJbRzr+KQ5Wn+URw4/c4J6Ve+CXXQhCRTinD0nKQ48EMYzrVsX+Mak93j5jlaAyhEUad/RT4cvTCd2db8Vtcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25Gs8O26C0H2D4KsqnvUFLBWh0rlDpiDhPZiKPktIxI=;
 b=OnBdJzBGd1Kf9USJ6w+orEvvId+lBe5DV3B9ql/rh+83OTLP7L1vd0G2Jvi7V0GM1RpPfFG2WkAYFDnR0JFo2rkxU91ePE2qXfIGBDusImebB0KjePVAxvTUvjVqo5YegnW8/4yr0A1bKAz+lbB4HLjlTMR2RRe/VEHuPFD/o3H7oiafQo2cZX2gqKs2wlcRafiHfZMNMZeFuUXzF6BzbbVHUglu0I4Jfru4AcGt0Z6nKbHfAPviWvGLgreEo7G/UrWu7ol9v8Xca1us502rAQ3CeDmm3S3d5SORACIIq/6pY6cR9TfJV/OwSy91NfFLnpDHgI4hAXlElytU4bJsEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25Gs8O26C0H2D4KsqnvUFLBWh0rlDpiDhPZiKPktIxI=;
 b=L7UQ6Y/w20JyRaXL8Vfh5a7CuuIIR48Dsewm89CuDuvghVjVGl6FL+OVbAPSmb7RGteiZbtPY+JdL+FW7fde5wMjfph+CW1U+xRhic4jU9WZcyhucfu/SzYtAiDIEtRgtdnrw6no3bdqP42JmuRpVgN2wQl20EvfLNjZzH4XwJc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9708.jpnprd01.prod.outlook.com (2603:1096:400:232::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 09:07:43 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 09:07:43 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Regarding clock event driver testing
Thread-Topic: Regarding clock event driver testing
Thread-Index: AdkArJrKvDyZvzK5SrWcU5XSVDoKPQ==
Date:   Fri, 25 Nov 2022 09:07:43 +0000
Message-ID: <OS0PR01MB5922C23B892D938AD1675C9C860E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9708:EE_
x-ms-office365-filtering-correlation-id: a98a7c08-21ef-4dd6-86d4-08dacec48341
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VesExcsEXI87mgzMWiP9SFE80drR4RjMrpW/iwdnDGX2swoMDrt3kEjP0OFwWYOjDKPxSFOEtvBt7WcpwHLXvKO/ONlKhAUVb5BRWPsDYhDlC9q9IwQ6t5JT43hDkYR+/K3qaKjlCRQG8y/03n5GV1abMdYkmBEf6zmPZnOQAvOsAnhnCE87+FblwUT4TgNXOA7qFZlz7FJg9BL4SWmUZ2r7D3fiMVzSERr3hxk5ezu0ZEqCsoCCLEWP12JIMwYGNl9Fd8bGCUtn7GtxQQ73fxG/DrQSydBNm6TT9W5t7PZNaImobXymfvO7eCdJEHgPcFYKPsLdUwp0bx8O1sC0ST2XIEmiTdDQzyDNoAWI1B9c/x+k+Yl2qBvNEv36vKNtQUcvfz+290Bk3DjjUXvID9v18VmSluCDJaCtJZ9ay2jGqd2q2HZwLvC1oxV3terNZjgtAO+v/kTDKX5RpzsMeMwE05OuTGmKLWLv52Sp6sHKajukC5SMRYYMFJQc8zpuZrv8lKr+VdMCLkvb0QQGyuTSN7lc+CuEXspRZNB6mWsViJ8+usPzzgczqb4/9TDd3ABJ1+I47nYzh5gKfnMyedkHni5z8UP8D0FB5T5Ps0CUkV3ZVfFQXTq9yEE9KKEkbPAoFNMz/nS9EytpCTEL7Nv5jOAikYPJ0o/24bvTiPe66LneJmIqbr84X/s4sjuSABZctPzBYvg3Xz3FiHncStI1v9JieZanze3KsBADsEM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199015)(52536014)(8936002)(4744005)(4326008)(8676002)(66946007)(66476007)(64756008)(76116006)(66556008)(66446008)(2906002)(41300700001)(5660300002)(71200400001)(966005)(7696005)(6506007)(54906003)(38100700002)(122000001)(316002)(9686003)(26005)(478600001)(33656002)(186003)(83380400001)(55016003)(38070700005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zlmxY5t1+3CvEmH4OZawzHLptellvZSI3O2qMPf9t/8m+DJlD6jSaps2Wc29?=
 =?us-ascii?Q?unYab+tQ4NGcOo9+4GzMcZQoHndKZZxckhFcB2jiYT1sreQr7kG/DBgDoGtd?=
 =?us-ascii?Q?lPiaXWjzcOPESRs3Jg9LKziDJq0JO+FUm3As0JZ09iQV78E7fRj9YreiTE1n?=
 =?us-ascii?Q?xI/qInJVICbskuoKjsNJDVWDRAilgld18dYK5WykB0GbN+tkouv6YdqB9t4k?=
 =?us-ascii?Q?0ppdfQ/7EeHDSOPcY8f0qzrDeyhbDZQ/QA1bZs9Ai1xaBL1at2lZxxTJw2Wt?=
 =?us-ascii?Q?u7uzV1l/Ugb0fFgxFu1VRSiXAd0FeKzxHONo9MFN3yhgZYfpgfhST5ZHATob?=
 =?us-ascii?Q?cSk5LK/VtDv6KvmahMCPLMUAlNly9bMGCIZdR1jgRBlzH3trIwNo1ie+0Fet?=
 =?us-ascii?Q?8p0DrupnL/AcwugaiPtMllfgVM9VD99H1iyLuoBEFa8UJUgYeAXB+bu/0NKY?=
 =?us-ascii?Q?oUcqfH/HAh/DnBxpqMp10eTrZEUT7BU3LIX74dEIBC1PMI//JgD6BdUvKzvx?=
 =?us-ascii?Q?dtVrpa5TV3WN7ZU/KjcxHeNk/x9y/r7HZW9Hhj+c9CSuShEyRw3R+j0i0d0s?=
 =?us-ascii?Q?6/2MFN/lAGe9ZvSPSw8m0exTAFN0xQfCA80+OD3X+rLmGIXk/Qf23mR0mdy1?=
 =?us-ascii?Q?ALkMwiGqEG2g061h5rH+k9NoKi2OeLrFtv63LnjJuSYfFw9qedniLHSUVguP?=
 =?us-ascii?Q?5L6EdttEVaHxekcN6pocN894rSocWkJlZRvE/hiLtJ9SiR2CqYfaAwaIogYf?=
 =?us-ascii?Q?pzXPzmECmoczGmG26O4FvGnA4qCcJFeTeoDOcB3tGyC/hr/PWKyfjQjMrvHz?=
 =?us-ascii?Q?aBrvA8VwP9DCr4R6ZgBOIkLCLZorHaTMSfeimJKb8FUHsdXWKrh9ZHf8a5xb?=
 =?us-ascii?Q?UihkBN6vSFKgBT6xLTXFOron+n1LvP4Fy+d6IvCMbAfHSl0txR1hm/V2SiFV?=
 =?us-ascii?Q?ZdYaCAoRG3vEXBfRuVqPF+27XtXAro7Apy2sj+gCzrLH/Cn+HnYpABKmAFCo?=
 =?us-ascii?Q?/7y24qfVPQZarWuo15YM+4xOO1Y+jIituF8iQd+OIl4IR6ctgqgZ90seqMEt?=
 =?us-ascii?Q?IC7u42Ywv0AA++coLbPbpJ1gLgWJS8ADOPs54zuUnBQYB7Z9HI90ZCMdX2y2?=
 =?us-ascii?Q?OUaPx9gi96UdradAGFzcIT0D7H4GdRnUpb105cIcMMk6kwxYQzDnKYqk9tK2?=
 =?us-ascii?Q?voFwkKKmGMmFO20D/KwBNyZrrw5vrPfHRBWLrO61aSX03FbJKS0D0jtopgdi?=
 =?us-ascii?Q?8WVHG7SIWUmEDeGGvQTa9ki0baoGekQGOOiLyMwBwuIPMiL7tO3OPWZrJQhS?=
 =?us-ascii?Q?kfNfyD3in/TacxeRCgUzHGBopusbITrDGHoY3ngspXLeRsOsgVKKSEPO2p4/?=
 =?us-ascii?Q?twTLFKdsKX1J0hXWZ2k5gw8+8NMthnE6m1iljkUuiNE5ZGJDdiSxXAbXVZyv?=
 =?us-ascii?Q?Y6pF0J2ext46kJzI/AoEfT/q5Dl0jpOzLRGJUvHYLJ0xcssVZJdvAPopECyC?=
 =?us-ascii?Q?p5mMzm2j4jkNdlZxllsBwpN4rbFIPX20zC3c6P5tnHQwqy7VY5WwwcBGnw+S?=
 =?us-ascii?Q?ip8vCYWamaAA9LeFlJla01Ddt/2QA4DJBD6y0gsbdD5biqCSaKBkmff+WaJh?=
 =?us-ascii?Q?sw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98a7c08-21ef-4dd6-86d4-08dacec48341
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2022 09:07:43.7055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B0nj3bmqmfF3wGehAqpOth8jRXSMWXsXIE8l4fLk9dCXwUqlxs2c45QSb99BKZdZb1PJ69HAWzYbx6oZJMo6BjCIDuSSjOa2ZqpQ0T4dZH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9708
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On RZ/V2M, we have 16 timer channels. First channel we planned to use it as=
 clock source
And remaining 15 channels as clock event devices. I used clocksource-switch=
 to verify
Clocksource functionality. But currently I do not know how to test the cloc=
k event?

HW wise, using devmem2, I have programmed clock event channels and verified=
 it triggering IRQ's
At regular interval.

Looks like for CMT/TMU you have upstreamed clock event devices.

Can you please share your test setup details so that I can do the similar t=
esting for
RZ/V2M TIM devices.

HW manual for IP is located at
https://www.renesas.com/in/en/document/mah/rzv2m-users-manual-hardware?lang=
uage=3Den

Cheers,
Biju
