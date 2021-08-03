Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8F83DEB9C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Aug 2021 13:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235291AbhHCLRF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Aug 2021 07:17:05 -0400
Received: from mail-eopbgr1410137.outbound.protection.outlook.com ([40.107.141.137]:7632
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235254AbhHCLRE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Aug 2021 07:17:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvpvCbVSWIyPQVnPGAEewuB7o9PrzuOky1M0qeso0/v/QTRMGy7Aa7u5ko9VCySVUzipT5hQilub/VVM4Mq0BqCJ7fX5SSPk10zeGBhJKSncFpztuq3PaRWYQbbyTlht7H0QNWsZIZD56Wy7Vw7bZwW4qWXHG4K+34Js7YiTQj3OHJVGDB3rWvyAnmKROtu3WZ9UBjgA/bnc75habYlP14BfMEu4xpHSpi4bsVcilwBW6CUhy21VOnZX/GoUim0RfgdIoTUaXmPDehNIUVybARePxgIJinq/LaNQkaWEKsbyH6O/JwV3xheOq8TFg1rrk4ByXY3EKrnymS3fY+Q74w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2cBtxzdoWs+Ihr3r2YFTipID4peN5QFnCaRpLyC5es=;
 b=MbreePqZYPO2G7jYDWpqIXs75bcQV7X955pTz60JiV6l1SD7UeDFKT/OZXEoidzh2ZtieOB1CnK7xzaE6JAiUH09FWTRozP9QJJisDAx1hzuvaBRiz+xy6q4IChqzJwzAFe9/loNhvwKScv3Lfb0tsuhktB8xVUSrkup0fII0yeNbvsZGUTLj/acZzjBKsGieH30+j0ErU3NZMOjH5p1uuPjlYCaE0GQPzqMr0pSPhPsB3XmqkptQURzEtIShxbifbSpkjgpys7Cya/vJ3KuFuuY9gV7WG+VIjx9aqJY4wDKmVXzJBP1aOdqd/fOOi/UklmNU4mVGmXl4JVuTIhvTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2cBtxzdoWs+Ihr3r2YFTipID4peN5QFnCaRpLyC5es=;
 b=rKZDFgCH06YTJU54p1zgub9SCTcZavMv3Y8fDFm7T6PhznfdPs7KlXQ4HiAsLGzaT1O0RszDN7fHkjz68NIJm052xWSCtN2gVZNWML2M0aFdM/wSUO8St0/XwTfqcueCc+WPg/LsKweZXig5K5Fc9sNnCW8cn/CKz3Uww3bBOng=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5340.jpnprd01.prod.outlook.com (2603:1096:404:803b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Tue, 3 Aug
 2021 11:16:52 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6%3]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 11:16:52 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Ulrich Hecht <uli+renesas@fpond.eu>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
Subject: RE: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Thread-Topic: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Thread-Index: AQHXSNlLLnK0MeXzxECYWiEeEguOWqtcHUuAgAQPPJCAAHyHgIABdepw
Date:   Tue, 3 Aug 2021 11:16:52 +0000
Message-ID: <TY2PR01MB36929B0FD0562E6FE210BB6CD8F09@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210514155318.16812-1-uli+renesas@fpond.eu>
 <YQQah2Q8qmQPEl7F@ninjato>
 <TY2PR01MB3692486033934E1C007EBF6AD8EF9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <YQfqwyL4TGoFHisp@kunai>
In-Reply-To: <YQfqwyL4TGoFHisp@kunai>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11b3fb78-475d-4ef8-8c10-08d9567031e6
x-ms-traffictypediagnostic: TYAPR01MB5340:
x-microsoft-antispam-prvs: <TYAPR01MB53401FB5D332653B5E31DB1BD8F09@TYAPR01MB5340.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i49goUNKXJU8EMIIsQ6nkXm6rkfcKD6+q7uDNcrbDdXIrD+PMBcbPqAPibVHEVOCSz2Tzal2AXW/M9OvbTHwAnbMqhs6CPU6VQg+yGrY5O0CjGor7QDfMuS1Ipon07oTv/lHzcOAOYlBnFB8zS4099dBFlhLri3keSdO/jsfKgDSdboZgBCNTCie6XQxj4LT40OHhsfh/xCYN4OG+OblPQQTz5tvOB46yAXBPcJZQ2Hy8Muo2rz8A9rPKh5sotBbiUPVmp10gExBtl0+XByzNPX/esORSgviJqfbzHJoG4YTzpc+nfaLP+dspr6NKIVrHUb/WGPbNKe/G+gsVDiDBfnaYTKRgeOdmlXsos84RTd++2jWn1Sk9b182Xn0Ky+kkDZUD/8nbQs4Qyhf8MtFhHCIB//xQ4ai/o/hHtZj0nlTARYy5Ov3ADW8bl9mb02H6GXl9osTe5+vX3DeSzHLlHEBCXpyidgGeMf7eSMN48Z8AvYDojvjbXJyfSVxl1ci1Yq2K7gePbH/prpTf7c2n5RjdpFMwfltGXyhkJXpJvnF2G4lqMH24wYxfvA9h6r1hg1ELSZ12nauORBPP3hxZbxNUWK31+q/Q3/fBsl5VGE64H4LhPBKm87gBhXhsZ3fo3hNiQCwitgktn+GXL2tngd6p1TaBUWdbLiP48JjUE+GJybsMae0fKEJYZbsx/xNq5bglwKnMga9ufU2kr/A0Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(6916009)(186003)(15650500001)(478600001)(5660300002)(9686003)(55016002)(71200400001)(52536014)(316002)(7696005)(86362001)(33656002)(64756008)(66556008)(4326008)(2906002)(6506007)(122000001)(83380400001)(54906003)(4744005)(8676002)(66946007)(38070700005)(8936002)(76116006)(38100700002)(66446008)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XTEcU84Ya1L5vgmbG/Qa5PXpIlwx32wrnw26csqbvo85kwwnF3dwcpGuW7Y8?=
 =?us-ascii?Q?yAsOtEBwqWEWuzLsal8BveJLBDGMrfiz68WWLPDExW2zh2kqf7sbkDqoKqcq?=
 =?us-ascii?Q?s4emwXu4TYO2rRZgyVMiqd8DxOFMnvlgcwNpVgVDj0HioqbrMreXiD7MCcPH?=
 =?us-ascii?Q?WiVacnrpJNMEmw8vJzbZ1tXX3QXtUtHw7lSRB3BpVAeOBDacqMX79YBSmEZ6?=
 =?us-ascii?Q?rVn7TLIEp+ePjRnju1saY0MFHh8wfgumyyKBtVSS4XFtKto4m6Rw7IrurqsD?=
 =?us-ascii?Q?HamXwoe0ukbxCRvGyEYEtl2D4zwNWOahOPyOgMZHSHKVaIbgX7IWP6huyBjz?=
 =?us-ascii?Q?7TNxrWqaw0f5RBBG90K9E9J38rabkxI77Avy7yercVo1hj9CIQxfzYk/+Kgk?=
 =?us-ascii?Q?NKlT7EwOPCSvQCxPxKxP3UMzTrviv645eJh625lO8kfKoJN0tb4jLUYBVs3q?=
 =?us-ascii?Q?RYOUTzGUGGDJvAkSEVChTfodr3oI0RNue8byrJjjsqekeAHCB1qX3GcR8ehF?=
 =?us-ascii?Q?UlnawH4wRxsvt8uU89NTr+TXZXCTt+n9eSkzITwEES8i6IX3H0PwTqQPbbC9?=
 =?us-ascii?Q?iFuSGDFlxUrGQS9UKzhMyD8WYa3rM9l0O/lEWFzI2N0BcpC0sARcme+G3uSG?=
 =?us-ascii?Q?XOGUUaRYDQbH60Omvs4j3eHpNBARSqrJNWqMT8ovnLIIqI+XG4H9r3XMfByP?=
 =?us-ascii?Q?XoLjcjA9HSNdMJ94YszGQCewj3geiH8PJv+mIrrzWrkitdCcQ8P7NGq06dxf?=
 =?us-ascii?Q?rkMnPb9A/LE75FLtBGWyHgoKjMimCgNqQaMZfFNrG13fWfKw5S9UEJd0iON+?=
 =?us-ascii?Q?JtzV5TGjTq7/FobQpQcl9v1Tr+qMQE1oVM7bFJFM4ryETJ3TDPFmynK3vJ3L?=
 =?us-ascii?Q?bximwAUgIYXVUZqTsfsda2kk7Ibee8R4J/JcIN3Vf4BCsvt28BWkBuLcJkw+?=
 =?us-ascii?Q?CRlO86mR0sDEjNtEQ27BkCfItlT4p5YKADJGOjnp2T3y4nTjiUgjCGzUOLyi?=
 =?us-ascii?Q?jlfE/RVKVFerlL81R7dkCSHt+d98qGH1BFqZRqjOcmhLB9Hdg1zFeIv7xCkG?=
 =?us-ascii?Q?IS4IZhR1z12l3FuMNoY24SejpA3U2pnb349ODrBnuJoKxTphTqatH0fjFWFE?=
 =?us-ascii?Q?9eNvxxIK3xehGJF1aFap6emW0awt7fVZ9bqIZsDfLWGueuZFj3rGmsAN0QdM?=
 =?us-ascii?Q?vGLceGG9uMOziUclqXgXFRc7zRvYbBWOCmPXYY/HZSpEES7l/MtgTveiYKEz?=
 =?us-ascii?Q?LTHaYbReVts8QRo2TX2BisnbaYhRepFx6nB41c9LIZYs/DcLlePyuPzRqsgM?=
 =?us-ascii?Q?EHl/I1uy85zyAiQUMdNgs0f0PU/Q/IYS5TUdbu2jwXbDbJbhTa21DMScRJRF?=
 =?us-ascii?Q?WHQTZac=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b3fb78-475d-4ef8-8c10-08d9567031e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2021 11:16:52.1665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DzwjicmZ8KXqY/wBqz7aeYI/nI+ZHfMjDewzK7u8SKAqAQi7HQdysNPWK44QVhTuo7DyTDg3m+7tO1ATnfqcH0XQC1oAzq9ffJ1bm4o4LGlbiVulGcTpb2Es29luo9eA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5340
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Monday, August 2, 2021 9:53 PM
>=20
> > Would you know how to measure the latencies?
>=20
> I didn't measure the latencies itself. I just checked 'clk_summary' in
> debugfs and verified that finally clocks are disabled by RPM. Because
> only with this patch, clk_enable-cnt goes to zero when SD card is
> removed or eMMC has no activity.

Thank you for your comment! Now I understood :)
So, I'll test this patch with my test environment tomorrow.

Best regards,
Yoshihiro Shimoda

