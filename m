Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C363C7B9939
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Oct 2023 02:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233943AbjJEAZo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Oct 2023 20:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233891AbjJEAZn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2023 20:25:43 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707A7C1;
        Wed,  4 Oct 2023 17:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJKrvi0Bt3NNIrhScY8U8aKCJJrkDxUiGmVtV034f8ts0XNgLaK7wVpDVhqRndmd25DuaivDscuGWF9QIXoD0App2tC106eAdrRC6PiqnQYjhE0Uc6XOLKyze0xTJEEDhztpnn6UfRBFeaq+j+ZNFOhRutyzP3/JGeTuMgUDqRup38VNMIeAG6R21yuAoi0O4IjiWLyBDx9c/uU1aoemkUfDiGyYYEOxDWctV9cncMEfbLU/20CO5b8n6cjMdPWsIJVHajuxNDKo2WWepdNm1FlXQ/unDAfXqUPqhniAPI2aCsmUmFmA9ePK/i97+GXZ0dX2odrDhYA/BeJphCBPEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1BJ5pHTsO7fMJwEHaNCQzy39XAxgGUeU4In1Q8bKqs=;
 b=j5NEnBdI7aL4ILvCX1/G45jMuxRrZMvzedumVJFwR1WuhsRwewsKEOSS6wxZBT7Zeay8rqLjku1L19WkTqi5QLJahNOPaTqYZ8tSciqqqJqKGs1TObxI5MajO/+r5tiTGJtup0BhcZuUMl2L1qbIyG/axJ6ReJ0yUp6pUrEN9v1VoVI4U6QlwCQVMXQPGqOYtEiwwor8i7b1wMgpLNyoruLjXWtCu17GJ8IGp6X5PIY42jvd4yHZyrnhvROgQIl7ogwabEEuwRl3RhZZ5U61A49LpCmlRSgM4LEe27974jCSjxxocE1ZfbNkzlUKxa+1KPJ/13gCfXzLhtYipwIMWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1BJ5pHTsO7fMJwEHaNCQzy39XAxgGUeU4In1Q8bKqs=;
 b=buhyMZml/JRU5ZL5OauJV0JHBVBJ5ROBexoP+I24bRUP8zGMFgzGSfSNR4VOq3YINoEs7V+SZjV2LAoFVIm/N/vJBB1hX4JrG+KglwFfSiCx/xuqU/Hb7uugzArMpUZBpG+GlrYPC84JEy87xV7RQ9BWksdrIz0bpzGjoj7xyzI=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB8795.jpnprd01.prod.outlook.com
 (2603:1096:604:152::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Thu, 5 Oct
 2023 00:25:31 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 00:25:31 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Zheng Wang <zyytlz.wz@163.com>
Subject: RE: [PATCH net 2/2] ravb: Fix use-after-free issue in ravb_remove and
 ravb_tx_timeout_work
Thread-Topic: [PATCH net 2/2] ravb: Fix use-after-free issue in ravb_remove
 and ravb_tx_timeout_work
Thread-Index: AQHZ9qL+dgN48G3/gUuzg752/47Pb7A59EeAgABdiVA=
Date:   Thu, 5 Oct 2023 00:25:31 +0000
Message-ID: <TYBPR01MB53413AFB71E2C0C11D0434F1D8CAA@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231004091253.4194205-1-yoshihiro.shimoda.uh@renesas.com>
 <20231004091253.4194205-3-yoshihiro.shimoda.uh@renesas.com>
 <f4cf24ff-2576-6031-e482-ebd8fa1d9659@omp.ru>
In-Reply-To: <f4cf24ff-2576-6031-e482-ebd8fa1d9659@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS3PR01MB8795:EE_
x-ms-office365-filtering-correlation-id: 2db8ce5f-5c0c-4c82-67f5-08dbc539956c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: urwBdf/9tvThEcyp4pzhWRXsyuC+uSVGAVPC+wWpSldabMb8rNKD0qnA1CK0EvitOaPcaP9Nx4tNQIhUaAusmQ6CfDYoGtDvo25ifbNjOgA91HCjhU4/b1b0eqs34qZcNn7JUW2sYu6JfLGPDw+9I+dKE95AchN1XXYcVbBTtHLU+Z9K85WZ2TgxuwZK5YhoVYfuVOpM7w6xqIC4dtTSxP86CNRGpqp/wqTuPD1YpKgzIKErJqhBkyEsYQT8OFGURkm4OzFqkph7W6+vqwGeHpjdmmeKCAOTWTNTl6f2DQJ6aHAZzZ4zhCsv6CzexBmSfoLYxvwekvCwVw8c56No1Uyi/zQRFRPN0dD3hWvhPdWMe/KR+iBibYeTELyzdnHPpTsylAGrKo9B+2S9+VU6rvSkb+RX7NGVz8d4adx5OvI9AFlwJj6v05L0C51NF5ridW1WkxBMQ1NS+pBDHSdSqT51DLYH0EG8vEP9LbMXmLeH5jlo2h7JHOpkP1uryZFRLDOLdrPTWXZjp5yG79OM2hqnqMIFglPjA6/w0IPCht4R4CgbRL2oH8MpEFcLa/wLqfl+g1CddxPFyDraW3x4wv/R8Rnf1gMz/bBjSw/v15wm1v7HGbs45sGvZw59R/XL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(346002)(136003)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6506007)(7696005)(53546011)(71200400001)(478600001)(9686003)(2906002)(41300700001)(316002)(54906003)(110136005)(66946007)(76116006)(66446008)(66476007)(66556008)(5660300002)(8936002)(52536014)(4326008)(8676002)(64756008)(33656002)(86362001)(122000001)(38100700002)(38070700005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bhLh3O7NC371xdzFmAoH4aW5hd8LC4DKCNBrVLcDPSuPl8IYs2K+Zc5LC96P?=
 =?us-ascii?Q?f3pHltgeKvnODSyiN49rWsltPQ7Co6TGTkAgexcEXYjntyH+cHV7wnE7mGPg?=
 =?us-ascii?Q?Y6q84TUPR4xA+naLSLZhjAkQZme1jIKTY2T3GQQXRLtFUk0NwMrATWi5xXl+?=
 =?us-ascii?Q?SB3VY204BxuRF3DneVrLQl7PdiUrO1aniy3oGjglH++BDSDFQ+IN0UzFgpLk?=
 =?us-ascii?Q?uGwi0FOM6IAEr4ocoos45axXZUwf/dobWZh+vMHHxbA3CnoTCtzkviy7L3ED?=
 =?us-ascii?Q?cYzs8TBhw23olAK5hJfI8qEebHAZ1RCf04gnuEPnSrfLSRqByc0eg/CRbAUx?=
 =?us-ascii?Q?K8s1HDLJ4BIyI88D645URf0MnkHrLD6wy0IQ9WHwZK6+KltiuIvc69eTCW4C?=
 =?us-ascii?Q?QRFtipMO6wpfl/nTsxU07BYxXcFZrqEOYwJxRHpjrQUwDLibEdfcfCvrnkdA?=
 =?us-ascii?Q?1xuZtxj3i7hrsHoooUx63gcSK0YJRpz9LiH98cWDLMTETJBy2CrnQznItq7W?=
 =?us-ascii?Q?pRS8nRJhxEoTK8ob0r1vkfMgU4kkXNCwV6sZ9P1v7CPRpwnGPylHcKBpBwcA?=
 =?us-ascii?Q?wN/wt4Y8DV0IvqV3509NzxBHKxKwqbNHYfLrXsTDZNzJYYhSrK4SOx5lyOKJ?=
 =?us-ascii?Q?5z2cxNGfZlgWAUeobOSc1FME6CRBYuly+HxEWXyoQ1JgsJkcq0CvN6KWf9Qr?=
 =?us-ascii?Q?Stge2bHy3e4ZyOSdtUxWglsxcSgyOMRegkJnrQ4sxIvWrE/qM+o71iH5XCD/?=
 =?us-ascii?Q?JvjS9yl4EowNabsMt9jey/EXY/iJTHwBlXSUtrxrVdqqdROR3BuYdUc0KOyy?=
 =?us-ascii?Q?umEOieu7fW+IsTwPeRmlO8iL+BKBFa8MpnA9wu63uUjI8s28eNyZdeuLnoYV?=
 =?us-ascii?Q?sN47EXxob9aqHN/9v+pxvJ3AQamN9ZwRrLBQr6tsyxlwU2skgvE5WCNqrecw?=
 =?us-ascii?Q?Fg93NTUrC21FBD8wOmzTKMmlCybB+zQ6VWh896jcUi4bbGL/E9Pw/y76V1PD?=
 =?us-ascii?Q?nsb7J4XuuwV2yLQ5TJgK6LUaxXILG96aESiSRHJbDQabFpjCZ2SMJv7TBW1g?=
 =?us-ascii?Q?fYaHmx2NBovaB/3oMI/RwHG6ZCCQJ2KgInhChpr+iHs5rziMN5tbh7B6sMox?=
 =?us-ascii?Q?qt86oxN2asvl7D+PktHg2uVDvNkuFVqSZt7lLWuLBcqcplmGQ3X/Tc8t4Wse?=
 =?us-ascii?Q?Y9EvptDYTIE6bNTWZK4YznEz9MfIf840s7F34HCGgCkKCvZ3oL2mPq3Zy/CQ?=
 =?us-ascii?Q?pikE9/77kmUfJq9RDQ9yXGoPgtw19l42BS03UgKYIsPXsnfdIOHUJ5WChetS?=
 =?us-ascii?Q?/MEH9Gjef9PWQnkQJWjAYuOdPlMBAIeOYQVacoGSvkAYghs7ZjTdhgGLjWxZ?=
 =?us-ascii?Q?2Y78pPhsJ/FeDrtkmFDiX5P7oK+iBZJNFDXUOvL3BUe7mivJ2i3+ovYSvgO1?=
 =?us-ascii?Q?c6paBOpEXMai+flXSaT6Hp82G1HOuG5GX3N1rS+OOf3Pxg5/xxfQ8QEE1Plc?=
 =?us-ascii?Q?X5pymo+PBdey+1qyedarth6kWhIp5YThgBlm4Yr+2yYgqBpgXN8skfMlFYxo?=
 =?us-ascii?Q?V1BUsstGsHOG4K/1DjpfFYW8IKtaXi5X9iU7sLbHMImuM50Z1Q3oIR13XxEK?=
 =?us-ascii?Q?fe0xXKYWNEFyZE+bIiqavZVu+IxMHuQaOOnQQ7uc23OzcrnXV44E+8AwaROP?=
 =?us-ascii?Q?9jt9tQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db8ce5f-5c0c-4c82-67f5-08dbc539956c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 00:25:31.3412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eU6N/GaS9KfECC+I6QoDblYmdv9/H+jqWB2+zZO0Dl7XW1FoEMx7WRcrRwJRMFMfExvR/3ymNoKgdRNDwVAcYKHanGcNYQaFAdNdSzfhS7o4wBzSGSJaL1Xzn4USDJqN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8795
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Sergey,

> From: Sergey Shtylyov, Sent: Thursday, October 5, 2023 3:30 AM
>=20
> Hello!
>=20
>    Hm, concerning the subject: don't we actually have use-after-free in r=
avb_tx_timeout()
> only?

IIUC, the issue causes ravb_remove(), and is in ravb_tx_timeout_work().

> Also, you place () after the function names in patch #1 but not in this p=
atch, why?

I thought that the subject was long so that remove the ()...

So, I'll fix the subject as the follow:

ravb: Fix use-after-free issue in ravb_tx_timeout_work()

> On 10/4/23 12:12 PM, Yoshihiro Shimoda wrote:
>=20
> > The ravb_stop() should call cancel_work_sync(). Otherwise,
> > ravb_tx_timeout_work() is possible to use the freed priv after
> > ravb_remove() was called like below:
> >
> > CPU0			CPU1
> > 			ravb_tx_timeout()
> > ravb_remove()
> > unregister_netdev()
> > free_netdev(ndev)
> > // free priv
> > 			ravb_tx_timeout_work()
> > 			// use priv
> >
> > unregister_netdev() will call .ndo_stop() so that ravb_stop() is
> > called. And, after phy_stop() was called, netif_carrier_off()
>=20
>    s/was/is/?

I'll fix it.

> > is also called. So that .ndo_tx_timeout() will be not called
>=20
>    Will not be...

Oops. I'll fix it.

> > after phy_stop().
> >
> > Link:
<snip URL>
> > Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> > Reported-by: Zheng Wang <zyytlz.wz@163.com>
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
>    Otherwise:
>=20
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Thank you for your review!

Best regards,
Yoshihiro Shimoda

> [...]
>=20
> MBR, Sergey
