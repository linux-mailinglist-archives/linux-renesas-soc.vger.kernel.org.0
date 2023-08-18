Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE02780C9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Aug 2023 15:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352317AbjHRNhL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Aug 2023 09:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377200AbjHRNgi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 09:36:38 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2129.outbound.protection.outlook.com [40.107.113.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40C430F5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2023 06:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipJ5l86AIC75A6FyCd/cvMNNqN7qBcYFeuTZuLQ8HH+3/QL/BU64Rvw7uyS7IrTOBrrmAlZGymbeGeMqW+clrDlNh7x7HQtC3aol5ftJP4qgPzsqgxnr0BaOBl+BBmDli8VaNUoH2r4kMKEutkbATLqgCZ8AZwVMH/dpzl6mhvt6X6OuSn0NXwiEym5X1t8ug60k7VFSSEGb9sP9cgTtGuVt3GoWpEK/tdGKWhv4Eq72NkTo5hSlB2msqpWPDeOTvDCgcrt1Iykynr8zqorDGTFpQrf5iI6PglobIWteULqc+kayMHFt4d7DdnSNWbgU+x8jsAcwXm1Mkgz4EUzijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRLthY0mbN7BlBpvqkpyMmJ6hXouuevFDhB85pE49XA=;
 b=QHBeqR3qkhmF518cBzbBquIUJTWEt2N0FLIVMVeHpPAawCnoqzxgbnjnvyjAn/axEKcYp/nHA6x0d94751xctTJw7s/bG5EzeAri73vTxhT7sojSyw2063Qm/aC/O6j2znk8o8QYRlhkXFT8G5mhK5THUgykrQZgxX4EOSGHlEAv4PAWNKqJpm6nEOCDxZrqBN1g2GSglKxCN6WCQZxgg39IRlLkAo4pUHDsPk4W9NIiLemuoi3io4D1JqV8hrymLPUi1S2bXDhTcsLe8mpIBSN/ze9uB3KIxpCE3MoaLxySkDnx2AtvZTK/6dQzlaZ8jYIHLC6dnlicvLRWTeYhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRLthY0mbN7BlBpvqkpyMmJ6hXouuevFDhB85pE49XA=;
 b=g2Jcoc7n/5qADJoD73NpTS/CVIma1YGHVxmtcQ//NafB+mfnV0JyZEQq6eoztQY+bvHDT069+WYmjloDA/6IBsyES4aR7pnkXbAJ5e5bCZWdB/RoSmW+TiPjELYeUzNwwTkmnDAHVjQkjmcMCFCBlzaU1dDxmUpNBm5Vf9aze1Q=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS7PR01MB11702.jpnprd01.prod.outlook.com (2603:1096:604:238::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 13:36:34 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%7]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 13:36:34 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mark Brown <broonie@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Pavel Machek <pavel@denx.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] regulator: raa215300: Change rate from 32000->32768
Thread-Topic: [PATCH] regulator: raa215300: Change rate from 32000->32768
Thread-Index: AQHZ0dhIXzO0N097ZkqOsqr7XoBB96/wDb0AgAAAR6A=
Date:   Fri, 18 Aug 2023 13:36:34 +0000
Message-ID: <OS0PR01MB59220E6AD6D97A467C5A695C861BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230818133117.290897-1-biju.das.jz@bp.renesas.com>
 <c26f9be8-4e7d-46e2-ace6-ffa38c7ee131@sirena.org.uk>
In-Reply-To: <c26f9be8-4e7d-46e2-ace6-ffa38c7ee131@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS7PR01MB11702:EE_
x-ms-office365-filtering-correlation-id: 3c138db7-5faf-46a2-7f7d-08db9ff023c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mCDyjuS/1dN8+vYfcE09Nbl6hXoPDCcAOSCU6pPM49h1ApxDlfy+ltXAV2MkeBUPgM3EDxEylKrdzX7lkbFY5Ph3vjMex9wtTT2nrqfyxUnxfknBrA5lpENCeHJxpIovIykIMW42X0BLWAQB13sFFY7Bec125p/Q8g5yJL6oBfFUxP4qTsglETCeD4OjF9FS0Np8byYbyES8BPla5Zh2aEQ3j1L5MmrXJGa/WAD0Thizua3UOSGUdMHVIdmksy+zGsBftQ0iu4BFe6j4xHtEiW6lDVR2sSOZu2x9m9BwWdqS4S2s+49En16CIrHLemRGTPz5gtxY+151IFFTKV7g7RS0agO0TsN8QDC8WZyXWyFnaZ1R/mKqU4Etjh/C/EFYgpxBAvdRX+pBDmtC+A0Kq93YgGCT5sx4Cufm1GYciN4BSfIpT/fZ312dlZ1wDKWqxKyUTqhDQ/ZaqF5Ppe8u8CObUbt51pH50ThkTp4YXl5G61V26LC/yrmBN+j7oYumHHYklij4anQ5ZEwYxzrguf1bvGr9AvIE/R0s6/qxvJ6raHX1ZClVBbvOyBoU3ZKn3GiB91E+R7c6wWj9fHvMJF7J4rAFWJQYqTpZ2RgwMTo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199024)(1800799009)(186009)(26005)(71200400001)(7696005)(9686003)(6506007)(83380400001)(4326008)(5660300002)(8936002)(52536014)(8676002)(2906002)(4744005)(478600001)(41300700001)(76116006)(54906003)(64756008)(316002)(66446008)(66476007)(66556008)(66946007)(6916009)(38070700005)(38100700002)(122000001)(55016003)(33656002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G5WhRSdIgYsGgoo8mbU4Pp/ICn2/aT0mJkh52XCTtoKdkwtkkq+hC64dpv/e?=
 =?us-ascii?Q?2mLvOifw0RgwI8R5ma9YwV4Rwoc5+K8L8WaT/s6YJYKjC5qAXlIZLfnRXjJO?=
 =?us-ascii?Q?8b4MM+GMO1JodSEjRNG/hmqyx3Gix5tIf1o50NlQdb6x6y83AXoQ1DiOVDbo?=
 =?us-ascii?Q?P5jqubQO3uodgNFIsnVdkMSJsRNQRev94vnhm+8734u0o9tlFQ7tRfGFZYyw?=
 =?us-ascii?Q?zs6E1lRYc7Zz22o9feNfS6NJRzys2q6Ttxm4HBr+GGflqyQuoNxgr0EDmzaA?=
 =?us-ascii?Q?ldz3QHq6tpWRpuUwUQlDqqjF0FnRzAWeEpYYLpaJrFRUTm7Y4aHvg+GDa/DW?=
 =?us-ascii?Q?j01eXiqrtE0XPoNCH7m0/yI8llWSdZgNHbwUnLEiCnw12witJWep9A+cEVaW?=
 =?us-ascii?Q?9eNcc2w5e8/o5VcaTlO/Z1jvl2egB9fOgooDv3ypBLaLbxsg2VWlODNjFCsR?=
 =?us-ascii?Q?yBREq01meUCb51uIA2Yp8tRc/e1F9nfI/pMlqiOse8Pgzsgund++4PzckaFd?=
 =?us-ascii?Q?3kik4RfIhp/jdFsWc5vHdTxhaMDbLswsjt+D/YQztL3nYZsYocjieU6ZKOly?=
 =?us-ascii?Q?GKV1i+2/DPW6yjanrhocmcGuM2+Pbf/hMPPYLv8MMEKwcy+YNntniXVDoNSY?=
 =?us-ascii?Q?KKNk5uP7DV14jp5QnsVgABYJKcvtOLxLkoCNntIkye+wb2A2KjHdHFT8dnxR?=
 =?us-ascii?Q?NS8PXqu51BDDZyOegDW25B++ouvnrYYyMOUrYyLdFWaYfr0gbgF5pQkHh8p3?=
 =?us-ascii?Q?8c+98O2coMgmNLydAjDLmHYT1ifiRDDFFpwsaWI3nZ3XMCJ5uten50tAPCUf?=
 =?us-ascii?Q?XiNNRJKeSqG6awTYBqRTaloy0LD1/TAYZ4TftzO0NuGo7YArxBylGCH2OuGh?=
 =?us-ascii?Q?SisNjpxgmAFwC6oRnED/Y4aJizPeyAXpvJ+QSXRWl31veI37z9sgoWmRQG1u?=
 =?us-ascii?Q?hyf3IVjn/FFOp3QHoD6oWxOgj3fXzZHfikoQrQRUxdQxqRS97nn+MMTmnvMF?=
 =?us-ascii?Q?krpD3LUH3h9Vmbq2MS/3LmBWspJtBwXQOED0/b0MVtN6GfCKlVUiT0IXJ986?=
 =?us-ascii?Q?R7lp9Gqb/D/h/BdlWbOcAeUxzf3ZvPpd+kTzWP15YdDgtsIzvPom+1xUQKOF?=
 =?us-ascii?Q?M6uosMSJHLQmcECXrzsbqs0WEbfFrEwofdF7JSd9bKxAzNETXyzCpYdhUL78?=
 =?us-ascii?Q?YArrVCqewqRa79Kp8TT8ZJOnXFaO+uclf4cdlWBLcSzYL5qNpaoQGv1B7ClO?=
 =?us-ascii?Q?7nj3N9vN9MzoiBiOfkCCuSmWJ1lq69toPGIWg/jBWiFOpMSzV6HqXWW9V7qV?=
 =?us-ascii?Q?QYbI9HDamWdTWP7ajI+GwgWrseG7QkkQpGDjoV5GNqReh1/gm7H8XN97lia9?=
 =?us-ascii?Q?ox0Wu1QsfTqw+SVJ7fsPbFGaxNlZclb/kRp5EdYPGTzWyH0XyKLG+DG/LFLF?=
 =?us-ascii?Q?A/z6kq6MfPcqtMouNmGrD+U722Yk9oKcAQlNsnNPaMXa3cJNcD0zMHO5HOL9?=
 =?us-ascii?Q?Usr9l76rgmTH/2TPqLchq8fcujj2PPJdeb+lSEF9RixdZ4a4w6qqpmH8AjRO?=
 =?us-ascii?Q?v9ioo6nR8JqCBv6xtxVh6CrXrWW9NhqQR+e3+uJR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c138db7-5faf-46a2-7f7d-08db9ff023c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 13:36:34.3460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQ5G54E/R9NOEgaCX7kF5I0dH1vU5+om3T64GCbh4HYsMkslydw65LXA3pw38E8urJ4O7+XIVvgUZpprV9AK75F6ILUHOytYQv1QfZC8aww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11702
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

Thanks for the feedback.

> Subject: Re: [PATCH] regulator: raa215300: Change rate from 32000->32768
>=20
> On Fri, Aug 18, 2023 at 02:31:17PM +0100, Biju Das wrote:
> > Replace the rate 32000->32768 in devm_clk_hw_register_fixed_rate() as
> > the 32kHz frequency mentioned in the hardware manual is actually
> 32.768kHz.
> >
> > While at it, add the missing space in the comment block and also add
> > module description to Kconfig.
>=20
> These are clearly unrelated changes, the Kconfig change is not even in th=
e
> same file, and so should be separate patches as per submitting-patches.rs=
t.

OK, will create separate patches for these changes.

Cheers,
Biju
