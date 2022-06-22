Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 125F75546A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jun 2022 14:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352307AbiFVIbT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Jun 2022 04:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356083AbiFVI3M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Jun 2022 04:29:12 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A81C18E04;
        Wed, 22 Jun 2022 01:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doYvPxP35bUAfn08A69Wm3QDZCqjdjKhbVj695q0/6A9OhaACJGsa4PvkjC6ZsOCrOCylOCCQlcbd6ur5m9/guRYOkJpBQjqvUkrLOi+ER/EY+m7DtDWldPltp3AGhCmUaI+Y00Al4BSAY/0fYYVb440I3rkPmApz1BoryJwwKg+x7NZwKrCs4dIkmszE10GyLehfby1FNcHu4+9JfgmbWsQVNSkEDUzhrx7Cz+HBOXkD3At/jFwUzS3hi53LGIKORqf7qnZK/GaQLPxzfgiBoULMg5hXdZg+qnPPR+30kO1eJaftDyYW4Xvsqo6jeqI/JDNkH1NpGxNfqFSYfhTNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YpP0iVxQeQ8KJscYTum/awZ562z4PsBHrxsCYfD2qU=;
 b=ToNJtOTe8J8Qj9rPJGacZ6fOZ6QhbH2CIyMrh5Z8Wd4jCckvyeSomf6cD60xReHtu6iOIMaAKw8f73L9SrnVccEzpREfINajLVlkbI5eRa6xtrLSiwl7S0mi+0WlPePc8x6KrNWAE3onlnAWF3xowHjDfbdol84hE1950tVnhwh8/5qQsBoCJ6tTIStoD6IrX77Kl856/DAFU+mIVjG/kuE5Ngr+MlAYikbIB1uCg2nu+0N+ibtO6lm1J3jFU+HzltSSu19oAJ/lzVSEWT8e2pcAeOW6GuZW4hHIraJrj+fgTDGOfRaOuq/J0sbzVT+gU/3KnVe+NINMLTT1TOUJ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YpP0iVxQeQ8KJscYTum/awZ562z4PsBHrxsCYfD2qU=;
 b=c8MkkpLp/kbEMwefgrUZjlA5BTqt3qjwfpfmtyfzSENS3C1jx0LNd+BiTYnfMXQoCYr4M3zr5SqsSxdZP8yDZrKitI6aIiyjC2OpNU8ydKfkpgC1VC7SERdIHCyJCZWeBTIdYhrus226eOChsyRPDXkBEY6YSJveXoCMoXx3T0o=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY2PR01MB3530.jpnprd01.prod.outlook.com
 (2603:1096:404:d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Wed, 22 Jun
 2022 08:28:15 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::b596:754d:e595:bb2d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::b596:754d:e595:bb2d%6]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 08:28:15 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "avri.altman@wdc.com" <avri.altman@wdc.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH v6 7/7] arm64: dts: renesas: r8a779f0: spider-cpu: Enable
 UFS device
Thread-Topic: [PATCH v6 7/7] arm64: dts: renesas: r8a779f0: spider-cpu: Enable
 UFS device
Thread-Index: AQHYdznckS35sw456UqSktO9CRPXkq1aFKAAgAEaEwCAAAVhAIAAAMgQ
Date:   Wed, 22 Jun 2022 08:28:15 +0000
Message-ID: <TYBPR01MB534184EC1676F7799C97D5B0D8B29@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
 <20220603110524.1997825-8-yoshihiro.shimoda.uh@renesas.com>
 <YrHgOptQ56woMAeO@shikoro>
 <TYBPR01MB53410E99F2A9D783FAFD42DBD8B29@TYBPR01MB5341.jpnprd01.prod.outlook.com>
 <YrLRXMSZvTdLNkDQ@shikoro>
In-Reply-To: <YrLRXMSZvTdLNkDQ@shikoro>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff8c2926-91eb-41ec-08fa-08da54292726
x-ms-traffictypediagnostic: TY2PR01MB3530:EE_
x-microsoft-antispam-prvs: <TY2PR01MB353098EC94CD1515FD1C835ED8B29@TY2PR01MB3530.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YdBr44SczG5aVXnjAr10meRZjFjw1lb2qiGFv+6QY+QB7nExsqpJuODeTM833PvgZvDazhIWm8G23gzGdskpnNm+vXMEPSlGc517pcfqUDAxx+pJCfI1ud3elA/QOcH/C9/YyF9JHfD1E5gd0RKxIeisC+Ppy7Mg49fkxWbWnKI6wwkegHvLXd/zw0jcJwohV3hwSAMtP4fD0cP7J4CxIi0LYWK9r2X+QfVhKb2GVbcr0ByUnfLK5bf4Te4etlZdfCNEgiMikxh4WbMbFX2SCH6sqxXScepIYu+UxuLZVBtluen6RpBzTWnTOvmPcCXDmZvTvf4kajBAtq9iGJnZ1BiqZl1pWrcNrDeMkKemZENhyVfWgyBNUOGHnbwTA5u8PB2saGMURKrFLfK6I1igjKRuqD+leW/JUsbgtLy1yMagXOxkzpRxENn2EXMyJwC89bzrf1WdghArggOyO41UAyJcW8CGVGVCaAHiMPXVXtIa9TEn7JhJUlLph8iiN+alU5K4xB128wg6lDo/VVsiXCyHmUoUr9JlNps+ost2u8ESJlyuqcWEVeZ6JG9RDdeOcTpwvX7wZSSjcnSKvWY8+Ay6JwnEr9FfVBwsO0B73ikPkGvuENamtaD0unAzCS4rGKeAbUJQfv7vvDV0xKt7O+iqPgr8A2xl7OI/SV0KZcf8TH3Xa/aL94Mg8QG2BvfxuNGforJjgJityE0LuCQKvMPtppR483pY22OUu23s79EfHahTP7OeRyBu6H4+azg0PxYPY4vSI0/oVU3GkZTp9g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(83380400001)(41300700001)(2906002)(186003)(86362001)(38070700005)(122000001)(33656002)(71200400001)(8676002)(38100700002)(5660300002)(478600001)(52536014)(6916009)(6506007)(4326008)(4744005)(54906003)(316002)(66946007)(66476007)(8936002)(7416002)(66446008)(66556008)(76116006)(64756008)(55016003)(9686003)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZmwTNslJLlq0ns8dfTLgZ9V3tPzon/YUOMyJGpnZCsL8a2RKjU1FPikoswo5?=
 =?us-ascii?Q?3e/lyuUd0g6J1V37YaJ90dcfBSZ6eRJ4CFhlmMnAEmo4ZFDKFEH7U+1tm/Mw?=
 =?us-ascii?Q?BAU88KesKvhhFsvqeCP11mSjzprAQlANpvuHM2Ya5ZXIZOKuolQUTc4TaTjp?=
 =?us-ascii?Q?FSU6BGKt15AkzZmCPBHqYPzh/dDJ3DFh/lRnzyDV1gSI+hllgz5nbF8eYe2w?=
 =?us-ascii?Q?DpXLweqOKbFpDRmKad0WcW1XlP1Gc7XxEFRgCCTpsU4cjj34pSrczqxT2Lbk?=
 =?us-ascii?Q?VffBH53UPYNvSVXc8dhZy8qknG3bjk1ZlEqtyMifgyQYv4wvxVl4xWOMaUTO?=
 =?us-ascii?Q?QvmjjNfRI9vz8vGwFbewxKwNxx/2xUnIdyKhvzWiXK12RhZFkRW4GMWyStW8?=
 =?us-ascii?Q?oPef7bobevxSzoHpNTFi7AdiqXfpvnZ5ZXEZ9AokoYUwQo/GRJ9jNP+KLQCk?=
 =?us-ascii?Q?YvvUHLLT9tKJSKHJ637haOZcRS14+0YlsLlJIYog82bsGyp8m1Gxx+mgLW+Q?=
 =?us-ascii?Q?5baQhblI87m2P7EDPqrTQjoscGCKoYuFimfydt+xHn36wLzzEfW1cID/utNW?=
 =?us-ascii?Q?s1nKKMgme3yCXGbAj4ctOnvDdmwOof1PVO5Kgn7C1BryRDORQUU0Y6laoqOA?=
 =?us-ascii?Q?7H/aw8I9Ro6MtkXvx7LUI6PGc3jR+javhzv8mhs+2BLr6N7J8LGKOfx2LrLR?=
 =?us-ascii?Q?A6RDKFPjLVqWpVZKLpebXQE2zVWS+8ZOSvMl3zl4iQl06IJi6xd4+UlGF6Eu?=
 =?us-ascii?Q?cYmNIFVKQOHBb/V1KuO1ldCADqAi5Xi1jXm3aUtFuPLaVJa1PYI/wP0HbYLG?=
 =?us-ascii?Q?Pq4BdBBZsP2522b2GHUYjYBNPJUQkthu3mYyhje7eZDnrxlejVFSwu/UtL0p?=
 =?us-ascii?Q?Pv45ATHGw3/N1i/oaQb1dM1MiiP7aUP6eEvugk8cXmr54cBaVdVo+rGmegi6?=
 =?us-ascii?Q?reZQOtZBDLTLPVe7U5EpS1WolFRsWC2yvpKPGf+1Am7g8w8+FBgb5IqjtQ+D?=
 =?us-ascii?Q?fBm61puU3g1erSjdeCYSSZNg4OVMSdeKLtAatTN9qZLwt76jbB182b5dTE7Z?=
 =?us-ascii?Q?Uu+UpH4b0C0d+fr6+6w0fpz+9nkuHMKq8REsgCbscWdZt0YHtiWbvrVdn+SE?=
 =?us-ascii?Q?7gl9qeqNV6s+WaVETntTT4SBkPGtqIsR6FCx9OXhHP5o7M+za2BzWVrRiSk6?=
 =?us-ascii?Q?xqvjgSJLfsNJssqg9zlBavzoPNz1tW9YlQc05LVJ1eWfqUXFhh+w0h0RzICg?=
 =?us-ascii?Q?Rdthfcf4e7kd/LhT3Oa1HyQ6R4ti1EyvLzw6y1cxQ6Vu2Mqj2rCdSo3dbWEs?=
 =?us-ascii?Q?lidOPEhkKIWg2MC3LTmRZrLNxIzuE+ooZMw5xM2AUiRVLICu113zyqTSvw5y?=
 =?us-ascii?Q?xlLCvfiqBvjVaHYbCu9NDpO44jrGx+F8OljMLich04o5fYb9uAjeM7E40Jph?=
 =?us-ascii?Q?QwiJRWNNk1I5H/Dmb2R32hDU3cPBmUVmJYT97g9cmfhDKuD5/q2wNFy5FNHB?=
 =?us-ascii?Q?j5zNpUAdPjBSl/A3N77L6pn/58iiO3TeZy+TFn1hP+r5U3xiEuLA7TsDeLyf?=
 =?us-ascii?Q?3klaRABBoq85h28/Xy57Jx3HryKT5tgPUGn3SCTLt9CjE5g+tzQIIeWmMbde?=
 =?us-ascii?Q?p9qopflpwEhoGDOiXadPJI+TaZ9YCFyUkIM8W6W5fY/opYbRR6y15ugwh/xk?=
 =?us-ascii?Q?8H4rDkI9MlSP2Dv9KWhoKj0oR6ndH7RlS/p645QUhNGFEZ66z1xBl/IWCaE5?=
 =?us-ascii?Q?SUIGfRO3gyC/R31YaH+/iMaQxekD1iTN1/F5XFGIK5n0Zdm4Umf0azRuOvnk?=
x-ms-exchange-antispam-messagedata-1: PoS6ZN+WFJpbqV6He4BZ1t44zDguQAcXRVQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8c2926-91eb-41ec-08fa-08da54292726
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 08:28:15.3386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tt+Cw34C5eYTWYD0IlkTCK1Oof4WmEaXtNfWQSZLAwoI3IIaHanyD+dA5vDSEw4ROiXQ0gZtrI1Xdw36wBLfmHxaodkVeyTLdUn5ZOTavKarRD2wpo2OgDGRitXnnXoO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3530
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Wednesday, June 22, 2022 5:23 PM
>=20
> Hi Shimoda-san,
>=20
> > Hmm, my environment [1] could not reproduce this error messages.
>=20
> Interesting. I will add some debug output to provide more information.

Thanks!

> > based on renesas-drivers-2022-05-24-v5.18 which I made the patches.
> > Perhaps, should I test on the latest kernel?
> > Which kernel version did you test?
>=20
> renesas-drivers-2022-06-07-v5.19-rc1 with my Thermal, HSCIF, and your
> UFS patches on top. I pushed it here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/s4/uf=
s-experimental

Thank you for sharing your branch. I'll check this tomorrow.

> I'll be back soon,

I'm afraid, but I'll be out-of-office today after I sent this email.
So, no rush is needed :)

Best regards,
Yoshihiro Shimoda

>    Wolfram

